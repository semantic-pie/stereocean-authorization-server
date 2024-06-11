CREATE TYPE user_role AS ENUM ('ROLE_ADMIN', 'ROLE_USER');
CREATE CAST (VARCHAR AS user_role) WITH INOUT AS IMPLICIT;

CREATE TABLE users
(
    email     VARCHAR(255) PRIMARY KEY,
    username  VARCHAR(255),
    password  VARCHAR(255),
    user_role user_role
);

CREATE TABLE oauth2_registered_client
(
    id                            VARCHAR(100)                            NOT NULL PRIMARY KEY,
    client_id                     VARCHAR(100)                            NOT NULL,
    client_id_issued_at           timestamp     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    client_secret                 VARCHAR(200)  DEFAULT NULL,
    client_secret_expires_at      timestamp     DEFAULT NULL,
    client_name                   VARCHAR(200)                            NOT NULL,
    client_authentication_methods VARCHAR(1000)                           NOT NULL,
    authorization_grant_types     VARCHAR(1000)                           NOT NULL,
    redirect_uris                 VARCHAR(1000) DEFAULT NULL,
    post_logout_redirect_uris     VARCHAR(1000) DEFAULT NULL,
    scopes                        VARCHAR(1000)                           NOT NULL,
    client_settings               VARCHAR(2000)                           NOT NULL,
    token_settings                VARCHAR(2000)                           NOT NULL

);




-- Добавление администратора в таблицу users
INSERT INTO users (email, username, password, user_role)
VALUES ('admin@gmail.com', 'Admin Dio', '$2a$12$aeAsytC/mleJtA3.J8HqRuUIDZNykndDQSisT3q4b7LvQbmZlpnFi', 'ROLE_ADMIN'),
       ('user@gmail.com', 'User Josuke', '$2a$12$OkpOdefcZIr9kgo0aLXE0e3qWhv6lDuXA828y4Dw5UyCVYCOsoxVO', 'ROLE_USER');
-- first user (admin) 'admin@gmail.com', 'admin'
-- second user (user) 'user@gmail.com', 'user'