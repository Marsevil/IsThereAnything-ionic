import { Model } from "./Model";

export class InitDB extends Model {
    public async initDB() {
        const db = await InitDB.OpenDatabaseConnection();

        return db.query("select * from Use;");
    }
}
