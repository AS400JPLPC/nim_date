# nim_date
Date Time  avec bornage pour conformiter avec SQL field definition 


>   type
    Date* = ref object of RootObj
      data*   : DateTime
      nullable   : bool
  
    Temps* = ref object of RootObj
      data*   : DateTime
      nullable   : bool


  let fr* = DateTimeLocale(
      MMM: ["Jan", "Fev", "Mar", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Oct",
          "Nov", "Dec"],
      MMMM: ["Janvier", "Fevrier", "Mars", "Avril", "Mai", "Juin", "Juillet",
          "Août", "Septembre", "Octobre", "Novembre", "Décembre"],
      ddd: ["Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim"],
      dddd: ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi",
          "Dimanche"],
    )

 1. newDate*(nullable : bool =true ): Date 
 

 2. newTemps*(nullable : bool = true ): Temps



  *   * :=*(a : var  Date ; s : string)
  *   * :=*(a : var Temps ; s : string)
  *   *  isBool*(a: Date): bool
  *   *  isBool*(a: Temps): bool
  *   * $*(a: Date): string
  *   * $*(a: Temps): string

le travail avec "data" ce fait avec **Nim** et import DATETIME
traitement avec SQl  "nim_wrpgsql" l'introduction de null est un état différent de 00010101  exmeple date de livraison non enregistrer = null  
mais les dates initialiser elle sont bien 00010101  ambiguité dut à la mise en oeuvre SQl considérant impossible en gestion   
Avant d'avoir Null on mettait la date dans une zone numerique et zéros en gestion servait de null dans les tables


