Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53233FE369
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 11:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338497; cv=none; b=gyhbpRP1hsQtI6s8STZ6CAB9snH2OmoLBq08EHL8rp1GbrzD+5MeeKZAwhYR4Xa1KHdSYaGcaHG+qrjNh/vzH5IpmwQPHgAZdDSK+4cRe6BWKvI3xI632/EBsMK2HKefej6a76A2/6GpeVSn/wfu99nkuHTMCWFUIjPCTOQDbeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338497; c=relaxed/simple;
	bh=SkCbYuGW3eqT8pRjM9jVxDre32BJW2V3ocHTz8lleCM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RhFhqkxfpoy9E+4v7HA2jGOBOaVNLwuHOzNLxHAs2+rtwaM5LA5hEhMhdOwggsZCjnJK2JF7l73H45Xe5yrfrlilZ8I40VNWdGxeRX59TlcMUHdFIcUschHDBW35FfYff64ErprUjmIUj4ijA8wsQoS31fA8M3FAZX4NTW2lemU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZDCZDhh7; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZDCZDhh7"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493c1bc7a70so26434415e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 04:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783338494; x=1783943294; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SkCbYuGW3eqT8pRjM9jVxDre32BJW2V3ocHTz8lleCM=;
        b=ZDCZDhh76/QZ3NziK3Bg9qJ5CE/nEc3FpUd5JZ7EeCyfiGhCFt0dFNtB0Ba4h84cM4
         xXjFM4GM1fB8UGqSQY3JOOF3tVtrQ6DY/qhXSU/KKT0e/j9ONtrd0xu4X1pDyL/UZcwF
         G0QgptG/2yRzjmCa+Ljrwd7xMjV0ljLqMOrRSsMAlI+nxNMwMlBBNagQ+CUvp00hklpJ
         MB+tDjpj1dYSuCxK7HNSFa+kkx55oID/bms21Jq99DfIayhfNI54aP0gL77f5KsuxyWO
         5/O7OZoZu+H6M4G+emBGucI5I7CCPFZyO6EO56YM8DY9kuDnyjzSD8qMkWhfBZjZSh9C
         4ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783338494; x=1783943294;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkCbYuGW3eqT8pRjM9jVxDre32BJW2V3ocHTz8lleCM=;
        b=SDKml1d4vtoLwsAIGluasD/b17WuQhoNwEGotRb/f3No5sOF7ypso+/DpWlOdnDAdJ
         5nR+sO950XQEQng2Z3tm54K8F9sd60Q+aT4PFXmQnXL3Gr6k9TAyYFLOpFSb60f7OVtg
         OHfZzI0RaMQkRYFHJVtYwB4uOIlfgrRWwRi0gRlElFICNQzWLPH4XPErKFlY9/oep9Yl
         GnZYjM2c6a0/aEzVVJgq6Pz4qsVaB253zT4YHnd9h99WvHiWQTCQd3G0U4mTzk5TupeQ
         2c0QdRPzsfMHpPGajWw5ib1vMXfaAnjNyTj+OIwY5AKl6Gy8vsdV5u+Q4gJorClDy4bS
         pNgw==
X-Forwarded-Encrypted: i=1; AHgh+RpdmDsFaFqFH6l76TVI4m27xtZkvMJvsS0qgALucLag1ggZHrysr2vhDam2yvVFsTPiIiZnE0UzSKsfqf3aZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJauIwXiBZZfrzhvO/6uaNZqhocqFhe1c7FLIMzjb7mUD1YaXT
	kS+SADcTiOkDGPLhlO68mUZDRjoUx6vmxEL25E9WIWArufpQAwweenHMo8U/mda+e4Nizo7jYET
	dUVUG5Y5dAr63/nMRCQ==
X-Received: from wmdd24.prod.google.com ([2002:a05:600c:a218:b0:493:bb1c:478d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b66:b0:493:a7fd:15d6 with SMTP id 5b1f17b1804b1-493df08b4camr610775e9.9.1783338493893;
 Mon, 06 Jul 2026 04:48:13 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:48:12 +0000
In-Reply-To: <20260703-chid-v1-0-84fe8259e46e@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com>
Message-ID: <akuV_GRAM4QPqf-o@google.com>
Subject: Re: [PATCH 0/4] rust: Add support for reserving of ranges of IDs
From: Alice Ryhl <aliceryhl@google.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 03, 2026 at 07:16:03PM +0900, Eliot Courtney wrote:
> Add support for reserving of ranges of IDs, with a usage in nova-core
> for channel IDs. This entails adding the helpers+users of the C bitmap
> API for ranges of bits, then users of that in `IdPool`, and finally a
> user of `IdPool` in nova-core, `ChannelIdPool`.

If you need ranges of IDs, perhaps you want the maple tree instead?

Alice
