<?php
function merge_sort($my_array){
    if(count($my_array) == 1 ) return $my_array;
    $mid = count($my_array) / 2;
    $left = array_slice($my_array, 0, $mid);
    $right = array_slice($my_array, $mid);
    $left = merge_sort($left);
    $right = merge_sort($right);
    return merge($left, $right);
  }
  function merge($left, $right){
    $res = array();
    while (count($left) > 0 && count($right) > 0){
      if($left[0] > $right[0]){
        $res[] = $right[0];
        $right = array_slice($right , 1);
      }else{
        $res[] = $left[0];
        $left = array_slice($left, 1);
      }
    }
    while (count($left) > 0){
      $res[] = $left[0];
      $left = array_slice($left, 1);
    }
    while (count($right) > 0){
      $res[] = $right[0];
      $right = array_slice($right, 1);
    }
    return $res;
  }


echo ("Array 1:\n");
$array1 = [1,7,3,6,8,9];
print_r($array1);

echo ("Array 2:\n");
$array2 = [1,3,1,9,12,3];
print_r($array2);

echo ("Sorting array 1...");
print_r(merge_sort($array1));

echo ("Sorting array 2...");
print_r(merge_sort($array2));

$arr = [1,2,3];
$arr[] = 4;

print_r($arr);