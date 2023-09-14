Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECA8208BD
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 12:24:33 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F6011FC7
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 05:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=keFRTP/0HnvetSV9OkXnT13i+B5jKDineWVxU5GOs5s=; b=nq
	8myV/zLEEbCfVBfZX8oClKxPhffqf/PvxPfPcS2i6yQzLkXGs6wcokjMW4VIp4szL3VvzBVh98xgD
	yTan6A7pN6gFUwOfrtt8+JefPCsYegOymWyoucJwjYEPl+6um4L1fg/ISXA/O5HS/VhXsoAFHFvoU
	tANiIpIKhv0l2Ms=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qglOX-006OxB-1v; Thu, 14 Sep 2023 14:24:29 +0200
Date: Thu, 14 Sep 2023 14:24:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org, Gary Guo <gary@garyguo.net>
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
Message-ID: <49934282-8fa7-4c2e-9ba0-6ab947f747b1@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com>
 <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
 <CANiq72nPjG2insBR3STcFhKcPo2ORforrinSAYHf18aJz7saCA@mail.gmail.com>
 <054de168-d56e-4e95-a628-7f41b621ba86@lunn.ch>
 <CANiq72=n1_JwmGKUw4968sMQRyY25=XMzTWufhKGeebfuSoUDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=n1_JwmGKUw4968sMQRyY25=XMzTWufhKGeebfuSoUDw@mail.gmail.com>

On Thu, Sep 14, 2023 at 01:03:06PM +0200, Miguel Ojeda wrote:
> On Thu, Sep 14, 2023 at 2:30 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > If this happens, it is because the C and Rust code has diverged. We
> > want it to be loud and obvious when this happens, so a WARN_ON() and a
> > stack trace is what i would recommend. Or better still, some way to
> > trigger a BUILD_BUG_ON() at build time.
> 
> If it cannot ever happen, then definitely we should do that (and keep
> the function `-> DeviceState`), of course. Otherwise, a Rust panic
> could also be justifiable in that case (if we are really sure it
> cannot happen), or even assuming it and using `unsafe` (if needed for
> performance/size).

These are states of a state machine. If it is not one of the defined
states, the state machine has gone off the rails.

It is actually unlikely to happen, so if it does, my first guess for
debugging it would be that the C and Rust implementation have
diverged. A state has been added or removed in one implementation, but
not the other.

This is why i asked if it is possible to directly use the enum in the
Rust code. If a state is removed from the enum and the C code, but not
this method, we will fail at build time, which is a lot more obvious
than at run time. This seems like a useful tool for anybody trying to
maintain a parallel C and Rust implementation of something.

Also, nothing much in the PHY subsystem is performance critical. We
spend a lot of time twiddling our thumbs waiting for the slow MDIO bus
to perform transactions with the PHY. So i would always lean towards
correctness and self problem detection over performance.

> What I meant to say is that, in general, it is a good idea to make
> invalid states unrepresentable, i.e. to have a `DeviceState` without
> `Unknown` (and to achieve that, the function can reach for one of the
> alternatives above). That way, when we pass around a `DeviceState`, we
> are guaranteed it has one of the expected values.
> 
> (i.e. if I understood you correctly, you wanted to have `WARN_ONCE()`
> without changing the return type, which would mean keeping the
> `Unknown` case)

The state is probably valid, just the Rust implementation has no idea
of it, because the Rust code is out of date. So returning it seems
like the correct thing to do. A Rust user of it is probably going to
do the wrong thing, so a WARN_ONCE() seems justified, but if it is
passed to C code, it will probably be O.K, since it is valid in the C
world.

	Andrew
