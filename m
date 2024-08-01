Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E7E14A0AA
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 20:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722544421; cv=none; b=hxuFjFFkAaNtt2/iSuWfgnui+FjblSWPzhAKyyiyBfRXRRv4/EMVxj9I9RO8ZwyIRspEc5u1ZvzU121W3DWwX2liKLs4a6wil3NEVf9RR1qOIXHZ6TZJ6aN8f7KfGk9zzUx/vP9ASvj2wOU+fBU6BRINwaZfLA9TeAHzkhn7DCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722544421; c=relaxed/simple;
	bh=uj3FPwEIG0xfFR02AOfEaaHGXag/9QLqipufHIU4Zg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6h3nYQvWmm6iyRhss9uDychgyM05j4M/7CotiA9zT6q4EGnrvqyODD99YS3Z/t0aM6cCougc2vWdvAjOIxbIKEDh2HISVV7CElULv63A+/EWYXw8VMkoX5Ih865MwWp7QgoAp2rkY3BYbD9V616whYX9cQW++OysfSjNlBThww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1S64wZUr; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1S64wZUr"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6b795574f9dso40376056d6.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 13:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722544419; x=1723149219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4LGUqfUQLcaI5k3gnfYaAsiGSEmX4XZthqSuVaynW0=;
        b=1S64wZUrN9QvfqICVzOdMAgivDxNlDPBenaSiM70h6WY/ufwWA8Z04cnOQzQjBlNZz
         TRhLZoskzQhmYoLIZmzJpiPnIzqij2A1FK/aJqJaBYopn2nZQkEV49OAsknzljZGLGvl
         IWp1SkMBL4V1/QxDuyZhFtJnE7i6JiyIC8mWua2xFCp3Tht1N8WB8BZXU5BNm/h1rnD7
         IA6r76Q1RY5X/FhpMZUdGLc+vrkOXnKTALE6vrIJWkFVzb5mkXbyt+YxO5RBAQ0QVoD3
         wFFJi3u7Q24uPeEX4dQFT/bN6eu1flP0kHpVH6cIiPqW9eWPM6cxp2nXTaAodDtaLA5I
         x+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722544419; x=1723149219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4LGUqfUQLcaI5k3gnfYaAsiGSEmX4XZthqSuVaynW0=;
        b=vFrc58gemDfNSWUa2vYaaRjo/QVHW8NBNUqrrQ8W2KRaKTbJtoeqVgTKdMuWnB6PLi
         V9SeudIacw7Qo2slRi9KBrSKr3kxXQlowfsfLNm7NZp6ZeszArYott0XItACzEiCtxjh
         ItLav9FoEXtj55MTqLiQQc7gjL/Yez+RIyItGtRgSnyp4/YnjLinwkllDBYungiuxVC0
         5gWCclfr9GZcXysXOQdr89459dSQyVv3nwGn8Z/n/q7kEwtFaPzWw9FXm7ff2orteFw0
         ojVojGG+PQz3Ug55FOeccrzvYcixOt5jsdoHoA+RyHqBW393kE2V6EwtOXzeZ1Os9Z9q
         6rlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVNCj/7UYfwRlT8aunurgcXHdNYgNnaw7F+Mn9mLnaWUfExLTzmXrIf+3Il497yDYLO3fHKPNRp6CHtFUPKItqkkafjjvvh+0w3hqG3FE=
X-Gm-Message-State: AOJu0YwiK8lIuPl1xHRqi20RBfeABpAQnhtsyphZim1oCcOqh4PUKCw4
	bbjkpejeU/pjcVD4m+xXcGMYNC+zlr2mCaSoUjMUldzfj8XUFNYjYJSfKtMBNPVckuZxAZAguep
	0nDPKdDaAQ+DmiUFBX1GmfqkLn4yMIojVts3K
X-Google-Smtp-Source: AGHT+IHRRf+iCcZWfIUk8eMRP01GYpsdBtZcRDR9lDO2O6lJi8LWaU5YtyCRFpNWDktDnSX3GuCXW/wCS7u9+pP4Sbo=
X-Received: by 2002:a05:6214:3103:b0:6b7:b08e:e795 with SMTP id
 6a1803df08f44-6bb9836b891mr13930256d6.25.1722544419100; Thu, 01 Aug 2024
 13:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801-kcfi-v2-0-c93caed3d121@google.com>
In-Reply-To: <20240801-kcfi-v2-0-c93caed3d121@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 1 Aug 2024 20:33:02 +0000
Message-ID: <CABCJKue_8S8jJ1b5RRHGjnqpq=u9KYf1SjPTyS0NCWS4TthUQw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Rust KCFI support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alice,

On Thu, Aug 1, 2024 at 1:35=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> The control flow integrity (kCFI) sanitizer is an important sanitizer
> that is often used in production. This patch series makes it possible to
> use kCFI and Rust together.
>
> The second patch in this series depends on the next version of [1],
> which Miguel will send soon. It also depends on [2].
>
> Link: https://lore.kernel.org/r/20240709160615.998336-12-ojeda@kernel.org=
 [1]
> Link: https://lore.kernel.org/r/20240730-target-json-arrays-v1-1-2b376fd0=
ecf4@google.com [2]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - Fix for FineIBT.
> - Add more info to commit messages and config descrptions.
> - Link to v1: https://lore.kernel.org/r/20240730-kcfi-v1-0-bbb948752a30@g=
oogle.com
>
> ---
> Alice Ryhl (1):
>       cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
>
> Matthew Maurer (1):
>       rust: cfi: add support for CFI_CLANG with Rust

Thanks for sorting this out!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
