Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138664;
	b=5Hw0sg0Pryh9A8AdK44mqdKcwyaYwsSltmpAyLeUyp3KMcw7UTKjbxK2ZDETManAr3eW
	 Dr+8VJRFayNlEzROntiT/UDN8BRSD4LlZXMcG7PoAKF6VoaBhjnfFhv0Ds/kkIqHMYguH
	 y/FTGYDBw+Z2zYPkMa5RlF2tll7e4ZITtf47DRotzrYaBc40jcXUhEONdkyGYkOzIeyVB
	 /urbVy5fAklebySFqhXBIArD5FSGV+JGUzPm6oAlIhwFkeSuds3QAUDgQeD9NBtONj8JV
	 459x25nsz4YYdXnSt3VKAP4BWdSbelqhbBSLcK6VuLGlfg130rEYCzsssuGI0zG76+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138664;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vk5kTLhPES228V4LF5kbKJpMQi2f/f/fok4/6jL/c4o=;
	b=0KJZgSZL4oS65lQKt32++Uu9ji6axfH6vd//rNni6UJIP+mFUd8elsOVK1rv7b+GIxUZ
	 oHAPbKZda7OxmgHUVLPKzewkA3Ta+6xNePhakj+tZKJllFnvw/RroJDnWJ0Je7uzHlffh
	 ZEOupBpiLjLQwkLW+EuEo3OWoD3TQ7clsfQShpKc04doPM2ID83FdhByvjcYsylDZj3Rg
	 EiyVIT8uwSDxWrfHcjz1klHAD+Q/lx6ELnzpOgD+CcTHddMDEp5Y6uzinV8+FXdTt3aG4
	 bIE9ghRRpqpq4M/g5hk67OGsHbmqC6HPSSY5h2pfCHnSGnrMk/N2RVoqRhYbK3cUQ/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CzcRCndL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FF2606A320;
	Fri, 20 Nov 2026 01:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CzcRCndL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12BD1F000C6;
	Fri, 20 Nov 2026 01:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795138664;
	bh=vk5kTLhPES228V4LF5kbKJpMQi2f/f/fok4/6jL/c4o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CzcRCndLWN4YEqnyKISKMfBfOsIvLWcLb3/Yw3lW2hrP7RnLPksJqQ6TOfNlmWQu1
	 HW6ShgUbhVC0U2SUJ6c5jTFUteR4xqtaS7TsWdqMm82a4zUzMa+odxg17zQJsqxpim
	 u6IZM8Tt8+wI1HK+uJt9RCsJAYLy80S7gOb/7Wr33J4s9/c328e/vAOV3oVr4h1cBp
	 6x44oAJKAY/1T8vDR/XAouYFdrly/mr+oLDI3RCqwa2S36HgL77jC3/NzWLti4aYz0
	 yQslN+sa5GdHquCxJ4b+MLckN9OK9jHqLKCurU8oSLE5FJWP1GjKIA/3bngzRuQGRt
	 9TN6z/cbHnskg==
Subject: Re: [PATCH net-next v3 2/3] rust: net: phy: make Device generic over
 a lock context
From: netdev-bot+sashiko@kernel.org
To: engineer.jjhama@gmail.com
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 01:37:42 +0000
Message-ID: <179513866237.3136.3197734576083995986@kernel.org>
In-Reply-To: <20261117-exp-phy-rs-maybelocked-v3-2-4e183a7366a7@gmail.com>
References: <20261117-exp-phy-rs-maybelocked-v3-2-4e183a7366a7@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch adds a formal `# Invariants` section to `Locked`:
  "For the lifetime of a `&mut Device<Locked>`, no other thread accesses…

--

rust: net: phy: make Device generic over a lock context

This patch makes the Rust PHY Device type generic over a lock context.
The context is either Locked (the default) or MaybeLocked, and methods
that do not need phy_device->lock move to both contexts. The patch also
documents when the Locked callbacks run without the lock and rewrites
their SAFETY comments.

> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index 4604a9c0a5111..8cbb4c19dac1d 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -50,6 +50,55 @@ pub enum DuplexMode {

[ ... ]

> +/// - [`Driver::soft_reset`], which `phy_init_hw()` calls without the lock from
> +///   `phy_attach_direct()` and `mdio_bus_phy_resume()` while the state machine is not running, and
> +///   from MAC drivers that call `phy_init_hw()` directly, which are then responsible for exclusive
> +///   access. `phy_mii_ioctl()` also calls it without the lock while the state machine may run,
> +///   which is an existing PHYLIB race.
> +/// - [`Driver::read_status`], when a MAC driver calls `phy_read_status()` directly. The MAC
> +///   driver is then responsible for exclusive access.
> +///
> +/// # Invariants
> +///
> +/// For the lifetime of a `&mut Device<Locked>`, no other thread accesses the state of the
> +/// `phy_device` that `phy_device->lock` protects.
> +pub struct Locked;

[ ... ]

> @@ -309,10 +355,10 @@ impl<T: Driver> Adapter<T> {
>      /// `phydev` must be passed by the corresponding callback in `phy_driver`.
>      unsafe extern "C" fn soft_reset_callback(phydev: *mut bindings::phy_device) -> c_int {
>          from_result(|| {
> -            // SAFETY: This callback is called only in contexts
> -            // where we hold `phy_device->lock`, so the accessors on
> -            // `Device` are okay to call.
> -            let dev = unsafe { Device::from_raw(phydev) };
> +            // SAFETY: `phy_init_hw()` calls this with `phy_device->lock` held, or without it while
> +            // the state machine is not running or a MAC driver ensures exclusive access.
> +            // `phy_mii_ioctl()` is an exception, see `Locked`. This is the `Locked` context.
> +            let dev = unsafe { Device::<Locked>::from_raw(phydev) };

[Severity: Medium]

Does this SAFETY comment justify the from_raw() call?

The new Locked invariant says that no other thread accesses the
lock-protected phy_device state for the lifetime of a &mut Device<Locked>.
from_raw() now also requires the caller to be in the Ctx context.

However, this comment and the Locked docs above both say that
phy_mii_ioctl() reaches this callback without phydev->lock while the
state machine may be running.

An SIOCSMIIREG write to MII_BMCR with BMCR_RESET set takes this path:

ndo_eth_ioctl
  phy_mii_ioctl()
    phy_init_hw()              /* no phydev->lock */
      drv->soft_reset()
        Adapter::soft_reset_callback()
          Device::<Locked>::from_raw()

drivers/net/phy/phy.c:phy_mii_ioctl() {
    ...
		if (prtad == phydev->mdio.addr &&
		    devad == MII_BMCR &&
		    val & BMCR_RESET)
			return phy_init_hw(phydev);
    ...
}

At the same time, phy_state_machine() can hold phydev->lock and write
speed, duplex, link, autoneg and state.

This affects an in-tree driver. asix_soft_reset() in
drivers/net/phy/ax88796b_rust.rs calls genphy_soft_reset(), which is
only available on Device<Locked>. It reads phydev->autoneg and writes the
phydev->suspended bitfield.

Can that race with the state machine's writes to the same fields and to
the neighbouring bitfields? That would be a data race reachable from safe
Rust code.

The C-side race in phy_mii_ioctl() was there before this patch. The
Locked invariant and the "This is the Locked context" justification are
new here, though.

The commit message says:

    Document when the `Locked` callbacks run without the lock, including the
    existing phy_mii_ioctl() race, and fix their SAFETY comments.

For soft_reset, the new comment itself says the precondition is not met.
The later patches in the series only move suspend to MaybeLocked.

Would one of these work instead?

- take phydev->lock around phy_init_hw() in phy_mii_ioctl()
- weaken the Locked invariant and drop the accessors that rely on it
- give soft_reset a context that does not claim exclusive access

>              T::soft_reset(dev)?;
>              Ok(0)
>          })

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7%40gmail.com
