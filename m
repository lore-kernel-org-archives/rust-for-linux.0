Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F82644AB89
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Sep 2026 21:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160469; cv=none; b=BE5Mtz54WJtQHNWjFzwYrh/1+9niPIZyCNpbN7Udh6DoT9wX6GwecNLf3Pxm6QtLt/IjJXv/6YHzB6Ay/V2Z5l+bg/T6lSKt4/si3/71snp4Rw02X08Gkyg9NZcHCOcIYCzQA6fAdmaMW1i2tgUABRpj47qtm0v2FtEtc3RtNcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160469; c=relaxed/simple;
	bh=/W6FCmv5ibQNEpHI4GROMvUWyoZn8nstXtz7Y5px5C8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZjVVoOQmtTmunJPqbI1BfYRyixJzaiZyTy1igFEZjq7LjRPbx51qU7YHxaRvvUAQ1A1h2mjDKgJpG8KF6FJWQILZwdbaF4BMzkh+QryJfledwBVBED6k83its0N3oND9fj1SekuC2qPwgOjxjgoPeIVgREl/BRDED5RhKl+F9o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNPwnScA; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNPwnScA"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843172bff4so118752f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Sep 2026 14:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789160465; x=1789765265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W18BjSa6bE823jCNrSo5QAggwLMczPlVTE3fEsKx2B8=;
        b=KNPwnScAFe2jcxrIlyon/k2wmuOoT5Tqcqt5fuZZMQjtGPbaKL9kPFnS36vKd2iGot
         GpoqhZ1pU8yCcJ+iKUY/1halq3cgszxCSMC1xpTvTySZdLeq2/5xU3Y5y5fULjHKk3c2
         w4wjC4NMVktBNnbbrpicJCx1K69y31GvqkzbZn/O/WIkT8r9R6LfSeU5ytUq9R/t5q2B
         M5CTCU8NCW5yKpAdDsBoTxMTRUK6ujBn9J0qAb0Rr/lPjMUvxL0tE1i9aJPncbtWqN8L
         l2TAesbl7p4S3lqI6Vhft4rq9vpgv4MvrnLafSpnRg1VIoEz01aDPZP58+rTeNGhQBGh
         /Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789160465; x=1789765265;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W18BjSa6bE823jCNrSo5QAggwLMczPlVTE3fEsKx2B8=;
        b=RWYSJJUVPy9Ef1RViQOCkbeenJ2VVOUiDITPSPpd8y6IqmHa5KKKBmRID9HffO3Hqx
         iyQ2si9q6+re8BIb6IcmzYmDz1tmx2wPzKUtGYVWeWNkAHul3BSpgIbaYHeSIjhs/2xn
         9Tp4jvQte3GklHyhzUgPK3Q3/MNeK1Qt5YOgCO3i0JxEYEUwiJwDRE1T87HlEqRoOJ0d
         x/8ihxGizF+cTgm5Vk6ogo1Y29JvOTtqfe0b0PdbqhuVP2VrZv45h9BLDUkLGjzjFHwY
         TM356mBaPlApZpGhnurHzH17eXgLoSOo3O9bLS+mzSB3by/19CHXbF11620+Y/DkS+XT
         S+2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwkBX7UJyTMFY2vyJGl5Cbque5Ug9Q2x7e0F6eElezgXqWo6mreersFHtgaVYkBbCWN+nMWlGqzTB82V6olVg==@vger.kernel.org
X-Gm-Message-State: AFuF++m1tpa/LzeOb/ygrEakNNKvkgH1kc/moZrQ2S1zlUxkdXoayE5P
	oJhCnaY3kGh4K834MvTI1JWiRGJkfYOleGT9tZ1QyU4QNm1hkWId8eFL
X-Gm-Gg: AYBFou2DAEi4Ouw5T0YyeFaMrbWdiAgzKDvSEOzCkA+s00jRGJfoS60vivwtrtXQsTv
	pVWy+XqWVDE+0ilEQyBYUDGpLBygjkRGBZ2APBvKCeOj9B3SaznOLuZ56XQyLjbqAQp+AVpMPsN
	BCtX2CSJUJZgvfdxuxFZWk0osWPPPZZMfPCzfLA1m3U32xnuSKSUTmJLzu2IyJ01t5SLsjh2tIB
	f+lyVY6EDEpZqsWDQbIem28AhVvmARdZpo9EkbBBxdAiIsRYW68RH9HwAkcVb2PpPd09ti5YrCR
	ZV9fEyEyNjuzvQSQ65nxBpdGbCbZcRK9cExnYLlKgMcylUP/wofIjGfbIFh0AFdJXPP44KCm/gd
	nxUwfUavUrVMc5NnHNI3ifocP0GHVPA1DIcQzpdGjN13e78zLtxhXspI7t0QO83J3uBIRzqz0h9
	qQiewzRVlOeUqtUCu2Y3pJGYBfDGzR0FSjNLA6xzFuMsww8qqrEgALCXbL1neBnYzC2E+vEBDrQ
	r0WR8V4F4Z9EsFDhs0hBjTa3m6z9HBs2Vou
X-Received: by 2002:a05:6000:646:b0:485:8ca8:caa with SMTP id ffacd0b85a97d-486eb34c229mr5448307f8f.52.1789160465448;
        Fri, 11 Sep 2026 14:01:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb359f38sm7798317f8f.30.2026.09.11.14.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:01:05 -0700 (PDT)
Date: Fri, 11 Sep 2026 22:01:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>, Nathan Chancellor
 <nathan@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <20260911220102.1d3d696a@pumpkin>
In-Reply-To: <aqRGYXKDzXZMXmmp@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
	<178901395292.3971858.13236774094648272066.b4-review@b4>
	<20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
	<20260911183333.1df0f2e2@pumpkin>
	<20260911-invaluable-indigo-seal-e31aec@l-nschier-aarch64>
	<aqRGYXKDzXZMXmmp@gremlin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 19:24:50 +0100
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> On Fri, Sep 11, 2026 at 08:17:57PM +0200, Nicolas Schier wrote:
> > On Fri, Sep 11, 2026 at 06:33:33PM +0100, David Laight wrote:  
> > > On Thu, 10 Sep 2026 17:42:35 +0200
> > > Nicolas Schier <n.schier@fritz.com> wrote:
> > >
> > > ...  
> > > > Yes, skimming through the patch, I thought about that, too.  Moving more
> > > > cc option checks to Kconfig will make building out-of-tree kmods with a
> > > > different compiler more dangerous.  Maybe we will have to make the
> > > > warning in Makefile's prepare (external kmods) target a bit louder.  
> > >
> > > One problem is that distributions have a nasty habit of shipping kernels
> > > that are compiled with a different compiler version to they actually
> > > ship as a compiler.
> > > In some cases the versions are clearly the same - but the version
> > > strings differ.  
> >
> > yeah, I guess you hit the mark.  
> 
> I mean this is a problem that already exists for any flags already specified in
> Kconfig.
> 
> Out-of-tree modules are historically something that we don't go to great lengths
> to support and haven't historically worried about breaking, either.
> 
> I'm sure distros can find ways around this if a problem were to arise. But I
> don't think it's something to worry about all that much.
> 
> I expect a _lot_ of these, in any case, would only require the compilers to be
> within a fair few major versions of one another anyway.

That is true at the moment when the version of the compiler being used
is checked.
For instance it doesn't matter if modules are compiled without 'asm goto
with output'.
But if you putting the options in Kconfig the compiler being used better
not be older - or it might not support the options.
It isn't too bad if the compile fails, but some are silent.

IIRC it is Ubuntu that has different version strings for the same compiler
version, and Oracle that ships kernels compiled with much newer compilers
that they install by default.

David

> 
> >
> > --
> > Nicolas  
> 
> --
> Cheers, Lorenzo

