Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD291EFF9B
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916788; cv=none; b=cIziWO4v5C7i8nfr6iL7I97dIHJO2QPWmX3o2a2LHkKbrO1U4/z0ZL36uUxnszCl3aet/08s6INBaZMyafxcq+orb2yY1/OhPATyteDmrDeBGCERRXJj+IR3UhxyGsVZ+SUTcPOQ1YFITq3eKBh0tGGmtfKsoNNxZLAQmy0/Qj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916788; c=relaxed/simple;
	bh=y2corVxRFZhp6KNK2+4uobUAAg4FYICr7oMYMY/v8wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJWijX0JFsQoW2gD32fGgZFtujpfZa6F99NhVw+InOJCw9Rq/4cibOl3AA0I26l/S2cnL08Q0E1q7URhRY3fZ7QZi9khmqdwEbMOXR/q9AmiUL+YI/FVdiqbSLKQrxFMRefAOGptkTEugEzuSkG1ruRJ7WcmodVzAOtHDObvw+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYdJ0W+2; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYdJ0W+2"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-888310b91c5so54898186d6.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 05:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768916786; x=1769521586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spiJEUz7YrJ9p2nUXIqRGXS2HMPY7smmsApThddibpI=;
        b=GYdJ0W+2b9lqFggO/Ra6CK7l6PlYf4iygEKex7UtkTgF0K7hk0pjJ26YphAL6VSn1j
         xjQh9fg+YQIklbsnWtPbZKUD69LZu4NUO31lsTp2O3tUOui277R9BCzAfY+mWuIHsYbb
         1UlwFXc/0ZcSzbW/iTM7JJPrsmClLHusIWwuHgn9lDpIRIbQvp1Z8n5E2jHQ3GFuG+rD
         ilwItLXDZX+qs6u/69chQvk9Z8gCpNH03s4IYLPhouHC7seXnyp93f/6HSIMAjmjL8+J
         vReLLO/2/NIzPEcCpE9R7YpYMFDUhnXV8Is0UOejZnvacnGwr0iZUj7JN0NBijZu8sL9
         +0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916786; x=1769521586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=spiJEUz7YrJ9p2nUXIqRGXS2HMPY7smmsApThddibpI=;
        b=IJVDSbf3Rih2QIKbQ7Pty2VcsgwifH3jW5vh9fN8U2OH+cVJKxaaljDEpbe1gKiKbz
         vVvsbfFh4cQQju7bYGFGVsUwDaE5lG4BzcHRqb1DM/53Y7qEV8GaXWZnFXPmpD6cD4a2
         NRAi+aRJYMG+8EGHcjbyMWcq1FAMZagwHECIsoTEn7VglzVvK9UuxjbbfVUrtf748dwp
         M4ncwAGhPeNXpjrB4afMUVOrzHWsAk6sc68oIygcaFuqPKfJA7mNaOld1D0M70S0K1Ss
         5qrE4+YogdKdICs9HHsKhmK5bPsGwJE5phExrGJ01j1qW9YKwGIm+VJGfa/JVsiZJ8Bs
         L3MA==
X-Forwarded-Encrypted: i=1; AJvYcCUNsmGdjtv+iyThCGp3x2zFep+Zu/ytlhpDx3g6BPwKfp0KV8yvQ2RfRQTNvUF75gsZkjyk4EXf+cCReiDPnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6mTzivJtgMnT6ixdHDga5tiFcSTTSn1pqP1Z2d4nCeRRsCQn7
	r/zw+L5kSBbGgYj8ZLHA0lO2vHtsNq91eoTp4xuKPvPb/qfyBkklDLWW
X-Gm-Gg: AZuq6aJEnozOQDzAXk143ULUH9FSpO1LMoZew7SfI3vFlKLN4gB81Mk0cJubDDr9/He
	AXBQQOsN42fxS1fLo8HkuFSZMuNd4uIcSbf1pZkUz04ALUewDdM5PnOfY+C4QFOvXcvtwHQ0h+E
	UZLeoO9Be++SYV4pZC8likzaDcDC/4arXZ1neBLYqipn5q/jGfFUZ/5IYoeNjdd1FnMoPccGLcq
	d6Qmlzy5ojQfTrZW6ZGxGn+kFPd8G3JgHVxfLNZUV2KV8NJshv9+F03SMHADsNxCTESKYurVgjk
	QPwVl72zask55o0ETLL9kFcniI/rK+F0c02gGwUmcv5Y2wC/943nzEfBheNFB7SRa2yOVmhapPz
	txs2HQd3kN8fOixSDGP0X4f164qBlkv6BNRn1j4jN71IGGYs4WnrWy/x2zauTkDP0JQLs6GmybO
	taUQhezlzNRnNp1wmEEWh5SecI59CqIMBHxeKLQSeZRwSiZ4eZWIMGSLVsmatzQOLxfI6/Afubc
	iYJdaizrmgofR8=
X-Received: by 2002:a05:6214:212b:b0:888:6fde:7b72 with SMTP id 6a1803df08f44-8942d7e0460mr207178096d6.32.1768916785693;
        Tue, 20 Jan 2026 05:46:25 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1dc88afsm92873801cf.15.2026.01.20.05.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:46:25 -0800 (PST)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 21AB8F40068;
	Tue, 20 Jan 2026 08:46:24 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 20 Jan 2026 08:46:24 -0500
X-ME-Sender: <xms:MIdvaQkDpiNERS6ZDD4RFZudbe96RkXEG5Wn29PLm557bOa1XWPz7Q>
    <xme:MIdvaUs4h2u9Z_7MEcSZmC9VEDBsHBBSVfuke7zpWKDLeq2-kmXOu_jvLDXnYNngJ
    ZVx5Xi0f2bxZMXo13vO7uoQOQSRGweEao2rUSvdf8-MekJKAqvVUQ>
X-ME-Received: <xmr:MIdvaXOilmeqLVnK2rp1aK1365CAufvcBz90iScfNGoXpVwIf8AbSLKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedtheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdq
    fhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    khgrshgrnhdquggvvhesghhoohhglhgvghhrohhuphhsrdgtohhmpdhrtghpthhtohepfi
    hilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrggu
    vggrugdrohhrghdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomh
    dprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:MIdvad3LHcnIdXmOV485ryfI6aeyEO2Pzol-W2-6wgJ_YlykIMl9qQ>
    <xmx:MIdvaRxCqAWXdtgPRWYk4pYYoJos9kf-wSqMqFhp-sScDFFni8Dcgg>
    <xmx:MIdvafo3TCGCaN943c9JFJ-cMLXIAQBZwRgtqq8vV5VKtE0TJOTmNg>
    <xmx:MIdvaXUqoonHROVQUjoZfnTP7G7HI-oq0KcLQwRzB9By4gcaXHI1Gg>
    <xmx:MIdvaWrIaKYHWyMx29-tty7pCsEXlwWAsFfCNpiW_4uCGvfWyHKHnzgJ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 08:46:23 -0500 (EST)
Date: Tue, 20 Jan 2026 21:46:21 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, kasan-dev@googlegroups.com,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Elver <elver@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: atomic: Add atomic operation helpers
 over raw pointers
Message-ID: <aW-HLUWC3C9HZIGX@tardis-2.local>
References: <20260120115207.55318-1-boqun.feng@gmail.com>
 <20260120115207.55318-3-boqun.feng@gmail.com>
 <DFTG8D7VQNUR.2VK3OZ0R92MEV@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFTG8D7VQNUR.2VK3OZ0R92MEV@garyguo.net>

On Tue, Jan 20, 2026 at 01:25:58PM +0000, Gary Guo wrote:
> On Tue Jan 20, 2026 at 11:52 AM GMT, Boqun Feng wrote:
> > In order to synchronize with C or external, atomic operations over raw
> 
> The sentence feels incomplete. Maybe "external memory"? Also "atomic operations
> over raw pointers" isn't a full setence.
> 

Ah, my bad, should be "atomic operations over raw pointers are needed",

> > pointers, althought previously there is always an `Atomic::from_ptr()`
> 
> You mean "already an"?
> 

To me, it's kinda similar, but let's use "already"

> > to provide a `&Atomic<T>`. However it's more convenient to have helpers
> > that directly perform atomic operations on raw pointers. Hence a few are
> > added, which are basically a `Atomic::from_ptr().op()` wrapper.
> >
> > Note: for naming, since `atomic_xchg()` and `atomic_cmpxchg()` has a
> > conflict naming to 32bit C atomic xchg/cmpxchg, hence they are just
> > named as `xchg()` and `cmpxchg()`. For `atomic_load()` and
> > `atomic_store()`, their 32bit C counterparts are `atomic_read()` and
> > `atomic_set()`, so keep the `atomic_` prefix.
> 
> I still have reservation on if this is actually needed. Directly reading from C
> should be rare enough that `Atomic::from_ptr().op()` isn't a big issue. To me,
> `Atomic::from_ptr` has the meaning of "we know this is a field that needs atomic
> access, but bindgen can't directly generate a `Atomic<T>`", and it will
> encourage one to check if this is actually true, while `atomic_op` doesn't feel
> the same.
> 

These are valid points, but personally I feel it's hard to prevent
people to add these themselves ;)

> That said, if it's decided that this is indeed needed, then
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> 

Thank you.

> with the grammar in the commit message fixed.
> 

The new commit log now:

In order to synchronize with C or external memory, atomic operations
over raw pointers are need. Although there is already an
`Atomic::from_ptr()` to provide a `&Atomic<T>`, it's more convenient to
have helpers that directly perform atomic operations on raw pointers.
Hence a few are added, which are basically an `Atomic::from_ptr().op()`
wrapper.

Note: for naming, since `atomic_xchg()` and `atomic_cmpxchg()` have a
conflict naming to 32bit C atomic xchg/cmpxchg, hence the helpers are
just named as `xchg()` and `cmpxchg()`. For `atomic_load()` and
`atomic_store()`, their 32bit C counterparts are `atomic_read()` and
`atomic_set()`, so keep the `atomic_` prefix.


Regards,
Boqun
