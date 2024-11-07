Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A2A1F4714
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Nov 2024 11:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730978104; cv=none; b=kAFz6mEzZkH6dlHU4QHrLgYqAv8Ttji+hmK93wZm+kZbuiUIJeXm6uMP6yEoYSjCSTlkF391Vxj/NqCChE5nLbtq/Gc4dTYwLEG4eOPFzVzw1yTkf1fr7qfdw22r6jmsXUdeB+FxxDN5Df0V9Jzp6AM+wr4yLIAfDROHqSxGmlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730978104; c=relaxed/simple;
	bh=V5VhorDVTYk9kgRgQT3zxUQiREEPENj/ivvJqbAYVWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBUIBsLlybpFPsftsOvwRJ12jeMIyEV24w2FF0KvzCFxQmMhfQQW+IQwqt4fXjekDLLTKzt/j3DSYw1XBsJ7NwyLY+PuLdEjN6NxQKvUcW/05L/7/2kEpBfbTuKO+623HpvyaLvA7TCQORfWcyXtozenYbcVZrkrZC5h8eN5NHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mwp7CbMC; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mwp7CbMC"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7eab7600800so126319a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Nov 2024 03:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730978103; x=1731582903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMvwfhR2+pKl1yccPZMLcSVs7lJVWe66FlSL61eYp0g=;
        b=Mwp7CbMCbeWln2k6rRrhsVRIK+Fjx2wOIAmzbw1KsW2xNLOnnlSXZ3Aj1aLvVdZPy5
         t1cAmf5AdwGH73J4orZNXP/bT5ZWFiXL1gN8tPdyb+Qxd4C4GQSyzzJodzc6Zogaop8c
         LmGFMZH/o3avsmGdTIst37s9CVrgskia/GkVKoRSNIgGXsFmZll4oJwJOX7xtmEb34jU
         yxv0JbkBRMF/ccfVVFRMuxO1T2HsPcZTc9W+kRXV4va4ZtXn0EmF9KKdb0wUeNWSoaHA
         dDI9KUu1Yv2/c8aqivLpWnptbNsNTSEn2Kg8FU+q2g6ukRHXupNecYKI+93p/FX1Hynn
         k+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730978103; x=1731582903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMvwfhR2+pKl1yccPZMLcSVs7lJVWe66FlSL61eYp0g=;
        b=QM/VvtF2bepPr6Xi8FkzD3p4kVXTkB8Hth4wPZasGQ40IziXYKrg8keMznJwj+TOZU
         eyDmaV/fUT+GMMjWtRs3v2TWX6T9Fgv7HKBIDQYJhZ9pLX28PJ5oLYCJ64n0l7mYdt14
         gOiXAv3Z9yNSzJkSNDRZ2ni+zEsmRlf1ieS+9KftC6zaWVAkKz0s41PTjG99qqnWWKv/
         s4yWuYbotEsyDvKJNwWsx6lOL9zKak603CWeZ0mxAkbr5OgotWzBtzgO/20THH/5yD7H
         GLUqQLRw2hpSklX83rgUwHXT0bQTQMyI9+YjLIVe+XpGDsaWM0HlKTeXzdnTt1/9TiHT
         ophA==
X-Forwarded-Encrypted: i=1; AJvYcCWHImuix90Yt0xFhl4CkGzQ5m6gVQcmIUWElslEbrY1MXTCltyFiKSaPKnP7EMl+xtKB96U0B/nCTAMU18N/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPHs8XeqxlYMJ54OmVYoRhi4JUDOH+9u+nhPLDBKIm1ohyBIMf
	RtmoLtQMQeioZLIH+ZHxa458rZ0Hwfwpt0h4QXTWuqnjpGvEXz+Rer4k6sEARLaFljtJPb1xfqm
	ivcKduiFykUUEKtSkuhhzyfqCUg4=
X-Google-Smtp-Source: AGHT+IGD+9Hs8oJht/Z82rYNwINQkAPf7O19FPibk9DXJnbCB+WK95goXN4aZbOxZ8M5/pIZ6y1RBQuhABBbxAAxjPI=
X-Received: by 2002:a17:902:cf09:b0:20c:6bff:fcbf with SMTP id
 d9443c01a7336-2117d2b7669mr3283005ad.10.1730978102580; Thu, 07 Nov 2024
 03:15:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107-pr_once_macros-v2-0-dc0317ff301e@tuta.io> <20241107-pr_once_macros-v2-2-dc0317ff301e@tuta.io>
In-Reply-To: <20241107-pr_once_macros-v2-2-dc0317ff301e@tuta.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 7 Nov 2024 12:14:49 +0100
Message-ID: <CANiq72k_Mcf=i+0WP5_VBV+vsgWoRJccNNgtU=BtNvoJbO1+Ng@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: print: Add pr_*_once macros
To: jens.korinth@tuta.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 12:29=E2=80=AFAM Jens Korinth via B4 Relay
<devnull+jens.korinth.tuta.io@kernel.org> wrote:
>
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
> functions, which print a message only once.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

When sending a patch from someone else, then you need to sign the
commit too, i.e. after Tomonori's SoB:

    https://docs.kernel.org/process/submitting-patches.html#sign-your-work-=
the-developer-s-certificate-of-origin

I think you added examples (which is great!), i.e. you modified
Tomonori's patch/code/message -- did Tomonori agree on the changes? If
you did agree in private, please ignore this. If not, Tomonori: can
you please say whether you are OK with the patch? Thanks!

> +/// Equivalent to the kernel's [`pr_emerg_once`] macro.

I think these intra-doc links go to the Rust one, not the C one, since
I don't see the reference below. (Please see how it is was done in the
other macros in the file.)

> +/// # Examples
> +/// ```
> +/// kernel::pr_warn_once!("hello {}\n", "there");
> +/// ```

Nit: missing newline between the header and the example (also other
instances below).

Thanks!

Cheers,
Miguel
