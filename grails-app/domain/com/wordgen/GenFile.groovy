package com.wordgen

class GenFile {
   String username
   String listOfURLs
   Date dateCreated
   Date lastUpdated
   
   static constraints = {
       username size:1..10, blank: false, unique: false
       listOfURLs size: 1..1000, blank: false, unique: false
   }
}