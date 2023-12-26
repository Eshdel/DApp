// contracts/TechServiceContract.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TechServiceContract {
    address public technician;
    mapping(address => Client) public clients;
    uint256 public servicePrice;

    struct Client {
        string name;
        string surname;
        string addressDetails;
        string taskDescription;
        bool isActive;
    }

    modifier onlyTechnician() {
        require(msg.sender == technician, "Only technician can call this function");
        _;
    }

    modifier onlyClient() {
        require(clients[msg.sender].isActive, "Only active client can call this function");
        _;
    }

    function setTechnician(address _technician) public {
        technician = _technician;
    }

    function addClient(
        string memory _name,
        string memory _surname,
        string memory _addressDetails,
        string memory _taskDescription
    ) public {
        require(!clients[msg.sender].isActive, "Client already added");
        clients[msg.sender] = Client({
            name: _name,
            surname: _surname,
            addressDetails: _addressDetails,
            taskDescription: _taskDescription,
            isActive: true
        });
    }

    function submitTask(string memory _taskDescription) public onlyClient {
        clients[msg.sender].taskDescription = _taskDescription;
    }

    function setServicePrice(uint256 _price) public onlyTechnician {
        servicePrice = _price;
    }
}
