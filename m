Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013041.outbound.protection.outlook.com [40.107.201.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14F933689A
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 05:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773640694; cv=fail; b=PTB5qC962azojfm0O7Qh+0H029Ia4o5tSdoQBYPRbfoPH6KoXzVFfLKj9hEz22sZX74sp1iCKZZXDfBhF5oPx2lC35TiqTJLkwuXbZhimjF9ej9dUArqefvui4HlGI3QeN8AoaplG2a/yYExd3R3tFd0PAyTuXruLnM1uqH1rSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773640694; c=relaxed/simple;
	bh=zdLSZz8HxxN3kJdOspYvokBL4TRujvpcWs5p02f64HY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qhEPSKmbwFBHGu0m8QmLQXgujQNcFgstO5Ke3iDdBt6eWFfA+SHonbVDkfGH7+lUmq6LeGKG69sq/VZcx9as5CaJluYbNmDISDYABvhym8unT/sSZ6m4GJNHTHgKE7b6RVzMDcPNrsIQXjqChmkr0VkXzJWamhvb8d2BbHmbrNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fyoXTYP/; arc=fail smtp.client-ip=40.107.201.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fyoXTYP/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHe/bucPve5J7DXU4fbujVbexihNU7uIBin/wB7ceE4v5Y/d71eoFPLwBDWbcDxzR5AmxNRI2UnUGi1htBcf6MIHUSwiDnHCnGmuQvM+3giMlLTMJncb7k3ky1FckxEWWNDs0fGt8nCabuNVZD4MOeBRLF1NhIecHpzxsKP6ln65mCloujcYXhVHtaTyO0K9nH0ji9+PIb0YWN0ePtnuTQeFk67Zv/RKFZiQt/i6SMQRZV5RxQ2Z/17YZCeBVZbjs3tlcYql2mpfDrvKQhhmOAlXNDUJG+fWkWs+r/3Bc+0y4RFKZFwOnkZnnqxY6jQkNvH9xXQH4XSh1/36hIzvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xpz1DDZhiVapdRZ+VY+5wFdAAWIPJ3uBG5Ek355i14=;
 b=MIY22CCf+C5TuSg0EZQY0U2KBSy+c9m3OtKVVuIqAKMccHj4Mkch5dq9z53EMNOHTe1Jcix9GZxhP3YE5YCH/xvAqlOmDQdxgFXocL5fGle4Ls4TLbYHKA7J7AtuVyXK2gAH6tVIAW/uJ7DvjhwiyyV6LOVqXDazsUonDKpzh1Dj/e+5ZmUBOWDCh+XGfFxAYl5s8QaKUgnD6qV568XjuS22/5S3r/HdutdzD+zaxmAZ5KZ/fiKjD758MrRplb366k4K0xY04Vd0ZdhDPSFrtZBMGbpRTsT4s54uFH2gXDepUXc+Yht7XEIy+Fai422z8TaVcl5ruLj3+LRrOrNeNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xpz1DDZhiVapdRZ+VY+5wFdAAWIPJ3uBG5Ek355i14=;
 b=fyoXTYP/XvNcTM8k247KK1uX5SGBSUSJXWxTkbRVlP07e21jrpUm1TOrdP7/+nBnNql5hutz9fuAMl87z967XGz4+2QZU2vHM/nize+ia0Yks3Fscc+V0IoPvEloE2pUqI9jSvwPkXbW7SbDLyM0zKsDZQhqLkznO8s2N3ZeYPwkR15ZGYQqSsbITKt5EjAZWTdCFb7RwJZVp6tyqSKsMqw8xV6bw8lyf5rCd3yS6IzvcxSWjeVl5U3KALN/XSrpKwfZ/+0T1Ac3wo8p6cqo6x4TAYHKT6h8C6vGNUgPmEhMib61dFKtRbw3t901Lx4vEyIfumW2Tr9YdlQBlmLhLg==
Received: from SA1PR03CA0017.namprd03.prod.outlook.com (2603:10b6:806:2d3::13)
 by BL1PR12MB5994.namprd12.prod.outlook.com (2603:10b6:208:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 05:58:08 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:2d3:cafe::c7) by SA1PR03CA0017.outlook.office365.com
 (2603:10b6:806:2d3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 05:58:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 05:58:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:52 -0700
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:50 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v9 3/6] rust: dma: implement BinaryWriter for CoherentAllocation<u8>
Date: Mon, 16 Mar 2026 00:57:33 -0500
Message-ID: <20260316055736.1690546-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260316055736.1690546-1-ttabi@nvidia.com>
References: <20260316055736.1690546-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|BL1PR12MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 766a6de0-5a4c-4d36-6f5a-08de8320ffcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	jFqV8aTydX2HxrvGfAhSH4/pjU5dEOJ7oIGZglKAviQ3l8TLC+PuYDHPrffvn5hM/g9AqHJgRI07Jh5P0u5XZQdgLcHVardFIGB+N9t5AocEAOUe0zQOxKFOmxMDNlIQF8F2js3jaNLtZfw9cEDvzaHa8lIB53hHY63HRN5q5/KarejYoa/nf1rYHMGJbwbVLfH5KZJmRb650iif6Z8qh28REtrXnTa/ZtHHnttekis1FcUugq0Sl80M3HykAT1Cn7IPSIiSeZqP4HjE270Xqo5LOfAJ9bRRj/DradUhO+8Da/g7kvBKEMZu9Kgxgm8sst/7gu081H3SIvhbmJ2FdZdYKXAZ3Tuw/3hh9oEkZosO5rpshgkgVl7Hbip/h4MZler8esGLk5H5bJs+v3vZXbMcyALxHG2WChpKf2b5luQWQxd2MU+jFqCLkBZ/a/wfeGfO+NoUtIJc1vOzgBiKLlmzB4aWMgBj84SBSTDVMJjxkAsJ4LnYe5hpb7r+O+FA++G1U0tvX6d6fxUBNjOW5JhZkWlr8InqEfLu6liUxCIFVeH2skcOmKnhJUrxW0oPR5RFlwZZ/G+lng03YV1+oJcC2u9V+z4Kiezfd25Un2fsVuYvLPVdW+appiA5e5MslE2s1trjVfeWRId9o9Fztx7lAvDufeW3xRnSlmjMxGtDoth1zyLSy4FRBxYa9sDXxZhOYtYK0t5Bsjmcxqe/jx3SHgvJsCE1avHoXMegPrgF/PPfScY+MnYekPmDEt1R/clEmTqvQFO8h00bZWcWSnm847mdKFAk1Bite5hP4hFVMy//M4rIHHfQwmDXjI/j
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CyqL/vIznD1ItyQdUlpeetyOHxAxze+Bwn9aIS+ZuPYDQkyl7Yftbt0SNMM/Ds0p1LiNceDaJvWHJq2NEco+D4psFffHyN2aolZPrvzQ0mZnTChLlTyKrTtfkDKQmgoZEhCAyyOzvUMGgimpkiSWZsD5kNft6ihrOJBI2lhPZX828k9SPW6KchLgA54Y9tHxBx/6+hsK0bvExqq9rBHOSkoxF1CPvgIMC4u3XH1UhBmxVtP69oVevlP7Yq9HLylVCS/l5ZP6tNmtq8xq5h9ZntnnYVkK+hVk5eWsGFV70njSYpiZU7WjTS+aoFcC0efyek0N3nhuTCsS3jF6eaiRVSNSpwpvjlYPAq+hesL9T+yPdCAVkE7DMhCo1jBfxEQ5eJMe7vwSYcuUL2CcezbxdWAjGLlnR1CKI7zQVNMPrct48lbZo95mM+dT0mDwFw+W
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:58:08.5746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 766a6de0-5a4c-4d36-6f5a-08de8320ffcf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5994

Implement the BinaryWriter trait for CoherentAllocation<u8>, enabling
DMA coherent allocations to be exposed as readable binary files.
The implementation handles offset tracking and bounds checking, copying
data from the coherent allocation to userspace via write_dma().

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/dma.rs | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 909d56fd5118..b38f16fc6c66 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -5,12 +5,14 @@
 //! C header: [`include/linux/dma-mapping.h`](srctree/include/linux/dma-mapping.h)
 
 use crate::{
-    bindings, build_assert, device,
+    bindings, build_assert, debugfs, device,
     device::{Bound, Core},
     error::{to_result, Result},
+    fs::file,
     prelude::*,
     sync::aref::ARef,
     transmute::{AsBytes, FromBytes},
+    uaccess::UserSliceWriter,
 };
 use core::ptr::NonNull;
 
@@ -668,6 +670,37 @@ fn drop(&mut self) {
 // can be sent to another thread.
 unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
 
+// SAFETY: Sharing `&CoherentAllocation` across threads is safe if `T` is `Sync`, because all
+// methods that access the buffer contents (`field_read`, `field_write`, `as_slice`,
+// `as_slice_mut`) are `unsafe`, and callers are responsible for ensuring no data races occur.
+// The safe methods only return metadata or raw pointers whose use requires `unsafe`.
+unsafe impl<T: AsBytes + FromBytes + Sync> Sync for CoherentAllocation<T> {}
+
+impl debugfs::BinaryWriter for CoherentAllocation<u8> {
+    fn write_to_slice(
+        &self,
+        writer: &mut UserSliceWriter,
+        offset: &mut file::Offset,
+    ) -> Result<usize> {
+        if offset.is_negative() {
+            return Err(EINVAL);
+        }
+
+        // If the offset is too large for a usize (e.g. on 32-bit platforms),
+        // then consider that as past EOF and just return 0 bytes.
+        let Ok(offset_val) = usize::try_from(*offset) else {
+            return Ok(0);
+        };
+
+        let count = self.count().saturating_sub(offset_val).min(writer.len());
+
+        writer.write_dma(self, offset_val, count)?;
+
+        *offset += count as i64;
+        Ok(count)
+    }
+}
+
 /// Reads a field of an item from an allocated region of structs.
 ///
 /// # Examples
-- 
2.51.0

