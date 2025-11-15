Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57508E573
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Nov 2025 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763190098; cv=none; b=gSqk5zChvV9j7qKtU6LYHd1Gi7Dizmdd+JLJJNHCfllc/bFT/ujkQaqJkvWeRCSOHjF+zkP6MNSXW1/7lEgX03+rL6nJVnUQFa6VN1iwTZGdrIUDlPgv77JbkeCy5o5iWbK7fU1YtyawpGylz3DtluHvD+3RolQiOpWtBgQ3zzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763190098; c=relaxed/simple;
	bh=SbGu5s0U4Bi10M0Hl6R7zpufGlx15jAas4z0v08smvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiXl2QVF3uoS/JBIvh7Y5q3J0+2anyKiEx710iIj5KxozpzuqtOBM+m+BiiIvDSWnmDgSSPpdch4dh6KvgteTmfGLpd6RkYKcoo70YaKGT7JKlE7JLIwvTVduJi/mdaYwqPzE/zjL/w68q1NSQ/WAVHVWwbwzE4eiYyF2R1yUUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMUYuBnh; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMUYuBnh"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b21fc25ae1so278345485a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 23:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763190096; x=1763794896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60R684ZsAtZ7eVrMb7l+3D3DvAzvVJ70enIFSdHGaTY=;
        b=JMUYuBnhmHrD81sILDjhmY33LeiSjdP2/ggfvJ6dgVVdGI3ifh0yyGgwqePz+qq1kn
         wAEl7YOX9rHf/cWZtBm7D5Wi9GT6P8UmRHilcAZeiT+Qcfgzc7DFUvq5/pMIB9GowB4l
         HxJou/tcAxeMdL8eiaQp4fGjAQvKm0XdW5gqPXPK68BQDta1o+lxq608angXTqVHMzqO
         KHIl9SYIHZZEE3haYOEppKaghLwXlaymeRXuGI0hpzDTABq73HvulY2WnwhBs021Knxo
         g4+1HlIMtw6EUkHOtJjdJ7NrvNVkmbVmXqLshNZycqzS/cPvi3qthHpOg6FlXyB6BAHf
         sj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763190096; x=1763794896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=60R684ZsAtZ7eVrMb7l+3D3DvAzvVJ70enIFSdHGaTY=;
        b=ork+CmMBjhCt8862zg96V2dA0V2mkXBgmjjiRYywRXCkTXfxBQKQz9VSxIH7AM7jNd
         VrrSMyseGo+yTfrtebyO9XVp+RIBeY/HQbg/tWvn/LvZu4434h0Zog6gpkdDZW0tEGOv
         0LILiVOfS6fZ41FnZxNQBvWuvM30Hi3L8QqYQuzplyGsVZNyh8fw1kTUSrWeDUDYTQ3L
         o3SbOfq5ALu08dF70oLid18OMJpQPigXIAU47m9fzkfKgLKTW6AfqcOfessLo7MwAGrH
         m1KfuM2mu23A0gm/kJzTuLAkClf8o6OE1a0sDVF615kwxrMGa2LEHwiGiT5qFT8Td+bx
         +yhg==
X-Forwarded-Encrypted: i=1; AJvYcCU7gpaRyEWKABCHTdwAVo3fhp6Nmoc5ili5cXft86eapuyd8kXcxptB0GE1A3ctHpDvPaO2BxF+joVcElTeCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh9BUcRCLXXdu7tAMnHy/zPIOludvKkBg1qIbtggwbVXpdl+l2
	/8AfG9uznk35jjou5QJx1SrEfrFMMqc+ysZIvscDfmf8ATVkFFWihtVq
X-Gm-Gg: ASbGnct6ta31TIdXs3dTzx/VVHJICAaiwYYdk4RPTYrL2vih4FX/YsKyAH9wLraq3dk
	ImelJoARLq2kp+esUzaHqkY6X16mWQxiEigNFoMaoXbBmm9hFD0gvlKoIOtQ2YsGfGeASwVfGXT
	hSGs0dK+3gHFtoSeakajBR0+BkhRITiFl0J1xCiSLe5btJzqZ0bw8NuJ9wcUsvujdRdqSXvRHGc
	gEVS5woVwGL+0Q/VjBPgLo/PUYXrC0xXZYsdidEKoR8RFayOjqbtpGpgTN9UAyjajyw5yq1XQMn
	SgdKcPt7RjJ7SCr8vyEbSqiem47yVLexDtEpUExyYv8sDu+CSwuP7gXN56z/0rsUXPbj/ARYovD
	pRXeXsv+nc7NFQjLcMN9BEw0KDCpJviRwQORVcjFyLIxRcpoQ+tW4y3JPaneu7tnnJ7vtwlLb2A
	oSWAQXJfSas5NAb9T1xLfRusSsynq6J+ELEHrHmqlbE/hoMjLqISPYdF7bfwfmBqoO9gWpoTOGr
	/k+v3LkdHewvtQgLNS3I4zHSz3axNtwQ/0J
X-Google-Smtp-Source: AGHT+IFFSQVCzt2jpahqv/W4NyO/PeJMOUNN6uv9/ffvKOzCkEcyIOcRsEW7YE2Dm63XKnksXP5zSg==
X-Received: by 2002:a05:620a:7104:b0:89e:da49:7967 with SMTP id af79cd13be357-8b2c3147e1dmr672437185a.18.1763190096082;
        Fri, 14 Nov 2025 23:01:36 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aee9e9f0sm497689985a.3.2025.11.14.23.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 23:01:35 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0A8F9F4006B;
	Sat, 15 Nov 2025 02:01:35 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 15 Nov 2025 02:01:35 -0500
X-ME-Sender: <xms:TiUYaZQitCaawWmJQRkSLbz2Dlcw-jGNM-C0Jqm2RQ4LxzSBM5uFmQ>
    <xme:TiUYafIwFMv6sVORA9DOcgsbPAiK51LvCn0PmhCoWVMgpAl8sStvcfMaqlQ1Ufq1R
    VE8eTwPuCdGtzVsr4Hv1E9bd7JZX5BrDvIEC-qE3qNv-l2fmLunNg>
X-ME-Received: <xmr:TiUYaTTUZdmWvD3x7Jf1YQzyPFZvMY-GUsZYHyQ_Dx7zXC3k-PnBdoptkVrzlevziRhFGLXINIRmoBs3NlV1_JSERgoJVMgT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvuddvtdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpth
    htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgih
    nhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvg
    grugdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitg
    gvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehp
    rhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:TiUYafImJ0yxax_0GWCAPdZeImSfyA1KukJtnEuFEiqIhEydQxIZjQ>
    <xmx:TiUYae-ghwmNj5nTp0lKtL6LwVCC6XsvjZb4W8WNMk_yNleYh03kbA>
    <xmx:TiUYaeJjEaPA25tYIrM2EC_WbLxuD0n7jjWe5Sq1OJtCBy7Ivszdsw>
    <xmx:TiUYaVGYp7L2RKrzHvMKueivH0yk1RKPgBpucxhFlNQ14Z1QB_Hzug>
    <xmx:TyUYaawTi4BqnxRi8hAnswLXH3wYQJ2O5bhaFWjRh0z74isbnfMGEFbp>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Nov 2025 02:01:34 -0500 (EST)
Date: Fri, 14 Nov 2025 23:01:33 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, peterz@infradead.org,
	will@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1 1/3] rust: sync: Add
 smp_store_release/smp_load_acquire helpers
Message-ID: <aRglTQvGutpP3kE1@tardis.local>
References: <20251115050305.3872412-1-fujita.tomonori@gmail.com>
 <20251115050305.3872412-2-fujita.tomonori@gmail.com>
 <aRgOFGLqkolf4j4T@tardis.local>
 <20251115.152220.488086212368718494.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115.152220.488086212368718494.fujita.tomonori@gmail.com>

On Sat, Nov 15, 2025 at 03:22:20PM +0900, FUJITA Tomonori wrote:
> On Fri, 14 Nov 2025 21:22:28 -0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > On Sat, Nov 15, 2025 at 02:03:03PM +0900, FUJITA Tomonori wrote:
> >> Add smp_store_release/smp_load_acquire helpers to support
> >> store_release/load_acquire for i8/i16.
> >> 
> >> Both are implemented as a C macro and type information is necessary so
> >> the size argument is necessary unlike the C version.
> >> 
> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >> ---
> >>  rust/helpers/barrier.c | 24 ++++++++++++++++++++++++
> >>  1 file changed, 24 insertions(+)
> >> 
> >> diff --git a/rust/helpers/barrier.c b/rust/helpers/barrier.c
> > 
> > Could you just define helpers:
> > 
> > atomic_{i8,i16}_store{,_release}(), atomic_{i8,i16}_load{,_acquire}()
> > 
> > in a separate helper file? (e.g. rust/helpers/atomic_ext.c).
> 
> Of course, I'll.
> 
> 
> > Eventually I will the macro declare_and_impl_atomic_methods!() support
> > customized list of types, but right now a dedicated macro to generate
> > all impls for AtomicBasicOps of i8/i16 is fine.
> 
> Is this comment referring to the second patch?
> 

Yes. 

> Do you mean that I should remove the VolatileOps trait and implement
> AtomicBasicOps for i8/i16 using a dedicated macro like
> impl_only_atomic_load_and_store_ops?

Right, I would want to avoid to use write_volatile() and read_volatile()
directly as atomic operations, but rather we implement
atomic_*_{load,store}() with WRITE_ONCE() and READ_ONCE(), and then Rust
code call them. In this way we keep our kernel memory model bits on the
C side.

Regards,
Boqun
