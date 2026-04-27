Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBB131E825
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 18:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777315762; cv=none; b=A21al2JILnYfPD1IOqh+xoNlv9DfcuylhRudvw6c7FiOYiyjay3TdgvW735uN++fKhYZm/z4i1XTZELnHlyVRN1PGmrISrcYeAwvkSsskOB8QmKZ3OwrYjHGinncfg3y8Q8HI5hFeey0IZCu96Zx8Fhh+gUCPuuSx5qhEIjVvEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777315762; c=relaxed/simple;
	bh=kR4KO50jdZd8//Zt2cnARbtQ0o4oMYRnBX3J0b8EqXo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j45mC+IIXxRI/NwbgZN/Zm1TR9hWm3xQYC4GGnCU6TphQlKVl8U6hKsmz09ppeJcJCxNYhVbyUGiJR5n3sXC1vsyiV4DX3qMHCVQevSEkH/3mYFUTBs/dI4GIeZMKOoZh2bZGF6OkPKsna9JIA4Y/01lrJ63QZywoz5PXwQW3pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cu42fYou; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cu42fYou"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-488c2cc0cbaso77354925e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 11:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777315760; x=1777920560; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kR4KO50jdZd8//Zt2cnARbtQ0o4oMYRnBX3J0b8EqXo=;
        b=Cu42fYou9iDwQF58Ly+2tWjdIBV07Im2PZ5EFBFaWLnCiiBtsIjdUkgxAaqZ5zPJwu
         3dlPUZvxrgg74XCDJ1EQOo9n1qzhxNAcL4vUSa+ZxcpjRoi9qVWnBFSZdUejnPoGKJ5s
         T3wVY6Gcq8/71+MchsVbtrKcZTlSIakqhOnb9yDSgqhm4mDuzlQ79bph3Ks+qzTtIWSu
         RBhofpFATa0xzfRDc5UUKUyWQolVJxON7O9EHp6JSmxEv8dUKFLPCqN9xWMHMsaX7y3h
         mKCPWvcD3wWGgHVN+xKkd6k1xNDlhHzPcF94mtEwii/8U5MShWX4UtGpjHf8XH2QdaaZ
         f/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777315760; x=1777920560;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kR4KO50jdZd8//Zt2cnARbtQ0o4oMYRnBX3J0b8EqXo=;
        b=HDgvh66+mkX2m2eCugMj0QOI8yV6v9LyZoPBLojOcONBfFa2VLapeLdvPfYVW0vXBa
         vt5gL5v32Ik4jBRmCW+4W0X7ShsHja9khpYqGw0q/4k/997NXwu2npbAfwK8SVN9pVfU
         IzMFpcTSEjYrWmI0lAkeBAaSxzhHCBJzf8w9mStk1ke0SL2i/xj6PFCyMhLmSuenRBlg
         aqMFJYj/9zk4yDp9eZqREIo9yD6RH1BQ1qq/+6APqAwaqrTubbR4kndc99QliMXrjwzl
         pknDYOfkfPNXgyO/NyH6dax1xYMEAtmbFbvyZUfD0XH/Uf7NBFfr3XdMndQIc61B6cAi
         mEZA==
X-Forwarded-Encrypted: i=1; AFNElJ+pHLFG9tl+VEUuYfXpLl22o1D2M3OArslYwOjrTa0sXA2GQkl75zascyt9zPTIUCb2dUBNJwuhcAHlD6IJ8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN6sLz2oetjtZWd8ptrRtZy+qfYym+TLE1gViTaYkWOuO83ZMu
	qWTW749fn59OPnSGcMCgBlEw/a96MqvJGLv7bZETRRvYsYhifrcPz43DyHKkoONhN8u3Iq2U+Bg
	O9p+5Be122waWnmvcpw==
X-Received: from wmqm19.prod.google.com ([2002:a05:600c:4f53:b0:488:a636:9e46])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e1c:b0:48a:563c:c8d6 with SMTP id 5b1f17b1804b1-48a76f53e47mr8138875e9.7.1777315759678;
 Mon, 27 Apr 2026 11:49:19 -0700 (PDT)
Date: Mon, 27 Apr 2026 18:49:18 +0000
In-Reply-To: <20260409-b4-tyr-use-register-macro-v5-v5-0-8abfff8a0204@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260409-b4-tyr-use-register-macro-v5-v5-0-8abfff8a0204@collabora.com>
Message-ID: <ae-vrtEundNmLEh0@google.com>
Subject: Re: [PATCH v5 0/6] drm/tyr: Use register! macro
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Steven Price <steven.price@arm.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Dirk Behme <dirk.behme@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Apr 09, 2026 at 10:51:23AM -0700, Deborah Brouwer wrote:
> This series changes the Tyr driver to use the kernel's register! macro
> for hardware register access, replacing manual bit manipulation and custom
> register structures with a more type-safe and maintainable approach.

Applied to drm-rust-next, thanks!

 * drm/tyr: Use register! macro for MMU_CONTROL
[aliceryhl: reformat long comment]

 * drm/tyr: Use register! macro for GPU_CONTROL
[aliceryhl: reformat long comment]

Alice
