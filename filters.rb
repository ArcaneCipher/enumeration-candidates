# This file defines methods to filter and sort candidates
# Keeping these methods separate from the main program helps with modularity and reusability.

require "date"  # Required for handling date calculations

# Finds a candidate by their unique ID.
# @param id [Integer] The candidate's ID.
# @return [Hash, nil] The candidate's hash if found, otherwise nil.
def find(id)
  @candidates.find { |candidate| candidate[:id] == id }
end

# Determines if a candidate is considered "experienced".
# A candidate is experienced if they have at least 2 years of work experience.
# @param candidate [Hash] A candidate's data.
# @return [Boolean] True if the candidate has 2 or more years of experience, otherwise false.
def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

# Filters and returns only "qualified" candidates based on multiple criteria:
# - Must be experienced (2+ years of experience).
# - Must have 100 or more GitHub points.
# - Must know either Ruby or Python.
# - Must have applied within the last 15 days.
# - Must be at least 18 years old.
# @param candidates [Array<Hash>] The collection of candidates.
# @return [Array<Hash>] A list of candidates who meet all qualification criteria.
def qualified_candidates(candidates)
  candidates.select do |candidate|  # Use parameter instead of instance variable for better function reusability
    experienced?(candidate) &&
      candidate[:github_points] >= 100 &&
      (candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")) &&
      candidate[:date_applied] > (Date.today - 15) &&
      candidate[:age] >= 18
  end
end

# Sorts candidates by qualifications in the following order:
# - Candidates with the most years of experience appear first.
# - If candidates have the same years of experience, they are sorted by their GitHub points (highest first).
# @param candidates [Array<Hash>] The collection of candidates.
# @return [Array<Hash>] A list of candidates sorted by experience and GitHub points.
def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end
