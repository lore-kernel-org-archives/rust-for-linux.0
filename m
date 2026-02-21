Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53323370E4;
	Sat, 21 Feb 2026 02:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639880; cv=fail; b=KL147Odw3Re58lLL5W+dNHb02+UNvNuM7VyjgpCHlKT+/zCGsCGJIY2lrRkq2F/z6Q4YCpZT4/QjUiV1xBUs6d2bJQw3xl2YaMtNUqqhbjUUqrPin2fghrK1DPULyQ6S4FaLjxXMyPyN0WTaVfR7UX1QDZCeZS8xDgk1StyRBtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639880; c=relaxed/simple;
	bh=lzqpiPzaTY+BBLkKfSrRdWf+vH6Oe2pEodox4tuo+/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DYaudDPBc8UM6hjeiu0z49k2+Gmlutai25jjfR19RxYSU9sEtyJdC0FqcadL0dlnyHJVFG83Ux1AfXH3+QBF1p0TysBqgpgepXI+avF5xFPXX+Dwnk4hPGMxZbn+BMeOOr26VP06fMIy1mw//SPotDsAeS8BpF5phLz7OjW3IFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oxS79qX/; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oxS79qX/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sO28iqFJDn0QKFtT9guXVQjhOjp+mpOFNFxSCNCi+fWOuy9PFNjNEraiOLDYes6GBzBZZqaqws5AybVUi/oueH2r1ghPB3pWBPjAHcwNfxoJx3SI9PT7/VBSOjiZZ+cJRgi+WhnodQdVb//FjBt2xK/XMPoMEC2ULKjclz9Dg3tWCXVEgj9y1sWunYM5EU8oxrFRh41ujoOxayYlP5ir/xBW5G3ssdQj9Sr2IU//WjU0mXxu8S6921vfiWYEDK6aeheXWs2H29YeCrDXxmn3AiU5ZFmTLUyRHrMIzpIVj8PdePEl90r0GaT7m8b9Ivm36A91KxGZEx49ZDgorWaRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZXs611y+D5vvFvY6PCjyvtnr8lSx3H1/9stYdMndig=;
 b=vzAfnx3ifWG7v01XrunTBcDzJE66dJwq7VVLcb1TzoFgTuG0Si+IX7BoRVZY5vZeBwPRqm/KseW0jCGb0IPlFQGGJtiYQLFPytTRopfIW3x4cJt2bPxZgrDuLyBS1syLbCqcueUXZS6ipPF5S69aRPsaWi4pShokluQ/s9BLy9uA5h/l8V7VcWKBxg+gSI0Pz78NFN4nzw/1QKDWDD+B0b05c0WeRmy56cCA1hu0NV+LcsrI0t/TLFOjHQuRmGd/sIvkcmPYQEOew2QW26sAsjmWD9Ty+qxEPniBac/reZYoSQLAQDk2x0B9DwFHJ7W79w9FvM3TnlSA1PuP0jKWWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZXs611y+D5vvFvY6PCjyvtnr8lSx3H1/9stYdMndig=;
 b=oxS79qX/iSbsLgKo8JRY+b1+KWBdbbKOphPCqvWll9v5Es+KAlWpB/hKbbO9rknt5zhMACbK40sVgtYpHmTHpydtmKnKCnJxh/T97z63DVEs66bxCFOHajrc3FjJW/3F1CN9WZmnHWXzlEnVAVpUXG+eyT28ng/HO6NEgxnuT4Xi8khKUYcADO2FXvLdfBVRu3Tu48nc8I+kYrR0BAIpsz3uaSTTAoOmkegdLHPsYcVuGXjpOI4xFQLhbrIrPJlbyUnUKNjxf2Pbl0XqrumiOAF6cILt9DkLHEk7Yp79f1OmaSNWMXLe0C+FFZmYnItGkGO54wOUMpAE+34M37Sw+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:11:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:11:03 +0000
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
Subject: [PATCH v5 34/38] gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
Date: Fri, 20 Feb 2026 18:09:48 -0800
Message-ID: <20260221020952.412352-35-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d8787c-2e16-41cb-2aa8-08de70ee669c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VPCXZNGWXd4dlVyBtZ/f/AkuEg+g1LwCotQ6NfqUs7j2qF80EVwwXuaj0yW/?=
 =?us-ascii?Q?PQ8Uvm4j6oVOl+bo+Cnvh4ZXlso0wYvoTX2nFo1PkK/N0qWq0orkPeQ6JHVI?=
 =?us-ascii?Q?m6hSfxiJoj5E2qZaKLbzLSrDGjkehDdreknvmwlEKd64Y6ti/RF80RVbKUJW?=
 =?us-ascii?Q?3377g7IKs53jEf+SOT/rmvrGsnrylCd+A3lvn9R/LUue8qEJJihN82+LY6dx?=
 =?us-ascii?Q?AXFGRTkUVLhOKZncxPviCtKL0tH22/o3ozvvkIL7Tu/QG6DYC2yI0GXDn0Cr?=
 =?us-ascii?Q?r36YEqGSou16OYB2heHsCC11xn8v5tGOR7oCTc0Rqh+JMnTmWjmElMRWuYZB?=
 =?us-ascii?Q?8w4GiVLmBYIp5DoxrYIXMzYFxOJRmY5VnAmir0RnMXFSBB8fae3mVJoHeIQt?=
 =?us-ascii?Q?0RVaHeZVRArjlt7SjYFiJEb0uSgpcGRMUDkV9ZmTTxeS3ZO3Ibiu5aOnFuvO?=
 =?us-ascii?Q?Rxw7WKvIWjM7oQLP/Ct8YCCFT0Iq5HUtF4vh+1CFD+bSEc52ac0MP/qM7tXz?=
 =?us-ascii?Q?MmE+E7djmFJz3bECFcP+PzYTo9+V8Lz0vFSTZxisIPWS104K5g2dR2rkcx6J?=
 =?us-ascii?Q?RrQGobwscntsk/pACIo6dHj53lAUGAb2WqKeuWfOoCP7ez+/XUzMMsLtIdc0?=
 =?us-ascii?Q?SVWxyDzNeBAxpc3Q5A5TFWdiLXhKY3OWiiK0ysxJIl929GWM/EIkFYUjMnRK?=
 =?us-ascii?Q?O9Ow1lQmEXlSvFXRKUNGAlrmMo/OF4MpdKMzdjCXKj9eAw/iuK2Gamz3e/E5?=
 =?us-ascii?Q?xO3ZRMEeSJseYdZUKB5GCfYWEgnmB+Vp6NQEOtYojSC6AhcWkxG0bNiInVRY?=
 =?us-ascii?Q?AI7Aa+IOlLTVJY9wRAZ5vttml4XsatZGgIn+vg9ETorOVCvcpoR5maS3It5w?=
 =?us-ascii?Q?W8SU/00rHvTe5mub3pzqGpAiNra/dTuLpW02ZuLZJgQ+in06EuKkqVs1yqaB?=
 =?us-ascii?Q?ccBopooXaHJKtF+GOeN9ejCWjcRW9kekts550x7DMr08Eifr8BHYE5g6hRJJ?=
 =?us-ascii?Q?6kV4X+nrq5MFYE27AWsAPjTahnswdtSG2L4VAcUpVlNmhTyrJ95DwdB5VhVO?=
 =?us-ascii?Q?hfoYjPdbrQskb4aJ3LJkTU00/xIPFaVrBxpm+Ij3F0vYwsbpvSONbwdLbYIb?=
 =?us-ascii?Q?aWpCoxOsbrwxfhH5rLcfSZQ0e2E9vxABjTTg2SBblABf5xGKbKM4CYm6RI1p?=
 =?us-ascii?Q?67fYVbZEMsSohsYDgk9lQ8xOzpZFexMBPPCUYNKPdnd6LdMmLwmnrRcTTfdl?=
 =?us-ascii?Q?KosKQiTxw37HaOi84VFvQ2hEBy4YlCx0wPR8kfEHF/WUT6EnBxRHI0wiBGt7?=
 =?us-ascii?Q?/5r9rozF/c1jEJ3C335YclaWt1fX6nQtHLbI0aYmDPonIS3It9iR6LJ3Tyw7?=
 =?us-ascii?Q?65YbzT0wHkHuGb0GnJKdIgqixObVMOZZRtgPzTGt5zppz++6ZRddHyWKRztn?=
 =?us-ascii?Q?tueh/TFAwvI0erY1zxU+AzU5kPOGafh2m1aP/EYxNfSz48YB/lkJVhOn+n6G?=
 =?us-ascii?Q?60B8lg6Oqz0OmFQPA+MK8nNUvp5CgbTo8s8JLfPb0aCaWbHU3f2WbO0mE+mx?=
 =?us-ascii?Q?BbYofwa7qKV8KWfuhwE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YercFifs9v2zuxP3AYph21E7Hpojbmu+T8baOTScJwCcQvWoeqq6pCONLnFo?=
 =?us-ascii?Q?exHBvrFo6CYDbiON4kDcMwc2sycVuTTNzz0oC8QS7/Fw18uiy1iSTUWXIf5I?=
 =?us-ascii?Q?QlNPccqewOM9hEa5wocWrpeuGBGC7vBJTrwnzPDH02A2g0hGDzp6XKbclkUi?=
 =?us-ascii?Q?4vyoYLmUrADZEhyGypQ4tAX7ch0VUhdtEmsOLpBOlcRaXZMPxyfivbWye4WA?=
 =?us-ascii?Q?/9oqJ9UdfqxqIqq/E7dRTpDLMqr6R16ThiWQymtLDQu5od9IEqI1hYX6l2E+?=
 =?us-ascii?Q?RHQajSyPEiJ0yvi3h0P/EGEyDTDU83sswmCnpGeJy14XTtfySgUzaqGRe2cB?=
 =?us-ascii?Q?UoD+TjPlylgRvzRFWrQg370st2piiFUPU4x3/LbZzbbPFHiWiMAZ2A+Qv3dU?=
 =?us-ascii?Q?G5M55uSLV/FdntVQme8DyaBNw2umc+dvdfgant4dd2Cl+JO0vqaQQDSsZRjf?=
 =?us-ascii?Q?d6bnE2MAyA36bsdHlTSo83Nd/SoS3yGYvuhrlVKmNsjmTC/CUG8ku10qe7tc?=
 =?us-ascii?Q?bFVYbXh3ZviVuQ97duAgpLqFdAcrHxSZrgMqyAD7aK/ZG1w2xq3hqWvDOTZw?=
 =?us-ascii?Q?kkWLq7kUCB1CRNsMWNW4Mn7XEA616+g5TlqghyocnAI5geD1DttfpVwSUbP/?=
 =?us-ascii?Q?RE1alq9dvDSHl5RhwfNEkPgrflFglA1WkYq2+T/pkEwqBVJs9ZUbHK00kcg4?=
 =?us-ascii?Q?09WV2J3WbFiAqrr9g+gFTtEDhCHUQ3F9Ipdbx0mYuLK/DcAix5ykBk5r4BMh?=
 =?us-ascii?Q?MJ20Yu+NTYhZ2wv83vm9PwCNeZXdVZWyYs6nrM2sXofuhTlekCTrxfWWDHYJ?=
 =?us-ascii?Q?E1XAxkqMzGrCRExPCHaVfwQ2y3uN+6L2OaO8tUUuQ5WmhqGuHQfBqYGVsAwC?=
 =?us-ascii?Q?LrCaSWy7Ob0jk97t5ZnUyB+heQZO/3HsuLuXRGr27gIYJTVi0+QTnn+S5MAN?=
 =?us-ascii?Q?XbjKVYD1eqKeBynuDBdiiky6AMKVhou3OrmdNSe94aSbzzeNzvADxwa1oY9j?=
 =?us-ascii?Q?Sd9USgGgDMRkQUru3JlkB4EUieQRrc4AuPZVxrH5A08TH0F7e1+U71miYD6y?=
 =?us-ascii?Q?kq8kO4Ohj87ZUGEYxwoLt2LHYs3daza2GSEUEBEECRxJY+eROQ99ly+t3KfA?=
 =?us-ascii?Q?XW/JYG1SA9BljaE2UOSHogipN87xXtcArM9vqRVLT34aBj2QzpbKbFYgQX0T?=
 =?us-ascii?Q?wiiFAWbj4v706hcx5dhOc+12x+FdEK7WbZ9T0HGe0NNQUZJph0LE2mdK67aj?=
 =?us-ascii?Q?A7zzuja45yN1nU3kYaAyNcIjARdKyWR+yAU6YHwvm5hKrDOD/vjhvvtQvQNK?=
 =?us-ascii?Q?gozP98H4ZrPOJxLlXCJpVcNEEmvLK/T4/8iKzd9Z9PhVZKZ4VOrxWn5KQjeK?=
 =?us-ascii?Q?wlZscFog5Akh/wecKhcJKkgPDOzRD4v4jLLZ2n/mjnKz6p+bFJKJKs6+E1Sh?=
 =?us-ascii?Q?+otuDbvx7OK2E2K/crzoIoSt86Ue8d4L7B3AifNoPVM19d3MGfnPe3itoRel?=
 =?us-ascii?Q?iuON9pFAI5Yd/FVsGuQebPbwh2tKOJmgABnLBoNlfQiFx8TmLNbTXYj0MMBR?=
 =?us-ascii?Q?XFdAtkxjN+jzWiApUExeM16xcAusZdlx7qai091P1AYt24n8Bl+u9kpNAs6q?=
 =?us-ascii?Q?mdwR00mRQfk2fJ0QXzC7+ByoSjlF74KCrd+sgDpzRIbRhuMcrifffDrmSCgB?=
 =?us-ascii?Q?H8BUSZDpStKONXgOtK+nyYGN/VzzNe7JK3ZgeUEzLwHcoobgec5FI7ZmKYAA?=
 =?us-ascii?Q?J/EnyILLFQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d8787c-2e16-41cb-2aa8-08de70ee669c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:36.0495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAWW8jQtTNeeTP8YQuY4HohXlWtym6Dd8rwYCK+vuN1YrHjkC55k5ewYBuI8BIS8B3j8rQhPs1pD5QjjgfjtTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
After FSP Chain of Trust completes, the driver must poll for lockdown
release before proceeding with GSP initialization. Add the register
bit and helper functions needed for this polling.

Cc: Gary Guo <gary@garyguo.net>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 80 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs     |  1 +
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 7b177756d16d..5f3207bf7797 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -15,7 +15,8 @@
     falcon::{
         gsp::Gsp,
         sec2::Sec2,
-        Falcon, //
+        Falcon,
+        FalconEngine, //
     },
     fb::FbLayout,
     firmware::{
@@ -43,6 +44,54 @@
     vbios::Vbios,
 };
 
+/// GSP lockdown pattern written by firmware to mbox0 while RISC-V branch privilege
+/// lockdown is active. The low byte varies, the upper 24 bits are fixed.
+const GSP_LOCKDOWN_PATTERN: u32 = 0xbadf4100;
+const GSP_LOCKDOWN_MASK: u32 = 0xffffff00;
+
+/// GSP falcon mailbox state, used to track lockdown release status.
+struct GspMbox {
+    mbox0: u32,
+    mbox1: u32,
+}
+
+impl GspMbox {
+    /// Read both mailboxes from the GSP falcon.
+    fn read(gsp_falcon: &Falcon<Gsp>, bar: &Bar0) -> Self {
+        Self {
+            mbox0: gsp_falcon.read_mailbox0(bar),
+            mbox1: gsp_falcon.read_mailbox1(bar),
+        }
+    }
+
+    /// Returns true if the lockdown pattern is present in mbox0.
+    fn is_locked_down(&self) -> bool {
+        self.mbox0 != 0 && (self.mbox0 & GSP_LOCKDOWN_MASK) == GSP_LOCKDOWN_PATTERN
+    }
+
+    /// Combines mailbox0 and mailbox1 into a 64-bit address.
+    fn combined_addr(&self) -> u64 {
+        (u64::from(self.mbox1) << 32) | u64::from(self.mbox0)
+    }
+
+    /// Returns true if GSP lockdown has been released.
+    ///
+    /// Checks the lockdown pattern, validates the boot params address,
+    /// and verifies the HWCFG2 lockdown bit is clear.
+    fn lockdown_released(&self, bar: &Bar0, fmc_boot_params_addr: u64) -> bool {
+        if self.is_locked_down() {
+            return false;
+        }
+
+        if self.mbox0 != 0 && self.combined_addr() != fmc_boot_params_addr {
+            return true;
+        }
+
+        let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &crate::falcon::gsp::Gsp::ID);
+        !hwcfg2.riscv_br_priv_lockdown()
+    }
+}
+
 impl super::Gsp {
     /// Helper function to load and run the FWSEC-FRTS firmware and confirm that it has properly
     /// created the WPR2 region.
@@ -139,6 +188,35 @@ fn run_booter(
         booter.run(dev, bar, sec2_falcon, wpr_meta)
     }
 
+    /// Wait for GSP lockdown to be released after FSP Chain of Trust.
+    #[expect(dead_code)]
+    fn wait_for_gsp_lockdown_release(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        gsp_falcon: &Falcon<Gsp>,
+        fmc_boot_params_addr: u64,
+    ) -> Result {
+        dev_dbg!(dev, "Waiting for GSP lockdown release\n");
+
+        let mbox = read_poll_timeout(
+            || Ok(GspMbox::read(gsp_falcon, bar)),
+            |mbox| mbox.lockdown_released(bar, fmc_boot_params_addr),
+            Delta::from_millis(10),
+            Delta::from_millis(4000),
+        )
+        .inspect_err(|_| {
+            dev_err!(dev, "GSP lockdown release timeout\n");
+        })?;
+
+        if mbox.mbox0 != 0 {
+            dev_err!(dev, "GSP-FMC boot failed (mbox: {:#x})\n", mbox.mbox0);
+            return Err(EIO);
+        }
+
+        dev_dbg!(dev, "GSP lockdown released\n");
+        Ok(())
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 91911f9b32ca..8e4922399569 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -321,6 +321,7 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 register!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
     10:10   riscv as bool;
     12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is completed";
+    13:13   riscv_br_priv_lockdown as bool, "RISC-V branch privilege lockdown bit";
     31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
 });
 
-- 
2.53.0

