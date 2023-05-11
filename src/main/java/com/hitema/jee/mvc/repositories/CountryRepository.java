package com.hitema.jee.mvc.repositories;

import com.hitema.jee.mvc.entities.Country;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CountryRepository extends JpaRepository<Country, Long> {

}
