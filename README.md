# ChainFunds - Revolutionizing Crypto Investing. Your path to effortless, democratized, and secure financial growth. 


## Overview

ChainFunds is a cutting-edge Web3 project, introduced at EthCC 2023, that seeks to democratize access to financial investing. Leveraging the Gnosis network, ChainFunds allows users to invest in a variety of funds established by other users utilizing XDAI, a stable native coin. Our platform champions simplicity, inclusivity, and ensures transparency, immutability, and decentralized control.

## Technologies Used
* Solidity for crafting smart contracts
* Gnosis blockchain for executing transactions and fund management
* QuickNode RPC for deploying our smart contracts on Gnosis Chain
* MetaMask for user onboarding
* ERC6551 for creating NFT-bounded accounts and ERC721 for minting the decentralized funds


## Features
*  Provides an intuitive and user-friendly platform for engaging with crypto funds

*  Eliminates conventional investment obstacles, enabling democratized financial investing

*  Utilizes MetaMask for seamless user interaction with the platform

*  Showcases a multitude of funds, each with comprehensive details, fostering informed investment decisions

*  Introduces a novel approach to fund management by using ERC6551 NFT-bounded accounts

*  Enforces trading transparency and security by predetermining and publicly displaying the tokens that a fund manager can tradee


## Flowchart
This is how ChainFunds works:

1. Users log into ChainFunds using MetaMask, allowing for simple on-chain transactions via the website.

2. The platform showcases a wide array of funds along with their relevant details such as trading rules, minimum investment amounts, % of profits shared with the fund manager, etc.

3. After choosing a suitable fund, users can invest using XDAI. They are then entitled to a share in the fund's returns.

4. Users can also create a fund. By minting a new ERC721 NFT, which behaves as a decentralized fund, they establish an NFT-bounded account using the ERC6551 standard. This account acts as a digital fund that can trade and hold other tokens, such as ERC20, while retaining transparency, immutability, and decentralized control.

5. The tokens that a fund manager can trade are predetermined and publicly displayed, assuring investors of the fund's security and transparency.

6. ChainFunds values ease of access to information about the funds, ensuring transparency and a positive user experience.

7. You can allways track and manage all your investments and fund operations using the platform!

8. Here isa FlowChart about how the main idea works for inverstors and managers:

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
1. As a ChainFunds user, you have the flexibility to invest in a wide variety of funds or even establish your own. To invest, simply select a fund, review its details, and invest using XDAI.

2. To create a fund, navigate to 'Create Fund', fill in the required details, and an ERC6551 NFT-bounded account automatically generates a new fund for you. You are now managing a digital fund that can trade and hold other tokens.

3. For the sake of transparency and security, the tokens that a fund manager can trade are predetermined and publicly displayed. This feature empowers investors with a clear understanding of the fund's operation and safeguards against potential scams.

4. ChainFunds is committed to providing a seamless user experience. Our platform allows users to easily access and manage information about their funds, making the platform more user-friendly and transparent.


## Team:
[cauemguimaraes](https://github.com/cauemguimaraes)
[DannxC](https://github.com/DannxC)
[Ferroca2](https://github.com/Ferroca2)
[Rafael450](https://github.com/Rafael450)
