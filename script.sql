-- Find all appointments with a waiting time longer than 60 minutes

SELECT A.appointmentId, A.type, W.estimatedWait
FROM Appointment A
JOIN WaitingList W ON A.waitingListId = W.waitingListId
WHERE W.estimatedWait > INTERVAL '60' MINUTE;

-- Show the total number of people in each district

SELECT D.districtName, COUNT(P.Id) AS totalPeople
FROM District D
LEFT JOIN Person P ON D.districtId = P.districtId
GROUP BY D.districtName;

--medium
-- List all districts and the number of people who have at least one appointment

SELECT D.districtName, COUNT(DISTINCT P.Id) AS peopleWithAppointments
FROM District D
LEFT JOIN Person P ON D.districtId = P.districtId
LEFT JOIN Appointment A ON P.Id = A.personId
GROUP BY D.districtName
HAVING COUNT(DISTINCT P.Id) > 0;

-- List all counties with their total number of appointments, including counties with no appointments

SELECT C.countyName, COUNT(A.appointmentId) AS totalAppointments
FROM County C
LEFT JOIN District D ON C.countyId = D.countyId
LEFT JOIN Person P ON D.districtId = P.districtId
LEFT JOIN Appointment A ON P.Id = A.personId
GROUP BY C.countyName;
