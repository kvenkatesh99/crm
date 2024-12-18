<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CRM.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login Form</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td  style="height:300px;width:500px;padding-left:80px;">
                        <table>
                            <tr>
                                <td style="text-align: center">
                                    <asp:Image ID="imageCRMicon" runat="server" ImageUrl="~/Images/CRM_icon.jpg" Height="80px" Width="150px" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">Sign In</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtUserName" runat="server" ToolTip="UserName" ForeColor="Black"/><br />
                                    <asp:RequiredFieldValidator ID="rfvUser" ForeColor="Red" ErrorMessage="Please enter Username" ControlToValidate="txtUserName" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtPWD" runat="server" TextMode="Password" ToolTip="Password" /><br />
                                    <asp:RequiredFieldValidator ID="rfvPWD" ForeColor="Red" runat="server" ControlToValidate="txtPWD" ErrorMessage="Please enter Password" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                Remember Me 
                                    <asp:CheckBox ID="chkPersistCookie" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="labelErrorMessage" runat="server" Text="" ForeColor="Red" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:Image ID="imageCRMlogo" runat="server" ImageUrl="~/Images/CRM_logo.jpg" Height="500px" Width="850px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
