import {
    SQLiteConnection,
    CapacitorSQLite,
    SQLiteDBConnection,
} from "@capacitor-community/sqlite";

export abstract class Model {
    public static readonly DB_NAME = "IsThereAnything-storage";
    private static readonly SQLITE = new SQLiteConnection(CapacitorSQLite);
    private static DB: SQLiteDBConnection;

    public static async CreateIfNotExist(): Promise<void> {
        const exist = await Model.SQLITE.isDatabase(Model.DB_NAME);
        if (!exist.result) {
            //await Model.SQLITE.copyFromAssets();
            await Model.SQLITE.copyFromAssets();
        }
    }

    public static async OpenDatabaseConnection(): Promise<SQLiteDBConnection> {
        const res = await this.SQLITE.isConnection(Model.DB_NAME);
        if (!res.result) {
            await Model.CreateIfNotExist();

            Model.DB = await Model.SQLITE.createConnection(
                Model.DB_NAME,
                false,
                "no-encryption",
                1
            );

            await Model.DB.open();
        }

        return Model.DB;
    }
}
