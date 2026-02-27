Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A2B3603CA
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184912; cv=none; b=Ry4BlDHyKb3QBo+iWohSEVlrfPCGP2Rlp6ZBVy2/h9s8TYWHbCfBv3bZIj0QQqphGS7s+MIwJe+sfp0V1FB2/e9Zet/aEIkfl++uPIn7Qmb2HKlAJUjiZo+CvATZ9Mw/oz5UzytMi8KyXFWjXiWTxr6t1dSexLqFrWKNmW+OxXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184912; c=relaxed/simple;
	bh=FsmRKbPw+qneYljCrVrSeYtvwTqK6xf4CJ1v5f3Z4F4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EOfn7QYbanqhjt+v4fj1JESYGIW2j2Pwf63TmOH+QEH9L777MGX+IjPbVK5RhU2lDiWq/MRhnavTlPEw0A4wKQapfMHJwlOiQ5N0S56vKswkjcTJX0SBj9V0LZsVlW+l8iFNbLpP/nLKzUKFbEhdYPKdbKFVwbOA/ZVZywwRm78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IB8E8HrQ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IB8E8HrQ"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48379489438so17956585e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 01:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772184906; x=1772789706; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HUzB58D3BLG+QCzOrWPK89tWj1blZspiABXeCT3db4o=;
        b=IB8E8HrQ2NZjunqxcAS+XvvGv3ZLQ20AWE/eiEK2lF52hKA/AqdfaZ4o8v2KvfS5oY
         sAL/tNhZKwAMO9FMUz2Ns7KLYMpRKLkNSf0uzpf0NbNUC5G0jNWpTGDeyL5ZC++f8HVy
         z9gh/ufJSW6e58ExtCcZia72/AJitv3JCdKLj0IQ1CB1jHzX5KU0YndHK28A0eYCEWyo
         MgX5ZTwhjDAqGVP5spcBan1i5xk7a3DyT4OHJ1QBszbo/AJUUMp/DVphJ3XBMPzuL1nM
         cqREf81TLrGryFvNK8KjzZubohk1bLP3UJ0xRJk/hh4bkAQASRSY50UkU5L4JaDFtJ6X
         qLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772184906; x=1772789706;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUzB58D3BLG+QCzOrWPK89tWj1blZspiABXeCT3db4o=;
        b=clJt3o+mV1n9GQVuACt+ROC2TloH+iIiIXnI3NsLfrNfBJT2N5CUpJJazh6P9t9VVd
         bU6ptlZbBNRoQS278YgbBZGahLVmtNxy9ntqQTL3XHSSRtgk25Mw1zeT7q4rx+GpYX7D
         b6CdxhN+4qYanVK206ppI3VI6t0QmjE79OD458gc2scSF1M6BYi2i+U7u69zLJboBS1n
         c+h0kuhzrafjznTG5paOw5KwhicfhInEHllhwC9VMznJeixztCJKgKkkje/QcMJNQ0SU
         piAA/UcOH/bqGl0BFQXXULobGs9qBdNvGKJpSw0KWGJn/fz3uiDlJRTMIzDLpzV2au+j
         owHg==
X-Gm-Message-State: AOJu0YzWX2VHtAXtvdqlkEFsPYZm5QGPiCkqN4NQkpo8WezRkz/hhyXc
	m6RFERqY4r66W4KT9xRPg/j9oSOH/yD/2qsyScjzeV+CvzXCXpIKks0f0WuWulB02BRZSH65iUV
	MPUABAdv577YB1SslxQ==
X-Received: from wmbe25.prod.google.com ([2002:a05:600c:5919:b0:480:6cad:6b2c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3108:b0:483:887:59b0 with SMTP id 5b1f17b1804b1-483c9c1cd2bmr30647915e9.35.1772184905922;
 Fri, 27 Feb 2026 01:35:05 -0800 (PST)
Date: Fri, 27 Feb 2026 09:34:49 +0000
In-Reply-To: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1542; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=FsmRKbPw+qneYljCrVrSeYtvwTqK6xf4CJ1v5f3Z4F4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpoWVBatBK/WdV/gjd/PGDfnqo3zCPYv8uKum0e
 K/whnV3TFKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaaFlQQAKCRAEWL7uWMY5
 RkgoD/4091XkLpN+OHBXoHaKyoxOonvEdpCj3S8O1dPSJZkkhTIa69S+OeoF1bVKrpFpy7HCxBU
 +Kc5t/tSXdX5KGqTp0JvYBk8y6S6SbzgzsHiBABReYKtgS+eWUiW121JCJ6CYOsv9/xOBhUlM+I
 I5Y10CxCni3v/804SgbpavcGyWpx3/SW8OgJaYfPO0xGzErVHlXU4u/4D6q4KWmcxHaWjflL9bx
 t4QrsdKqXb0VCc+FRyohcgnmu+v0kJ43e6vW22WxRgwryVFKJpcdb0pP51oYCs7lI26LNUnn3aY
 NNXLZu3ZfRizoK52jcyGuzvZlNuvNChmEXzfu4LiHeEQ/KZMoj92W94wbHfdidxX7J2HPhkXe0u
 i9XPOjct2chi7d5m0o3ToBJIdu7g4Qxf6IqW3L+8TAISNqaWaZRv0vOk1kU1pVz4ubl938socuo
 jNQ7tKNN9N+pGBdhpMLpxRALckr1S3GQp1N1G6X5twofY+xJ3Pe6ecyLaGtYXX2hCosl8fAosWM
 GxfHYXSGKE2Bg1lCmjXm+xWINxmwa6Hy/JzQk9Ctu0HEvcK0cNGx3ZICiathbuiZqQo2clcRsWb
 QWDvf93EJlY8Ww73I0iCcY5sdVBh5uX+9mZkePa++/nQ06zv4dqd1E+ymZaQQQogwsFdg+Ruvll XH+xA3iD5jMjAFw==
X-Mailer: b4 0.14.3
Message-ID: <20260227-close-fd-check-current-v2-4-b3347edbb310@google.com>
Subject: [PATCH v2 4/4] rust_binder: check current before closing fds
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="utf-8"

This list gets populated once the transaction is delivered to the target
process, at which point it's not touched again except in BC_FREE_BUFFER
and process exit, so if the list has been populated then this code
should not run in the context of the wrong userspace process.

However, why tempt fate? The function itself can run in the context of
both the sender and receiver, and if someone can engineer a scenario
where it runs in the sender and this list is non-empty (or future Rust
Binder changes make such a scenario possible), then that'd be a problem
because we'd be closing random unrelated fds in the wrong process.

Suggested-by: Jann Horn <jannh@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/allocation.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 7f65a9c3a0e5..31a42738a99d 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -260,6 +260,10 @@ fn drop(&mut self) {
                 }
             }
 
+            if self.process.task != kernel::current!().group_leader() {
+                // Called from wrong task, so do not free fds.
+                info.file_list.close_on_free.clear();
+            }
             for &fd in &info.file_list.close_on_free {
                 let closer = match DeferredFdCloser::new(GFP_KERNEL) {
                     Ok(closer) => closer,

-- 
2.53.0.473.g4a7958ca14-goog

