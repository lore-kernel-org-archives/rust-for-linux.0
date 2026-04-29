Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529D41448D5
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 05:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777439949; cv=none; b=n26nLDlJ4W8LAy/wd8FJ3J7TsCsJyHFmZ0E4HvL9CJFPoIWKCv6ywhjA9JeH549Y3JagxeiddPOiNejTe7mmSIixrxsoS+DioLHGnSJi5RNtFovsmpWD0MsLOMp98Plz3JLGKRteJ+sG8+EoqmR6KhVUM7Ufx1SUEPiOyd5EemA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777439949; c=relaxed/simple;
	bh=O7CMBLCs89G2UpnUOkHledwCOdF70JrpMXg5KrXvsYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gS3avuTgTIRCBfVZQJz4M4LeGIJDtyhe3z+sZnmE6CMoz/J0xBw8Nk39HrKZp9JPi5ti89HAoAp1xLbzpspblIQPa19PmPQSXwYESmNR4pK8eCUCVXkDGKZI6lZZgpHNAbPkTlxE4TjSP/ptTXlUxLQQUuAL9ZtxFUAYAwHPLy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwEdrMYf; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwEdrMYf"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-362ddc1de56so4091006a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 22:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777439948; x=1778044748; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wADOe/Ijbv0iSvyti5z+slPn7HaZRO67y/qPpz50QTE=;
        b=HwEdrMYfbfvl8cLtOcFs9+G59qj08WF96wTbXyXHnGz1tVbSluX23SJ9fE1mhmWFoH
         Pj2kW+Cz781U9OoMaEr8yytsIi8oncVQvVKhQYkPCNvmEikI7DBk+psjcHDh4qldujbx
         ereMCUueu4hYHGAqoj2mUxFpPFk6b3cztFAEE5X0xaGr2DOQQAn/PExf+3tuDIqQIV5z
         S+/jL9iPa7NKVnXEcl0XZ2/NIxb1MQYhC0nR2Nq4eHkOgVGdfm2blR2CUISXnL4GsCev
         nmXhmzaeOT56nkAEFNzBgsiHbw8tFpYTsfFjY3ZUVnkPtnqak+Y+d7XSnJPU7WfvSJ4H
         5iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777439948; x=1778044748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wADOe/Ijbv0iSvyti5z+slPn7HaZRO67y/qPpz50QTE=;
        b=A3/bicswXMvhEX5tHRtaYg8jmjtERWE0MAWo4xFFoBbAiWWqB2BijgsDhPILyda7fT
         LQU6YoPx3PZn/oWjok/BbdKrzQ3IrUveUT89uoP9Nahn/a4UQYN3lkteQ5Q/1dqxlAxj
         VJreSGJFT6NvmP/VCoEDvfCHwiILlevIq8sQIGw/A7gOlKJ3XCDAQfal2WYAVwlTQ/A3
         HP8rdsspUK3X/YuD/fMIj5X1DMPI18HCPP3Arbl+Xh9lDFZPioR0pBGcLx7j8M0YN2Rj
         GM7AEr6hsSOsi/+tRXUrQrLT1jv5XmFAQzgbPX+4bGrlJl33qsQ4lZcfXKTVAsQqSgnQ
         +kXw==
X-Forwarded-Encrypted: i=1; AFNElJ8Iva3Sn4H4VQU28QgT8CpdqQ4tM1SAoja3JWEWkG6hsWyLejyt753wDxMXWHgCHd29o9qN5Kw5jxUDJxCz7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoYOki65cXBffXcJb2snmxmuhbeFHS0ORR5u/lqKXtVyZ8j35D
	tl8BJSxyu8/G9WCLrKeX7G7iqaM6TfLyS33a2B9iQE9UtQOGfh0nFXoP
X-Gm-Gg: AeBDiesgMhB9xrneYeLwvUQYEkbKKlOUTIBlwAmRr9a5lQ/meDtiKsfGxciUJQkQ9z4
	orb7Vr23gEtgCxiToyUeyk0ebJfAG9Nuno4G2UJwQDtlLC+tUeT5KOsgAKQIzOAarHllbiwTZmq
	uzOQl95ovxaQmULMo4pjdtYD5MTILOhynnMxZa7XaeNeq8i7OiTrDf+wrxNLB8MK/IUuprAO8bE
	UIa0+OBg8hm4rtjNGene8I+6dPGD0cO/SvlxrOmgt1MlAv4kgXo9OtZdMWoZDWl9OYqn2NpXR7I
	zuL0xnax1z3LwJ/kdrC9/Q29UMG21ERM8KVeYtsPi2tuQF+xr+Gq19zhQmPqvza65GpKAswS1+L
	wcw31jrhbQS3b6H5kl8upU6XvWODCdGdw2k5TnE2hLVsiKmA0gHTol3cQMTA0RLkpYd97PSEmxU
	ojOITnu96yPeDs1ElC3nuMspqZTeIVOTkbyPPScKD157au5HkEVKYhqKrIrhfca6qrIc8wL3iMH
	RSUGn0nKrk=
X-Received: by 2002:a17:90b:4c4a:b0:35b:e593:b1d7 with SMTP id 98e67ed59e1d1-3649201a3admr6483688a91.12.1777439947551;
        Tue, 28 Apr 2026 22:19:07 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([223.187.127.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a2a4b65dsm399601a91.14.2026.04.28.22.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:19:07 -0700 (PDT)
Date: Wed, 29 Apr 2026 10:48:34 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, fujita.tomonori@gmail.com, viresh.kumar@linaro.org, 
	prafulrai522@gmail.com, gregkh@linuxfoundation.org, arnd@arndb.de, tamird@kernel.org, 
	mark.rutland@arm.com, lyude@redhat.com, lina+kernel@asahilina.net, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V15 6/7] rust: Add PowerPC support
Message-ID: <afGUgjRQJgu34Dfh@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
 <20260426105932.2270364-7-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260426105932.2270364-7-mkchauras@gmail.com>

On Sun, Apr 26, 2026 at 04:29:31PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> From: Link Mauve <linkmauve@linkmauve.fr>
> 
> For now only Big Endian 32-bit PowerPC is supported, as that is the only
> hardware I have.  This has been tested on the Nintendo Wii so far, but I
> plan on also using it on the GameCube, Wii U and Apple G4.
> 
> These changes aren’t the only ones required to get the kernel to compile
> and link on PowerPC, libcore will also have to be changed to not use
> integer division to format u64, u128 and core::time::Duration, otherwise
> __udivdi3() and __umoddi3() will have to be added.  I have tested this
> change by replacing the three implementations with unimplemented!() and
> it linked just fine.
> 
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> Link: https://github.com/Rust-for-Linux/linux/issues/105
> Link: https://github.com/linuxppc/issues/issues/451
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Upstream Issue for powerpc target.
Link: https://github.com/rust-lang/compiler-team/issues/986

Regards,
Mukesh
> ---
>  arch/powerpc/Kconfig  | 1 +
>  arch/powerpc/Makefile | 2 ++
>  rust/Makefile         | 4 +++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e93df95b79e7..4ac897b650d4 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -285,6 +285,7 @@ config PPC
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RELIABLE_STACKTRACE
>  	select HAVE_RSEQ
> +	select HAVE_RUST			if PPC32
>  	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SETUP_PER_CPU_AREA		if PPC64
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a58b1029592c..589613eaa5dc 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -61,6 +61,8 @@ else
>  KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>  endif
>  
> +KBUILD_RUSTFLAGS 	+= --target=powerpc-unknown-linux-gnu
> +
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
>  KBUILD_CPPFLAGS	+= -mlittle-endian
>  KBUILD_LDFLAGS	+= -EL
> diff --git a/rust/Makefile b/rust/Makefile
> index d70fb186cae9..54096ce8a675 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -400,13 +400,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  	-fstrict-flex-arrays=% -fmin-function-alignment=% \
>  	-fzero-init-padding-bits=% -mno-fdpic \
>  	-fdiagnostics-show-context -fdiagnostics-show-context=% \
> -	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
> +	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
> +	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
>  
>  # Derived from `scripts/Makefile.clang`.
>  BINDGEN_TARGET_x86	:= x86_64-linux-gnu
>  BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
>  BINDGEN_TARGET_arm	:= arm-linux-gnueabi
>  BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
> +BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
>  BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
>  
> -- 
> 2.53.0
> 
