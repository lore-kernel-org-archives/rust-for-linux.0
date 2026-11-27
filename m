Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791720;
	b=GW+F9bqsKpVfkkZwpyXVx7PIT35U9aDD0iVP5LiBe6MAowUnr2wT7BFZFVIAlFdJnRJx
	 541k5TVYOSThNNHb32yr1QaTacT27ZGv0v9tXafFH4JoZ1j9JkZXqnESSRD/d7mYAhuj2
	 CxD8VmF7W/KmKKPgHOSOyLxCIT90k2nP1q4rX+naxQGx2U9xKT9VJR0JDeEft0pBDMubK
	 1Yqvunqqo+P/y/BDc7aFQbmKgAVCFNtF3sR11p0tpVjz2NZv0XOfxgi05F5QEDajssQfX
	 9pyweCRnXZM1P+w5/30ieSMeYzUuKdNQrzaXnuXoSdLNQgLVjAniAZi9dPGBw4r5piQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791720;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gavLcZVGISvYCgA5MKkRgGqRprf3c04aAEhyObo7WH0=;
	b=O102nt/n56VkMWQPUlodKC2N0CMCxZNthT0P1QRhDocFC97xM2/ZzulG4QOi1ta/b1Ul
	 gBr00t5NbhmVm9dW6gjqRu/Dq4+94rj6rcxrirCGl3a5EzRqH9ucaKISXrSGBrCUKeOsT
	 OlSF1Hm1L9LKsMK39eT1LNx0jngg37mf4RL2yQQSNdxJB2ycYPQQBb/5QN8t2HoJWIu7m
	 CiRN7q1dy3a/PZldsFS+2vkn4UgdgSxVm5JAX3XUmuT/S7ejUYXmjSbLl8yPC8k+2kzUK
	 B0dyUIdUxvxKW55nY2rxX61vP/y7LnW514XwLZXyWk5xTaI5WL4TeTZECcF9G+6oJ4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y1AMsJGm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED992606A332;
	Fri, 27 Nov 2026 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y1AMsJGm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084ED1F00925;
	Fri, 27 Nov 2026 15:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791719;
	bh=gavLcZVGISvYCgA5MKkRgGqRprf3c04aAEhyObo7WH0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y1AMsJGmTSoeBnJeSnK81ArrXDkJlSz8cl90Ch0PEgJFym2qaMEqwG2rjjmbcIULK
	 7qC+7uCyZ3fhasBkePeZdgwQLCwfhMWcnQs2tZnb/MBczoaLPHJdeIuPG/YHcTBQqS
	 TvsLYpc4pfTzVKKVtvjgG4FOQW2+5YTVqO8CYdMySRX0qpu1Ai3OA5oTerxtqa7475
	 sLh9VxikgXx2xZEwW+f5mwKXKD4cWBoFbo9Q4f12PMPc/yF05HYcWJAPUJDDGUlTXT
	 cCLszI7953dHgNgzfitXeK4Z/A7waQIZMJTD5wcxp8vuk6tiyH2c+IiJA/TQwz11lt
	 k5HPUfAw/s96A==
Subject: Re: [PATCH net-next v4 2/2] rust: net: phy: pass &Device to suspend,
 read_mmd and write_mmd
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
Date: Fri, 27 Nov 2026 15:01:57 +0000
Message-ID: <179579171759.3135.17093174832715178@kernel.org>
In-Reply-To: <20261126-exp-phy-rs-maybelocked-v4-2-16f9a10bb579@gmail.com>
References: <20261126-exp-phy-rs-maybelocked-v4-2-16f9a10bb579@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch adds doc comments to `Driver::read_mmd` and
  `Driver::write_mmd` in rust/kernel/net/phy.rs.

--

rust: net: phy: pass &Device to suspend, read_mmd and write_mmd

This commit changes the suspend, read_mmd and write_mmd callbacks in the
Rust PHY abstraction to take &Device instead of &mut Device. The reason is
that PHYLIB does not always hold phy_device->lock when it calls them. It
also documents that read() and write() deadlock inside read_mmd and
write_mmd, and updates ax88796b_rust to match.

> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index bb2cc6b3c94c8..d04a651ae62b2 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs

[ ... ]

> @@ -627,12 +627,18 @@ fn resume(_dev: &mut Device) -> Result {
>      }
>  
>      /// Overrides the default MMD read function for reading a MMD register.
> -    fn read_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16) -> Result<u16> {
> +    ///
> +    /// PHYLIB calls this with the MDIO bus lock held, so calling [`Device::read`] or
> +    /// [`Device::write`] here deadlocks.
> +    fn read_mmd(_dev: &Device, _devnum: u8, _regnum: u16) -> Result<u16> {
>          build_error!(VTABLE_DEFAULT_ERROR)
>      }
>  
>      /// Overrides the default MMD write function for writing a MMD register.
> -    fn write_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16, _val: u16) -> Result {
> +    ///
> +    /// PHYLIB calls this with the MDIO bus lock held, so calling [`Device::read`] or
> +    /// [`Device::write`] here deadlocks.
> +    fn write_mmd(_dev: &Device, _devnum: u8, _regnum: u16, _val: u16) -> Result {

[Severity: Low]
Should this list of deadlocking methods include Device::genphy_suspend()
as well?

The previous patch in the series ("rust: net: phy: take &self in methods
that do not need phy_device->lock") changed genphy_suspend() to take &self.
That means read_mmd and write_mmd can call it through the &Device they now
receive:

rust/kernel/net/phy.rs:Device::genphy_suspend() {
    pub fn genphy_suspend(&self) -> Result {
        let phydev = self.0.get();
        ...
        to_result(unsafe { bindings::genphy_suspend(phydev) })
    }
}

On the C side, that call takes the MDIO bus lock a second time:

phy_read_mmd()
  phy_lock_mdio_bus(phydev)
  __phy_read_mmd()
    phydev->drv->read_mmd()          <- Rust read_mmd callback
      Device::genphy_suspend()
        genphy_suspend()
          phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN)
            phy_modify()
              phy_lock_mdio_bus(phydev)   <- deadlock on bus->mdio_lock

phy_write_mmd()->__phy_write_mmd()->drv->write_mmd follows the same path.

As far as I can tell, read(), write() and genphy_suspend() are the only
&Device methods that access the hardware. All three take the MDIO bus
lock, and the abstraction has no unlocked accessor along the lines of
__phy_read() or __mdiobus_read().

If that is right, a read_mmd or write_mmd override cannot safely reach the
bus at all. Could the doc comment say this, or at least name
genphy_suspend() next to read() and write()?

No in-tree Rust driver implements read_mmd or write_mmd today. Before this
series, &mut Device methods such as read_paged() could already deadlock
here in the same way. The incomplete wording itself is new in this patch.

>          build_error!(VTABLE_DEFAULT_ERROR)
>      }
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-exp-phy-rs-maybelocked-v4-0-16f9a10bb579%40gmail.com
