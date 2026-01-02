Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7EA1EEA49
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767379828; cv=none; b=dISVxhXZsz8CGjfWwsOVXtdb927TcRGEEKS7OFUF5FsVT8I+9bldUbua+uNplJR/3jYK4EJA+QMPJilu3R6N6/U2AhAvX0BnNmOUyBqaZcOd4FBKjFZg2isNSEqdHF+WetsGXdqVBn7slPl38M+ENHOWyi747bfkeppIOWa8nPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767379828; c=relaxed/simple;
	bh=tbXgEu1CGVMELXT+sAY7gYlI9SdfKhqR7p9leaet3xY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qRwdNF0bXnSabcRfbnMCMFHOIAHknPHL4c14ObLZhEwh1OAyI9SCacmk4YmoapK3HbJHr/hYirb6D3uyhHXKz76rUadqlmG3mhq49vC0QEHdjn/Er/OfYfKQn/zMWZ5UDLzIiLFuZeSFqOCUl7DbAHgu6fkZmry0/zQvdl2/tlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cIMS0ghP; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cIMS0ghP"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a13cd9a784so123896735ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 10:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767379826; x=1767984626; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AVVgUyYViZy2aFq6HMaA+Bn/NQsNeCTXO3hsv0gF8+k=;
        b=cIMS0ghPUV4BdyPDHlGg1VgLhB7lt7pNRthFpQOFTn6IFBLnklY6Q9CpLuG3RvsyeQ
         XxvOlLNKiAxfvmd7W1zMJhFJaLfqJhhaEVlLQdkDJvzTpxpCyWgWCHxGm0JUUE4wDNQK
         QPZfX0KK5EUAHNY1+Twd3NurcB1Rod6juo8m1Kxt912T1bG+NPshX0wdw1vCNspGuGLg
         X2ZTn8fu2f/j42WL4OwHqk6LjwRIwKNr0KwFsvitDE9XGwof8wPoTxbv/ta/QjlHseYm
         qCK23697D85qjotok6wlTGS3YYU0Pa24YdS7RaFew7aQLDF0K6yd572AoTs3tNlxDja1
         9iNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767379826; x=1767984626;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVVgUyYViZy2aFq6HMaA+Bn/NQsNeCTXO3hsv0gF8+k=;
        b=i8jzzlTcM/32dDe57wxGfoQejnbViWRjIx+cgc0NiZ3DenXR8GtY49PjaYxpL/9EiE
         ZnZu+AuWbCEXY+TzipObmvsWLWkUVqOTWZ6IiTt3zLWuPRO8uJwgs+fnNE0qDlJSkXG4
         8croCghzva/z0Os8gQ35XSiClCsACsruc4P0Xo/hYu+OaQNdZAegaCKF8Wo7gWVHY5Om
         iyJV0pWmOrnv2TbY9kDtKEFSl1fieU2C4Lre/odLWnP/yj/aA/ZUMdttM6ztCTFwIaq6
         EHUKHjg/clZhKHAz6xRFWrRasXSl2hXeO+/l018hDLzWr18rHa5RtNWTqwxuP+4/xLmU
         K8fg==
X-Forwarded-Encrypted: i=1; AJvYcCXHyrcPx5I6xlWr7Z8VCl4O9B2dHjx4fQDlxM4dQJw3ln8M8A26SWQjjPy0nGm0C9X5t48dJG90wkt+j04SRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJg2BeVENKNsMWb4PfJ8oBmbdb0fn+oL/Cf8WsngfD8VAlG7ow
	BQ1zYqVq4BmE/z/yDkyBDgzGA2uorjS1/6IbMGNn8yJL1/Odq/q/+Pi7S8ciBndfn/dgjBja1Ig
	SjnfEb9mXTQ==
X-Google-Smtp-Source: AGHT+IFHWICJBMNmkNQEYiRf3vmVdOcqomny8CWyYGlXlrBD58lDkzykSuqsADE5s4aKyS/efRM5JuiSSeb+
X-Received: from dlbto10.prod.google.com ([2002:a05:7022:3b0a:b0:121:7a50:e97b])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2714:b0:11d:fc4a:c4f7
 with SMTP id a92af1059eb24-121721aac57mr29552242c88.4.1767379825882; Fri, 02
 Jan 2026 10:50:25 -0800 (PST)
Date: Fri, 02 Jan 2026 18:50:16 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGcTWGkC/2XMTQ6CMBCG4auYrq3pTP/AlfcwLgodsIlSUgzRE
 O5u0Q3o8pvJ805soBRoYMfdxBKNYQixy0Pvd6y+uq4lHnzeDAVqEFhy5z2n7pFi/+KNtgRIFQE
 IlkWfqAnPT+18yfsahkdMr098hOX67SDgpjMCB05WOA9VXdZGn9oY2xsd6nhnS2jENTZbjBkrX xjT5K+y6g/LFcYfLDN2UilRoHTC+j+sVliKLVYZN65Uha6MlxY3eJ7nN2L7YVpeAQAA
X-Change-Id: 20251029-add-entropy-f57e12ebe110
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767379824; l=3997;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=tbXgEu1CGVMELXT+sAY7gYlI9SdfKhqR7p9leaet3xY=; b=cURilOuOWCzC/5mhpulk9XqsD40RZsqg97MFxpZtnJUp1x8c28yyCgJ8aLXAdCF7LMJS/KO1q
 jfY0soO06ReAj8QmM2DHCtsxTjHmIoVZzmgZkB8b9hkiPPgWKVQayxL
X-Mailer: b4 0.14.2
Message-ID: <20260102-add-entropy-v5-1-6b38a7a4a9ee@google.com>
Subject: [PATCH v5] rust: Add support for feeding entropy to randomness pool
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alexandre Courbot <acourbot@nvidia.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Adds just enough support to allow device drivers to feed entropy to the
central pool.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
This adds bindings for `add_device_randomness` to enable the conversion
of `qcom-socinfo` to Rust [1].

I'm trying to land it separately because it's much simpler and likely
usable by others. The conversation around this code is also likely to be
very different than the conversation about the socinfo driver.

[1]: https://lore.kernel.org/all/20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com/
---
Changes in v5:
- Add wrapper to the randomness driver MAINTAINERS section
- Replace detailed docs with an identical copy of the C code comment.
  (The short docs remain, and the C comment had the one function name
  linkified.)
- Link to v4: https://lore.kernel.org/r/20251230-add-entropy-v4-1-fa9485b6d372@google.com

Changes in v4:
- Adjusted documentation phrasing.
- Renamed module from `rand` to `random` to be more in line with the
  header name.
- Link to v3: https://lore.kernel.org/r/20251226-add-entropy-v3-1-a3440823a07d@google.com

Changes in v3:
- Fixed doclink to be srctree-based instead of relative.
- Switched to prelude import instead of fine-grained imports.
- Link to v2: https://lore.kernel.org/r/20251216-add-entropy-v2-1-4d866f251474@google.com

Changes in v2:
- Added more details in the docs about the API, specifically about it
  not crediting entropy and when it ought to be used.
- Link to v1: https://lore.kernel.org/r/20251212-add-entropy-v1-1-e70ad1bc9c65@google.com
---
 MAINTAINERS           |  1 +
 rust/kernel/lib.rs    |  1 +
 rust/kernel/random.rs | 21 +++++++++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c5a7cda26c600e49c7ab0d547306d3281333f672..72b912c0bc068d2a304bc8eb1cd080ba9bcdd9c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21751,6 +21751,7 @@ F:	drivers/char/random.c
 F:	include/linux/random.h
 F:	include/uapi/linux/random.h
 F:	drivers/virt/vmgenid.c
+F:	rust/kernel/random.rs
 N:	^.*/vdso/[^/]*getrandom[^/]+$
 
 RAPIDIO SUBSYSTEM
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf12004286962985a068665443dc22c389a2..c82e6747043e2472d6b5e4d9043fa8bc6d3c8434 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -130,6 +130,7 @@
 pub mod ptr;
 #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
 pub mod pwm;
+pub mod random;
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
diff --git a/rust/kernel/random.rs b/rust/kernel/random.rs
new file mode 100644
index 0000000000000000000000000000000000000000..3bffe07f5837fc5d9ff5b1959247d9028d45fd44
--- /dev/null
+++ b/rust/kernel/random.rs
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Randomness.
+//!
+//! C header: [`include/linux/random.h`](srctree/include/linux/random.h)
+
+use crate::prelude::*;
+
+/// Adds the given buffer to the entropy pool, but does not credit any entropy.
+///
+/// [`add_device_randomness`] adds data to the input pool that
+/// is likely to differ between two devices (or possibly even per boot).
+/// This would be things like MAC addresses or serial numbers, or the
+/// read-out of the RTC. This does *not* credit any actual entropy to
+/// the pool, but it initializes the pool to different values for devices
+/// that might otherwise be identical and have very little entropy
+/// available to them (particularly common in the embedded world).
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

