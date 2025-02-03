import React from 'react';
import usePagination from '../hooks/usePagination';
import Pagination from '../components/Pagination';
import Tradeup from '../components/Tradeup';

const TradeupsPublic = () => {
  const { data: publicTradeups, currentPage, totalPages, handlePageChange, isLoading, error } = usePagination('/api/tradeups/public');

  if (isLoading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>{error}</div>;
  }

  return (
    <div className="tradeup-subpage">
      <h2>Public Tradeups</h2>
      <div className="tradeup-list">
        {publicTradeups.map(tradeup => (
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

export default TradeupsPublic;