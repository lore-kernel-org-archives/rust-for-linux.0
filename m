Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E254328B41
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132594; cv=none; b=h3mSHZoaVNuiosBG2x6KA1aWvKa9HonGcQIVfhaRjQ6pBSVMo+OyYQbg4IFYSXPP3M4KYcIFLi9H6REBj79T/+LHuacHggviK0y+TUR9zqRdr8m09fQiRTuQPAxOKUcqxvRg66FSbM4qqhE86mbbdjq9eOyy+oOh0Ao52kcS3jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132594; c=relaxed/simple;
	bh=UeGq9nfyLENpTb16ZggHSz2gOP2mKQcJbPvyT1SoTPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7p/rF98t5un40nCCDNEb0an9sSJN0xZiVZpBQ/eSpIvHKsODUjIZDWQYUWpVQ/TPARj/0qOzT4Y5N/wr07F/XjkuAClU/EVyUThc7I16W+1UZ9fB4Fx/5ZmOmPPJYv1E+hDv9R5eMvfWy7Ao1PLGrHrKEckCxcT7cTjMzSgtLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWi1FF8D; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWi1FF8D"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-786572c14e3so21983427b3.2
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 07:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763132591; x=1763737391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wf+l7POvGRBat4w9kbN82XD7IKf45219LO1gyTO1cwU=;
        b=fWi1FF8DA0Za9YhXYhoGR8lJpuh+EHtM9hIdpuXqFSNntd4HJDXnBKdfS8h/+gShDk
         YMlDVI6+8swKkzaIeN1c6BiQ7MVn3oXaNfU/ycnN1zuFbru3tUo+G5tSXMQv/Hwj7ten
         bEL3mPx/ihEHIy/qQmk5wOA7bhKkMSclp+MrwKx1SxX1SFrqkm0Z0eBJVoKigX+a4S2g
         OIdKrIiK+gGwSg6ZC+++VAB9PvrpDNjzUwcltnVkqMgHOXg2NEMNtZv9qI4DlENPkgVN
         UBVqSxm8BMEUJpJVShtsfTprD2/85CgPG4TgWbtTA41WakaD3Es6SPj24eS8UnnWPxqn
         GN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763132591; x=1763737391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wf+l7POvGRBat4w9kbN82XD7IKf45219LO1gyTO1cwU=;
        b=aKeWNthkoWaCQnFgWm+A1rtuiaJo6V4fORD/XmZsl7mUV3X3qFsmaCIsoqlcJR49kH
         fJUr4zemHF0bnW4yfzF6t/04KDI3Jqmsn1Woxszg0kJxiO7GodyKzoKQ5SPps8nr/S39
         f1FVgk8XzXApoAR5XvoPZS4dkkHUDSaPZTEQ5DiNAYN3AUtoENwoMvrjxrZEnzyOgNeJ
         +zypEHMr80kH08G1euexRxETYDOVhxnYQn41lP+fchbsiv0/D9SE7gWbZDeNE2LGPzhg
         7lSIaFtlTVr1H0yFUcKF23SQHPJ7dnBPHU9o30Tmqv5cex8QCkWocUS6/KMfqR5PXb8K
         /Vgg==
X-Forwarded-Encrypted: i=1; AJvYcCU99JVCDrz3KxTb6Npy/KgPMZ3ykd9nt92jijbtZXDUt8zf7feJMJZDzQaZpvsSMUpiD+SZ+Y5LQwerr2mx/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YymFyc2e1kR3uYkJ+AP7+2JwCdXMshOrE3UhJMrCw7YMseP+Ifh
	Gi34PfND9+PR7CQcMyeQbYtCltihprRS9ZjeVXvejegZOP/PdBv27I2k
X-Gm-Gg: ASbGnctvH0MOrvR/de+gn1fi7MmAWVZInT3D0zmhw0XlyFMViWHng+LObW3qn/mk7Oe
	82r4ivRvvnNOw/GVonfVHxLCrc5Cg2CmiI/y29mLpcyCW9WQ9kyW4fNvnOfw2zBDZHkJEWD3q9V
	9Z3b7PXmJb27ujGqCTTZ3DVLQPRp73iFa0O74O7MO+hYXfexCidc0kPweYtYKRjCib6BbFJRneV
	VgNrXOR/C2sHve6RqAUXKkSgew9J1U89HnqDAEv7PoFAK+JWbvhK8bywOYpDj/KTZbl2TM2n+Fc
	QXHgkGpwUrS7vqf3WvYp55cIyRDcik1r8ZLyojg35/Vcj1j58tTbli3gzbGxCJnTXAtW6ayngc9
	35oGpxRPNH5h5XC195Urf2oLghtByGL4JAH+yOMwlM6mK0KpBxmwH4i/h5RMf20HhaGek5EPxpi
	eWsr61lfPdX+bEYzWt7zxPe98Je0TEotQfxky17tV9ob+ttxvDJUo+h/dTYRUMMBFFomkcU6rjv
	ImSsvZOyqSUZz8LVOBRQS/oIA==
X-Google-Smtp-Source: AGHT+IHi/ikKgOXqGT1wMYdFZwN3Llvh6HZPsGqaw3CK8oGse2N6H3u2AsQpEanJ6SyBOWbdpi+xJA==
X-Received: by 2002:a05:690c:a056:b0:784:9ff4:8c82 with SMTP id 00721157ae682-78929f5e05cmr23989807b3.62.1763132590979;
        Fri, 14 Nov 2025 07:03:10 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828652c882sm32988376d6.32.2025.11.14.07.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 07:03:10 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id D6D8BF4006A;
	Fri, 14 Nov 2025 10:03:09 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 14 Nov 2025 10:03:09 -0500
X-ME-Sender: <xms:rUQXadzk4IRjZmpoXIJy11wAolx5plNdeGKZvD0Sx8-CLfjXYKJleA>
    <xme:rUQXaVcqoSYLAe_OaciDaWiM-f0DunDQD30PspymIBbHWSwm5qmApKRYflJkMDra6
    wDlVDkU2vS3CkNbHX4eEeO9NBj_p4A0EFoyl8qbC1Yi4_ejPHh7dQ>
X-ME-Received: <xmr:rUQXaS7zV0LJ6lhDTDHtL81Da1H_-TEDrII8Q-XvlVfDwUMtKoM5aUm6u4J2gITwOV2b7T7bsbgc-kW1K3IA6AaXXFfG0GwC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvuddtudefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprgdrhhhinhgusghorhhgse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtoh
    hmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghj
    ohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepuggrkhhrse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdp
    rhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhush
    htqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:rUQXaaJkzrgZsZEeei_CUcxvC9pmUxk8jzsCPKdXXov9HIfDVBvRuw>
    <xmx:rUQXaayo8FYOha53x11q4G5fGRGgeO7HYmYAOnAWe8LLKKgNI6PpMQ>
    <xmx:rUQXaSIsd9kokQQ3VRjL7Mnxi-T_XbYmWvCO6qIp_H-M_vdc-OCW7A>
    <xmx:rUQXaZVxh6TaqHWCQi7UjlxJ1a8K3ltmIxOfgs3maSrgXMh11srRyg>
    <xmx:rUQXaValRGb6xadlA7dXkKf6ghG-5jCiO8-lop87hxa8AOvwsNZDglBR>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Nov 2025 10:03:09 -0500 (EST)
Date: Fri, 14 Nov 2025 07:03:08 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com,
	ojeda@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org,
	gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly
 once
Message-ID: <aRdErAGv5AS_r10d@tardis.local>
References: <aRIPgOPvi4uhGQcM@tardis.local>
 <20251111.120949.1793896304189618185.fujita.tomonori@gmail.com>
 <aRLG1Ofr5QpJGFaB@tardis.local>
 <20251112.064349.598094996228184902.fujita.tomonori@gmail.com>
 <aRPjNS9jIsyHGAPl@tardis.local>
 <87bjl77h1l.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjl77h1l.fsf@t14s.mail-host-address-is-not-set>

On Wed, Nov 12, 2025 at 10:10:14AM +0100, Andreas Hindborg wrote:
> Boqun Feng <boqun.feng@gmail.com> writes:
> 
> > On Wed, Nov 12, 2025 at 06:43:49AM +0900, FUJITA Tomonori wrote:
> >> On Mon, 10 Nov 2025 21:17:08 -0800
> >> Boqun Feng <boqun.feng@gmail.com> wrote:
> >> 
> >> > On Tue, Nov 11, 2025 at 12:09:49PM +0900, FUJITA Tomonori wrote:
> >> >> On Mon, 10 Nov 2025 08:14:56 -0800
> >> >> Boqun Feng <boqun.feng@gmail.com> wrote:
> >> >> 
> >> >> > On Mon, Nov 10, 2025 at 06:21:50PM +0900, FUJITA Tomonori wrote:
> >> >> >> On Fri, 7 Nov 2025 09:03:01 +0000
> >> >> >> Alice Ryhl <aliceryhl@google.com> wrote:
> >> >> >> 
> >> >> >> >> That's my point (and probably also Andreas' point), we already has the
> >> >> >> >> type `SetOnce` to do this, no need for a `OnceLite` type if not
> >> >> >> >> necessary, and the fact that it can be zero'd by debugfs doesn't change
> >> >> >> >> it as I explained above.
> >> >> >> > 
> >> >> >> > The SetOnce type doesn't do the same thing as OnceLite. SetOnce has
> >> >> >> > three different states, but OnceLite only needs two. I don't think we
> >> >> >> > should be reusing SetOnce here.
> >> >> > 
> >> >> > I mean 3 states should cover 2 states, right? In this case we only need
> >> >> > to support SetOnce<()>, so I think it's fine, see below:
> >> >> 
> >> >> Yeah, that would remove access to the value member, but I think that
> >> >> init member could still be accessed in an unintended way.
> >> >> 
> >> > 
> >> > What an unintended way you mean? Do you have an example?
> >> 
> >> From my understanding, the init member of SetOnce is designed to be
> >> accessed by using atomic operations, only through its methods. If we
> >> use SetOnce for OnceLite, however, the init member would be written
> >> using non-atomic operations, which is what I referred to as the
> >> "unintended way" since I don't believe Andreas intended it to be
> >> modified in that manner; i.e., not through its methods or by
> >> non-atomic operations.
> >> 
> >
> > Ok, the "non-atomic operations" seems to be a distraction for me to see
> > the real problem ;-) Let's clear things out a bit.
> >
> > First of all, data races are not allowed in kernel, but kernel has
> > special rules about data races, namely, a few operation should be
> > treated as "per-byte atomics" so that they will have defined behaviors.
> > This is kinda a gray area, but it's what it is.
> 
> In general, I would assume that a 32 bit rust atomic read racing with
> "per-byte atomic" writes to the field is not great. We would risk
> observing torn writes?
> 

Given that OnceLite only has one byte that can be non-zero, it's fine.
Also if that's a problem, we should just change the memset() part as I
posted [1]. I believe that's a better fix (regardless of using i8 or
i32).

Regards,
Boqun

[1]: https://lore.kernel.org/rust-for-linux/aRPvjQJLdzvxLUpr@tardis.local/

> We could use a u8 atomic in this case?
> 
> 
> Best regards,
> Andreas Hindborg
> 
> 
> 
