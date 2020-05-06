create table quote
(
    id             bigserial                not null
        constraint quote_pk
            primary key,
    current        numeric default 0.0      not null,
    high           numeric default 0.0      not null,
    low            numeric default 0.0      not null,
    open           numeric default 0.0      not null,
    previous_close numeric default 0.0      not null,
    symbol         text    default ''::text not null,
    search_time    timestamp
);

alter table quote
    owner to postgres;

create unique index quote_id_uindex
    on quote (id);