Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA603191AC;
	Tue, 10 Feb 2026 02:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691602; cv=fail; b=VDnavD73+egQ+QoxP57okIuN6/BU8RxmzZOkTRBmeWO2qA5zPXvNGDhC8SPqcCSSabBy+GRlo70PN7uFpCt3f9+++LtLOwS2eAy4zT1BXXd1I6iqtPaYURzKC0lJmlGPppxt40E6VwmO8GLrHOnvFxamn9iPb+0mLywdETg/xVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691602; c=relaxed/simple;
	bh=+JvXnkBEeyczrUfIirS07Mc4tIhg2uugs/RqrR4VB4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mhSuixY5pEnj+kImRjIwniWes96JQ4Os0Vaomc061qNEC1IDFQDZ0PsBd9EdNkSnceT3EH7qlSZn7OVwe6b7MBuvsaGkAJgdaOHDEnwH0e/ACZ7C6vt9+mbBnKVRMZoIMwLMboYJWDsbTHJktuGaPQNHQA4U7uoSDbSlQ+dP7ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JJQ0kHzV; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JJQ0kHzV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXBMVpRG8PBCR4WtUj77cCCDTmxNCrCu88faN9U1syvmrPVmpYJv5I0DJNZZ6J3GxWrojZ80ZktmRhV87XA2SALXUjhNZ8OJmw8ffyqcVfuhp/t505R0ca/Ers07kUe6Xb6bTiZW3kkfrLiNYO3pHpzaDVbVodf4kGDJW/z0N1SmndW4F5RMicWAEuMYFCSUNd83OqAZWHrrQZ2srgUwnHCFeJ64VGFS592CLMHVpINzmUSvJOzy2jrkg9NQtuthSLd2koHiSrh/nw773mvdm25jneJOqqt0R9zY8unR/vj1e5fA2am/9wLyhk5SERWWgAz3kSN+Pj4UhDwRyxwXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5BJn1rOgNSnIYDJY8WMUhXKi6ZZUhvc/vuhNBTnyTk=;
 b=W6w7U6HWSYwIYO9Cio+qlz5F6DXGiJHtmfrh3slY3sSpUkB/2NKdTzdb7/bSqDgY/EtfYSMduWnxkS+Y9Awf6+k7S2OW5X1ZMxyl32xxI89JVKYmqNtC+nwjXOgz6/e0FejB2XKg7WB48iLSXAazV+PzxcCECwzishFwDQLuL0H6EtpQhgoyui5MXq27k5IvILrVqGFicSxoZJFMoA7axaipDRYzaJJMY64fcgodeYrKa+SgxeybTRp72SEkXjjXML+948Wax+67Z4dKWUFIcfK6i7J6su2WzfeRnlZFn++aUWXVGX19KOd/NfYCzqmRENC+TlUWbFC/bqsMdV7SMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5BJn1rOgNSnIYDJY8WMUhXKi6ZZUhvc/vuhNBTnyTk=;
 b=JJQ0kHzVj7VFTwTsWItwTRCraEt5PptwjHJA8Bs5peNVV4p+zmq4h4OMPf5F6emWudYj8zHza/D3BtEm8MofyuHNkm11OWMu4STgKIIB1y8QEAfe45LQX2LUttcF/3jT9YWBwQs2OJLVXhBTAANG2OtPENlJh4Ms9jaibFz0X49Msz1RvWqvUeAD+FvpjcRCA8mDk16INWbYdc6FGVXjZ03TBMCd9aYQlvEJGfXTlSI9SuCIPkOmJJpUpSrVJ+tBksHGC59/tHLYdA77kTZhShMmTiLc9O/BqjMGqiycVLoPnUhAZDWUIzyooRU8p/cKTQ2RzBtpy1EgCC1N8Mk5BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:26 +0000
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
Subject: [PATCH v4 19/33] gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
Date: Mon,  9 Feb 2026 18:45:46 -0800
Message-ID: <20260210024601.593248-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0012.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 523269f0-0fd8-4e5b-9754-08de684e95b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?etynccoqZo9J4a8gHx8XUYkEtYTuiLaE5H2ooeiagqywT8JgbvrrE3oRRTDH?=
 =?us-ascii?Q?6qQBbXINYRqNfZNTtzYlleQ5+85ck/cRPJYkj4R3B3C5X6u9fDKXnSXjGgRq?=
 =?us-ascii?Q?4D/lpRFaeST1Lba6pio9NaVn55gLDxwE1OlGBXHMfBBr7Z/BEYEfxzIBhJ4y?=
 =?us-ascii?Q?XN3jP+opP17woqWHtczKThMufxC/xqW5fdERytgfoJ5GyiW60IBe2qjsmlJC?=
 =?us-ascii?Q?etKYWZhbaninXyDOZa3hYw29G4JWmLGkofwem8Qdt+/fClZvLKv9aLF6agl5?=
 =?us-ascii?Q?VcrmsH0VD+7z58L0zEfQl2M0lDo7GBMrmCFi6k5MSaZ5469I2QMvBCpf+rxG?=
 =?us-ascii?Q?X+Hqedb/Dc+oTWtR0wt1HI7Kfi3yKxTCsDMK89VTXyWiDx1tJ10tyfZFqYD2?=
 =?us-ascii?Q?28VDVPjJkNGlmL7ucSAsXyKFx5BRqSSoTQVC3B8/wD9WLWT5wVgVBQEXMsGP?=
 =?us-ascii?Q?/O4UXZ6sTJO70x8UhmO8D3DC2mSakR0S4u5Pt3zjbRhtUUaQ5X6BUEvL3NfM?=
 =?us-ascii?Q?tg9zaZhudFDqyUA8Z163qZ4SBTg8rqN1xPfDyCCNqPLfGdMxvOPfpJLGA0uk?=
 =?us-ascii?Q?dTY4IHQr0EiZQ4s6uYZx5exjwBI66rLX1CJo7fnZ346AkKheUDmonq9mjWb9?=
 =?us-ascii?Q?ZDXFQMKi7zsLdWtZCZlj2kPkV/XfDwZ/FTcnyE0Sn7OO8baTecgD5N/cMyzq?=
 =?us-ascii?Q?Hff5HsXNjr0EgdQf7Sigy0DISiNInBglWcozuMtt0n2q5zagrUV9vXND2mdi?=
 =?us-ascii?Q?SaoDwsuhaCcJ794LYjnSM0w2/H4Ea7Jm4TFh7fo/5toFWp/aXwARgDtKimC0?=
 =?us-ascii?Q?3oAPq2eGY3IXExJge+adZw2QS1g9CoplPbj5u4iLOFnKonsUb+yC+zeP/HS6?=
 =?us-ascii?Q?ceK4QNEWOIz/8P+28a4HwNRO/n0XDFw0kzq5nd6J1Iu9eWpJIMnwe9Od9HjU?=
 =?us-ascii?Q?uTRoRPkaW5LKOxM6exIRoQXZyQ+5KCDXxwMAhJgDnV53Xw9kErKOoJTEKcm7?=
 =?us-ascii?Q?I+rpFs4wDOp8i0oKC9NZC2pMIAz9bg/oLktqIgnlCUq8QmSrxYwCUtHFBsBx?=
 =?us-ascii?Q?FM8IpytVY/X/z+u69F9F/RtJPEyaQTmunyQ6a0aWdLbWvpWyjVcWzCpVVqFq?=
 =?us-ascii?Q?EyxrgdCnfWudRcz+9p3PGnUJv+VVN2XQih1vb9dhTTH7oCGeFRk98/X/90f0?=
 =?us-ascii?Q?OlTHCMthtnKuZ6MAM4juTr9XXE5gg+a71XHnin3I28Y9qCix28F8tJi2es6k?=
 =?us-ascii?Q?OTX22axnCkzyLuK4X2M2VaKBm0KI4FsDG0vnjd27A9MitqJjeUv++1YcDroL?=
 =?us-ascii?Q?oAXlZQzsCO3OOW72/aHShbqiSsvfiUFVwUdtjbw+gOa8w14Jo9lLCvMMm6aF?=
 =?us-ascii?Q?2S1+yshBBM4AR+PjH9KEWIeMbTqU34sTU6d1/9/2jGuo+5pI/FOHnZlYDRoT?=
 =?us-ascii?Q?yNnBOdrPOuByKLLdnIOop6gqmz6aQbXduTPjneeB8qtKsW7jPalwl+cr3UcI?=
 =?us-ascii?Q?3SK4AqOORsAaZrf5/5RMUmDDShZTcR9igUV9iZo7GuZvGb26PeWsgDhQfniF?=
 =?us-ascii?Q?1wIb0BbLnA3qFnM/vfE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mzUSkdBHGcl5hZzL7LA45KMLnIcdmwyoJhkSNZK3GfM3OCZmsJLMJApdVtxq?=
 =?us-ascii?Q?7Jbo4GkTCmw3jy0z2tb17YOmK2WzAtZUlPxL7zKeZd1DJcySK7FkK2FCeCzQ?=
 =?us-ascii?Q?KjIhJvMGeBt8qiqwifny9W95EuxZecrUO5PuIr8/CPwkLYDGvuKmMMNvvhus?=
 =?us-ascii?Q?gF2VkcNpnoQI/g0DQCJaE/d2fpPlrMgRKe8OxD7HlPzXxL/Fi/yqHX6WwWOK?=
 =?us-ascii?Q?twrY6+E45Kq9FAa2JWtIsGd730iNN2WmYAuohbaE4Xm82vrPkfu9YzroT9a5?=
 =?us-ascii?Q?z0otMjCMCQmUQEDLCrY5Q+00jwErspvmyvsJsNjryec0or8Z+0lb1fR88DTg?=
 =?us-ascii?Q?LubBqJ2d8RZtMMPfyHHbMai27cezdHxeuu+jkQgyDYn3fMRjnFbZY9kF0IUR?=
 =?us-ascii?Q?V0+qYtvuzCXzDCVVM846prwGnb401JTQZGMZ2ytiGct5N2f/amEOaAFqlEJU?=
 =?us-ascii?Q?VyOOX6ohw9flQQuVXAGw8bKp0g+g7lllO3gzdXq+6KzqlYehbGEq5yg3oGv+?=
 =?us-ascii?Q?6Jgk+UzodufkNdxOPVMpA9BY1JHBXxEeYHvMB7D6oBWPgzTIZxF+m36B7n9K?=
 =?us-ascii?Q?8KdKGH5Ok8sP/SQ8jLm2/VlJFtj5tB83CIz2IUAqQk1UWJkpVN6sG1Pm/0GL?=
 =?us-ascii?Q?yA6UAYMEF5g6iToStf+gR/VJVcPcgL2J+GzFhy0GDjIxZIkUNs1cxYuU1PxH?=
 =?us-ascii?Q?smNbTxgfrqGuWlluf2ABERHt6Fml1vJFyNCMlkxIeE+74b1AanLqwliYw3WG?=
 =?us-ascii?Q?fASsAzPrVwbyoFR8U2/RU/ssVl57uirK27/koHmPSOoFPMMKUSV6tggx5Ta5?=
 =?us-ascii?Q?sa2IKd9rojQ2bPOOdXF3t3h3nwfL4j9L6c9+lR+LD8Gv6Bb44piAlhbW4I9c?=
 =?us-ascii?Q?8c8IU/sbNcKFcZKU9CdmgcfaHVeS29SzyoDmM/1PjkiHWszIzOSAkgmSfRZO?=
 =?us-ascii?Q?Z1Xu+k6gPliGHJz8DuwUctap9nz8e1NN7sflYcPMhZ6EaebiEfMRIbx4RfBI?=
 =?us-ascii?Q?yxyTzKUDsrUEwyRrfYZ3aCrFZDUxhfAY/+sG2ldfvp0vZCNbZo079ruc3Q/5?=
 =?us-ascii?Q?eV8qGGsjqN9ZdnKqs5MPAUwaAQjaZCjSI7lU9Ecd6L1C8fe/6nBxBcSEWzvP?=
 =?us-ascii?Q?B0BgHiUu3ZqjR1PTZvFb4aLC60EXVghZOz+vNedkcofqHwfygB7GFCiSYFC1?=
 =?us-ascii?Q?LJX37gTLxZ0ssl75w/Y/4K4Zsb8nms4dHAfLwJ9uy8TfbfJU0qKUh90RKurI?=
 =?us-ascii?Q?+g0y7Jhwzcjjmb6yn0p7yaLFttBmGSGDbRAGAm7OaKpP+anOSqtBTUbmAnki?=
 =?us-ascii?Q?f3JIDvtf2o0robH3fYfamwoSF++ZAT8Yts+/SJNPJsGBVWK9WTEyZduXTVSG?=
 =?us-ascii?Q?wK8ZgGE2VTobcnKc26S3qgSRAW1r3D8uugF2JGXFk3M/jrZTPlpjDfxszkDH?=
 =?us-ascii?Q?/7rF0ZioVHV291XqgGFic4PJO+e6VBvlFekSawpUzPakBH7wOJT2klbAJvxA?=
 =?us-ascii?Q?5N5BvbLxKqZxJrqqqTNpaSjv8/19GXUNXhaadUKWxAsfMsEUceB1IsaIRdrW?=
 =?us-ascii?Q?jFhMPLc6QAOK++PznCB9YLDfvYDaFzpDARLhL/+uk8dxUS4I3E5vPVAc4P4q?=
 =?us-ascii?Q?IF+oh9+dF+hKBg/k2JSLCIvVUDsIL11Xw/sO4sq2I9bV8uar6+P/Ayk7ouKB?=
 =?us-ascii?Q?Hj0hFg7mC5L6WFwZ8tukhrxYE03rQtHb6YrHdtZ005HKpRxGGzTIFL0tkzlG?=
 =?us-ascii?Q?AeufiOqZeA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 523269f0-0fd8-4e5b-9754-08de684e95b9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:26.3140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEoM26lnQkcIxwy6/fH6KE5y4YwA2ZaFs+13X8vHPvf/kPSwnkvI0ZXXzYt1KEVBpXd7S1sMkF7V5i87knxgvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Various "reserved" areas of FB (frame buffer: vidmem) have to be
calculated, because the GSP booting process needs this information.

The calculations are const, so a new const-compatible alignment function
is also added to num.rs, in order to align the reserved areas.

Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 18 ++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs |  6 +++++-
 drivers/gpu/nova-core/num.rs    | 10 ++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index e803e6e0cdb9..9b4407338724 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -170,6 +170,9 @@ pub(crate) struct FbLayout {
     pub(crate) wpr2: FbRange,
     pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
+    /// Total reserved size (heap + PMU reserved), aligned to 2MB.
+    #[expect(unused)]
+    pub(crate) total_reserved_size: u32,
 }
 
 impl FbLayout {
@@ -257,6 +260,16 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
 
+        // Calculate reserved sizes. PMU reservation is a subset of the total reserved size.
+        let heap_size = (heap.end - heap.start) as u64;
+        let pmu_reserved_size = u64::from(PMU_RESERVED_SIZE);
+
+        let total_reserved_size = {
+            let total = heap_size + pmu_reserved_size;
+            const RSVD_ALIGN: Alignment = Alignment::new::<SZ_2M>();
+            total.align_up(RSVD_ALIGN).ok_or(EINVAL)?
+        };
+
         Ok(Self {
             fb,
             vga_workspace,
@@ -267,6 +280,11 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             wpr2,
             heap,
             vf_partition_count: 0,
+            total_reserved_size: total_reserved_size as u32,
         })
     }
 }
+
+/// PMU reserved size, aligned to 128KB.
+pub(crate) const PMU_RESERVED_SIZE: u32 =
+    crate::num::const_align_up::<SZ_128K>(SZ_8M + SZ_16M + SZ_4K) as u32;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 83ff91614e36..086153edfa86 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -27,7 +27,10 @@
 };
 
 use crate::{
-    fb::FbLayout,
+    fb::{
+        FbLayout,
+        PMU_RESERVED_SIZE, //
+    },
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp::{
@@ -183,6 +186,7 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            pmuReservedSize: PMU_RESERVED_SIZE,
             ..Default::default()
         })
     }
diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
index c952a834e662..f068722c5bdf 100644
--- a/drivers/gpu/nova-core/num.rs
+++ b/drivers/gpu/nova-core/num.rs
@@ -215,3 +215,13 @@ pub(crate) const fn [<$from _into_ $into>]<const N: $from>() -> $into {
 impl_const_into!(u64 => { u8, u16, u32 });
 impl_const_into!(u32 => { u8, u16 });
 impl_const_into!(u16 => { u8 });
+
+/// Aligns `value` up to `ALIGN` at compile time.
+///
+/// This is the const-compatible equivalent of [`kernel::ptr::Alignable::align_up`].
+/// `ALIGN` must be a power of two (enforced at compile time).
+#[inline(always)]
+pub(crate) const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
+    build_assert!(ALIGN.is_power_of_two());
+    (value + (ALIGN - 1)) & !(ALIGN - 1)
+}
-- 
2.53.0

