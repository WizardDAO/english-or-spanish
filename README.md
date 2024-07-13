### "Pancake Prediction Market"

#### Project Overview

"Pancake Prediction Market" is an innovative and versatile decentralized prediction market platform. Leveraging v4 hooks and a pull-based oracle mechanism, the platform allows users to engage in prediction markets across various domains, including sports, politics, finance, and entertainment. The platform aims to showcase its capabilities through a football betting use case during the hackathon, specifically featuring finals of the Euro 2024, England vs. Spain.

#### Objective

To create a decentralized, fair, and engaging prediction market platform that allows users to bet on diverse outcomes with live data updates. The platform is designed to be seamless, transparent, and fun, catering to a wide range of prediction scenarios.

#### Key Features

1. **Versatile Prediction Markets**:

   - Support for various domains including sports, politics, finance, and entertainment.
   - Showcase the platform's capabilities with a football betting example featuring Euro 2024 matches.

2. **Real-Time Data Integration**:

   - Pull-based oracle system updates prediction data every 15 seconds.
   - Dynamic adjustment of odds and probabilities based on real-time events.

3. **Decentralized and Transparent**:

   - Utilizes Uniswap V4 hooks to manage liquidity and ensure fair market conditions.
   - Smart contracts govern the prediction markets, ensuring transparency and reducing manipulation risks.

4. **User-Friendly Interface**:

   - Intuitive design for users to place bets, view live updates, and track outcomes.
   - Interactive visualizations of prediction progress and probabilities.

5. **Reward Mechanism**:
   - Fair distribution of rewards to winning bettors and liquidity providers.
   - Automated settlement and payout processes.

#### Technical Implementation

1. **Smart Contracts**:

   - **PredictionMarketHook**: Implements Uniswap V4 hooks for dynamic liquidity management.
   - **MockPusherOracle**: A pull-based oracle contract that updates prediction data based on block timestamps and user interactions.

2. **Oracle Integration**:

   - Pull-based mechanism fetches and updates prediction data at regular intervals.
   - Ensures users have access to the latest information for informed betting decisions.

3. **Liquidity Management**:
   - Dynamic liquidity adjustments reflect real-time probabilities.
   - Reduces potential for MEV (Miner Extractable Value) exploits.

#### User Flow

1. **Market Initialization**:

   - Users visit the platform to see available prediction markets.
   - Markets are initialized with default probabilities and liquidity.

2. **Bet Placement**:

   - Users place bets on desired outcomes using an intuitive interface.
   - Bets are committed and revealed using a commit-reveal scheme to prevent front-running.

3. **Live Updates**:

   - Prediction data is updated every 15 seconds through the oracle.
   - Users see real-time updates and probability adjustments on the platform.

4. **Market Finalization and Rewards**:
   - At the end of the prediction event, the final outcome is determined and updated on-chain.
   - Winning bets are settled, and rewards are distributed automatically.

#### Unique Selling Proposition (USP)

"Pancake Prediction Market" stands out with its versatile application across various domains and its robust, real-time data integration. The platform ensures fair market conditions, transparency, and a user-friendly experience, making it a go-to destination for diverse prediction market scenarios.

### Conclusion

"Pancake Prediction Market" aims to revolutionize the prediction market space by offering a fun, fair, and engaging platform for a wide range of prediction scenarios. Leveraging advanced blockchain technology and a robust oracle system, the platform ensures a seamless and transparent user experience, keeping users engaged and excited about various prediction events. The Euro 2024 football betting use case will showcase the platform's potential during the hackathon.
