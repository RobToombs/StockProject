package com.toombs.backend.quote

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

@Entity
data class Quote (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0,

    val symbol: String = "",

    val open: Double = 0.0,

    val high: Double = 0.0,

    val low: Double = 0.0,

    val current: Double = 0.0,

    val previousClose: Double = 0.0
)