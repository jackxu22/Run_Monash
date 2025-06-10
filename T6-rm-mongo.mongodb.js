// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-rm-mongo.mongodb.js

// Student ID: 34680535
// Student Name: Jinghao Xu

// Comments for your marker:

// ===================================================================================
// DO NOT modify or remove any of the comments below (items marked with //)
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("jxuu0193");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.runmonash_teams.drop();

// Create collection and insert documents
db.runmonash_teams.insertMany([
  {
    "_id": 1,
    "carn_name": "RM Spring Series Clayton 2024",
    "carn_date": "22-SEP-2024",
    "team_name": "Coyotes",
    "team_leader": {
      "name": "John Smith",
      "phone": "0412345678",
      "email": "john.smith@email.com"
    },
    "team_no_of_members": 4,
    "team_members": [
      {
        "competitor_name": "John Smith",
        "competitor_phone": "0412345678",
        "event_type": "5 Km Run",
        "entry_no": 1,
        "starttime": "09:30:00",
        "finishtime": "10:00:00",
        "elapsedtime": "00:30:00"
      },
      {
        "competitor_name": "Sarah Brown",
        "competitor_phone": "0445678901",
        "event_type": "5 Km Run",
        "entry_no": 4,
        "starttime": "09:30:00",
        "finishtime": "-",
        "elapsedtime": "-"
      },
      {
        "competitor_name": "Alex Taylor",
        "competitor_phone": "0434567890",
        "event_type": "5 Km Run",
        "entry_no": 3,
        "starttime": "09:40:00",
        "finishtime": "10:20:00",
        "elapsedtime": "00:40:00"
      },
      {
        "competitor_name": "Emma Wilson",
        "competitor_phone": "0423456789",
        "event_type": "5 Km Run",
        "entry_no": 2,
        "starttime": "09:35:00",
        "finishtime": "10:05:00",
        "elapsedtime": "00:30:00"
      }
    ]
  },
  {
    "_id": 2,
    "carn_name": "RM Spring Series Caulfield 2024",
    "carn_date": "05-OCT-2024",
    "team_name": "Sprinters",
    "team_leader": {
      "name": "Sophie Harris",
      "phone": "0489012345",
      "email": "sophie.harris@email.com"
    },
    "team_no_of_members": 3,
    "team_members": [
      {
        "competitor_name": "Sophie Harris",
        "competitor_phone": "0489012345",
        "event_type": "5 Km Run",
        "entry_no": 1,
        "starttime": "09:00:00",
        "finishtime": "09:35:00",
        "elapsedtime": "00:35:00"
      },
      {
        "competitor_name": "Olivia Moore",
        "competitor_phone": "0401234567",
        "event_type": "5 Km Run",
        "entry_no": 3,
        "starttime": "09:10:00",
        "finishtime": "09:55:00",
        "elapsedtime": "00:45:00"
      },
      {
        "competitor_name": "James Walker",
        "competitor_phone": "0490123456",
        "event_type": "5 Km Run",
        "entry_no": 2,
        "starttime": "09:05:00",
        "finishtime": "09:40:00",
        "elapsedtime": "00:35:00"
      }
    ]
  },
  {
    "_id": 3,
    "carn_name": "RM Summer Series Caulfield 2025",
    "carn_date": "02-FEB-2025",
    "team_name": "Runners",
    "team_leader": {
      "name": "Lisa",
      "phone": "0467890123",
      "email": "lisa@email.com"
    },
    "team_no_of_members": 3,
    "team_members": [
      {
        "competitor_name": "Lisa",
        "competitor_phone": "0467890123",
        "event_type": "10 Km Run",
        "entry_no": 1,
        "starttime": "08:00:00",
        "finishtime": "08:50:00",
        "elapsedtime": "00:50:00"
      },
      {
        "competitor_name": "Sophie Harris",
        "competitor_phone": "0489012345",
        "event_type": "10 Km Run",
        "entry_no": 3,
        "starttime": "08:00:00",
        "finishtime": "09:00:00",
        "elapsedtime": "01:00:00"
      },
      {
        "competitor_name": "-",
        "competitor_phone": "0478901234",
        "event_type": "10 Km Run",
        "entry_no": 2,
        "starttime": "08:00:00",
        "finishtime": "08:55:00",
        "elapsedtime": "00:55:00"
      }
    ]
  },
  {
    "_id": 4,
    "carn_name": "RM Autumn Series Clayton 2025",
    "carn_date": "15-MAR-2025",
    "team_name": "Coyotes",
    "team_leader": {
      "name": "Olivia Moore",
      "phone": "0401234567",
      "email": "olivia.moore@email.com"
    },
    "team_no_of_members": 3,
    "team_members": [
      {
        "competitor_name": "Olivia Moore",
        "competitor_phone": "0401234567",
        "event_type": "42.2 Km Marathon",
        "entry_no": 1,
        "starttime": "07:45:00",
        "finishtime": "11:45:00",
        "elapsedtime": "04:00:00"
      },
      {
        "competitor_name": "Mia King",
        "competitor_phone": "0424567890",
        "event_type": "42.2 Km Marathon",
        "entry_no": 3,
        "starttime": "07:45:00",
        "finishtime": "12:45:00",
        "elapsedtime": "05:00:00"
      },
      {
        "competitor_name": "Ethan Young",
        "competitor_phone": "0413456789",
        "event_type": "42.2 Km Marathon",
        "entry_no": 2,
        "starttime": "07:45:00",
        "finishtime": "12:15:00",
        "elapsedtime": "04:30:00"
      }
    ]
  },
  {
    "_id": 5,
    "carn_name": "RM Winter Series Caulfield 2025",
    "carn_date": "29-JUN-2025",
    "team_name": "Chasers",
    "team_leader": {
      "name": "Ava Green",
      "phone": "0446789012",
      "email": "ava.green@email.com"
    },
    "team_no_of_members": 1,
    "team_members": [
      {
        "competitor_name": "Ava Green",
        "competitor_phone": "0446789012",
        "event_type": "21.1 Km Half Marathon",
        "entry_no": 1,
        "starttime": "08:00:00",
        "finishtime": "10:30:00",
        "elapsedtime": "02:30:00"
      }
    ]
  }
]);

// List all documents you added
db.runmonash_teams.find();

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer
db.runmonash_teams.find(
  {
    "team_members.event_type": { $in: ["5 Km Run", "10 Km Run"] }
  },
  {
    _id: 0,
    carn_date: 1,
    carn_name: 1,
    team_name: 1,
    "team_leader.name": 1
  }
);

// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// (i) Add new team
db.runmonash_teams.insertOne({
  "_id": 999,
  "carn_name": "RM WINTER SERIES CAULFIELD 2025",
  "carn_date": "29-Jun-2025",
  "team_name": "The Great Runners",
  "team_leader": {
    "name": "Jackson Bull",
    "phone": "0422412524",
    "email": "jackson.bull@email.com"
  },
  "team_no_of_members": 1,
  "team_members": [
    {
      "competitor_name": "Jackson Bull",
      "competitor_phone": "0422412524",
      "event_type": "5 Km Run",
      "entry_no": 1,
      "starttime": "-",
      "finishtime": "-",
      "elapsedtime": "-"
    }
  ]
});

// Illustrate/confirm changes made
db.runmonash_teams.find({ "team_name": "The Great Runners" });

// (ii) Add new team member
db.runmonash_teams.updateOne(
  { "team_name": "The Great Runners" },
  {
    $push: {
      "team_members": {
        "competitor_name": "Steve Bull",
        "competitor_phone": "0422251427",
        "event_type": "10 Km Run",
        "entry_no": 2,
        "starttime": "-",
        "finishtime": "-",
        "elapsedtime": "-"
      }
    },
    $inc: {
      "team_no_of_members": 1
    }
  }
);

// Illustrate/confirm changes made
db.runmonash_teams.find({ "team_name": "The Great Runners" });