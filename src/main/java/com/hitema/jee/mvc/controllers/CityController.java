package com.hitema.jee.mvc.controllers;

import com.hitema.jee.mvc.entities.City;
import com.hitema.jee.mvc.interfaces.CityService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CityController {
    private static final Logger log = LoggerFactory.getLogger(CityController.class);

    private CityService service;

    public CityController(CityService service) {
        this.service = service;
    }

    @GetMapping("/cities")
    public ModelAndView getAll(){
        log.trace("Cities Get All called ...");
        var view = new ModelAndView();
        view.addObject("mmsg","autres attribut");
        view.addObject("cities",service.readAll());
        return view;
    }

    @GetMapping("/city/{id}")
    public ModelAndView getCity(@PathVariable String id){
        log.trace("Get city ...");
        Long idLong = Long.parseLong(id);
        City city = service.read(idLong);
        return new ModelAndView("city", "city", city);
    }



}
