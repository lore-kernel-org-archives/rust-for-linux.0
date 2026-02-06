Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989F222F01
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384835; cv=none; b=RxlF6hsfzx7MU1tlncFvEKiy1tnJww5P3U6NaZS0WW1qySu5nccVfNJR0WlP7SoBp5qmJOp5tgZtuh0JXzH2I/L3CHT+Eg2eTKvEm+WgKkNSDzcrzbIZnfDLuH7EaasOfZsin04DPLlks2Sq2ayRy5KXNJcSTyhViYWdWADH9qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384835; c=relaxed/simple;
	bh=xGpaiHCVft5rqL5hPHguU7ANEzc/m51uTVb/9f3EGf0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mhLxJCF4tbU6vJ7KpjWA6qjfkRTLS2ZGam10tYJvmYtO0e/aT01S0AUP5+E6GtOmfnsWarfn3Ho0Gqt15NhU0JKyZUxosZYwgpLLcz11zq1EjW2TNaJGXORWqXJ5tSCZCGaGY51HAsfiZtGr1tQzMz3473YX9f1lktj0zRAfa2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eHEOgp4L; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eHEOgp4L"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48071615686so24164805e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Feb 2026 05:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770384834; x=1770989634; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YwkcPQInn+Mm0bMHzFxwfMcyvkWX24kShIbuI4LJcbw=;
        b=eHEOgp4L3sUxz7dpc++PkhwIEortLe/mnYDbUxvwoqaTe1zLt8bWH5/GTDOLEP5Y6T
         c5dNL3oxLXyBqmZRqc1i5Of0XJKx7at5rok87c9Swu26yyszMX6d4bjzmddVp2jtJeB3
         kGGlP3BgMy5TGVSHwkFuoE82RiAmhY/EYiZP+fwbyXtbeuNH4PgvOjN3Gkxwy6i5+m2E
         0wlQrYRoJgLdbxcmWvGePqJWvcJEi9c+3pQjTxrpY4UG5CG0erz60YDTeROh/3BaSwTZ
         blh5c+svlzPyunRO64kXptRHBui/VftEUWvr2lpTpPusz6V2pzMI7ksfA0zwknTCCQAu
         mQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770384834; x=1770989634;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YwkcPQInn+Mm0bMHzFxwfMcyvkWX24kShIbuI4LJcbw=;
        b=LuFouXy4tpSQeZVKhCA70SKgqTI3w0A8bNNI5mRh7y+b5d6qJ+IUmtQNUoTBFWkJEZ
         u9wdOuJ2bamgaEE2F8pLdfxwX3IK5TH6Tg6XctKNLdks/5tlLnxacwVOQzs9Ht2qpfSo
         VCPUV9o7Vgzq+k3M2ggwvz5Q8+bqEcwEwcM5NeS+EuDvAGN/0my7fe3oF0r5kssBxRTn
         u4anUtET8vRGrprkQPa3MEk9tqMyrRR6CFE8RJ8Hxlab5NIZH2vi8r8PytdzK1777KNP
         c5rUyPGfgmmO5T2lLZdsetDa6H/T1wrZvqjjdH1GBXFp1bchILKAWhKR1dHcOs36BVZG
         3rCg==
X-Forwarded-Encrypted: i=1; AJvYcCX65Sz8tDgGxV2zVNl66C/XOA1HXcn9xnmqPDOHBRnA7xs/LBMeUdcJUPQ7iy2tdgUficBdVdsmugPXatVJwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqYGvzeTabShIBEYLwxi3CPm9qqeW0GGPJwXvhNB79oKRhNmOO
	WPDHVnEwwFeGMHC2Qe3XZxmsHqLPchSSbSXhHk4AoHUwcGIF1xbGXmWGB3hJN9OdsBIF8axV/wz
	7/KSvwxHb9Sry5WeN5A==
X-Received: from wmig16.prod.google.com ([2002:a05:600c:1410:b0:477:aa9e:db24])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f08:b0:480:46c6:bf4b with SMTP id 5b1f17b1804b1-483201dadb6mr42367165e9.5.1770384834177;
 Fri, 06 Feb 2026 05:33:54 -0800 (PST)
Date: Fri, 6 Feb 2026 13:33:53 +0000
In-Reply-To: <2026020616-hardhat-french-4dac@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205224706.91996-2-dakr@kernel.org> <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org> <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org> <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh> <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
 <2026020616-hardhat-french-4dac@gregkh>
Message-ID: <aYXtwXYAELSIoxXE@google.com>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and devres_node_add()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 06, 2026 at 02:22:42PM +0100, Greg KH wrote:
> On Fri, Feb 06, 2026 at 02:16:05PM +0100, Danilo Krummrich wrote:
> > On Fri Feb 6, 2026 at 1:34 PM CET, Greg KH wrote:
> > > That's fine, because the rust driver core code should also be built into
> > > the kernel, not as a module, right?
> > 
> > Yes, but the Rust compiler may still choose to put some of the core code into
> > the module.
> 
> What exactly do you mean by "the module"?
> 
> > Especially with generic types and functions the Rust compiler may move some the
> > generated code for a certain type instance into the module that instanciates the
> > type.
> 
> Ah, that's a mess.  why?  The code lives in the .rs file in the kernel
> core, right?

It might still be inlined into downstream compilation units. Rust has no
equivalent to 'static inline' function in a header file, after all.

> > For instance, even though rust/kernel/devres.rs is *always* built-in, we get the
> > following error when devres_node_init() is not exported when the users of this
> > built-in code are built as module.
> > 
> > 	ERROR: modpost: "devres_node_init" [drivers/pwm/pwm_th1520.ko] undefined!
> > 	ERROR: modpost: "devres_node_init" [drivers/gpu/drm/tyr/tyr.ko] undefined!
> > 	ERROR: modpost: "devres_node_init" [drivers/gpu/nova-core/nova_core.ko] undefined!
> > 	ERROR: modpost: "devres_node_init" [samples/rust/rust_dma.ko] undefined!
> > 	ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_pci.ko] undefined!
> > 	ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_auxiliary.ko] undefined!
> > 	make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> 
> This feels like a compiler bug, how is the compiler reaching into
> devres.rs and sucking out code to put into the module?  Doesn't the
> build/link boundry stay at the .rs boundry?

It's quite intentional.

It used to be the case that only functions marked #[inline] could be
inlined like this, but it was changed so that small functions without
any marker are also eligible for inlining. Now you need #[inline(never)]
to ensure it does not happen.

Note that this analysis only applies to non-generic code. If you call
devres_node_init() from within this function:

impl Devres<T> {
    fn new() -> Self {
        ... devres_node_init() ...
    }
}

then since `new()` is generic over T, it is duplicated for each type T
it is used with (via monomorphisation, like C++ templates). So the
actual `new` function might be instantiated in the crate that uses
Devres<MyDriverType>, and in this case it ends up in the module even
with #[inline(never)].

So you'd need a non-generic Rust function with #[inline(never)] in this
case, and have Devres::<T>::new() call that function.

> > However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not great at all.
> > Hence, we could do something like in [1] instead. I don't know if there are
> > other options that may be better though.
> > 
> > [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org/
> 
> That's a start, but still messy.  There's no compiler options to prevent
> this "lifting" of the code out of devres.rs?  If not, this is not going
> to be the only problem that drivers run into like this in the future.

Because of how monomorphisation, as-is the code actually lives in the
module to begin with.

And not lifting out code causes issues with super small wrapper
functions around C functions too.

Alice
