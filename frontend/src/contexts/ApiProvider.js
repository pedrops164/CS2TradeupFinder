import { createContext, useContext } from "react";
import ApiClient from "../ApiClient";

const ApiContext = createContext();

export default function ApiProvider({children}) {
    const api = new ApiClient();

    return (
        <ApiContext.Provider value={api}>
            {children}
        </ApiContext.Provider>
    );
}

export function useApi() {
    return useContext(ApiContext);
}