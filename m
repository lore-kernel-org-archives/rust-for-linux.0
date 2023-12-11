Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FFV9FKn7"
Received: from mail-lj1-x24a.google.com (mail-lj1-x24a.google.com [IPv6:2a00:1450:4864:20::24a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA66EE3
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 07:34:27 -0800 (PST)
Received: by mail-lj1-x24a.google.com with SMTP id 38308e7fff4ca-2ca23b6f61eso25715261fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 07:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702308866; x=1702913666; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=quKkQtDAheMF2d2l383YfhdmdDBNq69Kqr0DxY+KMkw=;
        b=FFV9FKn7kl/ny0nza0ThrFt5QMxSaOhfRjD1pgshwnb22WTfWk87cE8RiZrGFt0WeG
         xTNyUJ3i6nVz36V9Etfigqu61F1NIDfUu/4vESCLvfw6sYHDPUvaKzQXoVinSi1fFRMn
         8R47r3735qCgfVL0Y7Re+7UlLBp7sC/kUhqJx2XWOGVV822Rdn400qUpsj6WEGmfyM9c
         EcMlTWEQCeaUo9oXgiu1URGLRhU12556gdlM0Ei5tShAni33xa19sn4V/FkaVqyCk3yl
         4PwAPONcSRMnJaYroJ0PnK+QddaBtIivYHaF/ckkbDBspAtzRvV5SDUpi1iz4fIVv8KY
         HS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702308866; x=1702913666;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quKkQtDAheMF2d2l383YfhdmdDBNq69Kqr0DxY+KMkw=;
        b=S/i3lxgEK7rHA9rcd97Wz0kMSEDs/xJqqgvnRsseYKxiCFddmLiPghK4uuhlVY4nuz
         2mxBonNBaJWjjiPYwJUdkDzDtd3vbpcy+/27M9A/6mKTzU4BP3+XsqP6T2MF/kqfDmV/
         kSp1rBcZPAMAPbXB1XSuvVAD9TiRA7tnySi0TVnT8hVPL0O13fvVSWwN1++jr6mHOheQ
         l6NYVA8Jl3CESMkBeTGYRyHRYBJ8NkVV+ASD704DJAudP9IxwlnvzNYGau+0IEgzDgl1
         gubNRaj2Exflfej954jV452GVHWOuYrPiHy5MY2Cwa7Yu9OyQFTpJWqLC93SkY8/OtZ2
         tvog==
X-Gm-Message-State: AOJu0Yx9sl77gjtXZADbr4Simqj0uGibsm7+bnY/gpacqG++VLGzV6Rg
	r+oMrTWa2NKUDaPJ1d8OliMtV8KKtVQd8rI=
X-Google-Smtp-Source: AGHT+IG8Cg8DINjQAYQUvGbJJE7A8mvaWFGAWJ8W1agA8FjPYmtW/ujH6tQlBNwpTSqn4hac9NByvFt3FV6R7Uk=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:9c8e:0:b0:2c9:f93d:994b with SMTP id
 x14-20020a2e9c8e000000b002c9f93d994bmr92946lji.4.1702308865917; Mon, 11 Dec
 2023 07:34:25 -0800 (PST)
Date: Mon, 11 Dec 2023 15:34:23 +0000
In-Reply-To: <9q-gcPBFqAZ1mAEZ333ax8Y16e8foTXUWsMijcJyvMhBVu91g4cBo3xRVXVFJeMUW3_67bCukA-bfAzpCwXdbHqwEdciNa8UJBJaCL2q2nw=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <9q-gcPBFqAZ1mAEZ333ax8Y16e8foTXUWsMijcJyvMhBVu91g4cBo3xRVXVFJeMUW3_67bCukA-bfAzpCwXdbHqwEdciNa8UJBJaCL2q2nw=@proton.me>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231211153423.4160836-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 1/7] rust: file: add Rust abstraction for `struct file`
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

Benno Lossin <benno.lossin@proton.me> wrutes:
> > +        // SAFETY: `fget` either returns null or a valid pointer to a file, and we checked for null
> > +        // above.
> 
> Since now both the Rust and C functions are called `fget`, I think you
> should refer to `bindings::fget`.
> [...]
> > +    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> > +        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
> > +        unsafe { bindings::fput(obj.cast().as_ptr()) }
> 
> The comment should also justify the cast.

I'll make both changes.

Alice
