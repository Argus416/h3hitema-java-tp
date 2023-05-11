package com.hitema.jee.mvc.interfaces;

import com.hitema.jee.mvc.entities.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> readAll();

    Customer read(Long id);
}
