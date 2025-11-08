Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C6C2D8379
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 05:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762578634; cv=none; b=K9EaJBjQ4/Fhbt7Lv0MwLMjRid66xT2lL0KHbg9li8VHsLEwXmFkWyEaegwNmCYuBuaRT1du5pBSwxbNCRVgINUeGbjOdbDaVliErQXlv9Z6p3ZY7H0ZEBXxIa6uEs8R1wOeLmgsJM6AQeuwxMcQQdxPv2ABGGE7qTAm3oo8dfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762578634; c=relaxed/simple;
	bh=INEsrDL3ZFOVJV6ZxDDmepCrXJUSxIqBndjxXSBnJHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OChUkzqudoB+KGHfo7GjYcP09AAb3Q8Zr/GXrCll0WTIVQWR4mA2fNpV6HAkl0L8zU7xUDetYutKNH200yztgFWqpwzX/ETly14BHMLdq+CmZ29/2fbKGQGXVz1tsXD5v7jnFSuI10ZMyOC/zhKqLx4yHY37GLLTzrB+VJ8WJh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOOedfTI; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOOedfTI"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29498a10972so1427935ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 21:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762578631; x=1763183431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INEsrDL3ZFOVJV6ZxDDmepCrXJUSxIqBndjxXSBnJHM=;
        b=kOOedfTIxhWVBJqaOnoL7JiSFy1med7LiUggHTUM5euZtZQjRUFBcZd7dbiJnJN8x/
         KMqwqbd3N0oznq2Au+97Nx2ZXEUcUl1Q6hPC6k4hysF+XxBe1OjtTCLdqaOgG5EVbHug
         VoQYyqa3MIfBqVPh4m7cvh7/SUMR+U1SPvPRvQNgmLxxR1PevjdVLY0YQenBP2fScYBg
         QpCQoh6JsLkDhW42fnl+GzQBmwyphkBSF1lgt32Y/UgqL3DjrD0/aqHLl8jBg0cr6jBb
         un67yYShxFcuKH4yAHOajILRGfW1XvMyKVMWVMJefRKiLdfFZwaZW9EGbHo/teKb67Kn
         k4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762578631; x=1763183431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=INEsrDL3ZFOVJV6ZxDDmepCrXJUSxIqBndjxXSBnJHM=;
        b=IqpstskZ11IOR2vse3wN22APnI1c0sjVTR16evI/fk9Qjj4jswlsev4VCTzAZkZNcc
         RmwU+a4ZRVB/wGy0Xxh7hcJBaWglyBJ7NidkDXkE9JbVutbXBm3WKYkD2aX1NVeCOdK2
         aFIw8r/f7aSVMpJEnSrb/zN0C9OCmBeOje2uIm1mJIDUiXhYjy3LswUhv/iGsoDDux/Z
         UfAM1smLezAYllOM+LTKv3yGbsFr7wgHl89przaRzdEBvoER2at1e7cC9LNzzubCmTg2
         WFpHN2cwJYXshUU8A/pwudFyAIQGhPujTlkvmknDXksywV80yugOiRLQ83T8UqxBePZP
         /JFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeMfdzDnWdyiun1UlJ4NHbiNjVoMWUuAtX9DaaesK4xMv8Uk8XY1gbCV29kg2p49s/7twQS4I1EG0b2iAoGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZaC2TWAMkfbY6kVhx8FMIb+h3RedEUJqcJJHu+IwRhlzemvkb
	eC+UaOgM1u4rDxKhwcGTVc332XDHCcCckDKu7Skx9ZlbAkr1/XgAetf0+iPaCy+fE7FJ5pXvwks
	vouiNuBUnFTRj6tArl++PobzsRkFiLC4=
X-Gm-Gg: ASbGncsJRYIdLtNGx5JVPCi8Apx5tH1JB17zoswz7bm9JwjNjCQC1fiSaaMRvI172PN
	EuTOUJuKMtlFlqxfzIEZjKyOA3J/H6zoXgClZUUSAFVGp6JvNdyeWTRK10FjuG8WifdvAq4Epl4
	D9DpfcLOua9DwTeLSKHFpxIdT4urXuYzTat2NRUS2lTegawoon+4SV3Lv3ABAzLGZLgzVXjJDcB
	5wkDTydRsXj3USMguaXiMIMfBn1AjfDEEGxiHjJiF0Q3hNpA59NsBn6G96x9FrjRrCjoPGVroKf
	0eoabrKGI8srLWzT5gxV4PaH3NFiF8h/f3QNBgPERf1ii534EmN66cjnOKBesFzpBV4CNo6SOfb
	aczg=
X-Google-Smtp-Source: AGHT+IFpkWjaZPfFIdXLCNNvaUpFsNrIzi/soaYDSl43HhGv5JtmjMSLTRnBgkPYtWq32m0IIjqkxR9ElEvFzEQGC18=
X-Received: by 2002:a17:903:3848:b0:295:f926:c030 with SMTP id
 d9443c01a7336-297e5611fe0mr11021635ad.2.1762578631544; Fri, 07 Nov 2025
 21:10:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
 <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
 <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com> <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
In-Reply-To: <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Nov 2025 06:10:19 +0100
X-Gm-Features: AWmQ_bm_JWCStYGdxhk5txWeRYQcMcxjFaV5hIKidHxgDSHYk_c2QUGj1XKDqWY
Message-ID: <CANiq72=c8j6DvbY7JiaR-JygXcd0AESeNpuot9CpFaA3ueupTg@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 3:40=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> I'm not sure it makes sense to silently export unusable symbols. I
> feel like we should either ensure there's debugging information for
> these symbols, or just not export them.

(Now that I saw your other reply and things are clearer, replying here
as well for completeness)

No, I didn't mean to silently export, but rather to avoid failing due
to missing DWARF if there is nothing to do for that object file
because there are no exports. That is, what we manually do now with
some of the `skip_gendwarfksyms`, but dynamically, which unties us
from the inlining decisions of `rustc` which could hit us in e.g.
small crates in the future or edge cases like the bindings one.

Cheers,
Miguel
