package com.toombs.backend.quote

import org.springframework.data.repository.CrudRepository

interface QuoteRepository : CrudRepository<Quote, Long>