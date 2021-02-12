//
//  FizzBuzzTests.swift
//  LearnUnittestsTests
//
//  Created by Gatuk Chattanon on 12/2/21.
//

import XCTest

class FizzBuzzTests: XCTestCase {
    func testFizzBuzz_ShouldReturnFizz_WhenNumberIs3() {
        let fizzbuzz = FizzBuzz()

        let actual = fizzbuzz.take(number: 3)

        XCTAssertEqual(actual, "fizz")
    }

    func testFizzBuzz_ShouldReturnBuzz_WhenNumberIs5() {
        let fizzbuzz = FizzBuzz()

        let actual = fizzbuzz.take(number: 5)

        XCTAssertEqual(actual, "buzz")
    }

    func testFizzBuzz_ShouldReturnFizzBuzz_WhenNumberIs15() {
        let fizzbuzz = FizzBuzz()

        let actual = fizzbuzz.take(number: 15)

        XCTAssertEqual(actual, "fizzbuzz")
    }

    func testFizzBuzz_ShouldReturn1_WhenNumberIs1() {
        let fizzbuzz = FizzBuzz()

        let actual = fizzbuzz.take(number: 1)

        XCTAssertEqual(actual, "1")
    }
}

class FizzBuzz {
    func take(number: Int) -> String {
        if number % 15 == 0 {
            return "fizzbuzz"
        } else if number % 3 == 0 {
            return "fizz"
        } else if number % 5 == 0 {
            return "buzz"
        } else {
            return String(number)
        }
    }
}
