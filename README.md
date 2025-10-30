# 🎟️ NFT Ticketing System

## 📘 Project Title
**NFT Ticketing System**

---

## 🧾 Project Description
The **NFT Ticketing System** is a decentralized event ticketing platform built on the Ethereum blockchain.  
Each ticket is represented as a unique **ERC-721 NFT**, ensuring authenticity, traceability, and ownership verification.  
Users can securely purchase, verify, and use tickets through the smart contract — eliminating fake or duplicate tickets.

---

## 🚀 Project Vision
To transform the traditional ticketing industry by introducing **trustless**, **transparent**, and **tamper-proof** NFT-based event ticketing.  
The goal is to empower both **organizers** and **attendees** with a blockchain-backed solution that ensures complete transparency and fairness.

---

## 💡 Key Features
- 🎟️ **NFT-based Tickets:** Each ticket is a unique ERC-721 token stored on the blockchain.  
- 💰 **On-chain Payment:** Users can buy tickets directly by sending ETH to the contract.  
- 🔍 **Verification System:** Owners can verify whether their ticket is valid and unused.  
- ✅ **Usage Tracking:** Once used, a ticket is permanently marked as “used.”  
- 📊 **Event Ticket Lookup:** Fetch all tickets associated with a particular event.  
- ⚙️ **Owner Controls:** The contract owner can set and update ticket prices.

---

## 🔮 Future Scope
1. **Refund Mechanism:** Allow refunds before event deadlines.  
2. **Multi-Organizer Support:** Enable event creators to register and manage their own events.  
3. **Secondary Market Integration:** Add NFT resale functionality with royalties for organizers.  
4. **QR Code Integration:** Connect tickets to real-world scanning systems.  
5. **Web3 Frontend:** Build a React + Ethers.js interface for users and organizers.

---

## 🧠 Smart Contract Overview

| Function | Description |
|-----------|-------------|
| `setTicketPrice(uint256 newPrice)` | Allows the contract owner to change the ticket price. |
| `buyTicket(uint256 eventId)` | Lets users purchase a ticket for a specific event. |
| `verifyTicket(uint256 tokenId)` | Verifies that the caller owns a valid ticket. |
| `useTicket(uint256 tokenId)` | Marks the ticket as used to prevent reuse. |
| `getTicketsForEvent(uint256 eventId)` | Returns a list of ticket IDs for a specific event. |
| `getTicket(uint256 tokenId)` | Returns details of a specific ticket (event ID and status). |

---

## ⚙️ Deployment Steps (Remix IDE)
1. Go to [Remix Ethereum IDE](https://remix.ethereum.org/).  
2. Create a new file named **TicketSystem.sol** and paste your Solidity contract code.  
3. In the **Solidity Compiler** tab:
   - Select **Compiler Version 0.8.20**  
   - Click **Compile TicketSystem.sol**  
4. In the **Deploy & Run Transactions** tab:
   - Environment: **Remix VM (London)** or **Injected Provider - MetaMask**  
   - Enter constructor parameter (e.g., `1000000000000000000` for 1 ETH).  
   - Click **Deploy**  
5. Once deployed:
   - Call `buyTicket(1)` to purchase a ticket for event ID `1`.  
   - Use `verifyTicket(1)` to confirm your ticket.  
   - Use `useTicket(1)` to mark it as used.

## Contract Details : 0x43a4ACA8ecdAe6Df71e238de880E29254EC96f37
<img width="1558" height="829" alt="image" src="https://github.com/user-attachments/assets/e386f8f9-d14e-4998-af86-445995bd45c3" />

