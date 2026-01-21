Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D22F495512
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006478; cv=none; b=o5Y2lK1zWZUQ+s5XxPj69R/ecFBR4MrzkDBLeBCoobZJwhjngXHs8oCSYjRNuGn/d9ZE80rVkp9eKs0SRhp88ixkazXhvOf3OSkXi2o9oZCpJYtxmUzBl+n5A9xXaZ6GD4VfNoOxBhKEIyb9pw7Jr2y4dd3+J3gjNTSJ1WqQEDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006478; c=relaxed/simple;
	bh=JO/s/6KKvqMhoj8pQ+M8dYm9bOMaDHK5abW2HtiJvOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/EKfA7UyWy7n5/EJmpb3SkbEYD+wlEDgwnJsrsQ9bqLrWEyACehnU8skSFdOkj3cY+RzgZ8/nRkdsfPaHSlRPGbobHHueJ295ozQKS7qcdllA2sEEbfl5JVoEal1yHfcOdgjpFnQH1LDfCxqPSMrKZDoWc9U6jorrqV2zvRfME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUYe8QqL; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUYe8QqL"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b6f85470b6so4531787eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 06:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769006476; x=1769611276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLcZMH22PMLngVZW1Pr6WIQb6BYdcrFZicgkGSpRFnU=;
        b=iUYe8QqLR4RumebALnYeiNgLmJ5cbeD/llhNfXzW/4Kw/cZ5ZY7l60N49rZ+FU4yNv
         AKNZGdAm5g8XHuNkNh/+Mz4ylmUQF+P23sRl/2egmZuovu9I+Rcxw3sEpzdNJh/3vmRO
         1gCtia4oNiDbPJsay93qGqkz2RQKwFwGbKXdSbLIRgvgkWLDPMTMgv3O3/d0UwS65+Ma
         xqSfM0P7CenSBEdySzfbIX1bNHBl2lCSzIvjxxqiL44mRW2B3W4m3jLtuT6vWjG1lmr2
         GbDK/2LozLRKn6PZlLUwXIJJg9qibKeMa2EqyXDOJJRqG/jCgo403ZrqAkMdtzF9J0Zu
         tJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769006476; x=1769611276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BLcZMH22PMLngVZW1Pr6WIQb6BYdcrFZicgkGSpRFnU=;
        b=Y6DAzlhEv+d5Im+YECVobglMLExIYNWSmxUJxH6SrQE0ku50r5QK5QsaMUUUFBaRot
         lIkFfgNCoFv/L8JTUW1D7mnXS8nS6hZxhjBnO0HOoKojnK+9B5wIZY00me1gcYWCeqrZ
         WIgeIRVfHxDq5ERGdz41kwMP1LuNdw+eomX9Xthzx4VGjo7h4cdiGRoWVV9Jfjq82R0Q
         SoQx0MntD+Hwj7uAiO4Bkflg0kbsAXk6E0rTZjY7wGXK3kc49r2h2atnjeBv7ehgBeXK
         48Vpiv8AftEgx15dkFyYIRAt4ZD+jnF1clfRt50PeErgWPlbqD3kK/vD268J6bq3p19v
         M/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLkAgnuA69inW4r/LLFqbnuulpQFTQkoWeOeVwQ5TyZFIVnmSmUqlCz8Aaj/E2/oXgoaUD7rxXDzXCa8LTeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcWfxdE6gTv/2xhBnSMcIleseyMmP8Kw8w4B9P1uRXoVpv3n36
	6eWhW0FrFE1LX4HJriGawlbmv37YHh4fH7Umd5YEk8/gmGYg/jc4tD6phaT2JA==
X-Gm-Gg: AZuq6aKDYhRt5nLrPKXsKnM1gZi3dV8mP33DlTlLEC7NGj5F8SStAuDZ7jE6MmH42ia
	AJBsbaA4wgqeg14EcFpuKLn8TjKhT6tkrPyJ1FSKD2l8uzuKhesF7a+wPG83+2rvOwwynJ/SnZb
	ayIKlb/314kF1kUO87cKqEJz7YMdGsOuwYQ6FtqWMg2fWbbc+7zkG+1ODoS29h42ZwHqdoHgzFe
	oANqkf5A08ShyfMtTju64iSz0O4mLrkIFw8/UlKyRhZOdowOy/7OVIhJknnz5FGgXF0b4u04teU
	JLyVSRaIhP691YmdJf+rifGE89mQMg36RxpmnIlgzFu8waU/jOVkZllJlieCq3JJWKl3Gw6qrWK
	y7okgBGKnpsvS2+7HVeFtyYohEMOGppcDjL+ybOcgqdA4kCJTKOJ8qyIfhMxohdgOQ9z3pZowGL
	vxm8nfaAwrUCZGUF3WdhLeHOFIAwWxV+SkPgjbRchdQdegwezed/l+5cPdnZbytd2dWu8MTYgkl
	UeB8pL+TvyUI9U=
X-Received: by 2002:ac8:5a8a:0:b0:502:9abf:a89f with SMTP id d75a77b69052e-502d85074d8mr56654461cf.41.1769000304933;
        Wed, 21 Jan 2026 04:58:24 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9f480sm112557811cf.13.2026.01.21.04.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 04:58:24 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9287AF40068;
	Wed, 21 Jan 2026 07:58:23 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 21 Jan 2026 07:58:23 -0500
X-ME-Sender: <xms:b81waZUXCA5b7_qat5LZqZYJW1NkZrWahIWNw1B9RjoV5gfNEa8DkQ>
    <xme:b81waee_z64k_jmXfpq3dYEMz9KfulJ02ofTqys7ZsWInOcrR750BpxJY9PXWbdtn
    Iqvcu2ueC7hF4T3qzNAxfqGiO67hCJ8vNiyX0udzTXCOj56CF4h>
X-ME-Received: <xmr:b81wad-HHoOir8j-lQk0CLGKoNG0X6zglpvrbgIFjn1BGePx3lYVbVcr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeffeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeeftdevhfevteettdfgffeigfekieetudejgfdukeeihfffheehueevleffkeef
    vdenucffohhmrghinheplhhptgdrvghvvghnthhsnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvghlvhgvrhesghhoohhglh
    gvrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqfhhsuggvvhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrghsrghnqdguvghvsehgohhoghhlvghgrhhouhhpshdrtghomhdp
    rhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrh
    iisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgu
    segrrhhmrdgtohhm
X-ME-Proxy: <xmx:b81wadmCqcGj5xTe7itFHc83W1okWdihA5c0cJUg1ni6v3c0mqousA>
    <xmx:b81waWiT25eU8l5WhPNKNLqdLi895cSvJC2kDbHkx_nuWvamYB2oMA>
    <xmx:b81waVYdQFaGJc-eDx6CHOioS55nmBM78Vas1w_LPZO4D_XccSuzbA>
    <xmx:b81waaF6W27Y3C0x1lF0XdDOPxCG-UqTdRcwBdpB7OyWQkBURyQsbg>
    <xmx:b81waSZz55cpaJE_C3npEbNnvh-wgPvRnpertyHamIBoYHwZCFVCI2pV>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 07:58:22 -0500 (EST)
Date: Wed, 21 Jan 2026 20:58:21 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	kasan-dev@googlegroups.com, Will Deacon <will@kernel.org>,
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
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: atomic: Add atomic operation helpers
 over raw pointers
Message-ID: <aXDNbbvBfTYJD1kJ@tardis-2.local>
References: <20260120115207.55318-1-boqun.feng@gmail.com>
 <20260120115207.55318-3-boqun.feng@gmail.com>
 <aW-sGiEQg1mP6hHF@elver.google.com>
 <DFTKIA3DYRAV.18HDP8UCNC8NM@garyguo.net>
 <CANpmjNN=ug+TqKdeJu1qY-_-PUEeEGKW28VEMNSpChVLi8o--A@mail.gmail.com>
 <aW_rHVoiMm4ev0e8@tardis-2.local>
 <CANpmjNNpb7FE8usAhyZXxrVSTL8J00M4QyPUhKLmPNKfzqg=Ww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNNpb7FE8usAhyZXxrVSTL8J00M4QyPUhKLmPNKfzqg=Ww@mail.gmail.com>

On Wed, Jan 21, 2026 at 01:13:57PM +0100, Marco Elver wrote:
> On Tue, 20 Jan 2026 at 23:29, Boqun Feng <boqun.feng@gmail.com> wrote:
> [..]
> > > > > READ_ONCE is meant to be a dependency-ordering primitive, i.e. be more
> > > > > like memory_order_consume than it is memory_order_relaxed. This has, to
> > > > > the best of my knowledge, not changed; otherwise lots of kernel code
> > > > > would be broken.
> >
> > Our C's atomic_long_read() is the same, that is it's like
> > memory_order_consume instead memory_order_relaxed.
> 
> I see; so it's Rust's Atomic::load(Relaxed) -> atomic_read() ->
> READ_ONCE (for most architectures).
> 
> > > > On the Rust-side documentation we mentioned that `Relaxed` always preserve
> > > > dependency ordering, so yes, it is closer to `consume` in the C11 model.
> > >
> > > Alright, I missed this.
> > > Is this actually enforced, or like the C side's use of "volatile",
> > > relies on luck?
> > >
> >
> > I wouldn't call it luck ;-) but we rely on the same thing that C has:
> > implementing by using READ_ONCE().
> 
> It's the age-old problem of wanting dependently-ordered atomics, but
> no compiler actually providing that. Implementing that via "volatile"
> is unsound, and always has been. But that's nothing new.
> 
> [...]
> > > > I think this is a longstanding debate on whether we should actually depend on
> > > > dependency ordering or just upgrade everything needs it to acquire. But this
> > > > isn't really specific to Rust, and whatever is decided is global to the full
> > > > LKMM.
> > >
> > > Indeed, but the implementation on the C vs. Rust side differ
> > > substantially, so assuming it'll work on the Rust side just because
> > > "volatile" works more or less on the C side is a leap I wouldn't want
> > > to take in my codebase.
> > >
> >
> > Which part of the implementation is different between C and Rust? We
> > implement all Relaxed atomics in Rust the same way as C: using C's
> > READ_ONCE() and WRITE_ONCE().
> 
> I should clarify: Even if the source of the load is "volatile"
> (through atomic_read() FFI) and carries through to Rust code, the
> compilers, despite sharing LLVM as the code generator, are different
> enough that making the assumption just because it works on the C side,
> it'll also work on the Rust side, appears to be a stretch for me. Gary
> claimed that Rust is more conservative -- in the absence of any
> guarantees, being able to quantify the problem would be nice though.
> 

I don't disagree and share the similar concern as you do.

> [..]
> > > However, given "Relaxed" for the Rust side is already defined to
> > > "carry dependencies" then in isolation my original comment is moot and
> > > does not apply to this particular patch. At face value the promised
> > > semantics are ok, but the implementation (just like "volatile" for C)
> > > probably are not. But that appears to be beyond this patch, so feel
> >
> > Implementation-wise, READ_ONCE() is used the same as C for
> > atomic_read(), so Rust and C are on the same boat.
> 
> That's fair enough.
> 
> Longer term, I understand the need for claiming "it's all fine", but
> IMHO none of this is fine until compilers (both for C and Rust)
> promise the semantics that the LKMM wants. Nothing new per-se, the
> only new thing here that makes me anxious is that we do not understand
> the real impact of this lack of guarantee on Linux Rust code (the C
> side remains unclear, too, but has a lot more flight miles). Perhaps
> the work originally investigating broken dependency ordering in Clang,
> could be used to do a study on Rust in the kernel, too.

You mean this:

	https://lpc.events/event/16/contributions/1174/

? If so, that'll be great! I believe if we could learn about how Rust
compiler can mess up with dependency ordering, it'll be a very helpful
resource to understand how we can work with Rust compiler to resolve it
in a pratical way.

I believe that work was LLVM-based, so it should apply to Rust code as
well, except that we may need to figure out what optmization the Rust
front end would do at MIR -> LLVM IR time that could affect dependency
orderings.

Regards,
Boqun
