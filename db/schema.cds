using { managed, cuid, sap.common.CodeList } from '@sap/cds/common';
 
namespace sap.capire.foodbook;
 
entity Building : cuid, managed {

    foodCourt   : Composition of many FoodCourt on foodCourt.parent = $self;

    name    : String(111);

}
 
entity FoodCourt : cuid, managed {

    parent   : Association to Building;

    name    : String(30);

    foodMenu   : Composition of many Food on foodMenu.parent = $self;

    startTime   : Time;

    closingTime : Time;

    isOpen  : Boolean;

}
 
entity Food : cuid, managed {

    parent : Association to FoodCourt;

    cuisine : String(20);

    quantity: Integer;

    calories : String(5);

    allergens : String(100);

    name    : String(30);

    description : String(100);

}
 
entity Order :   cuid, managed {

    building : String;

    foodCourt : String;

    foodName : String;

    status  : Association to Status;

}
 
entity Status : CodeList {

    key code: String enum {

        inqueue = 'I';

        served = 'S'; 

        failed = 'F'; 

    };

    criticality : Integer;

}
 