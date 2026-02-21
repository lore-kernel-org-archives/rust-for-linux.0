Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAABC327798;
	Sat, 21 Feb 2026 02:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639866; cv=fail; b=Fm1uytaeG5u6gyDtLvYhoynXvqD3ukqzDDfV7kdAG/wRgGO3kvMJv9Zu4h+kLn+PNl8GmjWuMLeEVMgIn0nbefhrFDMWv4Lzjvob2oUHpb8F5HSIQViOiZV6nDaejRaHZDVTYhMviiSxpbHscT56C9lFFVQ/v3G7jzQK0k77RzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639866; c=relaxed/simple;
	bh=+EjrO/+3kilAKuL/7tww3kPU5NuK6Rogu/gwlb7FnqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OJIJUkz4rvo7KzSSirFSiXRWRokQA3l9181S/a/jKwdYehDNvPWL8eG7Q70Wlckn0TFlx450RSOabquNDzxwIoi5U6h7xPHu6kiGHYUUxv2rZimAvTlcBzqa+YMduwFDHVCQXNhe6Xw1lmK4PHRKtnig3XRDJg95/Ju+iyzGZdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HI/Kiy4J; arc=fail smtp.client-ip=52.101.62.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HI/Kiy4J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlOX0+fucs49JWO18rg3khiblv+j2yVtEEoLhm7o88dCS5duFwGRI/IeOv7xYJxzv+VKFEe76j0zfj2txuvPfXZ3MeVgw4kuKsa4JVaQ2xo1h/TfK3N3koI50kCy951FmWtSigcFuDP6zqiQwHcbcyHTzOK7D+s3WF2OM+SqCabgT+GgRC5CSd+YGhfbtFeC4RteVn1ZqArN7JYaEtZlUpPn+QH9RGk/hgfFs9p77gkC2ZbHxMgnyAe2xjghX8pj5hChEwH8gq86ELVSQvM0pIN2N+iiEx6Xd3y9D3tM8PNl305Y/h/dem5i4BRlDtoFPzujR76e25MVzIzWKCzfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k27gWRVgZ4FhUhR3H4JHGrAda7/StCYEelvxPvcBRDI=;
 b=aWwe++pRcGTOpXZ/apxMPsvn4e5yhs7j4CnXnq2B7q9CJY9zV7NkjzR9AwQ0/zu3EEPmwuSnHgdAzX5mZ/iPBhyNizf5izA/DtZyAjvEpQiSduWKxqNUjFCkAvkV19YiOnbwy+GMiP/hNBel+aRIXSn6NJJ4GAGXLRTf9hVCApagcUZt/6Xq9y4VBQd5TKt5kCdtHca98GZBPma3ZrcdnLUyfUv55O7p4DroAk+MBASRWgUKuqWLi1P22DbFFP11jAyvJtL6uessq5OGVdNT96dUeWlBd522o/Dj3Ifvqf1+fOjNTZWOkE8hXh4/l7Xz4Jmhh4qH0oZ9naVkmQc5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k27gWRVgZ4FhUhR3H4JHGrAda7/StCYEelvxPvcBRDI=;
 b=HI/Kiy4Jfu719eldr/47t3O4QtN2/RJdDrgr49LHZFpZ0FJqytJYcYh5wS58kQmnbAfBejXohbj4f5RGUUoZU25TVoKAc+ynAFGLhQ+D8tYX99LFq8i67dLvQyrscdOKHb2jWi0iaO5C2nq3G5lCdnWDknwFtX1pbA07YX0ZZUzjhxq81JvGTIge2PXfVmmi8CpkEyd37OXEbZJAufAQOOSctPiQTofT72PNVVb36vcQ96DVk6Heo3CHAmyL00lYCEZ5bUf3V2BqGBtXCmVlgVaveCBNmKZmfUlD0Os7yuR+c6mqz5wQ89OKZUD8qv/neaSzc9Emw6sk0jeAjUsaAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:18 +0000
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
Subject: [PATCH v5 19/38] gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
Date: Fri, 20 Feb 2026 18:09:33 -0800
Message-ID: <20260221020952.412352-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: aa053b22-d9a8-4e4d-d783-08de70ee5ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TY1nTIadZqt0CFSYUDlSbnni6YI07oRruwbAzOg+8WFocYL8Xn9vGVBg/4ib?=
 =?us-ascii?Q?C2NcLkQVUM2uWCON+2gv3GjMizhyJMQUXnCDoadvRIIiNZOW51Imwb0UANwS?=
 =?us-ascii?Q?jN7/IZMthK4GieeEQJ2VDfTAysdre7kNNiZQXgcWM8BWPI+ODIWUa31am6P6?=
 =?us-ascii?Q?N1U+CqLYBLoi3Tr7OweHxoG6xEl53fDjNhn1HCWQldHKUaWaDKuGC3QbuXMO?=
 =?us-ascii?Q?lnACn0t/285p2UcaGsaulnsPLCVh1fkblJOEYHg5hiOlZAGw5IInydhNRFSi?=
 =?us-ascii?Q?fG5b130ehuRgltGRQpDlhJezMxw/taQ7wfWnNUYf5pTf+tcEhtapLIEvhYWa?=
 =?us-ascii?Q?n9qTugAI5MblPCc4pbOfo1TgbIh+2QuRH4ZyT8h+0F835ARQqjyxQOg6+w0V?=
 =?us-ascii?Q?ExycB6gs5TcLS95i/KNy+wWEKf5d85ygpfkNF42snnZjl5jMWOSaEzus992E?=
 =?us-ascii?Q?md4NcXG4Wd/yjp0i/0Gyvqw/xqd9kVOmM+V2WRXc9Od0SlQIrKE6+1ApTjql?=
 =?us-ascii?Q?7cH+bAQ1c2SMkZzX2aFd9thFUwQmzRDhQPz0x+zr8enBkPfwAni2iIZsBlsM?=
 =?us-ascii?Q?Mm8DRDf80jceLEmIR29pPAJB0VvTXYUoqJlezvMzg5BipHD7HXXSpA6viZf6?=
 =?us-ascii?Q?Px6W41QTTvIu/ybzyQT3u8T/HXzZEPt+EcSY2xNTSOkGcgDI/fmDsHxG6uOd?=
 =?us-ascii?Q?XdpmfOXsr5YPyBFWUVv5brbWylyxoZZPy7sM6hbeCc1GBv/A8bn4Pbw43gQM?=
 =?us-ascii?Q?8KgRPonzu69dM6H9qbGZp1dbw3oxVxa3wS0FDiXiZ8OzAulXtcex0YXdDht2?=
 =?us-ascii?Q?iE6BzhghwpHfIDhcoedDF6bBRTF947MYazchp1f+TNa8i4Wfu/A+a8/tIt5N?=
 =?us-ascii?Q?kIbR17JzJBjCybj3pR7vpld9k764caHsqb5We7yYnbEs4FRk4aX5sC76so7k?=
 =?us-ascii?Q?1H4viUGa81UOBITU98AC+pk57oQdkot1+VIx97d7dH8ZdHjY83PhAzAOQ4on?=
 =?us-ascii?Q?EVFdsisNrwyiMv8dT+sih+CkN7xiP/RraXl37evySiJLB1mWM9s7aByJjDSA?=
 =?us-ascii?Q?8P8o0KmRF85XjIeA4qdb82DXa49z9nvHbriFaQMMvCJrvcOjoSoilGXKAXjK?=
 =?us-ascii?Q?/DdY6tw++3eRev5r/Jhmim0Qu6be+3BDoasqnGRQILIwTYGoANjMJREeoz/s?=
 =?us-ascii?Q?29YB0KrGd3NGrh+UFAjj1NuZXjW+09g7bUdGFCqazKLUPJGypQjpsTP2OLaT?=
 =?us-ascii?Q?DhMxZnXI4rlUTziqg5M1baxadVbyJizqntQJqI/ALSBuo4V6PCBXc29vLT0S?=
 =?us-ascii?Q?JPim8cg4ekVK1VoAXApdaPFBqTuZz6oTDl1UzgCL7gkg323lZkGqnMMXHvnX?=
 =?us-ascii?Q?7U8nuBqlm+rhN2eRjZSxgCnuVzpas9HBu+JmvuuISPky5EaiO8VzVN9ZgO21?=
 =?us-ascii?Q?l/cmCm6prM//BTC7r40L4crYoD9HIRuveSPYwiWB5TqrjBuXI4XhLKfrEWay?=
 =?us-ascii?Q?j2eWe+WjPPUb2AbvBoafm/s7R+nbp0giXm0dCiqhuQwcJnhbxCwXe7oMQSMb?=
 =?us-ascii?Q?Ddh0gaTEsfmcVCu2/lU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VLGNE2NJFhiXzWUZbM82OnSfyRz0+U/39B4dkJD3pdTq6j8znuqkNacKpkMG?=
 =?us-ascii?Q?4hy80AnwTHTiygVqP4RFncGRPX3bdaVdo36YRdDsCyCT1kvHXSeUeYet4czh?=
 =?us-ascii?Q?QrC6NUX95FmyH1t7q8FE3ne86yat9e0J6a0nqHB7lD4U5aHVujjPScpG9cZX?=
 =?us-ascii?Q?VCA1RQNz+HGOrFCcUqZakanqbwBnDkYFFDj+2nUfKHxLum9yfFewaxXsR75G?=
 =?us-ascii?Q?9ogG2wXv+xziUeqHV0sQAOBnxadD5h0JP3VUC/U7PruN+fz7MBdbbfM7nKOW?=
 =?us-ascii?Q?ws3khLwZz666ocmgQ94gZSeV9/eORMvBdZof+iyBG+qhZ+ZYlvBuNtOgY3q5?=
 =?us-ascii?Q?BuDX5RiX3FAzSVrk7DUFPSTLVeSF45UqCrusBu0yr/O8+XANRD1krsjlEVMa?=
 =?us-ascii?Q?N+td15TWsAQgwkqyhLNi9Np39Ek+MCwVLqouDrpLFWhz7tCBu10QpK1K52CB?=
 =?us-ascii?Q?GsAF700Gjj4rK1ZuL60lZOI+J4rLhZei6X4SIC5+qFcN5R1Sfw5Ayqn76u+Y?=
 =?us-ascii?Q?/GCMXPOZcShUlCga0eBfWQsxPSjpek8jk/SEM0yXwruiJTIlWPpAvPumfDYm?=
 =?us-ascii?Q?ggx6GDN8/ZRsekL6/z3Y9lNaESMNg9pZV+AEq/25SSRJjZOioa2Xp+P4wsZG?=
 =?us-ascii?Q?NIC3IKgMPEkJv7aqTonBl8b7gzKO9DxX48OzfY0CQZ0KmtPe7YQhAR2VXIjW?=
 =?us-ascii?Q?H9t75ZeXc6JPsXw1puVFREQNn/jzPVZosprh83LEvwlksuAn3Xg21q+ERAkg?=
 =?us-ascii?Q?WWwtW/r0hZTV318WxeSqdFZuhFqy2NSLQOo4IOxrjPWBEE9Mhndoj9JMzSUz?=
 =?us-ascii?Q?oUkCKor9TkXZrvLf0ZS72gCCAcjigbMLKT/5PnsOrf0Plu43V57c8hJi/ET8?=
 =?us-ascii?Q?F+vvFKe2OYoBzVaTeDG9TuRABM5gRN/bYGeLKpDMDjhX7H67pJqc3/JidRop?=
 =?us-ascii?Q?XOqmcNjdYTZhOKu1sYx7T6JJfPas7VDhKPhUZC7sgL9uXv/BbbbfZ7TgIt5c?=
 =?us-ascii?Q?a7U8jhZoWPYRbQV+p1YtoYBv6pXZMEfYUDKBJijiYHpV0Yw1byR9G9xkATzf?=
 =?us-ascii?Q?5tvv4iGaQRyXfEWeCyQA6FIh1iodPBIXNOb0ZY8w6piRFY+eSMUeWfRkfvPl?=
 =?us-ascii?Q?9a6AfFuaW4J1gwDH9/30R3jXDbmiVHnPExJ2pkJ2cQdzjfSN/qPAw4zr11qd?=
 =?us-ascii?Q?B3Fwh2T/fTJBGqzqUR0T6YYwMroVGx9BndVoA5bmxECVwe9LwFHWzLQTYdsG?=
 =?us-ascii?Q?FE65VKYl7ckiBFEhtTq3gkuA3hsDtAlkLfVIJdMtS31NJSlGZx/O5ZowF48G?=
 =?us-ascii?Q?bjrNbH8A4Q8HWgoan/kN0jM86ETfOFM9NEoa6YPVJvSE6DidO/OANVDOnGHF?=
 =?us-ascii?Q?HNAZeFzxoSrOaAaFow7e3H+ApWrEGoe72C7eSe6AhKdVvk8ZqpL/Dy7FIqLF?=
 =?us-ascii?Q?5I/HuAItGt790gh6vaSW6KYdhMQpu6AMmjyDbywPtIIgYRA1KVYT3J3aCl8U?=
 =?us-ascii?Q?LVjduTgyUP78dTEUof9+bEjkTXE63tWIIQSkon6LweD+hOPTxtTROU4Mu+55?=
 =?us-ascii?Q?/6KNQPGc35qwPRE6D/6c7HRA7lrwqabNxBvL3eKmyyCI4I47AVUefkKgRnfW?=
 =?us-ascii?Q?1wYv7neoiR71GE41cPW5pTuW7H/KL6d06Hl6cWeKbdq6aZ3jv21IoCAbrP4D?=
 =?us-ascii?Q?Pi74IWJ/ZfDfMabKTUWlrU/YPs7hRtFSyJWylB4r4X9kTmOrOBvRoNUyD8BA?=
 =?us-ascii?Q?fWNsBgkcjg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa053b22-d9a8-4e4d-d783-08de70ee5ba5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:17.6652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htLvqMGttfAOP3yut8LPhw32cyvveJBl4eYhtXl2xP1EragFmjoPWVnJg5XwqtDW2TkqrvA0nRip1CrrDQMkig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Add external memory (EMEM) read/write operations to the GPU's FSP falcon
engine. These operations use Falcon PIO (Programmed I/O) to communicate
with the FSP through indirect memory access.

Cc: Gary Guo <gary@garyguo.net>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 122 +++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       |  12 +++
 2 files changed, 133 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index c5ba1c2412cd..4baeee68197b 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -5,13 +5,26 @@
 //! The FSP falcon handles secure boot and Chain of Trust operations
 //! on Hopper and Blackwell architectures, replacing SEC2's role.
 
+use kernel::{
+    io::{
+        Io,
+        IoCapable, //
+    },
+    prelude::*, //
+};
+
 use crate::{
+    driver::Bar0,
     falcon::{
+        Falcon,
         FalconEngine,
         PFalcon2Base,
         PFalconBase, //
     },
-    regs::macros::RegisterBase,
+    regs::{
+        self,
+        macros::RegisterBase, //
+    },
 };
 
 /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
@@ -28,3 +41,110 @@ impl RegisterBase<PFalcon2Base> for Fsp {
 impl FalconEngine for Fsp {
     const ID: Self = Fsp(());
 }
+
+/// Maximum addressable EMEM size, derived from the 24-bit offset field
+/// in NV_PFALCON_FALCON_EMEM_CTL.
+const EMEM_MAX_SIZE: usize = 1 << 24;
+
+/// I/O backend for the FSP falcon's external memory (EMEM).
+///
+/// Each 32-bit access programs a byte offset via the EMEM_CTL register,
+/// then reads or writes through the EMEM_DATA register.
+pub(crate) struct Emem<'a> {
+    bar: &'a Bar0,
+}
+
+impl<'a> Emem<'a> {
+    fn new(bar: &'a Bar0) -> Self {
+        Self { bar }
+    }
+}
+
+impl IoCapable<u32> for Emem<'_> {}
+
+impl Io for Emem<'_> {
+    fn addr(&self) -> usize {
+        0
+    }
+
+    fn maxsize(&self) -> usize {
+        EMEM_MAX_SIZE
+    }
+
+    fn try_read32(&self, offset: usize) -> Result<u32> {
+        // io_addr validates offset < EMEM_MAX_SIZE (2^24), so the u32 cast is safe.
+        let offset = self.io_addr::<u32>(offset)? as u32;
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_rd_mode(true)
+            .set_offset(offset)
+            .write(self.bar, &Fsp::ID);
+
+        Ok(regs::NV_PFALCON_FALCON_EMEM_DATA::read(self.bar, &Fsp::ID).data())
+    }
+
+    fn try_write32(&self, value: u32, offset: usize) -> Result {
+        // io_addr validates offset < EMEM_MAX_SIZE (2^24), so the u32 cast is safe.
+        let offset = self.io_addr::<u32>(offset)? as u32;
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_wr_mode(true)
+            .set_offset(offset)
+            .write(self.bar, &Fsp::ID);
+
+        regs::NV_PFALCON_FALCON_EMEM_DATA::default()
+            .set_data(value)
+            .write(self.bar, &Fsp::ID);
+
+        Ok(())
+    }
+}
+
+impl Falcon<Fsp> {
+    /// Returns an EMEM I/O accessor for this FSP falcon.
+    pub(crate) fn emem<'a>(&self, bar: &'a Bar0) -> Emem<'a> {
+        Emem::new(bar)
+    }
+
+    /// Writes `data` to FSP external memory at byte `offset`.
+    ///
+    /// Data is interpreted as little-endian 32-bit words.
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(unused)]
+    pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let emem = self.emem(bar);
+        let mut off = offset as usize;
+        for chunk in data.chunks_exact(4) {
+            let word = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]);
+            emem.try_write32(word, off)?;
+            off += 4;
+        }
+
+        Ok(())
+    }
+
+    /// Reads FSP external memory at byte `offset` into `data`.
+    ///
+    /// Data is stored as little-endian 32-bit words.
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(unused)]
+    pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let emem = self.emem(bar);
+        let mut off = offset as usize;
+        for chunk in data.chunks_exact_mut(4) {
+            let word = emem.try_read32(off)?;
+            chunk.copy_from_slice(&word.to_le_bytes());
+            off += 4;
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index ea0d32f5396c..b939ec2d5bec 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -431,6 +431,18 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
     8:8     br_fetch as bool;
 });
 
+// Falcon EMEM PIO registers (used by FSP on Hopper/Blackwell).
+// These provide the falcon external memory communication interface.
+register!(NV_PFALCON_FALCON_EMEM_CTL @ PFalconBase[0x00000ac0] {
+    23:0    offset as u32;      // EMEM byte offset (must be 4-byte aligned)
+    24:24   wr_mode as bool;    // Write mode
+    25:25   rd_mode as bool;    // Read mode
+});
+
+register!(NV_PFALCON_FALCON_EMEM_DATA @ PFalconBase[0x00000ac4] {
+    31:0    data as u32;        // EMEM data register
+});
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.53.0

