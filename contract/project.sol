// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TicketSystem is ERC721, Ownable {
    uint256 private _tokenIds;
    uint256 public ticketPrice;

    struct Ticket {
        bool isUsed;
        uint256 eventId;
    }

    mapping(uint256 => Ticket) private _tickets;
    mapping(uint256 => uint256[]) private _eventToTickets;

    event TicketVerified(uint256 indexed tokenId, uint256 eventId);
    event TicketUsed(uint256 indexed tokenId, uint256 eventId);

    constructor(uint256 initialPrice) ERC721("EventTicket", "ETKT") Ownable(msg.sender) {
        ticketPrice = initialPrice;
    }

    function setTicketPrice(uint256 newPrice) external onlyOwner {
        ticketPrice = newPrice;
    }

    function buyTicket(uint256 eventId) external payable {
        require(msg.value == ticketPrice, "Incorrect payment amount");
        _tokenIds++;
        _safeMint(msg.sender, _tokenIds);
        _tickets[_tokenIds] = Ticket({isUsed: false, eventId: eventId});
        _eventToTickets[eventId].push(_tokenIds);
    }

    function verifyTicket(uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "Not the ticket owner");
        Ticket storage ticket = _tickets[tokenId];
        require(!ticket.isUsed, "Ticket already used");
        emit TicketVerified(tokenId, ticket.eventId);
    }

    function useTicket(uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "Not the ticket owner");
        Ticket storage ticket = _tickets[tokenId];
        require(!ticket.isUsed, "Ticket already used");
        ticket.isUsed = true;
        emit TicketUsed(tokenId, ticket.eventId);
    }

    function getTicketsForEvent(uint256 eventId) external view returns (uint256[] memory) {
        return _eventToTickets[eventId];
    }

    function getTicket(uint256 tokenId) external view returns (Ticket memory) {
        require(_ownerOf(tokenId) != address(0), "Ticket does not exist"); 
        return _tickets[tokenId];
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}

