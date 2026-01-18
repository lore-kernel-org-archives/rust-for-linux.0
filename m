Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858A432C94D
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 15:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768748711; cv=none; b=FnOL8nrtADFD3Cw65T+6m3BD84shRxcM1SboB3f9WGaAmknrlRLlW+gZQL6AcJkTpkaT8v3asvSQ1RjArwOaZuAaGNuKlcQGVCeK3HTSq0fik8k0GGY/SvZmGcArpuSfPGyav20y/uUcVqK/p65JPRCuxiBfDNUmmF/OOSu3xfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768748711; c=relaxed/simple;
	bh=5vRsRWeMNtoPVYsJZKkrfh9mzvgru9Cb2lGawFduPS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0qSuQAbbdGUFbxIhtMzBqHgtsmsy3xslT9ioKOuCF0hd7xzHpkKKrAv3b+sFG9BIRWlhPYqYEnkUGB/jSLOEO3DR1j5CoE4rfVJQWDgtOtfiFrLaBpEYd7/zLqtCWXaux1CINdbkgfeMy6SljzFs3niqQHQCTSjkQnLxrXmz0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z98NeYzm; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z98NeYzm"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c6a508a595so292574085a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 07:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768748709; x=1769353509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21uLaqJ17tNxzyJX/CswTc0v9JKdWpeTLh7D9bEVPhE=;
        b=Z98NeYzmpw+qePaVCufd1WPP3bJIB+wGRdTbU7jPuzCTubMba+PWkNktg2028HGJ0D
         q/g3A9SrEPZGcmlkNQ+l+Sadj8coEP956cjiz1z9VNg1vMpGSaVb2dfevmol7IqILot5
         g3HDRp6za2qlhHqZ7jNhxhD9bhutWV+64rclYFh/vsDMaRMlZnp1GGwXjhqFi+X5mHyb
         3+pZwpn8Stp/LJHAJy3WIX4YPGkHlR073Y9BtSXfJLJp8YZqaFChsJrfeT6m7v7/zGnx
         18AqZISBtF+NLkFsYwDZndmyvd7N+3JSxdXQumhpWjfJIseamxfgjT12R/UbWAc5fKsw
         y/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768748709; x=1769353509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=21uLaqJ17tNxzyJX/CswTc0v9JKdWpeTLh7D9bEVPhE=;
        b=onK10RJJrxwH1bn/a0BR+5mhORPSyniiIQAnHX0gyY9Xx8c4CW+JaRUPdzNszexkZJ
         KNZdUEBQ2rd+vpLmHwg6gRneEwNHqcmfP87hIHCGEbDYY9qdJwNcK6PGVjxurTkFTVrC
         H+jsWadA1HC7qScj31bWQ1KCdUgh2p4FkMu2h16vjFZ5B6FNDzSH5ytnwM0sp/jRHOEv
         4wugsrkqkfzTm2lBKibdtCJI0YOFBimGCwg5ir/V55pxoPiqigfPxX2uv+ksSCdKhNAR
         u6wcawmycbYpLrmmYjr7/tM/QX/Jff+Ypq+IgHySk2AU9eR9enU25R45/nAmA5X7eqL3
         vHOg==
X-Gm-Message-State: AOJu0Yw2naSeH+f0lRuc2VKzsfaQ4hcfe2ZIX8lnhkMAOaxP4l2oijh/
	tyj+WAprh0dnlMDJ20rbra5dArQiPEYhu3KUAqvnzdrAoYct8pHePOwA
X-Gm-Gg: AY/fxX6IHREPPsfKul31CbQRO+x1+90TLeN4ZmVCYddN/o5Ojbz5t1jDPU/Gh5jvP2K
	nAMCA2QJ52fHUmrRQicTp5CmcL4JbxL0fFqY3qangNcm/rMhiGL4BSjrjl7ZYUZ53OU1VUaoZAs
	163V7Vnkf2a02QE6ZfVRVYl+irT4nP6OA3rSsvIbeiaNpBrZhw/m2dA227OgO/BRBss/zyryTh/
	ltfSrv8YnRkRyv1OdLB/T/1jL/FkWXENciKcypUBWwxWxRqy+velThubYVnPDAVkC1lw4M3FWTR
	1UEV+impnBUFXQiVVeJF8aRnRNwbeltIJgc/ooEmvLSO+oMNcxsWo1isVFGpm9CTUYUpZhmvn4t
	tK/Dej5bWTNkU2RhT0i/3w5YCkDnyhp8zUDsehxuexk4YrPvzudcqdx19YVNMCPycj5fF4xAsnA
	JbHL8Gc+YjOCujqSDtiFtlKGtujuW45d4wMoQicRQO9Ohex5WIZ/Zp3u1xKa4KVa4oiMMSA8JZi
	PK6OQwGShJ4+r8=
X-Received: by 2002:a05:620a:c4b:b0:8c6:a608:5abc with SMTP id af79cd13be357-8c6a670532dmr1195312785a.28.1768748709345;
        Sun, 18 Jan 2026 07:05:09 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e603a8bsm64025876d6.17.2026.01.18.07.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 07:05:08 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 28814F4006A;
	Sun, 18 Jan 2026 10:05:08 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 18 Jan 2026 10:05:08 -0500
X-ME-Sender: <xms:pPZsaW-pcTbiRv1pgFwZ1zUQ7fjQ70T_q0eOjDJvbgWGhUmd6heEwA>
    <xme:pPZsaUIkzRPwbq3kL9vQHtOAlw8ZXWBajOnj1YgvAXLryhuP2LOZQovwAuDTPAUys
    zJjG35LDckyhBUS43BJiWpYFyGcAoOsd__v4jF4w8K5yZoNC8-rlw>
X-ME-Received: <xmr:pPZsab93FIRODLq4dCC9UvuDgH4RGLGcoQAgJf4P4ok5CHDFrJ6qifP3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeehtddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvdejpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopeguihhrkhdrsggvhhhmvgesghhmrghilhdrtghomhdprhgtphhtthhopehruh
    hsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehrtghusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpd
    hrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghp
    thhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnug
    gsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:pPZsaQEvpRDFFrcitxjb8Mj2QrQHs1sYj4s1oYuhuv0et-qgHSwMMg>
    <xmx:pPZsabNBQNx5LmYfORsiYduFr39OjM9APU2MCWh1c8hmz1Q34rDoDA>
    <xmx:pPZsafT8xD5iRy7v1CvLMctT_JCnUw6JxPezcmiLAUnYHnJYtFE5XQ>
    <xmx:pPZsaSRV5Md2gRUp5st0McfxJZo9vOWP6OAxILg9PtRAFAt9pBj8Ig>
    <xmx:pPZsaZb39TlipkHU7f1abqtKo6TFXDTTIw9M0ZTGXE7_pASypAEfS9Xe>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Jan 2026 10:05:07 -0500 (EST)
Date: Sun, 18 Jan 2026 23:05:05 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 4/5] rust: sync: atomic: Add Atomic<*mut T> support
Message-ID: <aWz2oZqMaQHQWe-e@tardis-2.local>
References: <20260117122243.24404-1-boqun.feng@gmail.com>
 <20260117122243.24404-5-boqun.feng@gmail.com>
 <67e5482b-93ed-4b5f-8375-f7e68c50a436@gmail.com>
 <aWz04Tb7SSDQls8T@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWz04Tb7SSDQls8T@tardis-2.local>

On Sun, Jan 18, 2026 at 10:57:37PM +0800, Boqun Feng wrote:
> On Sun, Jan 18, 2026 at 09:38:36AM +0100, Dirk Behme wrote:
> [...]
> > >  
> > > +// The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
> > 
> > uses -> use ?
> > 
> 
> Will fix, thank you!
> 
> > > +// guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
> > > +#[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
> > > +impl AtomicImpl for *const c_void {
> > > +    type Delta = isize;
> > > +}
> > 
> > Are all users of this guarded with CONFIG_ARCH_SUPPORTS_ATOMIC_RMW as
> > well? Or do we want (need?) to cover the
> 
> No, the users don't need to guard with CONFIG_ARCH_SUPPORTS_ATOMIC_RMW,
> the purpose of this #[cfg] is to avoid surprise that when
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=n arch supports Rust, when that happens,
> we need to add the support to the helpers of i8/i16/ptr.
> 

Hmm... I guess at this moment, I probably should do

#[cfg(not(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW))]
static_assert!(false,
               "Support of architectures that don't have native atomic needs to implement helpers in atomic_ext.c");

I can add a patch in the next version if it looks good to everyone.

Regards,
Boqun

> > non-CONFIG_ARCH_SUPPORTS_ATOMIC_RMW cases where someone tries to use
> 
> Note that these arches are very rare, so we might not have any problem
> for a while.
> 
> Regards,
> Boqun
> 
> > this as well?
> > 
> > Best regards
> > 
> > Dirk
> > 
> > 
> > 
