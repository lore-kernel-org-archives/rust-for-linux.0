Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057E5284880;
	Wed, 25 Feb 2026 14:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028550; cv=none; b=sm4NiugOby429PQQsRfH8P9SyVjytdMPzrVkB6t5+quwukC8pQUlLb2CKvid1bfUBYNJvkNaXPC4sR8Dfd0+Nu7Tk96qFjyBiepYr+9nBYlYt3SatSo5KFpuw0dfBg4oHYstghAbJDsNswpHDryrwgWX6tBh/BNk7DX6NKJ1E18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028550; c=relaxed/simple;
	bh=jyzQIOXdKcvuEjR46zRIHrsm/Dnr2GXzK3bzDHAh+o4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h5mKCrlmL0eiIulE26x82LmOzZPzoTDWpiC9DWWdI2+gTttLt7rEIGwzebHjU0n0KTylT42DSdIre55V1kpgKews9tsFVlrzV3bxn1hb6b+TQDFtxaOqH1j6rBD24avCciAU79pcgBRxCMvwynLpY4lvayjmQxUSdrgYtHPiBo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOcsX32u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOcsX32u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2A0C19421;
	Wed, 25 Feb 2026 14:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772028549;
	bh=jyzQIOXdKcvuEjR46zRIHrsm/Dnr2GXzK3bzDHAh+o4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bOcsX32utSzSiHypuBvSMNMSUQyZpzVy4Gcj7yHnKrO7+lu8ZYFeblHo0vdvBjXEl
	 EXpAbxyaWSMoxi9/GjHJ5r1sf3T6S5I0UYjgCMIxMgGuDqvCoCIReItbCRRQlDKJie
	 HcHPR/ofuyTeE4jXlrTynOzr2xRNSxEx9uM5C1DGhaAUMPf495zjKF05JKtgIhBln9
	 jqdD0iyOe5BB6LYRpeanuB+kjt3BlIzm6tc1MtW9M6vD33xajiJtZw9Cuxq31QVJJS
	 RMNuuZUDUPswTXtgwCeYtBZi20umVzEpawp3HYcCdoAsl8r1bY2z7//Cd93ASdjQof
	 GC6BVSznVR8ag==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Christoph
 Lameter <cl@gentwo.org>, David
 Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Harry Yoo <harry.yoo@oracle.com>, Daniel
 Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 04/12] rust: xarray: add `XArrayState`
In-Reply-To: <CAJ-ks9nPaQ4oWGkr0fesvPdfxt7gb-4g5xE2xUdzi+OB5EJ9pg@mail.gmail.com>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-4-f777c65b8ae2@kernel.org>
 <CAJ-ks9=hWB2eFcEj1obfsoLvK15=YR9y=hifxVyeB=mJOz+gXQ@mail.gmail.com>
 <87ms0y1akt.fsf@t14s.mail-host-address-is-not-set>
 <4V-olEAuXuPUO6t34rF2sn2KT3zYNdPHxGclD7-fJjKJNoXQPZNDJfc_ukQ3VyGVnbbdbCasUteYnH3U97s2zQ==@protonmail.internalid>
 <CAJ-ks9mtwo6eAvmT6qbL+Mg_=A+-zdtiBw6BtsfO2eZ8HbkXWg@mail.gmail.com>
 <87jyw2171v.fsf@t14s.mail-host-address-is-not-set>
 <y_QmIp8ZbHAqIsn7zWUrSFIzrpWSQWuyla5VvrJq5HUF7SwF_-mwdg1prwQxDAZkyqzHgVOxvEGUEkWE9ukSbA==@protonmail.internalid>
 <CAJ-ks9nPaQ4oWGkr0fesvPdfxt7gb-4g5xE2xUdzi+OB5EJ9pg@mail.gmail.com>
Date: Wed, 25 Feb 2026 15:08:59 +0100
Message-ID: <87y0kghq4k.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Tamir Duberstein" <tamird@gmail.com> writes:

> On Tue, Feb 24, 2026 at 10:43=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>
>> "Tamir Duberstein" <tamird@gmail.com> writes:
>>
>> > On Tue, Feb 24, 2026 at 9:27=E2=80=AFAM Andreas Hindborg <a.hindborg@k=
ernel.org> wrote:
>> >>
>> >> Tamir Duberstein <tamird@gmail.com> writes:
>> >>
>> >> > On Mon, Feb 9, 2026 at 6:39=E2=80=AFAM Andreas Hindborg <a.hindborg=
@kernel.org> wrote:
>> >> >>
>> >> >> Add `XArrayState` as internal state for XArray iteration and entry
>> >> >> operations. This struct wraps the C `xa_state` structure and holds=
 a
>> >> >> reference to a `Guard` to ensure exclusive access to the XArray fo=
r the
>> >> >> lifetime of the state object.
>> >> >>
>> >> >> The `XAS_RESTART` constant is also exposed through the bindings he=
lper
>> >> >> to properly initialize the `xa_node` field.
>> >> >>
>> >> >> The struct and its constructor are marked with `#[expect(dead_code=
)]` as
>> >> >> there are no users yet. We will remove this annotation in a later =
patch.
>> >> >>
>> >> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >> >> ---
>> >> >>  rust/bindings/bindings_helper.h |  1 +
>> >> >>  rust/kernel/xarray.rs           | 41 ++++++++++++++++++++++++++++=
++++++++++++-
>> >> >>  2 files changed, 41 insertions(+), 1 deletion(-)
>> >> >>
>> >> >> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindi=
ngs_helper.h
>> >> >> index a067038b4b422..58605c32e8102 100644
>> >> >> --- a/rust/bindings/bindings_helper.h
>> >> >> +++ b/rust/bindings/bindings_helper.h
>> >> >> @@ -117,6 +117,7 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =
=3D XA_PRESENT;
>> >> >>
>> >> >>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
>> >> >>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
>> >> >> +const size_t RUST_CONST_HELPER_XAS_RESTART =3D (size_t)XAS_RESTAR=
T;
>> >> >
>> >> > Please add a comment to explain the cast.
>> >>
>> >> How is this:
>> >>
>> >> // `XAS_RESTART` is defined with type `struct xa_node *`. `bindgen`
>> >> // cannot generate pointer typed constants, so we cast to `size_t`.
>> >
>> > Can we include a citation or explain why bindgen can't generate
>> > pointer typed constants?
>>
>> If you have one, I can add it. I don't know why this is the case. My
>> guess is that it's just not implemented yet.
>
> If that's the state of your understanding, that's what the comment
> should say. But IMO the burden of finding out the reason, filing
> appropriate issues upstream, and documenting these things is on you as
> part of this change.

I opened an issue with bindgen [1]. Depending on what they say I will update
the comment.


Best regards,
Andreas Hindborg

[1] https://github.com/rust-lang/rust-bindgen/issues/3347

