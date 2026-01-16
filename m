Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4588221ABD7
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 07:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548623; cv=pass; b=puMeLMcyjneedbJeP6/9/n0YxwpM6zAyJQO6Ju4GnR/fjU7o6jltrkW+brz3OJqd4r44cdgm+g57iij24iEW8kgsIsA/lA3uYi59L5LyfNz860ED5YDsziYxSItlT3g/sQ68q/9ICh90u8zoxpP59SddXPLv7LUaTwDrLeag+gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548623; c=relaxed/simple;
	bh=d3UkvK/UrzMfNZY0ft7sX23k0dZ6g9gY8ZU4S2UCJcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ts33hpygICdYB1FaNTr9BuVZcgBgDyCF67ih2koDbJSOWUR9e7TNdGxzkg90KyFCNKB3muAlLsDw4JzDT6kWCgoBBd588dxF63mvr8Os18cJitc3UKpEXAUZea6evDJ0huJDPgLHA5HmdPNiwewYWQGHboQI8N1vqPENRyBZbjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pSkjYQIi; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pSkjYQIi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so10218525e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 23:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768548616; cv=none;
        d=google.com; s=arc-20240605;
        b=XBFubz/pNVj5GAjX3rrzHRFvyrmGf6bNffr7wbnZdIUal91a/yA5kaeLoZGoRPru62
         SEY2hoGxU6GN7Ws0Sk8IGPp9nC1RV6h6le5LjIrWWGBaSMkoEYFHToXPz4sJfF6QPRF/
         D11LJFWSXUtU4ZCvBQRf9i9QDu4qmBb00bE0tTD+BrCRTeGIloA+0DMj20aIfB57Vv7O
         ylu79Iwp2BunP5JgFhNkwDT1I5vTrzubR1MQGwMya1rZvc8Jp7S0bk2o3pw+pbryitgG
         o6qNFNIye+D4XVkbj0issCoOvLlAvCGcr9dRv/2bU/s2iNdrSWHePQxsWhIQpOE11btf
         ZI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3UkvK/UrzMfNZY0ft7sX23k0dZ6g9gY8ZU4S2UCJcw=;
        fh=E4DeB+WQj6HrDu7KAkgIc1zXnCvnFsmux6f7LGttpSY=;
        b=C499oBVjSOImJ1R2rY6TXNKX59cvB4o/dUrCgOm/Ij3FBRJ5KZG6GLMgLHBBIhRg/O
         Fa71WInwqMQmUIjTTtWFK2VmgY6PDggATCTonUzGJt5J3aCOw8YBTYKiGKtPywszzzaQ
         KGssLgyEALYcGrlXrFZY25/CpDE7SajYzIG5nxyAkf2VOSQcBv22E0W4Oe8bdM8pXGK/
         zzIoQKqW87dllKVjuyJ4xR/io8wNmKXN33jdgTPmxRxukt8ZwcnybX4nDfZIz0oQmOHb
         QyeMRb5Z6uEsq9sgcIkoTc8zWUg3TrGqPsl/5jejyV8COjwYYNNIj7XK0h7CFa62hweY
         +Jog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768548616; x=1769153416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3UkvK/UrzMfNZY0ft7sX23k0dZ6g9gY8ZU4S2UCJcw=;
        b=pSkjYQIitv/CcLbsh6XnFipHaAJz14y+PqdbT/AoKIupVtItMs8jGtEgIVS6FOzkfB
         +8RaYIlqgOVOJTEs2TlBEQAeLdO77LtIS9CGdMy3Qh9wSJyKQ/XxGjVM3lsKZ7Bknz65
         TeiZ1811Pc28UU0cLpJdIwmFK1X4DF/a1n9zI78PrjaR13uHUg37bcEwbapr+UvbGUAg
         ZVcJd+DlLcAw9rCwlX6MpuJ8IwjOJ/WwvSXDlX0iospfTjVlO7Da27wnEy8sYo5L2oEI
         HvcYhVOA69kjb5fgvVaxC0iBkCwYUoJ/Nl7OKGmjPZ+JQN23AKVYgR/4xadJUJpttWzK
         RX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548616; x=1769153416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3UkvK/UrzMfNZY0ft7sX23k0dZ6g9gY8ZU4S2UCJcw=;
        b=lgiicxrtzG7d49TTDeZatfnSki4zUXg4EcTn7YM0eE6KysYLC3i9fP2rXrFkDo6saQ
         uIDIJ3penBv6kymvgTTf/9GBE3I24zL55nLfRuO8ZDp8IRcPvPD/7L5YskbYJ8pC2X/W
         IDPsU6QBPMYvQj7GGhbCVaPg9J22BR8gFtLJTunc6z/+Wnv8eHZKHaj2W4RKcNmmHZjU
         QPWF1LfT5E5lmXTEYc0H5FY6WxJ3+1+udfoiPK899SUDjeI+57Mz5pXrFHVfNUN/3gwm
         tJv7FhN9w182ThvFbyBy8EuNGeFcVqPRFLv1aDAd8ZNjXW7WyqRix/drPe9PcPox5sjN
         qsSA==
X-Forwarded-Encrypted: i=1; AJvYcCV1aBiEZ8Zqg5ttlTnYMQvrAe7k45aiB8JZCMkhQHQizETqeaVv0s8BKjrW+vlmItAkndSHYptuDIXEJOq43g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzemCvQ11zqmwGhsLfzSP7p72mgqM1FuLeVMOdpRfgYAEs99N65
	in/JOczKRTM0Yxg3SktSIvcEBfLeSVgpKcn5z6NX36Q6R83uoLTGf+v9Tf7L5ZUcTyG9BtTo95X
	PAlsx9rTCeudJGeUlzBdILkKJLDFXEqt7EhoSFpD4qZ88Sj/YLjGrw8J4
X-Gm-Gg: AY/fxX6DCS0QFQrqMG+JNGBJeK/mjaHK/wC0qzAJPgNptvGE/+BJWTALFuxgQZ8VAVy
	SiZy7AlM/vK67Ejzv3rnN0QMoGTonMWk16Gs2x1YIL0xQ+6kXz4AdtIW6DLSvcivps755d98ZYy
	3gD2KDR5LcIZl+TVbi4xEBp3lYNSWt2dvFKrwSFSPZzH5eN9WIi2fnGGVVRKKjW1cjAo7zGBn4I
	5yGpSFW2T73jBJ2ORjEoxRrLYUvvlkfpV6XETobdDvNxKgfM0cB9HlAx6H/CODjgmVf+d8pmHV8
	HOYk/9JfWKj+DOiI7zdzlUhk8w==
X-Received: by 2002:a05:600c:8285:b0:477:8a2a:1244 with SMTP id
 5b1f17b1804b1-4801eac3169mr14925195e9.11.1768548616379; Thu, 15 Jan 2026
 23:30:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115212355.201628-1-deborah.brouwer@collabora.com>
In-Reply-To: <20260115212355.201628-1-deborah.brouwer@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 16 Jan 2026 08:30:03 +0100
X-Gm-Features: AZwV_Qiqq34HbecPsnhk5yodxBLniUuuBEzQYg-DpfBJqj72hySwzPxuWpztHpg
Message-ID: <CAH5fLggE4fxs3iT7ZbtZPJEFUKsBAuzWqeDsvx-PUVyPiE9BfQ@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: tyr: use read_poll_timeout
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 10:24=E2=80=AFPM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> The L2 power-on sequence and soft reset in Tyr previously relied on fixed
> sleeps followed by a single register check, since polling helpers were no=
t
> available in Rust at the time.
>
> Now that read_poll_timeout() is available, poll the relevant registers
> until the hardware reports readiness or a timeout is reached.
>
> This avoids unnecessary delays on start-up.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
