Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F265207DF2;
	Thu, 19 Dec 2024 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642532; cv=none; b=HC2HfhXcKBjT9uw41B7eBgbQDxWNbAEpr9E8/o20LShxzZlxIsc0H32MXNjImVIVjOBgcWBiLowE9G2XJXrANNb47WDZWzWmT8Js4bEgwgpewEE9pU6uJBYL8Q+F6811hFk5JKrQaA2hLS0Y6BEq1sv54AiDReqRiTcmqBjjhrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642532; c=relaxed/simple;
	bh=Fg46h50fzfyqtIe9aDLmvc/Zzgw12ckY/xFnT5ZEMe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L2x6GxZ89kGppYze4MG3Hu7IVCj4xRkQ85WtovRnDlOzoYvLCCDZTFySfb3qW8egVICG1Ga7gIxpwX04CfKc36okTdD68Yum1OI2i0wBwVLH6QTOWzERd43st2UdehnKSrn8kqt4EijGaHvL2bPJfv6OvlSaRVmUMWr49S3HZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5TKHPiD; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5TKHPiD"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21661be2c2dso10238205ad.1;
        Thu, 19 Dec 2024 13:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734642530; x=1735247330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8a+U3PThiCkoSQIjCSeZhobcfZFrIgDLb2tUjSaHx4Y=;
        b=j5TKHPiD50eex8hHULMDnT9MtFxPW7TWz+5R50/BJUTdKd4813OvmTQCQAw/TI+uep
         lnf4h0u1Tl3QmdDAJLLTdKYXUafFbX5TMJdEnhb/Oxj6uLby824Z4UhVyIgfmC8VfKbH
         LeJkN7c4Cg3AvIEwhZFUoj51h7MfTm8qw+iK6A7zSWXLuZEhM7wMv8QA+n074qarilBv
         DtppH+F+NFPHmixIDe8G+PWqUF22apoGLUqWU+aN2k72hcLPLQYWmZrUw1qBIsXQxM6g
         665ZeT8nHfWJtFlx+E6hofkiujk1hdH8NdTdMQBV8An/94Gin/ZnKAP+HdLxIHPiH8hx
         mfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642530; x=1735247330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8a+U3PThiCkoSQIjCSeZhobcfZFrIgDLb2tUjSaHx4Y=;
        b=ska2WD5qJDgnCEl5Aws8RZBWXs8SGwhuzeRbg3ta1ScsBCz/YqpD3r1x1dXUFqzkdE
         PsYvW/jtbH3xek62yRhy3p4pXHrLMrB2jttl1rnrzLQelzwKNW9oanwO9GMoau4oBvTJ
         R2v7HhxKZ1PhE4MnYyqY03Iz6C0sK3oJI838+EzK2P3t7I59S5DfpgZ2xlPN2rXDBJTg
         MXVAARHMD2GhjY7u+hwOAbxgAl5wlIciZaSnlZ0tVQlCmH82nuep0BCLdAY7XrsPspJd
         bNqoPHldoveTit7cGNhZSSXGCNBh22Tfu+EpZek/3D/HFKtPXjk8E/Z6oNr4C73gIFRp
         nVSA==
X-Forwarded-Encrypted: i=1; AJvYcCWsqMyrh5wavtBYGunkMn551YjNuako/76gosE/Ne9gfHp2JRv3NBXGwZwnhaGTbVm5kIA09/KLmD6cMcn/mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6/J6/yhSn29UI2RpozEhYIl2uXF7ZTi2An//pwme6qREI6Vdh
	fknH/rnxIGyis2UJxI6J5zb81nlilWRZDOFpuXwj9RFAFArR6EMa
X-Gm-Gg: ASbGncuV1jbYLTgsF8xDi28QEp+lCE87YisgMu9VbmYokozmdfM03oQVwLQnVO9c/LG
	Tfc4V1scXSSW0NT567GiVPknsXaRAZ6ITob5qQILEi/ePovXiC98SArccAQzrGEEFqjDa46ebe8
	q92K8+DcGhhEfrUKEZ2o6RYKtYVmjAIr8EzksBVaz/H9rVnrubYka16hPCpEtlzgdE3gqMOqq+A
	Z1xC4oOGzX2KSk26aAY/IGYyCwlKTQ+zgUGUOd28GTUFOx7fY5/1u3uy2AODqZnYQ==
X-Google-Smtp-Source: AGHT+IFlNR+5xs9cq8NpBSRrS++zF1DZpmnXPo5bkWp0elc/Vz4dUHAxNDYhcGSHRx+In+/jxMSo4Q==
X-Received: by 2002:a17:902:e5c7:b0:215:19ae:77bf with SMTP id d9443c01a7336-219e6e9df25mr3132215ad.19.1734642529695;
        Thu, 19 Dec 2024 13:08:49 -0800 (PST)
Received: from mitchelllevy. ([174.127.224.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962cc3sm16831755ad.28.2024.12.19.13.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:08:49 -0800 (PST)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Thu, 19 Dec 2024 13:08:28 -0800
Subject: [PATCH RFC 3/3] rust: percpu: add a rust per-CPU variable test
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-rust-percpu-v1-3-209117e822b1@gmail.com>
References: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>
In-Reply-To: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734642524; l=3571;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=Fg46h50fzfyqtIe9aDLmvc/Zzgw12ckY/xFnT5ZEMe0=;
 b=gRK8pwjQ4BF4Qdvi0zi3CaQNn7uKJ8Q0n/gQMpX5Cf5J3e0PE0ANTZflDXvPIbayToRUWQhb6
 +IFU6CcSailB8h8pm97y0hJlg8MH3QTdhZycACwBxubTmMZBxvl+/zV
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Add a short exercise for Rust's per-CPU variable API, modelled after
lib/percpu_test.c

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 lib/Kconfig.debug       |  9 +++++++
 lib/Makefile            |  1 +
 lib/percpu_test_rust.rs | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f3d723705879..75a91f1766ce 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2404,6 +2404,15 @@ config PERCPU_TEST
 
 	  If unsure, say N.
 
+config PERCPU_TEST_RUST
+	tristate "Rust per cpu operations test"
+	depends on m && DEBUG_KERNEL && RUST
+	help
+	  Enable this option to build a test module which validates Rust per-cpu
+	  operations.
+
+	  If unsure, say N.
+
 config ATOMIC64_SELFTEST
 	tristate "Perform an atomic64_t self-test"
 	help
diff --git a/lib/Makefile b/lib/Makefile
index a8155c972f02..0ea8d414763c 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -301,6 +301,7 @@ obj-$(CONFIG_RBTREE_TEST) += rbtree_test.o
 obj-$(CONFIG_INTERVAL_TREE_TEST) += interval_tree_test.o
 
 obj-$(CONFIG_PERCPU_TEST) += percpu_test.o
+obj-$(CONFIG_PERCPU_TEST_RUST) += percpu_test_rust.o
 
 obj-$(CONFIG_ASN1) += asn1_decoder.o
 obj-$(CONFIG_ASN1_ENCODER) += asn1_encoder.o
diff --git a/lib/percpu_test_rust.rs b/lib/percpu_test_rust.rs
new file mode 100644
index 000000000000..60df44332d7a
--- /dev/null
+++ b/lib/percpu_test_rust.rs
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+//! A simple self test for the rust per-CPU API.
+use kernel::{
+    define_per_cpu, percpu::cpu_guard::*, percpu::*, pr_info, prelude::*, unsafe_get_per_cpu_ref,
+};
+
+module! {
+    type: PerCpuTestModule,
+    name: "percpu_test_rust",
+    author: "Mitchell Levy",
+    description: "Test code to exercise the Rust Per CPU variable API",
+    license: "GPL v2",
+}
+
+struct PerCpuTestModule;
+
+define_per_cpu!(PERCPU: i64 = 0);
+define_per_cpu!(UPERCPU: u64 = 0);
+
+impl kernel::Module for PerCpuTestModule {
+    fn init(_module: &'static ThisModule) -> Result<Self, Error> {
+        pr_info!("rust percpu test start\n");
+
+        let mut native: i64 = 0;
+        let mut pcpu: PerCpuRef<i64> = unsafe { unsafe_get_per_cpu_ref!(PERCPU, CpuGuard::new()) };
+
+        native += -1;
+        *pcpu += -1;
+        assert!(native == *pcpu && native == -1);
+
+        native += 1;
+        *pcpu += 1;
+        assert!(native == *pcpu && native == 0);
+
+        let mut unative: u64 = 0;
+        let mut upcpu: PerCpuRef<u64> =
+            unsafe { unsafe_get_per_cpu_ref!(UPERCPU, CpuGuard::new()) };
+
+        unative += 1;
+        *upcpu += 1;
+        assert!(unative == *upcpu && unative == 1);
+
+        unative = unative.wrapping_add((-1i64) as u64);
+        *upcpu = upcpu.wrapping_add((-1i64) as u64);
+        assert!(unative == *upcpu && unative == 0);
+
+        unative = unative.wrapping_add((-1i64) as u64);
+        *upcpu = upcpu.wrapping_add((-1i64) as u64);
+        assert!(unative == *upcpu && unative == (-1i64) as u64);
+
+        unative = 0;
+        *upcpu = 0;
+
+        unative = unative.wrapping_sub(1);
+        *upcpu = upcpu.wrapping_sub(1);
+        assert!(unative == *upcpu && unative == (-1i64) as u64);
+        assert!(unative == *upcpu && unative == u64::MAX);
+
+        pr_info!("rust percpu test done\n");
+
+        // Return Err to unload the module
+        Result::Err(EINVAL)
+    }
+}
+

-- 
2.34.1

