CREATE INDEX idx_erc20_tokens_discovery_block ON arbitrage_schema.erc20_tokens(discovery_block);
CREATE INDEX idx_markets_provider ON arbitrage_schema.markets(provider);
CREATE INDEX idx_markets_input_token ON arbitrage_schema.markets(input_token);
CREATE INDEX idx_markets_output_token ON arbitrage_schema.markets(output_token);
