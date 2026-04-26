Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909542D73B6
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777189960; cv=none; b=n5g3j4kBbLmvjvkX10zwjmLVuh8o3Gc36pNJPBnLlykfiW6elI1w+CcIPSR4AJE1L6jCeu2xf50Y/z5ILbSu7XauWSG9659IHnoR0otGlX3WrN4lfyPAwmQqSAudPQ/QugytTB8m/a9WDrAkvlcrS+gOx1JHPqv/2Pb6FRgzVU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777189960; c=relaxed/simple;
	bh=DXQYJ4tGTxVmhBiqN0e9ilWp/OFflVfJWy26XX2xBKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmZfBSMpdfoilJS/pCchkFIQTZBorcgSUW+AJyWR8zqoPJkdJBba9FW3LU24CcUP8xdwY6EiDE1v320ll8nRTziXgZCe6uOoqysWcj3Et0WeY9zNVdWWVhlQNoVq5xah6uCIoPAPuaeYpkAw8MgZT3n/eJX83/gQ8UObfsQTg3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTB+Nd3T; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTB+Nd3T"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-362e30526f8so1190463a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 00:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777189959; x=1777794759; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8zTG+Dw6oqSR8kg/1RMP0Ayk7RcQFqZXb8XQS8VS+9A=;
        b=FTB+Nd3THylA89BIaNmnrcb8kMxGC13bZLxdzJ2vnA+V5QRCXRoHfaGGJK+SvTFiEZ
         vVpWks+Pl5znyFf4xlCKLew3038Z6w7ZlIqL0YOaWwpde4nLn8UbKby6Z4Q78DtqxNyP
         BpGqXbPqU6iAKGXlnzkIBH6JcgRHc7YEvpHyP9Yn/CL1RR0JIJ2OQitEPTJ3amhhax7x
         2SqBlyhX5AeJbD3fFoZeYXCyOFqa10qyBuXNSb7izDwj5h4g+xJ2oi8XaTvOLUIHU63m
         mr2MCHxI15LF+BkJ11qe2zcddMGOf3cfiFJx6dFX/WT5SyQqSt8AscLJH4J+iQFngTF7
         I14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777189959; x=1777794759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zTG+Dw6oqSR8kg/1RMP0Ayk7RcQFqZXb8XQS8VS+9A=;
        b=c6sKftv7NuZyN0neZATyIyRkETfZgioJChqeu8mo7jp3gBYEupZkM5hPqbY4Q1chY0
         ekBCLK99TOpz+OEevQAt2LLAuUzdbxOMEZvQLimTofCyjQtuLTGt0OIWHW81gVxJ0B0H
         YVv4EoAd2AWFUe0+eXKUTEqafve+s9ZQ5bvDjlwl7SaTLuOOe6kYirANbwFzZZ+vGMQr
         pPbdfF5PdrAyO/XtNndUwzjb5cUFk9k4C3zsJTPbvEig/MgGQdB4Xj8SslrOiaH03F6d
         YVB+FuuKZgYcf6hMUQP0YWGkhRP7EVar94ABHPovUR/Ak1c3blHebaXX5Oo45JhgPRyL
         dEvg==
X-Forwarded-Encrypted: i=1; AFNElJ9sgz7jvMEU2GkmDwvECcKREIb9Yj+YpbaJUBM+ilXqBAHsqhvr9vVD7WSI8PZR8sesN3LutNGfG6qIq+x30A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCuVe6M/rDy5oXgKAXCScf+9BWpfyg7LcqZsY4lVtCTFqTwroR
	Qgwq/LFQfqeu09uRai1E5ZPWjdkkLHfJ+hzZ1YtcaqmyPGm21sm2cGt9
X-Gm-Gg: AeBDietEUyGtwMdZ0AipR6nllIVE6QvSo/0uF4CZIavvj2bLbvWCEwLkmHngAa48qS5
	RZImjt/2brjWpIjVHLtUHzukUs5at7NYbKRJmyf/Ujly/K1xh+PSH+XO/G0fBd5h2P0zA9jWKYe
	A312Kjdl6U5E3XVNkQv5YeeS0c0395Gs197o9iR31HQI0ASXF5rthKmy+pEmHmpeWyLe7xE8WaB
	oTxxrz+qSBHzjed+Rh49gmWMj3z4yAiDFQ9PRvZ4idhXZJPOEFzBQLFK07Tcwv2lPvhV/MQgU0f
	j2BWwWSOlfgTIPzG/jXedtNc3+0nz56pJ5yGGwrsxQk1UotivW822/ang3atyCnqafrh0/v6s0d
	MfdgYkHxLYt+g8MSPbGs5V3xJEeK5qAGngjSBwERmu43Mi89zm/bzQrNeh4cFSIT1F+fhzXneG7
	ndvKLhaM00AqRgP6TOjUeKd+AUFY1NvATFwq9iGgoZGmXl6qvxuk1b1ravZbBZNFs8IBlSfuRj9
	vO5zeX5kg==
X-Received: by 2002:a17:90b:52cf:b0:35e:577c:c9f with SMTP id 98e67ed59e1d1-361403fb305mr37768192a91.9.1777189958672;
        Sun, 26 Apr 2026 00:52:38 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fba1436sm10396034a91.11.2026.04.26.00.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 00:52:38 -0700 (PDT)
Date: Sun, 26 Apr 2026 13:22:24 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, 
	simona.vetter@ffwll.ch, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <ae3C2gqzoVaovY-h@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-6-mkchauras@gmail.com>
 <DI1E781QPU8F.1C28PL0089NP6@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DI1E781QPU8F.1C28PL0089NP6@garyguo.net>

On Fri, Apr 24, 2026 at 01:43:43PM +0100, Gary Guo wrote:
> On Fri Apr 24, 2026 at 6:47 AM BST, Mukesh Kumar Chaurasiya (IBM) wrote:
> > From: Link Mauve <linkmauve@linkmauve.fr>
> >
> > The core crate currently depends on these two functions for i64/u64/
> > i128/u128/core::time::Duration formatting, but we shouldn’t use that in
> > the kernel so let’s panic if they are ever called.
> >
> > This doesn’t yet fix drm_panic_qr.rs, which also uses __udivdi3 when
> > CONFIG_CC_OPTIMIZE_FOR_SIZE=y, but at least makes the rest of the kernel
> > build on PPC32.
> 
> Can we always build libcore with `-C opt-level=2` even if
> `CONFIG_CC_OPTIMIZE_FOR_SIZE` is specified? It feels like a better fix than
> stubbing things out.
> 
> Best,
> Gary
> 
The issue is not coming from libcore itself. It's the driver that's
causing this.

Regards,
Mukesh
> >
> > Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >  rust/Makefile             | 4 ++++
> >  rust/compiler_builtins.rs | 6 ++++++
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 2a5428a5503d..ee11fba7a03d 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -616,6 +616,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
> >  		__ashrti3 \
> >  		__ashlti3 __lshrti3
> >  endif
> > +ifdef CONFIG_PPC32
> > +	redirect-intrinsics += \
> > +		__udivdi3 __umoddi3
> > +endif
> >  
> >  ifdef CONFIG_MODVERSIONS
> >  cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
> > diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
> > index dd16c1dc899c..fc6b54636dd5 100644
> > --- a/rust/compiler_builtins.rs
> > +++ b/rust/compiler_builtins.rs
> > @@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
> >      __aeabi_uldivmod,
> >  });
> >  
> > +#[cfg(target_arch = "powerpc")]
> > +define_panicking_intrinsics!("`u64` division/modulo should not be used", {
> > +    __udivdi3,
> > +    __umoddi3,
> > +});
> > +
> >  // NOTE: if you are adding a new intrinsic here, you should also add it to
> >  // `redirect-intrinsics` in `rust/Makefile`.
> 
