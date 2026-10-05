Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D2925B09E
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Oct 2026 04:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791174009; cv=none; b=TWvLQCrBGBlNXceXErtT4bBk8ZqTccfEKOLGZzewTL8twcr+JX7y2MbH3hPxpXXXxgWLPnUwRVahO44myd/ddvvu0EgwZunb+Vmt54867cCBsOzWPPLpWWi+fNxXhraw+KaIFeSVDrx+LVxd/FFhHJ7bP9xZU3/bNWNoBCl0Ulc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791174009; c=relaxed/simple;
	bh=HoMA9XEjkkd65DXJKPcYLGl2KH3SaKVzwVNL3VSg7LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACq9bFYfbA3YimjOp+3er+pi2B6VK1sS1yTuXsGgWhPo9dAtY8wP8lzrz1dOXCUScu/x54p/JaYDH6eQpjz15bLKebwBDNkrW3IziaK/QKUKiZ6GmykNuviCrYOTWltJlmJOQeesSp9IebCSZuYwbVQiU8TR7pq79OXawpl/g9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjBINzSq; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjBINzSq"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so11211645e9.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Oct 2026 21:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791174005; x=1791778805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=znHr15ngoIrnyD0Loh8A8gjvgvi//2QapaxdSU8F3XU=;
        b=rjBINzSqDWzLpbPoliBSwcjAWA2ygu0kAsPCf8pIokS39ABeOf7AG+vPwB48+ldof1
         bVB6sBwMjBTrv2U9OShkJ7QgirhwRPMYYecTDh4iipckMjLP8TOotZekcia38+C+Pq+D
         VDe+nH6VJT5b5Qetrr1SVy114LnKzECd9tXu9XNrBRVaPwcn2wLOCxrBSFbA0mESXVPT
         2s0QMa77W805CZrxkoOTsOdIU//A7Azv5a7ydKsYevPzGRmvZkRRAywcovnGGy+dG9y8
         FkzD4bpnkcsSAlpXTJEn9fb//dq739LgURrW0GLcrBL3Sml6U2kfaTuWBBJ5IPatxHtQ
         GUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791174005; x=1791778805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znHr15ngoIrnyD0Loh8A8gjvgvi//2QapaxdSU8F3XU=;
        b=PfMX6K5YlTVVHUl9u7ask95j1hYV7kMuaneJ+RpDqF0H9o9co0QiCvimxvez4/3Z7s
         ClxhBTwHA08uoZjf55wlSlUUVa/IybvxyLobF2xHhukAI5CujAb4RgWXLnGtBqtInrAw
         GJ2Hib8/D1F3BKHp6irC9XmAiGeWoJ8RLrqJG3T63dtIfTyR0HDckQo1a82mRC5LitYx
         FyXnnHhm1G/LmWHLFOwXzwEtIRqIKpEaX/ldXzrarq1tcfp+IVu1dv/G0k+Sg76Inb6A
         opQdrFcValYQm8fH3uVtLDd+wwKnXQqjUxnmqmDAZAQJxMEtYNJZ+EnhJ40Azc1A2mMJ
         7e6g==
X-Forwarded-Encrypted: i=1; AKwUvBzBdy3jyZQNATu0mWFGWQYK0bQ2GNuyx9AfRYrHDrOBP91bGf6LtDyUQz8kSc2LqvkuZ7911H27/cbvUvEmRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l0ZtdDu5ndT+gfM4WbyLyXTiy3LPX0DVD9aFJ2oU9/DXI70oV+
	z4hHnQBfP5YzeqthPnGdUjOoRBafx/pALgRS+7BdplJPa3mBvAv0seyr
X-Gm-Gg: AYBFou1gsHKFpFDyOtYjiWdNLELU6T+Zdp9+N8mECbl+hKhMx7XVa9fu2HZRv9l3QxY
	QU8QtqcjuJ5q4G00y9RbGzT2zHu6jCppyK1JJNjWdebFX5/xbLRjYxHVhDBe5lqi/34pwdI8mbU
	8sTSMPKASGF7yV6uxm3g9jJzpAhg/CQougLM1XjCi7iA7yKpV9v+jj3D4qQEW0D0dmoENQOZpuE
	9SIH6/x0sMGw7HME1oFwaaDLIeByfkULZUixMKTjk/MxKZK5JetN1N9rHmB9WYD2KJRfPlMzbqf
	O+3MrnaE+vFxxgb8jmDz0CMh0zyjMGh4IOvzPSIXDysK/nGeEQED9PS673PqPHK0tctCoOfO9PQ
	Cr4EcM/2C6NDJgir4KLGdeOUwAuK+s+plgU6XPLBknFeN5BvEvqjD1/+z0uh4EUuHxQjLKtI+up
	3Cd6O+40koPVwmB/4E6awBuQt3vKDiG1IXFrw2uY/oX0mdsBoDdm+v94/EsEA2aYR6CEafptMlB
	Z4LWI/aCyODTaL51zwyolJAb19zBYFGbd1ffPCoisYXJdXzr0HIpRKEF8gEX3caLoYZMqzCQiMh
	2be0LAJMJj+c26+zNHq1jeBvvPWxl2iuA+AmakVEQ7DbnBhpfpbdDTrWIHch111Qrw==
X-Received: by 2002:a05:600c:3e06:b0:4a1:6ad5:257d with SMTP id 5b1f17b1804b1-4a16d3d5c54mr77517745e9.29.1791174005080;
        Sun, 04 Oct 2026 21:20:05 -0700 (PDT)
Received: from MBP-von-Karl (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm355769085e9.8.2026.10.04.21.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:20:04 -0700 (PDT)
Date: Mon, 5 Oct 2026 06:20:01 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Linus Walleij <linusw@kernel.org>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Bradley Morgan <brads@mainlining.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
Message-ID: <asMj2D6_Zx4ZIfrw@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
 <20261003093827.77857-3-kmehltretter@gmail.com>
 <33197b82-3eff-4c87-b370-c677ca31a02a@app.fastmail.com>
 <asEzZ1wOQ_MbgEsk@gmail.com>
 <3436fcef-a052-4261-afb5-677b0bbf28c2@app.fastmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3436fcef-a052-4261-afb5-677b0bbf28c2@app.fastmail.com>

On Sat, Oct 03, 2026 at 10:54:28PM +0100, Arnd Bergmann wrote:
> How do you build ARMv7-A rust code in user space? If the default is
> ARMv6, doesn't that rule out things like thumb2, vfpv3 and sensible
> (inlined) atomics?

With another target, armv7-unknown-linux-gnueabi (soft-float ABI, no
NEON). The kernel never used it. It fits the same scheme

  rust-target-$(CONFIG_CPU_32v7)   :=armv7-unknown-linux-gnueabi
  rust-target-$(CONFIG_CPU_32v6)   :=arm-unknown-linux-gnueabi

A v6K+v7 kernel stays ARMv6 like its C code. My planned v2 has this as
last patch. It changes the Rust code of all ARMv7-only kernels from
ARMv6 to ARMv7.

> In the kernel, we don't normally allow neon code, but it sounds like
> we may need to make rust depend on !CONFIG_THUMB2_KERNEL, as that
> may be problematic when linking with v6 code.

You are right, for modules. Built-in Rust code works on a Thumb-2
kernel (Pi 400 and QEMU). Rust modules do not load

  rust_minimal: section 8 reloc 24 sym 'rust_helper_krealloc_node_align': unsupported interworking call (ARM -> Thumb)

Same on v7.3-rc1. rustc has no Thumb-2 target with the soft-float ABI.
!THUMB2_KERNEL would also remove the built-in case, so v2 leaves it
alone.

I have a first module loader patch instead. bl to a Thumb function
becomes blx, other branches go through a PLT veneer. Rust modules then
load on a Thumb-2 kernel in QEMU. I would send it separately after more
testing. Or do you prefer !(THUMB2_KERNEL && MODULES) for now?

> >   --target=arm-unknown-linux-gnueabi -Ctarget-cpu=arm926ej-s
> 
> Ok, so I guess this is more like -mtune= in clang and gcc?

More like -mcpu. 
It adds features but does not override the +v6 of the target.

> Maybe this should be "+v7-a" instead of "-v6" to allow allow the
> compiler to use all ARMv7-A features instead? It would be surprising
> if they added 32-bit Arm support to Rust without a way to target what
> is in almost every single chip and Linux distro today.

rustc does not know +v7-a. +v7 works but warns about an unstable
feature. The separate target avoids that.

On the CP15 barriers. With the generic target a fence(SeqCst) from
core::sync::atomic becomes

  mcr p15, #0, r0, c7, c10, #5

and with the armv7 target dmb ish. No kernel Rust code does that today,
the Rust objects I looked at have no CP15 access and no swp. But
nothing prevents it.

> I would leave out CPU_V7M as well, it's not worth trying to

It is left out already. HAVE_RUST needs CPU_32v6K, CPU_32v5 or
CPU_32v4T.

Thanks
Karl
