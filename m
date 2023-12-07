Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="d7NOwXYm"
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD57F122
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Dec 2023 11:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1701975943; x=1702235143;
	bh=IkOayq4AmnCE0A70biSm+aLT0ynnAz2i7rr3yCvl0HI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=d7NOwXYmnBv7EqFy7l4TTdAMcRwN2h3aghILXRMLRkOT43nExw+dmueqCRl685GO4
	 oFkXoYqff8K7zmilPGL16Glyn466Ph7caWAWWbSPjyQadY9KRMk5AWI6yRDAek2KAh
	 mka83IN0vtqj8v/1gyJDl7S8OMwBzz3YTrdVph/ljlMXgcZe5sWfWtBqK0yVWLS+oU
	 r8rL9ICXZ013dxxV8RboX/8Apn9pTncx3EjQCImv0Vgzw5qggUeHvOWkco9KzVJ9wV
	 uGxsuTY08ngUat0etlKPtEJNKLT1rbPb1V3XykQSGhux8+aTDFEpK8sbSuxgdo5eeX
	 TRlBnGIgq/QPg==
Date: Thu, 07 Dec 2023 19:05:31 +0000
To: Andreas Hindborg <a.hindborg@samsung.com>, =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Matthew Wilcox <willy@infradead.org>, "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Subject: Re: [PATCH v5] rust: xarray: Add an abstraction for XArray
Message-ID: <fbb39b45-25d2-4ed6-a826-ded2aac56010@proton.me>
In-Reply-To: <87cyvjjuak.fsf@samsung.com>
References: <20231201195300.1329092-1-mcanal@igalia.com> <CGME20231206141047eucas1p1b6c2b022717a6b3a2e24e37b6a6d5d23@eucas1p1.samsung.com> <87cyvjjuak.fsf@samsung.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/6/23 15:10, Andreas Hindborg wrote:
> Ma=C3=ADra Canal <mcanal@igalia.com> writes:
>> +    /// Borrow the underlying value wrapped by the `Guard`.
>> +    ///
>> +    /// Returns a `T::Borrowed` type for the owned `ForeignOwnable` typ=
e.
>> +    pub fn borrow(&self) -> T::Borrowed<'_> {
>> +        // SAFETY: The value is owned by the `XArray`, the lifetime it =
is borrowed for must not
>> +        // outlive the `XArray` itself, nor the Guard that holds the lo=
ck ensuring the value
>> +        // remains in the `XArray`.
>> +        unsafe { T::borrow(self.0.as_ptr() as _) }
>=20
> I think specifying the target type of the cast here is preferable. Then
> the code will not break silently if something should change.

I agree.

[...]

>> +    /// Replaces an entry with a new value, returning the old value (if=
 any).
>> +    pub fn replace(self: Pin<&Self>, index: usize, value: T) -> Result<=
Option<T>> {
>> +        let new =3D value.into_foreign();
>> +        // SAFETY: `new` just came from into_foreign(), and we dismiss =
this guard if
>> +        // the xa_store operation succeeds and takes ownership of the p=
ointer.
>> +        let guard =3D ScopeGuard::new(|| unsafe {
>> +            T::from_foreign(new);
>> +        });
>> +
>> +        // SAFETY: `self.xa` is always valid by the type invariant, and=
 we are storing
>> +        // a `T::into_foreign()` result which upholds the later invaria=
nts.
>=20
> T has to be 4-byte aligned according to xarray docs. All types that we
> implement `ForeignOwnable` for is aligned such, because
> `KernelAllocator` is producing allocations of alignment
> `ARCH_SLAB_MINALIGN`, which is `__alignof__(unsigned long long)`. But it
> should probably be in a safety requirement somewhere. Perhaps on
> `ForeignOwnable` and then make that an unsafe trait?

I am not sure if we want to enforce that for every `ForeignOwnable`
type, could there be anything that wants to implement `ForeignOwnable`
that does not have that alignment?

If we do not want to tag it onto `ForeignOwnable`, we should put this
not only in some safety requirement, but also just check it at compile
time. You can do this using:

    build_assert!(mem::align_of::<T>() <=3D 4);

At some point Rust might have an `Aligned` trait [1] and then we could
use that.

[1]: https://github.com/rust-lang/rfcs/pull/3319

[...]

>> +// SAFETY: XArray is thread-safe and all mutation operations are intern=
ally locked.
>> +unsafe impl<T: Send + ForeignOwnable> Send for XArray<T> {}
>> +unsafe impl<T: Sync + ForeignOwnable> Sync for XArray<T> {}
>=20
> Do we actually need to specify `ForeignOwnable` here?

Yes, this is needed, since `XArray<T>` is declared with
`T: ForeignOwnable`, since that is needed for dropping an `XArray<T>`.

--=20
Cheers,
Benno

