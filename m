Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FBA23ED4D
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 11:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767442; cv=none; b=Twbgat+jX5Sf4dfsXQel4fHp740/b2IPIlYti7xv3XEHKB4tfLROHzgDn8MVEWoHbnuxe1Vyr77uUlrDHKNdtBnbj3v+jKHYCTVf4GGDlwjTwMGl6cqfBnwb/rN5dhEHam8GYo+2xTiHVhgAnMLu+mfed4ur6aFzvTHCvU2PyhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767442; c=relaxed/simple;
	bh=XP0PNO8G/853ZISR4NFJL60BlTm8G/dA7ahDgJPTbK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SescKbGK7b0N4gQNeegZKJPuhn1T6NNfn8xgHV5y2KPVQKIl+tuYGBFw3Aiy7M8K8Rnct0/nOcioJS2NLWi9XksiheYA81ab6HqbMH0tkPBA18wtuXW6ZLz8JL0E6khIBJJJbaXHhI4l9+aacBJ1Y1X6gdmcXJ2HhRKLrkkhYjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pvJ/aNJN; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pvJ/aNJN"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ef89dbd8eeso5226039a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 03:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736767440; x=1737372240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=217qCdop/bVuj9XoV8EFEQ4K3BvCuSwvnN0rQfYprBA=;
        b=pvJ/aNJNM6hWazWxuQNk18EMYgd+DQl6rWe8maE2K6y694RoJQJS3Fw2E48J+Vh/8r
         7FfGwN/ihgaV1QDaWWfp+kMOUB29dLZX0DnhwbE79I/jZUIWGyErGh5FXeoGApDnPdZK
         O8cWXyg838GYNaC2dHu0U0Z5FfOBlS/tWOHnmZJ2ldP+p+/+++J+rreaFfg6ttqEG/OD
         WTvlVw9BlK0UbpDXoY8vj7qWhMZwwzHLiU2c566Q+NBo2oVBwYH8+6r7E7HpjOMl6ezJ
         PfcL+tbmtlleGL3K//Qd/jhBIgzUfAKjLGz/3ILSD15hihymIWt57dWFCPmww6Br0S5U
         Vo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767440; x=1737372240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=217qCdop/bVuj9XoV8EFEQ4K3BvCuSwvnN0rQfYprBA=;
        b=QcrCiD2CGf+NNSj3hUZ2lZUwllfRSH+9rpGqY6Qzca2kYXyam6imiDW6tyK6t936uh
         Dm83gSbxZpgIqCSP4j7Np5NoChU5/qYQHN5BnTkzPcN07N0vcXlCb4wupsRweQr3/DFI
         pmup518K1nXRZXKut6r9gB/gTgnr+Lx54iQVKB7uucTFgGqrYwQPmkyv0mgRYNTtGXct
         EPeLB6qzc/sfp4CL53kHj2exnVe/rdRcTUagoXLrNvsfjZOMkoyLvvy9QiBvu5FL1Rbs
         nVUeHG0gcVj36U7uyTVtdM8zepsSLhvTnZMd1pm/jnjO/jVxzp72KlcmaMRnYdGhkfCf
         DLIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqNwXh7w+iVd0+UJsjqr8skj0iEZ9vPhSNWJMT7r4Y6Xw/LCsZL5UXFmorm/colfZNSPhYVyUPzJAz11wxYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYlZSV/ba5helP129Ff3ZrK4QkY6hsnEwKqNGx36yEbqv661VZ
	acVNP77VmAICLaBa4Kq14U3PYWV8mPz34mEZw7+kmPQVy83crJZjUP5D+vinBVg=
X-Gm-Gg: ASbGncsBPU6mP96YjI2WIgubHBZ7QHswdnd7hGrnSKnE/6dI9GtgWCi2WlByUkkFnNM
	OpgE5Lb7eOFVanfMdFYn0Pe8GWDc463ifZL8euL2AZBEWO+4fVgF+OqNELCKNESoYR9Vmqeb8EL
	3hDG61oujMM4GRYIDhtgOvtDrDAypZkH8o19QsIOu1+0vEHDGN9jbn9fuTf1hvHXgsKZhn9jB0e
	XntxvPODqEUjbKGbn11nTew8Rgs6fhPrYySKJMnRf9a1+BL+xAcZU6vhX0=
X-Google-Smtp-Source: AGHT+IHWlPorx8XJmvX79gE5sNkxZSUXnp+Pd6+S6Fek2hXtY7a65fTM8Lo2nmZmWQWd7i9agrQzmg==
X-Received: by 2002:a17:90b:51c2:b0:2ee:ab29:1a63 with SMTP id 98e67ed59e1d1-2f548ea6331mr27577987a91.3.1736767439700;
        Mon, 13 Jan 2025 03:23:59 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f53e1da400sm2352192a91.0.2025.01.13.03.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 03:23:59 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH V7 07/16] rust: Add bare minimal bindings for clk framework
Date: Mon, 13 Jan 2025 16:53:02 +0530
Message-Id: <8dd38c6dce256340a5a623503023736f8e9278d8.1736766672.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1736766672.git.viresh.kumar@linaro.org>
References: <cover.1736766672.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds very basic bindings for the clk framework, implements only
clk_get() and clk_put(). These are the bare minimum bindings required
for many users and are simple enough to add in the first attempt.

These will be used by Rust based cpufreq / OPP core to begin with.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/clk.rs              | 48 +++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 3 files changed, 50 insertions(+)
 create mode 100644 rust/kernel/clk.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 59b4bc49d039..4eadcf645df0 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
+#include <linux/clk.h>
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
 #include <linux/cred.h>
diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
new file mode 100644
index 000000000000..123cdb43b115
--- /dev/null
+++ b/rust/kernel/clk.rs
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Clock abstractions.
+//!
+//! C header: [`include/linux/clk.h`](srctree/include/linux/clk.h)
+
+use crate::{
+    bindings,
+    device::Device,
+    error::{from_err_ptr, Result},
+    prelude::*,
+};
+
+use core::ptr;
+
+/// A simple implementation of `struct clk` from the C code.
+#[repr(transparent)]
+pub struct Clk(*mut bindings::clk);
+
+impl Clk {
+    /// Creates `Clk` instance for a device and a connection id.
+    pub fn new(dev: &Device, name: Option<&CStr>) -> Result<Self> {
+        let con_id = if let Some(name) = name {
+            name.as_ptr() as *const _
+        } else {
+            ptr::null()
+        };
+
+        // SAFETY: It is safe to call `clk_get()`, on a device pointer earlier received from the C
+        // code.
+        Ok(Self(from_err_ptr(unsafe {
+            bindings::clk_get(dev.as_raw(), con_id)
+        })?))
+    }
+
+    /// Obtain the raw `struct clk *`.
+    pub fn as_raw(&self) -> *mut bindings::clk {
+        self.0
+    }
+}
+
+impl Drop for Clk {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
+        // relinquish it now.
+        unsafe { bindings::clk_put(self.0) };
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 2f72e1d8a6b7..5d43dc5ec9eb 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -39,6 +39,7 @@
 pub mod block;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod clk;
 pub mod cpu;
 pub mod cpumask;
 pub mod cred;
-- 
2.31.1.272.g89b43f80a514

