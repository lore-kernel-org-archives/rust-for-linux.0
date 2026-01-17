Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACAB2836B1
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768651884; cv=none; b=SpIih5nJxSisBBYAZcueycMtkXYErdk5TTZyTJJLYTGeG79l5rECtIVsYQ54Cz69ZE7t2MXeXaC+jPqQndmGgraNK1KVTVZHXYwcFa7dheAWXsGP2Y0K9PXQswLF2IbJSImtoJ5ctgppQg/ZIFW/hlsWmLfosmaFWlsda9FnZdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768651884; c=relaxed/simple;
	bh=RWYdE6hY3yf2AhImiXGF8DIAKPG7t4UOIfyeA/D4M7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9oHT2EU/54YC5Or0p1eXh9KJaU9bs8OZO0LgbHv4kAnF07HCtslD6l3OwL5c6CeNqA0OFWYbHkUAcVhfkqUuoZHJdrPZ41aIqr7Axa008fUAroy3ydYjPtnA25iAbfcmMEcwOPu1f3PM8eCsjivO6ym6yCx8/Nr0Tj3OhGlisQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyduGkaT; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyduGkaT"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c530866cf0so290135785a.1
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 04:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768651882; x=1769256682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Lq+qQrczeBcVzR4njvZgDFILo49g4HfX34hwBUDSmQ=;
        b=OyduGkaTlmUSlB4Zv51qgKkrxcvtTMm85paZ6t9f5M9yN9c7UNyvAFf3wMShL1TO2T
         CQgyQinJBZCUZMPGUEz+aoSaI4glSwAGgVBYXyKZqfsb7fDHYQbtZZ7B67qc7aRJPe0q
         /SFa01ai3002gOR35Kw6WrLhWwlN4fKUbsYOJlq1k3UkS+H3qtWFrb3GIEOGqTrI8xj7
         rHixjc5XdwBjRThjqF4Tm7Tgxt6Qkd81wY7csc9tUzQF1tEsGepdBKKaFo91mU7nf3Cg
         lQrJKrTBEum5kaC4jTdZCBRvg5DSBTTZksUJcO1EFmJWLZ2HOblRgSjZssJUfNfvq1hJ
         LcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768651882; x=1769256682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Lq+qQrczeBcVzR4njvZgDFILo49g4HfX34hwBUDSmQ=;
        b=GQscK420FLPSd5zME3eGynqGKZME60XixyglwgeE9pLP8J+u8rBBXVFPftNZrnX+Qk
         5ZDTXfYt9FSs6nep74TZ605j7K4YrC246nMVKT2vLEH9Aavj4FlcfrDBTsI1NQiN0+9G
         b5e1oqBRrrWpBJAxrAWcsPQzTyex2tBkzKCsZ4MfHEtKoTMUl5/tZmalziMcJfqpK3Zz
         83Li1OrdrprIWfxVlsD12gqHvC+GB9IKsbcbpVQFriUSpmJtqyCUzimhwIA2fsff5Jpl
         YnlB6Kc0whZ/R7Qjh+0+xV63qhbmvtIDaXygtWf0SoexEAxof7TM+oO6Dw7DvlCzBHGI
         07Yg==
X-Forwarded-Encrypted: i=1; AJvYcCU5cSaATEB/rMaJgyv67lpYMAb8cMXXtE/VPawySoNOn+YMwn3F/a3GAE/Gg26oHTt1atgqNvdbpDoLbUpylQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXLI/4dQ8qmfASyczWXCRojNdWWqOjwv/cODbunheJFL+BVPZF
	3eoSnrWZVIPZPdyq4857z847F5mYBtGeoF3ei7D61HGowmNZRsgP94Ux
X-Gm-Gg: AY/fxX4j5UwA//gXavuHba8xUN5L4wkuF5ErFX31Fw+TNLxS3ik5hw+mJvYyaMiYeu8
	Xtuu84QhV/RlPAFaBjV2ukZg/+LmMtZ92pzNYiB1J5ZXEFmxodyVaACUesAZjLOOIAsz4gYg3VM
	dMYohXVh5zgSRR1uOtrUbdxzoVjwfy7TJwNti1tZL+5zsWyKucCJ7Y6pr4TZyLw69cPAzz81fK/
	JwBnFwLBfBHViakn8+7zaQUqypLyewKeqOHSg7D2pkm14F4JUDHl/ac/AlbIx0CjNVD51bPQlc8
	hYq+OcWzbnT3ngqlOHNhkEcZGH6JoLDDI5EpR5wZx1Qi8HFIaTTbSK/ipqGjjVmTvSX0ereL6j5
	DNHlDzCv20uISpjxZHX7wGqswg8gO7KZLZwCHppkCo0dgas8Jd2fsaWLlE1uoWucmbIU7G0CudK
	Xbw9fMHRQVeQVm7tHO9TukYsTHlywTZU4eX68J/9W4MZ2QGCdn1KNzk9pohGy4EAG/BBVMeywGx
	CefRyNI2CRMZbo=
X-Received: by 2002:a05:620a:bc4:b0:8c6:a487:6ad0 with SMTP id af79cd13be357-8c6a67b1172mr836990185a.85.1768651881581;
        Sat, 17 Jan 2026 04:11:21 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e602d53sm45788716d6.14.2026.01.17.04.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 04:11:20 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id F243BF4006D;
	Sat, 17 Jan 2026 07:11:19 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 17 Jan 2026 07:11:20 -0500
X-ME-Sender: <xms:Z3xraV1gi4XU5VZ1UdjEbRVJ-K-d5SHO9v_4YpmgA5WAGR2q87Va-w>
    <xme:Z3xrab8UirGoX8qQwGlC4CYRO3Sr7Q0NBm6b8B1jy4BBgQ6Rgh_8VBGYVKdZgo0_A
    -rucuAxTMTJ-flcMfh62BUz_MUncuAFm75s0Y8rweC11oeCReLU>
X-ME-Received: <xmr:Z3xraTN2Wr9QQrdssbyktUFdGt5XsTeFI6P5TyzhLTQ5TpajgFEqNCZe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedujeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprg
    hulhhmtghksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihgrmhdrhhhofihlvght
    thesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvg
    htpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghj
    ohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsih
    hnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:Z3xrafDcatiCph0lMQVUj4zOc4zOzsB34irsF9JfFkt071C6GsXT3A>
    <xmx:Z3xraVOHxyvt0GpG3yd-gksjK6aDB_BOTtUFP0JRn9z8oWrfRIJwuA>
    <xmx:Z3xraVZ25_TK82Gggvd5cjFZw-kP92E04W0c5br9ghCtUhREsUbEyA>
    <xmx:Z3xraUNidwRe1bkgl5eTY9XDC82OcVstuGUMoEnsNVS4IkhwY0lPmg>
    <xmx:Z3xraTWhJUMRrpoTUMZ2v3SzqRItCe_sOUx2nK_4QC_urcV4i8uekD8o>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 07:11:19 -0500 (EST)
Date: Sat, 17 Jan 2026 20:11:17 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org, maple-tree@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [PATCH RFC 0/2] rcu box container for Rust + maple tree load_rcu
Message-ID: <aWt8Ze-otTkexNIe@tardis-2.local>
References: <20260116-rcu-box-v1-0-38ebfbcd53f0@google.com>
 <aWrSkAPFkdH_tvtN@tardis-2.local>
 <aWt4muGXbe7lBmXt@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWt4muGXbe7lBmXt@google.com>

On Sat, Jan 17, 2026 at 11:55:06AM +0000, Alice Ryhl wrote:
> On Sat, Jan 17, 2026 at 08:06:40AM +0800, Boqun Feng wrote:
> > On Fri, Jan 16, 2026 at 03:46:35PM +0000, Alice Ryhl wrote:
> > > I'm sending this RFC to share an experiment I'm looking at. This may let
> > > us replace the range allocator in Rust Binder with a maple tree.
> > > 
> > 
> > Thank you, Alice.
> > 
> > > An RcuBox is like a Box except that it lets you obtain a &T that
> > > outlives the box by a grace period. It does not allow mutable access to
> > 
> > I think the `RcuBox` can be folded into the more generic RCU pointer api
> > [1], e.g. Rcu<Box<RcuBoxInner<T>>> where RcuBoxInner<T>: HasRcuHead. The
> > benefits are at least 1) we use relaxed atomic read for RCU readers
> > which guarantees address dependency that RCU needs under LKMM (while in
> > the RcuBox here, we just use plain reads), 2) we also support mutable
> > access as well.
> 
> 1) But mtree_load() does use rcu_dereference() to obtain the pointer?
> 1) "relaxed atomic" does not sound like something that provides an
>    address dependency to me.

If you look at rcu_dereference(), it's a READ_ONCE(), which is the same
as a relaxed atomic load, and yes in LKMM, relaxed atomic load provides
address dependency (Please see the DEPENDENCY part in
tools/memory-model/Documentation/explanation.txt).

> 2) How do you intend to provide mutable access? By waiting a grace
>    period?

Please see the {read_}copy_update() in the RCU patches that I linked.
In short, you don't wait a grace for mutable access, since in RCU,
readers don't block updaters, but instead updater will copy the object,
atomically update the pointer and then get an `RcuOld`,
which you can either synchronize_rcu() or {call,kfree}_rcu().
 
> > As for the progress of that effort, the Rcu atomic pointer is almost
> > ready [2], I will likely send it early next week. For the `HasRcuHead`
> > part, as you may be aware, I'm working on a generic `HasField` approach
> > to avoid duplication of `Has*` trait and macros [3], that requires some
> > syn adjustments from Gary and Benno, but they should be available next
> > cycle. I will probably send the patches for reviews before that. Once we
> > have that `HasRcuHead` should be easily to add.
> > 
> > Given the WIP code I have, I *think* we are not that far from providing
> > what you need for binder.
> 
> Hmm, so I looked over [2], and I think my RcuBox is an RcuOld<_> rather
> than an Rcu<_> under this model. Though I can't afford to pay

I don't think so, `RcuOld` represents an unpublished object while `Rcu`
represents a published object, you can update an `Rcu` pointer to
another object, which is normally how you update with RCU. But maybe
it's easy to discuss this with updater side code in picture.

> synchronize_rcu() for cleanup - I need kfree_rcu().
> 

That's something we can add later, for example, we can give `Rcu` (we
can add the similar thing to `RcuOld`) a generic const like:

    struct Rcu<P, const ASYNC: u64 = 0>(..)

where Rcu<P, 0> use synchronize_rcu() and Rcu<P, 1> use kfree_rcu() or
call_rcu() (once we have HasRcuHead support).

Regards,
Boqun

> Alice
