Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F5326ED37
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116850; cv=pass; b=GqcXkpSGjOlh3PP16WQ7OOT4pWBwUhkiEBue7bl64Ttsk/TzT0TQ/PmuzLL16TDm5izfaQEvQCBZxG7LeRwMDvQBICFQnpQm4aGPVocQytTbvdgRgh4+dWebCgWPJ3WFcJ+9B6pllh77f3nwLRjj8trZEYqdrLelJRiSox0cG78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116850; c=relaxed/simple;
	bh=OxqqSSCq6I2FCwB7dBnXYGq5wSSUPBht+UUVLpTpQY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cj9YgqagsDg/BnA6CeaQsPNdgd+vFgTsBnVh9nC+v/XOxYN2CU531PyXq/Pc5h9hPAAT0PJvkjXT54nQNEqxLtZ/fNyo7J2CUq6l6CEvA5pouH7cMf5yp3QKJ2k6C57sjimlO6LHhUp6DJmByUAZmsKSD8l/eQzchP3mbTDJeSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q8qmuiVA; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q8qmuiVA"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b5b56d72fso7864a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 09:47:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767116847; cv=none;
        d=google.com; s=arc-20240605;
        b=iDK7J+Fzm37kEwHKoADKZ9aX7Z4FyDJeoRAwSYbKhfAnUlWEoPeEo+2xqH41eoUsd7
         wcQdx5HOS/3S6WCvXIUmBA3KSY1NGR+xH4weRx3r2++SvbC1RO+ytl1JNGsuFCMZbLAt
         h2S4ypT+B5bBFgEPApixoM6DPVzdBdgaBPyGfHyS/9GkiqMZr4BaYTDJYqOMZl6GXs/W
         rfbdbYpD8/TEZ6NgeWO9XULb5NtUPKd0BtRAVzv4yztRsmT+epes9Xh/vOpC8JVnkqo6
         KQ87UbXRYNCVS+eFQvUfcj9k/2Ufzwerx5NVcsStjgFEbEW0veDNOoTyP1IOwzXTvwOr
         fgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dXHCCoSyNXPWZtGEy3EfrjK2PaZg4darj2kyZf/orA8=;
        fh=8V/vYErJmcWUCstfMeFoq3Ovso6+BhXcesX8aZLPAJM=;
        b=gR+4Dhy1OfM8lqWx8RjSmnAOzRCpFfzrT+x8o1nt/9/2+XjREY4BVETd5Pq7f8sTZC
         XaTWMIhrlL3Iexw6WWDQNunC3jo8RFRQsz2aRMQYyrrUyW2MaH1I855OgWZcV10ULlzo
         CBfCldtXKJWQCj7OEQxBrnIEkIzHvlUO/0ShzS4fgRru0GEYx8Q2Y0xsKFEPcDSs4iq9
         o+z8lgwLZNO1sS+SKjO4v0mIQalxq4HR0aY1lyvq3wr7EoWXvKr5P+C4wdQ91o2Fhdd1
         wXZsLFV919q0iakCVg5wiVIUBcjAgA95GpldjIpo8Inlw5Fr+XBA16VNKsWroGaUlTSh
         xTwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767116847; x=1767721647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXHCCoSyNXPWZtGEy3EfrjK2PaZg4darj2kyZf/orA8=;
        b=q8qmuiVAeLyaPwE4YsCAtlFfFS6iCd8fn2I9q0irrdNDVEff6+G7TNQr13Uoi242U7
         JU3Yrn39ujXQox4vOxSSOOr2ruPXZUo3RxKY848AGHfKERFeCtSuPzua6aMbnSXL4QbV
         tG+oyEswOyZEsiElyhQtkgqQVUVJRU3z6XzNKQ6tPeAMo4WI7dJyCrNOG1pBSuwmyW9H
         bwtL2QTPJY4V+KRmD8DZ/0mx/aLGDme8hv7BHqYeIm86/sWjhhzU9c85BL8aVXm/EaOT
         35y8UYbvieF6AqCKHhbaUs2G5qx+fSa8+l/Yuswf2yOTzcJ4DoOJ3d6tcf4mRCtZ/F/0
         hhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767116847; x=1767721647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dXHCCoSyNXPWZtGEy3EfrjK2PaZg4darj2kyZf/orA8=;
        b=qf/i+ffYd3N6DxGVxOzdzzd9eyRgo+HYVpIrPyB4rjhbu10ZblS4RE7C+gEeAD0ilG
         4VhOG1PhmcFRj0gbf+Jh4nWbHeTldcKLiAQ6Dy67Oxwxo9kLn0K7a14YI+tZShZTiKzb
         2M92CKFk4ASKXsDKxhKvc4qlqqMUzgqjNv/ab/VvVcJ7opZLCTTcdLUSTHERrz52wh5Y
         I6xAUPGr7x6MHIEzcxih5UrhvFVgPlbt1yqnIZT6Q/Y6Nw97p++5rTFN9lXGdJ5dV3ma
         H9qm0LP4+xM2QthGqAyQCh3begD5DdjHQxCjcTz6xNeDi9nC2blhwFqHcel3KYEuK63w
         IV/g==
X-Forwarded-Encrypted: i=1; AJvYcCUWqs7bv5CDpPv7m89o8TimWzE82J6oFoSk8cxp+gHA1uIUK8yznJUX763WX5ITkPkhFmaCsVGCmAaK1sB+eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3MYLb8Suvgmg2uITYPyWD3EdUwXQG9l6yc/DaPiFlsYxallFW
	eiaZGy68/cjyKJVGc2bCZnkEeu7ZXT6wSbZKbhg2M1Bcvnzfiwyz/PkkRKrt/EFEXAY5005SYJZ
	7Wpf7GPfGC82pM+lFpL45IoekC3yzzKcX/X6VftrL
X-Gm-Gg: AY/fxX7n9zfYMvESWToRt1o1k2uT82pZvXRkYcqicbXqcU0QAC56e55OBhEsjesSMeL
	5zovG/CjqpkgaQzn5hK+L4aR0X2Eb3W04JONB6/RoqZXwrrKo129kIXVS0p+jN5johF7/FUxkGU
	bV8KS6FmhIs3i9DiAkyLcko1riOosAkIiev8hitcYIYMlOA9SjAQqQcxUaXtL/SxuxJvLVzNxs6
	BHVMBHAJ6vldHA5UPfXCMG+PowIKiBCGZlNzf4lXlBvEcDRfgNAkc/Ra0WiJeS44/cpSApMX0L5
	3/8tU1faZ7r4Cr1OfvbRudzUYw==
X-Google-Smtp-Source: AGHT+IHFLxXuyYsytj6DTkUcKTMi/eRJnnZmk+kOgSKbPSGV9asZLv1AaMpayuPEok9S/W0d+Oo7PrVAnG96aiDsmxo=
X-Received: by 2002:a05:6402:70c:b0:643:e9f:2e5c with SMTP id
 4fb4d7f45d1cf-64f41e8741bmr1259a12.9.1767116846903; Tue, 30 Dec 2025 09:47:26
 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226-add-entropy-v3-1-a3440823a07d@google.com> <aVD0qcGEaiTZYheF@fedora-g16.bne-home.net>
In-Reply-To: <aVD0qcGEaiTZYheF@fedora-g16.bne-home.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 30 Dec 2025 09:47:14 -0800
X-Gm-Features: AQt7F2odHn3lqZxoGGVRZagsgH7Wk71yGxoP_45roo5Wn5fjiXLvGGUP7PsMk8I
Message-ID: <CAGSQo03F5S3SH5Z1=E+a=kLud-KvLYf_KhFHKqSUm5-n63L6dg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Add support for feeding entropy to randomness pool
To: Brendan Shephard <bshephar@bne-home.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 1:13=E2=80=AFAM Brendan Shephard <bshephar@bne-home=
.net> wrote:
>
> On Fri, Dec 26, 2025 at 07:15:10PM +0000, Matthew Maurer wrote:
> > +/// Adds the given buffer to the entropy pool, but does not credit any=
 entropy.
> > +///
> > +/// This is intended for use mixing in data that is likely to differ b=
etween devices or boots, but
> Yeah, I agree with Alexandre here. I think this would probably be better
> written as: "This function mixes in data that is likely to differ between
> devices or boots". Or, "add_device_randomness mixes in data that is
> likely to differ between devices or boots." If you would prefer to avoid
> saying "this function".

I believe the grammar to be correct here - if it helps, the "use" in
this case is the "yoos" variant of use, not the "yooz" variant.

That said, if it's confusing, it's confusing. I'll reword it as suggested.

> > +/// may otherwise be predictable. Examples include MAC addresses or RT=
C values. This slightly
> > +/// improves randomness in entropy-constrained environments (especiall=
y common for embedded
> > +/// devices).
> > +pub fn add_device_randomness(buf: &[u8]) {
> > +    // SAFETY: We just need the pointer to be valid for the length, wh=
ich a slice provides.
> > +    unsafe { bindings::add_device_randomness(buf.as_ptr().cast::<c_voi=
d>(), buf.len()) };
> > +}
> >
> > ---
> > base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
> > change-id: 20251029-add-entropy-f57e12ebe110
> >
> > Best regards,
> > --
> > Matthew Maurer <mmaurer@google.com>
> >
> >
