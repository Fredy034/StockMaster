import { config } from 'dotenv';
config();

export const PORT_INDEX = process.env.PORT_INDEX || 3000;
export const PORT_SERVER = process.env.PORT_SERVER || 3001;
export const USER = process.env.USER;
export const PASSWORD = process.env.PASSWORD;
export const DBCLUSTER = process.env.DBCLUSTER;
export const DBNAME = process.env.DBNAME;
export const COLLECTION = process.env.COLLECTION;
export const DBID = process.env.DBID;
export const HOST_POSTGRE = process.env.HOST_POSTGRE;
export const USER_POSTGRE = process.env.USER_POSTGRE;
export const PASSWORD_POSTGRE = process.env.PASSWORD_POSTGRE;
export const DB_POSTGRE = process.env.DB_POSTGRE;
export const PORT_POSTGRE = process.env.PORT_POSTGRE || 5432;

export const MONGO_URI = `mongodb+srv://${USER}:${PASSWORD}@${DBCLUSTER}.${DBID}.mongodb.net/`;
