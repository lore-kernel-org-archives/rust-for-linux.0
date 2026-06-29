Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACE53955E7
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731824; cv=none; b=Q/QohmZJR/X9RlHenbKyqhZKld/NTop2qv+jrxFJNMhck2jaZ/KDAkpaY0xpJiJF8q1pWNj2+widK5hwVStN1JFjIj2agspe4lQ6uD4fuXQlsAjCS7aKLiKFt83XPiaxR7dVu5SH8w2lREprhVvqy4iuwG8aCZh8754L63TlCTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731824; c=relaxed/simple;
	bh=eXKifjwGmgyNkfNyz4AW5WzTlql2ov9lymuZ6YjJItM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WA0ZOG2oPbFsT8H86XzsF9DGhbTeSHUxO7kuh2R0ipYMaOIiUdhn5qg/GfTVlD9XLEsieKQD95Hxumk970oPL9g67hzKRW2JUo9ly88l9p2G5/C0PVuopuEMPZyHcj33YosnLlclGuyweM9twHiSrmFKEi7Csl8JaXgGlBWYT6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8yud0QA; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8yud0QA"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37e0fb87b75so2655146a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 04:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782731822; x=1783336622; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf9modGDEu51qoKMDfa6F2dR4atoz1mf0fTmi7rEwIc=;
        b=Z8yud0QAYGzTRcOp/qtfnqTIy06lXcmiWSS4F2c8vSJ+bEGZyba5nT7YfrMnBJ1kse
         H5CG/3Ct8FPm86B49i3cTYRcm9uJtZvLjYGMjlCk+WgdE2oecL+z/PGF2qeC509LK1Y8
         cSUy36WCtaXjdk7hnNeWNSINIRcsxPBzZAp7Usuh94NXDo8cVc95hU5T6YvrufQAMiZ9
         boGbEoOv1G8afUd67r/P3BXLpxHVLeR2sj6QxqTIX69Na5kRdRG/uOohPdvFxeZWKWkA
         EgwXbIMr4BboRfv0rO8ZrZ0Lrw+Qbhumfs9rJ41uEzuz5oQvqP9pwyzRb+C4zt53ypcs
         l0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782731822; x=1783336622;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sf9modGDEu51qoKMDfa6F2dR4atoz1mf0fTmi7rEwIc=;
        b=G8YIYh6sk7xGn3L4DGgfohcMg13N1E10Sn3Pjl5b3vdUYM8pIl3aTHjmpdIY2RfeF9
         z2trA3IiS8trsiKU8uOM5PTsYz/0sqZP1Wwkq/3fKQaESfuPVtE7UEWoBY4sBSN3zax0
         NDf3LRForIyE+wrIKVTnhsDBD+FMStottpHRSu8I6TZ5Bl9DamS4qXVrdEBL8pkCQWW3
         P/lNedXf4VDZDTc1Kdpuh9gXH7eZLaJMEyNgUF4fl+EAbWbelBUYFA3qfmfisHMhciNx
         NNEhooFUdIswDud78HtsJOK8OVRweYKu7+EpvSPlRAPizsPtQJVLLG8AXryLwh3oCArc
         qngA==
X-Forwarded-Encrypted: i=1; AHgh+RqoxdKkHbWfgPAYdImNC5C1dFxXRGlXStZZLbLRZVRQIFMR0SbL/Qv7b4PoTHkeSIdPeQ7X5QOX5CFTrETZRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5y5oq3sKRYjbbz+ZqJTH/8h4OhEmOYtlQ9+Vkmf7dP6g65Brt
	XwhHBIg3fyvr8CWJ5mEkLLuB7vyisRUhUXAhaI8zUQGDpBFEi0Zigw/C
X-Gm-Gg: AfdE7cmJbzu6aWIQvSaO/ONbrfeUYEzQ53VEgejsZYzAT8kovSUWWVAt9QaAdsCNbnv
	Mut32hs6q/7Tvd3oDvZcH2D3LSO38tTDL6GmlNUdhGoDh8ifJkLc1ZGidw+MH+l91AS0SR+caR0
	GdHOymnl9ZpmJiEVnZOlGqKdwPFCtlcYhsJNtc8XCIr1sFH8k7CQY/pBmf82KRoBz1LQu3r8qy2
	QtkQXZ/+er8E4E1AqkuUNopHwxI2TL8x99CUYEX5vUXWJnlK5EpEC3G354+NPGw/KUkw8y9THVe
	F5A+FfQ0aq8WvyUOTjzJXSRiNhvghr9XGd40sYM2jPtT/hzsEHYGXuXo2cr9w19MkdBp0DWwqmP
	gnEOVFRa474PGSJil3FWq2ZGyF3tFGDCdXl/Z9zmzfwfq9jjaaRWRfEMwDHt39J2ALQKR3UtnbE
	HuV8Bdl+Cz2ZS8haaSkUdD/W7EyM+xtQTqj/duC9kdrkSu779wY/1oPHAaCu8GWOPPtUQPREmrH
	mSqu3KITm5GN6p0oTmcyx0x2gUmHxdqVOsjpk92
X-Received: by 2002:a17:90b:5830:b0:380:38d2:80bb with SMTP id 98e67ed59e1d1-38038d2824cmr453534a91.8.1782731822431;
        Mon, 29 Jun 2026 04:17:02 -0700 (PDT)
Received: from localhost ([143.248.188.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac7c9asm91594835ad.4.2026.06.29.04.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 11:16:56 +0000
Message-Id: <DJLHOQA5UAP4.340P2TKXGMME5@gmail.com>
Cc: <engineer.jjhama@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH RFC 0/4] rust: dma: bridge zerocopy-derived types into
 the transmute byte-safety bound
From: "SeungJong Ha" <engineer.jjhama@gmail.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "SeungJong Ha via B4 Relay"
 <devnull+engineer.jjhama.gmail.com@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260628-dma-zerocopy-bridge-v1-0-9a2895ebe30d@gmail.com>
 <DJLCLH7GDSBW.28J4PZW0FD60B@nvidia.com>
In-Reply-To: <DJLCLH7GDSBW.28J4PZW0FD60B@nvidia.com>

On Mon Jun 29, 2026 at 7:17 AM UTC, Alexandre Courbot wrote:
> On Mon Jun 29, 2026 at 2:10 AM JST, SeungJong Ha via B4 Relay wrote:
>> DMA-coherent allocations (CoherentAllocation/Coherent/dma::Pool) bound
>> their element type on kernel::transmute::{AsBytes, FromBytes}. This RFC
>> lets a type satisfy that bound by deriving zerocopy's byte-safety traits
>> instead of a hand-written unsafe impl.
>>
>> The bound cannot be switched to zerocopy wholesale (some DMA structs are
>> unions that IntoBytes cannot derive), and a blanket bridge impl is
>> rejected by coherence. So the series bridges the two per type:
>>
>>   1. add the bridge macro impl_transmute_via_zerocopy!, which emits the
>>      transmute impls only for a zerocopy-derived type.
>>   2. re-export zerocopy::Immutable from the prelude.
>>   3-4. worked example: convert nova-core's GspMem and msgq POD types.
>
> Can you give more details about what the macro is for? My understanding
> is that it is a temporary fix for the generated bindings; if so, I'd
> prefer to apply a definitive solution (like using
> `#[derive(zerocopy_derive::most_traits)]`, or updating the bindings
> generator tool) rather than something that will be removed later.

This macro is giving safe manual derive from zercopy traits to
transmute. However, it is not necessary if the transmute is going to
be fully replaced with zerocopy. I found it seems to be true [1].

> But intuitively I'd say that we can (and should) probably do without
> this intermediate step. But please let me know if there is something I
> missed.

I agree. The only useful parts remain in this RFC patch is explicit
padding in GspMem. AFAIK it is still necessary after the auto
derivaiton of `most_traits`.

Best Regards

SeungJong

[1] https://lore.kernel.org/all/DJLEHDNJCUD0.38PFZ5773D6BX@kernel.org/

