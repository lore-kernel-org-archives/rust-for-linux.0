Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF9C2FC861
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 23:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762211159; cv=none; b=mM2crkohFB7hb1eqqRRWdNcwoVPOsTFVwTsFVRbUQGaa49ihtnuzV0e9BusI4Z8a7x/DMM/Ne6V/wdDWtt8DkbAj0tRVQD3vvjDW3Ofow6h06B6h827tJgudDZUNmRHlM+LVY1lwo8h+RKSP2vAphD84aX/MRSohtBc3e5YVdkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762211159; c=relaxed/simple;
	bh=wpVJWBuenZcD3eSVXXuQBdHxyRZUm/ZGGvsoPgMAlCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIvBl3KzkHB2QJ9U4SmhcT5ztzRHgKYcJ9OaR10F3IiGzl8+VGCGxQFK8at5b4dHr9PogiYS267Ho6X60YtMA7SadxIRJV3BMoV3Ms3aY35dT0QOcud6FRwm9bwvu28lHPvP4vC5yxv+RJO81XORHszP7c502N2CLiU0qIAdt48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMiHZA1D; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMiHZA1D"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-295395ceda3so2607075ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 15:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762211157; x=1762815957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogon7TK6sOugcfKJJppW+WnECgyNYUKvMApdomYEbKo=;
        b=CMiHZA1Dx3TONUc1uZHfqLTY7pYjVGhppzjfh99oqjSc5G6TRcS4jMtNzlwmIts3E3
         y8bFQ8QVMOTvVX/EpzNoQLJ3j64+hwAE4YusSzS3JcnVpcdu1UyJP3H4mRz60h7HjMCQ
         FR2fpLyws20tNwjfyEDwODyz0t9rhbE8W7Ws/cjVfAfYj3jIlwRwUw+S/yqhijCI6ZQ1
         7T233cgYC4xnP/sPKtzAmODvFl/bA+tWZnqOjLXrHHkYps3uQl9enlYMv78BNMvig5co
         iWg2ytYb/XHpX6IIc35vuYCyJOcq22owxU1WEBYOLGUL0nRDqvvHDgtoZ1+WevzBKGUC
         Q3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762211157; x=1762815957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogon7TK6sOugcfKJJppW+WnECgyNYUKvMApdomYEbKo=;
        b=Pn4S1iNABK0DiWQveBDripib3+EbOm4FAwshEgUX2YAcCk76lDVGRFSg0cL688TfBS
         bNrkhbzTjoRTfkFEM3s49QiBTWC7MnEtrxpSk3q82ebOQanflREEqpupxYcrfVXYruJm
         v+27WWYe+DjSZXzUikMWKTxiR6TtVXaYvPsKt0J8h9fjnQ1E3fuRgQAAVR2lUE0L5D2t
         dK6R4jCY+iF/aFhCVkxA/epKNnDCQS1UOA/kVN8nsWtWFH9wtZUgK8goEwaOEWGBEgoq
         rsHNfC/iUifKshOqt5xhStbzEkOq5KB/6Iakad/LV3nHy7JVwq9mSlyAXcuu0mopEfXY
         FAJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr5YG2Hh6S+LOVgtQMJpPVKtviHu0wSCoIBy3t4+jZA+hC9CKuSSFAKYiG4ztTHfUhEqj//A+ui7IBQZhudw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP91Q1GBemkzEQ5aoGRr7D8GtSN20v6czOV7j8hpHivmiorE+M
	qY+8wirjrZEjosiKVk8cQNw9aNBFh1TkcM5qNKCzT/0KRwwF8o+KO/eZ5wsQGkdbAdoBMbvi1y0
	ZlA58Qwfj37d6Hd0NXRczMZnVpStVjK0=
X-Gm-Gg: ASbGncuraB7O0ZJoONYx/JEiKDtkNtYI8YlqEOxxIdjKHQC2RFFPHzi2hxkRkSquvpB
	X0mRISye/n/ybGW9LRwus2CVvoO8vkwq/cFrGmldr9w3sOMA2rxb/7Nu4iJ4UiRu3r34nFNfzVy
	6ya1BI6GijH4/MKGWuLr6yTv/Vla2GQ0TRAP54ZVpZjtHFNPV4hBxpSc3z/e/fjXw2uqZPa+zKn
	Hiawj64C7+Rk2rF0Qzn2lk5y2hYWaqF/JR4SMuNOLlFlyls5l2ldEMHD9587MQhCG1FnnVPwgIO
	ts5u1+X5711Azp38nYLFBd/KNC4m+2anO64RUetuTHLgYP+pNX8uwzrCOb5KVvQFQqfe5nnZJ0u
	dpVELCfZO8Gt7zw==
X-Google-Smtp-Source: AGHT+IHugv4iFaTOCN4EOCjTVF2FfjlZWUSHrrn/GBxoYhXzdeo7YpUX0U5SRp9TWEaFsHczNUaXZUgkuqVdFch+J/I=
X-Received: by 2002:a17:903:187:b0:290:ad79:c617 with SMTP id
 d9443c01a7336-2951a380699mr111057345ad.1.1762211157387; Mon, 03 Nov 2025
 15:05:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251102212853.1505384-1-ojeda@kernel.org>
In-Reply-To: <20251102212853.1505384-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 00:05:45 +0100
X-Gm-Features: AWmQ_bkuLE73e6Hn0H_oMw4VNuro5lNa0qxJ-qywqWQaWYuKfzn120mRL3CMPr4
Message-ID: <CANiq72=0JJz5XDHGpiyQBd9AmPCr4veJ=2oJywyyqQB8iMxqvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: kbuild: treat `build_error` and `rustdoc` as
 kernel objects
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 2, 2025 at 10:30=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Even if normally `build_error` isn't a kernel object, it should still
> be treated as such so that we pass the same flags. Similarly, `rustdoc`
> targets are never kernel objects, but we need to treat them as such.
>
> Otherwise, starting with Rust 1.91.0 (released 2025-10-30), `rustc`
> will complain about missing sanitizer flags since `-Zsanitizer` is a
> target modifier too [1]:
>
>     error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `buil=
d_error`
>      --> rust/build_error.rs:3:1
>       |
>     3 | //! Build-time error.
>       | ^
>       |
>       =3D help: the `-Zsanitizer` flag modifies the ABI so Rust crates co=
mpiled with different values of this flag cannot be used together safely
>       =3D note: unset `-Zsanitizer` in this crate is incompatible with `-=
Zsanitizer=3Dkernel-address` in dependency `core`
>       =3D help: set `-Zsanitizer=3Dkernel-address` in this crate or unset=
 `-Zsanitizer` in `core`
>       =3D help: if you are sure this will not cause problems, you may use=
 `-Cunsafe-allow-abi-mismatch=3Dsanitizer` to silence this error
>
> Thus explicitly mark them as kernel objects.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/138736 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied series to `rust-fixes` -- thanks everyone!

I will send another less urgent one for 1.92.0 (in beta now) that goes
on top of these here.

Cheers,
Miguel
