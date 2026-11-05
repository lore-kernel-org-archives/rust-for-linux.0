Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895865;
	b=j6r3fOTE+CJ84Y7489aUqcEChTmuCttX16tBh/2aG5D+wp+ANg9O9kQ4bMf0CVHslcvF
	 kpc9sCtWsPXNWvcUJC3DT9JP8qq7GXUSq0WCB5Z2gwwFqnpdwOjcxhdRtwHy/nD6b6+vJ
	 eAoWVeKtUHP0XX6nGhTgq9MMqOOJJtT/FJWqFeKc0Jy1RqcmcNSxkoylui7MrsZMIn/Lw
	 wnI7FECdo7289FGPLftEjF0VuBeuKt4y/yBXTOCcxaVrOmsOrjfD5idaEEHKyztZgmBy6
	 VtM4luGu1TK3sEbpL/Tb0T7xrtHZmHjaZbB5B8R+LlbcGy/36oNDw4t9xSgnCikMd6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5prWUgliJcOAr4R1nMCKAcSyRg6dSeYd31zgPiidQv4=;
	b=ZOZ0H5f8D/uSeQKiTfdS7QtrZpPE7RGaOF67tBA9cR+KDJIPI3ia/Iq3hYE+CIRAFqy+
	 eXdT9LYMite4f7RV04JOKTiKb0xHofC0IYKhtSLWAFj4DR6ZzBxUSwTguEju2kFEOxx2W
	 LysvCAwEfmcOEk8QH/4rWX3X7/pzKXb7mykO3eYd0/SG/ZBSMNw4ttJkrmbhdE3fyQA4p
	 hjFLpT7rfjXXLfThrxPEkBWpSO8y9AJDPX+8zPfLYep0L4sBHTCuyn+rcGs07W3XUcCBJ
	 K5o5Al3JO88h6e4KWnbJOf+NshVxTEruiJ0LgXO5qawZJxG8rHczeaWFabWlspNi0Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EUkbRWrf;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AAE606A326
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 16:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23AAE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EUkbRWrf
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b5669a5100so2494152a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 08:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793895862; x=1794500662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5prWUgliJcOAr4R1nMCKAcSyRg6dSeYd31zgPiidQv4=;
        b=EUkbRWrfpe/iVp7dxMSezAHNB4yWj1s88YkbNbWMwE+ZAthxJlImnMWoEqwcFfm1PI
         nhaivXKcHXh4sxBJt0rDCNJVHyidhohJtp/hcCA6oJfmuzgY1nNXn7C4nMKxIMNLDoLB
         OQEV46KUlHC7SGLaPgE/TkgPzTSCysaAF8r+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895862; x=1794500662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5prWUgliJcOAr4R1nMCKAcSyRg6dSeYd31zgPiidQv4=;
        b=al9BIVH8kDqF4IYKOtl81lwsBc+EUgTuPBeDUvjeqd2K5tSpvjSVQHo2VQ/pe7X3lM
         OGGV6NeGw6es1xxUAE+Sje4pP+iEVmxttmcEzhAMHzsQf2IJK3oEpQ9Yr3SCdppLl1cv
         TVaaog79Sp4o7ZBXhoz1J601hzHZ7F0PV6Pw+tQk5ZGoi750DYwlYpPIFSZ5zf/uLpXC
         oUmtuHi0GevgMjThUe2kBxIe0WrzJtL7Hl0m7BTwSCiy9q5SsC2rGCfZ5QX5Wir2WBiZ
         Or2N9Mz6/TsJY5plcCCKZMzm3OTvrtN++BkO6Kpuw0diW/0dtdZbga41lPWjKeLb8GRx
         Z9rg==
X-Forwarded-Encrypted: i=1; AKwUvBzEBeyWeZYH5XqNZvV+gtma9Tce2HdX10FDp8g0sy0MpmseLS5IL8fzw+cg+UU5h+aYP1+MnXvAuW5GQTfvzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+1+z7wHOZPf93Fs6pHB13dRx+yFwknz8n8dUCSXFmZAs9DIuC9
	3Ctvh4cJhrLV3PlHz262g08jrVMIlt9HG+v2BA1vk9Y/81aKIMNAHFEAS3a0XneQt7BIpwa4Dv7
	ygN44m8gI
X-Gm-Gg: AYBFou3DwMsaYzpqLA7+DAdGczm3HEFrSwEiqb5DlmmplajGEUoWSwfdqc5aLG6NM91
	IqFCtnrR5v43/ehQfOdUcZ7/cU7GJS/m1JcefOocQjEycmSOkvfHuCertOGs8hibiCCPVDUpbiy
	xsT9/bDuy4hiNERy2v5e6FIlQ2wTGzKeBPt5lIYxApBVaYKPiXy1GrDg32H5ceZOppQR09D+jed
	RxWto/1ElG8zgTorn5rC6YavyFQ+zQ+M2ZzvE+lucNj8qXIfSxLG2MvMGm58wSqKP0VPUY3pebB
	vLr5pvS2sljlQuTSq/HrRoIQr3L5J0gL5Pz2mhuvo2w9YyiETv1DKOHIiKQMwHgQlsU9MoGU104
	+bdHVZcjzfqbBBrsyhD9MjpEdS02bfOnKu0O1I4XrjKw9UfAjiVMd6+/dgEf/qygV9DGNdN3QZN
	0X4JZdIyLI4DHAP5YZ3cVjVi24uEEa63HfbQ6FSHMybdaTUPyx7Rdw7bIQCa/SUqRZrCQYUPTiD
	ZXR0n0fa2dwGq9HmJj8OGCzfsP11YASmKitL73awga72xTpVkg3kEupmSVTRAcFFuY0fNgJ16pk
	gF5ADOgMwsYaK3aOtQ5UOINjZhn+kPOpOf3tPpNBZXVaYJ8tdYvHBC8nniktaY+FGhw=
X-Received: by 2002:a05:6402:434c:b0:6b5:9133:309f with SMTP id 4fb4d7f45d1cf-6b5913336camr541355a12.2.1793895862446;
        Thu, 05 Nov 2026 08:24:22 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55abd5569sm2009267a12.5.2026.11.05.08.24.18
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 08:24:20 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso16005375e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 08:24:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzueZMQ+mi3SdTVk5gj/634cPELS6pc+9bmTLuvhI5Lb77rMFuWBx9lJbMHHmYxqPq4Hq9KQaG1WqfNfCLYtw==@vger.kernel.org
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6400 with SMTP id
 5b1f17b1804b1-4acaae665a6mr332973265e9.13.1793895857514; Thu, 05 Nov 2026
 08:24:17 -0800 (PST)
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
 <20261105052401.GA862715@ax162>
In-Reply-To: <20261105052401.GA862715@ax162>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 08:24:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
X-Gm-Features: AclHuK8NKe2Ice8G3ieACvjOY5cRy1bgQZ2ikhne4c6q9f8t2mnwrvferc3g3-I
Message-ID: <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
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

Hi Nathan,

On Wed, Nov 4, 2026 at 9:24=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Wed, Nov 04, 2026 at 05:45:55PM -0800, Douglas Anderson wrote:
> > From: Han Wang <nesthanwang@google.com>
> >
> > AutoFDO profiles are commonly collected on one kernel revision and
> > reused across subsequent commits or stable merges before a fresh
> > profile is generated. While AutoFDO uses function-relative line
> > numbers to tolerate edits above a function, adding or removing lines
> > inside a function (or an inlined helper) shifts all subsequent
> > relative line offsets within that function. Without stale profile
> > salvaging, shifted callsites fail to match their nested inlinee
> > profiles in SampleProfileLoader (dropping profile-guided inlining for
> > those callees) and basic block sample counts are misattributed to the
> > wrong instructions, degrading branch probability estimation and
> > machine function splitting.
> >
> > Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
> > since LLVM 17) for C, Rust, and ThinLTO builds when
> > CLANG_AUTOFDO_PROFILE is specified. This instructs SampleProfileMatcher
> > to use lexical callsite anchors within functions to fuzzy-match and
> > remap shifted line offsets when querying the profile.
> >
> > While -salvage-stale-profile is not enabled by default in LLVM due to
> > the minor compile-time/memory cost of sequence-matching callsite
> > anchors (which is unnecessary when profiles are freshly generated on
> > the exact commit being built) and the heuristic nature of fuzzy
> > matching on heavily rewritten functions, enabling it makes sense for
> > the kernel: hardware PMU profiles are rarely regenerated on every
> > commit, and anchoring on callsite names is strictly more resilient
> > than blind line-offset lookup when functions are edited.
> >
> > As a side benefit, remapping shifted line offsets also avoids feeding
> > mismatched weights from stale profiles into MIRProfileLoader's flow
> > inference solver (applyFlowInference), working around a compiler bug
> > [1] where a small intra-function line shift (such as in
> > __vm_normal_page() in mm/memory.c) can cause applyFlowInference to
> > spend 30+ minutes compiling unmap_page_range().
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [1]
> > Signed-off-by: Han Wang <nesthanwang@google.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Much of the commit-message justification here is AI-generated. Sorry!
> > :( Folks who know better, feel free to call bullshit.
>
> The justification does not seem wrong to me on initial read but it
> definitely feels like the first and third paragraphs could be reduced in
> verbosity since this can basically be summarized by "AutoFDO profiles
> are often reused, which can be problematic without profile salvaging
> enabled, which is designed for this exact situation".

Happy to reword or happy for upstream maintainers to reword themselves
when landing. If you want a v2 sent with shorter wording, let me know.

FWIW, I actually asked the AI to add some of this text. Specifically,
I felt it was important to explain why LLVM would not make this the
default behavior but why it was still the correct behavior for the
kernel. ;-)


> > Honestly, this patch came about because of AI analysis compiles taking
> > 30 minutes to run (see the clang bug [1]). It seems to work around the
> > problem. Obviously, we should fix the compiler. That being said, upon
> > further analysis it seemed like adding this flag was beneficial
> > anyway, so I'm posting it upstream. If folks disagree, we can simply
> > drop this patch.
>
> I would definitely like to see that issue triaged but like you say, it
> probably does not need to done before this is merged since it has
> reasonable justification on its own. I would love to get thoughts from
> other folks though.

Sounds good. Thanks for looking. Let's see what others say. :-)

-Doug
