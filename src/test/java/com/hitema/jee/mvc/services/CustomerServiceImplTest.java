package com.hitema.jee.mvc.services;

import com.hitema.jee.mvc.entities.Customer;
import com.hitema.jee.mvc.interfaces.CustomerService;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@SpringBootTest
class CustomerServiceImplTest {
    private static final Logger log = LoggerFactory.getLogger(CustomerServiceImpl.class);

    @Autowired
    CustomerService service;

    @Test()
    void readAll() {
        log.info("<<<<<<< Start Test readAll Customers >>>>>>>");
        List<Customer> customers = service.readAll();
        log.trace("Costumers count : {}", customers.size());
        assertNotEquals(0, customers.size());
        log.info("<<<<<<< End Test readAll Customers >>>>>>>");
    }

    @Test
    void read() {
        log.info("<<<<<<< Start Test read one customer >>>>>>>");
        Customer customer = service.read(1L);
        log.trace("Costumer  : {}", customer);
        assertNotNull(customer.getId());
        log.info("<<<<<<< End Test read one customer >>>>>>>");
    }
}

