Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483278;
	b=ut06yyxb9C2AH/w5WhMGjUr19AodjpJ9wTuvxepsFxRyzoakxSAwSB6DxzIwrWuBQ7M9
	 JlCWkjAv+OJApr5l/pMwl6v/8fsPhPwZExbFNgqh1Bt3TrrHRYlPoL671X2Legvpy7Ura
	 JRR5OBmjB5MTMtMdswayJFjFJUi8dTDZl5g7WQOAEh1nynPzSLTvrAO3FJMPfH7rnx4VB
	 rwa6e6oDTJdG7GankMXoknfXUjLIiUjUoaDyeSyrfm05tUY8rvLPnVp12uK5WCIj+SwC4
	 GA7stTqYfOiDKmWPMD/8ZY8S0Dx9h07T898dqZMQwsmkuQcB/el/AMlKqGcCSGLbh3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=xQxfbDvKliDHyezjEs6HEpfyze+JfozKdYi4BuTrbb0=;
	b=h1rxdlU6O3HqWkwGSCfTs6ISmhQJLc60zGYRbe8CQGBVgzziDL1FqfymCnymYE0XCdvh
	 ks2sXP0VGTqG2XYtvYy2qnJqHDo+FjOCz1eod1qxLIX/QUwQ4qyVpS7C9NenW4W3P8B55
	 3LRiblEAA9TXcJrSq4LCjGHI3iFzu2HsOrmFW4huUMfBfMDESTAPG14UrBqgGxsYrVz7q
	 2ewjuxdFAhxUjzLfBD2fy+8vKyErYVUWV91O6exdebw2KOSKMgbvKaJH9x80re39vbmTY
	 BLeG/k3dbac56aFICL5Fn2YcW/UkvCCxgOfWgAS98PVqyDJlixgFtfaMIyUEe7LKTqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hLpkKODl;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0789F606A31B
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 08:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0789F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hLpkKODl
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1d7c3b38eso23173345e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 01:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483276; x=1793088076; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQxfbDvKliDHyezjEs6HEpfyze+JfozKdYi4BuTrbb0=;
        b=hLpkKODl+4yAxysjklEYIkaZ4bq71SDkJ3GmN1TvB9USqZK5gKG23WTgO8LCocnbwM
         YytvJhwXChWMxEt6nkQOwz5A1groobMMnVbpy3Rvu9hjkgabwyRHdh+ggeHP/bNLuedG
         unQ6kH4v0FhOcZ7aLW+UYXUNspxRONG6U2mFBhKiu0Y9/dycrn7wM3W85sVjqp8JMc90
         ZN98ihoWGwWUBw0jNrl0h5vaFA6+gduXv3DLa2J7+dIzPHKlIewOWEBClVUWt2bJvrYx
         orcrROAKSYY6xA/LhSlq/+ZA7pXGB1PRq0bRweY+tA4CnvyMpVH5jejaD919ubKNXxAq
         4w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483276; x=1793088076;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQxfbDvKliDHyezjEs6HEpfyze+JfozKdYi4BuTrbb0=;
        b=IlV92sgFak+dTCxn9V2M0qxDfdY4uTPIdDpplo9C0qjDQ+BCXusUdnNqilfj00s+EB
         MlfGd3QCkxNb4U6rRty9Yn3q34vY+ZXeO4oC/3z4q9LpaJ5K8Br2ua4OCBdWL8Q+0nW+
         arHLSK6OySx35UFJwnCW/g86DXYGNgZEh/xITS7lONXHop9CZbWciC8pNxLJvrKDgzRp
         nr9IqGz4f2kvE5Btb6YEyB6vRWqpHKtI1DmmJdD2AlL3mm5TZkUNhyYP8PIHbWIPW2dd
         SYMUJm+tEwV3PivnvZ3J+0ci0jzSb4nFR8wttC2KJE65gjt0cO+NRXpZMlpgSABeQ5ZF
         dGWA==
X-Forwarded-Encrypted: i=1; AKwUvBxfEMHNPdoXMtzveth7Dc/+MiZBgyXhEKJOT1NzyZRVBwy90rYX59rgUhIrWvzojKjhs4NaZeu+6seZ+VCt+w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKJBc7avu2RBVhIxcuXGS8a2/YmiAdJfyZqi8qUtKG5xZi0lAqZ
	DNzBpH9sMR0uoe3H7Svc3BPW+8kbKN/G78YBazR1OkZj1MdCXXqVzQb/59soinpXzAo48PT7CNH
	76rABCLLd6Otem7Jlng==
X-Received: from wmlv13.prod.google.com ([2002:a05:600c:214d:b0:4a1:93c6:a7ad])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:82c5:b0:4a1:e575:33dd with SMTP id 5b1f17b1804b1-4a1e57533efmr134049685e9.18.1792483269703;
 Tue, 20 Oct 2026 01:01:09 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:01:08 +0000
In-Reply-To: <20261019-b4-gpu_info_intobytes-v4-2-0bc04df46549@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-b4-gpu_info_intobytes-v4-0-0bc04df46549@collabora.com> <20261019-b4-gpu_info_intobytes-v4-2-0bc04df46549@collabora.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020080108.1742496-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 2/2] drm/tyr: safely write GpuInfo to userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 04:26:00PM -0700, Deborah Brouwer wrote:
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index e1b04a0c5159..4808bcbcc3b9 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -28,6 +27,8 @@
>      }, //
>  };
>  
> +use zerocopy_derive::Immutable;
> +
>  /// Struct containing information that can be queried by userspace. This is read from
>  /// the GPU's registers.
>  ///
> @@ -35,7 +36,7 @@
>  ///
>  /// - The layout of this struct is identical to the C `struct drm_panthor_gpu_info`.
>  #[repr(transparent)]
> -#[derive(Clone, Copy)]
> +#[derive(Clone, Copy, IntoBytes, Immutable)]
>  pub(crate) struct GpuInfo(pub(crate) uapi::drm_panthor_gpu_info);

Two tiny optional nits since you'll need a v5 for patch 1:

* `use zerocopy_derive::Immutable;` can be placed above `use crate::{`
  with the external crate imports.
* Now that `unsafe impl AsBytes for GpuInfo {}` is removed, nothing
  relies on `GpuInfo`'s `# Invariants` doc section anymore, so that
  comment block can be dropped too.

Otherwise this looks good to me. Feel free to keep my R-b on v5 with or
without those tweaks:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
