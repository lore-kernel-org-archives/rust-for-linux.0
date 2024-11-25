Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC73F376E0
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732535777; cv=none; b=BGFHmTw6Z9lFYx9VTKdg4eTszEGWJCTnPpG4tX4GPK/lLFDtcYl1i8wRqJT4rffSJZ9NHcqr4sYDaUp887CsP5icV19yLu4FTnWXgyYtTi955hWLtwON/K2lPzfkd6KWmXDQtD4BnVgKxDwB4Hrhbg3w+MwHkmwqNzvOO8ExW2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732535777; c=relaxed/simple;
	bh=l8fQ7w0pgptlEKX4UN7oxdvUs00sgqXyvV3Zyo/ogGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgrlQx6lpNns1c4ZHG1DAzMDt1oBYbMpq9dCjPH1EEhYY45tF6UUvzWT98B0kvFMR0iTfk/YHBeJ7lWLo0QvM7xVIpoWN5fG96dBM9ZaZMYBUeoQTaS6XPB3fYp4IgRXPsGR1tJB9RIi9ImTXmi1xPJ9SHXLAIeAFv5q7alTAE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xa43a0Sw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xa43a0Sw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so38156535e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 03:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732535774; x=1733140574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8fQ7w0pgptlEKX4UN7oxdvUs00sgqXyvV3Zyo/ogGM=;
        b=Xa43a0SwaFDWnwyzadUiravzhJigu9TfqwelPHqn28yLl6pZzbjXnYYSaF+3BYspZ3
         kPIQR0MNL+lw+RyjtUQta6I2/B2j4XXLMzSN8gwRbYTplSLIoS4vkKCT4erTCrfZBRke
         quviivRJDTqrScQfw51vhzIdf/6m4iyQvycX1P/PUO6EfTFLdEt+4LVBrCpjAOGxttcB
         hY6vo65cKs/0/d95YDLbSXEhJOky5PuHnb9HhoV14ZUe489w+NakyVnQOJkwDVsDWcsa
         tZ+44RcfiEufJZuv6uFd/G30DXiQBwZd8Lz16maYMT/FT8Yjpz6JudpUFLnLrMT944O6
         DehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732535774; x=1733140574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8fQ7w0pgptlEKX4UN7oxdvUs00sgqXyvV3Zyo/ogGM=;
        b=HBcCKbipgCoZNaWI35C1opJjbRKxfP42TzzJXiG/ltLf4Il/NiD4RgtdYUS0kgogoM
         0mqcK/szdIFYvftp1UeP6sP3JqHAKgQxlO+jibkvnkvmbrcmdiwV5UI4rhrIE8lcfy0n
         JK83jwNat64aFgSLSOoMf9ewOSceWGYQwY31v9XSuHtdJUvSJ985T99HML3N6kHcH4V+
         duBVncGzI1C0522Lmn76A4zv5qx7L56092/fL8SBZcxWKO/80QHMoNQxPt4AMSRsSCwH
         BF8NkaYcmoX9BZU20lNYd1VwdHx7RoQkNkOcBblFBnx33oxaEtN/SD1/jDERSDOLtUsG
         c0pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKs9Lz3eV+Wr1ej4eS23W3jRuEqe5MRk1oTgBqUj5WmxH6xfLewPs6XynCQRHPm9wR00zg5ToHs4g6mEqUrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7m7HIRk7PC4JR/78ITxgtsUGFtLwSmKhXLLu3swVyqGa04Rtm
	v47irRI8K0pnl4ZsM14zlmAQsIaoKiBGL/yWwgcJ2FRenkCOik7nrWf4Fg6ClRodxAQ2HexuOmX
	nQrR2HQZ8zZNUYpe4Af3FCRmaocIrSKhquPPq
X-Gm-Gg: ASbGnctdc/PVqvmsSfHXjS7Q5KWk04y0NOVt2Evhoib7EK2mBFLQEh0W9NsIOI/SjA2
	E1Ay8xdxW5RJSYGMZyEUoip6iC6YO494RxUqjLGTS2XQ34ssEcvOQXDcelGdTgA==
X-Google-Smtp-Source: AGHT+IHShktiVBqEkYUl08V2IqflAua+mPQ5UnJc50VeElHbj/vy18WOI9C/r3GvAqWqD+1PigrDRRK3KT+eu/tvlAg=
X-Received: by 2002:a05:600c:3aca:b0:431:680e:95ff with SMTP id
 5b1f17b1804b1-433ce425617mr111296395e9.9.1732535772574; Mon, 25 Nov 2024
 03:56:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <SI2PR03MB53376E75F76635C395C0DDE9A42E2@SI2PR03MB5337.apcprd03.prod.outlook.com>
In-Reply-To: <SI2PR03MB53376E75F76635C395C0DDE9A42E2@SI2PR03MB5337.apcprd03.prod.outlook.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Nov 2024 12:56:00 +0100
Message-ID: <CAH5fLgjawiOdFAxcDbLdj-Ajwfb-enRmTBRWQNDMK79k7B6Cmg@mail.gmail.com>
Subject: Re: KCOV and KASAN support for Rust in linux kernel
To: Chu Yifei <yifeichu24@gmail.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"wedsonaf@gmail.com" <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 12:52=E2=80=AFPM Chu Yifei <yifeichu24@gmail.com> w=
rote:
>
> Dear Rust for Linux maintainers and community members,
> I am currently exploring the development and use of Rust within the Linux=
 Kernel, particularly regarding support for debugging and code coverage too=
ls. I would like to ask whether the following features are currently suppor=
ted for Rust code in the kernel:
>
> KCOV: Can Rust code in the kernel be captured and reported by the coverag=
e tool KCOV?
> KASAN: Is Rust code in the kernel correctly detected and analyzed by Kern=
el Address Sanitizer (KASAN)?
>
> Thank you for your contributions to the Rust for Linux project. I look fo=
rward to your response!
> Best regards

Dear Chu Yifei,

Yes, they are supported. However, they require a recent toolchain.
Please see these links for details on the required versions:

https://github.com/torvalds/linux/blob/v6.12/arch/Kconfig#L854-L866
https://github.com/torvalds/linux/commit/93e34a0b5c0e79ce765f01fd10f7817863=
fba23d

Alice
