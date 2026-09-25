Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F8B402B8C
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Sep 2026 06:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790318342; cv=none; b=tD7oZ1WHyyHLy6B/pMHKyk1/qksWfkb5FbpS1gTAd1ibS6LUddKQlnDd7bUuOMfyFEjOQ9y0fyW6GHxEkdEQ78DSe7wQz9QocrcofZtZ4sJOAOexoVvHDRUUGTB/uQWxCy9dDCqRax9mdVKjkBacBWCHLMb3lyf8BbBOct3Dp4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790318342; c=relaxed/simple;
	bh=bBEIpBUB43BZa53CSuyn25k126QXXsrK9MijXSC+VwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvWl//DyTrav1bQTej0O71n67RWSCLGGMNnuhU+5C/08zTJ9sON7ukr2S7ySECmAQam0QplJiHNtMN3CTwFAbnd40j4TfZ9wmHSWRdGW2sOqdxf4caJW+/j90XPYe1ROqbRtYpb9ZPyznFQ2VJ+5gGzUvlk2VmVg2ByabyjW+rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjHUu+hR; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjHUu+hR"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a156f4so272647eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790318340; x=1790923140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+XCKYNMunQtwjsoXeGr7yLk4ydEdG3nbjO5mlaJXoXQ=;
        b=kjHUu+hRDiAjx/GTeNB7c+y11/uouUMKOLJ7gegIystcmre94e+ZE2VmfY91wwDdoX
         OkmFdlVABrSNSJMyrgI62SAf6Lb6GiGJmsNKKYOCVLyd1SxNrW12Ad0CWg4WbF8AWYO2
         KFez60cTOpOz/gSQ/cgfbRWcPO6qdXlKXrhaXJpZuXpofNFuI47DxCw8Lnf0QC+a6+Ma
         KJDDVzI5sUb4/hpmBeJ7HJGnPlMhlLxJBRDSGGOi4nQcTjZgg+ef0SDoiMVVE4xeFeLn
         jg6VTL43h9kNORo1Mdd2dnFxQ+wuFtQiVP/2VpY8ejXtJEQR3oP/45AQePAhb9zgEgKx
         qYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790318340; x=1790923140;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XCKYNMunQtwjsoXeGr7yLk4ydEdG3nbjO5mlaJXoXQ=;
        b=o2MrmoZGjLumlJzVsHoWS1d/9hDDZaROYwsZ9y5Qaz+HoNT0BHG9CImc2y7JOPyQdz
         hCiJyV9kqOYH4CyP4SCgiXEIr1AIvnl2QTHQtOf75ZCyDz92DJgJGxWCCydRAMP9AifK
         5xRzgvg3VjnHcjjZVr9NKdU8R2QauoEn0yztsAUwVy/heVpA03c9HIpI+wIQJ5rSxMq6
         F/xU/TUXVCAFalndLDsC2m6v4AqNrXmg/yxtoo10rsV579Yfkib1Uxn73lHfurH1Cp3e
         7AezskPlvWYdAMbi684H8O5HdDup+JCP/BArusexQ93YJ2soBHqXNH8zS+pnDTCryTOi
         iRPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEkd4gaeYghDSC01qoDbp0tx4HmmvCTrLy0AtnIIMQWmLwDid3To9jp02k2viQVzkqSBAGRGQz48ZOawdbkg==@vger.kernel.org
X-Gm-Message-State: AFuF++kk/cRxG0aQXRIkzCD6AvyAhGMPxtiFDJjwxRU3jAvpymwuTMz2
	zxAj0ju3UF20xmo6p3sP8vT5RyT5QCPsF33fWtNDGit0U2uA/YJDUL4L
X-Gm-Gg: AYBFou0lczAHUXD8/3IXEUkSQHjIXdQv4l5THk7TRAxKsrnERrVD3n3j9Ja0ZekEvUa
	SvgVsIxLPa8CnxDIbTR/oFSk4izchyko5YlvVn4GW4lSubjE2akfuLCQ21saotqvGIhtpOemwMX
	tl2L9xGGNKxv1ZrVivca3P4GO+5LG+WnR/xtyOgVl7/060kEWMNG5rI07W5TxS7r7bZkSHBVVs+
	jfON0p5jCPdU78rcvZFCoAr3X5fGkC8ZxTrm6cGVPF3E7yuB2qfB3bmkResOsqnm8xtu7zfCwfF
	mcEPkZjTiPwNAAVy4ZlullFy8VOzBsUwCqmw5SfnbAWjstuymwGz2zmgKv9bgR7zG0JFotJhqGO
	cZx2GtP8jrrbXKIMZU3IzW8xfg5APYUI2nJFw62NM9/RvGYTP4Ict0zoaZ8jHkTWpQ5JkexQ+YM
	Y+KB3F+z85zAJu7iGY77J6f0iHWI0zZEpDU+jJzvBrkheXzkr/ySO95yzE66y+uhrFiab3UxpuQ
	5lbcxX1iz7TRNo2IpYUTtIBfPD4kKMyfuGVLCjYfAhv
X-Received: by 2002:a05:7300:7315:b0:33b:e9a7:d81f with SMTP id 5a478bee46e88-340031cca3cmr5226961eec.11.1790318339666;
        Thu, 24 Sep 2026 23:38:59 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757f31sm6418823eec.14.2026.09.24.23.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:38:58 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:08:38 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	ritesh.list@gmail.com, sshegde@linux.ibm.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, jszhang@kernel.org, japo@linux.ibm.com, 
	jpoimboe@kernel.org, seanjc@google.com, pmladek@suse.com, thuth@redhat.com, 
	ynorov@nvidia.com, joelagnelf@nvidia.com, david@davidgow.net, 
	fujita.tomonori@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arYWpnhia9icB-60@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
 <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924111557.GP1837346@noisy.programming.kicks-ass.net>

> Untested thingies for arm64 and s390x.
> 
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 914282016069..3d8a969eab5f 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -987,14 +987,13 @@ void do_serror(struct pt_regs *regs, unsigned long esr)
>  #ifdef CONFIG_GENERIC_BUG
>  int is_valid_bugaddr(unsigned long addr)
>  {
> -	/*
> -	 * bug_brk_handler() only called for BRK #BUG_BRK_IMM.
> -	 * So the answer is trivial -- any spurious instances with no
> -	 * bug table entry will be rejected by report_bug() and passed
> -	 * back to the debug-monitors code and handled as a fatal
> -	 * unexpected debug exception.
> -	 */
> -	return 1;
> +	u32 insn;
> +
> +	if (aarch64_insn_read((u32 *)addr, &insn))
> +		return 0;
> +
> +	/* Match ASM_BUG_FLAGS() / BUG() instructions. */
> +	return insn == (0xd4200000 | (BUG_BRK_IMM << 5));
>  }
>  #endif
>  
> diff --git a/arch/s390/kernel/traps.c b/arch/s390/kernel/traps.c
> index b6ba4465f59d..8bbb082fd5e3 100644
> --- a/arch/s390/kernel/traps.c
> +++ b/arch/s390/kernel/traps.c
> @@ -26,6 +26,7 @@
>  #include <linux/entry-common.h>
>  #include <linux/kmsan.h>
>  #include <linux/bug.h>
> +#include <linux/uaccess.h>
>  #include <asm/entry-percpu.h>
>  #include <asm/asm-extable.h>
>  #include <asm/irqflags.h>
> @@ -55,7 +56,12 @@ static inline void __user *get_trap_ip(struct pt_regs *regs)
>  #ifdef CONFIG_GENERIC_BUG
>  int is_valid_bugaddr(unsigned long addr)
>  {
> -	return 1;
> +	u16 insn;
> +
> +	if (get_kernel_nofault(insn, (u16 *)addr))
> +		return 0;
> +
> +	return insn == 0x0001 || insn == 0x000e;
>  }
>  #endif
>  
Thanks for this.
lemme test these and i'll send it out after verifying.

Regards,
Mukesh

