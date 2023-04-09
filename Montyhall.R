# Set the number of simulations to run
num_sims <- 1000

# Set the number of doors in the game
num_doors <- 3

# Set the number of games won by staying with original choice
stay_wins <- 0

# Set the number of games won by switching choice
switch_wins <- 0

# Loop through the simulations
for (i in 1:num_sims) {
  
  # Generate the location of the prize
  prize_loc <- sample(1:num_doors, size = 1)
  
  # Generate the player's initial choice
  player_choice <- sample(1:num_doors, size = 1)
  
  # Generate the door opened by the host
  open_door <- sample(setdiff(1:num_doors, c(prize_loc, player_choice)), size = 1)
  
  # Determine the player's final choice if they switch
  switch_choice <- setdiff(1:num_doors, c(player_choice, open_door))
  
  # Check if the player wins by staying with their original choice
  if (player_choice == prize_loc) {
    stay_wins <- stay_wins + 1
  }
  
  # Check if the player wins by switching their choice
  if (switch_choice == prize_loc) {
    switch_wins <- switch_wins + 1
  }
}

# Calculate the probabilities of winning by staying or switching
stay_prob <- stay_wins / num_sims
switch_prob <- switch_wins / num_sims

# Print the results
cat("Probability of winning by staying:", stay_prob, "\n")
cat("Probability of winning by switching:", switch_prob, "\n")