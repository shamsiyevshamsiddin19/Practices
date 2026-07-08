import sys
from pathlib import Path

# Ensure local folder is on import path so imports work when running from workspace root
sys.path.insert(0, str(Path(__file__).parent))
import database


def print_todos(todos):
    if not todos:
        print("No todos found.")
        return
    for tid, title, status in todos:
        print(f"{tid}. [{status}] {title}")


def repl():
    database.init_db()
    print("Todo bot — type /list to show todos, add <title> to add, quit to exit")
    while True:
        try:
            cmd = input("> ").strip()
        except (EOFError, KeyboardInterrupt):
            print()
            break

        if not cmd:
            continue
        if cmd.lower() in ("/list", "list"):
            todos = database.list_todos()
            print_todos(todos)
            continue
        if cmd.startswith("add ") or cmd.startswith("/add "):
            parts = cmd.split(" ", 1)
            if len(parts) == 2 and parts[1].strip():
                tid = database.add_todo(parts[1].strip())
                print(f"Added todo #{tid}")
            else:
                print("Usage: add <title>")
            continue

        print("Unknown command. Use /list, add <title>, or quit.")


if __name__ == "__main__":
    repl()
