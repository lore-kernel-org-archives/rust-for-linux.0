Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1047A1DF273
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 02:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768791256; cv=none; b=D9mSD+dUwaX2VXwrXadq1jZ0JxKUQ0nzHl59b9W7Y1aWAOsnv2J7RBtcY4kN8GU0L/+FmHNFpIDWmgQychLLen0m2oWlB//EWGMhPmy2oyS4leEhOXL06tocTKR4D+22y7DznhIGLUNZ/61kG15qqHHvE6fNL9FAhR0QxfeA5wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768791256; c=relaxed/simple;
	bh=u6BKctv4khQOGwF3sR58+ZP8VrfFt6vOgdUxnwbyZEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdHiDlCYvL9Bi4xNyuCRAx7DVHCo9LpSyeeonUrfe62ARnYv30fIPX+1IGz9r1lThR80Rpx581iYBh4xuvyN12QAdnK5kP60vYJYwg/eRI9/0JqISga4iX58gTxXwsytXgRB7ymi1KLg/rWawK/SQi7lhfApfFHJX3qX+HGLzpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5hjQcl3; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5hjQcl3"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-404254ffe8aso2919413fac.0
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 18:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768791254; x=1769396054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ga4T1rTKShKL1387lYEokMW72Q2esUrK3DVRNtHg3I=;
        b=l5hjQcl3PRvySDJfA1I0XUet6w/LN/BXjBvm6YeYUzrEuo2jP9DKw2j1Pq25AZlA23
         28GBH9ja9Ue6AmO9UBua4G35VN1dL9zjscetZSw5bZuG6eTjx3LNmzwDUEWk3wKc8mFk
         f2WVaFaYQ31o6wlaTtvTEJBbbpdIDq/Eimg5Ux+F5JIpbizJY9hY1tQ7qVDMMiB4awmh
         l1YQZTIMXk6YBt9U4YWz3YPYnKNckxfhHB3GBLIP3NohEjcB1CmcspXxoMuVC/PNyOjf
         pyt4zBIzhHu7OfIrMgkohJcrEOfZLAx5D7RtjYGcNnLVng+qsAh2BKy3oDO7Reh05riq
         RLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768791254; x=1769396054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Ga4T1rTKShKL1387lYEokMW72Q2esUrK3DVRNtHg3I=;
        b=MzkNJmPQo/ExndOzigodWDuU8Uxg+H8Q3oQj8WyuaShRUAP4Frf+fWz/p1JFyqyP4R
         eEwtT5ISOtzH717nDjUhIm5z52kAo5YG5fYWeuKyXEX1iBTy2WfltoDsuFSTxx3KBald
         2hz+g8rSPEJxOfMmviMA6Nos+DovzceEgs2w0mz/gv1wfgT8H30ypznvKGhoHRr5LSe7
         tGHfpCHYXSfqLTqqicvybP0gIissU2d0wZOJGLe1LlQbd3BKqA0XSAZobs8C765y9Wx4
         qb6EzDD3ituXOO1lJu7A2Hd0XG0DFZBCZ9DHPyANJE0Y01sx5FVyUMV6En4QlgYn0TWf
         DK1w==
X-Forwarded-Encrypted: i=1; AJvYcCXzo/X8A+C2S3mOJl28yeD5wG/KSHUzariNp+7PouQhPQh0dqF0FGVImzBE4LI5D2LF2erh4AhAP1JF1EaOZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrBsA/GAxxPUBJ4IGnvf2pwADq4w3s5ZA6hsrgvHcqnEhUNqZV
	7BU3H1WddyMw8rRz6mn27pIpziO8NZAP8FECz28LP/RL5lSw1o2fFVx+cp2CtQ==
X-Gm-Gg: AY/fxX5+vmvHSEDzL0o5SWOJSzayqcrvL6v2ojqumwfbAtAWhPXZgVht7nWIGdxnBlv
	HlAbU4cWuVkOA7n/nNnjBwAKV5lzJdB3jtitR18vVsRwnl2D5Vy1h0CO7G+YeBHJozLwZkPhD3Y
	pSN0gz9TfEDJDGL2rkmp40aMUu1r1aKjKXKqtw6Z8y7MTo3qVCyM6AugKg/8T3YULK679Vgxx2A
	iPxi1hUWWxbzAIOxuXLVHfWB39ES14B6R9n0kU8vjH6iLhfQca0gum4+X9mZ0aa5vVM2MDnNpKT
	qTy2hgi+TfrZ2sjUq/upgy29Q5pwUo1a4oMh4xsS5FSzYcrvi/NiwmwBspsbutMr9fKejJ1b8+q
	BmbZfMko1+8SVL6yphKbFWggXw3pl1VXEWO1+LoQOJv9GwCK5FxgvdZyv1pxlPY85fkawe4X5W6
	oJI54b+/fdkZUPIno3OjdhQxtOAsCkmqTg4PC93nMxUCFtyNzSk1u3Ts5SA5k4L6U8Ok16AQIzY
	5/lkC52M4D5TxI=
X-Received: by 2002:a05:620a:1911:b0:8c5:33da:219f with SMTP id af79cd13be357-8c6a651dc32mr1341810185a.43.1768784259107;
        Sun, 18 Jan 2026 16:57:39 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72602f3sm701200385a.40.2026.01.18.16.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 16:57:38 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id CE3E8F4008C;
	Sun, 18 Jan 2026 19:57:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 18 Jan 2026 19:57:37 -0500
X-ME-Sender: <xms:gYFtaQg1ajI27WEf2Ka7Lp_no1r1nGhAkuhhZ93-VMyYTrBI7sKyMQ>
    <xme:gYFtaWcKGAk75JJvtKdkMEfM3v4x-YaUhZ0n-bIpqyina_kDkYp5uTriOOf0734lt
    MJtL5uowvjOfnmpCbgb6oflhjtCNpBMk0OS5QZtoWxNBL4a6PUoLQ>
X-ME-Received: <xmr:gYFtaYCz2X-69P3XKjfax7csHYWDqTStuXA9ZaT1Tlov-DzgTlbZAe7u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeeiudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejiefhtdeuvdegvddtudffgfegfeehgfdtiedvveevleevhfekhefftdekieeh
    vdenucffohhmrghinheprhhushhtqdhlrghnghdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
    hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghp
    thhtohepvdejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlohhsshhinheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepughirhhkrdgsvghhmhgvsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhies
    ghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
    hmrghilhdrtghomhdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:gYFtaS4GO-tZIdHyS4sV1l1vpA83iVyuFxIouyMx5usNjBbt33bMHg>
    <xmx:gYFtadxN2_BYdNDDBhxITZ78X0vSrCFsRlFIevyzMiwy2RCPsQRYJw>
    <xmx:gYFtaWkAghWwsyN8bPwnqBF5nCYviYuMyqJeiUm9iqVlio5dXPv5ZA>
    <xmx:gYFtafXrVa15fqLNOCFfbfYCj4OG47QtJXNB-ilhmxf_iOPRK_uytw>
    <xmx:gYFtaZP0fj_xrNNKmzKiU3fPxJ0WZFsq6ce9TFZKDz7io6X-44tjd3ET>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Jan 2026 19:57:37 -0500 (EST)
Date: Mon, 19 Jan 2026 08:57:35 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Dirk Behme <dirk.behme@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
Message-ID: <aW2Bfykqj7qz79hS@tardis-2.local>
References: <20260117122243.24404-1-boqun.feng@gmail.com>
 <20260117122243.24404-5-boqun.feng@gmail.com>
 <67e5482b-93ed-4b5f-8375-f7e68c50a436@gmail.com>
 <aWz04Tb7SSDQls8T@tardis-2.local>
 <aWz2oZqMaQHQWe-e@tardis-2.local>
 <DFRZCBBXBTM8.2BSEQFA5F28W9@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFRZCBBXBTM8.2BSEQFA5F28W9@kernel.org>

On Sun, Jan 18, 2026 at 08:59:09PM +0100, Benno Lossin wrote:
> On Sun Jan 18, 2026 at 4:05 PM CET, Boqun Feng wrote:
> > On Sun, Jan 18, 2026 at 10:57:37PM +0800, Boqun Feng wrote:
> >> On Sun, Jan 18, 2026 at 09:38:36AM +0100, Dirk Behme wrote:
> >> [...]
> >> > >  
> >> > > +// The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
> >> > 
> >> > uses -> use ?
> >> > 
> >> 
> >> Will fix, thank you!
> >> 
> >> > > +// guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
> >> > > +#[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
> >> > > +impl AtomicImpl for *const c_void {
> >> > > +    type Delta = isize;
> >> > > +}
> >> > 
> >> > Are all users of this guarded with CONFIG_ARCH_SUPPORTS_ATOMIC_RMW as
> >> > well? Or do we want (need?) to cover the
> >> 
> >> No, the users don't need to guard with CONFIG_ARCH_SUPPORTS_ATOMIC_RMW,
> >> the purpose of this #[cfg] is to avoid surprise that when
> >> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=n arch supports Rust, when that happens,
> >> we need to add the support to the helpers of i8/i16/ptr.
> >> 
> >
> > Hmm... I guess at this moment, I probably should do
> >
> > #[cfg(not(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW))]
> > static_assert!(false,
> >                "Support of architectures that don't have native atomic needs to implement helpers in atomic_ext.c");
> >
> > I can add a patch in the next version if it looks good to everyone.
> 
> I think this is a great idea!
> 
> By the way, did you know about `cfg!` [1]?:
> 
>     static_assert!(
>         cfg!(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW),
>         "Support of architectures that don't have native atomic needs to implement helpers in atomic_ext.c",
>     );
> 

Even better! Thanks. I've added a new patch that converts the existing
#[cfg] on impl blocks to this. I've added Suggested-by of both you and
Dirk ;-)

Regards,
Boqun

> 
> [1]: https://doc.rust-lang.org/core/macro.cfg.html
> 
> Cheers,
> Benno
