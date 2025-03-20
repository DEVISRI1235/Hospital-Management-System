const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

const app = express();
const PORT = 3000;

// Middleware to parse form data
app.use(bodyParser.urlencoded({ extended: true }));

// MongoDB connection URI
const mongoURI = 'mongodb+srv://devisrinelakuditi:devisrinelakuditi@cluster0.sjx28.mongodb.net/?retryWrites=true';

// Connect to MongoDB
mongoose.connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('Connected to MongoDB'))
  .catch(error => console.error('Failed to connect to MongoDB', error));

// Define the student schema
const studentSchema = new mongoose.Schema({
  id: Number,
  name: String,
  age: Number,
  addr: String,
  gender: String,
  phno: Number
});

// Create a model for the student collection
const Student = mongoose.model('Student', studentSchema);

app.post('/register', async (req, res) => {
  try {
    // Extract form data from the request
    const { id, name, age, addr, gender, phno } = req.body;

    // Create a new student instance
    const student = new Student({
      id: parseInt(id),
      name,
      age: parseInt(age),
      addr,
      gender,
      phno: parseInt(phno)
    });

    // Save the student record to the MongoDB collection
    await student.save();

    // Send success response
    res.setHeader('Content-Type', 'text/html');
    res.send(`1 row inserted successfully<br><a href="/display">Click here to display student data</a>`);
    
  } catch (error) {
    // Handle errors
    res.status(500).send(error.message);
  }
});

app.get('/display', async (req, res) => {
  try {
    const students = await Student.find();
    res.setHeader('Content-Type', 'text/html');
    
    let output = '';
    students.forEach(student => {
      output += `${student.id} ${student.name} ${student.age} ${student.addr} ${student.gender} ${student.phno}<br>`;
    });
    
    res.send(output);
  } catch (error) {
    res.status(500).send(error.message);
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}/register`);
});
