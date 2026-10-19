-- Illustrative SQL queries; not from the original submitted M4 assignment.

-- 1. Booking count by property, including properties with zero bookings.
SELECT p.property_id, p.property_name, COUNT(b.booking_id) AS booking_count
FROM properties AS p
LEFT JOIN bookings AS b ON b.property_id = p.property_id
GROUP BY p.property_id, p.property_name
ORDER BY booking_count DESC, p.property_id;

-- 2. Example gross booking value by property (before fees and expenses).
SELECT p.property_id, p.property_name,
       COALESCE(SUM((b.check_out - b.check_in) * b.nightly_rate), 0) AS gross_booking_value
FROM properties AS p
LEFT JOIN bookings AS b ON b.property_id = p.property_id
GROUP BY p.property_id, p.property_name
ORDER BY gross_booking_value DESC;

-- 3. Detect overlaps in an unconstrained/imported bookings table.
-- On the provided schema, the exclusion constraint prevents these rows.
SELECT a.booking_id AS first_booking, b.booking_id AS second_booking,
       a.property_id
FROM bookings AS a
JOIN bookings AS b
  ON a.property_id = b.property_id
 AND a.booking_id < b.booking_id
 AND a.check_in < b.check_out
 AND b.check_in < a.check_out;
