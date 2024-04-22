# FlowTrack App

This repository contains the codebase for a simple order tracking application. The app simulates a real-time order tracking system using Ably Realtime and leverages Google Firebase for user authentication.

## Features

* **Real-time Order Tracking:** Ably Realtime is integrated to provide real-time updates on order status, similar to how live order tracking works in e-commerce applications.
* **User Authentication:** Google Firebase is used to implement user login and authentication, ensuring secure access to the order tracking functionality.

## Getting Started

1. **Prerequisites:**
   - Node.js and npm (or yarn) installed on your system.
   - An Ably account with a realtime channel created (https://ably.com/(https://ably.com/)). (Sign up for a free tier if you haven't already.)
   - A Google Firebase project with authentication enabled (Follow Google's documentation for setting up Firebase: https://firebase.google.com/(https://firebase.google.com/)).
2. **Clone the Repository:**
   ```bash
   git clone [https://github.com/](https://github.com/)<your-username>/<your-repo-name>.git

 3.Install Dependencies:
Bash
cd <your-repo-name>
npm install (or yarn install)

4.Configure Ably and Firebase:
Replace the placeholder values in the code with your Ably Realtime channel key and Firebase project configuration details. Refer to the documentation for both Ably and Firebase on how to retrieve these credentials securely.
Running the App
Start the development server:
Bash
npm start (or yarn start)

Demo video
https://drive.google.com/file/d/1z_ZmzuKFS1juBKyIRYmYsDI2rRqbNiEt/view?usp=drivesdk
