import psycopg2
from psycopg2 import sql
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

# PostgreSQL credentials — update if your DB uses different values
credentials = {
    "host": "localhost",
    "dbname": "todo-bot",
    "user": "postgres",
    "password": "2501",
}


def get_conn():
    return psycopg2.connect(**credentials)


def ensure_database():
    """Ensure the configured database exists. If it does not, attempt to create it by
    connecting to the default `postgres` database and issuing CREATE DATABASE.
    This may fail if the user does not have privilege to create databases.
    """
    try:
        # quick connect to see if DB exists
        conn = psycopg2.connect(**credentials)
        conn.close()
        return
    except psycopg2.OperationalError as e:
        msg = str(e)
        if "does not exist" not in msg:
            # some other connectivity error — re-raise
            raise

    # Try to create the database using the default 'postgres' database
    admin = credentials.copy()
    admin["dbname"] = "postgres"
    try:
        conn = psycopg2.connect(**admin)
        try:
            conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
            cur = conn.cursor()
            cur.execute(
                "SELECT 1 FROM pg_database WHERE datname = %s",
                (credentials["dbname"],),
            )
            if not cur.fetchone():
                cur.execute(
                    sql.SQL("CREATE DATABASE {};").format(
                        sql.Identifier(credentials["dbname"])
                    )
                )
        finally:
            conn.close()
    except Exception:
        # Re-raise so caller can show a helpful error
        raise


def init_db():
    # ensure database exists before creating tables
    ensure_database()

    with get_conn() as conn:
        with conn.cursor() as cur:
            cur.execute(
                """
                CREATE TABLE IF NOT EXISTS tasks (
                    id SERIAL PRIMARY KEY,
                    title TEXT NOT NULL,
                    status TEXT NOT NULL DEFAULT 'not-started'
                )
                """
            )
        conn.commit()


def add_todo(title: str, status: str = "not-started") -> int:
    with get_conn() as conn:
        with conn.cursor() as cur:
            cur.execute(
                "INSERT INTO tasks (title, status) VALUES (%s, %s) RETURNING id",
                (title.strip(), status),
            )
            tid = cur.fetchone()[0]
        conn.commit()
    return tid


def list_todos():
    with get_conn() as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT id, title, status FROM tasks ORDER BY id")
            return cur.fetchall()
