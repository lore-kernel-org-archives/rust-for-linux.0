Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2872BD587
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 23:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765322781; cv=none; b=ou/Z02WyqX31dNU0DrVYVIenAlMHmaVuVGAup1eEWSSBjGsSoM4obswZsVb4KwzHCO7T+whuRboKj8k9VI/WwfDVXd6q6KbO1ofg5QtS/ml+fhAsLbUH7bc6Mnz0HJNFKqTYn7eo26rAE9CHlhsRTgGDK2gyt/pLQTjLVeUYEO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765322781; c=relaxed/simple;
	bh=Cvac8Lr4vQTZyhPenNZe352BDh72OTK02amYVsu/V4A=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=s3U68dQn+QM8BLaY3zUHdjaoNAivddJ6YPoiivqqu2gF0BgM5iMfe7PiKfxZ7MYxZq78jiUZIdc42Hools+qpA+gVlNt1fCQ6d+3vbJTflqLehqjV+fY0wk5EC81cWEsSPpWgbfVQB8uYvKrTENn2Q3IfhYE5FU3OAZITrfOy8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnk9dX9i; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnk9dX9i"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-349195f1a52so189887a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Dec 2025 15:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765322779; x=1765927579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFSMglxi03HRAT0yehis6m77IOxVyy21KOVUh0nvSuU=;
        b=cnk9dX9iYbf89UizBTJQ4edjkv4NvAUBIbMdJOg/ovgmsqrzrPr7LntKt9uBTt1S3/
         P3s4Ylc5RECOyb7V+s3Jqp6bcfYW+E8UuHixEdWKyaRH9w73xfeZotTq4jYw6zFZVzox
         ofBh5zwJXA6htIxtY4A/bz4176Ikq8OjbjUCfYBshacOXweqczkB9m1rM3c/yxd9Adti
         7j9NuzZunvXQQGk2t6lfGvq7cTm1vtLdZZM9GIrNvZebEHir4pPSSs0bigNQaYeppSxZ
         n8Yl/JJUWhGzjpRgFMIuPDjUFGiCYz/UeX1S2U1tzZvt9QiT5X+3H1eJrIlNxk2VtUkt
         NiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765322779; x=1765927579;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFSMglxi03HRAT0yehis6m77IOxVyy21KOVUh0nvSuU=;
        b=vynNBKZqhG+uPHsolRrN6nXCIsy0EcV23/FeQURtiZ3c5gRwb5FAXBJi35HOYGtZtm
         t5KQykpj4SUU3316Wc4SFfPXUmwYgmXnYSfb10uW+mhJmFJXaB/7tjR1rKKHxeUFEXjX
         /fT+PtFFelmTHDTc965eHOR8+fLXmoCvsUryRZDxKkLzyYPerUmHUQKza05CV54H5V2X
         ryPUufuBByUD6izEGz4SF/6xi3zBz13F6nzmQ73ZJRfiYUzVtKeUWIpcXufNwGmkzO6E
         VBmTsHB4MNg6aUhZa/DC8NnCQEK/YNljAQWkmlUCSSDewscZFNBeBsKlqa8UPoky96bs
         2lXA==
X-Forwarded-Encrypted: i=1; AJvYcCWfIsiRvsQJjYDpKRcra4zBLHCKVC7LUdmN8GuFp60DdceCFKN3o4MuIboP7nElTY3pDLb0CvFPN+vDs53HYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv0Dn2es/1tizW41ihe2vAWrcXdQOauFTe10w4bZaGkhf+uShC
	jCbwmlx0vkiheAl3DZU4r8DJc8nfO2l0c7RT+nFCMKMMGrhPcm6xx0zq
X-Gm-Gg: AY/fxX4K2txgAY8q5m1y1PijZBxBFd4m+UYpk67wT+tZLZuQqfYFtYGpLYnAK8oNE38
	VpLXY48HXkDHybZ7bUvNJPitk10oAOldt8Fi9N0u3kARyFWBWCv+dygLODlai++X72w6Mn3ylg/
	btxNUzTIGellVZFzQe26Wok/sQ2GfCyivRk4hjM5jjvhU1TJspsr7be7Lg3Lmz8caWOO4ftsMIf
	Lz0bD4JxCiUFAfT5iRqgt388qRo04B5njbsj6oURowhGiUsRyJaAyX9qWdhTt0C4hahMSXoAIhq
	PC12tXQ/7aSC576VNr0YQry7pJeOBPhY0YLaL0oV85ZKdkYk97Gk6eAcfBcEQVOXhfM3TFI3LB2
	9stUu3t783a1lUwgjmHQtV+C2AqWirBJ6bKWZnjzKargUodBCWHfXhkbAaciBDbMTBR7W7kcflQ
	J6BC0FBtpMqusa26hyM+wdsY3amPq2fyM2Jlg9JvTrMN+eQmm0F5IwUeDN+W0CQ0M++A==
X-Google-Smtp-Source: AGHT+IFipAgprEncksYPWxHvJftE0v7vy//a1Esb7V76NMt6GGRBpflRHmfK4ouR12GWa83QVdARPQ==
X-Received: by 2002:a17:90b:3849:b0:343:7711:127d with SMTP id 98e67ed59e1d1-34a4f89b438mr2613916a91.9.1765322778645;
        Tue, 09 Dec 2025 15:26:18 -0800 (PST)
Received: from localhost (p4783053-ipxg23301hodogaya.kanagawa.ocn.ne.jp. [153.209.99.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f6b8sm165814375ad.52.2025.12.09.15.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:26:17 -0800 (PST)
Date: Wed, 10 Dec 2025 08:26:03 +0900 (JST)
Message-Id: <20251210.082603.290476643413141778.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: boqun.feng@gmail.com, gary@garyguo.net, a.hindborg@kernel.org,
 bjorn3_gh@protonmail.com, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, lossin@kernel.org, will@kernel.org, peterz@infradead.org,
 mark.rutland@arm.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: Mainline x86_64/arm64 defconfig+Rust `rusttest` error
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72mEYacdZmHKvpbahJzO_X_qqYyiSiSTYaWEQZAfp6sbxg@mail.gmail.com>
References: <CANiq72mEYacdZmHKvpbahJzO_X_qqYyiSiSTYaWEQZAfp6sbxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 9 Dec 2025 11:56:08 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> Hi all,
> 
> I am seeing in mainline x86_64/arm64 defconfig+Rust the following
> `rusttest` error [1].

I think that simply marking the module! doctests as ignore would avoid
the issue. But it's possible to make the atomic helpers run on the
host side so we might want a better fix?

=
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] rust: macros: make module! doctests as ignore

ModuleParamAccess started using SetOnce, and SetOnce depends on the
helper functions so `make rusttest` doesn't work for module! macro.

Fix the followings:

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

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/rust-for-linux/CANiq72mEYacdZmHKvpbahJzO_X_qqYyiSiSTYaWEQZAfp6sbxg@mail.gmail.com/
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/macros/lib.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index b38002151871..8b2af1dc79d0 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -59,7 +59,7 @@
 ///
 /// # Examples
 ///
-/// ```
+/// ```ignore
 /// use kernel::prelude::*;
 ///
 /// module!{
@@ -99,7 +99,7 @@
 /// build an initramfs uses this information to put the firmware files into
 /// the initramfs image.
 ///
-/// ```
+/// ```ignore
 /// use kernel::prelude::*;
 ///
 /// module!{

base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
-- 
2.43.0

