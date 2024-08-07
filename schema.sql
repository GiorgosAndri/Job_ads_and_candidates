-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
CREATE TABLE "Job_ads" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "company" TEXT,
    "country" TEXT NOT NULL,
    "city" TEXT,
    "address" TEXT NOT NULL,
    "minimum_salary" REAL NOT NULL,
    "maximum_salary" REAL,
    "date_posted" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("company") REFERENCES "Companies"("name")
);

CREATE TABLE "Companies" (
    "name" TEXT,
    "industry" TEXT not null,
    "home_country" TEXT NOT NULL,
    "home_city" TEXT NOt NULL,
    "address" TEXT not null,
    PRIMARY KEY("name")
);

CREATE TABLE "Job_applications" (
    "job_id" INTEGER NOT NULL,
    "candidate_id" INTEGER NOT NULL,
    "date_of_application" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("job_id") REFERENCES "Job_ads"("id"),
    FOREIGN KEY("candidate_id") REFERENCES "Candidates"("id")
);

CREATE TABLE Candidates (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "country_of_residence" TEXT,
    "city_of_residence" TEXT,
    PRIMARY KEY("id")
);

CREATE INDEX "candidate_id" ON "Candidates" ("id");
CREATE INDEX "Job_ads_id" ON "Job_ads" ("id");
CREATE INDEX "Companies_name" ON "Companies" ("name");
