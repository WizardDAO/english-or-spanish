pragma solidity ^0.8.0;

/**
 * @title MockPusherOracle
 * @author 2manslkh
 * @notice Update the match data every 15 seconds
 * @dev This contract is used to simulate the match data update
 * 1. Match n starts, score: 0-0
 * 2. Match n continues: score: 0-1
 * 3. Match n ends: score: 0-2, Spain wins
 * 4. Match n+1 starts, score: 0-0
 * 5. Match n+1 continues: score: 1-0
 * 6. Match n+1 ends: score: 2-0, England wins
 */
contract MockPusherOracle {
  // Enum representing possible match outcomes
  enum MatchOutcome {
    NotStarted,
    EnglandWins,
    SpainWins,
    Draw
  }

  // Struct representing match data
  struct MatchData {
    MatchOutcome outcome; // Outcome of the match
    uint256 goalsEngland; // Goals scored by England
    uint256 goalsSpain; // Goals scored by Spain
    bool isMatchFinished; // Flag indicating if the match is finished
    uint256 lastUpdateTime; // Last update time of the match data
  }

  // Interval for updating match data
  uint256 public updateInterval = 15 seconds;
  // Interval for each match
  uint256 public matchInterval = 60 seconds;

  /**
   * @notice Get the current match number based on the block timestamp
   * @return The current match number
   */
  function getCurrentMatchNumber() public view returns (uint256) {
    return block.timestamp / matchInterval;
  }

  /**
   * @notice Pull the latest match data based on the current block timestamp
   * @return matchData The latest match data
   */
  function pullLatestMatchData() public view returns (MatchData memory matchData) {
    // Get the current time
    uint256 currentTime = block.timestamp;
    // Get the current match number
    uint256 matchNumber = getCurrentMatchNumber();

    // Determine match data based on whether the match number is even or odd
    if (matchNumber % 2 == 0) {
      // Even match number: Spain wins
      if (currentTime < updateInterval) {
        // Phase 1: Match starts
        matchData.goalsEngland = 0;
        matchData.goalsSpain = 0;
      } else if (currentTime < 2 * updateInterval) {
        // Phase 2: Match continues
        matchData.goalsEngland = 0;
        matchData.goalsSpain = 1;
      } else if (currentTime < 3 * updateInterval) {
        // Phase 3: Match ends
        matchData.goalsEngland = 0;
        matchData.goalsSpain = 2;
        matchData.isMatchFinished = true;
        matchData.outcome = MatchOutcome.SpainWins;
      }
    } else {
      // Odd match number: England wins
      if (currentTime < updateInterval) {
        // Phase 1: Match starts
        matchData.goalsEngland = 0;
        matchData.goalsSpain = 0;
      } else if (currentTime < 2 * updateInterval) {
        // Phase 2: Match continues
        matchData.goalsEngland = 1;
        matchData.goalsSpain = 0;
      } else if (currentTime < 3 * updateInterval) {
        // Phase 3: Match ends
        matchData.goalsEngland = 2;
        matchData.goalsSpain = 0;
        matchData.isMatchFinished = true;
        matchData.outcome = MatchOutcome.EnglandWins;
      }
    }
  }

  /**
   * @notice Get the match data for a specific match number
   * @param matchNumber The match number to get data for
   * @return matchData The match data for the specified match number
   */
  function getMatchData(uint256 matchNumber) external view returns (MatchData memory matchData) {
    // Use latest match number if the provided number is greater than the current match number
    if (matchNumber >= getCurrentMatchNumber()) {
      matchData = pullLatestMatchData();
      return matchData;
    }

    // Hardcode results for past matches
    if (matchNumber % 2 == 0) {
      // Even match number: Spain wins
      matchData.goalsEngland = 0;
      matchData.goalsSpain = 2;
      matchData.isMatchFinished = true;
      matchData.outcome = MatchOutcome.SpainWins;
    } else {
      // Odd match number: England wins
      matchData.goalsEngland = 2;
      matchData.goalsSpain = 0;
      matchData.isMatchFinished = true;
      matchData.outcome = MatchOutcome.EnglandWins;
    }

    return matchData;
  }

  /**
   * @notice Set a new update interval
   * @param newUpdateInterval The new update interval in seconds
   */
  function setUpdateInterval(uint256 newUpdateInterval) external {
    updateInterval = newUpdateInterval;
  }

  /**
   * @notice Set a new match interval
   * @param newMatchInterval The new match interval in seconds
   */
  function setMatchInterval(uint256 newMatchInterval) external {
    matchInterval = newMatchInterval;
  }
}
