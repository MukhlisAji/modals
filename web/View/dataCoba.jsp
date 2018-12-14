<%-- 
    Document   : dataCoba
    Created on : Dec 12, 2018, 2:09:34 PM
    Author     : Mukhlish
--%>

<%@page import="entities.Region"%>
<%@page import="daos.GeneralDAO"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="daos.DAOInterface" %>
<%@page import="entities.Location" %>
<%@page import="entities.Country" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String locationId = "";
            String streetAddress = "";
            String postalCode = "";
            String city = "";
            String stateProvince = "";
            String countryId = "";
            if (session.getAttribute("isiLocation") != null) {
                Location l = (Location) session.getAttribute("isiLocation");
                locationId = l.getLocationId().toString();
                streetAddress = l.getStreetAddress();
                postalCode = l.getPostalCode();
                city = l.getCity();
                stateProvince = l.getStateProvince();
                countryId = l.getCountryId().getCountryId();
            }
        %>

        <form method="POST" action="../addLocation">
            <div class="form-group form-inline">
                <label class="control-label col-sm-5" >LocationsId: </label>
                <div class="col-sm-6">          

                    <input id="" type="text" class="form-control"  name="LocationId" value="<%= locationId%>" readonly="true">
                </div>
            </div>
            <div class="form-group form-inline">
                <label class="control-label col-sm-5">CountryId : </label>
                <div class="col-sm-6">          

                    <input id="" type="text" class="form-control"  name="CountryId" value="<%= countryId%>">
                </div>
            </div>
            <div class="form-group form-inline">
                <label class="control-label col-sm-5">Street address: </label>
                <div class="col-sm-6">          

                    <input id="" type="text" class="form-control"  name="StreetAddres" value="<%= streetAddress%>">
                </div>
            </div>
            <div class="form-group form-inline">
                <label class="control-label col-sm-5">Local post: </label>
                <div class="col-sm-6">          

                    <input id="" type="text" class="form-control"  name="PostalCode" value="<%= postalCode%>">
                </div>
            </div>
            <div class="form-group form-inline">
                <label class="control-label col-sm-5">City: </label>
                <div class="col-sm-6">          

                    <input id="" type="text" class="form-control"  name="City" value="<%= city%>">
                </div>
            </div>
            <div class="form-group form-inline">
                <label class="control-label col-sm-5">State province: </label>
                <div class="col-sm-6">          

                    <input id="" type="text" class="form-control"  name="StateProvince" value="<%= stateProvince%>">
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-default" id="" name="">Save</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </form>

        <% session.removeAttribute("isiLocation");%>
    </body>
</html>
