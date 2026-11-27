Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791717;
	b=puiHipnnlH6t7Op8HZR0dP99sX9H5zAAXt+kQKQRmS2swzsVLO/290rxPJgua1q5x+Mv
	 q+2IX1hWYLK8lms2rSBtE4GO8hlCnxoCyn9zq29T2p0Nu1pE2U6nAR+h7bQyUy2iKtjM+
	 +orWTGq+uhlL9VZl5DSa6gHGCOLA7Y9EMqCGRlECjBug9c/uD5piVjOj2ZiCVP10WOJ7U
	 AKwHZDCrVvyUJjdFgTC4fr1PyLPyP0Q92LDSA82Bqw3l5rxoNXOSnc/knHZq1ro2Q2T9M
	 pMKdz354fOmOCrAAWMHD6Uy//KqNCGyAu3B8BTwHLa8+ImozrB56rYlnGECbdiki10w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791717;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wL/VA5+pGxzKnAxonRgHumCPvJPgs/jaOjXoLgiZ+Vw=;
	b=m9c8LX9VxI8tcVd12P2+wXKlJIiZSsBMWNI3Wigzyyh8H5dz0JAn/Hiz1CR+86OTykUQ
	 CJZdK2ICwE0gyCV+61yBRO7dENdouiV608BhmkutJvWIPuBy9uZkYXhHjfWeP2UqqhEBB
	 xvfa70ZibX9WhbgjoNDy2+lb7HeaxhafIRUA0lm4tN0I5GQokky02GiKFUfk9MILTYhTF
	 dqisVZWDF6phSao14mPo5sDkQrOvnU1pSOrCrW+20M1NTJjlle5otqN8wOmSWTc9VJ05p
	 RzOcTh4oZ2LuJiaa++VhPDA8V89LQfbHV3zSmnhhFEmGAQ+htYDMG1Am/FFibOUhDbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddSTOj3O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62392606A32C;
	Fri, 27 Nov 2026 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddSTOj3O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BCC1F00923;
	Fri, 27 Nov 2026 15:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791716;
	bh=wL/VA5+pGxzKnAxonRgHumCPvJPgs/jaOjXoLgiZ+Vw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ddSTOj3OxVWqZmub1TD+JsvwA2uhTOSggOX01VbFvjJ+uRln8f9Ij/mHNAkl48mdo
	 Z7qSr4g+S+pVfmfjH8iIVDgy5So3+lHZavJV1RxUfY7GbdSQGjRFlG6bIIQjgG/GSJ
	 Lu4ekBtjzRCup+QmTA2wT05AqxhmOEz/qaAQMVPLls8C6kG17YBv2Sc44vAIaYL0vf
	 Xt7FIIP9v13zRScpU8IixSPq2hfj3ZPIPMVJPfaJ58kR8Ei4LMxkMV6heuLBX2symV
	 nhfYALkYNSjPzfitYeTCRbhS2X9M6+e/kFo5k6WK3+YIKC4FNhDD96y9SpWME5SZg8
	 ZmTgTqRD09nsg==
Subject: Re: [PATCH net-next v4 1/2] rust: net: phy: take &self in methods
 that do not need phy_device->lock
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
Date: Fri, 27 Nov 2026 15:01:54 +0000
Message-ID: <179579171493.3135.13012003515691317246@kernel.org>
In-Reply-To: <20261126-exp-phy-rs-maybelocked-v4-1-16f9a10bb579@gmail.com>
References: <20261126-exp-phy-rs-maybelocked-v4-1-16f9a10bb579@gmail.com>
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

- [Medium] In rust/kernel/net/phy.rs, `Adapter::soft_reset_callback`
  still builds a `&mut Device` with `Device::from_raw_mut()` on a path…

--

rust: net: phy: take &self in methods that do not need phy_device->lock

This commit splits Device::from_raw() into a shared from_raw() and a new
from_raw_mut(). It redefines &mut Device to mean exclusive access to the
phy_device state that phy_device->lock protects. The getters for that state
now take &mut self, and phy_id(), read(), write() and genphy_suspend() now
take &self. The callback SAFETY comments are updated to say when PHYLIB
calls the callbacks without the lock.

> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index c4e7b1d6c6f4a..bb2cc6b3c94c8 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -57,50 +57,71 @@ pub enum DuplexMode {

[ ... ]

> +/// PHYLIB calls the callbacks that get a `&mut Device` with `phy_device->lock` held, except:
> +///
> +/// - [`Driver::probe`] and [`Driver::get_features`], which `phy_probe()` calls without the lock
> +///   before the device is attached.
> +/// - [`Driver::soft_reset`], which `phy_init_hw()` calls without the lock while the state machine
> +///   is not running, or from a MAC driver that then ensures exclusive access. `phy_mii_ioctl()`,
> +///   which PHYLIB documents as "use at own risk", is outside this guarantee.
> +/// - [`Driver::read_status`], when a MAC driver calls `phy_read_status()` directly. The MAC
> +///   driver is then responsible for exclusive access.
> +///
>  /// # Invariants
>  ///
> -/// - Referencing a `phy_device` using this struct asserts that you are in
> -///   a context where all methods defined on this struct are safe to call.
> -/// - This struct always has a valid `self.0.mdio.dev`.
> +/// - `self.0` is a valid `phy_device`, and `self.0.mdio.dev` is a valid `struct device`.
> +/// - For the lifetime of a `&mut Device`, no other thread accesses the state of the `phy_device`
> +///   that `phy_device->lock` protects.

[ ... ]

> +    /// Creates a new mutable [`Device`] reference from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of `'a`,
> +    /// - the pointer must point at a valid `phy_device`.
> +    /// - `(*ptr).mdio.dev` must be valid.
> +    /// - the caller must have the exclusive access that [`Device`] describes.
> +    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {

[ ... ]

> @@ -309,10 +331,10 @@ impl<T: Driver> Adapter<T> {
>      /// `phydev` must be passed by the corresponding callback in `phy_driver`.
>      unsafe extern "C" fn soft_reset_callback(phydev: *mut bindings::phy_device) -> c_int {
>          from_result(|| {
> -            // SAFETY: This callback is called only in contexts
> -            // where we hold `phy_device->lock`, so the accessors on
> -            // `Device` are okay to call.
> -            let dev = unsafe { Device::from_raw(phydev) };
> +            // SAFETY: `phy_init_hw()` calls this with `phy_device->lock` held, or without it while
> +            // the state machine is not running or a MAC driver ensures exclusive access. The
> +            // `phy_mii_ioctl()` path is outside this guarantee, see `Device`.
> +            let dev = unsafe { Device::from_raw_mut(phydev) };

[Severity: Medium]
Is it sound to call Device::from_raw_mut() in soft_reset_callback() when
the SAFETY comment says the phy_mii_ioctl() path does not give the
exclusive access that from_raw_mut() now requires?

The new invariant on Device says that for the lifetime of a &mut Device,
no other thread accesses the phy_device state that phy_device->lock
protects. However, phy_mii_ioctl() reaches this callback without
phydev->lock, and the PHY state machine may be running at that point:

phy_mii_ioctl()     /* SIOCSMIIREG, BMCR write with BMCR_RESET */
  phy_init_hw(phydev)
    phydev->drv->soft_reset(phydev)
      Adapter::soft_reset_callback()
        Device::from_raw_mut(phydev)
          T::soft_reset(dev)

drivers/net/phy/phy.c:phy_mii_ioctl() {
    ...
		if (prtad == phydev->mdio.addr &&
		    devad == MII_BMCR &&
		    val & BMCR_RESET)
			return phy_init_hw(phydev);
    ...
}

At the same time, phy_state_machine() can hold phydev->lock and run
read_status_callback(). That creates a second &mut Device and writes link,
speed and duplex.

Safe code in a driver's soft_reset can call state(), is_link_up(),
is_autoneg_enabled(), is_autoneg_completed(), set_speed() and set_duplex().
Wouldn't that be a data race reachable from safe Rust?

The commit message says the goal is "so that safe code cannot use that
state without the access". Documenting phy_mii_ioctl() as "outside this
guarantee" does not seem to enforce that.

soft_reset already got a &mut Device before this patch. This patch states
the exclusivity precondition explicitly, though, and the new SAFETY comment
says it is not met on this path. The only in-tree user, asix_soft_reset()
in ax88796b_rust, calls only dev.write() and genphy_soft_reset(). The last
patch in the series, "rust: net: phy: pass &Device to suspend, read_mmd and
write_mmd", leaves soft_reset_callback() unchanged.

Could Driver::soft_reset take a &Device instead, so this path does not
create a &mut Device?

>              T::soft_reset(dev)?;
>              Ok(0)
>          })

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-exp-phy-rs-maybelocked-v4-0-16f9a10bb579%40gmail.com
