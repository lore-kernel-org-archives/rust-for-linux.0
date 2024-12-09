Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9655622C6E8
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 07:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733728922; cv=none; b=ST9rqzbWiEAR09hjQj5O03r+Kmhw0QZsXGoOzut92ww6g8glxXFJbMWiFcervVt9hMPZ2Z3bXmjfc87ycDOD11e67uAomvRvcoWzZx2z/Xu/iD++jVeVsP31H8N+RV7FihNMVbkC1Bs8BXZpZIjx2ucgJp+g0Le8RpBYukgPALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733728922; c=relaxed/simple;
	bh=zeFW74cj5r6k8LgKjfKKCtYJ99e0zOsqzUvvINKMQxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IFAQxC9Ut8f7mWT48702IjRjeEzx2XyILXb3O+Fmw2mRo7Kr3365kMFMyoVfwR/8gOoaliazE5osWMqHym3JVWvWReqzRfzdDMeEbXbEUNh4fTtOWU9XCvKMFAVOrzt6b9tQDOLcT97sFkqt0d1ogslf2bRUl0IHOcRyCkM1O6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RnIDtCu0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RnIDtCu0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434fe0a8cceso873955e9.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 23:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733728919; x=1734333719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dczlpBpx+9AR0SA8LKnz6JiOQUAO64OXj3w0id1wjIQ=;
        b=RnIDtCu0BRglTchbK/dvxBtnS/lSQuC59/oMddwK2+Z3NwTFK3Q/mPqi0CbtJ1/3n6
         CSmRCbHkyJkQGeqWkYf1hXUWiRZThk0dg8NJnSG2HwiGvei0mhs09ExDr286gTQxPq/p
         WbEcETEVcckdWxAaKqjO0lVgdXLQfzGXJdI+V/axDiDEHGYTRgaOShWG/gCT7ocppMZv
         BuKx/o7C7VOhX3qJ7k9lq2ylogINeQYOjx4GWqAQhgtYLC7ZXT+nQkc6tT/a7Wea9/0R
         nR9kg6ufgEguBtwLrd8EmEYrezcW+9kxB/Jlf8x5pKI6GZxdaL0p5bubHwx/zpHLcpSE
         CC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733728919; x=1734333719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dczlpBpx+9AR0SA8LKnz6JiOQUAO64OXj3w0id1wjIQ=;
        b=Tx4soI9pqHWeL11JoM8ROKndmjAK/1/5FOzfIM+9L/t2+7Krc+6oEqDIRxig+IB99m
         TZdUR6mTnYesbpPGVokdT310NWTgS3OMZgneTRns2NnbZme40BGoYoG9WJhxbiASwSEZ
         0Q40cTYE497eVRV+XxSMTEMLTz0YgZ4egk0xBz+xd6gd6Tf6f0YlmOwQo4LPKL7IC7pE
         DoxnttBIIKxfvbyXfmZK5/3UOTHVKLdF8Xxdy500/tjE3/rmDuV22ce35JOEU4Z+1rEJ
         tY8dFT2r/6Dfg/JWsgyRY6fmsV5cek4fT11RkBV3ip7aaIW93MqqR89rigLO5UzYEucB
         EYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3CfvNthiI7LQ7xl+cWQpGB5IRsZXsjWfMJaMQk5HumJhdTQiMQSS79RFkDxK7raNvAwkAIHVTupzZ4usq+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjhNPqNRyJAl1RhGgN6qWWullxyJDO/pAfnfs4iqd7S8hze0Gu
	4F3/Dw7RP4sycq2xmzVChJFORjhbFPoWG7ZlRs9ANvCoPrq5v+bUWPl2GOk6Vpfq22vIncpJ1K9
	6cgapMGt/YU0RTirkEe6zJ1aIVJB5fyNmpXqIz8JNMMDnbksIqRw5
X-Gm-Gg: ASbGncssNMAd5K7K77CRzlbt8+OnlZUHPs/w/zQNNyu1YJ9/wNFGbLBncN81dHzlFRZ
	s9pzRdqLZXufqtXlxdasjIiRF9tmTks2j
X-Google-Smtp-Source: AGHT+IEfbZrPKJ9F8J1g8pZ0YwAHsG5a7MaBM4hv6Q3Al2fSeIZqGG+wOGjnXHZXH+TwPlupNRvkKFGcv4sUL9kkUC4=
X-Received: by 2002:a5d:64ee:0:b0:386:37af:dd9a with SMTP id
 ffacd0b85a97d-38637afdf5dmr4839030f8f.35.1733728918723; Sun, 08 Dec 2024
 23:21:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241208131545.386897-1-daniel@sedlak.dev> <20241208131545.386897-2-daniel@sedlak.dev>
In-Reply-To: <20241208131545.386897-2-daniel@sedlak.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 9 Dec 2024 08:21:46 +0100
Message-ID: <CAH5fLgjny4mZRdhSG3DS-GKPTfQB0pg_5sTroAw13wR-d_BhSg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] rust: kernel: types: add mode wrapper
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 8, 2024 at 2:15=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> wr=
ote:
>
> Add rust variant for representing file mode. This is needed
> in order to set file permissions.
>
> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
> ---
>  rust/kernel/types.rs | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index ec6457bb3084..35ac2898433a 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs

Perhaps this should be defined in rust/kernel/fs.rs?

Alice
