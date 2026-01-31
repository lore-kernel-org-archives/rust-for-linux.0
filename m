Received: from mail-108-mta156.mxroute.com (mail-108-mta156.mxroute.com [136.175.108.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BE12DB788
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 11:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769857675; cv=none; b=PpazWLVu405f6ZnehJJ7/vsrKtrGHaUJeq4FfwYvSalNth7Ey4Zw7LhfR/QNw2e3JMX1zlrKuSI7g5VDCuIefgNh2/UR/8lGJ9YbvzZ0m7faX3mff9nQ4rnlEySJQ2HeRCicp1VEW0e6bttLom3uI6iRBytP/aDJFNpA2tVKPus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769857675; c=relaxed/simple;
	bh=+YPOxIe0xiBdpY6okTZcB+/LRK8YQv6VR+EHa56dYS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GumVXxBn55nkvSuPvX9Fxa/OgCZYHthSUOwe7EwTQPlQlooMVdA7awqlKKg7IWEprP9+i+LIjEzEE1QDcsjK7jeXttVq6Qk351Tb7ESAIj9B4c9kwjdREBaa5jJ4ewDPRNAN9TlElifgU0TBDsR6aMYj8FVTR4Fr2LM92u7Zfh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ry.rs; spf=pass smtp.mailfrom=ry.rs; dkim=pass (2048-bit key) header.d=ry.rs header.i=@ry.rs header.b=DYTDsVif; arc=none smtp.client-ip=136.175.108.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ry.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ry.rs
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ry.rs header.i=@ry.rs header.b="DYTDsVif"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta156.mxroute.com (ZoneMTA) with ESMTPSA id 19c13bce3ff0009140.007
 for <rust-for-linux@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 31 Jan 2026 11:07:52 +0000
X-Zone-Loop: 5112d7665d46bc08cba363a3ccf672effe93455f7de3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ry.rs; s=x;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9A7124bNJb8mIAjALQC0QkcJ7zz2h0vHdh2nA2QBHm0=; b=DYTDsVifZLMjXoKsJqTR1BpGGo
	2F9QCeiX9dFAatudjSu4qygK5O1GRPbftN7qhbaF4EZlT6l5AT36fiVbL9QW3QMZsBMTOfHJ7RL8Y
	hk9XRn8bc1xazsVf9xcV7W88Eh31z19BIEMdRElglmPMExoT5NDqynYflgc6xnjZvvSvE4P6JDWhI
	jjcaLjIV0Pb37LF/Ig5KVths43puBrbim18Inp4LtBU9lzmelznMB64vfAu1FGBxbSRLFReQX1MYe
	r7rXmb96a2i+DEao2lvDSU3Q4GJIfHm2K6GKi3mY+ZX4ojG7DDXIsZavIKjgqQyKQRDOqJnqpjOMN
	hOyMDQpA==;
From: Zijing Zhang <zijing.zhang@ry.rs>
To: dakr@kernel.org,
	linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: bhelgaas@google.com,
	kwilczynski@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	Zijing Zhang <zijing.zhang@ry.rs>
Subject: [PATCH 2/2] samples: rust: pci: exercise capability iterators
Date: Sat, 31 Jan 2026 11:07:37 +0000
Message-ID: <20260131110737.1356432-3-zijing.zhang@ry.rs>
In-Reply-To: <20260131110737.1356432-1-zijing.zhang@ry.rs>
References: <20260131110737.1356432-1-zijing.zhang@ry.rs>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: zijing.zhang@ry.rs

Enumerate capability offsets via the new iterator APIs and print the
IDs read from config space.

Signed-off-by: Zijing Zhang <zijing.zhang@ry.rs>
---
 samples/rust/rust_driver_pci.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 7e7a3b82b858..4a133bc066d8 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -133,6 +133,14 @@ fn config_space(pdev: &pci::Device<Bound>) {
             dev_info!(pdev.as_ref(), "pci-testdev selfcheck: no cap list\n");
         }
 
+        // Exercise the new capability iterator API.
+        //
+        // Only log a bounded number of entries to keep output reasonable on real hardware.
+        const MAX_LOGGED_CAPS: usize = 8;
+        for pos in pdev.capabilities().take(MAX_LOGGED_CAPS) {
+            dev_info!(pdev.as_ref(), "pci-testdev cap @ 0x{:02x}\n", pos);
+        }
+
         for (name, id) in [
             ("DSN", bindings::PCI_EXT_CAP_ID_DSN as u16),
             ("SR-IOV", bindings::PCI_EXT_CAP_ID_SRIOV as u16),
@@ -186,6 +194,12 @@ fn config_space(pdev: &pci::Device<Bound>) {
                 "pci-testdev selfcheck: no ext config space\n"
             );
         }
+
+        // Exercise the new extended capability iterator API.
+        const MAX_LOGGED_EXT_CAPS: usize = 8;
+        for pos in pdev.ext_capabilities().take(MAX_LOGGED_EXT_CAPS) {
+            dev_info!(pdev.as_ref(), "pci-testdev ext cap @ 0x{:04x}\n", pos);
+        }
     }
 }
 
-- 
2.52.0

