Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yVdacp+h"
Received: from mail-lf1-x14a.google.com (mail-lf1-x14a.google.com [IPv6:2a00:1450:4864:20::14a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88231DF
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 07:34:30 -0800 (PST)
Received: by mail-lf1-x14a.google.com with SMTP id 2adb3069b0e04-50be79e7f71so3363350e87.2
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 07:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702308869; x=1702913669; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rctRxd7Ih5xwyv5baEpKW/ad4RMHUzIW0rCHfR1fe9s=;
        b=yVdacp+hh8/stabKGGBktm9cFwg8p+paAgf1tew4U47Z4813vxvzI4vsbAWVFC4gJb
         q8IJkrAsFpC8fTjB53lN6cRQ8ndZ1fnvK4Zo+X06sRPL2zNdkKGDSf7FR9p85JyW5DcC
         mv182GZQlpWMGWFggYpm6gOTM325YQg0rJwWzMYTq1T+ICit2xaQYtCSr85lKUBwz+y9
         7qWcnhJGB7GCkSZ5bZ+iiCS2mp2bxhUmNu5q5Gwj30EUEqIbURCgwXs+/mBL13CuH9hr
         Ph8uYW5al/M6QpPNt43yJUiiRreIXQqsSr1CKa3ooPLVHZ4IHrKKPz7yAcoNFCjVeIkV
         sttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702308869; x=1702913669;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rctRxd7Ih5xwyv5baEpKW/ad4RMHUzIW0rCHfR1fe9s=;
        b=HJ1U2cNsSqfF8WVTbXExxdbohO8gcz/vJXWpwE3q8zk9GsM5VnhUISHrPwSkZRUYUT
         ms3WX2n2loGvlGGpmlOj/vJO8XVgHdeB2NN5AaQ0wobxptVo4HFS8cnKjfBmVR4v+Jon
         9KyLPk4wsURGYw7tSgBpzozwaND2oFG/s9pEzsaLoYOmVBRJeTZTqQWkI4N/c5byVswm
         OoxwE5GyfjLxgtWwNTy/ehdpM8u6JX66nQohNsJ1u4uxsG8OJeVsDq7bMHYSEPmPQVjo
         P9wz1URkdrnZ+o3eM2TSGDStOioWNvzMq44PPpxfzfovaUlK49eCtkcG/M9M6hQTWQG6
         8EQw==
X-Gm-Message-State: AOJu0Yzyw0ffdsh2E9reo5jjxHf2QAYKPiFM7/V/KLL6b4OTooqAowU7
	xjcDIOv0tapA3/Tpp85ifCfC1+/ocTDV6b0=
X-Google-Smtp-Source: AGHT+IFUSkgsTrAXrdZfRjPh+Y4r8FjzWQuE2Vy5UzW7EdYa53me3IAAQr/8OF7qP//zkA4p7sR+JwmTncJyjW4=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:118a:b0:50b:ee6a:c41d with SMTP
 id g10-20020a056512118a00b0050bee6ac41dmr33367lfr.10.1702308868720; Mon, 11
 Dec 2023 07:34:28 -0800 (PST)
Date: Mon, 11 Dec 2023 15:34:26 +0000
In-Reply-To: <8VBM8spxE8lhkvhYGfxxUFwslCWxi-ZL6rGHHDYD6Gn5dZqsdUQfZYDqtykJzQNFJVsQje_B4hGVDRqy3zY3TZGLSL7_YXbhKcIYfvBS02I=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <8VBM8spxE8lhkvhYGfxxUFwslCWxi-ZL6rGHHDYD6Gn5dZqsdUQfZYDqtykJzQNFJVsQje_B4hGVDRqy3zY3TZGLSL7_YXbhKcIYfvBS02I=@proton.me>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231211153426.4161159-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 2/7] rust: cred: add Rust abstraction for `struct cred`
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	brauner@kernel.org, cmllamas@google.com, dan.j.williams@intel.com, 
	dxu@dxuuu.xyz, gary@garyguo.net, gregkh@linuxfoundation.org, 
	joel@joelfernandes.org, keescook@chromium.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maco@android.com, ojeda@kernel.org, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, surenb@google.com, 
	tglx@linutronix.de, tkjos@android.com, viro@zeniv.linux.org.uk, 
	wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="utf-8"

Benno Lossin <benno.lossin@proton.me> writes:
> On 12/6/23 12:59, Alice Ryhl wrote:
> > +/// Wraps the kernel's `struct cred`.
> > +///
> > +/// # Invariants
> > +///
> > +/// Instances of this type are always ref-counted, that is, a call to `get_cred` ensures that the
> > +/// allocation remains valid at least until the matching call to `put_cred`.
> > +#[repr(transparent)]
> > +pub struct Credential(pub(crate) Opaque<bindings::cred>);
> 
> Why is the field `pub(crate)`?

Historical accident. It isn't needed anymore. I'll remove it.

> > +    unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
> > +        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
> 
> Can you also justify the `cast()`?

Will do.

Alice
