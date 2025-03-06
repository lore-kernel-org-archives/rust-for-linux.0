Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4585C270048
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Mar 2025 20:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741291491; cv=none; b=Xg0UXo3rqFM9uKHV4XMLZphutpfV1fJf3e2D7Q9kxZm5Y2ygLG+astKLus3Dtk4YiteQ5o02dCbhIJSsGkIjHgKzNyx9HdDXmOeqafFCTmQjHqCcGdVttKjPsTbKRWrM9MCCZmqRV5FBuJ86CTkw7/8i75rqB7GYttZuCYhAKis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741291491; c=relaxed/simple;
	bh=TBHXsGfzaVM/pvIHyZWKzbsZkI7hzWhKdonZYskDupA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOrXMr/q6Eij46OhCPJhshySLnpoCowtLPnqBBLT/V56RZBkU5ozYE2+bkgmcU6npu8XEMYc9kF2O55GXmMaM80VmQvb44Xut/wXElcttpi0q8e1Oq5C25wTjO2NOzABDLsmYpv9ZM06JHyX89Xt7rDtjqidY5ISCfLEBVkg4ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+ulifwz; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+ulifwz"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fc92215d15so276595a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Mar 2025 12:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741291489; x=1741896289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bu3YQqwp0FwvvZaitDollb8qneh4u4bIaip66gfC4Q=;
        b=a+ulifwz/qEWCRbJ/KVejAa1+6RH1ROjjXpFMffBQV72gKbPYTEn+4CTAKlxTH3Lo9
         jWSuJrrdZ2Htq/TrOGHpPIlaA6koosw5zldoL5T4JsItB9gU/9r7VdFfk1VYMaz6N0AP
         4+p9r0u4KJ1mY092P53RAcDaxnW4/heNP6RDzDUtnPHybc/M6vn642DQK5df3lwN3wA/
         2mPzm7XwdhdRGNj6+chTBsDI/QhJvf9OiMmcr9ULQrGhrFoDOzA0XOBRbLSNV6UVBZVS
         jj4Snm0aduwPI4777W0ET9ISjlFA5IQjJHiDrlivf74ph4KtjBV9klQs4a7emAF0Czbr
         w5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741291489; x=1741896289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bu3YQqwp0FwvvZaitDollb8qneh4u4bIaip66gfC4Q=;
        b=tKbSBrkZDG9KsyrsVdaIRCeK+zJkORgddlKBBOPxiBUj1GdxRIYTAbL2i14TblmYit
         9uTPqwbiueyY5laKFWSf+m6SEfV4tk4v5Y7TH4hH2xnGYiuwhuXLHQX7S04s3FcmnGEI
         +KefcRdeAuwLsybvpfDiYtTXOm/S5in3SpPaR8Ia3l15/jbP9SCMuc88dRi7klZJ0uFf
         941FAEtDCmJ6thhJp+/VN3TXChkxPOGifGRAMGzA6DpP+HOac0heFnPi9Zv7Oe/IoN3G
         V+5G2XLZKJsGe/GFRJFd+p4wXbfaHwwvFu89LdRY5Fgqw0+kcWgZr6icMLVMLOYXGm5e
         2Wtg==
X-Forwarded-Encrypted: i=1; AJvYcCWmVICsHvdYj4hIE9D0i4eGsF28tjv9jCe+pRToRMfyaCSXPKaRPxIHPk4S+lcuzlhqGIBoh0TmU7zYVbS0/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPlqNWyI+H+IRwOo6Xa9njxO2rVAgfL9pLhezjRbHdu3UT50c+
	fDHHqXSm6GDwMVUxzX7mMQCX5pJlyVew50X89IUMY86ZrqfYyPv78ki7p9BZ4/qDs/7O23R03Wl
	Fi8ypoL+9DQtVfwrpCLFCcxpah2I=
X-Gm-Gg: ASbGncsLGAeQGp7mjDA1ijI/8Y2zGcqpqTGcAo7L+LDJ+pWRNTIRDa6oxW3YVCgQ66J
	MEb/51VbdsZ8Y4Kb0n0230iMtkYACNLQksckFjnVSv/c7v14kZ8rwJdyd44LZhatvSZeCkRbbLR
	fY97lUClLBXnqLjo0J0VUmXqBu8w==
X-Google-Smtp-Source: AGHT+IF1s6DFQLB45J15QVgIV2umabKjxodQ83+gtwaFwUEts1s5rDMMODNhuFPnA853pOKsIUUwxNn+JOnYHxIttPg=
X-Received: by 2002:a17:90b:3146:b0:2ff:7c5a:216d with SMTP id
 98e67ed59e1d1-2ff7cf40ed1mr340370a91.5.1741291489260; Thu, 06 Mar 2025
 12:04:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105194054.545201-1-gary@garyguo.net>
In-Reply-To: <20250105194054.545201-1-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Mar 2025 21:04:36 +0100
X-Gm-Features: AQ5f1JpjN9U3NNao473LvxymqMlTE8uIwdiBGWD33pmLNW4_gGkjQ1jRfhGXN4I
Message-ID: <CANiq72kr1WWFwyJqxtc8kmpj3=BbEQV+Haj0CoLdDKW8j=Ty4w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 9:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
>   rust: alloc: make `ReallocFunc::call` inline

Applied (only the last one) to `rust-next` -- thanks everyone!

Cheers,
Miguel
