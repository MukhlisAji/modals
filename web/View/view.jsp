<%-- 
    Document   : view
    Created on : Dec 11, 2018, 9:59:01 AM
    Author     : Mukhlish
--%>

<%@page import="entities.Region"%>
<%@page import="daos.GeneralDAO"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="daos.DAOInterface" %>
<%@page import="entities.Employee" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Employee</title>
    </head>
    <body>
        <div class="col-sm-5 container">
            <h1>Employee</h1><br>
            
            <% String idEdit = "", nameEdit = "";
            if (session.getAttribute("isiRegion")!=null) {
                    Region r = (Region) session.getAttribute("isiRegion");
                    idEdit = r.getRegionId().toString();
                    nameEdit = r.getRegionName();
                }
            %>
            <form method="POST" action="../adRegion">
                <div class="form-group form-inline">
                    <label class="control-label col-sm-5">Region Id: </label>
                    <div class="col-sm-6">          

                        <input id="" type="text" class="form-control"  name="regionId" value="<%= idEdit %>">
                    </div>
                </div>
                <div class="form-group form-inline">
                    <label class="control-label col-sm-5">Region Name: </label>
                    <div class="col-sm-6">          

                        <input id="" type="text" class="form-control"  name="regionName" value="<%= nameEdit %>">
                    </div>

                </div>
                        <% session.removeAttribute("isiRegion"); %>
                <div class="form-group form-inline">
                    <label class="control-label col-sm-5"></label>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-default" id="ASD" name="">Save</button>
                    </div>
                </div>
            </form>
            
            <table  class="table table-bordered table100">
                <thead>
                    <tr>
                        <th> Region Id </th>
                        <th> Region Name </th>
                    </tr>
                </thead>
                <tbody>


                    <%SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                        DAOInterface daoi = new GeneralDAO(sessionFactory);
                        for (Object object : daoi.doDDL(new Region(), "")) {
                            Region e = (Region) object;
                            //                System.out.println(e.getLastName());
%>
                    <tr>
                        <td><%= e.getRegionId()%></td>
                        <td><%= e.getRegionName() %></td>
                        <td><a href="../DeleteRegion?id=<%= e.getRegionId() %>" class="btn btn-default">Delete</a></td>
                        <td><a href="../editRegion?id=<%= e.getRegionId() %>" class="btn btn-default">Edit</a></td></td>
                    </tr>

                    <% }
                    %>

                </tbody>
            </table>
        </div>


    </body>
</html>
