Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OtYewhT3"
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79EBC1
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Nov 2023 09:14:36 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-58cec5943c1so30795eaf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Nov 2023 09:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701278076; x=1701882876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVsHkDnPJv0j8Tyw7llEjBSU+xBdT2jqqtQEJ/0zHok=;
        b=OtYewhT3wmSbRL7ryhSGj0r15FYQ7Y7RS8yNJv7JnCy4UbHx0U7mQ1W7jo42tx/M2Y
         Ie28l5Km/fGm/OXKTp8I1lnDi/dR2KHFAS9SjNa3PO3eaMczQaaTNcZlxArvnQR5ARr0
         3vAHzm98zbFAy1f+GzAeAcbIbkVvE8JUnRKm+9dlQG5sk7iFVKK2fjpod9ihR03+qKHG
         1EzJ0YCnPlPl/4ktMeFqXBZAud3heEanQVCwXxYviq/7OMVwQ18LYXlE/Xd8ELI/MYVM
         DTnJmS1UQyrFlFcrXPPJiucu40+KtOKlvl9Dv9r/kwF4kUsIJNvAHlUG5ruPOlrnExgS
         BmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701278076; x=1701882876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVsHkDnPJv0j8Tyw7llEjBSU+xBdT2jqqtQEJ/0zHok=;
        b=rLzmw6qoZXWPZd+k1YUSdzKiB96Ll7EpUveWdRS7SVMvmI6g6CotJiWDauQkW+tIUK
         iUFI4WBBgGYbUg/QcfddnrtwLQN5NT6bPsk2S4IXh3A4oVP964aQijuIKvuDX5Qroygb
         pQiSUmXK0KMC1mFyds49P27EOLRReC1Ld3/x5YbIa6JRyq6YEsNlwZiqV5HfNLCJNoBp
         yXQ3LL53tnG9FmrkfwPHwLqoUL9E/4b/zOYRKeHdn5MCg7hEhdyg+NVkvzuGvYSJbaQS
         Sq/qS3kqCbLz3RNZ3z0duOC2N//wr8EOspGfREhktW4D9AlHSamkgMhDtY168r1EDEUK
         z+ug==
X-Gm-Message-State: AOJu0YxsLyKLHGulrAszk2HH4ktThfV+pSugoSwjQsd8dxrCULC4IMNt
	VFS2dTrmjdo2p2p+1BzsavwN+hjObneEfbGo5/rrJw==
X-Google-Smtp-Source: AGHT+IG/Y/jre/2EQ/tO3gsWKMCBwDqTqTUvW8ZnVpGn4c1xWujT3jYFmjBsMcCjYyA3TQyN5J0+PC1fAeByipFxMuM=
X-Received: by 2002:a05:6358:9998:b0:16b:fbd7:e34a with SMTP id
 j24-20020a056358999800b0016bfbd7e34amr20723935rwb.5.1701278075870; Wed, 29
 Nov 2023 09:14:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129-zwiespalt-exakt-f1446d88a62a@brauner> <20231129165551.3476910-1-aliceryhl@google.com>
In-Reply-To: <20231129165551.3476910-1-aliceryhl@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 29 Nov 2023 18:14:24 +0100
Message-ID: <CAH5fLgi6n6WiueLkzvZ7ywt5hXWAJFAyseRr3O=KRAHUQ=hNrQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] rust: file: add `FileDescriptorReservation`
To: brauner@kernel.org
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, arve@android.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	cmllamas@google.com, dan.j.williams@intel.com, dxu@dxuuu.xyz, 
	gary@garyguo.net, gregkh@linuxfoundation.org, joel@joelfernandes.org, 
	keescook@chromium.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maco@android.com, ojeda@kernel.org, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, surenb@google.com, 
	tglx@linutronix.de, tkjos@android.com, viro@zeniv.linux.org.uk, 
	wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 5:55=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:

> >> +    pub fn commit(self, file: ARef<File>) {
> >> +        // SAFETY: `self.fd` was previously returned by `get_unused_f=
d_flags`, and `file.ptr` is
> >> +        // guaranteed to have an owned ref count by its type invarian=
ts.
> >> +        unsafe { bindings::fd_install(self.fd, file.0.get()) };
> >
> > Why file.0.get()? Where did that come from?
>
> This gets a raw pointer to the C type.
>
> The `.0` part is a field access. `ARef` struct is a tuple struct, so its
> fields are unnamed. However, the fields can still be accessed by index.

Oh, sorry, this is wrong. Let me try again:

This gets a raw pointer to the C type. The `.0` part accesses the
field of type `Opaque<bindings::file>` in the Rust wrapper. Recall
that File is defined like this:

pub struct File(Opaque<bindings::file>);

The above syntax defines a tuple struct, which means that the fields
are unnamed. The `.0` syntax accesses the first field of a tuple
struct [1].

The `.get()` method is from the `Opaque` struct, which returns a raw
pointer to the C type being wrapped.

Alice

[1]: https://doc.rust-lang.org/std/keyword.struct.html#:~:text=3DTuple%20st=
ructs%20are%20similar%20to,with%20regular%20tuples%2C%20namely%20foo.
