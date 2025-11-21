Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DED02C158E
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747275; cv=none; b=KAiLVxdZ9mXxy1UKXjy0sT1k/Tz0AwrVs0FF1zFutDP3CdHvsn0A8QxTOvvhFS6dzwvQ9+tNBVRBeYXSXqb/2xf8hhcVxmg/Owth6XfbGZgOcNCQGCepcbhstTp5RTmn2Jn73M4Wtniq8nHOXZ/oJPBJuGIh3dKIVGSes7cZvW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747275; c=relaxed/simple;
	bh=6e/UwWDrkYY4rcwFriN7U3gZO7rE2iKERAumY8yNN0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNtdfoNL354vg/5lUQ5h7O85i/kU1R+qKEcPaYsnaO8uH0MXwE/AqFvQ2D8yIZuqz5Cq5V6K80GjU1PaSGXloSB4lCH5prmiNGhzxH+fI0RXPmbSbjEMP6XfiK+pHMI1/eliXq31hth9mbMGYBxa/pQI8U8fNKbDvVH65jebxto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yyhvz04u; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yyhvz04u"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8823e39c581so33233016d6.3
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 09:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763747273; x=1764352073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qfpp2UWop0AGuC9XzBRWqbFMhIKY/BIXGgpLtosV1TE=;
        b=Yyhvz04u6Qe0h/+oL1aVuEmASiZejFJLyQjRCAwcnpUQjdoY9YQy4iJTlWd/MKwwZQ
         4sg7iJF6iqTs07OM1SKAlXNMCny+rkV8F0CbwbiNwlA/Olo22LwmQ8cmHXLtav8qngy6
         DQTqAY0drFSr+xduQoCiA5UYXmRQa1rRJJfxoRCgHWfKbs6MS2u/h++h+tHQtWM1YgBO
         SIVYya73jDRY7rk1FqGmbIQVWF5EPjn+UQT7fMmRcEf/H3Q5zfyQ340FzavWdOrxjgcv
         i62TdoxJM0kS6MRC//2h7JU7YpnlahsOO3iMBT0w5wbUiEMuHuWxqpBiH1aQVrPM2ge2
         0UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763747273; x=1764352073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qfpp2UWop0AGuC9XzBRWqbFMhIKY/BIXGgpLtosV1TE=;
        b=SGIcJDgsKbLFXWkVN/MgJ7qlmN98Znad6xS7jmmxs38729hXD+wC0wyPybvVWLtlOm
         G6J0xGX3NynGX0SzaUZovlx6wnJw4j3yUXVc21EF7YJ9CgZw365q9My2BCiiDthGv1gY
         +zb69TsdWn9uPPf2o1P0pJDgkaNW+oAXmzpNiOjwAMAGhHdnHtoXyu7p/AMdRPeOEyjY
         4LXpfE35A5No0njSXQxXbADCiZvfkavBVzeGH21RtolsW6dziHRld77YQQtY4bI6ZiRR
         MgoR3dGldXYCWQAROVebKc8nu5FYiPCQ1MS1TBssCGygOpRZBdAlDbZ4CUhQ/hKHTkop
         iQLg==
X-Forwarded-Encrypted: i=1; AJvYcCWdKk1Yzf8sItXbNHWmop0SqUkJ1dgFb9by4bCnMHQNdwJEa2okhR6UTHib911Pcf4DOp2Xc5MibBAzjAZxEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEi719WrNk1gddOaoOXRGIG9VnU8ik+lv5Gl1JvI/lh9PHRt7t
	34DSOg0aZdWwAhtW7fxXz7LmVi8SOBbXf11F/rS1/AilEuL+XLVErxFC
X-Gm-Gg: ASbGncv0Zyu7v8Q5lvb/5qvjAJIXcfNmDh2uGTtTk7z1tEwGSxExwJCr4ruJzEGe9hk
	CXI8BIfiP5Pf4NdeYklII0Z+BbHYQVKh6uJZzwOjI8B0oDRumMBLh2C2mMIq6vYZwQDZJuFiNku
	B18rUsmrydNQh0nLasG/nllEIoeGL6pli2eh91VEJDUXqhMHFZbQmJ4O6H54Wh2pYaJMXf33FgG
	FjEX6Qvky2C903eFXYEXwdBChW33BCE0IXEza5yQXIsrzv4Q3X89qNBgpiK5f/BRIBjWi/N8n0T
	BbkMm1Lwi/BEDS8nA6wkxrRMJTUKTHSuxmHKMDuWRAkovHJnVYPJtC26YuaWiqiTHeA6+TkwixW
	lsNyuOcs8patquy7WWd+5osq8XB7Z7Bc7mmKUwiZgK12LBd2Qo+LI1W6Mgx2dApG5Tek/4SFpyI
	cKtrUX9tn+PbC/X2Uei4Bf2PI9P1P7UiZ/SHkz3xMG309Hh1cYWVPUucCrd/87Bzm8S+Tc/N2m6
	RibxmCUxsyxzhc=
X-Google-Smtp-Source: AGHT+IGTGzyylYtE/+GD3lyq/A7F5Zl2dQaZnS82McCJDJvMOCd+WqcaRUtSyVWJnj2ALgFUeXxU9A==
X-Received: by 2002:a05:6214:3f93:b0:880:46b6:fe3b with SMTP id 6a1803df08f44-8847c536770mr48750776d6.53.1763747273005;
        Fri, 21 Nov 2025 09:47:53 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e446458sm42502526d6.12.2025.11.21.09.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:47:52 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9C8B5F40084;
	Fri, 21 Nov 2025 12:47:51 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 21 Nov 2025 12:47:51 -0500
X-ME-Sender: <xms:x6UgaYNYLVH8C7WwQ_A2I5USCZcbVsM1SsHUr5xcAF-7YraNS9XQVw>
    <xme:x6UgadVLC9QuPxHaZZSYFGAUpePkoTbsVYeJ9H68lBpJ1fHVHLpl44tpNp-JQKA2k
    ZvjDyzxllhGOy1pqRXVvvdiPKXyl6UIE0TMNjx_gV9VuWjw1wtjGA8>
X-ME-Received: <xmr:x6UgabRguIi1mDsO4tAOauZrrVX5RbXv3PSZE0O-WAfffxRhi2MCM2-xljEgW1rnAI67_17aQYBnRzWDI3U0N0-ex6eoV1Lp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedtiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedvuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhhuhgssggrrhgusehnvh
    hiughirgdrtghomhdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgt
    phhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhope
    gurghnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthho
    pehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnoh
    hrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:x6UgaT17rtuuKOZPaJmxUbKhXCrP_vNGG18Hk5GlaUQZzeozBWT7ZQ>
    <xmx:x6UgaYhoCdgmH2054Sp-bSTBl3cD4gPTFH0tQngyfNLZSZPWsBTkFQ>
    <xmx:x6UgaRZmWofblwniF2QkuK705hUhB5yET07B8qbE2hwYnQng9-fWPg>
    <xmx:x6UgaRNJN4jlzNp2LsPXS8LJxPMWxEH8vI_xkZpBlsAXNQR2FwrbEA>
    <xmx:x6UgaVTghiA1afqKriofoMzECearjeT8Hjtahwk2cEjG-_Dc1pqzlTHQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Nov 2025 12:47:50 -0500 (EST)
Date: Fri, 21 Nov 2025 09:47:49 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v14 00/16] Refcounted interrupts, SpinLockIrq for rust
Message-ID: <aSClxW6jnspFRHMH@tardis.local>
References: <20251120214616.14386-1-lyude@redhat.com>
 <4b6ae41e-5cda-41ab-ba4e-628bdf23f917@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b6ae41e-5cda-41ab-ba4e-628bdf23f917@nvidia.com>

On Thu, Nov 20, 2025 at 03:16:04PM -0800, John Hubbard wrote:
> On 11/20/25 1:45 PM, Lyude Paul wrote:
> ...
> >   this new interface is indeed possible, more on this below.
> > * Also thank to Joel, we also now have actual benchmarks for how this
> >   affects performance:
> >   https://lore.kernel.org/rust-for-linux/20250619175335.2905836-1-joelagnelf@nvidia.com/
> > * Also some small changes to the kunit test I added, mainly just making
> >   sure I don't forget to include a MODULE_DESCRIPTION or MODULE_LICENSE.
> 
> Hi,
> 
> The above link says that local_interrupt takes 3.6x as as as local_irq.
> 
> This is alarming, but is it the final word? In other words, is the Rust
> side of this doomed to slower performance forever, or is there some
> hope of reaching performance parity with the C part of the kernel?
> 

Note that local_interrupt API is for safe Rust code, you can always
use unsafe local_irq if the interrupt disabling is the performance
bottleneck for you. So language-wise there is no difference between Rust
and C.

> Do we have to start telling the Rust for Linux story this way: "our
> new Rust-based drivers are slower, but memory-safer"?
> 

I would not jump into that conclusion at the moment, because 1) as I
mentioned you can always go into unsafe if something begins the
bottleneck, and 2) there is always a gap between micro benchmark results
and the whole system performance, being slow on one operation doesn't
means the whole system will perform observably worse.

Think about a similar thing in C, we recommend people to use existing
locks instead of customized synchronization vi atomics in most cases,
and technically, locks can be slower compared to a special
synchronization based on atomics, but it's more difficult to mess up.

Regards,
Boqun

> I'm not able to deduce the answer from a quick scan through the patches
> and the cover letter.
> 
> thanks,
> -- 
> John Hubbard
> 
