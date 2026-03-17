Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168393A6406;
	Tue, 17 Mar 2026 22:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788052; cv=fail; b=huukdzw2o8IgoRAJDy3umFQEp/Kg5LC+KguHFPANpbe33PV9dibfYJNCzzBei7CBhZ7CbuYsb3XSsLzbGujhlTrNEX77ZYXxRdZEiMf69zRsI8deP5Wqq7Jhh3Ud594Nj5elcFmnHCIigLGKVksQqkNPAa2XQj/4tEIcn9YUOkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788052; c=relaxed/simple;
	bh=Ija8YIpxjpmRoDARx1VwtKjQ9xFyXVyTXW4MaBdCVGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XNYoZw3kUS2TUHUAk65XbaAi8KXRhNHN04+PjFggG6r/Q30vX75dEnN1lv+LNBVX3nl1BMBx19oAi/S/7NHfjJfqTa7VX7xabIdGTjAB0JcfeenATUk68Tq7aEYC5ZwDlQzrfJh9gsR/Y2QDh/KOOpKo51PYNhx+YBiQ+LmzJFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CxLCoFi6; arc=fail smtp.client-ip=40.107.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CxLCoFi6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTOjbOi6yW7rZQLwiJ8k3Ltx2QMsvbhSxXVixRUSjCM0hGdzr7jU5DNax6GqjmcVLuDRk4aNWgvC0dGt4Mmvl9EMRbHKpLpHJn8UkOk5/MQ27dTTZ5i26xM6SzVeuD/q43ulGS1CPdLIUFLZdDM77PjFLUa8HCwjm7pDU5Dv0oXzXA/3ekVF+Cd2LAOFlL7xIXuiF2lq15VBByx2X23DbWu9qqU9l8+sYu7VfEJZ3GxlGt8cqyjM2i8We8dd9Pmy0vkHIYv2slpcgVE3LU7GsNWSi4STCPInpbgvVUthdHfYBfO9qUzfU7UnUqNw122o0yMJfLTG0DrIWVO2rNVD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQ5AUknuuz92nKYLsSEI10VQa2+9U4fn0S+1vhKeJH4=;
 b=mUscIIj9M84/aGKOkt662kjp5ci6z4fVu8PFZJkLIjy/xPMykVap3KWCmlw8SSKT7jM/2ISyIfO4EdpFhOnqh/AX6V+AAyjGlFWWJJuz3AvpqNs3EvERj55upeZL2K8X8jWdWr0arGaNLLHr45tvRgpLdv2I1yUiyzYrl3irpshVA921HNb37wFZUaEe5hnkz/el+Y6+BT09UrbF/B8q8JiX7DgHYP4xmCzCb6r1btlQJGCSW4LAjt1lV85QKtRoZpU4z84oaIR4xViOM3gHEvntp9C9H6N8cEzNX/7H2x42uucoJG6lsD5f/9b9FKp3aBHkHvHQ5mvCedVrwZzFVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQ5AUknuuz92nKYLsSEI10VQa2+9U4fn0S+1vhKeJH4=;
 b=CxLCoFi6mquAr7aMOx9C+qzOzRuABtx2V3DL5Ul/X5obLODf7EOtk09Ew5Zj4gGNWzWzj4mgz8MKtFdpqQKOWHTLMIiJkzcbZm1iXSNVP6RyJQlyqdJ8IrbV9C7za7pGT24RKrMAUy5VD5EquTNphYFeCckKYpQdZuAHkWXMOjwcFUYkRGk0yF9fRU/JbH2iHtjW6SyCLX6eG03BMQ9hllJHlWzpqvyOM5wdacOlOrGW+Sn+2Wd67D9NsntZ+Q4F+CLMYbybGWzWDW6QhcCVrUmOkCaunIlhKXidAMAwl+uy+9O/svg8a1m6OooZhxxY4AshQwks2hcsK6/RBRBE5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:53:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:53:59 +0000
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
Subject: [PATCH v7 01/31] gpu: nova-core: Hopper/Blackwell: basic GPU identification
Date: Tue, 17 Mar 2026 15:53:25 -0700
Message-ID: <20260317225355.549853-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e86bc1-4380-4200-f0b3-08de8478134d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	kGYNrHMSC6lXd72jEZHYZfvKY8cOM0Km/mR2fIyiXD2Bpc81Y9huLPzh5BtDL/blcoM1wNVZcAVCJpLL8ZLdnoI/VslD6wo0lueSeP6RKcx8mISx8A5zWXC4PkMz58yS84kehiaL8A644ikUrzA58P4WrqkvqmqnpIFIvVw7VC8YtwJ5x5apUsGRV1SLsXTAKR+aM1Qfowlr1JuKrKEa4/IZ9ySpcY5KOA3H9KU12YnGGXjusIYjUjC3DJac1RwbhGB3zLkmQrbyGXYOrFeiNT2NpisTQMutFgcTpaub2VzUUSrIbfnpMdDPsdKOkNnfunFdT2DH1QIH6hT5sfhSVTOhGknf9tMY/D5/wZcquLhk1xbKr8aRg/IxfJdOc50uy/cIieyQNnKLu5Rb1f3Rr6hYn9ktCk2s8At61BzhdbOrkTEhflJ/aGVmsV5c1qnFoiqSS7MJVQA/O6WNMjLdwiyrk8HHN5pilvMtPne0SSWVX62y9Bki+A/G6DOG8PRyOtZNKf+qoItQTv4n1G60Z93KyeY5KHhahLra3vhwaCMVuHslid7Q52UgeLkRHOwJJHcJuQVb6BPPsNhXsEGgL7Ub78kPruK/2we+i+35KZ3qp7klTl8BDHD2kJEB89+SW5wx7PaZ3YeFBFKawsccNYnm2HMulb7GuV0jzXvrseLp27El7MES0hCTpnE2z8z8WS9IS8qQeeUS7KsBwDo6H4xnf1F9VqXizebpqsRG+2I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WDvUzJvIfvR5zog/iEmvN16df4433avTo+QxlFEbcbJiQekrzYw4j1ijWUTP?=
 =?us-ascii?Q?3GqekfKU0rnCY1BYpv8LdX2o5nO5paj8e6HUg5Yey3m7+xFqXb6VHKcQyS49?=
 =?us-ascii?Q?g8yxfjQCyWWFIKQftsBTWrTaE0OQkbIS8nzITiIvP8y6gyKaZqVRfqPyNm0V?=
 =?us-ascii?Q?stWCL4hdzbIPFUbGpZtf1WLGiMVVMY2ISxK0Kr5BW3TM8bqDJZy/7N7/B5M8?=
 =?us-ascii?Q?9jDKs7QmZysSB8YAg9ePA55C8Ov1DJlBzaFX3xuI0XK7Or3Q03wI8mAizo7G?=
 =?us-ascii?Q?4zsucYiN4VqG4y38XSw3YxrmrTNSK17PS5+ooFbSafjp62fJ6m5rcPDaPsPq?=
 =?us-ascii?Q?C2Kz2ZO2yQ8djwMniWp+zA5b+5xlqEZlTHjLeD7cAqOg8JDLMq4ZF5uJ37VF?=
 =?us-ascii?Q?yPES6giRbhbiqFOxuQAgwMUDAzwQcn7KqkXWUwPBgCt1WDy0zL1kAm+3zvWR?=
 =?us-ascii?Q?koP3Bk0jSJhBs0PphSkbJzKFE7iURTYjKJN8oYYYDskMQn+WDdhzcHOk8/kU?=
 =?us-ascii?Q?J56pjzWEQ39vJND4/LFMY+cWxM3E5+BvUmsrJiyEZxzzfLg17OXNLsSuQO8c?=
 =?us-ascii?Q?MNZXT6uPTIqdbFyGMeSA1dsQMaEO+R34VnOXwhxrTGLVkDpV7j179LU8u/9O?=
 =?us-ascii?Q?cqEJ3xD0RWd4h2MC3t+hy28Lb1+8616aAd7gpflnMFgWRsamohJvhnytc5pl?=
 =?us-ascii?Q?7oSu5fVgxl/MzYhNqPY9LjTyr/WVMbjYQ/t3zCR/ijiOs/WgVnJ+egZJr/tW?=
 =?us-ascii?Q?qAvWjAESF/dRp8wpDMU22B1Xfew9/xeXCLkzd/u7uvep79Dbb68T63tBDDgy?=
 =?us-ascii?Q?rNc8xUlmxHXIKfo2ZVSIMjSFK6kmXZTUZ9Nr5wLVQPJdY/ICDJxqFPGBCrb3?=
 =?us-ascii?Q?eloCIs8nZotmosnXLXoSp3cwJc4ac2A+oSpKMq51bzqd18F9tAlP1wAMeNAy?=
 =?us-ascii?Q?l7MAcEeAb41l4fXoPEpeA8p7LWwcb9vlYtq7P93Wehff44A2BulmOGDHfvRT?=
 =?us-ascii?Q?tN1kiW3YP0j/qsdRFa0E3XaDnX2E1xOkf6H3agaCbw3edc/+GWCeyk1xUO0c?=
 =?us-ascii?Q?qnBLMgc7mw7n7QsB6nCrq4/S2Cna0wQa365r1ZYUKVHQS1+KeatSECAdWFZe?=
 =?us-ascii?Q?1woTiAAs4Ra1v2Cy9jckSCdzHXzW+E903NQshpwDsiRmwKsIeUym/z7jmEhx?=
 =?us-ascii?Q?xt+xk6kTVlyBYRHrM4PO1bS89g/A+r8jzm1EeFzgUbi4OchzZrafnJ3PqU2f?=
 =?us-ascii?Q?7twvnKl/axyzRm2cKGUJrmSr7jqm0SQjL6Dq7kgRPqjSS4q3w+Zb/zDUCaH5?=
 =?us-ascii?Q?2713PEO7/QcnhSiDtGwDvt6FaaVlCSsY4mt0XUkmj6gNRQr+GWtdiLxFrX6e?=
 =?us-ascii?Q?Ux3tq9u+WSZbinugAQAyIPRQBVax6NORRoRytd0ZY2+urFPBWyFOJFLFtQBi?=
 =?us-ascii?Q?zHhj/pBNXfxTkV8v2n8O4vgqJris4O7d5iqPRnJwX/m0u6qFnWtDH1sE3uVN?=
 =?us-ascii?Q?vBOPIYrhRjrV0xZmM9CLLAfPSpf52Io3PR4FKiRwHTL1cvc+ktIH01KeOO9Q?=
 =?us-ascii?Q?0tivqRjZNA+fFlmeRg6qu7MYdh1AgFN2enWmVGOjJ9L9U8q3K2v4EyqTCCrA?=
 =?us-ascii?Q?nbt5hnFcog5SJp5eH+3wHv6V+s/+UrGRWsATPY5Gtx2HIIb+vuCA+/DL5EsN?=
 =?us-ascii?Q?36QYFXuRnkirWYI+ZcJBDMhx3GMZM1vs2CRtQDoUO0810LukAS9H5l5nhHqo?=
 =?us-ascii?Q?IIZAWki5cA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e86bc1-4380-4200-f0b3-08de8478134d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:53:58.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBMVb/9ZsBmm6t469wRn8ZSV1xwlWPkzdxVSP1YoztzshtTqvx+gcnEY7bg1fbhocr7r5IEumGeEHM4GhePPVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Hopper (GH100) and Blackwell identification, including ELF
.fwsignature_* items.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   |  3 ++-
 drivers/gpu/nova-core/fb/hal.rs       |  5 ++---
 drivers/gpu/nova-core/firmware/gsp.rs |  9 +++++++--
 drivers/gpu/nova-core/gpu.rs          | 22 ++++++++++++++++++++++
 4 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index a7e5ea8d0272..c7f12f2a7a35 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -80,7 +80,8 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
         TU102 | TU104 | TU106 | TU116 | TU117 => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         _ => return Err(ENOTSUPP),
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index aba0abd8ee00..e709affaa7e8 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -34,8 +34,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset {
         TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
         GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
-            ga102::GA102_HAL
-        }
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9488a626352f..c1f0a606f5c0 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -213,8 +213,7 @@ pub(crate) fn new<'a>(
                 signatures: {
                     let sigs_section = match chipset.arch() {
                         Architecture::Turing
-                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) =>
-                        {
+                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
                             ".fwsignature_tu11x"
                         }
                         Architecture::Turing => ".fwsignature_tu10x",
@@ -222,6 +221,12 @@ pub(crate) fn new<'a>(
                         Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
+                        Architecture::Hopper => ".fwsignature_gh10x",
+                        Architecture::Blackwell
+                            if matches!(chipset, Chipset::GB100 | Chipset::GB102) => {
+                            ".fwsignature_gb10x"
+                        }
+                        Architecture::Blackwell => ".fwsignature_gb20x",
                     };
 
                     elf::elf64_section(firmware.data(), sigs_section)
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8579d632e717..3b4ccc3d18b9 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -83,12 +83,22 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     GA104 = 0x174,
     GA106 = 0x176,
     GA107 = 0x177,
+    // Hopper
+    GH100 = 0x180,
     // Ada
     AD102 = 0x192,
     AD103 = 0x193,
     AD104 = 0x194,
     AD106 = 0x196,
     AD107 = 0x197,
+    // Blackwell
+    GB100 = 0x1a0,
+    GB102 = 0x1a2,
+    GB202 = 0x1b2,
+    GB203 = 0x1b3,
+    GB205 = 0x1b5,
+    GB206 = 0x1b6,
+    GB207 = 0x1b7,
 });
 
 impl Chipset {
@@ -100,9 +110,17 @@ pub(crate) const fn arch(self) -> Architecture {
             Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
+            Self::GH100 => Architecture::Hopper,
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
                 Architecture::Ada
             }
+            Self::GB100
+            | Self::GB102
+            | Self::GB202
+            | Self::GB203
+            | Self::GB205
+            | Self::GB206
+            | Self::GB207 => Architecture::Blackwell,
         }
     }
 
@@ -139,7 +157,9 @@ pub(crate) enum Architecture {
     #[default]
     Turing = 0x16,
     Ampere = 0x17,
+    Hopper = 0x18,
     Ada = 0x19,
+    Blackwell = 0x1b,
 }
 
 impl TryFrom<u8> for Architecture {
@@ -149,7 +169,9 @@ fn try_from(value: u8) -> Result<Self> {
         match value {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
+            0x18 => Ok(Self::Hopper),
             0x19 => Ok(Self::Ada),
+            0x1b => Ok(Self::Blackwell),
             _ => Err(ENODEV),
         }
     }
-- 
2.53.0

