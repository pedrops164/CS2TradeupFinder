import React from 'react';
import usePagination from '../hooks/usePagination';
import Pagination from '../components/Pagination';
import TradeupCensored from '../components/TradeupCensored';

const TradeupsPurchasable = () => {
  const { data: purchasableTradeups, currentPage, totalPages, handlePageChange, isLoading, error } = usePagination('/api/tradeups/purchasable');

  if (isLoading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>{error}</div>;
  }

  return (
    <div className="tradeup-subpage">
      <h2>Purchasable Tradeups</h2>
      <div className="tradeup-list">
        {purchasableTradeups.map(tradeup => (
          <TradeupCensored key={tradeup.tradeup_id} tradeup={tradeup} />
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

export default TradeupsPurchasable;