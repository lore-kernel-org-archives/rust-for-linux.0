Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B4011712
	for <rust-for-linux@vger.kernel.org>; Sun,  7 Sep 2025 10:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757242659; cv=none; b=NgGXGfKOjlC3c9MfRlfA1veeeAy9bfNNpYZ8oKAKM4+5u77yeVW/yWdmttipRCJXcvzlZw6IX3HfILvO7wIrELt734bZPqeJ8HE8WjE2meJHMs+A/VLLBaOwqsY0Xe7Ehehyst2cuDIbFiMDaQUzq/bYnsABCrktyLd2e2r2G6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757242659; c=relaxed/simple;
	bh=lPpPZRm5wDdiOlnmObs6/JqmfBFAenE2Kn0SI6dg+Mw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y/YqwaFzqo5eIUTompLHFKF/b4BEO2tz5ZkVdsKeQcjuIOrvEBujquitxH9SUR3QMB72rBeqtDoWK/DbbQKWqjrlWpJp4u9+OIyCcf66z7OWumLfIa7mXV1IaRNGm6MDy0LGuubRlldD/ZaDYY0WKZ5GKKNJ8LIwKU2/2D2yCI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fZKhdpmE; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fZKhdpmE"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45cb4f23156so18372465e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 07 Sep 2025 03:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757242656; x=1757847456; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9bW5BS8l5hy9hs8XlT7fBWdVcrw/67VKhJ4W74l/W1A=;
        b=fZKhdpmEL1BozGkK59VxXmLw5WHDt8kAw7TVU1qcnazl01tqJaRqoUCSvKPV5+RKe5
         v8xAPyq+SUx4QLcE1Iq7zLwzkh0bfcBmli3JMuTS+NhAp+ICNOje9N+pT9iHOWXt5Ivx
         dbsjEWBAapAsJ7aw99sS3lkr/4IxcqWECEfhdoSzHesJYAE8hALcqm6mEwCXEzw0T45g
         j2PgWi0ZCEoK0adWztAGdfo0HlnHkVyqsbGSwtEEyInZ7rn3OAenrUSP1COCgYGupmI+
         CJAbNawavU99x8jXgK2Bt3G1Ea3vs9AFAeOJcywoguRnG/Zxxrk+tcXKPe7/SU0n1Whk
         lGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757242656; x=1757847456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9bW5BS8l5hy9hs8XlT7fBWdVcrw/67VKhJ4W74l/W1A=;
        b=e9YBj9A/F9sofzciuZZcP6DQvaO6CqHjjKW226n8FzQN5IdfDCdAws1FnnQQra5KR+
         zROZPXDW/F2YrVEAxme+HoSbc50IJuRMwVbIJxwvw+WwXpNm94SERS65EMIbzG5REEew
         qD7zTLDTVtmOE41kdDVzRdPFnxBTDD6oMxVbtY0AZ6blD+pAqGvpeKMvGZGo//KXODYQ
         6sYWCTMeeCa9h8MXIzG/YsbQZxYGj1DJxaJooRHaKu5dNYKameO06YIT8VMOmHqC8KDO
         rcMGbhFMNBMnojkVvVqHYQl3YI9XAVhA72r0A23VM7UomjPYq9fIax7axHmXIrlzhesn
         iwaA==
X-Forwarded-Encrypted: i=1; AJvYcCW1c32LZlCOuDYPhZv6mk8yoX2QOzO2EXcx80DHAiu5UbMVbZvvARz/H0rxMPGSzGEqTMVjWAPSMvkXaKJARQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr+ihDT9BPL7rLCzMNgCjAEupJiTGzvu0H1hVKytcc3/VWUHo6
	mnl10CQ27ZZXAklpvv1z1ypvf/P4rL43Q6muHM3RPqO7zHZ+RSYiJXIHHLurF7CDtwKfz1zxxNp
	RM9fWEBFbTzyj2lo+Fg==
X-Google-Smtp-Source: AGHT+IFHWBdpeOOMGJf+wo6ol1QZ252iQApfx25t8bt4+q6E9lh+rGvi5+RDjvCHUYIHevj0+eJknd7d0bHkPSo=
X-Received: from wmbep24.prod.google.com ([2002:a05:600c:8418:b0:45d:cfa4:ce0d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1386:b0:45c:b5f7:c6e4 with SMTP id 5b1f17b1804b1-45dddedf9bfmr30888125e9.35.1757242656441;
 Sun, 07 Sep 2025 03:57:36 -0700 (PDT)
Date: Sun, 7 Sep 2025 10:57:35 +0000
In-Reply-To: <20250905140534.3328297-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250905140534.3328297-1-lossin@kernel.org>
Message-ID: <aL1lHyhzWX0xGrmo@google.com>
Subject: Re: [PATCH] rust: pin-init: add code blocks to `[try_][pin_]init!` macros
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Alban Kurti <kurti@invicto.ai>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Sep 05, 2025 at 04:05:31PM +0200, Benno Lossin wrote:
> Allow writing `_: { /* any number of statements */ }` in initializers to
> run arbitrary code during initialization.
> 
>     try_init!(MyStruct {
>         _: {
>             if check_something() {
>                 return Err(MyError);
>             }
>         },
>         foo: Foo::new(val),
>         _: {
>             println!("successfully initialized `MyStruct`");
>         },
>     })
> 
> Link: https://github.com/Rust-for-Linux/pin-init/pull/84/commits/2880a9b898336e2d54f80715f00ce00f21f74d2f
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Nice! Would it be possible to include a user so I can see it work in
practice? E.g., for the irq feature?

Alice
