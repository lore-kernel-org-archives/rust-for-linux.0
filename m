Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431E73F7882
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567948; cv=pass; b=OZZM4ThCE4dqMEE/40eEkCzjcM4MKZmuyMDrHAbnGEMnhYlDJjlrtAYyFU0lkCe3yREIpLtadChMH0Rc7HYI3PcgcPWRLhHVhikB75C2+Fnrk9DFYOd9iNML08H9pxpfJIHQOco49xDZA4vmZ+VnILzBWNBoILPCb9v9gc55CnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567948; c=relaxed/simple;
	bh=BgbFX67wDVJkTsdj/9SCJ2EKpleloJIPnPNPMGXZuv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lx+bAPGIvW0Q1+caaes03Aop01Tn9QvgQPJxOLaJBzfGWVh+kcjaxE+emV7bgBxKPCUa8RmZv9Bbx7ntqoRJNT98r0/RbZOtUCTuIEnzutvPrX9NDQPGsTyxM+DSk9u+FCfUQ1HVbrz/sQfnVa22wwyuqXwOu5Rbcdo+IewYXWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyie4fO6; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyie4fO6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccae46de39so4435855ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 03:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787567946; cv=none;
        d=google.com; s=arc-20260327;
        b=rQtEjy4DQ1bmc8ILDI+EWpkpxm4bpcuyt0m4c546Cun4IGZDuhxLDSUHXFNnMe1P+S
         7qRr7THxvybOUfo0IU+5DEaEThc/DH8cIVl0EHyxa+Oor1wAP3Lq9kAVIMj7lxNXBdx2
         LRQcO0llcSFanrY/3eQeEqVsD7RXXyeGTQIQ0ebG17pwcCy4TAANncnF11Jv7QHKLYJS
         ++5VbIz+hSupAUcwwEsc86ObAG/LYBimiDnQgRbnuShAip+GL9BlmAsYRVJY2MUPXf4E
         vB/dUJzLAvstkLTSxW2KLMyldvftrjgvyAgz9v/rUe8o+3YGlrGu4lq7QEiaFclX9yol
         kbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1d4kH4nic3HhhxSGmm8stA+Ap9zvMH7EPicZmp7UdXI=;
        fh=N60Bw0rgW4mtvOkWsTKeQGSQsKscxLB8T+XZmbhfvXM=;
        b=oAZEcRNLeSxrRzoOwYIhDZ9Zgbh9f2p2MdjASN5avWI45g+AKy6iwABmaSH4wAyEYp
         63peRMFLGBwhu377sH6JhXclc26WfxUVcGP+wdb/AmTVSkh62AXU846/jS/6L0vTxDAZ
         lR/OChWLLhLAlEK+VKDEOfZesr+Dq118YAtjGbKo/aNK3g85iThjmwYI/XmUMBH9ovlz
         wgUbWebsA6JycrfL3FBvZTJwGP3qoMXUOaPKKxWfe2bppUQeFezSHFuX4vjDadFrv4Is
         /X4qP1D7vht2eN/MiADsxV0eiUb0MUsebl2ZzeSylE0aOZkqrwitraOguO7Oj9ixkfDq
         0zMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787567946; x=1788172746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1d4kH4nic3HhhxSGmm8stA+Ap9zvMH7EPicZmp7UdXI=;
        b=cyie4fO652/D0oNZUMAUomGdhRC0ZsVoj75Y7G9VvDgjBacdzG9kr77NG4KgvRuSfU
         Vv00JMNyT1iuLLIq14+zfQzF914ZgI5xomLOxoafaqC+gpxtqOTMNyFPQrvTwDhJfCjF
         6SCu1W580c5qtB9B2FFs0aXa6JQZvkU7w006OtJtfJAbyaxlwz76VQ8+LjE9HRgozZ6H
         qfhuqpT4Onysn9EkHXUSaMW8eoLtglsWUDYk3V5IC9mPP6xhKv497YCziqU6FMocnpM5
         wj2LTW1T9LfdYFOMajBukMZ9ozTPyh50DRksaXG331amXiLE/bLnBtavWWZiaTF5s33S
         21Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567946; x=1788172746;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1d4kH4nic3HhhxSGmm8stA+Ap9zvMH7EPicZmp7UdXI=;
        b=WUmWHFqU27xn0LSNig+m+LAEANU19P9op3Tz2tNpsWcNojzvFO76JTdVmiHynb3ya/
         NDDbXRRqKXC9qgFewx2aqwK0Qsy/8ZMaN03RNqz+q0zT1xdaFbp2j03xEMM4Eggfuyyf
         SVtS9VmxkbZj2oFMtY4XNqmQFFomu7X/WlsGFEHai/snokb1Ac2L9Cgm8BOIV0NsSO6z
         GSj4V4Zzt81HcuR+sQh7oj5KahyeiC0Eh7eBM/WDLgxc8rNwHb32aGcmj1qg3gH7tc1O
         A+bVXDK6C/Lpx/T3Y2HPVJ93YT0LqP3J94he8cak3Jh3zLs2MRbstmqHPP1/s8NONnrk
         QsaA==
X-Forwarded-Encrypted: i=1; AHgh+Rq87PEaqWld2IzqK+DkUIXTm1BlBswnRDT89Fb/YrfQeIYUXK5DTELbBEV0o0rBeTlDEvatRpd2UgOhpzQlTg==@vger.kernel.org
X-Gm-Message-State: AFuF++lu78Qlnuhk706tcKt2L79gG9ffHayAs23UhYRXMyWhLkL9iB+r
	Fi4ZzdqIPBBAePl8Yut8njWUWTIxjlO0tpX9kiqyHdm4p9srv/lFWbNFqRnAjPxdU5eVSB0WOHE
	CTL2fpz/u7Ce+PC68+tjAmEh9DjI+rEA=
X-Gm-Gg: AR+sD12IoPvdHtlUGQstIoEsUQwSsuD1LJaVUi9omgHLF1BGcgq79OQ/1cYxiXbDW9t
	9r1vP0iNG4jjCCukVACMHgLRLYFIhtbadjwJVEuX4oIrxBaE9jfsO4CStMWq/K4i9ijtoYRU4Nf
	cYkoyzH+KM4P6NV6+nbRzf2Ajmb+H1robp1JvtXrJH5ENCkvwBstv+5RuFzqFDB5iAQd5Ec0K/J
	GKU1xTrmT/7KYjNNVdgRAiOJ7uRgl/I3pEb1qigtRltInbhjoilXhw+6T9LNsNAhQbORL2t3eSB
	/NxvtrJXftJA8RJB+31wiCUJJyCDDO8u8wJQ0anUN/izKuEZZ82ObRx4/Ne3wFpmFVEnTtJvjCz
	QEYViHKajVyV1I8Up9+9WXJsMNGEadljI2NfS1kUSno5ngBRlVwH1fn5LA1gT
X-Received: by 2002:a17:902:ce8e:b0:2d3:a50c:5e19 with SMTP id
 d9443c01a7336-2d64ad815bdmr230932495ad.1.1787567946515; Mon, 24 Aug 2026
 03:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816133233.197500-1-ojeda@kernel.org> <aoPOqlGAlLOJ3wgx@jpoimboe>
In-Reply-To: <aoPOqlGAlLOJ3wgx@jpoimboe>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 12:38:52 +0200
X-Gm-Features: AcwNN1WICBTdtFPqyjjwqdJ37MyeqFlctpOt_QKR5j4W0Iv0235s8zfeWZyWNvk
Message-ID: <CANiq72=tKp2LBq8ThjRRZ=q+VPb9F3Sg=v1yrVZ2dpWPC2SE8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: preserve unreachable traps with inline helpers
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Matthew Maurer <mmaurer@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kbuild@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 5:18=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> FWIW, I've been working on some patches that should hopefully let us get
> rid of all the objtool hard-coded noreturn lists altogether.  I'll try to=
 post
> those soon.

Echoing Gary's +1: a good solution for this would be very welcome. I
have added a link to your message in:

  https://github.com/Rust-for-Linux/linux/issues/355

since it is one more possible alternative, which means we wouldn't
need upstream Rust to provide that `noreturn`-symbol list in such a
case.

Thanks!

Cheers,
Miguel
