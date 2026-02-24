Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8F937BE94
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771948381; cv=pass; b=MycVf081Ay1mFmyOBqKZqFQo7F81MhDUp6sMlLGaGs7CN1thFifmv5RoUNLB7TTMtuQoMlfd8USD9WyCTIVT/7vu49Ov6i/lcR4423Jwsfk334BrUMntF++nYRBi6PHylId7PIf7ifCpuN5rdv5k6f3VEioX9PJ/GPuOmrZA5+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771948381; c=relaxed/simple;
	bh=yNQtOEt4P6mK4Fp7n5JixciVSavCRyn8TLpD4rUaKDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fgTLZ2B8pnsvxIhxiIgK2Vf00GDANRuC/M/wBv+wsOXJ0PI+VOREo6wFZvCc8++TW3V29mmhf1DLlmnzOO8e0A6/94WgKW8qkiqWGkHL42VUgS5RWzi1V/MxwTda4UmIYf5wxYPe6ta01tK3mBLJLtZytqMa84MJYbdi291heUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3eMjN6o; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3eMjN6o"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3870cbd6c40so50281341fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 07:53:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771948378; cv=none;
        d=google.com; s=arc-20240605;
        b=NNcJpZYC+ri4amtWWX9xlkEKU9LrinlOWcxUyvft9hnpQo8KRYxDy7dKphZNm9HfB3
         oM+rPQe7afAmMQ70leQnvQv+D6xjXMfr7ogFThlBwNNrfhOlu7CrfteFsfLagj2NI9Vo
         u4nJ/j/e0Sw4sa8kcaZT0KqAXhKFcn9R8kx6ZV4TRp8tDHTc9BZA8N0S6Bk6tPmxft5i
         DbtJT/1OnyEIB7fQIyIbGanl098Iftg4Yn+Yeqn9lVSJ10vfWItNMfLPdefIr28eHnq/
         ERRdf5Um+airscOlcPvo1frj0dNLDWdDOO3aV4JdVKxokf53kzwDSIrk06wZf5CYzrdD
         zHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JziVrq5fss/MAO+7T8PtTVr7rtP/29alI+wDNgqPzLs=;
        fh=FttcON95EfXUjtPn/F20xcjrREKid+79453YRCcJKdY=;
        b=OjEpeOAFIlNF+2GTxk3RoOK8pXnCwkmGDrKUEqC+EaHa2C0Z6OKgeLEOtdoja4+6dr
         gRLGff+JA80MEcSdgnDp/40CzhYAAfNRDamTiomkVxBji0V66jT7lo4iUqBy0GXRrJHY
         dwb7YTNQymRQ3Ub3O1Di+MQFDQtZdZjspxMalNvcD4G8CajRzOLNvBFkYdQKBE2zv2r0
         TqAUk+invQKx3hYETjAdPoHFmYDTPOJfsBrhdFgNYx6+7HBnmJq5t7og/mQpNgGYP5XJ
         wj+za3/MXu21RVAeERjSTfw4ThmK6FGrz8cnAk13d4jIDR2HNCjUwuSlhFfM10nCVRuK
         NFjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771948378; x=1772553178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JziVrq5fss/MAO+7T8PtTVr7rtP/29alI+wDNgqPzLs=;
        b=k3eMjN6oztEUx/oNiwceMHBsuhJrfDaC1xzdoX1JPisLOWjcVZTIFXGpBoO0nSj4n8
         DbzTFTzfyWPXk7CvnErFWGENGL9gLmPGgg31DEbTTYhteQpQOa+0VOmOUEiyn3k03Gy3
         VTZVUd+Nb/agMc5S+am+AoYyNbFvErOYbBzZivrCn6NdlR5YrKOYnQAt8UgXqOLXd7DD
         IGUdrYFCWHbpN7yGHeOEMJ+ZL+NWMcKCaxtSmjoLoy3fDrY5Nz5hirxmtCjwO4Bo7fYG
         c5XE7kRZG/d07Lvr5WAKCdKpz3iBTs8FoObRV0hHZRTWfrE2Iq5Lg7788ELvT/aajDIl
         bWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771948378; x=1772553178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JziVrq5fss/MAO+7T8PtTVr7rtP/29alI+wDNgqPzLs=;
        b=gSoOXNnV1wB6lOOGiARnpEi58GZ6MYrLR/oMws1glEtAp5zjX5mw2bcgp09EwlzHT5
         zbw8h1nzsKIU8Q+85jQCuKDWLs0ZpSAXlt4QsXk+J94M75535BF7Q3EGJUPgKwbQcKWl
         wNCuTjHnxXbiCoyPOblKiCD5MgIVre0y/mo6YYNO6HoIu2iTnar1igeIbU2DNOaL9Ysn
         I3YXjC+YuX63y3Pm2/Kf4rFrBNlwnggA2XLo2O9rjs34v3p0NT2kLdOsmuBrTw78s3kr
         Ozw7C+6p8y/Z7t3sVOsbqWV6fG+7jHa2TD0wdz08bMvPiWuvMg/EAWMiNe7V6K2eGJD+
         5m4w==
X-Forwarded-Encrypted: i=1; AJvYcCXYm7sTZpwznp2tyIbgvOPgTMOf9iFFrsPbk/7SKtmS00L7+I5mboBl5H/GnneqlSLtzxG4v05SegVRbqC5Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydUD/zrSICM8MYI1ajENffli5tMZNeGar3j7CSPBU3YxQVox1o
	iZ4uK/hFhclLSwoOT5jag4ExxWKOCdmuNCFHFypz30rPeqo/cu4FGDxpRDM4mkkovekFKxMjkj3
	VWZzeFkGaXN43+b16p0zslzyZ2t99wis=
X-Gm-Gg: ATEYQzzoJ74zXv0y6TZTZL8kYBnvgcT4Ex3cV8zl+R6Xvq6YCm2pg/GtPCihsYJ5xx0
	XHlW6Ql8dqpA2Mu87+1+Dukv6xsKdTz/d1rTpfAK1FEzo5NAK7kQBFLxlOK2mei7i0F2OOKwGEU
	up070bpLvkAmQHASx9ojxabJeVG2zPjPFNtRZHQkyQHt3sKRQhywkoZi4TIbxxiRshCUZLVJrCr
	eUiFNq2WDob28Qt1js142PO8anU+SE/BbiTVxS7ln8Gh2IIlJhkknikoZQoR4AmKPNy5BJI9uH/
	Y7/3WQH5CFLjHmZZhSrZNkp9fyaaToOnMKiNqSqMa9YI+2ouTGyRn8+3tbJ7qtfSqaoECYlYJiG
	FQA0XnyRXBnwtEln/oQ==
X-Received: by 2002:a05:651c:110b:b0:386:fe97:a538 with SMTP id
 38308e7fff4ca-389a5cd69damr32928291fa.9.1771948378286; Tue, 24 Feb 2026
 07:52:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-4-f777c65b8ae2@kernel.org> <CAJ-ks9=hWB2eFcEj1obfsoLvK15=YR9y=hifxVyeB=mJOz+gXQ@mail.gmail.com>
 <87ms0y1akt.fsf@t14s.mail-host-address-is-not-set> <4V-olEAuXuPUO6t34rF2sn2KT3zYNdPHxGclD7-fJjKJNoXQPZNDJfc_ukQ3VyGVnbbdbCasUteYnH3U97s2zQ==@protonmail.internalid>
 <CAJ-ks9mtwo6eAvmT6qbL+Mg_=A+-zdtiBw6BtsfO2eZ8HbkXWg@mail.gmail.com> <87jyw2171v.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87jyw2171v.fsf@t14s.mail-host-address-is-not-set>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 24 Feb 2026 10:52:22 -0500
X-Gm-Features: AaiRm52Cj0fzcvfpEDR8RU4d6CIE1LaOtFAAcUcZ8Cs4-VUqujC-H0IrySo1FlA
Message-ID: <CAJ-ks9nPaQ4oWGkr0fesvPdfxt7gb-4g5xE2xUdzi+OB5EJ9pg@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] rust: xarray: add `XArrayState`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
	Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 10:43=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> "Tamir Duberstein" <tamird@gmail.com> writes:
>
> > On Tue, Feb 24, 2026 at 9:27=E2=80=AFAM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
> >>
> >> Tamir Duberstein <tamird@gmail.com> writes:
> >>
> >> > On Mon, Feb 9, 2026 at 6:39=E2=80=AFAM Andreas Hindborg <a.hindborg@=
kernel.org> wrote:
> >> >>
> >> >> Add `XArrayState` as internal state for XArray iteration and entry
> >> >> operations. This struct wraps the C `xa_state` structure and holds =
a
> >> >> reference to a `Guard` to ensure exclusive access to the XArray for=
 the
> >> >> lifetime of the state object.
> >> >>
> >> >> The `XAS_RESTART` constant is also exposed through the bindings hel=
per
> >> >> to properly initialize the `xa_node` field.
> >> >>
> >> >> The struct and its constructor are marked with `#[expect(dead_code)=
]` as
> >> >> there are no users yet. We will remove this annotation in a later p=
atch.
> >> >>
> >> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> >> ---
> >> >>  rust/bindings/bindings_helper.h |  1 +
> >> >>  rust/kernel/xarray.rs           | 41 +++++++++++++++++++++++++++++=
+++++++++++-
> >> >>  2 files changed, 41 insertions(+), 1 deletion(-)
> >> >>
> >> >> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindin=
gs_helper.h
> >> >> index a067038b4b422..58605c32e8102 100644
> >> >> --- a/rust/bindings/bindings_helper.h
> >> >> +++ b/rust/bindings/bindings_helper.h
> >> >> @@ -117,6 +117,7 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =
=3D XA_PRESENT;
> >> >>
> >> >>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
> >> >>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
> >> >> +const size_t RUST_CONST_HELPER_XAS_RESTART =3D (size_t)XAS_RESTART=
;
> >> >
> >> > Please add a comment to explain the cast.
> >>
> >> How is this:
> >>
> >> // `XAS_RESTART` is defined with type `struct xa_node *`. `bindgen`
> >> // cannot generate pointer typed constants, so we cast to `size_t`.
> >
> > Can we include a citation or explain why bindgen can't generate
> > pointer typed constants?
>
> If you have one, I can add it. I don't know why this is the case. My
> guess is that it's just not implemented yet.

If that's the state of your understanding, that's what the comment
should say. But IMO the burden of finding out the reason, filing
appropriate issues upstream, and documenting these things is on you as
part of this change.

>
> Best regards,
> Andreas Hindborg
>
