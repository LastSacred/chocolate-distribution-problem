
class ChocolateDistributor
  def distribute_chocolate(input)
    test_cases = parse_test_cases(input)
    min_diffs = min_diffs(test_cases)
    format_output(min_diffs)
  end

  private

  def parse_test_cases(input)
    input_array = input.split("\n")
    input_array.shift.to_i
    test_cases = []
  
    until input_array.count == 0
      test_case_strings = input_array.shift(3)
      packets = test_case_strings[1].split(" ").map { |n| n.to_i }
      students_count = test_case_strings[2].to_i
      test_cases << {packets: packets, student_count: students_count}
    end
  
    test_cases
  end
  
  def format_output(min_diffs)
    min_diffs.join("\n")
  end
  
  def min_diffs(test_cases)
    test_cases.map do |test_case|
      packets = test_case[:packets].sort
      student_count = test_case[:student_count]
      last_packet = student_count - 1
      
      step = 0
      until student_count + step > packets.count
        diff = packets[last_packet + step] - packets[step]
        min_diff = diff if !min_diff || diff < min_diff
        step += 1
      end
  
      min_diff
    end
  end
end