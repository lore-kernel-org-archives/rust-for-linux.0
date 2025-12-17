Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A9D2957C2;
	Wed, 17 Dec 2025 19:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765998931; cv=pass; b=EzRd8Pfv3vU0IAatITBPIXEPGuzv+RP45BOXa7axkyf2VpdCsx2ZGhBp0de6mOPPVP8a6ULNStXCc8SmBzq7HAUcCHHiQ1fkcyLFWddoHB+7/VoAyJqTQ4OHTTiOTGQzWV1OBXORblOyalrRqGDZNPcAdRyCCm3C5HwMjRxfAp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765998931; c=relaxed/simple;
	bh=YXOA0iW/I5OFXhiGfDDDNSk3299ATAj/G0MpoY8VmZI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=udyRNnPP0rz53RxM1WH6tnn7TZHH1xliHzJz98+mbr8CFK5e4b9iPwEhlhg/+t7NUwZRMlCye/RvVBtKpsVawABORdI1WJD50HgO8A23fmro6Jni41fEKDu+ygQ7O5qF/LPS9v4S+EZ+5Nx8jhvavDRi4ZeY+xwQVYwP48+8ojo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=k6mN1b7/; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="k6mN1b7/"
ARC-Seal: i=1; a=rsa-sha256; t=1765998914; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=APOGkIZ1VSqdkTsEQsheP5+UeX4wsrNrJYOtJ3MwWdUVVaLyHWsphV2pouVUCA3VObkI2LLJmcM0dy7Nnn7CxK8fLyqtqyX/Bce7ORt4zBBC2kEQqI5np5UeJOYIloE3q47GoaHBBqQ4JLOx6GsicQ9r18QslKlVXEUQ8I/cSeo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765998914; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cr9XKe+pwJfXI32GGNHAjwqrluc6D+drfpq6NT56k4Q=; 
	b=Lgne1VPgGYEs8L4BPYygJrQecXM97t0Q5CxZsGLf5tPa6BAeDYOZQaNEhvw8b5f85f7m44QHhiNsxAmaJe15SMOW8nbdcCU+ZQHoYArYpifcxGYRsq6spNXsq7jCXv3DDnxD7OXmVFCYjYRQY/qXUswX6itu6QVGLQGRk1m3Rh0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765998914;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=cr9XKe+pwJfXI32GGNHAjwqrluc6D+drfpq6NT56k4Q=;
	b=k6mN1b7/XAbph5+N6BEyWkhehYzqyk9Niwd4jW5Gg94F0X/G0l2dOQ+AlwUYnN60
	SPNd421HIg1JV56ZTMDYO5JHwcNvwWwZqhfKEF4N2naGhkPN2IJs1x2/vOLYdkLFc2V
	cZlmD699AAhYTXtPNQBOlhG1hDwPjD3i0kgZ5Tvo=
Received: by mx.zohomail.com with SMTPS id 1765998912072216.75004959100238;
	Wed, 17 Dec 2025 11:15:12 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 2/3] rust: Add support for deriving `AsBytes` and
 `FromBytes`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAGSQo00qe74q-Ztn2UubrMR+F-knO-DhrznSgM8Gk3j9OjNfKg@mail.gmail.com>
Date: Wed, 17 Dec 2025 16:14:56 -0300
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CF62C7F2-3BCF-45B4-87B4-6AF98000921E@collabora.com>
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
 <20251216-transmute-v2-2-b23e5277ad02@google.com>
 <DF05VVOUA70W.30GJE9P4Z3OL9@nvidia.com>
 <CAGSQo00qe74q-Ztn2UubrMR+F-knO-DhrznSgM8Gk3j9OjNfKg@mail.gmail.com>
To: Matthew Maurer <mmaurer@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 17 Dec 2025, at 15:01, Matthew Maurer <mmaurer@google.com> wrote:
>=20
> On Tue, Dec 16, 2025 at 7:12=E2=80=AFPM Alexandre Courbot =
<acourbot@nvidia.com> wrote:
>>=20
>> On Tue Dec 16, 2025 at 9:44 AM JST, Matthew Maurer wrote:
>>> This provides a derive macro for `AsBytes` and `FromBytes` for =
structs
>>> only. For both, it checks the respective trait on every underlying
>>> field. For `AsBytes`, it emits a const-time padding check that will =
fail
>>> the compilation if derived on a type with padding.
>>>=20
>>> Signed-off-by: Matthew Maurer <mmaurer@google.com>
>>=20
>> I like this a lot. We have a bunch of unsafe impls in Nova that this
>> could help us get rid of.
>>=20
>> Amazed that this even seems to work on tuple structs!
>>=20
>>> ---
>>> rust/macros/lib.rs       | 63 =
++++++++++++++++++++++++++++++++++++++++++++++++
>>> rust/macros/transmute.rs | 58 =
++++++++++++++++++++++++++++++++++++++++++++
>>> 2 files changed, 121 insertions(+)
>>>=20
>>> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
>>> index =
b38002151871a33f6b4efea70be2deb6ddad38e2..d66397942529f67697f74a908e257cac=
c4201d84 100644
>>> --- a/rust/macros/lib.rs
>>> +++ b/rust/macros/lib.rs
>>> @@ -20,9 +20,14 @@
>>> mod kunit;
>>> mod module;
>>> mod paste;
>>> +mod transmute;
>>> mod vtable;
>>>=20
>>> use proc_macro::TokenStream;
>>> +use syn::{
>>> +    parse_macro_input,
>>> +    DeriveInput, //
>>> +};
>>>=20
>>> /// Declares a kernel module.
>>> ///
>>> @@ -475,3 +480,61 @@ pub fn paste(input: TokenStream) -> TokenStream =
{
>>> pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> =
TokenStream {
>>>     kunit::kunit_tests(attr, ts)
>>> }
>>> +
>>> +/// Implements `FromBytes` for a struct.
>>> +///
>>> +/// It will fail compilation if the struct you are deriving on =
cannot be determined to implement
>>> +/// `FromBytes` safely. It may still fail for some types which =
would be safe to implement
>>> +/// `FromBytes` for, in which case you will need to write the =
implementation and justification
>>> +/// yourself.
>>> +///
>>> +/// Main reasons your type may be rejected:
>>> +/// * Not a `struct`
>>> +/// * One of the fields is not `FromBytes`
>>> +///
>>> +/// # Examples
>>> +///
>>> +/// ```
>>> +/// #[derive(FromBytes)]
>>> +/// #[repr(C)]
>>> +/// struct Foo {
>>> +///   x: u32,
>>> +///   y: u16,
>>> +///   z: u16,
>>> +/// }
>>> +/// ```
>>=20
>> One thing I have noticed is that I could sucessfully derive =
`FromBytes`
>> on a struct that is not `repr(C)`... Is that something we want to
>> disallow?
>>=20
>=20
> Why should we disallow this? I can enforce it very easily if we want
> it, but the only difference between `#[repr(C)]` and `#[repr(Rust)]`
> is whether we can statically predict their layout. In theory you can
> use this to elide the padding check for `#[repr(C)]` structs (and
> `zerocopy` does this), but it's significantly more complicated.
>=20
> The only argument I see in favor of disallowing `#[repr(Rust)]` here
> is that if it's not a struct that also supports `AsBytes`, there's a
> question about where you're getting the bytes to load from.
>=20
> I will point out that we probably don't *just* want to restrict to
> `#[repr(C)]` because `#[repr(transparent)]` and `#[repr(packed)]` are
> also great use cases.
>=20

I don=E2=80=99t see the point of disallowing other reprs. You can =
currently derive
FromBytes/AsBytes for any repr anyways. It=E2=80=99s up to the caller to =
make sure
that deriving these traits make sense.

