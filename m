Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0132571A5
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 03:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767755336; cv=none; b=nmON0Ue3EtGXH20wauYBt+DlgaUd9b1aZyKABz8aR46ddOh6NYLu26TQCtORUo7qt56F/SzqgvnfduVi3A6mM8bQ1M4QMQ2z72VWezh09EOw/4WnfIo4tUJLPuBvgy7zjwr/bvBsX1CELIqbc6ayt/gRjNzqdnHslPzOmsv6pwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767755336; c=relaxed/simple;
	bh=H2WSDowZ9Yd/XdfZEyaAlHFGYOxomJFEKMh7vrcocT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGux2KjNACoXCU/utmhLCPF49FC1OvNSzqcW1aBNdCK+e3bP4C0I8UL5WBiYaWrZM7C6vMRcTzcwiSgjxQIfFAgwBzJg5Gk7NII4T3fO/HO2q2kfl+eDO1Thy99V2/yUVcmQrga3Ph+jROiE1PTYpV1MMaAAkTeB5EzJiKa3AjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/y1s/J9; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/y1s/J9"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7f121c00dedso1677019b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 19:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767755334; x=1768360134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yQRPN2bRGk3Fc8VecQayp5kHElaztK+y5PRLikB7fk=;
        b=I/y1s/J9tl8qUclKvCdPRAV3tJ4CLYpP93PYQcyGLGU3mYqfzQUq7bP/0+wZdWFdap
         usjdM3tX97EE0thYS2XoxBqoE8TCnU7O1koz7KQ2e7vhoT4SDnZBaGJOBjiY9t8NXVAC
         x5VBX+kN5eRwcrUrsdMNxWJ2N2bJQzoSinTmNJiWZZra4BgQBRMtWugihhkwZnFf72tx
         guZdNsA3padUrh6NGDU9uJsXNVEZrJz8Xb1ffWgpOFgcJ0fI/LdJQyyu/LlBVj19EH8Q
         47Q93xwRZbmVw8SNhn37UoKkeXlYtpukAZhjzwLneitzTTNDoaB8RhhTCZgYhhZ+iuSH
         HM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767755334; x=1768360134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/yQRPN2bRGk3Fc8VecQayp5kHElaztK+y5PRLikB7fk=;
        b=CeZtFqWsCW7cFGWCRr6eSHbECSUkgnunMF3IMDrubjQNfgzZimNI0sQdZsbyMrxP22
         LdCUxo4v2arKINZDUoF7gjcQe8u9sd82/VN3H+Wx5aW5ICxMoR8monLs0NjIoPt5e9ez
         xAS5p6LIAKU0tMVGkGqVivkjGd6vUjrNyACh4w3TMmFy02Dl082QFr8gnuu3K60LzuY+
         fVUK1Qw3GCmTaBYdihPxYTjU3jX4YYF5qoAlGP3Gonu1r6CbgQiqyXptjTn76G1vyJm9
         fGwxsboi3TGhHEOUiLki7VN4ndQ+kHBQ/sjjgC9j+PKE6RttN3yqZiW38K9ZXXO03slP
         tXIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO2dFB9LJ02IUEncCX6x77qTcfRr+w5StHbYLBQvRfZ6iQPKR05oJJqphoc9/+quGZmOVct7TaR+s0qBw4nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Iy3dz92B7Sw4f6k50zpI8K4eW4hcX2u6BEz9p6oWKRbtMTfk
	CHrSE9sDRLu8inFsi9PZ8el+v3SqpFiZ2WJ/swkhs/bqtZXrYiVXrm9qXaTPfKm3
X-Gm-Gg: AY/fxX6YlHeR9768IecikQomCOBq1CBQaHKWDbtW+wEOmZKpnc/TlpGu0VHgJSHqp3R
	eCugV3C4uM7XpviUgoyzaPQcE11zFJJDWgH8++dgR9+fSuvK0+cyKKp20UIeNRihUwxpNyssk0s
	/vISxXXaMtU1rFkRy/vF+u8uDPZosws6jQrMBnB3O/yzQaaxQnmGyUU7Q3EBF4yZjdyhHwRqU1F
	Zjckqz9GcTStS1iRjCnW/fpOuNDoj3/Pl09PXZXZceiT30vOItka/lmiZTK/U/uaUKP2meqo969
	R8Zq6a1gKZJiF6L/sYFBWq3Y/35c61AhXXM7xnWPWoX2UvPyTKLP0F9mjSy9GWOjOPKpCd0Ve4B
	4QWvcz3DGDyuRrJCBdt0OfupAC7p+ianZbi0TpW4hEo3lwXE209Nkvi4qWgJL6itRqwU4BR02yx
	I3VHv3nKdHwrv+wtGlS3py9iYY19E4JZUZ6xOn5otfLbGl3XkTWHr3k6cz2tXMepurCvhgvF+hF
	+2E9ve2KP2lAfY=
X-Google-Smtp-Source: AGHT+IG5ln7HBmFkYUtgtCJWbHsit4QUg+m7/QlpcPikX3dXSHbBBf5OWyElnQmQUiI/+hz/5+QSXw==
X-Received: by 2002:a05:6214:590f:b0:890:2df9:c6a3 with SMTP id 6a1803df08f44-890842a264bmr12754276d6.50.1767748105800;
        Tue, 06 Jan 2026 17:08:25 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772346f8sm24105326d6.35.2026.01.06.17.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 17:08:25 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 81DA5F40068;
	Tue,  6 Jan 2026 20:08:24 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 06 Jan 2026 20:08:24 -0500
X-ME-Sender: <xms:CLJdad6yFd4A4SYS7HRq3AX_2t4vwARcYtnzkYULI0Q6RZEWrXA5dw>
    <xme:CLJdaW2yxe8cFxXbBevKWnpOTk5okqtJ488BEjNFkIZfsubfPBNLHedM91nuDnCpa
    _Lor5ns-hZIagmtrBODTYqyOYSlUr1AU-VfmEzVPUIMe0_VBC8A8eA>
X-ME-Received: <xmr:CLJdaXgDiFVsHGf2kB7EmEeO7fri4d-JS1CNBfT1yWhPp2V440ReWFp5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddujeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peefvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhhuhgssggrrhgusehnvh
    hiughirgdrtghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtgho
    mhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrrd
    hhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhujhhithgrrdht
    ohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopehlhihuuggvsehrvgguhh
    grthdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhitghhrg
    hrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:CLJdaRj6dhDVq8lxTc8HuDnERZb0ZcrKm75Ob5ByOTBCMMbT-xt8-w>
    <xmx:CLJdaTIi709hg2yhV8aB01YgGZ0-cshTZTMwVvNA6j5bcIDTXjSbWg>
    <xmx:CLJdaRhjE2LrxMqGD0j71yzr6022CSN7H5VH_V8JVg8dgxEh4cPfnw>
    <xmx:CLJdaXRCQvODOvo4irJon2oa1PJOB3MEAv3Bx2i8VY_lhxuGZqT5IQ>
    <xmx:CLJdaWY-ekMv9Tn3KnxmEGKAGEkIvGzwbd-tjpW-Bc2jbiPOwT55pxku>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jan 2026 20:08:23 -0500 (EST)
Date: Wed, 7 Jan 2026 09:08:21 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>, lyude@redhat.com,
	will@kernel.org, peterz@infradead.org, richard.henderson@linaro.org,
	mattst88@gmail.com, linmag7@gmail.com, catalin.marinas@arm.com,
	ojeda@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org,
	tmgross@umich.edu, dakr@kernel.org, mark.rutland@arm.com,
	frederic@kernel.org, tglx@linutronix.de, anna-maria@linutronix.de,
	jstultz@google.com, sboyd@kernel.org, viro@zeniv.linux.org.uk,
	brauner@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of read_volatile
Message-ID: <aV2yBUW7W_dytCUG@tardis-2.local>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231-rwonce-v1-4-702a10b85278@google.com>
 <20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
 <L2dmGLLYJbusZn9axfRubM0hIOSTuny2cW3uyUhOVGvck7lQxTzDe0Xxf8Hw2cLxICT8kdmNAE74e-LV7YrReg==@protonmail.internalid>
 <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
 <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
 <20260106152300.7fec3847.gary@garyguo.net>
 <aV1XxWbXwkdM_AdA@google.com>
 <4f3f87ad-62f0-4557-8371-123a2306f573@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f3f87ad-62f0-4557-8371-123a2306f573@nvidia.com>

On Tue, Jan 06, 2026 at 04:47:35PM -0800, John Hubbard wrote:
> On 1/6/26 10:43 AM, Alice Ryhl wrote:
> > On Tue, Jan 06, 2026 at 03:23:00PM +0000, Gary Guo wrote:
> >> On Tue, 06 Jan 2026 13:37:34 +0100
> >> Andreas Hindborg <a.hindborg@kernel.org> wrote:
> >>
> >>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> >>>>
> >>>> Sorry, of course this should be:
> >>>>
> >>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
> >>>> +{
> >>>> +	return hrtimer_get_expires(timer);
> >>>> +}
> >>>>  
> >>>
> >>> This is a potentially racy read. As far as I recall, we determined that
> >>> using read_once is the proper way to handle the situation.
> >>>
> >>> I do not think it makes a difference that the read is done by C code.
> >>
> >> If that's the case I think the C code should be fixed by inserting the
> >> READ_ONCE?
> > 
> > I maintain my position that if this is what you recommend C code does,
> > it's confusing to not make the same recommendation for Rust abstractions
> > to the same thing.
> > 
> > After all, nothing is stopping you from calling atomic_read() in C too.
> > 
> 
> Hi Alice and everyone!
> 
> I'm having trouble fully understanding the latest reply, so maybe what
> I'm saying is actually what you just said.
> 
> Anyway, we should use READ_ONCE in both the C and Rust code. Relying
> on the compiler for that is no longer OK. We shouldn't be shy about
> fixing the C side (not that I think you have been, so far!).
> 

Agreed on most of it, except that we should be more explicit in Rust,
by using atomic_load[1] instead of READ_ONCE().

[1]: https://lore.kernel.org/rust-for-linux/aV0FxCRzXFrNLZik@tardis-2.local/

Regards,
Boqun

> thanks,
> -- 
> John Hubbard
> 
