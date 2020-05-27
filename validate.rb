# frozen_string_literal: true

# File created 05/25/2020 by Yifan Yao
# Created 05/26/2020 by Yifan Yao
class Validate

  # Created 05/25/2020 by Yifan Yao
  def card_validation(arr1, arr2, arr3)
    result = [false, false, false, false]
    (0..3).each { |i|
      res = (arr1[i] == arr2[i]) && (arr2[i] == arr3[i]) && (arr1[i] == arr3[i])
      res1 = (arr1[i] != arr2[i]) && (arr2[i] != arr3[i]) && (arr1[i] != arr3[i])
      result[i] = res || res1
    }
    result.include? true
  end
  public :card_validation
end

