Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B863BE15D
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437400; cv=pass; b=Gp/aHcq2lV19aavK1qqUsj66bYLPXUeKsJJSAns5EbLxt6IkS5qerMRKURkg3/6UEDY6EQDURmcbFBtjomnbK4H4A96g8hMYN3Ok2Sz2zuRpTXTf3XZggbYULGh2ZJkI+BcdbJaktk0siwnDwm24k5yByjyOxH5ZfnavdXr4bJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437400; c=relaxed/simple;
	bh=T7Jx1VqOLa87uQJh2pqgo4lodS2jkmtByblmgj/f2os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffirQMwENtQgVp+DngDlf2HG9IBSrlK2qdkBk5tS43W44FbN9yFfnCigCUSfImcYJqwGm02hmWSE3hp+7n7qzp3uQEtP+vU49XIhHaamIFiIsBcvBBYKYXtIbzqEw/9oCrh8EZZS5GQfIHR3XtjfdPAQLlgPRvKfzB2NIdSsrXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLvJ54Kg; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLvJ54Kg"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12a77005d69so199447c88.1
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 04:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774437399; cv=none;
        d=google.com; s=arc-20240605;
        b=cBatPyo1qVnHwEeX8pmng85VjbtsbiqDYCxfQOzwKrioWoehHQx3xontz6ORctnwfJ
         n6ZQ2MjORAWrdNMG4b72AUE60DhjejKv2+JB4uJ7d/4ctsO9ymQS1ivrTz9eEEYAOotA
         0oacXibL8xxvG1UpxN+BJORZilgUsjpVIOPDHtC5w5ZvWZ0CIyNjAlyjwXrCmo4lP7PU
         9gk+X9XU5tVdfSMlGia/tblnoc7dAtxNWCzuwtBL+lmNcBPfxWkJslvpJWwPf5Fbk6CF
         /wcIw6y3P6cV0rAirPMDXCqwrwtxTKwdDAQOEMmLzdjnm5GS6++hkfL8dCx9KR3WbKiF
         hjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mqlLwhVSAcK5ME+6Vz5qSayjD/9fr74QDU16vKuu9J4=;
        fh=hIODRquSlvTGx5dmfcJ9/j/64PPiUv5+KI3k9e+wEdM=;
        b=G6HKV7XaNiXnDhsco1IUAN7ZcbUXlT8GCmC2w67pJm0YvvWM8y1tCL4tAwKt55a+bW
         UgddGd9wOYDHxUckiPzo62bjybOx0h3nKPnYy5qOmsW45JSSUKZzyb3a5NbxjnyuqvuT
         fR0bUVkWL40szOv5KcmhXDpTlchIQBATjWRlD/xedmH9Vincyp5m8JfhYWBi2IweoA30
         sbDGT2/PruXtaNETg9Me4bDXTAQU72pUXDk4EVzu3kChoM6DSZHwXdvnxUuTKk36iKZg
         Qev2VckX3RggnGeJmowFx2uffXahhDkNn+ZxmdZon1wyFp/l+tmeCBxdV9fHXJDB9tmT
         Hshg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774437399; x=1775042199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqlLwhVSAcK5ME+6Vz5qSayjD/9fr74QDU16vKuu9J4=;
        b=nLvJ54KgA0zTxTaNefXWcTirk9PZq6fCLIvVEpDMlQTcVXtKTc8+1uH9l7SSmyuoc5
         SQWjBcgxH6v+3bi/xAUO2aAB/JbZv2VbzFfXb9tnlWzZHKYjlQo07RzQk4C7FtuSvXj/
         GxnkOOQQkalErZ2DxT8O6JjWXuezI3Ys4Y19UZTU+EqGMpLT6edTBbSBdXfXhODkrNiL
         KYlFImEdl7meURoCNxumG/3a9rJwE4ykbvh1aCbVfAnpDD9tfGLyg9gAFI1N8MJF02Jk
         ScFW1EngEhKoJOas8gPuhhWnMlQLr8zR9VjQWE+pzMkGF5aBBoWrW/nCbUzkVb4y6bEQ
         D3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437399; x=1775042199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mqlLwhVSAcK5ME+6Vz5qSayjD/9fr74QDU16vKuu9J4=;
        b=nwApmcH6YfrJhdcrTih1POnEJqj/LT0a/SJgZSQef1rMkwtOVENya59+WQXqizvl3i
         vW7fo2bYIBqD463KVqGpLlevRDAZhcHkSwW9wR812vlua/c9VlmFjEoJxaVgNqEcqdw/
         kPLcK8t5wAztndAzX6OsdqsejECzcbHNeTrGS0aN5QdV+SZMS5fkqdO5vDOxmV7WJkBu
         lRwJ7ym0jBC53AhUwCkYDK5mxuF0ohnXpEdzVs27nIszgcaQWBBeZwcVTd8X3tnkGu8C
         wv9u3FVMR2/hZJMkWagbxOs7dLOVmfS0xycYfHdhwtn6265KWZY4X9vc7hFX9IeXylqx
         KFww==
X-Forwarded-Encrypted: i=1; AJvYcCXqcyCpsg0B8qeb3w95/FYuKrSjoR3Ft/YRFNbEoK9Tshf+4zMg4IA/WCXIbth1xgS3q75FR+L3gXepmFbD2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGDTCJRkhh2/EWEwqOYxKMt3mQo+qb4yG6UlYQw7qwSv600Qsc
	uwwd69Q5WjtfdwJiuH3VCzvxNpqo3N3SNdfcbnQGGYxfoTNruRTvEDNg2816wxrwShJihZ1Ciow
	uxWodTG2U9DrcdHYo9TJZFtrfhN/iCgo=
X-Gm-Gg: ATEYQzwA+/tW2rsbw7hul2iqbEkaDJIhU/lANHtsrguVo+8kZm+OKYAuMx1qs0c4+Bs
	NmbPizauz6EjS+/W4zBWFv9nhEcxzM4JNLDfDarnOFBwVDYXc3dOzANrjPnp4hIhimC6c+SUlyT
	yNisXe/cQzPW9+aUphEf38b08QbeRG3bhW2jBMFBUyvqS5ULXUiTTv9bdLE2jIpC5giSx19cSZF
	1gTvssx/3SdEsxLznd/B+u5AQzHX8eCUoWApG0/7KNrFPOxXJHKCY9DmOQCqAm+e8VGA0P6orOl
	DlTBo7ailX+MuvHohsruJenHP896Z8fhhBMgEAimQIaopw9lzBsaACz55sIfOuLi6frnTXG/FMm
	wg/zmPB3O7DQ0Y0s/s5iWG8k=
X-Received: by 2002:a05:7022:4388:b0:119:e56b:c3f1 with SMTP id
 a92af1059eb24-12a96e35786mr921839c88.1.1774437398694; Wed, 25 Mar 2026
 04:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317225355.549853-1-jhubbard@nvidia.com> <20260317225355.549853-8-jhubbard@nvidia.com>
 <DHA6XCMN83HZ.35I7YETBZUV7B@nvidia.com> <b3780f18-a762-498e-aac5-6a0938d26c5d@nvidia.com>
In-Reply-To: <b3780f18-a762-498e-aac5-6a0938d26c5d@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Mar 2026 12:16:26 +0100
X-Gm-Features: AQROBzCX-Nv-YKcP_3gjNcH87pPy7qjbth71Eu-nqsV1sxOMBgnhgFqbDUqJDIo
Message-ID: <CANiq72mZhwXoj0Re2Ahmp_=EMwfY=tQhyyQJS85QkSxm6nTepQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/31] gpu: nova-core: move firmware image parsing code
 to firmware.rs
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 4:30=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> The `mod elf` block is a nested module that doesn't have `use
> kernel::prelude::*;` in scope, so `size_of` isn't available without the
> explicit import.
>
> Or some it seems. I'm not experienced with the module scoping game,
> and so I may have it wrong.

Yeah, our "prelude" so far is a normal crate in Rust.

With the "custom prelude" feature that I have been asking upstream
Rust for a long time, that need would go away, i.e. we would be able
to define something like the standard library prelude -- I have a bit
more context in the wish list:

  https://github.com/Rust-for-Linux/linux/issues/354

For doctests, I add it "manually" (but only at the top-level, i.e.
same issue, but at least we save most of those `use`s).

Having said that, instead of importing things from the prelude
manually, even in a submodule, if you need something from it, please
just import the prelude again, like we do at the top-level.

Thanks!

Cheers,
Miguel
