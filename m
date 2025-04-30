Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31BD2101A0
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004800; cv=none; b=Q7GR2RLMW7iYvnyuPr2sLHyGXOGJqgkfqVSaBd91QhAOnCAtwtVL2lsJ8DdN/b7SVv6a+ep2nqh9Qiv2HdM1azXVmcbAwCLBhCxXCGM569UrGFZteGEitrMusITfzSw7j0GisD96285EWVkmjR84WcnMCYtfTw6+WQDHO7Dkps4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004800; c=relaxed/simple;
	bh=luVgX4/suuJQBAh5OlOHWiCeMLV7ARO+7+728ivvVOI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LG0bZohqiyWGv6cPZEuRMRKW5CiMWLXK/ii7SKGGJWKMwBKqVp54J2nmEGY87CfVVDQZEp3TEIlC5fAzWyCH0u5ICToQTB2pU1v5CTtXuG0Yc2OkqMAevnEi02kwoBiMumIh66C6NUrl87DAHULWAVdp8U52hW+hXYYZF5cdTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dpz8vgRB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dpz8vgRB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso47856615e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746004797; x=1746609597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7/pamL6WqtmMp82AIocbHVogpArxL5wm9RxH8d6lTs=;
        b=dpz8vgRB05ApxmZgqWCdS6tyakUF6mfr2pXYU5WdLz29MX2dRlcHEuSNUEc9K+OOAZ
         cRTsqBc2MTRY7IwwzEQzHuyymM+FZq9ngKwfKmlh9HLKbJmBlwmE/gwG5W9k/USE+mS+
         b8sax3NIDYGtNoNgiQ8dxNkmuak4a50fBpQE4WEFkY4Djdgc8BaCx1CTGl4DuHrmpuf0
         TH0rYDwMoSshlRCD/vbT8HEkR3uZ2fpwWqt98F7cnrhyqCA5Jdv3J5uQuSj/E5iKOpT7
         XKGC9aifXA3NLxtp75qI8VhJJvrV+g5P019m2hLQnqwnsKAW7jUb51zhv550kKmZyWDP
         DA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004797; x=1746609597;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N7/pamL6WqtmMp82AIocbHVogpArxL5wm9RxH8d6lTs=;
        b=VU7JaEIleV4rV3Mi6wZawZA4ncoq8bo0yeHWFWcEsTtG2vK1W7jNmjj2UyXo5JjeJH
         Kz4EwKdXqb1WsCaxs4dG/a+pkFP9FBEUR9reMTXq+gbup+wFaWmoIvczbmcbwquNDpSn
         jHwVdtaD+h86FYE2I9xVbhdN/hV9dFBnuuzP3RIxEX16W6k2lXUf7LBv9n/yn1barkM3
         tsOx3yWM0oFuZ7Kj0GSPwVaM20P99zdF9xAtgGlUNIaBcsfXYhz65whtOTncpXwh1iHs
         eSsT17qyfIJNgIcCvlQmyDY0BlIw7UrMO0u9oaY6jH0Ora1SWxnlBYUIKJyv0ckc89jU
         hz9g==
X-Forwarded-Encrypted: i=1; AJvYcCUe0IK5W7rASKKXMqpjDWvXdZ495cIowN5PmpymCjGTYWBN6jtOQOw0uycwBcNAMv9HuaEIcJSqWC+Y8tiMNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK3wpzM50p3N1SlGbL2NC3ecTJH11MCi+2esvzrbP3zqYyAh2m
	yUAwnz9AT3PQFUAUgTtB1ebWAS/lb7lnVre2GLMj6dyaNtm4JeMupIS97yGawYufdNnt52URw44
	qOXgdX/dBWq5nzA==
X-Google-Smtp-Source: AGHT+IHu66qXUj9EtiSB8hmpdtbQts3wHdvrZzC+DFJRZm6TgLlK3rsrTKHckH0CIkKSeV5LVQOPRDIesvUlBYc=
X-Received: from wmbhc26.prod.google.com ([2002:a05:600c:871a:b0:43d:8f:dd29])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e94:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-441b1f35f11mr20269735e9.13.1746004797002;
 Wed, 30 Apr 2025 02:19:57 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:19:55 +0000
In-Reply-To: <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com> <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
Message-ID: <aBHrO_hE0CEb0Wfw@google.com>
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, 
	"Gerald =?utf-8?Q?Wisb=C3=B6ck?=" <gerald.wisboeck@feather.ink>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:36:11AM +0200, Christian Schrefl wrote:
> `UnsafePinned<T>` is useful for cases where a value might be shared with
> C code but not directly used by it. In particular this is added for
> storing additional data in the `MiscDeviceRegistration` which will be
> shared between `fops->open` and the containing struct.
>=20
> Similar to `Opaque` but guarantees that the value is always initialized
> and that the inner value is dropped when `UnsafePinned` is dropped.
>=20
> This was originally proposed for the IRQ abstractions [0] and is also
> useful for other where the inner data may be aliased, but is always
> valid and automatic `Drop` is desired.
>=20
> Since then the `UnsafePinned` type was added to upstream Rust [1] by Sky
> as a unstable feature, therefore this patch implements the subset of the
> upstream API for the `UnsafePinned` type required for additional data in
> `MiscDeviceRegistration` and in the implementation of the `Opaque` type.
>=20
> Some differences to the upstream type definition are required in the
> kernel implementation, because upstream type uses some compiler changes
> to opt out of certain optimizations, this is documented in the
> documentation and a comment on the `UnsafePinned` type.
>=20
> The documentation on is based on the upstream rust documentation with
> minor modifications for the kernel implementation.
>=20
> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07=
DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
> Link: https://github.com/rust-lang/rust/pull/137043 [1]
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gerald Wisb=C3=B6ck <gerald.wisboeck@feather.ink>
> Co-developed-by: Sky <sky@sky9.dev>
> Signed-off-by: Sky <sky@sky9.dev>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

> +config RUSTC_HAS_UNSAFE_PINNED
> +	def_bool RUSTC_VERSION >=3D 108800

> +#![cfg_attr(CONFIG_RUSTC_HAS_UNSAFE_PINNED, feature(unsafe_pinned))]

Actually, I missed this on the first look. Where is this feature used?
You only have a re-implementation right now.

Alice
