Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AA7286417;
	Tue, 17 Feb 2026 15:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343570; cv=none; b=DxezrT8hDz5Lj08yarSpxSIsBJyESvpqnQFEtikQV3jdgbN3ddwqrolqWq/wMx/ZXYVXslzI0M68hxDW1kgTvVnsuZSOkrXlfSz2XubugC5K5653pDnSsTMG2leQKjH/j3irhg925zMwl1MqMxEWpryedNTca/a397HNOy5lVs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343570; c=relaxed/simple;
	bh=iH/4jHxpjwqHTjjSxGybSY4T89B5U0JcMMqKVFpsIQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLncrzl58rhtdjFKGrpvZhnAkhEsEbYghz0rAtoj9yhBnuasAt13tkubPRCCNc4ShPHzcOVS5bIfZ+QH946w2dhbPSIk0h7S/Dv1ohdtyotfxswwkZN533Vdg5vgYs/kKIqZ9zB9/bcPd3QY215tVCliooj4wJQdsFVe1m9mIKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r0VjQkx+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r0VjQkx+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFDAC4AF09;
	Tue, 17 Feb 2026 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771343569;
	bh=iH/4jHxpjwqHTjjSxGybSY4T89B5U0JcMMqKVFpsIQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0VjQkx+YtBh718FGVCIvmHajV3QqwqmxutrHa8URvIIJYXXzOARhBZOM5wYiMV4U
	 Se1U4Q9SAaTf1hNbeZJusReqCqtJNT8tLZIR/d12a6k5Ow6IaAK9Tx717eaZTfDNb2
	 nLcqE2qX8d7i8xHW+bg37e5BH3/RQ9fiiv3T7GGto4QGTvGyV/v4Q4X7J7IRLLgS7S
	 48uSq6rl5oi75jX2Yzj9TkUHMedwwv5HE5BNC1ZXBzj+igNeEdrxlbUMkJtmN8OBhb
	 KWdXPe7HMSgZXI8ZIPYfyhJKkaSX1fBxCF4s6cEMaK6BI7HUxeZXJSQnGffttCL7xG
	 c/dAaaW5cq0XQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id B30B1F40068;
	Tue, 17 Feb 2026 10:52:47 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 17 Feb 2026 10:52:47 -0500
X-ME-Sender: <xms:z46UaSa3J1PtIw2u2CAFksYpd-_Z9Nvs5vHZhZO-cOKx9pDW4AvrCg>
    <xme:z46UaZXeM336IGk1VclWOpxlfqQyi3mslj5o4OzqbMy3UmLflh70D0bN-8cmMg92d
    JDyq2MrQmlrK6nxH4V4LlTOguGglUmphH3eiaQu0usK-4MWSraieg>
X-ME-Received: <xmr:z46UaRhaYlSJU0o35n-HZ9xIiq-pV3T3oMmep3JZzje5DVC94DR4kn9i3GcvtxcGPYWYWmC810gOEFJuwnrb6dtueD5SrZum>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvddtudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgv
    thgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlih
    hnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhg
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvg
    drtghomhdprhgtphhtthhopehlohhrvghniihordhsthhorghkvghssehorhgrtghlvgdr
    tghomhdprhgtphhtthhopehlihgrmhdrhhhofihlvghtthesohhrrggtlhgvrdgtohhmpd
    hrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqhhu
    nhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguh
    hordhnvght
X-ME-Proxy: <xmx:z46Uacn1lz5fFWzE84s4OvIHicypsayeQfHr78MXXNVb8aLLgljGmA>
    <xmx:z46UaSyatSXICv964C9m0j7jKwUAR9PxuBYt3nYUNBdAq8pbTtot3A>
    <xmx:z46Uaft-VTEsj482c8TWntCQF3MpMIWxyFc-H8CMNYeFaSnRxWFnPA>
    <xmx:z46UafvKlq8fdPv3Eu-_slZfO-M0NCbYOjA3AOaCeU3Hq0I9nCyxuQ>
    <xmx:z46UaVnjVCHLt58ViBBiImupwLKlh8d0Vw5o4BsKgZyyGhcTk1DKbd5R>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Feb 2026 10:52:47 -0500 (EST)
Date: Tue, 17 Feb 2026 07:52:46 -0800
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Message-ID: <aZSOzjdntYOB-DxZ@tardis.local>
References: <877bsgu7fb.fsf@kernel.org>
 <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh>
 <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh>
 <aY9HD7nH5A-DtgmR@tardis.local>
 <2026021326-stark-coastline-c5bc@gregkh>
 <aY9PBfx3RRV7rXZ5@tardis.local>
 <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217091348.GT1395266@noisy.programming.kicks-ass.net>

On Tue, Feb 17, 2026 at 10:13:48AM +0100, Peter Zijlstra wrote:
> On Fri, Feb 13, 2026 at 08:19:17AM -0800, Boqun Feng wrote:
> > Well, in standard C, technically memcpy() has the same problem as Rust's
> > `core::ptr::copy()` and `core::ptr::copy_nonoverlapping()`, i.e. they
> > are vulnerable to data races. Our in-kernel memcpy() on the other hand
> > doesn't have this problem. Why? Because it's volatile byte-wise atomic
> > per the implementation.
> 
> Look at arch/x86/lib/memcpy_64.S, plenty of movq variants there. Not
> byte-wise. Also, not a single atomic operation in sight.
> 

Sigh, byte-wise means you at least need to byte-wise atomic, if movq is
atomic at 32bit or 64 bit level in x86, then it's fine implementation
for byte wise. Or you are saying on x86 it can tear at byte level?

Regards,
Boqun
