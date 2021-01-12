postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres

createdb:
	docker exec -t postgres createdb --username=root --owner=root sampleapidb

dropdb:
	docker exec -t postgres dropdb sampleapidb

migrateup:
	migrate -path db/migration -database postgres://root:secret@localhost:5432/sampleapidb?sslmode=disable -verbose up

migratedown:
	migrate -path db/migration -database postgres://root:secret@localhost:5432/sampleapidb?sslmode=disable -verbose down

test:
	go test -v -cover ./...

sqlc:
	docker run --rm -v C:\Users\de\Documents\GitRepos\go_postgres_api:/src -w /src kjconroy/sqlc generate

.PHONY: createdb dropdb postgres migrateup migratedown sqlc test