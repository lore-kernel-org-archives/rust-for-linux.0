Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967DB328A5
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Oct 2023 21:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Yg1ptZ7I"
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DA8133
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Oct 2023 14:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1698269649; x=1698528849;
	bh=uiUe6WVCm0aaHbhBXNo4kkWYKw5SBau4ovvcrSad9DA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Yg1ptZ7Iu2gnfRFp2pWfcsbc7FROFS4YsR6RmgxZ2PNEyB71jVvLhP+ZgIt8dgDQ6
	 Wkd0PpRGoBIhtXEaw8saacjcjyLckAafe7bLCpYpvXSmkUZg2WwWBhggxckLuC0jX6
	 EugVoKUPe9Jfe/wp1BMqrYYobDUPRJdc2jazg7WbY7VwszxWMmAtIvZTH+l0GCKKv0
	 4QpnPyQOjeTr9CLWNBACO0sE/PfpLuPf87DI1RTGI/BiS9S4jA++5lsu3Cxq7K+L/g
	 8KzQHFk08/PFcGf8BXtX9MgUnYpBlaus8jPZBnt8zbO6uLaHyo2jAX1ULInJHjSsA8
	 W30LQWeP2ztAA==
Date: Wed, 25 Oct 2023 21:34:02 +0000
To: Gary Guo <gary@garyguo.net>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: macros: improve `#[vtable]` documentation
Message-ID: <e3a2ff70-3d10-4c0f-a9f7-5dd07a198f8c@proton.me>
In-Reply-To: <20231025201445.497f6ef4.gary@garyguo.net>
References: <20231019171540.259173-1-benno.lossin@proton.me> <20231024122423.383ea1bb@eugeo> <5c8b516d-323e-4a0b-8b8a-c0f0aec38b06@proton.me> <20231025201445.497f6ef4.gary@garyguo.net>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 25.10.23 21:14, Gary Guo wrote:
> On Tue, 24 Oct 2023 14:43:30 +0000
> Benno Lossin <benno.lossin@proton.me> wrote:
>=20
>> On 24.10.23 13:24, Gary Guo wrote:
>>> On Thu, 19 Oct 2023 17:15:53 +0000
>>> Benno Lossin <benno.lossin@proton.me> wrote:
>>
>> [...]
>>
>>>> -/// This attribute is intended to close the gap. Traits can be declar=
ed and
>>>> -/// implemented with the `#[vtable]` attribute, and a `HAS_*` associa=
ted constant
>>>> -/// will be generated for each method in the trait, indicating if the=
 implementor
>>>> -/// has overridden a method.
>>>> +/// This attribute closes that gap. A trait can be annotated with the=
 `#[vtable]` attribute.
>>>> +/// Implementers of the trait will then also have to annotate the tra=
it with `#[vtable]`. This
>>>> +/// attribute generates a `HAS_*` associated constant bool for each m=
ethod in the trait that is set
>>>> +/// to true if the implementer has overridden the associated method.
>>>> +///
>>>> +/// For a function to be optional, it must have a default implementat=
ion. But this default
>>>> +/// implementation will never be executed, since these functions are =
exclusively called from
>>>> +/// callbacks from the C side. This is because the vtable will have a=
 `NULL` entry and the C side
>>>> +/// will execute the default behavior. Since it is not maintainable t=
o replicate the default
>>>> +/// behavior in Rust, the default implementation should be:
>>>> +///
>>>> +/// ```compile_fail
>>>> +/// # use kernel::error::VTABLE_DEFAULT_ERROR;
>>>> +/// kernel::build_error(VTABLE_DEFAULT_ERROR)
>>>
>>> Note that `build_error` function is considered impl detail and is
>>> hidden.
>>
>> I see, we should mention that in the docs on `build_error`.
>=20
> Well, it's marked as `#[doc(hidden)]`...

Yes, but I did not even build the docs, but read it directly
inside of the `build_error` crate and thus I did not see the
`#[doc(hidden)]`.

>>> This should use the macro version instead:
>>>
>>> kernel::build_error!(VTABLE_DEFAULT_ERROR)
>>
>> Is there a reason that it is a macro? Why is it re-exported in the
>> kernel crate? The macro could just use `::bulid_error::build_error()`.
>=20
> The original intention is to allow format strings, but Rust const
> panic is not powerful enough to support it at the moment. Macro
> allows higher flexibility.

That is what I thought. But should we then not always require a
string literal? So

     kernel::build_error!("{}", VTABLE_DEFAULT_ERROR)

> It's re-exported so the macro can reference them (note that downstream
> crates can't reference build_error directly). Perhaps I should put it
> inside __private_reexport or something instead.

I see, I did not know that they cannot reference build error directly.
Is that some limitation of the build system? If it is possible to not
re-export it, I think that would be better, otherwise just put it in
`__private`.

--=20
Cheers,
Benno


