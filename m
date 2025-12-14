Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B9F257AD1
	for <rust-for-linux@vger.kernel.org>; Sun, 14 Dec 2025 21:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765749305; cv=none; b=AZX5c+eGqTQuCfIgW99hTG4g0Xvmag/ESuvcIqWooYgZuvUChfryiUYmNx4sYnJk1d8XX5vNb2uVuXrHnksnmKdvNii+VYBmhec+NlaWhxjT0RWqZff+sgVpALuzlqNEW/S7Zjx2QIZc8d+25qvorAZ75J9X2HS8pSUL1tBoGho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765749305; c=relaxed/simple;
	bh=ThHP8HrQ3anl2lgU7GFEQ0KiIh+Llmc+cK5dFREtg2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BErU8HA0yEqusQ0awaV3RMBGAzLofeDU0hWWsCw2nRsdBlSlniD6pDp8yfQu3GKoia+TzGxaMaN9c4WPz1WnLnYFf8aUZ23M+gMJLqe3RZWlyDB4xo9XNJ3CNeOHmXV5JeMz+nmLmaxrrMMdzD+wBo+PqN0+SMrEzB3BPJs1MWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDsbw6zI; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDsbw6zI"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2ea5a44a9so302845285a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Dec 2025 13:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765749302; x=1766354102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mh98BUdXTQ+JnFzJTglaAAx6huqS69ALgAdefSOWUbQ=;
        b=UDsbw6zIY2rAq6NiqFguhiYygl1usBrqaTkNywSiiDJPxuU0xg0Rxf1VRvDTfqREF/
         7qmc55ANRBISAVSPEuS6Whby6OHDFP6JKknLi4gVLZnBX12qXSKudwG69nersGQs7Xii
         kzVZU1bTsZEtcSZQ8eWBC6rqDe3yqRwSyFuQNc80EpUUB2YW4rIQdyca04z4uw4VUtVi
         ekXxqQ1YWSdbHu8KlgS0RApJWQJdPFU5wIdJ0hhF6J04p04QOP/aZfDPQh/UTmD1VItj
         n3t0iRgOYYpnSVJ6mV2G7NrA3L5BQqrz0AC45O093x30zHh5yLRruhxkqFTL8yIIfMxe
         19uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749302; x=1766354102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mh98BUdXTQ+JnFzJTglaAAx6huqS69ALgAdefSOWUbQ=;
        b=H2jKInP4CHlq7nI8XK9G/HDwOzEw6GsmwYdI79pDMsEKkY3B4llJF246CQ6dhM61AI
         olWfE+Z3lj04xWVEVULtp22wyJw4gQlVZ5WaOOPMyfIiFmxe3WzinNyag6ypnfOi2cZ9
         +97hqDrBF7bfyS1IMOZD+hr+vI6DQKpfJQfqPuRXPG+9dm8t9kjLJZaK+F9mBgqdhl1e
         PubRyxXj5+wrJeqrZ2JsyBGMd5W4T7QqPBnT/5PYcWo6sNtpxagDIAfGUHn5eT3h4epQ
         ZAUOqMoLMRBYrrwfhAUVghYtuPgpJ5TekeXoKUTF1KTznK3blH8hmFO87H4utUJt10uq
         H50g==
X-Forwarded-Encrypted: i=1; AJvYcCV4gfpALgds+HQhk82j1YuLL26NbgeNsV6LI4XiuZSPPMSw1oJIhWV7iKPCsG9vb0E0qKf2DDN8vonk/DdfEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvjJI2MAMep8CCvhWlSedSkWrFuxTYIJL/+EdvcN4TsfPat+Ty
	FXFO+t58zFCzRkOUMeoFSpizhn2uRBkgDuyCjPyFe3ePPR2u1zMXp+vx
X-Gm-Gg: AY/fxX6Lp+rrqZ1H6ceejrQjUEeNeoVwRJJS0/307pEeL5HjYfqTJJi+jJ4e/rn9yIa
	st/RRaNQAu05eJlaLynnZTHKUTauMmgFym07msgQ8qKjFyp3BSZ6h8ffg2T5aOBFMGe05q8M+8m
	7lht7avb+SFmrW5+vCpZpkhDAFL0SkCuSi2wqL+iL7CqiGwBTbg3elhn3oRrCI/tdsZey2nqVBR
	17eRrZnlTyeGET88xn6Ux1wQKAvM/kLLhKNrzp32Uf/jKcbJM6pNIOU8XabGCam+ptuCD5eJxnu
	8mGSSnA3BdoVcEyEHDjcNXlCJOiOQqphEs0a1N3NApADRsMoc8HrFbCVPZepFkXlZkhDrZEYbdi
	TGOT025Yfjtdm+7uXRT0ByO9+dFmNjhxPQTqCIkkpKtsqop90Oi1XzxhVBXIbV1utkcWwFb0kbd
	WCKNPjzLKZxMt+EGk0/UoXZw38YPu+CPrbiR2MhiyHLm+B4qXWDSWiRHXzCHIUAX0PYO1FkZStg
	kF4eDmOfu6dnsQ=
X-Google-Smtp-Source: AGHT+IF4V6S2F03eEM1sSLoXwAh1V4bnSyoE/17Q6rRwGssjIYbgWZcpTXqKgDXpfqzYY9adxnvgnA==
X-Received: by 2002:a05:620a:4116:b0:8b1:5f62:a5d5 with SMTP id af79cd13be357-8bb3a3894e8mr1136668785a.62.1765749301906;
        Sun, 14 Dec 2025 13:55:01 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5c3c73fsm964462585a.31.2025.12.14.13.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:55:01 -0800 (PST)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id A6D08F40082;
	Sun, 14 Dec 2025 16:55:00 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 14 Dec 2025 16:55:00 -0500
X-ME-Sender: <xms:NDI_afYKDL6XOtHqixFvrN7nseZtZcST2I4HkUVJDMEjDwnd39ORHw>
    <xme:NDI_aawuomw8ocVl5QnYWmaw1IlmKj-9BBQ0cb6HUD8sUkuG4zHfbZaVLZ04Di8LX
    U9HdMq_Ly7xcCFukmBeTGKgjBNx3iqR_kIi7_ZKqxE7UfxUAT7TI0c>
X-ME-Received: <xmr:NDI_aWb4R2jFURPrd3hSA5ZTwV_3bVAlMRC9MD4zr_8DK16pnkKCxFNiKHbz1YkOtMXPXetW0j7UDbCkB2ih0_4ALFIzuLNW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefhedtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    udehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonh
    horhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpth
    htohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrtghouhhrsghothes
    nhhvihguihgrrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgt
    phhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtth
    hopegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NDI_aTx8DQmkzbhGHiXSicfwKvxYgxrrMJg3iFm_xZPM8EdFV1VWIA>
    <xmx:NDI_aXFtcjRz-lUnjK30XNplgj8OzQLiTQOCQiKaZ0zGdCReSuVAbA>
    <xmx:NDI_aTxDnyBuBv6Z_oDM3mhwpNHZ8Eah9ClJTrm71uGOvmlQUiSUyw>
    <xmx:NDI_aaONspEfU_x6ROb6rGUZsBVLtIDBKpWljL1yd-oxDWfEflrEMA>
    <xmx:NDI_aZYzNZQqyYpaYnfCXij8G3enZhY64FBLtWuh1TbWZgxTsertnete>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Dec 2025 16:54:59 -0500 (EST)
Date: Mon, 15 Dec 2025 06:54:56 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
	acourbot@nvidia.com, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 0/4] rust: Add i8 and i16 atomic support
Message-ID: <aT8yMKwfCFdP9WH0@tardis-2.local>
References: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211113826.1299077-1-fujita.tomonori@gmail.com>

On Thu, Dec 11, 2025 at 08:38:22PM +0900, FUJITA Tomonori wrote:
> This adds Atomic<i8> and Atomic<i16> support; including
> load/store(Relaxed) and load(Acquire)/store(Release) operations.
> 
> Relaxed operations are implemented in C's READ_ONCE() and
> WRITE_ONCE() macros.
> 
> load(Acquire)/store(Release) use C's smp_load_acquire() and
> smp_store_release() macros. They internally use the appropriate
> architecture-specific instructions.
> 
> v3:
> - Move i8/i16 AtomicImp next to i32/i64 with the comments updated
> - Add a comment about leaving the existing macros untouched
> - Add __rust_helper for helpers
> - Update commit messages about atomic_ext.c instead of atomic.c
> v2: https://lore.kernel.org/rust-for-linux/20251117001035.4068507-1-fujita.tomonori@gmail.com/
> - Implement relaxed operations by using C's READ_ONCE/WRITE_ONCE
> - Rename smp_load_acquire() and smp_store_release() helpers
> - Simplify the macro to generate atomic methods
> v1: https://lore.kernel.org/rust-for-linux/20251115050305.3872412-1-fujita.tomonori@gmail.com/
> 

Queued in:

	https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ rust-sync

Thank you all!

Regards,
Boqun

> FUJITA Tomonori (4):
>   rust: sync: Add i8/i16 atomic_load_acquire/atomic_store_release
>     helpers
>   rust: helpers: Add i8/i16 relaxed atomic helpers
>   rust: sync: atomic: Add i8/i16 load and store support
>   rust: sync: atomic: Add store_release/load_acquire tests
> 
>  rust/helpers/atomic_ext.c            | 44 ++++++++++++++++++
>  rust/helpers/helpers.c               |  1 +
>  rust/kernel/sync/atomic/internal.rs  | 69 ++++++++++++++++++++++++++--
>  rust/kernel/sync/atomic/predefine.rs | 24 +++++++++-
>  4 files changed, 132 insertions(+), 6 deletions(-)
>  create mode 100644 rust/helpers/atomic_ext.c
> 
> 
> base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
> -- 
> 2.43.0
> 
