package com.hitema.jee.mvc.interfaces;

import com.hitema.jee.mvc.entities.Country;

import java.util.List;

public interface CountryService {
    List<Country> readAll() ;

    Country create(Country country);
}
