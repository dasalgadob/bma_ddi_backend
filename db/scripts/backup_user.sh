 pg_dump -d ddi_development -t users --data-only --column-inserts -U username > db/backup/users.sql

  pg_dump -d ddi_development -t interviews --data-only --column-inserts -U username > db/backup/interviews.sql