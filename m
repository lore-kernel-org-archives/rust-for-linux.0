Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862AC3C687
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 23:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="3fajhXq5"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A2FFA
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 16:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ri5NeeQA0bkUj5dqvbqIef0S/ZVDjE6gLjpOhWge6UA=; b=3fajhXq5yOXFlV5XDFyauB7neU
	CjPPZ22VcliKSmUXII4TL8vy4KPhHxFJZdGjTjsi1FmsbfhPrhC5R4oi7bTJW3gEAITq8BL3Y+l3p
	KeLR4otZt+aYJ1qmkJ3lZvCZjlwkyUz2Tj7aT/GO1X5pgSgiYVEpO0CddIDeABf/nfgQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qqMFH-001OGc-Uw; Wed, 11 Oct 2023 01:34:35 +0200
Date: Wed, 11 Oct 2023 01:34:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <6983f638-3ff9-4ce1-b948-62287bb4c298@lunn.ch>
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com>
 <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
 <8ecbc427-fba1-4941-a8e5-c9516f33df0a@lunn.ch>
 <CANeycqrwDjcZN2oYzH=HV12cfgeRD7TCpQWvFnyNGR1uXwre1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANeycqrwDjcZN2oYzH=HV12cfgeRD7TCpQWvFnyNGR1uXwre1w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 10, 2023 at 06:00:15PM -0300, Wedson Almeida Filho wrote:
> On Tue, 10 Oct 2023 at 17:28, Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > > +/// Wraps the kernel's `struct phy_device`.
> > > > +///
> > > > +/// # Invariants
> > > > +///
> > > > +/// `self.0` is always in a valid state.
> > > > +#[repr(transparent)]
> > > > +pub struct Device(Opaque<bindings::phy_device>);
> > >
> > > Since this device is refcounted, ideally you would implement the
> > > `AlwaysRefCounted` trait for Device.(One that calls `mdio_device_get`
> > > and `mdio_device_put` to increment and decrement the refcount.)
> >
> > Dumb question. Why? No other PHY driver does this?
> 
> If you implement that trait, you get to use `ARef<Device>` as a
> refcounted `Device`, which is guaranteed to not produce dangling
> pointers in unsafe-free code. This is what all Rust-representations of
> C ref-counted objects are supposed to use.
> 
> But if no driver needs to increment or decrement the refcount, we can
> probably skip this until such a need arises (if ever).
> 
> > phy_attach_direct() does a get_device(d), and only after that is the
> > probe function called. phy_detach() does a put on it.
> >
> > Maybe the device should not be refcounted?
> 
> I guess it needs to be refcounted because it is a kobject that exists
> in sysfs, so likely unavoidable.

Is Rust putting a kobject in sysfs? I don't think so. So it is not
really Rust problem. The core should be doing all the device
references. And we don't want a driver papering over bugs in the core,
we want to fix the core.

> > > > +        let phydev = self.0.get();
> > > > +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> > > > +        unsafe { (*phydev).link() == LINK_IS_UP }
> > >
> > > Wouldn't it be more future-proof to do (*phydev).link() != 0? That's
> > > what the C side does.
> >
> > Not really.
> >
> >         if (!phydev->link)
> >                 return 0;
> >
> > And link is a bit field.
> >
> >         unsigned link:1;
> >
> > So it can only be 0 or 1.
> 
> It happens to be a bit field with a single bit now. If it gets
> converted to say a bool, or to 2 bits, the existing C code continues
> to work, but Rust as written by Tomo wouldn't. That's what I mean by
> future-proof.
> 
> The C code absolutely does a != 0 check: https://godbolt.org/z/3rjjcjEK4

It would be better to say the generated assembler does a != 0.
On one particular instruction set. AVR seems to be a compare with
1. But that does seem to be the exception....

> 
> > (*phydev).link() == LINK_IS_UP seems more readable than
> > (*phydev).link() != 0
> 
> Sure, how about you define and use LINK_IS_UP on the C side? Then
> we'll use your C definition and mimic the behaviour on the Rust side.

Patches welcome.

> > I also don't see how it can be more future proof. The link to the peer
> > is either up or not. There are only two states, Schrodinger's cat is
> > not involved here.
> 
> Yes, there are only two states, but if you ever switch to say an 8-bit
> boolean to represent the states, then you have 255 values but only two
> states and we'll have to do the proper mapping.

Can you do a build time assert that link is a 1 bit bitfield? Fail to
compile if it ever changes. 

> > > > +    /// Sets the speed of the PHY.
> > > > +    pub fn set_speed(&mut self, speed: u32) {
> > > > +        let phydev = self.0.get();
> > > > +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> > > > +        unsafe { (*phydev).speed = speed as i32 };
> > > > +    }
> > >
> > > Should we perhaps saturate `speed` to `i32::MAX` so that it doesn't
> > > become negative?
> >
> > How clever is the compiler here? The speed passed to this method is
> > pretty much always a constant value. In C you could probably do a
> >
> > BUILD_BUG_ON(speed > INT_MAX && speed != SPEED_UNKNOWN);
> >
> > and have the build fail if it was passed too big a value.
> 
> Yes, we should be able to use build_assert for that. I like the idea.

Yes, it clearly is a bug. Speed here is in Mbps. So that would be
2147483647Mbps. Current copper PHYs stop at around 40,000Mbps, and
physics is going to get in the way going to much faster, you need to
use fibre, and that is not phylibs job.


> > > The safety requirements for `from_raw` are (copied from above): For
> > > the duration of the lifetime 'a,
> > > the pointer must be valid for writing and nobody else may read or
> > > write to the `phy_device` object.
> > >
> > > You don't explain how the second part is satisfied.
> > >
> > > >From a previous thread, it looks like C is holding the phydev mutex
> > > while calling most of these functions. You should specify that as part
> > > of the justification for safety. And for the functions that C doesn't
> > > do that (IIRC, suspend and resume), you need to explain differently.
> >
> > Do you ever consider skipping documenting the safety assumptions and
> > just proving the safety assumption?
> 
> Yes, I'd very much like to see that, but we don't have good-enough
> tooling at the moment to that at compile-time only.

I don't see how tooling can determine that at compile time. Its in C
code for a start. Maybe some sort of cross C and Rust LTO if it had
access to the intermediary representation?

       Andrew
