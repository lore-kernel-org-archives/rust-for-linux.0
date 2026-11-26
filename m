Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686993;
	b=jmkVzAHVVwMb+2DV3tJNSZmrnFxjbveEyzeQXS0MXGQpU0MwOwa57kcPOybafciP49uV
	 x38G4KDkju7hn5JYgM5b7KnKi2HASONXWKDij2zmVBN2CZ7HLqvMAobz6jFTc/rhy0Vb4
	 R+IVn62xEhCWjhYbxdjKQuIhqIdPLb4eggPHzUrlj9gdhYDqq5mQhLVO5HrVGAQQMpqwB
	 4uL9e678DD79w+qZh8eOW12ot3511j501MmZl0pN/cNw1Y320WbYxL5IbDVnO5HA7w4bc
	 QA1yglnyJHVsabzybLj9+Z43bpR72VJvAq6iOfEEJA8CGIM4z+D1UCPPFVvfkzhP6MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686993;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=/JlS7r3JJSxMa5u9kEcY91M8WxCeqjAS+UV5np4P9AI=;
	b=WFSMxNiuQTerSoRrFN867fdOmQqve4ba6e++P8zOkDP4Szv+XCMtz4t8VFfdcl9cDNVh
	 JI6dF7T4eRdo1vD21dWSaNLbj5Pnz7VK1TQOIEXVqlIwc+UBZUf823T8gpp45h1oZzwrQ
	 TQE+3GERc0J6f7jljF8B70py2Hk8XdLm2san8dGsPV/TqSzfFsad4zOBmFb5GzE4GKmwx
	 xFuHHXhGESHomJ5bYUHg5QfXi+nRCyAsoQj+Puah3rZ0n2CFZh4rVB/Jnh1+oimqQw0KA
	 rd/EuHsCZNq5PPC+LQFps9nSAtC7oHZf4Rq/mDQSd0pxmRIeMXwisRcXz4fNz/zzoIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=VEsexEr9;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E573606A327;
	Thu, 26 Nov 2026 09:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E573606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=VEsexEr9
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jZsQ51Nr7zKnDK;
	Thu, 26 Nov 2026 10:56:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795686989; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/JlS7r3JJSxMa5u9kEcY91M8WxCeqjAS+UV5np4P9AI=;
	b=VEsexEr9pkvCnjnhEoUTFdxspbiQ5tjf6hO7PVaNhSWMF9AlUEfeLewzBwwyq/3BqBIaxP
	PfEzLFy5YgtBOwvqc0mhzQ9wgjqNVlnSHx4QVkfYyHXQi2tdjh6Q5dzTB2+ec7ULbGFe+n
	gHU/uzR+1/m7AkkfyyhRbWMzrBi7/pPnVPamMehQ2yQdxOOTp95U1FkRfINCiaPako9ii/
	SJjtEH1x+6p4ZsdzifeMyZceD4KE0uR3Vj665c0teCmpesHp5m1iVi2KbpVrjcGxX0PJju
	J9nBvYPP5XO50KNxrWndt0x3+Se/pGvuGlV0gCVBqGUiLKNZWgAG5WzDVdOSVg==
Message-ID: <771a56496a50fc1e8bed77b45b3aa77feedca77d.camel@mailbox.org>
Subject: Re: [PATCH] rust: pin-init: document self-referential feature
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Gary Guo <gary@kernel.org>, Benno Lossin <lossin@kernel.org>, Miguel
 Ojeda	 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl	 <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich	 <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?ISO-8859-1?Q?=D6zkan?=	 <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Gary Guo
	 <gary@garyguo.net>
Date: Thu, 26 Nov 2026 10:56:27 +0100
In-Reply-To: <20261124-dev-pin-init-doc-v1-1-dd0a3eda9018@garyguo.net>
References: <20261124-dev-pin-init-doc-v1-1-dd0a3eda9018@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: 0a36c1af29070aa1979
X-MBO-RS-META: gef3kdahdrmowdpxugb8b7pkoifumfhu

On Tue, 2026-11-24 at 22:16 +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>=20
> Add a section to the documentation of `#[pin_data]` macro about
> the safe self-referential creation feature.

Thx for writing this, that's very useful. I read through it. Just some
comments below:

> +/// Here the field `part` captures the field lifetime `'msg` and thereby=
 borrows the field `msg`.
> +/// A field may only borrow from fields declared after it: fields are dr=
opped in declaration
> +/// order, so the borrowing field is then always dropped before the fiel=
d it borrows. Structs
> +/// with borrowed fields or captured lifetimes do not implement `Unpin`.

Unpin is something the user would have to implement for his struct,
isn't it? So are you saying here that the macros do not generate Unpin?
Why's that mentioned, do you expect anyone to need / expect to have
Unpin?

> +/// ## Mutable Borrows
> +///
> +/// A field is only shared-borrowed by default. To also allow `&mut` bor=
rows, mark the borrowed

I think the English-bros say "To also allow *for* =E2=80=A6"

> +/// field with `#[borrowed(mut)]`:
> +///
> +/// ```
> +/// # use pin_init::*;
> +/// #[pin_data]
> +/// struct MutSelfRef {
> +///=C2=A0=C2=A0=C2=A0=C2=A0 part: &'mut_msg mut str,
> +///=C2=A0=C2=A0=C2=A0=C2=A0 #[borrowed(mut)]
> +///=C2=A0=C2=A0=C2=A0=C2=A0 mut_msg: String,
> +/// }
> +///
> +/// stack_pin_init!(let foo =3D pin_init!(MutSelfRef {
> +///=C2=A0=C2=A0=C2=A0=C2=A0 mut_msg: "hello world".to_owned(),
> +///=C2=A0=C2=A0=C2=A0=C2=A0 part: &mut mut_msg[..5],
> +/// }));
> +/// foo.as_mut().with_project(|proj| proj.part.make_ascii_uppercase());
> +/// assert_eq!(*foo.part(), "HELLO");

Is #[borrowed(mut)] basically a better alternative to UnsafeCell?

> +/// ## Existential Lifetimes
> +///
> +/// A field lifetime ties a borrow to a specific field. Sometimes a fiel=
d should instead borrow
> +/// from something outside the struct that merely outlives one of the st=
ruct's lifetime
> +/// parameters.
>=20

"the struct's lifetime parameters" =3D=3D "the struct's members' lifetime
parameters" ?


It doesn't get fully clear to me why you mention "sometimes should
instead borrow from sth outside the struct". You seem to be referring
to "normal" structs that borrow something with a normal lifetime. So it
reads as if you fear that users might use self-referencial structs when
really their struct should just borrow something from the outside.. why
do you mention that, when would the user borrow something that the
struct already has which shouldn't be in there?


> +/// ## Projections and Accessors
> +///
> +/// Since field lifetimes are not parameters of the struct, borrows of t=
he struct cannot carry

s/parameters/members ?

> +/// them. This macro therefore generates several methods for accessing t=
he fields:
> +///
> +/// - `project(self: Pin<&mut Self>)` =E2=80=94 the pin projection: `#[p=
in]` fields are projected as
> +///=C2=A0=C2=A0 `Pin<&mut T>`, all other fields as `&mut T`. Fields that=
 capture a field lifetime covariantly
> +///=C2=A0=C2=A0 are only projected as (possibly pinned) shared reference=
s; fields with invariant field
> +///=C2=A0=C2=A0 lifetime capture are omitted entirely.

Means all self-referential fields are invisible? I would maybe mention
that project() should be the preferred accessor for users.

> +/// - `with_project(self: Pin<&mut Self>, f)` =E2=80=94 calls `f` with a=
 projection in which every
> +///=C2=A0=C2=A0 visible field has its actual field lifetime, so even inv=
ariant captures are visible.
> +/// - `with_project_ref(self: Pin<&Self>, f)` =E2=80=94 the shared versi=
on of `with_project`.

Thus, the user only wants these two if he needs to access self-
referential fields?


> +///
> +/// For all projections, shared borrow fields are only accessible with s=
hared references, and
> +/// mutably borrowed fields are omitted (they are only accessible throug=
h the fields that borrow
> +/// them).
> +///
> +/// Every field (except those borrowed mutably) that captures field life=
times also gets an accessor
> +/// method,
>=20

Are you refering to my_struct.member(), or to
my_struct.with_member(|member| {=E2=80=A6 ) ?

>  because they cannot be directly accessed. `fn field(&self)` is generated=
 if all of its
> +/// captures are covariant, otherwise `fn with_field(&self, f)` is gener=
ated where `f` is called
> +/// with the field at its captured lifetimes.
> +///
> +/// ```
> +/// # use pin_init::*;
> +/// # #[pin_data]
> +/// # struct SelfRef {
> +/// #=C2=A0=C2=A0=C2=A0=C2=A0 part: &'msg str,
> +/// #=C2=A0=C2=A0=C2=A0=C2=A0 msg: String,
> +/// # }
> +/// # stack_pin_init!(let foo =3D pin_init!(SelfRef {
> +/// #=C2=A0=C2=A0=C2=A0=C2=A0 msg: "hello world".to_owned(),
> +/// #=C2=A0=C2=A0=C2=A0=C2=A0 part: &msg[..5],
> +/// # }));
> +/// foo.as_mut().with_project(|proj| {
> +///=C2=A0=C2=A0=C2=A0=C2=A0 *proj.part =3D &proj.msg[6..];
> +/// });
> +/// assert_eq!(*foo.part(), "world");
> +/// foo.as_ref().with_project_ref(|proj| {
> +///=C2=A0=C2=A0=C2=A0=C2=A0 assert_eq!(*proj.part, "world");
> +/// });

So if you need one field only you would do:

foo.as_ref().with_part(|part| {
  pr_info("{}", part);
});

?
