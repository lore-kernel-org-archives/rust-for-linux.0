Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793902996;
	b=qDB2TxmMaD2afmh5k1mCRxF12iC0AE5HPIqpBATyz4gO9E9p0GDo62vVTl92GyrWdlmF
	 fpJubbR7ReQXZh4+TYnf6xt2oimokRJEmKuigBg5fH8zWqY7AtlCmNchZWD8WbpM14Rjr
	 NV7Yrs2ENGlM8CAkQ03k7M85bBVApqWdvthDxqRR9Ml2LlmcxQfvTtfIMzG/5MmpvVDqt
	 vvTB5iGFyHk6a2drPLlVX+7nG2j4gISMAGTvgW22fE9TE5gnVlcYFb8+bbTwyRZJF59WL
	 f3XoRVZwamablub8nEADGZjmwX5usYar+yJNl1WHC2gftNPL8vLeeCpPMVw0QH4LjSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
	b=CR65xdw2gVgvCCRQwCCHp0aRGrkTcP5jKjRdG5UbNswQLSpb9/RKTYb4KpAfPb8cfOU8
	 vxtoP+HPAOWP7PRbvUs3MwjyLlxgWKWDbGhXdkQ4Bg53OWlZRFGtxXQDPqPf7i9nzN6/f
	 NhgjpqI24DeItO+DGDrvXuKHqi1bEWZlSlS5Yu8BHSYnhPPa6mduA/oa1+5QGvFugpIk4
	 +jRODhM5Oq3EJfWOUIGQCkUAiaZn1gmP574/CqNhPQeFiAb/rw2Pc7yBc6VVtaTKl1ApO
	 ATXujjVum1Sz8qXbBQI9hhseDcdaRLq27zob9usYvKJMq0iHUMMRFJyYlC2ujHanxyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="jT/ohXYh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70939606A31B
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 18:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70939606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jT/ohXYh
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so277a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 10:23:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793902994; cv=none;
        d=google.com; s=arc-20260327;
        b=Phb85MN8svsuytXQ0wa1EIRTt5lcG8yIKYOrLw1GNhcGqoaMUFZQcQXbAXXdhW+po1
         3wV4jingEDrGGSoaERpCfF/OV1PIMofb43UN1+7gka/9pK3oQtChXT118//1C4uGei/s
         IR8lkSrJmd8EZx6NvOJYqk4CQOucE7UpMmNwkwarisHzHfUXAYsfI2nqEjfFJ6LFY1V5
         gIzphSXd074/VgUtGKPu7ATTorQ7byG6wNT+LyuHiKwiSMb4QzSJ2vFPRgVIscaD2o7X
         HdFL2ZaIgL7LbY6UPZtCBvzRVnnf4OvUz+JQD8gxMn+pk+N1ccKM71XDvTLsydTkQfT8
         WBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
        fh=MHthO9NdrLnkXBQ3REVinGLRXEszYMQenHGUYv1dy5Q=;
        b=DW+LFINUQ1wOw1MSeL87EX1KWVzrCaZsEvleW6ICqFUJ2GKUqQY2wmqu2XLXJqiVOf
         aR17HLqHhzSqVhDD9Q7PgAV5nt+Q597HNA89CJgMtuAc9haA1DbW3MeT+e7/xzgIIt7b
         DDnHTvqTfAA/b93+m1NV/xipDJhejKCkcJA1M0PzvNdczLPPn082GDS+sjIPPrHkacLI
         NoqpixfjceBAxAubgvfgQ6fxi3s6uodY96tBxygceur6Piwf2MFj9rWsv1HLULyG+cEq
         LS1cM3d2UxFQnxyUBAlo0ppSqGCyEssVeGm3QmUS99E1hCVMwMpPEmjMDGSAURrD9kHM
         I7Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793902994; x=1794507794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
        b=jT/ohXYhKPurLENgTWdqxeeQP7cstoC8e2GlkuKhpyjND/Mncp4runY2rcEIOPnNj8
         4O/hjV1tEE670ku4p8Jh1u6TQThxTZgrUkcbdyYoiROeKgBO38FcfJV9ZLkQ9sWsqS9h
         i01ljRplTBBKdaLnMoCF4tswKbz/Gn8vqORJq+BW8APdADU8AOgiYmKPSb51nJmXakK7
         OCBlM/roy05nY3GglWvrhafWi7C7uAlGK6uWVUqKTpMqJPBlndF4leG4QpkhxE6kkNq4
         VF+NEO+LZqhwOCi0g77/HbsCi6nIvblKlrJkCSFDchgKFkHcCRCd8dFDCAhoSDYMmhL4
         LJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902994; x=1794507794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
        b=pPQPXAf7CUKN2GxqToSlW8U2QIDabN/CJyHkt/+Ve2ziQcoXqslnbL65W378D7C8vn
         fZlbGvr7cZ/C1aTCcEvzfAncbTbYwhhytA+1bb2WRxvf6C5qFJOeq/eG925I+Gmbx7av
         9k2V0iEebhdO4nZb2Yp0cGLGJdz8WdF5BiuxB7OFfqjDjzxYrZmahzs4ha+Fc20zkzzv
         Kd4rU5W5dETcugR2KEtgt54PJpf0pwA1lVJRsTXRzivOPeuIYOrSKUpmts+aQbddG7MY
         6YfDGxpY1NLJMRvAtm2Gms9MtJan3Lcwjr0hn1BQ3O/bPGcJl+aOJN+NRUA0QybzDCDs
         B9SQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2x8x8qj20MCC7r5MMPUgnpXilvPOUGZSeLaJ99HLknXfJlmgwDXyMkz83No+AH5ojC9jHtEEHBjFc0a8IXw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+C+40NIgdj8UzZv1HZWDj70K46LmnK3kpQSDeKS87doHyI7QOT
	66/WFTvAFDqouIsRdYBN7ne8DhRwe5lvXajN1W79+6VOvU3jfIp2nLniDD8IXzB54bXTn+uozUh
	d1R0iI7CxUz4VjjuYU3n/msKtRFc54GULB7CHxbCs
X-Gm-Gg: AYBFou1QuVCk+NsCk5BoBy3zvaVmsczfAz81SPjOfUwIh9lrjOQeFHe2E8TNm87a8+U
	wb4kcjCRMDtAZKCB0nFNI7QPaL3Lat9O1n/I74jt30ESWRTrdRpmYY7/+SIiPTndPLpBMN03rsq
	xdZWwL84ROtSzONC0CetmYL0XaTRbi7dnTd0qpQ2bW0K8KSjnGUJEAdAX5zEUiiM45c3DdGgOR2
	DXjuJMneCRmSXiXVlYujTg6YUFVNhwabEVpfWZt0t4EEif1RQL8nunCY+VlwTufwOv8nUSKHg3W
	rZvZLMYJFGypboJ84fQDOCHlC5oGdsbgraO64cvzYz9PuORaymEoNIPXoEjnp1D7BHhB+TgAEUw
	kpRkixSyZTng41U7V5JsNJ9vg6WvmR/rtFU0vm49KeNezfAr+2eZwUMH0DbmK+mgp
X-Received: by 2002:aa7:d0cb:0:b0:6b1:c3f3:225 with SMTP id
 4fb4d7f45d1cf-6b5974977bfmr2576a12.0.1793902993423; Thu, 05 Nov 2026 10:23:13
 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
In-Reply-To: <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Thu, 5 Nov 2026 10:23:00 -0800
X-Gm-Features: AclHuK-iL3nM88J_jGCMxHWL2RXDHV3lXy-Du5jSeqmhM1AWFtXv6dHLUOOJdWg
Message-ID: <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue you mentioned regarding excessive time in applyFlowInference
comes from Profi.

The AutoFDO implementation used in the kernel is FS-AFDO (which uses
FS discriminators). There are known issues when using Profi with
FS-AFDO; enabling Profi actually degrades performance compared to
original profile propagation. When we tested and worked on AutoFDO for
the kernel, we did not enable Profi.

While I haven't looked into this specific bug yet and am unsure if it
is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
to disable Profi for now.

Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
reservations about adding it for the following reasons:
1.  It is heuristic-based and not enabled by default. I am unsure how
thoroughly it has been tested, so we should assess it further before
enabling it.
2.  The recommended usage model for kernel AutoFDO (as documented) is
to use the same source. While it might help in an iterative build
model, I don't see a strong reason to use it if there is no source
drift.

Best regards,

Rong

On Thu, Nov 5, 2026 at 8:24=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi Nathan,
>
> On Wed, Nov 4, 2026 at 9:24=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
> >
> > On Wed, Nov 04, 2026 at 05:45:55PM -0800, Douglas Anderson wrote:
> > > From: Han Wang <nesthanwang@google.com>
> > >
> > > AutoFDO profiles are commonly collected on one kernel revision and
> > > reused across subsequent commits or stable merges before a fresh
> > > profile is generated. While AutoFDO uses function-relative line
> > > numbers to tolerate edits above a function, adding or removing lines
> > > inside a function (or an inlined helper) shifts all subsequent
> > > relative line offsets within that function. Without stale profile
> > > salvaging, shifted callsites fail to match their nested inlinee
> > > profiles in SampleProfileLoader (dropping profile-guided inlining for
> > > those callees) and basic block sample counts are misattributed to the
> > > wrong instructions, degrading branch probability estimation and
> > > machine function splitting.
> > >
> > > Enable LLVM stale profile salvaging (-salvage-stale-profile, supporte=
d
> > > since LLVM 17) for C, Rust, and ThinLTO builds when
> > > CLANG_AUTOFDO_PROFILE is specified. This instructs SampleProfileMatch=
er
> > > to use lexical callsite anchors within functions to fuzzy-match and
> > > remap shifted line offsets when querying the profile.
> > >
> > > While -salvage-stale-profile is not enabled by default in LLVM due to
> > > the minor compile-time/memory cost of sequence-matching callsite
> > > anchors (which is unnecessary when profiles are freshly generated on
> > > the exact commit being built) and the heuristic nature of fuzzy
> > > matching on heavily rewritten functions, enabling it makes sense for
> > > the kernel: hardware PMU profiles are rarely regenerated on every
> > > commit, and anchoring on callsite names is strictly more resilient
> > > than blind line-offset lookup when functions are edited.
> > >
> > > As a side benefit, remapping shifted line offsets also avoids feeding
> > > mismatched weights from stale profiles into MIRProfileLoader's flow
> > > inference solver (applyFlowInference), working around a compiler bug
> > > [1] where a small intra-function line shift (such as in
> > > __vm_normal_page() in mm/memory.c) can cause applyFlowInference to
> > > spend 30+ minutes compiling unmap_page_range().
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [1]
> > > Signed-off-by: Han Wang <nesthanwang@google.com>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > Much of the commit-message justification here is AI-generated. Sorry!
> > > :( Folks who know better, feel free to call bullshit.
> >
> > The justification does not seem wrong to me on initial read but it
> > definitely feels like the first and third paragraphs could be reduced i=
n
> > verbosity since this can basically be summarized by "AutoFDO profiles
> > are often reused, which can be problematic without profile salvaging
> > enabled, which is designed for this exact situation".
>
> Happy to reword or happy for upstream maintainers to reword themselves
> when landing. If you want a v2 sent with shorter wording, let me know.
>
> FWIW, I actually asked the AI to add some of this text. Specifically,
> I felt it was important to explain why LLVM would not make this the
> default behavior but why it was still the correct behavior for the
> kernel. ;-)
>
>
> > > Honestly, this patch came about because of AI analysis compiles takin=
g
> > > 30 minutes to run (see the clang bug [1]). It seems to work around th=
e
> > > problem. Obviously, we should fix the compiler. That being said, upon
> > > further analysis it seemed like adding this flag was beneficial
> > > anyway, so I'm posting it upstream. If folks disagree, we can simply
> > > drop this patch.
> >
> > I would definitely like to see that issue triaged but like you say, it
> > probably does not need to done before this is merged since it has
> > reasonable justification on its own. I would love to get thoughts from
> > other folks though.
>
> Sounds good. Thanks for looking. Let's see what others say. :-)
>
> -Doug
