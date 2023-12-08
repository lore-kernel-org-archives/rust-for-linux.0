Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mE9EkolL"
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72ED01996;
	Fri,  8 Dec 2023 09:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=qfmys4whkrbxhizugrkv3fumau.protonmail; t=1702058001; x=1702317201;
	bh=hVJsuEvFyRzSwsIFDjR8bBfXvfqQalvBoy1pmXp64qw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mE9EkolL56rnQaDX118ZC8Qv3X5TZeYrKUwaDSEIQn+WhbP1IxA31PBFYX1w4PEfm
	 tbDUzGQDgCFongIl664Rpjt0Q6D4+Ta/SBJvda/xqssrHxUAN/jDW+M0rZ26/jZ7bF
	 hndgRizrrT3D+EtySJ7XnPTGMg1V4oE9UN6NpZai6CunjP+grH/LbKkJTx9or3kn/u
	 7Y7h499dZSav1SYvkjLVnEWc7pPhiT0gxp7UgDLVBq3paoIX/LqcVWwVN/TqHRmJOF
	 h6esC13pxSSp19Splgu14PaV0+GojhlmckFGZ9EGMD53F1Wblwgy4oTz1b5PPNmmgL
	 L+R1EmlgGTGvA==
Date: Fri, 08 Dec 2023 17:53:08 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, Kees Cook <keescook@chromium.org>, Matthew Wilcox <willy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] rust: file: add abstraction for `poll_table`
Message-ID: <k_vpgbqKAKoTFzJIBCjvgxGhX73kgkcv6w9kru78lBmTjHHvXPy05g8KxAKJ-ODARBxlZUp3a5e4F9TemGqQiskkwFCpTOhzxlvy378tjHM=@proton.me>
In-Reply-To: <20231206-alice-file-v2-7-af617c0d9d94@google.com>
References: <20231206-alice-file-v2-0-af617c0d9d94@google.com> <20231206-alice-file-v2-7-af617c0d9d94@google.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/6/23 12:59, Alice Ryhl wrote:
> diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> index 9bcbea04dac3..eeb291cc60db 100644
> --- a/rust/bindings/lib.rs
> +++ b/rust/bindings/lib.rs
> @@ -51,3 +51,4 @@ mod bindings_helper {
>=20
>  pub const GFP_KERNEL: gfp_t =3D BINDINGS_GFP_KERNEL;
>  pub const __GFP_ZERO: gfp_t =3D BINDINGS___GFP_ZERO;
> +pub const POLLFREE: __poll_t =3D BINDINGS_POLLFREE;

You are no longer using this constant, should this still exist?

[...]

> +    fn get_qproc(&self) -> bindings::poll_queue_proc {
> +        let ptr =3D self.0.get();
> +        // SAFETY: The `ptr` is valid because it originates from a refer=
ence, and the `_qproc`
> +        // field is not modified concurrently with this call since we ha=
ve an immutable reference.

This needs an invariant on `PollTable` (i.e. `self.0` is valid).

> +        unsafe { (*ptr)._qproc }
> +    }
> +
> +    /// Register this [`PollTable`] with the provided [`PollCondVar`], s=
o that it can be notified
> +    /// using the condition variable.
> +    pub fn register_wait(&mut self, file: &File, cv: &PollCondVar) {
> +        if let Some(qproc) =3D self.get_qproc() {
> +            // SAFETY: The pointers to `self` and `file` are valid becau=
se they are references.

What about cv.wait_list...

> +            //
> +            // Before the wait list is destroyed, the destructor of `Pol=
lCondVar` will clear
> +            // everything in the wait list, so the wait list is not used=
 after it is freed.
> +            unsafe { qproc(file.as_ptr() as _, cv.wait_list.get(), self.=
0.get()) };
> +        }
> +    }
> +}
> +
> +/// A wrapper around [`CondVar`] that makes it usable with [`PollTable`]=
.
> +///
> +/// # Invariant
> +///
> +/// If `needs_synchronize_rcu` is false, then there is nothing registere=
d with `register_wait`.

Not able to find `needs_synchronize_rcu` anywhere else, should this be
here?

> +///
> +/// [`CondVar`]: crate::sync::CondVar
> +#[pin_data(PinnedDrop)]
> +pub struct PollCondVar {
> +    #[pin]
> +    inner: CondVar,
> +}

[..]

> +#[pinned_drop]
> +impl PinnedDrop for PollCondVar {
> +    fn drop(self: Pin<&mut Self>) {
> +        // Clear anything registered using `register_wait`.
> +        //
> +        // SAFETY: The pointer points at a valid wait list.

I was a bit confused by "wait list", since the C type is named
`wait_queue_head`, maybe just use the type name?

--=20
Cheers,
Benno

> +        unsafe { bindings::__wake_up_pollfree(self.inner.wait_list.get()=
) };
> +
> +        // Wait for epoll items to be properly removed.
> +        //
> +        // SAFETY: Just an FFI call.
> +        unsafe { bindings::synchronize_rcu() };
> +    }
> +}
