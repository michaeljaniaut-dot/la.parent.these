const faunadb = require('faunadb');

exports.handler = async (event, context) => {
  // Configuration CORS
  const headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'Content-Type',
    'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
    'Content-Type': 'application/json'
  };

  // Gérer les requêtes OPTIONS (preflight)
  if (event.httpMethod === 'OPTIONS') {
    return { statusCode: 200, headers, body: '' };
  }

  const postId = event.queryStringParameters?.postId;
  
  if (!postId) {
    return {
      statusCode: 400,
      headers,
      body: JSON.stringify({ error: 'postId requis' })
    };
  }

  // Solution simple avec Netlify Blob Store
  try {
    const { getStore } = await import('@netlify/blobs');
    const store = getStore('blog-likes');

    if (event.httpMethod === 'GET') {
      // Récupérer le nombre de likes
      const likes = await store.get(postId);
      return {
        statusCode: 200,
        headers,
        body: JSON.stringify({ 
          postId, 
          likes: likes ? parseInt(likes) : 0 
        })
      };
    }

    if (event.httpMethod === 'POST') {
      // Incrémenter ou décrémenter les likes
      const body = JSON.parse(event.body || '{}');
      const action = body.action; // 'like' ou 'unlike'
      
      const currentLikes = await store.get(postId);
      let newLikes = currentLikes ? parseInt(currentLikes) : 0;
      
      if (action === 'like') {
        newLikes++;
      } else if (action === 'unlike' && newLikes > 0) {
        newLikes--;
      }
      
      await store.set(postId, newLikes.toString());
      
      return {
        statusCode: 200,
        headers,
        body: JSON.stringify({ 
          postId, 
          likes: newLikes 
        })
      };
    }

    return {
      statusCode: 405,
      headers,
      body: JSON.stringify({ error: 'Méthode non autorisée' })
    };

  } catch (error) {
    console.error('Erreur:', error);
    return {
      statusCode: 500,
      headers,
      body: JSON.stringify({ error: 'Erreur serveur', details: error.message })
    };
  }
};
