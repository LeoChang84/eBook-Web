<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="FileMgt.aspx.cs" Inherits="eBookweb.FileMgt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH4Admin" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2>檔案管理系統</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="lbFileName" runat="server" CssClass="col-md-2 control-label" Text="輸入檔案名稱"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbFileName" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVFileName" CssClass="text-danger" runat="server" ErrorMessage="請填入檔案名稱" ControlToValidate="tbFileName"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbFileLink" runat="server" CssClass="col-md-2 control-label" Text="輸入檔案連結"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbFileLink" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVFileLink" CssClass="text-danger" runat="server" ErrorMessage="請填入檔案連結" ControlToValidate="tbFileLink"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbFileBrief" runat="server" CssClass="col-md-2 control-label" Text="輸入檔案簡述"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbFileBrief" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVFileBrief" CssClass="text-danger" runat="server" ErrorMessage="請填入檔案簡述" ControlToValidate="tbFileBrief"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btFileUpload" runat="server" Text="新增至資料庫" CssClass="btn btn-default" OnClick="btFileUpload_Click"></asp:Button>
                    <asp:Label ID="lbFilemsg" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <h2>帳號管理名單</h2>
        <div class = "panel panel-default">
           <div class = "panel-heading">Panel Heading</div>
   
            <asp:Repeater ID="RtrFile" runat="server">
                <HeaderTemplate>
                    <table class = "table">
                        <thead> 
                            <tr>
                             <th>名稱</th>
                             <th>連結</th>
                             <th>簡述</th>
                             <th>修改</th>
                          </tr>
                        </thead> 
                        <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%# Eval("Name") %></td>
                        <td><%# Eval("Link") %></td>
                        <td><%# Eval("Brief") %></td>
                        <td>刪除</td>
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
