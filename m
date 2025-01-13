Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2161316EC19;
	Mon, 13 Jan 2025 23:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736812394; cv=none; b=bHaF7lji4qQY+NptDqQgxHLRN4DWj3r3QSR9/zTWFDq2vAQgEL8MZfxyFHcbfCAFzMnzCMZvG7eyOWIYaRZlAddnrArpOKhNZA06+XzWVnWn2jQPLcgNuvoYZM83wh6peedrl//7s261gL+j7dTHnMh6OihE1N/ECVB5SJmYW4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736812394; c=relaxed/simple;
	bh=nI9qAzRmBRDiGQhA868eqjo/vRFA3F67luj8bcdhx3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UlsyYq8+wvP/nriWPPxjP7oWzKAHDDkXCkfVUuTuzoCDgVxtqgCOyxWtL1pKy4sq7YCBNKYM3Q+q7YJt1sgzs9ghR1SDKez3Ii/6KVCekMMHIMY+1Ojo85//m+N+AQwHI9+5AtdRAwTiaF/bcuC3W6afk2vW+5X5ogUqe4hksAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZQdwhK7; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZQdwhK7"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ef05d0ef18so1052641a91.0;
        Mon, 13 Jan 2025 15:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736812392; x=1737417192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTM1wh6waDgaijfxVax/CGBvgR9OIiEkk59jkkrXfgM=;
        b=GZQdwhK7aR/TyuN3n5iPrmNQEDGto189lif+49K3sDVsWVSn7mI24dadq2yqo5cmLO
         pW0hNEj8jVrAB+StT1uMAf9EScIATAfCsQkqMFOeGPNIw/xvflawE3AsMj4L3xR/x5ru
         +Knwt9UpUpTMklyLs2JZqCKcaAW3Up9uBk9bMd83bjjoQ1v1t63RldCNCXDld3BMeyxn
         fPxbf3rbE4loW60/rBxYmf4Frc3VbVDYoOp0G63kYtpDqkASWoup/eWKmS2A09p6ahYR
         BVdQJvn8tJLZc5GUE5WAS2Sp1BWWOXrh5cVoYssI4A1TDmLmkOh7b1FJ4NNCTGxkprLf
         Yf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736812392; x=1737417192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTM1wh6waDgaijfxVax/CGBvgR9OIiEkk59jkkrXfgM=;
        b=DotU4I0cTRctXKioRllzSimO+npo104mZRrjKP7YLTIWsDHGkbQCAeU7hg9l2Sutf0
         k6q0YZyDTEFq5osdHoUyivwqh1Ji+16v2mCfZpaP5UglyfywuxMc5LeSlyFkCczSwDlk
         ih6lnzVT7vi3x8rmtaqGB/7IYtnGUO9DVrrXOJevfoMVfEpcvcW59JXbtEOzhf5F6SXj
         oLCJzoLIzr9YWhHjBbkNinrH4pPBFKce2lbdzOMp2dRL9wc4e/3eis0MycNE11Qx+S5/
         2kNWi94XcnH7cFT+lBds3Iw6LxBHrr9eEJdRlNlfLQ8KYdud4+NTnIVjsk6JQM11KI86
         v+dg==
X-Forwarded-Encrypted: i=1; AJvYcCWvHr3TxBLDgCOBruk8HSghQ51BXKLrePbUJzUOnOzk81mqF358Nvc/ITpMi5liOPrdmPiRcFP3aDr+RGs=@vger.kernel.org, AJvYcCXTL/LP/58hl06yO3qURTaG2dpr19h23glSp6AlpCiJzcg0Egoon87jMJph2IhPNHeolnuyUcck1SHm4tjlfZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX/Yrk7ovF3OHJ1YN2wIEVQiSc5tU+zqB6lbPCPZJgIuRDKPgW
	5HilVN4xIS1BkMkmKWO89zmdW/ZU41cBy7VDDbVadHeqKKjwt+VSJt/yq0O8zskKRuO1xprgmsd
	dQjjgFQ7zxRQaeT8xWzraafaB2cU=
X-Gm-Gg: ASbGncvpeX1JW5OFu/DIxk8lc/zTQOViVVxTrJomA46o8WvYflfLhCsByTerxQXO/Al
	twFgEYWmxmOkmBJXmjTtBRPErB745ot6LwhxG6A==
X-Google-Smtp-Source: AGHT+IFKPNpY7N9wd9z8Sc7z2vaBUTiN/HeKXPWjQxDsmi30rmh/SQCanzF3zt88yjt1fbRJGvda2e5JCkH2TtLCVyc=
X-Received: by 2002:a17:90b:1f83:b0:2ee:3fa7:ef23 with SMTP id
 98e67ed59e1d1-2f5490fa6f6mr12573077a91.8.1736812392340; Mon, 13 Jan 2025
 15:53:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120-borrow-mut-v6-0-80dbadd00951@gmail.com>
In-Reply-To: <20241120-borrow-mut-v6-0-80dbadd00951@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jan 2025 00:52:58 +0100
X-Gm-Features: AbW1kva5Vys9qaPfdF8DYd553Q14uw27DX80Pke-IqQECFjkJcn2RAjPSdGDNuk
Message-ID: <CANiq72mCj0xT=o+-4u7MAtH=hGPB-qRFMyPAm7B+kJ59HNVTAg@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] rust: add improved version of `ForeignOwnable::borrow_mut`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 12:46=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> This is a re-submission of Alice's patch[0]. The leading commits are
> intended to improve the consistency and ergonomics of `ForeignOwnable`,
> and to split out the code movement originally included in the patch.
>
> `ForeignOwnable::borrow_mut` is a dependency of the memory backing
> feature of `rnull`, the Rust null block driver.
>
> Link: https://lore.kernel.org/all/20230710074642.683831-1-aliceryhl@googl=
e.com/T/#u [0]
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Reworded title slightly. - Miguel ]

    [ Reworded title slightly. - Miguel ]

    [ Updated to `crate::ffi::`. Reworded title slightly. - Miguel ]

Cheers,
Miguel
