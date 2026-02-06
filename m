Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010028.outbound.protection.outlook.com [52.101.61.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04D82DFA46;
	Fri,  6 Feb 2026 04:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351693; cv=fail; b=EXDbr4MPZ39CNUpGcUWUYq836MobN3RDH1JXH+HjJ3wb5UcI8fN7QWR19agSlNrz84WJjMaaLQrKpb5GH/ZbWUeEfimAgIT7P4IheNKVOBLv1T3N6fNY85gBmn8ld3En/PX8fRiahqZxY9dFmD/yQJ/62dTPk+UxiM7kwa5TwzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351693; c=relaxed/simple;
	bh=TXgQYusrXIvs4fQyd5KFqXTaKqsuQh1RJNNfxBTaVZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FqCHsZ7sfCZMM0zKs9ONEe/0RF7/K+JlXDgInH3ot3nT47mRYJeBTsCFbW9I2TfkZTEJfsVzXnNhZRtYIV8zKiL9d0HXpLlQD3Jkz3i/LxfECfN/cARSC/9VKL93ShJD2r2M5Q9kJn9dfxco49Qamm9ee0zzMYsfvNZi2gSXnqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Js73MUkp; arc=fail smtp.client-ip=52.101.61.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Js73MUkp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyfrDiDuYa87OXtKNwaOLh6BctBurR6fu+9BRIlbxB0lFv3dHT+NyDlgz1gew4heAaF9hT5cq4nFp9On3M8L7RLojcYglew8JO8EQvpPE9eHG98PEYVkWIHiqOAWmRJy/rDJcgwg7KVzgQMwNATsLlN7McidUhUWT+VlMSCVYpcXhIdTuP9Bs/nAk9mUtfTY9d//6JVZ3TYfEp2B06+TIi1f6CJrD6RYCc4v7mOP/FjSY86gKkQYnS15IPOIEkse2n0d6PPPpS3wmZJURolGx77RkWkuQrLd7dsc4y0rAJuL1X5NEFWNsBz6AcbLWCKGRUAzeKEyVdY5MCJbKRP7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugr/5WgUzyRI0H/QY2rDTTYllDUZHXEc0OBVwc2UMo8=;
 b=P9mv9Cme/VW3/Zz5F0+LFe/qPgo1CLL9XsxWHeX780pgTIS0dCTdbDW7b820+PJmNzdUL2PijzggwV4H3eSL5hAnWG6qG/q+2tuadiT6ZWn/tpWVroPn+eEc+I5NrQFwgSzTJOdUBxo/HMdEqlPHe4Mbg2FqVt9WYRIf9jukf8IWf1mgT56CyW9G5tQeSg7iRhgWa7Btiiu5cpdHY/vMgoz68KYGEQPEusRk0v3famtaXhQh2vByxDQw8F8zZKeAT7NZgXfgBS47igj3j8Cr85vI80NS5Cou64tttYbV4XTzIKlKv8rmgsUxlKvyS34yz5ANjYWychGOSEXEr3kmwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugr/5WgUzyRI0H/QY2rDTTYllDUZHXEc0OBVwc2UMo8=;
 b=Js73MUkpYfuT8oDAnjI2F9GUrgjyLNg3mhtakCC0OVbdAiK/Qf2Y7/jh2VTu7oFpClqNSyRwGwKLYdNJe+bUoUWyvjW0LKRYZ9GX3r5IWXgUQNje4/xFE31jI1XcpsyFnd2ixJA9JkXvAYLLSxOWZc8wQ5N1kedDDcQIAe9WGeqf7C+VCJ8dtvxLZq45LmqtQQuKigjXGOSShSdQ1HkzqoYrARQqVCGtHUet9jB/pI2/jlRC9lmxhCchlV1E+UFjgQG7FBxm2EGlyobZCkBxiMm82hgvdcjFODV8yMl8jGRoBY0BUS9QHBd7MA3uRtzcBtQDaJgHe2DNM+a/DYlg9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:29 +0000
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
Subject: [PATCH v3 02/30] gpu: nova-core: add FbRange.len() and use it in boot.rs
Date: Thu,  5 Feb 2026 20:20:55 -0800
Message-ID: <20260206042123.303281-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: d715ceae-d3c6-4a38-2520-08de65373338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4mPJILAv9RUj1SYBW0w8aQ5CSryIe7reOVvNMStwlodf4b7d2aRmZb7XxfQj?=
 =?us-ascii?Q?6xtf34kI1bWl0NIEIAoC9deWQI/YZruMi3ev3x0Vk52OO9vW/ncGHOq4Pd7w?=
 =?us-ascii?Q?uyxBsvC+1FAsKraGlKcc/Jwh/+8QyHFqDw6V+/bRyhur83rv7JDKDbrFh42m?=
 =?us-ascii?Q?1f9Zzv4OXJ9tNdyI6xENRNvMkaVrnz5PbuCW/jjmZWIPQmLvh6RnWNveexc9?=
 =?us-ascii?Q?KbmpaGepN6Zs5hTEHmfirbNXquExNq1zzGAvGESEM6ComWzZ1NdJbpjP07dC?=
 =?us-ascii?Q?zQRBCYBVLAWdTLsazHuWPS+d0yskRDiZ1OGB/CPRu4SCeKirsUPAaGXuY4NX?=
 =?us-ascii?Q?i5p2jkboWrekSdZ/1PoyqyTl1t1sOPQ3rV7JzyflhkJriNf0qDTjpV3pyS8x?=
 =?us-ascii?Q?iAdPMGnLI7ZPfPMGe/4lmtgwQFsFfX2bAwNGvGw4nIfSaljMuY+yAIde7uxb?=
 =?us-ascii?Q?lJcXvlD8drot3xweEdaSO0gIomBbGolIf2Fg0Mg12ER+YByEbCovimaRmWxZ?=
 =?us-ascii?Q?OMlJKlwINu6LS+Wos5D/uK5yxKE6rXcVpf3pRxUmhIvHZVgtY2wy7McWh+B3?=
 =?us-ascii?Q?MgdTEfYzMLhARCmdYYzJWErOJlKgSMxTPM+eq6Ep1JlsuhVnXgDoFk+HXmvE?=
 =?us-ascii?Q?mgg5RfKQ9GqL4iV6/ZW70vq0WWs/poxJMFocFrqGWBLTe40G3WFa+a2DderX?=
 =?us-ascii?Q?5I62rt3dlWPxAvABWeGbJ6yvUAokzNv+3xO4/+0Ecjq4PU2O18lIyqa/AHE2?=
 =?us-ascii?Q?0LG7TruxWPlAdbZPg7ZvdyYwU1/z8yGpSpDgkZS5e+ufUWOkVPRuXvMVuUVK?=
 =?us-ascii?Q?+JjXeFJjNrajEPYzwrXaGLP3e7KF7A4RJeCTwmoBVz1eu3DZ9I+oI1A7l/N8?=
 =?us-ascii?Q?TEinZ7mdEE/7y1Ff/LPjUcbdyE0sxmoID8lyxjp++H3VIoVumwXFuXX/nSIk?=
 =?us-ascii?Q?6vIQcpUOaHdvqgCuDWFvAwXcNGB9w2qAJyHRQcgecuoN2v8PsOfNa8vdPXaF?=
 =?us-ascii?Q?ott8A2inlQ0UrL33nByR07WEaq8+8gjCI5wIQC3O0l637caPWYkdoE3Eevgg?=
 =?us-ascii?Q?Dq6XnshCKfotbyVraOL+1tv5bUFW+Kyvr9tIE+furxPlJGFmLuwQiaIAogED?=
 =?us-ascii?Q?cldVc/meP2KWp5QQ6TynPNqk35L7s9AvpnU6d3fLKSjGk6acLZRU5MTdmnaU?=
 =?us-ascii?Q?gPUY4xosvVMMQjsfm4y6fusj7hMjRK11oiUBDFgBeSlByR2lnBnTil4AYlYm?=
 =?us-ascii?Q?87wMPRfOfw7/TX4ReVAGXW+SMUOR2vdNmkhHLi4efxQ8rGNe2pDFpNvnmUL4?=
 =?us-ascii?Q?J/E7aqRqTGAXESkJ2Xx5nFbhLYincxGtxcMOqxMD4uKe5a+9jSlm/3S/HBgc?=
 =?us-ascii?Q?8VSdt2/hjP7voIpOwBVACAjhK42mfsGOijd0Kn/hrxOa6YvVdqR/sgov7B9n?=
 =?us-ascii?Q?WIAcuVLL1URKZ7RVmxTlcSqN/l6BAwnQu3ZeyVTVzNOVHhtQSZ+l4Lwd0ORg?=
 =?us-ascii?Q?PouvNZm7U5XW/xFULUT1haZPY1tgi8fci/Vd0li35c73W73y3W2TQuVH0Ph4?=
 =?us-ascii?Q?4ChSEYqOsbV7r/aumco=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UN0ty0FMvkaRHGlR8awTWBJzR6uM0AfJ7RRKI1HxSzkg86Ejx4ges/UjjKfN?=
 =?us-ascii?Q?M1e5D88KSMfd7To4ZWXuOy6OFrU+Bd+YSu9D+YIsw04J2X/X+kO+5aCEG5Su?=
 =?us-ascii?Q?xo5/PWLtpReNwEhZszhs0bd4kzk8fVHPsevzwgu3E57nxFRZfIzKZj6zUhka?=
 =?us-ascii?Q?W1MZE45wfoBsU2mQ6AMENUgLJgdFzHwvLLGNxzs/qg9pMFyCbkresODEauif?=
 =?us-ascii?Q?is9Mm5HUuMZuvwcaDXrGHDDspY4NdxYfAPx/MVIEYHPmm/4LoUiDQPGV2JU8?=
 =?us-ascii?Q?b1jJFP+9jaLQbXxO9Waq1R6ImxfXfC4OASXsRiIEKaBI9tirX24Zhhb9zO9X?=
 =?us-ascii?Q?8CxakEGPuvBIQpB5X72+9oWaxHTbRUwLqeHL+VPW9mVEp58mpcUmiAMSwk24?=
 =?us-ascii?Q?DlLI7rTOegvyZakaeQNPHNvZn5nSdPDgv721uiwKrOENMZ3+uZvHztD1Fc/P?=
 =?us-ascii?Q?cAK9G4KHsiGUqMqIKC0s0zQv4QxyHItjEPdVvZDIiTWGkDAFQBX/d6tMKBXM?=
 =?us-ascii?Q?/WBYbYI26giNbSHa2jUJzRWH8p1xNwxFJ1SYwBYFTTZui8KKOCyiFRUAv1Z/?=
 =?us-ascii?Q?Gh6SEDqWhFYMJj/J2UlS9ubMJe7XNJ1RRozzoyd5/w5hD9ry3ARdElLZLuDI?=
 =?us-ascii?Q?ovdvOWg/jxyt3TQJ34iG81DVTm4KitDORNYpGCcZG+NARw5+1JgjWcIcwIxa?=
 =?us-ascii?Q?LotqSVbxrtRzJlTehcOr9zEM6mE5qLeZ5KXcnyRqQIZ4VhsWecKgdEgZ8jTC?=
 =?us-ascii?Q?FKwYymPyVAXpsKgQbbqhAndEar5Rr7c6oZ1jMoLbVKf0Z+m2mOr8QZ98iPBc?=
 =?us-ascii?Q?igWpYdsswFPp86k8hS9Pl8Jm9+Tvn7HgOQ1NctGeVYLunzKGTKxEKIG1D+ye?=
 =?us-ascii?Q?xWkyAG0NdgoSW36g4hpNsZjxgoE0FJ7Sv/tymluVOR/4h7OFp6UrXpwhD/AS?=
 =?us-ascii?Q?bL+9vrRi61Ociz7yw2ybUMHgAfwSYOu3ysKvCoZpIp657+Bk4QH0KNZBoiLZ?=
 =?us-ascii?Q?3YDv5cT/2o2yx19WyQPzSxWdseoBzrq2oqAOl/bos1fW0SSwAv2bfmojb7T+?=
 =?us-ascii?Q?69Zy5W8zo2UaE8qMnb37knQFaOq6g87pyj3BT6rSPs09AZFTkkx7mUDSUjRe?=
 =?us-ascii?Q?mC3nRVvJFypgdF3JcHZxyoeBTd02HRpQRvk1D/YIhOKncBTvJvwwhmYDV6ts?=
 =?us-ascii?Q?vAIT6mpNabgnIzjoLZoWtOXhDnY6BxiK1GmbJhQvx+riNg/q9mzK3f482Itg?=
 =?us-ascii?Q?2c9O8dJmgF1foOEz+SlNjMy+lv3SBIYmbPjB+DeYGDzqD/alWeYlis9e1OpR?=
 =?us-ascii?Q?vIy+UGAhs2MPwJvDDg+lWBJZCqovvoQ6T7GvbGuZdlCzujLEjjTUIA/XMiI/?=
 =?us-ascii?Q?5gtM3vEolmjGHD+h/iFqBHM7kRke+jvjU3cFLEk8PWp4WgwV0DZAAMMeu1Rd?=
 =?us-ascii?Q?1UlwfVEKzuHaMr/EpTnHwEr9SPAeFVZNCAzEmSjTFjNb5WBAO6JSpAnT4ivn?=
 =?us-ascii?Q?3yOM9N46XsYnl1+FV613aqZi22JXa4ODSCxYczEVWN1TWoG4RUyXm4Pd5+A8?=
 =?us-ascii?Q?dQWRDKiqllpMof4dg5l/2g+SjDdVAk4KiDThDzUuU7Q93B5k7K78Dz6K+iY/?=
 =?us-ascii?Q?0CYao8bT2e0Rh5tUqxljFMGrP6gWag6fPMBSTDxWJHBvvsYQJBV4cugNEy96?=
 =?us-ascii?Q?YysCqw0rjAbQ5SCflN1Us518kdOk/fsTtL4oRBIFOy9ZGrL/h2yXtVolje7m?=
 =?us-ascii?Q?PiXQ0Q0jPA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d715ceae-d3c6-4a38-2520-08de65373338
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:29.1586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULyiw/Guv9F183Ltod9OPPrPfhkRf7VhTOoWF/jdBSI0uHnnmwwfA5MsyFANBrpOWneEF11VIE1aRM4y2fh7IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

A tiny simplification: now that FbLayout uses its own specific FbRange
type, add an FbRange.len() method, and use that to (very slightly)
simplify the calculation of Frts::frts_size initialization.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs       | 6 ++++++
 drivers/gpu/nova-core/gsp/boot.rs | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 6fb804c118c6..e803e6e0cdb9 100644
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
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index be427fe26a58..036a42a6afb6 100644
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

