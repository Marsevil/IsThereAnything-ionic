import { Model } from "./Model";

export class Stock {
    constructor(private id: number, private name: string) {}

    public get Id() {
        return this.id;
    }

    public get Name() {
        return this.name;
    }
}

export class MStock extends Model {
    async getStockList(): Promise<Stock[]> {
        const stocks = new Array<Stock>();
        const db = await MStock.OpenDatabaseConnection();

        const res = await db.query("select * from Stock;");

        res.values?.forEach((value) => {
            stocks.push(new Stock(value["idStock"], value["nameStock"]));
        });

        return stocks;
    }
}
