import random

# Set the number of simulations to run
num_sims = 1000

# Set the number of doors in the game
num_doors = 3

# Set the number of games won by staying with original choice
stay_wins = 0

# Set the number of games won by switching choice
switch_wins = 0

# Loop through the simulations
for i in range(num_sims):
    
    # Generate the location of the prize
    prize_loc = random.randint(1, num_doors)
    
    # Generate the player's initial choice
    player_choice = random.randint(1, num_doors)
    
    # Generate the door opened by the host
    opened_door = random.choice(list(set(range(1, num_doors+1)) - {prize_loc, player_choice}))
    
    # Determine the player's final choice if they switch
    switch_choice = list(set(range(1, num_doors+1)) - {player_choice, opened_door})[0]
    
    # Check if the player wins by staying with their original choice
    if player_choice == prize_loc:
        stay_wins += 1
    
    # Check if the player wins by switching their choice
    if switch_choice == prize_loc:
        switch_wins += 1

# Calculate the probabilities of winning by staying or switching
stay_prob = stay_wins / num_sims
switch_prob = switch_wins / num_sims

# Print the results
print("Probability of winning by staying:", stay_prob)
print("Probability of winning by switching:", switch_prob)
