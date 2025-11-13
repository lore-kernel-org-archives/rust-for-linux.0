Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3C43314C8
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 08:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763022744; cv=none; b=dRNKIw9MQWk8/n2hLYiuZFP740ae85jnYj7YOVvJe7zTFWU3a9/+2OMHfRdMLODFh8ORcxoCRf9lQQ+3/hgN5ENxyBBSz2L88WFCMjlQNyirnDxcW0AX2bgE7MrL5p4/oO1ovgYHmAgSRS9lQ+3cv86AZckwOWuGfZ1Y7LJ16L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763022744; c=relaxed/simple;
	bh=fWkrgCFVGA8ycSXNGT0kHhwFC86H4xheW9omFn7mil0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mke4D1/mqkzxjgEDUM1iyeTQBk1GruY7pC/JJTGQYaZ9N5Re1FaerbOn777iUWt/0DgDntUv1jzUlcxsc5m9pFmgXwEolMhrqoDZhVLZIgWIp/RhMiAfqjVBwrgeepLqXnh6xu6A2pcymb1BOxw2G4yPRY8EU2wfcrAT0VSdEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWCBgB3j; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWCBgB3j"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297d6c0fe27so338475ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 00:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763022743; x=1763627543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWkrgCFVGA8ycSXNGT0kHhwFC86H4xheW9omFn7mil0=;
        b=HWCBgB3jeCsyoD2k4/Py0n0TJNwB4Q31XOwe71egWPg6peWKcLFgMZ4yKo8M+xNhDP
         Llhtr2Q2esM4IohEk9lLugclhsUa6yDi3PrXOUqqDfjQ5pqhPbtoceZUZZMdFtsJyBbd
         fSUj5kLYW4hyW2NFk6O6P964lYetdZihd64x3K8sYhgC2sXJ5CgFuva7nLXYbVxoTzYF
         CAhyAVEkv12R86/fscxbiTv3leX9PoXJVuaazdNk2c7Gi64sdWhJfDSBbp5tfYdsCyJU
         vuG81s32vch7mykcmS60MwBvrk9FWQqk1gjMFaFPnkWEl0vojFfx4inS/iXl13rQMNPt
         r7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763022743; x=1763627543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fWkrgCFVGA8ycSXNGT0kHhwFC86H4xheW9omFn7mil0=;
        b=Qr8Lm/I2R7wG+doGSCzUmArKCjsN4+YKwKigp0L6s+MjjI1LjHhOyI3c901dt1OSik
         65n84RwPw2Bi6xBF2h9jExJMDe3L5I+svAy9JQyCPEN69F3Nldr8LifswdUunoqG5HRO
         AMWW94XzqRucudol3bxtbxOE7/3sTVT11tCgJm/tsIWbRrDKUWNyZHBlpJSRKUV1znlh
         dPRBKam07DVhWWVrnUoOuXpriTNmZFU4d0D3CRHxlpQvbC2fKmpiU34WGkw922iOEYDT
         kBTMpIzpaS1yOFxG5+Xx+lUZ6A/nrqP1DrEZ7JbOOBvcDy9z2A9+DO9VTZbR1zGGUh+r
         DurA==
X-Forwarded-Encrypted: i=1; AJvYcCUVW0w1N5a5Q9zVywp3xzo2kEC7y1SfjnJJe2cjaKW6s+Hm+BC7fLbA9y9YrHFAIPk/IC6yvMQqb6YCia+maQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIAMaRW4jmBJMyfz/H9S+i/SkpGAaW4ZmqDEnJKWZqewuY7anM
	sj2dkVQFAhxI39UegwTWecjAKro+IOpVl2MkzRifJFW3Q1q0S0AgPsJwapnSuHnAJ7DkkC5JkOs
	T0eH6x6IHMsEoX1sFTzmgo5xVBs46TEs=
X-Gm-Gg: ASbGncubD/UUiA9ceWZPXMUixS7Q5aHVEkA5gxlHiGtO+qv6F6hh64zzXwcW8j8zmyv
	5ncLT2pYTcrXD1P5NYpA31tstUluqIyvlmeB93bZcq8+6B4/UAtFGTGlCpPnWmt7Xa+MXuKcwhl
	IJS18ZxtUpCNI/IiDR4F0sGFgF1icb6Yi8ebmTtTpFw8ec27slBiqMyFs2cvQ3znZX1buEMsTum
	e7RVR1eUQuLlNDod7CcEyCLlzRP2LrK0qalGfvteBwzdV/UHQMoUMD+AmM2NltZXHvDYlqSXR/5
	L8oYFFCQntojZESSqJjxXzU3z0UCpLHvzqxSqLGt6Kxwd+ahFnEMUTtPTEnJVOoKvLLqjulKnGN
	3RX8=
X-Google-Smtp-Source: AGHT+IE7NyIjARYCoGXVPLTRHyIS4snYyg052NinbmAvhieV0+P8KCl0oiy/F+gMZzxUpEmb7fGQGEAaoFBYjjzJirY=
X-Received: by 2002:a17:903:2f87:b0:295:586a:764f with SMTP id
 d9443c01a7336-2985b9f7747mr14629275ad.11.1763022742721; Thu, 13 Nov 2025
 00:32:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-binder-bitmap-v5-0-8b9d7c7eca82@google.com>
 <20251112-binder-bitmap-v5-6-8b9d7c7eca82@google.com> <aRTbX6RPsFf0NW48@yury> <aRUZq0Fo6T1f3lOD@google.com>
In-Reply-To: <aRUZq0Fo6T1f3lOD@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Nov 2025 09:32:10 +0100
X-Gm-Features: AWmQ_bk8GPBMLXEykGlWHqadm88w8ZM_NALuaQkEK8ERifzVwLi-vw-oKLW7SeA
Message-ID: <CANiq72najqKYQGWpc9UuOnDzPELiFB3hmFYmX-7pk8Eh7zA+Rw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] rust_binder: use bitmap for allocation of handles
To: Alice Ryhl <aliceryhl@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 12:35=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Although we should never hit this codepath in real code, I don't think
> we need to kill the kernel. We can treat the r/b tree as source of truth
> and adjust the bitmap when mismathces are detected.
>
> I could add a kernel warning, though. That shouldn't kill an Android
> device.

I guess you mean warning in the sense of `pr_warn!` instead of
`warn_on!`, right?

If so, could you please add as well a `debug_assert!(false)` on that path?

Thanks!

I will create a first issue for the combination, since I hope we can
use it more and more.

Cheers,
Miguel
