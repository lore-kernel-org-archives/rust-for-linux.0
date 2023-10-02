Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5A3883E
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Oct 2023 14:08:21 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0979B
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Oct 2023 07:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=rJ9sH4lDa+n6bmM84sIRAou5VpzELlZKX3ZkCj915sU=; b=WI
	aHkk+CjIc8l/JFglNYy31wRhkp68XxK8UppYFLdfxm5MjCOpfYM6hN+lbr9nynK2t1fvD5qzo7/bo
	vcMwGkeihLhW7ZGtFVGULl5SNKhQ9IBpwgZswCTO5D+g5Z/HTfGObG7UYYQ50ZKxUhKr+UDqcIfn+
	tZlR31TQLfkFGDM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qnJal-0081cX-9U; Mon, 02 Oct 2023 16:08:11 +0200
Date: Mon, 2 Oct 2023 16:08:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Trevor Gross <tmgross@umich.edu>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, gregkh@linuxfoundation.org,
	rust-for-linux@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
	benno.lossin@proton.me, wedsonaf@gmail.com
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <00d380b7-f0fc-4784-9f30-c98e630efacb@lunn.ch>
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com>
 <2023092900-manpower-runaround-859a@gregkh>
 <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
 <CALNs47td-3UM-E59R35GAjaHMPT8c-H7Qy=PZ+-wgsXpw5EJAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALNs47td-3UM-E59R35GAjaHMPT8c-H7Qy=PZ+-wgsXpw5EJAA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 29, 2023 at 05:11:21AM -0400, Trevor Gross wrote:
> On Fri, Sep 29, 2023 at 4:39 AM FUJITA Tomonori
> <fujita.tomonori@gmail.com> wrote:
> > [...]
> > >> +    /// Gets the state of the PHY.
> > >> +    pub fn state(&mut self) -> DeviceState {
> > >> +        let phydev = self.0.get();
> > >> +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> > >> +        let state = unsafe { (*phydev).state };
> > >> +        match state {
> > >> +            bindings::phy_state::PHY_DOWN => DeviceState::Down,
> > >> +            bindings::phy_state::PHY_READY => DeviceState::Ready,
> > >> +            bindings::phy_state::PHY_HALTED => DeviceState::Halted,
> > >> +            bindings::phy_state::PHY_ERROR => DeviceState::Error,
> > >> +            bindings::phy_state::PHY_UP => DeviceState::Up,
> > >> +            bindings::phy_state::PHY_RUNNING => DeviceState::Running,
> > >> +            bindings::phy_state::PHY_NOLINK => DeviceState::NoLink,
> > >> +            bindings::phy_state::PHY_CABLETEST => DeviceState::CableTest,
> > >
> > > Again, this feels like a maintance nightmare.
> >
> > As I wrote above, it's guaranteed that C and Rust code never
> > diverge. However, as you said, suley it's troublesome to maintain this.
> >
> > We could directly use enum generated from C's enum at compile
> > time. Then we can remove this conversion. The names are not pretty
> > from Rust's view though.
> >
> > Any concerns from Rust side?
> > [...]
> >
> >  /// Corresponds to the kernel's `enum phy_state`.
> > -#[derive(PartialEq)]
> > -pub enum DeviceState {
> > -    /// PHY device and driver are not ready for anything.
> > -    Down,
> > -    /// PHY is ready to send and receive packets.
> > -    Ready,
> > -    /// PHY is up, but no polling or interrupts are done.
> > -    Halted,
> > -    /// PHY is up, but is in an error state.
> > -    Error,
> > -    /// PHY and attached device are ready to do work.
> > -    Up,
> > -    /// PHY is currently running.
> > -    Running,
> > -    /// PHY is up, but not currently plugged in.
> > -    NoLink,
> > -    /// PHY is performing a cable test.
> > -    CableTest,
> > -}
> > +///
> > +///  PHY device and driver are not ready for anything.
> > +///  PHY_DOWN
> > +///  PHY is ready to send and receive packets.
> > +///  PHY_READY
> > +///  PHY is up, but no polling or interrupts are done.
> > +///  PHY_HALTED
> > +///  PHY is up, but is in an error state.
> > +///  PHY_ERROR
> > +///  PHY and attached device are ready to do work.
> > +///  PHY_UP
> > +///  PHY is currently running.
> > +///  PHY_RUNNING
> > +///  PHY is up, but not currently plugged in.
> > +///  PHY_NOLINK
> > +///  PHY is performing a cable test.
> > +///  PHY_CABLETEST
> > +pub use bindings::phy_state as DeviceState;
> 
> I think there are three reasons we may prefer to recreate an enum from
> C in Rust:
> 
> 1. Size, C enums are typically an int but rust enums are u8 until they
>    need to be bigger
> 2. Name consistency, rust is almost always CamelCase for enum variant
>    names but the ones from bindings don't
> 3. Docs, if the enum is user-facing then there are benefits to documenting
>    the variants rather than the entire enum (cleaner doc output, ide hints)

Does Rust integrate with kerneldoc? The C enum has a header:

/**
 * enum phy_state - PHY state machine states:
 *
 * @PHY_DOWN: PHY device and driver are not ready for anything.  probe
 * should be called if and only if the PHY is in this state,
 * given that the PHY device exists.
 * - PHY driver probe function will set the state to @PHY_READY
 *
 * @PHY_READY: PHY is ready to send and receive packets, but the
 * controller is not.  By default, PHYs which do not implement
 * probe will be set to this state by phy_probe().
 * - start will set the state to UP
 *
 * @PHY_UP: The PHY and attached device are ready to do work.
 * Interrupts should be started here.
 * - timer moves to @PHY_NOLINK or @PHY_RUNNING
 *
 * @PHY_NOLINK: PHY is up, but not currently plugged in.
 * - irq or timer will set @PHY_RUNNING if link comes back
 * - phy_stop moves to @PHY_HALTED
 *
 * @PHY_RUNNING: PHY is currently up, running, and possibly sending
 * and/or receiving packets
 * - irq or timer will set @PHY_NOLINK if link goes down
 * - phy_stop moves to @PHY_HALTED
 *
 * @PHY_CABLETEST: PHY is performing a cable test. Packet reception/sending
 * is not expected to work, carrier will be indicated as down. PHY will be
 * poll once per second, or on interrupt for it current state.
 * Once complete, move to UP to restart the PHY.
 * - phy_stop aborts the running test and moves to @PHY_HALTED
 *
 * @PHY_HALTED: PHY is up, but no polling or interrupts are done.
 * - phy_start moves to @PHY_UP
 *
 * @PHY_ERROR: PHY is up, but is in an error state.
 * - phy_stop moves to @PHY_HALTED
 */

and this then appears in the kernel documentation:

https://docs.kernel.org/next/networking/kapi.html?c.phy_state#c.phy_state

Can we expect to see a section maybe referenced in
https://docs.kernel.org/next/networking/phy.html generate from the
Rust code?

	Andrew
