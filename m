Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B55C1B4244
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 04:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763785448; cv=none; b=nyNQsdJEAG4uMCxinaEGYtI5CEynWvEu7yjGyV+yV3ik3UPuR8Yp6dggMEN5dLq5ZnLHFoWFWwZcVJ4ElW9dt4bwudzoQ7yecdhSai6M9fpSVwH7Cr7sZgQvnBNZoLnky94mP4p3JEfHoSaY2BJ7UM1ZZWQYT6/K1LSY/HGP/+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763785448; c=relaxed/simple;
	bh=N5RP3bred3sdAqJDqfiZFzoYUbuhlBeW05xMJd2QVzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8sVLwf9ZYs8OgPD+KoeIMqLJnmnidiqZghJvL7sSPRqBH8AD1UyvnuU9zoeK1n5Yrn6SH03qvMCHBN9Qobvl7Qi5k5J7NaP5ngiy96ZtPJEE1Wag3pb4Wen4x+vTAIVxd0LKhZEHYcOZqXZlOKFM0Iyp8OyUjqGGKsKCGGcnjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFhCRedS; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFhCRedS"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2da83f721so287967685a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 20:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763785445; x=1764390245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3s14mNWZwuKPyPqPx0E+k1M/s8ZsLElwruHJRbQVGI=;
        b=CFhCRedSuEQN2I2nEYW6bPrz+OoZ++E4LnzsFkZkhMOM1d7M0zzU8tA2STnTKinqe5
         DqFT8S1UYIZHOQDihPP6JPbKRUj5hqf0XFRl2nvF8ABBEgJ2wW/OTFg40RIjRBiDdAKS
         ATQh6sLiMl00Ch/Q4FDpUDtt4uv7X/jCY5SGYBVEwrJjMbm4MjWRPB0W6MaRTAUWIV4U
         JUJl4ucVX3fvcD6Omht7CeFTC+5dk4ZliE+YoaHhSbGSXXK7XqTBCxxH2+85H4dcVQf8
         pQ+4mU3f8UJMMw6AOQJUefi7QZx9b8lI8j9+VIJjk1oCnKM+zWMuIejuTl+pCfYVHrlr
         vvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763785445; x=1764390245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n3s14mNWZwuKPyPqPx0E+k1M/s8ZsLElwruHJRbQVGI=;
        b=J8pX36xREOcWTaMHZe/zHwm5SUHCjAQ1wB+hNxTUjmcJUfLnonYE1kODPvWojJwatW
         CttKTFzZc6hbgUfuSzC9LhQKRc7s2a3Aip3i9W6vKaqKgFzVPXlul702bodvVpd4dVNA
         0cYD/1t6P0oCsOxJHuI22Bk6zGJXZrbi034aaNtpkNnOaNiwKoputfEG2iKKh8ZRNwaU
         mGR+0qVMXkliNMjYZoNeVxTPs0MnSrwJJj7babDpQSt8Xhx5fxHx0P/pil3CiH9kNEjb
         QrGKGIzYJDCVCnbUzJnBxP0J6f4zRMmTukZAANDV4RZqiD4wa+DGcRd9pFTf86wDfgtD
         wczA==
X-Forwarded-Encrypted: i=1; AJvYcCXmR3as/qE9boU2ESwUZS0rkZnHKRQ1tjbI8kCl6nE0tgzfhaDqVyeJe2aXPzLaDs7LB/DEKkf6lee04MgdwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9UbeCOh5x1Y8l48RXmVqUTQOpr6iJ4G+Cj1pB1hX2kBbCHNbB
	ZapmAZKom2W288fumP+tRFnSb+Pkgj0ZiHgZSaku7mD+PTwpocYRaqpx
X-Gm-Gg: ASbGncuC4eHj3V9AxWEYVE9lBPPQmniY5BAjPrss+wzOQymTjrn76QRvPx+bDDmQGfd
	KNu5ycfkI4RU9IgfTL4959V1S/b0TUT/kf3opeVldzlJ3H5jpdCfAS8WC0wBSz838d1u0jRPO38
	rkctBiWrpflfEDVW+HSTpL3rdCHj5sjO6sGX7Igo/4RZ3temaxVGg2ZU9MUT9gCqs/dghj+YJWl
	cvAmNhPJs3Qu9FyjaBtlJ8MUtAeZVv8Erczrd0QpXv/jMLA4+dpyrxa9U4ZXiDi7PAoSh+BzJ4/
	Sk33b/dP2gXxyl522K7s5omGDhUc8QZsy+mgMKgH5jH2AKWFpJf8gxrEVIu3PBgSolCcm7ydfid
	mPKm1MtJgUQ3roAJF4BV8bsUHCj5EvLoPCI+Qo2w5dz0zCIzbIKcOESfRQZkI5seS9kVHuIDrA6
	XcWoT4azxl68ovBL93ZGgXv3B7zbJDuF22D9rVfSN1kwHRrtE1LEPSVrLvMW4y8FjTvFQaWhmnW
	SyfhkXqxTiUy2A=
X-Google-Smtp-Source: AGHT+IEG1Y2EfTEVyLDWxPcebcxb6CXAP99WbvuYfGh3AWdN9j8KHFaEh2p5YHTZP+2bw9HDHfonSA==
X-Received: by 2002:a05:620a:471e:b0:8b2:9b48:605b with SMTP id af79cd13be357-8b33bc43041mr669406085a.6.1763785445451;
        Fri, 21 Nov 2025 20:24:05 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db58fsm492378485a.37.2025.11.21.20.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 20:24:04 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 67E1CF40075;
	Fri, 21 Nov 2025 23:24:04 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 21 Nov 2025 23:24:04 -0500
X-ME-Sender: <xms:5DohaSBGSRaLLPcoOjtBM1KoFZNHCt0Z26OgHUCqibeBfABrqoyRvg>
    <xme:5Dohaa6FJguK4Z4Ujf2Y4HO56hDxfLhXTiVnkfgC9SSdt2qh5gD-rGDA14C6Lkwwl
    _9MWR7EjvGruzFZ6dZPB-8pQOL_jjmqsp0HkTtvBAEcUrJthrZDpQ>
X-ME-Received: <xmr:5DohaRn4VPeZaVwqbUBJboctmKVtnKhO7-eijE9j_UqyvS974svbJLMYYf64w1pw5a0xXnsizQmckEutp66TAdNZTdjbdDRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedukeejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:5DohaT6ve8uP1N2G3tO_2Z4lu4oPizL1nfek2fEPEY8b_jcTHo5BQQ>
    <xmx:5DohafVyDR6KS0xxX1oJbq1l-QU9Pn3Cqk0nVFTKffwyEWmHXHu8bw>
    <xmx:5DohaX_E7BpELZr4h2zL54FpzzjaItqrFt_pK50gdpXrJnJ8MIQGGQ>
    <xmx:5DohacjRJ_XCJvFrZoWJVJt9pC9Rz_tzRZL5eg4zg9_IHw01TdRvRA>
    <xmx:5DohaWWzn5rpxMXdYC6zNUzYpJWH9yw6luhKlwCFSiJyWHglQS1iE0MW>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Nov 2025 23:24:03 -0500 (EST)
Date: Fri, 21 Nov 2025 20:24:02 -0800
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
Message-ID: <aSE64jwpOZQyVl7Q@tardis.local>
References: <20251120214616.14386-1-lyude@redhat.com>
 <4b6ae41e-5cda-41ab-ba4e-628bdf23f917@nvidia.com>
 <aSClxW6jnspFRHMH@tardis.local>
 <49d7b2c0-9794-4997-8bba-78891f27abf0@nvidia.com>
 <aSEiHgI0PIprnIC-@tardis.local>
 <e11bd713-2404-449b-ab63-7d6c0dc47b4b@nvidia.com>
 <aSEvj7tDNLF-8TIy@tardis.local>
 <b6c7eaeb-34a3-4927-b4d6-70aab3ce1c46@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6c7eaeb-34a3-4927-b4d6-70aab3ce1c46@nvidia.com>

On Fri, Nov 21, 2025 at 08:14:59PM -0800, John Hubbard wrote:
[...]
> > 
> > Lyude had tried another approach [1], which uses an unsafe public API,
> > and doesn't work (easily) with CondVar or PREEMPT_RT And that eventually
> > triggered more discussion about a better API design, and as Thomas
> > pointed out [2]: "Stop worrying about mostly irrelevant low level
> > details which are not relevant to the primary audience of rust adoption.
> > We can worry about them when we replace the scheduler and the low level
> > interrupt handling code ten years down the road." And I agreed. The
> > current implementation is actually quite efficient and should even
> > out-perform the existing API in some cases as I pointed out. More
> > importantly, it utilizes Rust type system and make it easy to use (or
> > hard to mis-use).
> > 
> > That being said, if anyone has a better idea, feel free to bring it up.
> > 
> > > I'm asking early (see above: I agree that this is "premature"), because
> > > we have early data.
> > > 
> > > It would be nice to explore now, rather than later, after someone shows
> > > up with detailed perf data about their use case.
> > > 
> > > 
> > 
> > Not sure I fully agree with this, given it's to my knowledge the best
> > solution at the moment, I feel it's hard to justify the cost of
> > exploring a better solution without a real usage. But then again, if
> > anyone has any better idea feel free to bring it up.
> > 
> > [1]: https://lore.kernel.org/rust-for-linux/20240916213025.477225-2-lyude@redhat.com/
> > [2]: https://lore.kernel.org/rust-for-linux/87iktrahld.ffs@tglx/
> > 
> 
> Thanks for this context, I hadn't followed the earlier discussions,
> and when looking at this v14, it seemed to gloss over the performance
> implications (they were linked to, but not discussed).
> 

I could have provided this earlier ;-)

> I won't further harass you all about this, let's see how it goes. :)
> 
> Optionally, it might be helpful to include some top-level notes
> that justify the choices made so far.
> 

Sure, I will keep a note on that when applying the series. Thank you!

Regards,
Boqun

> thanks,
> -- 
> John Hubbard
> 
