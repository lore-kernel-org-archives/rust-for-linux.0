Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF5C3CD8B1
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169829; cv=pass; b=NftvwCZ7zxloj1u9E3I3WtzIlBZTWSbrnwjrucqlQL+ou9bQXxaJ9NqazdMNH25BnE3JwRyBtsOk8wAdGXNa6qfwNEdgbCQ5YZ1ywstRnCCIENdviDiQ+c7Y0iLxLgK2tz0LozgYJpeNAiGVISjHrrFKV1W1WdpqimlqaPVoRxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169829; c=relaxed/simple;
	bh=u4SOSYSRkobcgI6tnG1cxDItxRlmdsL0sG4nwFACfS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPoSwCMELjc+9HauFrBnDi08wSRqQozZk8Kc5+M5f1m3K2Gdu+EcaS4ArKMQFC3Cy9cWw43kp2UmBTKoD5Co9WkNsBANFcpmUfJQm3xkBmy2YaJnOHtGhXx6NXxKYCZj6ElVwiuo8o1xP7fOal/12Y7gLXGa9G77ZAnDSYjvDkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WX/PnElr; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WX/PnElr"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bd801b40dbso136360eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 12:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773169827; cv=none;
        d=google.com; s=arc-20240605;
        b=SmcHa2rkJcbRQ7CJHP7HD6u9dBr5J0T9st6/U0zcjRPeodsPLzgr0Rz0mok5f8Tllc
         TRsmaQyidNnA/jaVSlvmiGunD4DQoE1F5RGdVYc3GxY/2M6QDHKutRTSIVtXdWdb0/Jf
         wyW6qHehIkcYY9C3UV9F8ylis/fSDsv7ZrxhLe7g4SFzpW/2N+yoGzDre9p2aMCml5Z7
         PVXZZO+3+uVQ0It2iwcvDV+QFa/UjYVeiinIEoIi8ICQRK2hhz/mU3kdlo+oBnmswGfs
         XjTGOhPFZ/hL8TsG6CJCHwLcIsCfFP0SSwfTRGQW2yKhp2zMqGnWOBOligCKvicLjjYz
         CUtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EhfooXBJB3ZFaCtfLacaIpGHe5+WFgW3wuVVYUoToLw=;
        fh=HfbYk3VovJDiiy6mjUMJUKaJPJ7flUtOcCS6etDrEng=;
        b=lMoPiVPb3JgN+v6LuNGzCVNfQY1Et0uuT9yuJUBGkR1oov5L2bhzTE4xbbxNSaSlE4
         GPAZUx3tQ3dqEUJXzhjsZFIzRCA/cvvGkjD+PYVo5fHxtwMpKOioApZTSYOddBHgqKcj
         CXcmleYdR3/akG19aaFyiy4679cewe+z2C5ZRJfcHnc6yNvucprToX332Z28JYuthH6q
         ijIPbvXlOKVzIk5jzKBztfbUvkcQ2hmaFMWqYebwgZjaacuq7vK6gNPnWbQRHhnxnGUi
         /BPxju3SdlNMqOklX5pdQ66WV1BFfR/WMWRXikp/x3t+wRMMGeszsRusPGHhr+BLndkY
         Ecbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773169827; x=1773774627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhfooXBJB3ZFaCtfLacaIpGHe5+WFgW3wuVVYUoToLw=;
        b=WX/PnElrkE3uVgtJCYmWPcd1YC8KiXypsh+AoeGRCRYLuNP9NzLr3SOLxowFsLUFsx
         SepnjnWkXmzKI2oX586thW6YZkJZsU/bW2ekP292MrcSsrFwfOKP4Tgdxm29I2omPc5+
         c0BOK61g/xxEGZF12fYNHcawXggbvZ8fpG2ljrByHnQABBO+NQ9yP3Tpxyiacm2Cj13r
         nSNeI28dquKNX2M/IIWWRWweFrmbMLwZdWA5p8tnGiBh0QNieIEhvBiYME7Fosfn1shw
         MLnUz9nxRkD3kfM1z32NiDQdlF7zo0MZwwexa5iqqUNU/b3YwtNQRP6+vaD9V8/dKLJK
         84Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773169827; x=1773774627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EhfooXBJB3ZFaCtfLacaIpGHe5+WFgW3wuVVYUoToLw=;
        b=vuejp7otOZFLheFhfscnS7jgnhw5EImvrxe/lQ/9ZDnILoMuqQDrM+ENfOQFNpYKNL
         xngqEu2gJtZdu7cKVDp4L7cDvgXSPy6q/acGkC2P135OQUdqZ5Z5qhYTBqWhInDiR3Ka
         LO2eqoiL6V6GJs0My51Rnjb7OFLBVyrIqI+XMh6AToaT0thCTZgOWmJtvmBzVZwnH/4T
         AnojsTqC+E37OnFE+r7Sw7W+zMj19IPAjrwSierFiQ1spnALhvL0CZ5uRVttss0rGPfO
         Xyyiifb3qk6swOIOeOVRhw1rXpve753/+3xWlZ+Sj5oJU9Z9vC49/YANUvs2rhUhHxa1
         lyzg==
X-Forwarded-Encrypted: i=1; AJvYcCX/6QGN0cKbiOyIf+UQ1hvyMK0CAlJ4435y9YqRo5FX9zAoUrxnAhqnR2PWniUaoAsUYnh7FW2Mb1dR2GMe7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMuNzqycIi7NUMlHFeJWxg6lhny9rl52CcX4rt+QJJ00o0oJ58
	604v+Jj1fZhrCi5UthOwD9yrXlSy5yaxgX8D/DMdUCYA5H36cFhNVchy2+oqMGwUIvie5bNDmL7
	nYYoJSrKQPQqQequF0uYiW+wG1WftFVI=
X-Gm-Gg: ATEYQzw0y7sAEzb7IsIKaQzpz6kb1SsCi9B4ZtDMFTvQAXbdXQpixKCGbP6fKXFLTDk
	ePS3fU11viva58gpRnS+ekSKDRmxMnr8hY/tx+QxYyC1F2gyEKTGsn8FGquRIJHv/tAliQnMKCN
	TRr2f21a9BKb986A0XxDTmYVTNzyN54cJuzHXhSFp100jxhrtrazTyLj641tJ8MtVQ9ZRkoW9OR
	XhQpx6T2l0ISPLd1astOchNbP3+gRLaoV93hBAGIi8uC1QyZcjs1scrNZ5rk+lbYuEZKV8s/1RA
	cJofRGE7kF/xWK3a+Z5BsSf/RfBJdGOiBPKjRDDKfsHIL2+srveXqpEAwEP+htyEeoRyLvMM1C6
	hSB84v6J1nlf6IvwuWmpEzqc=
X-Received: by 2002:a05:7300:d51b:b0:2be:2b8a:9523 with SMTP id
 5a478bee46e88-2be4dd701camr3074855eec.0.1773169827177; Tue, 10 Mar 2026
 12:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com> <20260310-binder-crate-name-v2-2-0f7c97900d36@google.com>
In-Reply-To: <20260310-binder-crate-name-v2-2-0f7c97900d36@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 20:10:14 +0100
X-Gm-Features: AaiRm5115GZxyEEfPZfoYM6-RoPLVSwVPmOFZu_fwEORZG-eXpl6cSVm6btXalA
Message-ID: <CANiq72kPABmGHwRmAah35yvR4Rt8xLzSEhLJMOojGQt42y_QjQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust_binder: override crate name to rust_binder
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 3:53=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
>  // Copyright (C) 2025 Google LLC.
>
> +#![crate_name =3D "rust_binder"]
>  //! Binder -- the Android IPC mechanism.
> +
>  #![recursion_limit =3D "256"]
>  #![allow(
>      clippy::as_underscore,

So the crate name is a special crate attribute (together with
`crate_type, it is forbidden inside `cfg_attr`), so I think it makes
in a sense to put it between the SPDX/copyright block and the crate
docs. I also think you didn't add a newline to put it closer to the
title of the docs, as if it were a title of its own.

On the other hand, it is a crate attribute nevertheless, so putting it
together with the rest looks a bit more consistent, and as a title the
English one is probably the best one to see first anyway:

    //! Binder -- the Android IPC mechanism.

    #![crate_name =3D "rust_binder"]
    #![recursion_limit =3D "256"]

Hopefully the crate names are still close to the file names (and I
would really not want people to abuse this...).

Cheers,
Miguel
