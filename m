Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8980932D7FA
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761660488; cv=none; b=qUYSHAPwfQ0tJNPLajy1JBKaKzWvsrNOusnzBr+ZCqlM+lcm4I/YAukuECoAODrf3gNf4AiuQiDCSadOzB2xSf5Q8XDspP8LAOeRNQKH0V2glUnSlIjiZ3pwC9xRtFZx8i5841rDZaaDQVTTHa15XxNckHC5SZ6wWQv09wwCdHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761660488; c=relaxed/simple;
	bh=fMF0uIkYb/9nO13E6JYrBSQ890ln/OCNesZioeraOmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LemDF+kRGli/JjRqrZKOAmuo2t3Ehf9ZoCcAezO8XXWjsLuRZnUWv5B/Hc41PulcWhR3+t69sfxftjG3EEHOOyhsGPoRM1WEDIr+ZMSF4BXvKUGDCR3gnL4yXQym+mKN6TLHDZbHhZ28oLGolv8skgoWVWYa73XDOPfzz2sdBcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xs+v+du9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xs+v+du9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-26808b24a00so7997135ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 07:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761660486; x=1762265286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUzXgE/2ulluXjiz3ioXFP7iSLQps3543DNUEOIb/jE=;
        b=Xs+v+du9ZOHdzUiAMuYwTh1/08eRl4NhuSxRLah9OOjGGsdTNBtE/h8NRZ5JMxPfIY
         sDQnwm6eGd+f/18L6254ORJyvHhGBtu8sJ+KW4AQ8+SduGskg6lnRgtuNlRN4730jYdK
         eRyom9Jwvyj7+lgs+iZ7UQQF7yzUYr+b2uam4HExNsw/0Le66D6YqFXPHTW0/fc+iikI
         TY4YWXRe3G10CrpaVzeeB165Ls9aHDxXWDVHMgDLDO0aOuVWrI0/HkzOTpi3ur3ES1ov
         HP0hgK8RyOy1UDBMKye+NLj28ADcEH4sx6PVIoDQ8vRAxQLShaef2Tn5c+6XrTARBb+C
         CYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761660486; x=1762265286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUzXgE/2ulluXjiz3ioXFP7iSLQps3543DNUEOIb/jE=;
        b=IOHSHvHIR8qm1sUitiSC9znNyM24fWcLCJ+JefHpaSExBZFLSVdFT+oldKZ+0cYKf1
         QbWQEuoqYcSjbM105oSJDRPWDZZfgyG43Xv8qWGKMrjSsLEej5dee0YPwekMJwV8tgpe
         pjHqpYbiBXcbS2qWDTldB5YY+hXez65Y+sTPvHUXEQXlIM9IyJUyQ8PY3mKLIa5LNnPl
         5MbU/KOX2JFFtOYbKNFJW8XiK4EIEErmwdHfLQplWQdoInfIjZZF/5UTPzbXmtIMoH0G
         MQ7cKwqdGNdGCRziXkgi7IpOkORKqx7MhOqqXdavnR1rYS6go3jMJba6iPqbFL6JZgNy
         phJg==
X-Forwarded-Encrypted: i=1; AJvYcCWpsfJRjrRG3HsdQwKX7mIA73ngj8LEss6Gg9qm4tco6jWQZcGoYxC49nVvitKHSBEsNf7ajwmMKlBeGS6qCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPILqMr545AAVsOY2t1VM0wn7uwtxv7AHhZ1res0n6YBYOc9hb
	MziaGjtSrYTV50M6b8yIiHAkVoc3qr0Cd8ayAFy1kFPtnV/UrOB0yNhWFoJps222txc1CPsqLNg
	1gZwrXLJhVJ62URt2KGsuAzmDN5aR2IE=
X-Gm-Gg: ASbGncvaC+CCbbR29/IHIDg+nSSIYn8usbBFMJ9mOviSl/eNq9J5YCC+cU3oV5xA75U
	Ci3oFcsFAFsRqVbd8ymol5+C5oI7tCJqpHhpADwHXtIu1IZ7ufhYTSrETBjnBo6tE9trVSQOfys
	dw2Q0DA5u0X225NjwPNSFbufhYd3ClTqpasoAgo58bJ4lX0KkboFFByVYvBA4XPYo3Uc9ZrjVYj
	bbxCm4RGeXsnJ6ofFlx16g9gFg9dTGHTNZngEd/kyZteksUOEy/tBUiWLnsXAIbJvEOeeZzKw2z
	/rKhcvp5FEgrwg+vq+r1GlZ9VppGtYGEBD3rQkqAeY4UyOFZOKIDVC+4L3UcyGnH8Ixza38kaSt
	UoO7hTlRMndWqXfVKBge84tsu
X-Google-Smtp-Source: AGHT+IFPYxm7Iv4twcBkyDxsullgCK2usL+8ZhZ6m8nxIuIYLEU/zp2pI4QxufDx3UwrpPIFp1nbPHFcQdYwIBQVGLg=
X-Received: by 2002:a17:902:f60b:b0:269:85aa:3776 with SMTP id
 d9443c01a7336-294cb529a2emr23559855ad.11.1761660485414; Tue, 28 Oct 2025
 07:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-6-dakr@kernel.org>
In-Reply-To: <20251022143158.64475-6-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Oct 2025 15:07:53 +0100
X-Gm-Features: AWmQ_blGIJf-tyLY251Px79mQs7BFIvZw2hoOs4uL1EAENTEQ7C2qSl70-fFndQ
Message-ID: <CANiq72nii94XPR_vkE6NBYmpfz=AJS+5gr0t3Hbc1ewdEZ_jeA@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] rust: uaccess: add UserSliceWriter::write_slice_file()
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, mmaurer@google.com, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 4:32=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> +    /// Writes raw data to this user pointer from a kernel buffer partia=
lly.

We use "user pointer" in a few places (including another of the added
ones), while "user slice" in others -- shouldn't we just use "user
slice"?

By the way, for new APIs with several arguments and potential paths
due to the `offset`, it wouldn't hurt to have an example (even if
build-only) with a couple asserts to show how the API behaves. But I
can create a good first issue for that if you prefer.

Similarly (another potential good first issue), should we use e.g.

    #[doc(alias =3D "simple_read_from_buffer")]`

?

Thanks!

Cheers,
Miguel
