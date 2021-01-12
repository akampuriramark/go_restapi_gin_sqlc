// Code generated by sqlc. DO NOT EDIT.

package db

import (
	"database/sql"
	"time"
)

type Customer struct {
	ID          int64     `json:"id"`
	FullName    string    `json:"full_name"`
	CustomerRef string    `json:"customer_ref"`
	Email       string    `json:"email"`
	Address     string    `json:"address"`
	CreatedAt   time.Time `json:"created_at"`
}

type Transaction struct {
	ID            int64        `json:"id"`
	TransactionID string       `json:"transaction_id"`
	CustomerRef   string       `json:"customer_ref"`
	Amount        string       `json:"amount"`
	Completed     sql.NullBool `json:"completed"`
	CreatedAt     sql.NullTime `json:"created_at"`
}
