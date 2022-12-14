/*
James Berger
CS257
queries file
*/



/*
List all the NOCs (National Olympic Committees), in alphabetical order by abbreviation. These entities, by the way, 
are mostly equivalent to countries. But in some cases, you might find that a portion of a country participated in a 
particular games (e.g. one guy from Newfoundland in 1904) or some other oddball situation.
*/

SELECT noc_regions.noc
FROM noc_regions
ORDER BY noc_regions.noc;


/*
List the names of all the athletes from Jamaica. If your database design allows it, sort the athletes by last name.
*/

SELECT DISTINCT athletes.name                                                 
FROM athletes, countries, event_results                                          
WHERE athletes.id = event_results.athlete_id                                    
AND countries.name = 'Jamaica'                                                   
AND event_results.team_id = countries.id
ORDER BY athletes.name;
/*
List all the medals won by Greg Louganis, sorted by year. Include whatever fields in this output that you think appropriate.
*/
SELECT event_results.medal, olympics_info.season, olympics_info.year
FROM event_results, athletes, olympics_info
WHERE athletes.name LIKE '%Louganis%'
AND athletes.id = event_results.athlete_id
AND olympics_info.id = event_results.olympic_id
ORDER BY olympics_info.year;
/*
List all the NOCs and the number of gold medals they have won, in decreasing order of the number of gold medals.
*/

SELECT noc_regions.noc, COUNT(event_results.medal)
FROM noc_regions, event_results
WHERE noc_regions.id = event_results.noc_id
AND event_results.medal = 'Gold'
GROUP BY noc_regions.noc
ORDER BY COUNT(event_results.medal) DESC;




