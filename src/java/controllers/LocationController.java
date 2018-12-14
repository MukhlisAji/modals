/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import controllers.LocationControllerInterface;
import daos.GeneralDAO;
import daos.DAOInterface;
import entities.Country;
import entities.Location;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Kaukanoer
 */
public class LocationController implements LocationControllerInterface {

    private Location location;
    private Country country;
    private DAOInterface gdao;

    public LocationController(SessionFactory factory) {
        this.gdao = new GeneralDAO(factory);
    }

    @Override
    public boolean save(String locationid, String streetAddress, String postalCode, String city, String stateProvince, String countryId) {
        short locationId = Short.valueOf(locationid);
        country = new Country(countryId);
        location = new Location(locationId, streetAddress, postalCode, city, stateProvince, country);
        return gdao.doDML(location, false);
    }

    @Override
    public boolean delete(String locationid, String city) {
        short locationId = Short.valueOf(locationid);
        location = new Location(locationId, city);
        return gdao.doDML(location, true);
    }
    

    @Override
    public Object getById(String locationId) {
        location = new Location(new Short(locationId));
        return this.gdao.getById(location, locationId);
    }

    @Override
    public List<Object> getAll() {
        return this.gdao.doDDL(new Location(), "");
    }
}
