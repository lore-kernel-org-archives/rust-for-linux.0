Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814417;
	b=QbsomK9sLp9cYV9O/Vdgu4a51fBxSBCYDepHaYYrWtDdCKYq3jcXRXsqY7HLGnQj6yc3
	 ld4tRpinsATs+YhYeU0+kn3S9LpSQOEqydsH+MQtoDAduC2d3vg3+xve739jJDIqbLrwH
	 ZNn7LX9wXrzetsbWtuCpAnaDO/pImzT9YGEBTi+pdJ56O4/YumLTDlEi+6CXK0sSx67Fk
	 xXkFN7Rg5sfwDuy0hrOAz5b1pnTpQif3bR0yA6N4wCL3gQ09zs5lj5B6+NCtdRTtII5W+
	 9WwfFXL5kXEncCdUHhsxBQNgAhNpRVLpuZ+yGfwI0VdoCiZ46GKltqh4vzTlWtO3Iww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814417;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/XC/Q1Mv6Gwi8+0irBqNo8aBwyEMA9qX9K4d8AdjCV8=;
	b=LhdjBZwfr5i/HScce08uNn2u6ExdCg+xm9zADZ5GtWlb7o3CsEALfth+CCCpsbzGBWlJ
	 l/zJmd0mpcpXjwVz4ZmDXFwP98KtIs0EW0NVKpmrGR1gIp/D2Qr86gVlojSFq3DNWt8Bf
	 /uzNJA0MPtHStUVMA16Zw1luG3EUl8FLNvrL0b1roIVzWKnbI2K4edZBLJZuVZ6GXG93f
	 O0teVoFUEy3HrQLtokYTlqe0Pjiu3etkCr1XBETLF4WyngTVP9LHbEVFtdP6pWQkkZ9Mm
	 ++b03JyuSyB5wxClt/5es9lUrbd+1l/MbSNKCiu6/k/Av9oJ4U+Ia6Pf2KUVuzkNZiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hf+eFbnz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBA6606A33F;
	Mon, 16 Nov 2026 07:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hf+eFbnz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B741F000C4;
	Mon, 16 Nov 2026 07:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814416;
	bh=/XC/Q1Mv6Gwi8+0irBqNo8aBwyEMA9qX9K4d8AdjCV8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Hf+eFbnzWzP7jSJkU9fhUICakc7Oae3Zg0gj00F8L9z4UdA6VQISyy6zPZtD1kPGZ
	 0GyYaktnIPN98Z9WMvfF0ZdCVWVoVcCfLMieTglqQZIYVa8FTy+NbVmynY0IkMGOHQ
	 PWHJJ1za5APXeyaolV/7CGP0nbLEBn+lt2QHCfTA0CDMxPtMnNfuTZ5og7iy9rFCQf
	 ayWjn0DDIOrUdvIiyfvciI0JzeND0FvQV3Yu5BokTKEymFZvedJaVXYl2VUSx15sZd
	 E9mhN7nhDISULSoVWKXmpycvbtuzg7mAmSFlcs5AtyknQJlb80fBfVjTaYxz29EGBv
	 Fpepz2nQTzaww==
Subject: Re: [PATCH RESEND net-next v2 3/3] rust: net: phy: pass a MaybeLocked
 device to soft_reset
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
Date: Mon, 16 Nov 2026 07:33:34 +0000
Message-ID: <179481441455.3136.11985756118593625944@kernel.org>
In-Reply-To: <20261115-exp-phy-rs-maybelocked-v2-3-8fa7897a0352@gmail.com>
References: <20261115-exp-phy-rs-maybelocked-v2-3-8fa7897a0352@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new SAFETY reasoning for the MaybeLocked soft_reset path
  misses the phy_mii_ioctl() path, where soft_reset runs at the same…
- [Low] Two sibling callbacks in rust/kernel/net/phy.rs still carry the
  false lock-held SAFETY comment that this patch removes from…

--

rust: net: phy: pass a MaybeLocked device to soft_reset

This changes the Rust PHY abstraction so that Driver::soft_reset gets a
Device<MaybeLocked> rather than a Locked device. The reason is that
phy_init_hw() calls soft_reset both with and without phydev->lock. The
SAFETY comment in soft_reset_callback is updated to match, and
ax88796b_rust is converted to the new signature.

> diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
> index 2d24628a4e581..88e6e3c88b448 100644
> --- a/drivers/net/phy/ax88796b_rust.rs
> +++ b/drivers/net/phy/ax88796b_rust.rs
> @@ -30,7 +30,7 @@
>  // BMCR_RESET bit and poll for the reset bit to be cleared.
>  // Toggle BMCR_RESET bit off to accommodate broken AX8796B PHY implementation
>  // such as used on the Individual Computers' X-Surf 100 Zorro card.
> -fn asix_soft_reset(dev: &mut phy::Device) -> Result {
> +fn asix_soft_reset(dev: &mut phy::Device<phy::MaybeLocked>) -> Result {
>      dev.write(C22::BMCR, 0)?;
>      dev.genphy_soft_reset()
>  }

[Severity: Medium]
Is it sound to call genphy_soft_reset() on a Device<MaybeLocked> when the
caller is phy_mii_ioctl()?

When SIOCSMIIREG writes BMCR_RESET to MII_BMCR, phy_mii_ioctl() calls
phy_init_hw() with only RTNL held. phydev->lock is not taken:

phy_mii_ioctl()
  phy_init_hw()
    phydev->drv->soft_reset()
      Adapter::soft_reset_callback()
        asix_soft_reset()
          genphy_soft_reset()

The C genphy_soft_reset() reads phydev->autoneg and writes
phydev->suspended. If autoneg is disabled it also calls
genphy_setup_forced(), which writes pause and asym_pause. After that,
phy_init_hw() writes phydev->suspended = 0 itself.

In struct phy_device, suspended, autoneg, link, autoneg_complete, pause
and asym_pause are bitfields in the same block. A write to suspended is
therefore a read-modify-write of the storage that also holds link and
autoneg_complete.

phy_state_machine() takes only phydev->lock, not RTNL:

    mutex_lock(&phydev->lock);
    state_work = _phy_state_machine(phydev);
    mutex_unlock(&phydev->lock);

Under that lock it runs Locked callbacks such as read_status and
config_aneg, and it updates link. __phy_resume() also writes suspended
under lockdep_assert_held(&phydev->lock).

Nothing keeps the ioctl path and the state machine from running at the
same time. Could a link or pause update be lost here?

This seems to contradict a few statements in the series:

- The Locked invariant says that while a &mut Device<Locked> is alive, no
  other thread touches the state that phy_device->lock protects.

- The SAFETY comment in Device::genphy_soft_reset says the C function
  does not need phy_device->lock because PHYLIB itself calls it without
  the lock. The unlocked PHYLIB callers, phy_attach_direct() and
  mdio_bus_phy_resume(), rely on the state machine not running. The ioctl
  caller has no such exclusion.

- The MaybeLocked documentation gives no invariants beyond those of
  Device, yet genphy_soft_reset() is available in every context.

The race itself is older than this series. C drivers that use
genphy_soft_reset() have it too, and phy_mii_ioctl() is documented as
incompatible with the PHYCONTROL layer. However, this patch is the first
to call genphy_soft_reset() on a MaybeLocked device based on the new
soundness claims.

Would it make sense to take genphy_soft_reset() out of the generic impl?
Alternatively, the MaybeLocked/Locked docs could describe the exclusion
that the unlocked callers rely on, and note that the phy_mii_ioctl() path
breaks it.

[ ... ]

> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index 105a1b727a088..46602798e8aca 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -358,9 +358,8 @@ impl<T: Driver> Adapter<T> {
>      /// `phydev` must be passed by the corresponding callback in `phy_driver`.
>      unsafe extern "C" fn soft_reset_callback(phydev: *mut bindings::phy_device) -> c_int {
>          from_result(|| {
> -            // SAFETY: This callback is called only in contexts
> -            // where we hold `phy_device->lock`, so the accessors on
> -            // `Device` are okay to call.
> +            // SAFETY: `phydev` is valid for the callback. `phy_init_hw()` calls `soft_reset` both
> +            // with and without `phy_device->lock`, which is the `MaybeLocked` context.
>              let dev = unsafe { Device::from_raw(phydev) };
>              T::soft_reset(dev)?;
>              Ok(0)

[Severity: Low]
This fixes the lock-held SAFETY comment in soft_reset_callback(). Two
other callbacks in the same file, get_features_callback() and
match_phy_device_callback(), still have the same text:

    // SAFETY: This callback is called only in contexts
    // where we hold `phy_device->lock`, so the accessors on
    // `Device` are okay to call.
    let dev = unsafe { Device::from_raw(phydev) };

Is that still accurate for either of them? phy_probe() calls
get_features without taking phydev->lock:

    else if (phydrv->get_features)
        err = phydrv->get_features(phydev);

phy_bus_match() calls match_phy_device during driver-core matching. It
also runs without the lock, and the device may be unbound or bound to
another driver:

    if (phydrv->match_phy_device)
        return phydrv->match_phy_device(phydev, phydrv);

The Locked documentation added earlier in this series already says that
both callbacks run without the lock, so the file now contradicts itself.
The earlier commit "rust: net: phy: make Device generic over a lock
context" also says it will "Update the documentation and SAFETY comments
to match".

match_phy_device_callback() also still creates a &mut Device<Locked>,
which is only coerced to &Device when it is passed to
T::match_phy_device(). The Locked invariant cannot hold for a device that
is bound to another driver.

Could that SAFETY comment explain why the short-lived exclusive reference
is acceptable, rather than saying the lock is held?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352%40gmail.com
