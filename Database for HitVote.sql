CREATE DATABASE HitVote
USE HitVote
GO
CREATE TABLE Role_Person(
	id_role INT PRIMARY KEY IDENTITY(1,1),
	role_name NVARCHAR(50)
);
GO
CREATE TABLE Person(
	id_person INT PRIMARY KEY IDENTITY(1,1),
	p_name NVARCHAR(150) NOT NULL,
	p_birth DATE NOT NULL,
	p_phone NVARCHAR(13) NOT NULL,
	 p_password  NVARCHAR(255),
	p_email NVARCHAR(100) UNIQUE,
	id_role INT REFERENCES Role_Person(id_role)
	ON DELETE CASCADE
);
GO 

CREATE TABLE Singer(
	id_singer INT PRIMARY KEY IDENTITY(1,1),
	full_name NVARCHAR(100),
	date_birth DATE ,
	email NVARCHAR(100),
	phone NVARCHAR(13),
	image_path NVARCHAR(500) NULL
)
GO
CREATE TABLE Song(
	id_song INT PRIMARY KEY IDENTITY(1,1),
	name_song NVARCHAR(100),
	duration INT,
	image_path NVARCHAR(500) NULL
)
GO
CREATE TABLE Form(
	id_form INT PRIMARY KEY IDENTITY(1,1),
	id_singer INT REFERENCES Singer(id_singer) ON DELETE CASCADE,
	id_song INT REFERENCES Song(id_song) ON DELETE NO ACTION,
	date_log DATE,
	status_form NVARCHAR(50) check( status_form='activ' or status_form='inactive')
	 CONSTRAINT UQ_Singer_Song UNIQUE (id_singer, id_song)
	

);
GO
CREATE TABLE Vote(
	id_vote INT PRIMARY KEY IDENTITY(1,1),
	id_person INT REFERENCES Person(id_person) ON DELETE SET NULL,
	id_form INT REFERENCES Form(id_form) ON DELETE CASCADE,
	points INT CHECK (points IN (2, 5, 10))
	CONSTRAINT UQ_Person_Form UNIQUE (id_person, id_form)

);

SELECT @@SERVERNAME
GO
--indecsi
CREATE INDEX IX_Vote_Person ON Vote(id_person);
CREATE INDEX IX_Vote_Form   ON Vote(id_form);
CREATE INDEX IX_Form_Singer ON Form(id_singer);

--inregistrari
INSERT INTO Role_Person VALUES 
( 'Admin'),
( 'User'),
('Jurist');


INSERT INTO Person (p_name, p_birth, p_phone, p_email, p_password, id_role) VALUES
('James Mitchell',    '1985-03-14', '069123401', 'james.mitchell@mail.com',    '$2a$11$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 1),
('Sarah Thompson',    '1990-07-22', '069123402', 'sarah.thompson@mail.com',    '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Daniel Carter',     '1988-11-05', '069123403', 'daniel.carter@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Emily Rodriguez',   '1995-02-18', '069123404', 'emily.rodriguez@mail.com',   '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Michael Bennett',   '1979-09-30', '069123405', 'michael.bennett@mail.com',   '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Laura Henderson',   '1983-06-12', '069123406', 'laura.henderson@mail.com',   '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Chris Wallace',     '1992-04-25', '069123407', 'chris.wallace@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Amanda Foster',     '1997-12-08', '069123408', 'amanda.foster@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Robert Sullivan',   '1975-08-19', '069123409', 'robert.sullivan@mail.com',   '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Jessica Parker',    '1993-01-03', '069123410', 'jessica.parker@mail.com',    '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Kevin Harris',      '1986-05-17', '069123411', 'kevin.harris@mail.com',      '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Megan Collins',     '1994-09-28', '069123412', 'megan.collins@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Brandon Wright',    '1989-12-11', '069123413', 'brandon.wright@mail.com',    '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Ashley Turner',     '1996-03-04', '069123414', 'ashley.turner@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Tyler Morgan',      '1991-07-09', '069123415', 'tyler.morgan@mail.com',      '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Stephanie Reed',    '1987-11-23', '069123416', 'stephanie.reed@mail.com',    '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Joshua Bailey',     '1998-06-15', '069123417', 'joshua.bailey@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Nicole Rivera',     '1984-02-27', '069123418', 'nicole.rivera@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Andrew Cooper',     '1977-10-08', '069123419', 'andrew.cooper@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Rachel Peterson',   '1999-04-19', '069123420', 'rachel.peterson@mail.com',   '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Nathan Diaz',       '1990-08-31', '069123421', 'nathan.diaz@mail.com',       '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Samantha Wood',     '1993-01-14', '069123422', 'samantha.wood@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Justin Bell',       '1982-05-26', '069123423', 'justin.bell@mail.com',       '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Brittany Cox',      '1996-09-07', '069123424', 'brittany.cox@mail.com',      '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Ryan Hughes',       '1988-12-20', '069123425', 'ryan.hughes@mail.com',       '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Kimberly Price',    '1981-03-13', '069123426', 'kimberly.price@mail.com',    '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Zachary Sanders',   '1994-07-24', '069123427', 'zachary.sanders@mail.com',   '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Amber Jenkins',     '1986-11-02', '069123428', 'amber.jenkins@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Patrick Russell',   '1978-04-16', '069123429', 'patrick.russell@mail.com',   '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Heather Griffin',   '1995-08-28', '069123430', 'heather.griffin@mail.com',   '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Sean Foster',       '1989-02-09', '069123431', 'sean.foster@mail.com',       '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Tiffany Bryant',    '1997-06-21', '069123432', 'tiffany.bryant@mail.com',    '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Gregory Alexander', '1980-10-03', '069123433', 'gregory.alexander@mail.com', '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Christina Scott',   '1992-01-15', '069123434', 'christina.scott@mail.com',   '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Dennis Young',      '1976-05-27', '069123435', 'dennis.young@mail.com',      '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Monica King',       '1998-09-08', '069123436', 'monica.king@mail.com',       '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Edward Hall',       '1983-12-22', '069123437', 'edward.hall@mail.com',       '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Vanessa Allen',     '1991-04-04', '069123438', 'vanessa.allen@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Marcus Lewis',      '1987-08-17', '069123439', 'marcus.lewis@mail.com',      '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Danielle Robinson', '1999-02-01', '069123440', 'danielle.robinson@mail.com', '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Keith Walker',      '1974-06-13', '069123441', 'keith.walker@mail.com',      '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Erica Perez',       '1993-10-25', '069123442', 'erica.perez@mail.com',       '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Derek Campbell',    '1985-02-06', '069123443', 'derek.campbell@mail.com',    '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Carolyn Evans',     '1980-07-18', '069123444', 'carolyn.evans@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Jonathan Edwards',  '1996-11-30', '069123445', 'jonathan.edwards@mail.com',  '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Diana Stewart',     '1989-03-12', '069123446', 'diana.stewart@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Raymond Flores',    '1977-07-24', '069123447', 'raymond.flores@mail.com',    '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3),
('Melissa Morris',    '1994-11-05', '069123448', 'melissa.morris@mail.com',    '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Walter Nguyen',     '1982-04-17', '069123449', 'walter.nguyen@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 2),
('Sandra Murphy',     '1990-08-29', '069123450', 'sandra.murphy@mail.com',     '$2a$11$KzBMTkDn4WQkJiECFGlDOeRuKmFaT9zMJVMqCMJJpxD6xp.oBvNGy', 3);


INSERT INTO Singer (full_name, date_birth, email, phone) VALUES
('Taylor Swift',      '1989-12-13', 'taylor.swift@music.com',      '069200101'),
('Ed Sheeran',        '1991-02-17', 'ed.sheeran@music.com',        '069200102'),
('Ariana Grande',     '1993-06-26', 'ariana.grande@music.com',     '069200103'),
('Bruno Mars',        '1985-10-08', 'bruno.mars@music.com',        '069200104'),
('Billie Eilish',     '2001-12-18', 'billie.eilish@music.com',     '069200105'),
('The Weeknd',        '1990-02-16', 'the.weeknd@music.com',        '069200106'),
('Dua Lipa',          '1995-08-22', 'dua.lipa@music.com',          '069200107'),
('Post Malone',       '1995-07-04', 'post.malone@music.com',       '069200108'),
('Olivia Rodrigo',    '2003-02-20', 'olivia.rodrigo@music.com',    '069200109'),
('Harry Styles',      '1994-02-01', 'harry.styles@music.com',      '069200110'),
('Adele',             '1988-05-05', 'adele@music.com',             '069200111'),
('Drake',             '1986-10-24', 'drake@music.com',             '069200112'),
('Beyonce',           '1981-09-04', 'beyonce@music.com',           '069200113'),
('Justin Bieber',     '1994-03-01', 'justin.bieber@music.com',     '069200114'),
('Lady Gaga',         '1986-03-28', 'lady.gaga@music.com',         '069200115');

INSERT INTO Song (name_song, duration) VALUES
('Anti-Hero',              197),
('Shake It Off',           219),
('Love Story',             235),
('Shape of You',           234),
('Perfect',                263),
('Bad Habits',             231),
('Thank U Next',           207),
('7 Rings',                178),
('Positions',              172),
('Grenade',                222),
('Uptown Funk',            270),
('Blinding Lights',        200),
('Save Your Tears',        215),
('Levitating',             203),
('Do not Start Now',        183),
('Happier Than Ever',      298),
('Bad Guy',                194),
('Sunflower',              158),
('Circles',                214),
('Rockstar',               218),
('Drivers License',        242),
('Good 4 U',               178),
('Brutal',                 162),
('Watermelon Sugar',       174),
('Adore You',              207),
('Easy On Me',             224),
('Hello',                  295),
('Rolling In The Deep',    228),
('Someone Like You',       285),
('God s Plan',             198),
('Hotline Bling',          267),
('One Dance',              173),
('Crazy In Love',          236),
('Halo',                   261),
('Single Ladies',          199),
('Love Yourself',          233),
('Sorry',                  200),
('Peaches',                198),
('Bad Romance',            294),
('Poker Face',             237);


INSERT INTO Form (id_singer, id_song, date_log, status_form) VALUES
(1,  1,  '2024-01-05', 'activ'),
(1,  2,  '2024-01-06', 'activ'),
(2,  4,  '2024-01-07', 'activ'),
(2,  5,  '2024-01-08', 'activ'),
(3,  7,  '2024-01-09', 'activ'),
(3,  8,  '2024-01-10', 'activ'),
(4,  10, '2024-01-11', 'activ'),
(4,  11, '2024-01-12', 'activ'),
(5,  13, '2024-01-13', 'activ'),
(5,  14, '2024-01-14', 'activ'),
(6,  12, '2024-01-15', 'activ'),
(6,  16, '2024-01-16', 'activ'),
(7,  15, '2024-01-17', 'activ'),
(7,  17, '2024-01-18', 'inactive'),
(8,  19, '2024-01-19', 'activ'),
(8,  20, '2024-01-20', 'activ'),
(9,  21, '2024-01-21', 'activ'),
(9,  22, '2024-01-22', 'activ'),
(10, 24, '2024-01-23', 'activ'),
(10, 25, '2024-01-24', 'inactive'),
(11, 27, '2024-01-25', 'activ'),
(11, 28, '2024-01-26', 'activ'),
(12, 30, '2024-01-27', 'activ'),
(12, 31, '2024-01-28', 'inactive'),
(13, 33, '2024-01-29', 'activ'),
(13, 34, '2024-01-30', 'activ'),
(14, 36, '2024-02-01', 'activ'),
(14, 37, '2024-02-02', 'activ'),
(15, 39, '2024-02-03', 'activ'),
(15, 40, '2024-02-04', 'inactive');
SELECT * FROM Song
SELECT * FROM Form

INSERT INTO Vote (id_person, id_form, points) VALUES
(2,  1,  10),
(3,  1,  5),
(4,  1,  2),
(5,  2,  10),
(6,  2,  5),
(7,  3,  10),
(8,  3,  2),
(9,  4,  5),
(10, 4,  10),
(11, 5,  2),
(12, 5,  10),
(13, 6,  5),
(14, 6,  2),
(15, 7,  10),
(16, 7,  5),
(17, 8,  10),
(18, 8,  2),
(19, 9,  5),
(20, 9,  10),
(21, 10, 2),
(22, 10, 10),
(23, 11, 5),
(24, 11, 2),
(25, 12, 10),
(26, 12, 5),
(27, 13, 10),
(28, 13, 2),
(29, 14, 5),
(30, 15, 10),
(31, 15, 2),
(32, 16, 5),
(33, 16, 10),
(34, 17, 2),
(35, 17, 5),
(36, 18, 10),
(37, 18, 2),
(38, 19, 5),
(39, 19, 10),
(40, 20, 2),
(41, 21, 10),
(42, 21, 5),
(43, 22, 2),
(44, 22, 10),
(45, 23, 5),
(46, 23, 2),
(47, 24, 10),
(48, 24, 5),
(49, 25, 2),
(50, 25, 10);

--poze pentru singers/ VOM TESTA LA aplicatie
Select * from Singer

UPDATE Singer SET image_path = '/Images/Singers/taylor_swift.jpg'     WHERE id_singer = 1;
UPDATE Singer SET image_path = '/Images/Singers/ed_sheeran.jpg'       WHERE id_singer = 2;
UPDATE Singer SET image_path = '/Images/Singers/ariana_grande.jpg'    WHERE id_singer = 3;
UPDATE Singer SET image_path = '/Images/Singers/bruno_mars.jpg'       WHERE id_singer = 4;
UPDATE Singer SET image_path = '/Images/Singers/billie_eilish.jpg'    WHERE id_singer = 5;
UPDATE Singer SET image_path = '/Images/Singers/the_weeknd.jpg'       WHERE id_singer = 6;
UPDATE Singer SET image_path = '/Images/Singers/dua_lipa.jpg'         WHERE id_singer = 7;
UPDATE Singer SET image_path = '/Images/Singers/post_malone.jpg'      WHERE id_singer = 8;
UPDATE Singer SET image_path = '/Images/Singers/olivia_rodrigo.jpg'   WHERE id_singer = 9;
UPDATE Singer SET image_path = '/Images/Singers/harry_styles.jpg'     WHERE id_singer = 10;
UPDATE Singer SET image_path = '/Images/Singers/adele.jpg'            WHERE id_singer = 11;
UPDATE Singer SET image_path = '/Images/Singers/drake.jpg'            WHERE id_singer = 12;
UPDATE Singer SET image_path = '/Images/Singers/beyonce.jpg'          WHERE id_singer = 13;
UPDATE Singer SET image_path = '/Images/Singers/justin_bieber.jpg'    WHERE id_singer = 14;
UPDATE Singer SET image_path = '/Images/Singers/lady_gaga.jpg'        WHERE id_singer = 15;



UPDATE Song SET image_path = '/Images/Songs/anti_hero.jpg'           WHERE id_song = 1;
UPDATE Song SET image_path = '/Images/Songs/shake_it_off.jpg'        WHERE id_song = 2;
UPDATE Song SET image_path = '/Images/Songs/love_story.jpg'          WHERE id_song = 3;
UPDATE Song SET image_path = '/Images/Songs/shape_of_you.jpg'        WHERE id_song = 4;
UPDATE Song SET image_path = '/Images/Songs/perfect.jpg'             WHERE id_song = 5;
UPDATE Song SET image_path = '/Images/Songs/bad_habits.jpg'          WHERE id_song = 6;
UPDATE Song SET image_path = '/Images/Songs/thank_u_next.jpg'        WHERE id_song = 7;
UPDATE Song SET image_path = '/Images/Songs/7_rings.jpg'             WHERE id_song = 8;
UPDATE Song SET image_path = '/Images/Songs/positions.jpg'           WHERE id_song = 9;
UPDATE Song SET image_path = '/Images/Songs/grenade.jpg'             WHERE id_song = 10;
UPDATE Song SET image_path = '/Images/Songs/uptown_funk.jpg'         WHERE id_song = 11;
UPDATE Song SET image_path = '/Images/Songs/blinding_lights.jpg'     WHERE id_song = 12;
UPDATE Song SET image_path = '/Images/Songs/save_your_tears.jpg'     WHERE id_song = 13;
UPDATE Song SET image_path = '/Images/Songs/levitating.jpg'          WHERE id_song = 14;
UPDATE Song SET image_path = '/Images/Songs/dont_start_now.jpg'      WHERE id_song = 15;
UPDATE Song SET image_path = '/Images/Songs/happier_than_ever.jpg'   WHERE id_song = 16;
UPDATE Song SET image_path = '/Images/Songs/bad_guy.jpg'             WHERE id_song = 17;
UPDATE Song SET image_path = '/Images/Songs/sunflower.jpg'           WHERE id_song = 18;
UPDATE Song SET image_path = '/Images/Songs/circles.jpg'             WHERE id_song = 19;
UPDATE Song SET image_path = '/Images/Songs/rockstar.jpg'            WHERE id_song = 20;
UPDATE Song SET image_path = '/Images/Songs/drivers_license.jpg'     WHERE id_song = 21;
UPDATE Song SET image_path = '/Images/Songs/good_4_u.jpg'            WHERE id_song = 22;
UPDATE Song SET image_path = '/Images/Songs/brutal.jpg'              WHERE id_song = 23;
UPDATE Song SET image_path = '/Images/Songs/watermelon_sugar.jpg'    WHERE id_song = 24;
UPDATE Song SET image_path = '/Images/Songs/adore_you.jpg'           WHERE id_song = 25;
UPDATE Song SET image_path = '/Images/Songs/easy_on_me.jpg'          WHERE id_song = 26;
UPDATE Song SET image_path = '/Images/Songs/hello.jpg'               WHERE id_song = 27;
UPDATE Song SET image_path = '/Images/Songs/rolling_in_the_deep.jpg' WHERE id_song = 28;
UPDATE Song SET image_path = '/Images/Songs/someone_like_you.jpg'    WHERE id_song = 29;
UPDATE Song SET image_path = '/Images/Songs/gods_plan.jpg'           WHERE id_song = 30;
UPDATE Song SET image_path = '/Images/Songs/hotline_bling.jpg'       WHERE id_song = 31;
UPDATE Song SET image_path = '/Images/Songs/one_dance.jpg'           WHERE id_song = 32;
UPDATE Song SET image_path = '/Images/Songs/crazy_in_love.jpg'       WHERE id_song = 33;
UPDATE Song SET image_path = '/Images/Songs/halo.jpg'                WHERE id_song = 34;
UPDATE Song SET image_path = '/Images/Songs/single_ladies.jpg'       WHERE id_song = 35;
UPDATE Song SET image_path = '/Images/Songs/love_yourself.jpg'       WHERE id_song = 36;
UPDATE Song SET image_path = '/Images/Songs/sorry.jpg'               WHERE id_song = 37;
UPDATE Song SET image_path = '/Images/Songs/peaches.jpg'             WHERE id_song = 38;
UPDATE Song SET image_path = '/Images/Songs/bad_romance.jpg'         WHERE id_song = 39;
UPDATE Song SET image_path = '/Images/Songs/poker_face.jpg'          WHERE id_song = 40;



SELECT Count(*) as votes, SUM(points) as puncte, id_form FROM Vote
Group by id_form

Select * from Song