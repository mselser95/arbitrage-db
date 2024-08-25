CREATE TABLE arbitrage_schema.erc20_tokens (
    id UUID PRIMARY KEY,
    address_lower VARCHAR(42),
    discovery_block BIGINT NOT NULL,
    name VARCHAR(255) ,
    decimals INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    chain_id BIGINT NOT NULL
);

CREATE TABLE arbitrage_schema.markets (
    id UUID PRIMARY KEY,
    provider BIGINT NOT NULL,
    input_token UUID REFERENCES arbitrage_schema.erc20_tokens(id),
    output_token UUID REFERENCES arbitrage_schema.erc20_tokens(id),
    pool_fee BIGINT,
    pool_identifier VARCHAR(40),
    is_stable BOOLEAN
);

CREATE TABLE last_block_processed (
    chain_id INT PRIMARY KEY,
    block_number BIGINT NOT NULL
);