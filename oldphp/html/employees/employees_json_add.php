<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>CRUD Operation using JSON File in PHP</title>
</head>
<body>
<?php
if (isset($_POST['btnadd'])) {
    $data = file_get_contents('employees.json');
    $data = json_decode($data, true);
    $add_arr = array(
        'name' => $_POST['txtName'],
        'interests' => explode(',', $_POST['txtInterests']),
    );
    $data[] = $add_arr;

    $data = json_encode($data, JSON_PRETTY_PRINT);
    file_put_contents('employees.json', $data);

    header('location: employees_json_fetchall.php');
}
?>
<form method="post" name="frmAdd">
    <table align="center">
        <tr>
            <td colspan="2" align="center">Add Record</td>
        </tr>

        <tr>
            <td>Name</td>
            <td><input type="text" name="txtName"></td>
        </tr>
        <tr>
            <td>Interests (comma separated)</td>
            <td><input type="text" name="txtInterests"></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="Add" name="btnadd"></td>
        </tr>
    </table>
</form>
</body>