CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar UNIQUE,
  "password" varchar,
  "age" int,
  "roles_id" int,
  "timestamp" timestamp,
  "time_update" timestamp
);

CREATE TABLE "roles" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "description" text,
  "timestamp" timestamp,
  "time_update" timestamp
);

CREATE TABLE "courses" (
  "id" int PRIMARY KEY,
  "title" varchar,
  "teacher_id" uuid,
  "level" varchar,
  "description" text,
  "timestamp" timestamp,
  "time_update" timestamp
);

CREATE TABLE "videos_course" (
  "id" int PRIMARY KEY,
  "courses_id" int,
  "videos_id" int,
  "timestamp" timestamp,
  "time_update" timestamp
);

CREATE TABLE "videos" (
  "id" int PRIMARY KEY,
  "title" varchar,
  "year" date,
  "url" text,
  "description" text,
  "timestamp" timestamp,
  "time_update" timestamp
);

CREATE TABLE "categories" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "description" text,
  "timestamp" timestamp,
  "date_time_update" timestamp
);

CREATE TABLE "videos_categories" (
  "id" int PRIMARY KEY,
  "categories_id" int,
  "videos_id" int,
  "timestamp" timestamp,
  "time_update" timestamp
);

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("roles_id") REFERENCES "roles" ("id");

ALTER TABLE "videos_categories" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "videos_categories" ADD FOREIGN KEY ("videos_id") REFERENCES "videos" ("id");

ALTER TABLE "videos_course" ADD FOREIGN KEY ("videos_id") REFERENCES "videos" ("id");

ALTER TABLE "videos_course" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");


/** First insert role for user dependences */
INSERT INTO public.roles(
	id, name, description)
	VALUES (1, 'Admin', 'permission for create, read and modificate');
INSERT INTO public.roles(
	id, name, description)
	VALUES (2, 'Teacher', 'Teacher panel');
INSERT INTO public.roles(
	id, name, description)
	VALUES (3, 'Student', 'Student panel');	

/** THEN WE INSERT THE USERS */

INSERT INTO public.users(
	id, first_name, last_name, email, password, age, roles_id)
	VALUES ('0de9cd04-b2c7-11ed-afa1-0242ac120002', 'Mauricio', 'Blair', 'mauricio.blair@aol.com', '1234',  35 , 1);
INSERT INTO public.users(
	id, first_name, last_name, email, password, age, roles_id)
	VALUES ('09e4e988-b2c6-11ed-afa1-0242ac120002', 'Mauricio', 'Farah', 'mauricio.farah@aol.com', '1234',  25, 2);	

/**THEN INSERT THE COURSES */

INSERT INTO public.courses(
	id, title, teacher_id, level, description)
	VALUES (1, 'COURSE BASIC', '0de9cd04-b2c7-11ed-afa1-0242ac120002', 'BASIC', 'BASIC COURSE');
INSERT INTO public.courses(
	id, title, teacher_id, level, description)
	VALUES (2, 'COURSE ADVANCED', '0de9cd04-b2c7-11ed-afa1-0242ac120002', 'ADVANCED', 'ADVANCED COURSE');


/**INSERT THE VIDEOS*/

INSERT INTO public.videos(
	id, title, year, url, description)
	VALUES (1, 'BASIC VIDEOS', '1/1/1997', 'https://www.youtube.com/watch?v=6SzdO8CiKDQ', 'VIDEOS FOR BASIC COURSES');

INSERT INTO public.videos(
	id, title, year, url, description)
	VALUES (2, 'ADVANCED VIDEOS', '1/1/1997', 'https://www.youtube.com/watch?v=6SzdO8CiKDQ', 'VIDEOS FOR ADVANCED COURSES');
	
/**Insert Categories */

INSERT INTO public.categories(
	id, name, description)
	VALUES (1, 'Basic', 'Basics videos');
INSERT INTO public.categories(
	id, name, description)
	VALUES (2, 'Advanced', 'Adavanced videos');
	
/**Insert Videos_Categorias */

INSERT INTO public.videos_categories(
	id, categories_id, videos_id)
	VALUES (1, 1, 1);
INSERT INTO public.videos_categories(
	id, categories_id, videos_id)
	VALUES (2, 2, 2);
	
/** Insert Videos Courses */

INSERT INTO public.videos_course(
	id, courses_id, videos_id)
	VALUES (1, 1, 1);
INSERT INTO public.videos_course(
	id, courses_id, videos_id)
	VALUES (2, 2, 2);
	
