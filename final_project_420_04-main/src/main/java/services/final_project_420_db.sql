-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: final_project_420_db
-- Generation Time: 2022-12-14 16:00:37.8340
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `transaction_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `orders_products`;
CREATE TABLE `orders_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orders_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `filename` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `origin` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `ammo` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `transaction_date`) VALUES
(1, 1, 2499.00, NULL),
(2, 1, 2499.00, NULL);

INSERT INTO `products` (`id`, `name`, `category`, `description`, `origin`, `price`, `ammo`) VALUES
(1, 'kilo 141', 'rifles', 'Fully automatic assault rifle with an ergonomic design that improves handling, and a steady fire rate helps stay on target.', 'russia', 2499.00, 30),
(2, 'fal', 'rifles', 'A semi-automatic assault rifle with a high rate of fire for faster follow up shots.', 'england', 2000.00, 20),
(3, 'm4a1', 'rifles', 'A fully automatic, all-purpose assault rifle. Control your shots and this weapon can be very effective at range.', 'belize', 3499.00, 30),
(4, 'fr 5 56', 'rifles', 'A 3 round burst bullpup assault rifle. A well placed burst can be extremely deadly at intermittent ranges.', 'russia', 5000.00, 30),
(5, 'oden', 'rifles', 'A fully automatic bullpup assault rifle maintains a slow cycle rate to help control hard hitting 12.7 x 55mm ammunition.', 'sri lanka', 4700.00, 20),
(6, 'm13', 'rifles', 'Automatic assault rifle featuring a short stroke piston system that keeps the fire rate high and the recoil low.', 'oman', 2200.00, 30),
(7, 'fn scar 17', 'rifles', 'Large caliber, fully automatic assault rifle that provides high damage over long ranges.', 'usa', 2100.00, 20),
(8, 'ram 7', 'rifles', 'A fully automatic bullpup assault rifle with a compact design that lends itself to close-quarter engagements.', 'usa', 2600.00, 30),
(9, 'aug', 'smgs', 'A modular, fully automatic weapon configured for mobility and close range combat.', 'germany', 3999.00, 25),
(10, 'p90', 'smgs', 'An automatic bullpup submachine gun. The unique top mounted magazine hold carries ample high velocity 5.7 x 28mm ammunition.', 'saudi arabia', 4200.00, 50),
(11, 'mp5', 'smgs', 'Full-auto submachine gun. Fast fire rate with low recoil. Good visibility and control while firing.', 'france', 2000.00, 30),
(12, 'uzi', 'smgs', 'A fully automatic open bolt submachine gun. Simple, steady, effective.', 'somalia', 3300.00, 32),
(13, 'pp19 bizon', 'smgs', 'Well-balanced automatic submachine gun with a high capacity helical magazine.', 'canada', 4100.00, 64),
(14, 'mp7', 'smgs', 'Compact by design, this fully automatic weapon has a high rate of fire and low recoil.', 'thailand', 1200.00, 40),
(15, 'striker 45', 'smgs', 'A hard hitting submachine gun chambered in .45 Auto that will shred at longer distances than other weapons in its class. Moderate rate of fire keeps the gun in control while fully automatic.', 'australia', 2300.00, 25),
(16, 'fennec', 'smgs', 'An aggressive full auto submachine gun with buttery smooth recoil and a blazing fast rate of fire that is exceptional for strategic room clearing and holding down the front line.', 'mexico', 5100.00, 25),
(17, 'model 680', 'shotguns', 'A reliable, well-rounded 12 gauge pump-action shotgun.', 'Albania', 2000.00, 8),
(18, 'r9 0', 'shotguns', 'Double barrels provide two rapid shots before each re-chamber.', 'Afghanistan', 3100.00, 14),
(19, '725', 'shotguns', 'Break action shotgun with 2 round capacity. A long back-bored barrel and cylindrical choke keeps spread tight and lethal over extended ranges.', 'Barbados', 1000.00, 2),
(20, 'origin 12', 'shotguns', 'A semi-automatic shotgun with a large ammo capacity allows for continuous firing. Effective at close range.', 'usa', 5000.00, 8),
(21, 'vlk rogue', 'shotguns', 'An agile 12-gauge mag fed shotgun from VLK with extensive options to modify range, stability, and maneuverability.', 'belgium', 3400.00, 8),
(22, 'jak 12', 'shotguns', 'Fully automatic open bolt shotgun with a recoil reducing gas blowback system. This combat shotgun unloads high volumes of lead down range at a steady rate.', 'bolivia', 4400.00, 8),
(23, 'pkm', 'lmgs', 'A fully automatic light machine gun firing 7.62mm ammunition for high damage at a moderate fire rate.', 'brazil', 2200.00, 100),
(24, 'sa87', 'lmgs', 'A fully automatic light machine gun firing 7.62mm ammunition for high damage at a moderate fire rate.', 'cameroon', 3100.00, 30),
(25, 'm91', 'lmgs', 'Robust light machine gun sacrifices mobility for stability. High caliber sustained fire will neutralize targets at long ranges.', 'chad', 2500.00, 100),
(26, 'mg34', 'lmgs', 'Fully automatic weapon with a high rate of fire and punishing 7.92 Mauser ammunition. Salvaged WW2 machine guns are still reliable and deadly on the battlefield.', 'colombia', 3900.00, 50),
(27, 'holger 26', 'lmgs', 'A versatile fully automatic 5.56mm light machine gun. Modular design can be configured for a broad range of engagements.', 'bangladesh', 2500.00, 100),
(28, 'bruen mk9', 'lmgs', 'This air-cooled open bolt 5.56 light machine gun features a competitive rate of fire and excellent stability that will dominate the mid to long range battlefield.', 'quatar', 4100.00, 100),
(29, 'finn lmg', 'lmgs', 'An ultra-light open bolt 5.56 machine gun with a low cyclic rate and advanced recoil controls, giving the FiNN exceptional full-auto accuracy.', 'Cyprus', 2000.00, 75),
(30, 'ebr 14', 'snipers', 'A semi-automatic long range marksman rifle balances rate of fire with lethality.', 'denmark', 2100.00, 10),
(31, 'mk2 carbine', 'snipers', 'Highly accurate lever action rifle. Will neutralize an enemy with one well placed round to the head or chest.', 'djibouti', 3300.00, 6),
(32, 'kar98k', 'snipers', 'Bolt action rifle chambered in 7.92 Mauser. A WW2 relic that is still extremely lethal in the hands of a rebel marksman.', 'algeria', 1250.00, 5),
(33, 'crossbow', 'snipers', 'Silent and agile, this high-performance crossbow fires 20.0″ bolts with exceptional lethality. Exclusive customization, distinct functionality, and unique ammunition types put this weapon in a class of its own. Standard 20.0″ bolts are recoverable, and are undetectable by trophy systems.', 'morocco', 1280.00, 1),
(34, 'dragunov', 'snipers', 'A soviet workhorse chambered in 7.62mm x 54mmR. This gas-operated, semi-automatic sniper rifle allows for rapid follow-up shots.', 'thailand', 1220.00, 10),
(35, 'hdr', 'snipers', 'An anti-material bolt action sniper rifle chambered in 12.7x108mm ammunition. 745 gr bullets have a lower muzzle velocity, but are devastating at very long ranges.', 'haiti', 1800.00, 10),
(36, 'ax 50', 'snipers', 'Hard hitting, bolt action sniper rifle with .50 cal BMG ammunition. Its tungsten sabot tipped bullets are fast and powerful, but require precise shots over long distances.', 'honduras', 2100.00, 5),
(37, 'rytec amr', 'snipers', 'This semi-automatic Anti-Material Rifle is chambered in .50 BMG for dominant long range assaults. A 25x59mm high-explosive payload variant is officially listed as “experimental”, but has been deployed on multiple classified missions with great effectiveness.', 'iraq', 3800.00, 5),
(38, 'riot shield', 'melee', 'Ballistic-proof and explosive-resistant shield with increased melee damage.', 'morocco', 1000.00, 10),
(39, 'knife', 'melee', 'Lethal melee weapon. Straight-edge blade that kills enemies with a single deadly strike.', 'china', 55.00, 10),
(40, 'kali sticks', 'melee', 'Dual wielding batons allow operators to approach their targets with great agility. Sturdy, lightweight design enables rapid attacks for zoning your enemies.', 'thailand', 100.00, 10),
(41, 'dual kodachis', 'melee', 'Hand forged carbon steel blades provide the sharpest edge possible for silently slicing through your enemies.', 'russia', 320.00, 10),
(42, 'x16', 'pistols', 'A semi-automatic pistol chambered in .45 ACP ammunition. A reliable fallback when you find yourself in close quarters.', 'china', 1200.00, 13),
(43, '1911', 'pistols', 'A well-rounded, semi-automatic sidearm with a moderate rate of fire. Slightly more range than your average .45 ACP pistol.', 'china', 1200.00, 7),
(44, '357', 'pistols', 'Double action revolver firing .357 Magnum ammunition for powerful damage over extended ranges.', 'china', 1400.00, 6),
(45, 'm19', 'pistols', 'Semi-automatic 9mm pistol, excellent stability with a rapid cycle rate.', 'china', 1300.00, 7),
(46, '50 gs', 'pistols', 'The most powerful semi-automatic handgun available, deals heavy damage up to intermediate ranges.', 'china', 1500.00, 7),
(47, 'renetti', 'pistols', 'Well rounded semi-auto 9mm pistol. This unassuming sidearm excels in close range combat, and features gunsmithing capabilities unique to the pistol class that permit a variety of engagement strategies.', 'china', 1100.00, 15),
(48, 'sykov', 'pistols', 'A dependable fallback in close quarters, this double-action/single-action sidearm comes with a few custom gunsmith mods that make it an outstanding addition to any arsenal.', 'china', 1200.00, 12),
(49, 'pila', 'launchers', 'Portable infrared surface-to-air missile launcher with a free-fire option. Self-propelled missiles have a higher speed, and moderate explosive yield.', 'china', 6000.00, 1),
(50, 'strela p', 'launchers', '84mm recoilless launcher lobs an explosive projectile at a very high velocity. The unguided armor piercing round has a low explosive yield, but is devastating against vehicles on contact.', 'china', 8000.00, 1),
(51, 'jokr', 'launchers', 'Fire and forget lock-on portable missile launcher with a large explosive yield. Infrared guided missiles take a top-attack trajectory, ensuring destruction of heavily armored vehicles.', 'china', 10000.00, 1),
(52, 'rpg 7', 'launchers', 'Unguided, self-propelled rocket launcher fires a slower projectile with a high-explosive yield.', 'china', 7000.00, 1),
(53, 'claymore', 'grenades', 'Proximity-activated explosive mine.', 'china', 200.00, NULL),
(54, 'frag grenade', 'grenades', ' Cookable fragmentation grenade.', 'china', 140.00, NULL),
(55, 'c4', 'grenades', 'Large explosive that sticks to surfaces and can be detonated remotely.', 'china', 180.00, NULL),
(56, 'semtex', 'grenades', 'Timed sticky grenade', 'china', 150.00, NULL),
(57, 'proximity mine', 'grenades', '', 'china', 200.00, NULL);

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'java', 'java@java.com', 'java'),
(2, 'ruhan', 'ruhan', 'ruhan'),
(3, 'skjdfhksjdhf', 'kjsdhfksdhf@hotmail.com', 'asdasd'),
(4, 'lmi', 'gmm@gmail.com', 'gmm'),
(5, 'lemieux', 'lemi@gmail.com', 'lemieux');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;