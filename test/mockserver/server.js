const express = require("express")
const app = express()
const port = 3333

const mockData = [
    {
        id: "a3b4c5d6-e89f-4bde-9cdf-5d9e7b8f1234",
        prescId: "223e4567-e89b-12d3-a456-426614174111",
        name: "Atorvastatin",
        dosage: "20mg",
        duration: "30 days",
        additionalInstructions:
            "Take 1 tablet by mouth once daily in the evening",
    },
    {
        id: "b5c6d7e8-f01f-4ab8-9bdc-3d7e8c9a1456",
        prescId: "223e4567-e89b-12d3-a456-426614174111",
        name: "Metformin",
        dosage: "500mg",
        duration: "60 days",
        additionalInstructions: "Take 1 tablet by mouth twice daily with meals",
    },
    {
        id: "c7d8e9f0-2b3a-4f9d-a7b2-3a5d4f6c7890",
        prescId: "323e4567-e89b-12d3-a456-426614174222",
        name: "Losartan",
        dosage: "50mg",
        duration: "30 days",
        additionalInstructions:
            "Take 1 tablet by mouth once daily in the morning",
    },
    {
        id: "d9e0f1a2-bc3d-4a7e-8b9a-7f8e1d2c3456",
        prescId: "323e4567-e89b-12d3-a456-426614174222",
        name: "Amlodipine",
        dosage: "5mg",
        duration: "30 days",
        additionalInstructions:
            "Take 1 tablet by mouth once daily in the morning",
    },
    {
        id: "f0a1b2c3-4d5e-678f-9a0b-1c2d3e4f5678",
        prescId: "423e4567-e89b-12d3-a456-426614174333",
        name: "Omeprazole",
        dosage: "20mg",
        duration: "14 days",
        additionalInstructions:
            "Take 1 capsule by mouth once daily before breakfast",
    },
    {
        id: "e1f2g3h4-5i6j-7k8l-9m0n-1o2p3q4r5678",
        prescId: "423e4567-e89b-12d3-a456-426614174333",
        name: "Ibuprofen",
        dosage: "200mg",
        duration: "7 days",
        additionalInstructions:
            "Take 1 tablet by mouth every 4-6 hours as needed for pain",
    },
]

app.get("/meds", (req, res) => {
    res.json(mockData)
})

app.get("/meds/2", (req, res) => {
    res.json([
        {
            id: "d9e0f1a2-bc3d-4a7e-8b9a-7f8e1d2c3456",
            prescId: "323e4567-e89b-12d3-a456-426614174222",
            name: "Amlodipine",
            dosage: "5mg",
            duration: "30 days",
            additionalInstructions:
                "Take 1 tablet by mouth once daily in the morning",
        },
        {
            id: "f0a1b2c3-4d5e-678f-9a0b-1c2d3e4f5678",
            prescId: "423e4567-e89b-12d3-a456-426614174333",
            name: "Omeprazole",
            dosage: "20mg",
            duration: "14 days",
            additionalInstructions:
                "Take 1 capsule by mouth once daily before breakfast",
        },
    ])
})

app.listen(port, () => {
    console.log(`Mock server running at http://localhost:${port}/meds`)
})
