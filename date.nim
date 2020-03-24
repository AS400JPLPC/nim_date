when not declared(times) :
  import times
when not declared(os) :
  import os
when not declared(parseutils) :
  import parseutils
when not declared(strformat) :
  import strformat

when not declared(Date) :
  
  type
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



  ## define Date Time for Nim format
  proc newDate*(nullable : bool =true ): Date =
    var r : Date
    new(r)
    r.data = parse("0001-01-01", "yyyy-MM-dd")
    r.nullable = nullable
    return r
  
  proc newTemps*(nullable : bool = true ): Temps =
    var t : Temps
    new(t)
    t.data = parse("00:00:00", "HH:mm:ss")
    t.nullable = nullable
    return t


  ## String to  Date Time for Nim format
  proc `:=`*(a : var  Date ; s : string) =
    if s == "" : 
      a.data =parse("0001-01-01", "yyyy-MM-dd")
    else : 
      a.data = parse(s, "yyyy-MM-dd")
    
  proc `:=`*(a : var Temps ; s : string) =
    if s == "" :
      a.data = parse("00:00:00", "HH:mm:ss")
    else :
      a.data = parse(s, "HH:mm:ss")

  proc isBool*(a: Date): bool = return a.nullable
  proc isBool*(a: Temps): bool = return a.nullable


  ## Echo Date and Time
  proc `$`*(a: Date): string =
    if a.data.format("yyyy-MM-dd") == "0001-01-01" and a.isBool == true : return ""
    else :return a.data.format("yyyy-MM-dd")
  proc `$`*(a: Temps): string =
    if a.data.format("HH:mm:ss") == "00:00:00" and a.isBool == true : return ""
    else :return a.data.format("HH:mm:ss")