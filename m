Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9288E2D77E9
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Mar 2026 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772351810; cv=none; b=pKsyJZfnCEW95TOYY17HYE35hW01oXH5jnpXOQ3q1wztcY6lXsCaUktjw+8CPa9ou8Mo8W+Did5nFxNjNnQBhdlVnmcWEIyd4KMQ4pyAYORGSn88zU4A01MY6Sv5PuYZv9l2o4pnba5VquGy3/u3PiAzletrSk5z/bJOCzKpmDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772351810; c=relaxed/simple;
	bh=fHPJXMlciHnObqoUj2uJ4M6Qdtd38LNuqyUK0JBiZh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtHDVjZWW/Xt1SnPnzu5axw9cQVaQVWa3j3CJfuJpWw0kFcDi5gaZvjZI/4DCvww/2PLEyCwGTPcUMocSDXlB3kJY+kVEiGj4ITArmiGpLZC36Pci040XyEIlKQ8ZVpFdJtlo44fuiRaZJYjt7Z/lAfGF2lbSr3VPHS7Y3VVm/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OrdClRVR; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OrdClRVR"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b934fdced05so459036766b.3
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 23:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772351807; x=1772956607; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UAkqncwaBSQm61ty4+VcxJqmyotEfziP+tLQOjI6vHM=;
        b=OrdClRVRF8bTRfDEl7XS+6uc9FAf83dGlFz0ZqZhoC1rTuuEvoJkmC27NSjJwYrjpq
         Xb3CIV9L5sZTGI9Otd030wm/jARVc3H88CE5FYn7pft/9wJ5GIOVe+DOKzOb65wcPSOz
         1xf2zDW6tw3ShheVQ5IR5XGlSwrbv6dozA158=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772351807; x=1772956607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAkqncwaBSQm61ty4+VcxJqmyotEfziP+tLQOjI6vHM=;
        b=TnmjYcq8pTVUZq8VP4j7vsc/AEpiKGyDKUHTkNOWcbdzS/iaPpS812jZj11jB+srvZ
         k+yOIoMVzuBU/+EaBEnHUJxJEGv45BaDqKgmnrsIwGzy5tZgYpWCwM1OpIjtNPE0YDa8
         8bn6XONlgZ+CDb7iQQRMfB5wFiQ4/e0NUOTSigZwO0G8kbH6rpcP7NeePle8Yh+1zxTN
         OiuPX52xpaUVEmWy+defG9cUKSythA4mEeiiwl9775zNDPi4HOAXkB8jHJP/ftSrtN69
         Um26y3eGzKKD/2MUwQYlOLIL69VhTcs4pFy0ckXUvDVcYEtPkCAN02q9BWdWviNfo+ns
         nCNg==
X-Forwarded-Encrypted: i=1; AJvYcCVuKF6R8W7pxcM+te413LCOuGZV7fpyMtZjXg/pspW/b12LRvmknOSAh+IH8IEVBjNPx4PBxwqJyBjtAecndQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtnB8A3QG/a0M18ID4lcxsw/ikQe95O6+QzcUeqMxfWjjKfBxY
	726fSeIyXXyXv2jJtWSppMom9SzV4kiyy1eYfE9JyeXhCck5Anrvx5jXHDPFRYFiAsxpkpllW9s
	bdVH3o80=
X-Gm-Gg: ATEYQzzjnmVcHeRhpERPCiBloISC96pvefLnDHddOhfDg6/8fT1CTEomLAFmqjdObii
	z5n6rNKm9HxLuHM5fQEux/njcnGrWoJtII8b6ddloNsX2rUDmTRqGCOWMrgEaRRH+oEJJBoyqBJ
	mFz3uo5OCTfAxbA+DMJUjo8iVxhVMUKX/R39P1vKaKt4SI6jkQlzr6Ev0wrT5V/kFFta119Xw6N
	5ZfJTsfTcQKfJhHsanACPi7dFJdGNnmym1TOTg5Zp99Avurm+ObHKUiYtRga398vo+rZr8Y9+kR
	0VYV0GeHsVxtCPmjs4dpMW5ulUiw6np1kHO77QPtLYUvZvq9HbniEQZsGnWjB0dxkLuYDpwghNY
	z1uH1Ricdx7wwnUgrTmNaQjTd7C/jw3hv/rY9txb162+iqgJsEIDZyHzQULdffbTLWS6PuZCiVG
	9OiFdv6iqpwEmYA+pkTLy/9+Uv0GKNdIHXPGToPefGMPAGqmsjiPsaqhkGefkfT2Su3kKog+6J
X-Received: by 2002:a17:906:2317:b0:b8a:f225:ede1 with SMTP id a640c23a62f3a-b937654ffebmr442691266b.41.1772351806807;
        Sat, 28 Feb 2026 23:56:46 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac51843sm350648466b.16.2026.02.28.23.56.45
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 23:56:46 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65f73225f45so5593270a12.1
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 23:56:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWj3sscjjcRaL5BB7ZOEwCQ17sfC6rIR4AIAY6VxKWf3XUF9YKCN6UFJWV1q9CVhvSYi229UElKRbYGfFebwA==@vger.kernel.org
X-Received: by 2002:a17:907:7f8f:b0:b83:95ca:23e7 with SMTP id
 a640c23a62f3a-b937636cee5mr554496966b.4.1772351805687; Sat, 28 Feb 2026
 23:56:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org> <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
In-Reply-To: <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 Feb 2026 23:56:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=whLdS-5DhAfJVOp_fXJcM2sx-V0DAocuwA20s3JcA-d6g@mail.gmail.com>
X-Gm-Features: AaiRm53QeH4tfXx0plcR1AZBTlH4cv4p0UAXb6D3niDubjG28DjQBxzo-g0ywYg
Message-ID: <CAHk-=whLdS-5DhAfJVOp_fXJcM2sx-V0DAocuwA20s3JcA-d6g@mail.gmail.com>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Feb 2026 at 23:44, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> In other words, it makes fragile drivers go from "you get an oops" to
> something much worse. The oops becomes unrecoverable - with typically
> a black screen at boot - because the probe is holding a lock that then
> makes everything else come to a grinding halt when the driver fails.

See this message:

    https://lore.kernel.org/all/67f655bb-4d81-4609-b008-68d200255dd2@davidgow.net/

on the interaction with the driver core merge with the firewire oops bug.

In this case we were actually somewhat lucky, in that the hardware is
fairly common, but seldom actually used - a combination that meant tht
wer had several people who caught it fairly quickly and were willing
and able to bisect it. I had the first report the day after -rc1 was
released.

IOW, it could have been *so* much worse. Imagine some random driver
bug on hardware that isn't common and just causes inexplicable boot
failures for the people who see it and are likely using distro
kernels.

              Linus
