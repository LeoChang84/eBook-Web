<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="eBookweb.AddBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH4Admin" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2>上傳新書</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="lbAddName" runat="server" CssClass="col-md-2 control-label" Text="輸入檔案名稱:"></asp:Label>
                <div class="col-md-3">
                   <asp:TextBox ID="tbAddName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVAddName" CssClass="text-danger" runat="server" ErrorMessage="填入檔案名稱" ControlToValidate="tbAddName"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbAddCat" runat="server" CssClass="col-md-2 control-label" Text="選擇檔案類別:"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlCat" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RFVAddCat" CssClass="text-danger" runat="server" ErrorMessage="請選擇檔案類別" ControlToValidate="ddlCat" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbAddLink" runat="server" CssClass="col-md-2 control-label" Text="輸入檔案連結:"></asp:Label>
                <div class="col-md-3">
                   <asp:TextBox ID="tbAddLink" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVAddLink" CssClass="text-danger" runat="server" ErrorMessage="填入檔案連結" ControlToValidate="tbAddLink"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btAddUpload" runat="server" Text="新增至資料庫" CssClass="btn btn-default" OnClick="btAddUpload_Click"></asp:Button>
                    <asp:Label ID="lbAddmsg" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
