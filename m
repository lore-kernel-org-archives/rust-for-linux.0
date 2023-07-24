Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A9E8BF7
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Jul 2023 14:16:59 +0000 (UTC)
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26251E61
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Jul 2023 07:16:58 -0700 (PDT)
Date: Mon, 24 Jul 2023 14:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1690208215; x=1690467415;
	bh=NxQkeiGUJkLsPhFfW+t8vWr8Nn7VnQ4z0FkWxORqDSE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hj7lIPk3uPIFoQLMCfSCIt1Q5BE81hMnWGxfey5mTtU3UKfNv3kT7rgsP3sv6tI3e
	 WhlUe6LsQggPollBzszbX+p3oFPDNMxWeHiRhaNKnRdj8MMcCMaeQvmxdIb2dGIvFc
	 osnYxjBlgAO8Cn9Uut+czYBq4Jeh5P2HYoOsp4qDRVbhTsoWw9JuXAqgjZKi0PnPlj
	 fWNHudsoWMXH+efbSQBHaJbY+FYgJOJTStGELXJeUb5vPVbQgDeIbkCOp+i2wdACl1
	 c6pHFHSOfZCqySrdsojsl4patNoKlVGq4J1NL0BpGM1foTWtBSl3LnBeeE1MJJeka+
	 0NOpDyx2v5ZHg==
To: Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: alex.gaynor@gmail.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org, nmi@metaspace.dk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Subject: Re: [PATCH v2 09/12] rust: init: implement Zeroable for Opaque<T>
Message-ID: <16fb9977-2efc-2412-e906-3d320e37c45c@proton.me>
In-Reply-To: <20230720133434.3546048-1-aliceryhl@google.com>
References: <20230719141918.543938-10-benno.lossin@proton.me> <20230720133434.3546048-1-aliceryhl@google.com>
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

On 20.07.23 15:34, Alice Ryhl wrote:
> Benno Lossin <benno.lossin@proton.me> writes:
>> Since `Opaque<T>` contains a `MaybeUninit<T>`, all bytes zero is a valid
>> bit pattern for that type.
>>
>> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
>> ---
>>   ///
>>   /// This is meant to be used with FFI objects that are never interpret=
ed by Rust code.
>>   #[repr(transparent)]
>> +#[derive(Zeroable)]
>>   pub struct Opaque<T> {
>>       value: UnsafeCell<MaybeUninit<T>>,
>>       _pin: PhantomPinned,
>>   }
>=20
> Does this actually work? I don't think we implement Zeroable for
> UnsafeCell.

Good catch, this does compile, but only because the current
implementation of the derive expands to (modulo correct paths):
```
impl<T> Zeroable for Opaque<T>
where
     UnsafeCell<MaybeUninit<T>>: Zeroable,
     PhantomPinned: Zeroable,
{}
```
This implementation is of course useless, since `UnsafeCell` is never
`Zeroable` at the moment. We could of course implement that and then this
should work, but the question is if this is actually the desired output in
general. I thought before that this would be a good idea, but I forgot that
if the bounds are never satisfied it would silently compile.

Do you think that we should have this expanded output instead?
```
impl<T: Zeroable> Zeroable for Foo<T> {}
const _: () =3D {
     fn assert_zeroable<T: Zeroable>() {}
     fn ensure_zeroable<T: Zeroable>() {
         assert_zeroable::<Field1>();
         assert_zeroable::<Field2>();
     }
};
```
If the input was
```
#[derive(Zeroable)]
struct Foo<T> {
     field1: Field1,
     field2: Field2,
}
```

> I suggest you instead add Opaque to the `impl_zeroable!` macro in
> `rust/kernel/init.rs`.

We would have to do this when using the alternative approach from
above, since we do not want the `Zeroable` bound on `T` for `Opaque`.
I wanted to avoid the `SAFETY` comment, since that is needed for the
`impl_zeroable` macro (as it has an unsafe block inside).

--=20
Cheers,
Benno


