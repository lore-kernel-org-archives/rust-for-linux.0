Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2BB379C38
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Sep 2026 05:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789104288; cv=none; b=CR6WAOTkHaeT40+jr9cEr9+w9qz+doHdgCRIuesbDATmmPeDy5tC9tylza2qoRwj90at8COWW0q3U8tOizLKEWzgeoq3BFdXl7GEUKFs5SKCpBVq4llKa0eXZ2kKB6qGOiuIBzaJEBHMNAIEuIXSNOILGH4SsVKtFryzF1tVx/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789104288; c=relaxed/simple;
	bh=p6xYM0PLxH9VcuqNy+H/+Xv8xsyReBJbmwQjeYEnl+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBc7aoNfIEUuDP+ac7+J0CcXvKTMdOZVJU7vj9JvZV+PLxqNAir/lcuCOsnk6R54gDAhAVNgvHwdF0CCSpdeHb15rA0Fhi1AKUAycuw8kkUuI03ksuTkuLbXwHwS7rTpM4diBWnMOz2TFFvLOXLbcK+FoWJTzqJCsjXyz/Vw6II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeyvG9sb; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeyvG9sb"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so385407a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 22:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789104287; x=1789709087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPT5/AHY7+piJs39GlSgVXX0zmrz48MGY79/VqTO0Wo=;
        b=aeyvG9sbKNqAIkC2ABl/B/3N/5pWD1ePWbmv1mFWJya9g1BoOcMtObLlTqZBWn/tms
         i+60o26WV+LANTMk4zC3sqSQeuIvFZMdnS9bdn65IdjlRyZEbfOjANNPz9NQE9J8yNEt
         wftKqpuT77Y5NLvKrkGprveC/foer8szet4t/udZE2l7Cr0LvgvmAiZ15aBHuvknmEL0
         CAIMflpbtHgwh2RW2/JPtKJIZ3s+2lwfxFMe8WwTwoF0PSwe0UTw0Oh3NMT4SVDXDjWi
         lZ1fqFcswu+4TA1BCOK0+pmjtM3Rr/NCtknqJMfOZOld7QEu5bOUj7wCpUUK5vnyhswq
         QpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789104287; x=1789709087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPT5/AHY7+piJs39GlSgVXX0zmrz48MGY79/VqTO0Wo=;
        b=WMTERKCffTsfpsOk/jypXSp/twTcTa2S+pCkvkAggulbVp1XzPm8jXkZXQo/n8TFjx
         f3EsMpTvnMR1LaEBMr/kIRT1GeQlUqEGOFBPT2TdQOl/4zsSvqWseDNTsUmU/e5bUMB/
         eBKqdzVkmIh8CH/32U4d2kgT5gtBwzNdCGOCmE7sRXrRlExCuaFk60INLisLquzfbcL4
         8dwdkX8FMqHUvZRqUMsbRfmf+B1MmTUKUVSri/g+ItmK7nTJohJk4yqDDjwnvxl+LquA
         ZYTU+/ZoDs1FgAG/6A5rAEgyHLIzQ6q6PEt6WYWvROO3mUiatKvBGKa4cMDmBTdJ6x+E
         ZWJA==
X-Forwarded-Encrypted: i=1; AKwUvBxmmdKNzYJ6i0qu0XV2W4/eycLESt0rQEFl91VwoCz7Jxo6dfJAEdYmfwrUQkCn9URuDjtxpBKT/7TOa2Z6fw==@vger.kernel.org
X-Gm-Message-State: AFuF++lbzMLzYX158NHASQKATxAum0EWUXge/KoGhUHceBSUXndopjux
	mh/Zqtn3SPQbFLo7WGkbQRNQIMGqS+UeM4vbrOXyf5GhQ1vUXTpAucrP
X-Gm-Gg: AYBFou08VvGmC9EwYuN0zeHWw/Wjr0WMW5+kCLujYg1c05SjCfHfKgwj4vs8zB4d7bZ
	dIfcs2IE/OCLL/yOlFFHOlH1Y78lxxL9ZE+uNdJsbdeRwFS9BR1cBBCIEE2b9ceomO8aljatZ33
	fhoYeViBddGfZsvF0Gk5yu7ibWJl+FatScdlzcanJ9fRk8vj6yezYAmpV5Lb2D/vsz/CH/J3ry/
	aw5dg2D8ioerLgN9aWVlraZf3G66YIql5LtidYBHxlQulRrPaNNzJr5HRF7bd9cwbESixTX4yyx
	UQf+eiHwGZEHVsTMi3X9ZdhbnXV/vUMloIPb+nINywu+uGfSLJEM1oXLeXndHnUStfpi3CQxIqp
	1PSrTSaugA6/w2tbs4TsJil9hQ/V53nskrxxvv4Dguzlj7mHWfvGQRFGStLIEl06LBQ0IaCDtRr
	L42MF7+yv2pHLTey0lfT+Ds9NoSUlu9MjfuPqXINDIFPtbVmwVtUKUKI/yDu2qcGok7P9MpAtqW
	+U9DEJTXDkH/WBWt2Hk3xnzBafLlRaGQO5v9fycQ902Qg==
X-Received: by 2002:a17:90b:3906:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39d9c3727b3mr3899237a91.17.1789104287013;
        Thu, 10 Sep 2026 22:24:47 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba71cesm3416735c88.13.2026.09.10.22.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:24:46 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:54:35 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH V3] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aqOP8C7ahcxCng7L@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260910100801.2159785-2-mkchauras@gmail.com>
 <ffd8e0c3-0d78-46ee-9ab1-59dbfe0b6d27@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffd8e0c3-0d78-46ee-9ab1-59dbfe0b6d27@kernel.org>

On Thu, Sep 10, 2026 at 05:08:48PM +0200, Christophe Leroy (CS GROUP) wrote:
> 
[...]
> > -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> > -   sizeof(struct bug_entry), respectively */
> >   #ifdef CONFIG_DEBUG_BUGVERBOSE
> > -#define _EMIT_BUG_ENTRY				\
> > -	".section __bug_table,\"aw\"\n"		\
> > -	"2:	.4byte 1b - .\n"		\
> > -	"	.4byte %0 - .\n"		\
> > -	"	.short %1, %2\n"		\
> > -	".org 2b+%3\n"				\
> > -	".previous\n"
> > +#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
> > +	".section __bug_table,\"aw\"\n"			\
> > +	"2:	.4byte " label "b - .\n"		\
> 
> Ah, you left the b here. The label is 1b which mean "the first 1: you find
> going backward". Could as well be "1f" instead meaning "the first 1: you
> find going forward".
> 
> So I think you should use 1b or 1f as the label, not just 1.
Hey Christophe,

Thanks for the clear explanation, this helps a lot.
> 
> I would also try to use #label to stringigy the label in order to avoid
> having to put the arguments into quotes (untested), same for other ones.
> 
Ohk, letme try that.

> Cdlt
> Christophe
> 

Regards,
Mukesh
[...]
