# Let's load the data
nba <- read.csv("data/NBA.csv", header = TRUE, stringsAsFactors = FALSE)
head(nba)

# transforming the variable Team to a factor
nba$Team <- factor(nba$Team)

# Splitting the data frame by the each level of the factor Team, it returns a list 
data_by_team <- split(nba, nba$Team)

extract_last <- function(x){
    # This function takes a vector and returns the last element
    return(x[length(x)])
}


# For each element in the data_by_team assigning the correct name
for(i in 1:37){
    #for the element i in the list, get the first element of variable Team, convert it in a string
    team_name <- as.character(data_by_team[[i]]$Team[1])
   
    #Spliting the words in team_name, because strsplit returns a list, we need to extract
    # the first element, hence the [[1]]
    team_name <- strsplit(team_name,split = " ")[[1]]
    #Get the last word using the function we created
    team_name <- extract_last(team_name)
    #assigning the correct name
    names(data_by_team)[i] <- team_name
}


# Creating a function that takes a name of the team and returns all it's data
get_team_data <- function(name_of_team){
    data_by_team[[name_of_team]]
}

#testing if it works, for a couple
head(get_team_data("Bulls"))
head(get_team_data("Hornets"))

# Testing for all
for(i in 1:37){ 
    name <- names(data_by_team)[i]
    cat("Name of the team:", name, "\n",
        "First element of the 'Team' column: ",
        as.character(get_team_data(name)$Team[1]),
        "\n================== \n"
        )

}
