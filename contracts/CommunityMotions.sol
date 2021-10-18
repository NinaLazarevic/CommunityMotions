pragma solidity >=0.4.22;

contract CommunityMotions {
     address public campaignCreator;
     string public campaignDescription;
     string public campaignTitle;
     uint public limitAmount;
     
     address[] public donors;
     mapping(address => uint) public donations;
     
     constructor(string title, string description, uint limit, address creator) public {
         campaignCreator = creator;
         campaignDescription = description;
         campaignTitle = title;
         limitAmount = limit;
     }
     
     function () public payable{
         donate();
     }
     
     function donate() public payable isLimitValid {
         if(donations[msg.sender] == 0)
         {
             donors.push(msg.sender);
         }
         donations[msg.sender] += msg.value;
     }
     
     function getDonors() view public returns(address[]){
         return donors;
     }
     
     function totalDonated() view public returns(uint){
         uint donated = 0;
         for(uint i = 0; i< donors.length; i++)
         {
             donated += donations[donors[i]];
         }
         return donated;
     }
     
     modifier isLimitValid(){
        require(msg.value >= limitAmount, "Insufficient donation amount.");
        _;
    }
}