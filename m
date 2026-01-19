Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D968923EAB7
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 03:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768793428; cv=none; b=Z0Od0jWYZt+vREjbdxM0TetSOIHiCY+ma8rySp/EKaZ/H4a7zlQ3SiapSV+kEB7d4Kc87ASQAtPzHir8hw6Q4imYa0VdjnbUufc+6tUcXMlDgTHNLoC+KXXK5lgFXIWW/v6bRj4OlCjICoNvz2kvtRayQyNyysW8eEsMRZAxCqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768793428; c=relaxed/simple;
	bh=kDzK9u8f/RdrHehIffSmtBDzx1BGgmelPMV/cKGILgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DU/qT1C96P6SPuxeDcF9ZbG/EjF31nyJzOEi8Ld4LhqOdsmtB4uKCxsMG5/KhX8ykF2Sa60PSrpM5Lu4THORnA6Phfjhj25K/zAcC7jfhZWHu8cQ1xsYzu/tA2kNunsta0R2vJsq2L502RrsoMZFMSRZEn0L8D5ofc7WC4PnLio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34c84dc332cso1983650a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 19:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768793426; x=1769398226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=22chvqnm+kv69juhEqL3g24N/VHpcegc8NXGooAd8sU=;
        b=SKil3ts9sQn+ai+XhHMDkxYyT7odirncSgf2FjrmJIkELhfOYjHhdXZJoyufIUJJ5m
         J5BM5aPHTPwWIco+351Z0GpShIRZTfqB7f3XZvf6Ys5lTvO/GtKqKrRXr/9ULel/QXFn
         wnc9IWU+7PWFF8wvoVk9dm5z1UqUkszXy+qxcAVixe5fHmzBBPrP2S/tI2T16Lgb7cui
         zIRx7w2d6jzxWP8iQdGD5B3TG+xaS2SYmoMpZQ+iRtFoSAbXKa7jq+ADXPBfmytYbKgM
         R8TN3qL+HGY/jh346wk6E0inYFxlsx+Z+AOd+eBAp7dlx/cmZ27xg4exrkQ1F1DDHNcv
         +Dtw==
X-Forwarded-Encrypted: i=1; AJvYcCWnVbU1ZvJlmqGFciSEG8PXHF4urQNKgJlVWk++veFsmxmE2+aP3LBcMYZxnRz3hanovN+F23CO17GRiUxCJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfruleWQ6SvG1diY+xoOVq0L27nnUdH4+x8eEmAmKFp+H9sUqA
	msI+YnjJ58LCiNLFIrKpZ+MNrbXkYKdUSP/VXyWls/CLpO4dKpWz20oS
X-Gm-Gg: AY/fxX5+CbRVlTH4xfqITI+kATHtoG59Ayb5ufpW8dMid1fnsehV4SOt9RVoZZdR9GY
	/yvNQI63PK7W3GIm7x7RGHgrc3cOk3Qcwgjsu7JWOQIfOaA1h3OojcruUL+mDN32kPVESGg+5Pi
	a6U29tKouN8tWj0SlJGGY8fpfx+cSE21U4c6uAq4ZLVhBAFn0vpD6AnbL3uY18T/pNSwfk0O3OB
	IYJK06AohpiMrxHhzHk/l16v+wWCoG/V88+UeDwknmmEWdZP2/4A7tI9K5Bf9nLOxV0p4vmCQrW
	kSrukP0Yyux+1baCFjHMCR5sivdRcLOq+RfmdTs/sIpdolVNpedyS/16PWunF0ie56tW710/S2p
	aVoqZvieLItNA6ZszZ4YnNyNeL3wIDvqfI1ZbR1DFZeTi7v/293QomTdpF+gFVauq/JvIXIt/9U
	tIvgNSuwDZuQHUAOFe2TuMp8kOKhaCCy5rkmkKbTgdweVG
X-Received: by 2002:a17:90b:1e09:b0:34a:a1c1:90a0 with SMTP id 98e67ed59e1d1-35272fbe02amr8004153a91.28.1768793426116;
        Sun, 18 Jan 2026 19:30:26 -0800 (PST)
Received: from localhost.localdomain (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527313c2a9sm7656972a91.17.2026.01.18.19.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:30:25 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v9 2/4] rust: fmt: add HashedPtr for safe pointer formatting
Date: Mon, 19 Jan 2026 11:30:04 +0800
Message-ID: <20260119033006.1453006-3-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033006.1453006-1-sunke@kylinos.cn>
References: <20260119033006.1453006-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add HashedPtr type that formats pointers using kernel's pointer hashing
mechanism. This type can be used to safely format pointers without
exposing kernel memory layout information.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/fmt.rs | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 059c26dfcfa21..b3501a11c7a3c 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -6,6 +6,8 @@
 
 pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
 
+use crate::bindings;
+
 /// Internal adapter used to route allow implementations of formatting traits for foreign types.
 ///
 /// It is inserted automatically by the [`fmt!`] macro and is not meant to be used directly.
@@ -135,3 +137,58 @@ fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
         )*
     };
 }
+
+/// A pointer that will be hashed when printed (corresponds to `%p`).
+///
+/// This is the default behavior for kernel pointers - they are hashed to
+/// prevent leaking information about the kernel memory layout.
+///
+/// # Example
+///
+/// ```
+/// use kernel::{
+///     fmt::HashedPtr,
+///     prelude::fmt,
+///     str::CString, //
+/// };
+///
+/// let ptr = HashedPtr(0x12345678 as *const u8);
+/// pr_info!("Hashed pointer: {:016p}\n", ptr);
+///
+/// // Width option test
+/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
+/// let width_30 = cstr.to_str()?;
+/// assert_eq!(width_30.len(), 30);
+/// # Ok::<(), kernel::error::Error>(())
+/// ```
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct HashedPtr<T>(pub *const T);
+
+impl<T> Pointer for HashedPtr<T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let ptr = self.0;
+        // Buffer size chosen to accommodate pointer formatting
+        // 32 bytes is sufficient for all pointer formats including hash values
+        let mut buf = [0u8; 32];
+
+        // SAFETY: We're calling the kernel's scnprintf function which is
+        // safe to use. The buffer is large enough to hold the formatted
+        // pointer string. Using "%p" format specifier applies kernel's
+        // pointer hashing automatically.
+        let len =
+            unsafe { bindings::scnprintf(buf.as_mut_ptr(), buf.len(), c"0x%p".as_ptr(), ptr) };
+
+        // scnprintf returns the number of characters written (excluding
+        // null terminator), and guarantees it never exceeds size-1
+        let formatted = core::str::from_utf8(&buf[..len as usize]).map_err(|_| Error)?;
+
+        // Use pad() to respect formatting options (width, alignment,
+        // padding, etc.)
+        f.pad(formatted)
+    }
+}
+
+impl_pointer_forward!(
+    {<T>} HashedPtr<T>,
+);
-- 
2.43.0

