Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3544E407CDF
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Sep 2026 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790318214; cv=none; b=E1gGT75vBQj7D8dXf53yGX/MA+BvzQHfpcrVSibj2/5yoZUlwegcGJP+EkkyLGa3PiJYk0AmvzxV0AVsgVkJZS6HIgdoUCr0K4P3yYQpRPEp7xISR80AWrxIpAN+cOh9pet0JhiXnk6o7SOKUTy0XGIkT/xNbLmI6WEIFj+/Oc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790318214; c=relaxed/simple;
	bh=Y0BkeFR+jc7KLjpu5J0dm3/R2PZPKVLNTuUhB0q6vEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBs8IP3Efe48Llh7NcNstOxb2OKTS2EE9mk3W60KLag1h43oXanRkQqtkogrFiYt9AmbUWFPXXMgaA2wZ6tXdJy5CDgCWFuCo2N11I3FpTe+1ssHMKeHxgFkqTuFvYdEI13igFpQPaSKlbHbVkVu5R/jLw9Jp9uC+NRDyA66hs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CafBEdOC; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CafBEdOC"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso410909eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 23:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790318210; x=1790923010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GkZl7SRHY1wbGx3TBWUhC4BzBN19cLafsEXyXuI3yfg=;
        b=CafBEdOCzcg4JNUMwKe46woQX4QFu6Mn1IG3Nx6YQw0TvGI6WLvPjcL7723jQPbJUG
         skwyoNSWWeHZag7EITUu9kKFU1vJTOEEddUDS0fGQQIfPsm5T73sPn5IH3XUpJP7a2M+
         SIkc7HI4ktohsXOJRcWpXRjc1F21OekQe0Zt6kV05CiRVQmn1FV/2kAi6tQ6xmb0MlZY
         V5Jvn6vkVLgFJEyG24OvhJenxiVay56LjBHJ18Q1qv7WCkW71A6IShEAf2FCXTt+UATA
         8ARNYomP8aD0L2KZ//5DitCJ8QRYry+gtoXRQ+Yo3by1WQW8eAw2XVAePuZiR9IMGU7y
         iPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790318210; x=1790923010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkZl7SRHY1wbGx3TBWUhC4BzBN19cLafsEXyXuI3yfg=;
        b=ocgPeKlDRgZoRQTiWRcD4cC1Zq7hpRu6q2xRyhfr/WkXAt8zuwKMYcAbdIjrr/DkXD
         8s6K/66fc5rWEI5shQyI5SlTBFPRr/nX7fIAkLMvW2CaSsUVn1zKxQGW0MrO8qxslOWN
         JHnMQUHVp2hMqMSjhj84RESwnS/qAzYLNHLi6WJRBvwvTCUnF6a1yniCFCh/vRPAKOcD
         rJFGDs1KL9HREfqCFRIQfZA57GGcAlzXei9OYTd3NDpBFVUIFW5wjRFJuxjYUb5obW5/
         YSYWyT6cPKGWr39tVO5m00xAKUyiwI3BmtTtUEQQ6A8E45/eRz/5LbAOsxr1XtW/UeVG
         G7Xw==
X-Forwarded-Encrypted: i=1; AKwUvBzJL/obUrWJUEKWy6Yfr63wim+kYhM15CJqsMdPPx8vNuJoMswte0Y8XIjsVdLiPfZdtN5y6mJ350ML701dHw==@vger.kernel.org
X-Gm-Message-State: AFuF++lOP0RKJZSOPbxB4hPQNW47EbN0cnIZu8fxtPBCBEmNayBdxiN5
	LHZR0xHidOkfYBgJlG+yYgfUs1zBvDpJKqX03WIdVoLHejsGRiAGcUju
X-Gm-Gg: AYBFou3t1T5t9bBvSYMKexJ7p/oy6MNuzzNYs5/TuWaFZ9/stRwSSs/0LgG2evJGplZ
	+Sililb6KXjtzlxnBxZrMbvHOYw/+vdRfCsCzjtQ5DO1xuNljoyUV7aJFLddpAAN4Z4FPqjfPYj
	sjw7RpOmTtYHYBUHrx44MOPHOA2L/s+vzqhkrw8chTj3iobpS1FKDWysHFfSi8ERa5Mo2cY09z1
	HnwBkzXTKU/8wQrlx2cFmycHI0vMfm6/kiuvmMGqqM0nMK2Nen2Yd3iY00nAnh8VWFhJhJ3Im79
	sf9ymwZJ14aoO5yauBHRxB49ltEwKomAK+BQT1VTes56/exltOif0DSwO3eqTEm9uYiFC1JLr3/
	NJHunxoaoUlUhvnArzAiuMv4qEVDVWgy65IkkYNSr/NwUjdEemlyGLbIeq4x8YGEQCW36XwN+Si
	IsVBfT2BkM5cjXNrKCSNo9k9onb7j2h3UbHOytk6dQmx2hkdPdkeAGZS5IscIJ1UL7AoIn2h0dM
	k1I1t2CvJwdAyjKZK52BZ13Gu9WeENF+5cqnAZTdnrS
X-Received: by 2002:a05:7301:160a:b0:33b:dc33:7f98 with SMTP id 5a478bee46e88-340db4b9d18mr2352154eec.14.1790318209994;
        Thu, 24 Sep 2026 23:36:49 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145727589sm3789127eec.23.2026.09.24.23.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:36:49 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:06:28 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, jszhang@kernel.org, japo@linux.ibm.com, jpoimboe@kernel.org, 
	seanjc@google.com, pmladek@suse.com, thuth@redhat.com, ynorov@nvidia.com, 
	joelagnelf@nvidia.com, david@davidgow.net, fujita.tomonori@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arYWDWmMJgIAt1_W@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
 <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
 <20260924151335.18402A8b-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924151335.18402A8b-hca@linux.ibm.com>

On Thu, Sep 24, 2026 at 05:13:35PM +0200, Heiko Carstens wrote:
> On Thu, Sep 24, 2026 at 01:15:57PM +0200, Peter Zijlstra wrote:
> > Untested thingies for arm64 and s390x.
> ...
> > diff --git a/arch/s390/kernel/traps.c b/arch/s390/kernel/traps.c
> > index b6ba4465f59d..8bbb082fd5e3 100644
> > --- a/arch/s390/kernel/traps.c
> > +++ b/arch/s390/kernel/traps.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/entry-common.h>
> >  #include <linux/kmsan.h>
> >  #include <linux/bug.h>
> > +#include <linux/uaccess.h>
> >  #include <asm/entry-percpu.h>
> >  #include <asm/asm-extable.h>
> >  #include <asm/irqflags.h>
> > @@ -55,7 +56,12 @@ static inline void __user *get_trap_ip(struct pt_regs *regs)
> >  #ifdef CONFIG_GENERIC_BUG
> >  int is_valid_bugaddr(unsigned long addr)
> >  {
> > -	return 1;
> > +	u16 insn;
> > +
> > +	if (get_kernel_nofault(insn, (u16 *)addr))
> > +		return 0;
> > +
> > +	return insn == 0x0001 || insn == 0x000e;
> 
> I have no idea why anybody wants to do this, but it looks like I'm not
> alone :) In any case: the check is wrong.
> s390 uses only the monitor call instruction and this should be
> 
> 	return insn == 0xaf00;
> 
> At least it is not possible to set a kprobe on bug instructions, which
> would make this "interesting".

Hey Heiko,

should i send this out along with ppc. I am not paricularly very good
with s390's assembly, but if this looks correct to you, i can send it
out.

Regards,
Mukesh
