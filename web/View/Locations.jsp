<%-- 
    Document   : Locations
    Created on : Dec 11, 2018, 3:55:04 PM
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
        <script src="bower_components/sweetalert2/dist/sweetalert2.all.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
        <script src="bower_components/sweetalert2/dist/sweetalert2.min.js"></script>
        <link rel="stylesheet" href="bower_components/sweetalert2/dist/sweetalert2.min.css">
        <title>Locations</title>

        <!-- 
      1. data itu adalah nama dari file servlet untuk mengisikan session 
      2. detail adalah nama id dari attribut yang akan diisikan data hasil "data" dan terdapat didalam modal edit
      3. EditData adalah id modal yang akan menampilkan "data" -->
        <script type="text/javascript">
            $(document).ready(function () {
                $('[id="Details"]').click(function () {
                    var id = $(this).attr('value');
                    $.get("../data?id=" + id, function (HASIL, status) {
                        $("#detail").html(HASIL);
                        $('#EditData').modal('show');
                    });
                });
            });
        </script>
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

        <div class="col-sm-9 container">




            <!-- Modal -->
            <div id="EditData" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- konten modal-->
                    <div class="modal-content">
                        <!-- heading modal -->
                        <div class="modal-header">

                            <h4 class="modal-title">Edit Data</h4>
                        </div>
                        <!-- body modal -->
                        <div class="modal-body">

                            <div id="detail">  

                            </div>
                        </div>
                        <!-- footer modal -->

                    </div>
                </div>
            </div>

            <div id="insert" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- konten modal-->
                    <div class="modal-content">
                        <!-- heading modal -->
                        <div class="modal-header">

                            <h4 class="modal-title">Insert</h4>
                        </div>
                        <!-- body modal -->
                        <div class="modal-body">
                            <form method="POST" action="../addLocation">
                                <div class="form-group form-inline">
                                    <label class="control-label col-sm-5">LocationsId: </label>
                                    <div class="col-sm-6">          

                                        <input id="" type="text" class="form-control"  name="LocationId" value="">
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="control-label col-sm-5">CountryId : </label>
                                    <div class="col-sm-6">          

                                        <input id="" type="text" class="form-control"  name="CountryId" value="">
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="control-label col-sm-5">Street address: </label>
                                    <div class="col-sm-6">          

                                        <input id="" type="text" class="form-control"  name="StreetAddres" value="">
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="control-label col-sm-5">Local post: </label>
                                    <div class="col-sm-6">          

                                        <input id="" type="text" class="form-control"  name="PostalCode" value="">
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="control-label col-sm-5">City: </label>
                                    <div class="col-sm-6">          

                                        <input id="" type="text" class="form-control"  name="City" value="">
                                    </div>
                                </div>
                                <div class="form-group form-inline">
                                    <label class="control-label col-sm-5">State province: </label>
                                    <div class="col-sm-6">          

                                        <input id="" type="text" class="form-control"  name="StateProvince" value="">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-default" id="ASD" name="" onclick="swal('Oops!', 'Something went wrong on the page!', 'error')">Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </form>

                        </div>
                    </div>
                    <!-- footer modal -->

                </div>
            </div>

            <div id="contoh">
                
            </div>

            <h1>Locations</h1><br>

            <td><a class="btn btn-info" id="" data-toggle="modal" data-target="#insert" >Add Location</a></td><br><br>

            <table  class="table table-bordered table100">
                <thead>
                    <tr>
                        <th> LocationsId </th>
                        <th> CountryId </th>
                        <th> Street address </th>
                        <th> Local post </th>
                        <th> City </th>
                        <th> State province </th>
                        <th colspan="2"> Actions </th>

                    </tr>
                </thead>
                <tbody>
                    <!--<button type="button" class="btn btn-info btn-lg" >Open Small Modal</button>-->

                    <!-- Modal -->
                <div class="modal fade" id="Mdelete" role="dialog">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <p>This is a small modal.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-default" >Yes</button>
                            </div>
                        </div>
                    </div>
                </div>


                <%SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                    DAOInterface daoi = new GeneralDAO(sessionFactory);
                    for (Object object : daoi.doDDL(new Location(), "")) {
                        Location l = (Location) object;
                        //                System.out.println(e.getLastName());
                %>
                <tr>
                    <td><%= l.getLocationId()%></td>
                    <td><%= l.getCountryId().getCountryId()%></td>
                    <td><%= l.getStreetAddress()%></td>
                    <td><%= l.getPostalCode()%></td>
                    <td><%= l.getCity()%></td>
                    <td><%= l.getStateProvince()%></td>
                    <td><a class="btn btn-success" id="Details" data-toggle="modal" value="<%= l.getLocationId()%>" >Edit</a></td> <!-- mengambil nilai Id dan menyimpan di jquery -->
                    <td><a class="btn btn-warning" id="Deletes" href="../deleteLocation?id=<%= l.getLocationId()%>">Delete</a></td>
                </tr>


                <% }
                %>

                </tbody>
            </table>
        </div>
    </body>
    <script>
        jQuery(document).ready(function ($) {
            $('[id="Deletes"]').click(function () {
                var getLink = $(this).attr('href');
                swal({
                    title: "Are you sure?",
                    text: "But you will still be able to retrieve this file.",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes, archive it!",
                    html: true,
                    cancelButtonText: "No, cancel please!",
                    closeOnConfirm: false,
                    closeOnCancel: false
                }, function () {
                    
                    window.location.href = getLink;
                });
                return false;
            });
        });
    </script>
</html>
