Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="W+iiaYqv"
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DEFD59
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Nov 2023 12:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1701117442; x=1701376642;
	bh=bEl2+MCigsvPHsJO8b7l9zIaz4rEsa4Wg9BGXiHtBlU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=W+iiaYqvXbgaMweq1fXADCYbHlq/QcxtT8hjQUQK9Bj76IZbOf+NoU+i+j6vi9BoS
	 5oF24Rf3ZonYQ2pgeKYndZjKt11qH8gQ7zfPVU2Iva2FxBkub7eQcazhx7j1cBmQ/A
	 iRZB7FqfA7pkpTkjTkUtjtZcdzuOMvlI7X/0eR7CD9CoA3qwLo8SUm9ZxScoQ5vdd9
	 QVw6Zqq4kCGjLm0RhwsvuAWPSYZRjQGgvRMZmrnXI846b4JrP6zyY4fA5xbKl98gkG
	 9cyyvVu/FGgcK3RXJrl0IkBxJmkxMkGVZ0L0KRIMbOpwfo15y8S9STsDT7H21drL42
	 X6Ond0bX6dxqg==
Date: Mon, 27 Nov 2023 20:37:12 +0000
To: Boqun Feng <boqun.feng@gmail.com>, Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Matthew Wilcox <willy@infradead.org>, rust-for-linux@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v4] rust: xarray: Add an abstraction for XArray
Message-ID: <cb7b2e48-0e05-483d-a964-9f895910b494@proton.me>
In-Reply-To: <ZWTUi8mNvjszP7yw@boqun-archlinux>
References: <20231126131210.1384490-1-mcanal@igalia.com> <CAH5fLghV0jtXCJ2aetH9ZNvJ=Tu-48DCjNQMPxAWf1GW-1Mbcw@mail.gmail.com> <ZWTUi8mNvjszP7yw@boqun-archlinux>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 27.11.23 18:40, Boqun Feng wrote:
> On Mon, Nov 27, 2023 at 02:51:33PM +0100, Alice Ryhl wrote:
>> On Sun, Nov 26, 2023 at 2:13=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.=
com> wrote:
>>> +// Convenience impl for `ForeignOwnable` types whose `Borrowed`
>>> +// form implements Deref.
>>> +impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
>>> +where
>>> +    T::Borrowed<'static>: Deref,
>>> +{
>>> +    type Target =3D <T::Borrowed<'static> as Deref>::Target;
>>> +
>>> +    fn deref(&self) -> &Self::Target {
>>> +        // SAFETY: See the `borrow()` method. The dereferenced `T::Bor=
rowed` value
>>> +        // must share the same lifetime, so we can return a reference =
to it.
>>> +        unsafe { &*(T::borrow(self.0 as _).deref() as *const _) }
>>> +    }
>>> +}
>>
>> I don't think this is sound. Deref could return a reference into the
>> `T::Borrowed` itself, but it doesn't outlive this function. I would
>> either omit this impl, or provide a sub-trait for ForeignOwnable that
>=20
> Agreed. FWIW, there was some discussion around this:
>=20
> =09https://github.com/Rust-for-Linux/linux/pull/952#discussion_r109679121=
1
>=20
> now think about it, how about the following?
>=20
> =09impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
> =09where
> =09    for<'b> T::Borrowed<'b>: Into<&'b T>,
>=20
> =09{
> =09    type Target =3D T;
>=20
> =09    fn deref(&self) -> &Self::Target {
> =09=09// SAFETY: See the `borrow()` method.
> =09=09unsafe { T::borrow(self.0 as _) }.into()
> =09    }
> =09}

This one seems wrong, since `Borrowed` will be `&U` when `T =3D Box<U>`
and `&U: Into<&Box<U>>` is not satisfied. And if `T =3D Arc<U>`, then
`Borrowed =3D ArcBorrow`. If you want to take this, then you can try to
make Gary's suggestion work (from the Github discussion that Boqun posted):

     impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
     where
         T::Borrowed<'a>: Deref,
         for<'b> T::Borrowed<'b>: Into<&'b <T::Borrowed<'a> as Deref>::Targ=
et>,
     {
         type Target =3D <T::Borrowed<'a> as Deref>::Target;
    =20
         fn deref(&self) -> &Self::Target {
             self.borrow().into()
         }
     }

Also this is nicer, since there is no `unsafe` code :)

--=20
Cheers,
Benno


