Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14CF3812DB
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 14:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939767; cv=pass; b=HjLQyfTcsE2PWxCVGVMZwSIPIeI8MQHXzWs3ErMXVH2buzXUadYWQ6EF0yiPAj9E9QJUOmheuM+jLKlrdrA1gSmkxvOCR0IhJRPDoDtyWJaiHjyqr7rCv20apvKxYW5RXWbNj/pqqiBekXO2lXA1zHI7R1lBmMlMNigrMhBHriQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939767; c=relaxed/simple;
	bh=NfHtMYv4QN+Dcg5DJMn9rLD+T5RYMVpxyClG9vZmrRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUjr0+sWIPi0ddaziH/lGhu+btjxUFtFYxPADBXtt//Dg1rt9OhOKubYP3+jMR5dMkwnes3/4b56yESPr877YqKlhzLH21EZh3cWWUwAcgVKABcdzMHe8vB7YRhwJ1ysnqR1qMhp466B01N9QXDKTHL0b7kZfTD8+GwX8wsKQVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pd/esPmY; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pd/esPmY"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cffd93cdedso1564045ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 07:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785939761; cv=none;
        d=google.com; s=arc-20260327;
        b=XzED3SdeNmxMgUouZu4zv/gMz7wn6HzHuyjVVsIp+O83Kl6mvM5wAI5OuSXcYEYElJ
         m822/9TaTFq4pzBCIvC/aRGIkEP79K1/ffgI6Dk3xBLu+YDSeWO+5srlijBOuWVT21w1
         L/wS890IxH5zw0tKyJ5zalaxqJaPz83rVgzAAlcA/gbHD0fbntkGMwTnL/PKvqcbINgt
         /bVCyr0A0D2tBQuWj8641DyqoqxmZtvuL0NApA77wWaOpAQElhQkC1dcTAJ10k5EQ2fk
         b5zGbsq7MJ59G066qJO28t+i+Zl036wOl3Qkebb/jDgmh6IbFK/RmIwhVtJbRj9XzTD9
         ISLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NfHtMYv4QN+Dcg5DJMn9rLD+T5RYMVpxyClG9vZmrRU=;
        fh=LAmGvpFx6GtBxy6LuZkwHhMLiteTghnOiBhMlc8XBrE=;
        b=EUZYSZVuS6wP7RaCkbRPZ3DEncwPdjmbYGm+AqWXsFXY5iKhH6D9db9GwmHx3H/vKb
         K+ruy/ok7bJ4g/e5+qCP7QHeAw/uqIJ/W15ya+bFGOZN73ziY4SfZaPwNf+OnOaroz3H
         EJlkALB9BqNmQ2w2pZZCnKUxKAY7lbBTZCamTP5uiiM3xdyqStJU2IlrLMSBkBdNV/nm
         bTaTrfuFoMbru0RVOMYkoLDQOMJRCeUf0FteJrCw/ImKIQ6AqNc6Exr2uVm7lgK7YG4R
         WWzxKpWGev6ZF/+tcvTc+NEEUgr4JsdjJAHNxMB/0ytyoZXnhv5j6rq9qzGJLcNBWvYr
         8OpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785939761; x=1786544561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NfHtMYv4QN+Dcg5DJMn9rLD+T5RYMVpxyClG9vZmrRU=;
        b=pd/esPmYjzNfW66ONCD4a+RRgl96NTLHYoeCfqMdJZAsr8rmE0RFYDpdWokav0gAxa
         afltfKGRbgSq27G7hKJ8ObLvS7s/KaxGOEAzfqX6mkWEs11jUquq5/ZuhWf+yEasJBzH
         YozYrqCkTZ8ztJOduUXIo5BO23gCDDaIRPzIXL+sf4HXZH2Ed96gR6hx2UZ4QaUAPD9C
         X4EvnRP4i2Utjo+HeHFT8cIHn4jDcrUlug4kGSXTBrVWEMHv2Yof001FuxxWXUZRZWfW
         80CEiL22MaBvpIEDTvv8CDIi5EaJytUw7oJJR7HFDNHWcSKLIlZMBd3+u17Dh3OlmEJp
         Vxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785939761; x=1786544561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NfHtMYv4QN+Dcg5DJMn9rLD+T5RYMVpxyClG9vZmrRU=;
        b=orfYW4w7tC9GD9+aeFYasZAOh0XoVJoKceT1Wy9z4mSG+BjnFYkrjbEfJKWO8yWnC0
         RsR0trgo+tduo0oUeT8T1rHLKBHlUNSq9JM8r2s1OKOSUbIT1XNgxILuvsWjeTdFwqM0
         WFrqqFwVQdjuXOgp9yBO2tZelChb75sesdTeg7Bo6nIfBMznMCGFkmoZ4XeKapOK/ta4
         7BbJoWq1BG/FvHuVMivARTA5yV1/O5qDLPFbzlfi0AxO+GYXdgi+tes6Sd6Ppb0umbcU
         /bX7WNhCgr3NfO9uTKG3yzd0Zpb1m350Ksk4JaxJE74Crr/PiIwjxS+sselon+Tq5PUM
         FDnA==
X-Forwarded-Encrypted: i=1; AHgh+RrgmqTwxA3NJk6+lmut+kNkpJWvElFAtm9jWP+borMKTjNfEzV9Ji7tU+0MyRg5P909V/PRME8pSOw1HBfFPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6PhS+odtDNXGwstTfieitxSv0if7hF9fiLgbtfkOZHh7AcdYk
	x6rG/8okTXyjRunVDNGMXRZvBULb+inWu4eX9zMZz81HOVMIiRkCrMTLaeGSs83rggkvOA1gMGn
	FRCvA/a+pFBUwt0o6IBJEiC7r5dwAEg4=
X-Gm-Gg: AR+sD10cSVYZ32/KNn/bYQKwTMpYG3u6G91WRB1ftf8A0tbQeBzs+Uecn28gsgZXso3
	W9HjmfymOWlr4y0h3YPZ300xiJvI6F0/VFqm0QrD1HLILNAR3dGvu4OVjnlGuG/ElWyltj/3ngy
	7u/QLIMMjoX09jsNk39s/Nusvo+egAWSQAC9poDAm/am0P+eba0ePzG9WQFBjWjVhDt2BmWm5CS
	8hQ5DO4Zt2UHbYUjO41FrAiqnywKWw0Vf01JLTLhOUsCnd47W8gd9re5q8p62YV+la+l+jTizvG
	y7E9pDbO5HynWqmkaNNNp/WIsXsCxfR2KmTfBnyRjUJni50Zt3TFN8WplWV3FM3aaGKlmVOiXqW
	9sDLGYpI0F67RkCuCNyN7/uLvnxbD5ZU4LzgdkoV2x9C7DVD3E6AyQ7CiYEmckc0BNQgNgdw=
X-Received: by 2002:a17:903:19cf:b0:2cc:f4d4:29a0 with SMTP id
 d9443c01a7336-2d0cab0db0dmr70044675ad.3.1785939760927; Wed, 05 Aug 2026
 07:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722214951.72941-1-tomo@flapping.org> <DKBXI6A044JX.3OXFT3R8DIK2K@garyguo.net>
 <FenzX1BbXwDwhxl2RJ8sf7OnFwsAi3prmxcHhYKtfyXwJ_l88xtj5rr-z8T90Dqj1Em0RGPwvxQNqlo0pl2e8A==@protonmail.internalid>
 <20260731.224825.536098581345512332.tomo@flapping.org> <87v79o7myg.fsf@t14s.mail-host-address-is-not-set>
 <DKH2NGL7W29L.2K5MVFFHP84JX@garyguo.net> <CANiq72m5ZWTAs8XXfPYkEfDj9CT4_N7ZShXSj33WqcWwNV=NWA@mail.gmail.com>
In-Reply-To: <CANiq72m5ZWTAs8XXfPYkEfDj9CT4_N7ZShXSj33WqcWwNV=NWA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2026 16:22:25 +0200
X-Gm-Features: AUfX_mwFoPp58Ui2TNDVft2gX0cUA8LrkZSTpBNELyqSfwVJon4IJg8ufeFZb3Y
Message-ID: <CANiq72kRN+mrq=fYZ=D_ZerJUn5=yOrgD-FNBzPq-ep__V4fTQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] rust: use Delta instead of raw jiffies for
 timeouts and delays
To: Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <tomo@flapping.org>, aliceryhl@google.com, 
	arve@android.com, boqun@kernel.org, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, 
	tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 4:21=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> If it is late for timekeeping, then yeah, I am happy to help.

By the way, in any case, I want to pick the fix at the very least.

Cheers,
Miguel
