import React from 'react';
import usePagination from '../hooks/usePagination';
import Pagination from '../components/Pagination';
import Tradeup from '../components/Tradeup';

const TradeupsPurchased = () => {
  const { data: purchasedTradeups, currentPage, totalPages, handlePageChange, isLoading, error } = usePagination('/api/tradeups/purchased');

  if (isLoading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>{error}</div>;
  }

  return (
    <div className="tradeup-subpage">
      <h2>Purchased Tradeups</h2>
      <div className="tradeup-list">
        {purchasedTradeups.map(tradeup => (
          <Tradeup key={tradeup.tradeup_id} tradeup={tradeup} />
        ))}
      </div>
      <Pagination
        currentPage={currentPage}
        totalPages={totalPages}
        handlePageChange={handlePageChange}
      />
    </div>
  );
};

export default TradeupsPurchased;