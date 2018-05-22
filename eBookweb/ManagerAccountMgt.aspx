<%@ Page Title="" Language="C#" MasterPageFile="~/ManagerMaster.Master" AutoEventWireup="true" CodeBehind="ManagerAccountMgt.aspx.cs" Inherits="eBookweb.ManagerAccountMgt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH4Admin" runat="server">
     <div class="container">
        <div class="form-horizontal">
            <h2>帳戶管理系統</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="lbManagerActAddUserName" runat="server" CssClass="col-md-2 control-label" Text="新增帳號:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbManagerActAddUserName" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVManagerActAddUserName" CssClass="text-danger" runat="server" ErrorMessage="請填入帳號" ControlToValidate="tbManagerActAddUserName"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbManagerActAddUserEmail" runat="server" CssClass="col-md-2 control-label" Text="新增信箱:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbManagerActAddUserEmail" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RVFManagerActAddUserEmail" CssClass="text-danger" runat="server" ErrorMessage="請填入信箱" ControlToValidate="tbManagerActAddUserEmail"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbManagerActAddUserUnder" runat="server" CssClass="col-md-2 control-label" Text="新增隸屬單位/大隊:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbManagerActAddUserUnder" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVManagerActAddUserUnder" CssClass="text-danger" runat="server" ErrorMessage="請填入局長室/第O救護大隊" ControlToValidate="tbManagerActAddUserUnder"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbManagerActAddUserDepartment" runat="server" CssClass="col-md-2 control-label" Text="新增隸屬科室/分隊:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbManagerActAddUserDepartment" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVManagerActAddUserDepartment" CssClass="text-danger" runat="server" ErrorMessage="請填入單位/分隊名稱" ControlToValidate="tbManagerActAddUserDepartment"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbManagerActAddUserPassword" runat="server" CssClass="col-md-2 control-label" Text="新增密碼:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbManagerActAddUserPassword" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVManagerActPassword" CssClass="text-danger" runat="server" ErrorMessage="請填入密碼" ControlToValidate="tbManagerActAddUserPassword"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btManagerActUpload" runat="server" Text="新增至資料庫" CssClass="btn btn-default" OnClick="btManagerActUpload_Click   " ></asp:Button>
                    <asp:Label ID="lbManagerActmsg" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    
        <h2>帳號管理名單</h2>
        <hr />
        <div class="row">  
            <div class="col-md-2 pull-right" aria-atomic="False">
                <asp:DropDownList ID="ddlDep" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDep_SelectedIndexChanged"></asp:DropDownList>
            </div>
        </div>
        <br />
        <div class = "panel panel-default">
            <div class = "panel-heading">Panel Heading</div>
            <asp:GridView ID="gvManagerAct" runat="server" AutoGenerateColumns="False"  ShowHeaderWhenEmpty="True" Height="250px" Width="100%" OnRowEditing="gvManagerAct_RowEditing" OnRowCancelingEdit="gvManagerAct_RowCancelingEdit" OnRowUpdating="gvManagerAct_RowUpdating" OnRowDeleting="gvManagerAct_RowDeleting" DataKeyNames="UserId" >
                <Columns>
                    <asp:TemplateField HeaderText="帳號">
                        <ItemTemplate>
                            <asp:Label ID="lbManagerActUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditManagerActUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterEditManagerActUserName" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="信箱">
                        <ItemTemplate>
                            <asp:Label ID="lbManagerActUserEmail" runat="server" Text='<%# Eval("UserEmail") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditManagerActUserEmail" runat="server" Text='<%# Eval("UserEmail") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterEditManagerActUserEmail" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="隸屬大隊/單位">
                        <ItemTemplate>
                            <asp:Label ID="lbManagerActUserUnder" runat="server" Text='<%# Eval("UserUnder") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditManagerActUserUnder" runat="server" Text='<%# Eval("UserUnder") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterManagerActUserUnder" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="隸屬分隊/科室">
                        <ItemTemplate>
                            <asp:Label ID="lbManagerActUserDepartment" runat="server" Text='<%# Eval("UserDepartment") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditManagerActUserDepartment" runat="server" Text='<%# Eval("UserDepartment") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterManagerActUserDepartment" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="密碼">
                        <ItemTemplate>
                            <asp:Label ID="lbManagerActUserPassword" runat="server" Text='<%# Eval("UserPassword") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditManagerActPassword" runat="server" Text='<%# Eval("UserPassword") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterManagerActPassword" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>


                
                    <asp:TemplateField  HeaderText="類別">
                        <ItemTemplate>
                            <asp:Label ID="lbManagerActUserType" runat="server" Text='<%# Eval("UserType") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditManagerActUserType" runat="server" Text='<%# Eval("UserType") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterManagerActEditUserType" runat="server"></asp:TextBox>
                        </FooterTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="imEdit" ImageUrl="~/Images/icon_edit.png" CommandName="edit" ToolTip="Edit" Width="20px" Height="20px" runat="server" CausesValidation="False" />
                            <asp:ImageButton ID="imDel" ImageUrl="~/Images/icon_delete.png" CommandName="delete" ToolTip="delete" Width="20px" Height="20px" runat="server" CausesValidation="False" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ID="imUpdate" ImageUrl="~/Images/icon_update.png" CommandName="update" ToolTip="update" Width="20px" Height="20px" runat="server" CausesValidation="False" />
                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images/icon_cancel.png" CommandName="cancel" ToolTip="cancel" Width="20px" Height="20px" runat="server" CausesValidation="False" />
                        </EditItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:Label ID="lbManagerActerrormsg" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <br />
         
    </div>

</asp:Content>
