/**
 * Basic Example - {{title}} API
 *
 * This example demonstrates how to use the {{title}} API.
 * Make sure to set your API key in the .env file or replace '[YOUR_API_KEY]' below.
 */

require('dotenv').config();
const {{apid}}API = require('../index.js');

// Initialize the API client
const api = new {{apid}}API({
    api_key: process.env.API_KEY || '[YOUR_API_KEY]'
});

// Example query
{{exampleQuery}}

// Make the API request
async function main() {
    try {
        console.log('Making request to {{title}} API...\n');
        const data = await api.execute(query);
        console.log('Response:');
        console.log(JSON.stringify(data, null, 2));
    } catch (error) {
        console.error('Error:', error.message);
        if (error.response && error.response.data) {
            console.error('API Error:', error.response.data);
        }
    }
}

main();
