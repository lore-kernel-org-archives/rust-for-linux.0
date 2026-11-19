Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082350;
	b=vVvW4t4id+4JLs5AbX15iEFVJhfMi6o3ifZM1+vJYyO/g3763wm51wZH1gK4y/cpNzEK
	 NsJEhapMTPYFY0Fq4YlbKCR/baM6zkka9pYenz73GOlrP852lAmF2JZdGdJgoR62NRCJt
	 cEcnzc5yRPbB4Gi6wdYNMVepF8weKkNOxuR6Z/KuYfgoIJSUvOfgITl+4ZF3SQ3z6Qdau
	 t55hWnYsAKLHZaSXr1sgIbBuju52fI6l091CsTq309QjBjd8F4m9dtmTysrh1qhaNJfq7
	 QjcaeSb8WY8ryDdhM2aFqC2+tIobymR35YOz7rFdvAlisz/amKnFnGib5uP2SgTnrbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082350;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=Q3GQZrybC5QxaJKCFYXWQxqvNW0jtycxDKmrfuuMapE=;
	b=FbAz1mYxkW2NZQjka30jmjjBRL141tTxZRCBsqErh0egyAO/B9wOiNSupun+43F68f6i
	 iVnli9xvHjkIXJPkeRD6ap0jBSgjNtESuAEwb4Y4iI1PBD4r55yoighEauuDCpE7QO+8M
	 9Sv3ps4RRBJ6Gps76zEGcErB5707jCcBGaYojsN1+fMlgPCsP0R6zoPmmJugHC/kyaOqT
	 h8saKCNXOO4ScI4+LJdkp10XcJ/TU6dWS7avybQQt1MMFKxRfo0M/Zzc6s1wFkQxSC31j
	 d752NAUphe8x3GofHnnU72g8AhPRvMOBU6PwEByXl5v0CevhKI2gSGoBQN/ZlhyH22Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=e4wNncEa;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37343606A331;
	Thu, 19 Nov 2026 09:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37343606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=e4wNncEa
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jVYpF6J2vzKnr1;
	Thu, 19 Nov 2026 10:59:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795082341; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3GQZrybC5QxaJKCFYXWQxqvNW0jtycxDKmrfuuMapE=;
	b=e4wNncEaiArLAyqQUA+yobmyL1ur4Y2Wpm1fA1jFpvgIgIorXA9ZgMK8KQ6tOAPXvX35CT
	2TsAbAZoha4kj4Pc+kxwRQ2bDVviWVOBu0YXWciu+gIaaqoXQggXkAxbtzIM50Ean4bqIv
	Z9ui6UtS8ykCwzvQDXLFut2Uven/pdUxNOtHXQiENDCG2CT63PDcALppOTpsLj/sw65bGL
	t2GjgbjxRDwCQ5QkJ1nB4Hs3tIaVxckrXzBgzbyifVBbKyH7AFph2rhxGSQO/BFeY21cjG
	JiRqWz6Vkr2uz+D+uo4Axi9GycZkYRoV7U8gKJHcu/N00YrSFIaQ//G+Oh/1lw==
Message-ID: <202dd0c3d515ddfa77a8ec8751badadd31b8a7b0.camel@mailbox.org>
Subject: Re: [PATCH] rust: DamFence: Remove warning about unsignaled drop
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, Alice Ryhl	
 <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng	
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Daniel Almeida	 <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>,  Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?ISO-8859-1?Q?=D6zkan?= <work@onurozkan.dev>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 10:58:57 +0100
In-Reply-To: <a7f9e0f3-b299-4d40-9230-106003725dc2@amd.com>
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
X-MBO-RS-ID: 8917f7885d5135c09a4
X-MBO-RS-META: 5bgyrspatab3ugyn7198xxbjjtnsxz6p

On Thu, 2026-11-19 at 10:32 +0100, Christian K=C3=B6nig wrote:
> On 11/17/26 17:36, Danilo Krummrich wrote:
> > Drivers often reference count representations of hardware resources and=
 hardware
> > states and hence keep them alive beyond what their actual lifetime shou=
ld be --
> > even beyond driver unbind.
>=20
> Yeah, I agree 100% with that. I know why drivers do this and there are un=
fortunately really good reason for that.

To me it seems more that we are often working around fundamental design
errors. What good reasons come to mind?

>=20
> > This causes lot's of issues and I'm looking into fixing this up, see my=
 talk in
> > [1] and an example from Xe [2] for reference.
> >=20
> > That said, in Rust we don't have this kind of ambiguity, lifetime and o=
wnership
> > of resources are well defined and the core infrastructure guides driver=
s
> > accordingly.
>=20
> I disagree, you do have that in Rust as well.
>=20
> Background is that the fundamental problem of having two signaling
> directions which want to define lifetime differently doesn't go away
> because you switch the programming language.

For Rust DmaFence, this is addressed by having two distinct objects
sharing the same refcounted memory, DriverFence and Fence.

Dropping / signaling DriverFence is the decoupling point.

Which is by the way why I am trying to convince you so hard to give me
the spinlock, to make this simpler and fully sync ;)

> But even in Rust there is still the need to give HW drivers something
> like a template in which is defined how things should be done and
> what things need to be avoided.

see below

>=20
> > Consequently, it is perfectly reasonable to assume that a driver object=
 that
> > owns device resources (such as DMA memory) will, in its destructor, tea=
r down
> > the hardware to not access any of the resources it owns anymore.
>=20
> Exactly that is a pattern I have seen many many times before and I
> can say from experience that it is very prone to human errors as
> well.

Danilo's argument is that the object that halts the hardware is the
same that owns the fences.

You drop the hardware-ring-object, this halts the ring, waits for it
synchronously, then the fences drop and signal. Of course, you can
additionally signal them manually before their drop with another error
code than the default.

> > Insisting on an explicit method call is not improving anything in this =
model.
>=20
> I'm not insisting on an explicit method call.
>=20
> What I'm insisting on is that the response from the HW that the DMA
> operation has stopped is signaling the fence.

That is effectively the case, see above.

> And not that driver tell the HW stop DMA and then continue and dma
> fence is automatically signaled without explicitly saying that is the
> signal that DMA operations are stopped.

Again, the main point here is that the object layout ensures *exactly*
what you want, Christian

Like this, pseudocode

// Drops first, stops hardware
struct exec_context {
	// drops second
	jq: JobQueue, // signals remaining fences when it drops
}

It's maybe more implicit, but ensures exactly what needs to be ensured.

That's how teardown is done in Rust. You drop the lock, it unlocks
itself. You drop the memory, it frees itself. You drop the fence, it
signals itself.

That's by design because the object lifetime model falls naturally into
place.

> I think the most defensive way would be as last resort scream loud in
> the logs that the driver is somehow buggy and hasn't signaled it's
> fence, wait for a certain amount of time (100ms?) as safeguard and
> then signal the fence with an error.

Now that doesn't make any sense at all, either the hardware is stopped
or it isn't. Having some random delay is probably even worse because
the problem is then more difficult to even encounter and thus fix.

> Exactly that is what I disagree on.
>=20
> Stopping the HW is what makes fences signal and that is what this
> tear down process should block for.

Our point is that dropping stuff stops the hardware, and *then* signals
the fences. Exactly what you want! :)

> Well the question is can we enforce this?
>=20
> I mean there are usually only limited options from the compiler side
> to enforce things, but we should still push developers to use well
> proven patterns and coding practices.

You currently cannot prevent people from refcounting stuff if they
really want to. The Rust language is working on enforcing that, too,
though

https://goals.rust-lang.org/2026/move-trait.html


btw the best feature that Rust offers IMO is that the refcounting is at
least always right. That's quite cool. A great many hacks I've seen
stem from the fact that programmers are not disciplined when it comes
to copying pointers and their refcount.


P.
