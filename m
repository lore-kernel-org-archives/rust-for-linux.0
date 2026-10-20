Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483270;
	b=XGl47IXKn+336cjjqnCM7AX2C5czw+krayDr/79+PE7gDk1yco8iXEk/PwUxJY+dc76t
	 3c/BN9IeJ9uFKc7tTYCL+MCtD8Lv+MzAji1p96aXxnjJmj02NXQIZim93cT3fVt430oBI
	 2jwd0FOD4pZ/7lOyV2Y1pnlo9ecb8oWuVSuH0rtvfL+stRiGeIld3gwRoSFhbEjUONDqz
	 c5RKAmN8tEHAWc+ej1Y6vCB19glboul7uBjA3kK+84hepmP2nK4SgvRC9/JJmmutMQAJ6
	 1RDfA9qTQMTp9Wq7pBo9Pd5+bZLjFWOw0cY9/C8a4eySsAjPIimFs3GmGIESYkLqsmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BEQrrvHcs9KsE+y3M9FCOBwSyvA+LmAr++le07P3KGA=;
	b=PY/AeyeAtQzyhAawxTNQV3Exkvh+tIydEeOHIcxhQC6rd2I8iseNx1FL7Z9X/2L6flEU
	 zZwagHhAc/OL6AMDiTl9xRXeMHRK12448/1y0x8jVRCoCYRuJ5ozNC3PAF4u5pEIyBisU
	 kxgZcoAAGpLtZnsXQqgdzBNcfQ/8RZL/YKNPmGBWxMb6HVwCDX7tDWjOD6aGJIDE/5TRo
	 +kuOkR4vXJsHbnvfCohf7Nz/Nw8HhVCh8Tjdutml2KU182zqKtH/Am+HkZDLFdI+CYGQ4
	 XhLSp+V1JHcrGXYo233edcgZ5KkYC5NKow4cbKu1Tap3Z3BooC/uCUcd4FxkYrc+U8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="Tj/wu07R";
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0652606A319
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 08:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0652606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Tj/wu07R
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1e3efca9aso22719135e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 01:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483268; x=1793088068; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEQrrvHcs9KsE+y3M9FCOBwSyvA+LmAr++le07P3KGA=;
        b=Tj/wu07RU+RFZL5UMPY/lns33DwNO7xzFdlZJ0V/tQFSA8oJw+mHKJntsRtGXIGRUF
         SOgyUhB1GDzfdFPN/C1QNVFhOidXUROJNVhafMGUcM4RGMrpaSa1DVWiaaMTGOEPNiaI
         EsMbrhosuoIUhrQ4Lf435TPeoJxEpW0YeDZg4BhGlN5aZcuF1r1X6DE9xki7mgNvEexz
         LRLP3XU3tklM1onOKNsQinOZTZ5xlBzZiF474uUSKLRKopfJV1OJOuhsbIWUllE7ZF+6
         mzTHfQ5NxVyjL+q7WFPTns+GgcBJQy6kEyXORQMT+Rh/tOXmCKGsV7yY1MZR5YLp9XmB
         Z6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483268; x=1793088068;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEQrrvHcs9KsE+y3M9FCOBwSyvA+LmAr++le07P3KGA=;
        b=xC9bxE+FIIQQeF8JJot988ER5juaCFUf7Gdif+rFY9Z2ZheaTHdlU+30F1Wn766tup
         TXp/N5A+KW17Nks9Pt00BrxtpObTemxVt2noH5HmYt3rbQWEdo3ha4aobtpDuF2sBjSE
         SFA/c97Eb2k27pdpUBdzxNc+R7tVOgO42qbcE0quew/gO4DNiv68kwf2vHSO86FLykrj
         r2VmSJhj36mrA5b8rRbecN2hAf/0pT91O4QkRgJPjsdJ6WHLX72TUU+ipplbSg1s9J63
         A+OQ6pRe9Hc7znoB6lPGLZ1LyNOuluyxtnSKbhHPiY9nNoK6XXw1dUa9MjraUfFfTh7t
         rI1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwpDoxBi75zGwkasO2U+IZQx9sZFXvWJK7A9Yj/Ji7VV+ntkRvr18ilh4rMSsITP46Yc66zqsqcKobIM/yA+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJWosE8Ajk1UfVQ6+AdJtQncuLwFiX6wzNt5LBWXLpQszEhfNd2
	3R2FHmVL6KyWqvB5vCNNz7M7stFgWiuQyyyde6D0Xyd59QqMqi4tGijUFQxBROrSzqE3RUghDKA
	yMpBMplmcSIBj8ZfJaQ==
X-Received: from wmbid21.prod.google.com ([2002:a05:600c:a195:b0:4a1:b4c0:10d8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:81c9:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4a1d7612994mr191651635e9.26.1792483267890;
 Tue, 20 Oct 2026 01:01:07 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:01:06 +0000
In-Reply-To: <20261019-b4-gpu_info_intobytes-v4-1-0bc04df46549@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-b4-gpu_info_intobytes-v4-0-0bc04df46549@collabora.com> <20261019-b4-gpu_info_intobytes-v4-1-0bc04df46549@collabora.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020080106.1742330-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 1/2] rust/Makefile: add zerocopy and zerocopy_derive
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

On Mon, Oct 19, 2026 at 04:25:59PM -0700, Deborah Brouwer wrote:
> Make the zerocopy and zerocopy_derive crates available for use when
> building the bindings and uapi crates and their tests.
> 
> This will be used by the Tyr driver that needs the traits IntoBytes and
> Immutable to safely copy the struct byte-for-byte to userspace.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  rust/Makefile | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)

`scripts/generate_rust_analyzer.py` also needs to pass `zerocopy` and
`zerocopy_derive` in the `deps` lists of `bindings` and `uapi` (similar
to commit 3c847e17225a ("rust: add `pin-init` as a dependency to
`bindings` and `uapi`")).

Without that update, `make rust-analyzer` generates a `rust-project.json`
where `bindings` and `uapi` only depend on `core`, `ffi`, and `pin_init`,
so `rust-analyzer` fails to resolve `zerocopy_derive::most_traits` in
`uapi` and does not see the derived traits on `drm_panthor_gpu_info` in
`tyr`.

With `scripts/generate_rust_analyzer.py` updated as well, a subject
prefix like `rust: add zerocopy and zerocopy_derive to bindings and uapi`
might fit better too.

> diff --git a/rust/Makefile b/rust/Makefile
> index da1a7409d984..f59815fac293 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -361,12 +361,18 @@ rusttestlib-kernel: $(src)/kernel/lib.rs rusttestlib-bindings rusttestlib-uapi \
>      $(obj)/bindings.o rusttestlib-zerocopy rusttestlib-zerocopy_derive FORCE
>  	+$(call if_changed,rustc_test_library)
>  
> -rusttestlib-bindings: private rustc_target_flags = --extern ffi --extern pin_init
> -rusttestlib-bindings: $(src)/bindings/lib.rs rusttestlib-ffi rusttestlib-pin_init FORCE
> +rusttestlib-bindings: private rustc_target_flags = --extern ffi --extern pin_init \
> +	--extern zerocopy=$(objtree)/$(obj)/test/libzerocopy.rlib \
> +	--extern zerocopy_derive=$(objtree)/$(obj)/test/$(libzerocopy_derive_name)
> +rusttestlib-bindings: $(src)/bindings/lib.rs rusttestlib-ffi rusttestlib-pin_init \
> +	rusttestlib-zerocopy rusttestlib-zerocopy_derive FORCE
>  	+$(call if_changed,rustc_test_library)

Nit: non-recipe continuation lines in `rust/Makefile` use 4 spaces for
indentation rather than tabs (same for `rusttestlib-uapi`,
`$(obj)/bindings.o`, and `$(obj)/uapi.o` below).

Alice
