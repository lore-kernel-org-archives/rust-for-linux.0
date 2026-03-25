Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAE530E0ED;
	Wed, 25 Mar 2026 03:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410812; cv=fail; b=buB07TDQD6PebaA6sWmt1mcBrL8kZ4IeBg56e6DiIMxjicLsbM5gvrkW1Q/ov5RG96D1RM2XhAaLm7CdTTqttX5iGITiUHbX0F+kRiR0KVtK6Cwp7AIYI96EJ+VusVosGLl1Sse0bMOjPD2mGV2HXIAqVgdyL2tKsS7GZDDdj9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410812; c=relaxed/simple;
	bh=+IC0Mo1cs3wfLaj9Z2fd2QPUI2Qr+f/SGAtC19nrweQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PpvVGUsBljHe08z2te47AcDZMknOYv5Qa7Wa+gYf/tszW8Bs3KLhVP+SRqExpPnK3Lcwf92ffL9p9PX2N0fvj8LTYzToKVzF7YSwebbdGPZvYOvC5uF62fe0VayaTMCWuAAHuhrRet7oVVbb7V/qGaveqNz6LMEHStQ3S+aWhvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A4ZoQE/k; arc=fail smtp.client-ip=40.93.194.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A4ZoQE/k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHxhp/X22qObYFb74i9BOfWjCFso9bP5k89CWaQLH6K9qArqgna3nvO6iu9kxbGf2moX0GxhcTeqW1xohc0e3jeRBU9yMB1nUPrj6KTij1pANE/YvkMCMD9/IpFdxEOo/fi7omgXShxLZpkiveKcq8LSWIADpGSeo9CwZG+DrNHW1/ZcIE+gAPF6GknHyRyheAb/pfu1tHr2OkBDnIgekIK1zdi81w6dxUpRxXU8t/hnWZWiqOwA1c2jdy65ZDTfp/ztnmhQEOGQ4Ft66VNeFy+o6COP/1SauePqWyGnpx1W8OLMGwSxWLSQRHq4ivHY0ZABuPqt+GmzEJeD/lYyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoaXFU0NV+okSE++bHw5JEFiOes4s6tONR8abgYwFeE=;
 b=VkOLwTuw1DyJUgeuYQ0OtacFKnfhY6+bT1K9jFS0/XUcwHgVH9zs+8t+9MGFoxNdAF7n0sqNadEHG6X+yWcfIU3ti+8yB6JINe4CMdSTEnyq9asoGJV7w07H/tGq+2IsxTZr+gyynNqJQgZkTA6KwhnRGdow7y2hPmd8Rr08sNiy4cJCuw7E42j7j6u+2Xasat0X3FXH6lq6NmYYj9YyCsaOO0tNseURsNug1qGbNdvnpldzOTCSDx4yLs7KxkTPrDdstFjaIST3Y5c6qiAl0j0ki2ouCIkJXVc/TM5R5YfgWYIjeSOBFIdEnX/W+1mck0GNxgy+Hu7tsAJFZijDSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoaXFU0NV+okSE++bHw5JEFiOes4s6tONR8abgYwFeE=;
 b=A4ZoQE/kd1dm3HzvkDYkrxvzXsr7fX0xrwzRPvJLRYIzD7LN0NaA6C4ywonan7Px+wNDDhB8MA8JamTJg4LCfM04K6SZbzqg0Vh58nMCDkC4lkxpYWK/JvolImAnRiHqG1JZNzFkWkczfDbEap9yzLAzUH1LMlwCV1VKiG080dXsUc6HtT6FIBZxWAJaVXFxaJZGwI37UVFFGmvP+HRxLivj4yxGrA46SCrpXAs52D4MDCXYnMNOB7AywFSFWXzvDeKaIzod8HH8U40FREpCy0qeK8m1Ypf+WMfnQ8kB3zXU54asVyVVqc0a2GiTs7Mk4Y2ABjAjvoi2XbpotAUGhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:12 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v8 22/31] gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
Date: Tue, 24 Mar 2026 20:52:33 -0700
Message-ID: <20260325035242.368661-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:254::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 906ae845-e95c-45af-e76d-08de8a220979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BbjHCGubVhBD8plahFU5xXTzh6nWZeVNL+S7mV4DY5SPELTSsV8jAhXaMxMbLVo8FcZoY7DqledjLEwHWlljRZXE9YKlqiokawCylsZ51+aGtTcbVayYZu2nuKXPAm5XtOpk/bsb6fQbLtmPollE9WjN7cZUxYFK7HCsx4tZVZWK7n2HRcZp2sicG9sRWuRmr74ojfWnnx45vOYoj70bHfyKEjDCQaM/ibTfOvPVHsI+c7uOk7v8okwkJ+P4Ht3RO5OGetvKytDCM54Ad8Ov6kcrJL6bYEb/ivsiUpoaRAAuEROhFWnynO8rIvrrTfbZSxrfXhUWgJvN7qZWPXUxw66d6DQCQYZ94kgU8HenB3Qb18hmFTXwiA5KAmqKIfm2uDRZgamXotdoU8+0xZHagYC/e4tBDmKlmx3ym+aGQAMWMBoCVbqQUXVc8Dcx2v87NaAnVYY9di/PB/h7uuaavIHhPtrhdmCzv5StW2LjbGajMt458K03k8YuX9a1U3lf9mPnOUpb2Drjmz0ELiEDGEKI/6rCweVJ+PTufRMAsJ1W4fwcsRm/+zQ4EYTMbQzSw4i47OsHRuWgw0VJPvm77dIckFICtL66Q5fC/rsVmSkxCdNihrodOi2SNCZxCPY6VfmeV5PPxT0zH1jl7kI6CrtahioW3kh6c4x2LoQIOgTu4gCLhzWQk36zti+0KJBCpxVbA21pLsgohQyhWIs5K/bbULqE8lqj6taz511VMD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?060C+o7pQj6HhBoKxN/RXS3S3fELfyLBdufiPfcU1GoKa8QfxMo34yaLNMW3?=
 =?us-ascii?Q?rE2WdmrHrnokuTnfYZ8QzEHcJUO+PLqLprc80/oufDHuLwdFCzT3xEO7Ykt5?=
 =?us-ascii?Q?kct6xlcrwnKNpPnRSTkEZx/5+YznB2o0hGJUIkxmPUPyn/TDgMx+nZBML6Ze?=
 =?us-ascii?Q?on76ak+TyULMtcvpzVu4IxdXz5LtVHgPhfezL+OGkqbzlpSuGTqqqh7akx3a?=
 =?us-ascii?Q?P+AOfNCsfVgJHfjJ3kB7d8juAHo9h+hGqoSOh5EaTsfePSGWlZ583WokVxvT?=
 =?us-ascii?Q?7LK+bu0Jbo4RMjcidnFBPMQB9avCgcsFOM4LgQPNm5uVJ9GvSpdPRr+cmY6g?=
 =?us-ascii?Q?9gKsTpSSys8S7pjkK9W7NW4YgPLz0Yw3nFdH6Ou5pn6zgTjxf80pNtExEOyF?=
 =?us-ascii?Q?AlRZY07YyJsnWSNjsgpefp5F3HgmfyB1bQqaTkWt3eWFEednoMcuvsmyqHfs?=
 =?us-ascii?Q?UmMPQ+veuesNeyNZatfaWTDcl32A07GTl7h9JK3pEaAheLbhIEeqto9pSlQg?=
 =?us-ascii?Q?vgvxjC70pMPTVEzYymZtG7vja365+DoMql0l3TlJMsNu9xIDXDp6yYK8rDe4?=
 =?us-ascii?Q?ybktC9O56W5yVZ6ZuhH99DVTWFE0apX7Zq7K9/jxEr9Ce1IH2N+eKjoH4j25?=
 =?us-ascii?Q?GW6kHTdwGE9+iQGGCZ+QcxVciP7RmshDYNpxWnI3TEES9XJcJ2s5mnGGLp3W?=
 =?us-ascii?Q?Yse30RoEYZ2PLmFF5uTgOtWGbe8H7dzSePJCbzLmDM59dM8UKVw8ThWA1aRa?=
 =?us-ascii?Q?Q2I0I0oMWiXNRZOvCnktrbPpOuLwGSbXiO4MQwjwLNYKGqIwNj3O63I3tgTv?=
 =?us-ascii?Q?4GnfKi7gJhojRr0tuTGCH8JXTzEvAzVTeXJt2OR7oMtyDCNFWt3qPWXlEl5U?=
 =?us-ascii?Q?M88rLhMRaJRSXisMlJgbs8+ps+CYdIeb7I+Asw374HLrKC5cCOjqgTUZNoId?=
 =?us-ascii?Q?O5Ivzi2WuMCjd/k2kmwsTHG6H8YOC5wlfi5GampEdDiKCDic3Xg7O0+YYOxJ?=
 =?us-ascii?Q?LRk7x+abpUpk6LQWlg/e4v0O51Zcs0gaM6i8hJrXQN4Lg52MkYuZBuTRPziu?=
 =?us-ascii?Q?1xY9dEgSg5D/gV3FT66CBKL1YLJl0Ngnh2P0KHzpbbr0+mg4VmigYlvsG0GD?=
 =?us-ascii?Q?kBSBcdT/8CMvAAwYLrKZEueF3sV3DP4ghDuZBqC/wh37lI63jbG6wDjYVPtr?=
 =?us-ascii?Q?GryeVko1ErmQZyIoJgyzQlSDCi+cgFU8LxLhVTzgeqFNFWqwpcRJwPoXnaiM?=
 =?us-ascii?Q?F7lFyVMm9YiAWxdtPvEZB7VmMgz8R/UpmQ4kYDvvujLUCt608KiavDljK+G5?=
 =?us-ascii?Q?PRxOs/GF2GSlCi7wO1Hg3PHvyOCNRYokj4PwAZD8WgEgQAJMaERZ3Mf2oQUz?=
 =?us-ascii?Q?UIupVInaEiNENFtZZs4FKH9Em2wJQLLHup8hA56L7EFiSpny6D8J2OTr+PE+?=
 =?us-ascii?Q?zm+JNPKIRzthQoEc9JXj6jE1jGeKU7kG75Kc0xWRyxxEJ6qkRvK+2tIGtLKY?=
 =?us-ascii?Q?s330dacNUNkYphG9BQhf8CuCaA9UXcpY0TGV2ltEATsQWV+KYLmzd7vXKAlY?=
 =?us-ascii?Q?KhlZJD2YLYB8b9YzOWPVgpjfLBszv2HBtCexdtS9QYEsj70QZgwtM8S0B+Fp?=
 =?us-ascii?Q?vhXvqDWr2CXgb7zBjEszCAyObD6ETzuXHeqHwlbd9p4l8neMwpzM6N28GzCE?=
 =?us-ascii?Q?ir8C10kj3u8CHKrw/VLo6ZZh0uWnRwr1/Rkmwuazpqr4mO0n2eOfC3bUT2Uv?=
 =?us-ascii?Q?xTICpOX/3A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906ae845-e95c-45af-e76d-08de8a220979
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:12.7429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDVl0igq9+cp0SiXcCU/m1Sb9blGbJgdLtwhihw5sOC4RxOxg1Z9IDiMIFpUKBXQqphTnV12edX21aJCQ+PTUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

Add FspCotVersion to represent the FSP Chain of Trust protocol version,
and Chipset::fsp_cot_version() which returns the version for each
architecture. Hopper uses version 1, Blackwell uses version 2.
Non-FSP architectures return None.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 19 +++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs | 14 ++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 4fb932f91da2..18edf7a1a8e4 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -25,6 +25,25 @@
     NvdmType, //
 };
 
+/// FSP Chain of Trust protocol version.
+///
+/// Hopper (GH100) uses version 1, Blackwell uses version 2.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FspCotVersion(u16);
+
+impl FspCotVersion {
+    /// Create a new FSP COT version.
+    pub(crate) const fn new(version: u16) -> Self {
+        Self(version)
+    }
+
+    /// Return the raw protocol version number for the wire format.
+    #[expect(dead_code)]
+    pub(crate) const fn raw(self) -> u16 {
+        self.0
+    }
+}
+
 /// FSP message timeout in milliseconds.
 const FSP_MSG_TIMEOUT_MS: i64 = 2000;
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 5cef5b29cd3f..eb7f8be893b0 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -18,6 +18,7 @@
         Falcon, //
     },
     fb::SysmemFlush,
+    fsp::FspCotVersion,
     gsp::Gsp,
     regs,
 };
@@ -132,6 +133,19 @@ pub(crate) const fn arch(self) -> Architecture {
     pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
         matches!(self.arch(), Architecture::Turing) || matches!(self, Self::GA100)
     }
+
+    /// Returns the FSP Chain of Trust (COT) protocol version for this chipset.
+    ///
+    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
+    /// Returns `None` for architectures that do not use FSP.
+    #[expect(dead_code)]
+    pub(crate) const fn fsp_cot_version(&self) -> Option<FspCotVersion> {
+        match self.arch() {
+            Architecture::Hopper => Some(FspCotVersion::new(1)),
+            Architecture::Blackwell => Some(FspCotVersion::new(2)),
+            _ => None,
+        }
+    }
 }
 
 // TODO
-- 
2.53.0

