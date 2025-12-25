Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565682FD694
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766649413; cv=none; b=rhT7bI/PuwKkA8vhk3FQOKLJzOJTQpKxG2T4cViIubEGFs/lAqdo/dzck6HPCCQcPiND7rT1V1XvHbj0p5X+a2RGDVAsL6R/fM0Dsbwe5bgW3SfyWrxnT6sOkHpef41PWqLOPntqOA+Yh0uzzZ3/93GGUS3/PSJJAr11H/wIFRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766649413; c=relaxed/simple;
	bh=Jkb7kGbg83vVfRQBzRktntKWITXsGXoxh8aDW2gaq4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5WCKugTLAuBKBwjafBfrXcUMQ4+/cw2r3uVgKm/et3xrrU52ErCfQ3iL+BsNATe56eBjUHRm7lrLNlmi8PCisECimeVPiSNiHL/SSwvrTgusH7580WPha0IJ0veHfbU4V60DMuPunUNDZkbDvFYBi4HOQGztLaP1/51wpymKmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUraQRDI; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUraQRDI"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-3ec96ee3dabso5098359fac.1
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 23:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766649411; x=1767254211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jkb7kGbg83vVfRQBzRktntKWITXsGXoxh8aDW2gaq4s=;
        b=PUraQRDIb4kRJb7++IHIp0ZETEbvicAMSDTZIxtSkEBukjH+YtyTlqugkx35lgHLga
         QaNLwG5KBN3ipOyscXeYLmxdEIDzcKjwZUsyurNvpUbJ2NcJjDe+E5BG7KZjp0kqhQcp
         bPot1qK7J8vuJGS49veOm2uKODPFcwT0W67FzVYm7hqLb32weSuWJDZNCvFmSIFFD4JC
         KCNBvMjgzl2moiO0cNhItioVwU47mNqeQxpMMJQi2vGEjTfNW7Q+0jdmh92vTLleq6hb
         cdIqT2gBkzFkvGD3+jEIidoijjq3Of3kSpgeOYRXWIqbMoA4aI4D50va+fuvXz8ryxGy
         jfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766649411; x=1767254211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jkb7kGbg83vVfRQBzRktntKWITXsGXoxh8aDW2gaq4s=;
        b=ThCCPZD5fErSXEhDllKML9XEo18kGLHmR+BvAwKMO1HNC9hhJiP7TqzaGwxuWm5ryA
         9jVp7O15uPC5TJdGPMImmSCE3rWYQ7CISXNBpbe6aulsggXC+7meYCkgkYLb8owu1v8S
         OolJJzEig1a/ijvllukGRbXmIdof6EzOCD/7zspDzv8mao00xPPkJKdMnC739gq9hTRJ
         yuEzidXNfqCfu0IoloSMy2GRfI2oYSGF/8MJU5zBsvbmBmyzfDjZ6v584qsl5/+93Z1l
         vUOIjTKZm21VVSenVXi2Damx7q7YtXuqX7WbvXYcj2bqMWrhHFxixFfdi26EmFLnWjl5
         22gw==
X-Forwarded-Encrypted: i=1; AJvYcCWvi8Y8Nvhp8C+mYwtb2rV8Ri0g08YM5cnx//5Ie/+ANdxU9EZKOLVdS3PnZOQ4LSp4KO1K0j4M9Fy+AFrB3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKVed3M6jkFvV3JYFbnz6GNOe69aRKswAr2ad+e9BqIcvIJcuP
	H/KJjRlrOxxY8O3XRyOFGjjR16TSZeoasTEALF7j4k5ZpK1yS7v+Oygiqvquw06xtZVdxXadJns
	2uPn/Uv8EVsAUpfa95mRaNnkwNhyRdqetGuzU
X-Gm-Gg: AY/fxX5yYkXoTQh2Pe/ekGHWuPWdRX3i+I9yQxho2DrvEaS3Ljlp64EyAvvsdRes5xC
	LREjcVsimPo2T+G7sSxX5xNOT7xMti49OON7Yk8H2ox8SFu2pbGvRRqbVB/KeQLFRTVLRscTMF7
	mu0fbY6Iu4nniycgihYKZ0MAsf59Klch3hnvPH/eGYPq/0hnCcOgPJiFvET7Atd2n827zZ/cq8c
	oH4vE+rx/hAmm4CffI5YAUa5+6aN6HUS4MTdfSlx4aqcNxgkUqk+gkqssHYHplk6tlQN6c=
X-Google-Smtp-Source: AGHT+IHjjISiJB64hPaDzLvcDDJ1oFaUtkQ5hlp7Bgc2Mtq04qc4sWgRQ3cAw2CDCD0iKzI/6zYZU7KrXzFALJsjnbo=
X-Received: by 2002:a4a:db6d:0:b0:659:9a49:8fbd with SMTP id
 006d021491bc7-65d0eb309aamr6233965eaf.54.1766649411188; Wed, 24 Dec 2025
 23:56:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766544407.git.y.j3ms.n@gmail.com> <DF74FEXHESCV.3L0KB1DLDMFTV@nvidia.com>
In-Reply-To: <DF74FEXHESCV.3L0KB1DLDMFTV@nvidia.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Thu, 25 Dec 2025 16:56:40 +0900
X-Gm-Features: AQt7F2qc1qa8xEDR7xtZ51CzGnbsA1YjyS535MDQSLxKRj43RK8il4FSew6ZvRM
Message-ID: <CA+tqQ4KpWmjJfgBdphraHJrxDjp5J3Tq3ZN-o54wBUNpij5dOQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] rust: add `TryFrom` and `Into` derive macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 25, 2025 at 4:32=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I'm really looking forward to reviewing this one, but for some reason
> patches 1 and 2 appear to not have been sent. They don't even appear on
> lore: https://lore.kernel.org/all/cover.1766544407.git.y.j3ms.n@gmail.com=
/

Hi,

I'm having some issues with Gmail. It's blocking some of the patches
in the series [1]. I will resend the whole series using b4 to avoid further
issues. Apologies for the noise.

[1] https://rust-for-linux.zulipchat.com/#narrow/stream/x/topic/x/near/5652=
66787
