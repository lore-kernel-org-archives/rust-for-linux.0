Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3263814A4FB
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 17:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731347182; cv=none; b=bgX//SchRWJuRV/Mh8NH78sZ0qybrdwxpmrKS8kigTCaEPuu5abZJN+QuLkPPKNimWSR9o2p7q9nuMLjl1q2Kj752SP0Ord8UhtHW2kc3NoAUDOlvhlGFPi5oKDMf7twtRxVFDHuy6WCoUdhKFDp6ubkD81Czz6kKjMvMb25kSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731347182; c=relaxed/simple;
	bh=DmRO3/05LPnocI6aeJbIoVM3IBKxKrHeM0C+EqGDkE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VK5gEAdPzfkoS2fHaRA24TlNivTBv0nuyWAc1vCRV2bHkySbRsuteKJPTjQc/ou2ZisvtZyhZQWdw6kv6WFLnomHtxSlAMrsVz/iSpy/TIGQyV/7a2uQ44tIBbi61P4jARpixSKU1sSy+hNfJ0h2rOixxJbKtt0c13ex60W+0Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzLeadQX; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzLeadQX"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6cbe53a68b5so35991416d6.1
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 09:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731347180; x=1731951980; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L0BJ7SgtjSnW9Gzk4mXrKBygHrpBXZhq1Xi0U7dzOww=;
        b=TzLeadQXwraV1Lgbdzvny+mA4EBV4NgeqkXOJe8oTSg87voecZHQp3MgSNGhP/ATCR
         Qty3mIEpnlejKz9+034tTKLEVqMNxFfCo6cM4wVsIxmJDiO/q3ssqftNL210kutazkau
         T86N0YLvqLku6P/Ow8io+Mj4PBmv3cj5tNzLKPGVOiy2vu4/fxEcvjAYeiRQuIIYnwIB
         eAp7bxSGJoRvy6nlhSjknXHWGN1b4Z3l2Maz6c4GNobRGYjydxgQ2dWQyx0Cu5gvavXp
         7108FJr/na/jXtMHzh1zyT/vUvtvjc10yx0jAeL50sYbd1Ok+GcM0ZcsEYzHYIA2APT0
         sq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731347180; x=1731951980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0BJ7SgtjSnW9Gzk4mXrKBygHrpBXZhq1Xi0U7dzOww=;
        b=gMAqKBXT+exVQ0jWYvlZVs+8wWeCxvkcYAXFWGoTi//cnuBMOs3JZvlfB4HNKF7xWu
         FTtMPEhw7afFQiuZJTAWo55I1qpX1J3iODEDUvzbV6VS3HiGcu+kmAe/cr+R3O9ogUjA
         Fz7GH8X8dT6AJ5UEprvhAtQzREp+IrTRP/c8o42YgaSYhMd32SWRPis69+878+PwVSTi
         9hY3NI2XpQmR+ZbeMOYdGE+FuMLQus1E7J3B5vE7n9Sk4U89GgWwmNKC+qR29puLSM7r
         ujzaiw1oi8ZYZL4mFq9Yi4+7Gngb01NcrRQayzIlejUSux51YjxeV5wrXbPUi75GlxEd
         OfEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9mdl3Ds6IuWf5Dr9JhHQ3Ro7gLX0ITz5ougu+8S0gQX1ZIRXAJ/yICVSqLZXWuWKQeBfjS+c3Y7WY/epUPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Ze2srSWNZjluSl7oG0hUuxK652PV+oaZk9Zhc8WGinbCfM0U
	VfZo9yBz5yjd4FIAr8HomBHZ1Ualgn1q+AF6D+F+oaJqm+o37LZr
X-Google-Smtp-Source: AGHT+IHwKJX4nd6W+rVqJGBgGqRxWcpOGhCm80H9zoN39VseIKnO6ycKkQ8RsDzIv8+YXJyzhdpJEw==
X-Received: by 2002:a05:6214:2f85:b0:6cb:d583:3765 with SMTP id 6a1803df08f44-6d39e1068f1mr190564416d6.1.1731347179977;
        Mon, 11 Nov 2024 09:46:19 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961f5940sm62219176d6.49.2024.11.11.09.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 09:46:19 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 17C271200043;
	Mon, 11 Nov 2024 12:46:19 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 11 Nov 2024 12:46:19 -0500
X-ME-Sender: <xms:6kIyZ4pNs-_k0DxCQqYWv36DC6R9tTzjzUb5vjMOR97YWRaE381vQQ>
    <xme:6kIyZ-obMJatIsJ4C3eeo6ak_woU_DEIYl66AEH9FA-ZCK2bpErazdzI-o_c0OYUY
    u5YbkAQ8dLH3XGozA>
X-ME-Received: <xmr:6kIyZ9N2qMo40TgApbteY18BzwGKl81rTyhMZLZlwhrkAjef8dlbgts2m9xRGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddvgddutdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfh
    gfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedufedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepjhgvnhhsrdhkohhrihhnthhhsehtuhhtrgdrihhopdhrtghp
    thhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrg
    ihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdr
    nhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
    dprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphht
    thhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhmgh
    hrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:60IyZ_6V422F8_mlDOBOpLtNUDTCIsh9Sa7zgYXc1LYBGzUxXQM-kQ>
    <xmx:60IyZ37VFAlC0_sdVAtO0FICzQ8VKmCZzK2zjJvZzCajOK_q6tH-0Q>
    <xmx:60IyZ_i2vCqPM3iK8NygVi8KNhElOeYNBmHcEy22J190NuIki8RcCg>
    <xmx:60IyZx5J-u3QdFqmI3YjygqFYlt8mkVU8qhW9b2sLpINHswHkBjpBg>
    <xmx:60IyZ6LimqXwo4M9Dx214JuQ146qVraa0un_Z5OhR8NfIcj8tUHbBPny>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Nov 2024 12:46:18 -0500 (EST)
Date: Mon, 11 Nov 2024 09:46:17 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: jens.korinth@tuta.io, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Rust For Linux <rust-for-linux@vger.kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Dirk Behme <dirk.behme@gmail.com>
Subject: Re: [PATCH v3 1/3] rust: print: Add do_once_lite macro
Message-ID: <ZzJC6TIxUz6byCJY@tardis.local>
References: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io>
 <20241109-pr_once_macros-v3-1-6beb24e0cac8@tuta.io>
 <Zy_oj_k-qUPLSVEr@tardis.local>
 <CAH5fLggOJ1QMdzS=hp+wEGDSKEMFuCh=VPSga5jRy=F+knKE=Q@mail.gmail.com>
 <OBQQehb--B-9@tuta.io>
 <CAH5fLgiSBFP66LKtTJpZEPxiyag_VQWfE3BdoY48oWWaXwYHDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgiSBFP66LKtTJpZEPxiyag_VQWfE3BdoY48oWWaXwYHDQ@mail.gmail.com>

On Mon, Nov 11, 2024 at 02:53:23PM +0100, Alice Ryhl wrote:
> On Mon, Nov 11, 2024 at 2:34 PM <jens.korinth@tuta.io> wrote:
> >
> > > One advantage of using a Once type is that we can use
> > > core::sync::atomic until we have working LKMM atomics and then we just
> > > swap out the Once type without having to modify the warn_once
> > > abstractions.
> > >

Yeah, although I'd rather we merge the LKMM atomics ASAP, and we can
avoid the switching as much as possible ;-)

> > Ok, that's a really good argument. I'm a bit perplexed why the generic
> > `Atomic` type has such requirements, they seem unrelated to the semantics
> > of the interface. But since it is defined that way, `Once`, or `OnceLock` etc.,
> > seem the way to go.
> >
> > Question is: Would you still merge the pr_*_once macros with the`do_once_lite` hidden in `print.rs` for now? Or would you rather wait until
> > the `Once` abstraction is available?
> 
> I just realized a significant issue with this plan: The standard
> library type called Once is implemented such that the calls that lose
> the race will *block* until the closure finishes. That's not what we
> want here, and it's also not what Boqun's godbolt does. We should not
> add types with identical APIs and names as the stdlib type if we don't
> match the API.
> 

Thanks for bringing this up, for this particular one, we can call it
`OnceLite`, it also matches the C side name. `OnceLite` doesn't care
about when the `call_once()` is finished, it only cares about doing
something for exactly once. Make sense?

Regards,
Boqun

> Alice
