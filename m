Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD5A3158C
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 20:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Qim/6iXV"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA7791
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 13:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZcgnsxOHBtmd99Bj32yePgZPobJGHTSfbV5d2xQssPQ=; b=Qim/6iXVJTGu1rWe3Ku+kt2Xf7
	fjE15qW1xKIgCBfcMCFgxU6+F/EldwJceIG4L6cHgZ1DeEnSO9oxSh0RBnXGSmoKJIfiQAapF4bOs
	rnb335DTwQxglZAh9FsLHqsKH9+9S9tyeUACTD0InuS37i6fKC+Us7jdgCSMQ1EWqPlU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qqJKu-001LX6-3q; Tue, 10 Oct 2023 22:28:12 +0200
Date: Tue, 10 Oct 2023 22:28:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <8ecbc427-fba1-4941-a8e5-c9516f33df0a@lunn.ch>
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com>
 <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> > +/// Wraps the kernel's `struct phy_device`.
> > +///
> > +/// # Invariants
> > +///
> > +/// `self.0` is always in a valid state.
> > +#[repr(transparent)]
> > +pub struct Device(Opaque<bindings::phy_device>);
> 
> Since this device is refcounted, ideally you would implement the
> `AlwaysRefCounted` trait for Device.(One that calls `mdio_device_get`
> and `mdio_device_put` to increment and decrement the refcount.)

Dumb question. Why? No other PHY driver does this?

phy_attach_direct() does a get_device(d), and only after that is the
probe function called. phy_detach() does a put on it.

Maybe the device should not be refcounted?

> > +        let phydev = self.0.get();
> > +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> > +        unsafe { (*phydev).link() == LINK_IS_UP }
> 
> Wouldn't it be more future-proof to do (*phydev).link() != 0? That's
> what the C side does.

Not really.

        if (!phydev->link)
                return 0;

And link is a bit field. 

	unsigned link:1;

So it can only be 0 or 1.

(*phydev).link() == LINK_IS_UP seems more readable than
(*phydev).link() != 0

I also don't see how it can be more future proof. The link to the peer
is either up or not. There are only two states, Schrodinger's cat is
not involved here.

> > +    }
> > +
> > +    /// Sets the speed of the PHY.
> > +    pub fn set_speed(&mut self, speed: u32) {
> > +        let phydev = self.0.get();
> > +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> > +        unsafe { (*phydev).speed = speed as i32 };
> > +    }
> 
> Should we perhaps saturate `speed` to `i32::MAX` so that it doesn't
> become negative?

How clever is the compiler here? The speed passed to this method is
pretty much always a constant value. In C you could probably do a

BUILD_BUG_ON(speed > INT_MAX && speed != SPEED_UNKNOWN);

and have the build fail if it was passed too big a value.

> The safety requirements for `from_raw` are (copied from above): For
> the duration of the lifetime 'a,
> the pointer must be valid for writing and nobody else may read or
> write to the `phy_device` object.
> 
> You don't explain how the second part is satisfied.
> 
> >From a previous thread, it looks like C is holding the phydev mutex
> while calling most of these functions. You should specify that as part
> of the justification for safety. And for the functions that C doesn't
> do that (IIRC, suspend and resume), you need to explain differently.

Do you ever consider skipping documenting the safety assumptions and
just proving the safety assumption?

It probably costs very little to actually test if the mutex is locked.
And if it is not locked, that is probably a bug we need to find and
fix.

> > +/// kernel::module_phy_driver! {
> > +///     drivers: [PhyAX88772A, PhyAX88772C, PhyAX88796B],
> > +///     device_table: [
> > +///         DeviceId::new_with_driver::<PhyAX88772A>(),
> > +///         DeviceId::new_with_driver::<PhyAX88772C>(),
> > +///         DeviceId::new_with_driver::<PhyAX88796B>()
> > +///     ],
> 
> I don't like the fact that we need to repeat names in `driver` and
> `device_table`. A single list should suffice, no?

All the C drivers do this. It was discussed before, there is not
always a simple 1:1 mapping from struct phy_driver to struct
mdio_device_id because of the way masks are used. Rust could be more
restrictive, and that might help avoid some bugs where developers
forget to put an entry in the struct mdio_device_id table.

	Andrew
