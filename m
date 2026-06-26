Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3A213D53C
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jun 2026 06:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782456629; cv=none; b=BFjNqFdDkdZnfyU/3PK58Ta0n+VIHP9p7NZL8lDg3GBxEXCRWN15MR9WyAFdC0clep9abkJuzF9/8EL5pbK3U8QQTnB4ubpHuppfWs0MmHSoi03HQuYRrG8wbXmQ8oF1iTNqRreja7xblpN5Yxlar8gkcPFn9fpcea6FyX6E1eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782456629; c=relaxed/simple;
	bh=9qlvLTNPPsGGqeXnLIbL2glNyTP3E/9dVfxeXOSkHIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttv9ZKdnxuJvhD27oL/MeNRAWKRZX8gzjHNu449pAgLC1nR4RCTdgRC+Tu32vCzYZk3o0S7+25cxj1BcddWqmEtd4Zu23gdIpty0svmVymOeBARVL4dFYVDycVQ//t+WGm0vCZWSHEjCz5H2mrHk8clsj9og88j25Qy7OPj9IXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpWYoxiR; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpWYoxiR"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304f590dd91so880343eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 23:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782456628; x=1783061428; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aba3H/t6EYUlyXlaVKq50Xkb65xKw4DsCtr12qP1nzs=;
        b=PpWYoxiRbj/hfZqDYBq8QFP26t2rgqtIUONUyrMz/SU1veorBAK2g553TndRK9n8zX
         aECEgMzoIY/tYZr+GA8xvz2/NnFhUqeykmbDsU3n4RJn0TVXBgf7l+/EoDkpGs3R0j7Y
         dwyti4LbNnT2o79ujJo+uYpKVnWrLvVcJS6HS7/RpjKhBgDLJDskSO6EAOCbZm4wQkjs
         GAE+SvpEuRDAAl21PK6vdROSn/WjdvY3BZ8eCZKNSOfuZg6WlLtSutsX6k7u5RR4uxPu
         m8k9RkCL7gBbMMSPH1UBp4o7ozxFnPi8gbyj7YI6oRz7Pi9uo7x+vMG/E0eZzcuiXJkN
         we8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782456628; x=1783061428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aba3H/t6EYUlyXlaVKq50Xkb65xKw4DsCtr12qP1nzs=;
        b=qm5taaLSEvk7wVRqILnUXtNPUh9HqzpjhbOHpua8Mw/BnfhhBeezML5LhUOmEmopLP
         swzQInbE1WoX0xYZsShpDuwTEX8bER+5Iq5Kabk2yuIFLDqsxIvQ06rH0YMIfYSHjbR3
         +IwdHS5omzB2rEGE/fhl4HA/u5KkH0UOZg7cCcKmLWXsjNzWfl03npxuo/XYD3sk/l0A
         XSIv/x0cH8gQRZwm5iTdWtDwoafLs9ww9sVH7J4vJpQjuO1r/6g7WmVCxDjQqeEPEgcG
         vpL5UuZhTSeNWg93MGqGvPyQrAWu2BTEkZEmFOwqalbbHj2GfQThw84zYDlkcTxt7gTJ
         o7sQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2vmHonkCO4j6LVQjCJZI5gIPhBR7dAWGrKfloSmCpjce8pjXqszNsIOnrXkCOxicIR00HQVPya/5miq4/rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX9tVlpgjQ57DtAE/Fs9LYq4qYrg/9DS8OBZgCpKPNs7YG6hfH
	p/qoIofIffK1EFSgNrRkreoy5EiTS8lo/L40nhAC27ACu7DuLbhN/LXD
X-Gm-Gg: AfdE7ck7+sCG5Zal+zsCdMQX3Q1sGB3JdeEnbJgv12tcgB83v1W2gmmwJO5EWDAgllu
	3Q4p5BJ7D/pWZTZjoDih4mNqOnXQqEbGCxtCNpUZnLUEHuok8r9Bxat3KaQH0imnRa4pzz9Uu6P
	psLxHK2h1V1HUTKkNKba9E+my8tAvjucIdOYMj0l+Q17JlhUv0MNKXEjXGAq0nqr6fgD0XOERP1
	vQdPMrj6ITXW5xM91jM+Z7/l25c3ox9JA8QenR8SSY54Ju1wKyiQoUhLs6VX0iX1Xy4Y/aG82V7
	Uunz1RObT4AmRtDMCpXoFIOOE4cZTP+Kh3gDgkQ7ntF8+98ObH5qDuDjbMp/DZrTO8MNM8ZSRjn
	NL5aFVpRpH/ZIEZZzWy1/v2dM33KQ+pd6k3kVyzC/APSqTgcpx4a28XQwV6FW6PFzd4YivTKZXq
	laoPCqxF3yVYtZKiZ6Dq0/dMvqN28SmUbNKaX+Ffk/QN1JGgZsHaNX0wV6xfKj
X-Received: by 2002:a05:7300:8c15:b0:30c:1147:ccc3 with SMTP id 5a478bee46e88-30c84fdbbaemr6195163eec.33.1782456627484;
        Thu, 25 Jun 2026 23:50:27 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c9faab3casm2579526eec.1.2026.06.25.23.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:50:26 -0700 (PDT)
Date: Fri, 26 Jun 2026 12:20:11 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, kees@kernel.org, 
	lyude@redhat.com, airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>

On Tue, May 26, 2026 at 02:22:49PM +0530, Mukesh Kumar Chaurasiya wrote:
> On Mon, May 25, 2026 at 08:16:53PM +0200, Miguel Ojeda wrote:
> > On Wed, May 20, 2026 at 8:48 AM Mukesh Kumar Chaurasiya (IBM)
> > <mkchauras@gmail.com> wrote:
> > >
> > > Minimum `rustc` version required for powerpc is 1.95 as some critical
> > > features required for compiling rust code for kernel are not there.
> > 
> > Which critical features?
> Hey Miguel,
> 
> Right now i can only think of inline asm. I can rerun the whole thing
> with 1.85 and figure out the issues with 1.85. I'll get back on this.
> 
> >
> > > For example Stable inline asm support which got merged in 1.95.
> > 
> > It is not needed that the support is stable, but rather that
> > everything you may need works.
> > 
> I wanted inline asm be stable, I was skeptical about inline asm to be
> unstable and potentially messing up the whole system. That's the reason
> I waited for the stable support to get merged before sending out this
> patch series.
> 
> > From a quick test (with a dummy example that may not be
> > representative), ppc64 inline assembly seems to work for a long time,
> > way before Rust 1.95.
> > 
> > So, which is the actual version that it is needed? i.e. 1.95.0 doesn't
> > seem to be required at least due to that.
> > 
> Yeah it may be true. I'll test out the 1.85 rustc and come back with the
> results.
> 
> > That is why I am asking about the critical features above, because it
> > may be that this works since earlier versions.
> > 
> > (I wonder if this patch and s390's similar one influenced each other?)
> >
> I am not aware of s390x way of approaching support for rust so can't say
> anything about that.
> 
> > Thanks!
> > 
> > Cheers,
> > Miguel
> 
> Regards,
> Mukesh
> 

Hey Miguel,

Sorry about delayed response on this.
I ran it with rustc 1.85.1.
CONFIG_RUSTC_VERSION_TEXT="rustc 1.85.1 (4eb161250 2025-03-15)"

I got a linker error with this.
ld.lld: error: undefined symbol: __subsf3
>>> referenced by core.7dc3da321ed68c1f-cgu.0
>>>               rust/core.o:(<core::core_arch::powerpc::altivec::vector_float as core::ops::arith::Neg>::neg) in archive vmlinux.a
>>> referenced by core.7dc3da321ed68c1f-cgu.0
>>>               rust/core.o:(<core::core_arch::powerpc::altivec::vector_float as core::ops::arith::Neg>::neg) in archive vmlinux.a
>>> referenced by core.7dc3da321ed68c1f-cgu.0
>>>               rust/core.o:(<core::core_arch::powerpc::altivec::vector_float as core::ops::arith::Neg>::neg) in archive vmlinux.a
>>> referenced 1 more times
make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
make[1]: *** [/home/mkchauras/src/linux/Makefile:1367: vmlinux] Error 2
make: *** [Makefile:248: __sub-make] Error 2

This corresponds to a floating point instruction. Although we have
disabled fpu, vsx and altivec we are still generating these. Seems like
we have some issue with the rustc here. I didn't dive deeper into this.

Is it ok if we keep 1.95 as base for powerpc64le?

Regards,
Mukesh


