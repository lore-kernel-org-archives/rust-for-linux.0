Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3047611CA0
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 01:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763083155; cv=none; b=VrQffR5KYPYQgljdgEcSwk9/iHXEualbpPlIHyKsziigEQZHO/FTHFp3qfVomQaqauceeM9lMC3Y9ciaQANVv9ZCQlyRqWeKT5hXU3ASzdXRETqVsvwI0h5UunKmTX0Nb5YQOlzD+oxZIbH+GP8ZRISkeEj2vrGhtpOmJZaUDZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763083155; c=relaxed/simple;
	bh=vhy/Ra/bHpa2/hgcibfddPHaPO9S2EtkSZX+SqLffeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIpE/R72I3+1HTplJCMd3FsXoxOlpF2KhaxVW0hFq97azeIpK+RS/k8x+SiUBuZoeHxgtNjnY4RY+tINQsL7ZiGgngrsaD8xR3gsDtNczJgXDiZ2Q33pg42wd41mbNDNb3dWCMieErA51jMqqxlvRbEc3FzYdPExAab1yy79das=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8F8AA/s; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8F8AA/s"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b2a4b6876fso190536885a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 17:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763083153; x=1763687953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbEjfRKjJ2MX3LeqA0AcmY3sHhPg1QLSEhnVAsH65uE=;
        b=I8F8AA/s7JTbIxvbL6etWUyx/I/wjj4HgWFzsTP/v7CLs2B+O7Zmpr+c12tH4W+gnt
         IV1o8U4xzURCefa2IcKIuus/LyVlEcIiUdSBXjwl6jkSRbDCziysL4DbhdFpg/A8pYFh
         aPT4NQN7ksRWwhlGpJ2iY8uItRtMgnHt5nEq8f8Az58R0dPlChDTK1m1i4wmNW2eZwBo
         uvc98abAJjZaEZyPWyZL+HqVVBWpwDEWB30lRvvBkKeYH0cw2gavfxNVe7QxmBkR71eJ
         4BFIPyHnq7deyim+ctjM0EFRJjZ4allXZrK+flsG81DIbazyNx1NX8OJbvYvwc299fTb
         Dsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763083153; x=1763687953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AbEjfRKjJ2MX3LeqA0AcmY3sHhPg1QLSEhnVAsH65uE=;
        b=e1t5Vrtd30Hyiz5CVydEkDqrVaHiq6W4HrNynyuAy60olS6UAgZI1DVXDRspngAwLu
         zRjnkwMg8JBE8ZtrDko3GjWRwacW9R3Oxjzkdum2OPMTkIOp9C0UFi2LT4trpqi6/R2g
         wTEWGkWhYd3j4R/781Gluwfs4/xuaEa3daeCJrgjaFfhMEveD4YRpR2ADfEc0ayMTH8B
         ZcUsuXEg0Z4m23FbE/1eNPpuUwH3o4J2TlzbxOjunTmg9DwOltUmtu3aVcjdDXpwmz3I
         EfK8HfJApzixvGJxuTyyA1tPWJrjXyb9oCncpqH9JSXjXKZx2Eietm1z5RLXnaRDunVj
         UDHg==
X-Forwarded-Encrypted: i=1; AJvYcCX/oS4oTwXJSkepAHqgNtXxSD3IintpILka33zhSMd7elmGHAdxowFogEm35P0xs1/82huk4aRTmlIWCV7clw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyBiBpKAS/Tyfso9F6UCR+WFTbs14F21j/3Dxel1lQWu1W1fvT
	UKjhJLGjYlu+ULlLvTwk2Zu8/k7AsFeXPCiirH1P7UAoyhV3aKilY7mI
X-Gm-Gg: ASbGnctWSuORieVupdH26Z81ZHu2phj9FNcCmUKJXgv+9i5pGeP4kUjEh9GsiCEPkw0
	8Lns+R9NcaZqJLz4wZKUmDqBKXsPqqouDUAw/9cKeAZ2QX4rKQSzrvnTnCbxqpRaRlM4suarbe3
	BVigk9L0wEb3fcZmCAOQ9OThURXizF9waBbrg9WgeBCD+lRCz0FiOlKv/nS70yfm9SSpdIfncXT
	Rpqb7aNnOiYlGOjhatiYGAnA5HF5io3lUjMD+UFUkDCxwKPazpfdbRk5ZIGKbOFelA+Za7rQUN9
	hZ+HnFtAWXmwgd6yiP07zn1IDRLEz7U9HMK6GSVwcvdKvjh6W/6cTinr+WllgGVl7oC5QOiC2+3
	4Vr3jW+iSEjnZ4KQOlqp7W7ZVMIM4OqRT7QrWpKCN+iF3Q6gS7QDSRqf1IJfY1F7WIN7a0pL/RJ
	L3i1u95Fi7sKnG0ia+p1clny6KettgL8AKTObllo7qsqsPfHcXynjuJN+zGjXXSEdobKC+4ewkG
	ajs/DS+TcHIq8A=
X-Google-Smtp-Source: AGHT+IH/m/YkGhbOaIXHvex6ilHfgxQRZoV248BKTwyv+huJUoplI577SUvMe6BISsRB5nHRYK0nMg==
X-Received: by 2002:a05:620a:191f:b0:8ab:6a36:b487 with SMTP id af79cd13be357-8b2c31c3ecbmr165263585a.72.1763083153060;
        Thu, 13 Nov 2025 17:19:13 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2af06298asm239733885a.56.2025.11.13.17.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 17:19:12 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 391D1F40078;
	Thu, 13 Nov 2025 20:19:12 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 13 Nov 2025 20:19:12 -0500
X-ME-Sender: <xms:kIMWaR_r2JAf_MFRA0r4hdm8q5jWv9PcEQ4BJsX2h-HavGL8qBIuvA>
    <xme:kIMWaRhhX-_ac5369JpJVbkQyNOF1rYT6Ay6tojJmt8KsOXsbeP2CuXRHQPyHdO9Y
    QZDpKj0qn7OfnTnhB8oj3NqivzUeEDWn4tBq8vwu4u5miF3NE_X>
X-ME-Received: <xmr:kIMWaaYgSbe0oxHZoKWL56ah_eGZ-3ZW6I0L2gIpNtk0sr1S9-K6xZMKrvF25kcgsKu-qg2T9IpFVo3ekHp4j6fs5OPaawK_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdekgeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtrodttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeeitdefvefhteeklefgtefhgeelkeefffelvdevhfehueektdevhfettddvteev
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhjvggu
    rgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdr
    tghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgh
    grrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:kIMWae9HLv0O8Jr_0E7Bj-5tAdqScYaztsnBJt0T39Oi5Mi6kdt3Yw>
    <xmx:kIMWaUPxMzpB3W3tK0uaNC9zRZuKj4HJPBeSZVJSZVrYt2claUcViA>
    <xmx:kIMWaTG9oiEt8Vqz1A0ZXn2I9SJSMl1KxQYC47P85EEUhtWejfY5Vg>
    <xmx:kIMWaayhCTk8QsOdwKP-UtEgwy5mv5B5_2ZLFIuEgTzBxg6o8mXi6A>
    <xmx:kIMWacrcVHUVNvoSIBTMtl_Jg8VKOxsktZruwdslnpjFnOFESvUs_A9e>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 20:19:11 -0500 (EST)
Date: Thu, 13 Nov 2025 17:19:10 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu, jens.korinth.tuta.io@kernel.org
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
Message-ID: <aRaDjpYMPJtOfxPM@tardis.local>
References: <aRXJuUTR1fnWiBQF@google.com>
 <20251114.094730.791355531242483716.fujita.tomonori@gmail.com>
 <aRZ-bsCDsoLZgglV@tardis.local>
 <20251114.101208.202243876104759244.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114.101208.202243876104759244.fujita.tomonori@gmail.com>

On Fri, Nov 14, 2025 at 10:12:08AM +0900, FUJITA Tomonori wrote:
> On Thu, 13 Nov 2025 16:57:18 -0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > On Fri, Nov 14, 2025 at 09:47:30AM +0900, FUJITA Tomonori wrote:
> > [...]
> >> >> Using u8 as atomic type instead of i32 would require a fair amount of
> >> >> work, since at the moment only i32 and i64 are supported as atomic
> >> >> types, right?
> >> > 
> >> > Supporting u8 atomics in general is tricky, but I think *specifically*
> >> > load/store should not be a problem.
> >> 
> >> You meant using read_volatile/write_volatile? Since we only need
> >> "Relaxed" order so something like the following?
> >> 
> >> #[repr(transparent)]
> >> struct AtomicU8(UnsafeCell<u8>);
> >> 
> > 
> > Please don't. Please make it work with Atomic<T>, also store release and
> > load acquire should be introduced as well.
> 
> I wanted to confirm what kind of u8 load/store implementation Alice
> has in mind, and whether it would be used only for OnceLite.
> 
> Of course. If we add something like that to kernel/sync, I agree that
> it should be implemented in that way. If not, I'm not sure.
> 

Yeah, I'm afraid that you want to implement something only for OneLite,
and that'll introduce fragments for maintaining.

For Atomic<T>, supporting load/store/xchg/cmpxchg is definitely the
plan, so appreciate if you could help while working on this pr_*_once().

Alternatively, we can start with i32, and improve that later.

Thanks!

Regards,
Boqun
