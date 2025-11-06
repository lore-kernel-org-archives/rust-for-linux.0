Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A6D32E6B6
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439521; cv=none; b=Ng6tve0ROcPbHWH3yw+GP3II5ehCjKZqeUzil84RSv52YsbGKUxfAVt8z6dbG6cAU48PTldCqB0bNven9IYHDexmnQGq4u4ws1aRhLdd92Dv1ZbSaUspoW4Z8RJK90MT6IYL1U7SuWKuCH+dGD5FMVEGlS6m+wUS00qlpCACWYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439521; c=relaxed/simple;
	bh=UuxMFOOL0PRscwZfd1RGFRJLxNQG0h4+H+Kz275LJ8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=no4ExotegAnAZKZQa+jxS9BanW5pM1dx5MP7uBIOXfoPt+L4tAFYN6WArERcPxURCsfdKr074ABZDDZoQwWt/W3AaUf9DKfJpVUwm3c2/VFgakmSkR6Xzqsx1itpOCkJ8745Idnu1X6WXfNeeywLP1HHU+LfRgjlSk3Cs/mvh8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgIgm3ho; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgIgm3ho"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b22efd44d8so115983285a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 06:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762439518; x=1763044318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxNrq8suNe9s0bEoSkvoNDEf9MSK+2HCunOqJCPit14=;
        b=QgIgm3hoR4sQ9CvtxOLE5dLOOn4HbXX1kBL9kJrqI4LF9/aBLt6Bi3RpREeA9iWHp4
         RgQTBug0se6c84w6GJuAXSjkS5nxPTh45ymsY4NxrNiENkEqnnyI96ZRQ2H2DrgXOu7B
         bSQgY7PNXntLfcnpQIt8Ce6QoSPD1xzz6MmvCWWaFF2RhDipq25wId1qqXEmHa4o1vU6
         AZVtY0t0Js2dxOh491IP3j9KKPkulmwfAdhYD09YnCJ3BBsVaX11T8wjvNVb33awkmtK
         QFZ8/QH+qRcmaTAHMtFXaHyXVGGdJ4kwdOsv+q9WyP/pyENPG5gBjOqQ6sP4iq+86rF9
         OAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439518; x=1763044318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxNrq8suNe9s0bEoSkvoNDEf9MSK+2HCunOqJCPit14=;
        b=VZuci51olR/n2r6H0y3j5eqhlnz66hc9iPA4IaJzgdIplRV5OrofV7veYNnp8P6hju
         upEQCkZtUorOZQz0ZEwm9FasVBixzMYzQV7/19EUDNUqftyrsUCMLhyMA0E5CtAXcDd8
         6zeFE7xcwa1RCuoEAa9IWGlxNC/Ako/ELX52iz+pInFwhQt5NFCpKcD/tDJ/i7spa+2O
         A5OuyHdIpqQdh02+LBF4/yiDV5iM/Ev83ttW6C+0lwOXFzcO0xHyP5n4FfEfkLNOZ9Ts
         pzLKUUFB1POwFOTJtK7/Qziu7NkTvfv9tH1UUwv+K9X9ALEAcCp3BEnI1TK1k3/EOD0K
         DfAg==
X-Forwarded-Encrypted: i=1; AJvYcCW2PvziamLiFROG+3e8cM0y066NSb3FDgeZi5Z9qzMYRxKzA4yQ6jGwRruJlnAkL2tMSD8q62+0aFomc64Rfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUoXJNUXvp0v6mIy0lb9pK48JO066eqD9ac7DZdP9eq5XYkzAL
	JvvTmRg+vG1oxnwerC6NZNimSQ89LtCbVhEIC372EoZoX1RbLTPfEawhozB77g==
X-Gm-Gg: ASbGncuM88m15mwAS0cfEvGuysch9Hh0BiXlOmLnwZhZplEfOzMbAcWmvEGjTDMTEgD
	IZKpvlu0y376XFxa5YUjwpvslf2X+8V2Z6Vsf53fIu8E2RzpTNOHIbgK2AnxE4Bt5tBsJ6KqrBm
	Mt8SFLb8zcCAoO+LbZeDGsS237VRjz+mE++NW4Wl386G6o0ZXxDh42bsNzqeJgrw1vjcTGOquEa
	GhdWsHMLh07lUDAIPiUmsGmR2crqKp6cJfQNbLEmKBF1ZsqXmq5sWHixwgANDCb66+Y5UUMj6Pv
	2cqrLUbMruDZw1znEPYLYgDrK13lcqkSWZNNj3EQeRXqDIDzotZ01fIeYQfB7mozGWu+0IS+Vyi
	DGtXg7NyApDzO40orOoeirpYH2XzNbwyYukW20Ouov3CZNO56cqLB4loeN2owNEJKV7EJyJZcLq
	XruPYlHiTgzaCX5DmsD8bKOJmgiWfzfr78/RnRb3S9UKoFAZjQo0LuTOVu0ldZGJ31QN2y4AKZj
	NmiwxKhUmTyb2Q=
X-Google-Smtp-Source: AGHT+IGOHq+KmxY/QX5R86JuE3JwavPmlnYXk23Jp/C53DNJ42zok6q0Jq3R9dafmxdWfIaliB0c4g==
X-Received: by 2002:a05:6214:402:b0:87c:f97:7acf with SMTP id 6a1803df08f44-880711997c7mr101762396d6.62.1762439518548;
        Thu, 06 Nov 2025 06:31:58 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-880829fa459sm20254316d6.47.2025.11.06.06.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:31:58 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 62B12F40068;
	Thu,  6 Nov 2025 09:31:57 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 06 Nov 2025 09:31:57 -0500
X-ME-Sender: <xms:XbEMaY7sxGGxeHWTSvGRUpdMDFxv7OU0cLC1zXDCD-xmzPQ4hBWcrQ>
    <xme:XbEMaSFduoZvaQXKPns1YJsGjOW7L6hm_PSx-f0E81DElsyGPK8olM1k59Q4X7Zcj
    rR5j9Mp9BHw3thX1Er72G_BJw71bpplbKOi3EfyetKBQS0kFNaiGA>
X-ME-Received: <xmr:XbEMaTAP7M768pZbtLgEkanGZiKQ3Qr0MKXkbTLd6tM5aDeFhmdrrmmutIbGpgM9rQMpg1CzNNPsFq38spglGzcLrvTqAcUs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeejtdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgv
    uggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdr
    tghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgh
    grrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:XbEMaXwd4DKHKmnhmZ4pVdCKgFLm9h3f9bIpXFp7bem-_ym_cLMArQ>
    <xmx:XbEMaX45iLHwcLFK6fsNCiyX2ti13_6yyHf4TOBICy6xojWd83j7iA>
    <xmx:XbEMaYyBtDWwAfBS533NOcfm6PcdgDVBrkDdLylUnA0i1AQLKYzEKA>
    <xmx:XbEMabcLGq_wuDd34R0Fvkcwi-95_1wSJdls6imsU8B-Ca29MNg5qw>
    <xmx:XbEMadDRgjA4KB2y-3nRqXgbCJStzcmL3patHP-OARBBMqbENJOKWx4g>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 09:31:56 -0500 (EST)
Date: Thu, 6 Nov 2025 06:31:55 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
Message-ID: <aQyxW_cskrK0Zyxr@tardis.local>
References: <nsSZZk6z9Ia7Gl5JS9LVNDRjc-9eFvtSWyLI4SSjsHNouDkDV-GmXnixMYlIpGHryPfhLr8Z2W_CkWd6D2frYQ==@protonmail.internalid>
 <20251105054731.3194118-1-fujita.tomonori@gmail.com>
 <87pl9w6vs5.fsf@t14s.mail-host-address-is-not-set>
 <20251106.081231.149919562701074305.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106.081231.149919562701074305.fujita.tomonori@gmail.com>

On Thu, Nov 06, 2025 at 08:12:31AM +0900, FUJITA Tomonori wrote:
> On Wed, 05 Nov 2025 21:59:06 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
> 
> > "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> > 
> >> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
> >> pr_*_once macros.
> >>
> >> A proposal for this feature was made in the past [1], but it didn't
> >> reach consensus on the implementation and wasn't merged. After reading
> >> the previous discussions, I implemented it using a different approach.
> >>
> >> In the previous proposal, a structure equivalent to std::sync::Once
> >> was implemented to realize the DO_ONCE_LITE macro. The approach tried
> >> to provide Once-like semantics by using two atomic values. As pointed
> >> out in the previous review comments, I think this approach tries to
> >> provide more functionality than needed, making it unnecessarily
> >> complex. Also, because data structures in the .data..once section can
> >> be cleared at any time (via debugfs clear_warn_once), an
> >> implementation using two atomics wouldn't work correctly.
> >>
> >> Therefore, I decided to drop the idea of emulating Once and took a
> >> minimal approach to implement DO_ONCE_LITE with only one atomic
> >> variable. While it would be possible to implement the feature entirely
> >> as a Rust macro, the functionality that can be implemented as regular
> >> functions has been extracted and implemented as the OnceLite struct
> >> for better code readability.
> >>
> >> Of course, unlike the previous proposal, this uses LKMM atomics.
> > 
> > Please consider if it makes sense to base this on `SetOnce`. It is in
> > linux-next now, but was on list here [1].
> 
> Data placed in the .data..once section can be zero-cleared when a user
> writes to debugfs clear_warn_once. In that case, would such data still
> be considered a valid SetOnce value?
> 

It's still a valid value I believe. In term of data races, Rust and C
have no difference, so if writing to debugfs could cause issues in Rust,
it would cause issues in C as well.

Regards,
Boqun

> Even if it technically represents a valid state, using data structures
> whose zero-cleared state isn't clearly valid, unlike simple integer
> types, doesn't seem like a good idea.
