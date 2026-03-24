Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535FE1B983F
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 13:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359135; cv=pass; b=bRf2Q6ISJp5OZF4y4y1hOy5cebzLItCOcXrWMbUu0kdh9GHcvIyAh/hjhHW+blMTTnIO8uh3jlFZMYLWl0Rph4tgxSdAGRTe9/AQdX9Y6gRjoqa47dtCqCMjwv/lJNc/H1hUOqqhi4SQFJusrMIZfM1lCI3twNrvbBO3ZmWirG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359135; c=relaxed/simple;
	bh=weIWvEifmKAG4/4fyUAG0sXl4GY6uGPNCJ03+3h3ApI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lO0xvyNfIRSXTKiYCJNhOGEsFyuPvwyLE7cs1H9dwNldR9xo2rh9+hpjTAHTQjizqXjMBi4zT6WvuNuUBim3KTcljZ0tvfFaR3U90OgYccZ8+mYMCvtsCTZYSwlrVjYRajp5WUlo9mHNflEobttkFPcLBHR8U7fQRpVA3HsA740=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caBPQyAB; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caBPQyAB"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-124b07e5fe4so426576c88.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 06:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774359133; cv=none;
        d=google.com; s=arc-20240605;
        b=g7iNIsBBushVr49c1CgWOGatrPbLzLfmVuawYGhLdsT1AJgs521df2jji+rheoT9Xj
         znsJtXvBQjSTmALuAzJvbDACtrFqtoGJkPmR7eIANkGKuU0NW0RHlFoZLq+HSvpUXP+p
         pFnwq//WI/rQ3Lamqw6yD02TvF7Djm7J+O1vi3pLM9ONneui+ZDF7ShRrd0K/cvedYKk
         aBuokGixKHMKoG5164Qs9+U7ECJuFt+kDAYzvqQrv+VAtWKAzvRwFSSdCv3whJRGybk5
         LFB0881lUdub3iRwW3PojyeATgcZkRIU6OjWNOEVK1Dxg+qB+mr+k/5hCFFPpLfD8pQF
         KwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WobroQ0+5Lr24MuKWaLQDZ7o7J12FSlP+m6ocf+RpaU=;
        fh=HnS6Qtuqy0dAIbKzPNPCsVbvwwt61WFdrdbjTj5WsCk=;
        b=IuUZTe/6SpEslOv8cVa+6JxFIUY2D4Ngb0GEz7UFcoawH81KWm6NXKVibL9BF9r7vy
         aOdZquL5fnssju0+reOWupAoNapaHBcyufDnmT1+Hgwx++QXggyoKSsGwMFo6ZXo9q6w
         Rrc0kMVRWBWqUgA5CF9rMoTZoO6vVF5h0oIStUrFiXsvjPvkNHoIjZZmSPI+oIAhZcNy
         3d0SlNVy7wsO+fSK3mvpCgnKbZyRWzh/fwF8t1zJYyAPwnZyWg+0KBOJvyuTzwmUzzy3
         qgU0G9++1KZSQeRj0OEWfA1tlXDjCC7cxPDnGG30dV49DNIP1HfBLYNE0Aa9TLGYGuy8
         D/Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359133; x=1774963933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WobroQ0+5Lr24MuKWaLQDZ7o7J12FSlP+m6ocf+RpaU=;
        b=caBPQyABi05efnKfzQo9r5lMrA1IMA6nIfU7E5y4R5U2Mzb0v6WA6VEXkBHEyKv+tm
         qNlk33Ycg5frDDhWfCZnra7FRlVPEb8nsnpmEIRgGAFH3Ni4lcuw93dCiE53xChfANq6
         OFGvJp3NjZY0j/DcmL3LieCdNKQdC8rsRLeXdvF87HJSvl/JX/7A8w6sZHF/kAHmnIKU
         mI+VuZmjmiJUkjGUuySH+GBZWFs8mrFaHfS4t0bAmDYnepSiRFKHEY2cTfyltqL0dYGe
         4AwYwZQ8gR2vtrpEcgfPgEAcCYJveUVLxcyNgs8YpHXCqTcglQGmH6xX6MB/PAxQGtH+
         0vLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359133; x=1774963933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WobroQ0+5Lr24MuKWaLQDZ7o7J12FSlP+m6ocf+RpaU=;
        b=q52P9SsVu5Fbcfk2TD5/WNYReSKCnSTLcjlMQif7O7/aqHtFWR00N3ji7j4pLDWWUE
         KN1oVQoVh4T4mkFiSJ4hWVEVsgraiPnqbAMYXekhQCgbj4fiVLpFd63mTBl8sP3vQro6
         2s/e3he/WRbqos115RDt1JwHFbM8DTPI8UR+xzhpRmvoLd0vV7jRb8vWg/rn1b7tNXHr
         QJp43qSmluPlIG6UkWjktneCxas9WiBq2h3COOhF2xaHXOVROvNSfA3csHyS1GKvN0SV
         0aAH24hRIGBkZH/2FHQ1MxiDaUcwqcLsPupUHH+psAs2oFaAMEWVlXLbnaIzonkmy1Ec
         vx0w==
X-Forwarded-Encrypted: i=1; AJvYcCVMfsPJQIcDysQaiWy5Iy9P2QU6eIKtQof7LZinAI7zaZrqHaVqGLybI15gszVdWvO3ylBjgpyN1cey531hYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa06LdXh53N0dw8lW3oaZqAKm3HS4xPb03CxCs6aBYRMDA5A75
	b/6tcIvgR74TqLq2PuhIntpEXaSwsBW4qbF09LXUdkwQ0f1PmMPaiHdTVBO/TX5mDkTy/fPG9Yx
	6kq0BC7JsZUMKaIqlJK25Lf4TbntO0ns=
X-Gm-Gg: ATEYQzwzm+u5WHv9Pm3xS+zzeS7vO2H9JdmhuuWLfLNiSC4Z2W8mF/u2bFQ8FF2hKq8
	taBtW2DpHAtuGjJ/SrMTsYh+O5fbE8Ugv0BZgCR8SVeXPfdnVrbgKT23ONYsZybYkNG10KnlAjM
	7N0SnnMNpfSDFUK6SRk3/JQWjqHT2FOqkUcT9DQxIrweFlpZhZvm9ekUYh0O2o2Bbx3tj35EkNB
	JiCkyeg44ns2+KDDsCkBPca+djK+B1AUtvYY9xHhjW1DQZjLsDnSoICm0YfAHSWBdMu/RHE40O9
	3T6yszWcu5+TSlMypGNaNYYqQgQhec8BR0YsyFsARDb4s3OizJSCNQ5xlh8kEA37Hdc5iZTDOp0
	N4qDf0ppD/O+gJRJF0dWbp4U=
X-Received: by 2002:a05:7300:d704:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2c1096bc4c8mr3319521eec.2.1774359133198; Tue, 24 Mar 2026
 06:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-regulator-fix-v1-1-a5244afa3c15@google.com> <1B177B09-D3AC-4419-A364-4489BF8D6C50@collabora.com>
In-Reply-To: <1B177B09-D3AC-4419-A364-4489BF8D6C50@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Mar 2026 14:32:01 +0100
X-Gm-Features: AQROBzB0rC5DlJ24Z866fSEq29ed8_Klt-Na0Bo69-72BK1UEY0Fyrltmg2V_w8
Message-ID: <CANiq72nBSC8-N8C+Do156dkCT2F9Z9e-NpDZbcdgBSTUKUfv1g@mail.gmail.com>
Subject: Re: [PATCH] rust: regulator: do not assume that regulator_get()
 returns non-null
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jean Delvare <khali@linux-fr.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 1:42=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Sorry, this got buried in all the email I get from the list.

No worries, I didn't know if you had seen the other thread -- thanks
for quickly reviewing it!

By the way, by chance, do you have any comments on the couple other
suggestions I mentioned in the linked thread?

  https://lore.kernel.org/rust-for-linux/20260322193830.89324-1-ojeda@kerne=
l.org/

i.e. I was trying to understand what led to the issue and how we could
avoid it again.

Thanks!

Cheers,
Miguel
