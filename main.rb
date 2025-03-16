# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require "pp"
require "./candidates"
require "./filters"

## Function test code:

# ========== Pretty Print Preview ==========
puts "\n===== Pretty Print Preview ====="
pp @candidates
puts "====================================\n\n"

# ========== Testing experienced? Function ==========
puts "===== Testing: experienced? ====="
test_candidate = {id: 5, years_of_experience: 4, github_points: 293}
puts "Expect true: #{experienced?(test_candidate)}"
puts "Expect false: #{experienced?({id: 7, years_of_experience: 1, github_points: 145})}"
puts "====================================\n\n"

# ========== Testing find(id) Function ==========
puts "===== Testing: find(id) ====="
puts "Expect candidate with ID 5: #{find(5)}"
puts "Expect candidate with ID 13: #{find(13)}"
puts "Expect nil (ID not found): #{find(99)}"
puts "====================================\n\n"

# ========== Testing qualified_candidates Function ==========
puts "===== Testing: qualified_candidates ====="
puts "Expect only candidates who meet all requirements:"
pp qualified_candidates(@candidates)
puts "====================================\n\n"

# ========== Testing ordered_by_qualifications Function ==========
puts "===== Testing: ordered_by_qualifications ====="
puts "Expect candidates sorted by experience, then by GitHub points:"
pp ordered_by_qualifications(@candidates)
puts "====================================\n\n"
