Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="onmjAnwQ"
Received: from mail-lj1-x249.google.com (mail-lj1-x249.google.com [IPv6:2a00:1450:4864:20::249])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8F3F3
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 07:34:36 -0800 (PST)
Received: by mail-lj1-x249.google.com with SMTP id 38308e7fff4ca-2ca0ab9a5e6so36781021fa.3
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 07:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702308875; x=1702913675; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yUIMj7SokYe9+NucCQM3I+38l8wF3qwhiLyrCEXuHf4=;
        b=onmjAnwQv7+u5hvxUkl+WhxGESLzgQ6hPoJnPE/UULqdsqTQgqxZfF1w2NoiLXJYoj
         BIAROyXskTwjZo2Npvuhux+xZMuWoZg0HTYQqQEQQXYa1An+2shh7qzPThqdrum8qZju
         oBADg9fP3JnmbedB2pgrD/BS58tUnPZrpXjln0A4pXOsSFC1KNSUljJZnkwbDUY3htby
         2ZTjJr6AcpZJD+wRoSojx1GA61cai4jBo57ut6b7/0kLV1iN5kH7jpfg8vxJwY3T0iQB
         nK57bM+oMrQ4YeLTWW3PyWBCYpObMVqp/i56DOiPKz/9CzSa2/NO9vsA1Qt6oFy6E9iG
         zetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702308875; x=1702913675;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUIMj7SokYe9+NucCQM3I+38l8wF3qwhiLyrCEXuHf4=;
        b=wGr3Bj+4xxD+xV84re2+iy4ilM70vPbjV+6zKCcKkrzkvYVhIv0dOKJ/1/kO8s30tj
         +04RzTqhr5RSgR3tjhcK3i+x1yiWynKaheADvUGnjMeBN4TkPW5iwx2Vu0vMYUOiyUzU
         5MCzeecnZw6pKWJGBdVfHVtt6IrqX09wBaBJt3M82VUuU2mlCpQFsOanO5pxM4neLojv
         G2Ej8wPFxtXUE6KA0JDr/C4UVOe1fJB/8PK5s2CImza8rFUs16cvzVMoeWsBqqtW/7o3
         DBjxn1sTpyyKpdkz8POBDmtulEROPAfCDjzR2RFG4eI09HYvlQFJs9xAP0M2PFeBA+1C
         pPZQ==
X-Gm-Message-State: AOJu0Ywno2U2QOOw9KJcPo1DXsUaHjo/kdwGAofQm60qEfmmPoLgkoo0
	Z11ag6zvr3ft53sv8aeSlXv1dIwu2pouo20=
X-Google-Smtp-Source: AGHT+IGaBat9LnXmgGDC1xTwQa726jVkMyE2+JmsFmeGn8kv7qUVzlL7wGfbeD+9loa8mNUt1gkdtNAeahGjqIU=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:a592:0:b0:2cb:2bc8:5fca with SMTP id
 m18-20020a2ea592000000b002cb2bc85fcamr37033ljp.7.1702308874720; Mon, 11 Dec
 2023 07:34:34 -0800 (PST)
Date: Mon, 11 Dec 2023 15:34:32 +0000
In-Reply-To: <bynTQw4ZTfXBA0m3PYPL50jFnGQIzZnONT_L0TUNuWGtLwJhk6m0jeYQktfEIRmcVZIvKX9MOHwu4RgLWuH3nm5E_AiWNDKuKt_D2HSqsQw=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <bynTQw4ZTfXBA0m3PYPL50jFnGQIzZnONT_L0TUNuWGtLwJhk6m0jeYQktfEIRmcVZIvKX9MOHwu4RgLWuH3nm5E_AiWNDKuKt_D2HSqsQw=@proton.me>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231211153432.4161918-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 3/7] rust: security: add abstraction for secctx
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
> > +impl SecurityCtx {
> > +    /// Get the security context given its id.
> > +    pub fn from_secid(secid: u32) -> Result<Self> {
> > +        let mut secdata = core::ptr::null_mut();
> > +        let mut seclen = 0u32;
> > +        // SAFETY: Just a C FFI call. The pointers are valid for writes.
> > +        unsafe {
> > +            to_result(bindings::security_secid_to_secctx(
> > +                secid,
> > +                &mut secdata,
> > +                &mut seclen,
> > +            ))?;
> > +        }
> 
> Can you move the `unsafe` block inside of the `to_result` call? That way
> we only have the unsafe operation in the unsafe block. Additionally, on
> my side it fits perfectly into 100 characters.

Will do.

> > +    /// Returns the bytes for this security context.
> > +    pub fn as_bytes(&self) -> &[u8] {
> > +        let ptr = self.secdata;
> > +        if ptr.is_null() {
> > +            // We can't pass a null pointer to `slice::from_raw_parts` even if the length is zero.
> > +            debug_assert_eq!(self.seclen, 0);
> 
> Would this be interesting enough to emit some kind of log message when
> this fails?

I'm not convinced that makes sense. I'm pretty sure that if this API
returns a null pointer under any circumstances, then we're in some sort
of context where security contexts don't exist at all, and then they
would be hard-coded to use a length zero as well.

> > +            return &[];
> > +        }
> > +
> > +        // SAFETY: The call to `security_secid_to_secctx` guarantees that the pointer is valid for
> > +        // `seclen` bytes. Furthermore, if the length is zero, then we have ensured that the
> > +        // pointer is not null.
> > +        unsafe { core::slice::from_raw_parts(ptr.cast(), self.seclen) }
> > +    }
> > +}
> > +
> > +impl Drop for SecurityCtx {
> > +    fn drop(&mut self) {
> > +        // SAFETY: This frees a pointer that came from a successful call to
> > +        // `security_secid_to_secctx` and has not yet been destroyed by `security_release_secctx`.
> > +        unsafe {
> > +            bindings::security_release_secctx(self.secdata, self.seclen as u32);
> > +        }
> 
> If you move the `;` to the outside of the `unsafe` block this also fits
> on a single line.

Will do.

Alice
