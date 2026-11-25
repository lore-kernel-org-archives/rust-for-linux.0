Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618997;
	b=EvjRhO1RRGILmjcZSiX+2qOmg4CecI5q6/JWZE4hDEKPJNwh2hH3bl1i9s+JwJIaJYsz
	 0mCo1orjq2l79Ddh3Nd54jSTQUj7iBZ/+AcHFyrTtntIKietyNfQCeyaTpd/hmFDnF0fQ
	 ySg3zcd/6giRbiZbuS6gTSYx9SUHsLcY0oSoLFnokXr/oZh3ugEgwq47DWx02DgJNA2Bs
	 5gFfRoWc7RBR/SQHieDsOqtwbTdvGKEjYsrFMSp10Ulz//bQhucrC0XSvrho7Z3FijI5a
	 tDHBDc6q/Jz561UdWWJ/riRQ8LHWLsamAfT2wQqu4S3mCVD95n2G0vQWBLVwnyXWqzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=N4O2DbAYKqujXPOE3qGC4/NB1PRFQz/yrJhP3BnWqGc=;
	b=yTz8/IMyTZafPPzRDB50rsWuXwpZdgw1z2jflZx+dKGeJjgqx0IQQ2+MgHH58DIX363m
	 jekv86W0HtfKfbq+yAViDOaY/WSv4EOCyfGTA/rz8yR4JLVbDgppo8HZGSHw7A1gfyvpQ
	 fKgZiJRHqNwK56wbHpovAF/EBH/hs4kJmWmnFR2OMpMb2EJ47gfOOgMtXVVopQdCsLQ1q
	 0h88JJm3PbTyEOT9WBLbHO/wgEI7sT3/a36e9ustwGgmkk/gVJzur4Sos2/bP/35EE3+f
	 Hctys5bqg4Gc+H8Mu9UBGJgfOMCWooRml4d59ZhmvBE2y0IFs6VfoP5i4GJS3hSTgSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nA6o9YS0;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4134D606A335
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 15:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4134D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nA6o9YS0
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so38920365e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795618995; x=1796223795; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4O2DbAYKqujXPOE3qGC4/NB1PRFQz/yrJhP3BnWqGc=;
        b=nA6o9YS0JDCjENOgK23oRWt39tSZ+7jAlrpFeu6eTbevBHhESqnKpWIyByw9TdM90Z
         xJExr3JEAz0pnvOhBA1BL6SSR1T498hzLQmXrGM2aXbLZCo8zMURSQBOKNK24W+YaKeP
         n/SrJGXbiJ5Kxq2MNo28AqaCK2tQ0dWYUD2ovPqWC+2BGDeVFYwSUvy1XZm4Gv8Oovbm
         FR+CR0r2LyAZHzhQLGq3Az9lZAy7L+PSmqgPdCRuM+iSOIjq/iksaQ8Dc+23wCnY1RHz
         Lp84BV5+dfXSl+0Blq4KMq7pbWHXE2TCmTz7q8j7QPvPresrr0LOBB9QmskfelE5vp3j
         1x6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618995; x=1796223795;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4O2DbAYKqujXPOE3qGC4/NB1PRFQz/yrJhP3BnWqGc=;
        b=mq7bgaOis6Zoy0Jnjv1cGRoEg6GThpRiwoYi10rjDmWnTUepQ7X34+/xklETtk/XUG
         10Eb0H8zUd0hFsDTsDmMS/gjBjvgd55qXxIIBKMPjJ7cQfpZF5Tq4sKptRme8wnZ/+Th
         OhW1CZcOloOc5kk3n7bUB4mlJjz3tloms/9bNUdV9TnePHHYqtt6wORP7gDbGCKx2RWT
         6/nnSM828CBul9Arn/+W8EXAZE8eirrmubRVPGGGZZpNWJYNvh15i6TdZkZUhMm/mFE7
         ab22sh7ycDVj+uRhAJeaC+tVW9/tnrNKRj4dY3x8FSMMzM1JfaSR0CHgNiNzXvPhD/yJ
         +KVg==
X-Forwarded-Encrypted: i=1; AL+hErGkcKlAwcmDqnx2ovfMRu1xgiRi/BPsIMx5dydtfTzDrLZGUV0NH6JXvZrIv9ZZ+xoP+CjDnNyHZEqGI1AQBA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9fRv+OgXc8C4KZzFXsYrxHpog0c4za8jxJK9xTrPA7NjecW5EB
	YDk66RQWEF8elu+DR6Yt6T9O3KOHez3xP4C1WhAcvSExl/9PCvmM+g1dEdfHZjMF52jAx68efIW
	Mqsac2VkgsGm27SC6yQ==
X-Received: from wrpy15.prod.google.com ([2002:adf:f6cf:0:b0:4a4:8614:8907])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6748:b0:4ba:761:97a1 with SMTP id 5b1f17b1804b1-4bb888251bfmr350875475e9.14.1795618995334;
 Wed, 25 Nov 2026 07:03:15 -0800 (PST)
Date: Wed, 25 Nov 2026 15:03:14 +0000
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-2-000f7a9ccb8d@jannau.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-2-000f7a9ccb8d@jannau.net>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125150314.1587795-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 2/5] drm/gem/shmem: Initialize private objects via
 drm_gem_shmem_init() too
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sami Tolvanen <samitolvanen@google.com>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 12:37:44PM +0100, Janne Grunau wrote:
> Rust drivers need to initialize private gem objects when importing
> DMA-bufs. As with regular objects the ideal way is to allocate the
> object in Rust and initialize it via the DRM gem shmem helper. Expose
> the `private` to the exported drm_gem_shmem_init() function.
> 
> Link: https://lore.kernel.org/rust-for-linux/20261118114102.490384-1-aliceryhl@google.com/ [1]
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
