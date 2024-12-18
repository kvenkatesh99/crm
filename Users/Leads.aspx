<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Leads.aspx.cs" MasterPageFile="~/Users/Users.Master" Inherits="CRM.Users.Leads" %>


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
        <br />
        <asp:Button ID="buttonRefreshLeads" runat="server" Text="Refresh Leads" OnClick="buttonRefreshLeads_OnClick" />
        <br />

        <div style="margin: 10px 10px 0 5px;width:1040px;height:700px;">
            <asp:GridView ID="gvDetails" runat="server"
                AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#61A6F8"
                HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
                OnRowCommand="gvDetails_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="First Name" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%#Eval("FirstName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Label ID="lblLastName" runat="server" Text='<%#Eval("LastName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="EmailId" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Label ID="lblEmailId" runat="server" Text='<%#Eval("EmailId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mobile Number" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Label ID="lblMobileNumber" runat="server" Text='<%#Eval("MobileNumber") %>' 
                                Visible='<%#Eval("IsPicked").ToString() == "1" %>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Comments" ItemStyle-Width="250px">
                        <ItemTemplate>
                            <asp:Label ID="lblCmmments" runat="server" Text='<%#Eval("Comments").ToString().Length > 30 ?
                                        Eval("Comments").ToString().Substring(0,29) + "..." : Eval("Comments").ToString()%>'
                                Visible='<%#Eval("IsPicked").ToString() == "1" %>'
                                ToolTip='<%#Eval("Comments") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Technician Type" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:DropDownList ID="dropDownListType" runat="server"
                                Visible='<%#Eval("IsPicked").ToString() == "0" %>'>
                                <asp:ListItem Text="No Answer" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Voice Mail" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Invalid Number" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Not Interested" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Sale Done" Value="5"></asp:ListItem>
                                <asp:ListItem Text="Customer want to Call back" Value="5"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="labelype" runat="server" Text='<%#Eval("Type").ToString()%>'
                                Visible='<%#Eval("IsPicked").ToString() == "1" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pick" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <asp:LinkButton ID="linkButtonPick" runat="server" Text="Pick"
                                Visible='<%#Eval("IsPicked").ToString() == "0" %>'
                                CommandArgument='<%#Eval("LeadID")%>'></asp:LinkButton>
                            <asp:Label ID="labelPicked" runat="server" Text="Alreay Picked"
                                Visible='<%#Eval("IsPicked").ToString() == "1" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </body>
    </html>
</asp:Content>
