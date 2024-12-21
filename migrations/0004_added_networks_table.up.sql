CREATE TYPE network_name AS ENUM (
    'bitcoin',
    'ethereum',
    'binance-smart-chain',
    'solana',
    'cardano',
    'polkadot',
    'avalanche',
    'dogecoin'
);

CREATE TABLE networks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name network_name NOT NULL,
    slug VARCHAR(100) NOT NULL,
    thumbnail TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

    CONSTRAINT unique_network_slug UNIQUE (name)
);

CREATE INDEX idx_networks_name ON networks (name);
CREATE INDEX idx_networks_slug ON networks (slug);