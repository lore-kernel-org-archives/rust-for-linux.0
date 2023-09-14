Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2BA241E4
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 12:39:51 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4AC1FC9
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 05:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2ghmP2VTnJV9kCl2Ymol6Z0R5kbzjwN5AAzruWfYWh0=; b=LOsYEoaexg9QFobUF9g9ENeMnC
	zwcM//e2QmT7l7Z2cs5dve+eY3zedjYP3yWaLoNef3Trx1D/WjmiS9IkBj4TrZGrJ5iUCqvS55T93
	MvPHYUc1dctmrAjUuqofIN0rldSJrgZygdXyXzeA09i473L2SVJa3hVlY/7JLc3f9wq0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qgldM-006P2D-L2; Thu, 14 Sep 2023 14:39:48 +0200
Date: Thu, 14 Sep 2023 14:39:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Trevor Gross <tmgross@umich.edu>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
Message-ID: <8a7e010e-b99a-4331-b7c4-e1c9b7782e94@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com>
 <CALNs47vAj=dLtAUiG0WGKJoZZuWRCXF8Wh8zPO+O1NUJ68Z0Sw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALNs47vAj=dLtAUiG0WGKJoZZuWRCXF8Wh8zPO+O1NUJ68Z0Sw@mail.gmail.com>

On Thu, Sep 14, 2023 at 01:47:48AM -0400, Trevor Gross wrote:
> > +/// Corresponds to the kernel's `enum phy_state`.
> > +#[derive(PartialEq)]
> > +pub enum DeviceState {
> > +    /// PHY device and driver are not ready for anything.
> > +    Down,
> > +    /// PHY is ready to send and receive packets.
> > +    Ready,
> > +    /// PHY is up, but no polling or interrupts are done.
> > +    Halted,
> > +    /// PHY is up, but is in an error state.
> > +    Error,
> > +    /// PHY and attached device are ready to do work.
> > +    Up,
> > +    /// PHY is currently running.
> > +    Running,
> > +    /// PHY is up, but not currently plugged in.
> > +    NoLink,
> > +    /// PHY is performing a cable test.
> > +    CableTest,
> > +    /// Unknown, not defined in the kernel.
> > +    Unknown,
> > +}
> 
> These can embed the C bindings, but it does look clunky
> 
>     pub enum DeviceState {
>         Down = bindings::phy_state::PHY_DOWN as isize
>         Ready = bindings::phy_state::PHY_READY as isize,
>     }

Just for my own ignorance of Rust. Does phy_state::PHY_DOWN refer to
the C enum value:

https://elixir.bootlin.com/linux/latest/source/include/linux/phy.h#L507

I can take Clunky when i know i have the compilers on my side ensuring
the two implementations are better in sync. Using this, it looks like
that:

1) The values are guaranteed to be the same, no matter if the enum is changed

2) If an enum value is removed, the Rust code will fail to build if it
   is also not changed.
  
What is not addressed here is if an additional value is added to the
enum.

What some sometimes have in C is an enum value _LAST, which is clearly
documented to always stay at the end, new values have to be inserted
before it. Would it be possible to do a build time comparison of
phy_state::_LAST and in this case Unknown, and fail the build if they
have different values?

	Andrew
