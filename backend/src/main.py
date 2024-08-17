from backend.app.database import get_tradeup_dataframe
from backend.src.solvers.solver_manager import search_solve_tradeup, tradeup_solver_all, tradeup_solver_double, tradeup_solver_single, SearchSpace

def solve(search_space: SearchSpace):
    df = get_tradeup_dataframe()
    search_solve_tradeup(df, search_space)

if __name__ == '__main__':
    solve()
