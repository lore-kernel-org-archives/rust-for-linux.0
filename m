Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AAA2D593E
	for <rust-for-linux@vger.kernel.org>; Mon,  4 May 2026 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881340; cv=none; b=K6hRnoMwT2fdCkQYX2E4xx7IAQZTrYZc2/akVR402yBz++swSga6b2O09gGSXllJ5YLd6NPjQEVRgTRSTvWUMEnm+J4/8lzsTZqq0duw02vNiC/xc/SfAlkC3U5vaasZjDYmaYw67D0fIyBQ5/O0C8hi/mTsw/4+yDRys+dwKmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881340; c=relaxed/simple;
	bh=Wep1OzvReUoUQ307b1u6MusJZcNT1R35+FVLjoVWzJo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lY9n/dS6kdlQEmciaRxlDPFQzqQisM0YC8tuWoz0kRIpzUKvwFbD3gJ61/a2Gzmet9XKEAuGeVrPx43JZt56MbuMyBabdm+xz8tNc/J+CuSjOYIzKBSqkIVfpzzQH1mIYPrnD79UxuZDn+Ne1jFAoyWS6o66GFDNbnKncfSZMl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wL+dpY0A; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wL+dpY0A"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836abfc742so31055455e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 04 May 2026 00:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777881337; x=1778486137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArN6QoJPrmHm7+I3EYun6DdyhIE0DYL9ZpeoZAysRcY=;
        b=wL+dpY0Ab9RIlU+H4qWxr82hThaI2H6xYMu9tuSQd0s/t+ODv9C7xxeOWNhxVNIM/A
         epqZIDH4r7ZFvbawn/aeavXWGcdfnpGo1HCrkYD4TcJ/XANe58Ylopdxxt5IQzQDsqrS
         y30+5K4Sa6VGKSvh5Lza+B96nOHjnNj4XB8tF/HtTobkBhHswJNQX7RSOAA9nP5ZWa7r
         fs3zZV2G5289tgxhDeTXeWBWf1gO0w1Cxa29e7+/6X3SAZUc2oB5zWazAz2aw6zeFMjy
         71bjeD7UZ0STjBrZp5Y/iR0gXbPr4xerrsI1w5bBfuiPNoCDXEE9kR6iiYiy6U4y13pQ
         udsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881337; x=1778486137;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ArN6QoJPrmHm7+I3EYun6DdyhIE0DYL9ZpeoZAysRcY=;
        b=KDXLHOtkcPWKWzhVx7rZQwV1l7pLpdUPu/EuJuMv3H8rAV06aWtcWCZnqNJ6xZyfpF
         Yx6FrJlZ5uBwja0BYMGEuV/YRAZRy0Afrco9qvbGtgA4RQlC562U/z8CD+kU81EK1sKm
         YLPAnPVR7nbUCm996Cg7cYcj67RfgL8s7lRjip2HUwCTzPuquktAmvJHNIIRNqVXi/Y3
         J8qqjzLtILoGT3R7x2+g6NAGwLMVt2d7e3/hlqOnl1jBES6zGApBkLUW2xdVMWnWHg8t
         jiCNFqDvsAPCoqEgwvAvbqxiRWosIAPuVK2N/zvtc8uvuuRFq5ZcUnKrg99dVZKRW0g/
         Qg3g==
X-Gm-Message-State: AOJu0Yw+tTsjCpag6aKW29ajQ3mSt9Vd5NNnuCVEV3nZ9afTv6X6yzqR
	Cboj8zP1oEOhc+bUs0VdpcpnUDXBLmSqPaa9+8jk0pG1y8HrUK91ppp5If+Fn9AjXbHUMHRhWJ+
	o3HDRa8FZc3WvoLemiw==
X-Received: from wmsk9-n2.prod.google.com ([2002:a05:600d:8489:20b0:48a:93d2:60ec])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a316:b0:48a:53ea:13e6 with SMTP id 5b1f17b1804b1-48a986711d3mr100737155e9.25.1777881336746;
 Mon, 04 May 2026 00:55:36 -0700 (PDT)
Date: Mon, 4 May 2026 07:55:35 +0000
In-Reply-To: <20260501191122.64311-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260501191122.64311-1-work@onurozkan.dev>
Message-ID: <afhQ9zN9IH3skby6@google.com>
Subject: Re: [PATCH v2 0/1] rust: add Work::disable_sync
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, tamird@kernel.org, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2026 at 10:11:21PM +0300, Onur =C3=96zkan wrote:
> The immediate motivation is the Tyr reset infrastructure [1] which needs
> to stop queued or running reset work during teardown before dropping the
> resources used by that work. The reset series started to require too many
> independent dependencies, so this is split out as a standalone change to
> keep the reset series focused on the reset logic and easier to review,
> rebase and land.
>=20
> [1]: https://lore.kernel.org/all/20260416171728.205141-1-work@onurozkan.d=
ev

The fact that it's motivated by Tyr could be in the commit message
itself.

> Changes since v1:
> - Fixed a soundness issue where Work::disable_sync() could make a later
>   Pin<KBox<T>> enqueue fail and hit unreachable_unchecked().
> - Removed the WorkItemPointer::cancel() helper and explicitly call drop()
>   in disable_sync() after C has already canceled the work.
>=20
> v1: https://lore.kernel.org/all/20260428104459.174602-1-work@onurozkan.de=
v
>=20
> Onur =C3=96zkan (1):
>   rust: add Work::disable_sync
>=20
>  rust/kernel/workqueue.rs | 121 ++++++++++++++++++++++++++-------------
>  1 file changed, 81 insertions(+), 40 deletions(-)
>=20
> --=20
> 2.51.2
>=20
