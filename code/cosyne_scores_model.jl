# model of cosyne scoring

using Distributions, Random, Plots

μ_true = 6.5 # mean of all scores
# σ_true = 2.
# σ_reviewer = 1.
n_per_paper = 3 # number of reviewers per paper
n_papers = 1000 # total number of papers

# target statistics
σ_all_scores = 2.
ρ_pairs_of_scores = 0.25

function gen_scores(μ_true,σ_true,σ_reviewer,n_papers,n_per_paper)
    score_mat = zeros(n_papers,n_per_paper) # initialise array for mean_scores
    for i = 1:n_papers
        mean_score = μ_true .+ σ_true .* randn() # sample paper "true" mean score
        score_mat[i,:] = mean_score .+ σ_reviewer .* randn(n_per_paper)
    end
    return score_mat
end


# find parameters
σ_vec = (0:σ_all_scores/100: σ_all_scores)
ρ_pair_reviewers_test_vec = zeros(length(σ_vec))
for i = 1:length(σ_vec)
    σ_reviewer_test = σ_vec[i]
    σ_true_test = sqrt(σ_all_scores^2 - σ_reviewer_test^2)
    score_sample = gen_scores(μ_true,σ_true_test,σ_reviewer_test,n_papers,2)
    ρ_pair_reviewers_test_vec[i] = cor(score_sample[:,1],score_sample[:,2])
end
σ_reviewer = σ_vec[findmin(abs.(ρ_pair_reviewers_test_vec .-ρ_pairs_of_scores))[2]]
σ_true = sqrt(σ_all_scores^2 - σ_reviewer^2)

# calculate fraction of total score variance due to reviewer variability
percent_reviewer_noise = σ_reviewer^2 / σ_all_scores^2
print("Total fraction of variance due to reviewer noise = ",percent_reviewer_noise)


# do experiment on test-retest reliability of acceptance
acceptance_threshold = μ_true
true_mean_score_vec = sort(μ_true .+ σ_true .* randn(n_papers)) # sample papers "true" mean score
true_mean_score_percentile = (1/n_papers:1/n_papers:1)
paper_acceptance_probability_vec = zeros(n_papers)
n_meeting_realisations = 1000
for i = 1:n_papers
    acceptprob = 0.
    for j = 1:n_meeting_realisations
        scores = true_mean_score_vec[i] .+ σ_reviewer*randn(n_per_paper)
        if mean(scores)>acceptance_threshold
            acceptprob += 1/n_meeting_realisations
        end
    end
    paper_acceptance_probability_vec[i] = acceptprob
end

# conditional probability of getting in a second time if you got in once
accepted_at_least_once_count = 0
accepted_twice_count = 0
for i = 1:10000
    paper_mean = μ_true .+ σ_true*randn()
    scores = paper_mean .+ σ_reviewer*randn(n_per_paper)
    if mean(scores)>acceptance_threshold
        accepted_at_least_once_count +=1
        scores_again = paper_mean .+ σ_reviewer*randn(n_per_paper)
        if mean(scores_again)>acceptance_threshold
            accepted_twice_count += 1
        end
    end
end
conditional_probability_accepted_twice_given_accepted_once = accepted_twice_count/accepted_at_least_once_count

# plot acceptance probability as a function of "true score"
plot(true_mean_score_vec,paper_acceptance_probability_vec,xlabel=("True paper score"),ylabel=("Acceptance probability"))

plot(100 .* true_mean_score_percentile,paper_acceptance_probability_vec,xlabel=("True paper percentile"),ylabel=("Acceptance probability"),label="")

