Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2939F2D3A70
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 11:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765453138; cv=none; b=ieeGhe3bUNFhUuX0FlEoF2r+i6pUoXGAASdXCyfvn/W2cpTvwlGz+i31XJGHO3AWZH+ij+K4pELIC7RNFbQaxgz2GR+lXz9bsSySIsZyPVZ2JxpulabGfDR4mQgenJbBfPyBBStR+I9k7lhCISg1iDamW0+fFgSCFZFPkfTnGXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765453138; c=relaxed/simple;
	bh=kG2/vm8MRE5B9LQqfmCEjK6BuuOl3frJEiODHOibh9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rL+vGdIi/fJ5vj4ExY+HDHkhI4ASpBQJ9OfgS5QbwHlwsW/IMc0tiup6vhUPiNJgCXjL/6lpoPBGVhl3YbwGgljlecQirig8u611PBZ/eElvqjo2GkjsWBAh/Ve5/nmWmLdCL2aQraXERGKItcPf6f4rhqZISrDz4ojlWs35P5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BG5wvcRf; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BG5wvcRf"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-349195f1a52so1327331a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 03:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765453136; x=1766057936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJQq/8c4RR54brJQvYZs85QjOPZWgLD/LScwsneTytI=;
        b=BG5wvcRf4vyjvqz7x2V+f+BLPl/rmw9sp1cylWKEzmnYIwoFZkSGDgpPPwBieAjg6u
         xd6Gj7vgKc7qsPDQ6R035OlOxYwmlKbGpM2FSVfoiCO1SCgv8JMXugDtwBNHNagaDk+c
         lrAIkELp77SR63JdGkcLzBVvWcnG62W6idJZ7IGxTtFDaHFLK+x4a11Uovb4txnEIMDn
         q/vO9I+4OocWojkva+91uTlgLrCXveUsqR357hg+iGQXJ/d3MWeJy0nfN4U42iSjwO5v
         NIfa4UKp+dA7riRNokdXWH35hhBqN4dPRuGtK0f1UnWZ78yZmZWP09IKAftDv0PBWQQm
         bbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765453136; x=1766057936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DJQq/8c4RR54brJQvYZs85QjOPZWgLD/LScwsneTytI=;
        b=XMCR0lJT3FUZ3GsgRBB5IiuEicmGJHkWcEGIKr7F9poUqGYOgliKNi8SFwxoiTLg0M
         ma+UkZNuGm3ow9QeEHacD1S6AropeYZwzjvYEDKr9Vqv44pBHty5DHKjZo3aPiSlt7Wd
         LTSVxe7C/rVyBRyvYXa/KizEoK2aTBzRFnx713NPCDlC6dhPp8ENJPhn3hZGa+Jtuv4p
         c8DN6CbfnOFO9FSbtHzDi/CyXPYqhl4yxIjKW6oAopssDyuYXkwLmHPw/AJB+EvMvssq
         oMzJ1W4nYXTh0DLUxfRubW8NckfvTdSnqqj4hJjmv0RJIcjxN/bT43qHKdxO4wiCRpf7
         aURg==
X-Forwarded-Encrypted: i=1; AJvYcCUXsGlhvoRxo9uUPbPQ9B2i7WDSw6Y/Lf9SZsVq/Ph5qCCHYMYoh70GPbJ39QGtjh+/yCIFk/PdPy6FFV7E4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzlR1SGCKoPcWZKBqQeggifVV0uCL86afuTh+XdQ0Xz0/Osx7L
	zbh9HS0KB0bvsn6ekRArmz/so6P/3z7/I++zZSf6HBf53z1tP3RMkwxs
X-Gm-Gg: AY/fxX5krWKsQrvQUTIxUIto/h9uALjotALl6FXc+/vGHkmLT2hsf51ikrbg3IIc+WV
	0RuMFUffxDDBeYtfLe5pGcQJW9i1sS3Je4HiC+EZgk3whcuHALWUXx0/LxOhvDPwdZ8b7y8gtSR
	J/KtlHL/HtSnPq78ldX7E5HIVISAysnnLjl8frl5OhedLZE5Cj9/GYkdgtVEVNexDuFtSj3oTii
	y1Sk81s+jtJYaip+Cx+COL/iFFR57iXyT5QQNnzDwfE1A2KBM5ejQal2nqyd9mKBJYE8uFEhrov
	vcpAFwG0AJLLleybh7qioxSsXKSEqvAHilYqHgXma7wUvWi9q5K7LipOdt01Dr4gJ6j5aKYA0bo
	JEZKQpbMs2P9RwpbwFnuxvoS86o7SdbTOJfMzEpbT2GwZIiq/O0GVxqCOMpq+bo7QJCI92VDVuD
	M6FzepWZRYVt0VuOu4bxCjh0wGwjgXw5pic4VdWcWTmk1TQeHfzog935qP3HiM8A==
X-Google-Smtp-Source: AGHT+IHdD9tF/8z/jMRKChh033FrzFpXdoq8I5zPR0c4Ed7jTMvRgauQGONRHrxO3I55kRfTgzkbrg==
X-Received: by 2002:a17:90b:1c83:b0:34a:61b2:c58a with SMTP id 98e67ed59e1d1-34a9282e66amr2038346a91.7.1765453136386;
        Thu, 11 Dec 2025 03:38:56 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a9264e4f6sm1780337a91.2.2025.12.11.03.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 03:38:56 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: acourbot@nvidia.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 1/4] rust: sync: Add i8/i16 atomic_load_acquire/atomic_store_release helpers
Date: Thu, 11 Dec 2025 20:38:23 +0900
Message-ID: <20251211113826.1299077-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
References: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add helper functions to expose smp_load_acquire() and
smp_store_release() for i8 and i16 types.

The smp_load_acquire() and smp_store_release() macros require type
information (sizeof) to generate appropriate architecture-specific
memory ordering instructions. Therefore, separate helper functions are
needed for each type size.

These helpers expose different symbol names than their C counterparts
so they are split into atomic_ext.c instead of atomic.c. The symbol
names; atomic_[i8|i16]_load_acquire and atomic_[i8|i16]_store_release
makes the interface Rust/C clear, consistent with i32/i64.

These helpers will be used by the upcoming Atomic<i8> and Atomic<i16>
implementation to provide proper Acquire/Release semantics across all
architectures.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 23 +++++++++++++++++++++++
 rust/helpers/helpers.c    |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 rust/helpers/atomic_ext.c

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
new file mode 100644
index 000000000000..a10c723ab224
--- /dev/null
+++ b/rust/helpers/atomic_ext.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <asm/barrier.h>
+
+__rust_helper s8 rust_helper_atomic_i8_load_acquire(s8 *ptr)
+{
+	return smp_load_acquire(ptr);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_load_acquire(s16 *ptr)
+{
+	return smp_load_acquire(ptr);
+}
+
+__rust_helper void rust_helper_atomic_i8_store_release(s8 *ptr, s8 val)
+{
+	smp_store_release(ptr, val);
+}
+
+__rust_helper void rust_helper_atomic_i16_store_release(s16 *ptr, s16 val)
+{
+	smp_store_release(ptr, val);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c..15d75578f459 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -8,6 +8,7 @@
  */
 
 #include "atomic.c"
+#include "atomic_ext.c"
 #include "auxiliary.c"
 #include "barrier.c"
 #include "binder.c"
-- 
2.43.0

