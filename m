Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C489A2773DE
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 08:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808515; cv=pass; b=i18z8aq2Va5lYe0fyuYO20LW5b/rWwkvpPdwqOh6TD17EeuoJw15D3vAPRN7zALD2X1c9y8Xjcqg/JaN2hj7CjmLeMoEsjvRXCFKEumFdyLNlnBLoj7VKTNjcvNSOZPlqgaf34fBKH9CyUwH7rZeiRzxwLQQPWJRXZqny+CACeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808515; c=relaxed/simple;
	bh=12uAIaSCl7tiswRNJqqBaN64Jz/2PQBPhlMgm7mCoFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2R7e6QzsYiVQ4J1APg8THHdgEYZ+I/RthBDqp6/D+/s3dNEkg3mejJA/HpI/HcQg4JsESgm0+qTiSd2fvulHcSjdmU9rDvsaeuMMB3v4sJdEraeYgf9QkPBhQj1JTNvyggz3evoj8VYUIBt4h9PoqRMh15ZPVB49oCd3WuTEYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4QDKeSM; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4QDKeSM"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30caa24aeb4so353245eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 01:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782808514; cv=none;
        d=google.com; s=arc-20260327;
        b=e0W/9EMlFs8dfFpDAN/4qYf3SAGMEnUPz+5EVNw2YwDExcN0RAjjA3I2ie7YFaRSPh
         VfDfrWMsRgpqgse5Ti6WUW15CSIljqYRR0tV0cE3e0UtSlfD0TDnIUSYGGPrakIzc+lJ
         72Ojbmf9hH+PX2vkSYAsTfO6OyjoZxEMdcbLqi4nezxDhQ87nIa7P9AkTusrNUIsKKlm
         vDkj/VaYMBcyPjXqIVt2ftmPcWstWz+pcxSWvzZU9vqoaiRNzDezW45QTn0hTfGVUDlH
         xp6IYheAPWbH+1nS8u8zS3+tZWc+tTaP6tJPNyr8ByZxIoz/w+ZA9x+FViOan7HfP+9v
         A2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2h4fg+PROtgYOgPDGjwjg1prtaKYRf+MRnb5H8GnFAw=;
        fh=INv8ToLX6VbSs1+3nmtG0hp5iaWnlDzBbjzMLd0GPLc=;
        b=biedA0CLODMOOufc20a9xm+dAzwWSNHLbRYEep1Euk4tcPjgK7ltCqRqvPGxl0EpqX
         acD/tpVzZ+7J8ILvgppMJ4QjmkfDQaRw0QdFMC8QkDrKASFAm3QWy7bc2gArUKCmYDps
         8KH7gV9Pn8/SXitprd6/HZ91AagqQQ39zqCjchUHOT0v2pLU9hEfEpdY5UaiPPpNi0zw
         NzaaFiKW4d3atJmRPHQjh+4sqeqXXN6KP+I/eQOUIhaxU/xVM0HZYcP9M9PZj1YTn/zQ
         n/sZcjRaH4rkAsvG3woi8cWeyX1G5juOP0Pu5BZsDdeTsBDg6NCkSSFgUPy6DscXniGh
         Zjeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782808514; x=1783413314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2h4fg+PROtgYOgPDGjwjg1prtaKYRf+MRnb5H8GnFAw=;
        b=P4QDKeSMKLnfVsDrpWCuEmR+fde0eSYT8JQqFhe7xLiugA+IX+ZEepZDsU6I5Ie6jm
         EtCDCgp7ZUpLvZdZ9CeeHs1gUu0FxMROHIvFtqAoQDLzY4WLKVd+sF0mn1+zSJcaOOg7
         ivbtAQ3UbteWlBQOZntGY9QsskxDj5hlMxFvEVEvo4HBZvZsK14n0N8BCitTpGtn20mb
         QA2/hDVc2OLBIH9W3JVORw9oy7kYaxNwQxRz/mq6Pak487EKo1e1i7J5CyPThcjxMTpL
         uBwhyWHKVQUOpS4s/mkDiT5cs0YZI553d1UZiED4mLQC2v3AAQ2O+HmyAr+DDIx3cXgg
         pdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782808514; x=1783413314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2h4fg+PROtgYOgPDGjwjg1prtaKYRf+MRnb5H8GnFAw=;
        b=TKQir0Y7ZM6LZGhLzJ8N6qIaJSpTgLPLRPTK8mkH8T5m18OcBMsl59N2e1npTiMj9k
         fYVfjNaS1Mknn+q4V+W9T7Lalqu7wcawLN0whS23DPDAOMJmHfBzq/32MfzhmOsa37+8
         xIBfe9Ul4fH0q9FUdRFRrZZCgwWd2+2Ean0xMRmelXZMCOt+ohb28nc3+EBh+SO81JSS
         c0nvFb1X60hASbAOJQhHKwivubdxJ/8WqfMw5kKFO32h/ogJ1J/dFFqfpa5lIjn6ubX8
         dlZKISwBHrI42tYZmIBqSv0hO1rQ3NltiOGac85auj7cfuphvbXZbuCWQCiBzfS+1D7n
         9bxg==
X-Forwarded-Encrypted: i=1; AHgh+RpDYUnj5kVbtwfSXOSN3NHE4EkwQVm/JNl7c/IDUDLoxVnTmkuHWSlNIpT9ToXEUk4Zs9BB7Off/YzMOJKc+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsIJZA2yqTW4xx0572eC+bcMH7Xe7XF2BJvffm1vH+OJ0R52wO
	Hkcf+xYlqBQ9id8mTdCjnek6CUMuNT9ZLoCBMtU1Gml1zqjw+B8eqFbu6s1rMNbUYCaonz3UxOV
	kcbCBXIbG4WOsJEw7N8XOYhrn4JRLt/4=
X-Gm-Gg: AfdE7cmpt7lnW2Mf8EUMAXTjOoWENDA8lFKKGkmd9jkCi5R5H6du7J7Mgifb1QM/uuI
	X8DUup3um5SRmYnE4iO9yrjIz9Q6CY35lOxLtK3jcYn68WzNvUxxnovpToq8hCgujrei7KBpZuQ
	P8aFctd5yqcK3udNCs4qLybSBEEpZ0u2/ozQUjgbyvBAWik3cffrvxs9VCJva8HVEeJwV8ck1N4
	3rLIcwN6gO0uGYCQchnGVGpWKkbemZcnKgmal3RcHGdqpEWtWlvPjV6CErAFBHdvhoMyO2gS8Zh
	rsKyB4WuoFAQ5PLw5+gv3E+j/Hacox5rmujIdeztTPcF82viCDAFnm6aqo752AG2hVHhBZAgkSo
	7pXW78jOjVA1e
X-Received: by 2002:a05:7300:6ca1:b0:30e:dda8:e0ba with SMTP id
 5a478bee46e88-30ee150954cmr1003565eec.6.1782808513710; Tue, 30 Jun 2026
 01:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev> <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com>
In-Reply-To: <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jun 2026 10:35:00 +0200
X-Gm-Features: AVVi8CdhtqV-BYuDJ7-_rhOqSdDxdGUExu9BuuQ1x0bjmiH_24JXcG_HI6rxurs
Message-ID: <CANiq72=SQK7pd-fj+4MOb=E6=R-DHCcLcuCvN=us2E5o7Rcy2A@mail.gmail.com>
Subject: Re: [PATCH 3/7] cpufreq: rcpufreq_dt: use vertical import style
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Guru Das Srinagesh <linux@gurudas.dev>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jens Axboe <axboe@kernel.dk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-block@vger.kernel.org, netdev@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 2:43=E2=80=AFPM Zhongqiu Han
<zhongqiu.han@oss.qualcomm.com> wrote:
>
> If the preferred style is to place each imported item on its own line,
> shouldn't imports such as
>
>      cpu, cpufreq,
>
> be formatted similarly as well?

Indeed, good eyes.

To do what we want, `rustfmt` needs the `//` at the end of that level
too (in the future, it will be without the `//`), i.e. the patch
probably passes `rustfmtcheck`, but it still needs to split that line
and add the other `//`.

Cheers,
Miguel
