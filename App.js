import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Login from "./components/Login";
import Dash from "./components/dash";
import AddItems from "./components/AddItems";
import AddUser from "./components/AddUser";
import ContentSection from "./components/ContentSection";
import IssuedItems from "./components/IssuedItems"
import PurchasesList from "./components/PurchasesList";
import Users from "./components/Users";
import Home from "./components/Home";
import Profile from "./components/Profile";
import Purchases from "./components/Purchases"; 
import Staffdash from "./components/staff/staffdash";
import IssuerDash from "./components/issuer/IssuerDash";

function App() {
    return (
        <Router>
            <Routes>
                <Route path="/" element={<Login />} />
                <Route path="/addItems" element={<AddItems />} />
            
                
                <Route path="/dash" element={<Dash/>}/>
                
                <Route path="/add-user" element={<AddUser />} />
                <Route path="/content" element={<ContentSection />} />
                <Route path="/issueditems" element={<IssuedItems />} />
                <Route path="/purchasesList" element={<PurchasesList />} />
                <Route path="/users" element={<Users />} /> 
                <Route path="/home" element={<Home />} />
                <Route path="/profile" element={<Profile />} />
                <Route path="/purchases" element={<Purchases />} />
                <Route path="/staffdash" element={<Staffdash />} />
                <Route path="/issuerdash" element={<IssuerDash />} />
                
            </Routes>
        </Router>
    );
}

export default App;
