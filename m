Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89BA36C0CD
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 23:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786144899; cv=pass; b=iSsO3QDiWvrM3E7pYSwe4stPoOD1m6DjWzfXOBvHO03OkOKbuu/CZGPSG5tg/uq8lsbe7YNXR8MzHatZZZZQCoNXca8RULmQV5/7NwOfODQaBcW8/ocCHIZqX3EHFrBLTQRXbjAbXClHr2/NoD2jH+mMjXmvYwquF3KFK6L2cGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786144899; c=relaxed/simple;
	bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1p97V4ByXFAf+7jeA81CyXpyWWTU+qGr7bsOKUA9t4u9y4cM4V1Y8bTn2vCF0Wx7kuLcDtBN5bSDU727vvYPIxpghXTf4sHITYXlve8WkVr2eyWmXG1kKMsvYl8g214OOatf/+Y1LA8DW05iuZ40AfI5EDsfbfa6bJDXxlm20s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ar9J/uKh; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ar9J/uKh"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84a32ff53fcso14793b3a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 16:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786144897; cv=none;
        d=google.com; s=arc-20260327;
        b=HpxTaFgmAiDR86nEYP4wI9lq6yewo57IuRQbN31f6psSitGITPVNCg2R5jj0uXWwyq
         XlatajSARjfMAuj/eGRWwfYVZMwlXXacYsOGrJRo8LuJUfJnls14mM5zODCvcVFRbVER
         L4M0k1Ktj6I7NY1S8zsyLZJsLVGNCJ8dzWL9HvDCMw6dH1RtyiyYLzzoCrxbSYosv0Kb
         nw8+viOjIpIA9VPxVGfoIBgTHtvCixh7TxykuFlQzuCg6XzzdmNZPL9wYrO7sE4qTzf+
         DDktcJiwvPogEeeMQkjigP24l2Bjie1CYnMxwXmgnEUrtSovrgJCNbmxFnd7Y8W2ZU/W
         pR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
        fh=UeWSChqsVAn4VsjxMwObnOvZH+aftOxnFMPz7/jxqUE=;
        b=EEd23GBA1mk349znlLlWVFUfWtCMokdBv4Ucw5p0MiLRnjgSlrxnqI0OAQHmhPqyYC
         b2Y4TXRcfps1e/yVr9oeRAmMPS3NgN4GdED4rHyih0rJaJvBQ8hCAse0jfwDroCiOlKj
         wny7f1gopktQTQMrv6mG4LGN3AQMW5D2r351mvUg9ZKLLYscKYe/jugKDoPiqeQkkhH2
         nCm7bUktC1GOqVO0ENVrDLGYjZR2ua/05yLKtHjl1pZIxinqYwDiM04hj2DVkyr/Detg
         +6ZJOJaKI2lJ75kIfOv7O1c043nBzapzjzQIGExnyME5gIEOzzYF6BopbPZpNAnwvl3z
         Wu5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786144897; x=1786749697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
        b=ar9J/uKha0HSgnK2oyruntrN6tWTxD6OJrKBMce5w48lnZ65jWtXunbsN5eLRPfFFo
         wMi2hULLgH0kl14pce00253MbMgu4MO1m1BycVMZi7INJAEwlJ/2GQg59t2n13PudNbA
         lU2QLtlqQbJY91oeKZDGkkjSurd4uOtHd1VKBTwvjHtUmkZcL4WYu3tZuhZ5cHOoKJrw
         GZH4zrxdAZ3BuR9/VK8XSvfd3vmbvPcC+FyIqxVaxG40rqYdqIsMEO7OLIN8FmwLEsHF
         v64dPsKWNb5tebXdpAHivAq8iYH4v8cuIp4RhYsdO3juCYfV7nkF+QbCsNHQNWExkZdW
         aBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786144897; x=1786749697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
        b=Geiv8JHsajP58cUOy2ggHcaG4HjPJZkEd9/LLBhb+YTNGo4DEJ71i9WFW8xFtzG3jy
         SEYFx+kdNrpj+gz149OMnXllxMLqhuyXXyJow7yCy8UYpWEupRb5e8fa3mFcMLULqQqt
         tArrfj+arzuUY1/o7tQAZLsUZEdF+WuqpVdr+F7uM0ELvtrixdvEfr4r83tr3sxu4Ie1
         25l4v9dkIFZ41MVeSrKpjKNm97NvRfChgLaBbl4+F1IWcw5xbk23zDC1HHapjoFEhEIb
         9TjwkeZiOfLXu3b94u1T781SHV0xBjpIIf5WrD0dg8kKX6mTZ9yugkk2Nzn6/wXBZORP
         k21w==
X-Forwarded-Encrypted: i=1; AHgh+RpQzBSlS0Stxtrp9YMXWtMR6cBK2uQlJ29d3WPwhvBW47hoTiB1tC6fwgWRCoAdN9t3abKuqW6z4NO/HafdBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV0zc+qVXsC1o+siUXXYFTgIj8bfqdbU9/qZjo81n4m6pCLy7X
	dY6wVXzAhFS2+aJcFiw1w8i+HUmB7xVqNKH+ZY1I+ARksi0aiTdGGCC3f2qrnyah6uo+SBOftja
	qFZe7shWrqKXhHYs8wmchCHyrCPultIo=
X-Gm-Gg: AR+sD12nAqVhtaoXBEGfAouDLvbP68ev0ZH1Cq9KIh/nqR6wPlIPuCUCUkx0G+J++5Q
	1WTf33disRhUTQjvERNmnhnlimhCGQ7EriU9iGB/nSqDI3zhXIuIu8icfhtQp3Hrip6SfUNQTvv
	7JRYEApGqXgTYehD4nDNBVvRDqX9RtdbqkztjAvq9KvvitkFmupN6eePSuqJ4FLP+is9o2tqsVX
	R0jClRTZeA80ehKsm2AsVRZgWz2d3Ve71GhQP5kpq7rNldo+E3OwvRai8w5nBomMPIXwIKJF6Cw
	3B3+hyOoHIpvLa3cCtcXyMMQoB0O7je3JQayQD9P/NdU/F8vXcgGyijctV1KGgEmhKxoFWsf44S
	jVIFc1hqpmQbAqk5tKB8ilMkbcOY0dA3aX0lnmEYSTg6W4LIi1hb4Up4dyDd/
X-Received: by 2002:a05:6a20:2589:b0:3bf:99ea:aeb2 with SMTP id
 adf61e73a8af0-3cb8646fe2bmr20610739637.4.1786144897090; Fri, 07 Aug 2026
 16:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807221429.155946-1-ojeda@kernel.org> <20260808.074341.1056015191905819805.tomo@flapping.org>
In-Reply-To: <20260808.074341.1056015191905819805.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Aug 2026 01:21:23 +0200
X-Gm-Features: AUfX_mzt6ITrqPgmG06xYNP1noGEoKAQULArIyU1uaz5hrUcXcfHz6eFuH5RVl8
Message-ID: <CANiq72n4=fz=JNKY0Jdm8BnLa=RmHB2B7s0bO47YTJ7hygqBZg@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, arnd@arndb.de, krzk@kernel.org, 
	alexandre.belloni@bootlin.com, linusw@kernel.org, chenhuacai@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fustini@kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, kernel@xen0n.name, 
	loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 12:43=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> I sent a fix for this bug a few days ago:
>
> https://lore.kernel.org/all/20260801024841.786664-1-tomo@flapping.org/

Ah, right, sorry! I also saw another one with `rusttest` for arm64 and
riscv64. Did you see that one? We probably need a `cfg(testlib)`
split.

Cheers,
Miguel
