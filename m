Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499020;
	b=Jv/1NNTlp1PPRm8cd7bPqrQHrB5sBSN6pk89BgKEfQA/XRsE6eqHby+VwGCJztsjpOab
	 m9aoVy45UA1s8orq+ShKpewexKInOvIsHChEn6VjNRuBO77JJXyq7O7zuYnQr53w/2D9H
	 9qeEJew2eOyL8qHuYWOz6ydILsBjBxqsM1w032L1Qe2QxTXR52/yapjakRMHvT4+sk41V
	 WeoT3z32gu3bMmYezVa24m61PRPYMmGlz0SgL5bHScZVxNc2DY/MmI9rXgRE9i4INbLDY
	 Fh+WzXvj7KjuCEQqpErhVgVSuethIAJ+bOtWTp7hMyQwFa5/lQ2QInHyr/sGIFUEp7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=I42Z3b+yPEBavpF4t/N9DKKu9fZtHkDth+tw3l5ORkA=;
	b=SfQLbyeTbYw4yLDDjmt13R5xgS6XP8rMM7UAr2dppHUnL8BUlMEvuP/bJaXDBkGAlbxj
	 UOGqNXCm1yz0ALrJgcRDAC+1QDkIHpMPDYCAqlD0Qe/aecAAmkaD1DZHq9KzQ8jxjsZ/s
	 JtaAmRcGeeJUZ5e0y7gFHuJoQCPwxTxxfflDtdgs2k4YZzcagIlODm/N0U2h/gZa731Ms
	 4LHI4FlEQvnKhXh3Zcti5EB3wZAX5ofMFsbnmVr/HUcC79A5cbaeORPRyCQbXAIOf1yPE
	 7pvahvbVo0Ev1gb2ZKbhJ+yoG0cBAOVL16tKeB4bhzuX6yhXbNVuwBxEK+i9xGIrG4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FEemSMK6;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC71606A31B
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 12:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC71606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FEemSMK6
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e00f3929bso536465f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 05:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792499017; x=1793103817; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I42Z3b+yPEBavpF4t/N9DKKu9fZtHkDth+tw3l5ORkA=;
        b=FEemSMK6H6UPLEAX2X8VijY8Me7dhoMMbvdJ0zm6RUqScJ0zOqCAAwEzE2+lLjflFs
         Qc2cAdbhDbhd2ds8aIjSA9X864acwFh+iwxFLe3rZ6vqatoBcw7chkPVnyhZpqS85GYw
         IWaFv/xsSmqGuO3ZVP8TSZIi2vZ5AdjluRxveC+vwy8DdZyFFwVuqdP9zlF6tn+f98r3
         ATA2t+e1DCESnn8f7IMJwmKf0XWWcsG9m0o0F2ICBjKj0U6AtRo1WdgOIJFsJLeQ8FLr
         m0mTgJfXRn9OiXvqFMo4m7ljdeT2EU0M/mhd0M8yfXGibTFsbL83wW1gPOFs0EM2mrMt
         rixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499017; x=1793103817;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I42Z3b+yPEBavpF4t/N9DKKu9fZtHkDth+tw3l5ORkA=;
        b=wfNHJn7+/tCs+YdNnaPaeusX2+X7W/KmhzKeO02vTGSbouOCn+I8DfMbV1mgZYytEU
         IfOeWz2lPBmedovBq8iw+IIAWrdeYT7tkfELwXoNkhdhppPv834z9IimSF+gcFfkto49
         M12Z6H9EaTZhNjr8zRcWJZlc/U9K7e4epkCDCKpeDJvi7SC4KVfv9NwdT24NXevPwqie
         NQGyUcR3IqxnGf5F+R7GE5O4hmkaQcqtTcIUecilOmtK/GmyWJMHwV4vXEl3z3aZLnOy
         FGVNC200lxiPy75hsCblAO1AIGR/lVHzqSe2TgurzNGKlFCJP2XEBt8wtNm7+UVttHCM
         wumg==
X-Forwarded-Encrypted: i=1; AKwUvBx2vSqCrsLoJjARch4BypgRcHRFAvdtO5AYJZ+fHle3z5cNoGRnr7hXHUEWVlOShIq2QoVRQXtJsSNAm5A+yA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLMv7A0IgFFYynNGzh2SnvdOxDXdYQHldu9ChilZvgoeZdRP42Z
	+dJXGaYGDYIspNo3QgYgUqRGT+vI7zpBe9OJ5wCrCvp3sfb/9g1xmGtRQR2F3aDOyYf1QG+3yzN
	yJOIRas70OLbA2+VhRw==
X-Received: from wmbz19.prod.google.com ([2002:a05:600c:c093:b0:4a1:e348:29f1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6610:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a1f4fa26a5mr45442095e9.15.1792499017228;
 Tue, 20 Oct 2026 05:23:37 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:23:36 +0000
In-Reply-To: <20261019-rust-shmem-fixes-v1-1-3f7f6de5b5e7@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-shmem-fixes-v1-1-3f7f6de5b5e7@google.com>
Message-ID: <atddSMMpb3DUauWH@google.com>
Subject: Re: [PATCH] rust: drm: gem: shmem: do not leak pages when sg_table() fails
From: Alice Ryhl <aliceryhl@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Lyude Paul <lyude@redhat.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Oct 19, 2026 at 08:21:52PM +0000, Sami Tolvanen wrote:
> `SGTableMap::new()` takes a pages reference and maps the table before
> `Devres::new()` allocates. If the allocation fails, dropping the map
> frees the table but keeps the reference, and the next `sg_table()`
> takes another one. `drm_gem_shmem_release()` puts only one, so the
> pages leak.
> 
> Take the pages in the initializer, after the allocation.
> 
> Fixes: 616c229ab010 ("rust: drm: gem: Introduce shmem::Object::sg_table()")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

LGTM:

Cc: stable@vger.kernel.org
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Looks like there might still be another issue when Devres drops
SGTableMap, leaving a handle to the GEM open.

Alice
