package com.hitema.jee.mvc.services;

import com.hitema.jee.mvc.entities.Customer;
import com.hitema.jee.mvc.interfaces.CustomerService;
import com.hitema.jee.mvc.repositories.CustomerRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
    private static final Logger log = LoggerFactory.getLogger(CustomerServiceImpl.class);

    private CustomerRepository repository;

    public CustomerServiceImpl(CustomerRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<Customer> readAll() {
        return this.repository.findAll();
    }

    @Override
    public Customer read(Long id) {
        return this.repository.findById(id).orElse(null);
    }
}
