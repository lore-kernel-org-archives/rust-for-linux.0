Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEACF131E49
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 21:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742159241; cv=none; b=ZQlNy4DnQfDlcDbFFZsh5A55thWYYhdf+ay0wKcGuVZcWl+/df3WXWXRgBcvG5kxeiX2LeL60FenJ52CAc/3+lf7KDpNQLScIV23gG3NqwzSoCOKKqylvzEvOKamMhy6501NjwKQnl7WYNQwnIDx0rRyCkRRl0vFvzOHXSjq+ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742159241; c=relaxed/simple;
	bh=RdNGo8vq7qtqcCJy6AYv2Iaa10HP0Q0zdELksVKgezc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/HSpQ3zBtisNh9gZ9DxnY09viJT7UUs6m1LcZRFHdlnmZOPGr2zecjPhOj1Wknd0N4nI/9rnmD8c5MqBR3xQZNCJQ+tR0RlvGfQdjmJj4xL8GmT1mXmVl//oJZgrk7AfdY2IMhAO5D8+h3tcZJ+T8tEHrHAgY31DVuGLiLRxsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+jaFcGO; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+jaFcGO"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so421385a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 14:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742159239; x=1742764039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVQtH5goMkjNapPCUaqp0KUEPMMvUoKOGNuQ/Pqqdok=;
        b=a+jaFcGOF1v3cdRQqyDaQ+ozWjvmcXravlIcrikFR/7+hoXPCzM8nlg6J5i3nhCNVP
         aU7lemEplTpg9Qhs2oGrGTQ6ibWU0LsxNzmtSWDJT6VbxEBPamMQzbIxqWZXgHFF0gBN
         bj4pI8hR0nX88cve/OCwryEjcvCZe0F+tZkrAwDaVhmhG+THAxINe7C2Hq0Uhzi9Qv4A
         OdJ/17hC6csbC4ig5IU9g7cPWD55EIQo5ybOT5yo+yi1ggLEvz+MxEn4phOczFAzFo5F
         l2hjo+BMW69xn0kRbb0jnjqOO/TDaLCQloxzT/m00jen9YwxRf7FgViJCm0kUuE11ypy
         BR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742159239; x=1742764039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JVQtH5goMkjNapPCUaqp0KUEPMMvUoKOGNuQ/Pqqdok=;
        b=utt5VUP4NjYdNlbv5bpRuITDnroR3MCxjMXhFsd5qsNXq1t7uzz3GmFD+RyKvxedY2
         k65N58U42Ad+c/nVkIuTWa4ZC5JTx/Fwr9fi8YOfy2CIa5O3qpTTVUaFV0f7mxJhLI+Y
         sSRZkWQqg+x2BrRxQLyxLfMBeSwNHtMjCE4NTYNqFCJH9bXXsZgDQQaY9vO3OgNDWeQ5
         dm6ireFrbOIudWYJsVPJrkcN9uIX8JRthhzQFQWUkbKzvoRFGD73AyZ3XG8WqUZz5wUe
         8EWLp6f+dBznk0rD5fxRA6j6hP/1OiCEYRGkd/LdepWcvl3DdCEWwD4wXCVkGwrj1+wl
         wvSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Cx7meI9YKJ4VEBoXW4tkbTA7amU2dFLfBJDHEGaC6k40aUMPGOGDd+NB4zuOJrBCW5ndedqrjC7rYVd+Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy61zDUKlHwrppLoJ/cJphzj3MZk51eKQ8ty7VIx5QGq1fjorHA
	TNN7hLe4j4G0QP4TyGTNFSueuDvqqF38DNsNRn8QV4n7f7LaWDWzwW3/mT8n/9DP/NIHup7Vqed
	vvcSPh48xu/4cNyJQBVUvcQzoYOw=
X-Gm-Gg: ASbGncuXpglyGg/OU66EEXXEIm8A0RdA51TBhDIQ3845v3RHQ8zsPE8mPBynDPJFU76
	o0GhTriy9yKlgie7z2yeoq0wJiuBl4i03bY8u2rAIFoSo7LqYbNqjNNR/qpwqhhcCCMjiPbxUgm
	n9u05WQ5ng2Pu276yktQlV8kUEAw==
X-Google-Smtp-Source: AGHT+IE+9zBjh5WXon4ezCYrQlKYEw+5Yye3qvR6YRxzU8q2DbWPEHvXCRJe8mL2aBjAHYUC6LagaQRUthmYHgq6O6k=
X-Received: by 2002:a17:90b:4d8d:b0:2fe:91d0:f781 with SMTP id
 98e67ed59e1d1-30151c88d93mr4602794a91.2.1742159239055; Sun, 16 Mar 2025
 14:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308110339.2997091-1-benno.lossin@proton.me>
In-Reply-To: <20250308110339.2997091-1-benno.lossin@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 16 Mar 2025 22:07:06 +0100
X-Gm-Features: AQ5f1JrmRBoqiyXeJ8N3VCE3KpuKXpV9O-ek0EM5wQdOTxUy3MLqBHy8hohx2Pg
Message-ID: <CANiq72kg2-5PC4T_ieFTN9dqeMnZ0H5TqqPhW+GxB7fPV0COVQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/22] make pin-init into a standalone crate
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 8, 2025 at 12:04=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> Special thanks to Miguel for helping me a lot with getting the series
> ready!

You're welcome -- I hope pin-init's life will be easier now that this
is finally in :)

I had to do a couple re-arrangements to keep it building (and
`rustdoc`) for every commit on top of the `rust-next` we already had
-- please see below.

Applied to `rust-next` -- thanks everyone!

    [ Remove the `expect` (and thus the `lint_reasons` feature) since
      the tree now uses `quote!` from `rust/macros/export.rs`. Remove the
      `TokenStream` import removal, since it is now used as well.

      In addition, temporarily (i.e. just for this commit) use an `--extern
      force:alloc` to prevent an unknown `new_uninit` error in the `rustdoc=
`
      target. For context, please see a similar case in:

          https://lore.kernel.org/lkml/20240422090644.525520-1-ojeda@kernel=
.org/

      And adjusted the message above. - Miguel ]

    [ Undo the temporary `--extern force:alloc` since now we have contents
      for `alloc` here. - Miguel ]

Cheers,
Miguel
