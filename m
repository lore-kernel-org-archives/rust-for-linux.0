Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3E02376FD
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jun 2026 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487406; cv=pass; b=IC6pU+x5dQziliknXTgWW7l1x0UGoLkVQzAMna7ZDz9GuR6bygS3GSpsSzT+BCMaAtv6Mswz4WqWjBpn7gEYetynLnk7rcYRWXEvKBBIfrjOmuQqpEy8BN4qFm0Qb1ukMrGCFdLN26uOP8cnVOyJetM9JIRMQGc86JnZdydwT2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487406; c=relaxed/simple;
	bh=TLZHWIpqN74sQXHrJ+tZtAA2WHcfmMHzbUu8OcbGpHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FbsrcvcCWOckWXUTxWdRIKlB11te5g82u9JAuru6VXSmnWCvkhEcdamOiUDgdLblE2eB7eL8VoQRfLUHJOeflqWijTd2Fhzn6Wr3lTWYPRkM1Y1tPjDWUmG38EUDYOBnWu+qbCCrSn5e46268ixn1g4D3jUGEMaNvxoQaS/mK/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRnathrw; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRnathrw"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304e86ecebfso525668eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jun 2026 04:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780487404; cv=none;
        d=google.com; s=arc-20240605;
        b=BxHjGc0RwlsQ5V5GW12LPeDg7hYB2UOT8BgXNMKyn8eNBWdgULb22xRT+Rt7TYSmI+
         rX5cGJinWrYicFovbwMgConDHT5xBGjBd4oYdhj4OG6Ap/dY8wIDRfCI5yfLRKv0ile4
         9ClQiWBBXVaaAjs70mr6eTioDleeQuNYgWedylQm/4e1IWwCHQfhJyEE23pXrDIN3Qok
         S+VGmJxaiU2vA5oy95/2bOcAwtBhIMmuK6kRaKevzn9XForEt4ZuUgGSCVnLuC+FyFty
         MuxGZrX3B+PKSIhpeSIZAAH/237juhfTBQB2xsVZigsItcJm2KwNjBiK+oVIG7Qm54zr
         KXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLZHWIpqN74sQXHrJ+tZtAA2WHcfmMHzbUu8OcbGpHc=;
        fh=z+OYa8y8hrXlpGFiO75KkvRWhg1+pRZg3wBYc/FMT/U=;
        b=P8gI5ur95Qryy2Ix79sKmU/jP/zJVV61d6yG2GKwUHsdOh9P+I7x1SqEw61RJk0GCl
         Qh6rtRdlO/qtYMC2WyVBj39mOZHPDcxAlMWA930JbLq3cnezp27sPwNubweDxzGfPMuc
         JN2+Hm0dADkOGCY0CKLlpVHm2qaTJdlD2ucBZ2YU9ok2G+bHq61rFAPaW6HiYrzSikog
         HckgNeouknEJNTVKRNesc605wvLALeb3J3Xm/8yffgq33uKLVIfr6iq25uFzokGqr7RI
         xb7LxZ0RvtiamxGkH2Swv5dskd20w5brgGynL0QGzC/PwGflEq98tPH2eiuTuCYOhQ2y
         2hyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487404; x=1781092204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLZHWIpqN74sQXHrJ+tZtAA2WHcfmMHzbUu8OcbGpHc=;
        b=KRnathrwsazGIKsqpPmMQMyIyuHRj278rBcrIS5sAzt8psTtc3QgxjVv5YBXgsXtO0
         8mAbIXFbHQ+ABtf/Nzwoe2ZsWhGnmp0nocFaJ6pse5wHf4hStlBpDXquRsE9jhiKHXx5
         Si03rTT4JpX/JkHOdQ4VMXAx240RrWkL380BnoDHQfHk5zEMKiAR4qPZ6khQVGxUMU4I
         fmu5X62DMZISY/A0uwS/GHCKlZjkquKp+GZWzHcIFCEoxXAv1ZjDzFyzqI95tIuCfdKS
         IqhQNtReiwUs4sC9G5tKcRphzXssrld2Yc0jdnz0e3MLtHQBPiOfU2qAAfhzlw8ZeuHO
         uhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487404; x=1781092204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TLZHWIpqN74sQXHrJ+tZtAA2WHcfmMHzbUu8OcbGpHc=;
        b=XsAOZlbPQIp+LM1diHkokttJjqaVZWZ38cFvywhFd7fOnTqca3LITx7lUMaJSOBYP2
         3YsMiAj2A6Kig54l1WDuxLl9iPZfVmzZBr8Hv0xUAbjkhM5vB4pAYhb7+HQWoTglAzXs
         ARcZ3cwML8Sa+elGnrqdXiYalKQa3yRovx0hrkJkns56BFp+uu0WUvQ4wXcwzOaotd+R
         3eVQ4pWzAXy8DhCGhs2WBJmYTL+bnZDAecy3TXAWKHjWQzjahKQAxyHIYVMC0+EYUNqt
         9d0h3jil4g/MxdjhPBFuVm98uzvHm3ZW0vHyw0gI/mLJ1Q/7AJtutyE/cBWQFyHii9nf
         LuVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZqtbNIloKHSOK5icNy11G8kVveYGaeKuUY2I+Ho95i9bC8h4sJSnaRu22ON4NMcBNflPwy1Ly0XLXGYEp4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMA6nOg8c4QI4cyUtyI3NvZXwwDKpijrpHVogCAPHG9KkxJTJr
	3DRIPVpS4Egfu4pCdvdpfG9BXPqw1RUl9dNYrObD8LrgDbqKzerNmLcY8KFewVrWHa9qUdSkABZ
	G5Cuike2SK93HNONYlY1pj2PfYR9ahT0=
X-Gm-Gg: Acq92OGAq6O3wSVaCHuhn3pLYgyP2djAblAb9e4UZsUAlSBzdF/+ywgW04XBk6hU9ZB
	r2f4aDSjp+orlXMvO/I2EvpUcz0oKjeX2Pe9g/xaKal9VDUHDENs8hXHdfEH816U6027wLjYcNs
	3ffXuAxT6NMbF5wqA93eWhLF+m5sU/ay9g8p6wNh7rGby/u7sulQhsNJ23nWqztukIdmTyf2ZfZ
	VmcBhL2k1ZjwSK4S+UeeUclC+h9+wYW0/6LlzMJURW+QGmH2rm1lfBoOYRAnGpjACuDaIgM/Bfu
	9gdD7XdGz8Yxgd36jhM/UPgHNUCE20pUwg0vcRb98PB54LvC+t9bvS9r/BRyWgJklEH66hU7qR4
	ET5+v/IRG8g4FxslRj5ahUiZ+kF6riuZR+A==
X-Received: by 2002:a05:7300:cc0b:b0:2f0:ddce:8468 with SMTP id
 5a478bee46e88-3074fc26eb6mr769327eec.8.1780487404307; Wed, 03 Jun 2026
 04:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
 <CANiq72kbzmLeFv58mkiKn+LvhCXmH5g7UsnTYTcVmJ6kyc+vLw@mail.gmail.com> <DIZCF27FZH6I.17CWGBTLDNSMP@nvidia.com>
In-Reply-To: <DIZCF27FZH6I.17CWGBTLDNSMP@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 3 Jun 2026 13:49:50 +0200
X-Gm-Features: AVHnY4KLkt_lJ3NQBEx4139A-z2PzHbNSKGJ40zqfE6a-mpUvOd_VHKVite3y1s
Message-ID: <CANiq72nTEPWds0VUKC02RLh5a3TLNyShikJD1h5TDc-26rrk_w@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gpu: drm: nova: enable calling into nova-core
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 12:30=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Yup, I just want to have something that allows us to call from
> `nova-drm` to `nova-core` as it becomes increasingly pressing for us to
> be able to do so, but will be very happy to replace this with the global
> support as soon as it is available.
>
> This patchset won't make it for the 7.2 merge window, so if support in
> the R4L build system comes during the next cycle we may even be able to
> skip this altogether.

Sounds good.

> I haven't thought about that, no - in that case the parent `Makefile`
> would need to be the one in `drivers`? Or am I missing something?

I think `drivers/gpu/` should also work. Maybe it works inside a
deeper one, but I don't recall trying that.

So essentially you can move both `nova-drm` and `nova-core` (and the
exports of course) there, and then since everything is in a single
`Makefile`, we can just add the dependency between them as a standard
Make one.

I think you don't even need their old `Makefile`s anymore, and that
avoids the double building and so on and so forth. You still need to
emit the metadata, but I think we can pass the flag, avoiding the
custom rule too.

Cheers,
Miguel
