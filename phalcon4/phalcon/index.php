<?php

use Phalcon\Mvc\Micro;

$app = new Micro();

$app->handle(
    $_SERVER["REQUEST_URI"]
);