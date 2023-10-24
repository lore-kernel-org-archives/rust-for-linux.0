Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3BF30D17
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Oct 2023 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="SvCIcY9x"
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2368BB3;
	Tue, 24 Oct 2023 07:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1698158621; x=1698417821;
	bh=upzx+nk01+m+EwuBULbIelOm8X3Ott5WP7auABbMUKk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SvCIcY9xGbgUACmraTDg3j1NS0aPmYeOjwq4uFNxdblqw4mAzNJX1KY421GbExel/
	 sPz8P2dpXLIpxLxfQUQ4i94iwiIu30aek9frBJnkBtK82PZPhUsfEq7eLv/2Fuf2j6
	 VznNSGa+d0CIHClFKkcYOfH08b1DledRUNtpWKF3FHO8G0KE/A2mnTbIhmHEWKohUc
	 5A6JV7tBJ1mYg2iOlcYM8e06vqw0MNCqUDOSSJdDhoSZ4NW9HfHD7V/fR6YPOWrYLr
	 4d5oIZSkSs9+d8pDsQ1Z+DVv+mTym5QwEhIl2IIOKmwsn+nq8mtp2GX0QEnQ5Zou5c
	 o+1zUfFYhUBBg==
Date: Tue, 24 Oct 2023 14:43:30 +0000
To: Gary Guo <gary@garyguo.net>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: macros: improve `#[vtable]` documentation
Message-ID: <5c8b516d-323e-4a0b-8b8a-c0f0aec38b06@proton.me>
In-Reply-To: <20231024122423.383ea1bb@eugeo>
References: <20231019171540.259173-1-benno.lossin@proton.me> <20231024122423.383ea1bb@eugeo>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 24.10.23 13:24, Gary Guo wrote:
> On Thu, 19 Oct 2023 17:15:53 +0000
> Benno Lossin <benno.lossin@proton.me> wrote:

[...]

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
>> +/// For a function to be optional, it must have a default implementatio=
n. But this default
>> +/// implementation will never be executed, since these functions are ex=
clusively called from
>> +/// callbacks from the C side. This is because the vtable will have a `=
NULL` entry and the C side
>> +/// will execute the default behavior. Since it is not maintainable to =
replicate the default
>> +/// behavior in Rust, the default implementation should be:
>> +///
>> +/// ```compile_fail
>> +/// # use kernel::error::VTABLE_DEFAULT_ERROR;
>> +/// kernel::build_error(VTABLE_DEFAULT_ERROR)
>=20
> Note that `build_error` function is considered impl detail and is
> hidden.

I see, we should mention that in the docs on `build_error`.

> This should use the macro version instead:
>=20
> kernel::build_error!(VTABLE_DEFAULT_ERROR)

Is there a reason that it is a macro? Why is it re-exported in the
kernel crate? The macro could just use `::bulid_error::build_error()`.

> Actually, the string here provides little use other than documentation,

Sure, but that is the whole purpose of this patch.

> since the string provided to build_error is only visible in const eval,
> so this you might just omit that and write
>=20
> kernel::build_error!()

Note that it is also useful for people who read the code, as they
can search for the constant and understand why it is a build error.

--=20
Cheers,
Benno


