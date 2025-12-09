Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC7B258ECB
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 10:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277783; cv=none; b=c7nVNONLdpu85YoF5WOGTLgo4FU5szbf+MGGVX8K5xutXPSz+C/NXS8eegnCvyBBcBd1ozyQFCnDMqBQNABCg2nYfkgFHPwRz1BnPaQAGsifNWfH5cDSVJsh+c5RpCbNpQIrafGDI1R9TDJARMZXvdcnTQ4mSQtVjjBpAjihV5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277783; c=relaxed/simple;
	bh=/sUjnfezPWLAwP+PzZ5gTvwfQR0RdY07pn5B/OxMk3I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OkDK65t1JWzsii0pp+xeHNIvMk9bZ1GSsbYJ20O5bX97OzQWCCz6WoaAQqWI+bRn1tUgLvM53oQLVuVYNpsaoZOdus3s7xPBhc0sRBJbuWZcG4ow6bvaNukM9maHoWyZ4jbLBpYwYgmPJAIzD7OJa6LbUteeRIPSqpv1VECzOCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfWjDjK5; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfWjDjK5"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b9da0ae5763so572452a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Dec 2025 02:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765277781; x=1765882581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pvRlcynHiuasyCor4X6/Uu0p3rWYZbAUO+GFeJRouJU=;
        b=WfWjDjK5Ryv2Fe2/SkPtkWHLq0guaABqlKI/a9xA3hGG3qHVHH4HTwOnGv3PcZ1Ksq
         GH+zaQP54D0ba0UlpOWZBqBIpRKbpxT+8MHjeqSxyXUGElpvLs2jeAVpP4zWrjoLDdor
         5fFd42crnDuMq8QxDe+Bwh6emCXG0DiPz7Tk7czXw6LUt/lyeo4OPEbpkh7m9Tqkos5h
         PAozdonHGUb/Xgx1JLMQebTyQULhvZnOzyBLRqvT1jGr8TDdKCsIeccYdNS776NBeA1N
         0VzngUpe3l93fDKqQ+uDdEXHEhcVsrdLsvfYGYAk6DKyPAh/KhEMrJKoNLYZp/CU7XkW
         4Kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765277781; x=1765882581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvRlcynHiuasyCor4X6/Uu0p3rWYZbAUO+GFeJRouJU=;
        b=JSHIrypF1PgRoE7ZKd90+44yfvu6gsgVx1GFfuYEHxX3oxsUTfG/Rr1i3Ixmzuo7el
         w7QleEsmRGkGtj2H5hycjlAknVvYCyQayULDKMnlJCu5QUImqK2Ut6FtmPZsTvCyCzyJ
         4MSsiLfF8fKRcv2eqCf44WuyTWpi63ZFGY8uY423gU2ltwos/z3gZ4mWZ7+mLuTzlTyA
         OjHE0TgaKJgBN61fPy+imv7LnC1DOkU0M6ZIfffN4M13gGilP0T+cEzoWevXfKceE5Es
         dpO0RlGnURlX0jMZrQMEe7LQR2nb2lFpnPxCg6KoFN6kT5Kq+DwWS1ohd+62g0r2mwt7
         U0Jg==
X-Forwarded-Encrypted: i=1; AJvYcCV6vwrwykEHNJyzIYT6GUDGsG8kpW3e3s7pOauh6FXKMxXKb+tEgoBkYnNjmMhv+a59iIPE4gQIg+YDuOfp5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTUo4tc1ol2i8+8XG2jOQitLNICTZElrLpAumIXlHQbwc1LDd
	hd7Ck8W0ae5hsG0cGcKLesJAyuHDpXTXo0px4nUM1yKfHTCJ9wJJyriM4o0bXuaD27aoQOMTJpz
	6eOc40yI1bk0LQlQrCLMCKmpVW+arSvc=
X-Gm-Gg: ASbGncvDw1rH3HtlVGWXG1nJU8tHM2brGY7yR/4jw433JG9B6igmwYHWEy687Wbsu9m
	aFptu1uz7MkySeusjjBzEKl/Rl/HQx5dFk5N9dUtmQuVF494LzmyOCuooScJ/a1niP1TxnwaMBm
	BZlWLhu5BxAiPZd7sk0uJ5psB0TeQJR4nuo1jMO2rWpOwmQTcYdwq0wWtYGndkgOHYqTxJMBrrU
	y0xu5gDQk/YbkdnutoC1pYzHfy3A0BnyCWHpWj9hVbZAfvu8VGh1wuGHQtSa1/Aekbc6FJz/M6/
	wj6UjT+78qx9I3m07t7CE5ncFWCagFZkfUQWc9AUyPK206npH36ByeagpoP8BAFsT9I/xYejxln
	rL5sKAtDd+J+eLQ==
X-Google-Smtp-Source: AGHT+IEwa6G1zQohulwtrl9WSWdU16jgSc1lTXJOSBiNdLda+tILKYfebTkrhv6PH4eiJ/GXU5LeEOvj9cfrmnIkCkE=
X-Received: by 2002:a05:693c:2c07:b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2abf2fe7757mr801895eec.0.1765277781185; Tue, 09 Dec 2025
 02:56:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Dec 2025 11:56:08 +0100
X-Gm-Features: AQt7F2rwkGGV4cSUfnFxWyEr8VCKyN3XNNZoV_reW6koJsOFQb8jKZBGS9Oh0tY
Message-ID: <CANiq72mEYacdZmHKvpbahJzO_X_qqYyiSiSTYaWEQZAfp6sbxg@mail.gmail.com>
Subject: Mainline x86_64/arm64 defconfig+Rust `rusttest` error
To: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am seeing in mainline x86_64/arm64 defconfig+Rust the following
`rusttest` error [1].

Cheers,
Miguel

[1]

 ---- rust/macros/lib.rs - module (line 62) stdout ----
error: linking with `cc` failed: exit status: 1
  |
  =3D note:  "cc" "-m64" "/tmp/rustcHhYZSx/symbols.o" "<2 object files
omitted>" "-Wl,--as-needed" "-Wl,-Bstatic"
"./rust/test/{libkernel,libuapi,libbindings,libbuild_error,libpin_init,libf=
fi}.rlib"
"<sysroot>/lib/rustlib/x86_64-unknown-linux-gnu/lib/{libstd-*,libpanic_unwi=
nd-*,libobject-*,libmemchr-*,libaddr2line-*,libgimli-*,libcfg_if-*,librustc=
_demangle-*,libstd_detect-*,libhashbrown-*,librustc_std_workspace_alloc-*,l=
ibminiz_oxide-*,libadler2-*,libunwind-*,liblibc-*,librustc_std_workspace_co=
re-*,liballoc-*,libcore-*,libcompiler_builtins-*}.rlib"
"-Wl,-Bdynamic" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl"
"-lc" "-L" "/tmp/rustcHhYZSx/raw-dylibs"
"-B<sysroot>/lib/rustlib/x86_64-unknown-linux-gnu/bin/gcc-ld"
"-fuse-ld=3Dlld" "-Wl,--eh-frame-hdr" "-Wl,-z,noexecstack" "-L"
"./rust/test" "-L"
"<sysroot>/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-o"
"/tmp/rustdoctest9bUijb/rust_out" "-Wl,--gc-sections" "-pie"
"-Wl,-z,relro,-z,now" "-nodefaultlibs"
  =3D note: some arguments are omitted. use `--verbose` to show all
linker arguments
  =3D note: rust-lld: error: undefined symbol:
rust_helper_atomic_try_cmpxchg_relaxed
          >>> referenced by kernel.e6083e32b3c2ec6-cgu.05
          >>>
kernel.kernel.e6083e32b3c2ec6-cgu.05.rcgu.o:(kernel::sync::set_once::SetOnc=
e$LT$T$GT$::populate::hd1ceefad3c0dd5d9)
in archive ./rust/test/libkernel.rlib

          rust-lld: error: undefined symbol: rust_helper_atomic_set_release
          >>> referenced by kernel.e6083e32b3c2ec6-cgu.05
          >>>
kernel.kernel.e6083e32b3c2ec6-cgu.05.rcgu.o:(kernel::sync::set_once::SetOnc=
e$LT$T$GT$::populate::hd1ceefad3c0dd5d9)
in archive ./rust/test/libkernel.rlib
          collect2: error: ld returned 1 exit status
