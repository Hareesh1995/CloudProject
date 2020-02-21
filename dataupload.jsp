<%@ page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*"%>


<html>
<head>
<link rel="stylesheet" type="text/css" href="styl.css">
<title>SKERA</title>
</head>
<body>

<table border="0" width="100%" height="100%" bgcolor="#FEF0C9">
<tr align="center" height="15%" bgcolor="#7755C9">
<td colspan="3"><h1>STRONG KEY ORIENTATION FLEXIBLE AUDITING FOR SECURE CLOUD STORAGE</h1></td></tr>
<tr><td width="15%"></td>
<td width="*" align="center">
<table border="0" width="60%" height="60%" cellspacing="0" style="padding-left: 10px">
<form name="logfrm" method="post" action="laoddata.jsp" onsubmit="fnc();">

<tr align="center"><td colspan="2" bgcolor="#FF7F24"><h3>Data Upload form</h3></td></tr>
    <tr bgcolor="#FFF68F"><td width="40%">File</td><td><input type="file" name="filep" value="samp"/></td></tr>
<tr bgcolor="#FFF68F"><td width="40%">Secret key</td><td><input type="password" name="seckey"/></td></tr>
<tr bgcolor="#FFF68F"><td colspan="2" align="center"><input type="submit" value="Upload"/></td></tr>
</form>
</table>
    </td>
<td width="15%"></td>    </tr>
<tr align="center" height="15%" bgcolor="#7755C9">
<td colspan="3"><h1>&nbsp;</h1></td></tr></table>

</body>
</html>