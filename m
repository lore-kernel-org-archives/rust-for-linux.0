Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005403;
	b=IP1SX8UajEMuvG4qiV+5l0uRk/C//Z523etLVpT9fT0fG51tq3QusZgB5vPabfYpkEVe
	 zH1mxyErgEFZBzV1yyA+DZCo7LApEkx95PkgQQL/m2mLA03lUYnal5+5e3IkA1qx6nwnp
	 5ZxhT+AZKMyVuZ4KoaEkeapTPfS2hu9MgDNBQY//Zn1bokG/pAbkpxAJgNVRTHc3SdAGW
	 +1+d5CpIYCq7UGKKZyMwszSXiIGX+lnfSWrmSXW7hKMu/t73SFbbfo4TvOlM+2rJ+M+C4
	 ncn6Po0d8Pjo/tc9lhhwCfV4hOxu3vPwLZCbMlEroDJuAFIOa1sWyp8QJwNgZxrLRAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jdM5SiIPEimDeuq4rXZ03MYtBwz6JzOMb5ILjYkWvYY=;
	b=EYSgArYS7JzXrNm1U2GLaMGws0uyjBnyHNYghCsfwuoYiJFRfsQntebgUqYwubKY3+Vs
	 7TviV8BOUG7qET9hABL3vtqAKGgNPASCTgrLvniSemZeNr7uVZxa2r1ArFIyw58z+nWMZ
	 EKQp5lIeTycbZ/UAzjhCjA5OcdY7Kq28/xNbFhBwauurT9PrIH1WVue1zB0ntHTgAdiLw
	 QWbyblMeJWuXLrzRCV2eHmAZLE+ZtTjjOnfiB+zeAS2Sf+3RreI7zgGlXgpn26+BD5nIz
	 BZsze05zHtmRe4hSNk8R8E7o2j+YX7em52xiJlJHM5AE0kiCpFsXgvsEzx2KwDLLdOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qI1bRhXA;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCF4606A326
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 22:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCF4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qI1bRhXA
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37071c0f42aso1363219eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 14:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794005402; x=1794610202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jdM5SiIPEimDeuq4rXZ03MYtBwz6JzOMb5ILjYkWvYY=;
        b=qI1bRhXAzFSnRU/EQvqAwbe2gmyDRl5wFnVB6NTamKNoUPosaY1FWAGrf6PoI1RNtz
         Y4AfYLcvtJhSVUTDDIzYJPCoqkh74lfPpnXGovHd7MYBX4QXGqmTP7kRyvpNejOhq7Rh
         AesEV5adBjkZ57WwfE1euesjUqHpXSSFr9BTzIjwOZXP6lWM9WiwMyM0e9k9ksuX0Ioy
         qP9I8Netth6qF8bNafVPj77My4d73yGqFzkyu70tjB8dyY+LCIDpIxIPoXQQxE0IlqC+
         YJF8hrVqhRHKIxCceHld+WygAfmngi3sQTjyKxkon0j4PbUNT1DinQU6s4YOdIEhSHWQ
         N+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794005402; x=1794610202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdM5SiIPEimDeuq4rXZ03MYtBwz6JzOMb5ILjYkWvYY=;
        b=Lis/ufk98kMQAWi7MwqgCNWAofsB770pdmNyyEwmULuOnBDsR6j8EYTQSsyP6dVJ9h
         JHMeiFZnxc5CRF/8md6Vp8ROu8uCFExD1VQvIgT03AcFcukQx7W3n5U0mo8tpbimmWUC
         9gCfWgr+8XRIxTs4/s1Dde9wCM+/6hZIj3qBBE5E8+nsHda2B3hSP1dzIUURdBWTftDk
         ddojN/6TNo4JPassrmN0ttgOgN+wg5e9pXYKa6uJv2YczpPuhA+Z2R7rKlk+Iei1Sy02
         fukW0oyi2aNbDu45wwUm9PWbdfKdHXaNf4oA/rtW9kpL86jj2Irc9ga8jBGDNSOf+tsQ
         f7AA==
X-Forwarded-Encrypted: i=1; AL+hErGZ9KuwJmJqsDAHNSCSTHtOtU1QvAX9oOapaM6YijuhdYW1zZ6IZccGojpbRSh6vcQU8v+ys1a/deEK5GbiQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Sk7R0RGe+TfC7Y3ck5ObIfq/Nc4Svbkht/PAzPFqkyoaBMEPy
	mBomgHigxYFFDJ+qM1kIKPot4/W3k/53T7SCfk7s22FAKA5rnwcy8f1X
X-Gm-Gg: AYBFou3KCsdJxa+vrVkMVgEYe19Hs424YhgGv0ytO0iEuamxnRnLt5IOdor6P/MHZtC
	YoGwfbtUzk2vm2WySxvzEeRPC6y/Qdk/vOrhHDgru0rU8cBZqEpSmMR98FsR9GTOBS9C9zR4sT7
	ZVriJW3AZ2BzPKofiOX7+7GcrirZPO3rn6uVvGULU7YATOyPT6dTXmwdozMzqMvg+pZea3ozKa+
	7eqbUnqdKqkdVfGNWrUMAbcro4lutwGxM03/AF8TQkhUEPvlqMx+i24xMkdPKN7Ot7LmsQEtfQ/
	9dF5z1LytjRd/CfC4DkrNqdHuf1c/67rPhwATQHSlk+QSG5Ey+80+h67T8i5BYdMAGzByUnbDvU
	42FFmGVt3OLGKH154rWZB9SFDTnekmG0fIzxdrSgxJJ3p93oi7+uxe/RrRxeuhz7axRMR3ReJdY
	kLGEFiy7QS6p8TJKqRpoWQcwNXdd6ixu6TI/6zlQW/M68SzsqPaOnFLAAusw9TgS0HAKpcF76Jw
	kLDdyte35ohlyHAP9I49KLVY36L7L3joVGGFL2ohJaNgvE8Zu6GSiLy6WNmBkkvj49X/nIM7nRV
	5hQHZuDmsqRb3+oeOhgZe351UP8Ym7LsU/7LTu7w8wI1/AolZWpfO8J/f9INVCYnL9qlILGRYpY
	2saDAIlFbD49o/A==
X-Received: by 2002:a05:693c:62d1:b0:369:21a:dce0 with SMTP id 5a478bee46e88-36f7494d0c6mr5227807eec.6.1794005402183;
        Fri, 06 Nov 2026 14:50:02 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:5c0c:8517:173d:e24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm11883707eec.10.2026.11.06.14.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:50:01 -0800 (PST)
Date: Fri, 6 Nov 2026 14:49:58 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: clicedvly768 <harepro29@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH v5 1/2] rust: input: add input device abstractions
Message-ID: <au5ZLv09L2l3LwZP@google.com>
References: <20261106223033.452853-1-harepro29@gmail.com>
 <20261106223033.452853-2-harepro29@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106223033.452853-2-harepro29@gmail.com>

On Sat, Nov 07, 2026 at 03:30:32AM +0500, clicedvly768 wrote:
> Add safe Rust abstractions for Linux input devices (struct input_dev).
> 
> This provides:
> - `AllocatedDevice`: a newly allocated, unregistered input device handle
>   that allows configuring capabilities (keys, absolute axis limits, parent
>   device) before registration.
> - Safe string methods: `set_name` and `set_phys` accept `&'static CStr`
>   to prevent use-after-free since the input core does not copy strings.
> - `set_phys_from_parent`: dynamic physical location path formatting
>   ("%s/input0") stored safely in an owned kernel heap buffer.
> - Device lifecycle and reference count management: `set_parent` takes
>   a reference count via `bindings::get_device` to avoid dangling pointers,
>   releasing it appropriately on drop or post-registration.
> - Bounds-checked `set_abs_params` validating `axis < ABS_CNT` (0x40)
>   to prevent memory corruption in `dev->absinfo`.
> - `RegisteredDevice`: a registered input device handle providing safe,
>   inlined methods to report keys, absolute coordinates, and synchronization
>   events. Automatically calls `input_unregister_device` on drop (RAII).
> - Constants for bus types (`bus::*`) and event types (`event_type::*`).
> - Alphabetically sorted imports and module entries gated with
>   `#[cfg(CONFIG_INPUT = "y")]` and `#if IS_REACHABLE(CONFIG_INPUT)`
>   to avoid link failures when CONFIG_INPUT is disabled or modular.
> 
> Signed-off-by: clicedvly768 <harepro29@gmail.com>

I am sorry, who??

If you are not willing to put your name when "certifying" a body of code
I am not interested in looking at it.

Thanks.

-- 
Dmitry
