SET ROLE postgres;

CREATE TABLE quote
(
    id             BIGSERIAL    PRIMARY KEY      NOT NULL,
    current        DECIMAL      DEFAULT 0.0      NOT NULL,
    high           DECIMAL      DEFAULT 0.0      NOT NULL,
    low            DECIMAL      DEFAULT 0.0      NOT NULL,
    open           DECIMAL      DEFAULT 0.0      NOT NULL,
    previous_close DECIMAL      DEFAULT 0.0      NOT NULL,
    symbol         TEXT         DEFAULT ''       NOT NULL,
    search_time    TIMESTAMP,
    UNIQUE (id)
);