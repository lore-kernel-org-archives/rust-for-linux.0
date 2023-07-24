Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D160C847B
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Jul 2023 14:09:16 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA3D19B7
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Jul 2023 07:08:56 -0700 (PDT)
Date: Mon, 24 Jul 2023 14:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1690207733; x=1690466933;
	bh=XXVZV7WpwLqPGV9+1SqbGHmQOm+9jzkRBGlCOUg3R8M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ky0TBB4HkU3B8mnsIO5FuBQiZv+iALHhGlhLZwZ2YxUHsDyJjbaPVbmCSVpeXfl68
	 2BBTdhhD/mLt+JIEArag4Xs1B23K2Omu9CPEjA6x/bzWitViBu9LB1bnA5L/PNjS7P
	 +gkRq6HMNV3YaiFVSKn0JJSTdnmdghyPwzNyNvJoBwJzjn2rEWIpsUg4ktYY7543qS
	 /wBQzwxg7FQgYVDkAoiiXoqabIkwb2nyrUVCqJStvrt3rfzPyjxmfFG7E5iZTtroJG
	 SN+5xXNID+k2W+SztqDFqRn5UWrdtQo2p/kUEUROS7CHJcnUVIaJRjQIk9IzYBxOmk
	 U4ekxrKfM5+Fg==
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v2 11/12] rust: init: add `{pin_}chain` functions to `{Pin}Init<T, E>`
Message-ID: <5f22b25d-132d-7cbc-8bca-8333516c1663@proton.me>
In-Reply-To: <0b818707-4762-c12d-8624-7d3c4f6841da@gmail.com>
References: <20230719141918.543938-1-benno.lossin@proton.me> <20230719141918.543938-12-benno.lossin@proton.me> <0b818707-4762-c12d-8624-7d3c4f6841da@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 21.07.23 02:23, Martin Rodriguez Reboredo wrote:
> On 7/19/23 11:21, Benno Lossin wrote:
>> +/// An initializer returned by [`PinInit::pin_chain`].
>> +pub struct ChainPinInit<I, F, T: ?Sized, E>(I, F, __internal::Invariant=
<(E, Box<T>)>);
>> +
>> +// SAFETY: the `__pinned_init` function is implemented such that it
>> +// - returns `Ok(())` on successful initialization,
>> +// - returns `Err(err)` on error and in this case `slot` will be droppe=
d.
>> +// - considers `slot` pinned.
>> +unsafe impl<T: ?Sized, E, I, F> PinInit<T, E> for ChainPinInit<I, F, T,=
 E>
>> +where
>> +    I: PinInit<T, E>,
>> +    F: FnOnce(Pin<&mut T>) -> Result<(), E>,
>> +{
>> +    unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
>> +        // SAFETY: all requirements fulfilled since this function is `_=
_pinned_init`.
>> +        unsafe { self.0.__pinned_init(slot)? };
>> +        // SAFETY: The above call initialized `slot` and we still have =
unique access.
>> +        let val =3D unsafe { &mut *slot };
>> +        // SAFETY: `slot` is considered pinned
>> +        let val =3D unsafe { Pin::new_unchecked(val) };
>> +        (self.1)(val).map_err(|e| {
>> +            // SAFETY: `slot` was initialized above.
>> +            unsafe { core::ptr::drop_in_place(slot) };
>> +            e
>=20
> I might stumble upon an error like EAGAIN if I call `pin_chain` but that
> means `slot` will be dropped. So my recommendation is to either not drop
> the value or detail in `pin_chain`'s doc comment that the closure will
> drop on error.

This is a bit confusing to me, because dropping the value on returning `Err=
`
is a safety requirement of `PinInit`. Could you elaborate why this is
surprising? I can of course add it to the documentation, but I do not see
how it could be implemented differently. Since if you do not drop the value
here, nobody would know that it is still initialized.

--=20
Cheers,
Benno


