Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8592E3AF670
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776765334; cv=none; b=eKJXmkYNz8x/4hBvFPRnTMsOCHs9nJKMKJ8YgHysepoW3taOkVySLjB67T3uaiDNEHhhdnocya/0zn/E97eJGI+k5vUvR2ofK2pm+msKp9BC0ReY3ioDFOkDRAySF3JVFU1O4/Pa6yRR6zE09fiEGKgNjpIXLlYUi7nX1HGPw6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776765334; c=relaxed/simple;
	bh=ZKghPed/ju+IgFPje1TEIcg9zBtySgV/NUxS1EBIrhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDisWtI1k7ZaIRmvhtiRiPxAev0waO7FIZY99s/O017cvFjovCiIJ3j4yZqIx3UMytHuHcXayS20aSNpuiZy5x1aypTE53ccvr3S5OfRcsBuMV0LU6I3IS+NZkI0kZnWTzFWCDWUWgnMMAZILELanlVuWdSjAxu9eJh3J+80Oyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRhvi5hE; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRhvi5hE"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f8b60e485so1667143b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 02:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776765333; x=1777370133; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=91kn5n9C2wXrcDyzWkVlinW43jw3yYJYj+1FYPmqgkc=;
        b=WRhvi5hEFpMyaVfsx/yW2FqUBzPECYdUIhiWmxEGkjyMnG74untom1GsS9cjKQRi6G
         WdgKksn295ehz/h6HR/BEmhWZ7Aktrt5lOEEBgvH3fgTJ2uHMrvOycRcKCMqpKC4o0Hd
         MVJ6p72V1IKCvPy6VO9Rm/jBB6ijJ3yYxXV4SwnfjDuk8MiPUas/EVgSeGW3TGU8HIsB
         MIz1JtLOJAgRhGEycVZw7blLY1kHGdqmKw4HcJoZ2cabcUdRNzZAw4Yx+GophjK8/IwK
         OtAazIXj6YKF9383SdXuQofnbfHKVBcgIPq3sQCPhx6y2YSJvuabajnnj0NLDGBF+MXq
         9HPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776765333; x=1777370133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91kn5n9C2wXrcDyzWkVlinW43jw3yYJYj+1FYPmqgkc=;
        b=CubokOl6Chp55OS34QlY46BfCQe5UNM7UWzAoU980WnnNBeD/hOTAL6IidUPTK1GYw
         GCrA/tpBaEbiQEvGQvF+hqpiu07EanpNdeHDPCfTwWxS+E7TZlcUqzrtVyDlak237jWt
         DVzaq/o/Bm6YJoIuFHTnqmlAbkzjjK1prX0V91Ck3OdctpNjIfYnjznl77gCPg5+Jrlc
         85mIhVfxJCsosLWnLloaowJ8cO1gpeh35RzMhkix3c1fkP5HZlsAuDivwQhqhrZqyaBe
         FhSeZ7IL2gGHQFMOmARPLcBGwgWxQY5QFI5v0pTqLb61WrqnoiLGbh2+hOpx0kIEmQo5
         SwHA==
X-Forwarded-Encrypted: i=1; AFNElJ+so42ZL+YDwggmWP+kTrVWJPbCjkMLLfgJnG0DYdmud7CXJSy/kMelgYvEc8CUbzVmNk6N8iw+ZttXWPEJew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8CeF2VevBHq3AESncqOJwNMyb0PMhZ+lYpCPEguhwCzw8qLD/
	SgUY8D3ovVmL+NN6YDSI7rHlnR1Sx9fyrpGcNfQbS0BFm3M9VRYnuLsq
X-Gm-Gg: AeBDiet3+Sq3hY5DvkaoCGpJCQVb+MJ49gpcD0PDO/MF9aID2z9fJ8oA/5/+4GAY941
	mHG954a6bwLJzVcjqmXXv0/D4hF/KxERSrS1dnhReqC3g7NjDwTbg6QM6ADgplv2zULrjwBQkea
	T677AcpIEN4l6E59JYOouq9FkPUdj3Q4xXsfh/1ilCp6/vAPoRLhBO9INAhdB8vuZPM+ucrUea6
	du5/olr4UTkJIMjjpY+vyUW5iACcZIjrMqRG4lj/AqvV5M9TFV7E8A8v1TY+Nq+IXmpTwcMaJm8
	TDHCc13Z/ERYDczHx8xpdjCNNxnw1/UaSy3tx1VPDRwz7Q1mNY/ac2mPtybUHFEJmdzwE9Iwtx4
	u2VBcUKR0NCBq/9l4sB3QYuMOJSgErw3pDfxAKNhPF5CNo3/pkRyZVycoP0G1cOCopc54ZHOmL/
	dCVdhfogluAK3z4pF2M4qBI9NzvsayX1GWIVXRBf/t+oChwjhNMynTvvUldfbNTj/rn6rqnuSFo
	+FQKJcmucPht6Vz
X-Received: by 2002:a05:6a00:2288:b0:82c:e76b:c68c with SMTP id d2e1a72fcca58-82f8c3f2b00mr17779962b3a.0.1776765332666;
        Tue, 21 Apr 2026 02:55:32 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ea09914sm13092315b3a.26.2026.04.21.02.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 02:55:32 -0700 (PDT)
Date: Tue, 21 Apr 2026 15:25:22 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
 <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aedFgEicDW6LAcuq@luna>

On Tue, Apr 21, 2026 at 11:38:08AM +0200, Link Mauve wrote:
> Hi Mukesh,
> 
> This patch doesn’t apply on top of mainline, which tree did you base it
> off?
> 
It was on mainline v7.0 tag.
On latest there is a confilict. I'll send out a rebased version.

> On Fri, Apr 17, 2026 at 08:52:50PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > When building Rust code for powerpc64le with LLVM=1 and -j1, rustc
> > encounters an error: "multiple candidates for `rmeta` dependency `core`
> > found", with two candidates:
> > 1. The host's standard library from the rustup toolchain
> > 2. The kernel's custom libcore.rmeta in the rust/ directory
> > 
> > This occurs because the build system uses `-L$(objtree)/rust` for host
> > library builds (proc_macro2, quote, syn), which causes rustc to search
> > the rust/ directory. During this search, rustc finds both the kernel's
> > custom libcore.rmeta and gains access to the host's standard library,
> > creating a conflict.
> > 
> > The solution is to separate host libraries into a dedicated rust/host/
> > subdirectory and use `-L$(objtree)/rust/host` for host builds instead
> > of `-L$(objtree)/rust`. This ensures that:
> > 
> > 1. Host library builds (proc_macro2, quote, syn) only search rust/host/
> >    and never encounter the kernel's libcore.rmeta
> > 2. Proc macro builds use `-L$(objtree)/rust/host` to find their
> >    dependencies
> > 
> > Special handling is added for rustdoc-pin_init, which is a host build
> > (to access the alloc crate) but depends on proc macros from the main
> > rust/ directory. It uses explicit `--extern` paths to reference the
> > proc macros without adding `-L$(objtree)/rust`, which would reintroduce
> > the conflict.
> > 
> > The rust/host/ directory is added to clean-files to ensure it's removed
> > during `make clean`.
> > 
> > Link: https://github.com/Rust-for-Linux/linux/issues/105
> > Link: https://github.com/linuxppc/issues/issues/451
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >  rust/Makefile | 38 +++++++++++++++++++++-----------------
> >  1 file changed, 21 insertions(+), 17 deletions(-)
> > 
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 9801af2e1e02..e234b8a39358 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -3,6 +3,9 @@
> >  # Where to place rustdoc generated documentation
> >  rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
> >  
> > +# Clean generated host directory
> > +clean-files := host/
> > +
> >  obj-$(CONFIG_RUST) += core.o compiler_builtins.o ffi.o
> >  always-$(CONFIG_RUST) += exports_core_generated.h
> >  
> > @@ -27,7 +30,7 @@ endif
> >  
> >  obj-$(CONFIG_RUST) += exports.o
> >  
> > -always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib libsyn.rlib
> > +always-$(CONFIG_RUST) += host/libproc_macro2.rlib host/libquote.rlib host/libsyn.rlib
> >  
> >  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
> >  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
> > @@ -150,7 +153,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
> >  	OBJTREE=$(abspath $(objtree)) \
> >  	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-prefix=% --remap-path-scope=%, \
> >  			$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
> 
> The issue is here ↑, --remap-path-prefix=% got removed and the two
> previous lines got merged into one.
> 
Yeah will fix this.
> > -		$(rustc_target_flags) -L$(objtree)/$(obj) \
> > +		$(rustc_target_flags) -L$(objtree)/$(obj)$(if $(rustdoc_host),/host) \
> >  		-Zunstable-options --generate-link-to-definition \
> >  		--output $(rustdoc_output) \
> >  		--crate-name $(subst rustdoc-,,$@) \
> […]
> 
> Thanks anyway for iterating on this series!  I’ve started writing a DRM
> driver based off a previous version. :)
> 
That's cool. Thanks.

Regards,
Mukesh
> -- 
> Link Mauve
> 
