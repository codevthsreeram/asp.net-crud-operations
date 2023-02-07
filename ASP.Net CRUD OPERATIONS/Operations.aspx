<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Operations.aspx.cs" Inherits="ASP.Net_CRUD_OPERATIONS.Operations" %>

<%@ Register Src="~/Navbar.ascx" TagPrefix="menu" TagName="Navbar" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRUD OPERATIONS | OPERATIONS</title>
    <link href="Styles.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function addUser() {
            let title = document.getElementById("mpUserTitle");
            title.innerHTML = 'CREATE USER';
            clearControls();
        }
        function clearControls() {
            let userId = document.getElementById("hdnUserId");
            let firstName = document.getElementById("txtFirstName");
            let lastName = document.getElementById("txtLastName");
            let email = document.getElementById("txtEmail");
            let fullName = document.getElementById("txtFullName");
            let street1 = document.getElementById("txtStreet1");
            let street2 = document.getElementById("txtStreet2");
            let city = document.getElementById("txtCity");
            let state = document.getElementById("txtState");
            let country = document.getElementById("txtCountry");
            let zipcode = document.getElementById("txtZipcode");

            userId.value = "00000000-0000-0000-0000-000000000000";
            firstName.value = "";
            lastName.value = "";
            email.value = "";
            fullName.value = "";
            street1.value = "";
            street2.value = "";
            city.value = "";
            state.value = "";
            country.value = "";
            zipcode.value = "";
        }
        function editUser(userId) {
            let title = document.getElementById("mpUserTitle");
            title.innerHTML = 'EDIT USER';
            PageMethods.GetEditUserDetails(userId, SetEditUserDetails, handleFailureResponse);
        }
        function deleteUser(id) {
            let userId = document.getElementById("hdnUserId");
            userId.value = id;
        }
        function confirmDelete() {
            let userId = document.getElementById("hdnUserId");
            PageMethods.DeleteUser(userId.value, handleSuccessResponse, handleFailureResponse);
        }
        function SetEditUserDetails(result) {
            let userId = document.getElementById("hdnUserId");
            let firstName = document.getElementById("txtFirstName");
            let lastName = document.getElementById("txtLastName");
            let email = document.getElementById("txtEmail");
            let fullName = document.getElementById("txtFullName");
            let street1 = document.getElementById("txtStreet1");
            let street2 = document.getElementById("txtStreet2");
            let city = document.getElementById("txtCity");
            let state = document.getElementById("txtState");
            let country = document.getElementById("txtCountry");
            let zipcode = document.getElementById("txtZipcode");

            userId.value = result.UserId;
            firstName.value = result.FirstName;
            lastName.value = result.LastName;
            email.value = result.Email;
            fullName.value = result.FullName;
            street1.value = result.Address.Street1;
            street2.value = result.Address.Street2;
            city.value = result.Address.City;
            state.value = result.Address.State;
            country.value = result.Address.Country;
            zipcode.value = result.Address.Zipcode;
        }
        function saveUserDetails() {
            let userId = document.getElementById("hdnUserId");
            let firstName = document.getElementById("txtFirstName");
            let lastName = document.getElementById("txtLastName");
            let email = document.getElementById("txtEmail");
            let fullName = document.getElementById("txtFullName");
            let street1 = document.getElementById("txtStreet1");
            let street2 = document.getElementById("txtStreet2");
            let city = document.getElementById("txtCity");
            let state = document.getElementById("txtState");
            let country = document.getElementById("txtCountry");
            let zipcode = document.getElementById("txtZipcode");

            var obj = new Object();
            obj.UserId = userId.value;
            obj.FirstName = firstName.value;
            obj.LastName = lastName.value;
            obj.Email = email.value;
            obj.FullName = fullName.value;
            obj.Address = new Object();
            obj.Address.Street1 = street1.value;
            obj.Address.Street2 = street2.value;
            obj.Address.City = city.value;
            obj.Address.State = state.value;
            obj.Address.Country = country.value;
            obj.Address.Zipcode = zipcode.value;

            var jsonString = JSON.stringify(obj);

            PageMethods.SaveUserDetails(jsonString, handleSuccessResponse, handleFailureResponse);
        }
        function handleSuccessResponse(response) {
            clearControls();
            location.reload();
            console.log(response);
        }
        function handleFailureResponse(error) {
            alert(error);
            console.log(error);
        }
    </script>
</head>
<body>
    <menu:Navbar runat="server" ID="Navbar" />
    <form id="fmUser" runat="server">
        <asp:ScriptManager ID='scrmUser' runat='server' EnablePageMethods='true' />
        <asp:HiddenField ID="hdnUserId" runat="server" />
        <div class="card componentStyle">
            <div style="text-align: right; margin-bottom: 5px;">
                <a onclick="addUser()" data-bs-toggle="modal" data-bs-target="#mpUser" class="btn btn-primary">
                    <i class="fa fa-plus"></i>
                    ADD
                </a>
            </div>
            <div>
                <asp:GridView ID="grdUser" runat="server" CssClass="table" AutoGenerateColumns="false" BorderStyle="None">
                    <Columns>
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:BoundField DataField="City" HeaderText="City" />
                        <asp:BoundField DataField="Email" HeaderText="Email Address" />
                        <asp:BoundField DataField="IsActive" HeaderText="Status" />
                        <asp:TemplateField HeaderText="Action(s)">
                            <ItemTemplate>
                                <a onclick="editUser('<%# Eval("UserId") %>');" href="#" data-bs-toggle="modal" data-bs-target="#mpUser"
                                    class="btn btn-secondary">
                                    <i class="fa fa-pencil"></i>
                                </a>&nbsp;
                                 <a onclick="deleteUser('<%# Eval("UserId") %>');" data-bs-toggle="modal" data-bs-target="#mpDeleteConfirm" href="#" class="btn btn-danger">
                                     <i class="fa fa-trash"></i>
                                 </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="table-dark" />
                </asp:GridView>
            </div>
            <%--CREATE/UPDATE MODAL POPUP : START--%>
            <div class="modal fade" id="mpUser" tabindex="-1" aria-labelledby="mpUserTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header alert alert-primary">
                            <h5 class="modal-title" id="mpUserTitle"></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="txtFirstName" class="col-form-label">First Name:</label>
                                <input name="txtFirstName" type="text" class="form-control"
                                    id="txtFirstName" />
                            </div>
                            <div class="form-group">
                                <label for="txtLastName" class="col-form-label">Last Name:</label>
                                <input name="txtLastName" type="text" class="form-control"
                                    id="txtLastName" />
                            </div>
                            <div class="form-group">
                                <label for="txtEmail" class="col-form-label">Email Address:</label>
                                <input name="txtEmail" type="email" class="form-control"
                                    id="txtEmail" />
                            </div>
                            <div class="form-group">
                                <label for="txtFullName" class="col-form-label">Full Name:</label>
                                <input name="txtFullName" type="text" class="form-control"
                                    id="txtFullName" />
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Address:</label>
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <input name="txtStreet1" type="text" class="form-control" id="txtStreet1" placeholder="Street1" />
                                        </td>
                                        <td>
                                            <input name="txtStreet2" type="text" class="form-control" id="txtStreet2" placeholder="Street2" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input name="txtCity" type="text" class="form-control" id="txtCity" placeholder="City" />
                                        </td>
                                        <td>
                                            <input name="txtState" type="text" class="form-control" id="txtState" placeholder="State" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input name="txtCountry" type="text" class="form-control" id="txtCountry" placeholder="Country" />
                                        </td>
                                        <td>
                                            <input name="txtZipcode" type="text" class="form-control" id="txtZipcode" placeholder="Zipcode" />
                                        </td>
                                    </tr>

                                </table>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button id="btnSave" onclick="saveUserDetails()" type="button" class="btn btn-primary">Save</button>
                        </div>
                    </div>
                </div>
            </div>
            <%--CREATE/UPDATE MODAL POPUP : END--%>

            <%--DELETE CONFIRMATION MODAL POPUP : START--%>
            <div class="modal fade" id="mpDeleteConfirm" tabindex="-1" aria-labelledby="mpDeleteConfirmTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header alert alert-danger">
                            <h5 class="modal-title" id="mpDeleteConfirmTitle">Confirm Dialog</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p class="success-message">Are you sure you wish to delete this record ? </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button id="btnOk" onclick="confirmDelete()" type="button" class="btn btn-primary">Yes</button>
                        </div>
                    </div>
                </div>
            </div>
            <%--DELETE CONFIRMATION MODAL POPUP : END--%>
        </div>
    </form>
</body>
</html>
