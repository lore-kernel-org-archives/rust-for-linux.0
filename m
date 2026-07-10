Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F3F29B78D
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694157; cv=pass; b=lT43JwPbKy40RKX9/0n5IdZdEknL51rj1gW9ivljfRrx5fGFtauSN5McsGBRIu6BRK+CWXMBtJtXF1D4xFaHEv1WKBdRCJSNUIrHFJsO4wqiFXmy2iv/i0eyda4TB9Uudq//+JBibvJm5m8OSsWNtL3p8kiKxtFten41IMXu7U4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694157; c=relaxed/simple;
	bh=gEA74FN2fC2zL9pJ1MRT6hI6rXrTTf6M/GSj2gsEdc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMVKLdywcsXoNMDxQQXRHg8gacmmxzBiPdkB3j2fIPL6uWPaL6GEdR65tpfdg/WdCFn/Qh0HJN1RCdw/Tf7bQYYURkN3CvZJHVSlzwBaMOvmqaRiMML3YFkcwSMQw40Jv4Mtw1Fa+8IFBJvPtvijv3V+9UiAvxkFI02oKAi7zgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fPV1BBS+; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fPV1BBS+"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381065a7a03so947841a91.0
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 07:35:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783694155; cv=none;
        d=google.com; s=arc-20260327;
        b=j/5OMfJxyVZpjdirTFs/X1I0amNW6vcLWFGX6V6e3XrXmdLeQEWUc9rbpEIZBqJBSg
         tXrHsYThrJjd0k7O0ub5S4ZwPCs2eB8DfUHVXmzihFefmrf2eUX3RmkOkTXYzcIsRAY4
         irNb80fHDRMsZOKrQSLBVTwXwE8jJJStCk9BWFlUjAqCmRpuO2PcMHk5AqsFeEjGQ69b
         8aUJjw/kyL0rm5MdpRQo/7TSZfgx8O4TZF6Jyhl3L4x74B/o7K+8MuZe3WrZHt3QM9ng
         fsPRcSQjF7S/UWFGxQL3YFOE+MQtOHT0rPoXCZhEoPTuWW69jveY36Q1FiRZE83IaWvC
         q+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8RTKft6tRlaBd/wozLki+oHfVCfq2h37Q7qAlZLrRBw=;
        fh=+PvLm7JXH6aCFMBg5LdfJKqxdBZAv0pK92bmOQL3g5o=;
        b=Cs/+/KzYScapI0B5m7rdTEfUD7M/c7K3pAfWBKlqgJp/RLvUNCIMDqO5Q3i881rcKm
         A+sIR6yVx8KMTHuGpvNrKGoUPmdGRE2cuMta0lzyKcSZwsxxor1QVTapW27W3gwo6Q1I
         JKI46ETO9CdHbdvU6BtUN5sjFQ76/lmPxMKf+HYFCjnVZOQWCrcsIfMf+ZLw3ZK+hHaR
         MTM/IN0GMl4f5qpFEJkXMyAKX45+0czPxk0AShkbM2C32/H90Cuq/m0jXugoQG7HsN8Y
         V6SudGpmMVs1vFQMLfGZ+sPFEFRGSZppgnCOWqc2Xt43Ri/8dR+eeo8TukIRTqLYNsw7
         Alqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783694155; x=1784298955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8RTKft6tRlaBd/wozLki+oHfVCfq2h37Q7qAlZLrRBw=;
        b=fPV1BBS+meABpU63lSpqqtqTWmvnK9M28bP1/sOwH88m3obQHV8w6JGwC4jhL5EbK0
         7s7lTBw5XZcz4q8TTyFjQfESREC19KtqaGaZZx68fBb73WTVmGhm4nPI2YPRFNHWwOSk
         FjbieOYRgIHnR47XqUspHuvsEeUTd81CkuYY0mjEfAFpNq4vngoJufr5epC6evV1/HHC
         hui1cAk44qk3PN8v10mJW1uT27pCNbWlDniuB6Kf8CLV0cSmRrLXyeVIcCdBzMSt90Iq
         5Z1r9dbQRzLAIHvAJ9kW1WM3XgCFK/2KHTRCjBkuHC2Q0KHGIOMfWXfMopT4r19vpmP5
         pT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783694155; x=1784298955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RTKft6tRlaBd/wozLki+oHfVCfq2h37Q7qAlZLrRBw=;
        b=IlOWw0upxX/+kzUbEHAhX0/bVlGJFxiZt1WUw2RYQMibJk2GwNBgIoSz8Nw4U5RPqW
         MdUU3KQnN4OL6MYzLyt13ZhTcXYFIYlWSkWNKDG493E9gPQ0Bif4KLL+oSDoXe7DvYOn
         mFIL2/DYMNPOl/OraaTX6b6GvrOA5A1mprczVDvMk+ElN9aKM82EUgFV3AcTkdWLeV1A
         u9Cjo4wCqgOgx9z6+NkmIyuxGYRV1MmH1p8exCTbx+rNcLhiDlaEyPTxqu0O1HqRLLY3
         8Y697HA2IxF/9cHbUPs2KkOQNadjj+N7JSoDjDHzHbjkwvPs1etJFuxWzdAyAJPBUVjJ
         gJ/g==
X-Forwarded-Encrypted: i=1; AHgh+RpzQ/FDjGJkh6cEsFHTg6VgF4xvV8iGLTnJtdu+GhFpjQIJQfDM4lChcS5ptlDY/xnGnzbnjAyP0v+J6GifyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybz4Rbtdss55hdoAeLGypRI4uPjTOjBwrMtMrV3eujKKR51+KP
	wKWI2N6HBw2/Dj9T9vGL5fbSDHT7g/lVDu4Vi6wYF+/EKUYpOdmOrfsg22s0JRAhkS4R5bsz+KU
	ML3omRe5Dzpixl7SaM+3UOk2780nTe1cP41jc8bOE
X-Gm-Gg: AfdE7ckdA3tYA30Y0bONuMmdBLNXuR1WAWRexA4CyprOXt3cld2Hyqum8d+2CmODDsk
	qI6gSK+CrtMkevVAvkvP3BeKgOreOJUf7P0l2nmKoSJ0UFIG1a9T86RDJVt/QdbtrkDu9QBxiMN
	47559c9qSwN+mAWf64CDtBSoGixPUpBRSEGc71ioJkpzIb5M6lBUnk4CrCraDRtXCRYCnyKuisi
	pxLChLyd09qmFCpL/9K0nmClzITQfCLowkZBuJl9YqIjHMMxUz+WONErnn8wbnTphNiKHWTyo8W
	PYEKzdPjtF46jrzow1nEDzoO71mFcx37hmvOVaI28eM9utC0NidzW1UB6os=
X-Received: by 2002:a17:90b:2ec5:b0:387:e0bb:5803 with SMTP id
 98e67ed59e1d1-3894278cff0mr11933074a91.42.1783694154631; Fri, 10 Jul 2026
 07:35:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
In-Reply-To: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 10 Jul 2026 16:35:38 +0200
X-Gm-Features: AUfX_myprgAG2V34K9cewu6xNVFlZ9yIWOoAZH4cbE7So9EaGk6QU9L6nK9ipUY
Message-ID: <CAH5fLghxpBhKWVjMQNmODJQMQy+asnsgrpH4nb_Rwg3Jcv1nyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] rust_binder : Implement dynamic debug logging mask
To: jahnavimn@google.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 4:33=E2=80=AFPM Jahnavi MN via B4 Relay
<devnull+jahnavimn.google.com@kernel.org> wrote:
>
> When a user-space application sends malformed data or makes a
> lifecycle mistake, the driver rejects it with a generic error code
> (like -EINVAL). Without internal logs, the driver acts as a
> "black box," forcing developers to guess which check failed.
>
> In the legacy C Binder driver, this issue is solved using a dynamic
> debug_mask module parameter that toggles verbose logs for specific
> subsystems. This series brings the same critical capability to the
> Rust Binder driver to provide developers with clear, real-time
> feedback.
>
> Instead of rebuilds, reboots, or guessing:
> - Developers can enable logs instantly on a running device by writing to
>   `/sys/module/rust_binder/parameters/debug_mask`.
> - It prints the exact reason for failures (such as alignment errors,
>   mismatched call stacks, or invalid handle references) directly into
>   `dmesg`, reducing debugging time from hours to seconds.
> - It protects system logs by keeping logging off by default and only
>   enabling it when developers are actively troubleshooting.
>
> Based on top of:
> https://lore.kernel.org/rust-for-linux/20260707-upgrade-poll-v6-0-4b8fae7=
bf1d9@google.com/
>
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
