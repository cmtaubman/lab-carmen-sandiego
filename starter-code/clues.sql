-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.
SELECT code, name, region, population FROM country
WHERE region = 'Southern Europe'
ORDER BY population ASC
LIMIT 1;


-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

SELECT * FROM countrylanguage WHERE countrycode = 'VAT';

-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
--  nearby country speaks nothing but that language.

SELECT FROM countrylanguage WHERE percentage = 100 AND language = 'Italian';
SELECT name FROM country WHERE code = 'SMR';

San Marino

-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
 -- There are only two cities she could be flying to in the country. One is named the same as the country – that
 -- would be too obvious. We're following our gut on this one; find out what other city in that country she might
 --  be flying to.

SELECT name FROM city WHERE countrycode = 'SMR';

SELECT * FROM city WHERE countrycode = 'SMR';
-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!


SELECT * FROM city WHERE name LIKE 'Serra%';

-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
 -- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
 -- follow right behind you!
SELECT capital FROM country WHERE code = 'BRA';
SELECT name FROM city WHERE id = 211;

Brasilia
-- Clue #7: She knows we're on to her – her taxi dropped her off at the international airport, and she beat us to
 -- the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the
 -- landing dock.

-- Clue #8: Lucky for us, she's getting cocky. She left us a note, and I'm sure she thinks she's very clever, but
-- if we can crack it, we can finally put her where she belongs – behind bars.

-- Our playdate of late has been unusually fun –
-- As an agent, I'll say, you've been a joy to outrun.
-- And while the food here is great, and the people – so nice!
-- I need a little more sunshine with my slice of life.
-- So I'm off to add one to the population I find
-- In a city of ninety-one thousand and now, eighty five.
SELECT name, countrycode FROM city WHERE population = 91084;

-- We're counting on you, gumshoe. Find out where she's headed, send us the info, and we'll be sure to meet her at the gates with bells on.



-- She's in Santa Monica USA!

-- BONUS

-- 1. List the distinct regions in the Country table.
SELECT region FROM country;

-- 2. How many countries are located in European regions?
SELECT name FROM country WHERE region LIKE '%Europe';

34 countries

-- 3. Find the total population of all countries group by regions.

-- SELECT region, population FROM country;

SELECT region, SUM(population)
FROM country
GROUP BY region;


-- 4. Use one query to answer the following 2 questions
--     i.  Find the countries which have the most spoken languages used
--     ii. Find the maximum number of languages you can use in one country

SELECT countrycode, language
FROM countrylanguage
GROUP BY language;
???

-- 5. Find all the Asia countries that went independent from 1940 to 1950. Order the result by the year of independence.
SELECT region, name, indepyear FROM country;
WHERE region LIKE '%Asia' AND indepyear BETWEEN 1940 AND 1950
ORDER BY indepyear ASC;
???

-- 6. Find all the countries that do not use English at all

SELECT countrycode
FROM countrylanguage
WHERE countrylanguage NOT LIKE '%English%';