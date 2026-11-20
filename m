Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168416;
	b=yUvnmzsJhgrTd2hEe64ZBTS7yC8FTE64NgxnhSx/m3wpJBva3T5eFfxz5w9xT78lrYm+
	 EAsJYPTTJu2QOBy0kjOdA6fUCG1ZwxGMg8lOEPyBPXxmAeEDZN/xQNb3jc2qPGweANTIz
	 mmNwwxCaQHbP9xe1f8c1KjR729359YLZtz41QmPF+/i0BxaNhgqRQqDso4Er14j5k1ktC
	 LmRpcX9D2PGvHS3tBNeMSD1NDM74bBNkWvAeqY8r9pGjuiCp99ocPB8m4h5Z62/7JQxnA
	 KG3wzqGJ4wCs4HgtekxLtbHS4eFnUXuYAB846bQD8iFg5NlHlg087h8BrP6YoqMvTmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wU4LlfzaVTfqT9FAZ2d8xCr1YhlqLtpgo7yVgEhBPXE=;
	b=RlXhTEFBmpJlG2iGuHUDM+seGHKadSd2YSUc/q4xXyCl/RzHEQH+1Z2rEVNOTqp7fs9A
	 Qe3/Ik5Myhn8jkZkcu9hzcLZk7zqQzBkVHZY+LhEGR3SXT6hmytAF92ovvpHwyieYWt1m
	 3atCiHUV0A5YPaJplNw5bVeWEmEOQSPqYoapBTdqjBauyXeAQpF+gzmpF7vvMU/lCj4H7
	 mSsIM9D9aszkYuDgJNPOVZCZs/FFIiJQkYsPi+a5UjmmTB8TcEE2LbvJaeFr3f2dcQIJ4
	 4CkYd5TGV/sPxFwKt237tyFT7BBn0vUm3ZSRfD9tgrIbBGOXGk6CKDhNPX9NOZOvtAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nim6ikRC;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB72606A325
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 09:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB72606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nim6ikRC
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4b0a307487aso3188305e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 01:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795168414; x=1795773214; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wU4LlfzaVTfqT9FAZ2d8xCr1YhlqLtpgo7yVgEhBPXE=;
        b=nim6ikRC/WTAbGXoW7i6eME06QvX3oaPjttXLeBQZz1VaoNrCWK2LmeoHvjzII5zit
         rNk6PrR1FTkyAI4jenIo0A4ADkkolqv6haLxQL7Mh+HUVTBM8uguxKauGOV2IRmRxLvN
         dLRz6nacQIy5qL6Oexp5dwKNnpYYZJFZgY5eDGb4SDJuws9+kEagEmGpfE2GAqhPWIb1
         ecudZGQWG6GkGy0cTTe9Qm4DtrJviIVeg4z8R+idYy/cLQjnrtI3uHnntyEPn3PEIOQx
         9eeawIsNf12frM0ftKdgGwNNNR7TBIhooEwM76od1gJu+u+rC6QdLGQpm+UzbeeI0xUC
         FjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168414; x=1795773214;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wU4LlfzaVTfqT9FAZ2d8xCr1YhlqLtpgo7yVgEhBPXE=;
        b=CArrf0p3Tt8CfXZCJNGKCsGh66WFJt3PtdP2y7NGl6cOP8A33DyX1T0BmxJFJ3rNME
         gpINnt8fUl6Znn5kecPnhrGQqpZ/xmELydTFOn8pdM06j7s4GoZwHFGS5fyRFntQz+5J
         7Rd4xKP0zRq6dQSs9F9n121HPglZv0I+6NsYu61DG6pcmsRoCL/3ATzzrOFrx45W4sOn
         79/Nb0uh2ZlvlpK/HYguOvs/zzm80f19ZNmggNbBj+rzKuC+7wr+9x0CT7CXANK1G2qy
         kFwu+7vS3stRKxCLAA9EAgF5jxqO5INBelZVlBIMl/n3QUmfjuEIGlMu6pSMDXCNjX1v
         npUg==
X-Forwarded-Encrypted: i=1; AL+hErEH1l2UUmJcfBLdUOb+ju41uymvqhVRaQKPV8dsF91caxIlcd0q2UY4OOiaR99IHe4fs7BJuSAYDFi3yigDdQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/4blvdjWu6l5YHlXx7XfhB/ShN2a/x3zQUaL/dpncC34Hu1OPa
	YKroqJu+Vvxb4F1Iz/GU+gdinGkePdJJ80dzMVoLI7q/nN4jD37/aSsJ3fDc/Jz6LOQ524jrxb6
	W2gcOldtjje6HHQg4Aw==
X-Received: from wrud2.prod.google.com ([2002:a5d:4f82:0:b0:48e:3c17:c059])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e4c:b0:4bb:6238:cd81 with SMTP id 5b1f17b1804b1-4bb88807dcemr52539295e9.10.1795168414195;
 Fri, 20 Nov 2026 01:53:34 -0800 (PST)
Date: Fri, 20 Nov 2026 09:53:33 +0000
In-Reply-To: <DMZD4TXCZSRX.HN0ETV0FWFIY@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118181245.2583303-1-dakr@kernel.org> <20261119111746.3049044-1-aliceryhl@google.com>
 <DMZ5ER6XTNLG.2ZJOF7F4100XW@garyguo.net> <CAH5fLghc63zD9c1F437pQiX+ohgSkYQe4nt3xP4gSTsqAVLzBA@mail.gmail.com>
 <DMZD4TXCZSRX.HN0ETV0FWFIY@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120095333.2135217-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: remove DRM device private data
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	simona@ffwll.ch, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 06:28:07PM +0100, Danilo Krummrich wrote:
> On Thu Nov 19, 2026 at 12:49 PM CET, Alice Ryhl wrote:
> > Good idea
> 
> Indeed, what do you think about this?
> 
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 774db3acb15a..8c48dcfdecec 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -158,7 +158,11 @@ const fn compute_features() -> u32 {
>          open: Some(drm::File::<T::File>::open_callback),
>          postclose: Some(drm::File::<T::File>::postclose_callback),
>          unload: None,
> -        release: None,
> +        release: {
> +            // The DRM core frees the device without running a Rust destructor.
> +            const_assert!(!mem::needs_drop::<Device<T, Normal>>());
> +            None
> +        },
>          master_set: None,
>          master_drop: None,
>          debugfs_init: None,

Looks good to me.

Alice
