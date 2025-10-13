Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CB72FBDF7
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760347219; cv=none; b=TL/9fuiFSKCIHO0vXjFAgRgIpOR1gtCb3Ht7ibg1FBvqMJKuX4QSMg+dQ7N5QXEli9cLKpIDVCuOqAgwac3BpO2euNDzBxKNY7iW1rruIcVxoRc11Pcd5xmCkVRJsw8j9Aj1HRmMHFU6zTAcR5pGjTKKX86at86eDu0vmB3VOC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760347219; c=relaxed/simple;
	bh=QauuifBIivV0CnP0lZumGXahaU8WwHf1ZmuHKkcj6i0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XyWaVnrdC2ftZP5ECFnIm/OspYdg9jAaM4EG1GjdpQE64y2oc/8d1hEbg0vCKWA5Kc+X6vyGRe/vOXvzfny5E7UQdfOmqcJxhvCxuG8tGyvilbRfO3gqGwCB25/JMEkgIL0DGCKJVsNXP/2RmaU3IlCj04P70bljB9Kge5TUz+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IcrXebxS; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IcrXebxS"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e41c32209so21555735e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 02:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760347217; x=1760952017; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/YLIXxu3r1bT61bpUEMmybN5f7kCfaViovXYFbL3SjM=;
        b=IcrXebxSEc584xSJhl1w0zCtaFY68KOOBdmnVh0TtpOO9+CpYFnvOjqK16SvQt6Pha
         yS0KTnELubYytvxtAnFOxvL86uI73P8myh3QJ7D6pIhW74hPskA+mdSGqkFkCznygF9A
         +dguVKf9rwBmKuXMlH1CtAhYWibo5jvbGS8WQxqCRxwKMvqtC8sy+GKmlg7rhytAzyov
         ZT8bdQBpKMEW4WgUAhfeXpcHC/4nBDB9ISQD4RORJ/7qxuelSz9kCy/uP2lNCmcSuF91
         7uPD3mRAjbMDRFBAcjCbN7bhsQ1jfoksXmNANgoerQ+NXyi0gNFaCLDBN2GAwJuBfKDx
         mEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760347217; x=1760952017;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YLIXxu3r1bT61bpUEMmybN5f7kCfaViovXYFbL3SjM=;
        b=LFWcqsEB83TehhiqYm8IGXxzrtnTbkliYfhTD+CFhswunIGwe2SbFYs2gs0jGCBt/r
         j0Jt6gq4E2RocExtvldu+J2GXXY0I5e2oVp2Jl4EImmDqn3oGkKwpA/8TnE/EvftLrdw
         xmMIWHDglQA7/V1vMxG9LyLw4Pm/bRvI9LS2WC4Tft2AUx3clOqTXGouBZ80eHIPASPq
         iCesLoYzbbQe1RN6XZ17PPe8+6N22VLrbzXgCkz5vUNPATpcQTv9njJRU2C50Jh/7W0H
         pLNFt5c/LL0pNEocoMXUg7iLhzWv8jcMTsovREjrPM3TQ9G0G3MELiv3mA3v4w3VKOOc
         7ThA==
X-Forwarded-Encrypted: i=1; AJvYcCX7SdpI9ElnQWriOxBIuTidh0fOgd6tiyWZUy1W01nOLC+7gnfRi7EMJTwu7oTfNlNL3Ddqb7EYbSrMfWPAUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKjVLf5pfOVstpVPn4DZXt4MrZGxV1Q7kOQfJZ7XdhD4MPEqc6
	nOgFEiOW/1kEKGQzIr/mutnENbhiEHhCZfDsF/jbDzPaUNrGoX39zz/Pb4qfTPgn/V7d6Sps0GD
	/Ou2DWVczO+OrZmSXhw==
X-Google-Smtp-Source: AGHT+IHb6VBFw+s5vLpdfRpV683e8ptVQHwXIXwalC0rZp9VrZA2JvEvy5kZ5UvL/xduE9r47vW5HXPH+BxtecY=
X-Received: from wmlu17.prod.google.com ([2002:a05:600c:2111:b0:46e:2eb4:38d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4510:b0:46d:d949:daba with SMTP id 5b1f17b1804b1-46fa9a8f275mr139441695e9.4.1760347216682;
 Mon, 13 Oct 2025 02:20:16 -0700 (PDT)
Date: Mon, 13 Oct 2025 09:20:15 +0000
In-Reply-To: <20251013001422.1168581-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251013001422.1168581-1-ojeda@kernel.org>
Message-ID: <aOzET46lagm-p8go@google.com>
Subject: Re: [PATCH] rust: bitmap: clean Rust 1.92.0 `unused_unsafe` warning
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Burak Emir <bqe@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Oct 13, 2025 at 02:14:22AM +0200, Miguel Ojeda wrote:
> Starting with Rust 1.92.0 (expected 2025-12-11), Rust allows to safely
> take the address of a union field [1][2]:
> 
>       CLIPPY L rust/kernel.o
>     error: unnecessary `unsafe` block
>        --> rust/kernel/bitmap.rs:169:13
>         |
>     169 |             unsafe { core::ptr::addr_of!(self.repr.bitmap) }
>         |             ^^^^^^ unnecessary `unsafe` block
>         |
>         = note: `-D unused-unsafe` implied by `-D warnings`
>         = help: to override `-D warnings` add `#[allow(unused_unsafe)]`
> 
>     error: unnecessary `unsafe` block
>        --> rust/kernel/bitmap.rs:185:13
>         |
>     185 |             unsafe { core::ptr::addr_of_mut!(self.repr.bitmap) }
>         |             ^^^^^^ unnecessary `unsafe` block
> 
> Thus allow both instances to clean the warning in newer compilers.
> 
> Link: https://github.com/rust-lang/rust/issues/141264 [1]
> Link: https://github.com/rust-lang/rust/pull/141469 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

