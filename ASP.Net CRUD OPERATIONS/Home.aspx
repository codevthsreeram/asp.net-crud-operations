<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ASP.Net_CRUD_OPERATIONS.Home" %>

<%@ Register Src="~/Navbar.ascx" TagPrefix="menu" TagName="Navbar" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRUD OPERATIONS | HOME</title>
    <link href="Styles.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</head>
<body>
    <menu:Navbar runat="server" ID="Navbar" />
    <div class="card componentStyle">
        <table>
            <tr>
                <td style="width: 48%; text-align: center;">
                    <img style="border-radius: 50%; height: 200px; width: 200px;" src="Resources/Profile.png" />
                </td>
                <td style="width: 4%;">
                    <div style="border-left: 3px solid green; height: 100px"></div>
                </td>
                <td style="width: 48%;">
                    <h5>Hello Everyone...!
                    This is <span style="color: #e063b0;">'Sreeram Kondagorla'</span><br>
                        A software proffessional with around 7 years of real time experience and
                    I'm here to teach how to <span style="color: #e063b0;">#code</span>.
                    </h5>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
