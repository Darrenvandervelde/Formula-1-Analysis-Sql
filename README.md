# Formula 1 Data Analysis

A focused collection of SQL analyses and example notebooks for exploring historical Formula 1 race data.

---

## Overview

This repository provides SQL queries and optional notebooks to analyze Formula 1 results, drivers, constructors, lap times, circuits, and related telemetry. Queries are written in standard SQL for portability across database engines and can be paired with Python notebooks for visualization.

## Highlights

- Reproducible SQL queries for common F1 analyses — top drivers, season standings, circuit performance
- Example Jupyter notebooks showing how to run queries and build visualizations
- Portable — SQL scripts compatible with SQLite, PostgreSQL, and MySQL with minimal changes

## Repository Structure

```
f1-data-analysis/
├── SQL/          # Query files and example scripts
├── notebooks/    # Jupyter notebooks (optional)
├── data/         # Raw CSVs or exported SQL dumps (optional)
└── docs/         # Documentation, project questions, and reference PDFs
```

## Getting Started

### Requirements

| Requirement | Details |
|---|---|
| SQL database | SQLite, PostgreSQL, or MySQL |
| Python (optional) | 3.x with pandas, matplotlib, or seaborn |
| Jupyter (optional) | JupyterLab or Jupyter Notebook |

### SQLite Quickstart

```bash
# 1. Create or open a database
sqlite3 f1.db

# 2. Import data
sqlite3 f1.db < data/f1_dataset.sql

# 3. Run an example query
sqlite3 f1.db "SELECT * FROM races LIMIT 10;"
```

## Quick Examples

| File | Description |
|---|---|
| `SQL/top_drivers_by_wins.sql` | Rank drivers by career wins |
| `SQL/season_standings.sql` | Compute season points and standings |
| `SQL/circuit_analysis.sql` | Lap time distributions per circuit |

## Contributing

Contributions are welcome.

1. Open an issue describing the change or feature
2. Submit a pull request with tests or example outputs where relevant
3. Keep SQL queries documented with inline comments and assumptions

## Suggested Repository Topics

Add these topics on GitHub to improve discoverability:

`formula-1` `f1` `data-analysis` `sql` `motorsport` `data-science` `analytics` `racing` `visualization`

To add via the GitHub API:

```bash
curl -X PUT \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer YOUR_GITHUB_TOKEN" \
  https://api.github.com/repos/OWNER/REPO/topics \
  -d '{"names":["formula-1","f1","data-analysis","sql","motorsport","data-science","analytics","racing","visualization"]}'
```

Or go to your repo page, click About (top right), and edit topics directly.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
