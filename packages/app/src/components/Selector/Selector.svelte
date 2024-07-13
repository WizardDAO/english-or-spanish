<script lang="ts">
  import { onMount } from 'svelte';

  let selectedTab = 'Buy';
  let limitType = 'Limit';
  let outcome = 'Spain';
  let limitPrice = 59;
  let shares = 0;
  let isLoggedIn = false;
  let startDate = 1720983600000;
  let endDate = 1720990800000;

  function switchTab(tab: string) {
    selectedTab = tab;
  }

  function toggleOutcome(team: string) {
    outcome = team
  }

  function increment(field: string) {
    if (field === 'limitPrice') limitPrice++;
    if (field === 'shares') shares++;
  }

  function decrement(field: string) {
    if (field === 'limitPrice' && limitPrice > 0) limitPrice--;
    if (field === 'shares' && shares > 0) shares--;
  }
</script>

<style>
  .trade-form {
    padding: 16px;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    background-color: #fff;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    font-family: Basel, sans-serif;
    width: 400px;
  }

  .tabs {
    display: flex;
    justify-content: space-around;
    margin-bottom: 24px;
  }

  .tab {
    padding: 8px 16px;
    cursor: pointer;
    height: 40px;
    width: 50%;
    border-bottom: 2px solid transparent;
  }

  .tab.selected {
    border-bottom: 2px solid blue;
    font-weight: bold;
    color: blue;
  }

  .limit-type {
    display: flex;
    justify-content: space-between;
    margin-bottom: 16px;
    cursor: pointer;
  }

  .outcome {
    display: flex;
    justify-content: space-between;
    margin-bottom: 16px;
  }

  .outcome div {
    padding: 8px 16px;
    width: 30%;
    border-radius: 8px;
  }

  .outcome div.selected {
    background-color: green;
    color: white;
  }

  .outcome div.unselected {
    background-color: lightgray;
    color: gray;
  }

  .field {
    margin-bottom: 16px;
  }

  .field label {
    display: block;
    margin-bottom: 8px;
  }

  .field div {
    display: flex;
    align-items: center;
    justify-content: space-between;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    padding: 8px 12px;
  }

  .field div button {
    background: none;
    border: none;
    cursor: pointer;
    font-size: 16px;
  }
  .price {
    width: 100%;
    text-align: center;
  }

  .login {
    display: flex;
    justify-content: center;
    margin-bottom: 16px;
  }

  .login button {
    width: 100%;
    background-color: blue;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
  }

  .summary {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    text-align: center;
  }

  .summary div {
    margin-bottom: 8px;
  }

  .summary .total {
    color: blue;
  }

  .summary .potential-return {
    color: green;
  }
</style>

<div class="trade-form">
  <div class="tabs">
    <div class="tab {selectedTab === 'Buy' ? 'selected' : ''}" on:click={() => switchTab('Buy')}>Buy</div>
    <div class="tab {selectedTab === 'Sell' ? 'selected' : ''}" on:click={() => switchTab('Sell')}>Sell</div>
  </div>
  <div class="field">
    <label for="limitPrice">Match Details</label>
    <div>
      <span class='price'>{new Date(startDate).toLocaleString()}</span>
      -
      <span class='price'>{new Date(endDate).toLocaleString()}</span>
    </div>
  </div>

  <div class="outcome">
    <div class="{outcome === 'Spain' ? 'selected' : 'unselected'}" on:click={() => toggleOutcome('Spain')}>Spain</div>
    <div class="{outcome === 'Draw' ? 'selected' : 'unselected'}" on:click={() => toggleOutcome('Draw')}>Draw</div>
    <div class="{outcome === 'England' ? 'selected' : 'unselected'}" on:click={() => toggleOutcome('England')}>England</div>
  </div>

  <div class="field">
    <label for="limitPrice">Price</label>
    <div>
      <span class='price'>{limitPrice}¢</span>
    </div>
  </div>

  <div class="field">
    <label for="shares">Shares</label>
    <div>
      <button on:click={() => decrement('shares')}>−</button>
      <span>{shares}</span>
      <button on:click={() => increment('shares')}>+</button>
    </div>
  </div>

  <div class="login">
    <button>
      {selectedTab}
    </button>
  </div>

  <div class="summary">
    <div class="total">Total: <span>$0.00</span></div>
    <div class="potential-return">Potential return: <span>$0.00 (0.00%)</span></div>
  </div>
</div>
