CREATE TABLE address_snapshots (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    portfolio_snapshot_id UUID NOT NULL,
    address_id UUID NOT NULL,
    status snapshot_status DEFAULT 'pending',
    snapshot_duration INTERVAL,
    balance JSONB,
    error_message TEXT,
    finalized_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

    CONSTRAINT fk_address_snapshots_portfolio_snapshot_id FOREIGN KEY (portfolio_snapshot_id) REFERENCES portfolio_snapshots(id) ON DELETE CASCADE,
    CONSTRAINT fk_address_snapshots_address_id FOREIGN KEY (address_id) REFERENCES addresses(id) ON DELETE CASCADE,
    CONSTRAINT unique_address_snapshot_per_portfolio_snapshot_address_id UNIQUE (portfolio_snapshot_id, address_id)
);


CREATE INDEX idx_address_snapshots_portfolio_id ON address_snapshots (portfolio_snapshot_id);
CREATE INDEX idx_address_snapshots_status ON address_snapshots (status);
CREATE INDEX idx_address_snapshots_address_id ON address_snapshots (address_id);
CREATE INDEX idx_address_snapshots_created_at ON address_snapshots (created_at);
