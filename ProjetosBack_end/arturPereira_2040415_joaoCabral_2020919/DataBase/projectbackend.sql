CREATE DATABASE projectBackEnd;

USE projectBackEnd;

CREATE TABLE videos (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  uploader varchar(150) NOT NULL,
  title varchar(100) NOT NULL,
  description varchar(300) NOT NULL,
  duration int(11) NOT NULL,
  url varchar(50) NOT NULL,
  views int(11) NOT NULL,
  likes int(11) NOT NULL,
  dislikes int(11) NOT NULL,
  comments longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`comments`)),
  tags longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`tags`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO videos (uploader, title, description, duration, url, views, likes, dislikes, comments, tags) VALUES
('João Cabral', 'How to create a API', 'Basic toturial about how to use express!', 34, 'www.expressjs.com', 43722, 112, 9, '[\"He make this look easy!!\",\"The most useful half an hour of my life!\"]', '[\"Express\",\"Coding\"]'),
('Artur Pereira', 'Applying a public API in to fron end', 'How to use the NASA API to put images in your webpage', 25, 'www.nasa.com', 8722, 212, 59, '[\"I hope that I can use the same technique to put other types of photos in my page\",\"That was exactly what i was loocking for\"]', '[\"Nasa\",\"Coding\"]'),
('FORMULA 1', 'Top 10 Moments of Sportsmanship in Formula 1', 'Sometimes, competition takes a back seat for sportsmanship. Take a look at these 10 examples of fraternity and togetherness in the heat of rivalry.', 12, 'www.formula1.com', 34222, 2112, 759, '[\"I can´t believe that Niki survided that accident\",\"Senna is the best driver ever!!\"]', '[\"Formula1\",\"Driving\"]'),
('Avenged Sevenfold', 'Avenged Sevenfold -- Hail To The King', 'Avenged Sevenfold - Hail To The King (Official Music Video)', 5, 'www.a7x.com', 74222, 1972, 459, '[\"This music makes my day a lot better during Quarantine\",\"That moment when the quiet kid roast the teacher\"]', '[\"Music\",\"A7X\"]'),
('Red Hot Chili Peppers', 'Red Hot Chili Peppers - Dark Necessities', 'Red Hot Chili Peppers - Dark Necessities (OFFICIAL VIDEO)', 5, 'www.redhotchilipeppers.com', 64222, 1672, 759, '[\"Flea is the best bassist to ever live\",\"I can’t believe how good this song is\"]', '[\"Music\",\"RHCP\"]');
