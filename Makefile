all: install

clean:
	go clean ./...

doc:
	godoc -http=:6060

install:
	go get github.com/jmoiron/sqlx
	go get github.com/lib/pq
	go get github.com/denisenkom/go-mssqldb
	go get github.com/go-sql-driver/mysql
	go get github.com/mattn/go-sqlite3

test-install: install
	go get golang.org/x/tools/cmd/cover
	go get github.com/mattn/goveralls

test:
	go test -cover ./...

test-travis:
	./test-cover.sh

bench:
	go test -run=none -bench=. -benchmem ./...

build:
	go build -o $(GOPATH)/bin/sql-agent ./cmd/sql-agent

fmt:
	go vet ./...
	go fmt ./...

lint:
	golint ./...


.PHONY: test proto
