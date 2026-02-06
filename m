Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011065.outbound.protection.outlook.com [40.93.194.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C1C2E0B71;
	Fri,  6 Feb 2026 04:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351703; cv=fail; b=YNxRlb7KuGRTbduuc6n52uSDwZ8YHgld6z0Y7Z3noQ54ibURvRB6Ao1aJapbLTAmjXnPpBq5uTZSKMscjNdv6z6OCcaoV4wwjkKT2Z8zy4RskacxshYrRMGEzrpPfmzwvMB6+ahhoH9gi4RneGRLoSfhj+Wrvv45XYIKmozKrXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351703; c=relaxed/simple;
	bh=kEeu+dEaMVyGoV7AvY3R8QlpoYfFFfgmy5Fmw9FuOiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sSPUAet64HRb63qdFcGdaB4mofZpvCGVGknS6DXp08AGNaPP+wclUD6KolsZrFg9lUeuPPYEqn5zedw46neiEvhQN6Wa3S21nkN4YCp4roJnwQ1QTxrBysNC1mahN3MVN3q11liFBkG7qlqJgBudzBfgMejSlOrwozxiC/eukO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A78dVmjL; arc=fail smtp.client-ip=40.93.194.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A78dVmjL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toX/QQwWOYA5DrNoWkUmf+S06bkxiC6TN53au6juw3W00mExlzyFuSrHoIipYi87EGoj+rK7r8UHLkuHtFPmwd328L1ho6BjcKiOD1mrhv8aQxvUULE9+qGBbNy1FBh04ZBgkoANZVU4QwcIxZcxu/zk3dyfq+OTMaK9StJ/AdwRerw1kk7j+TPU/KKyjxtLkYNJPKrZ6qLZWB5QBNsgNVlqCf5MC5cNEPXhjW94BcRJkzmMU8aV1IoZj2DaikCIj7pAwUHxzOnXtTVjEUT0TZmvzwbdtYvqE8aBkSftFoFKuMfJeXMTthNo4Z5oFwBpOa5QJ135KAUV6RHzl/6/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEy3nocAb9TnRmAf1N8PqwJ5GnBhz084kqbdPNR4WLM=;
 b=ew9x7e3RpbBQINzMUpS1OU2QsH5mv4DR4dzjAgIQSC5Rpo2nxR0pmH17BM/FULmLLLfn9pwNh5DI8Z7d6dYIwaaN7w6Rk9PJPl4AM80J9yAgh+8/GUC7TSzP0w+V/HQ9SDC36RjKe9ez11wN8AHI+F+4wtcoJ8khPtErnw8bm6wiH81TWMS0Te0TWzCR2NQz81lp8EXAemF0Og7fjBwuW9XUGz/XVDtOFqZ+i8S01EW/voSLBbmf8sf2J3QTlp6tBMizzY3N3DsWR0q7QViIom5172mttNsSePvcKtutMBoICeyh93pDHHYlNTJunwFkOVEYwz3KVAbyay/4FRhyPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEy3nocAb9TnRmAf1N8PqwJ5GnBhz084kqbdPNR4WLM=;
 b=A78dVmjLsQGaQnLLc0uc91pKyAOVApc5I+jky7+SvmSzwpU4nr+fTKdc5/04R6QlUR01C+enkzJAq9+FTOjlchFr5jVN641xfmOTbzN5C7uTwRGs0fe4y/qK1YEI9YMKhTMMVJ3amx9DXNkrpq8ApdtYi3IfyBPWtr83qiIDlCfuqY9zh5yblconTheP89Jq7b/eC+MK1tGbtVPXloHzww11pJdbXps5Cdr0kyxuOhJ3WLyz7/vUueQANGlPjTgHq+hNRC7fHFHTj2tni2L3fYJUahbJ6KzFup+8fVg1yXlR18XjV42eq1anWx1Hf9YYnruFRqDS2f1Sd0ujG+VrXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:38 +0000
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
Subject: [PATCH v3 09/30] gpu: nova-core: move firmware image parsing code to firmware.rs
Date: Thu,  5 Feb 2026 20:21:02 -0800
Message-ID: <20260206042123.303281-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: aa21149c-e4be-471e-e12d-08de653738a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0M+22GViQGmUe1xf8zK9EGZ+OLIhucPfSr1F5jjFXbsMoJwwSiNe6ZQ37Yw2?=
 =?us-ascii?Q?WgfPBSYDGJqrl5JGDO9YjlMGhfW5W9kzzHxEzJ8j0sbxibBRnUkGrq8FMN00?=
 =?us-ascii?Q?hpXCzVEGYKX0KxfpV+vehaNRaW6vPx2e6oZJjsL1Ws8dH3GOSsJCixjTuD0R?=
 =?us-ascii?Q?4ne70H96lwuovQcSvzAcj8UL1zT01BdYU+m8ieGPBONMeBmU5CaJB7z7QhYU?=
 =?us-ascii?Q?jDnK6BK+UsTEFjsrcDJBvQOR36+1sY8cZoWbypHpFdooVD7JfrBNIdY7xtpy?=
 =?us-ascii?Q?P/4LRGJvm5KrR7bdPn23BjhP8VnVxMOt3MOfNzVySRvR/KhVY4oyvvxdUHYG?=
 =?us-ascii?Q?iSt6HrwWePnVayV6W7EJxWPsj5P4gjtTfeZU74+r1o5EAW0QlvVIOrRyfL+7?=
 =?us-ascii?Q?pjTMjGo3+Gb2PC+4pooFVyLliRvaJ9xrdr+heNW5W1p/WcRNHhOF/wMUTNjq?=
 =?us-ascii?Q?3dptFf3HtTYsAZ2dhvfhPaD22f6S+GasnCy5bP1NBjzxFO+2EnQlwsDNGQVr?=
 =?us-ascii?Q?XpyUkk+7Vyjud1uAQ/t3vtMXUMvastxgTA7WUgLxNiQhcqCQpI1aBVMysi9Y?=
 =?us-ascii?Q?WQj3mAzExiMYEGRwA8gjuvEvPOUQkBnB5Ctdm5o26SYXuqSgCj5TiujidtOn?=
 =?us-ascii?Q?rH22J0CRzjDN8DQ0De5gr6VK0UrwBLJrHGGNm2s2Kdb0w/icg54AgDLn8ybf?=
 =?us-ascii?Q?FmmLwom9amasC3FCoHzI4rfsWtJpmt/cyO0i+MpoAh5BywA2InUbR9ew4AWX?=
 =?us-ascii?Q?MEU4t4EeKrkPMxISrgMZhx74qbtooen51ZovA0HwuNMGbdRgMfE9n+tzqDsT?=
 =?us-ascii?Q?vbdPj9HV320W00DegIxuAlBrqemlhow5hBMUNu2s29gtEB84RNoHiRKQHTOw?=
 =?us-ascii?Q?uo3bSVuAkaKV35NdoK8EC7JwU/zUpCmvpdx5Y6jllhapfjO4dM8bQ7uohiI3?=
 =?us-ascii?Q?l1Ur7KNkm12kIVb+KHe1MMPtw0bSK3ABqb3ny9Fue1no5AgM5xwKf9Ms8frn?=
 =?us-ascii?Q?44Xqa1SgLFBwOfNFMvjOV5zK7/AAEvv5pdxngi82NeMgdLtqPEGvauePephB?=
 =?us-ascii?Q?HgEdSKodg/CxvM/a9web2HtaOaHhdqctn57XZzRWWRugMqXPCRKBKTCsQrhf?=
 =?us-ascii?Q?14G/sh3ppdff5CSa/RomXcJB1+VhH2t5dPmJktVKLwexH91XlPgcGYdCZ0/8?=
 =?us-ascii?Q?L/P7o6E2TBVR7O/XVXyIQRpnqL6CiEfGqxhBUADdB7xBwTkA1j6qa/Ic3lIk?=
 =?us-ascii?Q?2AHoZQkm+ZXf5qGfdhpep4wpMu2RvG1vh1aJVzG8ItI07w0hmUbSbjCdTkMy?=
 =?us-ascii?Q?2L0TsiaHc9MpnkT8mIYYFqtKN1SA7iFBJuTqTOBNJjhVweYPfAXTOMkHEVm0?=
 =?us-ascii?Q?ZIJLLu8T7nhZOqpOxUGqrmFbadd/AhFuTL3T+e2wmMwVrD3zGw+GnwPmGAif?=
 =?us-ascii?Q?OgHeE+0BNOaXklRxqx2b4gB+qn841VoNY1YDdaUsuMvJTXu9oWybn+RGk35Y?=
 =?us-ascii?Q?gQztaIZ9q18GZbKxrOljnDRhYCdpyB50VLCf5S7bmGSfnz+S8gnJJpd5B7JT?=
 =?us-ascii?Q?XzbYJ8Mlh6un6OrKqkU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hEnN5bvbE3vfUO56dw7VrqTW6qFmiUMQ1CNS9O5iZAOpDTTcaosbTNAdZrrx?=
 =?us-ascii?Q?YLIb93OLG1q7VgklW2kNCggP6JnASBekU/7Iw+fHzMh+PrYu+02WGAkAZmQX?=
 =?us-ascii?Q?JkmOWDyW2/xdXaYwOEZo394VX4xqG2zyycEX14CsEod9L5FHZd/I1uNEme6N?=
 =?us-ascii?Q?W8e4Z02Uk6oX93nB6rZTw1kiw5aWMufYGKEZBSyy+mRImENZe68f9Jh7j1GI?=
 =?us-ascii?Q?yc801ld6MqTuq65jg/ZwHdJZjd5ZGdGFzyoreMUP0vRtRJ+f8D8APIby4io2?=
 =?us-ascii?Q?0lYclEFWAJcnfmB8AM8ukCeZw7Yn4PI7BLVtRcvPyWxFrHkCx/ZJVisFWUjy?=
 =?us-ascii?Q?foFgbbEF67n8q7kCjDwtZNFQuw+Kd+1IRXU3PtzokcJiqg9NhUeNJuLqdD/T?=
 =?us-ascii?Q?+ln1ORIWJTBi59fc8pJCNQPeiVj4f6lPpMOAPJwAzm43/y4zauRJQ0qD9Hax?=
 =?us-ascii?Q?LmLVyd2/OknBFzzsaVM7ii7BVXT4qVaXnokg68m8B+MJJag2KF95rG9Rsqbb?=
 =?us-ascii?Q?/v7mIjMvDFOcxws8J9DZilAJIqLjuguSCYWsnbqm2cYuvJvRoYCdXGfDmx1X?=
 =?us-ascii?Q?6pQJwVotmoulXdZtyDMvkRaU7R2Q+hg8UUHPkOQCbY4pFNOYTtQyWCVdxfey?=
 =?us-ascii?Q?knT0MrSjlnDQ2cArs5f5eHmbc3hlP0PzdW1LqVcudutdDf0y7a2ZKsSy1ZBM?=
 =?us-ascii?Q?OKHX0uZgx2Do1eVktvYRcwpSuALorhlcALqzoNdA3UrXlY42OXGim6pqx7R9?=
 =?us-ascii?Q?MZ7cM6di006lbYtlttTypMSp2MygQJq/1MkHFi1v8uWW8ZVbkpfb/So9mUYk?=
 =?us-ascii?Q?9KZcBC5ng3XxO2AsUUBGBaup1oKwEpmd9khPMPxstSgvF86UJLEzIGLYt0Pf?=
 =?us-ascii?Q?eCeS94h/TmCbFbqVqrK6BaZ1iZMTKsakqDIjaA2yDJFiTWKEMqLxTnNVqscT?=
 =?us-ascii?Q?HTtgMd7Hoia95pppyJpU5/HHB9AoEzR4bPFiZ2zqqjv7w05qIQs6yeauePqK?=
 =?us-ascii?Q?XZ8h722xLBxCoVEzwUl2smrQLaeLotLodH+ZAMpZhA8UOHkBSbblKq4wqWe5?=
 =?us-ascii?Q?BL6BV812A3bn253C3A01lD5gvKF5JEsFhg/0F7+OregYRIYy1keECEIeHALe?=
 =?us-ascii?Q?HPe35HEnjctxuaBe09uKN/uxeIfsqNt+GmUHWQBE//jBHNBWA7J1IBYC4+P/?=
 =?us-ascii?Q?/8X2lgdWV3WoaAJFpsFE13FSCUmJlv2hE3oe10ee2piOO84FoERvtc84wC39?=
 =?us-ascii?Q?9TwkXliu6k89yq4EoiChaKok3RxdB1oPY0Or1iX1YBIMlgUDZvTdYOrydVU3?=
 =?us-ascii?Q?iXWt5iURp9tjFuewSv3zW16MumDUznPU/poqeKVjqdOkfppjSDa649VQRqQK?=
 =?us-ascii?Q?A6K72ZGSTf958En6lAyDsW59d0Zq+L419FQQvMDpgYx3UNJ3eVlYRfyve5Ns?=
 =?us-ascii?Q?nu+Dl8Pba0Ho0T2DSDt5UklGOIwY1SIpU+hZHgfOo9+i4HwU95Fwgz7CKpfa?=
 =?us-ascii?Q?WEpYdiIRHhOvnxXi6HN8pI0lUjxYc3O+dfJa3vuKo1mgT8yERiH3C20G/SDi?=
 =?us-ascii?Q?grEtQyI9yqzgxNaYAXYCSRJIzrzyMv/HZpSoT4E0RfjoCzFD6T2Vg9l7kgQt?=
 =?us-ascii?Q?U0Ei6sskricZeYw8fPoo7qsLinwt/Ixx4EcWZngm8Hn044A6EHKLQ0bMhxyE?=
 =?us-ascii?Q?631SjRFea7e4+TQX3vdbNW0S8RhNDsQcOUhfVnY7T0vAtOop0liEpynpv+56?=
 =?us-ascii?Q?F9/CCslVPg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa21149c-e4be-471e-e12d-08de653738a8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:38.2720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnO5C4m9xEY1gygmcOU1eTIbb5gOf80a0pvhXa5yPOUaf7PmTFzQpfMSD9JpbxyMoPY52JZOrVO8Ka3pLwlORA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

Up until now, only the GSP required parsing of its firmware headers.
However, upcoming support for Hopper/Blackwell+ adds another firmware
image (FMC), along with another format (ELF32).

Therefore, the current ELF64 section parsing support needs to be moved
up a level, so that both of the above can use it.

There are no functional changes. This is pure code movement.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 88 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs | 91 ++-------------------------
 2 files changed, 92 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 68779540aa28..a0201ac8ccb4 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -437,3 +437,91 @@ pub(crate) const fn create(
         this.0
     }
 }
+
+/// Ad-hoc and temporary module to extract sections from ELF images.
+///
+/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
+/// to specific and related bits of data. Future firmware versions are scheduled to move away from
+/// that scheme before nova-core becomes stable, which means this module will eventually be
+/// removed.
+mod elf {
+    use core::mem::size_of;
+
+    use kernel::{
+        bindings,
+        str::CStr,
+        transmute::FromBytes, //
+    };
+
+    /// Newtype to provide a [`FromBytes`] implementation.
+    #[repr(transparent)]
+    struct Elf64Hdr(bindings::elf64_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64Hdr {}
+
+    #[repr(transparent)]
+    struct Elf64SHdr(bindings::elf64_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64SHdr {}
+
+    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
+    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
+        let hdr = &elf
+            .get(0..size_of::<bindings::elf64_hdr>())
+            .and_then(Elf64Hdr::from_bytes)?
+            .0;
+
+        // Get all the section headers.
+        let mut shdr = {
+            let shdr_num = usize::from(hdr.e_shnum);
+            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
+            let shdr_end = shdr_num
+                .checked_mul(size_of::<Elf64SHdr>())
+                .and_then(|v| v.checked_add(shdr_start))?;
+
+            elf.get(shdr_start..shdr_end)
+                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
+        };
+
+        // Get the strings table.
+        let strhdr = shdr
+            .clone()
+            .nth(usize::from(hdr.e_shstrndx))
+            .and_then(Elf64SHdr::from_bytes)?;
+
+        // Find the section which name matches `name` and return it.
+        shdr.find(|&sh| {
+            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
+                return false;
+            };
+
+            let Some(name_idx) = strhdr
+                .0
+                .sh_offset
+                .checked_add(u64::from(hdr.0.sh_name))
+                .and_then(|idx| usize::try_from(idx).ok())
+            else {
+                return false;
+            };
+
+            // Get the start of the name.
+            elf.get(name_idx..)
+                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
+                // Convert into str.
+                .and_then(|c_str| c_str.to_str().ok())
+                // Check that the name matches.
+                .map(|str| str == name)
+                .unwrap_or(false)
+        })
+        // Return the slice containing the section.
+        .and_then(|sh| {
+            let hdr = Elf64SHdr::from_bytes(sh)?;
+            let start = usize::try_from(hdr.0.sh_offset).ok()?;
+            let end = usize::try_from(hdr.0.sh_size)
+                .ok()
+                .and_then(|sh_size| start.checked_add(sh_size))?;
+
+            elf.get(start..end)
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 10761716ed93..d482dca8cce1 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -16,7 +16,10 @@
 
 use crate::{
     dma::DmaObject,
-    firmware::riscv::RiscvFirmware,
+    firmware::{
+        elf,
+        riscv::RiscvFirmware, //
+    },
     gpu::{
         Architecture,
         Chipset, //
@@ -25,92 +28,6 @@
     num::FromSafeCast,
 };
 
-/// Ad-hoc and temporary module to extract sections from ELF images.
-///
-/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
-/// to specific and related bits of data. Future firmware versions are scheduled to move away from
-/// that scheme before nova-core becomes stable, which means this module will eventually be
-/// removed.
-mod elf {
-    use kernel::{
-        bindings,
-        prelude::*,
-        transmute::FromBytes, //
-    };
-
-    /// Newtype to provide a [`FromBytes`] implementation.
-    #[repr(transparent)]
-    struct Elf64Hdr(bindings::elf64_hdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64Hdr {}
-
-    #[repr(transparent)]
-    struct Elf64SHdr(bindings::elf64_shdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64SHdr {}
-
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
-        let hdr = &elf
-            .get(0..size_of::<bindings::elf64_hdr>())
-            .and_then(Elf64Hdr::from_bytes)?
-            .0;
-
-        // Get all the section headers.
-        let mut shdr = {
-            let shdr_num = usize::from(hdr.e_shnum);
-            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
-            let shdr_end = shdr_num
-                .checked_mul(size_of::<Elf64SHdr>())
-                .and_then(|v| v.checked_add(shdr_start))?;
-
-            elf.get(shdr_start..shdr_end)
-                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
-        };
-
-        // Get the strings table.
-        let strhdr = shdr
-            .clone()
-            .nth(usize::from(hdr.e_shstrndx))
-            .and_then(Elf64SHdr::from_bytes)?;
-
-        // Find the section which name matches `name` and return it.
-        shdr.find(|&sh| {
-            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
-                return false;
-            };
-
-            let Some(name_idx) = strhdr
-                .0
-                .sh_offset
-                .checked_add(u64::from(hdr.0.sh_name))
-                .and_then(|idx| usize::try_from(idx).ok())
-            else {
-                return false;
-            };
-
-            // Get the start of the name.
-            elf.get(name_idx..)
-                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
-                // Convert into str.
-                .and_then(|c_str| c_str.to_str().ok())
-                // Check that the name matches.
-                .map(|str| str == name)
-                .unwrap_or(false)
-        })
-        // Return the slice containing the section.
-        .and_then(|sh| {
-            let hdr = Elf64SHdr::from_bytes(sh)?;
-            let start = usize::try_from(hdr.0.sh_offset).ok()?;
-            let end = usize::try_from(hdr.0.sh_size)
-                .ok()
-                .and_then(|sh_size| start.checked_add(sh_size))?;
-
-            elf.get(start..end)
-        })
-    }
-}
-
 /// GSP firmware with 3-level radix page tables for the GSP bootloader.
 ///
 /// The bootloader expects firmware to be mapped starting at address 0 in GSP's virtual address
-- 
2.53.0

