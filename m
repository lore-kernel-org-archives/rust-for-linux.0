Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ECC403158
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779889289; cv=none; b=p2Z9sY0fbdE79ZX3DKLdMwzMdK4vNkpoVcVO/yabPF0xi16e6lgJYMQE892t7BRIHaaDS/3ujj8tslQ7q0Dk/jeEDxGMfYB9OCZPY1quIFcq6NiH9IBbhb+1iPBbI1HpmYj6GP+dyjReFmwJ6pU3ErH92vKe0zGB9aWkCny2yz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779889289; c=relaxed/simple;
	bh=LeUS4h0dAZFMR118R/wSEgBwYTGlXM0bV41TWFIWpWU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=CEp+fI/vgyGTG/zX93qUjmUyFgW2upE0XS2VtKHLj2ax1u/znIEzGA40lCNnBm7JdS+8CDPKdlnQfrJnZm9ItigbpElA9WQDSLLbUJxrh+nktvPa+pyjbrrstYquWfbxndFbb18Mo3rm+2v4+3nJMu6UxdrzIuhMRWUgjWgD9+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QPzUUUfX; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QPzUUUfX"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-45ea38c03a1so5543077f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 06:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779889285; x=1780494085; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EcF/LO4YfqSS2ARnboxZ+flFU1P58FX+oV9Y6yXSPGM=;
        b=QPzUUUfXNA75XB2cKHJro7FlP4gjZO2bWI6bFyFMkajWbV5sVWJGdV6/3T3s4lO06P
         ugAWMMMfdVopiZ81stH6mhrwFAmcu65vl4xP0c5dPSUDu7xa4DGEA/zaG9/ULGjzHbGa
         IbaPiBrOrRL7xJ/2G5xfibmn10AihfZCy0Ax3Rs5iYPiopmThfiD+fuDV87CPUIwp3DA
         VRu/iKvpDmD7T37w91gkliYCsWcHQ9Pfibi5AFHUM2U2TIdjqWcEW4DbiAvNySAZkSdx
         oF47gpPQwVO/Kq7td2dq+/ZDUOuqIjSHHN9x2eUyOCshiwc5I23uhj4Ik+2OCVOuNfH0
         1xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779889285; x=1780494085;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EcF/LO4YfqSS2ARnboxZ+flFU1P58FX+oV9Y6yXSPGM=;
        b=fRK+NmIlbd/Nx37WNNBm7eAzBHiGNPnB77rkdOS388Irp/ViNd4XxGJgqaQSPBg405
         FYWy3br/W4O1FZWXErD8vk7SMc2KJjrhdVWyjyaDM2HCzHQHfTkWV4GGPVetj1Th9WuO
         EfruIkSM9EFQ/sPIj7qLhGqjHdOy3XVw9aZ401MVJjFe+PNupKr9mA3b1bi5yxD6XyPQ
         9ubA7Jn7Q7q/29mBEZMqqfNWQCrMhIuDxsh2eh9DbawXhTrPmZpvUqzO2uQG4HXT2Y1l
         aHH5wZwY13AfNgUvMuF+uGIXNlOosmZKUGfx6iaiWZLjcya2wWMhiOwqJI3dIvY/Y3ER
         a7jA==
X-Forwarded-Encrypted: i=1; AFNElJ8TVYKcP4ETY+BdTlELNnAXabEZIyR3UydgGq5Z7zvZXa8UNd8uaCMa1+a2Z+R8gQvjYgLxFT8tOV+rWv3Nig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqPw4uo15RgV+TYR3t7GzCAub654TqDi8G9/ussrDWuIsicu1A
	awDGQIoEMsgV/5prcyuwkuK6h8JOc6jiiReSzex0BorHWZQqUH9wAc0FZFwe3iIO3lVTxg3E9rc
	/+Oif478yCVJ0ZCqRbA==
X-Received: from wrrw11.prod.google.com ([2002:adf:f9cb:0:b0:44c:2fb:a56c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25e1:b0:449:9aee:4575 with SMTP id ffacd0b85a97d-45eb389fd2emr36824679f8f.30.1779889284888;
 Wed, 27 May 2026 06:41:24 -0700 (PDT)
Date: Wed, 27 May 2026 13:41:18 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH30FmoC/x3MMQqAMBAF0avI1i7EiBG9iliI+eo2iWxEhODdD
 ZavmMmUoIJEY5VJcUuSGAqauqL1WMIOFl9M1lhnOttzwsV4LgQPz1CNyrDr0vYwbnCeSngqNnn +6TS/7wf4nJJtZAAAAA==
X-Change-Id: 20260527-set-extended-error-e2ca37e0696d
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=LeUS4h0dAZFMR118R/wSEgBwYTGlXM0bV41TWFIWpWU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqFvR/cIwJ0wIRo2NQEAKrPozLiXiTML/lhWcRV
 WH7CV39rqGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCahb0fwAKCRAEWL7uWMY5
 RmM2EACCfg3cMc8eTmm9+Vj1Co70ZV4OI/h8ofoPKZcYPgyk63W7RVd1lnt9zATusgigW4J7A8U
 +tK1KyqX2nWARqYb8Ini5VYVHjSs3w5bh49MDYkNpwurp1tREB/MDas4ASZrNvmeTzkJwDAXSng
 K+tATFxQfSjhHHFHVnRnXE9kjjilP9YjDr9jnQ4yh2W2Wr6ZLG7WF9QR6SAp0HnUgWcgfwp0ZT6
 SCEexi9rzTZq0FMUUiBKUwU1cJajEhpeGU+J/jFne0MW9qnXf3IItrPlrbyjswu5009vTqZIKEM
 BvbWSibmYISxJzqulX7Jp3YfrrcPceIz11BZ+9B9F91ePsPc0Q7iU/e54il1DkF29Fg5QvdgJac
 lyMJh4YR70q7MAWVEMfM/cFH1wCEahUvyyzdDEcnK2MpDxRUEPxSLp8etqDP/4A1Apj83Nz1C8J
 8st2n6a43+h+nGtTAE6gqrzXZXPemUZMEpI1ueL1SzMxBwbWcmZHNCwfPUHkV+FO3Lt3mkYYGwI
 IJydN40W3esfD+xsIJ2IkRsMqwUOcXHwLziVcQ5N2U4s4KggbioVJGu1J7W28WUi4AIADXUE/ar
 vq5NVFp9GPI281pXDUuc7mkBjSrMSZ8v120U7Yatmky1vwGXSHQMmC0KDAI0i5eRcvKCKX5IT6z Kc2EpQ1+MKk84ew==
X-Mailer: b4 0.14.3
Message-ID: <20260527-set-extended-error-v1-1-407b4b466035@google.com>
Subject: [PATCH] rust_binder: fix setting the extended_error
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

This code currently copies the ExtendedError struct to the stack,
modifies the copy, and then doesn't modify the original. Thus, fix it.
Clearly nobody actually uses this feature, because nobody noticed that
this is broken until they tried changing userspace to make some errors
fatal.

A test in userspace is being added along with this change.

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/thread.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 97d5f31e8fe3..0c74436c4e62 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1249,9 +1249,9 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
                 info.reply = err.reply;
 
                 {
-                    let mut ee = self.inner.lock().extended_error;
-                    ee.command = err.reply;
-                    ee.param = source.to_errno();
+                    let mut inner = self.inner.lock();
+                    inner.extended_error.command = err.reply;
+                    inner.extended_error.param = source.to_errno();
                 }
 
                 pr_warn!(

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260527-set-extended-error-e2ca37e0696d

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

