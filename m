Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793295143;
	b=h3naT7I98vZbBiaM+3IW44ulMZL6sqJ0GaRmlEl6COErG9rOwu+/yUNDi97uWHf3McxN
	 +um50R3q4+NX6dkP/Ei1g+QsJZeB0g85ecyMsCJ5Ht8iFZvGcchHqgcKO0msQglXB+Lxz
	 lCL73sXyPPqM0yqq01kdgXSqYF2CieE+Jyy33b1McJSNwj4pgyQjeNFNLJdtYhnseBKUz
	 l95RHkTqMvRD3MaCkzCbOP5YAK7tpslraE3AfpymwE8IdIMY84i4t3Q1+oe2bBXFPVS3V
	 wQCZxOo+qR14yqhO1wLnd2YKwPDfKi0jaV8lZuFRt1cgzRnoX3r11LLq2gWBw1nvzQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R4Rs+OXHP0WWXEc1HyOxC7jIqK/84yuL7ps1Yjc1ZrA=;
	b=NAer5T2iSMYTq31r9kpz68EhdfDu/tIM4DIwOH19K2TuHYjHmUjAn2fZkYtcr2B+Vb1l
	 q6qjrlDkDMPP6eFw1vwgOaxoyryfg00ppriMzU9jd8nDndMC9XntnxuTYPgiAZ7oJUccs
	 dU/yYbCLasdXO8H7vjSxizdI+jm59loG/sjcFE4bJ9jJPatkjBcz7h1pM3VvADwKt/0Ri
	 5RAwwftgyExQudLTo24aCUqVmPXwMGHlSNttfStrn5iCkWZjilHMZWPaTXjJgYssApu59
	 Pn0063jFTmKZ5UDLb7bSJfMEB9KqDlt0RWfKT2m6IeL0FZPB+SX/hqv1T38ckkzyuGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sn8ZaqyK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7600606A31A
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 17:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7600606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sn8ZaqyK
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35159e0092aso268965eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 10:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793295142; cv=none;
        d=google.com; s=arc-20260327;
        b=Jn2Ql1rOvfBmuoVgFrvEKLnc5+s+0POT2uywu4JtQ4MW/RgzQTrPhrYl8jQV5fYkb0
         fOJIgKAoBY+kvdtyL2p+B6Kn6RG6AzKrEvN5a7a/4nSgWO9s/dJxv/eSLOEkQrib6zL3
         B/6tRj5wq5tZJwL+lWiPaOb2U821w7NCBTf52DXn6EjEUGZXOK6mqcoQxbqj65wHH8C+
         iE1uE383Wr1nbvQL8oi/T8pycjLjRp2U8XsX/WH/wm6bX52VZGyH0pllxS6jweqMgKOY
         2RkP8Gblqt1Jwrq0d2+2TGY1TaOnQXnS9Av7N241Lbb7C+r4Fj3HIGubAkdu9PxIHzSU
         XvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R4Rs+OXHP0WWXEc1HyOxC7jIqK/84yuL7ps1Yjc1ZrA=;
        fh=bbVk0AR4/85GFRkJuEz0SlUewm3ZizTmrqBkJmpsN2c=;
        b=omjhWHczy1Eb/5LBj0VyD4pmvoLAjk/6AXvw5VYROXXP8I3Wzzu+OD4D/foXYNY73z
         YHRBkPBZ/yuH5i7AsFs+ZEIZB6ov97jGUck08LAqAo0z/EyVZBgW7CT/9G5Tu1/m2Urh
         zeVNXkVLNB3Mpe9w/FBySq+6ucaUWf5dN6vVmcWuUtZmvEjLYwG2pPushl+Y16PZlUbA
         kgA5KkfKxoRvgUv56gYM9bSb7VD1b/4WcAX8+3FkuZQ9BuGg5xTMLzmjyWzXTZ+11/o9
         oscNuJXYYJ1+FrkEobg/4QZCjac07v6s1PaplvIha+t+upBy4U9gu/71d0dk/rsrm1vC
         gkdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295142; x=1793899942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R4Rs+OXHP0WWXEc1HyOxC7jIqK/84yuL7ps1Yjc1ZrA=;
        b=Sn8ZaqyKa9l3To+a5GYvvAD0uAR4LJpfMXeTB71mq8b5e1Cu/L8u9HO8Zj4J0B5nci
         ikPSN1UBdudd69fky6nx+fn2zpQNEKKb8ndM85agvMeZX1huHviwXrVWGf3dK98oNA2n
         kPm3sFQi0kDHKs5E2U8HTKnHQfybkyFStMtmeFjCEYXW2mEF15JtSDG+5XlGpHWRHj6s
         p7K5MntJv9WyU0bgxVoYY7vLJvNAw48cDUARB5+Bim5Zy0yKYy1Tv3NY6ydDdUGsXC0O
         83MJ9sAETqsv7YSQ9eLhf5V4kUe2K4/oqFg8hHLQtP7JGEDhl74TjhF3bkIgdYuBHeUM
         yhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295142; x=1793899942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4Rs+OXHP0WWXEc1HyOxC7jIqK/84yuL7ps1Yjc1ZrA=;
        b=D+D8+sbxLRpl85fcT85zAeKgB06p9yGHWkxfPOg9h4jPYCxHsY9Jft7qHFB8aP7CV9
         tDAsKS1CUtsspJGH1VEskwLjXNDY72u0YX8P++zKOF7lmVSVPFAHelXUV3rqgrS+aycl
         CZvhBS6kz4A4P6X9HKjhrlpxzGg3o0Rx0CctacaLtCNAnLAwXxJOCXyrFW348WE9IRgL
         KCRkJzUJL4LKx1XoDWYz4eCXYQRk4A2SAZVo/J3Lh1NyiZi2Np6YOifCnoeGW16qqsSP
         EZSTruPhW+AtHIN9nyllO+8BGyvo9JsxrISCceFWsSYn+oc1nrjlcFHfjgVDNDORLUjg
         jcTg==
X-Forwarded-Encrypted: i=1; AKwUvBz8umKa5q8bX8SSANceTQSDCwkALlkt0TahOXv+IEwoq7EXOSO9rnSxz+bsipnQwuSvCz0XYQmE2eE3AUb3Kg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL9BSTBzgMRTBvg87wYRy/0fPQxiuDYZ4jo7mf+dJam7Fc5K2S+
	H3mFX9UMNjef6dGlfErL8M97ov4H0Y9eHZnwxfuCm2GmiFJ+rLd4c64jL2DbzCF7U0/+2H2kbhU
	/7PmFvVf2UlyIa2rHKoOyZO81mXRHbHP9larTN/Q=
X-Gm-Gg: AYBFou1hZbQ+mFnQHhoE9IAZERWv+vdVwUdr4CGlW6bpsvbTF/4KLZmKpN3pj2hur+J
	ESYlCRt2EaKqFL+NrBW0DF7Pfbva9krV32rA2gl9ORrDXS8kNLggxaSKWliGgGjWeTO9Z9Vdtkh
	D3m2zxQJaKDjiSQ9/hKfkoDBaSW6RkDc2BQtLs9ke2Gw4baizydmM5cg3FJvMvTpvQQsyJMYaHG
	MR5AkyI3cD/9UnkPkvrwMMPjPEgbhp9bDqa42yUxp2bzBLQwFKxxznIsgaP4ArDIymevbON7rWX
	78kyd/M7EdmmsbgVREbVl9w/OAYjEQSr6ZKTDpHNmwL/5IyYbRgbc37YBbatNDRw+U/1zEvdSvP
	nB1LKw1psa5MbkOExupAboqSc/S4aLcMIrAy+Ngj7FAFdXdyDsUrG07/0B9cv1ig+vo50SOfmXd
	IHRi3F8UQVJuDaJiIiLRB6FP+ip5TE02ZrprXwWTZKIENlmMwGoDh1L9+n2EYjzTygnAOpAHBrA
	W8EBzHQMTop+ZSONtgI3mFjVtApiWKHTA/eZIJp3mAX2+3vVsfswIPp2w==
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a4235ceddmr139643eec.2.1793295141770; Thu, 29 Oct 2026
 10:32:21 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029162958.3224280-1-irogers@google.com>
In-Reply-To: <20261029162958.3224280-1-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Oct 2026 18:32:09 +0100
X-Gm-Features: AclHuK-0mxI3LKAZpnOHH-Drrv94DNRirn4x7gfXbdMbpDKW_doTTtE6JJd6tT0
Message-ID: <CANiq72nrhqK0NP5q8_G=936++gZR3=zrES+cK96T95-ThVTpbg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/3] tools: Add Rust library build infrastructure
 and prefer zlib-rs
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Quentin Monnet <qmo@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:30=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> 1. **tools build: Add Rust library build infrastructure and zlib-rs featu=
re test**:
>    - Adds `tools/build/Makefile.rust` with helpers to locate Cargo crate
>      sources in distro (`/usr/share/cargo/registry`) or local Cargo
>      registries (`CARGO_HOME` / `~/.cargo`), map `.rlib` prerequisites to

When we were discussing whether to vendor crates for the normal build
or whether to fetch them locally from the registry a couple years ago,
we discussed approaches like this one, i.e. picking a version from the
registry by folder name etc.

But that doesn't work too well. For instance, the graph of
dependencies may change, there may be several versions available (and
the highest may not be the proper one to pick), there may be different
major versions available (i.e. not backwards compatible), they may
change the build scripts, etc. Even picking the highest major wouldn't
always be correct, from what I recall.

I also asked a few distributions how they felt about it, and they
indeed said that it wasn't a great idea without querying properly the
registry.

So one should really ask Cargo for the right information about the
local registry (i.e. offline). It has been a while, so Cargo (or maybe
`pkg-config` or whatever) may have better support for querying it
nowadays too -- I would suggest checking that first (e.g. `cargo
metadata`).

I think depending on Cargo for this, especially nowadays and for
`tools/`, should be fine (we were considering even back then and for
the normal build).

By the way, checking Cargo's cache sounds very strange to me: that
means the version that gets picked is even more "uncontrolled".

I hope that helps!

[ In the end, for normal kernel crates, we decided to vendor for other
reasons, e.g. we wanted to pin the versions, to customize sometimes,
and most importantly to avoid any possible user misconfiguration that
could lead to a subtly incorrect kernel. But for `tools/` it makes way
more sense, of course. ]

Cheers,
Miguel
