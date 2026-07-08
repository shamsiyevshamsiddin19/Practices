import sys
from pathlib import Path

# Ensure this folder is importable so we can import `database` directly
sys.path.insert(0, str(Path(__file__).parent))
import database


def seed_sample():
    database.init_db()
    if not database.list_todos():
        database.add_todo("Sample todo: learn SQL")
        database.add_todo("Sample todo: write code")


if __name__ == "__main__":
    try:
        seed_sample()
        print("Seeded sample todos.")
        for tid, title, status in database.list_todos():
            print(f"{tid}. [{status}] {title}")
    except Exception as e:
        print("Error seeding sample todos:", e)
