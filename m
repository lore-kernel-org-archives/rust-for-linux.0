Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1105218ADD
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 00:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763081845; cv=none; b=Pl+xi4U8vDBfSUP21oa+PXoqQOA05K+KieRGcx624M6POQTOa+mKP6wME0Snn+3Fc0hNvE9NJ0inzfQLflHKjgaO1kwMEqVmPhVW2LfGsuxrfjofyt9l71yQJX5BIXgTowxpSKKyPpa6J5Ez5JOjrqWkLRdwtKmIMncKbVkP2Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763081845; c=relaxed/simple;
	bh=wivaJtD5Izn/tZhYGh/IrBhMUdwvsKBqINevFGZ9sig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPZ4OTL15n5j6E6nCOk6/dr1zXlVm2Zpa1560mzp1ePS3AeVCO2fhTYeMzHi6Y0zzOZThBAgaycUukX/gOJgUFPpV4n0hJbCjR22IXP/jEuKbOZLBNn29i/rMbp2cGN6AMbPUwivB7bjTGHtUPL6OvU9fG+EhWYhLbM7PNdof6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/tKsQJE; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/tKsQJE"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b21fc25ae1so145391085a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 16:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763081841; x=1763686641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5nk4lgRajZgQej6albp/Z/6D8Qv1UUxU8ne17GnikY=;
        b=J/tKsQJEB1PUs6IoADj26/vqY+05nyTvHs+HQyZD+hF5+XXpepc/QaV1QYRXfxcSEE
         +EhjQKvHUbLlpE3PULXkMQs3KedZBgeRXrLaa3pGnY0BmZqC5MavTzkHGqpb1JQkRGDv
         SwOTMQsV+vcrPLv6m5dIoV7Vhv4jSJucvLliqvSLGkTDOOxAxGIpfoPo9sTkuEnD9Toe
         xfdShHnL29H0Yf12a4WL3fiI9M7bPPPGgzJfR7U1wAlhcVVqhO/RF9bGuTTPHim9cWFD
         xTP5wgfRsSeZ6yjRQuxKjk/uzfPNzOq0/JoPXHn2+uaKk7W//zTRUu1NI+PHO+A7bBzw
         p9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763081841; x=1763686641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l5nk4lgRajZgQej6albp/Z/6D8Qv1UUxU8ne17GnikY=;
        b=QYzMEaq8ceqiwssZSeWA+ka4DZ1xNrerpL/Zb+jjLNGXlJunzMJqK+uWNVS/jFXP27
         Nq70flTZNjtJekntElhxvAPFnFN4ldqaOYxpT7VBuBbgyeUo+pgbDvmi/7nFyhNjJv32
         FKWvxfI1yOIEiy8kZghKYkXXRnMrF7Xr3PfdJoIUQLbzrQPc0ZZzGHJR2vEtKpTE4U8A
         S8RrJrfLxzqB1L4ypPDpyQEX5nu67uL+Y0El7/kYTgjEHscfwQ7OXc4am/qeez/rEq5m
         6rXppW3iIPLdgrzpa61cJBZ5zkgSuKtxoq3fljC7PNj4xqu44mx/tAR9FRqiXR7t9CZ1
         EvDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWklGVkE+zK/p6vmLTLAmOxRN4w/6JdTylItFCR7U0NZZXt5zdE8A6Nj4yU6JKNr3zzMxMVadPQqsbhTy1hZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy05t/oXk2Tt6uz+PZ2jIciAAnf8XVqLygBlehKsrATyu/Vy1nl
	vqx73490LiKNNj7uvIwbepcUjQrqRtklSeT4agZmPSylWBpfJZKqQg4/5DXXTA==
X-Gm-Gg: ASbGncv5H4fpf4ThrCRANZgP19/6iAK7TnueOSLcN5QCxYkFtDIW8UXC8koUFdgvu0N
	xV5MNSBRhnv3qkYL9pUpOekhhYwRPliBfKwEPx9ZP9hMFRmDSGxDObqVY6/vreNuaTlccagzs8f
	cTNK0aPffDwMrt4Q4UPIhkBmekQWxEWXmJZtb61Urv7Z0uDeOWB/vTGEcITMuc6dPUkaQW56sS8
	YNF2QgtlaA8hiuoBJNU4R+qTbchQPy3dbO+cKjtvQ12ktD8ONCqLyiUxd/yyxHaC/eRAVjaRt0q
	IlDbj30tfByMhehLNv64ZC8K71W/6vCjvfzOvmB2hNOH6a6JJjVvnvc27zJ8DYdT0RA9GTZpHMy
	PiahYAH1ZKdONg97uadBZcdzEahXFZj/QS4MVv/1ofQlR6AIE4OLyrNG8rCTX9cWHtWLyGnuXNz
	hHpushHK2PRT1XVjUHdTm4vZnp9WhepB38p/VBdGbQDyGWx17M25ZFR3IrBb3I+w9YWsd2Ftj68
	5EeBowz6A3EbBo=
X-Google-Smtp-Source: AGHT+IF1Z7uC7/U+SQGvJK8yd2o9pvyIS7Oi8xDmtb/JHhSyhuQCICLAHAT4ukBzRRa4lkGJrliNBw==
X-Received: by 2002:a05:620a:3184:b0:8a0:2690:a1af with SMTP id af79cd13be357-8b2c314796amr188527885a.13.1763081841380;
        Thu, 13 Nov 2025 16:57:21 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2af062fd9sm236393185a.51.2025.11.13.16.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 16:57:21 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 85658F40068;
	Thu, 13 Nov 2025 19:57:20 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 13 Nov 2025 19:57:20 -0500
X-ME-Sender: <xms:cH4Wadw38HgunPcxTgChmrnnUh7M0ClJQxB79f2aihtFxtlb__eRBQ>
    <xme:cH4WaRqqmF99ho0mAPoYwGaOknUxsNz4EpmU9W2JjhhGaCWPpJ2aFj8N2txMb7dJJ
    vqCVyO9Z0sp19h5sKkAZHSlGBBbXX7WmWVkU6u4d-qMv7DXNYGAdw>
X-ME-Received: <xmr:cH4WaVMGemsMq7zXBwoGhiGS3gr5bkpRwhBYxqe2x_w2cu03fxuO0g3_gHuE9OvbtLJnUMDIQctpZflyjLRef2Thsc7tMBgJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdekgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
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
X-ME-Proxy: <xmx:cH4WadfZsXnxiujN4ahP4UaSN0rhOweYxXwxrSLlz5VS61f4PqLSLg>
    <xmx:cH4WaTW8ownj-ZikosILJLvoXiUD9f81hM3E43uPiRSJjvm_zPa-8g>
    <xmx:cH4WaWDOQ3aSaq5o04FTJXLCD4_P8VR8CneLRZOytxvQkply44Pm3g>
    <xmx:cH4WaW6dMxlKNVDu0q9nXMcnXkS6ZhCcJjnzPIU641KAw6Z_iGDpNQ>
    <xmx:cH4WaV39whw213vX1_ur40w1HhnGL_onpCjxwcD9jCdCvdO2GCpQ5WTH>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 19:57:19 -0500 (EST)
Date: Thu, 13 Nov 2025 16:57:18 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu, jens.korinth.tuta.io@kernel.org
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
Message-ID: <aRZ-bsCDsoLZgglV@tardis.local>
References: <aRWt6Ah8KuBXff8V@google.com>
 <20251113.201844.1009485179863259148.fujita.tomonori@gmail.com>
 <aRXJuUTR1fnWiBQF@google.com>
 <20251114.094730.791355531242483716.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114.094730.791355531242483716.fujita.tomonori@gmail.com>

On Fri, Nov 14, 2025 at 09:47:30AM +0900, FUJITA Tomonori wrote:
[...]
> >> Using u8 as atomic type instead of i32 would require a fair amount of
> >> work, since at the moment only i32 and i64 are supported as atomic
> >> types, right?
> > 
> > Supporting u8 atomics in general is tricky, but I think *specifically*
> > load/store should not be a problem.
> 
> You meant using read_volatile/write_volatile? Since we only need
> "Relaxed" order so something like the following?
> 
> #[repr(transparent)]
> struct AtomicU8(UnsafeCell<u8>);
> 

Please don't. Please make it work with Atomic<T>, also store release and
load acquire should be introduced as well.

Regards,
Boqun

> impl AtomicU8 {
>     #[inline(always)]
>     fn load(&self) -> u8 {
>         unsafe { core::ptr::read_volatile(self.0.get()) }
>     }
> 
>     #[inline(always)]
>     fn store(&self, v: u8) {
>         unsafe { core::ptr::write_volatile(self.0.get(), v) }
>     }
> }
