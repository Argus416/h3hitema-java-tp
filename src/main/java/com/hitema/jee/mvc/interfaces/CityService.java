package com.hitema.jee.mvc.interfaces;

import com.hitema.jee.mvc.entities.City;

import java.util.List;

public interface CityService {
    List<City> readAll() ;
    City read(Long id);
}
