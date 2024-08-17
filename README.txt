Twitter Smart Contract

This contract simulates basic Twitter functionalities on the Ethereum blockchain, allowing users to create, like, and unlike tweets.

Features
Create Tweet: Users can create tweets with a maximum length of 200 characters.
View Tweets: Users can view individual tweets or all tweets by a specific author.
Like/Unlike Tweet: Users can like or unlike tweets. The like count is tracked for each tweet.
Owner Privileges: The contract owner can change the maximum tweet length.
Contract Overview
Structs:
Twitte: Represents a tweet with id, author, content, timestamp, and likes.
Mappings:
tweets: Maps an address to an array of Twitte structs, representing the tweets authored by the address.
Events:
CreateTweet: Emitted when a new tweet is created.
LikeTweet: Emitted when a tweet is liked.
UnlikeTweet: Emitted when a tweet is unliked.
Functions
makeTwitte(string memory tweet): Creates a new tweet.
getTwitt(address owner, uint i): Retrieves a specific tweet by an author.
getAllTwitte(address owner): Retrieves all tweets by an author.
changeTweeteLenght(uint16 tweetlengh): Allows the owner to change the maximum tweet length.
likesATweet(address author, uint256 id): Increases the like count of a tweet.
unlikeATweet(address author, uint256 id): Decreases the like count of a tweet.
Contract Address
The Twitter smart contract is deployed at the following address on the Ethereum blockchain:

0x315E33222f2F8B3061736fab0dF16BC2F877edFF

Owner Privileges
The contract owner can modify the maximum tweet length using the changeTweeteLenght function.

Deployment
The contract is deployed on the Ethereum blockchain and is compatible with Solidity version ^0.8.26.

License
This project is licensed under the MIT License.
