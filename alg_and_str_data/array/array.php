<?php
    $array1 = [1,2,3,4,5];

    echo("Show elements:\n");

    for ($i = 0; $i <  count($array1); $i++) {
        echo($array1[$i] . "\n");
    }

    echo('Work with array element:' . ($array1[1] + $array1[0]) . "\n");

    array_push($array1,'Hello');

    echo("Add el to array...\n");

    echo("Show elements:\n");

    for ($i = 0; $i <  count($array1); $i++) {
        echo($array1[$i] . "\n");
    }
?>