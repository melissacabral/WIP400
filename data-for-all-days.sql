-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2015 at 11:10 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `demo_blog`
--
CREATE DATABASE IF NOT EXISTS `demo_blog` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `demo_blog`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
`category_id` mediumint(9) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Miscellaneous'),
(2, 'Tutorials'),
(3, 'Recipes'),
(4, 'Reviews');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
`comment_id` mediumint(9) NOT NULL,
  `body` text NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  `date` datetime NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `post_id` mediumint(9) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `body`, `user_id`, `date`, `is_approved`, `post_id`) VALUES
(4, 'This is a comment\r\nNow that we know who you are, I know who I am. I''m not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain''s going to be? He''s the exact opposite of the hero. And most times they''re friends, like you and me! I should''ve known way back when... You know why, David? Because of the kids. They called me Mr Glass.\r\n', 2, '2015-04-01 10:45:39', 1, 2),
(5, 'Now that we know who you are, I know who I am. I''m not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain''s going to be? He''s the exact opposite of the hero. And most times they''re friends, like you and me! I should''ve known way back when... You know why, David? Because of the kids. They called me Mr Glass.', 2, '2015-04-01 10:46:34', 1, 1),
(6, 'Hey, I like this post', 1, '2015-04-16 18:46:15', 1, 1),
(7, 'yay i can comments!', 1, '2015-04-17 11:51:09', 1, 1),
(8, 'This comment is not approved and should NOT show up on the site', 1, '2015-04-17 11:57:14', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
`link_id` mediumint(9) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(256) NOT NULL,
  `url` text NOT NULL,
  `user_id` mediumint(9) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`link_id`, `title`, `description`, `url`, `user_id`) VALUES
(3, 'Platt Online', 'Fred''s awesome site', 'http://plattonline.com', 1),
(4, 'Lipsum', 'Lorem Ipsum Generator', 'http://lispum.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
`post_id` mediumint(9) NOT NULL,
  `date` datetime NOT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `allow_comments` tinyint(1) NOT NULL,
  `category_id` mediumint(9) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `date`, `title`, `body`, `user_id`, `is_published`, `allow_comments`, `category_id`) VALUES
(1, '2015-04-01 10:38:12', 'First Dummy Post Example', 'Nulla tellus risus, dapibus id eros nec, scelerisque tempus nisi. Nam aliquet tellus a urna efficitur viverra. Vestibulum ultrices pellentesque purus euismod finibus. Morbi egestas dignissim elit sed suscipit. Nunc molestie accumsan turpis, sed accumsan dui euismod sed. Phasellus fermentum in ex at dignissim. Sed suscipit, neque id eleifend luctus, odio erat posuere sem, sed vestibulum odio lectus et eros. Nulla a augue a velit dignissim facilisis eu eu nisi. Pellentesque malesuada, lacus sit amet iaculis malesuada, dui tortor ornare nunc, et bibendum justo ante vitae enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam sollicitudin velit nec mi faucibus malesuada. Proin volutpat sapien nec erat consectetur, ac congue nisi pretium. Morbi imperdiet maximus enim, eget fringilla velit elementum sit amet. Donec eu condimentum nunc.', 1, 1, 1, 1),
(2, '2015-04-21 00:00:00', 'This post has comments turned off', 'Now that we know who you are, I know who I am. I''m not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain''s going to be? He''s the exact opposite of the hero. And most times they''re friends, like you and me! I should''ve known way back when... You know why, David? Because of the kids. They called me Mr Glass.', 1, 1, 0, 2),
(3, '2015-04-01 10:38:12', 'Another Inspiring Post', '<img src="http://placecorgi.com/260/180" class="alignleft" /> Nulla tellus risus, dapibus id eros nec, scelerisque tempus nisi. Nam aliquet tellus a urna efficitur viverra. Vestibulum ultrices pellentesque purus euismod finibus. Morbi egestas dignissim elit sed suscipit. Nunc molestie accumsan turpis, sed accumsan dui euismod sed. Phasellus fermentum in ex at dignissim. Sed suscipit, neque id eleifend luctus, odio erat posuere sem, sed vestibulum odio lectus et eros. Nulla a augue a velit dignissim facilisis eu eu nisi. Pellentesque malesuada, lacus sit amet iaculis malesuada, dui tortor ornare nunc, et bibendum justo ante vitae enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam sollicitudin velit nec mi faucibus malesuada. Proin volutpat sapien nec erat consectetur, ac congue nisi pretium. Morbi imperdiet maximus enim, eget fringilla velit elementum sit amet. Donec eu condimentum nunc.', 1, 1, 0, 2),
(4, '2015-04-21 00:00:00', 'This post was written by user number 2', '<img src="http://placecorgi.com/300/200" class="alignright" /> Now that we know who you are, I know who I am. I''m not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain''s going to be? He''s the exact opposite of the hero. And most times they''re friends, like you and me! I should''ve known way back when... You know why, David? Because of the kids. They called me Mr Glass.', 2, 1, 1, 1),
(5, '2015-04-21 00:00:00', 'This is a private post that should not show up on the blog', 'He''s the exact opposite of the hero. And most times they''re friends, like you and me! I should''ve known way back when... You know why, David? Because of the kids. They called me Mr Glass.', 1, 0, 1, 1),
(6, '2015-04-01 10:38:12', 'Something you have to see to believe', '<img src="http://placecorgi.com/150/75" class="alignleft" /> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a consequat ligula. Praesent congue ex nec aliquet euismod. Sed id sem sit amet lorem convallis fringilla. Aliquam magna urna, lobortis at bibendum nec, maximus sit amet leo. Vestibulum ut rutrum arcu. In semper ac odio nec efficitur. Phasellus ultricies ac dolor id feugiat. Pellentesque tincidunt sagittis sapien, in volutpat ligula faucibus a. Duis maximus quis augue vel gravida. In vitae arcu risus. Mauris eu lacus maximus, convallis ligula ut, vehicula augue. Curabitur dignissim orci vitae molestie suscipit.\r\n', 1, 1, 0, 2),
(7, '2015-04-21 00:00:00', 'This is a post from the present', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a consequat ligula. Praesent congue ex nec aliquet euismod. Sed id sem sit amet lorem convallis fringilla. Aliquam magna urna, lobortis at bibendum nec, maximus sit amet leo. Vestibulum ut rutrum arcu. In semper ac odio nec efficitur. Phasellus ultricies ac dolor id feugiat. Pellentesque tincidunt sagittis sapien, in volutpat ligula faucibus a. Duis maximus quis augue vel gravida. In vitae arcu risus. Mauris eu lacus maximus, convallis ligula ut, vehicula augue. Curabitur dignissim orci vitae molestie suscipit.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a consequat ligula. Praesent congue ex nec aliquet euismod. Sed id sem sit amet lorem convallis fringilla. Aliquam magna urna, lobortis at bibendum nec, maximus sit amet leo. Vestibulum ut rutrum arcu. In semper ac odio nec efficitur. Phasellus ultricies ac dolor id feugiat. Pellentesque tincidunt sagittis sapien, in volutpat ligula faucibus a. Duis maximus quis augue vel gravida. In vitae arcu risus. Mauris eu lacus maximus, convallis ligula ut, vehicula augue. Curabitur dignissim orci vitae molestie suscipit.\r\n\r\n\r\n', 1, 1, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
`user_id` mediumint(9) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(254) NOT NULL,
  `userpic` text NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `bio` text NOT NULL,
  `date_joined` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `userpic`, `is_admin`, `bio`, `date_joined`) VALUES
(1, 'Melissa', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'melissacabral@gmail.com', '', 1, 'I build things', '2015-04-01 10:51:28'),
(2, 'second user', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'blob@glarb.com', '', 0, 'Now that we know who you are, I know who I am. I''m not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain''s going to be? He''s the exact opposite of the hero. And most times they''re friends, like you and me! I should''ve known way back when... You know why, David? Because of the kids. They called me Mr Glass.\r\n', '2015-04-01 10:54:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
 ADD PRIMARY KEY (`link_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `category_id` mediumint(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `comment_id` mediumint(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
MODIFY `link_id` mediumint(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `post_id` mediumint(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` mediumint(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
