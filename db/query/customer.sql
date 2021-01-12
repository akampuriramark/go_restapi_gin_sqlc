-- name: GetCustomer :one
SELECT * FROM customers
WHERE id = $1 LIMIT 1;

-- name: CreateCustomer :one
INSERT INTO customers(full_name, customer_ref, email, address)
VALUES($1,$2,$3,$4)
RETURNING *;

-- name: GetAllCustomers :many
SELECT * FROM customers
ORDER BY created_at desc;