INSERT INTO users (name, email, password, country, activated)
  VALUES ('Dienay', 'contact@dienay.net', '$2a$10$uUvzbCIBcFLdxDK6QcGZ3O.K0/4Z3ObFsy0BvetogYdE3IXdn7Q4y', 'CA', true);
ALTER SEQUENCE users_id_seq RESTART WITH 100;