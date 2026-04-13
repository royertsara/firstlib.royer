#--------Filtrer les trajets présentant une anomalie
#'
#' Cette fonction filtre les lignes d'un tableau de trajets pour ne conserver
#' que celles où la probabilité d'anomalie est manquante.
#'
#' @param trajet Un data.frame ou tibble contenant une colonne
#'   `Probabilité de présence d'anomalies`.
#'
#' @return Un tibble filtré.
#'
#' @importFrom dplyr filter
#'
#' @export
filtre_anomalie <- function(trajet){
  trajet |>
    filter(is.na(`Probabilité de présence d'anomalies`))
}

#----------Compter le nombre total de trajets
#'
#' Cette fonction calcule la somme de la colonne `Total` d'un tableau de trajets.
#'
#' @param trajet Un data.frame ou tibble contenant une colonne `Total`.
#'
#' @return Un entier correspondant au nombre total de trajets.
#'
#' @importFrom dplyr pull
#'
#' @export
compter_nombre_trajets <- function(trajet){
  trajet |>
    pull(Total) |>
    sum()
}

#--------Compter le nombre de boucles distinctes
#'
#' Cette fonction renvoie le nombre de valeurs distinctes dans la colonne
#' `Numéro de boucle`.
#'
#' @param trajet Un data.frame ou tibble contenant une colonne `Numéro de boucle`.
#'
#' @return Un entier correspondant au nombre de boucles distinctes.
#'
#' @importFrom dplyr pull n_distinct
#'
#' @export
compter_nombre_boucle <- function(trajet){
  trajet |>
    pull(`Numéro de boucle`) |>
    n_distinct()
}



#---------- Trouver le trajet avec le nombre maximal de passages
#'
#' Cette fonction identifie la ligne du tableau ayant la valeur maximale
#' dans la colonne `Total`.
#'
#' @param trajet Un data.frame ou tibble contenant les colonnes `Total`,
#'   `Boucle de comptage` et `Jour`.
#'
#' @return Un tibble contenant le trajet maximal.
#'
#' @importFrom dplyr slice_max select
#'
#' @export
trouver_trajet_max <- function(trajet){
  trajet |>
    slice_max(Total) |>
    select(`Boucle de comptage`, Jour, Total)
}



#----------Calculer la distribution des trajets par jour de la semaine
#'
#' Cette fonction compte le nombre total de trajets par jour de la semaine,
#' pondéré par la colonne `Total`.
#'
#' @param trajet Un data.frame ou tibble contenant les colonnes
#'   `Jour de la semaine` et `Total`.
#'
#' @return Un tibble avec deux colonnes : le jour de la semaine et le nombre
#'   total de trajets.
#'
#' @importFrom dplyr count
#'
#' @export
calcul_distribution_semaine <- function(trajet){
  trajet |>
    count(`Jour de la semaine`, wt = Total, sort = TRUE, name = "trajets")
}

#-------- Visualiser la distribution des trajets par jour de la semaine
#'
#' Cette fonction filtre les anomalies, calcule la distribution des trajets
#' par jour de la semaine, recode les jours en labels textuels, puis génère
#' un graphique en barres.
#'
#' @param trajet Un data.frame ou tibble contenant au minimum les colonnes
#'   `Probabilité de présence d'anomalies`, `Jour de la semaine` et `Total`.
#'
#' @return Un objet ggplot représentant la distribution hebdomadaire.
#'
#' @importFrom dplyr mutate
#' @importFrom forcats fct_recode
#' @importFrom ggplot2 ggplot aes geom_col
#'#' @export
plot_distribution_semaine <- function(trajet) {
  trajet_weekday <- trajet |>
    filtre_anomalie() |>
    calcul_distribution_semaine() |>
    mutate(
      jour = fct_recode(
        factor(`Jour de la semaine`),
        "lundi" = "1",
        "mardi" = "2",
        "mercredi" = "3",
        "jeudi" = "4",
        "vendredi" = "5",
        "samedi" = "6",
        "dimanche" = "7"
      )
    )

  ggplot(trajet_weekday) +
    aes(x  = jour, y = trajets) +
    geom_col()
}



