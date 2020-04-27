package com.toombs.backend.quote

import org.springframework.stereotype.Service

@Service
class QuoteService (
    private val quoteRepository: QuoteRepository
) {

    fun saveQuote(quote: Quote): Long {
        val savedQuote = quoteRepository.save(quote)
        return savedQuote.id
    }
}