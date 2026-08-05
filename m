Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84862466AF5
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932973; cv=none; b=O9txtbqpd7OjUAOk4MD611mgpEW+x3AFfVcUOY/qi9urVbYiarWTnVZ0ihhDbZ2Y/GxalV/wvvaed1VXxy5OuWGpHzxqgeGOTboO6RK2qu/EzUJkPq1iyUf47fF0JiCGTGiHoY7gkwsZuG5gGgVcPTJZ6DNkECSMe6DnquIWm8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932973; c=relaxed/simple;
	bh=3rYo6y4RXRwytenJ8qsEeUxZz9gCg7EL4dBQwp0PKvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldEbrAI8YlEUooAHblGqjCUY5kDpsWtE/Yz1OLjh89dl48fz4YbKXqtZ0q7q2sgmhsx+HeBImtEgq8s4y7lMhhokrs68nkhJjWgHLFePlObu0dM0iUAHOrCl+Erw0CwNx6ZR5DyLYTaqDbl2eUBiIQ0XyZz8UEF8JJE1KkUPUBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y93PXYsv; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y93PXYsv"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so831559a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785932971; x=1786537771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lDfE3MImKDd5lzHD3TwQos1pByv1t0VuukoOAZQ7kIw=;
        b=Y93PXYsvv89bdbi2mYxLSll6IIoFJgUTwcRHbjvNSlWm6g/tWHqN0mvPaXhXRrikmC
         S15+v76vHx8BU+l/oDl/bAl1NE4WBB40tjSpUlC3w1G54y7qRRQVbEHnGFpsZnbvh8xI
         jcyMm9kfzjLcn0t6cKSukCOD9DVr4Xs9noAuKEx48AfTtdC8VvuYXU8c2lXEWou3bru9
         JoqaYK6aNmYBpdmyKNMCy5bp0FW7aY4MjITDUJb7MblR145j7ulYt362+RsyOb2LjUb5
         P3lSyQAPzgN8PpX6ceN8hYHl6+9EgORFJ/vjyqniC7iqXXTcOi/hIJuYvA9s+9bM++7J
         yXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932971; x=1786537771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lDfE3MImKDd5lzHD3TwQos1pByv1t0VuukoOAZQ7kIw=;
        b=Z9vHAymtalljyO1d6AVWjhB1EbIX6nf768/k98QOV+cCG3dO0YL3KL04+alQL6lqg0
         eXVUi5Pik+S/dudgujnI18nGGeiZNnv9rcxSkQRCObIUM2kOSasNLgjYrpHJ6Uv+3ygF
         7hGwAowY0dReVJOO5x/RHNmPksR9+ZPfqzZm8+H0bxEQOZ1D0Ah2P6r1E8bd+878/KYC
         pv3ahuKT9u0CZ8uSd5deP5/68WX+kX8SFwWVIQ4zhBEEdzsp1cPeVQN/wQD/6+FXVo8J
         T0Om0hVoQYuvJWLThxtN6J+QF+SPcr1frI6w+vtg/SY249KLJQu72nBZ77ppP3Xf534X
         77cQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFu7IbPrPa+x5oA+zfbZLCFAPjLKHmcpTqY16UBfPvxRqNxGkfYzf9WVYTjr5oYkq31LGF+T9XSoBUTUPi4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3RkFjSvXjKo+mgrvfoUsHyda6rMn8uGxE3BIRgO2kNOoEQo4o
	32IwWqUmVpMlNg0S4s1CgAR32PwD2Ex1bhr1ftVy/cqCBAYOrdRtlUoF
X-Gm-Gg: AR+sD103CbAGdt/rKaS10zf5Zr9KeZ18DDrDgMOL8LzcPecn2qVBR9vw3O9ZY8nwstH
	GvteMg8BvzJAZyCGoWltKuRpCL842hHJB8u3N21zU08bS4r+lx59+Hv9AMM7qY/CzSyyWzCS2TH
	93iBGM4XKA+Ci+PBUvrBoSwHGP5xJ5jK9S6WMKRytMWZ8d/Yggzbh74RjX+SLI8RKZlxWzLEYci
	nlFdylMemAeuPZWd5GUW2CA+2dDw3sjh0yPkWgd16yjOK3vGsEWJsrtBykxAl76mXgaf6LGULqF
	NLi7yE6a7avQzZMtZMG6H52t7JMsX/ozUFWzQTPWguf/37W8R+0apODAcXm/mVMtECDFvoHWHba
	YyKUpu/8f06Mf9MzpSG1RudqDU2ZJvtdAUG2zYruEoq5nxY6xfpBStDB6A06/x47CyrsG6wre2l
	nbNFvGGGb9QrZfzReluH7iocyxcZONDZXbCG0IvTk6I5LxX/sICLHDNB10T+MYxDRt+c3YhXeJi
	yXYi00kxJRy/j7sjBRmBkUFYH40G7Thzqhe
X-Received: by 2002:a05:6a20:cfa2:b0:3c4:397a:69b8 with SMTP id adf61e73a8af0-3cb85e6c93amr8849745637.21.1785932970620;
        Wed, 05 Aug 2026 05:29:30 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.161.124])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe707ea3ebsm1514279a12.8.2026.08.05.05.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:29:30 -0700 (PDT)
Date: Wed, 5 Aug 2026 17:59:14 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: linkmauve@linkmauve.fr, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, fujita.tomonori@gmail.com, joelagnelf@nvidia.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, nsc@kernel.org, japo@linux.ibm.com, 
	lina+kernel@asahilina.net, j@jannau.net, airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V17 0/7] Rust Support for powerpc
Message-ID: <anMsbbRNiihKB-z7@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
 <178574013457.29744.6211258618175255546.b4-ty@linux.ibm.com>
 <anG67Q6Y59kDqh-c@desktop>
 <20260804.224035.269658578200153488.tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804.224035.269658578200153488.tomo@flapping.org>

On Tue, Aug 04, 2026 at 10:40:35PM +0900, FUJITA Tomonori wrote:
> On Tue, 4 Aug 2026 12:11:57 +0200
> Link Mauve <linkmauve@linkmauve.fr> wrote:
> 
> > Hi,
> > 
> > On Mon, Aug 03, 2026 at 12:27:13PM +0530, Madhavan Srinivasan wrote:
> >> On Wed, 08 Jul 2026 13:54:47 +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> >> > Enable experimental rust support for ppc64le and ppc32be. The patch for
> >> > ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
> >> > merged over it. ppc32 needs some toolchain fixes mentioned in the patch
> >> > `rust: Add PowerPC support` and the discussion for that is done here[1].
> >> > 
> >> > This has been tested on
> >> > - powernv9 hardware
> >> > - pseries P11 hardware
> >> > - pseries(9, 10) qemu
> >> > - powernv(9, 10) qemu
> >> > - rustdoc on x86 and powerpc64le
> >> > - rusttest on x86 and powerpc64le
> >> > 
> >> > [...]
> >> 
> >> Applied to powerpc/next.
> >> 
> >> [1/7] rust: Fix "multiple candidates for rmeta dependency core" error
> >>       https://git.kernel.org/powerpc/c/00cdfd072c709c608606461d7d44d4613119bfa9
> >> [2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
> >>       https://git.kernel.org/powerpc/c/be809b60cbb61aab96179f44ac3670242ae72996
> >> [3/7] powerpc/jump_label: adjust inline asm to be consistent
> >>       https://git.kernel.org/powerpc/c/13244c0a40139fe66c4c5c5655f4d732a6002957
> >> [4/7] rust/powerpc: Set min rustc version for powerpc
> >>       https://git.kernel.org/powerpc/c/e299147cdc8e19c6421a6b7863dc82a35b09d967
> >> [5/7] rust: Make __udivdi3() and __umoddi3() panic
> >>       https://git.kernel.org/powerpc/c/c93c194e4ee71a734986fd99a8b1ec9fbb7a9b8b
> >> [6/7] rust: Add PowerPC support
> >>       https://git.kernel.org/powerpc/c/73b741adb264967093ef4eb59905618a7e0d0de0
> >> [7/7] powerpc: Enable Rust for ppc64le
> >>       https://git.kernel.org/powerpc/c/bc87cbdb952e9223616b839d64bdb4723aa2ed1d
> >> 
> >> cheers
> >> 
> > 
> > I just tested those again in linux-next, with the Wii support series on
> > top, but now the kernel fails to build due to ARCH_WARN_ASM and
> > ARCH_WARN_REACHABLE not being defined on PowerPC:
> > ```
> > error: no rules expected `ARCH_WARN_ASM`
> >    --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
> >     |
> >   1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
> >     |                            ^^^^^^^^^^^^^ no rules expected this token in macro call
> >     |
> >    ::: ../rust/kernel/lib.rs:279:1
> >     |
> > 279 | macro_rules! concat_literals {
> >     | ---------------------------- when calling this macro
> >     |
> >     = note: while trying to match sequence start
> > 
> > error: no rules expected `ARCH_WARN_REACHABLE`
> >    --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_reachable_asm.rs:1:28
> >     |
> >   1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
> >     |                            ^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
> >     |
> >    ::: ../rust/kernel/lib.rs:279:1
> >     |
> > 279 | macro_rules! concat_literals {
> >     | ---------------------------- when calling this macro
> >     |
> >     = note: while trying to match sequence start
> > 
> > error: aborting due to 2 previous errors
> > ```
> > 
> > This is in addition to the bindings::kvfree_call_rcu() call, but that
> > one is already being handled in a different thread.
> 
> Looks like powerpc needs something like the followings:
> 
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index 0db48977c70c..8aba39e0cf26 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -32,34 +32,38 @@
>  #endif /* verbose */
>  
>  #else /* !__ASSEMBLER__ */
> -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> -   sizeof(struct bug_entry), respectively */
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> -#define _EMIT_BUG_ENTRY				\
> +#define _EMIT_BUG_ENTRY(file, line, flags)	\
>  	".section __bug_table,\"aw\"\n"		\
>  	"2:	.4byte 1b - .\n"		\
> -	"	.4byte %0 - .\n"		\
> -	"	.short %1, %2\n"		\
> -	".org 2b+%3\n"				\
> -	".previous\n"
> +	"	.4byte " file " - .\n"		\
> +	"	.short " line ", " flags "\n"
>  #else
> -#define _EMIT_BUG_ENTRY				\
> +#define _EMIT_BUG_ENTRY(file, line, flags)	\
>  	".section __bug_table,\"aw\"\n"		\
>  	"2:	.4byte 1b - .\n"		\
> -	"	.short %2\n"			\
> -	".org 2b+%3\n"				\
> -	".previous\n"
> +	"	.short " flags "\n"
>  #endif
>  
>  #define BUG_ENTRY(cond_str, insn, flags, ...)		\
>  	__asm__ __volatile__(				\
>  		"1:	" insn "\n"			\
> -		_EMIT_BUG_ENTRY				\
> +		_EMIT_BUG_ENTRY("%0", "%1", "%2")	\
> +		".org 2b+%3\n"				\
> +		".previous\n"				\
>  		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
>  		  "i" (flags),				\
>  		  "i" (sizeof(struct bug_entry)),	\
>  		  ##__VA_ARGS__)
>  
> +#define ARCH_WARN_ASM(file, line, flags, size)		\
> +		"1:	twi 31, 0, 0\n"			\
> +		_EMIT_BUG_ENTRY(file, line, flags)	\
> +		".org 2b+" size "\n"			\
> +		".previous\n"
> +
> +#define ARCH_WARN_REACHABLE
> +
>  /*
>   * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
>   * optimisations. However depending on the complexity of the condition

Yeah, This makes sense.

I'll work on this and send out a fix soon.

Thanks and Regards,
Mukesh
