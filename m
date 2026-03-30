Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DB220B22
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862661; cv=none; b=tN6J6LUD/E3LOg3Sabbd4h+BiwpxkjMAw6zVAilWzM/TcAHAm/rHGx+Tov2O8zjqvG8aoVD7MBX56uUOC1dqNrkI2sHJjQZdl3RnXY9PYub5A6aoKRgfn9xdOX9br5IwPSaNmRi8r3WG7IK7WS5XjbGJjJLJQINsZRk5nBJPwMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862661; c=relaxed/simple;
	bh=N1Voz5YOkyKcwb7zgvA7iOk8OtRR+yOjRg69l+znr3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqvfQqhvbGw4xLpNAQbh6jWuHFWph/WiTg9qzJbRcn5Jn0CRBA3SQTp2AMg/FLckZpy2rJoa//sYiPpHk5FETEQl+bUxaNi0MtSeu6miS+6jQXrxGnK1oJJuWFmZ7L6QenR4jccyzueJE+P3uBwZ8XVHI4ahh8foDsgICnKsVNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFKxzk9B; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFKxzk9B"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82bae83318bso1947994b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 02:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774862658; x=1775467458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VejqlhjlbI/gT949Cn5NLzomruuFcFBXo7MUfzbOCSM=;
        b=bFKxzk9BSQ3nFJ3nk9rRYKa1Jk8QtRNwXKVBdtmc8XnfQKk9K+/cAMn/Pe2IeFCAPi
         W1J/nn1lMsvLhfkIu57EEB4NCmI1QgZAOUu650ksCF4yeavv+IbyfUZcGzdaYw6EGtWp
         uwa4pRCwyDgJK2UGWuEUj0/97ROyN/oH2QAV+2j9GsAfZl37emHgFnr+C8AIlTSWm6x+
         rbg7zxWE3mrquVcKyolPIhQuKKx8q5KT68JOLK/F9J8xsAyfaYiii30L0AI/RDmcjx7z
         ApbH4L02mL+k1sQLF3mYY92k0r168+19z/b0FuzxIgiisDY/ibBmgEVeuke2x2ReuOb4
         r52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862658; x=1775467458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VejqlhjlbI/gT949Cn5NLzomruuFcFBXo7MUfzbOCSM=;
        b=NWGFkzR9qAhil1/LVig8bRKWjBp2DBXPE0DNS+Obe4GZmWCielNylMnC15tbJFDbwS
         eyNVLtKxQV2QpwXy+eCvHkjBrRBhKD5LMMQrV2pG5oTr3N22G563x+rEdIOZuuZLlYj2
         6zPhq2294+9VfyVEkw5fsaaM8wurpyCh2SUrQDRZS4k6l8/EX2DI6CEi638MrTUpAmUs
         zEhL/Sbxq1uP2ghRKfMznoUBZnTOCHNQfF+TVnXD9Fh94ag81RjqLL2UZBlfU33El+KX
         UsmDQUwqjCBHWfiE2N++v8amT81eVUBz74AvlZCBBEyFyntSsw+hjXyWZcPvLRwcdLEn
         wH/g==
X-Forwarded-Encrypted: i=1; AJvYcCVVGryGCam5BVdJTxPgkzY/RAd31WcRIHiwpEOESa4Vkj/+mE/wZ/LKeCuFL5Ukid8igg2HT+zTob1EooUEog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7AJryecniWpRNhsOvxrhYpHytkbFf5PMBq/W966n9mCXlDqcy
	FGzk4aSjm1SGvtj2Umv9UfMt9RJJq+IQvR05MT1C7to6QK+uJ0hhy03J
X-Gm-Gg: ATEYQzx/bqiZqnCM9vyNOaMeFrEa+w3FIAfajttKQKLRRmgmpgbysmfZxklircHkVA7
	/Ffqi+zJ7g9dWtnnGctL3yILETIgcrVUESu1xVemVtkdYfiBjos8l387U0hhoBnV+89fB9IzVMo
	9BIVgxKYB5uxIE0WS13YnDcBvSIFXPKa9n01ZTFHINDMR8s1rmXWELXvgiHzCXltAxEYKbtggRp
	GpASjzGFO0/T4wLGeSEWP1RQpjUqVxGQF3URmnSkg4LppLwpqEDnLMTnecyhFK1jwWVUSZK04Rt
	KmnNtBWx6S0tsiTGT0W+XGMNClqsbPsUrOGo+ToRzDsp571If6NNApl5aA/I3tKcXcIf+XllHv9
	lpm3b1LjcKDGg6TpVxl1SDxxwm9pCmdN6MDZiORno+ka+K/klNKEFPVe6ob9NB9fxRqjzUQ3f17
	iC/8VTUB4OMruKQhQZGIa6Ky+vaGG9fe/WHpPHewCRUSOIIwgWaPuJQdGxH4IfltkuIuf2IAZpT
	GY9AA==
X-Received: by 2002:a05:6a00:bb0d:b0:82c:70a8:fae6 with SMTP id d2e1a72fcca58-82c95e71d96mr11402726b3a.22.1774862658110;
        Mon, 30 Mar 2026 02:24:18 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82caf5408efsm5752207b3a.2.2026.03.30.02.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:24:17 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:54:08 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Link Mauve <linkmauve@linkmauve.fr>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH V7 4/4] powerpc: Enable Rust for ppc64le
Message-ID: <acpA27Q6y6YjALAq@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260329160254.2592207-1-mkchauras@gmail.com>
 <20260329160254.2592207-5-mkchauras@gmail.com>
 <DHFHD1CAMGX5.28WBF05Y56EEM@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHFHD1CAMGX5.28WBF05Y56EEM@garyguo.net>

On Sun, Mar 29, 2026 at 07:33:43PM +0100, Gary Guo wrote:
> On Sun Mar 29, 2026 at 5:02 PM BST, Mukesh Kumar Chaurasiya (IBM) wrote:
> > Enabling rust support for ppc64le only.
> 
> This line looks inaccurate now given previous commit just enabled it for PPC32
> too.
> 
Oh yeah, will fix this.
> >
> > Tested on powernv9:
> >
> > $ uname -rm
> > 6.19.0-rc8+ ppc64le
> >
> > $ sudo modprobe rust_minimal
> > [  632.890850] rust_minimal: Rust minimal sample (init)
> > [  632.890881] rust_minimal: Am I built-in? false
> > [  632.890898] rust_minimal: test_parameter: 1
> >
> > $ sudo rmmod rust_minimal
> > [  648.272832] rust_minimal: My numbers are [72, 108, 200]
> > [  648.272873] rust_minimal: Rust minimal sample (exit)
> >
> > $ sudo modprobe rust_print
> > [  843.410391] rust_print: Rust printing macros sample (init)
> > [  843.410424] rust_print: Emergency message (level 0) without args
> > [  843.410451] rust_print: Alert message (level 1) without args
> > [  843.410477] rust_print: Critical message (level 2) without args
> > [  843.410503] rust_print: Error message (level 3) without args
> > [  843.410530] rust_print: Warning message (level 4) without args
> > [  843.410557] rust_print: Notice message (level 5) without args
> > [  843.410594] rust_print: Info message (level 6) without args
> > [  843.410617] rust_print: A line that is continued without args
> > [  843.410646] rust_print: Emergency message (level 0) with args
> > [  843.410675] rust_print: Alert message (level 1) with args
> > [  843.410691] rust_print: Critical message (level 2) with args
> > [  843.410727] rust_print: Error message (level 3) with args
> > [  843.410761] rust_print: Warning message (level 4) with args
> > [  843.410796] rust_print: Notice message (level 5) with args
> > [  843.410821] rust_print: Info message (level 6) with args
> > [  843.410854] rust_print: A line that is continued with args
> > [  843.410892] rust_print: 1
> > [  843.410895] rust_print: "hello, world"
> > [  843.410924] rust_print: [samples/rust/rust_print_main.rs:35:5] c = "hello, world"
> > [  843.410977] rust_print: Arc<dyn Display> says 42
> > [  843.410979] rust_print: Arc<dyn Display> says hello, world
> >
> > $ sudo rmmod rust_print
> > [  843.411003] rust_print: "hello, world"
> > [  888.499935] rust_print: Rust printing macros sample (exit)
> >
> > Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
> > Tested-by: Link Mauve <linkmauve@linkmauve.fr>
> > Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> > Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >  arch/powerpc/Kconfig  | 1 +
> >  arch/powerpc/Makefile | 7 ++++++-
> >  rust/Makefile         | 6 ++++++
> >  3 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 1246b3add8ff..a5f50434daf3 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -285,6 +285,7 @@ config PPC
> >  	select HAVE_RELIABLE_STACKTRACE
> >  	select HAVE_RSEQ
> >  	select HAVE_RUST			if PPC32
> > +	select HAVE_RUST			if PPC64 && CPU_LITTLE_ENDIAN
> >  	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> >  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> >  	select HAVE_SETUP_PER_CPU_AREA		if PPC64
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index 589613eaa5dc..9385db478c59 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -61,7 +61,12 @@ else
> >  KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
> >  endif
> >  
> > -KBUILD_RUSTFLAGS 	+= --target=powerpc-unknown-linux-gnu
> > +ifdef CONFIG_PPC64
> > +KBUILD_RUSTFLAGS	+= --target=powerpc64le-unknown-linux-gnu
> 
> It looks like all it takes to enable PPC BE is to have
> 
> #ifdef CONFIG_CPU_LITTLE_ENDIAN
> KBUILD_RUSTFLAGS	+= --target=powerpc64le-unknown-linux-gnu
> #else
> KBUILD_RUSTFLAGS	+= --target=powerpc64-unknown-linux-gnu
> #endif
> 
> (and similarly add bindgen target)?
> 
> I think it might worth having PPC32/PPC64/PPC64LE all enabled in a single
> commit, and then you can just claim Rust is enabled for PPC and have an
> unconditional
> 
>     select HAVE_RUST
> 
> Thoughts?
> 
BE still has some issues in the compiler. We are working with our LLVM
team to get those fixed. We can still add the support for BE, but that
won't be compilable as of now.

Regards,
Mukesh
> Best,
> Gary
> 
> > +KBUILD_RUSTFLAGS	+= -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
> > +else
> > +KBUILD_RUSTFLAGS	+= --target=powerpc-unknown-linux-gnu
> > +endif
> >  
> >  ifdef CONFIG_CPU_LITTLE_ENDIAN
> >  KBUILD_CPPFLAGS	+= -mlittle-endian
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 7ea7570e3f17..7fe4cbbd176e 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -410,7 +410,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
> >  BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
> >  BINDGEN_TARGET_arm	:= arm-linux-gnueabi
> >  BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
> > +
> > +ifdef CONFIG_PPC64
> > +BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
> > +else
> >  BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
> > +endif
> > +
> >  BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
> >  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
> >  
> 
