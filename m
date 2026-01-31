Received: from mail-108-mta239.mxroute.com (mail-108-mta239.mxroute.com [136.175.108.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A732DB788
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 11:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769858814; cv=none; b=m5O2c0L5MysEWOp95JjT55L8RSzVO7IfaslmJWBtRLub5rdEzHd/BUFjNAmVScKL9/L4tWIvivz2mdVoiFYhtmFJO61n6A7VGJjfItL+FAoixaemGD+ud3CLLPT+zLoTgExClBSlT2yUtLa9LbPOexiQxuTwY9MvwDSyJ1l3SmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769858814; c=relaxed/simple;
	bh=+YPOxIe0xiBdpY6okTZcB+/LRK8YQv6VR+EHa56dYS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5ajYII/MCXF/i14N8itHX2Qotck/jyHur04dYhE3M9dq45snypJibt64KpTauqDgl54PIPSlXNm+azCi7Hm7jweIO9l9Xyu+XR3g6R7ecuahfT9h0nodi5p6u/hFAbZ+xeB/SCAWKCAZw5mQXfvlXDEdjojdd1fv6/NZBCEuBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ry.rs; spf=pass smtp.mailfrom=ry.rs; dkim=pass (2048-bit key) header.d=ry.rs header.i=@ry.rs header.b=Jjp2WWws; arc=none smtp.client-ip=136.175.108.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ry.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ry.rs
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ry.rs header.i=@ry.rs header.b="Jjp2WWws"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta239.mxroute.com (ZoneMTA) with ESMTPSA id 19c13c985900009140.007
 for <rust-for-linux@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 31 Jan 2026 11:21:39 +0000
X-Zone-Loop: c4d36220759cf3fe47d6c5da630d4f0517bf8144ea31
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ry.rs; s=x;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9A7124bNJb8mIAjALQC0QkcJ7zz2h0vHdh2nA2QBHm0=; b=Jjp2WWws1Bm1l22rYWe3lNyEGx
	pkga9jq5hGdCcJoK9uWsgseQhM84ZH28lJn6ktZqDwQT2UGuu/BhM9ydJnMmE8HrmvyRQebvXkDKB
	z8QuKvHIcBXqSv5hEroRStcCN43V5+B6/553ezbN/i9L8Q729XmolLmLmk59a0HWvsqJ2begUiX5C
	csIOK7Yd6rfqcgCRtumqgs2FsXiqkDWfus8bMW7H1J+Ytk2vosyPlDtRMEq904FWz87e86fqRwwny
	wdt7VKTWXOZwryUYsu3dFWSybHcjbsRwzDRTxIwgZO+6P3BWs/dk0/f6OYAp1jl2ftKyllmeCzNkk
	mmU+HM5Q==;
From: Zijing Zhang <zijing.zhang@ry.rs>
To: dakr@kernel.org,
	linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: bhelgaas@google.com,
	kwilczynski@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	Zijing Zhang <zijing.zhang@ry.rs>
Subject: [PATCH v2 2/2] samples: rust: pci: exercise capability iterators
Date: Sat, 31 Jan 2026 11:21:17 +0000
Message-ID: <20260131112117.1361425-3-zijing.zhang@ry.rs>
In-Reply-To: <20260131112117.1361425-1-zijing.zhang@ry.rs>
References: <20260131110737.1356432-1-zijing.zhang@ry.rs>
 <20260131112117.1361425-1-zijing.zhang@ry.rs>
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

