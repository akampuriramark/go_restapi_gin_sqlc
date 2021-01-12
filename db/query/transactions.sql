-- name: GetTransaction :one
SELECT * FROM transactions
WHERE transaction_id = $1 LIMIT 1;

-- name: GetAllTransactions :many
SELECT * FROM transactions
ORDER BY created_at desc;

-- name: SearchTransactions :many
SELECT * FROM transactions
WHERE   (transaction_id = $1 or $1 = '') or
        (customer_ref = $2 or $2 = '') or
        (TO_DATE(date,created_at) >= TO_DATE(date,$3) or $3 = '') or
        (TO_DATE(date,created_at) <= TO_DATE(date,$4) or $4 = '')
ORDER BY created_at desc;