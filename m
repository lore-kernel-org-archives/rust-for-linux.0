Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD6228DB52
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 16:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763397083; cv=none; b=hyJzvLRO4Iz0AmaP9FUfVLWqVEXMklaAy/ZtFygj1J4ArXOX+a77ZeDYN/ANqQNZTJBnrd4uaE8F9JlUlUDz8pqpHAVOJd8VNxSMItn/Tk/3ezfAbNmdMWlfvCEfvDqv9CBjQMcyjEFJDWjck348hB5+h2Pr+djqzCsD5wMvSvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763397083; c=relaxed/simple;
	bh=P1MZAm81otMVfmj3aAJ5VlOrQbBFFX0u8MMGfZDqy90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QADA2HmAqchJMneRpmsS3OBTO8v8o9TGVjETU6bLV/VxgTBA4XCgAtZLSPbbAy6tRz4S9LhLoVT6+ohOE2Md/8Qrf5UcqFsbofp6GbibA/PCBCzMYGVzRMxCPW5/cxNaLveKaiawZaZr2bT1tyMoQ4TZahoXZbul2gG0voli5do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=ki6b7eFh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="ki6b7eFh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso12969365e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 08:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1763397078; x=1764001878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4DX95ACEl2sMyiSBBnEaP2mtNxGCrrvr08or6CaRjsk=;
        b=ki6b7eFh4aFMNRUba4U20HlmFTE1djE36ZU3HixxALCHlqCChTzRlC8YAT/YHAlpfN
         ID2P8+bslI3NjDOieXDYXbUEm29zSuKTU9RBi0Xyc8IkYpCXBPKoGcGe8LQG7jzr7Qp6
         EY20BS/uZWzCPThNudNU7pX20Vchh7r0JgNsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763397078; x=1764001878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DX95ACEl2sMyiSBBnEaP2mtNxGCrrvr08or6CaRjsk=;
        b=jpYKa6VFi38bS/pFWEI5v3JKo/mAgVsLG0DnxJsikHTEACZcjEkwf+ZRiwVnni4x8S
         RAS9uw2M479mdVrHQks2HI2E1ziYVrWeDUmjLpPKpfTCri9rmAH6MUC+GD38kK68A4Mh
         U9hMZQ3n7c9KesPI5Dd3FDVQsLm/bdOMYo/5hBA1q3inh/DacSxRKwrl6Vp8ngt0F93p
         daH9o9jEZQGOvPIVS63/1tpsoNr1T2X3DYFtZGZWYDXs+y3MGb80aNlH55JK/yK7ioEH
         n66u1Y7SneS/+ecmujT9KWtLwJRqBHN43Vq22Zsu+jEGFWfNa3VnKkD0rkCEYcY6+jtY
         JuyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc1zzBeITnMhSHNgQxo9PTO1S6+CZSSzGxJYtyQCdkXWP6zpbu7Qgix7ZtazA+h2iTalcnB7WdhoNSObvJuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNF47ESqY7M6nT0siJ691VHTwK6PwEFyZNSimnLiozzQY4xQSf
	gJAD0p1MBMHifNcIQdBy3TI5PhxObXQfDSt4hZDS7o/L+ynexu2utR+dUOVkhNdevsQ=
X-Gm-Gg: ASbGncvqk5ZWz1Zq4EfB53zJjTA4asp3muf6Kwe+LR2AfSfHVVRa3Pu6toTRZ3HaCBI
	ObxB0DypVRLIzS8cKLfUzGJiQLRrpMe7pW7tgBPURSM+VhMLro6JY+PA4m6DyxVSf3bSk97BTPX
	v9SL+IXcy+HB1VtoV6MDt5Yxa4wJkeNw7K5sD3I2162E+8LlTMjFnHZC9AroBZvdOwfuNX3CkCr
	yLbGBzF3xNfjjouplL2OJHzMcVP5zSA4xIr5rPyCEoNdFUlvZJXWWrpOrH9kHzw1pdgM/8v5xJa
	7zNo8x+w1JDDXrx1Hy6/5vuALj+rVon4tFHWizZHj/0XLwyyZ+DU43pexdkZLgTUEgaKsdqPyeM
	8AJGNWTh0fxfkqbrYLcjBvjl2fZgHhLG6JnwnC6xY4H7cpfkLeBt3VFTmDzTrEPeon1Y+AGvw0R
	mbfQDoacXzsRV11/zk/ttu
X-Google-Smtp-Source: AGHT+IHN6AVLqRDKRTwuYX496/3zJioUOD2G2C9SjVKojCKtxxQymtbr9ip4A/HxGO0eqkn3WkEgjg==
X-Received: by 2002:a05:600c:1c88:b0:477:991c:a17c with SMTP id 5b1f17b1804b1-477991ca3f3mr91614505e9.6.1763397077505;
        Mon, 17 Nov 2025 08:31:17 -0800 (PST)
Received: from fedora ([86.125.45.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477969b3c12sm149548425e9.13.2025.11.17.08.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:31:17 -0800 (PST)
From: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Alexandru Radovici <alexandru.radovici@wyliodrin.com>,
	Fiona Behrens <me@kloenk.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH] rust: add a function that returns a reference to the IO Ports Resource
Date: Mon, 17 Nov 2025 18:31:12 +0200
Message-ID: <20251117163112.22515-1-alexandru.radovici@wyliodrin.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds a function to `kernel::io::resource` that returns a static reference
to a `Resource` that represents the IO Ports.

Without this patch, there does not seem to be any way of getting a
reference to a `Resource` of the IO Ports. This prevents anyone writing
a safe driver in Rust that requires registering IO Ports.

Examples are drivers for PS/2 keyboard and mouse or any of the
QEMU x86 debug console (debugcon) and exit devices (isa-debug-exit).

The QEMU debug devices are one of the simplest drivers that one can
write and are good examples of the Rust Driver API.

This patch has been inspired by the work at of Daniel Almeida and Fiona
Behrens on the Asahi Linux branch.

Co-developed-by: Fiona Behrens <me@kloenk.dev>
Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Co-developed-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Signed-off-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
---
 rust/kernel/io/resource.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index bea3ee0ed87b..293b330c3d6d 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -18,6 +18,15 @@
 /// `CONFIG_PHYS_ADDR_T_64BIT`, and it can be a u64 even on 32-bit architectures.
 pub type ResourceSize = bindings::phys_addr_t;
 
+#[cfg(CONFIG_HAS_IOPORT)]
+/// Returns a reference to the global `ioport_resource` variable.
+///
+/// This function is available only if `CONFIG_HAS_IOPORT` is enabled.
+pub fn ioport_resource() -> &'static Resource {
+    // SAFETY: `bindings::ioport_resoure` has global lifetime and is of type `Resource`.
+    unsafe { Resource::from_raw(&raw mut bindings::ioport_resource) }
+}
+
 /// A region allocated from a parent [`Resource`].
 ///
 /// # Invariants
-- 
2.51.0

