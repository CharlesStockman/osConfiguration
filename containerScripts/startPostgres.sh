# -d -- detached mode : The terminal where is run can have commands executed after
docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=12345678 -d postgres
