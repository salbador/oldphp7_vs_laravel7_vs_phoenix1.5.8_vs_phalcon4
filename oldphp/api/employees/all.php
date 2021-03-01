<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>CRUD Operation on JSON File using PHP</title>
</head>
<body>
<table border="1" align="center">
    <tr>
        <td colspan="7" align="right"><a href="employees_json_add.php">Add</a></td>
    </tr>
    <tr>
        <td>Name</td>
        <td colspan="5">Interests</td>
    </tr>
    <?php
    $data = file_get_contents('employees.json');
    $data = json_decode($data);
    $index = 1;
    if (!empty($data)) {
        foreach ($data as $row) {
            if (isset($row) && !empty($row)) { ?>
                <tr>
                    <td><?php echo $row->name; ?></td>
                    <?php
                    $count = 0;
                    if (isset($row->interests)) {
                        foreach ($row->interests as $i) {
                            $count++;
                            ?>
                            <td><?php echo $i; ?></td>
                        <?php }
                    }
                    for ($c = $count; $c < 4; $c++) {
                        ?>
                        <td>&nbsp;</td>
                    <?php } ?>
                    <td><a href="employees_json_update.php?edit_id=<?php echo $index; ?>">Edit</a>&nbsp;
                        &nbsp;
                    </td>
                </tr>
                <?php
                $index++;
            }
        }
    }
    ?>
</table>
</body>
</html>