Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B4330C347
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 23:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765582952; cv=none; b=VtBi9IXb0Qm9srZcvalHiUjFZyyTwswJOD5NOxRbUXQaVWljq0Jlx4R+fr1o/t5L3AYkT6Tv58COs/r2t+AlLOmMgXsMoG/AoRMNRtV6nw5IcKZXPBvtd8MbIUIVjMUADnrp7v0Vzt4LvwY//fS93kk0pp0ewEk9Lnf1zQkbCYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765582952; c=relaxed/simple;
	bh=H29+ge4WZGDHYhE6+/9otT3/Hc4ebLmSVk/pMz6v4/w=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mUNMzGT9v+Uvw9EqRHdDupwP4rKn2j69zqle+y5s5yyBM+nvJ3aBB7ya1ykQ2oqQvRPm9TomkVM4d159Lc7iFneub+l/lzvU9GPZX1Wpyb3+22SS55Jy99G/dzbwy/yx1Gl3aQz3K9L+WE8t7osrzkxCb+BmbGfOGzsP7Dl98nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fE3fUTgl; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fE3fUTgl"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b630753cc38so2531162a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 15:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765582951; x=1766187751; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fbcoOTj9s4DvcnwaRkRxnQO/A+nIHOItK5u7YR8fB5I=;
        b=fE3fUTglS6t/Wvd98ZB5eIp5+aoXGy0nmfAIzdfmwIZwzG94fOu1S0MYipDGQyUJ4w
         ASWGWXf/8eWinw5XCI1TuyxZ20SJR04z8avPn5+FV35mWNnh81qz/p4pxVOlqQd33m/t
         nfObmShY7B7X7wbKVta3vf+ARu1oASVxquTMfE4eL1ogne4fYk4wLZnupop/8WMItDrx
         tzF6kANYXmaB4H337Ok3gqDYPNsvrWfMLQQAnirUahwfnXnPkyK/j1bWBLoARWautLVh
         4yhm6+DO5npaH6wY9RwkMm7DyqvLkI+Zsq9fSyG+XYYFIYMiyETMh2Fu8SkEY2fDrEoj
         VuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765582951; x=1766187751;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fbcoOTj9s4DvcnwaRkRxnQO/A+nIHOItK5u7YR8fB5I=;
        b=ANjC5WpttjKRHPI2lNk+45JJw7CN6fCZX0SzXFaf8rxcCRmCPsMKOk/Z6Mzxl9fjQT
         Z2wh1mKvZAJwPr+VtETh3mYs94UG9DMCFUGFxs6WU3WNFb7HzuMXYWv+5aDRuPVEmJIf
         t/1yv5RM9/odLnerDOSJbq5SZQU4nyTuJCQfvIMm5I8l9iabPTj+yL7Mj5PloS1YArYW
         n9URtzy9joNOaC8fVX41Ncp9lHaeeog+1NNOKMfO4GECKnDCUjgn7TTtkQeWuYWpbXtQ
         ysBad78M4DyroaBe5RSNWuUPF27CUFWQuEAn62KvQFG1rjm82BQdfZ4NzT8jSFxNo+KL
         joCg==
X-Gm-Message-State: AOJu0YzMdt4JPK24Sf7lCx0Gjt1lGMcbvRlbl2qdppp59sKIHkHlOsDI
	aJqe/7EEPe2tELontz7RtZJBlBhhdybgrIT+x4pdctiFdyDLBZ/3IrCKojfVTDDhvwGHVFeEp8q
	a5DjbruNccQ==
X-Google-Smtp-Source: AGHT+IHyZLRxYWPPusPQXMfMxRQS6Cf4+BBxLb5OuIDhGXY4M3H6IWIEbQmD5yTSaoJQJM/gzEPj1NFTWi4s
X-Received: from dlbbk25.prod.google.com ([2002:a05:7022:4299:b0:11a:4752:431f])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a8b:b0:11e:3e9:3ea3
 with SMTP id a92af1059eb24-11f34c4f80amr2860031c88.50.1765582950481; Fri, 12
 Dec 2025 15:42:30 -0800 (PST)
Date: Fri, 12 Dec 2025 23:42:18 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFqoPGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0Mj3ZKixLzi3NKSVF2LxCQzA3MzcwODRAsloPqCotS0zAqwWdGxtbU AaorRrVsAAAA=
X-Change-Id: 20251212-transmute-8ab6076700a8
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765582949; l=2595;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=H29+ge4WZGDHYhE6+/9otT3/Hc4ebLmSVk/pMz6v4/w=; b=sKV6LAx2hUGgAD8YSTBCi+5AZ0gINZOyeJ8kBwK5lzRSIoRe2AoQMkjoKMexB4DC11yp01wHg
 N/7JAg1ydqXCwCHcXnqhbO1vHO+2DL3BSoKrjUclq0ZBfzBppUXoySp
X-Mailer: b4 0.14.2
Message-ID: <20251212-transmute-v1-0-9b28e06c6508@google.com>
Subject: [PATCH 0/3] Support more safe `AsBytes`/`FromBytes` usage
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Currently:
* Slices of `AsBytes`/`FromBytes` types cannot be synthesized from
  bytes slices (without unsafe).
* Users must use `unsafe impl` to assert that structs are `AsBytes` or
  `FromBytes` and write appropriate justifications.
* Bindgen-generated types cannot implement `AsBytes` or `FromBytes`,
  meaning that casting them to or from bytes involves assumptions in the
  `unsafe impl` that could easily go out of sync if the underlying
  header is edited or an assumption is invalid on a platform the author
  did not consider.

This series seeks to address all there of these by:
1. Adding slice cast functions to `FromBytes`
2. Adding a derive for `AsBytes` and `FromBytes`, for now restricted to
   the simple case of structs.
3. Refactoring the crate structure to allow the derives added in 2 to be
   used on bindgen definitions.

1 or 2 can be taken independently, 3 requires 2.

1 and 2 I think are in pretty goood shape. 3 I'm throwing out their to
sketch out what a potential solution to this problem could look like.

Options for #3 that I can see:
* Common types/traits crate (what's done in this patch), maybe bikeshed
  name to something other than `traits`.
* Move `bindings` from being its own crate to being source-included into
  the `kernel` crate.
* Import `zerocopy` instead, and move off providing our own
  `AsBytes`/`FromBytes`. This would lose our special-casing of pointers
  as not supporting byte-casting, and require importing yet more
  third-party code, but would solve the problems I enumerated.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Matthew Maurer (3):
      rust: transmute: Support transmuting slices of AsBytes/FromBytes types
      rust: Add support for deriving `AsBytes` and `FromBytes`
      rust: Support deriving `AsBytes`/`FromBytes` on bindgen types

 rust/Makefile                        | 19 +++++++--
 rust/bindgen_parameters              |  8 ++++
 rust/bindings/lib.rs                 |  1 +
 rust/kernel/lib.rs                   |  3 +-
 rust/macros/lib.rs                   | 80 ++++++++++++++++++++++++++++++++++++
 rust/macros/transmute.rs             | 60 +++++++++++++++++++++++++++
 rust/traits/lib.rs                   |  6 +++
 rust/{kernel => traits}/transmute.rs | 72 ++++++++++++++++++++++++++++++++
 rust/uapi/lib.rs                     |  1 +
 9 files changed, 245 insertions(+), 5 deletions(-)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251212-transmute-8ab6076700a8

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

