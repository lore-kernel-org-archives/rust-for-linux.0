Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD081328271;
	Sat, 21 Feb 2026 02:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639811; cv=fail; b=L9eqYHu08Q9aLnNrptstgqdC5hkvagMoH6MvASPa8x5IK53bmIEqQEjj0p0RC16nc3VxHq+fbw8Lsu+IkP2vmPffCyWqsHNQF1g79nF8wqOUaIACAoF/s2F75mPL3mZpvXptXlRyn6GjccVEm4jbeMdZ6js4SXkmy9ocxJrUeAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639811; c=relaxed/simple;
	bh=q2EkivGvU2P+eYMLEqj//OjNGuqH2GbLFLppjoCPS3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=br9XEcKaoGOY/am2W5aFq21/maGJnaTGCWzlcAY5rPMNA1TyZFE/AiP6ycLRJeXMsIsD+3MkdCvcvPOmvOMDz6vctrqdQiFqiTrLN5k1lG9ZjFGU8SM5hvTPez4aTUNCWeIDAwTltH/FGWCWuERC8DR2PB8r+FD6DvXiQ7hArXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PqkujFIA; arc=fail smtp.client-ip=52.101.52.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PqkujFIA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYDUW8DIc8l4i7Ed2dbv+rxDrVJ4pOjpu6AS3hgRkKajHpVQFWX4pG8KBeSOv0BDuZNvdYUCoa5NXvKBu2P/j2jhQTwXsFdQO5NJJxPsezkIvYOL3nvj7UR74HijJzLQwCOMdf1Xirk4x/EKTN5KVJV1prmSJSUvJazmLS+8sosEahsdBbi3IL9bd106btDgOYGrRjvdz/T/LOx+6Rs41MD3e9oM4niXuBzAvX2XENA6t4GI3RVsTZ1TpuqdhKFHmzQrQt9Mn/1uy8HIpHXxEPv0QStEwMBGxOtAzXAfIGii9wvGqCX/JJdxp7s0PQ6fu2DvoQtMVIAMraoaEct9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqu6UgZhrGkjCuXnDtIVD6K3ja+Z2MnpPsHWJVPdRvg=;
 b=yCn6lH430HQRNZZcWW7JxHexSiGe5gEUq8F5PrJR6xOQ96/y0PcXaOePFVtEC6HpSQukAes5SH6aTpqb2a30siHredD0fWxVTZMS/ktKllK5wLwu4e4Cz6MVM/tGQSzf3qLPtlaUZ6C3Gj/CaTkmThqq0bdypPXG/4YcGcyDG9G9UWqbYxP0aQZsuKrxFTSnFmYa1FYXBMq2Rv7BbcdTvC8iotwMK65cX64A3A35TBWa7c6Hce/kVUCPonEQNL5wMR7iP+Z10+tnbbz8Xv1VchIOW8A2rFmP/Aa86vH/A/eWzog9Rx95GmWYRn/IuT7n6txtoSSqjgSf7DCjRRTmyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqu6UgZhrGkjCuXnDtIVD6K3ja+Z2MnpPsHWJVPdRvg=;
 b=PqkujFIAbTL6n9U+H+RESm3yd4w6SyfqeGgSAogq23GHYexTvqnkEN1bIfKNq+gLagYpS8FdfMGi30GuTAjmy+diEMwEzdX+joZn7wF/BKnJOLg1Wp0QLB7bSLp3LrmdAaq/GHLCFCV8Ohwzf2shjOdBl5zKmPGIOQv91r+hrKTPYo+3vx3tFeBCYymuFKyRlddS4OgTgNtxc0Z4nY3VKeOXvwBdFooV++l0f1aKVWpuT4duYtVmVjJ42FUsYJW3A1gnqftt/G96J5ULgYQLoKJg4HJ1PQQWlAhDaZTgucfhLQX304BgmY80bHAJm9weO5DWq+8FMEuD18RSaRC93w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:09:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:09:59 +0000
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
Subject: [PATCH v5 04/38] gpu: nova-core: add FbRange.len() and use it in boot.rs
Date: Fri, 20 Feb 2026 18:09:18 -0800
Message-ID: <20260221020952.412352-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: e75cf30b-894a-4aa6-6a6c-08de70ee50bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?loomnyRflEfJCi1CVX3Ji6e3VmutX2IFeKvrtyVe61Cy50nW7ZGnBFMU728s?=
 =?us-ascii?Q?GyaM9GzQmzIYGrofxS03dxUprd9jNwGRTyth7vfqx7l0DnJemy5svXu9I0OO?=
 =?us-ascii?Q?7m2+7qE9B5AidSWadPj3cQQasrxnJWoNOBJwvrTTMKdJKdUsfj/zVcpsNwHf?=
 =?us-ascii?Q?a6j9/OoTl/FRgVlAfdvpJAE21m37aOsHY4bMFKU0l08GHIvhHLHXjDKXBUJZ?=
 =?us-ascii?Q?GDahk97mSFnjLaFcJM+PqZ+ZxpurIbGPHlf4PplMOpWeJB9cZqrxS51xR/Ae?=
 =?us-ascii?Q?tmifHIQ4zosEOdyTOkHDWhTEdJdCrP2vYqUHMmcKkNu6BVZnuT3/20SPApeZ?=
 =?us-ascii?Q?m4g0MMnuIR92+J5FdeaTjsy1M7Le4YRx46/qUSDF05JkyPgWA53NjVwM1N06?=
 =?us-ascii?Q?BZpFO9kzdMedoUmG70YzcbeK9FfulSkXySLDpsexdTUZnfHL9tLgPS1snaSG?=
 =?us-ascii?Q?Cp+Ph1plBXQxavCPlTYo7XJDspGAkM3KAc+rwoN65WNHAT1l5xyGun2LBa1k?=
 =?us-ascii?Q?UpkKKI79V5evdz4gbrJD0hLgEPMuP/57/tv5I6ugYOiz+AqM4eXknbuXxUc6?=
 =?us-ascii?Q?7wSSnZng1z+WmTdkGHtKUhfdisu4m7OHf8vYp/MRrHx/O9790BTLY3DFTtlu?=
 =?us-ascii?Q?w26YLsDlMt1GFq4K1BC4CYMSp9FNMYiJ4F0x5tfT5RN8a0ZajuUFQNdiUjtc?=
 =?us-ascii?Q?iMWqXXa21joPB5Su2fqvhjXcUVyP0ORq4bMghEkoQfUmBh6sAWnqIRv5UUXa?=
 =?us-ascii?Q?yIynwXSzH1/gqh3Jb2ViiSYocl489tWYUD+Uw4LB0bXUhrw15nGJi+JOjH1u?=
 =?us-ascii?Q?I2AVZ8I1rIiTg9tgTT8fM4t2A3H9AZZ+WAwqHAhosWg7qdcbivgoylfNVBiK?=
 =?us-ascii?Q?kc7rDZskofjDWA1CqkXfU4j6Ab8NdUWWXehSPbLQRYw3Trokhyrl7flCnMiM?=
 =?us-ascii?Q?vBbCv6k96Go5YdknUDR+Byvvs7d8oembmq2N3yaokAyYpmVJjcr03Fp/Q05Z?=
 =?us-ascii?Q?3WdDPqa4n7GJ+UDT35U2zXiOn+174DAL5Jg1PdQ/cGKPPpzsVTrAGfeE6O8m?=
 =?us-ascii?Q?1M/9lCAf0VoVQvOzncAo8ch+AQEQNItVbgLCFi/ys+mhPyBZ1bB0tzI/GSrp?=
 =?us-ascii?Q?voFbNzRQjdI4SfeXXuqp8meJX4yfAN68CjrAZxVVJCuzVM38Pj4XPCGt/z3r?=
 =?us-ascii?Q?+IdQPFYj3VEufdTo6CKrATqHZCdnHC07IhS+6JtG+RYU3u7b3g5u2SCBXS1I?=
 =?us-ascii?Q?AodugZ48IvdENvmtxQs59ENxhsH/4RIfCOh/7uCTxq4poZ209pUHSkfaV74i?=
 =?us-ascii?Q?TqwsZZVENn8gmkiGb8/4Xszn+cS00Q3dWloAVqMklgvBbWmQxZRIUL+ixDdY?=
 =?us-ascii?Q?Fg4wvDaIwum54eoKrlenAUtoG0xhFGJHTJy704RJyarnL6Y/zdOm0BT4zJhV?=
 =?us-ascii?Q?ctbbuR8vdY7xHnryFag83EJ0KnV15O107ThfbRw6cd0Eb41DrOncDOWRwBKp?=
 =?us-ascii?Q?lAyLgC+N1YvtVPahKJwks0nj75DcWLSegX5gaBxzIJLoyKr5jKJktGsrmp8d?=
 =?us-ascii?Q?q8og/9UN5vSSVmsX470=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zbdjHPaaX3GG/Hu9A1Eo50h4rsfqWp7XYbYOSuR1PwszT6/CtUu08kwiaigq?=
 =?us-ascii?Q?GSQiKDzVy6EDLZ7dHIx6gsRnFeNaQbTT5n8RjN8H9SuxJTIKmnP9t68GZSM+?=
 =?us-ascii?Q?11ptypdPxRz1FO7lh5ETzkPhwokm1U365aqB3LQ32vIGy2MxDf7ydGVpH17f?=
 =?us-ascii?Q?KCtWO/P5fm3LJJfpo0H6ybh3zesyCSL9i+pWY2y2WU/WfouyHkdqcxUTA00M?=
 =?us-ascii?Q?XGuT4M4rEa0w8/VdOcU2h8j8WAPAE+zvwOch7jA8th6X365SmMNokyF+qla0?=
 =?us-ascii?Q?U/0AQKb8ZERenRGRkfsUHL/x7ZoVrN3oflm8qexpSERTOm1CE7qDOpOKk19z?=
 =?us-ascii?Q?sA4tjlarr/fLNyNk8azByT37NJnY2S7MkBzclQ4WPS6/vb0G2/4lSUEk9aqj?=
 =?us-ascii?Q?ECfvADAM/+EKXeScW/Hq7uvCugRYTOB9hzXBS65wd0g8hsx7fRgQXXl7JJ92?=
 =?us-ascii?Q?Qjx6PRdEOfPoQoD3vRPdwvYJkOBeDKnbG8S6CK+2efjY07T6jhoH2Mog0CRs?=
 =?us-ascii?Q?d8GUIvgcZD/o7NWCm0jWfq0oxccIbkoZNuOv9C7syVgMioGNllb3vvC48BMQ?=
 =?us-ascii?Q?mzSPtX0ZAR+d5iiN0ZBotSHA13tMV+27jUaKIyhRAii3wC4NN97FTqXp3nba?=
 =?us-ascii?Q?PmeRboagvsmnwzMR1a0hK8iBVJut37QqD1CMChVXdg01Ub+/ZnzlUnGloHRr?=
 =?us-ascii?Q?B5UwPeU0PKS9VrqKeuQuLKniS0pOQGYLVpao3/0u2AXi53BcZAZpIYGLbPdJ?=
 =?us-ascii?Q?y3qDk3MFvIoojvOtP756m5lUZCMJkQnrux4CA0cbIiOqCPOsBBj531qZ4Wh/?=
 =?us-ascii?Q?NIYsWr6iALat6ZHT4+9AjNkgEHW9a5Lg5X1+ckIk4zvFO4YGmXlJ3gSD87jV?=
 =?us-ascii?Q?lAe7RenVIymzD/RYQg/itpz6yVg2euwQ5B1Wriu/QngsjIcQGJ+XBYhBJq/X?=
 =?us-ascii?Q?zQQ5LboOJ//HwbG2599z4AWaJmPGM9GHq7n9jZ07EYdOstdaVbfsqTNlWqXt?=
 =?us-ascii?Q?QyqYhk4ZoPr9zSaSGrNdJgfrEov9qaZjXpRGNEqk3Dy5XPMTq/mLiOb0evQp?=
 =?us-ascii?Q?Et6bbxZ1T0RkRiTd93GlVMJ9J4+oxLppe77CbO0sYl07J3Pq7rxuE323tUXQ?=
 =?us-ascii?Q?PgMWFX8B1KZS//k05/iFfs6LmfSl5O3nfZCAFlnyB+BDKueTr473fZe/iDF6?=
 =?us-ascii?Q?gVA+kM7oPbL0IBjdKbWurKOPyqTyp/3upFTeLgT1mm7TWzT60NR5sBQ/F4HV?=
 =?us-ascii?Q?7O4EmspFbmZuvt8nnGaa4225LK8m5L5lmh3UC564D5W1Upm0YYyyrYJQLg3l?=
 =?us-ascii?Q?CiMmpTiMpMICxFUlvYDU6Ky0DC0DCQ6p7GGOBEb2t82OwMt4M3lb1hxM2ZU4?=
 =?us-ascii?Q?/M+y8q4SZGgU8tqFAoXcGkXNDtrny9Hx9c8afxmLwqnvL+4kYf912TVn7GLl?=
 =?us-ascii?Q?cIq1Dd/7B/fSbzFWKeDvPb7AhqhfQh9Hcte7jSfYyM7BzhYTU0Im9R8Wwhxn?=
 =?us-ascii?Q?jTWvbn0iFc84Ni11sajGqAgjdvc7AMH1N7/w9GLWklRq7OT2EpppI8bET2DU?=
 =?us-ascii?Q?1/s801wZEiUdv1l69Fc1hzUPUeqAAKLMg9gMskzts+jZCmYSPoc090EaTlsJ?=
 =?us-ascii?Q?0ZPrfe1ZD2OXXOeI0V/WRTmME2Zs8lY6Uusex4c56ftkl9WeV7et674E35n/?=
 =?us-ascii?Q?zdvphdcd0FfaRm6bfAWN99USa9tt8Ng/S25crkKMgAV9cjex5SAHYmhui4zS?=
 =?us-ascii?Q?cdihgDCDDw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e75cf30b-894a-4aa6-6a6c-08de70ee50bd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:09:59.3710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97OtsWJJcDMVoXeA5jnvjCC0dXvdYCKMaOPDkfubZ8Ayl/2h9My3uBIDdmKkTotMRjWhTrVjPPpTJ2d004QRNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

A tiny simplification: now that FbLayout uses its own specific FbRange
type, add an FbRange.len() method, and use that to (very slightly)
simplify the calculation of Frts::frts_size initialization.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs       | 8 +++++++-
 drivers/gpu/nova-core/gsp/boot.rs | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 6fb804c118c6..6536d0035cb1 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -100,6 +100,12 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 
 pub(crate) struct FbRange(Range<u64>);
 
+impl FbRange {
+    pub(crate) fn len(&self) -> u64 {
+        self.0.end - self.0.start
+    }
+}
+
 impl From<Range<u64>> for FbRange {
     fn from(range: Range<u64>) -> Self {
         Self(range)
@@ -118,7 +124,7 @@ impl fmt::Debug for FbRange {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         // Use alternate format ({:#?}) to include size, compact format ({:?}) for just the range.
         if f.alternate() {
-            let size = self.0.end - self.0.start;
+            let size = self.len();
 
             if size < usize_as_u64(SZ_1M) {
                 let size_kib = size / usize_as_u64(SZ_1K);
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index bd6e6dc57e85..465c18e4c888 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -70,7 +70,7 @@ fn run_fwsec_frts(
             bios,
             FwsecCommand::Frts {
                 frts_addr: fb_layout.frts.start,
-                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+                frts_size: fb_layout.frts.len(),
             },
         )?;
 
-- 
2.53.0

