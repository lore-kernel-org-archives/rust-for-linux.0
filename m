Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="auvRWkHa"
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42CE013E
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 01:59:46 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3b9e1a3e3f0so3608331b6e.1
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 01:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702375185; x=1702979985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMGbv/XdWHrVqK7oSPhh0cmVjs8GCEDKwCdy5CLJlsU=;
        b=auvRWkHaXuSi9lUfLE2Ju1mbC6HAW5cO9QurxiQZWdrnh+XjdrIN+tmCiLMvtytLjV
         UQi5Ql4EirrFbH/PLI1RCZVWoKR3/z9AOafcKCbj/flM4HtFt9JI/IegDbRPHC0yJpCS
         cD9Cv95OpG+EOhggCJNmnVWwPZGZKSnlmCO4moK9Th28Wg+lMjOEJ6uo9CGQ1J/GygLb
         Yee1TuqOJHRwl9H/SZlYgP+3llwxsOJJo9NkMJlvRVIXaiI5fq1Pv03z7E4hjSjqoVGB
         GLrwkOLfUrum0yGu5VVxn3NN1P+/cUZDVTkESsqiflzcu4/5MXFsi/ETD/smcUMDq8FJ
         9aKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702375185; x=1702979985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMGbv/XdWHrVqK7oSPhh0cmVjs8GCEDKwCdy5CLJlsU=;
        b=hIV9ls4cQI5L1fNvmSQaIYvyCG0Y6Ag7nto75lS0p2fXf0jiK0NFjwrDTnIzyMF89c
         5r7UJa2v+TQbDLK+Dy2sAmjIQwOC4Ceyc/+2Bk0PzPeuilSq8CtSf1aGP65UU1/5CZ6T
         3u8atGLP5baZqL5alg7cagnx5nshMACG2EVrHqyfnCt/4msXKJbw2hmFsUNX8RXEsz3O
         XIUW+uK9qyuYJ4XHFgZdZsh4Uwa1B+lV4hs86DqEUw5BYpR7NZq3CSeG9PAGBvBbeWIB
         VFyaUJDQjMO5tnUVA8yAtdSkXN7fbncVudm6rxXU7RiMkyRWEaFUcUks2LcBdkMYxLjV
         poUA==
X-Gm-Message-State: AOJu0YzHBQ2Yo6NXb1xhWVT56Hum2vIhRIA67iJj2LHaev1XW5u3moqH
	M+hvwweqdrGwtWeEsPMilAE7SFnXjpwoTReiJq1Qng==
X-Google-Smtp-Source: AGHT+IFiBYDSREKvLHh1CmS/eZckElNLSWD8xf/QdPXW2I00WhSzxNo9IpGvT/aBr5y749jMq6osV+xRHfZNA9T+zZE=
X-Received: by 2002:a05:6808:1817:b0:3b9:f016:fb89 with SMTP id
 bh23-20020a056808181700b003b9f016fb89mr8589210oib.53.1702375183991; Tue, 12
 Dec 2023 01:59:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206-alice-file-v2-0-af617c0d9d94@google.com>
 <20231206-alice-file-v2-7-af617c0d9d94@google.com> <k_vpgbqKAKoTFzJIBCjvgxGhX73kgkcv6w9kru78lBmTjHHvXPy05g8KxAKJ-ODARBxlZUp3a5e4F9TemGqQiskkwFCpTOhzxlvy378tjHM=@proton.me>
In-Reply-To: <k_vpgbqKAKoTFzJIBCjvgxGhX73kgkcv6w9kru78lBmTjHHvXPy05g8KxAKJ-ODARBxlZUp3a5e4F9TemGqQiskkwFCpTOhzxlvy378tjHM=@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 12 Dec 2023 10:59:32 +0100
Message-ID: <CAH5fLgiQ-7gbwP2RLoVDfDqoA+nXPboBW6eTKiv45Yam_Vjv_A@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] rust: file: add abstraction for `poll_table`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Kees Cook <keescook@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 6:53=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 12/6/23 12:59, Alice Ryhl wrote:
> > diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> > index 9bcbea04dac3..eeb291cc60db 100644
> > --- a/rust/bindings/lib.rs
> > +++ b/rust/bindings/lib.rs
> > @@ -51,3 +51,4 @@ mod bindings_helper {
> >
> >  pub const GFP_KERNEL: gfp_t =3D BINDINGS_GFP_KERNEL;
> >  pub const __GFP_ZERO: gfp_t =3D BINDINGS___GFP_ZERO;
> > +pub const POLLFREE: __poll_t =3D BINDINGS_POLLFREE;
>
> You are no longer using this constant, should this still exist?

Nice catch, thanks!

> > +    fn get_qproc(&self) -> bindings::poll_queue_proc {
> > +        let ptr =3D self.0.get();
> > +        // SAFETY: The `ptr` is valid because it originates from a ref=
erence, and the `_qproc`
> > +        // field is not modified concurrently with this call since we =
have an immutable reference.
>
> This needs an invariant on `PollTable` (i.e. `self.0` is valid).

How would you phrase it?

> > +        unsafe { (*ptr)._qproc }
> > +    }
> > +
> > +    /// Register this [`PollTable`] with the provided [`PollCondVar`],=
 so that it can be notified
> > +    /// using the condition variable.
> > +    pub fn register_wait(&mut self, file: &File, cv: &PollCondVar) {
> > +        if let Some(qproc) =3D self.get_qproc() {
> > +            // SAFETY: The pointers to `self` and `file` are valid bec=
ause they are references.
>
> What about cv.wait_list...

I can add it to the list of things that are valid due to references.

> > +            //
> > +            // Before the wait list is destroyed, the destructor of `P=
ollCondVar` will clear
> > +            // everything in the wait list, so the wait list is not us=
ed after it is freed.
> > +            unsafe { qproc(file.as_ptr() as _, cv.wait_list.get(), sel=
f.0.get()) };
> > +        }
> > +    }
> > +}
> > +
> > +/// A wrapper around [`CondVar`] that makes it usable with [`PollTable=
`].
> > +///
> > +/// # Invariant
> > +///
> > +/// If `needs_synchronize_rcu` is false, then there is nothing registe=
red with `register_wait`.
>
> Not able to find `needs_synchronize_rcu` anywhere else, should this be
> here?

Sorry, this shouldn't be there. It was something I experimented with,
but gave up on.

> > +#[pinned_drop]
> > +impl PinnedDrop for PollCondVar {
> > +    fn drop(self: Pin<&mut Self>) {
> > +        // Clear anything registered using `register_wait`.
> > +        //
> > +        // SAFETY: The pointer points at a valid wait list.
>
> I was a bit confused by "wait list", since the C type is named
> `wait_queue_head`, maybe just use the type name?

I will update all instances of "wait list" to "wait_queue_head". It's
because I incorrectly remembered the C type name to be "wait_list".

Alice
