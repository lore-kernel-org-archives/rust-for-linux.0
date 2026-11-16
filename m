Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814414;
	b=T3jlVdBjuJMqxdlPT5pCw5p59pLlmkbkF12N53Jo3ummQFeob8ByVNjhaKtA3Ci4guLa
	 hHzCtip3zU9hJ3F1tHiQImuCtU8Y7rQb5Xf1i5Scg3jqOTj6E3d+pTnD/J3bFl/UYkese
	 nam8SRk507YOL1swDKCpk/NPYCwtfZ6dm49RzK+JHRGjeJvxMG98SZcZ1+Jfw9J10vunu
	 YB3ygk1bnLHHE8arxgUYcvFCaIKeVu/ViAMC8AZ/m0yXE2nIQtrZKdF8tFFujtD0iYqr+
	 iPq99FEmH287QYTOw3uXIANz3eyQfn4JILrzgrhhpUO2Dgm6x7t2ryGlvcmXo/aRtfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814414;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZSfgqdGwCAZSv33LraZUlvda7VWvNJ3OL164hELpjTU=;
	b=rWfNnDq+/of0+1eLG9d092WFWWmkdRRlCXIDm1JHCV3LjHdJiSqattsqGhyt2RdoEksd
	 LQbhdDl6t1W8fNOwQ6Izy+CWL4CiR1AutbfSErebvxYI/muCpUB2lMjpqadW32kXSmouA
	 kIeieoRU4xxQOa9Pu+xI4n66d8q5EvozDqg3tcYTSNwgozNBXpMm4KoS3GFxj986LIQLW
	 GhkhT8DlJEQ76gIbJoADK8NGoBZ23C03/tUr1ZrhbnrFW23HtvDyI1t6wylpCpa+acRP3
	 wfsArn0ta7jQVtNYl8SWecNja7rujWcgIGahUwVxbRxpVS2y9vTEb2dGP54MU2uOwbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iPZpNxaD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50E1606A31C;
	Mon, 16 Nov 2026 07:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iPZpNxaD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB7B1F000C4;
	Mon, 16 Nov 2026 07:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814414;
	bh=ZSfgqdGwCAZSv33LraZUlvda7VWvNJ3OL164hELpjTU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iPZpNxaDvQ+0/44LrEVn/j2ewesqjChof0LJDrrbjdye8nTpw8rgGyPVReIp1aEW0
	 iY5r9fRLZ6y1UsmC7p03+4PRX8WZzDvZjKt9Cst41L/PhfTFjO/UnXCAcO3rvJwkEE
	 4P4g6/nk6jIV6Jur0uMMIyRQPQvsW+UCYnNcd+gp2Rsc0VLB5YNNaCNiliqwQYRd84
	 o4NwBrXInPq5sREFgzrs7R7WFmzDlJ+RE8PiC9+dTl+iGNgfv5yQ3Sm6DY4wpLO1QG
	 7Q7FI1iw8eUJ+bC7ZdWjHf9oog1O9SCWyoGtob+3Vmuk8oi/boXG9iVrt6aUkg+pYA
	 bp0dwhzFI/S0A==
Subject: Re: [PATCH RESEND net-next v2 2/3] rust: net: phy: make Device
 generic over a lock context
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
Date: Mon, 16 Nov 2026 07:33:32 +0000
Message-ID: <179481441244.3136.17001607410238147789@kernel.org>
In-Reply-To: <20261115-exp-phy-rs-maybelocked-v2-2-8fa7897a0352@gmail.com>
References: <20261115-exp-phy-rs-maybelocked-v2-2-8fa7897a0352@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] `match_phy_device` is still given a `Device<Locked>` even
  though, as the new docs themselves say, it runs without…
- [Medium] The new `Locked` doc (rust/kernel/net/phy.rs:66-68) puts
  `Driver::suspend` under "Without the lock, but where PHYLIB ensures by…
- [Low] The commit message says "Update the documentation and SAFETY
  comments to match", but the callback SAFETY comments in `Adapter<T>`…
- [Low] The new `Locked` doc (rust/kernel/net/phy.rs:66-68) lists
  `Driver::resume` among callbacks PHYLIB calls "Without the lock".

--

rust: net: phy: make Device generic over a lock context

This commit makes the Rust PHY Device type generic over a lock context,
Locked (the default) or MaybeLocked. It moves phy_id(), read(), write()
and genphy_soft_reset() into an impl block that covers both contexts, and
documents which PHYLIB callbacks run with or without phy_device->lock.

> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index 7ca3f2329e6a2..105a1b727a088 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -50,6 +50,51 @@ pub enum DuplexMode {
>      Unknown,
>  }
>  

[ ... ]

> +/// The [`Device`] context of every [`Driver`] callback that does not take a
> +/// [`Device<MaybeLocked>`].
> +///
> +/// PHYLIB calls these callbacks in one of three ways:
> +///
> +/// - With `phy_device->lock` held: every callback not listed below.
> +/// - Without the lock, but where PHYLIB ensures by other means that no other path accesses the
> +///   instance: [`Driver::probe`] and [`Driver::get_features`], which are called from
> +///   `phy_probe()`, and [`Driver::suspend`] and [`Driver::resume`].

[Severity: Medium]
Does PHYLIB really guarantee exclusive access for Driver::suspend?

phy_state_machine() releases the lock before the post-work step:

drivers/net/phy/phy.c:phy_state_machine() {
    ...
	mutex_lock(&phydev->lock);
	state_work = _phy_state_machine(phydev);
	mutex_unlock(&phydev->lock);

	_phy_state_machine_post_work(phydev, state_work);
    ...
}

For PHY_HALTED or PHY_ERROR, _phy_state_machine() returns
PHY_STATE_WORK_SUSPEND. The unlocked part then calls:

_phy_state_machine_post_work()
    phy_suspend()
        phydrv->suspend(phydev)

and no lock is held during that call.

Meanwhile, phy_ethtool_ksettings_set() or phy_start_aneg() can take
phydev->lock, write phydev->autoneg, speed and duplex, and call
_phy_start_aneg()->config_aneg. A halted PHY doesn't count as started, so
that path is reachable.

In that case suspend_callback() and config_aneg_callback() each hold a
&mut Device<Locked> for the same phy_device, on different CPUs. Safe code
in the suspend callback (set_speed(), set_duplex(), genphy_update_link()
and so on) would then race with the lock holder.

Wouldn't that break the new Locked invariant further down, which says no
other thread touches the lock-protected state while a &mut Device<Locked>
exists?

The old struct comment made a similar claim. This patch turns it into a
formal invariant, though, and suspend still gets a type that says the
lock is held.

[Severity: Low]
Is Driver::resume actually called without the lock? The only call site of
phydrv->resume seems to be __phy_resume(), and it asserts that the lock is
held:

drivers/net/phy/phy_device.c:__phy_resume() {
    ...
	lockdep_assert_held(&phydev->lock);

	if (!phydrv || !phydrv->resume)
		return 0;

	ret = phydrv->resume(phydev);
    ...
}

phy_resume() also takes phydev->lock around that call. The SAFETY comment
in resume_callback(), which this patch leaves unchanged, says the lock
"might not be held", so it has the same inaccuracy.

> +/// - Without the lock, possibly on an unbound device or one bound to another driver:
> +///   [`Driver::match_phy_device`], which therefore only gets a shared reference.
> +///
> +/// # Invariants
> +///
> +/// For the lifetime of a `&mut Device<Locked>`, no other thread accesses the state of the
> +/// `phy_device` that `phy_device->lock` protects.
> +pub struct Locked;

[Severity: Medium]
Does a shared reference give match_phy_device any protection here? The
invariant only covers &mut Device<Locked>. match_phy_device_callback()
still creates one through from_raw() and passes a &Device<Locked> to
T::match_phy_device():

rust/kernel/net/phy.rs:Adapter::match_phy_device_callback() {
    ...
        let dev = unsafe { Device::from_raw(phydev) };
        T::match_phy_device(dev).into()
}

phy_bus_match() calls phydrv->match_phy_device() without the lock.
__driver_attach() calls driver_match_device() on every device on the bus
before it checks dev->driver, so this includes PHYs already bound to
other drivers.

So when a Rust PHY driver that implements match_phy_device is loaded:

phy_drivers_register()
  driver_register()
    bus_add_driver()
      __driver_attach()
        phy_bus_match()
          match_phy_device_callback()

safe code can call state(), is_link_up(), is_autoneg_enabled() or
is_autoneg_completed() on a PHY whose phy_state_machine() is running
under phydev->lock for another driver. Those accessors do plain reads,
justified by "there is no concurrent write to this field". At the same
time, _phy_state_machine() writes fields such as phydev->link.

Isn't this still a callback that runs without the lock but gets a Device
whose type says the lock is held? The commit message gives that as the
problem to fix, and it still applies at the end of the series.

[ ... ]

> @@ -276,7 +280,52 @@ pub fn genphy_read_abilities(&mut self) -> Result {
>      }
>  }
>  
> -impl AsRef<kernel::device::Device> for Device {
> +impl<Ctx: PhyContext> Device<Ctx> {
> +    /// Creates a new [`Device`] instance from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of `'a`,
> +    /// - the pointer must point at a valid `phy_device`, and the caller
> +    ///   must be in the `Ctx` context, see [`Locked`] and [`MaybeLocked`].
> +    /// - `(*ptr).mdio.dev` must be a valid.
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {

[Severity: Low]
The commit message says:

    Update the documentation and SAFETY comments to match.

The from_raw() callers in Adapter<T> weren't updated, though. None of
them says which context it is in or why; they all get Ctx = Locked by
inference.

Some of those comments now contradict the new Locked docs.
get_features_callback() still says:

            // SAFETY: This callback is called only in contexts
            // where we hold `phy_device->lock`, so the accessors on
            // `Device` are okay to call.
            let dev = unsafe { Device::from_raw(phydev) };

The Locked docs say get_features is called from phy_probe() without the
lock, and the C code agrees:

drivers/net/phy/phy_device.c:phy_probe() {
    ...
	else if (phydrv->get_features)
		err = phydrv->get_features(phydev);
    ...
}

match_phy_device_callback() has the same comment, while the Locked docs
say match_phy_device runs without the lock.

The invariant on struct Device ("a context where all methods defined on
this struct are safe to call") still describes the old single-context
model. So does the comment block above the struct definition.

A later patch in the series, "rust: net: phy: pass a MaybeLocked device
to soft_reset", updates only the soft_reset_callback() comment. The
get_features and match_phy_device comments are still out of date at the
end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115-exp-phy-rs-maybelocked-v2-0-8fa7897a0352%40gmail.com
