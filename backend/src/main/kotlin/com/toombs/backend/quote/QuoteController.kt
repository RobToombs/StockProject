package com.toombs.backend.quote

import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api")
class QuoteController(
    private val quoteService: QuoteService
) {

    @PutMapping("/quote")
    fun quote(@RequestBody quote: Quote): ResponseEntity<Long> {
        val id = quoteService.saveQuote(quote)
        return ResponseEntity(id, HttpStatus.CREATED)
    }
}