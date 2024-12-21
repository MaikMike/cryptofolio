CREATE TABLE addresses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    portfolio_id UUID NOT NULL,
    network_id UUID NOT NULL,
    address VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    label VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

    CONSTRAINT fk_addresses_portfolio FOREIGN KEY (portfolio_id) REFERENCES portfolios(id) ON DELETE CASCADE,
    CONSTRAINT fk_addresses_network FOREIGN KEY (network_id) REFERENCES networks(id) ON DELETE CASCADE,
    CONSTRAINT unique_address_per_portfolio UNIQUE (portfolio_id, address)
);

CREATE INDEX idx_addresses_portfolio_id ON addresses (portfolio_id);
CREATE INDEX idx_addresses_network_id ON addresses (network_id);
CREATE INDEX idx_addresses_label ON addresses (label);
CREATE INDEX idx_addresses_is_active ON addresses (is_active);
CREATE INDEX idx_addresses_address ON addresses (address);
CREATE INDEX idx_addresses_created_at ON addresses (created_at);
