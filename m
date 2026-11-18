Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795032723;
	b=SJdArJ5HrFVGRbjhXjMCcwrs7h2Vqn9HecqbcwHCJOI2+iwRi56kmwVutStwF6LOH2d9
	 DSH+w0xKm3ZDHs7hDcLn61Sf8h6NomH9urbvu3p2bc9hHCfsxj65tX9YR6paFTYp1pjy6
	 cR5FaowK32D6wobRzMKYjL9NuJP2AwizUrOdU2gzAqeAvnLCPqYkmkTVaqfsaJNId9x20
	 EBNuqnhLBBdiCyLvHqrcfLdjSnNMCD3eYLjtE3e1ZiD0WOe7RVZyX9xSJcriRUeSVcRDl
	 amAAzZX2qI2AldzkLNPNjx212c4e1FGjKETK3sncx/fj1J9+DC/o/WuNXzhJAd8NJig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
	b=bE7XlSNNuQZlgrY/U+yNtYVW5lhnEuu9eHzj7sXtPNhy3gEbxA1NmAEnrxlnm32WDKFU
	 TDbc7b6VC80cNtgMiaWL3lUhnbI5uOYk/BP7EmInK9oKe6AbhKMBEgwecerhQ7ud6qiEI
	 MgRUhBvYRk8nc/Pv2WdusnHTLCcRrl0auJJkMqiPPyRWkEe/+R0BOLYZoExkwKGPoAGxB
	 chaszmHh7HSbPIzTOtDblO+MPzD8xALjjtulm38mAiwpylRdObHmsPTpHmlJukROjQmN3
	 sDVxl3+BnVhoYwXyt1EfAcE5Dl2UbWV/nY3GsZCiAxMmxTAuinqFYk/wfKeQD4BCJIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WnPEpb97;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7332606A33A
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 20:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7332606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WnPEpb97
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a357b1c649so914334f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 12:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795032715; cv=none;
        d=google.com; s=arc-20260327;
        b=UUg3e0KN5WTQfUiLEhR3KnClPFpm8HwS4fMC7MfcQ/Xq+Au0psQtJMbR6/S/Z1kz+t
         CHw+lI7ISvTUgbWQmAV/Z0CJitui52QGjHG0Ey8g8VKnHtj0KPd9kO5tSYluudDrHdAO
         wZfOjZAo0f8+SgJIhZDslPKzVmtlqu43QbpqXCpX+csnq1Zvo6x8iBjNrP4vYQTzhy3a
         ZHC9ZdEjbA7OYWly8MwRkn4/DMvEYKiEAyHTVyLj2Fq/ltdnKEx8+8KDUOWzCBJ4XTKp
         DfZx2Tv3wBCgyRLLd1OtUIF+6iIaFqCsU4UsmUWt5qpDjPIFbzpTPnnHbR90SoZfocKn
         shhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
        fh=L7SkApnSlWqT8sPJEeh2vCakfk0CULseL2aJc2T1iVI=;
        b=rQUMMOHNgXnEoFN7fUidsenA+kBg9BdpeL2i3MWbjchcB7NfytMzFDsncaWZR1QN2l
         Nb25/oO7JHdey7c8/+WKb6SyAOVZVWGnARjZRKLRtof77j9EaButcNfGyfrm8fMvlc8o
         gQyHObkkNc4rzVJZsr+fbtNW9QwikOa3kOGwE/luoECtCjFylqmPOlFysZk5N5SAoOVj
         66yRF0Jzxdke0KMLtiAz1/lLWXWMjHuqQF7vTiIwPcCg4tSpn4mkOenqS6jJm2atSATj
         /bkQKlfqjW9xkPBZDTK8w+ehaLw88vPYumo5McD6n73E4dwiP9s6PNMh6j6RZ6N+3L9P
         AEig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795032715; x=1795637515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
        b=WnPEpb97kcsekPHkHRowpccMWjX8C6s0r6JhqMP+J37hvVyl3KKbdYTrt2mCKnNDPR
         dFa++tGiOhCmVAPTDBNOBZ+/FYjY2XnEehCAl26jldhRwJjHQfxFxycMIZ2860yrP/dB
         aqtRoitnFK+bScW4973b50bWbMpLOkw2YyCX5jHh2E2Uzdlkyo7xXRYjzP52MgWv6/yd
         l5Hpc6/FmSbkceMFAEIunsH7fc/2JN6t/vj4zxj3eulelO/OY6aj3hPKErr0CVXD7o+0
         /2jgYoTAzXn72smJdbBxsLFgjx7CwV+4whoC7laZsKAqXOE6XoAXJ0yzr2PIRyaTC9nQ
         5Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032715; x=1795637515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kl4zj0/jNFlm2ibhU+UMkqFeZbcnh51SPv06nLRI2qY=;
        b=GH0SbBhfOwLtHTv4VwcuRGM5z20V5z8htupIhCyA2dMzfcqj/cCmPeqvWaI8J236k1
         z/dCFm1sKxU8tQ4Ex01av5YiUYugaqjLRqm2C591Td23nTs893akPLv2EWU7b7QASXwo
         dNW2JzCCKinMhD2gfWFrEoSlPcFq+ZI2JsRr42+iUSkyS81uumuVg/3e6Ygw6QjmKW/W
         26BmjERWASM+F0YuSXMO+K34OkgiLesDtVjtlC3nfO/TKxhDdUPDVh15o8y3FmqQPLG1
         OCt4E4uwmbDbhiY5LTOLVZwcEJEMDU+Uirzy9LFEwVHYz+bqYVoBQF7JfDaBYODwfqkO
         ebMg==
X-Forwarded-Encrypted: i=1; AL+hErFxqXnjpz6Ges1mtv6GaWWzkocc5Ed6bHGJENi/kZOaK9Ru+tv0q04mplM0bRDcQI/y/CIiNxYn5/bpPkWs2Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9l9b7jH+9lklIfjXT4PSfQDRJmn8eb10A1kmkfZObQYRpeDpgb
	VTH6wH9JOZRbTjiYp/VyvNX317sVP0UBD8vGOZXxQqwiUc/8SobsBOdVI8nVugwxn68tpUVIGC8
	cu/as7mh3FyEyr+VqwdmUyOqUiAe6bWSnvNkh5Vhe
X-Gm-Gg: AYBFou3PmFj8Oa8zClzYzKGzoaxLphDMm1fKuHkboym/6e652iHI39QUR4frsapjA9p
	KxhV8dFvxO8nvQigVxESW04U2C3PGv/ziAIn7qSwQaTT/B6A1xwkkVd3QN1HhNJXiYPy5zl8ZJq
	LSAt/Cogd5DKQPEF5YGEvcgjfA8dX1oBGNrdl0xyrqWg40vUsEX7rT5Z1Ochk3GXqcTcYpjAc6m
	YdGuZgLArSyusb45JkkpvHfrZ7X/hPIcx/a8/4JIAehBEBjZvBG3cUoaMSOYoCH8611DoL0Rvfl
	F38EnGqN7Kwc0Kg2dELmL+ZDWV+abOfa9qxb5E8gDBljelSvFgjlfFcPCZ+VJpwqCtWYNep1BcE
	Hw7IiyL8g4ua4+/1y+4O3OeM59jFK7nt/n3Vj61EL2jhH5T33p9iCWynBfzxMox7ywuQRh15G6/
	OJeVhBXd1UVI38
X-Received: by 2002:a05:600c:4f4f:b0:4a1:f377:5c6c with SMTP id
 5b1f17b1804b1-4bb7da1274dmr73938355e9.10.1795032714637; Wed, 18 Nov 2026
 12:11:54 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com> <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com>
In-Reply-To: <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 21:11:42 +0100
X-Gm-Features: Aa3M54q33nCN9_jrrnbqRVjKUIfyyWJWqzyIJScCl4pTAw6Zw2JFPOFUAC-yfZc
Message-ID: <CAH5fLgidhnPbP=xXQ3162w6q0U6rWHPZ9Mu6-E5va4_CXyanOg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 7:48=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Function merging causes various different issues:
> >
> > * For CONFIG_CFI there's an LLVM bug causing functions with different
> >   CFI hashes to get merged. This can lead to crashes at runtime.
>
> Do you have a link to a bug filed against llvm?

https://github.com/llvm/llvm-project/issues/217629

> > * For gendwarfksyms it causes functions with different CRCs to get
> >   merged. This leads to broken MODVERSIONS information if the function
> >   changes in the future so that it can no longer be merged.
> > * Wrong backtraces when a crash occurs in a merged function.
> > * Possibly also issues with pahole/BTF as the merged function's debug
> >   info is lost.
> >
> > These issues are new to Rust because in clang, function merging is off
> > by default, so these things have never come up before. Because of this,
>
> I've never heard of function merging (in clang). I've heard of
> -Wl,--icf=3D{none,safe,all), a linker flag.  Is rustc setting that by
> default, implicitly?
> https://github.com/ClangBuiltLinux/linux/issues/1598

No, this isn't linker ICF. rustc doesn't pass --icf, and in any case
kbuild invokes rustc with --emit=3Dobj and does the final link itself, so
rustc's linker arguments never come into play.

What I'm referring to is LLVM's MergeFunctions IR pass
(llvm/lib/Transforms/IPO/MergeFunctions.cpp). It runs as part of the
optimization pipeline, within a single codegen unit, before any object
file is emitted. Clang only enables it with the cc1-only flag
-fmerge-functions, which the kernel never passes, so C code in the
kernel never sees it.

rustc, however, enables it by default whenever optimizing for speed or
size (opt-level 2, 3, s or z), which covers both kernel configurations.
It uses the "aliases" mode: when two functions have identical bodies,
one is deleted and its symbol becomes a GlobalAlias to the other. You
can turn it off with -Zmerge-functions=3Ddisabled.

Alice
