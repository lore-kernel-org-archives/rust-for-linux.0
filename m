Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDA21E1E12
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 00:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765845439; cv=none; b=XpohnwjwM1nOfcfj8QVI3Ef3/An68m0Xhu9VolIUktc0uHgXaGwOGdtnC7ZOAOmnbG/MUMTw+cGhszqgSodqPkbKZkTCyLngdFREZemmSK8bfc5YkeDo0Csewq7vNTxEDB4dm8YZ2ktnZiEpi4uWmFIO6lg+8CFN9zvogvUSBD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765845439; c=relaxed/simple;
	bh=Mqk5zIfaBDUtjJZOyrmGT/+i2AR6QM1tSX71Qn4f8K0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bNLX1IZ9meo1g8KxVVE3AzQoq4KGqcJEk9DJEr77xUTp9lyX/jzKwlWuCJ84//CyA69SRFH0sauiAV73VEJ1cxH8lZfr5SO2e1ZOlkcneZdzydVn5YzNlbTbMMZbDse73tFetfaHrJfXtAtmOREB9/xvqqLR84NtZjxLqkfMTOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F/dCIng1; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F/dCIng1"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso7304757a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 16:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765845437; x=1766450237; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gs0Q2OL8YwUV/1ENctOC45hbNCC1apKjr9kUvvk/kpc=;
        b=F/dCIng1z8rHx+0o7GZXinkQ+z3MpNb+DnxNTCoYXatNdI6a5vnR+yXTjDa7sGnENZ
         h6rZ+OS5XppYt/OTwb9+Vy60I3y2JGlfep1WsyhTQq3F72Rx4mpLkbkXXEDUKebvg1ZK
         zHBLPkyaTqADAah/K2Jemab7dUsCot7NpbJB0OZxjVovXEnxuOQkH3H5gjCBFq6XsXab
         3qv5/PwCkkuRU6iQiZH80bIEDJosg1R2bdSCudcww9D9h57OJk8+4Bo8gtu0Z8iLWeEz
         X39fLwi7GnAqq+6VlbEpb+vTar/b5Lujo1gr5vB1k4AVUC9/KJRC1MY2AUFp6kr/YZ7y
         obeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765845437; x=1766450237;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gs0Q2OL8YwUV/1ENctOC45hbNCC1apKjr9kUvvk/kpc=;
        b=oI1GAGOZGrE2xcu1XsAWn93LJlwxDtwVXihpUlaLdBh2y7IGc5xO54G+fWLK2mc627
         49KINGxTB0G/zVcVNJgrkm05baB8NjSiJ6+9rOR8hcs8GHQthChBfDXaUio/n4FdLMug
         9laVmJjrL8Dw5zAlH4FOErhGspro90mJ52YffzT1EoDzUP1Zd1SjshtojBX3k2aptfOL
         mtZ2lSTsfM4IN/xr8Wp3O3frIdHo+WMzNaa1AIoiZ/lbDq/Iy5paWN8n+0GeVRMsSqgA
         XabIqbi8aQcEKLAAzpPogOAlRVpjZ8Vg7HRJtMgcLoj3EkyWzLQHVRmAUktShSOdGfIM
         R3Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVSShLctzLg6Bg1X8KQsuAUYpUEUYoDH2drHIo+udMoVAyyj6kNfW3W4g9WEnlKuwQ3fx0c5MMRMBznkPifpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUeGPKdVG4NhLBBIEaKpoJCEXrBd8I5Q0v9SuQbVzqIH8kRBwz
	PYOtCJ7tYi8iJvzEPmyLP0rNQXhgLiVr5KCPeKe76UhqvYFs+7BKYt1w/n/clzEHeuEusAdKdPb
	W33KpGBqJxA==
X-Google-Smtp-Source: AGHT+IEeiodVq63zCehBZD3dEU6IFYGzODZQs/Mt0zh9WoIppPV3ZYluFQ1kOTGZx0gcVUHelDC9tJTalapg
X-Received: from dycph12.prod.google.com ([2002:a05:7300:dd4c:b0:2ae:372e:7e0c])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:5402:b0:2ae:4ee7:3a3f
 with SMTP id 5a478bee46e88-2ae4ee73f4cmr162557eec.1.1765845437156; Mon, 15
 Dec 2025 16:37:17 -0800 (PST)
Date: Tue, 16 Dec 2025 00:37:15 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALqpQGkC/1XMQQrDIBCF4auEWdfiDNiQrnqPkoXRiRFaDRokI
 eTutemqy//B+3bInDxnuDc7JC4++xhq0KUBM+ngWHhbG0iSQkmd0NYKDkuK8yZG1TISD4wooT7 mxKNfT+3Z1558XmLaTrzgd/05hPTnFBQouJXa4mA6c1MPF6N78dXEN/THcXwAsB19bKcAAAA=
X-Change-Id: 20251029-add-entropy-f57e12ebe110
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765845435; l=2092;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=Mqk5zIfaBDUtjJZOyrmGT/+i2AR6QM1tSX71Qn4f8K0=; b=omxI4bkkK/AfpKhEqESb44yKwWRrfbaH02BLbNp42DipDEfvzhAop6wRYSBNOiKc3L1OreKu4
 rjNIMVlyRCbAzB7xGN4CqB1gffKkiOQNIe3lNjXXoc8X3RFsvoo4uho
X-Mailer: b4 0.14.2
Message-ID: <20251216-add-entropy-v2-1-4d866f251474@google.com>
Subject: [PATCH v2] rust: Add support for feeding entropy to randomness pool
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Adds just enough support to allow device drivers to feed entropy to the
central pool.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Changes in v2:
- Added more details in the docs about the API, specifically about it
  not crediting entropy and when it ought to be used.
- Link to v1: https://lore.kernel.org/r/20251212-add-entropy-v1-1-e70ad1bc9c65@google.com
---
 rust/kernel/lib.rs  |  1 +
 rust/kernel/rand.rs | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf12004286962985a068665443dc22c389a2..bf64752d276b0bdea06ac0de8a5e219190129377 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -130,6 +130,7 @@
 pub mod ptr;
 #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
 pub mod pwm;
+pub mod rand;
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
diff --git a/rust/kernel/rand.rs b/rust/kernel/rand.rs
new file mode 100644
index 0000000000000000000000000000000000000000..abaafa12c6ec7fe600463dfc2bdb78385a09cc52
--- /dev/null
+++ b/rust/kernel/rand.rs
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Randomness.
+//!
+//! C header: [`include/linux/random.h`](../../../../include/linux/random.h)
+
+use crate::bindings;
+use crate::ffi::c_void;
+
+/// Adds the given buffer to the entropy pool, but does not credit any entropy.
+///
+/// This is intended for use mixing in data that is likely to differ between devices or boots, but
+/// may otherwise be predictable. Examples include MAC addresses or RTC values. This slightly
+/// improves randomness in entropy-constrained environments (especially common for embedded
+/// devices).
+pub fn add_device_randomness(buf: &[u8]) {
+    // SAFETY: We just need the pointer to be valid for the length, which a slice provides.
+    unsafe { bindings::add_device_randomness(buf.as_ptr().cast::<c_void>(), buf.len()) };
+}

---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251029-add-entropy-f57e12ebe110

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

