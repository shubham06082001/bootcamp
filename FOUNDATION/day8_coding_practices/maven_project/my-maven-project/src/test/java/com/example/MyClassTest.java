package com.example;

import org.junit.Test;
import org.slf4j.LoggerFactory;

import static org.junit.Assert.assertEquals;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MyClassTest {

    @Test
    public void testAddition() {
        int result = 2 + 2;
        assertEquals(4, result);
    }

    private static final Logger logger = LoggerFactory.getLogger(MyClassTest.class);

    public static void main(String[] args) {
        logger.info("This is an info message.");
        logger.error("This is an error message.");
        logger.warn("Warning");
        logger.debug("Debugging");
    }
}
