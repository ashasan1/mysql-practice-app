const mysql = require('mysql');
const inquirer = require('inquirer');
const express = require('express');

const connectionInfo = {
    host:'localhost',
    port:3306,
    user: "root",
    password: 'kenwe88!',
    database: "tv_db"
};

const connection = mysql.createConnection(connectionInfo);

connection.connect( function(err) {
    if (err) throw err;
    console.log('Connection Sucessful!');
    selectMenu();

});

function selectMenu() {
inquirer.prompt([
    {
        type: 'list',
        name: 'selectMenu',
        message: 'Select a database option',
        choices: ['View TV database']
    }
]).then( function(response) {
    if (response.selectMenu === 'View TV database') {
        viewTVdb();
    };
})
}

function viewTVdb() {
    console.log("Choice Accepted");
    connection.query("SELECT shows.id, shows.showName, shows.tvProvider FROM shows", function (err, result) {
        if (err) throw err;
        console.table(result);
    });
}