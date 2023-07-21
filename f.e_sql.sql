-- Body Mass Index (BMI)-- 

ALTER TABLE cardio
ADD COLUMN bmi FLOAT;

UPDATE cardio
SET bmi = weight / ((height / 100) * (height / 100));

-- Mean Arterial Pressure (MAP) -- 
ALTER TABLE cardio
ADD COLUMN map FLOAT;

UPDATE cardio
SET map = ap_lo + (ap_hi - ap_lo) / 3;

-- Body Surface Area -- 

ALTER TABLE cardio ADD COLUMN bsa FLOAT
UPDATE cardio SET bsa = SQRT((height * weight) / 3600);


-- Age Group --

ALTER TABLE cardio
MODIFY COLUMN age FLOAT; 

UPDATE cardio
SET age = age / 365.25;


ALTER TABLE cardio
ADD COLUMN age_group VARCHAR(20);

UPDATE cardio
SET age_group =
    CASE
        WHEN age < 40 THEN 'young'
        WHEN age >= 40 AND age < 60 THEN 'middle-aged'
        ELSE 'elderly'
    END;


-- Blood Pressure Level -- 

ALTER TABLE cardio
ADD COLUMN bp_level VARCHAR(20);

UPDATE cardio
SET bp_level =
    CASE
        WHEN ap_hi < 120 AND ap_lo < 80 THEN 'normal'
        WHEN ap_hi >= 120 AND ap_hi < 140 OR ap_lo >= 80 AND ap_lo < 90 THEN 'prehypertension'
        ELSE 'hypertension'
    END;

-- Total Cholesterol --

ALTER TABLE cardio
ADD COLUMN total_cholesterol INT;

UPDATE cardio
SET total_cholesterol = cholesterol + gluc;

-- BMI Category -- 

ALTER TABLE cardio
ADD COLUMN bmi_category VARCHAR(20);

UPDATE cardio
SET bmi_category =
    CASE
        WHEN bmi < 18.5 THEN 'underweight'
        WHEN bmi >= 18.5 AND bmi < 25 THEN 'normal weight'
        WHEN bmi >= 25 AND bmi < 30 THEN 'overweight'
        ELSE 'obese'
    END;

-- Lifestyle Habits -- 

ALTER TABLE cardio
ADD COLUMN lifestyle_habits VARCHAR(20);

UPDATE cardio
SET lifestyle_habits =
    CASE
        WHEN smoke = 0 AND alco = 0 AND active = 1 THEN 'healthy'
        WHEN smoke = 1 OR alco = 1 OR active = 0 THEN 'moderate'
        ELSE 'unhealthy'
    END;






