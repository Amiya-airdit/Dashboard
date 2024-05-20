namespace my.admin;

entity Admin {
    key ID : UUID;
    name : String;
    email : String;
    phone : String;
    departments : Composition of many Department on departments.admin = $self;
    isDeleted : Boolean;
    adminType : String;
    imageurl : String;
    isUserLocatorActive : Boolean;
    selectedGroupList : Composition of many Group on selectedGroupList.admin = $self;
    isUserUpdatePermissionActive : Boolean;
    admingroup : String;
    assignedLayers : Composition of many Layer on assignedLayers.admin = $self;
    zone : String;
    vender : String;
    createdBy : String;
    createdByMailID : String;
    isFirstLogin : Boolean;
    deviceDetails : Composition of many DeviceDetail on deviceDetails.admin = $self;
    lastLoggedInTime : DateTime;
    username : String;
    type : Integer;
    password : String;
    doj : DateTime;
    dob : DateTime;
    createdDateTime : DateTime;
    accountLockedOn : DateTime;
    numberOfAttemptsWithWrongPassword : Integer;
    isAccountLocked : Boolean;
}

entity Department {
    key ID : UUID;
    name : String;
    admin : Association to Admin;
}

entity Group {
    key ID : UUID;
    name : String;
    admin : Association to Admin;
}

entity Layer {
    key ID : UUID;
    name : String;
    admin : Association to Admin;
}

entity DeviceDetail {
    key ID : UUID;
    name : String;
    admin : Association to Admin;
}
