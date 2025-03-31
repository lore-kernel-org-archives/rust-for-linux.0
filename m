Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B378F202C39
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Mar 2025 18:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743445851; cv=none; b=uM16h4QMaOD8O/3066A//xlEo489zMSyihShZ8HAuyKS1idZR4jgPHlavetXslKXfOwskg/mK40EtmLQ+ijPVvO5dd3C4zMhyodtjVNMC4ipRYm40X7fCBfrCT0A+rbEeRA/iDoR/D4CwUTtSspzi1f4eVlCk20Ogm1z0VR9vaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743445851; c=relaxed/simple;
	bh=yUSn1ZzfIdfJ8mx4tNbvcmf4vHjLDdBis748RnaQRMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NYJ380G4FOAkqaOZGHPIlmoDMp7oSS31bta3+zEVqVsb5wY+nxJ2dVhYuN2pDHw/Nssls2eI/wjNF1tNhgeaSxnuNuoarMzpTBWQAlCMlRNh4ZoUfoqbeSbb7Z4XCG//Ntkk9u7gwAt73Lz2U6J26eCsWolfEopZVV1XGGGEksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C53uk0SJ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C53uk0SJ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-301a6347494so1160956a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Mar 2025 11:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743445849; x=1744050649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axIrB6Gnwjx9JN4PGaixRMw2iNGAE5PbtRQ5H0xqDBg=;
        b=C53uk0SJEcuqYfE0ntuCzkf58tlCa1DibIZFnGSwpyfUsOK4ASBeuUBC9m6BKSGCf/
         Cje7ns/WdGrBrJAggx42oM0UhC1dgZctOhgn80KgFhs2bjFRB422jbHGFe7qoPF4mgV+
         IkKtgFLvVEEAAYQp/1rDnZR6LHQxz1HxkF9SkZtSY5wEa1fxX8VwpIQVsBKkBtIMEyRx
         030Lhbna1LHoLMt1h3P9kKegVC7Tlt0PfCbwHtoXXDmxCu6q+u4T1HTAJbcCg51lGvXU
         JUzn+z8ZGDwrWLvGh1NDSHg51ll55Az82LhsL2pyIRITIEIa3ORSewlzBeCBQQSpsvUr
         yreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743445849; x=1744050649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axIrB6Gnwjx9JN4PGaixRMw2iNGAE5PbtRQ5H0xqDBg=;
        b=PidcjsMJE5BozYdt/9tkCXPJXdAXlJ3a3Z7i/YYnvOufZXgIm49+FyPxI1sWaOHDiN
         a93GPJDLHFEq9xQJ8VnJLs2qRLvzdo7AseFom9cb5OVkkSPuuy4SNdn20CHuVApcTOc+
         3YJcQO6i8Svqlp1/jUo5ft/MxKe9orRqS8VS5mJMWM1x6hHmqBEAFyjWbJwWyFf/HpKn
         l0ti3ntrF52sSzLNxFcXv8VUosa2oiSFgyRmkd+rpYg/YKIb4Qau1Q8zHzVMqzXS+i+D
         a6rEyoV3kELWLxYOQ6qJOC7Cpk3ea/KpNkOvqnufrdIs5UgX+g3e4ee3o4yl5D1vTGI5
         gZCg==
X-Forwarded-Encrypted: i=1; AJvYcCUoO7kb+C3+VJkXHg3h/jB1zQX0Q3Mv17YKySsZ49x5kxOifJ/2ZDwUCWUL+RCcI3R3n7gtmxda/dMIPmPa7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxusDphdHi2+bfKrr95bho2/RWvHxM+r4YyfqKEKLBxVWo4PkC+
	LvLVxZtKWRk6A0Uyi4JpdnhSMo9qZZhwRNWa36mFspgd/lIRwxy90dC8Zzsy7Z0JorIfNQTJ5jm
	/u/BDqURh35N/aSFOx6ssZ8ygcGo=
X-Gm-Gg: ASbGncuDKrZd68hO6aG638keSDIp4wPA2NY2MF2e4Tm0ZJXxa5bx2tKD7ohuRHss8js
	LXAGpSTSykPkh94V0x+cVEK9JNCkFMtEVI46lAoFvLYLIbWZIIvcsyKz21Um2B3ArVqnyZ5atB+
	BSYPdRH98xHtiNsDANJ6QoEetRSX1kGslPeLXs
X-Google-Smtp-Source: AGHT+IGsxFXeCdlardfKOL3R2oiwn7qFHpuXrnlq0ZEIEW5b5PZlI9US4DE9pzOJ1GnFXiDlfJu2ZJG2XnLtWPttMFI=
X-Received: by 2002:a17:90b:4a10:b0:304:eacf:8bba with SMTP id
 98e67ed59e1d1-3053213f596mr4283441a91.4.1743445848857; Mon, 31 Mar 2025
 11:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D8S8C5W0FCVD.1LH1E86H6PXZD@proton.me> <20250331170118.1376899-1-igor.korotin@yahoo.com>
In-Reply-To: <20250331170118.1376899-1-igor.korotin@yahoo.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Mar 2025 20:30:36 +0200
X-Gm-Features: AQ5f1Jp7zLBPWxGYeV4Ba0MAMjszm8K1-UM2ZyIXyKBrq7o4FFi_S0ZE8OX_gRU
Message-ID: <CANiq72ngOZs8idtvxP05k1TK8kcM+Yd7ztSuq1PaAoHHBEQBhQ@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: quick-start: update Ubuntu instructions
To: Igor Korotin <igor.korotin@yahoo.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 7:01=E2=80=AFPM Igor Korotin <igor.korotin@yahoo.co=
m> wrote:
>
> Ubuntu=E2=80=99s rust-1.80 packages don't install tools by default, so th=
e
> PATH must include /usr/lib/rust-1.80/bin. Also, bindgen-0.65 needs
> update-alternatives to set it as the default.

They are available in `$PATH`, but under a different name, so it is
not necessarily needed to change the `$PATH` or set an alternative.

So one can do e.g.:

    make LLVM=3D1 RUSTC=3Drustc-1.80 BINDGEN=3Dbindgen-0.65

For docs, I tend to prefer setups that minimize global changes, but
perhaps we can mention both approaches briefly?

Thanks for the patch!

Cheers,
Miguel
