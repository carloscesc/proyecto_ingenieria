module.exports = function(app, passport) {
 app.get('/', function(req, res){
  res.render('index.ejs');
 });

 app.get('/login', function(req, res){
  res.render('login.ejs', {message:req.flash('loginMessage')});
 });

 app.post('/login', passport.authenticate('local-login', {
  successRedirect: '/dashboard',
  failureRedirect: '/login',
  failureFlash: true
 }),
  function(req, res){
   if(req.body.remember){
    req.session.cookie.maxAge = 1000 * 60 * 3;
   }else{
    req.session.cookie.expires = false;
   }
   res.redirect('/');
  });

 app.get('/login', function(req, res){
  res.render('login.ejs', {message: req.flash('signupMessage')});
 });

 app.post('/signup', passport.authenticate('local-signup', {
  successRedirect: '/menu',
  failureRedirect: '/login',
  failureFlash: true
 }));


app.get('/menu', isLoggedIn, function(req, res){
    res.render('dashboard.ejs', {
     user:req.user
    });
});

//aqui se hace la consulta a la base de datos para mostrar las empresas
var mysql = require('mysql');
var dbconfig = require('../config/database');
var bcrypt = require('bcrypt-nodejs');
var connection = mysql.createConnection(dbconfig.connection);
connection.query('USE ' + dbconfig.database);

app.get('/dashboard', function (req, res) {
    connection.query("SELECT * FROM tbl_empresa_transporte",
        function(err, resul){
            console.log(resul[0]);
        res.render('dashboard.ejs', {
            empresas: resul,
            user:req.user
        });
    });
});

app.get('/profile', function (req, res) {
    connection.query("SELECT * FROM tbl_usuarios", function (err, resul) {
        console.log(resul[0]);
        res.render('profile.ejs', {
            usuarios: resul,
            user: req.user
        });
    });
});

app.post("/guardar", function (req, res) {
    connection.query("INSERT INTO tbl_usuarios(username, password, acerca, ubicacion) VALUES (?,?,?,?)",
        [req.body.username, bcrypt.hashSync(req.body.password, null, null), req.body.acerca, req.body.ubicacion],
        function (error, data, fields) {
            res.send(data);
            res.end();
        }
    );
});

app.get('/travel', function (req, res) {
    res.render('travel.ejs', { message: 'aqui la data' });
});

 app.get('/logout', function(req,res){
  req.logout();
  res.redirect('/login');
 })
};



function isLoggedIn(req, res, next){
 if(req.isAuthenticated())
  return next();

 res.redirect('/');
}

/*require('../config/passport.js');
app.get('/menu',  function(req, res){
    connection.query("SELECT * FROM tbl_empresa_transporte",
        function(err, resul){
            res.render('dashboard.ejs', {
                empresas: resul
        });
    });
});*/
