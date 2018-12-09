######################################read the database#######################################
base<-read.csv("C://Users//lenovo//Desktop//servicio//eder2017//historiavida.csv")
##########################subset of the variables for the treatment###########################
subbase<-data.frame(base$edad_act,base$trabajo,base$pos_tra,base$tam_tra,base$tiempo_tra,
                    base$acceso_tra,base$sexo)
#################################subset by age groups#########################################
eder50_54<-subset(subbase,(subbase$base.edad_act<=54 & subbase$base.edad_act>=50))
eder25_29<-subset(subbase,(subbase$base.edad_act<=29 & subbase$base.edad_act>=25))
######################################subset by work##########################################
sube5<-subset(eder50_54,eder50_54$base.trabajo==1)
sube2<-subset(eder25_29,eder25_29$base.trabajo==1)
#####################################recode the age###########################################
#25-29
sube2$base.edad_act<-as.numeric(as.character(sube2$base.edad_act))
sube2$base.edad_act[sube2$base.edad_act<=29 & sube2$base.edad_act>=25]<-1
#50-54
sube5$base.edad_act<-as.numeric(as.character(sube5$base.edad_act))
sube5$base.edad_act[sube5$base.edad_act<=54 & sube5$base.edad_act>=50]<-2
#################################factor the variables#########################################
#25-29
sube2$base.sexo<-factor(sube2$base.sexo,levels = c(1,2),labels = c("Hombre","Mujer"))
sube2$base.pos_tra<-factor(sube2$base.pos_tra,levels = c(0,1,2,3,4,5,6,9), 
                            labels = c("No laboraba","Patron","Trabajaba por su cuenta"
                                       ,"Trabajador a sueldo fijo","Trabajador por comision",
                                       "Trabajador sin pago","Otro","No sabe"))
sube2$base.tam_tra<-factor(sube2$base.tam_tra,levels = c(0,1,2,3,4,5,9),
                            labels = c("No laboraba","Una persona","De 2 a 5","de 6 a 15",
                                       "De 16 a 50","Mas de 50","Otro"))
sube2$base.tiempo_tra<-factor(sube2$base.tiempo_tra,levels = c(0,1,2,3,4,9),
                               labels = c("No laboraba","Menos de 15 horas","15 a 34 horas",
                                          "35 a 48 horas","49 horas y mas","No sabe"))
sube2$base.acceso_tra<-factor(sube2$base.acceso_tra,levels = c(0,1,2,3,4,5,6,9),
                          labels = c("Sin acceso","IMSS","Hospital naval, militar o de pemex",
                          "ISSSTE","ISSSTE estatal","Otra institucion medica",
                          "No recibia atencion medica","No sabe"))
#50-54
sube5$base.sexo<-factor(sube5$base.sexo,levels = c(1,2),labels = c("Hombre","Mujer"))
sube5$base.pos_tra<-factor(sube5$base.pos_tra,levels = c(0,1,2,3,4,5,6,9), 
                           labels = c("No laboraba","Patron","Trabajaba por su cuenta"
                                      ,"Trabajador a sueldo fijo","Trabajador por comision",
                                      "Trabajador sin pago","Otro","No sabe"))
sube5$base.tam_tra<-factor(sube5$base.tam_tra,levels = c(0,1,2,3,4,5,9),
                           labels = c("No laboraba","Una persona","De 2 a 5","de 6 a 15",
                                      "De 16 a 50","Mas de 50","Otro"))
sube5$base.tiempo_tra<-factor(sube5$base.tiempo_tra,levels = c(0,1,2,3,4,9),
                              labels = c("No laboraba","Menos de 15 horas","15 a 34 horas",
                                         "35 a 48 horas","49 horas y mas","No sabe"))
sube5$base.acceso_tra<-factor(sube5$base.acceso_tra,levels = c(0,1,2,3,4,5,6,9),
                              labels = c("Sin acceso","IMSS","Hospital naval, militar o de pemex",
                                         "ISSSTE","ISSSTE estatal","Otra institucion medica",
                                         "No recibia atencion medica","No sabe"))
#################################construct the tables#########################################
#25-29
tabpostra2<-table(sube2$base.pos_tra,sube2$base.sexo)
tabedad2<-table(sube2$base.edad_act,sube2$base.sexo)
tabtamtra2<-table(sube2$base.tam_tra,sube2$base.sexo)
tabtiemtra2<-table(sube2$base.tiempo_tra,sube2$base.sexo)
tabacctra2<-table(sube2$base.acceso_tra,sube2$base.sexo)
#50-54
tabpostra5<-table(sube5$base.pos_tra,sube5$base.sexo)
tabedad5<-table(sube5$base.edad_act,sube5$base.sexo)
tabtamtra5<-table(sube5$base.tam_tra,sube5$base.sexo)
tabtiemtra5<-table(sube5$base.tiempo_tra,sube5$base.sexo)
tabacctra5<-table(sube5$base.acceso_tra,sube5$base.sexo)
################################write csv format##############################################
#25-29
write.csv(tabedad2,"C://Users//lenovo//Desktop//servicio//eder2017//edad24.csv")
write.csv(tabpostra2,"C://Users//lenovo//Desktop//servicio//eder2017//posicion24.csv")
write.csv(tabtamtra2,"C://Users//lenovo//Desktop//servicio//eder2017//tamaño24.csv")
write.csv(tabtiemtra2,"C://Users//lenovo//Desktop//servicio//eder2017//tiempo24.csv")
write.csv(tabacctra2,"C://Users//lenovo//Desktop//servicio//eder2017//accion24.csv")
#50-54
write.csv(tabedad5,"C://Users//lenovo//Desktop//servicio//eder2017//edad50.csv")
write.csv(tabpostra5,"C://Users//lenovo//Desktop//servicio//eder2017//posicion50.csv")
write.csv(tabtamtra5,"C://Users//lenovo//Desktop//servicio//eder2017//tamaño50.csv")
write.csv(tabtiemtra5,"C://Users//lenovo//Desktop//servicio//eder2017//tiempo50.csv")
write.csv(tabacctra5,"C://Users//lenovo//Desktop//servicio//eder2017//accion50.csv")
