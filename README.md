# Job_ads_and_candidates

## This is my final project of the course CS50’s Introduction to Databases with SQL.

# Design

By Georgios Andrigiannakis

Video overview: https://youtu.be/e1ql442TwSA


## Scope

The database for any job listing website includes all entities necessary to facilitate the process of tracking a candidate's applications and jobs that exist in the market and the companies that provide them. As such, included in the database's scope is:

* Job_ads, including necessary information for every job ad.
* Companies, including basic identifying information.
* Job_applications, identifying the in which job has each candidate applied and the timestamp of the application.
* Candidates, including basic identifying information.

## Functional Requirements

In this database a user can:

* Analyze the job trends of each company, country and city
* Track all of the job applications of each candidate and in which companies, countries and cities.

## Representation
Entities are captured in SQLite tables with the following schema.

### Entities

#### Job_ads table:

`id` specifies the unique ID for the job ad as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
`title`  specifies the ad's job title as `TEXT`.
`company`  specifies the company's name as `TEXT`.
`country`  specifies the job's country as `TEXT`.
`city` specifies the job's city as `TEXT`.
`address` specifies the job's address as `TEXT`.
`minimum_salary` specifies the job's minimum salary as `REAL` and it can't be null.
`maximum_salary` specifies the job's maximun_salary as `REAL`.
`date_posted` specifies the timestamp where the job's posted.

#### Companies table

`name` specifies the name of the company as `TEXT` and it is used as the primary key.
`industry` specifies the industry of the company as `TEXT`.
`home_country` specifies the home country of the company as `TEXT`.
`home_city` pecifies the home city of the company as `TEXT`.
`address` pecifies the address of the company as `TEXT`.

#### Job_applications table

`job_id` references the id column of the Job_ads table.
`candidate_id` references the id column of the Candidates table.
`date_of_application` references the timestamp of the job application.

#### Candidates table

`id` specifies the unique ID for the candidate ad as an `INTEGER`. This column thus has the `PRIMARY KEY` constraint applied.
`first_name` specifies the candidate's first name as `TEXT`.
`last_name` specifies the candidate's last name as `TEXT`.
`country_of_residence` specifies the candidate's country of residence as `TEXT`
`city_of_residence` specifies the candidate's city of residence as `TEXT`



### Relationships

The below entity relationship diagram describes the relationships among the entities in the database.

![ER Diagram]([ER.png](https://github.com/GiorgosAndri/Job_ads_and_candidates/blob/main/ER.PNG))

* Companies and Job_ads: A company may have many job ads, but a job ad may have only one company.
*  A job_id may be associated from 0 to many candidates. A candidate may be associated from 1 to many job ads.
## Optimizations

Indexes Created: candidate_id, job_ads_id, company_name. All of them are made so that the joins will be faster.
