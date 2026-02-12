Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2FD25C818
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 19:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770923622; cv=pass; b=MtIjAYzrW70Psi61LoZW4gJpdRHOr3pyUZ5waSxtDfkoPkRT0Ie9Ya/ivuwnKrlndafRZ5YskS1fzWt0gGiKwJ5gQH+ndlQpPuxGkM+DF/+ekGy5C3xdJ9DwWJ7f0z1pkBE+t54w05vg3zuFSpBRWcpxCctBS0WM8BUUMlgdUiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770923622; c=relaxed/simple;
	bh=WrAU5zrjcCn1BNqI30iviL/tAjy/fZDO2FGkV8Y+Dv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7ir3UYgPxxzj9szYRR9+sHTm94+GXje120fh4GSAYnRT8AmAreioJWIYJsIBSkcRcoYstKPATpsinMMc+FS3yT+Hu2uS4jc71xlPYA8Il9Ldz9zZpJgBvfFXIlsPymDOHtyx7MY+hhbcCuISBiY+fY9tQv6ZQMC5HuZzk7lB1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHjKdxuT; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHjKdxuT"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-124a55b7bfbso4469c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 11:13:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770923620; cv=none;
        d=google.com; s=arc-20240605;
        b=NIy8f+7xgbW1Bgu7XAqx0VfCQtNGkV9bFy4gH/hfTtbCIh8NvLNJ7zdnWfzTNQKq51
         92WkOnbjeuOPkawXCHVyIHrUoKKCIYOQAKFwVB/byJYVruefKu1eLcy1M3dxgQot+eWw
         pk+JWllOWE+vJAuJ0kqBcQnonKROiMvDb53wrUOowlMTjxOCzYGEs7k6uxJW/8QW72S4
         l7mQA7u5Xz8QTjAsgOUj1QRDf11KuFna/pqDg1YdKlI2EBBSv3itujyYYBxfbqpHlDsS
         7ijVQGuvxtgP0LllZaex3u0yRWNxjMyLNrFa+4RcaaT/evTxUPWnCLZ7mnoxWHXN6Jhf
         xcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WrAU5zrjcCn1BNqI30iviL/tAjy/fZDO2FGkV8Y+Dv4=;
        fh=CRcgl87YaWMrolLvUbB63nz+QndQc3tBmu/xCrLx7uA=;
        b=Qs+4wssdT+3vwG0qof8VFEbFZJP9Cl1+2l+ZYHYA2q6lm1nR9EPOhpi0RfIK2MwyxQ
         YIypfvL3JXktYrPbJQGDrUsXm1THWxs+L7W5xGAi/O0UeuDMAKqHku4Wfa95EROmtpr8
         abk3wmexF8oxgARu+nf2n/rQigUgD1HiVd/vki/sd12YZUC6Q/NBTyNa2rvMMwq29qfh
         pm9g4o2jh7TY7xcu/pjIEmxjX1nsivOF+XdVmZ843vwKZt4GQAX22PufL0xpos8ddaXj
         e456Q/AKml6G2jzQXG/5jQugSBQ/2Ktfx0r1Ry2LnlFwYgfw3DzjPJ+JXTJn/nN6CzVb
         1Vyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770923620; x=1771528420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrAU5zrjcCn1BNqI30iviL/tAjy/fZDO2FGkV8Y+Dv4=;
        b=WHjKdxuTIk+Mm/qHn62GlcK5S1Svf7wfP7HBiD4rh3I87DPvGWnPathsSn9FNolcl/
         ezvVnu/H1fLxN3uhUNTAoGCs0AvZCPwQsJZ/s73HujLrC6UXAOKPgOAkTlucSPs3BMcK
         Nn9Xfo83/ccAQ3zWYt/4vAzDfDqc9lYVe8eZ+wcct6MN0WasjX3m07oG+n9B9ap3Myha
         AB3HV8Q9XavAtDD3TOOkIYvUFpIBrbmPMClYTL5t6l/B22T+0y/bQDDoAApheFPJ6hLi
         5V/joKBMLt8BAk1YnEhTqctern32QJn+VrEIHX0pm+e6LGFFpUSS8NFUcq0liKYVwTzo
         eEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770923620; x=1771528420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WrAU5zrjcCn1BNqI30iviL/tAjy/fZDO2FGkV8Y+Dv4=;
        b=DjVLOmHZlwRpCs2kaBdTvbjk1blGG9ovePPxb8OTsTV0y5K4CDUIsM9x0FTCB4WPpz
         ZjffSBq9J5aekddZ6bq9/96nVfgrc54YDA1jzUHgSkz2/f72OJ/oGJDpktE6uxIMiTW0
         lhlgSeG2DzacNDdgEg2HCdHfmpHxgKlhIp64uMbZOEoo+o1oChpWOPi3dHrmFwmYFmJi
         2JnCU6nvXcGiP4XW+SFb50lI7+EqpN0guBAXyHiDM1Sn/M7ua7ScSba3E7nhGZXToKd/
         M242lB0ILvclsrYBvtm2mZ+aLzC0chnw6STeBx8A80bPXkxdxIpa2rbsHYBrEUnsxM8J
         2vVA==
X-Forwarded-Encrypted: i=1; AJvYcCWoI46YSFgUFxBq8QIT2qM1DlFEwtaLTUIa+bZA+DhKMWXOk9OvyrD4KG+TQkA9/CleK39BfmZLkuuL2FlumQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd7UA6113M2NGdnufrJd6YpVVTckyKFXa5lvKpWjZm2H7G1fBs
	iH9XcP0V3ZQAx7Q+pRTcD/NPe32J4JJwY2y0C7SIsdio80dOi1n8l4BrG8nqkIT89VZuXa2Y4SV
	tyQJYWNeDf5WD9MR5fqTJmpa6HsTVPEg=
X-Gm-Gg: AZuq6aImSk4W5SgyBIvTNdeN11mgSGpJBU9xfZUowjZ9uT2IoHm6xegaL+rM89+arm6
	4lYVKxzKgW/Vc8bxhn/jbas/yaQTPJdOVGUBDIeLa8ZWkxAG3EMOjN6E0M0JOl2FRCW4Ck02l6U
	RjL8OFlFRBCIus9/zTiDTO+P81oAPWMIKlf59vfC6oP/ljlHJerSUW0FTIyJGIZGDW7XI3F6zuC
	RnonGEf6R27rPpkIinliiSU49EN6E9jmzifJa1HwyAkoSzQyPRpSBZckQ8lZNUIV31GWxpD4gAU
	5JS2bTjdTBHAOnARBlc52d2ceTnW5O9E/vRhLDjDPfibCsVdiwUrv3lFuZAw2TIWxk/UOZ3nn7U
	PFeJhmqMNPB5xVZ1kaAdPuFXi
X-Received: by 2002:a05:7301:1299:b0:2ba:6978:2b0 with SMTP id
 5a478bee46e88-2bab861518amr148339eec.4.1770923620251; Thu, 12 Feb 2026
 11:13:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212185810.648364-1-9erthalion6@gmail.com>
In-Reply-To: <20260212185810.648364-1-9erthalion6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Feb 2026 20:13:25 +0100
X-Gm-Features: AZwV_QhZnAoZ1Pw8ot2wsf-1EvRj4OOkK0rQDza5R2-O6LTu3qN5n9BNcMnTarY
Message-ID: <CANiq72nmzYkHpLTwWxn71TKKTPxWprjPHxBau7Yat32P0zE3pA@mail.gmail.com>
Subject: Re: [PATCH v1] tools build: Fix rust cross compilation
To: Dmitrii Dolgov <9erthalion6@gmail.com>
Cc: linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 7:58=E2=80=AFPM Dmitrii Dolgov <9erthalion6@gmail.c=
om> wrote:
>
> Note that CROSS_COMPILE might be different from what rust compiler
> expects, since it may omit the target vendor value, e.g.
> "aarch64-linux-gnu" instead of "aarch64-unknown-linux-gnu". Thus provide
> an explicit RUST_TARGET_ARCH, and if not specified, try to match
> the CROSS_COMPILE value.

I would suggest explicitly doing the mapping automatically, rather
than guessing or requesting users to provide one more variable, like
we do for the non-tools side.

Perhaps using a "table" like we do for LLVM and `bindgen` -- see for
instance `scripts/Makefile.clang`.

Cc'ing Kbuild and rust-for-linux.

Cheers,
Miguel
