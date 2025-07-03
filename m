Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6013A1C6FE9
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Jul 2025 21:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751577992; cv=none; b=mXDnIi34kREp3qObgAoFri+Ag4qss4A2nNtcLpZk8Ra+VQ2bCR0Qf7doxMaVVHDFpy+hKCxQKHGR/pVy+xmAc2uhUpRrtQR232depKXMrkHVJG9kjkuoVNP0q4jpFLvgbtJySR6OyJ5uCixUWZbZVMV7rkScCJEXLyhjgkSg7yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751577992; c=relaxed/simple;
	bh=fcScF2Li2iE+rzeQj24dXvUmzs1FWMrT/HfRy4nr7Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPHGphaOykzP3qKQIKw7zqkAM6FYmTbKXlAULRVas2R6m7FSWs41dXHjY+Ua0d6S+f2+8dLTbd2QRiQyvyp8X+Pbd53SzTYa4lc87q+ZFJq3f6genILSYDTsLRNeGTMBV2VpmsdVS39XOHK0bC3VUZgANEMkn45lBfagU9WpgTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oLaTlNFZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oLaTlNFZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45348bff79fso3363435e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Jul 2025 14:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751577989; x=1752182789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcScF2Li2iE+rzeQj24dXvUmzs1FWMrT/HfRy4nr7Co=;
        b=oLaTlNFZNPxJ/H70G0oXe561ZS2TGnbxrmdFxgA062gdVncYj2saQQ8FJ6Gza+0CUp
         wHBmKmF4LxQKAwn+QjCBTGirF6uyye6ZOI8D6i00ZUWAu+ty+UqNyuQ9kG+GZCmIUyVI
         igQfh46CehGQDibXtrCVvv0p5coQkB9hNFkeslzhJYx66eAROqr6oqj7JYUyMMTvCYuh
         1uW9O53GxMbJtixiegVVYEYMip1+eHF+HAL2sC2+iWkCJGEkjZ30CowjQgRvEqSkXGzF
         GxHQ9qk2smdKTqcDUFBouiOgRwVL+OF4o1tPXf+PDkKQQry7pXxipR4upq2+rbA9aypH
         pFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751577989; x=1752182789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcScF2Li2iE+rzeQj24dXvUmzs1FWMrT/HfRy4nr7Co=;
        b=AtXRG2IoQfxJHYKvHkqnT2C89sn0MNqhJ8MblAvLyifyVfzxOOo9036lyQ2KDzvBGi
         kj8SkH5BGVFAlR5yl0eNSV0FWI55TZ6v28mv5hfKmaSXB/79h8t5hNXqPyY+tVSp34xE
         Or0kWF1p9p6pXwMlscbEXUNhbu4CJEUShRrpcZ6Q+BfjHvRGtMju8Pv9FrBn93UhBRF1
         1s/Qhkay+7e5YjWyZysFpefH4LjA0ZhUok0wHVscRCLRMKGRGQohEwCQGyZzRvp5uW2C
         Ux8cHwkrcnadLFLzeQkzztgpmeqqPi1wnvXPIsOsc2teaL2tGOQhStLqDJnNbsHahx39
         uS6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlPufrF0QoTMiKWsWLOM0bkTu1yGKNv40znsMNcsT9bKEgdrWIPTvo/L5mEmQTkCjFjDddaYRGk+r4tMaZxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1KwRBmc6pxLEVRKkV7fZqHZh7gPM/beufy+6r7XGHD08Ez/Zj
	h+ZtvLPb3aX2fCrai506TLtCZUhf33L3TnzAi2yn7rP6gq1LyPcHGOE/1tr/zHma1o69zFD3iEz
	+ERenwlEtx4K6vj3/Z36+kuZ3VSdYXmNssvvVpbRv
X-Gm-Gg: ASbGncvRyDzJhPln2lomGV1LtQ52lVoce3mR23B7SaLOs26QjczOz1VlMOYegngElPN
	BSkTxgIe3Ok3EFwoT7AQwN01a2uqkM+OBTkf0uWoR7s1jBJpAvwzatBCFN4HvD1lVN9EOHtTwmu
	nqh4cA5/TJTWxq9g78nLqG5qNsMBwAGl7D4tK74Y/Q3RTV
X-Google-Smtp-Source: AGHT+IG1XAyEUVg2pztxNrKRTh5b09syCpDvfmlq5SM1Ct7agJOSAKKx4USd0rx1a5tClltFn9f3jAuO2suLm6AuLBk=
X-Received: by 2002:a05:600c:8b6f:b0:43c:f44c:72a6 with SMTP id
 5b1f17b1804b1-454b305ac33mr1219305e9.2.1751577988601; Thu, 03 Jul 2025
 14:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629153747.72536-1-dakr@kernel.org>
In-Reply-To: <20250629153747.72536-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 3 Jul 2025 23:26:15 +0200
X-Gm-Features: Ac12FXyUV-obWXZdLpvBmC6loWxe3pPktRix4vbmOg-M9NjfTWl5JJrUBsohCAM
Message-ID: <CAH5fLgi3muZpf_xPcByEEjVSnXWspmyucVwXGGYQjWn7+7ZoKQ@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: device: drop_in_place() the drm::Device in release()
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	acourbot@nvidia.com, alyssa@rosenzweig.io, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 5:38=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> In drm::Device::new() we allocate with __drm_dev_alloc() and return an
> ARef<drm::Device>.
>
> When the reference count of the drm::Device falls to zero, the C code
> automatically calls drm_dev_release(), which eventually frees the memory
> allocated in drm::Device::new().
>
> However, due to that, drm::Device::drop() is never called. As a result
> the destructor of the user's private data, i.e. drm::Device::data is
> never called. Hence, fix this by calling drop_in_place() from the DRM
> device's release callback.
>
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
