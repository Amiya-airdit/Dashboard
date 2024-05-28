namespace mydash;

service UsrdsbrdService {
  // @readonly
  entity usrcnt {
    adminType     : String  @title: 'Admin Type';
    activeCount   : Integer @title: 'Active Count';
    inactiveCount : Integer @title: 'Inactive Count';
  }
}
