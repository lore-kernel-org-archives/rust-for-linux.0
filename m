Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69F8137775
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Aug 2024 21:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724706524; cv=none; b=cj4hhRGo6XVs2plzQqslmlzCa7ef+6m8NkT3OBzIZvZiKCBOeLfE8yoNO5J682gEuQ36B6zvhIvoEmIrsnH/GTAIsZfJEyagfxbMOlHrpdkmhcOYPJzde5t6CbNXxUfXgfWnaSJsmmHx6T5W+Xrvtx5dlIwTZlL+y5jdHWSp860=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724706524; c=relaxed/simple;
	bh=KiSs8Ld+Hqvh7z73BkjqcrZBmHfVf37Ng8cEdIWdzgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nvikm4swHfCs+dLeazhMYIr6MX49/CSJyEc8zcmordwG+tRGmydk9Ox92SJhHoaOYPUCAkTO6rCel5uAwVRsxrNayTW2aOukWCB6fECjaXB7CUAAssSQTUaJBJRoyEJ8V4NF+WcQilBnDkKAFZFNmWYYf6MO/w3qpdzogyK0ojY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y6oSd4w0; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y6oSd4w0"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4518d9fa2f4so96691cf.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Aug 2024 14:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724706520; x=1725311320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiSs8Ld+Hqvh7z73BkjqcrZBmHfVf37Ng8cEdIWdzgg=;
        b=y6oSd4w0VP+abRyaRZeCZKKesFuRL1JljaJnqvJVn8xKdJCzyZnJN3M9j+5O19T1mf
         GJ5s/YBdW1G+uURhzeTTIJb9eVNIIn3wQ/2ByeOswG23hF/i8IOK0JdfhhqUoHX3i+Jq
         Zp+/6ZI0tfPL07D8YTjC9hJXoTkWR4z+Z+OHXVlr2YouArb57GNabvvvEL4DuX3a/7pr
         H5jgYd42ARyg+RcHlB82LC2tJ0YZSlxAFvuPkoxk2EG5WtFM3bIaboN52x+lr42+Hicp
         M32Nb8bgr5C8sSb/Ids4TIkKH/DcVmwwnWVDiJPPflm4rDSO044FRnms+NAQyyR66v87
         wBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724706520; x=1725311320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiSs8Ld+Hqvh7z73BkjqcrZBmHfVf37Ng8cEdIWdzgg=;
        b=b88R/vlGsg+XiiOlu0j8na6iqmaYptftn5PpjDVodr2SF9bpel0mP/atovc4U/0qnr
         nW9S84o1OegSJa5UUhYgMmoc6+sUMXx0WHwqd2/MGdK/5tsft1aJSDPG0XsDEJVdKWXY
         2mXz2MBcCtABlkDpWfRKRVxIBuyitpnwxQcUSf6HWCgvlSLpwa7l6wlBBcm3qSyJhNTO
         x9fzL1opbC0s1V0+oeqyaetgx1zG0gJPTQjXunXEodcHYnXCGwlktl9I1iqaqT8BAcnE
         mVWJ6dd1OPtLg15Tf3R/mlF2abhEKqG5qokz4zk3yiqHH9WQBX2q3OSHJC2ZdOe5pHte
         ufBA==
X-Forwarded-Encrypted: i=1; AJvYcCWH8IH+4bz8f3De9++JXw+Ofx4QC2MSRmfenL/O8LnTjgqYgGzvi2R8AxYeNe40gzCvU+s9dgDV/UMsYA4T2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP0J+PAyRqGa8xMX99dQXRxIh0yjvm4AIru0i/A1D59hqoVOav
	YT/3jiPTwumSK2/+N+Ks1dZi9lL8uXwtzf9TrDYYJQjp8zSRuUp+KsUuWnrpNNSsT3FWhJbpRHq
	vYKppVhQJZHXyYoxBsJvtwSePSHghV9EQ0Z9T
X-Google-Smtp-Source: AGHT+IECWdasfY/UFIN7bMKm81uTAaPDrHsUsCHLY9/cLTZKNWb/yflFWF/SW7xORk1YUXgxUIFzUcCbaUD6VgF3LhI=
X-Received: by 2002:a05:622a:4a:b0:447:dbac:facd with SMTP id
 d75a77b69052e-45661a350fbmr1007471cf.24.1724706520341; Mon, 26 Aug 2024
 14:08:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826-shadow-call-stack-v6-1-495a7e3eb0ef@google.com>
In-Reply-To: <20240826-shadow-call-stack-v6-1-495a7e3eb0ef@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 26 Aug 2024 14:08:01 -0700
Message-ID: <CABCJKucaxfOZki64Yb8vVEuGN+0mH9mh6NvsEKPE-NF5o2KHgQ@mail.gmail.com>
Subject: Re: [PATCH v6] rust: support for shadow call stack sanitizer
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Conor Dooley <conor@kernel.org>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alice,

On Mon, Aug 26, 2024 at 7:23=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This patch adds all of the flags that are needed to support the shadow
> call stack (SCS) sanitizer with Rust, and updates Kconfig to allow only
> configurations that work.
>
> The -Zfixed-x18 flag is required to use SCS on arm64, and requires rustc
> version 1.80.0 or greater. This restriction is reflected in Kconfig.
>
> When CONFIG_DYNAMIC_SCS is enabled, the build will be configured to
> include unwind tables in the build artifacts. Dynamic SCS uses the
> unwind tables at boot to find all places that need to be patched. The
> -Cforce-unwind-tables=3Dy flag ensures that unwind tables are available
> for Rust code.
>
> In non-dynamic mode, the -Zsanitizer=3Dshadow-call-stack flag is what
> enables the SCS sanitizer. Using this flag requires rustc version 1.82.0
> or greater on the targets used by Rust in the kernel. This restriction
> is reflected in Kconfig.
>
> It is possible to avoid the requirement of rustc 1.80.0 by using
> -Ctarget-feature=3D+reserve-x18 instead of -Zfixed-x18. However, this fla=
g
> emits a warning during the build, so this patch does not add support for
> using it and instead requires 1.80.0 or greater.
>
> The dependency is placed on `select HAVE_RUST` to avoid a situation
> where enabling Rust silently turns off the sanitizer. Instead, turning
> on the sanitizer results in Rust being disabled. We generally do not
> want changes to CONFIG_RUST to result in any mitigations being changed
> or turned off.
>
> At the time of writing, rustc 1.82.0 only exists via the nightly release
> channel. There is a chance that the -Zsanitizer=3Dshadow-call-stack flag
> will end up needing 1.83.0 instead, but I think it is small.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
