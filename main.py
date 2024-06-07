from presets.tradeups import create_tradeup_from_dataframe
from db import get_tradeup_dataframe
from solvers.solver import solve_tradeup

if __name__ == '__main__':
    df = get_tradeup_dataframe()
    tradeup_pool = create_tradeup_from_dataframe(df, "milspec_bg", stattrak=True)
    solve_tradeup(tradeup_pool)