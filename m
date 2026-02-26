Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD79E3358D1
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 23:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772149664; cv=none; b=ODa4E1cIDVjUz9i038NIQ2Gwd/e+MnMSbIAv7cbwMAqcUv2ESJYk8JSz2UYHnjYPA6PYme/sFFbPXCTY1hbTyZqqCOmmhLgKcRty2nt7uqbYEoBU89lkbX7m6hHpxx1TK+UFilmsz6nZtBRI8s0VvY9Y5LXTButmfX3MvT79SJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772149664; c=relaxed/simple;
	bh=diXsuT8eJT5nS1aZMe0HRgaFMpWk5Il6lizUmS70zew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zf+IdU185myjtnDgFcrTZF1oV8SJC5jQVaJnl0LQrmgNxH3NU1D5fjsKIviVWX3plkl48mwcobkhwvxvqGcJezcbu7714kYxP23mdcOdQC/xvloBbl5mbUZ5gkuFxZzmvCpRqvYr4lCBT/CeBABje5aDJsaIY2jwEHvlPPN1c4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbVjp91i; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbVjp91i"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bdbe434b47so3203725eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 15:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772149662; x=1772754462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5i5WdejKaPItbRozzcqSDHdFPHSAvpyQt6V3+kxZMw=;
        b=MbVjp91i58IBWrvZ0bLFpMYkO/UcDLmdXT9lKTCa6RotSYujw4CdXcboon5KWNvbqj
         vxpSvORZD42q0gbcK8La/s7Mjis8KKRSNQiPJnB84hAY0Gt4e7109nwryPmP/Ul5PMkZ
         r+H0YR8AM3G1JKA+CcJXUBa3+pbzIn212FiKjAXy5FrHccnQEmEMq8r7xF4bZRf5RFT6
         4BiXRcysP1p3gA8jveORAOpc17K66x8ESQqTzYji1FhNVlMF/jkPtI7f2WKbNjqMfJE4
         luB2qrmvBzSAWL7iMvaYKTAmH3cfEMfYtH7vFOH9xpMAzS3DeFiB3q6JcYvGXIypVxFh
         sv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772149662; x=1772754462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q5i5WdejKaPItbRozzcqSDHdFPHSAvpyQt6V3+kxZMw=;
        b=LguTBboXGaonphSn8lSz5ttFBtSFrbM1k5vtUM7DxqXWwGLn1JE2Q8cjeGJgNSNk9I
         WfwDyNhVbREoDRRNBR6IEjBhmXhyL95idP0hhjKKI+pLrAzSvKR4OX1yQh3JMI9Mx+nS
         IWC0DTi9rlAkMxKmxl8gU+Ytgz1zDESPQJ2Kv5xnGa4/QEh5Z6K8xUHuCPrGOmaXkX7w
         IxOZZGou3JvwTwvwUZD/fbujhsqv+nNwpHGGY1lQcWoQdyPkHJpF6TltRvt5qfg6SJGK
         X5JHUXB5yLefEd6DcWIW6s2BvNUaQwdDeaiULgDlZCoL+byr6nuAk7d764ijXSMuwuyG
         ZvzA==
X-Forwarded-Encrypted: i=1; AJvYcCU3GDyq+ZuZn1UPrdjkSjuia0idH7Lpy9PFgmj7jqn+E8cFD8rhxA+Di4aQgUYWCxWKSyD/aSZj4pKYxE5rPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0rTXtnozj89FkwyMsl0ReGj2zO1SVCTmLsfvvEsE3oCKNmEmO
	nIZuIthwXiIEmvJOx6f5SSycQ4qN8cgIOKTepAKpo+Zpchocv5KW/Dt7
X-Gm-Gg: ATEYQzwJaat7m00DeZCu0V20ynhhs5TAwQ+C+jK1YPkdcQz4VAbvqn56/I1YFTOyGX6
	cpIR5tqyL3qJHuba7pDDtRoJX9wNU/N2f0M+2Q14E9L/y1MAmJsmcrjDxDcY1cpfKxCOgrASgfI
	y+gxuK18Twop6okwjQIVHtwobSeHVfoIWSjyJGhWY5e/qHziN36ZBs5SCJVQjew6Ug52kNyok8J
	T8D4gNBmaRn/80l/2XqbTcqpFTD3Qd1eYLp+D5EDEx3XcYGj6PPe6mP9QftgTNuVxXf9kAkVdN9
	N/Rt3tCzw4SknzisYnsZJxTnGN8GKblKZtjiK8hBSS1L4dVJlXgmBkKSB39U82ewSV0FloMponB
	Wm/MOCtIV1flLt6/cuOcx+leScNo29ZDMyQ59vvnhDAUAJqXHLcgnjIRhCosaCOMx86jBriOL8D
	wO/eW3dQP0WF7ZFwnOjpre/TAqg16XsdkzGfgo5juIR74ehPBMiQQn35jfDQWOzSnn7F0fMopAB
	w==
X-Received: by 2002:a05:693c:2c97:b0:2b8:64ad:ad4d with SMTP id 5a478bee46e88-2bde1d32ceemr413421eec.26.1772149661991;
        Thu, 26 Feb 2026 15:47:41 -0800 (PST)
Received: from localhost (99-122-55-39.lightspeed.sntcca.sbcglobal.net. [99.122.55.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f23c0csm2819777eec.22.2026.02.26.15.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 15:47:41 -0800 (PST)
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
Subject: [PATCH 4/8] rust: module_param: add ObsKernelParam type
Date: Thu, 26 Feb 2026 15:47:30 -0800
Message-ID: <20260226234736.428341-5-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226234736.428341-1-thepacketgeek@gmail.com>
References: <20260226234736.428341-1-thepacketgeek@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ObsKernelParam, a #[repr(C)] struct that mirrors the C
obs_kernel_param structure used by the __setup / early_param
infrastructure to register boot-time command-line handlers.

The struct contains:
  - str_: pointer to the null-terminated setup string
  - setup_func: the callback invoked when the kernel parses the
    matching command-line token
  - early: flag distinguishing early_param (1) from __setup (0)

Mark it Sync because instances are written at compile time and only
read during single-threaded early boot initialization.

This type will be used by the module! macro to emit __setup entries
in the .init.setup ELF section in subsequent patches.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 rust/kernel/module_param.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
index 67ff6f2ea9c2..54379a2bba51 100644
--- a/rust/kernel/module_param.rs
+++ b/rust/kernel/module_param.rs
@@ -26,6 +26,20 @@ pub const fn new(val: bindings::kernel_param) -> Self {
 // from Rust module.
 unsafe impl Sync for KernelParam {}
 
+/// Placed in the `.init.setup` ELF section by the `module!` macro.
+#[repr(C)]
+pub struct ObsKernelParam {
+    /// Pointer to the null-terminated setup string (e.g., `"netconsole=\0"`).
+    pub str_: *const c_char,
+    /// The setup callback function.
+    pub setup_func: Option<unsafe extern "C" fn(*mut c_char) -> c_int>,
+    /// Whether this is an early parameter (0 for `__setup`, 1 for `early_param`).
+    pub early: c_int,
+}
+
+// SAFETY: Only written at compile time, read during single-threaded boot init.
+unsafe impl Sync for ObsKernelParam {}
+
 /// Types that can be used for module parameters.
 // NOTE: This trait is `Copy` because drop could produce unsoundness during teardown.
 pub trait ModuleParam: Sized + Copy {
-- 
2.52.0

