Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE392BD580
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 02:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763779108; cv=none; b=C5eRVro0wR9JlZbus/6oXUzKDLu80AuzjkBK1NDBon0zM6+AcKy1t0Uq8357MzOlOkJ7OXqcCro1hLzX5wirYJH1NXwp8bHU/xw2H80oT6/NXwVvF4sYWvIMu/QSVk09QL7iVBo43rvCOEROB8N92hPc5w6PlA+fA97Mqb6VXK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763779108; c=relaxed/simple;
	bh=/9pGxoQOSo6yifTTOXzcV3rq9RG95Slk4UlblPFaVZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fj39VGc0mc/NX5lWvhXRtnHtdOw/rwUcpkD6YS8N0l+c++yvlphwImc+hs3SyKc8eNj1/VZIF80GJ9UodFrloQnSwx0stGSuBvdeZScTbA44LpnHVYrFItRwKIw3JMQUsCbFEw7ukPXv++LkOSGPeQoz8erMbha+hyn3UFETeOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1VJ0pFU; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1VJ0pFU"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b21fa7b91bso214480785a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 18:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763779106; x=1764383906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/YffgQQAM83adyNsiIHZM/pdE7XYifhgmGvYGNWTac=;
        b=f1VJ0pFUOcpELIYBAsC4TLcYtMi8krxpC/xnpyqb1g5HwL0JnOnOPokWaleNO1Yjq2
         6OMzsKXYeL5EUmYIePZQnMbDV+ZqPsHaImHgq8ztOJeqh16z/7te5oqOCWZbUqyt5rP9
         /VocxWWI6TW4NmQ6Fo0rrDebRYkotqmR46AKngZsdN/i02WPE15c8XXcc5uWbYIycV/L
         wxtyA78UwsAU9tNwZERXLH8je3uW3Kurx2gXk2XYHKBXq2AY584soV7ljsjR9z1EOEtL
         xa8NnoPUYV4P5TSogCDxK/p11uARxxlSP8anJq3IusvjM2sZ2G1EktbIB62UG5nwAd96
         7+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763779106; x=1764383906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f/YffgQQAM83adyNsiIHZM/pdE7XYifhgmGvYGNWTac=;
        b=KcCMycinyZNaU7EZobA6jAY8kou1Q6zmwD59UX3KVAK6xP6pgwTIIF9F5UkRQxnIRp
         P5TKuyMis6mNSwDQhIKKHkoqc0bsjBHNekglEB7ow0s/PjNjBP6fz9qzyMMiN+CnniWZ
         pbv7BKUnmSXdUz9s/yULGcvG89DQPKFUY1fiDrIN/MJ7kX75ltwK9ArRJl1gCcExOOWx
         uVQ6twgTEfZgiIGdxbTFsWgFc7HTmEBMoS0KjV/xwA1H/1eWi3Kt8NkTWGHKIulk3UJt
         RJ2FsV7t0HA8opazRx4Zn8LHhbe7wbnh5r6nNERDi5QgHK/EoieojYFoI8wdPUVwovIq
         Ymjg==
X-Forwarded-Encrypted: i=1; AJvYcCVdw2knun0qOOqJXgSYHcgU7YXQR4vulundaogZFwbzomai99pcI617dkj0jz8z4DjSGED6CnfAYEIZsoRqJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfcCcNEwL/mSxV/1evcgM2q1cHd7h9cVc4hmEQyz70g9zbCMqN
	dSf8E29TEq0NctALnUlHvy42KWqxSPnIzd7OIKmBeIFSB+QbefarbgbL
X-Gm-Gg: ASbGncuP36kwBa5E7zK64LPx/6MRundyby7HjBZ1ZzyFTEwBy0bmqu1apPL47GxF3eH
	eDrpwiIQScv+YW0Stg0oM3qHdj67u0+BIcX3vm2MQ4kq02LZLIiE6GHIl+EomSEQOZdOny89DLL
	+o2sel+2B/bX6RqjLMhp+H0wrACAJfTSapoiKVF/k7aOw4ukAx5UoC9DzgQM4F/emS+6PBkk5Qf
	B0sMkZ0vO29bFJrQG5hSyi5kAZ7tx2Phq7ztRH2/O+ze1p0gEPdh9GYGMgLZ5JoPST+nwAPyvU3
	mpWwGplofNRFUcFWZyLeXYZVV9BgJm3ZAEsCglgkLs+pc+8wKpgsS8od/BeKE5HGw8kiQ9Hhson
	emk58z5n9O9wAXwD8ob3xwTObmZFk2044RhbQdL9I/JrgqwxdE8eAXGDdbnYWssK3T4yfD3UHab
	mXevxFuiiuByZx24FfEKp0DwdtJMN6YgIMXMyGy85htxURvAZJDyYmojb7lM6oSYOtfbHYGyeWI
	ulNTYx3J0V1uOo=
X-Google-Smtp-Source: AGHT+IGxlvyG7eruO2JTba4PIoIo6Ur8MvcCdpV4DoOfSQYXJCWLq/KDjyzgfn+bczv3IbkoHiGNSw==
X-Received: by 2002:a05:620a:1a02:b0:8b2:e9e1:400f with SMTP id af79cd13be357-8b33d213081mr589743485a.4.1763779105655;
        Fri, 21 Nov 2025 18:38:25 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b329537d39sm476622785a.23.2025.11.21.18.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 18:38:25 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 35E0BF4006F;
	Fri, 21 Nov 2025 21:38:24 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 21 Nov 2025 21:38:24 -0500
X-ME-Sender: <xms:ICIhaRP6-5Aafmz8poAnI22l9CWWZ0RCjatBbw2NIPCZr2qynd5VBA>
    <xme:ICIhaRpF5pzBTX-XwY5l3LXvp_qXagrquXW7OkpOLd2VjOVmJBBkjhDEst5zT08YD
    05Jv9lql-orm7Xp7Kfm5jWe8Kp1xxoN5dut4kfwSL9nMYuCczq7Ug>
X-ME-Received: <xmr:ICIhaatedLDQfMy3QW46cccG6NeCYVNAh72LdTA1-B35wo5RvVjGXcP9QHdW3Sh0R8XY8pDcvD2foD-BzL0Xl-tgUl4Nv9Qh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeduieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehjhhhusggsrghrugesnhhvihguihgrrdgtohhmpdhrtghpthhtoheplhihuh
    guvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhig
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhht
    rhhonhhigidruggvpdhrtghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhope
    hgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:ICIhaV4SCEhPsr2WcZtPSDwY5794epeH_lA0tzafhroERGxHTtUirw>
    <xmx:ICIhaTT6pijHYv1CO-T2seWYsNccrtOM28r56fabXFRDI0hxF4tCRg>
    <xmx:ICIhadlNjZLagav8AFQ3hfu5TXqHehT_W6dKK_o56WuP53oxiD7Zwg>
    <xmx:ICIhaaLM-OmV82jWXisom71TuWvytaa1rcoxYqueSA9OzYBzBnxkmQ>
    <xmx:ICIhaYSxT-MJsdb3PcF8hZKKvjRiDLoaclUwqwGO_B1xyCKxMi2g_OGb>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Nov 2025 21:38:23 -0500 (EST)
Date: Fri, 21 Nov 2025 18:38:22 -0800
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
Message-ID: <aSEiHgI0PIprnIC-@tardis.local>
References: <20251120214616.14386-1-lyude@redhat.com>
 <4b6ae41e-5cda-41ab-ba4e-628bdf23f917@nvidia.com>
 <aSClxW6jnspFRHMH@tardis.local>
 <49d7b2c0-9794-4997-8bba-78891f27abf0@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49d7b2c0-9794-4997-8bba-78891f27abf0@nvidia.com>

On Fri, Nov 21, 2025 at 05:09:24PM -0800, John Hubbard wrote:
> On 11/21/25 9:47 AM, Boqun Feng wrote:
> > On Thu, Nov 20, 2025 at 03:16:04PM -0800, John Hubbard wrote:
> >> On 11/20/25 1:45 PM, Lyude Paul wrote:
> >> ...
> >> This is alarming, but is it the final word? In other words, is the Rust
> >> side of this doomed to slower performance forever, or is there some
> >> hope of reaching performance parity with the C part of the kernel?
> >>
> > 
> > Note that local_interrupt API is for safe Rust code, you can always
> > use unsafe local_irq if the interrupt disabling is the performance
> > bottleneck for you. So language-wise there is no difference between Rust
> > and C.
> >
> 
> OK, but there *is* a performance difference between Safe Rust (which is
> the whole point of this project, after all) and C.
> 

Again, this is a premature statement.

First of all, the safe SpinLockIrq API is made to work with other API
like CondVar, there are certain design requirements making it being
implemented in a certain way. In other words, the cost is justified.

Second, one safe API being slow than unsafe code or C doesn't mean Safe
Rust is slow than C in all the cases.

Last but not least, safe Rust is preferred, but it doesn't mean unsafe
code should be avoided completely, if we establish some data that shows
some unsafe code provides better performance and we have clear guideline
for the particular scenarios, then it's definitely OK. Hence I don't
fully agree your saying "Safe Rust is the whole point of this project",
to me understanding how we can utilize the type system and other tools
is more of a realistic goal.

> Is 3.6x longer really something we are stuck with? Or is there some other
> way forward that could potentially provide higher performance, for Safe
> Rust?
> 

Well by 3.6x longer, you mean ~1.3ns vs ~4.5ns, right? And in real world
code, the code in the interrupt disabling critical section would be more
than couples of nano seconds, hence the delta will probably be
noise-out. But again, yes if 3ns turns out to be a bottleneck in the
driver, we are happy to look into, but you need to show the data.

>  
> >> Do we have to start telling the Rust for Linux story this way: "our
> >> new Rust-based drivers are slower, but memory-safer"?
> >>
> > 
> > I would not jump into that conclusion at the moment, because 1) as I
> > mentioned you can always go into unsafe if something begins the
> > bottleneck, and 2) there is always a gap between micro benchmark results
> > and the whole system performance, being slow on one operation doesn't
> > means the whole system will perform observably worse.
> > 
> > Think about a similar thing in C, we recommend people to use existing
> > locks instead of customized synchronization vi atomics in most cases,
> > and technically, locks can be slower compared to a special
> > synchronization based on atomics, but it's more difficult to mess up.
> > 
> 
> Yes yes, I fully understand that micro benchmarks don't always translate
> to a real-world observable effects. But interrupt operations...those can
> be on a hot path. So it's prudent to worry about these.
> 

Note that it's the interrupt *disabling* operations, which means the
code could be otherwise interrupted outside the critical section, so yes
it could still be hot path, but there are more things than 3ns to affect
here.

Also one thing to notice is that

	local_interrupt_disable();
	<some other function>
	local_interrupt_disable();

should be cheaper than

	local_irq_save();
	<some other function>
	local_irq_save();

because the latter will access the interrupt disabling register twice.
So it's really hard to say whether the new API is strictly worse than
the existing ones.

Regards,
Boqun

> 
> thanks,
> -- 
> John Hubbard
> 
