Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E72270ED2
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762790888; cv=none; b=B6Bc3DtKVHXtA5ge5Fdnk2StGyzLzESZC97s3Uj+8T/MlVrzNOrRUXvQ526WTg3qB1iqMUx0EmOQNKA1gnIgz5CmbDMtWD5ZV5GVpxaqzI0jUtP+MbXDCl0j5QBK7x8ly177IQm8kEwPseN8RIiw907W9rtKt5jvR94LB/LfRoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762790888; c=relaxed/simple;
	bh=OE920TJTNQsATJ1hWwICHV2YQsLvF/JPSnZWRAkbLXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqWrKQRsaUM6L6I4Vw07V60/dyewl+/xm3yJyjQc1JxcvSRyVV5/21CLPnwu27h+10YBMj5eXmFOW4HN26iOd9Qa/5k/LETAk9b1GZitO7jv/OKF+gARuRRpOUCeP2uNLiZYWIp2c1BHcFf7UMUFJ0w38hfquasXrHDbX9qe/QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWZcBrC6; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWZcBrC6"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ed72cc09ddso16647671cf.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 08:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762790886; x=1763395686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ya+nsLij84apSokSZ6tc7FJIt3UiFpsssVC5pjcfG/0=;
        b=fWZcBrC6xYLdtCSbierd6ZbgF5VdzH+CRns61l8WCqwvvdNxCQzc4avcu9j1quBOtk
         H9jpXC+qFpr6FN/Gq5s7+oy9/IxPYnh4IriNCQjCrcHWtgA5pNVPw1FAaDqfZrM90e6/
         HF8zKyfUKgYZ34EStYdQAuX/4c6g/Ao7WEv40CUpA/SeQYpY0bR8BC3GTjwtUkDC36vj
         c5EQehmGMiP6NifJtHsmoYcl4oJub1ry9mjbcBeoUANQrynmVIYd+P8TcSE6MVcxoSGC
         T/SrJFzhcRE3/6Z6lcKJ7tznzk41/mEiy3uLvSKJNmx9wkLcKN9XpE/nzYxI1qqcydbp
         uG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762790886; x=1763395686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ya+nsLij84apSokSZ6tc7FJIt3UiFpsssVC5pjcfG/0=;
        b=hRGUHesOlh6wl64Qy1wLir1az/fD9HyIRUNisRtIQRxpPX1Xjt+VmSx1ggaX6T6hZK
         kE6LKiuToazqqCpnsgz6zz6lMEGmLaAh2G5gRcCcCbtB2QHTf893koCKFpnmuJz7NFVm
         FgYhO16zqJoPUqKPPIXO5KHTUXPZEuynjhRy499Rl2sLWspGh+Yz7CF4cHMsjxAhybJa
         c8kWhJGa1Qixzxs6mD9CgpA2ONYVlHpw0daMkD8xhYLYbz1x9Qai40hOxZVj5oa26UVS
         BSipjd6yM5T6XTnWrlrADyUPgaoIDHFRfcvyjYMu4M+zmISMzxevYWsoT4yXym9dyjc2
         LvRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKGVEZ0oDKMwaHc9LfyjaUbQKK4epNbnaFDb+9XxsBKgEBEYA4cUMu0XB4EXZ+Hc1cFGEGaj0tP+uFd3NnVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymT5SwNH59PLOxtABaMJWTOcti/EWvouIWmt1UsUVi/KcXNjF6
	nK2ztWWDFt3g+aXqIrOikKS5t9P4ESHkYI4qUdYxqv0kpTL9nwAdFfV6
X-Gm-Gg: ASbGncvaMGQtxeiiVA7eh2W+Cft18oKVSfWzOzaX7xB4eudesSTZbS6Nirvrj3AiB/e
	BO60eNNXHeERG444z5ceS5qklXARIPWeWpNT6FK6CeFurpai99z0bxUCrKVBnBPZCODawtocu4G
	A1MZWDXXE2yqGjelEHv4y/nKZdqoueqlrAmNCU5hLNJL0Bk5lXGrQ2mwjR3hcflHJVN3t3gvLaQ
	NdwwsmUwP4nWZTGhPhC7MpaE0xQi6GLUWcrKCnEOT3fKk01aSXxz8DQbPsWEqf2/qsYlhrnp7Fg
	uLT0XMjS56N5BwtmIheEPW60b1Wa1GFV8crt8ofaDNT3db7lKXLe5cjzb47Sza9y6iSIrtyvaNN
	cKpugE/kSvbkMqiLvVER+LSS46XOlXrYjZAkfsq2OdCixiimUHlAOiK6XG9UvtydyosozL764ML
	McbEhL3gaytoH7pXol9ldklmbvnQ9TrjnUdIJccgEhnyi1HQ8y25swd/MGyimmvgAQHLnU8E9zg
	HAzWNwsZQhd4rM=
X-Google-Smtp-Source: AGHT+IFMsDjQIkDTNUUvUn9Dh3sPX6xlkwXzlb2HBlrgzqf3XaurhTFILlEnU794kMsu8UE1rRsG2w==
X-Received: by 2002:a05:622a:411:b0:4e8:a664:2ccb with SMTP id d75a77b69052e-4eda4fb565cmr118611481cf.63.1762790885739;
        Mon, 10 Nov 2025 08:08:05 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4edaebc73b0sm39232391cf.22.2025.11.10.08.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:08:04 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id DCF8EF40068;
	Mon, 10 Nov 2025 11:08:03 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 10 Nov 2025 11:08:03 -0500
X-ME-Sender: <xms:4w0SaZi6Np1bhhUT8eSrUMt-fqdPiZBDMIT6EfkI-HR4DclmFEWB9Q>
    <xme:4w0SaWMThLLaA6nJIC2rQQsp1gz0-mRYv32lavUsF5x3H3vxKTY8PouR9akgUoZOk
    JQn1rBa3glHgaluuOnb422sY9Xu3fBsubou7gy-5HvYn1FHPBAgiA>
X-ME-Received: <xmr:4w0SaUr1Ze7sRHrqsReXlrcgZLdanBPozgecEuH3rXlcLOMwwbN-qefk9u2EJP96d0bJTiANXDh2eWfaasGyDOqNGA9iDu0y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduleekjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfh
    hujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopehojhgv
    uggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdr
    tghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgh
    grrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:4w0SaY5yesp3YA8J2geI0TZZm8iMzvBvUCnYgtjrt0YXJK_9CKyhdw>
    <xmx:4w0SaSieRO9GPe8e66kKoGRMthD0jZiUPZHDppf-LL37UAKRLk6gUA>
    <xmx:4w0Sae4ZFPoPfdS13KATQYhSpNAuEeMfxD0MNsJu63jBC5PYqvWN-g>
    <xmx:4w0SaXH5DaW8Uy4ssrH0CYgeP-aOeqSPum4HzVkKQ3-Wf4eTahT-3g>
    <xmx:4w0SaQImbIQ0WgsLMjInrNagCqfHQ6MRuUYaslpBRbANgKBjXikKXdxL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Nov 2025 11:08:03 -0500 (EST)
Date: Mon, 10 Nov 2025 08:08:01 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org,
	aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
	gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
Message-ID: <aRIN4U8L4-wQjyHj@tardis.local>
References: <nsSZZk6z9Ia7Gl5JS9LVNDRjc-9eFvtSWyLI4SSjsHNouDkDV-GmXnixMYlIpGHryPfhLr8Z2W_CkWd6D2frYQ==@protonmail.internalid>
 <20251105054731.3194118-1-fujita.tomonori@gmail.com>
 <87pl9w6vs5.fsf@t14s.mail-host-address-is-not-set>
 <20251106.081231.149919562701074305.fujita.tomonori@gmail.com>
 <aQyxW_cskrK0Zyxr@tardis.local>
 <87ms4u6q1f.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ms4u6q1f.fsf@t14s.mail-host-address-is-not-set>

On Mon, Nov 10, 2025 at 01:16:44PM +0100, Andreas Hindborg wrote:
> Boqun Feng <boqun.feng@gmail.com> writes:
> 
> > On Thu, Nov 06, 2025 at 08:12:31AM +0900, FUJITA Tomonori wrote:
> >> On Wed, 05 Nov 2025 21:59:06 +0100
> >> Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >> 
> >> > "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> >> > 
> >> >> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
> >> >> pr_*_once macros.
> >> >>
> >> >> A proposal for this feature was made in the past [1], but it didn't
> >> >> reach consensus on the implementation and wasn't merged. After reading
> >> >> the previous discussions, I implemented it using a different approach.
> >> >>
> >> >> In the previous proposal, a structure equivalent to std::sync::Once
> >> >> was implemented to realize the DO_ONCE_LITE macro. The approach tried
> >> >> to provide Once-like semantics by using two atomic values. As pointed
> >> >> out in the previous review comments, I think this approach tries to
> >> >> provide more functionality than needed, making it unnecessarily
> >> >> complex. Also, because data structures in the .data..once section can
> >> >> be cleared at any time (via debugfs clear_warn_once), an
> >> >> implementation using two atomics wouldn't work correctly.
> >> >>
> >> >> Therefore, I decided to drop the idea of emulating Once and took a
> >> >> minimal approach to implement DO_ONCE_LITE with only one atomic
> >> >> variable. While it would be possible to implement the feature entirely
> >> >> as a Rust macro, the functionality that can be implemented as regular
> >> >> functions has been extracted and implemented as the OnceLite struct
> >> >> for better code readability.
> >> >>
> >> >> Of course, unlike the previous proposal, this uses LKMM atomics.
> >> > 
> >> > Please consider if it makes sense to base this on `SetOnce`. It is in
> >> > linux-next now, but was on list here [1].
> >> 
> >> Data placed in the .data..once section can be zero-cleared when a user
> >> writes to debugfs clear_warn_once. In that case, would such data still
> >> be considered a valid SetOnce value?
> >> 
> >
> > It's still a valid value I believe. In term of data races, Rust and C
> > have no difference, so if writing to debugfs could cause issues in Rust,
> > it would cause issues in C as well.
> 
> @Tomo you are right, `SetOnce` would not work with someone (debugfs)
> asynchronously modifying the state atomic variable. It requires
> exclusive access while writing the contained value.
> 

I mean if we were to use `SetOnce` in pr_*_once(), we should just use
`SetOnce<()>`, and the problem you mentioned doesn't exist in this case.

Regards,
Boqun

> Best regards,
> Andreas Hindborg
> 
> 
