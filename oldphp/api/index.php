<?php

$pass = "NOT_FOUND";
$url = "";
$my_routes = array(
    "employees"                   => "employees",
    "gifts"                       => "employees",
);
$target_url = "";
$test_url = "";
$debug = false;


function contains(array $my_routes, string $SERVER_URL, bool $debug = false) : array {
    $url_parts = explode( "/" , $SERVER_URL );
    foreach($url_parts as $index_part_url => $part_url) {
        if ($debug) echo "$index_part_url.$part_url <br>";
        foreach($my_routes as $test => $target) {
            if ($part_url === "$test") {
                return array("target" => $target, "test" => $test);
                break;
            }
        }
    }
    return [];
}
if (
    isset( $_SERVER ) && sizeof($_SERVER) > 0
    && isset( $_POST ) && sizeof($_POST) === 0
    && isset( $_GET ) && sizeof($_GET) === 0
    && isset( $_SERVER["REQUEST_URI"] )
) {
    $SERVER_URL = "" . $_SERVER["REQUEST_URI"];
    if (sizeof(contains(array("debug" => true), $SERVER_URL )) > 0) $debug = true;

    if (strlen($SERVER_URL) === 1) {  # "/"

        $pass = "API_SERVE";
        $target_url = "default";
        $test_url = "default";

    } else {
        $new_target_test = contains($my_routes, $SERVER_URL, $debug );
        if (sizeof($new_target_test) > 0) {
            $target_url = $new_target_test["target"];
            $test_url = $new_target_test["test"];
            $pass = "API_SERVE";
        }
    }
}


if ($debug) echo "<br> 1." . $SERVER_URL;
if ($debug) echo "<br> 2." . $target_url;
if ($debug) echo "<br> 3." . $test_url;
if ($debug) echo "<br> 4." . $pass;


if ($pass === "API_SERVE") {
    // TODO Add subroutes
    $target_file = dirname(__FILE__) . "/$target_url/all.php";
    if (!file_exists($target_file)) {
        header("HTTP/1.0 404 Not Found");
        header("Location: /$target_url/?");
        die();
    }
    try {
        $file_contents_temp = file_get_contents($target_file);
    } catch (Exception $e) {
        header("HTTP/1.0 404 Not Found");
        header("Location: /$target_url/?");
        die();
    }
    header('Content-Language: en');
    header("referrer-policy: same-origin");
    header('Content-type: application/json');

   if (isset($_SERVER) && isset($_SERVER['HTTP_HOST'])) {
        $host = $_SERVER['HTTP_HOST'];
        if ($debug) echo "serve: file_contents";
        if ($debug) die();
        die($file_contents);
   }
   if ($debug) die();
}