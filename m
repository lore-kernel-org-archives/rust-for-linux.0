Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE5721D3F5
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 16:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762620939; cv=none; b=u/YJmpUq55qMNfF0V2P1oODkHPBh5R3PTq9Oquho3wrVjsP/pVOzelUGwGrEdaGau1okI9SsPKURZM4Qh6OLwfA46fE6oDfl7mrW31DZkJwgGUMue/CD55LZVJE/swhQm3phUWJOpaiAm0oox9vhMQvwIK2y0ygIg/JUzfl506s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762620939; c=relaxed/simple;
	bh=F/nW1NwtC1Ruv5+SUxdP3bvOxeJUJ/xNQNgyzSwQrGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qS+/4mjb35uKKXohbnCLNuC5GV+BJvISCDN6RazkvR1MjENhBHgsw0rhY0kQV4mjA1DP5YMByaOg3ti37xtFUlkd68Kxf01Zx9OoEYUsgKpgkgTGRZYKe78JQT12GTfJgXW1qMiKB1F8wIwR3mwYNPxfYS55JhyNjSzCMAtGOxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwowBCnI; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwowBCnI"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7ade456b6abso1439576b3a.3
        for <rust-for-linux@vger.kernel.org>; Sat, 08 Nov 2025 08:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762620937; x=1763225737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS4aRaCWQbf8kHDxTXLGrz0fuyh4VU+l+vQ4w8/XelM=;
        b=gwowBCnI/eXquEcZRCF0m9wXyYWuVxDiS/PsgLn/nduxk9GfIQ/jXbeiCMGv9W9wI9
         TCHQl6mJWa9rJNeDNapIXUs0tCvPnMIZb7h/KzOwWFco40nFn615YdYBpc2Gqoy6KYz9
         37x3+oyfybVM4jJFx3Ck10+Vqy7fJe1KJz3DWA5QQoJFCtOT5NYQlVF2D4MCYQNP6WK2
         tD3IAH04ryV9Ua47bQVStIl20ZwM6H16IfwS1VDQAxVoHAORXVVRhbEo3It9D7Czo55n
         WpmFRD93l/T1BdPzTZfzSD/5INqpPA/5vyvnS1qKaDO/hiEbzVS5MpRwsI7ZRyvTNQvi
         ZETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762620937; x=1763225737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eS4aRaCWQbf8kHDxTXLGrz0fuyh4VU+l+vQ4w8/XelM=;
        b=w+NhcvYSjwoPkxtTICpj7uH2DLO82NnXaM3VL0XNU6YmylCMEUvmnQhwXI121C9w9u
         jR9etNPvjSaqKHEEPy16LxCgOEPp3+KrloTOM2Ny7Aendgi/N9k3TrHvXiRVVeSAa56L
         Wi6MQoWptzajB/y436j8ZBjM2lr1o+zCFOmYLXYK5WSJq1IdEYm8qETyWnTLmREmzp6I
         aXYA1GdJhkXz88rVjfZdpEoY37ROupKM7k1zkCrKCe/oKiZ/+lE+iNtCzduL9b1cym+p
         nzOl6aSnPuOdB+kblbkqZly3iCHdGPuwX9sTOM+K2R4gIDyuFavnmgRxBUvoza5WBW8r
         QXcA==
X-Forwarded-Encrypted: i=1; AJvYcCUR9AhhQXQ5+cnlLq51qdfLdiC6znc3K3fELMJ2kskAke89DIRTQPY1/UMO59ukl+bixxrKTTSqpi01X02Asw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwANeDDMBGHF59qlOTbGbQ6WRDZFnTZyz800WZgs1wwp74SLOtP
	3S0kUyyHufMe0RuUR3R3PAgXVGH87gOwh5Q/QoLKbSTSB0oT8Lwa7DQt
X-Gm-Gg: ASbGncsn6oVqj1s6Gh4ZcGsEQ9iotWGnwkvA+iUn7payIVYYZfPyiSwhvL0QOWTfRGE
	nw07agpSCuJeKCECMnDklTNeD7ZCEZdf9QuGYKF9VTdRCwOyIdeCmihkkbIcQT5OJrB+JVsl3J9
	NdO/9WQSm1V4+hbl+kzWPJeZ7MysyhpKIrF7sGuyvqatEncQuR8pR+xQ7Qu3z8/dnvvwSogO55r
	TudGZrJFLjZ5njExa5KF5uTEx3vsegA3dVMg7gdFr3bmiASup6ozlgDiZeucCJDF2JqWN/4bqeD
	HnC+0cXmOC0RD3HIfORTbchFkX0KvRdc9XNk1zAaK1qWWm8VVwtbU3ifFP/Byun/CBOJ5YnnokD
	5sWV/qwkzajA4Wu7u3kIN/nV0BO1dlG4SkO1yZ7ffybBiSi/+JXbGBs2eiEZ9pAAUi5E4s+m6yM
	XdjC4xG7u+fxZl7qDL8ZmVJFe49vL5kkSOUgdNX8w=
X-Google-Smtp-Source: AGHT+IEK4Id6LcZHfEegeQfKzSISCLsplggp/+eo2BV506hPPHU4/6C87PquIuahlXDd2KcpheJGdg==
X-Received: by 2002:a17:90a:d2ce:b0:343:6108:1712 with SMTP id 98e67ed59e1d1-3436cb8c2fcmr3407143a91.18.1762620937526;
        Sat, 08 Nov 2025 08:55:37 -0800 (PST)
Received: from localhost.localdomain ([119.127.199.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba901c3817csm8181254a12.30.2025.11.08.08.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 08:55:37 -0800 (PST)
From: Guangbo Cui <jckeep.cuiguangbo@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Guangbo Cui <jckeep.cuiguangbo@gmail.com>
Subject: [RFC PATCH v1 2/2] sample: rust: pci: implement dummy error handlers to demonstrate usage
Date: Sat,  8 Nov 2025 16:55:11 +0000
Message-ID: <20251108165511.98546-3-jckeep.cuiguangbo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251108165511.98546-1-jckeep.cuiguangbo@gmail.com>
References: <20251108165511.98546-1-jckeep.cuiguangbo@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds a dummy implementation of PCIe error handlers to the
Rust sample PCI driver. It demonstrates how to implement the
`pci::ErrorHandler` trait.

Signed-off-by: Guangbo Cui <jckeep.cuiguangbo@gmail.com>
---
 samples/rust/rust_driver_pci.rs | 47 +++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 11ed48dd9fbb..d575f84fde7b 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -4,7 +4,17 @@
 //!
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
-use kernel::{c_str, device::Core, devres::Devres, pci, prelude::*, sync::aref::ARef};
+use kernel::{
+    c_str,
+    device::{
+        Bound,
+        Core, //
+    },
+    devres::Devres,
+    pci,
+    prelude::*,
+    sync::aref::ARef,
+};
 
 struct Regs;
 
@@ -63,7 +73,7 @@ fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u32> {
 impl pci::Driver for SampleDriver {
     type IdInfo = TestIndex;
 
-    type ErrorHandler = ();
+    type ErrorHandler = Self;
 
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
 
@@ -106,6 +116,39 @@ fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
     }
 }
 
+#[vtable]
+impl pci::ErrorHandler for SampleDriver {
+    type Driver = Self;
+
+    fn error_detected(
+        pdev: &pci::Device<Bound>,
+        error: pci::ChannelState,
+        _this: Pin<&Self::Driver>,
+    ) -> pci::ErsResult {
+        dev_info!(pdev.as_ref(), "error detected.\n");
+
+        match error {
+            pci::ChannelState::PermanentFailure => {
+                dev_err!(pdev.as_ref(), "Permanent failure detected.\n");
+                pci::ErsResult::Disconnect
+            }
+            _ => {
+                dev_info!(pdev.as_ref(), "Attempting recovery from error.\n");
+                pci::ErsResult::NeedReset
+            }
+        }
+    }
+
+    fn slot_reset(pdev: &pci::Device<Bound>, _this: Pin<&Self::Driver>) -> pci::ErsResult {
+        dev_info!(pdev.as_ref(), "slot reset.\n");
+        pci::ErsResult::Recovered
+    }
+
+    fn resume(pdev: &pci::Device<Bound>, _this: Pin<&Self::Driver>) {
+        dev_info!(pdev.as_ref(), "resume.\n");
+    }
+}
+
 #[pinned_drop]
 impl PinnedDrop for SampleDriver {
     fn drop(self: Pin<&mut Self>) {
-- 
2.43.0

