Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33CC19D
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 00:30:45 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F3B1727
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 17:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1RwtAWN/x38DsBWkZwhjepVT3WA5cg3Wwvwf2jir9hA=; b=m79dFNefBqEvZP15UOwjpQ7Wdn
	Orzmp5lNUr4vEt35718hcgEeKynBtltWDLsR6otlKCpH1DM7V6N9kVBw29eot/J08MW6Tnhu/FYdV
	I5QuANXvpBbRDXX6nne75mN8jsFrB/NF9xOfl/7MrNAFKuCg8luonbWRFNJhckrQtcRw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qgaFm-006Lqc-C7; Thu, 14 Sep 2023 02:30:42 +0200
Date: Thu, 14 Sep 2023 02:30:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
Message-ID: <054de168-d56e-4e95-a628-7f41b621ba86@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com>
 <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
 <CANiq72nPjG2insBR3STcFhKcPo2ORforrinSAYHf18aJz7saCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nPjG2insBR3STcFhKcPo2ORforrinSAYHf18aJz7saCA@mail.gmail.com>

> > > +            _ => DeviceState::Unknown,
> >
> > This should not happen, and if it does something bad is going
> > on. WARN_ONCE() so we know about it.
> 
> An alternative could be to return an error instead. That way having a
> `DeviceState` already guarantees one has a valid state.

If this happens, it is because the C and Rust code has diverged. We
want it to be loud and obvious when this happens, so a WARN_ON() and a
stack trace is what i would recommend. Or better still, some way to
trigger a BUILD_BUG_ON() at build time.

Hum, does the kernel Opps code understand Rust symbols, and can unwind
a call stack which is a mix of C and Rust functions?

> > Does Rust have the concept of a bit? Anything like the BIT() macro?
> > We have seen bugs where developers have not realized these are bits,
> > and so have defined 1, 2, 3, not 1, 2, 4. We can avoid that sort of
> > error by using BIT(0), BIT(1), and then the next one is obviously
> > BIT(2), not 3.
> 
> We have some bit utils around, but not upstreamed yet, yeah, e.g.
> things like https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/types.rs#L312

let y: u64 = bit(34).into();

Seems a bit verbose, compared to the CPP macro BIT(). But lets see it
in action.

	Andrew
