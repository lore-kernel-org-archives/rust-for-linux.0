Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF4B17BB7
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724163606; cv=none; b=BSyT/Ewy5ndc2RU6nwQ2nKzIKvXRYz8G/L3g4RlM/Jy8PotDYDWxR4QLM3IgNOuGmPinRuNYTQJ6hBU6rTyZ2aB14O/u1x4G+JXo+5C8aIbuzc83lbXcgTdxc/BjQ9mTfpbOmkM+azpK1RMCzi2hYiwIhri8bwH0kZZeCQzCFKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724163606; c=relaxed/simple;
	bh=DxvtxL+Ke8K6Pv8l2dm3nQAgwg0QSGFXf5KSkc+OWOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0xnRAlq3E5hz+DMh6RESw7JOQEt26d44vdr8+O0lm1l27GXggTKxq5tIxgVvPll8E/w2BH4hHbWyuBNGNUdvfVdcrTXqCdLNmlqXK4NhNlf1IXA6/Lft2nOFvfxxnyNenxPmTA/gymWz2ub4BwLF4GlJ7BQkGpwF7Hrbe+krwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aP7qFZ1y; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aP7qFZ1y"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d445c87788so387759a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 07:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724163604; x=1724768404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxvtxL+Ke8K6Pv8l2dm3nQAgwg0QSGFXf5KSkc+OWOI=;
        b=aP7qFZ1y5C2XfNika7/twTIgLccAQ88QuHOw+v81Gq2UqrvIOEB0CQeyaYAdRYkLV+
         tXPOvcnSB553b7SXia8RZ5KU6rMmpCmGyMS2JDwWNbkW2OCrTNaQgtBeQefXDrk+L/qg
         x9VIEDONPWtfigwbo6KLqlQzNKbEdhb32gqJVvjHGAurhFnXqPuJHuyEBk5laepMh2oJ
         uZq0tNOYoObwMjwJ/M6e6y7TmVztDqiubzmUYoavgQzAR2SqUDhiORXsch8AI6DMoGxC
         mivSBlUzaVc6Ws15uM6pG1nQYqa9vFcQ1vRe2m1fthWO4imq3w/WMss20etzMWPTdZgl
         nZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724163604; x=1724768404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxvtxL+Ke8K6Pv8l2dm3nQAgwg0QSGFXf5KSkc+OWOI=;
        b=HScujpozS+I7nYanBep/2cUV4865qPwU00btf8p7eHxQsSk0DXR/FcZb7JOcnbihYp
         XzhBaY1PLI5R6AQp1wqv33Ovb8wcN301Ojz6tyY+2+TXk/iIBscgovNYW1qnJP5q2SPM
         VpdTJpAnMxGDmemNLFURsnk//p3DF5rxqCxiqTClScNiTHRi6S9X7arGpFlBiBiy8Udv
         sz9KQDypllEARBL8GmvC0km8+U+Q5O+jksEjm1bhA+P0v3jBv+szChiqh0s07zt5xtQZ
         7MrN5W19Qxa8voUuT+Qy0JenT33awWnvLJSKbyutg7qGEhenFuwWWihWxqHwcvqHHyF6
         kkjg==
X-Forwarded-Encrypted: i=1; AJvYcCUNx2cR18bVIrqq9dHR6DxNDQe3MM2e1sT5z2FDH9UQGo7QF9U8wt6+KitflQIxCGa+aFxP0YXJOmmzrOMKk/pIIiVqhPw7c8kdoLFMzNk=
X-Gm-Message-State: AOJu0YzYFDGuc1e4rAJCnmusV2PH7nPxCUGW79tdd/ca7GXgHdtAbclD
	H7eSxxq6W8+YJ8dwSkwIgpRKZsMQp6v8lPKLE6/SCEl2m+Y7eNALqHKJDkYEftUX6QQ0Na4/neK
	+4AoZBSRYzcvTeFhN/zVHrsO1kx4=
X-Google-Smtp-Source: AGHT+IGcjKB+JSUz6XR3WY1V11DyPhrE/IyS4AaYf/2qlwuLxWDuMQ9CXaBD7CrEUv4damSxx/lF1wlKrveyCZDI6Zo=
X-Received: by 2002:a17:90a:9a9:b0:2c4:cd15:3e4b with SMTP id
 98e67ed59e1d1-2d3e086417amr9595929a91.4.1724163604537; Tue, 20 Aug 2024
 07:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com>
In-Reply-To: <20240819213534.4080408-1-mmaurer@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Aug 2024 16:19:51 +0200
Message-ID: <CANiq72=jxS-LtTMPdtFCmO0T2ajNZO+XLywqeevE4FyNhtyNBA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Rust KASAN Support
To: Matthew Maurer <mmaurer@google.com>
Cc: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	ryabinin.a.a@gmail.com, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 11:35=E2=80=AFPM Matthew Maurer <mmaurer@google.com=
> wrote:
>
> This patch series requires the target.json array support patch [1] as
> the x86_64 target.json file currently produced does not mark itself as KA=
SAN
> capable, and is rebased on top of the KASAN Makefile rewrite [2].
>
> Differences from v2 [3]:
> 1. Rebased on top of the maintainer's cleanup of the Makefile.

Andrey/KASAN: whenever you are happy with this series, assuming it
happens for this cycle, do you have a preference/constraint where to
land this through? I am asking since we will likely need the
target.json patch for another series that may land this cycle too
(Rust KCFI). I asked Masahiro as well what he preferred to do, e.g. if
he wants to take everything (KCFI, KASAN, SCS) through Kbuild, that is
great too.

Thanks!

Cheers,
Miguel
