CREATE TABLE "customers" (
  "id" bigserial PRIMARY KEY,
  "full_name" varchar NOT NULL,
  "customer_ref" varchar UNIQUE NOT NULL,
  "email" varchar NOT NULL,
  "address" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT 'now()'
);

CREATE TABLE "transactions" (
  "id" bigserial PRIMARY KEY,
  "transaction_id" varchar UNIQUE NOT NULL,
  "customer_ref" varchar NOT NULL,
  "amount" decimal NOT NULL,
  "completed" bool DEFAULT '0',
  "created_at" timestamptz DEFAULT 'now()'
);

ALTER TABLE "transactions" ADD FOREIGN KEY ("customer_ref") REFERENCES "customers" ("customer_ref");

CREATE INDEX ON "customers" ("customer_ref");

CREATE INDEX ON "customers" ("full_name");

CREATE INDEX ON "transactions" ("transaction_id");

CREATE INDEX ON "transactions" ("customer_ref");
