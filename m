Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6097E1CA86
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Nov 2023 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="XFIBMvdw"
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9E3111
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Nov 2023 09:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1699029059; x=1699288259;
	bh=ViFEkYUFoXULRyDJ1aSReLeNM1tEO6xO+D2YwVm/tH0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XFIBMvdw7yJ6d9eEzBJE4Ty9VrpIIbCMSCmzco+5qmob7ZqyBZPqwCSvS9rxSIKxw
	 uiWFoKtIA9zqhcxyEIoPfB+VqZb0R1+XEUjI00Gauu0LDVfvVau23Ial/ZmzpAY9wn
	 WVoKfnjV4jNKVurI9lwIG0TIoORCYp9Tcrt7jaYgl38RWVoRFg80CyoXZvoGhZPskI
	 3Qyw9OfQ7GVY9zWJ903DPD1EB3MKq+lv4wybYxdc+6tJeDN3tf0pNE5K1QdWrD7+Kh
	 TfBSDA0CnsBz9N8Co6ADH20z/K22pN+zn8IZe22w506HMchS4xWAYV1BUeQvLa7by7
	 RRTZ7JOWg1PlQ==
Date: Fri, 03 Nov 2023 16:30:54 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Matt Gilbride <mattgilbride@google.com>, Jeffrey Vander Stoep <jeffv@google.com>, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH RFC 02/20] rust_binder: add binderfs support to Rust binder
Message-ID: <sRVdoCqLbxM1-EH0iKVlb9eOEU-wt410-WT5rFTQNNYgmiW6EEpKvCCJyVppOmFYhXBcCN3SsXUXULzpmmweYBGDVHW619pjsIZvorv8Fc8=@proton.me>
In-Reply-To: <20231101-rust-binder-v1-2-08ba9197f637@google.com>
References: <20231101-rust-binder-v1-0-08ba9197f637@google.com> <20231101-rust-binder-v1-2-08ba9197f637@google.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01.11.23 19:01, Alice Ryhl wrote:
> +/// There is one context per binder file (/dev/binder, /dev/hwbinder, et=
c)
> +#[pin_data]
> +pub(crate) struct Context {
> +    #[pin]
> +    manager: Mutex<Manager>,
> +    pub(crate) name: CString,
> +    #[pin]
> +    links: ListLinks,
> +}
> +
> +kernel::list::impl_has_list_links! {
> +    impl HasListLinks<0> for Context { self.links }
> +}
> +kernel::list::impl_list_arc_safe! {
> +    impl ListArcSafe<0> for Context { untracked; }
> +}
> +kernel::list::impl_list_item! {
> +    impl ListItem<0> for Context {
> +        using ListLinks;
> +    }
> +}

I think at some point it would be worth introducing a derive macro that
does this for us. So for example:

    #[pin_data]
    #[derive(HasListLinks)]
    pub(crate) struct Context {
        #[pin]
        manager: Mutex<Manager>,
        pub(crate) name: CString,
        #[pin]
        #[links]
        links: ListLinks,
    }

And if you need multiple links you could do:

    #[pin_data]
    #[derive(HasListLinks)]
    struct Foo {
        #[links =3D 0]
        a_list: ListLinks,
        #[links =3D 1]
        b_list: ListLinks,
    }

Same for `ListItem` and `HasWork`. I have not yet taken a look at your
linked list implementation, so I don't know if this is possible (since
`ListItem` seems to have multiple "backends").

I think this improvement can wait though, just wanted to mention it.

--=20
Cheers,
Benno

