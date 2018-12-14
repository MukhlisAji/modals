/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import daos.DAOInterface;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Ignatius
 */
public class GeneralDAO implements DAOInterface {

    private FunctionDAO fdao;

    public GeneralDAO(SessionFactory factory) {
        this.fdao = new FunctionDAO(factory);
    }

    /**
     * method for insert, update, or delete
     * @param object
     * @param isDelete
     * @return 
     */
    @Override
    public boolean doDML(Object object, boolean isDelete) {
        return this.fdao.insertOrUpdateOrDelete(object, isDelete);
    }
    /**
     * 
     * @param data
     * @param table
     * @param obj
     * @param searchBy
     * @return 
     */
    @Override
    public List<Object> doDDL(Object table, String keyword) {
        return this.fdao.getDatas(table, keyword);
    }
    /**
     * 
     * @param id
     * @return 
     */
    @Override
    public Object getById(Object entity,Object id) {
        return this.fdao.getById(entity,id);
    }

    @Override
    public Object login(Object entities, String Name) {
        return this.fdao.login(entities, Name);
    }
}
