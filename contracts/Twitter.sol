//SPDX-License-Identifier:MIT
pragma solidity ^0.8.26;
contract Twitter{
    uint16 public MAXIMUMLENGTH =200;
    address ownerContract;
    constructor(){
        ownerContract = msg.sender;
    
    }
    struct Twitte{
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes ;

    }
    //mapping(address => string) public  tweets;
    mapping(address => Twitte[]) public  tweets;
    event CreateTweet(uint256 id, address author, string content, uint256 timestamp );
    event LikeTweet(address liker, address author, uint256 tweetId, uint256 tweetCount);
    event UnlikeTweet(address unliker, address author, uint256 tweetId, uint256 tweetCount);

    function makeTwitte(string memory tweet) public {
        require(bytes(tweet).length <= MAXIMUMLENGTH, "the tweet is too long");
        Twitte memory newTwitten = Twitte(
            {
                id: tweets[msg.sender].length,
                author: msg.sender,
                content: tweet,
                timestamp: block.timestamp,
                likes:0
            }
        );
       // tweets[msg.sender]= tweet;
       tweets[msg.sender].push(newTwitten);
       emit CreateTweet(newTwitten.id, newTwitten.author, newTwitten.content, newTwitten.timestamp);

    }
    function getTwitt(address owner, uint i) public view returns (Twitte memory){
        return tweets[owner][i];
    }
    function getAllTwitte(address owner )public view returns (Twitte[] memory){
        return tweets[owner];
    }
    modifier  isOwner(){
        require(msg.sender==ownerContract, "You are not the owner");
        _;

    }
    function changeTweeteLenght(uint16 tweetlengh) public isOwner{
        MAXIMUMLENGTH = tweetlengh;
    }
    function likesATweet(address author, uint256 id) external {
        require(tweets[author][id].id == id, "Tweet does not exist");
        tweets[author][id].likes++;
        emit LikeTweet(msg.sender, author, id, tweets[author][id].likes);
    }
    function unlikeATweet(address author, uint256 id ) external {
        require(tweets[author][id].id ==id,"Tweet does not exist");
        require(tweets[author][id].likes > 0, "Tweet has no likes ");
        tweets[author][id].likes--;
        emit UnlikeTweet(msg.sender, author, id, tweets[author][id].likes);
    }
}