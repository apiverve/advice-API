declare module '@apiverve/advice' {
  export interface adviceOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface adviceResponse {
    status: string;
    error: string | null;
    data: any;
    code?: number;
  }

  export default class adviceWrapper {
    constructor(options: adviceOptions);

    execute(callback: (error: any, data: adviceResponse | null) => void): Promise<adviceResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: adviceResponse | null) => void): Promise<adviceResponse>;
    execute(query?: Record<string, any>): Promise<adviceResponse>;
  }
}
