Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6869922D792;
	Sun, 15 Feb 2026 18:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771180163; cv=none; b=oaihcvYFclSm+XOZlaoQmaUSkkriJeHTZ6hBiY+ybyhlUOPnI3d94J7i/nx6PBrJSdz1E/9fGVwwLGYl90Bs4K81A+J4tU3fGfvyR8vIzHb4XaBtnzbIpg8FLNs3bkQ3ck/ihlIgIu6YORYdzMgb49mEDuuDjYFnWktMhHOz6c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771180163; c=relaxed/simple;
	bh=Q+1mfYES00J58kOb+iiaKUMOlNYRT0rkio+A0dIohDk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Rw44fVwVQi3hFV8kSZPL1exQ8J9k/QeQWkbFe+b6qTSzrh8M7XACuOiMSQjP2o2b28u/Y8nBZZOeVjJUIYvKYn+Ve7nVtK9hdr/tDXlgvYsVgO5RfYyUmGvkmAZJzDYLgizTjZ7cwtsMtR5hYCeujCthryz4E0VomTn2sRx0bF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYEatKeY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYEatKeY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF4CC4CEF7;
	Sun, 15 Feb 2026 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771180162;
	bh=Q+1mfYES00J58kOb+iiaKUMOlNYRT0rkio+A0dIohDk=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=kYEatKeYj2PXLSEoCzzz9x2XCcH2LUAAnzjEZXB/I+1jv24CHLbCWwaCN+ensuE4I
	 huERu17qELxaEZJvGF6ggFPLDZ/wPAp4jCo/geeUaBMGzFyl4W5dGodl9kiUpIAddK
	 jWOCoKqknrKSnAebXWg8PzHkWo3JOtM8uIUVSGW9xUVbpm0vmI3qkvh8Oe2QfugSkO
	 6PYvkzTugAy/XCWESp0d4+gqr3OrHj4MWDFKd67Yg02gZu505ui1nvqoaFIXgOGBKM
	 BQJb9t1t/5QamZnh68KDhQx7jSDG7JnWc9npKlxGMOq+zsLRPrjOAhBwPdqohmqbLj
	 fj4XnhFdHq8Ww==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 19:29:18 +0100
Message-Id: <DGFQYRT7PDLB.2DI1PA7P11ZVG@kernel.org>
To: "Tamir Duberstein" <tamird@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: pin-init: replace clippy `expect` with `allow`
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260215132232.1549861-1-lossin@kernel.org>
 <CAJ-ks9kJshm9YYEDYPVXmG8hGandsaEGe9gwEuCZsoxd73CbHA@mail.gmail.com>
 <DGFMGKUGVR3W.2M0G11JM7MG13@kernel.org>
 <CAJ-ks9m+ywqeNQ5WM_PN9yxLOka3YQrB__-Vf7Ma3yOa0OcJGQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9m+ywqeNQ5WM_PN9yxLOka3YQrB__-Vf7Ma3yOa0OcJGQ@mail.gmail.com>

On Sun Feb 15, 2026 at 4:19 PM CET, Tamir Duberstein wrote:
> On Sun, Feb 15, 2026 at 9:57=E2=80=AFAM Benno Lossin <lossin@kernel.org> =
wrote:
>> On Sun Feb 15, 2026 at 3:24 PM CET, Tamir Duberstein wrote:
>> > On Sun, Feb 15, 2026 at 8:22=E2=80=AFAM Benno Lossin <lossin@kernel.or=
g> wrote:
>> >> @@ -1143,13 +1143,13 @@ unsafe fn __pinned_init(self, slot: *mut T) -=
> Result<(), E> {
>> >>  ///
>> >>  /// - `*mut U` must be castable to `*mut T` and any value of type `T=
` written through such a
>> >>  ///   pointer must result in a valid `U`.
>> >> -#[expect(clippy::let_and_return)]
>> >>  pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>)=
 -> impl PinInit<U, E> {
>> >>      // SAFETY: initialization delegated to a valid initializer. Cast=
 is valid by function safety
>> >>      // requirements.
>> >>      let res =3D unsafe { pin_init_from_closure(|ptr: *mut U| init.__=
pinned_init(ptr.cast::<T>())) };
>> >>      // FIXME: remove the let statement once the nightly-MSRV allows =
it (1.78 otherwise encounters a
>> >>      // cycle when computing the type returned by this function)
>> >> +    #[allow(clippy::let_and_return)]
>> >
>> > Consider adding `reason =3D "..."`.
>>
>> Isn't the FIXME comment directly above enough? I don't want to duplicate
>> the information and the string constant explaining the reason looks
>> ugly.
>
> The FIXME explains why the allowance is needed, but it doesn't explain
> why it is an allow rather than an expect.

I don't see much value in documenting that in the code. This'll be
removed once we raise the MSRV, which should happen later this year. If
one really wants to know why it's there, there is the git log.

Cheers,
Benno
