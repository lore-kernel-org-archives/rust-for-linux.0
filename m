Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164FC3BE642
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 07:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408316; cv=none; b=j+xROwywrvM3UppXlursDmYAK1ZBxzB8a98zNYPIzktdyPTiS8G0SjuVFYPHLwbFonb0yf+p4uMf5DLcgWASg+QHogwCTQ0WLI3lHm+ZpkZNGJvLs27tnGkg4uJmCoF6C3YKFqvfd/BtMokK2tOUvwxiuHhWF+Uh3pXIyufxvtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408316; c=relaxed/simple;
	bh=dYEdQ18sgc+rSkPRjPzl6r1N6/BcC4c2WoZoXXxoK4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbGkmyK/wCJ38Ly+wB0oWhhCI7P1jLb8MlTA+ADmTnpgXzdEhFgoX8ZflgQptmX1tLo73p8Bp28ph+B1BQn5U+YvZCuM+DhwwdYg3XQV+tJ1nWT9FlcwmsfGfbE+qX3H+4lWQXzK5dvhNmipPOnud42vYEGlinb/MZxB3nl45No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjuRJYVT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjuRJYVT"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cacb8416a1so31925295ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 00:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783408311; x=1784013111; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKV78wv3WbZUmoFpUcsGcDjAxX6ML3nr/lm0iF69y48=;
        b=gjuRJYVTs27aW7Y7XGnAMm3P80N1o0Vdwn+fsQbvx2QFfc5flvyW4u9/hFCHuYp4MX
         2n9YDPHuFcz/7xzxlXoDvGMv1OUUTrX6vDAO2FPq+ts6NlNTtXSIEe+dftERJWXmzw5u
         xOfHOowxqg1Pu0oFTaVtcrfhy57cFL3G5PS+gw2Z2u+XtBNFHsV7TDSMqXVOMNkxiXO2
         owtF3i/UMiCP22UYvG4EwrYKNkGlb/XvarRSvVahlzM/bISw30BIU5UHmtnelUzG+mao
         PslXC+iqoC5hy0C9TMMH12BKx6PsgvOdmlJSlMOrxa0pESuKP/o09kMQ7HWVUcmJuNgL
         4UOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408311; x=1784013111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uKV78wv3WbZUmoFpUcsGcDjAxX6ML3nr/lm0iF69y48=;
        b=WEagbA8ykQAtN3R015g3RtjhbkQ9a2jM+6NNuz+Eqjinx20Zn+y2fO0JYobPpLfuC+
         76o6ijDBR90a7ItllofV9z1D/s/jsiIt8HWSH7Ry6PUKbvRuv6RWzaHImskkhd+71mvs
         2pek38qbBS+wx2WAwLkX6WciA0RycbtuLFM5bXJvVJUJc/cPh/vLrW4+AXtInXe9+9fK
         E0fiOSM6c9ODPHBvpbzG/vG9yoUWCoDCGlaXlk2O5HC4g1EyNk20BEaMT8WMN4mFIiNq
         uWsY/xuXHOyH+4mOhqwFEgGC7GsalQHf17uC89N1V5/JVaByFrvGdwZr9dRWMfFNao4p
         dDKg==
X-Forwarded-Encrypted: i=1; AHgh+RrBoPWd0+3qJGMad5sz9Kfgzm/kguCDVD/2vdy1zgVpaZ355MjQKjJnQOuwVZmWxLQYSsL2gLRQ20MxqnJw+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmZhBCWHJilU+AY8nGoiUzmV2MXpzeclkZQa7ql/tluBryXMi7
	bIk2ctV7kAhdltsjACwa/h5IH2iCHEC136TggjR/Sy4S7p02BgjCA7EH
X-Gm-Gg: AfdE7cmQzOYj1LMyWIUXdLF63BTq2WPRYbtdyOSDaI4ZhseMzkfFi5ZF2BhDBW0adZS
	36LFJsYc/T4t7HqADV91Qwn79RNDCk9ErgfZFDCWbTFs2UDHBS78ZrG6Pj3OVLNtlRu9x2btr7Z
	PJM6cnaS434czb0UCtpnDUKKtJ9t0PyxJ3w9SI/IgU2CjAiH7u4vhOqtd15qWzS6nu2vn3MMUST
	QpzVRG2pVV0nulKIFUV33hDmpuWmyk6zVMJKuDfzB+wcHYEvZUlGcDdfWQAovb7wwmPCWi0goeD
	YD81Hw/6XcEwJFAiz8Yl0eLX67IqSM6v6FKbqiJ5E28nzf5UnB29/h3g+NhhRnoAnWaDD2w16MV
	WratjH/GA1ej6mUzQt7tHooLlxocf8Mh7t1oq3r+0MXlWVZCChP5M25sZdy09rez+XURaod7Gkt
	AbtX+hyEvCUd2GFF8hvI9fntjtcPCHwv2MNawmZLAv2FVSRB0SFUfKJFjghqeFVXzaaZMu2YI=
X-Received: by 2002:a17:903:4683:b0:2ca:be8:62d with SMTP id d9443c01a7336-2ccbf085003mr50131725ad.32.1783408311212;
        Tue, 07 Jul 2026 00:11:51 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm6556115ad.18.2026.07.07.00.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:11:50 -0700 (PDT)
Date: Tue, 7 Jul 2026 12:41:37 +0530
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
Message-ID: <akyiZBPCaZOOyTw6@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>
 <akH6yuDH9ZwXVoVA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mj1P9QykK6vbPK37hZkMLwd7RcgVWEcxxuE=9OL+4bAg@mail.gmail.com>
 <akNXvfSfue7_3tyd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akNXvfSfue7_3tyd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>

On Tue, Jun 30, 2026 at 11:15:03AM +0530, Mukesh Kumar Chaurasiya wrote:
> On Mon, Jun 29, 2026 at 11:11:44AM +0200, Miguel Ojeda wrote:
> > On Mon, Jun 29, 2026 at 6:57 AM Mukesh Kumar Chaurasiya
> > <mkchauras@gmail.com> wrote:
> > >
> > > Sure i'll bisect. Meanwhile i would still like to get this upstream.
> > 
> > It is very early on the cycle -- I would suggest bisecting first.
> > 
> > But it is up to ppc, of course.
> > 
> > Cheers,
> > Miguel
Hey Miguel,

I was able to bisect this. This got fixed in 1.87 with
#![feature(asm_experimental_arch)].

1st commit that contributed towards this is
e4f539ea17a3 ("Bump to version 1.87.0")

This caused another issue to come up while building

```
error: extern blocks must be unsafe
  --> /home/mkchauras/.local/rustc-src/lib/rustlib/src/rust/library/core/src/../../stdarch/crates/core_arch/src/powerpc/vsx.rs:38:1
   |
38 | / extern "C" {
39 | |     #[link_name = "llvm.ppc.altivec.vperm"]
40 | |     fn vperm(
41 | |         a: vector_signed_int,
...  |
44 | |     ) -> vector_signed_int;
45 | | }
   | |_^
```

Which is fixed by 
a78d1b092c9c ("Update stdarch")

Both these commits went in 1.87.0 and fixed the build.

Regards,
Mukesh

> Sure, I'll bisect it first.
> 
> Regards,
> Mukesh
