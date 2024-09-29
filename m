Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9E617BEAC
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 23:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727651787; cv=none; b=Fe2phQ4qZyJRAZtXog1iuoYsalnFeasDi+iwtV8XULqIoY+2fyem2QbRBn1OdzjAlcWY9wgG8MZDeX8wx90Sj8uzxxBtiAKw2L1TsiPCXoTltwrh3frPD0d9Xx1vyBe68BEpNFsXXi9O/q4vRUOYi4dpHymoGfWz49kO/yi+1AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727651787; c=relaxed/simple;
	bh=CVMut0vhqxDD8F+O7e+L0P5g6KEti08kYXU2eWNqF6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZc8zTRWO94dLyP6Xunoe+gJl87CeSioSa33pxhZIW2YlNeU1A9GdojyXK4YXWHPEnOVlUMDi/cOWUXzYK3aJQJ2I/1q0nyP/Q25BSu6WLnD6ym8FvvmwmINLqIj6hsWhm1aBGYjx9+2mhkrhJmCiOillh5Ky2lkBPXqJUPwz/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=KjJ2Cbsn; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="KjJ2Cbsn"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e026a2238d8so3461011276.0
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 16:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727651785; x=1728256585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Olzj/nziXIeAVjOpf48E0PyOdDGI5T4nUGRWBH7zAjM=;
        b=KjJ2CbsnYo+g8z2sKmSadMFGL89V/lZv7QPAJmbn5I+unXXyMXVQoK8pxtdVY0yyOB
         knx+pbUbyA9zs2uQAPCIgioRaFfLki3eB7MBkuPl6LMsDTOJM1KbBE1dWlBjqw5EVpSm
         xuOwEsU6UsbIGnhcaaUpTf92My3Kpr0E/v12sZGq4JTFSaBrRovwuC3rulJuHcI1IAqL
         FxAbx9xDcTPKtVNCRPh1Wpk7JGv/+OheWKbgQ9/SqcBeqs1Ca4fYGo5p0trKsho6I6xg
         eZaal7SPq4r2aXYbSg6E6EMG6qkD+/StuzThGdz8b6h6SG8A9L49+jinl1Iv3G0JlnCX
         aVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727651785; x=1728256585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Olzj/nziXIeAVjOpf48E0PyOdDGI5T4nUGRWBH7zAjM=;
        b=Ly6axdn/vaoYc1wFjEO7qMd4z9V21klAZqvoa1S6AmGAdyQWskliO+GaGgqVsn8tsj
         gbFWjb8DUe5y1lcxdR7ryP+CnHOVf7WSxo+Dn83/1DYI8Otar5RKRFXoer16Vt0JGU65
         T1J9ZRdUEEXXBeFtmY4qv8uUljdmuEEjPSOGVt7yaPn+aTGi240u41/sgdngZswjdeiJ
         YvVs2tTv3XcsSNgb61lw+oDKVGC3cY2ZcbQfVLubeaXkzOyTj3stQisN2OiEFvhhohKK
         oZhxpW8Pab3Bf7lGP3aL04BKe/alZuuIGSaDBJHZ08ygIoknZ25hJ1CFlpW9pueJe5wz
         gx6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvPMaF1PYPMyOi2d0w/ZrGqM9jKOIyM6HMxJ7JXav4d4vIlv3pFigc0LOva+9D/npo68pfHOhl048ruzSnRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7HNf5PMTZzhNbI6nKGMMCXyF5Cuk4wysL1I6MDNTNJC/x6bF3
	zK3UR1lonyh+jMdLMaoUlnn3EN8Ahuww8XYnS1gL9nlciAQbSsjvDNwyM9BEB8Yp5fyMG97bAHP
	vAdRbXmpObsUjmw3fYnHtnjSyV2/oLAf0+3X5+w==
X-Google-Smtp-Source: AGHT+IFeKSsL3sBYdIW+H3vNO3HcRRrBNS2Ix2MP2UrQuSmTFembdSNTZqDfQ1oEnyy+S5cX2VXzUAjixtH/QzImxPI=
X-Received: by 2002:a05:6902:2681:b0:e20:805b:9678 with SMTP id
 3f1490d57ef6-e2604c97361mr7575035276.48.1727651784843; Sun, 29 Sep 2024
 16:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913210031.20802-1-aliceryhl@google.com>
In-Reply-To: <20240913210031.20802-1-aliceryhl@google.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 19:16:14 -0400
Message-ID: <CALNs47sMJzeZ0yEF9sc-VO_QEu4=jc3QBa1_fhnhX9gdETYaNA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: harden index manipulation using ownership
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 5:01=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:

> +//! Utilities for working with ranges of indices.
> +
> +/// A range of indices.
> +///
> +/// This utility is useful for ensuring that no index in the range is us=
ed more than once.
> +#[derive(Debug)]
> +pub struct Range {
> +    offset: usize,
> +    length: usize,
> +}

Would a name like "DataRange" or "CheckedRange" be better here, to
avoid confusion with core::ops::Range?

> +    /// Use this range of indices.
> +    ///
> +    /// This destroys the `Range` object, so these indices cannot be use=
d again after this call.
> +    pub fn use_range(self) -> UsedRange {

Maybe just `.use()`?

> +    /// Assert that this range is aligned properly.
> +    pub fn assert_aligned(&self, alignment: usize) -> Result<(), RangeEr=
ror> {

It would probably be good to warn that this alignment is relative to
the offset, i.e. if you split a range at an unaligned point then this
may not be useful.

This is a pretty cool API idea.

- Trevor
