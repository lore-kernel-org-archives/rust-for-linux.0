Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9AB1D12C
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Dec 2023 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1+WXwqL"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5d33574f64eso22562117b3.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Dec 2023 05:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702904801; x=1703509601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCuBCfBgMYToXXW74m7gHWaOMmARsp6IgVwn11KJVXo=;
        b=G1+WXwqLiNIhWW31rFI4oyk514ccGsNU4l8FYmeePY5TJ8w35OKKvhMQUAF8Zflwyt
         JW07jr4fqtrHU6AvKMioUTl8R5zKRoNu7NOcY6pEPC5qu10i3r7oPxxtzWbGA1mlCPP9
         nhTFftHNU3SMBe78uRIBIBRjQjRMExGW2/kyRGUGp9uwA2QS7f6mBR3ny2nXHxPki38i
         lWPYQ2Psif5JytIibjGqn/gTS/A/Ldhv7SL9mtGmDUdThnZ2yPvo5FEvEPZdVZp8boEc
         iP1bBHZA87CmgmYUf02C3RXJmKKb7r/rWYmaFBHHUakcBvdFOGsDWglBsU3ULG3OkEyy
         7jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702904801; x=1703509601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCuBCfBgMYToXXW74m7gHWaOMmARsp6IgVwn11KJVXo=;
        b=qbjFSzPGbJ12cgFjz/Yb5fI/po6QLzW65F+Ldk1j/hJg0DiIVAOQ1QG3vycJp4WgZv
         Stiwpatz/WDB9vfW1O/cKYoaWuer9qK4eRHH7JFxekrYilJJXFu/zEg8j4ucFGkU2eCf
         0X82pME/KE4ipWZMoHlv/27wACfY6RjV3vB8EKa6kUENmM+enNODhLZSMWWQsEuDvGND
         ymx6rg5lWTxPOsjML7iG25HOkaoe/aOmbhY0h0VRmHTebMfVwhFwrLoCs653huTpElg/
         g2ZRA4I9qiWL4NxSaL33twF75SVcujPyOgcbxqpbaDWajeNVeoxDPwXjfaoVafEBPK+U
         t71w==
X-Gm-Message-State: AOJu0Yx/NrNQoXs74+nB1rRHTR2NMcAxb6nQjgrd2VujY9K/W2AG7Dbm
	RZtVMbazZHH9xttJz3SDL1JdfuWMU9qH1VVWli4=
X-Google-Smtp-Source: AGHT+IEz7HQwati+minolMSf8diNPiChDA7O0FJTF+IQSYqVSokOi7H9bL/kfUB/WWE6h4KL8TINzio0n8FU9YuUV4Q=
X-Received: by 2002:a0d:eb44:0:b0:5e4:d89a:d6dd with SMTP id
 u65-20020a0deb44000000b005e4d89ad6ddmr3368096ywe.69.1702904800718; Mon, 18
 Dec 2023 05:06:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207084846.faset66xzuoyvdlg@vireshk-i7> <CANiq72=0m=h6v=SmgVnTs5sk3jm1oZ_TBhDXPq2Y41rCV4J5bw@mail.gmail.com>
 <CAK7LNARdj1yJv9pZ67Z7=Yi1GU0=bc7B0BnDSf=2L7OfpQdGKA@mail.gmail.com>
In-Reply-To: <CAK7LNARdj1yJv9pZ67Z7=Yi1GU0=bc7B0BnDSf=2L7OfpQdGKA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 Dec 2023 14:06:29 +0100
Message-ID: <CANiq72m=N5c94xcJMxx=5N=QYxS1zwGhAyA5e6aGoNbOnLkBLA@mail.gmail.com>
Subject: Re: [BUG] Rustup override doesn't work with O=<build dir>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Erik Schilling <erik.schilling@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 1:03=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Yup, this is also what I pointed out a long time ago [1].
>
> [1] https://github.com/Rust-for-Linux/linux/commit/f2238e7

I forgot about that one, sorry! It happened a couple days after v10
was sent (the one that got merged).

Cheers,
Miguel
