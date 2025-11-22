Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0D523D7FC
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 03:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763782549; cv=none; b=RZh6FdIi7aVF7BgxQPetprzP4tKXu+iFjafbMEEafNEsJrVDJRgxMzQTJ/5nfXFjAog6ZzoW6Sh7otZnR12L/s5rOjgxbT/7zChInH3d+BoCozEMpsOkcxUB1+LxgHadZTTNSBFqFxJytPgzVq2dACMuvb3paE8StZoo1/o+mL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763782549; c=relaxed/simple;
	bh=B5kQ91yQvSF3kgcWoMjPARGk6eFcPbswpLwglx0rhK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwQe3Lu7uNchftzS8Lxk9wQ4QpxOJZPb3dDQ9Isrr1XGR4RFgY39ZDhgYJ2Z4wOb2IfyDFGJli8B7f6PYJmCSVlWOFVoKKSkA+rge8A/ktI2jmWFXdLEoauDyQVFXEir4rLCGv3UhChjMvs0dODM/8KTNR1VIYHIM6L1KJr3Jo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlPhuC4K; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlPhuC4K"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b2d7c38352so379257385a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 19:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763782547; x=1764387347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKcteihLZKJWkTLMA27RQMtx7kBlICGP8oyxfNV16xA=;
        b=GlPhuC4KAFJaQbxHQqlndJRwomfZWC17rkrytuurl4VyRhTjuKaIXnMq42/GXk/BY7
         7rxTGFeTTlb7g0ZAtIjemULuXKCifeeo6kMfQLnYAWTTh0jPCvAlE72rLydzmAB51f0C
         lfyWxxULTA5J/6CRdlqWTO+iLnmtCofEPhYlFS9jCXMxCW9HP8wS3yWQEkq16Mq+JJiV
         EDkf01Xsm/WhWBhP04+5XVOb1KbhZWb9ytVFHuSL6O1EUvCdNyZpVASCqr+xDIjsTYle
         4QxVydlj61Pm/+vrG6KqhPXP1S0dauZ2SaJjK7Q+TqwjnyDC0FlI9nhYgFgh4bhLsFAx
         GBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763782547; x=1764387347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jKcteihLZKJWkTLMA27RQMtx7kBlICGP8oyxfNV16xA=;
        b=e+A6VlgVRZUNhX5c19fLz/YTF5CbZFWUNleEuvUgvOGd0YhIxCS028K4/gq52yw/cF
         1wrMpe3e5kXa9dWcMUt0pvKTq5infE5QG1KGi6AMj7aUcMi9sIyehsJOTX4lxu8K5Qvr
         maGBPsLmY/4D/C/5E9pwLCZ/S9slN3xZRSuX2w+iuL094zD+/JQ0dyCPsWbmjc0wDshZ
         h4Af+ATMzmMaM/C7Au7aPNmN7Q8Toera2WfJ7y7Y/imLuuRgDV/03W7yiiELGUASqipg
         1N8vY4BioitdWZSga9/d4adRyEKqBd9MDJza7QK8X9spgdxV1vntiNFpjTm6QmbLcbFk
         rZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW79UQRqWsv1D2jnuJodj0CnynLo82VkHS49lt+/l2Pr+ZateoDZPpr9DLH0N2TDaPmFbValjsXcYhtvb8VFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqKc7JD4/3bvt9tjEq1jYEe9Bw6ayosgmQsJzVFQpZgaJkcEkD
	tVWbPZGZMKlCzuVCZD5nbRVKrQ/slqo0h/b7M7qhCSwsq6/UyaO6Uex6
X-Gm-Gg: ASbGncv/fEeqjUG8jnSEs6bUJPEgtKUu3yriCpXHk1R4HAN9+CjaCRu67x64IsDKep4
	MNQSHJQPdUchz8JK2Ubg6DVKEBOv3DILmvFV6bpzAB/nsLDOuqsVmZVS0cXb1FNXtuwXmx95txG
	WS6iE3w1Fj5Stx3aMRpviGw2xTKh5GrwHuUU9f5XQ9RolZI1lVH3Ns7FlRck3+YBD0JmBLIbsSq
	9vkv23ofglerjgPEkH1pPnfM4BhB7gxLZAqY5lknV1znrCu4pwUqoG0YQILOw1BmqN9+gBdKyim
	jMQoPDIeEWdFGB058hmXjD8tmitxOHtQyLavjDcnz4YYKg8Zxlx39Jq3mDQZ6rNmK8ZoYpg7QLR
	alrP4ZyPlNOYOcDjFytQGTydGUJJCTfQr8SMTUlBo/yusXAPNncPgz8TrrnLDywJBaWvvQH601e
	GMG50ht5F4Mgg83dG+eYfvVlEREbsd+6WHe+bAM/8EF/jJCdLWnP7xMeJ6jdF+ZoiGY17bCDBx7
	rUg7DjseDnbgmI=
X-Google-Smtp-Source: AGHT+IFBIpfjoyt0q1w8Vqzk831RHkJ/1JMTzIuFlxWmEdwt79pYpHGGnqIJ/yW6L7eD8uEFixb5ew==
X-Received: by 2002:a05:620a:318b:b0:8a9:eb31:1033 with SMTP id af79cd13be357-8b33bde837cmr780815585a.30.1763782546617;
        Fri, 21 Nov 2025 19:35:46 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295d94b6sm480106285a.36.2025.11.21.19.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 19:35:46 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5E0D3F40079;
	Fri, 21 Nov 2025 22:35:45 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 21 Nov 2025 22:35:45 -0500
X-ME-Sender: <xms:kS8haZi5HOA4TYV9XI9BsYX9Xy_Nmk99RmJIbavmOB054hnXh4Q8xw>
    <xme:kS8hacZ_jHZ-nSwo7gsYgGXNmfRHBXAVwdFrePVzQAQZexLNEEXaaUOjeoYaQ3mNV
    kk1NFZZBU1Yb060vVFirW52Y29ZVl5od0uFKR3zL4Aom60iw--ETw>
X-ME-Received: <xmr:kS8haVEEkq5inJzXCcMejm2OVoIWpH6ILR2yXocJUi2RJWYz-2-3XOfs71MM0OYUOqT3O5lHODGgCsITii1Ms3_vLwDH7Ear>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedujeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:kS8haRYzFH1mNuxpqT4TUi_ZZY04dHzL_HmIL79lbb4QZLsZugVgJg>
    <xmx:kS8hae2lkZ3umLy8SXCyR7fvVcCA_yQpbgoPcg63kYZLyUYqNyDucg>
    <xmx:kS8haRdIoTizdvMQaQPGBa52nKYTn9nKx3ENeONxOTtsNKFO2spcsg>
    <xmx:kS8haYBpXuncJ6adW-jwmVq9xZW8v8cYz2nt27M3LN98UulawaA5yw>
    <xmx:kS8hab2czQ82zSvwEog0azlPMz4c-pF-QQAblR21C1ZLkm3cTOtWZrXQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Nov 2025 22:35:44 -0500 (EST)
Date: Fri, 21 Nov 2025 19:35:43 -0800
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
Message-ID: <aSEvj7tDNLF-8TIy@tardis.local>
References: <20251120214616.14386-1-lyude@redhat.com>
 <4b6ae41e-5cda-41ab-ba4e-628bdf23f917@nvidia.com>
 <aSClxW6jnspFRHMH@tardis.local>
 <49d7b2c0-9794-4997-8bba-78891f27abf0@nvidia.com>
 <aSEiHgI0PIprnIC-@tardis.local>
 <e11bd713-2404-449b-ab63-7d6c0dc47b4b@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e11bd713-2404-449b-ab63-7d6c0dc47b4b@nvidia.com>

On Fri, Nov 21, 2025 at 06:56:28PM -0800, John Hubbard wrote:
> On 11/21/25 6:38 PM, Boqun Feng wrote:
[...]
> > 
> > Last but not least, safe Rust is preferred, but it doesn't mean unsafe
> > code should be avoided completely, if we establish some data that shows
> 
> Perhaps we need to be slightly more precise. I'm not sure if you are
> referring to the usual practice of creating an unsafe block, wrapped
> within a safe Rust function, or something else?
> 

I was referring to providing an unsafe API for core kernel
functionality, for example local_irq_disable(), and then teaching how to
use it correctly.

> > some unsafe code provides better performance and we have clear guideline
> > for the particular scenarios, then it's definitely OK. Hence I don't
> > fully agree your saying "Safe Rust is the whole point of this project",
> > to me understanding how we can utilize the type system and other tools
> > is more of a realistic goal.
> > 
> >> Is 3.6x longer really something we are stuck with? Or is there some other
> >> way forward that could potentially provide higher performance, for Safe
> >> Rust?
> >>
> > 
> > Well by 3.6x longer, you mean ~1.3ns vs ~4.5ns, right? And in real world
> > code, the code in the interrupt disabling critical section would be more
> > than couples of nano seconds, hence the delta will probably be
> > noise-out. But again, yes if 3ns turns out to be a bottleneck in the
> > driver, we are happy to look into, but you need to show the data.
> > 
> 
> So this is what I'm asking about: given that we *already know* that we 
> have a performance drop in the micro-benchmark, is there any reasonable
> approach that avoids this? Or has a less noticeable impact?
> 

Lyude had tried another approach [1], which uses an unsafe public API,
and doesn't work (easily) with CondVar or PREEMPT_RT And that eventually
triggered more discussion about a better API design, and as Thomas
pointed out [2]: "Stop worrying about mostly irrelevant low level
details which are not relevant to the primary audience of rust adoption.
We can worry about them when we replace the scheduler and the low level
interrupt handling code ten years down the road." And I agreed. The
current implementation is actually quite efficient and should even
out-perform the existing API in some cases as I pointed out. More
importantly, it utilizes Rust type system and make it easy to use (or
hard to mis-use).

That being said, if anyone has a better idea, feel free to bring it up.

> I'm asking early (see above: I agree that this is "premature"), because
> we have early data.
> 
> It would be nice to explore now, rather than later, after someone shows
> up with detailed perf data about their use case.
> 
> 

Not sure I fully agree with this, given it's to my knowledge the best
solution at the moment, I feel it's hard to justify the cost of
exploring a better solution without a real usage. But then again, if
anyone has any better idea feel free to bring it up.

[1]: https://lore.kernel.org/rust-for-linux/20240916213025.477225-2-lyude@redhat.com/
[2]: https://lore.kernel.org/rust-for-linux/87iktrahld.ffs@tglx/

Regards,
Boqun

> thanks,
> -- 
> John Hubbard
