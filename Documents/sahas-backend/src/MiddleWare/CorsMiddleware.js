const CorsMiddleware = (req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
 
  if (req.method === 'OPTIONS') {
    return res.sendStatus(200); 
  }
  
  next(); 
};

export default CorsMiddleware;