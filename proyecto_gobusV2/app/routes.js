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

app.get('/dashboard', function (req, res) {
    res.render('dashboard.ejs', { message: req.flash('loginMessag') });
});

    var mysql = require('mysql');
    var dbconfig = require('../config/database');
    var connection = mysql.createConnection(dbconfig.connection);
    connection.query('USE ' + dbconfig.database);

    app.get('/profile', function (req, res) {
        connection.query("SELECT * FROM tbl_usuarios", function (err, resul) {
            console.log(resul[0]);
            res.render('profile.ejs', {
                usuarios: resul,
                user: req.user
            });
        });
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