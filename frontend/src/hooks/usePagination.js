import { useEffect, useState } from 'react';
import { useSearchParams } from 'react-router-dom';
import { useApi } from '../contexts/ApiProvider';

// Custom Hook: usePagination
const usePagination = ({ apiUrl, query }) => {
  const [data, setData] = useState();
  const [error, setError] = useState();
  const [totalPages, setTotalPages] = useState();
  const [searchParams, setSearchParams] = useSearchParams();
  const currentPage = parseInt(searchParams.get('page') || '1', 10);
  const api = useApi();

  useEffect(() => {
    (async () => {
      const response = await api.get(apiUrl, { page: currentPage, ...query });
      if (response.ok) {
        const responseData = response.body;
        setError(null);
        setData(responseData);
        setTotalPages(responseData.total_pages);
      } else {
        setError(response.body.error);
        setData(null);
        setTotalPages(null);
      }
    })();
  }, [api, currentPage, apiUrl, query ]);

  const handlePageChange = (newPage) => {
    if (newPage >= 1 && newPage <= totalPages) {
      setSearchParams({ page: newPage });
    }
  };

  return { data, error, currentPage, totalPages, handlePageChange };
};

export default usePagination;