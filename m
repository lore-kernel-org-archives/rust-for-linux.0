Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6479D32D0C2;
	Sat, 21 Feb 2026 02:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639872; cv=fail; b=HGaXP0AXSbN0ED8ZcHZ7yDymvDnuPKCrYaTzVw3+qTOiSHYD5f3ib7b7Jt+bT2ypv0uigskHN3qbTpy4piQnfzxHJi95ROw8tZAJnhTBUPpZNUq9Z6Q92OQOjff8dWiman0oFF2TJyBLzwLvk8oBpXM69JjL6H9TH1c66D9B7Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639872; c=relaxed/simple;
	bh=SCLWtA4uWS1bv3+aPT+SsaQedufnv93axFuETrz318A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R0TTf2ZUTB9Pd5BKDKGQ3eICu/ydAH8vOY6hI/WoU5XU+vvxdysZ2ZZW63nHb7gXoPc3hmNn7+eYSgAfn7hKDU+R+2jjgcDEgc882BDtOeytdcwJxnP2ifyArndAiAYIAnzJweS1i0vKk13Fsq73/nazmcTNAD5fOew+gjncjAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ojv7Up0Z; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ojv7Up0Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sop8BlugKN0nGpotV59FfxgOgHQcOGT6F4VRN8uURxOQ87NGnUBew1mfvsm2SYnc5GpcWIn96P/yqEGYJ/UYhHAt5/vWYB4NEurIqb3UiZOcSXRbB3y753VXFM6lY23t672dhUZ5LL3TsvIjxk4ahh5YvjyWP6KRL3tNK8avEWKlKeYLKDyXgCDKVUS/UWuphCLt1hzACWF+kkieEpOuZAFp0CeXH7Sa0jOW2NjEPpX9FlKuzK4YvfR8OWPN9yRMam+Bhb640Kjt5HD2nbx+Pnntmrsrp4mrb0LMHIRxL2hVthph/L1JtyvCiwlnGwL7NI5UYEMJn9loF8pavypAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HSkX6JkhjjOE7N0j2Q+7hz3jUrLNURhamo0wmlKil8=;
 b=GFYlKyyuMUuayVrZj4QJoLmwPYZeshXdFVuviB2nc2GqmBxm8NPLqcQQiTPcDWVMStWjOq86/Q15yVWgm3kPz+GfTdgxMDYqcPwXGIrQnH0AhXtA31LL1f/dsxjOMxMx1cJR2ZaQDjtXo6jfyTZS6k7Wo+QuNraYnm8k44cGwEdooQyoBNMJFpyhv8JTI13LjtqXJpnTA0Sk+xinWYz+NoprE8C2oxYArssRLXhX7o774fuZI2uhsH1ktow47Pyvm/sj9+8nLHU5txQ1bEGfqb7vnGYYUL35NkKdfa6lQa8Sk39IMynG/8USVcQV/eowSQUh1noWRFKE2UNx82gXHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HSkX6JkhjjOE7N0j2Q+7hz3jUrLNURhamo0wmlKil8=;
 b=Ojv7Up0Z4iLyxyHQy0XoI2KszxaPVNaTFT04Y+luOxKmekRaRVrpZjN2+XPIqZVF+0ATj2YeHjQRPlu6i0sUegq0v0KREHyatJyyX4K4nKmi2AOd+zKLrsWseTFMseQfeJ73lySNMqsec2vukWPaIZ+o+lHn0ECgxDoc9RXaLOqIFs9wTkJJvsrStPP8KC1tOXYK/1z1zAWurci0X7DGw6PkLgpTVInB9ww/VR1JRcql6iw1xxZMtrqbpnqK57HUbWcXk1t9mp0bIvPeqHrcXRYPdTkoku2bdW7hooHOmVwHcUJ8ZYAh/VG+ODXex000j7rj4BSrhcaYSb8TrhhmUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:25 +0000
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
Subject: [PATCH v5 25/38] gpu: nova-core: Hopper/Blackwell: add FSP message structures
Date: Fri, 20 Feb 2026 18:09:39 -0800
Message-ID: <20260221020952.412352-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd0dbb0-e1c3-4ee0-494b-08de70ee600f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MJ3qpuqJHLzwmsiUYagx7WuExSljMxK7ZP0vH0Dfu9E30Wg1T/Cy1Bb4JBMV?=
 =?us-ascii?Q?AwqJxNbVsZSv2GEtoGagj1SqYHIYlD3RksRPm+U5H3uUAzkC7KVvxEtoMAjW?=
 =?us-ascii?Q?pnoQEm/1nd+29XSDcmQdGwXoTRBVndJhdz64v3Iy9MaZ87fI3jiOsvfPVld2?=
 =?us-ascii?Q?nMIxnejfb5ygFb/wGkNPZE2DR3kt2bU43Ns01ajxqRbRUuu/rK0BzrH0/Iyz?=
 =?us-ascii?Q?nGfyj0qwTwyfBwurxt9cTeD2PKIbawUFVF+Bgki6qTXjCuG7ObWTyPQEHVeR?=
 =?us-ascii?Q?XAlZTyYJcYeoV7GpfBx+aVrbhRiOVCOeaNgCwZLN8veMz64P3oaO1g3TRrR1?=
 =?us-ascii?Q?R4+4gF6DIpN/yK6gOqmnLzpey+y30kX4UJskiC42a/YQaodcwunz4Q+gu9C5?=
 =?us-ascii?Q?fygj6+6gyj4uO915kbwolyi0067LH3tIyMuc6trXnHbFOL/z++acwfzVJNfl?=
 =?us-ascii?Q?k7rQbIPEBDYcuUNpXmL1to6JToNTuuFfJz5Fon1mSKYHykb/P+bGVXdY9vnV?=
 =?us-ascii?Q?N2grnruz56EYlYdoFw36jMPRVpG8OeFZFGgbmB6rZzvD8XSalpYpD1N2yRRc?=
 =?us-ascii?Q?tc+Dj0HcMk+SgxXQVKvs+HZcoW/6mmPcW42EhTpfyd2kxRJvdzptQg2n6NxB?=
 =?us-ascii?Q?/qcTLzuxkv92gaWwTyiKSyniXSN90GbAMZBwGhMPbIaljRGhsOLlg+V+XdeC?=
 =?us-ascii?Q?TDk9LH5IQ7oOm5H5OkBl1XQVvClCUlisfUozpyxfWmBfUG9lDEaZXfoNtEyK?=
 =?us-ascii?Q?BdkhB5Si3gx4g7vz3d+wRKZJCCzrnu3TnbVJC2P6vIj5dNYoHL0912vEcjHM?=
 =?us-ascii?Q?oQv4u1jtME5VNL7svmbB2wOglMBjIMGWumldjIJDzWGwBBOckuhgednhwpPA?=
 =?us-ascii?Q?jCdM1T9UiLR9HIJUbC7kznUd9gdniq20xz8FHP9QsvH5yKvbxZWGuxe2/ssX?=
 =?us-ascii?Q?xaa9TYBAofdlCjjvdFxihqMvjfIe/KpZW0CdQRxhZ2wjcseOrpZSd69Lgmip?=
 =?us-ascii?Q?RzM1GFwxs16TPkRLpp/P2EL5yQSzZiDlHFIYFxEw6wzgxAzlrOQpjOO87X6R?=
 =?us-ascii?Q?+BiZDRdad25oV1/CnC4Yjf9YuEMrEOqr/8MKd6P1oi2VFPtxMqJDiIhn9czr?=
 =?us-ascii?Q?kGXYilT3fqp4PsarZXHLetYFCueodAO3NCre2jQEcINgIHwAVsbMayBynn2J?=
 =?us-ascii?Q?fyyDAVrq7OSu/QqQsCB7xIYTw7EE/31oSXqWBinLhZuS087xtw0GMuo0jWLv?=
 =?us-ascii?Q?NDwHm1sm5SCEMsj2bINztJq/T0EnGH0wuw0KHqQkTxkp9YanDzlQX2QUYQij?=
 =?us-ascii?Q?YqYStZ62CAsmxtV5GeAqt8//ByoYcdWLNYCx7ATROwYIDMhlxb5bCruSArP6?=
 =?us-ascii?Q?qWJCuend07zzt+9PPkvKEj27eju9MI4fYMb8/iWYvKhu2QNAxNdk86WwelkR?=
 =?us-ascii?Q?UM5xQeJi85gYrxXpuJMfICeV3BBUk5lB9UwHhr09NmvizIlI0b8+WhtV/9tp?=
 =?us-ascii?Q?zDvC9nxDq7T1NtO29LdFxJ4l9VrqJf+nMeCqfssy5iImbLqYhjuc/GedIMUC?=
 =?us-ascii?Q?dtfGvgCCWh+XlOapZng=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NLH3w/oVhrOhbNq2W8cNNwNpwcBgw6Q4DlCOgeB819lrgpCNOYjgZFilWSjI?=
 =?us-ascii?Q?9epJAW9suE2GRdML8n3xvrXrdUXLgTABkr6XXxuUnp/Jvl75s3EZayDXFudt?=
 =?us-ascii?Q?+Vzj1amjr4ZpuY0nPAFy6JBXqmHHVcS4opAxiNpjxU2TFluxWD/5Zova/txK?=
 =?us-ascii?Q?1dS55N5h5eXQvSNMF1DofBmuiJwV+n+oinhOsz/XGieXqIF97cWXBL2VkJ2S?=
 =?us-ascii?Q?MoNhsDdz5tem52JeayAgxFzQLpVR57ABi9wjvij9iTrd41lSoyheTIq0XCYG?=
 =?us-ascii?Q?vXGplKP9A7bj+k+lTRASgut5nB61Cbv3s97zzo7GEVeTmGnVW2QHRRzfkxc8?=
 =?us-ascii?Q?FPnJ6iyP3GxRfOr6ghdXtKV2+SaxWeuYPETAW5MOtwwf+0a+XMJBiZJy+bad?=
 =?us-ascii?Q?ccgLBAVgw6xOHksHRLW/bgxl4mLezBo8zHEwFnmJGX5IsmaMC47I6//BVPqw?=
 =?us-ascii?Q?QkQdPnPPlXXr9Bx/1Se0Q6rFUQGRgL2KL2wwynv1fMisd4VIB/Y8uQ5GWc3s?=
 =?us-ascii?Q?7CDecJBxkjEfNeR9M7UB3geDrd1onJ2QhStd0hQXGnGIipAcgFcjN5tsMTAE?=
 =?us-ascii?Q?xPy8kvvFPNluo1FabJ4LraT5K4SFYeHMyRV9zkSxPTzl4I9/IkhXGe05ty77?=
 =?us-ascii?Q?sBE5urRk7YepXvNsNVqtFeXusub9ARF/qUUNY1E1iNryFDyADUbcfhYneyqN?=
 =?us-ascii?Q?oXVknMQaq2Y61/Q+o/KyXWqCgDDLhKNJULGxrvuCeGP3HqHoEf39k/sjFknf?=
 =?us-ascii?Q?o27VE84nhGhSnxnWrwT9gbzOeR+q5n5waOmfDsba55wZ+sxafB98RHcTQZVj?=
 =?us-ascii?Q?fJrKKrE/3KvQ5cZP6oVnBzKO8eHUdWfw9eo3rW4/EDNfzjZgECB0Phv+S5bc?=
 =?us-ascii?Q?coTp/nQ+B9GLKjwfq/HsSA+rzTpMPXaukDlZoh1HNfCH6NsOK/5BK8Rtxx7L?=
 =?us-ascii?Q?v60y7woFENRkoxBjROqGs/u3bubyVX2SVYkEwcyvajhe3nfiB/u2D6LWSaoJ?=
 =?us-ascii?Q?UM0y5/lY749GRQysnEWIiiCP5TmIcubEs0EkH4BlbB16IoNb0MlLw1jqvVbC?=
 =?us-ascii?Q?fYlw8x4tW25/P6xW/zSKvrNBZTqKqIwud+nwjWq5xpLSPpsnGoWAYrs0WCMS?=
 =?us-ascii?Q?Y3U9HP7CZ/dfmpGlIFttDPZeGbDAwm7Age+yz0yXPjZ7A8LM+SkYjocYzIqP?=
 =?us-ascii?Q?BZEdYAblqWx0egx6TatXi8ZHGmYLXYprLZ2BoZWDMs+ybTfQxGb6pCGcjjyz?=
 =?us-ascii?Q?ibg3IY0dPXIwxQvlUYOBrIUNFZNmKdzwII213Y4h9sy7DHvBaoxVF+IFZhvH?=
 =?us-ascii?Q?Bv7MwIOECFP/IRt9wFB+g8ySlwUtdIH5zhgyGUi1VGJXWY/zHowUBCKOBJNM?=
 =?us-ascii?Q?l9Yy2zsHvKCSqi0nPBuiDW8rAzeMjsCrvrFRjNifDQuqCat9SMFfq7TvpF2l?=
 =?us-ascii?Q?Zzl2VRm444ZGUSjdaFTW9kMI277BUxPQFskHopGr+1ZAd+btvXUcTSgzggDN?=
 =?us-ascii?Q?0djLzDjjFi7NXZl9SEQBWXxHhixQctqngJdR8CcNdU1dNMEwmcQqzn1UY3tw?=
 =?us-ascii?Q?aPmBOV+BX6jqcsbdnHxR8GHnB5QSPYfO/uBkRay36xMQcE4duE80IZbA6NNM?=
 =?us-ascii?Q?5eRgavM7UX/UngGBjB3UE1RYE46NE6/mErZOygdm81aI7gz9+PFtiL/lsm/w?=
 =?us-ascii?Q?stdZv/tZ3E7PI5Tg7elzrS8G0PMkbwc7W1V0+rm6rq5166gYsEqn/qPWQyF1?=
 =?us-ascii?Q?QOnsLW7bPA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd0dbb0-e1c3-4ee0-494b-08de70ee600f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:25.0851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQJdotdEWK6BE6jk1P3a9JMkfRvwFSJRqVscid23fsea7zENmF7vuAw43vA1YyWYQEEFnlJowwo6GrGWlmEPew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Add the NVDM COT payload, FSP message, and FSP response structures
needed for FSP Chain of Trust communication. Also add FmcSignatures
to hold the hash, public key, and signature extracted from FMC firmware.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  5 +-
 drivers/gpu/nova-core/fsp.rs      | 78 +++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 396f96716d6b..823d2232081e 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -27,6 +27,9 @@
     },
 };
 
+#[expect(unused)]
+pub(crate) use elf::elf_section;
+
 pub(crate) mod booter;
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
@@ -607,7 +610,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
     }
 
     /// Automatically detects ELF32 vs ELF64 based on the ELF header.
-    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         // Check ELF magic.
         if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
             return None;
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index d464ad325881..15731d24d0c5 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -105,6 +105,84 @@ unsafe impl AsBytes for GspFmcBootParams {}
 // SAFETY: All bit patterns are valid for the primitive fields.
 unsafe impl FromBytes for GspFmcBootParams {}
 
+/// Size constraints for FSP security signatures (Hopper/Blackwell).
+const FSP_HASH_SIZE: usize = 48; // SHA-384 hash
+const FSP_PKEY_SIZE: usize = 384; // RSA-3072 public key
+const FSP_SIG_SIZE: usize = 384; // RSA-3072 signature
+
+/// Structure to hold FMC signatures.
+#[derive(Debug, Clone, Copy)]
+#[expect(dead_code)]
+pub(crate) struct FmcSignatures {
+    hash384: [u8; FSP_HASH_SIZE],
+    public_key: [u8; FSP_PKEY_SIZE],
+    signature: [u8; FSP_SIG_SIZE],
+}
+
+impl Default for FmcSignatures {
+    fn default() -> Self {
+        Self {
+            hash384: [0u8; FSP_HASH_SIZE],
+            public_key: [0u8; FSP_PKEY_SIZE],
+            signature: [0u8; FSP_SIG_SIZE],
+        }
+    }
+}
+
+/// FSP Command Response payload structure.
+/// NVDM_PAYLOAD_COMMAND_RESPONSE structure.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCommandResponse {
+    task_id: u32,
+    command_nvdm_type: u32,
+    error_code: u32,
+}
+
+/// NVDM (NVIDIA Device Management) COT (Chain of Trust) payload structure.
+/// This is the main message payload sent to FSP for Chain of Trust.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCot {
+    version: u16,
+    size: u16,
+    gsp_fmc_sysmem_offset: u64,
+    frts_sysmem_offset: u64,
+    frts_sysmem_size: u32,
+    frts_vidmem_offset: u64,
+    frts_vidmem_size: u32,
+    hash384: [u8; FSP_HASH_SIZE],
+    public_key: [u8; FSP_PKEY_SIZE],
+    signature: [u8; FSP_SIG_SIZE],
+    gsp_boot_args_sysmem_offset: u64,
+}
+
+/// Complete FSP message structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+#[expect(dead_code)]
+struct FspMessage {
+    mctp_header: u32,
+    nvdm_header: u32,
+    cot: NvdmPayloadCot,
+}
+
+// SAFETY: FspMessage is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspMessage {}
+
+/// Complete FSP response structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+#[expect(dead_code)]
+struct FspResponse {
+    mctp_header: u32,
+    nvdm_header: u32,
+    response: NvdmPayloadCommandResponse,
+}
+
+// SAFETY: FspResponse is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspResponse {}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
-- 
2.53.0

