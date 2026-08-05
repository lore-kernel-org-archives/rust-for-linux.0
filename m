Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F275463B63
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932472; cv=none; b=bcUa6SCKBWb2U6bVfWEJkBieXMQ73F4WAu4b0JJykbRU5j5Q3NTznPJLNOjJUBScANIsrR817wWXHwbN1SKZD3DQ2WkGCj5HITkPG33c9LGQSPS4o61QinpUU9qWCbxE4sS3/euCeCDfuDoI8jwvSTzyClbRfeJdpLo/gzs5UAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932472; c=relaxed/simple;
	bh=64jyOe4cnR+vlqhbxgQIhL99hTMhk/S6jEliuWyNuEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTqHkeM0bmBua3SeBUgiP1xc6nXGbJBG31lNmrdrdRRLAlI0CJ3pmfjy1ln9Bbk+PxJuGUMNVQ/ewTGIbwOEVMJPCqmnSouZjeWImOub7P4GO+Pdnbu+eu1keQz8hvJA9faMdZtnfIiuYPuUaFZR5BVBe/jMWi9tYYcfyVm7I38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjkbAXy5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjkbAXy5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cad8076b01so10835385ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 05:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785932470; x=1786537270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f8fKXiu457ws+zyyN3JFRc3wwhL6ADOAY1a3PJv8Y14=;
        b=UjkbAXy5XQK0SPKTowUqhreUOKtG3L9s0iKdHYsrSPtdTWwOi6b6aQ97PscsYP/+nQ
         rnEUQ2cmqw24pIBNVzIrwK9kCUC8eJc4Ts5J0flYE7Gv7iGoSy3wwb3/R4r3IKr8aFTt
         2F5N4o/mDwIU5G8O1xshXpjMJjNOfpJ1tDkq69/1AuQKRHcB+edIyidBDTfXUXRQUs4K
         ovN8vSQmSew7wIbX6S0GXCkEQQWcl5SQYvfNfrOhJ72xsO0G7mpkRKkhZXcHUkofRgb1
         US+H/j9tmlRIrvjHdtWNcTy+crDk+8eWOztWG8xTttxMvKhor3dg/PaENavYzYD5c1YP
         wCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932470; x=1786537270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8fKXiu457ws+zyyN3JFRc3wwhL6ADOAY1a3PJv8Y14=;
        b=iaq6geNQS8CP3piUP6WGOopM10XTFxYIjZOTdVwya+Ung3j76DA4kLFS2Xd2XVXWp1
         K+/DPZa9YoUB776U0slUeL/oN6gal7job10TJnWOkPVRsPc/ZChpxCkbdziqQ01oVPzS
         1FAuUaZxMVh1m0tbASpQct+U73QEz14wFGF/p8Ng0h7d+YrwLMkG5lESX/EWqWMrLFgR
         i39j5w/HA3vEjYy7DDn4km515AUOKQdkCUuKMRIhcXr7dWnL/wqT+RhNrbHR/YFJ/S7X
         ondZLoElyvN9UOUIm9saWCAn6DIRBhga7/fRgwe2UD09iZ98G6fZv+43Y8iODOSLPegu
         q/gA==
X-Forwarded-Encrypted: i=1; AHgh+RqXioLuWsYdsgPyzMqZeCbDmDv6tn0R/zNMtZBTLZ9ZX5OP9ftN2OM6SZV/AQKl/h9aXC0GZBOfO2P6neJG7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd94Ewuf7SfbhTFu+zqtRAh/16FNLa7g856X/zwErUAiw8bN9v
	5HLmbj1/aR6X69pTpFDzBZ9y9hZDbAdcDX1lLQ2h7NaRzd0IzTtCAM3t
X-Gm-Gg: AR+sD13YccoHUT3IHwb1jvmAzB+CcZxsSGyqESydRFUyvjWjzXV1O2z3VNrO49QsUXC
	92LoZ3iyueluSOOVFjbfaS4W6JocS9jP67+IP2Af7BdRSMeBS8yhxD9S0tzuAVVmZuOlETF0+GD
	MOmoVXaMutDRGul9ujBLNmBQ8XuNt6JMELyTl7rrhAxrvsyTyNaaLULb1D/mYjmtAoURDYPRH/j
	9+/k/dl3iMWWpz8UYeSMlJhEEhHbYlKd4U7qE+J6iprRYPglXNtMMTF/3A6e+c7ypEM2zdjWh2m
	riBPCvfrSi0afsBAzklZ6LwRB8L0E4CpSc81bsg2hCVV3Yz9CTZ6gnof5JXVFfymS5oeenHMoab
	wgykWTfdiwTsjr4A8WQJfJR+zE36VT7xK6nuN8oGitpAtnwlhgHCaTQg/mUVFGB7+oLRYOJP4Ee
	nh8LJSaDK9t2G+oE8i6Dhq+f2lK1CAWMQ1niJSprFieMF77erKU8GpnoVuDlTw7xAqkyXFI2RxF
	o7TaJmKT2u3hcYGJJjmT1ABypfpduvmMq2m
X-Received: by 2002:a17:903:2312:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d0ca7fa497mr66481405ad.9.1785932470282;
        Wed, 05 Aug 2026 05:21:10 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.161.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4bda53sm15577065ad.63.2026.08.05.05.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:21:09 -0700 (PDT)
Date: Wed, 5 Aug 2026 17:50:54 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, fujita.tomonori@gmail.com, 
	joelagnelf@nvidia.com, gregkh@linuxfoundation.org, prafulrai522@gmail.com, 
	nsc@kernel.org, japo@linux.ibm.com, lina+kernel@asahilina.net, j@jannau.net, 
	airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V17 0/7] Rust Support for powerpc
Message-ID: <anMqe3eVCZVxgoPj@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
 <178574013457.29744.6211258618175255546.b4-ty@linux.ibm.com>
 <anG67Q6Y59kDqh-c@desktop>
 <20260804202217.GA1109939@ax162>
 <anMnoT0KLd5PRGmX@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anMnoT0KLd5PRGmX@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>

On Wed, Aug 05, 2026 at 05:40:42PM +0530, Mukesh Kumar Chaurasiya wrote:
> On Tue, Aug 04, 2026 at 01:22:17PM -0700, Nathan Chancellor wrote:
> > On Tue, Aug 04, 2026 at 12:11:57PM +0200, Link Mauve wrote:
> > > Hi,
> > > 
> > > On Mon, Aug 03, 2026 at 12:27:13PM +0530, Madhavan Srinivasan wrote:
> > > > On Wed, 08 Jul 2026 13:54:47 +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > > > > Enable experimental rust support for ppc64le and ppc32be. The patch for
> > > > > ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
> > > > > merged over it. ppc32 needs some toolchain fixes mentioned in the patch
> > > > > `rust: Add PowerPC support` and the discussion for that is done here[1].
> > > > > 
> > > > > This has been tested on
> > > > > - powernv9 hardware
> > > > > - pseries P11 hardware
> > > > > - pseries(9, 10) qemu
> > > > > - powernv(9, 10) qemu
> > > > > - rustdoc on x86 and powerpc64le
> > > > > - rusttest on x86 and powerpc64le
> > > > > 
> > > > > [...]
> > > > 
> > > > Applied to powerpc/next.
> > > > 
> > > > [1/7] rust: Fix "multiple candidates for rmeta dependency core" error
> > > >       https://git.kernel.org/powerpc/c/00cdfd072c709c608606461d7d44d4613119bfa9
> > > > [2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
> > > >       https://git.kernel.org/powerpc/c/be809b60cbb61aab96179f44ac3670242ae72996
> > > > [3/7] powerpc/jump_label: adjust inline asm to be consistent
> > > >       https://git.kernel.org/powerpc/c/13244c0a40139fe66c4c5c5655f4d732a6002957
> > > > [4/7] rust/powerpc: Set min rustc version for powerpc
> > > >       https://git.kernel.org/powerpc/c/e299147cdc8e19c6421a6b7863dc82a35b09d967
> > > > [5/7] rust: Make __udivdi3() and __umoddi3() panic
> > > >       https://git.kernel.org/powerpc/c/c93c194e4ee71a734986fd99a8b1ec9fbb7a9b8b
> > > > [6/7] rust: Add PowerPC support
> > > >       https://git.kernel.org/powerpc/c/73b741adb264967093ef4eb59905618a7e0d0de0
> > > > [7/7] powerpc: Enable Rust for ppc64le
> > > >       https://git.kernel.org/powerpc/c/bc87cbdb952e9223616b839d64bdb4723aa2ed1d
> > > > 
> > > > cheers
> > > > 
> > > 
> > > I just tested those again in linux-next, with the Wii support series on
> > > top, but now the kernel fails to build due to ARCH_WARN_ASM and
> > > ARCH_WARN_REACHABLE not being defined on PowerPC:
> > 
> > I also see the following warnings (in addition to that error):
> > 
> >   warning: unknown and unstable feature specified for `-Ctarget-feature`: `mma`
> >     |
> >     = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
> >     = help: consider filing a feature request
> > 
> >   warning: unstable feature specified for `-Ctarget-feature`: `vsx`
> >     |
> >     = note: this feature is not stably supported; its behavior can change in the future
> > 
> >   warning: unknown and unstable feature specified for `-Ctarget-feature`: `hard-float`
> >     |
> >     = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
> >     = help: consider filing a feature request
> > 
> >   warning: unstable feature specified for `-Ctarget-feature`: `altivec`
> >     |
> >     = note: this feature is not stably supported; its behavior can change in the future
> > 
> Hey Nathan,
> 
> For these i'll raise issues.
Here's bug on rustc for the same.
https://github.com/rust-lang/rust/issues/160561

Regards,
Mukesh
> >   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
> >   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
> >   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
> >   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]
> >   warning: 4 warnings emitted
> > 
> For these warnings below diff should fix it. I'll send out a patch soon.
> 
> diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
> index 06d7d1a2e8da..acec2d2fede7 100644
> --- a/rust/uapi/uapi_helper.h
> +++ b/rust/uapi/uapi_helper.h
> @@ -6,7 +6,7 @@
>   * Sorted alphabetically.
>   */
>  
> -#include <uapi/asm-generic/ioctl.h>
> +#include <uapi/linux/ioctl.h>
>  #include <uapi/drm/drm.h>
>  #include <uapi/drm/nova_drm.h>
>  #include <uapi/drm/panthor_drm.h>
> 
> Regards,
> Mukesh
> 
> > when building this series in next-20260804 with rustc 1.97.1. I am not
> > sure where the clang diagnostic warnings come from. I assume the target
> > feature warnings are expected but it would be good to get those
> > addressed sooner rather than later. I see '-hard-float' has an issue
> > open
> > 
> >   https://github.com/rust-lang/rust/issues/117347
> > 
> > but I don't think I see issues open for the other ones.
> > 
> > -- 
> > Cheers,
> > Nathan
