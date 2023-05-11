package com.hitema.jee.mvc.repositories;

import com.hitema.jee.mvc.entities.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Long> {

}
