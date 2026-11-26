Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687378;
	b=Gw6C1KT/63p7v2PcJN09goFI0PXKsoin7hVXyhza+9LhtYdXg5zAlOnBfLFaUhhEdQBI
	 FNjXTE8nZe6Iv4L4JTX/rcmlmErMddL/HGKCXSZ43r9vU9amDNo0N6gZe4UXg9eQkudEl
	 9ysTMeDXmAtI03qNmmuv/w7lIEZpUwSyy2jsblkfNKqVoRmcV6O8GNiwKQXm9PhB6KHWS
	 buT0HkZ2WYzyOoNPoyQiv1zuP2ax1j7sX5/tpk2DcIbVU4L2H3YKFbbppSbv0jfoMob4R
	 w4LgIm9QCaHOKQeb5y9ScI4FKj1Bywi2+MoixZS+kpAur3aHmxKVUvIrUCts8evSOwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=yz3Fvi0Z1WbpqBTLJfHCJBGO30gXD4l/AgDztFQ3PBw=;
	b=XuCxJP4fgMbW6BIfycmZFVo7kNltYpUsS/KvHmA2fjy/fNwfO30iZLg7z8przLKINce0
	 LPJsvcvjHo1REeK4oV/Lmg9CjHx8FqM9U/fJ3hJRPuj/uPTCtBhg2NZV2S6FTKF8i6IHa
	 0HikTAHdg79jcFah8pVnYNlRzGL4Lsbv7yBEygl4pqkrKEFn4lteeRVzOQRe039j6X90w
	 AH5UvvZafMtGMjvxcKQu/oZY+GA8hhuTCxj6tkYRsTm3v9p58Yu+js+ckhFLEd7iuoSSO
	 N4WTT0z6CR0Wjt3so6B2I8/uWbOnCQzuB+OsI/Rlhw15KFl6QwYeDsYLC1oDW/+NUxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E12EJywu;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A40606A321
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 10:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A40606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E12EJywu
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e00f3929bso3983749f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 02:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795687376; x=1796292176; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yz3Fvi0Z1WbpqBTLJfHCJBGO30gXD4l/AgDztFQ3PBw=;
        b=E12EJywuUH6ee4wcIsNOeCHLhvkUSPi47vFotlTOk7NVzd/jcCJ5XZJgnrB20h8MSZ
         uVHkFgiIjTVJ7mVriiRSLYGSOiCEl6Ib7gqfXjOLQwBR9cHig6CrjVdTXU1rDrlwL7ru
         d0DN+98GEGIWwC3SrowP9VuiXXwCy7huemRr0wbM8IHRBxcodzsZOy95EdQEYOCgLzQA
         pwTrW/Er7CuVT/u8iojzVz+WQf8TfJDjQWjSM0Az4OCK6s59wlA7nao80PTRXkkYh6hP
         oLZP4C9vgSVARBjyupemQb0kPqolR2gr8C9bobAIlk3VMKvRGsJ13Wwx3cIrPu2j5y+l
         txzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687376; x=1796292176;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yz3Fvi0Z1WbpqBTLJfHCJBGO30gXD4l/AgDztFQ3PBw=;
        b=nhKg7H7FSOFoTQn8rnDFt/Ya1QxTIlqievl5mFG/SqkYA1sdwfF4yaCU7jD+al8o90
         sWq0qzRHUrViIVWLWBqUCAsJTuPsVFyVJJQf/73KGmyZ0FsQ9+dzRNbET1dKq/8eqpN1
         dJEdvYagvrxbN24EgsiN2IBlSCqu9bs+OPi2gqkGTlvd5O1FuscA2f+adKSig/gqjtvW
         wxibUVF0ZGeT5gPkymvwMrxqB91VPezfj2DL2Z+e+nJ5n+QnhP0RdfBwz92os/mONc13
         aPAgIBT7bW8qSfSo+x//5Y8aQ9xt5f4xWcFr4FfyzlVMfYj5hn8Ipo8olQyxqzR/bX/Q
         ZgLg==
X-Forwarded-Encrypted: i=1; AL+hErE4Ay0M5aMA1WFGt+OxJelEM/iPXWE67tXUwTOsTmyrY8fEaX8jkreaMv1EvD/3J0qJnO4MMeJArGrnsngk4A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/fJSF1kogDnu3wZIOoLxwGEz6SrUY2VcfU1GiuOHLCJ8l8QAsI
	PAnADXtpXFsI7xTgjKrO0ScpRZADUyCB4IRZc141c0j0SXpa8Mv3JCmWdgPyjtma4k+8cKSOwxw
	D/dGqscQOcQIoZYDsRQ==
X-Received: from wrmk10.prod.google.com ([2002:adf:e3ca:0:b0:4b7:f63a:77e8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:600b:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4bb887fb6e7mr422669095e9.6.1795687376087;
 Thu, 26 Nov 2026 02:02:56 -0800 (PST)
Date: Thu, 26 Nov 2026 10:02:54 +0000
In-Reply-To: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126100254.3642219-1-aliceryhl@google.com>
Subject: Re: [PATCH 00/13] drm/tyr: reduce the number of `as` casts
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 19:46:51 -0300, Daniel Almeida wrote:
> An `as` cast silently drops the bits that do not fit the target type,
> and nothing at the cast shows whether that can happen. Tyr has 86 of
> them, as counted by `clippy::as_conversions`. This series removes 62.

Looks great overall. For the whole series:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
