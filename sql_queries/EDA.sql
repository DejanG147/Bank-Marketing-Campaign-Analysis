/*Finding sales call count per job*/

SELECT 
    job, 
    COUNT(*) 
FROM marketing_campaign 
GROUP BY job 
ORDER BY COUNT(*) DESC;

/*finding sales calls ended with subscritpion and conversion rate per job */

SELECT job,
COUNT(*) as calls,
SUM(CASE WHEN y='Yes' THEN 1 ELSE 0 END ) AS subscribed,
ROUND(SUM(CASE WHEN y='Yes' THEN 1 ELSE 0 END )::numeric/COUNT(*)*100,2) as conv_rate
FROM marketing_campaign
GROUP BY job
ORDER BY conv_rate DESC NULLS LAST; 

/*Finding sales calls ended with subscription per month*/
SELECT month,
COUNT (*) as calls,
SUM(CASE WHEN y='Yes'THEN 1 ELSE 0 END) as yes_count,
ROUND(SUM(CASE WHEN y='Yes' THEN 1 ELSE 0 END)::numeric/count(*)*100,2) as conv_rate
FROM marketing_campaign
GROUP BY month
ORDER BY conv_rate DESC;

/*Finding effect of the previous campaign outcome to the current one */ 
SELECT campaign_outcome,
ROUND(AVG((y='Yes')::INT)*100,2) as conv_rate,
COUNT(*)
FROM marketing_campaign
GROUP BY campaign_outcome;

/*Joining by location and creating table for CSV export*/ 

CREATE TABLE final_marketing_analysis AS 
SELECT

 mc.call_id,
    mc.age,
    mc.job,
    mc.marital,
    mc.education,
    mc.has_credit,
    mc.housing,
    mc.loan,
    mc.month,
    l.location_name,
    l.region,
    mc.y

FROM marketing_campaign AS mc
LEFT JOIN location AS l 
ON mc.location_id = l.location_id;

SELECT *
FROM final_marketing_analysis;