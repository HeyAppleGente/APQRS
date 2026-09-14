version: '3.8'

services:
  db:
    image: mysql:8.0
    container_name: apqrs2_db
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: apqrs2
    ports:
      - "3306:3306"
    volumes:
      - ./APQRS2/BD.sql:/docker-entrypoint-initdb.d/BD.sql

  web:
    build: .
    container_name: apqrs2_app
    ports:
      - "8080:8080"
    depends_on:
      - db
