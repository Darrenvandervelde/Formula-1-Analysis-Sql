# Formula 1 Project - Data Analysis

A focused collection of SQL analyses and example notebooks for exploring historical Formula 1 race data.

Overview

This repository provides SQL queries and optional notebooks to analyze Formula 1 results, drivers, constructors, lap times, circuits, and related telemetry. The analyses are written in SQL for portability across database engines and may be combined with Python notebooks for visualization.

Highlights

- Reproducible SQL queries for common F1 analyses (top drivers, season standings, circuit performance)
- Example Jupyter notebooks showing how to run queries and create visualizations (if included)
- Portable: SQL scripts compatible with SQLite, PostgreSQL, MySQL with minimal changes

Repository structure

- SQL/ : SQL query files and example scripts
- notebooks/ : Jupyter notebooks (optional)
- data/ : raw CSV or exported SQL (optional)
- Docs/ : documentation, project questions, and reference PDFs

Getting started

1. Import the dataset into your preferred SQL engine (SQLite, MySQL, Postgres).
2. Run the SQL scripts in the `SQL/` directory, or open the notebooks in `notebooks/`.

Quick examples

- SQL/top_drivers_by_wins.sql — rank drivers by career wins
- SQL/season_standings.sql — compute season points and standings
- SQL/circuit_analysis.sql — lap time distributions per circuit

Requirements

- A SQL database (SQLite/Postgres/MySQL) or SQL client
- (Optional) Python 3.x with pandas, matplotlib/seaborn for visualization
- (Optional) Jupyter Lab/Notebook to run the example notebooks

How to run (SQLite example)

1. Create or open a database: `sqlite3 f1.db`
2. Import CSVs or run a SQL dump: `sqlite3 f1.db < data/f1_dataset.sql`
3. Run an example query: `sqlite3 f1.db "SELECT * FROM races LIMIT 10;"`

Contributing

Contributions are welcome. To contribute:
- Open an issue describing the change or feature
- Submit a pull request with tests or example outputs where relevant
- Keep SQL queries documented with comments and assumptions

License

This project is licensed under the MIT License — see the LICENSE file for details.

Repository topics (suggested)

I recommend adding these GitHub repository topics to improve discoverability:
- formula-1
- f1
- data-analysis
- sql
- motorsport
- data-science
- analytics
- racing
- visualization

How to add the topics (you or a repo admin)

- Web UI: On GitHub, go to the repository page, click "About" (top-right), and edit topics.
- REST API (replace owner/repo and add your token):
  curl -X PUT -H "Accept: application/vnd.github+json" -H "Authorization: Bearer GITHUB_TOKEN" \
    https://api.github.com/repos/OWNER/REPO/topics \
    -d '{"names":["formula-1","f1","data-analysis","sql","motorsport","data-science","analytics","racing","visualization"]}'

I cannot update repository topics directly with the current permissions/tools, so please run the command above or use the web UI.

Contact

If you want me to also add or reorganize SQL examples or generate notebooks from the SQL queries, tell me what you'd like and I will update the repo.
