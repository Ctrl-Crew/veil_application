const express = require('express');
const app = express();
const port = 3333;

const mockData = [
    {
        id: "7bef6d5e-f03e-4f52-8d0b-90ca76353f7d",
        prescId: "123e4567-e89b-12d3-a456-426614174000",
        name: "Lisinopril",
        dosage: "10mg",
        duration: "30 days",
        additionalInstructions: "Take 1 tablet by mouth once daily in the morning with or without food",
    },
    {
        id: "9b1deb4d-3b7d-4bad-9bdd-2b0d7b3dcb6d",
        prescId: "123e4567-e89b-12d3-a456-426614174000",
        name: "Hydrochlorothiazide",
        dosage: "12.5mg",
        duration: "30 days",
        additionalInstructions: "Take 1 tablet by mouth once daily in the morning with food",
    },
];

app.get('/meds', (req, res) => {
    res.json(mockData);
});

app.listen(port, () => {
    console.log(`Mock server running at http://localhost:${port}/meds`);
});
