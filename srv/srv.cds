using { sap.capire.foodbook as db} from '../db/schema';

service FoodBookService {

    entity Building as projection on db.Building;
    entity Food as projection on db.Food;
    entity FoodCourt as projection on db.FoodCourt;
    entity Order as projection on db.Order;

}
annotate FoodBookService.Building with @odata.draft.enabled;