Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57A614EC61
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721750501; cv=none; b=oIQL9Fmhern5gmEESXFpRup9cGgCDblqDiL8GUBxxmVezcu7dOq3FvmMbOAJyt4/jutd/LyPDaJ04c3pp8K7jpAEZtYFGk3PowpF2gUVXraTlJ6S6FVYf5zwlLe8ygQBM8qq7gtEhIzObP0qASrfMhxATMU6u3Uqbs7akHyxrjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721750501; c=relaxed/simple;
	bh=Udo5u1NGcABRv9IYPg6aGyjzgCj3Iz+oX735pdKCt1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RfEaVw0QiNHN8rL3h1Rgx9eGP9imjfCUPfsnxoYEJl6eTIpxu6i7cFeWcAF7f5rp0RT3D9WUs1o9MyLOd6g98ZTodSFjP02GvN+jNyNG4qbVzZUBgToVl13GmqSTxih3zCXIG443zqsbUPaFrXMkTYUJIeiE+nl+et3EiV9oUjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7ThDNQs; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7ThDNQs"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-75ee39f1ffbso665399a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721750496; x=1722355296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Udo5u1NGcABRv9IYPg6aGyjzgCj3Iz+oX735pdKCt1I=;
        b=D7ThDNQsshNJyRKRs0ky+THEQ+N5WbTyYoTwkpVAVZekl9jKTLvcgKiAxTgjuMScG8
         XGIq+s/L9jDG3fSdu1SCMkaVLqNBrxjMiFpZULN/W9ffs7jku6v4pti2lCnTm9de0rEj
         WVt+ps49eXnL3EPgJi5w4DzjYpN39sTjQs7neP3mVMtX82eSr11DXg6xBXkQPJxqfeAp
         tmYD7UtbJAq9mSJmpii25hQAvUUrKxtm64/Uj3rYLGPLn3X90hU9mexIMdCuBLrV/92J
         6JdLXWvpPLesLfmEgjT2YfF829GhtsMkgj2nAJ77bRoJcw3p4XbriNj8DN5GOTWwqP8m
         Ko9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721750496; x=1722355296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Udo5u1NGcABRv9IYPg6aGyjzgCj3Iz+oX735pdKCt1I=;
        b=Wg2J6g6tHG2N/9SwrPIjlLcJVomB78BxFGOM3CF9oZ6gnBYbbvfu2rLxvJ0Zano/7Y
         wOfGK+T08FPIbih+/64sr8gUAU2RfJe54pvx5qHQYIEWhTSlZdAdpRe8ASAT2I/SHwBB
         pY/r9QjkWDkuZeA93zf1EawyM5zmnO+cFQwZs7ljYDNKoZhEY8J3qPXgkDywwUamvZxF
         Y86jglUO4qnB7pRybDp64lHle3nKJvAbrchU1dxwHXQKlrbYk8jZ6xJvgJJHJQT1cSwK
         Gs7xiMcYMcL/VmDMOkjLp/aswrgj71FOvjYADTH1p3Pe9xAyVfPSzDKbx0H/rNIBVR61
         rEGg==
X-Forwarded-Encrypted: i=1; AJvYcCUkWIP79U6qt92+bVlFauMwEq4ynEbHVHQDFyWqicy/Oct8YKOenKI8XubS9eLoqORP3YOnwzXCHbL/qbzcBmKxJSPaxpSi34Fp5D48B8E=
X-Gm-Message-State: AOJu0YxMDBGkLexcJfEiOBHOJDX81VSOtJyBFPOgR2AVJ6RPXI7IY7Wq
	zzk/IRdnK+ITV12zgVqFprAnvsdFyRAl83kmAE3pJTCJ3Fyom0iR
X-Google-Smtp-Source: AGHT+IEYFX8at8icxprSP3ewE2YiFZJvUL92RDXpmUX4z59Bd6p+IYCeb83Vfx7v7qiRVJAdcGhaYQ==
X-Received: by 2002:a17:90b:3d81:b0:2c3:cc6:636e with SMTP id 98e67ed59e1d1-2cd85c906f1mr3178873a91.2.1721750495479;
        Tue, 23 Jul 2024 09:01:35 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f30:240e:92d6:592a:7ca:c3f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7750688esm10292865a91.37.2024.07.23.09.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 09:01:35 -0700 (PDT)
From: Sarthak Singh <sarthak.singh99@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@samsung.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dirk.behme@de.bosch.com,
	gary@garyguo.net,
	lukas.wirth@ferrous-systems.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	sarthak.singh99@gmail.com,
	ss269@uw.edu,
	wedsonaf@gmail.com
Subject: Re: [PATCH v2] rust: Support latest version of `rust-analyzer`
Date: Tue, 23 Jul 2024 21:31:28 +0530
Message-ID: <20240723160128.3259768-1-sarthak.singh99@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <CANiq72keKdr7ZhufjdeM3g0tgDo80nk2NNBN5SBSepHry-LaQQ@mail.gmail.com>
References: <CANiq72keKdr7ZhufjdeM3g0tgDo80nk2NNBN5SBSepHry-LaQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Miguel,

Thank you for reviewing. How do you send replies? To send this one I
am writing a text file manually to look like the generated patch
file that I emailed earlier. Is that the best way?

I don't have access to the ss269@uw.edu email anymore.

Should I resend the patch with the fixed email address? Afaik there is
no way to update a patch, let me know if that is possible. I can also
add the missing Tested-by tag in the new version of the patch.

In the PR [1] the ability to guess the sysroot based on the sysroot_src
was removed. That is why every version of rust-analyzer after this PR
fails with the current config generation system. rust-analyzer needs to
know the sysroot so that it can find its proc-macro server.

> From a quick look, the `sysroot` key has existed in rust-analyzer
> since 2022 (189521a4db6e), but undocumented. Then it got documented in
> 2023 (5da14237eb29). So I am not sure what "`sysroot` over
> `sysroot_src`" means (and the current docs are not very clear on what
> each does and their intended interactions, e.g. what happens if one
> specifies `sysroot_src` but not `sysroot`, or the other way around?
> Should `sysroot_src` be relative to `sysroot` like the default?)

sysroot need to point to the root location of the toolchain. This
contains the rust core and std library the compiler will link against.
It also contains the rustc and cargo for that toolchain.

sysroot_src need to point to the root location of the rust library. It
contains the source code of the core / std / alloc crates. I think for
our purposes it need to be a subset of the sysroot since we install rust
using rustup. If someone installs it in a manner where the source code
does not live in a sub directory of the sysroot path then they will have
to set it to that.
I think the main invariant that we need to uphold between them is that
the built libraries in sysroot and the source code in sysroot_src belong
to the same built of rust.

> Anyway, we are passing the paths for `core` etc. in `crates`, and we
> don't have a custom `alloc` anymore, so I wonder if we should either
> delete both keys (or however one disables auto-search) or delete the
> crates in `crates` and let the sysroot logic find them.

I think it will always need a `sysroot` key as it needs to know that
to find the proc-macro server. I don't think there is a way to specify
the version of rust in a `rust-project.json` other than specifying the
`sysroot` [2].

> Just to confirm, does this make it work for distribution and
> `rustup`-using installs?

Yes this should work with every setup. The `sysroot_src` that
rust-analyzer is internally generating is the same. The `sysroot`
that rust-analyzer was generating earlier is also defined to be
the same in this version.

Thank you,
Sarthak

[1] https://github.com/rust-lang/rust-analyzer/pull/17287/files#diff-53e4b6b2c1ff2465d8abd50db160753199426fd788ddcad925752e0838e28de2L367-L374
[2] https://rust-analyzer.github.io/manual.html#non-cargo-based-projects
