<?php
function bubble_sort($arr) {
    for ($i = 0; $i < (count($arr) - 1); $i++) {
        for ($z = 0; $z < (count($arr) - 1); $z++) {
            if ($arr[$z] < $arr[$z+1]) {
                $temp = $arr[$z+1];
                $arr[$z+1] = $arr[$z];
                $arr[$z] = $temp;
            }
        }
    }
    return $arr;
}


echo ("Array 1:\n");
$array1 = [1,7,3,6,8,9];
print_r($array1);

echo ("Array 2:\n");
$array2 = [1,3,1,9,12,3];
print_r($array2);

echo ("Sorting array 1...");
print_r(bubble_sort($array1));

echo ("Sorting array 2...");
print_r(bubble_sort($array2));

