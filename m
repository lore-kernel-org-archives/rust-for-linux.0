Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E5B13635F
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 10:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723632386; cv=none; b=Ctc92RXYRY3mmlpQxEC6VvdQfbcZPS/3rZ2emLymvaAbItJHxy/painzHV0Yqx39jI/ls7OCgd8Ji543EudRNs3PU7FlMFNFzdnmmg+H9RmxZF7rteQvb69k5wbtE1dCOnxwepGlPoLIFZ2lzUDezofzJEQMl8zYpWjjvbrYuJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723632386; c=relaxed/simple;
	bh=Qz2eygjM6S1Q9XhH82ognRA77PgSNh9zcVDgewUZ7jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mb8WNyYeO+mmY6eNcfb9XJeK+cC4FD/Z/sL3zRlFGHoF8a+iWKl7tu2fbodT65Tgu+V3XCye32+A0wXkuBm0er7tTGHRJ2rv2dF9b0yTsUA5F/es267OkU/l0RC7rc2kIcjzjDgVrRsSvLHclQpKwrxSK+RD2cdGdzcFPNls3nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNAUNU0S; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNAUNU0S"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-6e7b121be30so4185034a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 03:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723632384; x=1724237184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qz2eygjM6S1Q9XhH82ognRA77PgSNh9zcVDgewUZ7jY=;
        b=QNAUNU0SIKFzPHqXda6UOTe2NehxSbccg78UssPA4+3erdpLZoZGn1LND7S0t2W6/X
         8bZgixRBuyYX8cUh2dsXpMzjOr2EcgKZS7JYWhp+HwX+e+YmSLe4Ijt563XSn3+KmgtU
         EYhvlhVUy+4IEgR1/zULEkJmWw10HOyzmBQX29XxsAg4/WYABH2eTA5AhpbbD9HNVx6z
         BxqX0sTAaUixsjhEELdZKu/lQycqFqpIdcFoMIGHzzAQbcfElRDx3zVXqoXyCkgRchTR
         3uisxfcazgGUQybYYHbQSmVK9cjEfTpigHOBVDXpLHjKZ1KwWJXsUX9kMcHQ0eq9Ud3o
         pX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723632384; x=1724237184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qz2eygjM6S1Q9XhH82ognRA77PgSNh9zcVDgewUZ7jY=;
        b=eNLzS0ddUbBr9oCbrZhE4oUExfF97AwZT52aCPT3gXuRqd53VKpCQk20GxPVHJggpD
         TYdImOnPTeOESKMABnrxa1f2Jkr4zXpwBcXLVvUm77sRW38Anc8n1NX3vhwJR2JF9Dej
         j6JmqU4plxS1OIusMlcWmcCpBDtGblyNPbKuSX1HtltF2vohbBVpxjpcLUH9RlAjdViu
         CB4U8ognyXcefCXvN9pMvI6fJvDgypa/V0rtLsttyNYF1gtSeyV0Fqzo6g/EtrEL6zQq
         5LC+7p1Vnv4p7BHqnj0SgyLeOEvwuyVU9G44musaMNEt+yQAnecByzhJJOYKA5JYaOHR
         oPUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb0ZHx93scsiCNL6LzjPhwECHw9mB5f7FU1LiznqSiALdMCCla7hXVT8IilpDXdYb9i7fA0ltJDB+Q/0Xvpt1BItFP1aKUJlBHWf0Vipk=
X-Gm-Message-State: AOJu0Yy2u+29M1HKNaKolc0RbcN16uPbazoSRgI0FuwA3RjNxtb07aDg
	f3qxTBrVCBItE95cJ+76YZ6sjAvqy6NSRfAxolrUpce/lLVA6GnWw4KfK9dpuUbp7kRuc92pFdW
	2k28Nnk2M0lKYn/Ej1wdsEz5wKaA=
X-Google-Smtp-Source: AGHT+IFfOJydlOJX7BlMiqFqz3/lDiuHUj3r1haVA7FDtQ3szl98CExY6fdbngll+LoePtC7RNa3RMDIpKnzSlfurYE=
X-Received: by 2002:a17:90a:a617:b0:2c7:e46e:f8b7 with SMTP id
 98e67ed59e1d1-2d3aaa71696mr2513992a91.4.1723632383591; Wed, 14 Aug 2024
 03:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZrtbEErNnBNNH0uF@ohnotp> <CANiq72=Psp2vyQEf=MQfN61Xqe4UXT08Y=YeOgV_0LLEzTGfRA@mail.gmail.com>
 <8248a26b-21a6-4b2c-ae7a-cea74830f958@de.bosch.com>
In-Reply-To: <8248a26b-21a6-4b2c-ae7a-cea74830f958@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Aug 2024 12:46:11 +0200
Message-ID: <CANiq72nuXjUCXaX1h6wjGtVojgsWaWJ523Rpcpr1o6zK9vgiNQ@mail.gmail.com>
Subject: Re: Additional patches for rust-fixes? (was: Re: [PATCH] rust:
 macros: fix indentation in `module!`'s doc comment)
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Aswin Unnikrishnan <aswinunni01@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Yutaro Ohno <yutaro.ono.418@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 8:08=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> But would it make sense to try to get the (not existing yet) fixes for
> the bss symbols export and the lockdep key registration topics identified=
 in
>
> https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/=
6.2E11.2E0-rc1.3A.20rust.2Fkernel.2Fblock.2Fmq.2Ers.3A.20doctest.20lock.20w=
arning/near/460073942
>
> into this -rc cycle, still?

That would delay what we already have ready, and we don't even have
patches for those in the list yet. So I prefer to send another PR
later if needed.

Cheers,
Miguel
