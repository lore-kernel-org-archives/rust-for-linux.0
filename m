Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A6432548C;
	Tue, 10 Mar 2026 02:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108712; cv=fail; b=BmGz0+u9x09dn8POhpZjR4N/SeN3OFkPHsR6DTEuNUDr3G7nkj1JNTezg4yBADBYNOaA6qeL8Af8sbi7l9jeyvHlo9CZ1yVqedAULW87dV+leIMeWRAFgKmc1Gzemu2Qx39YJy3KMyaPlLGkisKHheEMmAEMfDqL+DTHq9X53Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108712; c=relaxed/simple;
	bh=TAJKGRXFKGRrb9Uxsn4wPwawQlU++wiPLveNOozUxyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eshVirzkH5EimiKQ08n/MWEY96xRDG89uXnJy+8sK9UQjtuy+sd745qcq9WPY0KZCdSW8IUN9IBpwUepZmaS/VJf/RQ+zAVNQAjzkLy/I0AQRNfKV4otQXXUJQOp3Lsg5IkSFMDIohoG/dXYJb/hGG73EJTNgjshmVYibG/p6l4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jRogAYe8; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jRogAYe8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1IJAAQ0PxXUFgHb7dhbhHNWJXoSuymdGCjNA5n/yrdLHKunMmcsvKVyvgjtmduHT2OFAWejhmpneoewEY29ISn89aS84H9MHZ2LYNImWME7JJgQxN1xdIMVIBgQm0N10JFDBngbiiQZYJQEkwV3zfjBJ8iuLaGY3UHTPwZbdMXyr085I3pg/LhT1rjbvuQGIZd1tEuq6M03ZPE65XPSNFARat6vq7kmsvYqzACLKar33vXDWx+JLrpMsS+xOZQ1MgqkiFwjo0klkskFAIIBJboJmp++acgGB2femIkUPTIclwrhTv2oiGBJftFWGt4R1A3ymbd2PNPysoaBjH1G3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtXynqz+dK5MHq399KbbebQm50z6eyjYaBpIt0SwMtU=;
 b=S31V9y26OQiVDAqodsOdCNeEenvUSaTvodoD/MP715J3m33cTejQdmm7KQsei2IaAEV9V8oMDnDWPOU6UH1+vPOij2NbOBJd8Z2ztMkXk9XDnTWvBrPY5hYU3UUFQ2zUfOhydQf0eXIsxJ+k9m0CrJvTud8bWDxR+SIivaPk4WaVcMXiL5VUteH2XTWZuld16nfL/M/fHswwnjo2NvydbJGJwBy0vPHT2+D+MQw8TB5eSCskfLrtJ8BF9dvCISjmG50CGAbFo8QvVu02CDHI8rRM42C+S3aJKF3Fnu/RcZLQoy44qKftispqgLMIZNWBxGeLHPRfmTb0A4JezdGURg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtXynqz+dK5MHq399KbbebQm50z6eyjYaBpIt0SwMtU=;
 b=jRogAYe868fLxsIKhMnnMoreDep4ebf61eYqyoDiPwe+vIl2WGp/eGZbwX6GAIVpUlVV+KiCHjxV70v9E3rx/iJgZ+8eybzQRmLJ4ZrTsIcTUvw9tF+TsZs2j4LZVAgnGVNLRdTJGo67YylxpPvNx8k3AsQJ8y8PyEC++ue3saAP4G+y0Ion5651PP5uSnNv8cwR65snRF8/JIQOH0VONTHPFUiC4tBxbEfybeGB0i1pMmNJiM4r+xdc9BLVrTtcSAVGRQpg/V7HoBFQKPFFSwqfJ9Rt8M7u9PlEB0dyBVRp02FdEh9OPM5sreSZ3lKiAy1qriaJnIp5ITwBFW8ZlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:35 +0000
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
Subject: [PATCH v6 05/34] gpu: nova-core: use GPU Architecture to simplify HAL selections
Date: Mon,  9 Mar 2026 19:10:55 -0700
Message-ID: <20260310021125.117855-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f29498-556c-440c-c085-08de7e4a5ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	Wjd46kWZZUcFdR6983o3RkmjxkfOyC99Zn97M9lyFp+Kho/o0ecxwhA1SvmSJhgABfMjpTI8eE+hQHEmJ5sgPq7PRM5aAhBFrXD8b8LMJZhWAeLJjLzVKxw3S9eMdm5Nx1NOieUDtskZQMJGZ+2Ipoo2rohjjU4Wa5mF/JJkzc/5B6GBbxddAOVD2jmSuyyG182dCcckiP/9bJFHcxmQoA2XI90Jo9ENDTEF5BUpuFIANUJUDxDgDt0Svj175PCMvtY3NRFj9pf3w8U9HW0nNzjD2g4NrfJxASWZZ00bFXSJrYbIWxIk0wiyphqcAH0u2m182BAmRxMJcF8FcrKQMjdIwO4UXtt2BM8eyfq3gq3Vq2GGLIioq2r+3PwvrasNcXHAL4N3wjOV8KTHQtIHi+RFCH2gfST86yZ4Gl8NDNrCuMzV3oLiaN3ZFcYgN8v148gDpTERW7WPAto4T9hsDADj04RTKJPXUtMQVkz/uOEVB2mlvTfEFbg/mhFo+Y4mc03ZggijA3dKXm5G0uTQOdEhuo3mgFHuevvpy37awDU85odvjdBVdyWRxsBvXz1LGpKPaPVBYj0HAIymf1LR+3fiTudGLOY27H8h92rFLlLLLPXq1/i0ahHkbGJSD0ZULmQB0OZmmLLCezreWYUTTy9Oo3nGkfu7vKnkUsMPRlDMEv0fVgKKkVrAuOt48htM3ZADR1Aw7SZftSaeKdkD8WfQRMxHJyfs4raArLX+b5A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yYL8UMfThHuWCXOAmrFQ/5T1wq7dhwkLNWdi2ZbTxO7dRLQ8LDHefnZOlWzE?=
 =?us-ascii?Q?4q7sxCX8mRnCaTWUYNx+EgEvVjeKU44+HUJBH5MbcLJi8ugf0ZdDkO8YIENs?=
 =?us-ascii?Q?aPvA54DzvedN35vzv8KqreG+fGhQG7YAyMHo/j5TzpfGajHjEQM7bAQZpfoY?=
 =?us-ascii?Q?t3sWeGi5I3Zim/v0jTMuLUQ0J9jXwvD4It9O8CKQ6Vwpg5PQxQpkBFRoUyA9?=
 =?us-ascii?Q?ttS/relUFSVHvrW8UCdLkUFQaKGkyo6t2P8ukn7ekmVmWOTYDBcAdVB5ZV0n?=
 =?us-ascii?Q?Yn4wRgxNdGUfhUjuDRTY3RFHdkzbFIAa2oRagwcj/VR++B4C5bgrsreG5P2G?=
 =?us-ascii?Q?+22WAy3JA4YPBcmRT8At2KJWTEx+SvvYcUOeJm/dXLEMGQVahJXaurgzAMZL?=
 =?us-ascii?Q?MH0YjthF7RLdU1HQuCMkYkCpWVNVjxSix3RdWJ8nTmkfGfeywlyHiTlDVHyZ?=
 =?us-ascii?Q?kMbXt8bVSIizqoHN3FFZAgShvWc5Rf2SKlbtPuFH4/tYdmch+vh9ZB+IN0HO?=
 =?us-ascii?Q?pI4jd0Wl3V71o1uuEABcuxFrpjW8kpjQTD618kelS1hVOy3B684jvtL1ZmZY?=
 =?us-ascii?Q?XlnCZy49ZriEIPz/9b8JA+fjJeLqh1Y0BR/aIEFCzLtQWM6Zu90RgU+NnqrE?=
 =?us-ascii?Q?GwN4V9ya23MGlOE26uBHLX8L7Hhtt0g/Ty1rxgwtD+RnERrwUPW8h/A4w9wr?=
 =?us-ascii?Q?kfUsTUpL/eLk5ANpBGBN2Kg+nCZJFz+MW6nVexPEoTSjMyP9IT2nCDXi26pS?=
 =?us-ascii?Q?wEoc4dkrWLF08eUJLiOrYfSwvYO3cSVtTjT0G2pUqllZntnjatldcnwpUpeR?=
 =?us-ascii?Q?zbbej52wKkJhXupprGBzvKW0hnRELChDPzypcD1Mcycu/IkfH4Rj0eEQnxOL?=
 =?us-ascii?Q?5klhLvgnS5ZUVP9lQUKCTVbdnzzIx2S6ixDwdUDZH7WbjA4yIQHwxcVH2ult?=
 =?us-ascii?Q?gs1gyid9jkpcIGH0lwjAzG9wPEHrZKo0MD1M/TeZZIr9wnsdI7ZwetNWq4wL?=
 =?us-ascii?Q?tUM5UBorYaT6JOHztE8/c58n5yicPI4NyUxAJMLo/PSJ7wepZV1RGVm6btir?=
 =?us-ascii?Q?TGIcJM8qAvoodX+V2Hdxmlt+zR4ZTy1vOI0Jvqg/oLs5at91RB4E1Q+ZEw47?=
 =?us-ascii?Q?cMDNdfk3oUUtj/cznI/AjFiIgf4VZPVEeCUrAYYmFjhgtiVhuwiUNOhUKNiL?=
 =?us-ascii?Q?rsIXB8QkM98fDdGlngQfG8JoEGmPzKZxjUwJ2ytgvMzNT7iPdRXQsGlgtA+R?=
 =?us-ascii?Q?vokLW/YKC3WphJuQoxKf2bzJaY38YGUuJ03fUjq/80JuZsrlxaewB7baZ93q?=
 =?us-ascii?Q?l51f5ssrwfEg47QbMEb11mA1C5NJ54/U7gV1poMSgBR3lN0DsdGieOlMR6ag?=
 =?us-ascii?Q?S/ziDFwzFW3YuvJ9up5GTnl79S+jG9CMQc/x0ggOf5vR6422ol++mlz9bSXL?=
 =?us-ascii?Q?nz5DO1SwFbJrVnx6KQ9rN+T0JqnMg40Az1mqz7IvivLwxXa8PLFf191BBhGu?=
 =?us-ascii?Q?+9lNMu5XKwJMglnxQ2DRJyi6V/LSm4fbaJnj6s0dwv4EzN4qD49huTZA7Lry?=
 =?us-ascii?Q?fLaDYWwpmwLi9NIXJiRzTB0wOTVmggBwS9O1FqdJM42XI+y4kpLawRQqgybz?=
 =?us-ascii?Q?krEwlVHJXhvlMROCLLA9XJvUOs/vQJhI5NWgPtsal8Bi2tUE19xe18sbIdvH?=
 =?us-ascii?Q?2jhJgiSR/yfuAaTRKu2b2MsV8nwp7Ud4bqs+ENwsIaKJwdGqdP54ZY6eoBSV?=
 =?us-ascii?Q?WBsyVi6lAw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f29498-556c-440c-c085-08de7e4a5ad4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:35.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhJh+3thQkhGXLO3deJWjDs+iemGAKPgMTj4m7I0iWNEByu+WpTvqYL+WrRHelo9HlwMk8s8v+9HW1H9e3zLlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

Replace per-chipset match arms with Architecture-based matching in the
falcon and FB HAL selection functions. This reduces the number of match
arms that need updating when new chipsets are added within an existing
architecture.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 21 +++++++++++++--------
 drivers/gpu/nova-core/fb/hal.rs     | 17 +++++++++--------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c7f12f2a7a35..721c82f6a831 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -9,7 +9,10 @@
         FalconBromParams,
         FalconEngine, //
     },
-    gpu::Chipset,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga102;
@@ -74,17 +77,19 @@ fn signature_reg_fuse_version(
 pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     chipset: Chipset,
 ) -> Result<KBox<dyn FalconHal<E>>> {
-    use Chipset::*;
-
-    let hal = match chipset {
-        TU102 | TU104 | TU106 | TU116 | TU117 => {
+    let hal = match chipset.arch() {
+        Architecture::Turing => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
+        // TODO: support GA100. Its boot sequence is a lot like Turing, except that it handles the
+        // FRTS steps differently (specifically, it skips FWSEC-FRTS).
+        Architecture::Ampere if chipset == Chipset::GA100 => return Err(ENOTSUPP),
+        Architecture::Ampere
+        | Architecture::Hopper
+        | Architecture::Ada
+        | Architecture::Blackwell => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        _ => return Err(ENOTSUPP),
     };
 
     Ok(hal)
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index e709affaa7e8..d33ca0f96417 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -4,7 +4,10 @@
 
 use crate::{
     driver::Bar0,
-    gpu::Chipset, //
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga100;
@@ -29,12 +32,10 @@ pub(crate) trait FbHal {
 
 /// Returns the HAL corresponding to `chipset`.
 pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
-    use Chipset::*;
-
-    match chipset {
-        TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
-        GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
+    match chipset.arch() {
+        Architecture::Turing => tu102::TU102_HAL,
+        Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
+        Architecture::Ampere => ga102::GA102_HAL,
+        Architecture::Ada | Architecture::Hopper | Architecture::Blackwell => ga102::GA102_HAL,
     }
 }
-- 
2.53.0

