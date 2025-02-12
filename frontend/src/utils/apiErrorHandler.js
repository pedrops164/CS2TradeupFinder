/**
 * Handles API error responses and returns appropriate error messages
 * @param {Response} response - The fetch Response object
 * @returns {Promise<string>} A promise that resolves to an error message
 */
export const handleApiError = async (response) => {
    try {
        const data = response.body;
        
        switch (response.status) {
            case 429:
                return 'Rate limit exceeded. Please wait a moment before trying again.';
            
            case 400:
                return data.error || 'Invalid request.';
                
            case 401:
                return 'Authentication required. Please log in.';
                
            case 403:
                return 'Access denied. You do not have permission to perform this action.';
                
            case 404:
                return 'Resource not found.';
                
            case 500:
                return 'Server error. Please try again later.';
                
            default:
                return data.error || `An error occurred (Status: ${response.status})`;
        }
    } catch (error) {
        // If response cannot be parsed as JSON
        return `Network error: ${response.statusText || 'Unknown error'}`;
    }
};