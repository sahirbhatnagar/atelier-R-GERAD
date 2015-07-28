## ----setup, echo=FALSE,warning=FALSE,message=FALSE,cache=FALSE, results='hide'----
#options(width=60, digits=2)
set.seed(45)
opts_chunk$set(echo = TRUE, tidy = FALSE, cache = FALSE, warning = FALSE, message = FALSE)
knit_hooks$set(crop = hook_pdfcrop)
opts_template$set(
    fig.large = list(fig.width = 7, fig.height = 5, fig.align = 'center', crop = TRUE, fig.pos = 'h'),
    fig.small = list(fig.width = 6, fig.height = 4, fig.align = 'center', crop = TRUE, fig.pos = 'h'),
    fig.full = list(fig.width = 8, fig.height = 6, fig.align = 'center', crop = TRUE, fig.pos = 'h')
)
# smaller font size for chunks
#opts_chunk$set(size = 'tiny')
thm <- knit_theme$get("bclear")
knit_theme$set(thm)
options(width=78, digits = 2)
knit_hooks$set(rcode=function(before, options, envir)
{
if (before)
sprintf('\\begin{rcode}\\label{%s}', options$label)
else
'\\end{rcode}'
})

knit_hooks$set(frame=function(before, options, envir)
{
if (before)
sprintf('\\begin{frame}[fragile]\\hfill{}', options$label)
else
'\\end{frame}'
})
knitr::read_chunk("slides-packages.R")

## ----required-packages,echo=FALSE,warning=FALSE,message=FALSE------------

## ----rcode=TRUE----------------------------------------------------------
c(1,2,3) + c(4,5,6)

## ----label, rcode=TRUE, eval=FALSE---------------------------------------
## # Démarrer l'interface pour le documentation
## # et naviguer les différentes resources
## help.start()
## 
## # trouver l'aide pour la fonction rnorm
## ?rnorm
## 
## # Connaitre le répertoire de travail
## getwd()

## ----rcode=TRUE, eval=FALSE----------------------------------------------
## # On additionne
## 39 + 3
## 
## # On soustrait
## 58 - 16
## 
## # On multiplie
## 6 * 7
## 
## # Et on peut même diviser
## 8 / 3

## ----rcode=TRUE, eval=FALSE----------------------------------------------
## # Générer deux vecteurs de nombres pseudo-aléatoires
## # issus d’une loi normale centrée réduite.
## x <- rnorm(50)
## y <- rnorm(50)
## 
## # Graphique des couples (x, y)
## plot(x, y)
## 
## # Graphique d'un histogramme de x
## hist(x)

## ----rcode=TRUE, eval=FALSE----------------------------------------------
## # voir la matière de x
## x
## 
## # voir les objets de votre workspace
## ls()
## 
## # supprimer les deux vecteurs x et y
## rm(x,y)
## 
## # voir la matière de x
## x
## 
## # voir les objets de votre workspace
## ls()

## ----rcode=TRUE, eval=FALSE----------------------------------------------
## # Générer la suite 1, 2, ..., 20.
## x <- 1:20
## 
## # créer un autre vecteur en fonction de x
## y <- 2*x+3
## 
## # créer un data frame de deux colonnes et
## # voir sa matière
## dt <- data.frame(x, y)
## dt
## 
## # estimer un modèle linéaire et voir les
## # résultats
## fit <- lm(y ~ x, data = dt)
## summary(fit)

## ----rcode=TRUE, eval=FALSE----------------------------------------------
## # La fonction ’seq’ sert à générer des suites
## # plus générales.
## seq(from = -5, to = 10, by = 3)
## seq(from = -5, length = 10)
## 
## # La fonction ’rep’ sert à répéter des valeurs.
## rep(1, 5) # répéter 1 cinq fois
## rep(1:5, 5) # répéter le vecteur 1,...,5 cinq fois
## rep(1:5, each = 5) # répéter chaque élément cinq fois

## ----rcode=TRUE, eval=FALSE----------------------------------------------
## # Arithmétique vectorielle
## v <- 1:12  # initialisation d’un vecteur
## v + 2 # additionner 2 à chaque élément de v
## v * -12:-1 # produit élément par élément
## v + 1:3 # le vecteur le plus court est recyclé
## 
## # Vecteur de nombres uniformes sur
## # l’intervalle [1, 10]. Le point-virgule
## # signifie une nouvelle ligne
## v <- runif(12, min = 1, max = 10); v
## 
## # Pour afficher le résultat d’une affectation,
## # placer la commande entre parenthèses.
## ( v <- runif(12, min = 1, max = 10) )

## ----rcode=TRUE, eval=FALSE----------------------------------------------
## # trouver le répertoire où se trouve le
## # jeux de donnés 'morley', qui est inclu avec
## # l'installation de R
## filepath <- system.file("data", "morley.tab",
##             package="datasets")
## 
## # importer les donnés dans un objet appeller 'mm'
## mm <- read.table(filepath)
## 
## # Graphique
## plot(mm$Expt, mm$Speed,
## main="Speed of Light Data", xlab="Experiment No.")
## 
## # Terminer la session
## q()

## ----rcode=TRUE, tidy=FALSE, eval=FALSE----------------------------------
## # chercher la rubrique d'aide pour racine carrée
## ?sqrt
## 
## # on voit que la fonction prend un argument
## sqrt(49)

## ----rcode=TRUE, tidy=FALSE, eval=FALSE, size='footnotesize'-------------
## # chercher la rubrique d'aide pour logarithme
## ?log
## 
## # on précise pas de valeur pour le second argument
## log(2)
## 
## # On peut spécifier le second argument en l'appelant par son nom
## log(2, base = exp(1))

## ----rcode=TRUE, eval = TRUE, tidy = FALSE-------------------------------
c(1, 2, 5)

## ----rcode=TRUE, eval = FALSE, tidy = FALSE------------------------------
## c(1, 2.5, 4.5) # numeric
## c(1L, 6L, 10L) # integer
## c("ceci sont", "des characters") #character
## c(TRUE, FALSE, T, F) # logical

## ----rcode=TRUE, eval = TRUE, tidy = FALSE, size = 'footnotesize'--------
int_var <- c(1L, 6L, 10L)
typeof(int_var)
is.integer(int_var)
is.atomic(int_var)

## ----rcode=TRUE, eval = TRUE, tidy = FALSE-------------------------------
dbl_var <- c(1, 2.5, 4.5)
typeof(dbl_var)
is.double(dbl_var)
is.atomic(dbl_var)

## ----rcode=TRUE, eval = TRUE, tidy = FALSE-------------------------------
# combiner un character et integer donne un character
str(c("a", 1))

## ----rcode=TRUE, eval = TRUE, tidy = FALSE, size = 'footnotesize'--------
x <- c(FALSE, FALSE, TRUE)
as.numeric(x)
# Nombre total de TRUE
sum(x)
# La proportion de TRUE
mean(x)

## ----rcode=TRUE, eval = TRUE, tidy = FALSE, size = 'footnotesize'--------
(x <- list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.3, 5.9)))

## ----rcode=TRUE, eval = TRUE, tidy = FALSE, size = 'normalsize'----------
# rempli par colonne par défaut
matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)

## ----rcode=TRUE, eval = TRUE, tidy = FALSE, size = 'normalsize'----------
# automatiquement converti en données homogène
matrix(c(1,2,3,"a","b","c"), nrow = 2, ncol = 3)

## ----rcode=TRUE, eval = TRUE, tidy = FALSE, size = 'normalsize'----------
# une colonne 'id' pour identifier les sujets
# une colonne 'age' pour leur age
data.frame(id = c("didier","patrice","laurent"),
           age = c(37,34,32))

## ----rcode=TRUE, eval = TRUE, tidy = TRUE--------------------------------
2+3;pi;cos(pi/4)

## ----rcode=TRUE, eval = TRUE, tidy = TRUE--------------------------------
a <- 5
a
b <- a - 2
b

## ----rcode=TRUE, eval = TRUE, tidy = TRUE--------------------------------
(a <- 2 + 3)

## ----rcode=TRUE, eval = FALSE, tidy = FALSE------------------------------
## # création d'un vecteur
## x <- c(a = -1, b = 2, c = 8, d = 10)
## 
## # extraction par position
## x[1]
## 
## # extraction par étiquette
## x["c"]
## 
## # remplacer le deuxième élément par 5
## x[2] <- 5

## ----rcode=TRUE, eval = FALSE, tidy = FALSE------------------------------
## # création d'un data frame
## d <- data.frame(Noms = c("Pierre", "Jean", "Jacques"),
## Age = c(42, 34, 19),
## Fumeur = c(TRUE, TRUE, FALSE))
## 
## d[1, ] # première rangé
## 
## d[ ,1] # première colonne
## 
## d[3,2] # troisième rangé, deuxième colonne

## ----rcode=TRUE, eval = FALSE, tidy = FALSE------------------------------
## # crétion d'un list
## x <- list(joueur = c("V", "C"),
## 		  score = c(10, 12))
## 		
## # premier élément de la liste
## x[[1]]
## 
## # 1er élément du 2e élément
## x[[2]][1]

## ----rcode=TRUE, eval = FALSE, tidy = FALSE------------------------------
## DF <- read.table("bodyfat.csv")

## ----rcode=TRUE, eval = FALSE, tidy = FALSE------------------------------
## # installer des packages pour créer des rapports
## # reproductibles
## install.packages(c("knitr","rmarkdown"))

