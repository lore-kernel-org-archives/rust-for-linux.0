Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266E61FDE29
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Feb 2025 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573740; cv=none; b=EvgqNee5CsI+EtESf785gHqqE5bj4XhijXBt/78MLU1c8AT8zpAlnHxEkEBu4+bPZEbG9fnogB4TvYpCDHc59agNc807V3y5U5Oe+aT1e8p3lCeo44OBHXakHlTut4/kuZ0lAxRH3wzHVPVtTaAw2N9jMGEv1nwSBPDvFJ/7tfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573740; c=relaxed/simple;
	bh=RtOwM5RxJfd+VfcKZGXtlLQFSXd03HQ8e4rhtGXZjtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qli9b3YxCMx+Kf/D8YseMT0W8STxPjTZyPzCcSsFhV09NYlh+RdD++Dz+aix+iHFsuiz5eYrc3BpE/Ba9TqKBhBSf+bJUyjzIZo2l1UMfUQKniLn6LQuhbV518verOipVqp1wo+pyy1V4c8FTTZYU7ygCkBx70Q6asng7jJSvxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WUCBXKpe; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WUCBXKpe"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436341f575fso47347475e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Feb 2025 01:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738573736; x=1739178536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtOwM5RxJfd+VfcKZGXtlLQFSXd03HQ8e4rhtGXZjtM=;
        b=WUCBXKpeUNWxXUCxg3n0WI1/2flHwuSyX39zQciObGvJLISB2qayln0HHz3TCbmZ7l
         cxh66KQgGGVSj/6OHgqU0vgSMVQ+IniX9huVNORev9sqbtJesRenr4t2kP9x/zdbaS4y
         X1RnMGS5TMz1fZJ+UBFGdjP6aO0g6k4/5Zx1OO76WzAAjV9bpusMVR4xJGYjE5TVQlGg
         8KIMh2EIo4i4f6+jj9Po5JKJvCjYmvlJB93yj3luPDyH/usWS95WdPEqlgNNuiCnqjAE
         5sOfEsC/BtXHFLrPdY4lHVFfEMDdBMfefZHidU4/F8U+ylH9Y17/9XM2dD/Ai1hB9k61
         Wdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573736; x=1739178536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtOwM5RxJfd+VfcKZGXtlLQFSXd03HQ8e4rhtGXZjtM=;
        b=o4Rv35fm+Ti0TpJX/R4DJeb0D+KrQVEvWvG8z6xOLZ8uoiOExArb3kOSrzuRZwlrsE
         jCQZLgRp8w01K+06YpDkfhIggUVdyA2jyz1BI/2sZr0TFQQydiX4IhygVjVPy5k4yu9z
         P6CJv7e38q4bWPADamChSISIy9tg2e8HEWE+koGuhytzPSAvBQJnb+JAbb81NX54SBDc
         GXEDzzS/JaYLLpp0GauFD+hnJclX+4tVxnIse3+bVcsZeYYQAEdFF2lsNzj40Q3C2bAD
         fGE9/5O6060I1pHGBU0IooJqC+hmFLzhWSDlaDVEjNrgXatpkjpWfaKyFG03J2wmNr9B
         gBRw==
X-Forwarded-Encrypted: i=1; AJvYcCVvYJ5sawQuubmNMGOca9O0R1VMXrzaODsSIuQCuVBHPTaUW58NzJc95JoRcBKhkjwtBmUJ+S5ctggGp/JuNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTHAW9hiSXo9mB8kgi/t8GKonAa9+jMi8DdoylmYxMcjJBUvey
	4oK6Co6NQrD8yYv+OALwLzzmTtu2Lbnum1pFFSqoNRaLGtxdla5Qv1eqgPHJvUKjK71KWgeDxqt
	F5cKG2fpdbTcubCx/mcjpd3vU/g3dmJu0St7p
X-Gm-Gg: ASbGncu3jE/3ERtLtEKlwfC8oKww203XjtsRCYGKI36XXah9txNE0KQxVMSx16Uzod3
	aiB+RBVQwZx5f0HPCUdxTSgT06QDv/7UDznm54QZJlPu/IXTpbdLfbKZc3TMIOrwa7xTWxVMTMb
	Xtv540Y2Rk6pWOB+nVsXI81JVH
X-Google-Smtp-Source: AGHT+IFbq1pWVjjFTT5eK9hOL6FRx5b2gIclK01nWaF+0UuNV0XQVQD1CBTLjwH7htojNlMdbttCQobb6NaNzGYfeNk=
X-Received: by 2002:a5d:588f:0:b0:386:375a:8322 with SMTP id
 ffacd0b85a97d-38c519506eamr20704188f8f.13.1738573736075; Mon, 03 Feb 2025
 01:08:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-6-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-6-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:08:44 +0100
X-Gm-Features: AWEUYZlZbKxfLpJhhJPVmBfowDaLOLNb2zkL0fALAziRhJs2A8Tey8gfRdFIvFA
Message-ID: <CAH5fLgjtwcd6heHST2DCrmKWRp4w6KAEOHEoSm7t02J58LSQSA@mail.gmail.com>
Subject: Re: [PATCH 6/6] rust: page: Make Page::as_ptr() pub(crate)
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> There's no good reason for drivers to need access to the raw `struct
> page` pointer, since that should be handled by Rust abstractions. Make
> this method pub(crate) so it is only visible to the kernel crate.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

The Rust Binder driver has a C component, so it needs various as_ptr()
methods to be public.

Alice
