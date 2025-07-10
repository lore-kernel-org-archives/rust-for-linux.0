Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC717741
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752153658; cv=none; b=Fqc55weL4preiZBsnTXxMW2V8oTVzVX9LTITHB1wkvb9uxvU0sUSOAK+Hu3iQC5zZVYeNLrI+1c6oMXeix82EYbtK5MFbAP82dFYie8gda+bdldyodOxUdYb2Tx/NR6YzX5twXG9J7rpivSqqWdOCloL2L0c+z+OQ0Epx4gE76o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752153658; c=relaxed/simple;
	bh=bj9Gfo/3Jr9EZIY9fK3lkcHewhYwv0doXs2kKiWDFPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fPNETHC3HiF5yLmAdjELdvKW88cdXfljPL6stEjI6R7PRqa63oQyKd+5Ca+I2L4dOqKMuzS+Mc3ituHy3yfOo1smK6jH8R3rQFa+k2CL1g6OoXOmMg7nIKh8K+4czzQ0b6SjO42V9HDAmu1h22MlW2/mnndzewnGTnd5AVwx9AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SO1ZSiUe; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SO1ZSiUe"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a52874d593so831478f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 06:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752153654; x=1752758454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/d3JWJXTPbcoiacIjfsqcFG5gW+YCew8k+ctgwhFlQI=;
        b=SO1ZSiUeXMtF9VJrlr6TVVAJueG/bcEFu6R61NrM5yK5eY/lFQBr4Xle8DLkpN1nTh
         icZso3d8rcwHB2PNDwby+uf6RS8Vgq+BGSESjX8j6NE+UCWMgAEEeCVfZSaDaU6bEOPx
         vn4zmaMNIl0Yd+Ff+RTrnNGUgF41EQ3SU8W0d4unGA0sKrnFsTrxQG1sVRV6SoExRwLp
         ooYVzniDtlSroGx4Y9NRMFYigkhOdIazMGOHuPGZl7dF+0+ch9GuLA8Ybd/MzdTnTkau
         rLfaDLY+/7rvuCNc/sNf3KFjteMucuqglpyomVg0JOLHwGaR/2OTB63Jhgb6rvWiwRai
         MU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752153654; x=1752758454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/d3JWJXTPbcoiacIjfsqcFG5gW+YCew8k+ctgwhFlQI=;
        b=GlKidaAhYKAmzfPCyXLxXXwSYe+km6zT8bNAtjLHMmXQ1fregOQQjWuP6A4h9KsvWJ
         EtUx0usIfU28pe7PiaddRy+bBzg5UClk71jYCixD6ZrhwBUfOUXNl/3vL4UKdMgRbdYc
         oAfhBVLfufM+F40KUdzjtOze10gtu8v+wh3/Mik15+sa0U3BjM/DQjiYmXrB06hqJCvw
         JDwKIysxg+c9iEFadAjs3s3rf2kEItVWc2miPY9Wq36zzFchd4IiAs+XnlcIwPHy2HcE
         JlyxJeHAEfTK8bB0+Ofi6UaSM+Pg+ekJl+DxmSnlEiHrgyKBSYlrMCUD8L49vk7s5TfU
         a+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM9ftQFzwcgELIH+XtNCggP70XAb41HCulIthc6aWzupQ3mxC0DfZF3w6/2syrNy9tUXeDCZ19cePiUTUDWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkjPsNpL+NkdZSbStjlK/QFUXfIrJVU8u40/v/n8k/+RZttgIJ
	4PqO/dBGwGMT0vsTrF8RYyBY0KYKjL6qLlZwaOdjHxGJkxG5KSmGHwjcgKAsNwH52nAHP3oAtUS
	/5+Qhzro/D7iWyapHAeKo7YNGCsNTUHGj3RJLCtqS
X-Gm-Gg: ASbGncvkI0P7/HjBXnK+GhWuqJkNzNhvY6cqByeL3to1GVBkvZrpcnBxuSOW6YUohil
	YVNFh1goUUDeIgg6LIJyDhVtQQeuXpbvQDY88U0VBOktvLrxJflzwwj53MAXAwc/bDl8z3qOjRX
	Ufd9M0ZVDxKEpivCzp3kRKs0V6ldxSC7uO2XLvJVuO7atVBeYXq6d7a5uOrXNutuBbhvS1dbJf0
	A==
X-Google-Smtp-Source: AGHT+IFujM42vH3V09euhJ0T7/vZlUGl5l2Mqd+XJHCpPSNb1kApqRjCh9Jtd3SgLVxJgkK09tgAyiBl1EsMOOSUJIA=
X-Received: by 2002:a05:6000:2806:b0:3b2:e07f:757 with SMTP id
 ffacd0b85a97d-3b5e788d3d0mr2685032f8f.1.1752153654256; Thu, 10 Jul 2025
 06:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Jul 2025 15:20:41 +0200
X-Gm-Features: Ac12FXzitYxvRbQjbTDWexl7FT9vfcJPNeta0DSIvcawfTODepd7_rNw8p5wCA4
Message-ID: <CAH5fLggU_DsJ4-gj_xBeGgG8mS4CSrypNsmOqu6c677Lyyvqxw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Replace `kernel::str::CStr` with `core::ffi::CStr`
 (cycle 1)
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 10:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> This series makes preparations for the replacement of our custom `CStr`
> type with the analogous type available in `core`.
>
> As this is a large migration that touches many subsystems, it will take
> place in several cycles, each of which may see multiple series:
> 1. introduces facades in the kernel crate that downstream
>    code can reference. [this series]
> 2. migrate downstream code to kernel crate facades. (N series, divided
>    by subsystem).
> 3. replace kernel crate facades to allow `Display`ing foreign types
>    (such as `core::ffi::CStr`). Replace `CStr` with `core::ffi::CStr`.
> 4. migrate uses of `c_str!` to C-String literals. Replace references to
>    `kernel::str::CStr` with `kernel::ffi::CStr`. (N series, divided by
>    subsystem).
> 5. rename `c_str!` to discourage use. Remove `CStr` reexport from
>    `kernel/str.rs`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Tamir Duberstein (6):
>       rust: kernel: remove `fmt!`, fix clippy::uninlined-format-args
>       rust: kernel: add `fmt` module
>       rust: use `kernel::{fmt,prelude::fmt!}`
>       rust: str: remove unnecessary qualification
>       rust: add `CStr` methods matching `core::ffi::CStr`
>       rust: use `core::ffi::CStr` method names
>
>  drivers/cpufreq/rcpufreq_dt.rs    |  3 +-
>  drivers/gpu/nova-core/firmware.rs |  5 +-
>  rust/kernel/error.rs              |  8 ++--
>  rust/kernel/fmt.rs                |  7 +++
>  rust/kernel/lib.rs                |  1 +
>  rust/kernel/opp.rs                |  2 +-
>  rust/kernel/prelude.rs            |  2 +-
>  rust/kernel/print.rs              |  6 +--
>  rust/kernel/str.rs                | 97 ++++++++++++++++++++++++---------=
------
>  samples/rust/rust_print_main.rs   |  2 +-
>  10 files changed, 83 insertions(+), 50 deletions(-)
> ---
> base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
> change-id: 20250704-core-cstr-prepare-9b9e6a7bd57e
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
