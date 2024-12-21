CREATE TYPE auth_provider_enum AS ENUM (
    'email',
    'google',
    'apple'
);

CREATE TABLE auth_providers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    provider auth_provider_enum NOT NULL,
    provider_id VARCHAR(255),
    password_hash VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

    CONSTRAINT auth_providers_unique_per_user UNIQUE (user_id),
    CONSTRAINT auth_providers_unique_provider UNIQUE (provider, provider_id) 
);

-- Crear índices adicionales
CREATE INDEX idx_auth_providers_user_id ON auth_providers (user_id);
CREATE INDEX idx_auth_providers_provider ON auth_providers (provider);
CREATE INDEX idx_auth_providers_provider_id ON auth_providers (provider_id);
CREATE INDEX idx_auth_providers_created_at ON auth_providers (created_at); 