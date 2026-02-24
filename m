Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075233806A6
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771944768; cv=pass; b=pkJlggIiIbwi5BVU5NJOSWqPjbo0ntMuODKhql9A8uSpvW30mC4o8Psgp60sfWnyldBdLYOnjrVvB0fDZ2f+vZ2XoRX2vsuN7XIUD+1ccTNUryPmsipkUXOAol47AeZrAlsY3gTGEb5PCr3jMYQ0fVFNcdnDv4SQrEEtwrqtKlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771944768; c=relaxed/simple;
	bh=VXgd47+pXWp7UCA4btT1GsW2p9QQVOz+p8kJSRXBbTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aK4tjNBO5E0vpYctPzpmtZq59YrpDJP8pf5ZSjIkMSYaIeGYYdIFJ15RpcEFW8WPqezrVDYN17hZTE5NuDnCcmslmLhC+5pTG5Hpzlq4w+8XItVbpEYbstV4imxmjOBeU6S5sT8e4SWeHY6IeKL4cUYcsmnh+fRFb50KPF3GfyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cK/gpAIn; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cK/gpAIn"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-385c23b88e8so46910541fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 06:52:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771944765; cv=none;
        d=google.com; s=arc-20240605;
        b=E+Uemicyi7Ptz1J8L1dbsYMWyTjOrJgx8pnfznVs4fhFM3vYFqmgf7V4GpQmsMCbwG
         btve92Mhs7arnvKzDNtmKLWBRcu5ODNHGmbUA02c4hPQCLQYz9Ad3fKUfKgcnDqoSKDD
         JbkpWNBskA+I8Wjw5EQ5ZvNUXN1StcfLHJ1UrwutexPMNnfLOPyIC5lBea6Dy+t8SN/K
         wXptTIvHiy/bsyOTgN/qvjINcQFMPui7fG/f5f/FjTPfcNPZi+e9x5v8O7XZ/WEO1sxs
         EkWrw7FunPy2h8+t5pwcG1DfqzexvaHyc3447ZTNtju/shUN0Mq1H0WmeBUTaHLAJ7oQ
         Fa7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mHcX/rh6tRUfCgGWx2lmhCiMrVAEeWUcSr7K4fvJPDI=;
        fh=y9ar3/M7mjFGiskDwGmtfUcxBQNfSkL18vN/oJ/91uA=;
        b=VmiitLhUWKZDxE3plZzSvlrloTTDlZKQ33PLh9PtAq5tkUivlAwJXoCpQS9XW3bk4y
         FaGMlkc3alu3eEZW/Nhb4w8nFNluiO1R99pemp9pxkguzxc2k1xOAvIGx2eUk0AWIDuM
         RcqOugVztnTBkbsviG83nbke3Xp5ZEueo9MdvQFGnO/cr82luXr55BLwJa7A+i+jFh7U
         6m9aJYn7juf35im2Nd5g8/75qNAZYTyBt0a3u8ZS8YOPbt3E0sz6AWy7sKrZYDihY/NE
         k+kL3CrRq2rP6v7PiLTYD8roSW6fGVtvbCjo3DBd7rgOUUQSW+a729Pf2zCfLkCO0NAd
         rk5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771944765; x=1772549565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHcX/rh6tRUfCgGWx2lmhCiMrVAEeWUcSr7K4fvJPDI=;
        b=cK/gpAInLT4Yop5xOyZZPrBFED3Z2agEzLdVTFEwiG+ymL98UlFRmBFWdIP/u0TpZa
         qHcw+jYAqnji9+bSfIgs7qJlEOMScubJfXchNc5mzEELy1MYrZEDPQTYv5XbTdTHHjLl
         jOjJp61oc+9GL7JQHFeH7RIMnteQ8SbkuZ8U4W1H8JQKiWhJZX7Eq83jQLgQ3DILrRA0
         lBbcao0gOG/nCSTKGtbmImlD7WtssKAcMKJbvz58bo66QX8pYecWJvuXEVCoTB87sfot
         qwax39Hi91dEIRpetHPcgtOWNm4MeQxE6E3A9jaqN80uBA8mJYyJX+8nwEeD32J62mMx
         TTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944765; x=1772549565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mHcX/rh6tRUfCgGWx2lmhCiMrVAEeWUcSr7K4fvJPDI=;
        b=UdAWsqEwv90bQ97en2ZvCG3kLUDNLRECngp6BFdYftH5u56K6TE3yJ9q01ZaurHzje
         upfgM9EBqj/9BjLOtN/hLBNhr3vhImB1xEawJhUosTG3t8b4VcqmXcxFj/VseuxfpUal
         m4TkIllTn9S9jbZiOgF4/0txLfgkf3CoY/jzKXUAlS3lBed+7QhKh1MyBFTXrKJJXVH5
         usQ06PpJtCbbHbRfQKuObB0PV16TNRJ13+74aG2gUZz/lEG5xDY9xZRFM8SaxJnGb4iC
         aD2+x/8AAEba4s4Tm54rN4WyiGtu4ZIJZCsrNPHT+3frK084pmBc3oYWMv+Hq6gVe4Fz
         npRg==
X-Forwarded-Encrypted: i=1; AJvYcCXfAoRPXm1dYw12tLu4V5UzaeD1f3IxDFQEKNUEQr1PVAeowyvpdqgrp10V7Yw5pH0Bi6TQOdHdqY2w7VOTeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuxUe9lFh5/LnR0nnEfEstiNaDk0Y2mSBNCea+w6SKUHEJhYNJ
	WpSdSQL7tLMbNSGGBOYSwqAb2cHgA0gs8Pbo2kKPBfRtr/iNQ5V1xO2ySDgTEo5wsO1D8h2inkr
	vo4VCp/emTDE2mG5lM6PRkzimKkJm0kY=
X-Gm-Gg: ATEYQzzmmuuxVeH8c39ZdCq4K3IoJ2rDE3eVLg7h4YnObzd/uoCagvNF915Ku5ylafv
	fTOs8JHhD87or6j1ljLstuoR63sU7xQENPMZ5QF7MK3v+jVncs3yGQrQUcvwMei2YZ24p8e8Ksf
	AZEhWzqrM70XzQQv2Sp9HehoAobEMUK+AZsIbTZEb6FucYhm9hiFMSeN20diwgc4qCOutlTrwIJ
	qJRNO0bcYsb0sTxvCxhvuSOF2ytWS16hAgSQT/X5MAGsln/EY/EQREdfyw65NEh74IE749A5xuj
	44tOEFTmNUTZfDTnPJUjoy7Su7Wr26UM9Q6JCWP2FJXouCY/3rOmZraxG7wFu+61gw8GLczGBeg
	jskKrXR0AEBPdsKog/A==
X-Received: by 2002:a05:651c:31d2:b0:385:c7f0:2b1a with SMTP id
 38308e7fff4ca-389a5bfaf3cmr45288531fa.33.1771944764898; Tue, 24 Feb 2026
 06:52:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-4-f777c65b8ae2@kernel.org> <CAJ-ks9=hWB2eFcEj1obfsoLvK15=YR9y=hifxVyeB=mJOz+gXQ@mail.gmail.com>
 <87ms0y1akt.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ms0y1akt.fsf@t14s.mail-host-address-is-not-set>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 24 Feb 2026 09:52:07 -0500
X-Gm-Features: AaiRm51E5g5hu-gNZ3KVzmobV8NCSlGexxFTi5VRWK0zHfaV6kQEmjkKY0e45lI
Message-ID: <CAJ-ks9mtwo6eAvmT6qbL+Mg_=A+-zdtiBw6BtsfO2eZ8HbkXWg@mail.gmail.com>
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

On Tue, Feb 24, 2026 at 9:27=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Tamir Duberstein <tamird@gmail.com> writes:
>
> > On Mon, Feb 9, 2026 at 6:39=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Add `XArrayState` as internal state for XArray iteration and entry
> >> operations. This struct wraps the C `xa_state` structure and holds a
> >> reference to a `Guard` to ensure exclusive access to the XArray for th=
e
> >> lifetime of the state object.
> >>
> >> The `XAS_RESTART` constant is also exposed through the bindings helper
> >> to properly initialize the `xa_node` field.
> >>
> >> The struct and its constructor are marked with `#[expect(dead_code)]` =
as
> >> there are no users yet. We will remove this annotation in a later patc=
h.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> ---
> >>  rust/bindings/bindings_helper.h |  1 +
> >>  rust/kernel/xarray.rs           | 41 ++++++++++++++++++++++++++++++++=
++++++++-
> >>  2 files changed, 41 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_=
helper.h
> >> index a067038b4b422..58605c32e8102 100644
> >> --- a/rust/bindings/bindings_helper.h
> >> +++ b/rust/bindings/bindings_helper.h
> >> @@ -117,6 +117,7 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D X=
A_PRESENT;
> >>
> >>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
> >>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
> >> +const size_t RUST_CONST_HELPER_XAS_RESTART =3D (size_t)XAS_RESTART;
> >
> > Please add a comment to explain the cast.
>
> How is this:
>
> // `XAS_RESTART` is defined with type `struct xa_node *`. `bindgen`
> // cannot generate pointer typed constants, so we cast to `size_t`.

Can we include a citation or explain why bindgen can't generate
pointer typed constants?

>
>
> Best regards,
> Andreas Hindborg
>
>
