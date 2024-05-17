-- Load input file from HDFS
inputFile = LOAD 'hdfs:///user/waquar/input.txt' AS (line:chararray);
-- Tokeize each word in the file (Map)
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
-- Combine the words from the above stage
grpd = GROUP words BY word;
-- Count the occurence of each word (Reduce)
cntd = FOREACH grpd GENERATE group, COUNT(words);
-- total count = FOREACH grpd GENERATE $0, COUNT($1);
-- remove the old folder
rmf hdfs:///user/waquar/pigoutput1;
-- Store the result in HDFS
STORE cntd INTO 'hdfs:///user/root/results';