<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" ValidateRequest="false" MasterPageFile="~/Users/Users.Master" Inherits="CRM.Users.Tickets" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="RichTextBox" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>


<asp:Content ID="Content3" ContentPlaceHolderID="Main" runat="Server">
    <style type="text/css">
        .Gridview {
            font-family: Verdana;
            font-size: 10pt;
            font-weight: normal;
            color: black;
        }
    </style>
    <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="../Scripts/jquery.MultiFile.js" type="text/javascript"></script>
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <body>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
        <div id="divSearchTicket" style="margin: 10px 0 0 5px" runat="server">
            Search Tickets 
            <table style="width: 1050px">
                <tr>
                    <td>Ticket ID
                                    <br />
                        <asp:TextBox ID="textBoxSearchTicketID" runat="server"></asp:TextBox>
                    </td>
                    <td>First Name
                                    <br />
                        <asp:TextBox ID="textBoxSearchFirstName" runat="server"></asp:TextBox></td>
                    <td>Last Name
                                    <br />
                        <asp:TextBox ID="textBoxSearchLastName" runat="server"></asp:TextBox></td>
                    <td>Email                                   
                                    <br />
                        <asp:TextBox ID="textBoxSearchEmail" runat="server"></asp:TextBox>
                    </td>
                    <td>Phone
                                    <br />
                        <asp:TextBox ID="textBoxSearchPhone" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="5" style="float: right; margin: 10px 0 0 0">
                        <asp:Button ID="buttonSearch" Text="Search" runat="server" OnClick="buttonSearch_Click" />
                        <asp:Button ID="buttonSerachClear" Text="Clear" runat="server" OnClick="buttonSerachClear_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:Button ID="buttonAddTicket" runat="server" Text="Add Ticket" OnClick="buttonAddTicket_Click" Style="float: right" />
        <br />
        <br />
        <div>
            <asp:GridView ID="gridviewTickets" runat="server" CellPadding="4" AutoGenerateColumns="False" OnRowCommand="gridviewTickets_RowCommand"
                HeaderStyle-BackColor="#61A6F8"
                HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
                TabIndex="0">
                <Columns>
                    <asp:TemplateField HeaderStyle-Width="45px">
                        <ItemTemplate>
                            <asp:ImageButton ID="imageButtonUpdate" runat="server"
                                ImageUrl='<%#Eval("IsEditable").ToString() == "True" ? "~/Images/Edit.jpg" : "~/Images/View.png"%>'
                                Height="20px" Width="20px" CommandArgument='<%#Eval("CustomerDetails") + "~" + Eval("TicketTypeID") + "~" + Eval("RemoteAccessCode") + "~" +
                            Eval("RemoteAccessTypeID") + "~" + Eval("OperatingSystemID") + "~" + Eval("OSPassword") + "~" + Eval("AssignedToID") + "~" +
                            Eval("Comment") + "~" + Eval("TicketID") + "~" + Eval("Product") + "~" + Eval("ProductKey")%>'
                                Visible='<%#Eval("IsAdmin").ToString() == "True" || (Eval("IsEditable").ToString() == "False") || (Eval("Status").ToString() != "New" && Eval("IsEditable").ToString() == "True") %>'
                                CommandName='<%#Eval("IsEditable").ToString() == "True" ? "UpdateTicket" : "ViewTicket"%>'
                                CssClass="gridbuttonn" CausesValidation="false" />
                            <asp:ImageButton ID="linkButtonDelete" runat="server" ImageUrl="~/Images/delete.jpg" CommandArgument='<%#Eval("TicketID")%>'
                                CommandName="DeleteTicket" CssClass="gridbuttonn" CausesValidation="false" ToolTip="Delete" Height="20px" Width="20px"
                                Visible='<%#Eval("IsAdmin").ToString() == "True"%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ticket ID">
                        <ItemTemplate>
                            <asp:HiddenField ID="hiddenFieldStatusID" runat="server" Value='<%#Eval("StatusID") %>'></asp:HiddenField>
                            <asp:Label ID="labelTicketID" runat="server" Text='<%#Eval("TicketID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Customer Name">
                        <ItemTemplate>
                            <asp:Label ID="labelCustomerName" runat="server" Text='<%#Eval("CustomerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ticket Type">
                        <ItemTemplate>
                            <asp:Label ID="labelTicketType" runat="server" Text='<%#Eval("TicketType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Start Date">
                        <ItemTemplate>
                            <asp:Label ID="labelStartDate" runat="server" Text='<%#Eval("StartDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="End Date">
                        <ItemTemplate>
                            <asp:Label ID="labelEndDate" runat="server" Text='<%#Eval("EndDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Created By">
                        <ItemTemplate>
                            <asp:Label ID="labelCreatedBy" runat="server" Text='<%#Eval("CreatedBy") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tech Worked">
                        <ItemTemplate>
                            <asp:Label ID="labelTechWorked" runat="server" Text='<%#Eval("AssignedTo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Brand">
                        <ItemTemplate>
                            <asp:Label ID="labelBrand" runat="server" Text='<%#Eval("Brand") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="labelStatus" runat="server" Text='<%#Eval("Status") %>'
                                Visible='<%#Eval("Status").ToString() != "New" || Eval("IsAdmin").ToString() == "True" || Eval("IsEditable").ToString() == "False"  %>'></asp:Label>
                            <asp:ImageButton ID="ImageButtonNew" runat="server" ImageUrl="~/Images/NewButton.jpg"
                                Visible='<%#Eval("Status").ToString() == "New" && Eval("IsAdmin").ToString() == "False" && Eval("IsEditable").ToString() == "True" %>'
                                CommandArgument='<%#Eval("CustomerDetails") + "~" + Eval("TicketTypeID") + "~" + Eval("RemoteAccessCode") + "~" +
                            Eval("RemoteAccessTypeID") + "~" + Eval("OperatingSystemID") + "~" + Eval("OSPassword") + "~" + Eval("AssignedToID") + "~" +
                            Eval("Comment") + "~" + Eval("TicketID") + "~" + Eval("Product") + "~" + Eval("ProductKey")%>'
                                CommandName="UpdateNewTicket" CssClass="gridbuttonn" CausesValidation="false" Height="50px" Width="80px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IsActive">
                        <ItemTemplate>
                            <asp:LinkButton ID="linkButtonIsActive" runat="server" Text='<%#Eval("IsActive").ToString() == "0" ? "InActive" : "Active" %>'
                                Enabled='<%#Eval("IsAdmin").ToString() == "True" %>'
                                CommandName="UpdateActiveTicket" CommandArgument='<%#Eval("TicketID")%>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <span class="norecords">No Records Found </span>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
        <br />
        <div id="divAddTicket" runat="server" visible="false" style="width: 1020px; height: 1000px; margin: 0 0 0 10px; border: 1px solid black">
            <br />
            <div style="float: right; width: 990px;margin:10px 5px 10px 0;">
            <asp:Button ID="ButtonConfirmationEmail" runat="server" Text="Confirmation Email" OnClick="ButtonConfirmationEmail_OnClick" />
        </div>
        <br />
            <b>
                <asp:Label ID="labelTicketTitle" runat="server" Text="Add Ticket"></asp:Label></b>
            <div>
                <table style="width: 800px;">
                    <tr>
                        <td>
                            <table style="margin: 0 0 0 10px; width: 650px;">
                                <tr>
                                    <td colspan="3">Customer Name *
                                <asp:TextBox ID="TextBoxCustomer" runat="server" AutoPostBack="True" OnTextChanged="TextBoxCustomer_TextChanged" Width="200px"></asp:TextBox>
                                        <asp:AutoCompleteExtender ServiceMethod="GetCustomersList" MinimumPrefixLength="10"
                                            CompletionInterval="10" EnableCaching="false" CompletionSetCount="1" TargetControlID="TextBoxCustomer"
                                            ID="AutoCompleteExtenderCustomer" runat="server" FirstRowSelected="false">
                                        </asp:AutoCompleteExtender>
                                        <asp:RequiredFieldValidator ID="rfvCustomer" runat="server" ControlToValidate="TextBoxCustomer" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ticket Type *
                                    <br />
                                        <asp:DropDownList ID="dropDownListTicketType" runat="server" Width="170px">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Existing" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" ControlToValidate="dropDownListTicketType" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                    </td>
                                    <td>Remote Access Code *
                                    <br />
                                        <asp:TextBox ID="textBoxRemoteAccessCode" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textBoxRemoteAccessCode" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                    </td>
                                    <td>Remote Access Type
                                    <br />
                                        <asp:DropDownList ID="dropDownListRemoteAccessType" runat="server" Width="170px">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="TeamViewer" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="AnyDesk" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="RemotePC" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Operating System 
                                    <br />
                                        <asp:DropDownList ID="dropDownListOperatingSystem" runat="server" Width="170px">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Windows" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Linux" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>OS Password *
                                    <br />
                                        <asp:TextBox ID="textBoxOSPassword" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textBoxOSPassword" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                    </td>
                                    <td>Assigned To
                                    <br />
                                        <asp:DropDownList ID="dropDownListAssignedTo" runat="server" Width="170px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ticket Status *
                                    <br />
                                        <asp:DropDownList ID="dropDownListTicketStatus" runat="server" Width="170px">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="InProgress" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Pending" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Resolved" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Closed" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="Refund" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="Sale Cancelled" Value="7"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" InitialValue="0" ControlToValidate="dropDownListTicketStatus" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                    </td>
                                    <td>Product
                                    <br />
                                        <asp:TextBox ID="textBoxProduct" runat="server"></asp:TextBox>
                                    </td>
                                    <td>Product Key
                                    <br />
                                        <asp:TextBox ID="textBoxProductKey" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <div id="divCustomerDetails" style="width: 350px;">
                                Customer Name : 
                                <asp:Label ID="labelCustomerName" runat="server"></asp:Label>
                                <br />
                                <br />
                                Email :  
                                <asp:Label ID="labelCustomerEmail" runat="server"></asp:Label>
                                <br />
                                <br />
                                Customer Status : 
                                <asp:Label ID="labelCustomerStatus" runat="server"></asp:Label>
                                <br />
                                <br />
                                No Of PC's' : 
                                <asp:Label ID="labelCustomerNoOfPCs" runat="server"></asp:Label>
                                <br />
                                <br />
                                Start Date : 
                                <asp:Label ID="labelCustomerStartDate" runat="server"></asp:Label>
                                <br />
                                <br />
                                End Date : 
                                <asp:Label ID="labelCustomerEndDate" runat="server"></asp:Label>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <table style="width: 800px; height: 200px">
                <tr>
                    <td style="width: 400px">Comment 
                        <br />
                        <RichTextBox:FreeTextBox ID="FreetextBoxComment" Width="550px" Height="150px" runat="server"
                            TabIndex="6">
                        </RichTextBox:FreeTextBox>
                        <asp:RequiredFieldValidator ID="rfvAmount" runat="server" ControlToValidate="FreetextBoxComment" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                    </td>
                    <td>
                        <div id="divTicketComments" runat="server" style="width: 480px; height: 200px" visible="false">
                            <b>Ticket Comments : </b>
                            <br />
                            <asp:DataList ID="dataListTicketComments"
                                BorderColor="black"
                                CellPadding="5"
                                CellSpacing="5"
                                RepeatDirection="Vertical"
                                RepeatLayout="Table"
                                RepeatColumns="1"
                                runat="server">
                                <AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <br />
                                    <div>
                                        <table style="width: 420px">
                                            <tr>
                                                <td style="float: left; width: 120px">
                                                    <asp:Label ID="labelDateTime" runat="server" Text='<%#Eval("CreatedDateTime") %>' Style="float: right"></asp:Label>
                                                </td>
                                                <td style="float: right; width: 250px">Commented By : 
                                                        <asp:Label ID="labelUpdatedBy" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                    <br />
                                                    Ticket Status :
                                                        <asp:Label ID="labelTicketType" runat="server" Text='<%#Eval("TicketStatus") %>'></asp:Label>
                                                    <br />
                                                    Comments :
                                                        <asp:Label ID="labelComments" runat="server" Text='<%#Eval("Comments").ToString().Length > 20 ?
                                        Eval("Comments").ToString().Substring(0,19) + "..." : Eval("Comments").ToString()%>'
                                                            ToolTip='<%#Eval("Comments") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </td>
                </tr>

            </table>
            <br />
            <div id="divTicketFiles" runat="server" visible="false">
                <b>Ticket Files : </b>
                <br />
                <asp:DataList ID="dataListTicketFiles"
                    BorderColor="black"
                    CellPadding="5"
                    CellSpacing="5"
                    RepeatDirection="Horizontal" OnItemCommand="dataListTicketFiles_OnItemCommand"
                    RepeatLayout="Table"
                    RepeatColumns="5"
                    runat="server">
                    <AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div>
                            <asp:ImageButton ID="imagButtonDelete" runat="server" ImageUrl="~/Images/delete_img.jpg" CommandArgument='<%#Eval("TicketFileId")%>'
                                Height="10px" Width="10px" Style="float: right; padding-top: -20px" />
                            <asp:Image ID="imageFileName" runat="server" Height="50px" Width="50px"
                                ImageUrl='<%# "~/UploadFiles/" + Eval("FileName").ToString() %>'></asp:Image>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <br />
            <div id="divFileUpload" runat="server">
                <asp:FileUpload ID="file_upload" class="multi" runat="server" />
                <asp:Label ID="lblMessage" runat="server" />
            </div>
            <br />
            <div style="float: right; width: 1020px">
                <asp:Button ID="buttonSumbit" Text="Submit" runat="server" OnClick="buttonSubmit_Click" ValidationGroup="validaiton" />
                <asp:Button ID="buttonCancel" Text="Cancel" runat="server" OnClick="buttonCancel_Click" />
            </div>
        </div>
    </body>
    </html>
</asp:Content>
