CREATE TABLE arbitrage_schema.erc20_tokens (
                                               id VARCHAR(42) PRIMARY KEY,
                                               discovery_block BIGINT NOT NULL,
                                               name VARCHAR(255) NOT NULL,
                                               decimals INTEGER NOT NULL,
                                               created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                               chain_id BIGINT NOT NULL
);

CREATE TABLE arbitrage_schema.markets (
                                          id VARCHAR(100) PRIMARY KEY,
                                          provider BIGINT NOT NULL,
                                          input_token VARCHAR(42) REFERENCES arbitrage_schema.erc20_tokens(id),
                                          output_token VARCHAR(42) REFERENCES arbitrage_schema.erc20_tokens(id),
                                          pool_fee BIGINT,
                                          pool_identifier VARCHAR(40),
                                          is_stable BOOLEAN NOT NULL
);
