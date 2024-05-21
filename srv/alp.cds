namespace mydash;

service UsrdsbrdService {
  @readonly entity usrcnt {
    adminType     : String @title:'adminType';
    activeCount   : Integer @title:'activeCount';
    inactiveCount : Integer @title:'inactiveCount';
  }
}
