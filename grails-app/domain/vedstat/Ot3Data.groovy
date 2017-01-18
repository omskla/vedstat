package vedstat

class Ot3Data {
    String quarter
    String yyyy

    Integer itogo
    Integer more50
    Integer more50Ot
    Integer itogoWorkers
    Integer kolRabAttest
    Integer kolRabMestOt
    Integer kolRabOtHelp
    Integer kolRabOtSMI
    Integer kolobrash
    Integer kolMeropr
    Integer kolzased
    MunicArea area



    static constraints = {
         quarter        inList: ['I квртал','II квртал','III квртал','IV квртал']     , nullable: false
         yyyy           inList: ['2013','2014','2015','2016','2017']                  , nullable: false
         itogo          nullable: true
         more50         nullable: true
         more50Ot       nullable: true
         itogoWorkers   nullable: true
         kolRabAttest   nullable: true
         kolRabMestOt   nullable: true
         kolRabOtHelp   nullable: true
         kolRabOtSMI    nullable: true
         kolobrash      nullable: true
         kolMeropr      nullable: true
         kolzased       nullable: true
         area           nullable: false
    }

    String toString(){
       quarter+" "+yyyy
    }
}
