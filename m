Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45885187850
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 21:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385540; cv=none; b=iMaGqD84P/JEsnwLMZLQ5oA5OeOBvuXpQka9VdjgdP5Ag4wfWgyzCehX+2Z9/jtoUXsn729gpc29Z7b0ympD7ZIZGCf81SLbLa1QX4y7S4KQcTbF5Ke/xRwdnV2WPuNAJ+Etv8UhCLJeekeAh2VVyAlHgPLpLnyx0gTh+PNlw6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385540; c=relaxed/simple;
	bh=K8rVy5egR7KYdyvj1G/LT7vFHSMS5DMXBrF6BSjj5YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rapIb5TzR24snEKi8x1rqInA3CeEo/XGpci5U02PY8uS5YBGbxOXAFggI8f0tNTFRj5O7CTyP1nauh1OEwutsBKdKIkqqoCGNLP/mPehhHLj8w+ENqKI95oBMzZEm3mk5VCgvdRb/cQc7Z49uWZSdkmBFCyBKAd4FSh+rviGk0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8VDjiP/; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8VDjiP/"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e0752be2d1so255019a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 14:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727385539; x=1727990339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8rVy5egR7KYdyvj1G/LT7vFHSMS5DMXBrF6BSjj5YE=;
        b=T8VDjiP/g5GnXR3+j4zouAsm+EfHno3wW4CoksoP0l5UsyZprXYcrZSgNnq7lYSfUo
         EfXqQwe3Bi9qfC/C9vc2EGSr9oe5ouVlfi2DERax9IevjsTJcL+VNtXoigk1xBZF721K
         1gCd6/MoZOXSDil9X2th5eJEKm/4DFr9PazPdE4USrdqt4tEuqvF0Fi1objmk/0KL6i1
         ShGUvvqgLfQcOeGHrk0DjNAc2h+WWdzJMhix5DfslnfTXnxcDgy7mOQlTX69fnSObB83
         Q5Hv27oJ5mlqB2sskMAv0tk9D6eilKiJXGBDu5Y5liLPwwddnl2eKrdms+lhdCeZlDcr
         nIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385539; x=1727990339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8rVy5egR7KYdyvj1G/LT7vFHSMS5DMXBrF6BSjj5YE=;
        b=viqoNYwkDP1T7WgcQoH1R8oNrE44UlYp3+9sJwCRSUzQiog0G+ERMEPow2cggYZ5DC
         JHWjaCGhLp9e4xCEQMYawvdWpAU0pFDrsCQSZU4yUpMBr+3k9rYTXx+bAuwhbir8eVfT
         /IUR9MYqFD/ZX/Ztfail5lVXjV4NBhfJGlSoyR8kaCZN1IqtJ90pWgQP66OSDFml9/Yu
         3dnn7knIp1af9u5Dl7mPA7/RcnMlJjoZr1rbI2AF2Jm6jJv/CKlI96Y7hw7nLEac/qJ7
         o5aAFZdzYPmdJEZ79/MkaUPzJkyVgJXz+MqV28vnCllRYXFhnH9iYbE/sqasLLZJbZ0S
         klCw==
X-Gm-Message-State: AOJu0Ywsr/tjOsvKuG0yj+ObBY1OKSGcvvSebR9qiTA3XBEUHIv/bJdu
	Bjo/uAoGW+bqozg0z4OlfqslH44m8kTYseGpBrvRoXEpXv2pPIotWWL97Rwd2rsYIR2AUpDadHB
	uG2UGlmsahAvEKrSOJkvglD6YcY0=
X-Google-Smtp-Source: AGHT+IHtJYh1T8vneM2GowW6VG4yi2PhW5wz2CkSinqg9/+kvREfuMLi+jIKIHJG0PbxK9UNfvjUYdpo/GyCu9yvOHI=
X-Received: by 2002:a17:90a:e392:b0:2e0:a931:cb16 with SMTP id
 98e67ed59e1d1-2e0b863229dmr522221a91.2.1727385538605; Thu, 26 Sep 2024
 14:18:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916073752.3123484-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240916073752.3123484-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 23:18:46 +0200
Message-ID: <CANiq72krWMYS=3BTLK75ZqhU+0eqAZ7EPJVoY=oD1N-Vz930Yg@mail.gmail.com>
Subject: Re: [PATCH] rust: mutex: fix __mutex_init() usage in case of PREEMPT_RT
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 9:38=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Fix this by adding a helper.
>
> As explained by Gary Guo in [1] no #ifdef CONFIG_PREEMPT_RT
> is needed here as rust/bindings/lib.rs prefers externed function to
> helpers if an externed function exists.
>
> Reported-by: Conor Dooley <conor@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/20240913-shack-estate-b376a6=
5921b1@spud/
> Link: https://lore.kernel.org/rust-for-linux/20240915123626.1a170103.gary=
@garyguo.net/ [1]
> Fixes: 6d20d629c6d8 ("rust: lock: introduce `Mutex`")
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Applied to `rust-fixes` -- thanks everyone!

[ Reworded to include the proper example by Dirk. - Miguel ]

Cheers,
Miguel
