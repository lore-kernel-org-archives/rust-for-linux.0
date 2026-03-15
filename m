Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A4436EA80
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773598912; cv=pass; b=q5k9893T9LJgzd9QYH/OhUns6CFT0AFkryDN3onug/mVjaQPZCG1A9cnMo7gngyqZfEax16M/tDkZwkrLZaenqi6B0TG1Go2MQVcBkITzPAS4/yGYAe5x3yiLI58Z4TB8RmHmZ7eVwOFzwsyestFZdzYlh8h1wDkHzROZpC+/e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773598912; c=relaxed/simple;
	bh=jDWU6AdGhvC5Yx0E6kUWqqP+61uOz52l7eF/UILatEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hkq7SEyiqkERp1ej9LHL0gBmpjkFcLwlSUGlxuGViQzZMsGWPb9qIZV6fNQz2R9IE8vT4q+wL0Cw70od/uN3bsi3GNQkVqAaAQDaOBTQHJR1WKfCdJup5oZgm96QTcpGTs7kWKEM5L8/mj25Eq782m22FaSuupWCLHaxe5Qjer8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzAlJRqp; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzAlJRqp"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bd5658b901so244406eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 11:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773598910; cv=none;
        d=google.com; s=arc-20240605;
        b=eghKUzNx7dcpXxHs1RHjioK90WpZc22QeFoh907wGhfjq6wN8Zzv5vcKwXhiUbnv85
         WLmta8C9OGKzjcl5SjruhYscVHe5XX0qC9lBPkh0j8TnSS1ONownrJORxUduVV01C67Y
         RX+XbNb+m/e+f2uTkQlwSQONfRBb36jg7h5pZc/g9yFoYXU1l+qJO10HsoFZyaQ/k62p
         CAcI+z6Or2XzSK56cadmuyMiF+Kjpiy9qnO8FA9ckxm4thRu6mfcDkxayXCYTUPxtv22
         i/SYRVWnWu3+OThdDB9Ere4y341mARHqP/n0OEgk8twySZsPwosFLIbBpiNDa967+rKh
         lcqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jDWU6AdGhvC5Yx0E6kUWqqP+61uOz52l7eF/UILatEI=;
        fh=3TF8agmSaPWymhh4rOl8S3iuHuHyxIoNX4WasAzuYS4=;
        b=ccQ2j5AT/TKCrAKqA4/+LxBAdCexzkC2mem/JAdqbQc8RvL0D3MfL03Eh9N0qe8RiY
         4Prq+FS5M/eg2G6xyXB+MF0g6PYcpAj7mcszUiZSnVYnUghjiymaxLrrTBh/4Ddt+k6i
         +r2Z++4CF51kdHwYYp0RFYVKtg3VH6Tj6M6mcy+GMa36sklyOV507XQUQ//0eSRfMFQu
         oRWgHz2B1Ny1q1qhtUMc2FIgjkxmZJyAZp6sNEMiGkECIDCfWPL4MZHLtwjn3JtANlPz
         OeGBJfI3h8IskDXVHkkhQMBVtCbkAa2VJgHewR3xVRa63YAgMQh87yATX5+qAJ2JfDBv
         n2lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773598910; x=1774203710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDWU6AdGhvC5Yx0E6kUWqqP+61uOz52l7eF/UILatEI=;
        b=HzAlJRqpf00I5iuQt5ArG5L+zYSPg/yyi6fxZTlxjCp8CMRwrePyDzCKJL+Mh7EWTn
         4IJglDFQ2a/LlW0rB1AT2104r0NadyvffSV9BwRcGBMC5X8zdcvieSw6xmPf1J2w19CT
         MiZMlT1z7h5XQ1mjNI/XDQ3MWb9++Auq54bv+AQf90hLD1mZlQTgnWhbO+pjApY/+N8o
         7FxCHbVJDUTvRLiTdSjS8PEkoERw2lAkJFP4qHcP8JRq19iBMPtUVSy2U5oTHJ3cVLDE
         4zGE3LJSoWMPICo7qW7d6FcrHBxrUtnFzvbbGNGdtQdEN/vPrGdifYVq3oEgGc4FF4kQ
         zoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773598910; x=1774203710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jDWU6AdGhvC5Yx0E6kUWqqP+61uOz52l7eF/UILatEI=;
        b=PPaV1ECJTDEJ8jPMhwoAxrtfKuajKOJ3umVQMgXYCvhCuNyL+N2WYeeZHUImJbcNW7
         ZCpNSbC8VMitvxvW9Y5p55eWE/npfvohsOgA4JWoWZBpmaP6BJXeObuqNGMOZmuaWcpz
         Z894X4Rw6mLKFr8cs4qPZVd3g6LfhteVph5sTxvcy8O4VSl73z9TSiPN79sEsUg7NXoH
         5vtfzLMorxVwR4YjdLBgY5O95c8qBJ+UDQYiLEFEpFnBgK7qvoFiGIQpcCh6khy6zqXI
         Jv8SYMEg6hpueLDTaQw5qrQ8qWRb3ZKwD4b39s2NG5EhRZ+J9+OZfXaCHVfhZk4oCZjt
         iscg==
X-Forwarded-Encrypted: i=1; AJvYcCVEhhc9HXr8vPKYj5XE2aBpzNIWZn26xKtC8UeDC0pvmo9oBgkuu7xNO04asT/RLAbDtAGXkZwfchG0WjZp6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5QHfIsHYpCN9wpKZzAYxMdyeftztFA1wzDYLCH65cZKEIbVIu
	b1M+NhMCeOTuVKMegvEri6oJNaPX/1ONxfpwUfzY5l/nH1+fseD+CHkDo3DchL33S6TyfCoMTLz
	K4IVGwhOcRsNnqA8Ufi2hGNekNqKbmjA=
X-Gm-Gg: ATEYQzxHxNfzUASOQIzW9iT5g/YzZhAnqPTBW9DsMf1vJySh5RbK2jsMqlfhTAD3tJh
	p4rCs001coz2y4/xpr8dBt1cQYMeEjI17lfuJXTtCYb1lGJzJUxXkhqvw08Ina0zCZTWe7YkNdt
	t7wShZH3oHjhCC7TFTwPQBYJq9TnQZFrtkLA6vkt08aFFAKhnPbtmBkpJr2gi/kF7InYkGFrbAQ
	5+n/H4CCgnRHN4Z1+BM5ZDQY0VqdV+2TXEdJA1HhBIUshJP+DiIwK/tOent75UE97hBHxGrDmkd
	IEcHhgw6u7yoBvLE0gpyo1Me5WyMhvhBO71q8xk/YiGx8aXzU5viIQ7bsYrhkqbYryj5Kp5wejb
	ZzWTeQbUmUydiIJFTMoWg+q8=
X-Received: by 2002:a05:7300:4313:b0:2c0:bcca:e9ae with SMTP id
 5a478bee46e88-2c0bccaed2cmr503104eec.7.1773598909944; Sun, 15 Mar 2026
 11:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
In-Reply-To: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Mar 2026 19:21:37 +0100
X-Gm-Features: AaiRm504huR_jEPQjv25PhnCGlqvxnPL_8XhiojOoKqXdkJjPbWUaTm98aG9g50
Message-ID: <CANiq72kdfYLmhojMo=vOAc5tULjjB9V4bM=iUmm5cLGpF-zj=g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Optimization and alignment for MMC, Rust and iwlwifi
To: =?UTF-8?Q?Adri=C3=A1n_Garc=C3=ADa_Casado?= <adriangarciacasado42@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Boqun Feng <boqun@kernel.org>, 
	linux-mmc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 6:27=E2=80=AFPM Adri=C3=A1n Garc=C3=ADa Casado
<adriangarciacasado42@gmail.com> wrote:
>
> These changes were previously submitted as a single monolithic patch
> but have now been split into logical, atomic commits as requested.
> The code style has been verified against checkpatch.pl.

Thanks for splitting it and fixing the diff, this is way better.

However, it seems you sent v2 three times. Was that intentional?

In addition, it seems the patches here are independent from each
other, right? Patches that go together in the same series are supposed
to be related in some way and/or they need to be applied together, so
I would suggest sending them separately.

Splitting them into separate patches also means you will have a
smaller list of maintainers to Cc, since here everyone is Cc'd for
things that are unrelated to them.

By the way, I would suggest using the `--base-commit` Git option when
generating the patches (optional, but useful) and also Cc'ing
reviewers as well since that will increase the chances people will see
your patches (you may want to use `scripts/get_maintainer.pl`).

I hope that helps!

Cheers,
Miguel
