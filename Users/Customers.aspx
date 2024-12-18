<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" MasterPageFile="~/Users/Users.Master" Inherits="CRM.Users.Customers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">
    <script type="text/javascript">
        function callVerify(obj) {
            return confirm('Are you sure to upgrade?') == true;
        }
    </script>
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <body>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
        <div id="divSearchCustomer" style="margin: 10px 0 0 5px" runat="server">
            Search Customers 
            <table style="width: 1040px">
                <tr>
                    <td>
                        <table style="width: 1040px">
                            <tr>
                                <td>Customer ID
                                    <br />
                                    <asp:TextBox ID="textBoxSearchCustomerID" runat="server"></asp:TextBox>
                                </td>
                                <td>First Name
                                    <br />
                                    <asp:TextBox ID="textBoxSearchFirstName" runat="server"></asp:TextBox></td>
                                <td>Last Name
                                    <br />
                                    <asp:TextBox ID="textBoxSearchLastName" runat="server"></asp:TextBox></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width: 1040px">
                            <tr>
                                <td>Email                                   
                                    <br />
                                    <asp:TextBox ID="textBoxSearchEmail" runat="server"></asp:TextBox>
                                </td>
                                <td>Phone
                                    <br />
                                    <asp:TextBox ID="textBoxSearchPhone" runat="server"></asp:TextBox></td>
                                <td style="width: 350px"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="float: right">
                        <asp:Button ID="buttonSearch" Text="Search" runat="server" OnClick="buttonSearch_Click" />
                        <asp:Button ID="buttonSerachClear" Text="Clear" runat="server" OnClick="buttonSerachClear_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <asp:Button ID="buttonAddCustomer" runat="server" Text="Add Customer" OnClick="buttonAddCustomer_Click" Style="float: right; margin-right: 50px;" />
        <br />
        <br />
        <div style="margin: 20px 0 0 10px;">
            <asp:GridView ID="gridviewCustomers" runat="server" CellPadding="4" AutoGenerateColumns="False" OnRowCommand="gridviewCustomers_RowCommand"
                HeaderStyle-BackColor="#61A6F8"
                HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
                TabIndex="0">
                <Columns>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:ImageButton ID="imageButtonUpdate" runat="server" Height="20px" Width="20px"
                                ImageUrl="~/Images/Edit.jpg" CommandArgument='<%#Eval("CustomerID")%>'
                                CommandName="UpdateCustomer" Text="Update" CssClass="gridbuttonn" CausesValidation="false" />
                            <asp:ImageButton ID="linkButtonDelete" runat="server" ImageUrl="~/Images/delete.jpg" CommandArgument='<%#Eval("CustomerID")%>'
                                Height="20px" Width="20px" CommandName="DeleteCustomer" Text="Delete" CssClass="gridbuttonn" CausesValidation="false" />

                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Customer ID">
                        <ItemTemplate>
                            <asp:Label ID="labelCustomerID" runat="server" Text='<%#Eval("CustomerID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label ID="labelFirstName" runat="server" Text='<%#Eval("FirstName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label ID="labelLastName" runat="server" Text='<%#Eval("LastName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Amount">
                        <ItemTemplate>
                            <asp:Label ID="labelAmount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Payment Status">
                        <ItemTemplate>
                            <asp:Label ID="labelPaymentStatus" runat="server" Text='<%#Eval("PaymentStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Suscription">
                        <ItemTemplate>
                            <asp:Label ID="labelSuscription" runat="server" Text='<%#Eval("Suscription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Brand Name">
                        <ItemTemplate>
                            <asp:Label ID="labelBrand" runat="server" Text='<%#Eval("Brand") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Created Date">
                        <ItemTemplate>
                            <asp:Label ID="labelCreatedDate" runat="server" Text='<%#Eval("CreatedDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Created By">
                        <ItemTemplate>
                            <asp:Label ID="labelCreatedBy" runat="server" Text='<%#Eval("CreatedBy") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IsActive">
                        <ItemTemplate>
                            <asp:LinkButton ID="linkButtonIsActive" runat="server" Text='<%#Eval("Status").ToString() == "0" ? "InActive" : "Active" %>'
                                CommandName="UpdateActiveCustomer" CommandArgument='<%#Eval("CustomerID")%>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <span class="norecords">No Records Found </span>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
        <asp:UpdatePanel ID="UpdatePanelListCat" runat="server">
            <ContentTemplate>
                <div id="divAddCustomer" runat="server" visible="false" style="width: 1040px; margin: 20px 0 0 10px; border: 1px solid black">
                    <br />
                    <b>
                        <asp:Label ID="labelCustomerTitle" runat="server" Text="Add Customer"></asp:Label>
                        : </b>
                    <br />
                    <br />
                    <div style="float: right; width: 1040px">
                        <asp:Button ID="ButtonWelcomeEmail" runat="server" Text="Welcome Email" OnClick="ButtonWelcomeEmail_OnClick" />
                        <asp:Button ID="ButtonInvoiceEmail" runat="server" Text="Invice Email" OnClick="ButtonInvoiceEmail_OnClick" />
                    </div>
                    <br />
                    <br />
                    Personal Details
            <table style="width: 1040px">
                <tr>
                    <td>
                        <table style="width: 1040px;">
                            <tr>
                                <td>First Name *
                                    <br />
                                    <asp:TextBox ID="textBoxFirstName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="textBoxFirstName" Text="*" ForeColor="Red" ValidationGroup="validaiton" /><br />
                                </td>
                                <td>Last Name *
                                    <br />
                                    <asp:TextBox ID="textBoxLastName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rFLastName" runat="server" ControlToValidate="textBoxLastName" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                    <br />
                                </td>
                                <td>Email *                             
                                    <br />
                                    <asp:TextBox ID="textBoxEmail" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="textBoxEmail" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                    <br />
                                    <asp:RegularExpressionValidator ID="revEmail" ControlToValidate="textBoxEmail" runat="server" ValidationGroup="validaiton" ForeColor="Red"
                                        ErrorMessage="Invalid Email" ValidationExpression="\s*\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\s*"></asp:RegularExpressionValidator>
                                </td>
                                <td>Phone1 *
                                    <br />
                                    <asp:TextBox ID="textBoxPhone1" runat="server" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPhone1" runat="server" ControlToValidate="textBoxPhone1" Text="*" ForeColor="Red" ValidationGroup="validaiton" /><br />
                                    <asp:RegularExpressionValidator ID="revPhone1" ControlToValidate="textBoxPhone1" runat="server" ForeColor="Red" ValidationGroup="validaiton" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width: 1040px;">
                            <tr>
                                <td>Phone2
                                    <br />
                                    <asp:TextBox ID="textBoxPhone2" runat="server" TextMode="Number" MaxLength="10"></asp:TextBox></td>
                                <td>Address *
                                    <br />
                                    <asp:TextBox ID="textBoxAddress" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="textBoxAddress" Text="*" ForeColor="Red" ValidationGroup="validaiton" />

                                </td>
                                <td>Country *<br />
                                    <asp:DropDownList ID="dropDownListCountry" runat="server" Width="170px" AutoPostBack="true" OnSelectedIndexChanged="dropDownListCountry_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfCountry" runat="server" ControlToValidate="dropDownListCountry" InitialValue="0" Text="*" ForeColor="Red" ValidationGroup="validaiton" />

                                </td>
                                <td>State *
                        <br />
                                    <asp:DropDownList ID="dropDownListState" runat="server" Width="170px"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="dropDownListState" InitialValue="0" Text="*" ForeColor="Red" ValidationGroup="validaiton" />

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width: 1040px;">
                            <tr>
                                <td>City *
                        <br />
                                    <asp:TextBox ID="textBoxCity" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="textBoxCity" Text="*" ForeColor="Red" ValidationGroup="validaiton" />

                                </td>
                                <td>Zipcode *
                        <br />
                                    <asp:TextBox ID="textBoxZipcode" runat="server" MaxLength="5"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfZipcode" runat="server" ControlToValidate="textBoxZipcode" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="textBoxZipcode" ForeColor="Red" runat="server" ValidationGroup="validaiton" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>

                                </td>
                                <td>Location *
                        <br />
                                    <asp:TextBox ID="textBoxLocation" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="textBoxLocation" Text="*" ForeColor="Red" ValidationGroup="validaiton" />

                                </td>
                                <td>Brand *
                        <br />
                                    <asp:DropDownList ID="dropDownListBrand" runat="server" Width="170px"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfBrand" runat="server" ControlToValidate="dropDownListBrand" InitialValue="0" Text="*" ForeColor="Red" ValidationGroup="validaiton" />

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>


                    <br />
                    <div id="divSubscriptonAndPayment" runat="server" style="width: 1020px; margin: 20px 0 5px 10px; border: 1px solid black">
                        <br />
                        <div style="margin: 10px 10px 0 5px; width: 1000px; overflow-x: auto" id="divEarlierSubscriptionandPayment" runat="server" visible="false">
                            Earlier Subscriptions:
                            <br />
                            <br />
                            <asp:GridView ID="gvDetails" runat="server"
                                AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#61A6F8"
                                HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                                <Columns>
                                    <asp:BoundField DataField="CustomerID" ReadOnly="true" HeaderText="Customer ID" />
                                    <asp:BoundField DataField="PCs" ReadOnly="true" HeaderText="PCs" />
                                    <asp:BoundField DataField="Year" ReadOnly="true" HeaderText="Year" />
                                    <asp:BoundField DataField="Month" ReadOnly="true" HeaderText="Month" />
                                    <asp:BoundField DataField="StartDate" ReadOnly="true" HeaderText="StartDate" />
                                    <asp:BoundField DataField="EndDate" ReadOnly="true" HeaderText="EndDate" />
                                    <asp:BoundField DataField="RenewedBy" ReadOnly="true" HeaderText="Renewed By" />
                                    <asp:BoundField DataField="FixedPrice" ReadOnly="true" HeaderText="Fixed Price" />
                                    <asp:BoundField DataField="DiscountAmount" ReadOnly="true" HeaderText="Discount Amount" />
                                    <asp:BoundField DataField="DiscountCodesName" ReadOnly="true" HeaderText="DiscountCode sName" />
                                    <asp:BoundField DataField="DiscountCode" ReadOnly="true" HeaderText="Discount Code" />
                                    <asp:BoundField DataField="OtherAmount" ReadOnly="true" HeaderText="Other Amount" />
                                    <asp:BoundField DataField="Notes" ReadOnly="true" HeaderText="Notes" />
                                    <asp:BoundField DataField="PaymentType" ReadOnly="true" HeaderText="Payment Type" />
                                    <asp:BoundField DataField="Gateway" ReadOnly="true" HeaderText="Gateway" />
                                    <asp:BoundField DataField="PaymentStatus" ReadOnly="true" HeaderText="Payment Status" />
                                    <asp:BoundField DataField="CardType" ReadOnly="true" HeaderText="Card Type" />
                                    <asp:BoundField DataField="CardOrChequeNo" ReadOnly="true" HeaderText="CardOrCheque No" />
                                    <asp:BoundField DataField="ExpMonth" ReadOnly="true" HeaderText="Exp Month" />
                                    <asp:BoundField DataField="ExpYear" ReadOnly="true" HeaderText="Exp Year" />
                                    <asp:BoundField DataField="RoutingNo" ReadOnly="true" HeaderText="Routing No" />
                                    <asp:BoundField DataField="AccountNumber" ReadOnly="true" HeaderText="Account Number" />
                                    <asp:BoundField DataField="TransactionId" ReadOnly="true" HeaderText="Transaction Id" />
                                    <asp:BoundField DataField="Amount" ReadOnly="true" HeaderText="Amount" />
                                </Columns>
                            </asp:GridView>
                        </div>
                        <br />
                        Subscription Details<br />
                        <table style="margin: 10px 0 0 10px; width: 1040px">
                            <tr>
                                <td>PC's *
                                    <br />
                                    <asp:TextBox ID="textBoxPCs" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPCs" runat="server" ControlToValidate="textBoxPCs" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="textBoxPCs" runat="server" ForeColor="Red" ValidationGroup="validaiton" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                </td>
                                <td>Year *
                                    <br />
                                    <asp:TextBox ID="textBoxYear" runat="server" OnTextChanged="textBoxYearOrMonth_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvYear" runat="server" ControlToValidate="textBoxYear" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="textBoxYear" runat="server" ForeColor="Red" ValidationGroup="validaiton" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>

                                </td>
                                <td>Month *
                                    <br />
                                    <asp:TextBox ID="textBoxMonth" runat="server" OnTextChanged="textBoxYearOrMonth_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvMonth" runat="server" ControlToValidate="textBoxMonth" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="textBoxMonth" runat="server" ForeColor="Red" ValidationGroup="validaiton" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                </td>
                                <td>Start Date
                                    <br />
                                    <div style="width: 200px">
                                        <asp:TextBox ID="textBoxStartDate" runat="server" Enabled="false"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonStartDate" runat="server" class="calendar-img" Visible="false"
                                            Width="27px" Height="27" ImageUrl="~/images/Calendar.png" Style="outline: none; margin: 0 0 0 2px; float: right;"
                                            ImageAlign="left" />
                                        <asp:HiddenField ID="hiddenFieldYearandMonth" runat="server" />
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtenderStartDate" runat="server"
                                            Enabled="True" PopupButtonID="ImageButtonStartDate" TargetControlID="textBoxStartDate" PopupPosition="BottomLeft"
                                            Format="dd-MM-yyyy" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>End Date
                                    <br />
                                    <div style="width: 200px">
                                        <asp:TextBox ID="textBoxEndDate" runat="server" Enabled="false"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButtonEndDate" runat="server" class="calendar-img" Visible="false"
                                            Width="27px" Height="27" ImageUrl="~/images/Calendar.png" Style="outline: none; margin: 0 0 0 2px; float: right;"
                                            ImageAlign="left" />
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtenderEndDate" runat="server"
                                            Enabled="True" PopupButtonID="ImageButtonEndDate" TargetControlID="textBoxEndDate" PopupPosition="BottomLeft"
                                            Format="dd-MM-yyyy" />
                                    </div>
                                </td>
                                <td>Renewed By 
                                    <br />
                                    <asp:DropDownList ID="dropDownListRenwedBy" runat="server" Width="170px">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Other" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>Fixed Prices *
                        <br />
                                    <asp:TextBox ID="textBoxFixedPrices" runat="server" AutoPostBack="true" OnTextChanged="textBoxFixedPrices_OnTextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFixedPrice" runat="server" ControlToValidate="textBoxFixedPrices" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="textBoxFixedPrices" ForeColor="Red" runat="server" ValidationGroup="validaiton" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                </td>
                                <td>Discount Amount *
                                    <br />
                                    <asp:TextBox ID="textBoxDiscountAmount" runat="server" AutoPostBack="true" OnTextChanged="textBoxFixedPrices_OnTextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDiscountAmount" runat="server" ControlToValidate="textBoxDiscountAmount" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="textBoxDiscountAmount" ForeColor="Red" runat="server" ValidationGroup="validaiton" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Discount Codes Name *
                                    <br />
                                    <asp:TextBox ID="textBoxDiscountCodesName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDiscountCodesName" runat="server" ControlToValidate="textBoxDiscountCodesName" Text="*" ForeColor="Red" ValidationGroup="validaiton" />

                                </td>
                                <td>Discount Code * 
                        <br />
                                    <asp:TextBox ID="textBoxDiscountCode" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDiscountCode" runat="server" ControlToValidate="textBoxDiscountCode" Text="*" ForeColor="Red" ValidationGroup="validaiton" />

                                </td>
                                <td>Other Amount * 
                        <br />
                                    <asp:TextBox ID="textBoxOtherAmunt" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvOtherAmunt" runat="server" ControlToValidate="textBoxOtherAmunt" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="textBoxOtherAmunt" ForeColor="Red" runat="server" ValidationGroup="validaiton" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>

                                </td>
                                <td>Notes 
                        <br />
                                    <asp:TextBox ID="textBoxNotes" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        Payment Details
            <table style="margin: 10px 0 0 10px; width: 1040px">
                <tr>
                    <td>Payment Type *
                                    <br />
                        <asp:DropDownList ID="dropDownListPaymentType" runat="server" Width="170px" AutoPostBack="true" OnSelectedIndexChanged="dropDownListPaymentType_OnSelectedIndexChanged">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                            <asp:ListItem Value="1">ZELLE</asp:ListItem>
                            <asp:ListItem Value="2">Card</asp:ListItem>
                            <asp:ListItem Value="3">Cheque</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvPaymentType" runat="server" ControlToValidate="dropDownListPaymentType" InitialValue="0" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                    </td>
                    <td>Gateway *
                                    <br />
                        <asp:DropDownList ID="dropDownListGateway" runat="server" Width="170px">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                            <asp:ListItem Value="1">AdvanceIT ECS Payments</asp:ListItem>
                            <asp:ListItem Value="2">AdvanceIT PayPal</asp:ListItem>
                            <asp:ListItem Value="3">AdvanceIT Authorize.net</asp:ListItem>
                            <asp:ListItem Value="4">AdvanceIT Physical</asp:ListItem>
                            <asp:ListItem Value="5">AdvanceIT ZELLE</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvLstGateway" runat="server" ControlToValidate="dropDownListGateway" InitialValue="0" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                    </td>
                    <td>Payment Status *
                                    <br />
                        <asp:DropDownList ID="dropDownListPaymentStatus" runat="server" Width="170px">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                            <asp:ListItem Value="1">Pending</asp:ListItem>
                            <asp:ListItem Value="2">Partial</asp:ListItem>
                            <asp:ListItem Value="3">Paid</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvPaymentStatus" runat="server" ControlToValidate="dropDownListPaymentStatus" InitialValue="0" Text="*" ForeColor="Red" ValidationGroup="validaiton" />

                    </td>

                    <td>Transaction Id 
                        <br />
                        <asp:TextBox ID="textBoxTransactionId" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <div id="divCardOrChequeNo" runat="server">
                            Card/Cheque No *
                                    <br />
                            <asp:TextBox ID="textBoxCardOrChequeNo" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCardOrChequeNo" runat="server" ControlToValidate="textBoxCardOrChequeNo" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                        </div>
                    </td>
                    <td>
                        <div id="divCardType" runat="server">
                            Card Type *
                                    <br />
                            <asp:DropDownList ID="dropDownListCardType" runat="server" Width="170px">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">Credit</asp:ListItem>
                                <asp:ListItem Value="2">Debit</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvListCardType" runat="server" ControlToValidate="dropDownListCardType" InitialValue="0" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                        </div>
                    </td>

                    <td>
                        <div id="divExpMonth" runat="server">
                            Exp Month *
                                    <br />
                            <asp:TextBox ID="textBoxExpMonth" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvBoxExpMonth" runat="server" ControlToValidate="textBoxExpMonth" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="textBoxExpMonth" runat="server" ForeColor="Red" ValidationGroup="validaiton" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                        </div>
                    </td>
                    <td>
                        <div id="divExpYear" runat="server">
                            Exp Year *
                                    <br />
                            <asp:TextBox ID="textBoxExpYear" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvExpYear" runat="server" ControlToValidate="textBoxExpYear" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="textBoxExpYear" runat="server" ForeColor="Red" ValidationGroup="validaiton" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td>Amount *
                                    <br />
                        <asp:TextBox ID="textBoxAmount" runat="server" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAmount" runat="server" ControlToValidate="textBoxAmount" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ControlToValidate="textBoxAmount" runat="server" ForeColor="Red" ValidationGroup="validaiton" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator>

                    </td>
                    <td>
                        <div id="divAccountNo" runat="server">
                            Account No *
                                    <br />
                            <asp:TextBox ID="textBoxAccountNo" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAccountNo" runat="server" ControlToValidate="textBoxAccountNo" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                        </div>
                    </td>

                    <td>
                        <div id="divRoutingNo" runat="server">
                            Rounting No *
                                    <br />
                            <asp:TextBox ID="textBoxRoutingNo" runat="server">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvRoutingNo" runat="server" ControlToValidate="textBoxRoutingNo" Text="*" ForeColor="Red" ValidationGroup="validaiton" />
                        </div>
                    </td>
                </tr>
                <table>
                    <tr>
                        <td colspan="3">
                            <asp:CheckBox ID="checkBoxUpgrade" runat="server" Visible="false" Text="Upgrade to New Subscription and Payment" onChange="callVerify(this);" />
                            <asp:HiddenField ID="hiddenFieldCustomerSubscriptionPaymentID" runat="server" />
                        </td>
                    </tr>
                </table>
            </table>

                    </div>
                    <br />
                    <div>
                        <asp:Button ID="buttonSumbit" Text="Submit" runat="server" OnClick="buttonSubmit_Click" ValidationGroup="validaiton" />
                        <asp:Button ID="buttonCancel" Text="Cancel" runat="server" OnClick="buttonCancel_Click" CausesValidation="false" />
                    </div>

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </body>
    </html>
</asp:Content>
