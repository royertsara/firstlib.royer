#' Données de comptage vélo – Boucles de Nantes
#'
#' Ce jeu de données contient les comptages horaires des boucles de mesure
#' du trafic cycliste à Nantes. Chaque ligne correspond à une boucle et un jour
#' donné, avec les volumes de passages pour chaque heure de la journée.
#'
#' @format Un data frame avec 960 lignes et 32 colonnes :
#' \describe{
#'   \item{Numéro de boucle}{Identifiant unique de la boucle de comptage}
#'   \item{Jour}{Date brute du comptage}
#'   \item{00}{Nombre de passages entre 00h00 et 00h59}
#'   \item{01}{Nombre de passages entre 01h00 et 01h59}
#'   \item{02}{Nombre de passages entre 02h00 et 02h59}
#'   \item{03}{Nombre de passages entre 03h00 et 03h59}
#'   \item{04}{Nombre de passages entre 04h00 et 04h59}
#'   \item{05}{Nombre de passages entre 05h00 et 05h59}
#'   \item{06}{Nombre de passages entre 06h00 et 06h59}
#'   \item{07}{Nombre de passages entre 07h00 et 07h59}
#'   \item{08}{Nombre de passages entre 08h00 et 08h59}
#'   \item{09}{Nombre de passages entre 09h00 et 09h59}
#'   \item{10}{Nombre de passages entre 10h00 et 10h59}
#'   \item{11}{Nombre de passages entre 11h00 et 11h59}
#'   \item{12}{Nombre de passages entre 12h00 et 12h59}
#'   \item{13}{Nombre de passages entre 13h00 et 13h59}
#'   \item{14}{Nombre de passages entre 14h00 et 14h59}
#'   \item{15}{Nombre de passages entre 15h00 et 15h59}
#'   \item{16}{Nombre de passages entre 16h00 et 16h59}
#'   \item{17}{Nombre de passages entre 17h00 et 17h59}
#'   \item{18}{Nombre de passages entre 18h00 et 18h59}
#'   \item{19}{Nombre de passages entre 19h00 et 19h59}
#'   \item{20}{Nombre de passages entre 20h00 et 20h59}
#'   \item{21}{Nombre de passages entre 21h00 et 21h59}
#'   \item{22}{Nombre de passages entre 22h00 et 22h59}
#'   \item{23}{Nombre de passages entre 23h00 et 23h59}
#'   \item{Total}{Nombre total de passages sur la journée}
#'   \item{Probabilité de présence d'anomalies}{None,Faible,Forte}
#'   \item{Jour de la semaine}{Jour de la semaine (lundi, mardi, etc.)}
#'   \item{Boucle de comptage}{Nom ou libellé de la boucle}
#'   \item{Date formatée}{Date convertie au bon format R (Date)}
#'   \item{Vacances}{Indique si le jour est dans une période de vacances scolaires}
#' }
#'
#' @source <https://data.nantesmetropole.fr/explore/dataset/244400404_comptages-velo-nantes-metropole/table/?disjunctive.boucle_num&disjunctive.jour_de_la_semaine&disjunctive.boucle_libelle&sort=jour>
"df_velo"
