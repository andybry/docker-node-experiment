const axios = require('axios');

const userRequest = token => ({
    url: 'https://api.github.com/user',
    headers: {
        authorization: `token ${token}`
    }
});

(async () => {
    const { GITHUB_API_TOKEN } = process.env;
    const request = userRequest(GITHUB_API_TOKEN);
    try {
        const response = await axios(request);
        const name = response.data.name;
        console.log(`User's name is: ${name}`);
    } catch (e) {
        console.log(e);
    }
})();