Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD43A31B819
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760523640; cv=none; b=GzAsH5B3fUYwQjGO7GqfvmwntvnInU7wbTdzCG5cDIC5XuE7IK0UAcJuvLEEfrKpb3Y+7L/agDIsPSoxX+jINRGj+OMEIrkpcIboIXtW5r6DhEyDD6gRXaMq7QEjYQw9WVwrb47bsjo6u2Dy7htOtlbodHMSbbdjCu+DgerTdv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760523640; c=relaxed/simple;
	bh=syYNPVw3n/GpSLvcv0QAJA46VNrVDvZJVpL7ER+csm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rc+4YOQ3tp27ucrZBQN9NmUf8dRNQ1FYQf7WTew0j4FkG3Fg/fQvdRLEmBL/W9yZY1VklUJc8gahO6zcPX/vlvxWHlMN+gctH6CW/aoOnhXEu02Oa6hgplFKy6u0oIZgLSOexOyMt71/ImnEOCm1zdwdjb7jmXkXkGTSzUzdUDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffPhRrF8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffPhRrF8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-26987b80720so14346865ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 03:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760523638; x=1761128438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syYNPVw3n/GpSLvcv0QAJA46VNrVDvZJVpL7ER+csm0=;
        b=ffPhRrF8dz1vnrtvM1Mf5GlCLZEwKlIXh1m7o8X1EM56P/4UEJBo2+EeJWmE1XVEDu
         7nNdRfgE4ylIYqDfcA/t950lNeyhLUMj1AQCbN34DQrtMGsKqFJIaQOLG6ydPwMMqVcT
         cb/QvdTmSrer0Qcdv5cc3elm7Cm+wG9JzvPDhWbct25UDAj7h7ShDBACC1fd05FVppQH
         CLW40zOV3smiYRfLIpJNYsGsxKAYWxdMKJq00EM0N2CUF25duw5SFAASShEScSksFeo3
         WgXKistovQHqvNnS9Zbfy0g/1HsT9nmy9mpienHkJGGF0NlUPFYJlnXg5Ap1vyIvK/vX
         +HmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760523638; x=1761128438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syYNPVw3n/GpSLvcv0QAJA46VNrVDvZJVpL7ER+csm0=;
        b=sWhBbmkufexabt47uRF/8zDAIBAG4q9Z4hZ1+6yVGBQMblI1t+U6ffTHm0Mclt+ZWc
         1XAhmSg/GQCRTD918b0en29MPUmjkdHLPUegS3R53EUD7fT9D8l9Cj9U7+Lolub2dEVD
         MIT0lDE0PAqaHhFu+z3effg9qwpy4K71tlPEQfOchuW82kStvStz9DuQThFNNleworjY
         cFMeQUhyCKN4n63JVcfp6aDojPEE5ZfL3q4EVxS6yP9pjA3TvHiLijh//P4fUc/63rQq
         vbsNGPFx35Dw4RFZSV7rDCE76NpxF6543nAZoXoTVXXwQiPukxf+RwBhXrs/3RnsbwyJ
         S/XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+OG7ON7U9iaelR9YzVDZXKNeD31lwXt0d3ZEnI8pCaHS4vMZquukx6QLP9H+zWN4f5UQfiwaa8CVnkiZMFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeK4xY9QzGAS1XlWFU1rLpvr2scVV5UdeqMcBHLtVfRA9XfWo0
	YYIo+JAvOK4fTMiE61BMn9FVZrfj3C3pjbGFYXxx6fn7wXSKdOypAdglR96YaNPAhkGegL0BdrF
	lhT5Lxw8+TACS0KaSJuW2ieyAAvaN/RQ=
X-Gm-Gg: ASbGncsmEEUCrTsMCE7SiLHYnW04gqV+7iCUEJFYwbByeHCeBJX08zkMOpD6j++ZiHi
	duBUudJht1EqaRlw908YLpsBTVBS6z6xE3uzdZQML6/A1dSuq8ZC2qDZ0lRe9QTH7pIsiIIX+0R
	hVkD3vwaOk/Hmh52YDi/WgQD7fQKBM9otAa7k1awK7y80bevG97BzyBV79y+EQkLh6arnO54TDm
	3aqbmnCnjKasqX8ZfkMjJJSZql4WVTyWO2/VS2oAWUc++kRFrS7Fe1eqntcEh/gWVJc6J725tCW
	p7UgD3z0Rxyw4v6Fk33AqIC4RieE29ClkwtrWDoplory5ZUv6spPFFeRvEWS95v4SQBZpDWOAPi
	wy2FmO8CC4EI+EQ==
X-Google-Smtp-Source: AGHT+IEuA+7KQXjMigiCtp80sJMmgdGJdPwk4cX3Jo5f+x0gzm6yiVWTi0fYh0LQRKdjtlu+kVhR87VUjMTsN2L8qLE=
X-Received: by 2002:a17:902:d2c6:b0:27e:eb9b:b80f with SMTP id
 d9443c01a7336-29027215f8bmr182642905ad.2.1760523637786; Wed, 15 Oct 2025
 03:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015022037.14535-2-xry111@xry111.site>
In-Reply-To: <20251015022037.14535-2-xry111@xry111.site>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Oct 2025 12:20:24 +0200
X-Gm-Features: AS18NWCGIGHAWk8P2w_fEJ0NHY0-lJvrQGuVtdn-YvHXyfUVHV1SbvXdcT-w3hE
Message-ID: <CANiq72mvZy+X2ko_sxVCn-2cnsR29boAzPDrYn=S-Tp0xSvvHw@mail.gmail.com>
Subject: Re: [PATCH] rust: Add -fno-isolate-erroneous-paths-dereference to bindgen_skip_c_flags
To: Xi Ruoyao <xry111@xry111.site>
Cc: Nathan Chancellor <nathan@kernel.org>, loongarch@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	"open list:RUST" <rust-for-linux@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 4:21=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> It's used to work around an objtool issue since commit abb2a5572264
> ("LoongArch: Add cflag -fno-isolate-erroneous-paths-dereference"), but
> it's then passed to bindgen and cause an error because Clang does not
> have this option.
>
> Fixes: abb2a5572264 ("LoongArch: Add cflag -fno-isolate-erroneous-paths-d=
ereference")
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>

Seems OK -- if you are taking it through LoongArch:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
