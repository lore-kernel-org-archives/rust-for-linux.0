Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5B340963B
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jun 2026 11:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571435; cv=pass; b=n4TSNxFMXOnIVH6he5zs3Nr16Fces7u1Xz0VopjP8paqbJPrZ+5t9NHBJAOidT3fuZk1AcCLdv1WMIerzbLdwcrxpXYe9HKP1SG4Me6Gh8qdy8vdwEKkf+GpfqPs2sa84VZ+MEesArk7GmHG4nkDsNL/MZdqjycg7puJpBFeJY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571435; c=relaxed/simple;
	bh=eSci7xLpxgYHSBUqhNqtJbViKyYVOJoOaMBk8J7sasA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apSqJC74jqdlX/S99yjvN3mwUwHHYqm08HQGNfVlTQAR8gxVH+4C2ldzE8s2d2dkHwn2MTAPSd1ElyoZkzA5biWCcq71JPE/MinUDPaq8nSqInby7iZJ1iNI1geCOJhtd3siuq2SmosZakCIXhURKlB53tAaL2BIp83wHl/y8r0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A1z3xLOt; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A1z3xLOt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso7056525e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 04:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780571432; cv=none;
        d=google.com; s=arc-20240605;
        b=Rv9hUknAIpJWEG5yRijTTKOBuID7ABUja5q/ukW28P8oKxl4q9Qb5mF43ZcVgulHX2
         482z8DB5v7GTyOogEd8AwLSsEYDCX5MyVi0Ydnw37PM82LFNzzXkGPPTR7Wez+xa0gr3
         +OhejZGkkTThSMVNiJPwtTUDAoBIrK6roxcpoCtWtPooVb2tlhET2pmkmD60S5KPFWvY
         HqeTF2oFygM1RRAcllNfLliYVFOUYA6SUHhn7ld6M/l/4VLEWExkNpFfT2no39VdHNuN
         bPO6SPA1pDwelGv29rcOUuJwEUUqWJz6SrKyQQyVhP7WO9S0j/XM6iNzQIcgY3o8Khjw
         QrsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eSci7xLpxgYHSBUqhNqtJbViKyYVOJoOaMBk8J7sasA=;
        fh=QeMTjpXNGFYIt5wer4FH/kIRkBOpOh2hDtvR5zqcwII=;
        b=k9LbXivgrAVHQ+/oXJG/grRXSxK/NLhd6y5IPzuaQxynwTiaS7iKq9L37CEozb2HMx
         FZ3ydKIkybqy3BaIOUPTT1YQr5JX0JbBxBcCYFSaq/UCCZQw3swAo9fdsNyu44MIfjgE
         pNjKKE+HiujrsxdYRQ2naXLQu4tbhCokYv9NEeHqn4c8APwBK7JHPnaW7VILlEBlZiu0
         f/waq/i6JRd+HJl0UzmH0fneWylw0ghjktESTD0HCNrlMFC4HQn9JhE0/DYs7Bf/Rd/8
         awSX95tO36nT4ZoALgmCXWZFBVCMZWWIzPIvcs3pZBmDVNO/2iDEJ9XwWsmGEvF0vizt
         JcQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780571432; x=1781176232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSci7xLpxgYHSBUqhNqtJbViKyYVOJoOaMBk8J7sasA=;
        b=A1z3xLOtRcNaVrfJB5v53z+Aqlg4CUp47+QLZW/E8Sc4In67WuzIGtoQ93kF1d33n1
         jFek8XKrZtTSq8yBWRMANrzIfNzUzOGJQaZorEpCO16KCeNuW7FXhwFrIV1QFAx1zBLt
         +SstjgG8h95Ex5NwYfB+XgyBAXKUEpToEo7xey9Dr083760/E6ZsoBL0ZZ0JilbTLiR3
         RaQlQK23lZIwiW0xX1F7zbcnhhTKJhl6EEoZ8g+vRN6xdc5xn1MSNweMn+794NLmjVnt
         tPc6lxt2esrfqDqCeWcIJOm3BeSPgwlXJBMnQ2ncs1zGczz2yVq3GhtszFAKsl8ATA6M
         fkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571432; x=1781176232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSci7xLpxgYHSBUqhNqtJbViKyYVOJoOaMBk8J7sasA=;
        b=V3FwqstTvc4q0ZNalfeF/LvXu/poNTxccWal3ElaMxI6zh+YUQYvvz7ZfbwVFBk3yE
         5166lNqIP9si8bjJkBf6ihoIM5CP/qwde+bK9H0OF33ftmxdR3OQ488nuRF9G29vO42u
         ioEYeY6OSwbGtiKboI4oOIto+O1l2ccUzRzmW19wPn9RvY1Enjel1jUopJ7hdvavBsQm
         aoMqBLDpeFCK6MYfFlqYFE9eyr92ZogtPWrssq7hleE/z6Y6TeOmSxGWuM+Z6xqlqjhq
         KF4FJq83vgAB3a4V01Eqs83bV6ytagpddeFW3bVJ9yV/O+Q9fGyE5dNmzUf0jkKuyzJl
         0oxw==
X-Forwarded-Encrypted: i=1; AFNElJ/GVWJXsC/30ox5CwBIgA0WMzRX/4Nl1x1sxJetNDMWvGvTr8qva78//jwbj0oy3490EoHrqp1vQr1SUj522A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoibqvGXpN9mZ2Ps6Ul/U/BL+k6GAfKNsaFp1I2wED3Vsr8QwE
	ZtIjqMy3KVDC5SQaJdOCJbvKcPak3JcBpAjDeFkruND8B3qlPQZAUTEDxX9C+IPqhNVRHfx+Sg/
	/S2pvIWdsucy5zB+eEoi0Pq8cAInUwOW9YoJ6MmZS
X-Gm-Gg: Acq92OHSmrMQSex4qAyM37RtDzqvpAk6ERJQKN2ab+My3n6xQUCVNl9SZzVZc2B28YO
	k+wGw7HWKXTbyJHUbkcfuCs0hnWL9rYLG9C0gf5LKFzFoghSVVr5D5c90GwBeahmBwEjx8ibBn5
	WafKSe/2RLYCW3VYUfAm5ozWDhTz+Vnvr37DdQ4baBGjaAK3YfnVyixPteH9hUr7WgZhG/ND7N9
	S/cHTDrUPC2vhZ2q2ZKG/aYVNinV5FOlsVSeMHQ/IkwiLotsRbqydCSXxW2M5bh7+gnRzFmXTtG
	kdufVrF1M3jFzBf6fQwCZlwR6mHlga5lAmEe5mgL2+82yM5NDDN3hOYH3ouXWUffIoRMUYL8R3y
	DYk4=
X-Received: by 2002:a05:600c:4fc6:b0:488:9bf8:7f17 with SMTP id
 5b1f17b1804b1-490b5e95f44mr117890035e9.14.1780571431900; Thu, 04 Jun 2026
 04:10:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
In-Reply-To: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jun 2026 13:10:20 +0200
X-Gm-Features: AVHnY4KT0fbb0zrOV-n0xIWvnd6M6oIkQFpOjNPef2gzJpQvDH0c138r3Ikq7Iw
Message-ID: <CAH5fLgh8L0gshrfaHWxdAqQMtXY5XEm=TT2cx6C8W519Pj3+Jw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Rework index projection syntax
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 4:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This series reworks the index projection syntax in the pointer
> projection infrastructure to use the keyworded syntax to be more explicit=
.
>
> Doing this allows adding a new panicking variant of index projection,
> just like the normal index operator. This is useful for cases where
> compiler cannot prove (or cannot reliably prove) access is inbounds.
>
> The new syntax looks like this:
> - `[try: index]`: Fallible indexing (replaces `[index]?`).
> - `[build: index]`: Build-time checked indexing (replaces `[index]`).
> - `[panic: index]`: Runtime panicking indexing (newly added).
>
> DMA sample driver and nova core is updated.
>
> Danilo, we previously discussed merging this series with I/O projection f=
or
> patch logistics. However, I'll need more time for next version of I/O
> projection (implementing view types that have original container type
> erased) which won't make it this cycle. This new version for projection
> syntax rework is minor changes only comparde to v1, so I think it's worth
> sending out so it can still land this cycle and get out of the way.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
