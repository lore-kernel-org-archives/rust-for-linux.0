Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E65B82D90
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 22:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714428096; cv=none; b=KTOdbgSc/OKC9YJSTlxrN+CJMz4eUqSyWoPZsE2kN9m28dO151zWd/gQ2RdTmR7BvSbNvKVDCWg2VOXRxOIF/DroarZHObrb7D6GBEGxkRnqnJfOgg5tWEDHSsa2mYbTxJAy0v2etzXhETxwlY/TzooYmQuuXkcpjcdIP9r8F/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714428096; c=relaxed/simple;
	bh=D4VKtsVfH0vPxS1PWNUaaT/Ye6KrVQxw6qoXfC4tnVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8yhqU7o9BQgj4v8uoI65GRdgHqVzYrrDXdjplTCZRAiSv+6skGFnsAsoWgDQYeYdomnYCL0YmzmEn0yWtTjI29tFuS4cv5032g6OWZwze4xDbWelHj0APsBA4isIBsUUvvuXjR5ToaERpsAtMpsNG0Ln6NSnwlmv0K5TiTc6jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZD5cGV/u; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZD5cGV/u"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c74b643aebso3014567b6e.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 15:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714428094; x=1715032894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXGV+x7q6zILgsCSmpMEd7uczavhXhPjZKfOubjoGQE=;
        b=ZD5cGV/uRIpBMP4VFSQdn/8MdE/xM435RPjGtGA6OiO4TgrxUf7HHz1yLT/BsLtFFT
         U4sZtRsbfquEiYtOowL82Om4ID9pLEy/9mqcbTOWsmXzmdmea1hXFGos/gx69M6S9y54
         AMQJfjbAA/LuhzQccTRgPhNr1s9nbxXo2Bm8dZVsh1UB679bO/s1ajEuRRMdlIaDTflU
         44D9429iGwS+bwxv62cXI4cknWhzmAVecciTdhD37vOkAyPzFMeL3UynGVOt+9FtOiyG
         iGo1t24HzeSB+hgIiC11f6AJozF3DVOEt8bEBSzSYvkQnRQzQ23SYDzwIaZReM4hRSEO
         N/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714428094; x=1715032894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXGV+x7q6zILgsCSmpMEd7uczavhXhPjZKfOubjoGQE=;
        b=iHF5ipUEy57X24vs004hgnl7/k9AqsQorSWTvA1Yo780tbaLRKpNC53jETIuQzYKDy
         BUXIkjeCvQwgIxZ0Dr3ei+0+xMoEtCMnH7WN+YbInLu0EmmuNngPtlSik6DMYFApoxH0
         QInKKNFqbTt+B9+oA7+6zZmR9zAZsJ+I94ZcJSobj15BDGouyMnMF5HM4X+RXkFfdXNq
         KbUV7J70pITZs304pU2ZVzlSfCo2wfrJcm3A7ySNA2JKIRfHt3qC6M+dwlwQUdxpc8/r
         dXCq13sHtEW9x1WxYY3itGpHjv5+LRGSqbksugT6tMhgmgoNc3R27M0QEPywbL3zIlNT
         sLiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU763Bf6TLnqMr4U5sPU/++51p4jxMm0cLftL2lE0HwvE3TDVwiETSuiXGj99FnLVkhCTE3jOsKeK/Ikgqy+7iRluKhHXyhGMLVy77Cy+I=
X-Gm-Message-State: AOJu0YzcUk6OVcwFdK7+UZwOONddpjtj40MoWgw5RBiEDiJ6zGDG9rCH
	8YEpstjbcSdWtcObtnZcEqUG6PNrLMnbr+sfxyQ3dRJf6RRMlNtb
X-Google-Smtp-Source: AGHT+IEAJ2U5M2ucMfeZiDMvkT/0P+JWDjvf9BLsMuI2IiJ9ai8AqCZt4Agki2qw4jTm+2EWpMpcgQ==
X-Received: by 2002:aca:120b:0:b0:3c8:42f1:4059 with SMTP id 11-20020aca120b000000b003c842f14059mr13121343ois.14.1714428094279;
        Mon, 29 Apr 2024 15:01:34 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id de18-20020ad45852000000b006a0d25c4892sm1033877qvb.65.2024.04.29.15.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 15:01:33 -0700 (PDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 28FEE1200032;
	Mon, 29 Apr 2024 18:01:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Mon, 29 Apr 2024 18:01:33 -0400
X-ME-Sender: <xms:vBgwZjv1biqB9lPAv93p6mmb78_uSTECXhVzCPKVZ0rq6x0LIvUX8Q>
    <xme:vBgwZkeI60VZxMAzm1RWRNLtPAVXFlrMCgLmejShZi4kDMRIuW_YNBdd9Q1vOSYK1
    HO0ZXIjpwpvUkz-Jg>
X-ME-Received: <xmr:vBgwZmwojYzaginKwV1-BOCD9c1hb0sPsFIKGov3R7ExwaCAOukoxM8d0NY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduvddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:vBgwZiOq3tpQss7M4tug2c_85tIvq0xX-uk_V6dNY1Gb44xmKUt_dw>
    <xmx:vBgwZj-nMayeTVzA1ttelXOgMhW5zDvZL_YpS7wgmrUyqPWmTu4TaQ>
    <xmx:vBgwZiVsYT5j2VwDaxvzNGZ5M6dhghZoUsKYJFy6r6fjCvwohsMbVQ>
    <xmx:vBgwZkfbXVG_bVQURjedxWE5h3LrFeyUiC0WHbvt9FuIgvWE3nt0kQ>
    <xmx:vRgwZhf0HLhq9B1mS9Yfs06rH2uKVeCOhPIB42bLVojPwG8W1ALhEjqa>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Apr 2024 18:01:32 -0400 (EDT)
Date: Mon, 29 Apr 2024 15:01:10 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Message-ID: <ZjAYpsFROI9agY_L@boqun-archlinux>
References: <20240429192435.2235-1-dakr@redhat.com>
 <Zi_6aDHO4B_iY9zF@boqun-archlinux>
 <8b68878e-2ddd-4f31-9f82-4abe638bf148@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b68878e-2ddd-4f31-9f82-4abe638bf148@redhat.com>

On Mon, Apr 29, 2024 at 11:01:45PM +0200, Danilo Krummrich wrote:
> On 4/29/24 21:52, Boqun Feng wrote:
> > On Mon, Apr 29, 2024 at 09:24:04PM +0200, Danilo Krummrich wrote:
> > > Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> > > initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> > > passing a dangling pointer (instead of NULL) to krealloc() whenever a
> > > new Vec<T> is created through VecExt<T> extension functions.
> > > 
> > > This only works since it happens that Unique::dangling()'s value (0x1)
> > > falls within the range between 0x0 and ZERO_SIZE_PTR (0x10) and
> > > krealloc() hence treats it the same as a NULL pointer however.
> > > 
> > 
> > Good catch!
> > 
> > > This isn't a case we should rely on, especially since other kernel
> > > allocators are not as tolerant. Instead, pass a real NULL pointer to
> > > krealloc_aligned() if Vec<T>'s capacity is zero.
> > > 
> > > Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
> > 
> > However, since this commit is not upstreamed yet, so it's suject to
> > change, I'd avoid the "Fixes" tag here. Alternatively, Miguel can fold
> > this patch into that commit in his tree.
> 
> I'd be surprised if rust-next wouldn't be fast-forward only, is it? If

Well, I cannot speak for Miguel, but there's no guarantee of that IMO.

> fast-forward only, the commit IDs should be preserved on merge, hence it should
> be fine to keep the "Fixes" tag.
> 
> As for squashing fixes into existing commits, this is something I would generally
> not recommend doing. This would be a non-fast-forward operation and hence break
> potential references to other commits in general (not only "Fixes" tags). Plus,

Yes, but here what you fix is a bug, and generally, if we find a bug in
some commit and that commit is not upstreamed, we should rework that
commit other than introducing another patch that fixes the bug. It'll
provide better bisect and less confusion. It's the same reason that why
we don't allow a patch series to include a bug in the middle.

> it's usually not providing a great motivation for potential contributors.
> 

With proper SoB tags and other tags, I don't see a big difference here,
or I'm missing something subtle?

Regards,
Boqun

> - Danilo
> 
[...]
