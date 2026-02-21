Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CE1334C1F;
	Sat, 21 Feb 2026 02:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639876; cv=fail; b=hNYM81YzV/oy1CyS+wmV5/qNS7WjSJQxd8uuf2jZHR1Jxw0SCrqOlGAR0yM5DMmvG9W92zaWixnPGERxv4i6jhPFeMELnYVrY3alEHjAybNkod1bmAF1x/jZm3m8KsvqOIDH7vDSaVEW5qBtARcsIlg7qhvLrgIMlJ4aS426Dwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639876; c=relaxed/simple;
	bh=MG3tqbtcFh4fO2qXNiVzKJffexuectiBH7YxCzR3n/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AfTuV8rq84Qzot5W8Cc02BfYrOKFTiv1F9U3HXkn0UrDh7gcLxV5e7/Bs5B5vnJziiSibMjfeh7V/qhJowHklcbHVTu4rwqjEyNkytpLAsSRBq18iF1rnb0OAzspHnesQm+V7m63xss5P0ItuIsF+jjePRlB0pHeEGjNoT7B2Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EWd+Yt6p; arc=fail smtp.client-ip=52.101.62.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EWd+Yt6p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbscgFD6/psZZA/TRE9a3lwd7V/vkpM2N/B9dvoN164ooR/wKrwYVcZBc3WDI0xNjZIA2DgeOsAVmHhkgHLtLUl0g/2S2qikYXKvUNlDfjqydtC50/39XBWjQMup9QR+orZ0RP0v4+pzx8hC5whTVUtN1TMLCbE+IouqAA8kFpmMJG15hxmN3et0O76cpa+Ir5ELd3vkjkRVBPw6OeBnPybf21gPBZmVZDhk8EdtPYMM7Ik485hjZW2c15YX+hh0lRqupQmcE4medoiSmXRNcnYN3em19JiVHwhITlBtwdtcmO0Psl7rQrrPi3m65fPbODys06sPNp5odUIy6U8dAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFXbYAyvF5YBYbm2Wi/gbYiKAVR63NzziCjue+b6xA0=;
 b=eWjPxtassOLLOPWtXj7aiHMDQ4mrLG/UIiy50eZnYe/U1z2hCq3Ln7vJCc1R3ld56GIzcDBRfw3vGy1rZRWrU+M5PF+tYX7YEjyOaNxAYkCtdyyMVVhX1eA0c8gpNQAAbVa8ZDfUBfK4fjDZoERCccgid01fU5b7WRRzgCiFizAZf8qDgDa7LCfnceINkY7u2cUxIpEgr/L+2R4O04mGvwwhTc+i+LDREORjhL/PNxEMNUGthwO6CDRiiwu0xXbBjrz1DPUeyHpaPYzNjNPMixGef4C0M1wyI3SQc7H6QUG4bo3SmoW10qUSIAUwEHRYhu3xmbxc10b4g5t0+qdoow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFXbYAyvF5YBYbm2Wi/gbYiKAVR63NzziCjue+b6xA0=;
 b=EWd+Yt6poCqagxtTT2aENIJNmHziLnh+v4Dw4ffQN2xJVqIHpFx7yPmeVtI3vT2MlSBx8QjwPhlkIn3VjlzPuSM0uOC15RDzyPGCM+W/kC3usSVv/fp+gTxyDkyZ5GokL0wRS7R4WkH5U5S6RUYzsMENOrvz4LDOONwfmb1u/J1vQVO85XqhsBHT7M1qVFto/kVZPaalJiro7L5GE9Ez2nR2vxuVe6VLHxBR2PNfn2bnH2mlEmPOq+VQ0xPbyf7DRtcT11Jt0hi0DgkCSI+eReQibLGylJAXghh+0OV+jPVnBerGDY5CaH1Dmp/RFPA6IpPKTBMjJEFZ+6cMqzaGXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:11:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:11:01 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v5 31/38] gpu: nova-core: Blackwell: use correct sysmem flush registers
Date: Fri, 20 Feb 2026 18:09:45 -0800
Message-ID: <20260221020952.412352-32-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a03:505::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 130d6b33-6da1-4f41-a45d-08de70ee6483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9NC4O5n/2ovrS4IxE/gn72uMi32nIpEZUIFwIm8xgpLBKBfoui3yf8lH/ks6?=
 =?us-ascii?Q?Ggoa/2PO6C+CDjHTCcQjDdHtA1C6xL9/+a+ZYZQvZclrrqymx+KucjJ3Tjme?=
 =?us-ascii?Q?cafrLz6OIFlHr64rogvj7gBctCEamJ/4W2AfRZXOghY1am4wU3ZGiOugbyMH?=
 =?us-ascii?Q?objBXjjkcHmVXT7wW7dAnffMzCpvJOfAXiOAWeRLVyl3gH/RJOBaKuFbGQTe?=
 =?us-ascii?Q?K4RZofmlHB2HQktVXsPpyJMDeKis7y/R/gZONe1zfvFpjYKRdpqJKtGUciOc?=
 =?us-ascii?Q?CUzZZfMMrQI3gqrAagn4BZrPyCOmxAgtjW/MvIO1Adh1QWTe7JFCwAK9GwXP?=
 =?us-ascii?Q?YLFQbAFFlH7EAuRLW2VPX3lcNhsSff4sQZEb/uSYBpAfr8G+EXOyTSng1Uni?=
 =?us-ascii?Q?yuS1A5wTJ7PZfhbiCmYiX/hWG0dbfiz3gcZyAXQU+2wHP9IRgYKPLhQvjb9s?=
 =?us-ascii?Q?3TGqw1diT86+znrlYjYcajZIo90lKcwtSSQWhjkP21Ap1UEFDmNH6K7OMPdK?=
 =?us-ascii?Q?vPHeh0mOorgyur2ldPnvllO1HbbZZeGxW3cGEVsx6ZCU9AekHO9QTF40EFzz?=
 =?us-ascii?Q?L84KSBzgiG3ualtMoMVB7PP+4nNfmD0i3bA9sD76iTV64xX9UEMuW8O6eLfE?=
 =?us-ascii?Q?sbLKzujUFhQLd2NX34CtFmK328grPEHpN6iLo5G+If9Wse3Hf6jasnVMgeYo?=
 =?us-ascii?Q?0NHfUE/8Uh0u7dI9+3VCN6rYifQ0B3f9YGIIPbc2H+arfw9ez9oTJtQ2I8XR?=
 =?us-ascii?Q?rnIkrxN0xi6sfcYiN0Zldk4MK/BPoJ12oBZcU0YeYQ16jXuvPdb/yPINwQYB?=
 =?us-ascii?Q?QrKt3xm0vdvOzRHX2Whv/s3OoJghn/kaot+b81Y1q5TOndTr6j7Y0iZNxg8X?=
 =?us-ascii?Q?6DI+MZwMB+8JZ9AgLxtDjoBp7L+5iRH6FFmbpl7dtgy5eM8j8IYVG1DMDfvl?=
 =?us-ascii?Q?w40BcnyOqaAiO+irA9NIy2NtJQh8akAZTIKG3yOn1N0Cq9tQB4NwG/2lPfHw?=
 =?us-ascii?Q?LhHN0lbAaN+IkAxgxRbpIjfUlt55ldM9hBk1J8l58SF+xiUcqXFSD2shiN46?=
 =?us-ascii?Q?vvMX1rud3+E9FTHB1Kmgzzkpe+RfmV3Hrv1/L1LLkxdyVYyla3Imiia5vAu6?=
 =?us-ascii?Q?qm8me2zx9tpP87iglm+A51M3I4x5yP5PeDc6Pa5xfv0teCycWDoTFlmEH/z+?=
 =?us-ascii?Q?P1jvvmlTFqg7CilbBXJpgHMUOT6BwqweFtkZLyrOkhOf53UiNV2LM4sa83Fb?=
 =?us-ascii?Q?2gJRHYTh4Jkp5aYS4m/ir2KhxCxugYdqpdUzVWrcsUfVnLTCSODHq815fvyi?=
 =?us-ascii?Q?K//o9CEbYv3FD0DEaGH9LsEAvumkQZ/J/Hso85MvpjqD2jj30LlLzom71DF4?=
 =?us-ascii?Q?V98oHZVvhXv6sf4IO7aTp1WwOOefALOnP/hMS+bLxAWvmmKQbj5cbZniVW9N?=
 =?us-ascii?Q?ICEx5YHeRGF+4G9ThJaVGg+tKOQZj/7PXhqYd7ZmCxnvi9aAkKlbViBHuyJF?=
 =?us-ascii?Q?s7Uf77bYG93XGkd2/DZjn3VNYpJAL1f39famddnBw8ISa4KPrEXqQ6O8IhBy?=
 =?us-ascii?Q?VPkAYZvc614zeQ/vmZU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?11kgi0oTKSQAsKm+9BVKWiJYZ5E51q57oThSWXjVv+yVXY3qCnB96ht7Sug+?=
 =?us-ascii?Q?p5ehSNeItLhVJEd0PcwdqyN+K8N0oYoR4XR+X0/+USJElqVMMT/zIreZTORo?=
 =?us-ascii?Q?VqyKc6bFCt8tWJ+0ZzW8Sb1S/z+FmweJGGyY11OOdIoyjTijQOE1c85FqAyg?=
 =?us-ascii?Q?/IlDhFo9Csb0bYENV2FWzYc2+yGq0+/v9+vuD47hoKYNIP0m7FywB5Q+sjnR?=
 =?us-ascii?Q?SXfULV0P63SPRV1I9khYA5I0XGdkR/VfUn1vwkszZ24IpLIeVBo7INs9Qfu5?=
 =?us-ascii?Q?pfGHXVlX1pB+1U145xqWXgtha4G8zLa29oLJh49qWfyHJ0n7MN0OHBTUEZ42?=
 =?us-ascii?Q?fBv3o+CDKDZyuW3C/IAyBuVJTqZ0KwIZMro470p4jVTK3uHUhuaAUSm+RHKa?=
 =?us-ascii?Q?cfiHxDg9Nh5DHS8rNn2WPGcAteCz6jV7SjVplQOBcXwdaxPciygt9BSvIrq1?=
 =?us-ascii?Q?XjPwvNrVcFPSBZ6Od0iFyt+TV6YuIAHd7mXnmMn/xr97RabzOu5aZWwn5aDg?=
 =?us-ascii?Q?mZxmvQauJ4tGdL8PLW3bAZVoOQvFPERIyXQfZNSi09AcflHqfnxXoYvvndu7?=
 =?us-ascii?Q?MsE9bwH0oAYdYSJqOjTJ20NEzgwsd4tnfrfgwI+v95QLRbHZocLG/Bb7rSvm?=
 =?us-ascii?Q?54nH1N8gTxGGt5K9IBj2cyEegwdHKtSDemvKbnkBFFzXX30LO5mHnotQXvqo?=
 =?us-ascii?Q?u3S7VIDPRo1kZ8GmHYcR9rokOKwpf5+Iokwg1asFSFPcTJUm52Zha6serXCi?=
 =?us-ascii?Q?weI4bCKzsLE74kT8ZKiQFoxUhaM3bKcAKq6E0MX036aOVZ4DfWr52i0nkZrK?=
 =?us-ascii?Q?i2rs5GlKmp8eQrSAFXLkrf6oEiHMDwgCVE4JA9+hGfH2/ZgBDHDQF/dNhNef?=
 =?us-ascii?Q?NdBtDYtOSEQ2/5nFNY0nh4Y1stpxf/0+zEcQ52Gd92hd2POSr1RwX9lRYAjx?=
 =?us-ascii?Q?KdFcDDVIMEyPQp/esfjQayGYNmQw2D0BrNVUTE6gtqY2298oIJV9xD4kWMwP?=
 =?us-ascii?Q?LQzqtCbfclJwQ25PKodm5jupHcu8LddO71lr2Il2Y2P5obUvnLNWanN9iGPT?=
 =?us-ascii?Q?sEUJpinUOQrHUdsU7pHVOtF9yOkQkZPvLQ33dlU5xYwmBmMX+EsixqEu6zUf?=
 =?us-ascii?Q?sRBdriyNHWrGb4FQFGb0lxK1SArapbhywKE2yXrYq3b2Gb1AFuA5KIzvJjcD?=
 =?us-ascii?Q?4eu1qZswc31cYPb2klEoM3/7c8NoGmLySsxPhxsA8HQzn+Uay/zGSgRYISju?=
 =?us-ascii?Q?43CHIoSeoVfADnEcnQtI/8FYMzP05PW9o0Ku1gUFnA+VkvDFtElbu/TwtuoQ?=
 =?us-ascii?Q?lVbBaZ2zW5kgY09jRdLJNNM5cx72QaueY9IpTbl1RJZqoDDcVs6KBM0x5aoL?=
 =?us-ascii?Q?t2AldrX/vgXA1RLZDctwvYKU6kD4OpXqnnhOOSA0jRDtO+mLwet20m/vfhXt?=
 =?us-ascii?Q?PjIzg6MLWQmJGQDlQqeSVvOnDiuRRUz97+BnjpUPJ8qYsbXU87g+tUiOq9yH?=
 =?us-ascii?Q?fxFCxUyPiI0U76as9nHc3Dl2+eaCahrE7YuBI7KLRIqg4iSWzDlDe62WVUbl?=
 =?us-ascii?Q?pJp0YeqmaloYiU8fphOII3A02YWmDA2AgHMdx9hLUp5tHHrIILJ1QjouPlPZ?=
 =?us-ascii?Q?yA4LeNycWgOnJh/Wz3pC8vefcboYMFRVY/GZrVO8IEnJSODK4UQN+Mq8zatH?=
 =?us-ascii?Q?39TxyhGfqUf8vXDZoSBJQbX1UMJu5YqTysq2x0xce7DNXI9VxmgUbDVurBk6?=
 =?us-ascii?Q?X64bzQDSqw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130d6b33-6da1-4f41-a45d-08de70ee6483
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:32.5576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D17eX/CGyJtMLeBri0sI+6YRdH2IzTbhHOJoa4aIDHV8TuhV0yMODjolTCeIxT+Vpwdcz+OnkP3vk/CxJG8Wzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Blackwell GPUs moved the sysmem flush page registers away from the
legacy NV_PFB_NISO_FLUSH_SYSMEM_ADDR used by Ampere/Ada.

GB10x uses HSHUB0 registers, with both a primary and EG (egress) pair
that must be programmed to the same address. GB20x uses FBHUB0
registers.

Add separate GB100 and GB202 fb HALs, and split the Blackwell HAL
dispatch so that each uses its respective registers.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal.rs       | 10 ++++-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 47 +++++++++++++++++---
 drivers/gpu/nova-core/fb/hal/gb202.rs | 62 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs         | 36 ++++++++++++++++
 4 files changed, 149 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs

diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index ebd12247f771..844b00868832 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -13,9 +13,14 @@
 mod ga100;
 mod ga102;
 mod gb100;
+mod gb202;
 mod gh100;
 mod tu102;
 
+/// Non-WPR heap size for Blackwell (2 MiB + 128 KiB).
+/// See Open RM: kgspCalculateFbLayout_GB100.
+const BLACKWELL_NON_WPR_HEAP_SIZE: u32 = 0x220000;
+
 pub(crate) trait FbHal {
     /// Returns the address of the currently-registered sysmem flush page.
     fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64;
@@ -46,6 +51,9 @@ pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
         Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
         Architecture::Hopper => gh100::GH100_HAL,
-        Architecture::Blackwell => gb100::GB100_HAL,
+        Architecture::Blackwell => match chipset {
+            Chipset::GB100 | Chipset::GB102 => gb100::GB100_HAL,
+            _ => gb202::GB202_HAL,
+        },
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index bead99a6ca76..831a058a388b 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -1,21 +1,59 @@
 // SPDX-License-Identifier: GPL-2.0
 
+//! Blackwell GB10x framebuffer HAL.
+//!
+//! GB10x GPUs use HSHUB0 registers for the sysmem flush page. Both the primary and EG (egress)
+//! register pairs must be programmed to the same address, as required by hardware.
+
 use kernel::prelude::*;
 
 use crate::{
     driver::Bar0,
-    fb::hal::FbHal, //
+    fb::hal::FbHal,
+    regs, //
 };
 
 struct Gb100;
 
+fn read_sysmem_flush_page_gb100(bar: &Bar0) -> u64 {
+    let lo = u64::from(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::read(bar).adr());
+    let hi = u64::from(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::read(bar).adr());
+
+    lo | (hi << 32)
+}
+
+fn write_sysmem_flush_page_gb100(bar: &Bar0, addr: u64) {
+    // CAST: lower 32 bits. Hardware ignores bits 7:0.
+    let addr_lo = addr as u32;
+    // CAST: upper 32 bits, then masked to 20 bits by the register field.
+    let addr_hi = (addr >> 32) as u32;
+
+    // Write HI first. The hardware will trigger the flush on the LO write.
+
+    // Primary HSHUB pair.
+    regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::default()
+        .set_adr(addr_hi)
+        .write(bar);
+    regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::default()
+        .set_adr(addr_lo)
+        .write(bar);
+
+    // EG (egress) pair -- must match the primary pair.
+    regs::NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI::default()
+        .set_adr(addr_hi)
+        .write(bar);
+    regs::NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO::default()
+        .set_adr(addr_lo)
+        .write(bar);
+}
+
 impl FbHal for Gb100 {
     fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
-        super::ga100::read_sysmem_flush_page_ga100(bar)
+        read_sysmem_flush_page_gb100(bar)
     }
 
     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
-        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+        write_sysmem_flush_page_gb100(bar, addr);
 
         Ok(())
     }
@@ -29,8 +67,7 @@ fn vidmem_size(&self, bar: &Bar0) -> u64 {
     }
 
     fn non_wpr_heap_size(&self) -> Option<u32> {
-        // 2 MiB + 128 KiB non-WPR heap for Blackwell (see Open RM: kgspCalculateFbLayout_GB100).
-        Some(0x220000)
+        Some(super::BLACKWELL_NON_WPR_HEAP_SIZE)
     }
 }
 
diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
new file mode 100644
index 000000000000..2a4c3e7961b2
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Blackwell GB20x framebuffer HAL.
+//!
+//! GB20x GPUs moved the sysmem flush registers from `NV_PFB_NISO_FLUSH_SYSMEM_ADDR` to
+//! `NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_{LO,HI}`.
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal,
+    regs, //
+};
+
+struct Gb202;
+
+fn read_sysmem_flush_page_gb202(bar: &Bar0) -> u64 {
+    let lo = u64::from(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::read(bar).adr());
+    let hi = u64::from(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::read(bar).adr());
+
+    lo | (hi << 32)
+}
+
+fn write_sysmem_flush_page_gb202(bar: &Bar0, addr: u64) {
+    // Write HI first. The hardware will trigger the flush on the LO write.
+    regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::default()
+        // CAST: upper 32 bits, then masked to 20 bits by the register field.
+        .set_adr((addr >> 32) as u32)
+        .write(bar);
+    regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::default()
+        // CAST: lower 32 bits. Hardware ignores bits 7:0.
+        .set_adr(addr as u32)
+        .write(bar);
+}
+
+impl FbHal for Gb202 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        read_sysmem_flush_page_gb202(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        write_sysmem_flush_page_gb202(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        Some(super::BLACKWELL_NON_WPR_HEAP_SIZE)
+    }
+}
+
+const GB202: Gb202 = Gb202;
+pub(super) const GB202_HAL: &dyn FbHal = &GB202;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 77d590887ee7..91911f9b32ca 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -116,6 +116,42 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
     23:0    adr_63_40 as u32;
 });
 
+// Blackwell GB10x sysmem flush registers (HSHUB0).
+//
+// GB10x GPUs use two pairs of HSHUB registers for sysmembar: a primary pair and an EG
+// (egress) pair. Both must be programmed to the same address. Hardware ignores bits 7:0
+// of each LO register. HSHUB0 base is 0x00891000.
+
+register!(NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO @ 0x00891e50 {
+    31:0    adr as u32;
+});
+
+register!(NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI @ 0x00891e54 {
+    19:0    adr as u32;
+});
+
+register!(NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO @ 0x008916c0 {
+    31:0    adr as u32;
+});
+
+register!(NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI @ 0x008916c4 {
+    19:0    adr as u32;
+});
+
+// Blackwell GB20x sysmem flush registers (FBHUB0).
+//
+// Unlike the older NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers which encode the address with an
+// 8-bit right-shift, these registers take the raw address split into lower/upper 32-bit halves.
+// The hardware ignores bits 7:0 of the LO register.
+
+register!(NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO @ 0x008a1d58 {
+    31:0    adr as u32;
+});
+
+register!(NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI @ 0x008a1d5c {
+    19:0    adr as u32;
+});
+
 register!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
     3:0     lower_scale as u8;
     9:4     lower_mag as u8;
-- 
2.53.0

