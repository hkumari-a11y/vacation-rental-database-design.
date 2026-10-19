# Vacation Rental Database Design

**Santa Clara University | MS in Business Analytics | ISBA 2407 — Module 4**

An educational portfolio adaptation inspired by a collaborative database-design case study involving vacation properties, relationships, functional dependencies, normalization, and booking integrity.

## Scope

The original coursework focused on transforming an enhanced entity–relationship (EER) model into relations, identifying primary and foreign keys, discussing functional dependencies and third normal form (3NF), and describing a constraint to avoid overlapping reservations.

The SQL in this repository is an **independently prepared illustrative extension**, not the original submitted assignment, and does not claim to reproduce the professor's source diagram or the group's exact six-relation schema.

## Illustrative data model

- `owners` — people responsible for properties
- `properties` — rentable properties linked to owners
- `guests` — people making reservations
- `bookings` — guest stays at properties

An owner may manage multiple properties; a property can have multiple bookings over time; a guest can make multiple bookings. These are *example* entities for demonstrating relational design, not a transcription of the submitted group schema.

## Database concepts

- **Primary keys** uniquely identify rows.
- **Foreign keys** enforce valid relationships between tables.
- **Functional dependencies** help identify redundant or improperly structured data.
- **Normalization** reduces avoidable redundancy and update anomalies.
- **Booking overlap checks** must account for date ranges, not merely identical start dates.

## Files

- [`sql/schema.sql`](sql/schema.sql) — PostgreSQL example table definitions and constraints
- [`sql/example_queries.sql`](sql/example_queries.sql) — illustrative analytical queries and an overlap-detection query

## How to run

Run `sql/schema.sql` in a PostgreSQL database with permission to install `btree_gist`. Then explore the queries in `sql/example_queries.sql`. The queries return results after you add your own sample records.

## Academic attribution

Inspired by collaborative Module 4 case-study work for ISBA 2407 at Santa Clara University. This repository is a public-facing educational adaptation, not a copy of the group's report or instructor-provided materials.
