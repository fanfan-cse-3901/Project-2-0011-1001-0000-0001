# frozen_string_literal: true

# File created 05/25/2020 by Yifan Yao

# Created 05/25/2020 by Yifan Yao
def validate(arr1, arr2, arr3)
  num_res = (arr1[0] == arr2[0]) && (arr2[0] == arr3[0]) && (arr1[0] == arr3[0])
  num_res1 = (arr1[0] != arr2[0]) && (arr2[0] != arr3[0]) && (arr1[0] != arr3[0])
  color_res = (arr1[1] == arr2[1]) && (arr2[1] == arr3[1]) && (arr1[1] == arr3[1])
  color_res1 = (arr1[1] != arr2[1]) && (arr2[1] != arr3[1]) && (arr1[1] != arr3[1])
  shade_res = (arr1[2] == arr2[2]) && (arr2[2] == arr3[2]) && (arr1[2] == arr3[2])
  shade_res1 = (arr1[2] != arr2[2]) && (arr2[2] != arr3[2]) && (arr1[2] != arr3[2])
  shape_res = (arr1[3] == arr2[3]) && (arr2[3] == arr3[3]) && (arr1[3] == arr3[3])
  shape_res1 = (arr1[3] != arr2[3]) && (arr2[3] != arr3[3]) && (arr1[3] != arr3[3])

  num_res || num_res1 || color_res || color_res1 || shade_res || shade_res1 || shape_res || shape_res1
end