Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E78526F291
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 21:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768514030; cv=pass; b=Q1GcllkDZLNg8pUW1Mk+GqC1J169DEM5F0YDU5FXPcMcmE8gce/01cXroN1cIPOOBvfCUgj0jbzmUXjzQ+Y93YgEEzsGYWrmz8Q9ARAfU4L8/+PIONwopsLOx+4e97hVzUuhd66JcEs7t2iCtB9BqmZVKnd1QNf9KYJc4cC7w74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768514030; c=relaxed/simple;
	bh=BJ2knXkUSIXRRYIKX5MJp4EWMNRuBtvs62tAJCZe9ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ip7cdcuHp/Ziq4gwBEJrFWRT2LkyOYcgJJ4hVjhXKkSjVcMoGFqlMY1GoTYCtfBleBg58CTGPhM/NK5FaMvAYIh9WjScbCz9mfuxnUz+TefoSKeNTJB5ZjMHcEvgaa11YoAX9Fs6IOffjcut6o80LVktcjv7iI5WsyW//idEcqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqGlYSuL; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqGlYSuL"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6a868ad45so96919eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 13:53:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768514028; cv=none;
        d=google.com; s=arc-20240605;
        b=kXu8psw2mvi1X405yk35mAUTc5+1uS1ZetNaTjU88kKGbUYky08IMBHQ93lJvcvAsF
         cKwFN+6qC0EGTgg2kfut8Js4HXVsdMhqw0Gy3XBOz0BJQsFFw5VOSNMmlC8vneqXPm84
         tKSC2W8jBpSu5Zd8+rHoZlivcCbHcestaW83OqEkI8Ej5/lAhWJzeKCiGJtqSQs/w3ed
         vDh8yIjpkRWBcJfD+x+vQprKTUkO4119OK5b1ZjTLUnCh2Rc4ZGFLCvkk15AK8/lT7kE
         qv8QF8yl56YPNZqEn3Y3St4V0AL6cN3Gl7onre9ZJCLJCacgIBjkVjeQM1BvSI6BY+V8
         sESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BJ2knXkUSIXRRYIKX5MJp4EWMNRuBtvs62tAJCZe9ok=;
        fh=nUWgebVQ6tDlfN5bQhq18g3NefURb64NVUuMlIPfV/k=;
        b=IEi/lJ0Dne8BD7e1EQjrKlkoQGl7z2xOw3GV2YvKYJKQEo/T7BGcy6wTg0uOStAbbj
         nl+WTx0gnG3y0yfDJyPr1BC1Z3hAXgzqcx+CVx3JmrHW9eGjWzoI0sFsDv8Uzc+QFSIw
         dflMF8yUnBYqpr9iMYPCv9fbIjaSbleX+ilEv2DdVntyq9Z1gf7L7QgYJqu/fJxGCmbs
         rYcwlPTVcnavNBdpMGvOeIKwMl1OsaZO4BIcT2NE4b6J0Uzlj+g+Z7fUuxwA1FoCpC4+
         VV5IgipLgzUR3GnmvClEHLGL38AVCrytTwVFGJU8LjrTZjKiqDu0rc8TGKnc2a9l8mLy
         LQPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768514028; x=1769118828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJ2knXkUSIXRRYIKX5MJp4EWMNRuBtvs62tAJCZe9ok=;
        b=FqGlYSuLbfpBwVPXNXw273voaFoQvDoV7/tSVY8cse1JFwLioacVDx1+oyYwtK7rrM
         BmTXCworQwQPr20LIbO+qUtIeb1YtoCQKA/0YFBiXC8Hdz+nw8LTeu7N4rTFjjBGu2CO
         m60eNVKwmUqceYQo5ALS8vt1DhK0H7QgLaUFzn8jaB1hEKEv17b4nAx8Fp3db59lPve0
         55m250TgOTWgc/9aAm5GxO4HxCqhRB8REtC03qmdfUOwqv0Mxv1q0twY2ced31BekmVi
         hPrFxPITTKiFwuTeDzwUD5B/x3ShK6wmfyDQVSM/ao0MockxIHF73dVLTCnLMA7pvUAY
         bOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768514028; x=1769118828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BJ2knXkUSIXRRYIKX5MJp4EWMNRuBtvs62tAJCZe9ok=;
        b=cgH2A3t1E0bVsA03R7rVobK4P+nObfnlT0g23Yph4x9p9D0ciO+1rQdTtLjkeXPaKM
         588wVuaOONoNLh7C6VDoAQHxQlDp/S6JdsLJcNz5l3JqOaDqDhnTDkHXIAVWf9psh6S0
         r3ElX2e2M3fzLzL2oTZoKVPw2fK8Htr+eUTUnrJ7RPglzLYCe8fAiAFX0090PHFsgelG
         C5U7Kb5kqsS9RJtJC00f59Vk477lhFlb6ytTPitd0aFJzRSOvVAydNLEusWIb1vzuFjL
         N8lTVM6zi3la1tqbLRlQiyo8tKyYCHXh7v6gsTLg2SRxQcZwUr4Ix8SqR9QAgMKB9dH5
         eaVA==
X-Forwarded-Encrypted: i=1; AJvYcCXrCQQumMjr6XRdFs0wQGCuiAnoDajTSWEUthY9u3R9qBfmpMI6YIoxti3ljS8jCGclPGvCJLGPREQyKzLTGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRqxtV8JIYRMJXsKIfwPjRBvORHP7B7X6hExlqO90wZNK/m7v1
	sClT+iYaVwjz4puHF3DeE57rZ9xlX3njfGgyZLji38Sdf9Kx3f3o1tPA2/ayq4MGoHgD5hNdO9l
	K1LgvGhM1sqhM2WVgzMEDgTbK5s9j50s=
X-Gm-Gg: AY/fxX40bpdYLA0p7LXuzC3zaUmyRLVBE8xo0hjxdn11TY+Y/T1wnbPFEoGm4kF7y4q
	110PlntXXTNsJz03RwHtlzO9Heu5jA7KiyJcNA3dwv88g1kUOYh+CPPXCVS7125tPK4EvuTpYC5
	PNgFVeYePfCCRYa+NK/9717tw/Fg/iKIRdlExpN3XoxdZzPyWerlG0FmCOxjP+vdCwJQrNqbA7X
	mhZslfDCLJzS8u211cb69I2ZQXUYyBdqVHfR31pv4C9r1moFJxgN/XzSe9njAsRpXFwqAhApI74
	zIhCwxxfgzGN0iRUq9L646W89OJl4kHRu/oJFnrOVzxZkoH+RT71iJ5XAmxxsxhGFtCbDMYsZn6
	yGauFohLeROKb
X-Received: by 2002:a05:7300:f18f:b0:2a6:cb65:1974 with SMTP id
 5a478bee46e88-2b6b3ecafe4mr501543eec.1.1768514028170; Thu, 15 Jan 2026
 13:53:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-rust-analyzer-sysroot-v1-1-4de831df234a@gmail.com>
 <CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com> <CAJ-ks9mSoDV-b5Rj+G1DrKNJoK5B-x+Sr7cWjbBPrTX8fEinXQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9mSoDV-b5Rj+G1DrKNJoK5B-x+Sr7cWjbBPrTX8fEinXQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Jan 2026 22:53:34 +0100
X-Gm-Features: AZwV_QgV_w8X2OQqo9OlUxLs0kfRG4KAk6WveC2SoCtJetfhYvmtnv7W8hkZjS8
Message-ID: <CANiq72=B=ZWJC8b3Zrb1hAJ7S86sH4UNDJPa=dR80tTgtQtZ5A@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: compile sysroot with
 correct edition
To: Tamir Duberstein <tamird@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 10:36=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> Ah, thanks. If the prerequisite isn't backported, who provides the
> resolved patch?

The maintainers, typically, or perhaps authors of the patch -- when a
patch doesn't apply cleanly, the stable team sends an email to the
relevant people with instructions on the top, which then can used to
provide them with a resolution (essentially replying with a new
patch).

> Ack, I guess that will have to happen at apply time for this one?

Yeah, I can do that:

Cc: stable@vger.kernel.org

> Thanks Miguel.

You're welcome!

Cheers,
Miguel
