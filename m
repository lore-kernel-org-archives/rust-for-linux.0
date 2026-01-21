Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6B72ECD34
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 15:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769009884; cv=none; b=SW9pwKL7AwKvdAizSHZJzeHquEfsYABQ/Qk6JuoZNvsK4bMZneDjDA92ohKiPU5bdaw3hdQXOP2VYBL8NMrSrfqktKVgACMNn4tUKt4tePJzypu8+PmQvImjvChGpP5BhJsrO7gW9Z+DbbuLDxeqnJKBRoHlIOv40TZ0qKliph4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769009884; c=relaxed/simple;
	bh=YHIVmzsUwXYFRNT8PxJqLUDcsjT4fcomkaFdrmmVUOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6NRFgIrvVn9nLCBYDSaUqMJu9wlC6xe3reOLiE4hT+e0O8mKdzL7h2Fc4atBRJgfTER8pr6VPIvKo4HvfUfZ/Gi4WLyEJmlGDdr4VUTFG9fD7sX6S8RLbq3dhjUGaa4uXhj32I5IKUWmJszWC3y9U5gnKVhLU0Qba7k4Z9EcPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIVRMbjy; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIVRMbjy"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-404263bd58fso656494fac.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 07:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769009881; x=1769614681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBuHUIxWMnLe6s7TwsvCGhfWapOm3oLq0HDTyptAlGo=;
        b=GIVRMbjyoT0Lo8w0YbanUAg+UgLA8tH4jvc481lQiJFvopUAE5DrkcEjcg1tHlrpOJ
         eUoXX9dNfpzvAU4KTrxJZ+84Onv2v2mrNEZC8TcBEqUjB0HbHGnxF+xzCfA0dzB66oFO
         b3IXfgUk5ckW1KRLls2dZH8Si7r5ysKw7zZx++K/03yvxrMyMxbKhz6OSQo0SKMpMhem
         1lM2xFv4keiMixXkI7EQvBTzlkSqOgRpNTL76FWHW0kw4JuIF+4635pm/um0hZgKs4n/
         ZUpgYoJxe+HFJ3nUioalwPn6WwuYp4B6atIepVIZa2bZfg0QlC8TEUFEnd7FsOR8s9rU
         9CAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769009881; x=1769614681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vBuHUIxWMnLe6s7TwsvCGhfWapOm3oLq0HDTyptAlGo=;
        b=aUAWWUVavVPEYOPEsyXL4JgbYVwqobnr/FYR8ei7P/AjZqnyM+Xdge+nH9PBbnFeft
         nQZp7IcawQP3kWKVbkRAY3yW/Bx6l4QpCCBMcv8l1sIujPbPJ5Q5MtzLDlDBB9endACF
         SyWL3q3yUTx8wmji1yNHP/R+hi9/khyQ50ff5q10ah2+ipGbEkbWMWG34pXdjWHMtbLJ
         CdHZL6180qmAxAwl4zGtlK9Wre6g+T+G7muQ38o4F2KP22uBinmUlVbxgghsmvkSRUML
         KR8leLasfdaF0yhD4Y8kH+kO16E27Ju5oIOhEogyVJsVKSfpzt4UVkkg9O6OJv2z3Vfp
         wNtg==
X-Forwarded-Encrypted: i=1; AJvYcCVKQ9UeaVdN/eiL0cCWoub6RjPnXoNFCuUQ7FCPjcR7ayHmXXMuas/U/bW9R8yAi74yiqeKd/aNwW9+MZS2Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTclLtxP57yiisRRspN523FxEPsF159zjihvVZLZnpLrzc58Oa
	oRLrJfp4QeGXFI8b6fq9gWWXErpm3prdVvEFlXq2F4aQAY4QesUq0saQmzYnfHeM
X-Gm-Gg: AZuq6aIfdIP3isR6c6Q2mMgMiTY5udxOoxHS/zViWHjC7F5DgFlYSqPzCrNmBMiFGXf
	wv07v1MXV3AmCTBNxDThoMAyXw6hpe5xN+aI7Bp+y+mu0rYimwwcExs3/zkL96rGT5SAC06g2wO
	eoHSeNC8rv7m+sHpC7uejsVsI/hF+dm04vFIukJlNRkqOMQZBCf7mDyGvY+15TRqZW0KYQYmUUb
	TKq+qVNoTUdyVs+vfy4DqMosX87mA49uQjJM3QdkZQR8fVpZBFFiHWEVZG5ahi9CQEnMh0JkVab
	WKY1/j9gFn+cPX3aAbxMELgtenFmDHjPRH6j+de1ZJkScMMbOt5ZzCgFQNLmRiDBTUlT61CpLFz
	Sw3CrcncIY0rXGWmOI+r3C9z0xcLwKFxwpmkpMQv65t1tgLly1J2E9FH7nz2lG4xAYZVW/HxPf3
	Mhb+/d8oPisSqyqFC6X0jFqma2bhDqGDDHgfZh5MX8WF1NyrUV73QsbpJkCV6AKXeg+H269X4eo
	2uYVWW2FZM8sqU=
X-Received: by 2002:a05:6214:21ef:b0:87c:19af:4b76 with SMTP id 6a1803df08f44-89398144853mr314752936d6.17.1769004274227;
        Wed, 21 Jan 2026 06:04:34 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d8a94sm124931226d6.56.2026.01.21.06.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:04:33 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 82E98F4006D;
	Wed, 21 Jan 2026 09:04:31 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 21 Jan 2026 09:04:31 -0500
X-ME-Sender: <xms:79xwaRPgS8h0JnF8HDazDYFECjiK0XRf_br3BZs2plL4fMjDAe722Q>
    <xme:79xwaY1R9fsjITBQ4yKxSWOJU3sP5x_pIHLOyR7_TbiehKPP2R_EqaVSuweruAo4k
    eaLFD_gv1cDSAb28i6hpJyT-SMrIX3LLsRJuMe-AYXeWe0Oy8PO3Q>
X-ME-Received: <xmr:79xwaY2vAFacNlU5ffdaLISbe6CBRMyv8522yQ8kaXcNVrqe9RXlb3h6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeefgeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesgh
    hoohhglhgvrdgtohhmpdhrtghpthhtohepvghlvhgvrhesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushht
    qdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqfhhsuggvvhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehkrghsrghnqdguvghvsehgohhoghhlvghgrhhouhhpshdrtghomhdprhgtphhtthhope
    ifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgr
    uggvrggurdhorhhg
X-ME-Proxy: <xmx:79xwae-7AjQM7cRhrID17z6Ip7K1eCj6XX0BcbwSoxR7SPnuwnSQmg>
    <xmx:79xwacalaiU0QPeoC1XhJN7CzYPqHVgjh_4cloRVJjbl_SZf2a1WGg>
    <xmx:79xwaVxjU5nPqxd_mcPpASdcQ9Jeq9x06toUhHgGaDVEK_wxZroVPQ>
    <xmx:79xwaS-vARAtWkjKWHBijayn1MXGlO2wWdH4VjAucuXb14OOmzvCBQ>
    <xmx:79xwaZxny1W8998ySnA5TLfT8cQGMeb3X_G-z8hLwsB6H5O6XZsesuNN>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 09:04:30 -0500 (EST)
Date: Wed, 21 Jan 2026 22:04:28 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Marco Elver <elver@google.com>, Gary Guo <gary@garyguo.net>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, kasan-dev@googlegroups.com,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: atomic: Add atomic operation helpers
 over raw pointers
Message-ID: <aXDc7KYgkD7g4HVd@tardis-2.local>
References: <20260120115207.55318-1-boqun.feng@gmail.com>
 <20260120115207.55318-3-boqun.feng@gmail.com>
 <aW-sGiEQg1mP6hHF@elver.google.com>
 <DFTKIA3DYRAV.18HDP8UCNC8NM@garyguo.net>
 <aXDEOeqGkDNc-rlT@google.com>
 <CANpmjNMq_oqvOmO9F2f-v3FTr6p0EwENo70ppvKLXDjgPbR22g@mail.gmail.com>
 <aXDL5NUOH_qr390Q@tardis-2.local>
 <aXDPliPQs8jU_wfz@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXDPliPQs8jU_wfz@google.com>

On Wed, Jan 21, 2026 at 01:07:34PM +0000, Alice Ryhl wrote:
> On Wed, Jan 21, 2026 at 08:51:48PM +0800, Boqun Feng wrote:
> > On Wed, Jan 21, 2026 at 01:36:04PM +0100, Marco Elver wrote:
> > [..]
[...]
> > 
> > Note that it also applies to atomic_read() and atomic_set() as well.
> 
> Just to be completely clear ... am I to understand this that READ_ONCE()
> and the LKMM's atomic_load() *are* the exact same thing? Because if so,
> then this was really confusing:
> 
> > my argument was not about naming, it's
> > about READ_ONCE() being more powerful than atomic load (no, not because
> > of address dependency, they are the same on that, it's because of the
> > behaviors of them regarding a current access on the same memory
> > location)
> > https://lore.kernel.org/all/aWuV858wU3MeYeaX@tardis-2.local/
> 
> Are they the *exact* same thing or not? Do you mean that they are the
> same under LKMM, but different under some other context?

Right, they are the same thing under LKMM when used for inter-thread
synchronization when they are atomic. But when READ_ONCE() (and
__READ_ONCE()) used on types that are larger than machine word size,
they are not guaranteed to be atomic, hence semantics-wise READ_ONCE()
firstly guarantees "once" (volatile and no data race with WRITE_ONCE())
and then on certain types, it's atomic as well.

* In the case that we need atomicity, we should just use atomic_load().
* In the case that we don't need atomicity and no data race, we can just
  use read_volatile().
* In the case that there is a non-atomic concurrent write, that suggests
  we have a bug in C code or we simply should have some other
  synchronization. Or if we believe the conncurrent write has at last
  per-byte atomicity, then we can have `READ_ONCE()`-like function that
  returns a `MaybeUninit` to bear the possible tearing.

Regards,
Boqun

> 
> Alice
