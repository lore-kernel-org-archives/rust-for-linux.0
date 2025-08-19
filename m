Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7EE26D4F1
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 23:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755645167; cv=none; b=caeHDGVdrLVaD0lW7NlqZLq4oiEM3a8wlryxAFJ7Dh4WuHHMJmbVKWbZpNXHeXp+ptA3pFaLJF9JU5YgrTiS31lfsWBHiT+YdL31X/XdC7YuCYUbrPuvKQ7P/mY+Nedzvtxp77XOoKMcQ0f7QO/XzjqyU9B2TaySSRu2ljKn3so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755645167; c=relaxed/simple;
	bh=MkHssmhMDkmA11+5Fw9N2VKj9bF3sFgzisLRIFmWIGQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mhmkUwbyww6OwVTgUkA6fI9OpeOgWHGkOEyvl1XEhwJzhMXu+nZiuN5bmrfi4aOQde4ZVxOCbK6a1/kF2XVo79IKO56lBpVgaBAct3IpiNGJcd3n0znf7oj8Wxy4rGFFwa2KOoNro0HdhA/I9Z6kektzKcre5pxgw4WhqW0xsoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KyzA5zRi; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KyzA5zRi"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-324e349ef5fso29493a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 16:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755645165; x=1756249965; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jN8SNOwsKkKJ3OWb34mFEMvcG/f9mlRHkX9+b1ckUOY=;
        b=KyzA5zRiGEgKi+bbqqJvt77OuDR174DX1WJ/YqYwF+qXHdWB0tEyKMIefivJmj68x/
         nhhEcPStAjYgo7g/fE/yWxjpjgBrclRM7ssM4UU6RP33nk2M9jSuvOyzfAn0sXN0D7Wm
         l4flBhMxty+xbvMH8VPWMODcvXGHITeTJ6Zz+76ZUdIp7TliM6amdSSQyAyOZEnfa56l
         y3uaWYfnktXx8vKx4egob9LcQMP6J6WbK9/8Di5vDEjASK4I3qjtc4G+wjCDymQhPoEE
         tl4wiLhOfEJpxwYHUde+8MVqyYv8igHYVKDjhhzZLDTMZ0BwLtIYnlLa1mveJhpJXpiX
         6DVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755645165; x=1756249965;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jN8SNOwsKkKJ3OWb34mFEMvcG/f9mlRHkX9+b1ckUOY=;
        b=gsON5jKpbYVfJARkQXYZfGEMcE1nnY5dv0z7mqqsi1l9mJYtKVmWFWEjXMvostvAv7
         0DhwiA/hZkjm0TfeL7MPjvoNjwIW+oc87D0Q56qrRTdajuGwTe9SmyVaqISnL6ZGNkJW
         1/RmBgMDYwv6E2igOUJCVk1AOKM9k7lCQWFtxiiW1afrvTo73+OAPo/Sp4hbVKrVyVKM
         hkkWkN+h9k3EgzSKN4VcdMzUuxOAiACe9adMXRr1dicJhXMhO4OSEWOxMMXkkQTg6v4p
         1YGKj5PPLrjI5g1ytjEVArQBKFVFbl3/8hI4mssUrXU7GyiTZ0SSiKIZzhOCYnjcAHCv
         GxyA==
X-Forwarded-Encrypted: i=1; AJvYcCUku48dJCP4DFUeExMmNNawiorYjj0MTuSK6JMZ+hw7PMeTTp+LIF7yu0YEH8ro/Vc05LKQvJsKhMPN0/b+/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLw2xKo6fP2xwJyS3sFuq11g4A4mvmg6jOvwV31tUchBERRfob
	Put/G8HSLABKZPOIkGp92IP+MhwzGk1+HpNmD8K+PpYWk6xiIX5U7JpWjpMdmxxV7Y8htBUJsSa
	I0cyIrX/hDA==
X-Google-Smtp-Source: AGHT+IHMo0ZK91R/2JZTr7H/Bi4qA+gEgfxNZ7BwL8+hnx9ntk/V6VEhPGzl6HPj8rarj4YABgfBI3GkzcDH
X-Received: from pjbta11.prod.google.com ([2002:a17:90b:4ecb:b0:31f:a0:fad4])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4f81:b0:321:96da:79f9
 with SMTP id 98e67ed59e1d1-324e146f76dmr1002024a91.34.1755645165315; Tue, 19
 Aug 2025 16:12:45 -0700 (PDT)
Date: Tue, 19 Aug 2025 23:12:34 +0000
In-Reply-To: <20250819-qcom-socinfo-v1-0-e8d32cc81270@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250819-qcom-socinfo-v1-0-e8d32cc81270@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755645158; l=1874;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=MkHssmhMDkmA11+5Fw9N2VKj9bF3sFgzisLRIFmWIGQ=; b=4ZQZO8gXNGoSPI80sJki8Fg5IguI0BJz/d8pWnbOjhC1USQdEgloaq3mkseOXTU72gg6REPl5
 c3xmRodE5ypB17C3ZMejI2eYoQBFqZ3QxrdKjdSBrkiAemi8FMd1Av7
X-Mailer: b4 0.14.2
Message-ID: <20250819-qcom-socinfo-v1-3-e8d32cc81270@google.com>
Subject: [PATCH WIP 3/5] rust: Add support for feeding entropy to randomness pool
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, 
	Dirk Beheme <dirk.behme@de.bosch.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

(This will be separately sent to the list later.)

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/lib.rs              |  1 +
 rust/kernel/rand.rs             | 14 ++++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 140e2f4e60c0b745ac5d5c7456d60af28e21f55a..afe8be55a6db1d29706c19a91dc51c1ae3494ed4 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -67,6 +67,7 @@
 #include <linux/pm_opp.h>
 #include <linux/poll.h>
 #include <linux/property.h>
+#include <linux/random.h>
 #include <linux/refcount.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched.h>
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 0461f25cb5aee797d25153a2004d63b6b41f4ae3..39a9088a8d63f0ae54a0101eaeb03b17f82e12e8 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -112,6 +112,7 @@
 pub mod platform;
 pub mod prelude;
 pub mod print;
+pub mod rand;
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
diff --git a/rust/kernel/rand.rs b/rust/kernel/rand.rs
new file mode 100644
index 0000000000000000000000000000000000000000..b3fb30f40a8950ac7b47d48129eb89024a1cbd26
--- /dev/null
+++ b/rust/kernel/rand.rs
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Randomness.
+//!
+//! C header: [`include/linux/random.h`](../../../../include/linux/random.h)
+
+use crate::bindings;
+use crate::ffi::c_void;
+
+/// Adds the given buffer to the entropy pool.
+pub fn add_device_randomness(buf: &[u8]) {
+    // SAFETY: We just need the pointer to be valid for the length, which a slice provides.
+    unsafe { bindings::add_device_randomness(buf.as_ptr().cast::<c_void>(), buf.len()) };
+}

-- 
2.51.0.rc1.167.g924127e9c0-goog

