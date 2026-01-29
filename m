Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FD138946E
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 10:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682955; cv=none; b=kSB/7z6eKZNxcZhSgbEFz+2okRyFf096cfnG4Eysk1EZ+u6sqZItVBMkevhRHCk0CSj/DXHH9Vif12y2iuqiNIJAjDvPbwBN1fw/BmuyxVX0oP19y4cNbzzWPD0oi4s/886CPHGOQaaNPqh7fx67lVxIVp2S0R+QcwGXj2an0c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682955; c=relaxed/simple;
	bh=88rgdZSyKAnfp7yiLyRlY9WcBAjwzMxKJ2py/cspLr0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZTMoAMQu/jhWwlR8YcZ1vPhGc2V13s0TETFHG8CE2YIbZcNXPdcomLry5VLKvmVPZF2fiA7xuQ0XIPZdAF9X5x69EmMN3GU0yoywKXR7M3LlQzGe1ws89Im0U7rCug4PrJ5he2qSvX217kxh5al/PBVeg1mZxGBsMNFyjoM9ocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vXkua6u5; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vXkua6u5"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b88622fbe54so91552566b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 02:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769682953; x=1770287753; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VMFX5uZYfGZZ6qnEeaBHfR2E/C6s4tynd/ZlTIWJ++o=;
        b=vXkua6u576fjxY7wqIrLsSC67PWf0OMedpz7BJ9l00wSL8TiiGMrGB57UFlGoJrD0d
         MCIEaVneIXfC0m5805YDkgiJjl5mNaivNdaPxxo6gWxVzymS6ZLctv2fuDzj2/oEr2sR
         nrW7g9gIXLhpfdRCpaVR5BD4Yu1kjCYQN0giN05Km9CKoPXnXKJOHPtYUqOfPVpWu8Hc
         YU0nKPRyQjbuyGvU2Y6z25Czg3hkbFuW1ATBt5MJPy36YCADh6RkksQTGgkh1Hb7ZWJ4
         olFEHmIl3o/Fyomj2ZDESjGVj9I3uf0/Db6LudEzdj41WJAD35dx3XRD1SU2858czRnp
         jDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769682953; x=1770287753;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMFX5uZYfGZZ6qnEeaBHfR2E/C6s4tynd/ZlTIWJ++o=;
        b=jVyQRY5gf5s6YE+a8F2taLzSeZDjy6hmBlPrqbqwCr6wjbsVxuJ5LirrrU3KG3EEGV
         pB+232F3kDyNRScTZt9h+j1Wv2bXViXJEy776mOiiMKyTMS6QNloeGWbQbcl/MjpvVfl
         gvmWhq0q67b7z1bURRkSI53OpWeOTwpDTITftMOrxLRARFsW5tXZ1ERlWyz6ZhuJbtL3
         rReStuJsok8w/O2ZDDN6R3aAW6CZabHwwVS6kHbLKS/bq++pj0Uz82akz/mNnLRU7SBK
         MwI/uECzjqRToGJaM8CvAwvY78ElmKyvJ0PP4NulSezwqnIC1zlY03rM7aiy9VQm/tck
         oU5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgknM58+OxHeUkp9Jxv4uaLFqEcL/3GnZCSvNSOKIwZEBsWjarWzUX6GonS1dDIbfesmDdGf9TjACL83wG4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfhCOBzwIRrd8liT6GuHPLwlc7FOp/SXqKTdZmWrsmXLsvxD+G
	YOMUYBwrbZnoKixwQfHxg7G9sMYhNT+Y52io2K+5kAWez1ropNbrcg7X7S3rQxcCz/aJDe/w/N3
	LOUg+uXVaqXouzgZkkw==
X-Received: from ejcxk12.prod.google.com ([2002:a17:907:d80c:b0:b8d:e244:8f2a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:720f:b0:b88:317a:3f40 with SMTP id a640c23a62f3a-b8dab33ae13mr542441666b.38.1769682952487;
 Thu, 29 Jan 2026 02:35:52 -0800 (PST)
Date: Thu, 29 Jan 2026 10:35:51 +0000
In-Reply-To: <20260129084119.32994-4-jongan.kim@lge.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129084119.32994-1-jongan.kim@lge.com> <20260129084119.32994-4-jongan.kim@lge.com>
Message-ID: <aXs4B7Rib0_dBNSY@google.com>
Subject: Re: [PATCH v2 3/3] rust_binder: handle PID namespace conversion for
 freeze operation
From: Alice Ryhl <aliceryhl@google.com>
To: jongan.kim@lge.com
Cc: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, tkjos@android.com, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	yury.norov@gmail.com, vitaly.wool@konsulko.se, tamird@gmail.com, 
	viresh.kumar@linaro.org, daniel.almeida@collabora.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	heesu0025.kim@lge.com, ht.hong@lge.com, jungsu.hwang@lge.com, 
	kernel-team@android.com, sanghun.lee@lge.com, seulgi.lee@lge.com, 
	sunghoon.kim@lge.com
Content-Type: text/plain; charset="utf-8"

On Thu, Jan 29, 2026 at 05:41:19PM +0900, jongan.kim@lge.com wrote:
> From: HeeSu Kim <heesu0025.kim@lge.com>
> 
> Port PID namespace conversion logic from C binder to the Rust
> implementation.
> 
> Without namespace conversion, freeze operations from non-init namespaces
> can match wrong processes due to PID collision. This adds proper
> conversion to ensure freeze operations target the correct process.
> 
> Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>

Overall looks good, thanks!

> +/// Convert a PID from the current namespace to the global (init) namespace.
> +fn convert_to_init_ns_tgid(pid: u32) -> Result<i32> {

Let's use the typedef task::Pid (of bindings::pid_t) here, so you can
avoid the `init_ns_pid as _` cast below.

> +    let current = kernel::current!();
> +    let init_ns = init_pid_ns();
> +
> +    if current.active_pid_ns().map(|ns| ns.as_ptr()) == Some(init_ns.as_ptr()) {

I'd like to avoid comparing raw pointers for this. Perhaps we should just provide
an implementation of `==` for PidNamespace that compares the address?

Alice
