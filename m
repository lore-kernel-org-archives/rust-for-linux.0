Received: from mail-108-mta140.mxroute.com (mail-108-mta140.mxroute.com [136.175.108.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E196B30DEC0
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 16:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769878066; cv=none; b=kmHF41NwlZ3qlcBQ0vL6bFukEpGI8hupKmB1QFswL+T3MbVqjPKZhWKwBQAfonKKrtXRVJpfwfee8cPVkVypCYEr67dYO2GU40/41e9xWca0ViefrbgIexUi7dMIrp3/AisbloZzZvYVXR9y8BeFpHMnRuRvILBdHfC7Mvm1VB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769878066; c=relaxed/simple;
	bh=umWhJFuAS1ToWYCThdrWAuklc0sVXb/QNkQaKYNursU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vCOxbl0Wns7bQC/QxfQ4K0QvmYQBCx5YrH0YrS/RHqncTH9pPBBoiMeEyqdKwMdMFBuLK+nhyZZIjgOOx7vistZvWSpm70I3LhiLCviNtyTcnLJGe5KQUJQFh0216GH35TU46gnuFiJIuuoFThaHlbf6ws72bYwod7s3zvqSRcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ry.rs; spf=pass smtp.mailfrom=ry.rs; dkim=pass (2048-bit key) header.d=ry.rs header.i=@ry.rs header.b=l6VeEpgy; arc=none smtp.client-ip=136.175.108.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ry.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ry.rs
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ry.rs header.i=@ry.rs header.b="l6VeEpgy"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta140.mxroute.com (ZoneMTA) with ESMTPSA id 19c14ef46110009140.005
 for <rust-for-linux@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 31 Jan 2026 16:42:31 +0000
X-Zone-Loop: daba3fde878b69b00a4c4686e50844cbcbd9a3ccd71d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ry.rs; s=x;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WD4VvadkwOK+JFplFLasnbYEL1wNfsFrAK5VP3T5xXM=; b=l6VeEpgy5Wzqr2vXSoBkNxaB2r
	UZHnkJbv/YRApMn0TYls8PcyEVaId8KMQiPSG7hmy+SDzby+rEV8rUTcKy3Gf+8j7rJTdHJfj8puK
	HIg0oiWO2kGF13iTxWOtiAPtT0cSs52jJBdviL1KV64wWS9DpKKs3JnOeSHlOgwew5HsTVB3ImJnR
	Sxv62qEzDuuHLM1jHdCpmk2GzMC10DKaZLXSEirFyQDh42IHNMJGwqmmZV1j//cKn9mV4V0mn+fML
	XMyaCA/HWwglkH2Yk63obAXyVpyCQTT2BzZvO6Ik8jhB5EnCWyKNi4wGn3K5XG+kPHLPofpV83xGg
	buOuooKA==;
From: Zijing Zhang <zijing.zhang@ry.rs>
To: dakr@kernel.org,
	linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: acourbot@nvidia.com,
	zijing.zhang@ry.rs,
	Gary Guo <gary@garyguo.net>
Subject: [PATCH v2] rust: pci: export ConfigSpace
Date: Sat, 31 Jan 2026 16:42:17 +0000
Message-ID: <995384df9224283fab185b5e06f519506fff1873.1769877524.git.zijing.zhang@ry.rs>
In-Reply-To: <DG2WR3EOBWCY.DU3K4LRV4FUE@garyguo.net>
References: <DG2WR3EOBWCY.DU3K4LRV4FUE@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: zijing.zhang@ry.rs

Re-export ConfigSpace from kernel::pci so users can name the returned
type from Device::config_space*().

Fixes: 4dc0bacb1d3c ("rust: pci: add config space read/write support")
Reported-by: Gary Guo <gary@garyguo.net>
Closes: https://lore.kernel.org/rust-for-linux/DG2D5ONS18FE.TC7K3O8V8SU1@garyguo.net/
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zijing Zhang <zijing.zhang@ry.rs>
---
 rust/kernel/pci.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index f347c2f7c3a6..af74ddff6114 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -42,6 +42,7 @@
 };
 pub use self::io::{
     Bar,
+    ConfigSpace,
     ConfigSpaceKind,
     ConfigSpaceSize,
     Extended,
-- 
2.52.0

