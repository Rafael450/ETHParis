# ChainFunds - Revolutionizing Crypto Investing. Your path to effortless, democratized, and secure financial growth. 


## Overview

ChainFunds is a groundbreaking solution designed to democratize access to financial investing in the crypto world. Unveiled at EthCC 2023, this Web3 project leverages the Polygon network to facilitate the creation and investment in user-generated funds. We foster an inclusive and simplified investment experience while maximizing the benefits of decentralized finance (DeFi).

## Technologies Used
* Solidity for smart contracts
* Polygon blockchain for efficient transactions and fund management
* BYC Protocol for user authentication via Google Accounts
* World ID Protocol for fund manager verification
* Airstack Protocol for fund information management
* ERC6551 for creating NFT-bounded accounts


## Features
*  Offers an accessible and user-friendly platform for investing in the crypto world

*  Eliminates traditional investment barriers, fostering democratized financial investing

*  Integrates the Bieconomy Protocol, allowing user login via Google Accounts

*  Features a broad range of funds with comprehensive details, promoting informed investment decisions

*  Provides secure and transparent fund management using ERC6551 NFT-bounded accounts

*  Implements World ID Protocol for verifying fund manager's authenticity, enhancing investor confidence

*  Ensures trading transparency and security by predetermining and publicly displaying allowable trade tokens

## Flowchart
This is how ChainFunds works:

1. You log into ChainFunds using MetaMask or your Google Account, thanks to the integration of Bieconomy Protocol.

2. Once in, you have access to an array of funds along with their relevant details. Information such as minimum investment amount, trading rules, and fund manager verification status are all clearly displayed.

3. After selecting a fund that suits your investment goals, you make an investment using MATIC. You're now a participant in the fund's returns.

4. You also have the option of becoming a fund creator. Simply click on 'Create Fund', enter the necessary information, and an ERC6551 NFT-bounded account is going to mint a ERC721 NFT for you, representing your new created fund. This account behaves as a digital collection of funds that can trade and hold other tokens, maintaining transparency, immutability, and decentralized control.

5. As a fund manager, you trade within the predetermined and publicly displayed token set (ERC20 int this case). This assures investors of the fund's security and transparency.

6. You can track and manage all your investments and fund operations, which is possible with Airstack Protocol helps, that gives us effectively access to critical informations about each fund.

![FlowChart](https://github.com/Rafael450/ETHParis/assets/101767386/b0a16ec4-9f08-451a-bc05-46049489d686)








## Getting Started
## Requirements
### Backend 
1. `cd backend`
2. `npm install`
3. Rename the `.env.template` file to `.env` and complete with all necessary information, including the StarkBank project info and the blockchain addresses and private keys.
4. `npm start`
### Excharge Backend 
1. `cd excharge`
2. `npm install`
3. Rename the `.env.template` file to `.env` and complete with all necessary information, including the StarkBank project info and the blockchain addresses and private keys.
4. `npm start`
### SmartContracts
1. `cd contracts`
2. `npm install`
3. Rename the `.env.template` file to `.env` and set your the DEPLOY_INFURA_KEY and PRIVATE_KEY variables
4. `npx hardhat run --network mumbai ./scripts/deploy.ts`


## Usage
### User Interface
1. As a ChainFunds user, you have the freedom to invest in various funds or create your own. To invest, simply select a fund, review its details, and invest using MATIC.

2. To create a fund, navigate to 'Create Fund', enter the required details, and an ERC6551 NFT-bounded account automatically generates a new fund for you. You now manage a digital fund that can trade and hold other tokens.

3. To enhance transparency and security, the tokens that a fund manager can trade are predetermined and publicly displayed. This feature allows investors to understand the fund's operation and safeguards against potential scams.

4. ChainFunds provides a seamless user experience, further enhanced by the Airstack Protocol. It allows users to easily access and manage information about their funds, making the platform more user-friendly and transparent.


## Team:
[cauemguimaraes](https://github.com/cauemguimaraes)
[DannxC](https://github.com/DannxC)
[Ferroca2](https://github.com/Ferroca2)
[Rafael450](https://github.com/Rafael450)
