package com.hitema.jee.mvc.controllers;

import com.hitema.jee.mvc.entities.Customer;
import com.hitema.jee.mvc.interfaces.CustomerService;
import jakarta.annotation.PostConstruct;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class CustomerController {

    private static final Logger log = LogManager.getLogger(CustomerController.class);

    private CustomerService service;

    public CustomerController(CustomerService service) {
        this.service = service;
    }

    @PostConstruct
    private void check() {
        log.info("Check postconstruct called service Up : " + (service != null ? "Yes" : "No"));
    }


    @GetMapping("/customers")
    public ModelAndView getCustomers() {
        log.trace("Get customers ...");
        List<Customer> customers = service.readAll();
        return new ModelAndView("customers", "customers", customers);
    }

    @GetMapping("/customer/{id}")
    public ModelAndView getCustomers(@PathVariable String id) {
        log.trace("Get customer ...");
        Long idLong = Long.parseLong(id);
        Customer customer = service.read(idLong);
        return new ModelAndView("customer", "customer", customer);
    }


}
