Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9A82E173B;
	Wed, 25 Mar 2026 03:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410778; cv=fail; b=NVOuN5dT3DrnnewN0w3yMhg2wF24ycXD4lCcCN30QdoAL62HjyWo0OxvbcsSNMmXpm0IfQenraEOGqJ+ysAdkWY44x69iNYAsGPFN92P+FQULg1uC8EqF7VOoD6jWpTMRgGma+X8/93woumHaqTRtpqHUW/eyIrWZKlr3+s8qQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410778; c=relaxed/simple;
	bh=/LnZs7WImcLTbP9Rm9ieYe4Kr3eABRLwD2G26b+gUQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HqYXdCJd45PNTOSlX/zVoPOcdysNQEcZRRc0fA/4MD3sGj8qeTbYGLB/iUshhgbDC5jIq94fktyW6raTlx8V2VutjofYV3KngY05etCW3xRxME6xt8xwQyvjD7UEQ9tEHBMI35mQ/BxvMsuK+JnHfSpbFtzmJOJZqVlDFLoEXOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WD6bw8lP; arc=fail smtp.client-ip=52.101.52.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WD6bw8lP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPL1S41kRFq1XVG2N0JGU/XeLwJKcSw7ZOeLHvFTl6h2Wded3i0YnHu7iC1Enrj/e/qHCdgagqpNVto78jUf4deW2pc9/YNZxRGMHHiPTAWwed9feYQ5GMfduDTDuG+QLu4OX/A8QdDphVmBUz8COYr8oONgnJ1S/JSxjCCN6iGIx/wJ1tUPGMFkD7+hvDb+YWK7MrOLZfSdLJdrw7bJ70hKHe4s9d1OgtkK/iYaODf27zRrM5TUQSpPydGxaZcvxRvJZnYkrZSW/AwNZgDitC/SL0aeNdD9EDJod/QL0AV+qlNbDK1kArJ2+zqvX8+x5QhqQMcKLMVS5HuBk6h9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pn5NwxHmhiT2JSRzpUUWYRGHv3j7A14TF8MIvC4cScI=;
 b=nB7ilLwovFe3d4hitfCNA1ZsnWCV74KqW6o2JfYrbMpZ+/ldJf1WZCgs3pGsj6QIaxFu6IPWsCmJ3vS3RGXSUWyK2pC13s0U2+SlxJlV6n6tBWmLf1xnYdY+NxDeaYL/Niuy+QpxpN6fP8ULtc2zWlG6ldUZcEQwNSxWbVAc7PiHs17te9IA5cc2W41pLuLZp4KQ+0w9YoaWcTzZuVVB/rA8kDh/OOky1B/9pinJctLmSUhJgEjMCO59yUaE1fJ6wsTv1lf5S0PXoYCcbCPRIZYm7sdKDk8LGs0nLxpA7GJXVwv4aXlqFej193tja8AMEeJLUAIaMcoj/Qb4gLz/ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pn5NwxHmhiT2JSRzpUUWYRGHv3j7A14TF8MIvC4cScI=;
 b=WD6bw8lPXmj0XqPKTMYXXgZaWfDevZvHcTsEDmp6sgv2VzRaU1zTq+Z3msQeS8yXmm2xhUZ2V7NHos0Z+kDnoZK3Mim98RhfIGSw6UKkSbhpTZGO6b9e4OhDg8q+Z8Z0ankSut/r2BEAn4SWgfK8z9EwlBs5V0YHkfJ9K3WUfTUf2/+q3xY8D8P2wuB5STWMce343HUZD+hg2hO+vs+8aoySu3l6s2NwFLTyVRB5m6xfF+ZlQzrV0ASkZL7YQGf1IiKBCv+uMKr8lqk1QNKmkgr5xVCOyoQMx2JsCzS4wDmUOvWq5m9aeljLAb6BQ70HEZDxq5lUlFToEkkIsosPDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:52:47 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:52:47 +0000
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
Subject: [PATCH v8 02/31] gpu: nova-core: factor .fwsignature* selection into a new find_gsp_sigs_section()
Date: Tue, 24 Mar 2026 20:52:13 -0700
Message-ID: <20260325035242.368661-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: dde18007-0fb3-45ba-4375-08de8a21fa59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KXar4Wk+QTBjYCtgpzMhxBdFN4NZbd45xjaev/0iuA7xZ2dxIqe/CFf3sqZuWW7davrlEhKnU7TKRpv0rdRFLJNh3Jcn5GK4QF81rVo+CEQqMs0alLO/MGPxtq1zS266L2WMeQmn7f/UX3G5RTbV8021gtwDtrEYmvvIzsUURjrAOnDeLOhbSxzSM98mrzJHQ+0c5xMOQ/HzS8pg/TEIEgUQyX61aG0RD0NtahkuB9RniDQKXAGozXILB9+ElokiCm8nhvjUC2pGXgloMBquM44SVsItJe0HC7Ih/YSFwcdBa+1zDcWevh1bVfZhhc9/XmP739ND+3uzvQLRVISE4RywpF7pnaaR2rovdU8wrZ8CDV2oKq84xYOpMGQYSd39t2r7vcSPjci4W3n7+4fYj3ItSRLoJGayZ+1iLHgYQ5BEVyFWwpxz4ZbCyTLWch+/XjyhTlp2uoQo3g4B8YDX8V+B1/drRy2cbcFf8szP9NUCjiXJI91+aVPbZiSwVqF/GmO6bR5hJGCEEXCyxi+fWl4QqeIXy7mp9ROVESBS1NgsOADMNJoLlHqtAccyeL0j2gYEQgX2Zfa942WSKbxKa7HfQUBKuqhxcVWoB2S0XgP/8PLRZlD/i753UV2DG/WarrOS3foAE9QevF39Mn1fqvZ1HfKUOfQp1fabfrtWWQjVgmC1DHsvwESAoOu2F+xzj/uKKpFao11zwa609IXNstf9hDr5ESLCIIyK1P3jUlM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dX3PdkPgSYazryDcTNzasifbvGZt0Z5TzicoaueAdxAi9dZ9d1UxTBIa82Ct?=
 =?us-ascii?Q?MJHil9nRQsZnl8vlxAxwigOEGTHK9Gb1t61uRY7QwuOoixAKSotqXlPVpex3?=
 =?us-ascii?Q?0zHSMJNiC30Kr8vQ4LQxldKQ+wZWIFojIfgznxZLOB4OY2Y3GwlzFzgqAwz5?=
 =?us-ascii?Q?Srew28ImG+O7dx7KAT3uRj+LsCB5edHFwaSNDKOLRQ5JZNaRsKB89XyKLoNu?=
 =?us-ascii?Q?9iLCANDAXXwC0SaF6lfCALQmFRk1KyyfFSux0JWXEX006YMDWbZtiBz8Zhuq?=
 =?us-ascii?Q?gk1/kjGyL+z0ZurvgRld26bwnyE4OD/Ci2rj9hpNq/cSmpGemDAqL+tLFJN2?=
 =?us-ascii?Q?hWbHZlC6xtI6RY59jBxas0V42cikbAqz9whSLd1iJGAiVRfoMM00U6S8r7GC?=
 =?us-ascii?Q?sJzyhc1FsduUgDftGtF2Qbnwz9ljL1PWi6/5QszWyu96AAi29PSTnj1QMWlf?=
 =?us-ascii?Q?jUQxUuhO/wqojXzGZxhPaKa3CtWvqMRe1f41cSkfkzGJ9wL453CGk3FWxeVa?=
 =?us-ascii?Q?e74rgWv59HmCDUCvtPc/NztX+uBKrA3cbjoOhoxgwXQ94Ay8KIGmqfrpWswG?=
 =?us-ascii?Q?PmVNFKiz4TZ8SDcosLDrWlmPad9yoz792vltyavSlyYB/Sn1EiAynf4FilLI?=
 =?us-ascii?Q?Q6oKwu6IGPHv+m/AnEEw7s/8v8LvOhGRavBX0V83B24cSLF3YRsYU3OEDA6q?=
 =?us-ascii?Q?gUUHN4YO7RNr0XzNgn/FsvlbcBbfqZ5CV0pvYt6WCts0jsj7BOivVemY6KNU?=
 =?us-ascii?Q?UL1HqnfN4c7WcmXAFaWZ0F4xV1lNuDDMJtyYHAII1oB89z19+6RElXsLBgsE?=
 =?us-ascii?Q?QuXYcBtjfAlJ9cNFQ7AZP342K9FiKbMAn4fq135Hdh4R1S6JjDmuFasVAvaj?=
 =?us-ascii?Q?IVHLFbAvxxMgsp9yvEyeMgUGamAx8shOkc8RkuTj481zYrjw/Apm8XwU6wlK?=
 =?us-ascii?Q?TQgMYrlh8K6uZqz5L+OJv2HXky5NJA6ikZMNjwuwfAIpV53buwcpfD/klWlw?=
 =?us-ascii?Q?VZuFRop71e7hBhx7w+xNypLhbrOI8Vi4rhnRQdmOwTnol5ePQW+QjBkOBfmK?=
 =?us-ascii?Q?xNgM91JcdJ1EVTN25Fb1CsB/eLKdSGynwyn4UhfrHcpbboC5OyIDPkjDE8iy?=
 =?us-ascii?Q?A8eYU0tuDEnNB+F9nEgya6A743lRfogIMKZfUd1dTqUX9bxII2UOQA7LLx94?=
 =?us-ascii?Q?FaeHVEhrsFIuWc4BChgDuguG+ZZADNyyd+oLFVckFxo7KXMKH9mD/iGSdcBH?=
 =?us-ascii?Q?H8yKkFiaeWwyRKVDBdI1Fv850VexPdIVbT7CWGcjNANgz/dYDXRLlQ7hfVh9?=
 =?us-ascii?Q?va+UKGw8SDnPe+jWNamwW9OtyTKYI/ASIPzZF/K50eTBbBhYo85NnrA2u5GR?=
 =?us-ascii?Q?U6n70G5lFkIdhCbucGTUyEKB/q7BuQ1B6qyG4nTDgkahdW/u3XJ11csVZYZM?=
 =?us-ascii?Q?yfcjfAOJSAc//7lJiqlcXgov3YHeTWjYF49o6LXJMSYv7kCK18cPmnNIdlel?=
 =?us-ascii?Q?Y/4iZ/IWOq+NCeG8FFGy0Y1JmYo1vRzVNwF/lbgerPZvLNxfBYlUEEfBW170?=
 =?us-ascii?Q?/z1VF6E4JHRMAzoTu8f8trWAXY4Gti3mwlX9yhZ6gzD52o0B7EyISPTz9+QF?=
 =?us-ascii?Q?kCFvRpEMeWfbmsNsbg8HpDMHDqUEixz6qtZq42KZqzsR92RfV97LeqNsFAbs?=
 =?us-ascii?Q?9ZFB0fvRxFdJViXCjEeRQrP4GdZf6zDqXQD8eWo8WDNf7maHQ8SVwurDo2hR?=
 =?us-ascii?Q?Wdyg52vflw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde18007-0fb3-45ba-4375-08de8a21fa59
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:52:47.3302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+/lF2OrcCgY9U+FhRxt2oMkqeyip94HtZYSUzwdxySa1jDtfey6XMzL2gijFvuexImKoK0QPZmHLKX757JMiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441

Keep Gsp::new() from getting too cluttered, by factoring out the
selection of .fwsignature* items. This will continue to grow as we add
GPUs.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 36 ++++++++++++++-------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index c1f0a606f5c0..8bbc3809c640 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -146,6 +146,24 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
+    fn find_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {
+        match chipset.arch() {
+            Architecture::Turing if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
+                Some(".fwsignature_tu11x")
+            }
+            Architecture::Turing => Some(".fwsignature_tu10x"),
+            // GA100 uses the same firmware as Turing
+            Architecture::Ampere if chipset == Chipset::GA100 => Some(".fwsignature_tu10x"),
+            Architecture::Ampere => Some(".fwsignature_ga10x"),
+            Architecture::Ada => Some(".fwsignature_ad10x"),
+            Architecture::Hopper => Some(".fwsignature_gh10x"),
+            Architecture::Blackwell if matches!(chipset, Chipset::GB100 | Chipset::GB102) => {
+                Some(".fwsignature_gb10x")
+            }
+            Architecture::Blackwell => Some(".fwsignature_gb20x"),
+        }
+    }
+
     /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
     /// tables expected by the GSP bootloader to load it.
     pub(crate) fn new<'a>(
@@ -211,23 +229,7 @@ pub(crate) fn new<'a>(
                 },
                 size,
                 signatures: {
-                    let sigs_section = match chipset.arch() {
-                        Architecture::Turing
-                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
-                            ".fwsignature_tu11x"
-                        }
-                        Architecture::Turing => ".fwsignature_tu10x",
-                        // GA100 uses the same firmware as Turing
-                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
-                        Architecture::Ampere => ".fwsignature_ga10x",
-                        Architecture::Ada => ".fwsignature_ad10x",
-                        Architecture::Hopper => ".fwsignature_gh10x",
-                        Architecture::Blackwell
-                            if matches!(chipset, Chipset::GB100 | Chipset::GB102) => {
-                            ".fwsignature_gb10x"
-                        }
-                        Architecture::Blackwell => ".fwsignature_gb20x",
-                    };
+                    let sigs_section = Self::find_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
                     elf::elf64_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
-- 
2.53.0

