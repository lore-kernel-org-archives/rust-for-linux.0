Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907D83A3E98
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550101; cv=none; b=qUQyHdqhOSFr9lknmdZR+JkEPwLnERlrD7nvfpJ006HMhS4Az0s7FQzC/sa0ShRnYk5DGzrnLXzNqbWsKUeQXBc6PQ68IvfcHk99SlVkQ1LJHHZMkYkQoCqMw3axFiGvj4W+co8/sgzOhTzefml6ivMIL0aGvLmHBXHXNQfKRgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550101; c=relaxed/simple;
	bh=RDknWmxdKOa3LqUMYOu70zP7u63JJfaI07G9XJVySOg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=CeQQGBiyiqzVR8EjIxH5+AkyzUrrzWFiHa7Fq/wbubVTC3HurZdKS8lE9XJwDE5pqDG/APigzevbWFiD27LH6DwHBvjhFTigC+QFD1NdbuIuRfGaz7VbtolVeZ5qvf66nyG4AGemeH2uWg3VmWsaAgTH+fAShXLFDaUGKu1HHFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqkZyjoX; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqkZyjoX"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so464932a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 04:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777550096; x=1778154896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cem4kav4PdWwCLcw2P7tm2Percbrzam0vx8aoqsFsis=;
        b=EqkZyjoXgk8NEd815HOKZCLb3T6QRFxMSw2WJyfDYbrG3/tCA8VcgXcnZcYfeIVu4t
         qANoedogbYzFTkh5RbjDyTtLbMXc6RaE7+1TSctUv2Ml7RFt5E+oec94MlqNdvWKo9in
         VctnZq/WNt20H4TLsOETml0dE3wSRn6CyRBho8+EDXzrb2hw8/pE6C8gcTaFa6Q2pB0x
         DeHVxS3UMaXW1chI0eENufSdcxupjaQfX7qGbdsifyFaB0o6AWH8aLlZnStu2/gxIxmm
         qNCFqjjBoyRydbakdLttgwqMZLiYZPrP5ZuvoV2Eoq0g8eSuQ7hF2bWGcQ946SpiDCnW
         oW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550096; x=1778154896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cem4kav4PdWwCLcw2P7tm2Percbrzam0vx8aoqsFsis=;
        b=SgEjB1s650GWN6F0CDlsdX2Axx4pP+Yjm9nVOoCvov+4Ey+N5CypuW8fiehhpIqSmy
         zQ8TVcjBQWthVoDi+aSFGrWgV+9oqwA0EefV9vIlI6LtylJJKd1QfCl4HFU5sAEqKaz+
         iIFeHZRV8A28x+w/TIxRtoFqW+H7FKFoUkQqjPKFKOhBD1t4O7ktTdupuuk9jUO/frFL
         1g2mcb0IJXX79JVlpzZW/fwtlNJSdful8duWdt58KZKkYuHNpyETGJSmlBo5e3AoFBje
         iU2c7Md0HA04yQb+CTTEOQh2j9ovMdP11fisigZdoy9IN0dVrSMx0nXa6vtIyhd4kw+3
         EgOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+91j6Ro7dCD8Tdq7tDTjcEVNVI/KSNULcMk6g4pGy1552KI3HuaMGjWT5pW8k5RPYN6lxtcDCe9Fbgox4AIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtDnPablM9u+sbtYhxYakJ69MH8yldSET+5ViT/QEX5ymJeFly
	pYbI6eLWZSsXwXm7vKD7EdMtIrPB0h1XLZI2LdNz4c2Rsa1bYgNa0us1
X-Gm-Gg: AeBDiesUd+I03Pd9CBvUhdE0rP26VR2ynMUHBFReCShE4mITswQTJmbgBWIUMhsDxrS
	scX5gM5CvOUCUG5OKiLRjpzp/BwpHhKKD/FJVqwfFuAtUGmGEZSTBmfnco+EgMXdgfyGJXFIO0H
	VaVmrNuUSrOt8QkKuJoXJNvCta/mJGod91fCWb1l+XCG79wgwemCE2jxKE8L8KnoI2Cet+0tJKu
	rzVThGeBeS97ibgC2di6I5+tCUVyGIaGAI8RhFLLPCu7zUSOq4xQVh0GwcA6eKyJUBHEO7rTJzE
	T7EQkNoplCjDURbA1kDE/BI5yLMekvwvoJLc2sBQ0p/zLEv/yAV1qY8tlaXSSSDAEaFrI+O0vJw
	HK0k7WjSxQ4gfVtCnUba9TWsQj4C6jlpcY7+WYarUNYfyxK4Yu+C0GLn0u6iwsWMG5XinSRWCZk
	38Jz9KmqlDdphZzNTsvChymxjEvMTZUXAk14SMyj69kgjL7bbhRNVMAMlBFwihLw==
X-Received: by 2002:a05:6a21:ec4f:10b0:3a2:d838:bfdb with SMTP id adf61e73a8af0-3a3cf7caa2cmr2284806637.29.1777550096136;
        Thu, 30 Apr 2026 04:54:56 -0700 (PDT)
Received: from Nighthawk.localdomain ([223.178.220.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed810888sm4923352b3a.61.2026.04.30.04.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:54:55 -0700 (PDT)
From: Sagar Taunk <sagartaunk2@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Sagar Taunk <sagartaunk2@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: workqueue: document SAFETY for `RawWorkItem` impl on `Pin<KBox<T>>`
Date: Thu, 30 Apr 2026 17:24:27 +0530
Message-ID: <20260430115428.48087-1-sagartaunk2@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `RawWorkItem` implementation for `Pin<KBox<T>>` left a `SAFETY: TODO`
comment. This patch documents the safety requirements that make this
implementation sound.

The `work_struct` raw pointer is valid for the duration of the closure
call because it comes from a `KBox<T>` allocation that is not dropped by
`__enqueue` itself. Since `Pin<KBox<T>>` requires exclusive ownership, the
work item cannot already be queued, so `queue_work_on` always returns true
and the pointer remains valid until `WorkItemPointer::run` is called, where
it is reclaimed via `KBox::from_raw`.

Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>
---
 rust/kernel/workqueue.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 676ade0539e3..7554601cb968 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -910,7 +910,14 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
     }
 }
 
-// SAFETY: TODO.
+// SAFETY: The `work_struct` raw pointer is guaranteed to be valid for the duration of the call to
+// the closure because it comes from a `KBox<T>` which guarantees a valid heap allocation,
+// and we don't drop the allocation ourselves. It is further guaranteed to be valid until
+// a call to the function pointer in `work_struct` because we leak the memory it points to.
+// Since `Pin<KBox<T>>` requires exclusive ownership, the work item cannot already be queued,
+// so `queue_work_on` always returns true, and we only reclaim the pointer in
+// `WorkItemPointer::run`, which is what the function pointer in the `work_struct` must be
+// pointing to, according to the safety requirements of `WorkItemPointer`.
 unsafe impl<T, const ID: u64> RawWorkItem<ID> for Pin<KBox<T>>
 where
     T: WorkItem<ID, Pointer = Self>,
-- 
2.54.0

