Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52463F4F1;
	Thu, 26 Mar 2026 01:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489170; cv=fail; b=W1vOlmxe2EtPwm2ig9MIFnL7TFl7sQ1SSoI/A975Tf+WGRctFLowtibdBivzt4OQv5FufJQu4vPTTbyJOFcrIzDXbszEuzU1VZwDbtqb4E3hpzl2l6sBNDj2R/za48uyB+bm5vWXGCHjthkZVKSvQzw1W9oHmYlNK0kmZMGEW3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489170; c=relaxed/simple;
	bh=l4atXRETD4KGCJJAjsnM4pvegxwCPimzmrtzVWtrFwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=momnRcMBpWv8c4+2/h/uLsof7y5dTUmDPeNyHLAnkNAFO/21hJPQM6Ya/rmuoOP1zhhtduwxS45IouOGacc9pDUMxVXmHj2j8kGi70qKD0IccMP+nxsZBiDzrUfvVVGFuHbi/wa9COhx/KAb9VHYzfswA64DSMxhIpICplbJfLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NOmnfyxU; arc=fail smtp.client-ip=52.101.61.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NOmnfyxU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdFnMw/JkJDfrslKikdLNPyWNR7ahpJgxZ4g2s2sJaAgeNHizqOIOPI58cR6i3J6yUy+55ri2hfLPFWmODtzmaIA2DZKq4ewzcqxI1aLSUV4osL+EhAPOemrDI5IPnIedfCbMHJtvCtybr351Y+zMpx4brZErWD0jFIoEaXzEH1glzVy/WJPu5H6tkRPx2pZsw9IVsX2KqSeJHhJjinVuNEmb0f6UzHW98AkOL8RPrRRMA5u7iuWJOExHHKflThUA7IQtUgjzRevL0l3Y+SlJ68rRcPUxEZkIuwPCP5QRfesQwrpisjy9wNYOC07yaM4gWFa+qXu8DPv5rOBjHSfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lfhzsIb2q3L7xidvno/ULFsh5GTdYGGFidG21+qKw0=;
 b=dNYK37v3T+nAbPgmsNOu1l3oZWYddCjAw3fKnY/vvjtu/YVqJHEmcGQcbG7VrXv7lbQmXTs2j1OD+kx/RtnC8NGUv74sibSAoeGe8SwXHcMj7PYOaX+Fsgv+nEd/Pd1YiRdEh6hRLHhUj22RjJz25cxc0HMVywdWAd3oqujv0qo4PON1S1+SPM2en1tOnYzdxsXfg+rmXDqso2eDmc5otA2tzj5n+ktr2cF4GRne5cTY+oLPSuoMYzOfOja+o94R9Wbg9P87vvDaJjJqTQxEsELOTSzTNbtxlJsSGwhq+KAOOURS/EiXGy42mPTafrdRb6hon8tZsKHBrsh2GKeViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lfhzsIb2q3L7xidvno/ULFsh5GTdYGGFidG21+qKw0=;
 b=NOmnfyxUTx3FR9zS+swY3D977uR3N/rT4LJWN9zKj1xWQgDaeuHJlBBpWawuQujBwaJGnxvgtNLO9AxpsVvhEt8PB+/wtgLVFT+L1MPJ+a3KX1Wo0ckUNHyfH9Raqnicy7zi5t1rRB4ie8IHkGoDh1Ohj8qfQWw2u74FKRPsPF4f4C9EPCCvuwxOowQoW+5Yrd+mbXrBHmO3u/25Qs8OHP7Wp6DOXHCzwLa0SxwhoBOD0ckxDJNlfkUW5aOMKlLvSbwKH1jS9IHKM9fQNH3ADB3+hr7ehPj6rvt8CgoCRXm1Elk2gBRLmAbaC1D0j1um54g8TNcrH4LqGzYBSPGtWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:10 +0000
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
Subject: [PATCH v9 04/31] gpu: nova-core: add Copy/Clone to Spec and Revision, add chipset() accessor
Date: Wed, 25 Mar 2026 18:38:35 -0700
Message-ID: <20260326013902.588242-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 8762ebb8-6165-4c3a-8e1b-08de8ad87a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tIvCe5ug1+mVS1XSSBPqWalx3Pz8SXF5nwbcZmJRj+c/xbgxPiBtyag5lX0nC1MBjpD/q1IIVvtd9jfXcFLmZaiXYVRbfxsttRmD6QvLo7Xd91Dn0k0jidS3DxSFsyI4QILTqJqMSP6ThzVFX7mtFN3s5CjEXBk/gdNx7Rp9F+YvodxpNPtEWXNp5KZROqSV/gQpC/rMTIRng5S3iY30KQPh6pzEwEFBi1W/Eh612VH6KFuVxGiNVOFYtrHoWhCd8RN0DHyKH74UVlW1Zcl5nHoInwpoOex1UedXyJcyLNOw3xLONilSdX3c8AFzopO0ctNMSJI5P9sm8PFTL2rslF9omyg+kzdjhUYraWWrNimhnrkSZl/wC0qtIEZCAauL6k9ZCCZC5IHWel1Er6mZaqs4j3mVlPylceRF9oRBdKg0JEW9wrXqRzJiRlq87uo3FfEkeNMbg675UhEClhfoLxrrLZTfx14F1/TKKydBLtTxOO1FlqXmuECj3SfwhU3Wr2vH7JIv4cCggqFsEluyT1aQNtLQ+y7D79Cqah5FI+LrhCSc/8f06bIzPMhDReswQ2jowgprzbhegrpinHKGFw4AxGw4QgdCkkpjVztgxlLtnrQL7P5upxuW89emV/+lpkTnUfeYrDSGLKmyl+TcewpFEbHczESXkjIb8NVRbmyukHibzwwouMvkRGLichTnaJ+i+Nr4o+8kgD3/XGBrdBuUSWwDmF7GAaHnhRKLxq4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xf8oMjZYUbYofM6mHejt+K0RfK7XqniHy0IxSbXw2xsRDZUd6OvnQthKeLDB?=
 =?us-ascii?Q?VmtmwIdJbTvULwJmB10T9vYJsXeQeAAAySXp2D7r6FRmGeorXS1xuGA8lXmc?=
 =?us-ascii?Q?+e5oyfh2SzS2JZi3tymwLBr4m/6UedyIw1fdsS34AtKiG1vC6oPzbD17KyuB?=
 =?us-ascii?Q?124LVgDZCQZ8/a13IwOCepQde9gVJkAlwyOvmOq/tWl0s2zuMbJtJXik8Bjx?=
 =?us-ascii?Q?vaQ4v8LzeStysVK9fVbVIkwkbVjp38kuMWVLyhlafGMxLeSBCAvDmdnmQ4oj?=
 =?us-ascii?Q?qT+Zw//z+7MRWQScckxq/0zDaGhTZOlFXvvttT37Xd4/DvPP5Jdz4KSzWsOo?=
 =?us-ascii?Q?8KaG0SPbN7E2wUDvBhwhumSQaixuGU4c6h9e7tpjiQQJggpyCJteP5HExPVF?=
 =?us-ascii?Q?7kcVV+0I8iUj7vKvp+ZmlRJdLDh5N2bZ/h0/iIjavhGg5il3sptwrffp8DA1?=
 =?us-ascii?Q?TlYJSjE5/ZKjIkoSyxGqTm9MAIVQ3kPEGQ0ypub7rQsAa2NtvrgPLUPDCOH3?=
 =?us-ascii?Q?hh9PStwj+iy8YBRaJm7AyowSKuAh9HSxpOp47qmPoM1ylxG2Yr0oP0++vBrh?=
 =?us-ascii?Q?kWjiajlC69P2KB1G82yRbMtRUKoL3s35IUxTgjDAC5UH6rEuBNsvkTGgXvSm?=
 =?us-ascii?Q?8aUF6pkM31WyT3twpdq/akrACpHR6GXBok/kEpDwtykngXY893hUGm/rnNWF?=
 =?us-ascii?Q?8BkT4Jqb/neWSI6LxPWNuZ8yft6/gGRXHkbRYdVR4+uV7R7i5PtICDm8eRbb?=
 =?us-ascii?Q?EIn+/JUPtGqspPWlFfaqMi95hAOz3lqN/JRY/7ICB7Dfphy+bITd26i7zhG1?=
 =?us-ascii?Q?mdbKGrNIulpMan3KpGZGEx2DdE24g/ZSKO9Fh/CwYSzUg37ZOmC9d4XVA0Zq?=
 =?us-ascii?Q?dgy/hrgimQ2LqCGn59hWzF822qu5QU3ZJBuIw2TGkaSnKSd3giPg++4EvJdg?=
 =?us-ascii?Q?1VwUJz094R3qwnp66vBumvB1AZyzhOCZTYs85pJwNEdHR207zQNfoM2V2GJ8?=
 =?us-ascii?Q?lfYN/IkwIXhON6/+Ebr2NGmMuxhf12ta8PloHpIIpjG40ds+ThCvcxn2gZtd?=
 =?us-ascii?Q?+Vkzp1gUZhJoHrHRTsL4yoSHSztmA3KuuwwJRcU4Qr2NhNfdrGrZx3jOZoYj?=
 =?us-ascii?Q?cXqRRABqtOIYmSL/m0u3Z0yOycQ6FJefloNuQewWDpQ0iGX+ijLzKwsnoUrS?=
 =?us-ascii?Q?uqw7i/IZj9papANIi72Qz+ceXRYNSGLWEwfCyM364LTXhoKFtEYfDmkxXIT6?=
 =?us-ascii?Q?KITKhwpJsI73wG7D7eLsOTGjt1StwuZAbZUNU7YAmsvuEKrLffTVuXvbw08w?=
 =?us-ascii?Q?xEyPLSu0bUw9+EOIguX9SMLGM4yhlvCm+lsQ1NRN7lFPN5vR7kmnbWbII93d?=
 =?us-ascii?Q?5j2c6Eh86FZqN4h0raTzj6+3kQHNWTDBbDNPnVzM0Jtf7uop+eyGYnCGC0MB?=
 =?us-ascii?Q?sOi4Zf6ar9UiBWnNoAd1uMuLCXZG2ixjyN3GT/p9XXAhdZ0BQKzk/Z0uLBOb?=
 =?us-ascii?Q?h2o+mgOQiwQoiRvRvHWVZxO0XIxTwnyl77mr7v0h/019sImwuDJ/Fnvq86QZ?=
 =?us-ascii?Q?6oNngCz3cztuAsBIkKuu4wRCjNdGs0jf8QSR1QNx95gZz5YeG1vK1J7/l3FU?=
 =?us-ascii?Q?5JQ1X+qpmfGAAwtxh26cXnTypUyqsHrkNmP7y5QyXKI6+VUf1TCoGCb5FV1Z?=
 =?us-ascii?Q?NssM8032pGagx7YYEBk6nRqKPi3JnLmEmih/pOIMpa8bo78q3cS422ibQw5r?=
 =?us-ascii?Q?W/QnwU098Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8762ebb8-6165-4c3a-8e1b-08de8ad87a12
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:10.0695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILstuegj05PodosPhCZeRvwPWMVujJvqqDbj2YYR6XPfiHPQl2syfq8wIRm7GBaJyf9l5TN7PAPqKfGor8qqtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

Derive Clone and Copy for Revision and Spec. Both are small
value types (4 bytes total) and Copy makes them easier to use
in later patches that pass them across function boundaries.

Add a Spec::chipset() accessor for use by later patches that
need the chipset outside of gpu.rs.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 0c68bca7bf65..685ae4c81268 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -183,6 +183,7 @@ fn from(value: Architecture) -> Self {
     }
 }
 
+#[derive(Clone, Copy)]
 pub(crate) struct Revision {
     major: u8,
     minor: u8,
@@ -204,6 +205,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 /// Structure holding a basic description of the GPU: `Chipset` and `Revision`.
+#[derive(Clone, Copy)]
 pub(crate) struct Spec {
     chipset: Chipset,
     revision: Revision,
@@ -240,6 +242,12 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
             dev_err!(dev, "Unsupported chipset: {}\n", boot42);
         })
     }
+
+    /// Returns this GPU's chipset.
+    #[expect(dead_code)]
+    pub(crate) fn chipset(self) -> Chipset {
+        self.chipset
+    }
 }
 
 impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
-- 
2.53.0

