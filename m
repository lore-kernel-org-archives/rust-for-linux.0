Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755A08C0C
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Oct 2023 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="N5JiH2hU"
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF82AF;
	Fri, 27 Oct 2023 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1698398714; x=1698657914;
	bh=rAE1unuqAReK5tQe44MDBpN7xsnzUeFVP5X5ExJVFq4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=N5JiH2hUwyEGDrzeR9qkEhUVe4QwHUf7F8xhhMIPE5CA7K5mk7zOruR/fINlPJVdR
	 UhBssQ0elNJS0GBfBymd/g3J18UBf2cDLGVBHmeI4JCkFeE8zmNcbRRBVRVPWGbCuq
	 Z7aEKfvef/7WvFnLQkeYH0UawWKQbD4hV5v4U9yqD9LW0HID4hLBB6Rrf/HbQKzm+A
	 v12XXxHnaRwplwLDwdhKFuDmWZMdm8lNxfSobv2hvrYBObWqvGdRtzh8EGGaiZJhk9
	 Gl+gGhtQqNndWiaVsYJfB50ihlpJEsG+YdYOoXd+iR0v4YbzXb8Jf0uolB/WEfIlUV
	 vvAe5G3+npgqQ==
Date: Fri, 27 Oct 2023 09:25:06 +0000
To: Finn Behrens <me@kloenk.dev>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Asahi Lina <lina@asahilina.net>, Sven Van Asbroeck <thesven73@gmail.com>, Viktor Garske <viktor@v-gar.de>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: macros: improve `#[vtable]` documentation
Message-ID: <bb96556f-8112-4b49-9f94-830113003b41@proton.me>
In-Reply-To: <BB8A8468-135F-4F2E-9B3F-0BA229B3A276@kloenk.dev>
References: <20231026201855.1497680-1-benno.lossin@proton.me> <BB8A8468-135F-4F2E-9B3F-0BA229B3A276@kloenk.dev>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/27/23 10:02, Finn Behrens wrote:
>=20
>=20
> On 26 Oct 2023, at 22:19, Benno Lossin wrote:
>=20
>> Traits marked with `#[vtable]` need to provide default implementations
>> for optional functions. The C side represents these with `NULL` in the
>> vtable, so the default functions are never actually called. We do not
>> want to replicate the default behavior from C in Rust, because that is
>> not maintainable. Therefore we should use `build_error` in those default
>> implementations. The error message for that is provided at
>> `kernel::error::VTABLE_DEFAULT_ERROR`.
>>
>> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
>> ---
>> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
>> index c42105c2ff96..917a51183c23 100644
>> --- a/rust/macros/lib.rs
>> +++ b/rust/macros/lib.rs
>> @@ -87,27 +87,48 @@ pub fn module(ts: TokenStream) -> TokenStream {
>>  /// implementation could just return `Error::EINVAL`); Linux typically =
use C
>>  /// `NULL` pointers to represent these functions.
>>  ///
>> -/// This attribute is intended to close the gap. Traits can be declared=
 and
>> -/// implemented with the `#[vtable]` attribute, and a `HAS_*` associate=
d constant
>> -/// will be generated for each method in the trait, indicating if the i=
mplementor
>> -/// has overridden a method.
>> +/// This attribute closes that gap. A trait can be annotated with the `=
#[vtable]` attribute.
>> +/// Implementers of the trait will then also have to annotate the trait=
 with `#[vtable]`. This
>> +/// attribute generates a `HAS_*` associated constant bool for each met=
hod in the trait that is set
>> +/// to true if the implementer has overridden the associated method.
>> +///
>> +/// For a trait method to be optional, it must have a default implement=
ation.
>> +/// This is also the case for traits annotated with `#[vtable]`, but in=
 this
>> +/// case the default implementation will never be executed. The reason =
for this
>> +/// is that the functions will be called through function pointers inst=
alled in
>> +/// C side vtables. When an optional method is not implemented on a `#[=
vtable]`
>> +/// trait, a NULL entry is installed in the vtable. Thus the default
>> +/// implementation is never called. Since these traits are not designed=
 to be
>> +/// used on the Rust side, it should not be possible to call the defaul=
t
>> +/// implementation. This is done to ensure that we call the vtable meth=
ods
>> +/// through the C vtable, and not through the Rust vtable. Therefore, t=
he
>> +/// default implementation should call `kernel::build_error`, which pre=
vents
>> +/// calls to this function at compile time:
> In the future it would be nice to have something like `#[default]` or `#[=
optional]` to automatically derive the implementation.

I brought this up in the discussion on zulip [1]. But Wedson argued that
macros make it more magical and less easy to understand. So for the time
being, I just wanted to improve the docs.

[1]: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/top=
ic/.60bool.3A.3Athen.60.20helper/near/395659471

--=20
Cheers,
Benno

