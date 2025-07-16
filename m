Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D3E2F5314
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752669640; cv=none; b=B6wN9oJqfChRdYj+gsKeWqeyb1Iiriu0DOAbuwsgFftFnLdJMjymX5hrD5cJVp9v2fS+eL28zkhrnmCww3DG9ewkjBhZN3eTfmv4Sk0sD72Rd0XExzbPrQl2mbOOcru3Y2274VY8N/JoxFoppqs7o8sQPTX6BD+QKgu2BHFTN08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752669640; c=relaxed/simple;
	bh=yJr4g0KzrRJSChGm1bVypb6xONjDfG5HlaUgm3DVqYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCkK+D+rNq6uYffy8sHb58qrF74M+AwIiNVc+LWe4FFT5puTWR3JSyB0fF92pYqDIzIVrdqL6xP93UZWAyqeh9DQpO+RxJPp+IU0XjLhlAenzqfYFxbROKp2ILKyP0cfEqYmM640nZGwNtfxI9FWkaMPy/jmq38UstKtYRDS7gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMpgkUAx; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMpgkUAx"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-558f7fc9d7fso234656e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 05:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752669637; x=1753274437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJr4g0KzrRJSChGm1bVypb6xONjDfG5HlaUgm3DVqYo=;
        b=fMpgkUAxol4xPdBae9vvkq+jfYnknYY/2yCcA1J1jCEciBjx5tEKrfAdAY3qT0N67s
         1+9pAhefc1ZWVUuhtcwpelGZs5E2o0FZ8RLeOMUtui7M5kpGKvXDKPfQ4MhsOictXIAh
         lrwPJq7lurXVfZ3BWO5y5/Y6CRbEnIBjnYTDcYIkRWn5WSEpLumIY7xhEPuEAAKzYJ6N
         eV29atR/i6k8Xrd6pfJCFT0cLDsl0Mhfd64XMWDs3fkPC1CPczhXctbOOseIYJFJBMPJ
         jCBZgNbDN6WP1hgyL9Olqa6HINDB1Qt/lqcw3ILQ23tLMyaO4MX74erNA4/KsvIScJLx
         8fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752669637; x=1753274437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJr4g0KzrRJSChGm1bVypb6xONjDfG5HlaUgm3DVqYo=;
        b=APuqxXTcED+frTh763aBB2FciMnf7xQW8JJQZ9PsU6u8DWoh4jhQvr8TpW8/LLOjMD
         9CNAdFfK7Ila63HfQz7klHPabHGaa/ZI+WZCiT/FHB3pR3P+hKm+/7E8fxKTo0LB2RKl
         4yDsSX3XGlX3IFPwNQ1AQV1iUOQk+DRrq+PghLw070h/JV4QTeGhCt+GEcFEgy0OSH6q
         GAwbbioczR0hoITCEwpzGCUGAIbcJ57niTXJeEb2xKWb9ydWg2xGoUT8jPKhSR2FrlT6
         43l6Ix5mYgbIK2/nAAJe0u6BA4oDSUJE3Rit/T3jPwozcAEjj/0mxlnYexQ1Q3QLOeP9
         TIwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUOd4vOn4Fo1nWljBd8bL0XxMnoTqcHD7R2lCK8KI2GlfDa0jieb8jS5Eb0KRQ7h9OzLfeRjz970YA6ewHcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMgK//SDQun/Rn4pZHA8XQyzJTBG+vblHBw4Nt34FmaHjrNnSY
	LHPeJxm8tVJhj9pkjFKEq/827EzVHW2tv32XhtOGwvYT8vMVc+lIf/3z16PicZzJdQAANRFw5FH
	8rDPiVDwkrJ2wAZrkfB4fi3n+jlfDJOk=
X-Gm-Gg: ASbGnctZb1+wjgQ8gIKhRd4CvWAZcDbrdfEVXEsyT6KxFcIJMh90F2dNWwgVoDzA+cl
	n3g9as8o3+4c8JbbnU8+8A3u8L7zCmR3ch4mSWUDOEwV2+EL+lUq1dnn+tnXpL3y6k7fppj+kMP
	COcfp/ME1HC9IBnUSi4Afjy0wkfXe4AlyCzyI4ij6I/rOdlkoN+Yh16i4K32WTPNz+1SFOilAhS
	zIlqCYHrPg4t6Hg
X-Google-Smtp-Source: AGHT+IHEmncM5Gre1Xb9s1ocY97tCx+fg0uy/e8uuJplvTOfACJAwKG+8NRxr4jC6om2s0LhqZ78zOHBiagiTeonJQY=
X-Received: by 2002:a05:6512:24d2:b0:545:6f8:232a with SMTP id
 2adb3069b0e04-55a233a85a7mr255041e87.13.1752669636469; Wed, 16 Jul 2025
 05:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250713190244.143286-1-ritvikfoss@gmail.com> <20250714045418.4ajeuetnjor4nhau@vireshk-i7>
 <CANiq72nYqOGx7FEfMyp_8VnpZargzZ0uannbO9VMCk=kiEbd=g@mail.gmail.com>
 <20250715030618.ljqvviloypmfixfq@vireshk-i7> <CANiq72mKbv-PCv3WA4Mq79Yb2VtrLmxipA_NCaDFdF=JmXS3NA@mail.gmail.com>
 <20250716041512.vy26zef3mh4xnmio@vireshk-i7>
In-Reply-To: <20250716041512.vy26zef3mh4xnmio@vireshk-i7>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 16 Jul 2025 14:40:17 +0200
X-Gm-Features: Ac12FXya97YRFWRe4icmB5e1VK9L8E7DpbwRgWVMhlE7mbwEOylH1TeVKbS4-ic
Message-ID: <CANiq72=sFPU2XGHAANy_Mo48XFiPeAmvKxV-icDgbteT9dDP5A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: cpumask: Replace `MaybeUninit` and `mem::zeroed`
 with `Opaque` APIs
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Ritvik Gupta <ritvikfoss@gmail.com>, yury.norov@gmail.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 6:15=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> I will keep pushing the changes via the PM tree for now.

Ok, great, thanks -- please let me know if there is a renewed
discussion on that or if we can help somehow in the future.

Cheers,
Miguel
