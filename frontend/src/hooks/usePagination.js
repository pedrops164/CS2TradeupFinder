import { useEffect, useState } from 'react';
import { useSearchParams } from 'react-router-dom';

// Custom Hook: usePagination
const usePagination = (apiUrl) => {
  const [data, setData] = useState([]);
  const [totalPages, setTotalPages] = useState(1);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);
  const [searchParams, setSearchParams] = useSearchParams();
  const currentPage = parseInt(searchParams.get('page') || '1', 10);

  useEffect(() => {
    setIsLoading(true);
    setError(null);
    fetch(`${apiUrl}?page=${currentPage}`)
      .then(response => response.json())
      .then(responseData => {
        setData(responseData.tradeups);
        setTotalPages(responseData.total_pages);
        setIsLoading(false);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setError('Failed to fetch data. Please try again later.');
        setIsLoading(false);
      });
  }, [currentPage, apiUrl]);

  const handlePageChange = (newPage) => {
    if (newPage >= 1 && newPage <= totalPages) {
      setSearchParams({ page: newPage });
    }
  };

  return { data, currentPage, totalPages, handlePageChange, isLoading, error };
};

export default usePagination;