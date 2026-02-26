Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7F7322B96
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 23:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772149659; cv=none; b=sKq7a3Yh3oS6vN98gdIe2SLR+02X9zUWA+OXVLV2TjJz0Dsm78GSrG5b3L1542WECf7uQmGjnagUihTzljYrGrNMTZcr300qFLCH20bCCW5UTnCQYqe1GcM+ooLG2OsdpnrkaRtUB7XngZYZS76H5A+vUzVkR/jJqRymR4GVP3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772149659; c=relaxed/simple;
	bh=2JZ14oqyop+OfbJKe2VgqDVfV2Lq3g8h2Qdja2yt5Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SfIQRLbO3qLsoBC26McD9p0fYL+Iax+yy/NrxdRGMCyMSwVZu47zoRdJuCO6JmtuADn08TInkbBS0xv1DM1tfr0UOHv2K9FYXf9qzoaOdJhACb3HEZ+KtWf6X/GxDodKS2YKCik5K/SRjDKzN4SG2jjfRofcOJWDQ5lYnSEdSok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENCSd3cU; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENCSd3cU"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1275750cfc7so2116660c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 15:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772149658; x=1772754458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/k9W3puS9VlvVSvbP2i2HOOhKsYSW79uIt5oIhUdqFY=;
        b=ENCSd3cUnMGC1ERlOrIePmspmhoZmbfuT66oU4+H3HFMbQ7Zrv5Mi711Y3YzsB2sNn
         DYJBxyL18UrykZbkVR10gESg6yOhLa0m2itDCSv7rDMyEbQcm5exnfXI6gugOZkFRL+W
         O4aoALh4Fl303a7aqKCGjyCjtMcfuqvVROO5PGmgXu4UYnb77myZ1Qf5KLVwruvD64Z8
         AClqDPXoeIvsA2GAyWstZKGKYyr6dJFaevuWhW2omHdzPgcJ7NJ2JLUxWa5Ot0uvzHI5
         ZlUYbeQh6UpwckSfLe0sAKyAHEVsQ36S4BFXERPnsuDXcXJRerPszYJsV/fWWOjU4TK/
         rupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772149658; x=1772754458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/k9W3puS9VlvVSvbP2i2HOOhKsYSW79uIt5oIhUdqFY=;
        b=KPS4ynF4oSrYuHTRu8adVBAggIXw9FPuQbkyt8d2G1YFtxc13sSkwtXQphvU3OGlsd
         mimCTFoiJ3kpNYHCBOQWwjVJAFqYTdw3c4tZJBGQWyvtifFKRHXU1kvxAsXAPU5OusFw
         5/qHhTT3f/4rd+BZVNEtiZ6ZDrakZ1BAxOWkxC6rOBXYNjv7de5L4Viybh5Hv/NHitr/
         21d8Sl1/t4HlrLE1haANCeSPmV66JWQ1L3Ijixz6O2tcPTn8MOCOwSLqVw+6UXIHleHL
         osY6uTFhdblUHafv+cNRopsl4F+XG9Pl7wrSi2Zmfp7tiOx3qMWBaWZe428pkdYEPxSc
         WLEw==
X-Forwarded-Encrypted: i=1; AJvYcCWHbwXMABbJGCpwdEo9C1G3odBVSB4NZ1YHSfMkPwerEIXwBxpOt74s+gDUnWqRIZbGlJF5yKdObCZ6673CWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIU3CFJ6MORH+xHxc6cAKpA0/eNg/Sunqx+T39bFHmoilICV7/
	lcT5MZ/ux6bni8SI9+N2QRgblQUqfl7Tlljs4rANvlBUUwbgAUzKS0eR
X-Gm-Gg: ATEYQzxQb5NE8TT5F4rOH3r1VfFXOyMXjErgflLrE1mKszXQyEFytrvgQku4PNxekBK
	5Ozb+3DkkOSmeKwsNtd9pWV7eJBSIEk2QX8cDgV9mHAuF2kB7cdzNakXzq7YWEWvKrGNYiQHe20
	WR1/1QWo3Oat7feaGmVlbVoe33/GIj/MdXureMLw0aYcKRBh+gB1Rmrd3YQx4uoPoYUZBJirvha
	CjjcmnG8pjuyD5mkiE7flop1ve2cehIW5zYAqHJXOPVStEqS4QVG40+20YpGv4Gj4UiXpIpWqey
	bs0qVFWCGv5jrpTJDdGRBcMLfMZ1ujceT4cvjzgb5av8wae4vm1auGZswE8Thm7UQ+t1s0e+8gO
	NmBxSkoQPMEsPRBQb6OjoPOrIPERj44IqGvJGYzGAclkzcr2O9DbjhpcjTKC0L3KQDgyD6W/zvG
	B+uAc1BrA+EsN7vmViggznjGUzwA9bV7XwXCVMtzIfeLsSQqpJwhC9Cl5/k2mWDKSpPTPcOdsSE
	Q==
X-Received: by 2002:a05:7022:4583:b0:127:5cda:fb7d with SMTP id a92af1059eb24-1278fc2c5fbmr491113c88.6.1772149657533;
        Thu, 26 Feb 2026 15:47:37 -0800 (PST)
Received: from localhost (99-122-55-39.lightspeed.sntcca.sbcglobal.net. [99.122.55.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899df391sm3990909c88.5.2026.02.26.15.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 15:47:37 -0800 (PST)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	David Gow <davidgow@google.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] rust: module parameter extensions
Date: Thu, 26 Feb 2026 15:47:26 -0800
Message-ID: <20260226234736.428341-1-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series extends the Rust module! macro with three capabilities that
are available to C modules but currently missing from the Rust
abstractions: string parameters, early boot command-line parameters, and
configurable initcall levels.

The existing Rust module parameter infrastructure supports integer types
(i8..u64, isize, usize) but has no way to accept string values.
Additionally, built-in Rust modules cannot register parameters for early
boot command-line parsing (__setup / early_param), and all Rust modules
are hard-coded to initcall level 6 (device_initcall) with no way to
control initialization ordering.

String parameter support (patches 1-3):

  Introduce StringParam, a Copy wrapper around *const c_char whose
  memory is managed by the kernel parameter subsystem.  Wire it into
  the module! macro as the `string` parameter type with a dedicated
  kernel_param_ops (PARAM_OPS_STRING) that stores the pointer directly
  into a SetOnce<StringParam> container.  The rust_minimal sample is
  updated to demonstrate usage.

  An earlier implementation of string parameter support was proposed in:

      https://github.com/Rust-for-Linux/linux/pull/110/

  This series takes a different approach for StringParam by storing the
  raw C string pointer directly rather than copying the string data,
  since the kernel guarantees the backing memory remains valid for the
  module's lifetime.  This avoids allocation in the parameter setter and
  keeps StringParam as a simple Copy type consistent with the existing
  integer parameter design.

Early boot parameter support (patches 4-7):

  Add ObsKernelParam (mirroring the C obs_kernel_param), extend the
  ModuleParam trait with from_setup_arg() for constructing parameter
  values from raw __setup callback arguments, and integrate an optional
  `early_param` field into the module! macro.  When specified, the macro
  emits a __setup entry in the .init.setup ELF section, gated behind
  #[cfg(not(MODULE))] since this mechanism is only meaningful for
  built-in modules.

Configurable initcall levels (patch 8):

  Add an optional `initcall` field to the module! macro that accepts
  any of the eight standard levels (pure through late).  The default
  remains level 6 (device) so existing modules are unaffected.

Matthew Wood (8):
  rust: module_param: add StringParam type for C string parameters
  rust: module_param: wire StringParam into the module! macro
  samples: rust_minimal: demonstrate string module parameter
  rust: module_param: add ObsKernelParam type
  rust: module_param: add from_setup_arg() to ModuleParam trait
  rust: macros: add early_param support to module! macro
  samples: rust_minimal: demonstrate early_param usage
  rust: macros: add configurable initcall levels to module! macro

 rust/kernel/module_param.rs  | 160 +++++++++++++++++++++++++++++++
 rust/macros/lib.rs           |   9 ++
 rust/macros/module.rs        | 179 +++++++++++++++++++++++++++++++++--
 samples/rust/rust_minimal.rs |  33 ++++++-
 4 files changed, 368 insertions(+), 13 deletions(-)

-- 
2.52.0

