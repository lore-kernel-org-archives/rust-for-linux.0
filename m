Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193503B27E3
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 19:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685624; cv=pass; b=lt23IV3pJWdaQK/uuQps7dxrg7tFr329ycT5ENaHH3CbEl1kR2tn6Cp14b9wacd91UIK02n69u34mvcb2cLw3HyQy1YJkp2Ozn4sGH8u0nOiSY7HUcnPZFcyODXckEFYAHmvf7hZdL6ABF2BGYyD0UWU5c0Y4Mgy0rDEzthp3Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685624; c=relaxed/simple;
	bh=xkLEoNeBbWtVSN7j1O8Zov7Y8VwgQr+BliodPWhjLJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BoO8x8eFUksctJ8LkikOx5Ae4hNeR9ZEq9ZbR5pTAvnvdEsSGwvo8zNoK62FJAfnwtCd192qOs1x8kjY4b+MLNwrgbW4dNa5HzixoJy9tBpZ1f/DEe5sJo4o1NW88aBaDGN5eRbVpP3JtAfitOUBt0mM0/V6lV2yH4673OMisHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goAYzks+; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goAYzks+"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf110997efso316015ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 12:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787685622; cv=none;
        d=google.com; s=arc-20260327;
        b=goxrPtZmnpj7rBee+h3hSdGC++dqKuT6H1RAQEyH4KlzqzPE/+nQEqBqr+GIzilJG0
         AnqdgV0RrcV0xeDah4zXAox5khMfYk7AosS/p16fwQl/SSyNMHzKdeUgRuKD0x7aQisV
         KJh5a/B7hYlYyuWigOJGcc4gvIVZr/yEU8kF7I0FCa6/xOukLLhgTUyle+3R4A3jE4Ku
         i11+lYhLObr+SzVCpOt4zDo5iTfM2nt4hJ4C6prs4bKKWGwUU3j84rg9Bvwzr0Oy1ISb
         qNxKwzmcADOPvr7ybCMGuKsRglonLMGwYjCfV75N2OEANwbm1IRqYQBRxU09isO0SQi+
         JMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xkLEoNeBbWtVSN7j1O8Zov7Y8VwgQr+BliodPWhjLJ8=;
        fh=k+e1lZfeT5hwD/eEa2F6k/ulTePSQM9iz+yrG6BhaTM=;
        b=aRnRvhyLBvyLBptkS+wNccRxg4TfCp2LDJoXNIBLomb138P5iY2kk5Je12uZmjZda6
         96T32wcg9C17VwY9rX548PvWHuoxuFdANsoUzh42/VlZ3g4AoxjJoXN80k/ur0ms2PS9
         7HHoBKSs6zZZz8x8Vh/Ztm4t3YGoq1NoA8nFMOuL3WIcGdgOImRhpsR3OmfnHcS2mr6E
         87najrOc+sISpx4Ipqm02Gumey/45wtwcZUDaxfP04sBfP0QzhPIxXt6eUWW3wPjjHwE
         TcYI2R8wI7Kxh8foODLM+Fe6XtBh6Nt7oaSO/twH4WtPlVbhHKfHE/gHhtBJcXwFs8MX
         2kpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787685622; x=1788290422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xkLEoNeBbWtVSN7j1O8Zov7Y8VwgQr+BliodPWhjLJ8=;
        b=goAYzks+5Ki/4s07v2M+O7v6WQmZ5EJ0Lp2+u/FSiYVOLU+wSkX+u4pLsIv/hjYvw+
         M/yIhnzR+m8L9BL2X3te0hIHujnWS548glRPRayxu5+U/QHxuC8ytCb0piyB7g7zQL0g
         whMNNf5cQYvWT6w6xwfW10zrHpTzy8IXncUkr1u2tgGDFnDCdPF9UsBmJjT/blGxz6rh
         lnkqX4HIN3EotfUjuaFLjDdwxHhBgwC79MLhpkJuC6R+cdzHzlgS7m/6W6/klpFoAVVJ
         R41H83gjaFSsD9oPEz1HovKSpgw8/DCZElKQipOR4z4lUTW46S5HyGppklvS8txZY75J
         rXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685622; x=1788290422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkLEoNeBbWtVSN7j1O8Zov7Y8VwgQr+BliodPWhjLJ8=;
        b=owxZ2RmtkiFGWDLBKuHRLk9B+YIinseVs4gwDZnFHwpN56Ucu4k0ZW3KHMSOO13u0k
         e9CqaVCjuziOANiOlGcDK0Rc7u9F/d374QMUi2W2Qf8AT82j9pNzFBnXEPmsWUvSe9SV
         56Uu0CZEGYXssCztX7n+LLFkXFGq5g/+fHF1Hackq9xZ/XGgifEAY19/RPnF9Jdf9wA9
         fU2YZgq6+xIGS/K+O/tdUlSoJeezUK242VQHL7vXDmpBJtDwIBvk+goRzgcQn1x7ilQu
         Bqzv5HYpSJ4IPbzhfDtDwySezP0ikJeyVVfAboQTotc0LuvvM6PNDwrqIoMJO/CrL7c0
         0hkg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4qZSMNy9pcQkcSG49aW8FfBOV6J9VgvLryCWmWFjww2GKD9ua1qwYllocNoPwPu4QeBHNUqg7kJsRgdMfmw==@vger.kernel.org
X-Gm-Message-State: AFuF++lMGnA8bWaSJVsAzRr9JoUOHuujPiTOR6SPiK374qPOrl1AN++y
	zYm4vnx5KRkuAn+ac1lm/l+m7mjwB9KM4t43eRTDpEWxofz3FJ5nqoOQeeNErC26EpROIEcDsPC
	TpsMYuAYyRXrY830drj9sta0ggRZU5Qs=
X-Gm-Gg: AR+sD10ilRnLkVaaPXr5IruUj5HfMwmFrWVrth9l2Ur84lpVgbX+BIR8ZjMKj5mQaxP
	9lE5o1mXJPu/7upyPhbs1reqBlUV6fVTcxE6p/qQpfEwygyQCvQWGV4TeTDeAEb8h3u419+PZzO
	/nw/+TuV7XGulqqSRt/qZQMop7AIv8xdbbJh8VkDLpf6PzT2GkOW/DOHPYKpvxQtFtt8Wf9vjAz
	0XD3AEE01ygKRaV8Auo+IDUWim2N2VJgTkvcynhr/YMB6w7wQd7cuxs33qQtNe5CglYWOuYSoQl
	moR+VQqqAuf9kx1RysP1noEtoIOi0OQO1sSQaN+hhWltclM5LOaeQqiZ5gxbQM7XZYVIs1hjMG5
	OSGiZv9FZF0ZzSYMYzLsaJ4KTGvBqhAPmfJSevtttQtGFMWhTNkuvY92xS9dxNmqB2nv1xxk=
X-Received: by 2002:a17:902:f789:b0:2d5:cbd3:8eb1 with SMTP id
 d9443c01a7336-2d707bdebccmr3413445ad.3.1787685622061; Tue, 25 Aug 2026
 12:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
 <20260820-gb-uart-transport-v1-3-282da14ab7b7@beagleboard.org>
 <20260821030018.GA1961@sol> <93977935-ea60-48de-9d13-23454e038c18@beagleboard.org>
 <20260825175625.GA3673306@google.com>
In-Reply-To: <20260825175625.GA3673306@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Aug 2026 21:20:08 +0200
X-Gm-Features: AcwNN1X5Bqs8KXrNiEWoe8c0uoNxGkwdgVcb-4DayQsyE-o_UymlYyy142l22eU
Message-ID: <CANiq72=uUR4Vo9W55Kq6tQjc+6Q4_+wiWhCo-VLdkvg6PJeoAw@mail.gmail.com>
Subject: Re: [PATCH 3/7] rust: crc_ccitt: add CRC-CCITT abstraction
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, 
	robertcnelson@gmail.com, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Ard Biesheuvel <ardb@kernel.org>, Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, greybus-dev@lists.linaro.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 7:56=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> kconfig options usually should be in the same directory as the code they
> control.

The code is conceptually part of the subsystem, and will eventually be
moved to their directory when it is split into several crates -- that
is why we have put the Kconfig options in the subsystems they belong
to.

I hope that clarifies.

Cheers,
Miguel
