Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9087C3321B5
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 10:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053595; cv=none; b=Ee75K88uFRmxxRlsLOn2Hv9bdKvMEz142SOk6m3AFZJOqIDB8WdH/oPKRXsWzLxJhfk7Jgbev5rr7G1gPiClrQ7JTTc5G0ETfVHyfEStw5rb8FUFExyxWoSuy7NVFrl2yUO82bZTO6l1+ncwLVADHMyBGk/YExmPvmOIBqKEhLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053595; c=relaxed/simple;
	bh=F4LleOZVaW4yOFpKN5u7W3YsIwRCqWt47OlwAQo0nUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R43Kis3A96vcxrtZ9Kitsq1OIupnY2vQTgVVOvCKeVjSoGqycjY4Ge50by4PPpEIy0OKg0TkO/U4tRrOZp3yq0G/SMebYbg5ctCbjXCafxq2YrdaYsupBkxk1xrzrL4cbX4AP9/qT2Zlea6ej4OKu9y47hkAPc1VZ5jOcjPCgdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StiPgOA3; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StiPgOA3"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29efc031eddso1358965ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 02:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766053593; x=1766658393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABpitmj3d2sNhyIxS6xYKemUBz4/GR1gjv0gru6vHw4=;
        b=StiPgOA3RoUBwm32l32Z8BbXeg3lojvyxRZ8hsr2MxXszNa52gqGIIQMbqLza2NHsw
         KgHdhunfLDWnKs55lIK5jbLFvJWj8ps1hIImzzr9CWIvfnFwMrKChWYLcKt58icgqfS3
         4N/95V1/SKztqwfFRBnrnFub6dT0Pqi1zX3izusz2CnxiJYap5lsh7CdYo6cJI3O2QSS
         696/OXij6SvePDIXXevv7E513LqeRmfy55EiUBdtNK14cIiwJUN0rpUDGzT1DgDDQ67P
         xJJl+DSY+fYpyxuu8yzA4XgfWC6KBausTLgqI/Q2bmwTKYJv5sL59Zcrm1es2kHERSXX
         0dQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766053593; x=1766658393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ABpitmj3d2sNhyIxS6xYKemUBz4/GR1gjv0gru6vHw4=;
        b=NUWFNz2jg2HvLg8jrnrP2Vr9gL9Q3gk3y9gncuRQBsGI2bigk3x7J6HP2ogwS5j9Uo
         WBfds6/63jfV26YqKurHohrefy7BYr0k2o/X+bPuxRrgOAiJffuzFn4vkSvvaQ11BtSF
         Ar5wwLyJKbziw3E202bg3mqkU8Ggb4RZVkPFp++B64mga2WHrM9F/7CQfky0Oih7VRr7
         1W5DaC6rdDDibVeExfCPH0clG1AitOVYWO8IhmbrlUHQWo2HK9JHknQq04wcjspzRAeS
         4fGDEPRK/PoQdEFKVpnErQUArh6wCyIsP+ZEIRUiVVvoPJfUycqgYWoI+IgqaqhtakDO
         gVUg==
X-Forwarded-Encrypted: i=1; AJvYcCVkj0Rg9z1KpEj3fefJ8Rci5Bk+Q8NfnCdp1vHze0gz/05gRBNrYlb3xliVjXZ3OGxYeDjNjjAXPOfj45/ZNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn/aNUe4+ldYKA0GtJwk/LeZV4JgsdVQDRGIJxoBMkRnxqoDKb
	lkkg//8E6ZaFip0WCTony2U5dToL74xruVu0pAb4Dj/YE54AF7ONF/1uDUa3X1WUHJTsTviVjAd
	dZ5IcQcY/hGkEpMvM7KHoMtg2zd6PZLs=
X-Gm-Gg: AY/fxX7atRPLnmlfBYEAIU2fmcZT+g0YAQx1Kjg1BgP9ZfkncEydDqLOj2Uyzw6EMq4
	aL1MZJvggeYo1MhiD7nJMb14IslDEVpPmXKuaZrFmvXaETIfO/+AJxm/9OABm1dW7woLMJEXH8e
	OhHlk31FiNGoActyaLeW2ALizpAWNy8DF5DCDJmKpnZL8WWk7YEvCQ38oknGisZYJbIdFTvXwIQ
	aMlyAy9RoQRDPsHlUnOobKWW4MhIQx/tAso6ovxTdpMlevIOvrpUzxA6oNca+KiGwQoev7k4dhe
	FLxhTXAGQDKFg3et0p9CKLL7tRuUzRjmIEntgqzNSDHrDZPu60O7WzOadt3vQmtfuKTNINn1iUT
	c8Zu23hnyD2hOzA==
X-Google-Smtp-Source: AGHT+IFItTsDOp5cdOko6xJuNtHpwOY37eef8kCT+0QcfcrivdSjk719b/KoNVNdJsbCH7xGzV0hywjlpE6PH3K6Qkw=
X-Received: by 2002:a05:7300:d403:b0:2ab:ca55:89c9 with SMTP id
 5a478bee46e88-2b0505aca41mr765085eec.4.1766053592725; Thu, 18 Dec 2025
 02:26:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218-unpin-for-aref-v2-1-30d77129cbc6@google.com>
In-Reply-To: <20251218-unpin-for-aref-v2-1-30d77129cbc6@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Dec 2025 11:26:19 +0100
X-Gm-Features: AQt7F2oU_9Gd1a3m1hsJIjN_NuB0XnCYokop8XH7DYGcPebKd9VPFbANBfLzhZc
Message-ID: <CANiq72nijV5iqmFzWErKAuFMw7oPPP5heQoHR=YsUUYFuUU3Sg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: implement Unpin for ARef
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 9:25=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> +// Even if T is pinned, pointers to T can still move.

Boqun, if you pick this up, then please tweak this to:

    // Even if `T` is pinned, pointers to `T` can still move.

Otherwise, if you want me to pick it up, please let me know -- thanks!

Cheers,
Miguel
