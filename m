Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A204688
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 00:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705537983; cv=none; b=HXqPPI/6/x48yvbG5z3lwXcuuJ/KUYe4lM2wN8c4eYCUMnKtg74imidyrqR/SNSs6+oWPBFKJMLolbCQADl+AxhUjo64qe8WVkuof6Zu7wGJV55VBLWE24DKDTZz8/4kcgI4WKTV9r3aF0bkzXBKsL0GYFl4ZRXLHYD+KSRxO1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705537983; c=relaxed/simple;
	bh=dgArgh2ul1TK0qfeeoEFab4QDGDik0poHIox2rwbC+E=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=VqyLKGhd79EOxALhWhRksDeWkdWhrEsUMSzhTPimzBRojrgHOe5Ej/iG3L0xtoby0//BHyH9Ua55SiwalxxSiJJgU/ZCCU31ipHhg6Po07+GgM2rQeGU53hUn0AeZ8fq5eqVxLSpIDGNwdss0YgKE7Djl1rVopficD4ME9EeaNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=dzyo7iWY; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="dzyo7iWY"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso10011694276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jan 2024 16:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705537979; x=1706142779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3Rwf3gJEOT09pg8xiRr1kC0KFvTO5PRFFjNSH/Q5UQ=;
        b=dzyo7iWY+xmeCAujYjViFV3JJM3LOPoRn/8NhUxpbIed2ntd2pss+3NaTveja1EcJP
         exclnwTO80BziAJpjd6W4qyRmN+7aiZNS3oCABph84pvNgYglF6TNCfhB37C1ka8QNVx
         VX0U6io53ApRVVWMMvUr5sf08YrdQ4N4grDxVLobINeM/f2g9qYbn5w+LR38Jxjm5GF4
         4gItnQJsAb1Jx7l6TQ7zRp26fwgQOEN/Hc3qbm47KuBunOqEkoVE7KQQ0qrmFLW1QILZ
         sv4hYV1tMiSjkgPRZ1fGRibmIk9ojiwFl5mQkGKJQJ7iy0ACPeinWYEjtnWAW85/4zc2
         HjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705537979; x=1706142779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3Rwf3gJEOT09pg8xiRr1kC0KFvTO5PRFFjNSH/Q5UQ=;
        b=I0BTpkqYevRh7L4h6ri3BtSd5mu6/u4Pw18ipHTlR1mt0CPm7Ji/TEHrKrVU9b+8Ol
         uWiYCNlzEzJx+BB+MgHvT5I+UfGF0v8HbkWvRd0eJspbcAalaQiA40NtlSlqs0BgarFs
         IGP8cFXk53eaQNmcx0mL/4PLDY95FxalImLZP0SJ1d1Vrru0T97nPe22ARav06OaFfST
         Y6vKaQt1g034Id/IvaAnAjOzjSI47AqvvkKpGaSpr1q9Y6zfaBRCrdPtRsZpc/5XDmM4
         MEwHyItY099QV4yom7f7qV0ZDBsVfEWL1vH1vFHx7ohQbcpOvbum1JLlhd4lRvl3Qjz8
         hfSQ==
X-Gm-Message-State: AOJu0Yz8+Ka/Qi7kn2ko2OUjrmNbkya9FzgjiXLYil6HmjkIGBDwyWMK
	EeqAZD9HBKLYWM/I2EvLozCOTOhId9wlrjjyobt5tiTM3Of3LXwzWv6DUVaoEcfwEbGAZH3Bm0L
	fL7jGS5+BHOyEy91pMf+aXH47HaI9B+Aw6/AwXA==
X-Google-Smtp-Source: AGHT+IGCo4JFNmq1MtDg/snqnH71lAjqJBX/OiRCcrythqB/eqvOz+3GIr9QT/e6exZhyNRWx0HWSz+Ry9oldhKBIkg=
X-Received: by 2002:a25:dcc7:0:b0:dc2:23f7:665f with SMTP id
 y190-20020a25dcc7000000b00dc223f7665fmr20241ybe.127.1705537979436; Wed, 17
 Jan 2024 16:32:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116160141.165951-1-kernel@valentinobst.de> <20240116160141.165951-4-kernel@valentinobst.de>
In-Reply-To: <20240116160141.165951-4-kernel@valentinobst.de>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 17 Jan 2024 19:32:48 -0500
Message-ID: <CALNs47sgOaPZ6BiR3=WcG6bZuWVtF_vT4D+SLOdJ4jJoQwyAGg@mail.gmail.com>
Subject: Re: [PATCH 03/13] rust: ioctl: end top level module docs with full stop
To: Valentin Obst <kernel@valentinobst.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 11:05=E2=80=AFAM Valentin Obst <kernel@valentinobst=
.de> wrote:
>
> Every other module ends its first line of documentation with a full
> stop. Adapt the only outlier.
>
> Signed-off-by: Valentin Obst <kernel@valentinobst.de>
> ---
>  rust/kernel/ioctl.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/kernel/ioctl.rs b/rust/kernel/ioctl.rs
> index 59050e5f5a5a..5987ad6d38a7 100644
> --- a/rust/kernel/ioctl.rs
> +++ b/rust/kernel/ioctl.rs
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>
> -//! ioctl() number definitions
> +//! ioctl() number definitions.

Would you mind also adding backticks to `ioctl()` while you're here?

- Trevor

>  //!
>  //! C header: [`include/asm-generic/ioctl.h`](srctree/include/asm-generi=
c/ioctl.h)
>
> --
> 2.43.0
>
