Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9821170A
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 21:04:05 +0000 (UTC)
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD5010F;
	Mon, 25 Sep 2023 14:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1695675840; x=1695935040;
	bh=EUihDlu4xMCW4pJXMQT++Wi78DVs4G1Y5sE4xVXS7LI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CRf33zD4C8pjNv/GD/F85p0HUQw3v8OTbTEU2ZF+jvfUOqycYXwfLtBYCfUhjsx/t
	 Ope6Pc881DenM1TOSpCxO3DsOe8vWXuBTx6itY0H2NK2G87xCAu2aTb7vTwnmbL35W
	 6z6CeoA5qwIBewfSTSgA6QjRVbSmcfLotvTUeNcZZBT3VqgqTvdPlIXv9tkIvSc3JX
	 DHq6JRsrUTayn0/nto3uhKAD/4UX2ZHFAsysERo/lkqHIGY9v4JNy/c2wn4NXU/5YX
	 fatZfNnSHRtr472RziosIsSQBnZZS2pVUHYO7zzAmK97VQgOHHOIlPUuumBK+tz8sX
	 zttnQSU55HqZw==
Date: Mon, 25 Sep 2023 21:03:52 +0000
To: Boqun Feng <boqun.feng@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Alice Ryhl <aliceryhl@google.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [PATCH v2 2/2] rust: arc: remove `ArcBorrow` in favour of `WithRef`
Message-ID: <c5134a1a-a60d-73bb-9faa-aa1dfc3bc30d@proton.me>
In-Reply-To: <ZRHWqbvYlXBXEOh-@boqun-archlinux>
References: <20230923144938.219517-1-wedsonaf@gmail.com> <20230923144938.219517-3-wedsonaf@gmail.com> <CAH5fLggxsewmtzXjehbawDCTHO0C7kteU_CLnh80eMNj=QyP9Q@mail.gmail.com> <969eab7f-ad40-0dfb-18b9-6002fc54e12b@proton.me> <ZRGd4lsNP30L2yB3@Boquns-Mac-mini.home> <14513589-cc31-8985-8ff6-a97d2882f593@proton.me> <ZRGyRQuBcWvgtdNR@Boquns-Mac-mini.home> <9d6d6c94-5da6-a56d-4e85-fbf8da26a0b0@proton.me> <ZRHWqbvYlXBXEOh-@boqun-archlinux>
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 25.09.23 20:51, Boqun Feng wrote:
> On Mon, Sep 25, 2023 at 05:00:45PM +0000, Benno Lossin wrote:
>> On 25.09.23 18:16, Boqun Feng wrote:
>>> On Mon, Sep 25, 2023 at 03:07:44PM +0000, Benno Lossin wrote:
>>>> ```rust
>>>> struct MutatingDrop {
>>>>        value: i32,
>>>> }
>>>>
>>>> impl Drop for MutatingDrop {
>>>>        fn drop(&mut self) {
>>>>            self.value =3D 0;
>>>>        }
>>>> }
>>>>
>>>> let arc =3D Arc::new(MutatingDrop { value: 42 });
>>>> let wr =3D arc.as_with_ref(); // this creates a shared `&` reference t=
o the MutatingDrop
>>>> let arc2: Arc<MutatingDrop> =3D wr.into(); // increments the reference=
 count to 2
>>>
>>> More precisely, here we did a
>>>
>>> =09&WithRef<_> -> NonNull<WithRef<_>>
>>>
>>> conversion, and later on, we may use the `NonNull<WithRef<_>>` in
>>> `drop` to get a `Box<WithRef<_>>`.
>>
>> Indeed.
>>
>=20
> Can we workaround this issue by (ab)using the `UnsafeCell` inside
> `WithRef<T>`?
>=20
> impl<T: ?Sized> From<&WithRef<T>> for Arc<T> {
>      fn from(b: &WithRef<T>) -> Self {
>          // SAFETY: The existence of the references proves that
> =09// `b.refcount.get()` is a valid pointer to `WithRef<T>`.
> =09let ptr =3D unsafe { NonNull::new_unchecked(b.refcount.get().cast::<Wi=
thRef<T>>()) };
>=20
> =09// SAFETY: see the SAFETY above `let ptr =3D ..` line.
>          ManuallyDrop::new(unsafe { Arc::from_inner(ptr) })
>              .deref()
>              .clone()
>      }
> }
>=20
> This way, the raw pointer in the new Arc no longer derives from the
> reference of `WithRef<T>`.

No, the code above only obtains a pointer that has provenance valid
for a `bindings::refcount_t` (or type with the same layout, such as
`Opaque<bindings::refcount_t>`). But not the whole `WithRef<T>`, so accessi=
ng
it by reading/writing will still be UB.

--=20
Cheers,
Benno


