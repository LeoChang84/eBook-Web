<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AccountMgt.aspx.cs" Inherits="eBookweb.AccountMgt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH4Admin" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2>帳戶管理系統</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="lbActUserName" runat="server" CssClass="col-md-2 control-label" Text="新增帳號:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbActUserName" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVActUserName" CssClass="text-danger" runat="server" ErrorMessage="請填入帳號" ControlToValidate="tbActUserName"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbActPwd" runat="server" CssClass="col-md-2 control-label" Text="新增密碼:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbActPwd" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVActPwd" CssClass="text-danger" runat="server" ErrorMessage="請填入密碼" ControlToValidate="tbActPwd"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbActEmail" runat="server" CssClass="col-md-2 control-label" Text="新增信箱:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbActEmail" CssClass="form-contorl" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVActEmail" CssClass="text-danger" runat="server" ErrorMessage="請填入信箱" ControlToValidate="tbActEmail"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btActUpload" runat="server" Text="新增至資料庫" CssClass="btn btn-default" OnClick="btActUploadn_Click" ></asp:Button>
                    <asp:Label ID="lbActmsg" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <h2>帳號管理名單</h2>
        <div class = "panel panel-default">
           <div class = "panel-heading">Panel Heading</div>
   
            <asp:Repeater ID="RtrAct" runat="server">
                <HeaderTemplate>
                    <table class = "table">
                        <thead> 
                            <tr>
                             <th>帳號</th>
                             <th>密碼</th>
                             <th>信箱</th>
                             <th>修改</th>
                          </tr>
                        </thead> 
                        <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%# Eval("Username") %></td>
                        <td><%# Eval("Password") %></td>
                        <td><%# Eval("Email") %></td>
                        <td><asp:Button ID="Button1" runat="server" Text="Button" /></td>
                    </tr>

                </ItemTemplate>

                <FooterTemplate>
                        </tbody>
                    </table>
                </FooterTemplate>

            </asp:Repeater>
        </div>
    </div>

</asp:Content>
