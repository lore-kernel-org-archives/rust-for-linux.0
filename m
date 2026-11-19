Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100155;
	b=C0fqI55iRIY5FzPnIkk5ZTcIR1qJU7/uEkZzHzwi29DXC0SmRTifPtu9ck6E6R7FJ2U3
	 OG323T6b1AH1LAazLvUiwspkiloRfsHD7zU6G6ilztHCghIeyRL7Nz/d1NqwtPEM7/Vuv
	 gYQlrzsIXL8fcQNvlfznQ0Kcur75r8iWefNUplXfrBSTrI4namoGuOhKyfg1IM7XFPQwJ
	 +BF7REtgFgdkMzr27xyb4lVnR4J+0gU85SWrOQvvrpbRP7d2ECzlIIbZ9v2rDyxLjtSRq
	 NHLKD4+yOMwMS9giiEqP6hrsx5SLPEw/bs5YO2YlBqez/oLPbFAjP+4stg23AXFyYIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100155;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-META:
	 X-MBO-RS-ID;
	bh=ikfEBgKAQ/w72CS+c61ChZxhzTrU5wLEwfcM5Che0D8=;
	b=RRi6ZsJyei90MrJ/vL9l5zj7FqfNQXeGaLujfgjbxY8cGucwL6qpRRouJlVjJzqWkZP4
	 LLxyd+dS7mmoT6E2FDakmXNB7SL7OceO8IB1aKsqTXzcjJpkwbpHKg4fk/pwaMUtpbbY4
	 hl564+fwO1Zuwj4UdtakpO0kWFTJBK0CH1xSQC5FNq6VV82v/QM85P7c8womdG+citXEu
	 xJ54reN871gENt4s8gO4vOMn7B7twdYdSuoDI8BffXDXJNtr5Eh6o2L3eIHthSICKQNij
	 fLF4UecescEom8b+7+dB8/blSQJXYPWYHKA1fiMkT2MrcIhseOU3XW5niFTgVRTIc2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=DBlKI+Fz;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F015606A326;
	Thu, 19 Nov 2026 14:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F015606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=DBlKI+Fz
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jVhNd2THPzMlyX;
	Thu, 19 Nov 2026 15:55:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795100145; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ikfEBgKAQ/w72CS+c61ChZxhzTrU5wLEwfcM5Che0D8=;
	b=DBlKI+Fz+EjeHwYBG7o/+qlCzGZ9/6qJhHumvHeEfu/wpegFlr96QVPRCQoUbzbO9OCZ72
	1gkyl9pKkyIXvIr8wcTI7GNEzOKZCIQ6nP8e2aZqqReWcu44RikCS344e25+UJ4ts+H1mx
	9hJrqIwPTj2Lqnw+jGDKB2xpv5NiMrKFQLjghJUVAp1N7fRMUGl00Ww3ffAsJGe251fRTd
	jVXEA7nXlQHwigzaCAiOCvwk1Ln4hkopjgHrPwL51It3TK8iGQKjOv4bi7KfcaM40pxWcg
	anCjgSENQ5CGw+VMyfJkx47TM0pErQzTyWDVa7zl9Rhfx72VpOi4ar2NNqcbbQ==
Message-ID: <972ba9ddea36c9dc84ce649e2edcf6bde71420d1.camel@mailbox.org>
Subject: Re: [PATCH] rust: DamFence: Remove warning about unsignaled drop
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
	phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Alice Ryhl
 <aliceryhl@google.com>,  Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron	 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Daniel Almeida	 <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>,  Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?ISO-8859-1?Q?=D6zkan?= <work@onurozkan.dev>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 15:55:42 +0100
In-Reply-To: <141892f8-180c-4157-8c59-6e69057334f2@amd.com>
References: <20261112101015.528127-2-phasta@kernel.org>
	 <5d466f7c-2e70-4011-be04-9ffdf877b915@amd.com>
	 <49298d3a328c1695ea27993f714c20b8a1c05f32.camel@mailbox.org>
	 <e2ec8a39-56c3-4274-91ce-60c273904877@amd.com>
	 <ab99758408df682c68a3792cc3014b77d6e1c8ab.camel@mailbox.org>
	 <c2dd46ea-94d8-4720-af37-897c91809338@amd.com>
	 <DMXJ8TBSZJJ4.3HG0OJDI9URTT@kernel.org>
	 <8da4a8c0-1740-450c-9cf1-1a7b21d12997@amd.com>
	 <DMXMSIQONGUW.1RRNS7I6LACD6@kernel.org>
	 <a7f9e0f3-b299-4d40-9230-106003725dc2@amd.com>
	 <202dd0c3d515ddfa77a8ec8751badadd31b8a7b0.camel@mailbox.org>
	 <141892f8-180c-4157-8c59-6e69057334f2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: 1az8ce8au3wj3syybakktcd5manwyxhs
X-MBO-RS-ID: 7de1ef4fecc2618c8c8

On Thu, 2026-11-19 at 11:47 +0100, Christian K=C3=B6nig wrote:
> On 11/19/26 10:58, Philipp Stanner wrote:

> BTW that is the reason why dma_fences are RCU protected as well. That
> is not because of performance but rather to be able to do a try get
> on a reference to solve reference direction problems.

You mean dma_fence_get_rcu()?

That's simply a workaround for broken refcounting. Either you have a
reference, then you can increment it. Or you don't, because you stole
someone else's reference, and now you need a magic RCU delay so that
the rightful owner of the reference cannot free the memory that you
illegally occupy.


> No it doesn't.
>=20
> What I want to ensure is that drivers don't come up with funky methods to=
 signal fences.

They won't because the only signal mechanisms is our API.

All the driver needs to do right is to associate the fence container
with the object associated with the hardware.

>=20
> The cleanup part you want to have here is clearly good to get that
> defined as well, but to be honest that is peanuts compared to what
> you get when you have the dma_fence signaling wrong.
>=20
> >=20
> > That's how teardown is done in Rust. You drop the lock, it unlocks
> > itself. You drop the memory, it frees itself. You drop the fence, it
> > signals itself.
> >=20
> > That's by design because the object lifetime model falls naturally into
> > place.
> >=20
> > > I think the most defensive way would be as last resort scream loud in
> > > the logs that the driver is somehow buggy and hasn't signaled it's
> > > fence, wait for a certain amount of time (100ms?) as safeguard and
> > > then signal the fence with an error.
> >=20
> > Now that doesn't make any sense at all, either the hardware is stopped
> > or it isn't.
>=20
> There is a huge window of state in between.
>=20
> > Having some random delay is probably even worse because
> > the problem is then more difficult to even encounter and thus fix.
>=20
> Well the whole point of the delay is to at least have some kind of
> save guard that makes follow up problems less likely to encounter in
> production.
>=20
> That the underlying problem is fixed should be triggered by the big
> warning in the system log and not because I notice that my valuable
> data is corrupted because a DMA fence signaled to early and caused
> random corruption.

Again, if the driver, the only one who understands the hardware, really
wants to screw up then your system is done anyway.

Remember my previous example:

// forgets to stop hardware
dma_fence_signal(f);
// still forgets to stop hardware

Your WARN_ON will not trigger. Your sleep/delay would not trigger.

> > > Exactly that is what I disagree on.
> > >=20
> > > Stopping the HW is what makes fences signal and that is what this
> > > tear down process should block for.
> >=20
> > Our point is that dropping stuff stops the hardware, and *then* signals
> > the fences. Exactly what you want! :)
>=20
> No, that is completely backwards.
>=20
> A dma_fence should *NEVER* signal because you waited for something. Inste=
ad the dma_fence is what is waited on.

By whom? And who signals it? It's the party stopping the hardware, no?
So just like with our design.



P.
