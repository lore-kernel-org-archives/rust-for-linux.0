Received: from mail-108-mta14.mxroute.com (mail-108-mta14.mxroute.com [136.175.108.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6DF20CCDC
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769872707; cv=none; b=aiyoo17cUXM56AYBlZbQ0o0jC2UfcK5/xdaIqsiy4I/OyeA2nqOEr8P5Z96U0YmN88Me/d+ACM0z4dq3UGczFMTMGjT0avgUIeUy8VYvve4GsAFF4e4r2SN12XH1utrMBtyFs77mo8v3fwcwtdn/k8sYnqsaLmc3qloexyX3m9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769872707; c=relaxed/simple;
	bh=adLJQq5kdDB7eqRlcVlV7J8uE4rCE85BabWhRAKVNYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBITlJeobZuBZBUv7RdkQ3UFNcKNus/0Mexfh1/XZWSIuNEVa0p9ei7QtNN+Hv3d8z9QXIrg0mVX9Wwryxr2vyhryu/1Yjd+pEbH7I4ivX5e4cMOwbO9+8t1F4+JvA0usuCLuNJ9mViFiIq1k95YjdVjGy+jd30cSti2rjxlTH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ry.rs; spf=pass smtp.mailfrom=ry.rs; dkim=pass (2048-bit key) header.d=ry.rs header.i=@ry.rs header.b=Fzcss452; arc=none smtp.client-ip=136.175.108.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ry.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ry.rs
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ry.rs header.i=@ry.rs header.b="Fzcss452"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta14.mxroute.com (ZoneMTA) with ESMTPSA id 19c14a2446b0009140.007
 for <rust-for-linux@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 31 Jan 2026 15:18:24 +0000
X-Zone-Loop: 877c4f273411711fe6541bdb6f4e11aef3fdc304cfa1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ry.rs; s=x;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=kXvQuDQBnPZwPHIrU0l0kgDJRHgAmMj+MBTr2sS6MPY=; b=Fzcss452gbEGCpdM2j6k+yyJrJ
	OT8uoYIXk/LxCQSiXam6heVFLhodOoiNXFjaVY36xMhltgLkaKXvFq7eMTgooXZ8xFzkkvq21gOsV
	59tW4mQGdryzIHS8HYWC30p4w6l1H7YS8x4yob1EI6ZHVRwdTTp44PAZ4zw1LILEZf5zAj3gyKEMq
	hRkqzl/+cirkQrfRlCrAt5OsYWqYiZxqhyyYKMRZUH3KIAeqTa5Wu9HVOxbsz4fEt++19elwwNDq1
	56x8oMYdRxbt+BRG2WyXmhRCesy542W7TuoOThy8e+TnzViDzUJtemBr9xUokIXLUWX1MDs2MrxUp
	HIZHze8A==;
From: Zijing Zhang <zijing.zhang@ry.rs>
To: dakr@kernel.org,
	linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: bhelgaas@google.com,
	kwilczynski@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	Zijing Zhang <zijing.zhang@ry.rs>
Subject: [PATCH v3 2/2] samples: rust: pci: exercise capability lookup
Date: Sat, 31 Jan 2026 15:17:49 +0000
Message-ID: <20260131151749.1444030-3-zijing.zhang@ry.rs>
In-Reply-To: <20260131151749.1444030-1-zijing.zhang@ry.rs>
References: <20260131040200.1242566-1-zijing.zhang@ry.rs>
 <20260131151749.1444030-1-zijing.zhang@ry.rs>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: zijing.zhang@ry.rs

Use the new pci::Device capability helpers to locate a few common
capabilities (standard and extended).

Also try a best-effort self-check to exercise the `Some(offset)` path
when the device advertises a standard capability list or an ext-cap header.

Signed-off-by: Zijing Zhang <zijing.zhang@ry.rs>
---
 samples/rust/rust_driver_pci.rs | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 5823787bea8e..aea7d5cbe421 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -58,6 +58,35 @@ fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u32> {
 
         Ok(bar.read32(Regs::COUNT))
     }
+
+    fn log_capabilities(pdev: &pci::Device<Core>) {
+        for (name, id) in [
+            ("PM", pci::CapabilityId::PM),
+            ("MSI", pci::CapabilityId::MSI),
+            ("PCIe", pci::CapabilityId::EXP),
+        ] {
+            if let Some(pos) = pdev.find_capability(id) {
+                dev_info!(pdev.as_ref(), "pci-testdev {name} cap @ 0x{:02x}\n", pos);
+            } else {
+                dev_info!(pdev.as_ref(), "pci-testdev has no {name} capability\n");
+            }
+        }
+
+        for (name, id) in [
+            ("DSN", pci::ExtendedCapabilityId::DSN),
+            ("SR-IOV", pci::ExtendedCapabilityId::SRIOV),
+        ] {
+            if let Some(pos) = pdev.find_ext_capability(id) {
+                dev_info!(
+                    pdev.as_ref(),
+                    "pci-testdev {name} ext cap @ 0x{:04x}\n",
+                    pos
+                );
+            } else {
+                dev_info!(pdev.as_ref(), "pci-testdev has no {name} ext capability\n");
+            }
+        }
+    }
 }
 
 impl pci::Driver for SampleDriver {
@@ -89,6 +118,8 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Er
                         "pci-testdev data-match count: {}\n",
                         Self::testdev(info, bar)?
                     );
+
+                    Self::log_capabilities(pdev);
                 },
                 pdev: pdev.into(),
             }))
-- 
2.52.0

