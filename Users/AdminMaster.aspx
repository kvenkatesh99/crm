<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminMaster.aspx.cs" MasterPageFile="~/Users/Users.Master" Inherits="CRM.Users.AdminMaster" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <style type="text/css">
        .Gridview {
            font-family: Verdana;
            font-size: 10pt;
            font-weight: normal;
            color: black;
        }
    </style>
    <body>
        <div style="margin: 10px 0 0 5px;height:700px">
            <asp:GridView ID="gvDetails" DataKeyNames="UserId,FirstName" runat="server"
                AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#61A6F8"
                ShowFooter="true" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
                OnRowCancelingEdit="gvDetails_RowCancelingEdit"
                OnRowDeleting="gvDetails_RowDeleting" OnRowEditing="gvDetails_RowEditing"
                OnRowUpdating="gvDetails_RowUpdating"
                OnRowCommand="gvDetails_RowCommand"
                OnRowDataBound ="gvDetails_RowDataBound">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="50px">
                        <EditItemTemplate>
                            <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/Images/Cancel.jpg" ToolTip="Cancel" Height="20px" Width="20px" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="~/Images/AddNewitem.jpg" CommandName="AddNew" Width="30px" Height="30px" ToolTip="Add new User" ValidationGroup="validaiton" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FirstName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" runat="server" Text='<%#Eval("FirstName") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%#Eval("FirstName") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFirstName" runat="server" />
                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" Text="*" ValidationGroup="validaiton" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LastName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" runat="server" Text='<%#Eval("LastName") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblLastName" runat="server" Text='<%#Eval("LastName") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtLastName" runat="server" />
                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" Text="*" ValidationGroup="validaiton" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="EmailId">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmailId" runat="server" Text='<%#Eval("EmailId") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEmailId" runat="server" Text='<%#Eval("EmailId") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtEmailId" runat="server" />
                            <asp:RequiredFieldValidator ID="rfvEmailId" runat="server" ControlToValidate="txtEmailId" Text="*" ValidationGroup="validaiton" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="MobileNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMobileNumber" runat="server" Text='<%#Eval("MobileNumber") %>' MaxLength="10" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblMobileNumber" runat="server" Text='<%#Eval("MobileNumber") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtMobileNumber" runat="server" />
                            <asp:RequiredFieldValidator ID="rfvMobileNumber" runat="server" ControlToValidate="txtMobileNumber" Text="*" ValidationGroup="validaiton" />
                        </FooterTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Technician Type">
                        <EditItemTemplate>
                            <asp:DropDownList ID="dropDownListUserType" runat="server">
                                <asp:ListItem Text="Sales" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Service" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:HiddenField ID="hiddenFieldUserTypeId" runat="server" Value='<%#Eval("UserTypeId") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUserType" runat="server" Text='<%#Eval("UserType") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                               <asp:DropDownList ID="dropDownListUserType" runat="server">
                                <asp:ListItem Text="Sales" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Service" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvUserType" runat="server" ControlToValidate="dropDownListUserType" Text="*" ValidationGroup="validaiton" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPassword" runat="server" Text='<%#Eval("Password") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPassword" runat="server" Text='<%#Eval("Password") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPassword" runat="server" />
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Text="*" ValidationGroup="validaiton" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div>
            <asp:Label ID="lblresult" runat="server"></asp:Label>
        </div>
    </body>
    </html>
</asp:Content>
