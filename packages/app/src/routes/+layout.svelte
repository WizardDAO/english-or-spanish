<script lang="ts">
  import '../app.css';
  import { Responsiveness } from '$components/Responsiveness';
  import { onDestroy, onMount } from 'svelte';
  import { TopNavBar } from '$components/TopNavBar';
  import { Footer } from '$components/Footer';
  import { Toasts } from '$components/Toast';
  import { startWatching, stopWatching } from '$libs/wagmi';
  import { WalletConnect } from '$components/Web3';
  import { PUBLIC_WALLETCONNECT_PROJECT_ID } from '$env/static/public';

  onMount(() => {
    // Set theme
    // localStorage.setItem('theme', 'light');
    const theme = localStorage.getItem('theme');
    document.documentElement.setAttribute('data-theme', 'dark'); // Set default theme
    startWatching();
  });

  onDestroy(() => {
    stopWatching();
  });
</script>

<!-- Comment to Disable WEB3 (Requires PUBLIC_WALLETCONNECT_PROJECT_ID to work) -->
{#if PUBLIC_WALLETCONNECT_PROJECT_ID}
  <WalletConnect />
{/if}

<Toasts />
<Responsiveness />
<WalletConnect />

<div class="flex body-regular h-screen flex-col bg-cool bg-cover bg-[center_top_2rem] min-w-[330px] overflow-x-hidden">
  <div
    class="flex flex-col relative top-0 w-full items-center justify-center bg-[#FFFFFF] bg-opacity-25 border-b border-b-black">
    <TopNavBar />
  </div>
  <slot />

  <!-- Footer -->
  <div class="relative bottom-0 flex flex-col w-full items-center justify-center bg-primary-background">
    <Footer />
  </div>
</div>
