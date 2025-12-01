Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4065A284889
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605152; cv=none; b=mH2gfjibzJXmroy3T5qNjE41UtQPw/9qs/bjs/mufjJr3G89/a02vK905NMimkmfjQ12pc6NOCa23meOpc8bseguCQEgwefV/Slw6SPuMsX2GgtE5gHZX6VxJlDuMs81tTbjPxuhHWgoRwQOpOKCfxFePjpcFZo5/sVF9r9kGmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605152; c=relaxed/simple;
	bh=c3q80nezNjHGDnXQ7ld14RLMpjcS0bIEAqts88bRJjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bk4m+rXdrcwBoSA9T65Dgqn25bZYKW1De1YtvaEUhfIJHW3O2Pd33lSghzJ6AtYZYy4C9Nsk7IDblHzJkytV7YyLr+8wcOd5PPK+e/LBcJrW6vmc8hAGji6aw/5SXI52IPczK8xcYs6Zjhp3xy+mK3GLvO1eYwQSwXDOUSxhLF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/GV3IsK; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/GV3IsK"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b9da0ae5763so305495a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 08:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764605150; x=1765209950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3q80nezNjHGDnXQ7ld14RLMpjcS0bIEAqts88bRJjM=;
        b=X/GV3IsKqgwc6pORQL9hWiZwKzlkmhx3YtMj5mHJb4VN/RIQe3x4lMm0IygIuMKTuP
         2A1qu4jCj+dtXKnuqaa2uycLcAbmDHWu6DFQf+taGkggokLOVxn6l29TArwo8h/Va+L1
         KDlfEJifTaLVGs9dBoEx3iuVUMY1tVupeyvS2IJ1ZuwN+K5EjmT4XeY39+r/ef7QXQo+
         iRLNbUzIUXWRpQHK6XNgJP1DtcqD/AhQtmsgEOz+0bDh/ahgYHzJHH3AKORF5KNgX2hj
         o1FHRL35vopLeLyQsTD9uapnUIGqYua+R+iIEVh7xe4a1eyoLS5k3tqtTVsytbt0dyN5
         HT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764605150; x=1765209950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c3q80nezNjHGDnXQ7ld14RLMpjcS0bIEAqts88bRJjM=;
        b=ctONUtrepScux9UQvtr3J5WQkswXRTgZEs/5KOKjBi19rojc4kJrfW+R/Yndnb+ISQ
         lq1JmL+RV+70Qt/66kaOuxlTViMdS7glJ5ta0VtuPwOc5j0jBs3OcK+Z2+id/JQjhzwB
         se7geiPN6Zf43x6gUd2iLYUCnAb4Buc+E5wGP381esux19vSrsFM63YBzM7KTRdTKnuI
         lQvN3I2e9yPZUA40bEQcwXUEt3pMVSruFkHZ4pex6xfYeLrWBqrZWrBdduFDR5B5UGUe
         xPiDjWVm9yckRQNf6f+PJDiclIYLaodiNIqSZ8dZLoZhdOrmGZ6Wkj4JvZSgNBMKK047
         nU0A==
X-Forwarded-Encrypted: i=1; AJvYcCX9EkSm1WrJMJffMGcnxrQqgtI7bPUmWGbbAYbwfH55VmA8/fgE2Y6tRIGg3zo8+O3dKa8t7DaIcblxyJtHbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiCzCd6G/1/owOPoOUwp7MEoq5FX+R+j8deA4fUPQxsSKKcT5G
	3NDdpYwelDSN/a+HUVTDKWn5hhBHRdR6asYIsoyvLdUdacSD+MEWgn9SM0WpxIujrSo6gCHcU2e
	PXwHqQTV6RljtTi0dk1qvB15+eqP4d24=
X-Gm-Gg: ASbGncvHupccrQzIbxwYg9Y56OPfhjIxkY9eTaHjOzF9vxz29cyIz/t1wMWOlXGqev9
	tVbTcg75ke48nvG7h/saFP+AOAYlY+ap5JUtBmZZZWSpV08guSjKPuTKTHcXBP8ddgxsR7HplKp
	ixI4yl5As/fmZgcee0H9/tfPMo1ivE4psVYaQv7Jr9JZ8VhB/BBuX0MDK1WC6hueMmOsrcbZHBK
	pnc1NTQF5de3dHYMfZrYDzWn0eguYAMq42ehR+YxN9mjBGzryR9S47IGJfo8luAEW5gt1bKI7fq
	IoIrgfSLdXxThVYRwVXnZvFCC9Sb6gjoiVHpsfa7LNOEyaThuOd3o0S5TQE1RmlskLRjibrA4yu
	FCfV9MBQCAVOWKg==
X-Google-Smtp-Source: AGHT+IGAoaRGh+1dNKF31T2E+ShQgI9oD6O9jwhw+BWVZU4zpRBxVgcNHrK33G+LKd39IXKeX87dWzYun192+lq83u0=
X-Received: by 2002:a05:7300:e80a:b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2a718b198bemr24570111eec.0.1764605150329; Mon, 01 Dec 2025
 08:05:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201062516.45495-1-yu.whisper.personal@gmail.com>
 <CANiq72=MfmAKfV7GGwkyNVZfmtcxdvCroUCwC3D4Y0dN_f70CQ@mail.gmail.com> <692d9994.050a0220.d1d07.6e65@mx.google.com>
In-Reply-To: <692d9994.050a0220.d1d07.6e65@mx.google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 17:05:38 +0100
X-Gm-Features: AWmQ_bkKI7siBocHIDls8qxiym3QvFUyrm6ytDhMBorA7LKgyMzZu150sRmjg9s
Message-ID: <CANiq72kyECp8q2q3ySunR-LhQ4t6L1QA2113he1W1s9yrHfxUg@mail.gmail.com>
Subject: Re: [PATCH] rust: num: bounded: add safety comment for Bounded::__new
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 2:35=E2=80=AFPM Hsiu Che Yu
<yu.whisper.personal@gmail.com> wrote:
>
> I previously believed that a function should only be marked unsafe when
> it directly operates on unsafe code. I now understand that the decision
> should be based on the actual safety implications rather than just
> semantic considerations.
>
> Thank you also for the clarification on the tags. I spent some time
> trying to understand them, and your explanation is very helpful.
>
> I will address this in v2 by making it an `unsafe fn` and documenting
> the safety requirements in the `# Safety` section.

My pleasure, and welcome to the Linux kernel!

Cheers,
Miguel
