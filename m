Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF1B23A56F
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 11:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767429; cv=none; b=itxYqysxcCntTbe/AYBUgjjKohmQ7nP3Xyx71aT0pbhwKd9yI7IpTpwh1Kk5ZbxF8ecyJCIK4/WXMjQ4rkSUAsI1r+qYW2FVAMF332l0+nYyFutcdbpWBVrF0vthYr7jMnXGXnpF51y+i26PN+rPFJ3KPuor4dp3EpBBD4XGw/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767429; c=relaxed/simple;
	bh=qFjzLah+7k0bGLsf807G16R7Nl932aHbCVEztV18Qug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kmnWg1DA4FptWzKzmwDILDsJEBwAD/87hmITG6lDrN/aMp7jJ3XE7hHKSwHUGlQpeh9WJh4kMS2vcUIGFFNfC97XIDOM6UMhsg9MqHyrfFjY2zGZH6Wn/09YRs5Tu4eRk0TIuTqGumtvDfxuu3BObJmk192t73UV7GDeq6wnTWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=whRU9Cfj; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="whRU9Cfj"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-218c8aca5f1so87912275ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 03:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736767427; x=1737372227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Erl89OKGaS5TERvIe2o6tMzhWrw69h3Z1JOwTaxOJAQ=;
        b=whRU9CfjTnHWSyizQVtwhP59wdi9PnmXTxU0lGYVZ2iGN3hA10ZihH+eLtxU9PG1XH
         IH5HRO/Fi4Txp9Kv061J8jDSGnWBFnTnupIRUaxNaOIrUe3hDVa3pHCoKSoWlpOD+BYK
         5taBS0fy3OpCTJ1BuhRd2GhQQDuX6X23Yaqa3XetPkLqrFIhCq3VVb0KCh6MrRJN65wx
         Q9J+IQY4lMrR8fD+lF/i2k7G8oeoiNhe3DxFfDQQwmWZoIgKGcdjEzrudnUfKB6qq2pN
         NbPg32wBec267vXW7RKS2id8FCkzgr9rSML4d55Fzs3T+dGCieQ5wN+OsuCtisjzkxrY
         1/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767427; x=1737372227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Erl89OKGaS5TERvIe2o6tMzhWrw69h3Z1JOwTaxOJAQ=;
        b=bbeuStQkbZcyF8W+X9SXY/gcZb0RvT2fmxOuv6cmYibgwEa6qxHXaNwMAcoxrPliVV
         IHbXeOC3xEtD0WQQPSusRzQry0q2sGr7XBjBZYWyPVvFyS9mGhXgaikWdGGhD4374oWb
         YbvHkZ5Fp0MFdvdexFeIwGAkBtht2E3/iXPK8cRzBnvcjBvhH5vV1NWBIzAlxVZiBAJo
         8ghFvJbhITJKgFPlqRHyYk2ELJ333M8GHEcJ+DwedGpQrQ3TFegxps7RX8dbwy+0vKUV
         pv1W90vKOjppjVz+5Dts76wOCSRmXkEgZMLyB5OGracyCVSp0kBBrpNlFycJVUQMEHwc
         Pf4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxl6+HTBeQ2mb/14oyiKyN2VrFUIQc7rjIvrgGNefncasrvrBHM5ABAuxCi69Kna7BAftnLttKbqCsn3odxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8yH3G1YDoI6YFMlPJLBiMAMqy2OasRTgmzbscJFqER+q84sO8
	7aCwZ+2fHEdT5FAoa5zrrVf4itb6zyWvUbqQvSeIkSBgShBsG9NU9XvDSCESFFw=
X-Gm-Gg: ASbGncsNbH3RGwmobBqdk5h0ih9KfO3c0dqPuQOX+YUAZhEoR1fezM6vvoQ2MfJIcSt
	CQM4E4JK6Rq/1Wn3jNhCmRYxIMx042q5iHLM6Z6KLzd8rP+bT5tNNmksa3sSen8H45dlPpiaO2W
	cDCCS7Dr6K5W06vPNXYkW5VGsDYmvgQaeLYwiGtq9XuAl/v3Jk9HORmr5mg4OdanPTnf0YY1heI
	ldTQIvA4OmUOvAjQReVcn308zrxHIfn4frv4W7PHkVXQPWaBHljswn7lMk=
X-Google-Smtp-Source: AGHT+IFwnNOadRELhgUS4RHnfHmljCOFqvDn5NHiGTae6Lam/bomtLxFMSA+qHltYXwddKyNK29zYg==
X-Received: by 2002:a17:902:d2d0:b0:216:45b9:439b with SMTP id d9443c01a7336-21a8400a357mr316419915ad.50.1736767427451;
        Mon, 13 Jan 2025 03:23:47 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10dddfsm52432345ad.23.2025.01.13.03.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 03:23:47 -0800 (PST)
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
	Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V7 04/16] rust: device: Add property_present()
Date: Mon, 13 Jan 2025 16:52:59 +0530
Message-Id: <f43fe3f7b3151a89c261ad728b0f3bb2fc24caef.1736766672.git.viresh.kumar@linaro.org>
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

This implements Device::property_present(), which calls C APIs
device_property_present() helper.

The new helper will be used by Rust based cpufreq drivers.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/bindings/bindings_helper.h | 1 +
 rust/kernel/device.rs           | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index d63e7f6d10ea..fda1e0d8f376 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -27,6 +27,7 @@
 #include <linux/pid_namespace.h>
 #include <linux/platform_device.h>
 #include <linux/poll.h>
+#include <linux/property.h>
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/security.h>
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index d5e6a19ff6b7..e8c4cda5aacc 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -6,6 +6,7 @@
 
 use crate::{
     bindings,
+    str::CString,
     types::{ARef, Opaque},
 };
 use core::{fmt, ptr};
@@ -180,6 +181,12 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
             )
         };
     }
+
+    /// Checks if property is present or not.
+    pub fn property_present(&self, name: &CString) -> bool {
+        // SAFETY: By the invariant of `CString`, `name` is null-terminated.
+        unsafe { bindings::device_property_present(self.as_raw().cast_const(), name.as_ptr() as *const _) }
+    }
 }
 
 // SAFETY: Instances of `Device` are always reference-counted.
-- 
2.31.1.272.g89b43f80a514

