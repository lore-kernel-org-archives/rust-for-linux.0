Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F6915B971
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 15:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771168782; cv=none; b=d5W6SOCDoF6IpOEV/ErNmVIXArBVDrJfpTEGTymuKYApuWO7X9uSsJ4HobtanWdh63Cv8gjCwD7qZZHsjx+3BdnsLx37A6M2d++Gzu6FBVA3E7LSZhGlo8g6f3Z0SMC6aprPX1TPQvtbR2ktu0nKULXlmyq5U1EX50VH3znB2+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771168782; c=relaxed/simple;
	bh=kqWDAEHiOr3HjSUzoervkLqY75DP3iBgy/+KhjO5bGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5s6A1ygK0Fqi1Zrw0jPdkAwUn/7iIEDL1o/FYHa6Xw7dpmdTv0l0BndM9zaIEZrviG3VBJCz+cVLkiipbthBZ38wsp5QE/CWHcDIk2xtWXYbPCvWfIEmRepjV4refb5zFXbK/fRB3dtIOFoTfQOeoJaMVi4AX4WL/IwHUutCbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqI+cWLF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqI+cWLF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FF9C4CEF7
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 15:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771168782;
	bh=kqWDAEHiOr3HjSUzoervkLqY75DP3iBgy/+KhjO5bGU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jqI+cWLFTY0Er5B4hxaP/ykuXKMPX53m3GG1XPBOg/fGd5NGG/jgF4LAHlnfdu5Ve
	 GWMk5XjcGIkIV1byh2sQSNAPR8dxI9aM1MlkM7V3MX5FRRYgs3esfrqK05olxPXGwc
	 10JtUh4Uikrcl+1fiKQzp9cB5TK7zaUXtP8C0dddt1id8W6Wy98jPwYLT0rbgRR1yW
	 kJstZDilpjI23lkJcThSAJY/mszC4l/GMFRenU8mAqMDK88q90uQ9RMvxKX2k7eoBA
	 jCYYk4V722jyDP1aCRAnqOnbpTnq3zSRLfOGnLx0O1CMvxLmNjupCm1hp5BTW8jqhY
	 suf+9zwA7gGdw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-385d9fb297dso21454601fa.2
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 07:19:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkAQxFXHQpMvGFUC7alI0p8Tj6dtWG3rh2BCWdxaE9XVw0wgBOPAJdepV83OlCse5JY4DCxOdkAs3g6qwA0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0JxLZ1I5ljIDjUTTaHmuRrCvy3b7xPoHcqbBZ5umOzo3HEZIi
	DFO8EEHodqMI6q0v619WUhxLKbmb6JAY2vJVRiKSvLOgflhPi5/hRUDtXemk1UFUJfaTSd2eXbT
	j2iyPvHllndJr3npIfueFH4+JrdtKJMQ=
X-Received: by 2002:a2e:be84:0:b0:385:dde5:1bfd with SMTP id
 38308e7fff4ca-3881057081emr26479711fa.27.1771168781063; Sun, 15 Feb 2026
 07:19:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215132232.1549861-1-lossin@kernel.org> <CAJ-ks9kJshm9YYEDYPVXmG8hGandsaEGe9gwEuCZsoxd73CbHA@mail.gmail.com>
 <DGFMGKUGVR3W.2M0G11JM7MG13@kernel.org>
In-Reply-To: <DGFMGKUGVR3W.2M0G11JM7MG13@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 15 Feb 2026 07:19:04 -0800
X-Gmail-Original-Message-ID: <CAJ-ks9m+ywqeNQ5WM_PN9yxLOka3YQrB__-Vf7Ma3yOa0OcJGQ@mail.gmail.com>
X-Gm-Features: AaiRm5079SJtp5JhJToPiWtvvDiGugauhua7Q10xgC2IWYd9-AkiFC5hOHmTVLE
Message-ID: <CAJ-ks9m+ywqeNQ5WM_PN9yxLOka3YQrB__-Vf7Ma3yOa0OcJGQ@mail.gmail.com>
Subject: Re: [PATCH] rust: pin-init: replace clippy `expect` with `allow`
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 9:57=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Sun Feb 15, 2026 at 3:24 PM CET, Tamir Duberstein wrote:
> > On Sun, Feb 15, 2026 at 8:22=E2=80=AFAM Benno Lossin <lossin@kernel.org=
> wrote:
> >>
> >> `clippy` has changed behavior in [1] (Rust 1.95) where it no longer
> >> warns about the `let_and_return` lint when a comment is placed between
> >> the let binding and the return expression. Nightly thus fails to build=
,
> >> because the expectation is no longer fulfilled.
> >>
> >> Thus replace the expectation with an `allow`.
> >>
> >> Link: https://github.com/rust-lang/rust-clippy/pull/16461 [1]
> >> Signed-off-by: Benno Lossin <lossin@kernel.org>
> >> ---
> >>  rust/pin-init/src/lib.rs | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
> >> index 49945fc07f25..fe4c85ae3f02 100644
> >> --- a/rust/pin-init/src/lib.rs
> >> +++ b/rust/pin-init/src/lib.rs
> >> @@ -1143,13 +1143,13 @@ unsafe fn __pinned_init(self, slot: *mut T) ->=
 Result<(), E> {
> >>  ///
> >>  /// - `*mut U` must be castable to `*mut T` and any value of type `T`=
 written through such a
> >>  ///   pointer must result in a valid `U`.
> >> -#[expect(clippy::let_and_return)]
> >>  pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) =
-> impl PinInit<U, E> {
> >>      // SAFETY: initialization delegated to a valid initializer. Cast =
is valid by function safety
> >>      // requirements.
> >>      let res =3D unsafe { pin_init_from_closure(|ptr: *mut U| init.__p=
inned_init(ptr.cast::<T>())) };
> >>      // FIXME: remove the let statement once the nightly-MSRV allows i=
t (1.78 otherwise encounters a
> >>      // cycle when computing the type returned by this function)
> >> +    #[allow(clippy::let_and_return)]
> >
> > Consider adding `reason =3D "..."`.
>
> Isn't the FIXME comment directly above enough? I don't want to duplicate
> the information and the string constant explaining the reason looks
> ugly.

The FIXME explains why the allowance is needed, but it doesn't explain
why it is an allow rather than an expect.
