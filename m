Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFA63ACEF4
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 12:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783860196; cv=pass; b=aMRnHTY5/nA898M//DsbxnPBkEA0VV6cb7dCY/tcZEiPJB0pS97i3Nif0SCBC2kIWoFqU0qvovriP9v0ueTyOJG9xwvVohYdgdL1rRX6DnrLmzHUzmXdzh96JeVab9io30Y1KZLDBCtVCq4VyaJvMb7Ci1t4qif2zyqSo3staXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783860196; c=relaxed/simple;
	bh=fHeG4LLaYskTtG3YwW5Pv5s/dR3ztoDir8OjjYwdlGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ai8qgrv+ZP+yZWKzXafRytR15UcD0TKLn31RQwMYf8qGe2iOlA3Qd8TN9LbhJ/C/U69uSVuHNLLvayto8jq+B9URPIidXnAT9UEQMKFG+jrGKwGmfX+/C4/6QpIcFeiclxR3hhBj4sLRgCop6Ld01X6CaIS+7xw5pFD/ZdDprqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrUOSHoq; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrUOSHoq"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caf18d4904so5213265ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 05:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783860185; cv=none;
        d=google.com; s=arc-20260327;
        b=CMm1Tbo9iGyscB8buCB1mWLdRPQPDE+dNzalFb726E184WXlV83bf0IFYw533skubc
         HkfjS5BSvuSkn7M4ZlWPRpVLRBCKkVj6hPfmHdtBsVohexuKt5H82ij2jl/ysTSvm3x9
         VY7ozrL6cvjVcNMWy4nMIyPhJZnN7qSw8EQwCYBXOV7DkmBsKaOzYAC+ptsl5mB9NWdB
         dG1q/EEgM47IrK2A17O3+TVofEI5oFg53n8/JNFcEx/xbDLjS/CvHILaL4aVWJm0kCQi
         da7K+IKw6xI19l8uUwMwOMHsx4+HyM2nEjEI37G0NiguBmudXuddhGDMJZ1Xd/UEJOQv
         kH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fKUtolI/dJSUk56UqWp4BlIs8XN1q3ypJBgqRuslk78=;
        fh=NjF+fTPYFJ4sgaMnJBbKe/E+lYHOD3j99gOR0A86lws=;
        b=YNaCEpjSIoYWvUsxxn3cYw0oitCJfyt1zk4XsqHMlIGUMD8Cfe8XMVwWzmQpII3riI
         AmY+DiNTAFv3HziDpGNkCLxw6iPPZyZM0/zVV7Tk+oOEBpHq3CYq++gPqp8YRYCm5f3Z
         pQ58YOcBBsj/cXO7gak7m73Y2s8vDv4Atv2Ymz7AwJPxIfjobHzU5FlQKikiowHbkLIh
         8nguGRxfSpwglOSHNEfgaRgIcxrk2xSpb+kHRRI/5m2jVsO7rqPq0EXqe4kbhLK8qYxS
         AivKAORyHpT8tn9ES2gPKYHMO0KbUOKCftwbVNcPICYfDTFsIsk3aCZcfILJYNnclV3M
         X8tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783860185; x=1784464985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fKUtolI/dJSUk56UqWp4BlIs8XN1q3ypJBgqRuslk78=;
        b=GrUOSHoqXUm3FtRlCJmHLGQMrQ9hl+RtepqAK59DdNt/WWpwDiNE8wj3z39HITpJie
         cJzeM6Bg7xNGiQvxiKXdfT8mAtNdPeDG2d6hh+/afRxe8wN8TdmqubXimf+VunQvJiLj
         hFnG+bfqoEMagivK6OlYv0hk331mO6M2E5wNjAAQrRtHukg9qE7Gwk027W0Pnll9ftYh
         ye+YkKXEG6z2ZTO9uhfX8wr0MMZ8/nGqcxF6LWkGbLUUo4MeidxR8mOt9N8ut7RwKO1g
         rtYocbtWzAwiXX02y1qUq1pfWrb8Qxs7NSPM8ob5tTDV/NtCKgDgKSu4gEjT/xQPNl5I
         HgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783860185; x=1784464985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKUtolI/dJSUk56UqWp4BlIs8XN1q3ypJBgqRuslk78=;
        b=DDuKGq1GRVeDsUWabcipdxTywrqxL7Lrl0oZF1AyTBhutuR86pdHksk+p/IBHyUElX
         bn+4uPzJZLPJvW8UkUb63cHQejRC68uSHl4Hb/Wmov8ruo3Y1LfiLUO2bS/k87Sx+9yA
         BWZuq4OTKPEdYxJPQj7qUfmY5fGTa3H60RNC9JU6LYj1T5XtUDIgVddYWrAkcxUKv/4R
         wRWu6D4Ssl0BXPrDYof509I1BKeOoSDDuXPRIhFhRhm4gMeNWQJuzDNvPtwNdT7WlJ2E
         oc3PgeZUw52774z+6Qd+HN+cC25eEPxbeuPX+801wCqWYA6dX4vTjXHk8Kubd7DXFfxC
         Zc0A==
X-Forwarded-Encrypted: i=1; AHgh+RpqODBL55Q0dje/4SMgEwT62lBbuRcHhc65tNi870wC44oma90WsdS1CEg38NZ05b+5+bgXL7YKZw7ATIvmZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOv9+wjgH9iKs3SsNK6uzaIXEnu+Dn9tAe6JE3ctopddN/zBR6
	/7WWf5dTB4og+NDyu+qHkjBW0T217RIi9Oqw0yAKtSb2TKOYSu/3JY5rXeqPRvJ0mXLShKfiKeP
	wnINqV70SrDWT9tfgj9dWQVJEbMYVAXA=
X-Gm-Gg: AfdE7cn42cSPpJBa/r7MiduD4P2YqsHGkb1nnSvfsIPUigm83G6Ej83iDbQWHCJr6vM
	y8aaX++oUTvz3hb7fCxGvmTqRTw6BbKTHcJhnBGfPpN0FQPMzsxs/xJZU/E1dX0YgTo0chuWlxN
	JA2xqNa3B831Bq9fE921DM2eLQlRIyeHOGMuBGGe83Nu7S0K/DNt3KN4zCJI7dM5F2DmsWbfYlN
	jUSrBrZwzJssg0ycYbkLB5Vu9Ietmro7v0FvIJu6IR1v91dtPAqVm7NbyuGiR5mR0TaIpd492Sa
	svjJdq4CWIpb+98dx9KrSiUwmUV52vODP7p/Bn2ElrfvqXEJSLak2XaWJ8CzCNLKpayQYD6m+ml
	Eblf9vdMeK2qH
X-Received: by 2002:a17:90b:224a:b0:38d:f0a7:85f9 with SMTP id
 98e67ed59e1d1-38df0a786cbmr766888a91.0.1783860185411; Sun, 12 Jul 2026
 05:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712123517.392-1-christopherjoshy4@gmail.com>
In-Reply-To: <20260712123517.392-1-christopherjoshy4@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 12 Jul 2026 14:42:52 +0200
X-Gm-Features: AUfX_mydOnkloswql-fdFfUYmal68jtkjokYyK9H8jfbXxKiT_7Txl9fMIchUl0
Message-ID: <CANiq72mYuFGbv2NY-aQJuVgZsaJ7aXFfScLAoFt2ymy9O=QHhQ@mail.gmail.com>
Subject: Re: [[PATCH]] rust: kernel: add SAFETY comments in aref doc example
To: Christopher Joshy <christopherjoshy4@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2026 at 2:35=E2=80=AFPM Christopher Joshy
<christopherjoshy4@gmail.com> wrote:
>
> Replace TODO safety comments with proper explanations in the
> `ARef::into_raw` doc example.
>
> For the `unsafe impl AlwaysRefCounted`, explain that the empty
> implementation is trivially sound since `Empty` has no data.
>
> For the `ARef::from_raw` call, explain that the pointer is valid
> because it is derived from a valid reference.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/351
> Signed-off-by: Christopher Joshy <christopherjoshy4@gmail.com>

Thanks for the patch! A few procedural notes:

  - The title seems to have double brackets.

  - Please check the prefix for the title that previous patches to
this file use in the Git log.

  - Now that we have a proper `// SAFETY` comment, consider showing it
in the rendered output instead of hiding it.

  - Please Cc all the relevant maintainers and reviewers, i.e. you can
check `MAINTAINERS` and/or use the `scripts/get_maintainer.pl` (you
will need `RUST [SYNC]` and `RUST`).

  - I personally don't mind either way, but I ask to add Suggested-by
in the "good first issue"s because I want to encourage other reviewers
to open new ones.

Cheers,
Miguel
