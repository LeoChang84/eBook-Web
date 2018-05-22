<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AccountMgt.aspx.cs" Inherits="eBookweb.AccountMgt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH4Admin" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2>帳戶管理系統</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="lbActAddUserName" runat="server" CssClass="col-md-2 control-label" Text="新增帳號:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbActAddUserName" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVActAddUserName" CssClass="text-danger" runat="server" ErrorMessage="請填入帳號" ControlToValidate="tbActAddUserName"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbActAddUserEmail" runat="server" CssClass="col-md-2 control-label" Text="新增信箱:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbActAddUserEmail" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RVFActAddUserEmail" CssClass="text-danger" runat="server" ErrorMessage="請填入信箱" ControlToValidate="tbActAddUserEmail"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbActAddUserUnder" runat="server" CssClass="col-md-2 control-label" Text="新增隸屬單位/大隊:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbActAddUserUnder" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVActAddUserUnder" CssClass="text-danger" runat="server" ErrorMessage="請填入局長室/第O救護大隊" ControlToValidate="tbActAddUserUnder"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbActAddUserDepartment" runat="server" CssClass="col-md-2 control-label" Text="新增隸屬科室/分隊:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbActAddUserDepartment" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVActAddUserDepartment" CssClass="text-danger" runat="server" ErrorMessage="請填入單位/分隊名稱" ControlToValidate="tbActAddUserDepartment"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbActAddUserPassword" runat="server" CssClass="col-md-2 control-label" Text="新增密碼:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbActAddUserPassword" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVActPassword" CssClass="text-danger" runat="server" ErrorMessage="請填入密碼" ControlToValidate="tbActAddUserPassword"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btActUpload" runat="server" Text="新增至資料庫" CssClass="btn btn-default" OnClick="btActUpload_Click" ></asp:Button>
                    <asp:Label ID="lbActmsg" runat="server" Text=""></asp:Label>
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
            <asp:GridView ID="gvAct" runat="server" AutoGenerateColumns="False"  ShowHeaderWhenEmpty="True" Height="250px" Width="100%" OnRowEditing="gvAct_RowEditing" OnRowCancelingEdit="gvAct_RowCancelingEdit" OnRowUpdating="gvAct_RowUpdating" OnRowDeleting="gvAct_RowDeleting" DataKeyNames="UserId"  >
                <Columns>
                    <asp:TemplateField HeaderText="帳號">
                        <ItemTemplate>
                            <asp:Label ID="lbActUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditActUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterEditActUserName" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="信箱">
                        <ItemTemplate>
                            <asp:Label ID="lbActUserEmail" runat="server" Text='<%# Eval("UserEmail") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditActUserEmail" runat="server" Text='<%# Eval("UserEmail") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterEditActUserEmail" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="隸屬大隊/單位">
                        <ItemTemplate>
                            <asp:Label ID="lbActUserUnder" runat="server" Text='<%# Eval("UserUnder") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditUserActUserUnder" runat="server" Text='<%# Eval("UserUnder") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterActUserUnder" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="隸屬分隊/科室">
                        <ItemTemplate>
                            <asp:Label ID="lbActUserDepartment" runat="server" Text='<%# Eval("UserDepartment") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditUserActUserDepartment" runat="server" Text='<%# Eval("UserDepartment") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterActUserDepartment" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="密碼">
                        <ItemTemplate>
                            <asp:Label ID="lbActUserPassword" runat="server" Text='<%# Eval("UserPassword") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditUserActPassword" runat="server" Text='<%# Eval("UserPassword") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterActPassword" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>


                
                    <asp:TemplateField  HeaderText="類別">
                        <ItemTemplate>
                            <asp:Label ID="lbActUserType" runat="server" Text='<%# Eval("UserType") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbActUserType" runat="server" Text='<%# Eval("UserType") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterActEditUserType" runat="server"></asp:TextBox>
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
        <asp:Label ID="lbActerrormsg" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <br />
         
    </div>

</asp:Content>
