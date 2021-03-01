<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>CRUD Operation using JSON File in PHP</title>
</head>
<body>
<?php
$edit_id = $_GET['edit_id']-1;
//get json data
$data = file_get_contents('gifts.json');
$data_array = json_decode($data, true);
$row = $data_array[$edit_id];
?>
<?php
if(isset($_POST['btnUpdate']))
{

    $update_arr = array(
        'name' => $_POST['txtName'],
        'categories' => explode(',', $_POST['txtCategories'])
    );

    $data_array[$edit_id] = $update_arr;

    $data = json_encode($data_array, JSON_PRETTY_PRINT);
    file_put_contents('gifts.json', $data);

    header('location: gifts_json_fetchall.php');
}
?>

<form method="post" name="frmUpdate">
    <table align="center">
        <tr>
            <td colspan="2" align="center">Update Record</td>
        </tr>

        <tr>
            <td>Name</td>
            <td><input type="text" name="txtName" value="<?php echo $row['name'];?>"> </td>
        </tr>
       
        <tr>
            <td>Categories</td>
            <td><input type="text" name="txtCategories" value="<?php echo (isset($row['categories']) ? implode(',', $row['categories']) : "") ;?>"> </td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="Update" name="btnUpdate"> </td>
        </tr>
    </table>
</form>
</body>
</html>