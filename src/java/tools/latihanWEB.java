/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.LocationController;
import controllers.LocationControllerInterface;
import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Employee;
import entities.Location;
import entities.Region;
import org.hibernate.SessionFactory;

/**
 *
 * @author Mukhlish
 */
public class latihanWEB {

    public static void main(String[] args) {
        // TODO code application logic here
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        System.out.println(sessionFactory);

        DAOInterface daoi = new GeneralDAO(sessionFactory);
        LocationControllerInterface lci = new LocationController(sessionFactory);
//        Object employees = daoi.doDDL(new Employees(), "");

//        for (Object object : daoi.doDDL(new Employees(), "")) {
//            Employees e = (Employees) object;
//            System.out.println(e.getLastName());
//        }

//Object o = daoi.getById(new Region(), "17");
//Region region = (Region) o;
//        System.out.println(region.getRegionName());
    
//    Location l = new Location(new Short("123"), "DK");
        System.out.println(lci.delete("123", "srgesr"));
//        System.out.println(l.getStateProvince());

    }
}
