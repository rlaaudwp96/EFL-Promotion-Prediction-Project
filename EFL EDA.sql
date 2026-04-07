-- 1. Create a table named 'seasonal_stats' for analysis within the 'efl_data' dataset
CREATE OR REPLACE TABLE `efl-ml-project.efl_data.seasonal_stats` AS
WITH base_data AS (
    -- (A) Normalize data based on the Home Team
    SELECT 
        Season, 
        HomeTeam as Team, 
        `FTH Goals` as GF,          -- Goals Scored by Home Team (Goals For)
        `FTA Goals` as GA,          -- Goals Conceded by Home Team (Goals Against)
        `H SOT` as SOT,             -- Home Team Shots on Target
        `H Corners` as Corners,     -- Home Team Corners
        -- Calculate points based on the result (Win: 3, Draw: 1, Loss: 0)
        CASE WHEN `FT Result` = 'H' THEN 3 
             WHEN `FT Result` = 'D' THEN 1 
             ELSE 0 END as Points
    FROM `efl-ml-project.efl_data.efl_data`
    
    UNION ALL
    
    -- (B) Normalize data based on the Away Team
    SELECT 
        Season, 
        AwayTeam as Team, 
        `FTA Goals` as GF,          -- Goals Scored by Away Team (Goals For)
        `FTH Goals` as GA,          -- Goals Conceded by Away Team (Goals Against)
        `A SOT` as SOT,             -- Away Team Shots on Target
        `A Corners` as Corners,     -- Away Team Corners
        -- Calculate points based on the result (Win: 3, Draw: 1, Loss: 0)
        CASE WHEN `FT Result` = 'A' THEN 3 
             WHEN `FT Result` = 'D' THEN 1 
             ELSE 0 END as Points
    FROM `efl-ml-project.efl_data.efl_data`
)

-- 2. Final aggregation by Team and Season
SELECT 
    Season, 
    Team,
    COUNT(*) as Games,              -- Total Matches Played
    SUM(Points) as Total_Points,    -- Total Points (Label / Dependent Variable)
    SUM(GF) as Total_GF,            -- Total Goals For (Feature / Independent Variable)
    SUM(GA) as Total_GA,            -- Total Goals Against
    AVG(SOT) as Avg_SOT,            -- Average Shots on Target
    AVG(Corners) as Avg_Corners,    -- Average Corners
    -- Rank teams within each season based on Total Points
    RANK() OVER(PARTITION BY Season ORDER BY SUM(Points) DESC) as team_rank
FROM base_data
GROUP BY Season, Team;