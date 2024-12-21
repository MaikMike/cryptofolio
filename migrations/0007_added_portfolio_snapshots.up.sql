CREATE TYPE snapshot_status AS ENUM ('pending', 'syncing', 'success', 'failed');

CREATE TABLE portfolio_snapshots (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    portfolio_id UUID NOT NULL,
    status snapshot_status DEFAULT 'pending',
    snapshot_duration INTERVAL,
    error_message TEXT,
    finalized_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

    CONSTRAINT fk_portfolio_snapshots_portfolio FOREIGN KEY (portfolio_id) REFERENCES portfolios(id) ON DELETE CASCADE
);

CREATE INDEX idx_portfolio_snapshots_portfolio_id ON portfolio_snapshots (portfolio_id);
CREATE INDEX idx_portfolio_snapshots_status ON portfolio_snapshots (status);
CREATE INDEX idx_portfolio_snapshots_created_at ON portfolio_snapshots (created_at);
