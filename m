Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E04471253
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254621; cv=pass; b=ew2hgXo090+WMPO44leDBNWpDCm2TkfJrGa+7FB2yP3L1sSlRgQ1xJxo6WWVIx0SMuK0eP0Qm87hvnrrzKm3ZDPlIQWENztl0qKfEZ/4IpPLd4ueted26ua4QoUt2tW56W7nZhwZeSncUbzqeTXuIsZqvXld31ECqlzZQP5fVo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254621; c=relaxed/simple;
	bh=M7TiQIW8+cJsyynzgkeqfPBJpl/8j8qB8G1CWNyAP40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJdmqqueI02B4f0J6rXOOTEjqlC2eVttUKCSEYBC+UKMhGeOWCSepvcz2r/ItZVIVrqhaOaEijdpqcneSojS+MBcOCCh6OzHC+/z0bzo5p9aosG5MzQsy3Gm/MshIyDerrKMN8PQNCNZyHXUlNJxMByMfRRc+OUMDRMztRWEXxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=senALdi9; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="senALdi9"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1c9b7c1e4so737099a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 02:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788254618; cv=none;
        d=google.com; s=arc-20260327;
        b=gGJWA3dVYa2UebruwzTZRS3dbaWCvLtA+/2xhUPtR7poSGTk98vZmSxTpAmdiRGqot
         UHQZL+G70KqSvezeFFlo6qOLqmMua0x9WgvLtL+ElPaRGA/FdPQ/yOSgMF2MaLAcAR8v
         RGLYwiyVc99U65xxddurAvU96EeqSr50nOuvtdxkncbSTTjrx1rMdcIHaUlV7ZrcfDK4
         2S6QWWxOSnvwEYMRDJDbUePl+uqk7FGPc1j/z3RI4KmT59TQikSssSLfhFcSZ1wqZDU4
         cpMh2WbvWEufZzxXDTxLaHZbFlyI16Wj1xvkEK+wWRjV3i4xbXjuzgKnPxcJaCUlZvLV
         MkoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M7TiQIW8+cJsyynzgkeqfPBJpl/8j8qB8G1CWNyAP40=;
        fh=41srAxKjSstMoHyulTabA1uFymE4XkL0uuWzBtAmL1Q=;
        b=Q4eVuYM2tdf2YonnDPvG43mw85JSfAMQh26hEay9LpHIiCmIHnx+xnwZsebxmFsejo
         CBu9Pq/09la/7+zifU9BjyL7JP0HUEBsRqYs0ti4N8KhhBO1ls+lfNKjqpPIdpvXZgKF
         kMPqBSQWkdZupgpfTjTg3Jx1+L7vepp6bQQBwhak8xKW/XJ/wCo18svHevkKvZyO80d9
         CdvY/ruoTfKzW1fq6Jwy+MpM1p+8LKT+cFiZI9ztrxwhR9l3TFZHNNUjxXLd38jF/20z
         s4C1m70pSrCEW2oOztUGZRogZ3VRTEaOA95G3DqtTnJvepGqclt/MJ5FEHIleJfMX95K
         aLtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254618; x=1788859418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7TiQIW8+cJsyynzgkeqfPBJpl/8j8qB8G1CWNyAP40=;
        b=senALdi9UDiZ7KHDcZ5OeDSz+2y25j4HCX1m1YaJgn1RrfDCOR5G3jzqvQUWDQSqgK
         HctasnLiDhC8+WMbjV8JdfLzaNXRPNFMqfCheHiIR6LeDucxaYWqXZzL/UHzi/+ZliJ5
         fyXiOlKHA0ZVV/kO09gGzNjG3mbBSrWgA4H6Gcm+TaTtFIDKx6kz1gelLPWkFIi9/7lJ
         T13p8aRf1VtP8WRximdeXpH9zFE+HZfmaRRX4wdvggD6mVXBAMAuoFpwAILTojvoqUY+
         /pyXVXDdgYtopq4sUoZN98ZbXnBDaNF/lo5bgwt8xWZnp7nuioUwJmnsnCDiskoz8qbJ
         NJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254618; x=1788859418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7TiQIW8+cJsyynzgkeqfPBJpl/8j8qB8G1CWNyAP40=;
        b=iru6Do/T2V7dbcWjCNPcbekdUD9mS+xjBBoPI9pfjBy3FmKK7HQRKXrAm0rrtUE5l6
         ZQadoTNaIkWAgcT3cghwkbSZ0o/i4gqhTu98E9j+1dlZFWHvDd2Qt5lyGHN5u8LQT0cE
         ANTPueVBiMUBCSxcquVrjTaVBpBB0y/UHdsCw6tBodJosCePpz3LQSjelAbwL/gIaR6D
         +/sCWxN2uUzt9VlILxSOsRJCdfisVT7ywIjlHp36sGaayg/XAlXur7vdrUgPQ2yTQCHr
         VrqTHRmOMKgqXx2VAGS8Jd8Xiex2nQJ9onhBY5rfZGF7wU5Ox33te+c76+HzBJMM6316
         t9/A==
X-Forwarded-Encrypted: i=1; AHgh+RrTy/gtEtW+IUiQpAipjBL3psvmd8nXElCC5HiLhGtJ9/c+99Geoa4IwLAek/ewidFbiS1rok3pnot2AFfnWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nnNyojchv9inH55IP+iswZAxWISBcn2ysZC8vXQOilhcNb/m3T
	5osw3DiEaeEe11RLFDIYVf1L5uFsVcrPveY3H+MSFEUpDKtj6Qh2xRaBVDiAAt2aq+c1llY4Yi9
	UeGORflxr8yIft4YGC08kOQDdcSE/Rzk=
X-Gm-Gg: AR+sD107Z/oFJbaOeOBlmkgHKShtrDM++UALPpwsWBZo2x4+GlYTpsQkImhbSfifNeK
	YuDYtAVFlon5NqqqvCAdj65xirV10af3OU17tUR3j/l6RHPb+Ns0rJhdzSNSyyMMxN6SMvnlYdY
	SaK2T6V6+xwNSxPmf77cM8wQVNMZb+97DIXjCu4jzyTvDphmF1DRL6cFFo6qmxLB8yCq5Oh01IF
	o3WXK/hCANSPNVG4hyrxlGvIQhKSW5J7SUra4f+WYUYVCVaUL2jM82PG6qRBGUxCOd2YmniJu2C
	MLXb1or+BW+IAChBic0A/TuE+CIVWB+RzPY/LcKkyD3MC4rHYOsJZqDPVAGKhuozkDskTz079On
	CHBl6qxbNLR7f7HLP5iy2NvBbYatNzzYpuF2MZsHOK2T7Ovg0seA1EGm4J2f1
X-Received: by 2002:a17:902:ec82:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d74def63efmr287603465ad.2.1788254618249; Tue, 01 Sep 2026
 02:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831222857.1402608-1-nico.antinori.7@gmail.com> <apaDisOTtL5r5a3I@google.com>
In-Reply-To: <apaDisOTtL5r5a3I@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 11:23:25 +0200
X-Gm-Features: AcwNN1Wu5eB_orv1F9sI6JCQIgW-VSYn5Wsv7lEuNcyDT35EUe2cbQX4qrZM2lA
Message-ID: <CANiq72kZ7+fhEY3f-j-OkoYQexeBYpnNsrkDtFuovkPgBpn9zA@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: simplify Result<()> uses
To: Alice Ryhl <aliceryhl@google.com>
Cc: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Brigham Campbell <me@brighamcampbell.com>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Shuah Khan <skhan@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 9:49=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> I don't really think this matters, but shrug.

It is the style we have used since 2021, so it is for consistency, and
it preemptively cleans the `useless_default_generic_parameters` lint
Benno requested:

Link: https://github.com/rust-lang/rust-clippy/issues/14848
Link: https://github.com/rust-lang/rust-clippy/pull/16123

Most of the cases are in Binder at the moment, so this one cleans a
good % of them.

I hope that clarifies.

Cheers,
Miguel
