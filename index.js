const axios = require('axios');
(async () => {
    const response = await axios('https://api.github.com/');
    const userUrl = response.data.user_url;
    console.log(userUrl);
})();