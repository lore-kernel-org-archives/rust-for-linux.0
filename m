Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DB0156F7
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Oct 2023 09:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="IL+7giNU"
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EC8CC
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Oct 2023 02:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1698399144; x=1698658344;
	bh=qX0sYQ68NldqQzH0zn7TigorKLiFCKmIhJbiP6fSiqI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IL+7giNUcJyqpQUi2c2jyzZTSiUh18R83I751zNBpFaBvZK0UOYMQdvjSCEbbvCq8
	 iWNtNmjTTHPAot/8NL1ZmWZRHW9p22nfl9Zz5HM60Unzs0GFMhkvt/cRGHyiqLeM9E
	 0d+ySgq8T1PdZ3cch52qpUJsq6o4S181eOIIkMYO29hFaOdM/Zqir5Pnpull9Ca5QK
	 Dzt99S1ewo+UVrgOl0neWh+f4zN6tmRsOpZ06gudneKIU+JbV3fSAz+aWKa6ucKBpg
	 rswgWAhIh6zls1CcROfLWWE0t1m8SkuZZKa86Lge/raK1tNSX5l8/XjGbphSLXBWvB
	 2i8PJymaG8aWg==
Date: Fri, 27 Oct 2023 09:32:19 +0000
To: "Ariel Miculas (amiculas)" <amiculas@cisco.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Asahi Lina <lina@asahilina.net>, Sven Van Asbroeck <thesven73@gmail.com>, Viktor Garske <viktor@v-gar.de>, Finn Behrens <me@kloenk.dev>, "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] rust: macros: improve `#[vtable]` documentation
Message-ID: <f5526059-66b1-4e28-aae2-b1cc1532ade0@proton.me>
In-Reply-To: <au3adook2dsnveqlz3i7inmbzx7b5sel7qg2cn7efcacicthiy@fm5io4kam3s2>
References: <20231026201855.1497680-1-benno.lossin@proton.me> <au3adook2dsnveqlz3i7inmbzx7b5sel7qg2cn7efcacicthiy@fm5io4kam3s2>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/26/23 23:12, Ariel Miculas (amiculas) wrote:
> On 23/10/26 08:19PM, Benno Lossin wrote:
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
>> v2 -> v3:
>> - don't hide the import of the constant in the example
>> - fixed "function" typo
>> - improve paragraph about optional functions
>> - do not remove the `Send + Sync + Sized` bounds on the example
>>
>> v1 -> v2:
>> - removed imperative mode in the paragraph describing optional
>>   functions.
>>
>>  rust/kernel/error.rs |  4 ++++
>>  rust/macros/lib.rs   | 37 ++++++++++++++++++++++++++++++-------
>>  2 files changed, 34 insertions(+), 7 deletions(-)
>>
>> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
>> index 05fcab6abfe6..1373cde025ef 100644
>> --- a/rust/kernel/error.rs
>> +++ b/rust/kernel/error.rs
>> @@ -335,3 +335,7 @@ pub(crate) fn from_result<T, F>(f: F) -> T
>>          Err(e) =3D> T::from(e.to_errno() as i16),
>>      }
>>  }
>> +
>> +/// Error message for calling a default function of a [`#[vtable]`](mac=
ros::vtable) trait.
>> +pub const VTABLE_DEFAULT_ERROR: &str =3D
>> +    "This function must not be called, see the #[vtable] documentation.=
";
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
>=20
> The above paragraph seems to be wrapped at 100 characters while the
> paragraph below seems to be wrapped at 80 characters.

Oh I forgot about that. Miguel, would it be reasonable for you to fix
this when picking the patch?

--=20
Cheers,
Benno

