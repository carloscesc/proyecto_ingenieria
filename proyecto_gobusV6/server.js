var express = require('express');
var session = require('express-session');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var morgan = require('morgan');
var passport = require('passport');

var app = express();

app.use('/public', express.static('public'));
var port = process.env.PORT || 8011;

var flash = require('connect-flash');

require('./config/passport')(passport);

app.use(morgan('dev'));
app.use(cookieParser());
app.use(bodyParser.json());/* Esto se agrego 10/12/2018*/
app.use(bodyParser.urlencoded({ 
     extended: true 
    }));

app.set('view engine', 'ejs');

app.use(session({
    secret: 'justasecret',
    resave:true,
    saveUninitialized: true
}));

app.use(passport.initialize());
app.use(passport.session());
app.use(flash());

require('./app/routes.js')(app, passport);

app.listen(port);
console.log("Port: " + port);