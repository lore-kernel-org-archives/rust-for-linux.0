Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE88D2C027A
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 20:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766003911; cv=none; b=WP/WKVzPuOtSbriYQnJ9loIelM6zloGQzWI8iLoEwW4NRpgnKX/omwUo5BvCXXmA6SuVHWUndN+s1h3xiXRH6LHYIsHufFJh5QIG9vOnNaj9d8MzZhkIfjQ/RWm/do3/1tPHDZWOEtQPYOAl1sRl/anhyRqHdUQvehywpi5ZFKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766003911; c=relaxed/simple;
	bh=yci5mH2cV/pT7oG7BhiBAS/j2KCKhW4AQnnME6O0Rfw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZMsAVna0Xj65U7xV9qQXt8nI0DmYzIQgLiHY34vDGtWWU4KoNRS/n8JdMKH9irxMNUjeD9l9n1Hmgb+naOdfJbvjZruzW4eTMCbDE/MYXxA4wXD1naQdqFoGRd50KJeSMYX5oKrYcweD0Gy6X30mYr0SWuxGhMMokXRiBj8K9WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z4VUw5vg; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z4VUw5vg"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47921784b97so45477955e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 12:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766003908; x=1766608708; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7i5ut8wsLiMpoaCbO6Vuqt68f30SnWA5WfTkgL24kp8=;
        b=z4VUw5vgQvjtrD1Cdh5L2gj1EdQZbcKzIuOirlLr8I/rpkW2nam6XTemHBcytI3oQT
         98gdnJ2+9PO0G6NZRCX368HExFMUVBzTnbN+EIf7iRekQX26hGFGJNA17mzvEkqn67pF
         2oYXob+BYG0e3fKTMDbnSFBk/7bJOl4LafyflrfSS+FsDg7LYJTM4BjiYYp0ow1r5+PW
         rPadeKgiCfPvgKF8KUAt3pNwGe+bTCEb1yzHoG0/7u5SA1Ox+JyyNLbzw14eZHo9mNjs
         QhiV2WP9gDXTE0KB1Yl3eAgDsALfwgW71BI8DvMCxTcb70mz+sws1f5MXIHAdgV64MmE
         Qv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766003908; x=1766608708;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7i5ut8wsLiMpoaCbO6Vuqt68f30SnWA5WfTkgL24kp8=;
        b=K5BaFczjhZzZO+Tc0sID5S4d1pSnd+EOfS9Qtt8NjGCbC2f76WREc/zcmmVAQXwyCi
         sP6J/rKJlLQQzAt7w4pMC1jExdB8giwTvfBdzrzPobxPsvkSw5ILvL3OVLEE+qM5gkEp
         FlkBojaiv/SE9N4vFvP/n8UTI119GdYMF7AgHjYbCa90c4PboGKdssx7ffWSv59zqpL9
         GcfK2+ddY98Uo3jsIf4qYKt1AIH/aoQ2BCe4JgUfEfBo0235j4qGSds6lRk1ppBEULEH
         FSA4oAJnXxOOa2xrXjI58Jm+yYV9SkLVUNz88Gq3g87256vxbem81E8xcJ6hbZxfHH6X
         kO6w==
X-Gm-Message-State: AOJu0YzJmyOUKxgSPULO8cJmYckh/nrmFtvOXGtS9W0/hLyt0JZ4enX6
	AFM4030sNWHlKL81qfze9BQmYJbgZtkw9qLPKEoY+mxOgvUFEtuGU/AwHyZ5y9+c/nAxNAXGYRY
	409L4DKhmXoW/deXVaw==
X-Google-Smtp-Source: AGHT+IH3SpcBHI+b7O+W6ISfhWLyY5q9VCTacPR3UxdcNf18t+LHd/WnROxHJ2Zb5DQ/nDlEYAkO6Vx84Y25fkk=
X-Received: from wmph33.prod.google.com ([2002:a05:600c:49a1:b0:477:a678:a39a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:818f:b0:477:8a2a:1244 with SMTP id 5b1f17b1804b1-47a8f8bd357mr168730215e9.11.1766003908208;
 Wed, 17 Dec 2025 12:38:28 -0800 (PST)
Date: Wed, 17 Dec 2025 20:38:27 +0000
In-Reply-To: <CAO0d=D8c_JYAvhe6cB-R+23-uxH5AnKi7TtuLA3Ra3hfViiGgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAO0d=D-+p2QbA9bxOSO0rd185GY5Pe0ruq=A=hcgTvovC3d1oA@mail.gmail.com>
 <CAO0d=D8c_JYAvhe6cB-R+23-uxH5AnKi7TtuLA3Ra3hfViiGgw@mail.gmail.com>
Message-ID: <aUMUw3A5yWxugLyC@google.com>
Subject: Re: Fwd: [PATCH] rust: document safety requirements for
 fmt::Arguments dereference
From: Alice Ryhl <aliceryhl@google.com>
To: Riccardo Adami <riccioadami@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Dec 14, 2025 at 02:11:08PM +0100, Riccardo Adami wrote:
> ---------- Forwarded message ---------
> Da: Riccardo Adami <riccioadami@gmail.com>
> Date: dom 14 dic 2025 alle ore 13:54
> Subject: [PATCH] rust: document safety requirements for fmt::Arguments
> dereference
> To: <rust-for-linux@vger.kernel.org>
> 
> 
> The `unsafe` dereference of `*ptr.cast::<fmt::Arguments<'_>>()` in
> `rust_fmt_argument` is safe because `ptr` is provided by the kernel
> formatting path for the `%pA` specifier and  during `vsnprintf`
> processing.
>  It always points to a valid `fmt::Arguments` value created by the caller.
>  The value lives at least for the duration of this call and it is only
> read here and not stored or accessed after returning.
> 
> 
> --- a/rust/kernel/print_dot_rs
> +++ b/rust/kernel/print_dot_rs
> @@
> -    // SAFETY: TODO.
> +    // SAFETY: `ptr` is provided by the kernel formatting path for the `%pA`
> +    // specifier during `vsnprintf` processing and always points to a valid
> +    // `fmt::Arguments` value created by the caller. The value lives at least
> +    // for the duration of this call and is only read here. It is not stored
> +    // or accessed after returning, so dereferencing it is safe.
>      let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
> 
> Thanks

This patch does not appear to be formatted correctly. Can you try using
git send-email?

Alice
