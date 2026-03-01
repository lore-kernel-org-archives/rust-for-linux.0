Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CF12D2488
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772387649; cv=pass; b=L7EVFS3FkAv92Y5eC/0gNuleWB7qjyIs9Ve+nqgZHtxT6DASo14NGvUCHVdpn5eirqxpFtjiC4wPInnymfQRftJ5FByY6nBUnvY4El8HrGBIuuX9d0F93Q0ewoO3YY1aE83KODthmRR+WpUXT3U4bqE+BjfMYrAwvCDPt+AT8H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772387649; c=relaxed/simple;
	bh=bPAn9Rh+LY66WaxVvbGmncrz/qFe2i1Yah6LbNjrXU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L71wly8zHcXTSyFUZz5Uh3gzeNuBd382c3WMHSnJxEX1E6tdZOkni8jAPU1aCqHrABFH59oW0jl9KpTZNTaXYZyG56vQfkVs0OTdcm4NtVWeKPylYuOUMRl3P3pjWiKqweNuVbXbUMSdAfLrSQ1Ktr1FgaAUiibDBw5T9BAd2Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYxWSfuv; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYxWSfuv"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bd801b4078so304776eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 09:54:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772387647; cv=none;
        d=google.com; s=arc-20240605;
        b=eoZjarHc/cZUVLDWp1AgXJRezb0LEYe+Pz/qhWMnBiMx++ps4L3BQJgzfg//psb/AQ
         LkvqXaDOws5irFi+ha55nqH4Poa28NLlzQbhU63Kz0+jZui72iSVKab4D25LqvEUikdj
         sD6ZxCsFGH0CMrmnyPQwbjh+Kn0EZycrOwr0MH4K4zJNZAHtUB9B0JhZ+WXN+fOzN448
         xnYUWpUz1ulWOqB8ik03PsizvYe+tNOYDsytjnWC5zheALjTxpBzFEeSrjyz06i7fTpy
         ZJfprX93X9uHFiLzAEI/JfdhEz9Qvq0KSH32MH1LvrSZvUGzZPykUV+H8kx+wlOm+1Jf
         UwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bPAn9Rh+LY66WaxVvbGmncrz/qFe2i1Yah6LbNjrXU0=;
        fh=jkHs5uABZmW90Pg7Iugg2Sj34Ga8FcMLKL2c0azz/SE=;
        b=Fko5jfZGlqkLQQuRJE1UPSwlr+xF6nKxx6zw5QGKOE6PtmxIyCtjAQtmmrRpFo4S6D
         Lm568QaRFzw4mJaqOoGfnVq2hYpoA/nZMHSxU7T1XrpJ/mdD037hK/iO280Ij3AI4zHH
         cW0ycyniQ32gAcWHLDvJyLUFKqhU0iq5bIAWbAR3PlMhuOzesqQKxuJpt66EQXCUqsot
         GSCbCdsrHGUnSmDoQyFH9nK+GKmH3A+ME0m+R/vYHchs/Bscl+QtlCZ0q/NVzbbjZRS+
         hKkz24KK8bB0lVv3P3RJ8JKnb/jGwEG15jMYwTCSHC11FEnqCEkcZucYOOjf2gxGen24
         37Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772387647; x=1772992447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPAn9Rh+LY66WaxVvbGmncrz/qFe2i1Yah6LbNjrXU0=;
        b=DYxWSfuvXa9biwraFm7LbX5qaZ4v5buHmML2d+voGXX42GKeUtmOvrZateWv/aaJhF
         BxlRg24EhKfDPh2Xn4ApK5eJH5HgzGG9SL6KavrwIabIHQ8HfvpQHEPL7RpXNTJg2IcA
         vsKyLPepFa71/hHn+c4p0X4s6rrGbyvmFqP3ii1HzCw9cjBUq8B+sRe3dHpK9+O5NEaX
         oB86xa3sxH7KW77n+uDrBtocCeMeQ/yqCHAqzO8W5OqFJHvUbEluVVupFqDREiB9lDCy
         325+hhlQ3itmVylgAwEDTMc1IqAM8weAzJQ7wx5LYJU8Pc6KycwRvMLQluYk01QRX6XQ
         zKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772387647; x=1772992447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPAn9Rh+LY66WaxVvbGmncrz/qFe2i1Yah6LbNjrXU0=;
        b=MV6bCW9ngBxL80sU/XQ/nFnxf6unqQ33oP7tcSUCSRxDNev04Wr1Pekl4QO1zq9i7x
         RoSjSbsnF7YEo+VSZorAEQxAa8kdbDOim/PgoCDYltxVYqY2vD3EJCy7KZAcr0NkW5pF
         kSrpNsmze9+Y57dS6UlXAJ+14K2GpwbTf4Y2qir+aXvStsJ12KAfQYqVThhacxjqSIMa
         CBDloMfPhnTv1TvtvTsK8Xf6pMmGe/x38jatGIQb+tfjz1GdoMiJRDFQXk9IoZEmbFD3
         De4TN838kYZt9428bW+eoKBqHO3pTjWWFbhyWPIZ8IXFIXTVqdRbsuheRXDyn5PQspvi
         JZLw==
X-Forwarded-Encrypted: i=1; AJvYcCUVxKR4FObNhos02MGxdge5zps3o6lPtQiIeU0oefUmP379ZmNiKHhF6h7t52ywuUqGElLnfM8xn/jWGFQuxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXICnfmYhJxnmzrFptAemuD6YEke8Yb2OTUaHxbMcgqP8BhSkB
	+WVZrBTgn4KwA9cBWgJAKjFoKRAQI73nXMaejS4+j8j+Lt+GWp8OZILlQobStpYGrT4W7oCXL+Z
	E4cL1q00fIBwQE0EFLJb/g7Ld7maSHPc=
X-Gm-Gg: ATEYQzweDOiiGngBj3fA/MwwHK4jexG8dD1OTZm9308xYOy4syyU9VRbm6FacLOigd6
	cazMbxczgnTDrSkjNq/AwgtbGkwZKiZhiDC3kdGnw90t/9Pbodz9mGnvKdWtMnXkdzQQ4HOcvcE
	QQjSjdk/nT1CPA//LhioPqJPOMIS5NoTUqSZ0BMHgeNI0OxnOXp7azlH7T784z+v+e0Y2t39qgt
	ixjOIzuJUUSgIyVjb3JRPFxCQsnmTYH7vbsXjpiaBNxrtKzDmVl3Tzh2LICVDgE7Gnui2+p3T+g
	IsXmDE51FpPPjQ/pRJx/OXSaWXjJLUbLnTuXWdysPDygbs6kEA/RrRWVkpi8XkrlLZuNTFxuvP1
	EDqfqSq9COlZ6VWLC8mmfHo7oiHDhSf18zoejYB8=
X-Received: by 2002:a05:7301:678f:b0:2be:6e6:e47a with SMTP id
 5a478bee46e88-2be06e6e93bmr364703eec.0.1772387647261; Sun, 01 Mar 2026
 09:54:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com> <DGIOJQC5HEAT.262OM2KS7C2HE@nvidia.com>
 <CANiq72mH=sCfO8+HnVp=m219b3drWZbqUWE=NJn=M3y4ng3qXA@mail.gmail.com>
 <edb5bd481d43fecdc626256579caee41@nvidia.com> <DGRH7Z2G22XR.LDEVDDGWC5B4@garyguo.net>
In-Reply-To: <DGRH7Z2G22XR.LDEVDDGWC5B4@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Mar 2026 18:53:55 +0100
X-Gm-Features: AaiRm51jQvROWAW3ojMm8D87Nrc7b0R1mimDYc3M6UKj3t0H_flEAYjqI64qoF4
Message-ID: <CANiq72mVUHV7j7WNHpqPcbQR_LvXmea2iOoY6A0wsuUr8FabiQ@mail.gmail.com>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
To: Gary Guo <gary@garyguo.net>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Dave Airlie <airlied@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 2:23=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I started to think that the way we document invariants is problematic. Fo=
r most
> of the types, the invariants mentioned does not make sense to end up in p=
ublic
> facing docs.

Yeah, it isn't ideal.

To give some context in case it helps, so far we said that the `#
Invariants` section is a special case where mentioning private fields
is OK-ish if needed/helpful for a reader, even if technically it may
not be "proper", i.e. leak details.

One reason was that sometimes private invariants may make the type
easier to understand, even if technically it is a private one. We also
discussed at some point splitting invariants into public and private
ones, and perhaps have `rustdoc` know about that and only render the
private ones when one toggles the private items rendering (runtime
toggle, which is another feature I requested -- if it is compile-time
as it is the normal flag, then reading the private docs becomes too
hard).

Another reason was to be able to have them use doc comments and get a
nice rendering output, and your suggestion of using a dummy field
would work for that. I like the fact that it makes one remember to
write the invariant "natively". On the other hand, it seems like
something we could somehow do with changes in tooling, i.e. in
`rustdoc` or Clippy (and perhaps it could be enforced rather than just
be a reminder).

Another bit was that sometimes the invariant, even if it applies to a
private field, the type may be exposing e.g. a copy of the field
through a method, and thus it is useful to know about the invariant
anyway. Those cases could/should "properly" be a guarantee on the
return value of that method, keeping the invariant private, though.

In short, the current approach makes it easy to write for everyone,
but it does have downsides and ideally we would have something better
now that everyone is accustomed to writing them.

Cheers,
Miguel
