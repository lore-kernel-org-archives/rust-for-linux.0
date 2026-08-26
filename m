Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3164442B15
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761745; cv=none; b=RJ78O32EGkB2iL4Cbafz5XWTU1pf6PDCj2KxPS2Yurw0hSJKrGN2jytHwsLvlSys58e1RJEmEx+zl3AI80vcv8k0F/qH3Ik/5O+Fv6YuTdXTOEhDKqMXPnDU+eSVMljyXPAETvsUct8Uvds0XmV0/c8alLGY9JAuWjo3x2c8pP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761745; c=relaxed/simple;
	bh=7nEFdhJnuwwLBAV3UiM1W1xo3GofuDusUz0fRYnHP94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8nPyIsU5jXs1oaYZdSWOnzcGP7V3IoqHcrBrMmc/8aEHTm5dxE8d4ogA1bLv78e2kpXkV/BEBWxvv4RIqKng7l/x3I/AGut/egJIUZNZrqLo4FjaQfkvm7Hjs6i6uudr+wkHPVfc+BSnsjvrX10+U2kNx49hS8cAGMHB4ugSp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=LT7HHk04; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="LT7HHk04"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4957eefd361so7060055e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761742; x=1788366542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7b9iSxFAhd+25NIrkOPdMG6vXzNwXPeGADBa8TYMNDc=;
        b=LT7HHk04sQIN5OEvZaJLhosa7e4iFey4ai2YOa52LBDlUOivvyftqqPuBx6pzZX63a
         BgNJ9NGZ5Yy7CR9OcFRoP5AMnt1PZqySX+MuhTo0mnIOY9H3TlLqR5lKGpgtbwKbe0bG
         yqemCo7UlYUIg1PR1qpU+/wZxgejLjf7ybqyTMo2KFjnFq6KlgZ53qh4rQuNkkqlXQL+
         Var9nfLhOK58s3mYnwQZUao59WufM2/YkY8y9Kbpkgqv/InSIHbgHB4vqruXPazXuinI
         i7ZyTXIdOGbWUo8Sh7AT4e/4Xf1x/gg6BvMGPJn+8jfIZROMUnOgKJdkSJZfhT4ZetDa
         236Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761742; x=1788366542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7b9iSxFAhd+25NIrkOPdMG6vXzNwXPeGADBa8TYMNDc=;
        b=U33BTqOoW196H0UQhmbtECyW89t3mYGdXc1NKsfQ7OPDe20boPG9GZSl9L0IDiHcn7
         Vsk6K9jGwjprBsTFNujZnuDITA72KuyUa7iNCcTGcDYceuNUD7hWa6uAzHYh/2sLYDkW
         Ubn8eZ0JqhbHynWQxdtuCHdHdpdVwxHLm5Ydved8Ew652Zt1qcV4sN2asZMaDSmU+8qr
         uW/UkpMKRxe4+B6VL0ObqXcEQmLSFfAejSmrUyPlATf2oJtyfJUxI2cWd8Vh5ZTrnqNC
         SF/PeU1eT62cv/mENnsA9xvTxv2XYewNCKMMv2jBq2JyZNQDdswZ+aCO8+84bES3bnAE
         95qQ==
X-Gm-Message-State: AFuF++monxJYnOUSsIJ1CS5Q4ws83+zqqJ5OIqUOoZqRE6YBuj8xKJ2Z
	rC9VILur4L/KEn3SYpAu6/kx5JQoCI0Gdh1DXcew8aL3mDXIPd4vp6VTIZEbfmpCB5Vz9+3ulWc
	ehkAr+YvG
X-Gm-Gg: AR+sD130e9aKoNeql0VejmVBPkGJaSUNiF5546Xht4dHqqvo/Z8wKZBgKgyc0gyFOAO
	LtUtuqAnqy0kmGcOHRw6lbWkkkDUpd6g+fSulpwNG5pFYc9lopiamdLL+9fO5icNIhr3l1al7aZ
	WivbYornOxifIEmje7wD4Ydoqw2oh7zOZbGQNp9XVO4VQ8nIzHZTa15Z06eVA+eTHXyVGAdVzDa
	vUVyVgGc++J2SxB/4ldNy0bJaoG3NxKIVYUVvOToQnCeS7wVgvjgulx3jK0wf+6I1+jZ9ZAaR11
	UDN4ji67x49xWT214JsqYDFdi3IziaJ2dtFVnB9x4hq2x+NLAFgWKeeOISGc3SSJNgvXY+gjaF/
	E7LW1fvX4yPEPGa6czvC/7FWKaUnLYU89hpFLvClZAqHgFoL6Ytl+ApZluZSyWlEGw1OTFHJJCu
	Q+6sYW1WSKMmXqQC3ciaQHo/bWwUm+xi/ztuXs4tJgkyf/ANuLd0uaxf+jfmZ8r+n5w2WJSrJ06
	m3oRLcuVM0u3GFf78gcdEjWaaaM/HVYMNoC
X-Received: by 2002:a05:600c:8518:b0:499:dc34:bdc with SMTP id 5b1f17b1804b1-499dc6f553emr79461395e9.1.1787761741748;
        Wed, 26 Aug 2026 09:29:01 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:00 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] rust: sync: completion: add single-shot and timed operations
Date: Wed, 26 Aug 2026 17:28:35 +0100
Message-ID: <20260826162851.2497-2-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose complete() and wait_for_completion_timeout() so Rust drivers
can coordinate asynchronous completions without open-coding access
to struct completion.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/sync/completion.rs | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index 35ff049ff078..df4f6e11ef37 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -6,7 +6,12 @@
 //!
 //! C header: [`include/linux/completion.h`](srctree/include/linux/completion.h)
 
-use crate::{bindings, prelude::*, types::Opaque};
+use crate::{
+    bindings,
+    prelude::*,
+    time::Jiffies,
+    types::Opaque, //
+};
 
 /// Synchronization primitive to signal when a certain task has been completed.
 ///
@@ -90,6 +95,15 @@ fn as_raw(&self) -> *mut bindings::completion {
         self.inner.get()
     }
 
+    /// Signal one task waiting for this completion.
+    ///
+    /// If no task is waiting, the signal is retained and consumed by a future waiter.
+    #[inline]
+    pub fn complete(&self) {
+        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
+        unsafe { bindings::complete(self.as_raw()) };
+    }
+
     /// Signal all tasks waiting on this completion.
     ///
     /// This method wakes up all tasks waiting on this completion; after this operation the
@@ -111,4 +125,13 @@ pub fn wait_for_completion(&self) {
         // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
         unsafe { bindings::wait_for_completion(self.as_raw()) };
     }
+
+    /// Wait at most `timeout` jiffies for one completion signal.
+    ///
+    /// Returns `true` after consuming a signal and `false` when the timeout expires.
+    #[inline]
+    pub fn wait_for_completion_timeout(&self, timeout: Jiffies) -> bool {
+        // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
+        unsafe { bindings::wait_for_completion_timeout(self.as_raw(), timeout) != 0 }
+    }
 }
