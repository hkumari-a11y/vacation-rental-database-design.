-- Illustrative PostgreSQL schema; NOT copied from the M4 group submission.
-- PostgreSQL 14+; example educational portfolio extension.
CREATE EXTENSION IF NOT EXISTS btree_gist;

CREATE TABLE owners (
    owner_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE
);

CREATE TABLE properties (
    property_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    owner_id BIGINT NOT NULL REFERENCES owners(owner_id),
    property_name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE guests (
    guest_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE
);

CREATE TABLE bookings (
    booking_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    property_id BIGINT NOT NULL REFERENCES properties(property_id),
    guest_id BIGINT NOT NULL REFERENCES guests(guest_id),
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    nightly_rate NUMERIC(10,2) NOT NULL CHECK (nightly_rate >= 0),
    CONSTRAINT valid_stay_dates CHECK (check_out > check_in),
    CONSTRAINT no_overlapping_property_bookings EXCLUDE USING gist (
        property_id WITH =,
        daterange(check_in, check_out, '[)') WITH &&
    )
);
