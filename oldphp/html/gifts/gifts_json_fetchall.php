<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>CRUD Operation on JSON File using PHP</title>
</head>
<body>
<table border="1" align="center">
    <tr>
        <td colspan="8" align="right"><a href="gifts_json_add.php">Add</a></td>
    </tr>
    <tr>
        <td>Name</td>
        <td colspan="7">Categories</td>
    </tr>
    <?php
    $data = file_get_contents('gifts.json');
    $data = json_decode($data);
    $index = 1;
    if (!empty($data)) {
        foreach ($data as $row) {
            if (isset($row) && !empty($row)) { ?>
                <tr>
                    <td><?php echo $row->name; ?></td>
                    <?php
                    $count = 0;
                    if (isset($row->categories)) {
                        foreach ($row->categories as $i) {
                            $count++;
                            ?>
                            <td><?php echo $i; ?></td>
                        <?php }
                    }
                    for ($c = $count; $c < 6; $c++) {
                        ?>
                        <td>&nbsp;</td>
                    <?php } ?>
                    <td><a href="gifts_json_update.php?edit_id=<?php echo $index; ?>">Edit</a>&nbsp;
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