Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EA82EC083;
	Tue, 10 Feb 2026 02:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691626; cv=fail; b=B6SdukLcUCVSRAYgPMEBycY2pTdTR4F3YOqkIdNFJdRTmBKv0g2496TbT+OmnNlzCf0O97x0Gfi3kUDhglFY+9MxHQQCVeJELjkp9W9RNqtM1wtBQHL1EpynjjARmVgdjoFWs0kNXK1oDkOr/pUGcSr847ttFguzKRgwR38nqt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691626; c=relaxed/simple;
	bh=AvcxU1TaW6w58VZJU5eW1dzrkeKh60V6RUCCd90vPj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I2N0kXVbgKhyoIGwzwiZHARMfnhcUKTecp95j8OuAtgyOTF1BHWlw7G6IdFuyB6+Knj+2kVDGKGP0Pg9qMXc2rfLAW2BwccRmLa58YhQeNsnIAGKpniMYKji3WqkvQRJLpbQ+n2D4jE7pEDy0bNtxrBAFG37NJmojEGCemUuRZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TrXXDivA; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TrXXDivA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUSIOxPzwLmNVr8cFLVHKTPQjxHCcsmTl18IGKhS6muVlKKRaT1/7QnzxtzyFQ0/Ue3IOz2DI49UdstVS5L+qeKs73bmKx3hKilytwrrkXMlhe2+NsR42iZMHc4WwkFZJPofHEYRWLadtSsJc8MM4Z8HAb9OlCbfZJpG7yzvzoS1k6k3o8xyALgwYPVAei7PUPBUxmlr2tVDGNhycqh7MjaQu5t/TjArvxx2Mt7qcsLv5q+7I80i863PGaiH5Vzak0J3W57b74BbxQzttlMO/xCYDOeMjtyTcKQqyuNJirodjEXlVGe7OhRm+DVlnrtTFM+kj5DqGf0S7hU2IrtVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAvwPjF1/1Zo9G6HcYLK2ukTzhlCCoq8e/cynleeeME=;
 b=EsZCUOdvm8Dmo56MusSM5IwWofabON59HV+OzrOSN3Q5dI/mbr1TbxPhJFyQCOmt25JTDH/Wq3LSCAWFTIV6ZFKcAHaGlCoyE7fykaLcpzDmhqh+N/NKt5nmQraO/Uqgw1yFsPBqy3OmxkajOc7s23r8AfPl3ynQ5BKkI3v8n1AHwXxYxUCd0Cd4DNMBcmOeiW9xH7O7KrZS3MNhxc2xt+vd2wG0JpVrBbmZw78VlkT/OPfbhfy5iHKk9fuUKQXyx1DYKiI3e+ldoSVueahQNNct4BHTjBCPOhEOtHsY3WFchqztBG+N/f1rE5CTEDOXDlCDn8G2XyNvzmpPtXL98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAvwPjF1/1Zo9G6HcYLK2ukTzhlCCoq8e/cynleeeME=;
 b=TrXXDivAwkToSoy0KuNx672kxyNhz8uF4BSi0fJR3Y/NHB70Lh6038kDEKsktNCDYqd5uw9DKtIC4dRey3N2IFVDPBjcsV51cIRrujw1wv0VrMVLdVH+XYiY0ncgfTRPh9oaN4lTuIQLmKsgoz7h8t9tm/93bWsYwoXaE0urbTvpryZ/sOTPoJ0Rx54CFcDk2e22rGV7FWd+SC3SJFl6lgXDCkk7sfMDv204/BaN0NE+KNKtkCVsgeQJO6zPC5IEV2UomRC+jdozTaxM7jP+p1ooOFMyVZXAef4IGPhxKZE+odCO+RM+8dtB7cerwtEmAL5aHreXreG52KzvqiuaKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:47:00 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:47:00 +0000
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
Subject: [PATCH v4 27/33] gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
Date: Mon,  9 Feb 2026 18:45:54 -0800
Message-ID: <20260210024601.593248-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: e670b6e9-496a-4979-51ee-08de684ea9d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OIeRCfUcjGomtO5X/BXo7ba6a8wdEots0+gtBZKfxyzmzywgO/XtFuLJzxj2?=
 =?us-ascii?Q?gjeUp7WOYFZH4Rpa97lVM4g4V9pR7rb6ZCNlVud5/9kPTxWlNyInVNw9MKZj?=
 =?us-ascii?Q?SPHwqqi5jiTCdWczjIVMHUsPFduJL4TQPICW1nWrxMbfSoKn1Td/PZPxGRBy?=
 =?us-ascii?Q?2WlE/fn4XgO9gomzkwyuqvjH/ByCHGBctujXBA58sVa394AWx5jloQWBVhAd?=
 =?us-ascii?Q?VEfylI3+MZbp4YJbbqo11t7WskDOOKz9eQE5SQb+3jXJz1rMCpYMEq35x//5?=
 =?us-ascii?Q?0B38T+HdZoQWsYrzSc+vleT1+NDHMmqabMx9SHFOJpjt8jWueyerk2a5k1SQ?=
 =?us-ascii?Q?cAZuTKKYZqdY68rwINtqcfBhBE0E0e64B+pbpayjK3DUNunH1FDmyUZHLSoC?=
 =?us-ascii?Q?vRX0lhC4G21PtdCkrswfFqOa/n7MmBVlu0F9uqNRQnNlTwRThX2/y/wjR/wV?=
 =?us-ascii?Q?Ic4MqeINSNBKbT3sNIKjaIGIGNXOQ66Ix2Xv8o/2QmQnMWt0eSRI//VEmDvq?=
 =?us-ascii?Q?BB+u7CpBW1yMpqUuQHEsRCJW8NiU2XNRa/MgegczkId8rTp3hfnophvq+JyU?=
 =?us-ascii?Q?cJmJFjdsKuFiS8a9Cpu9lni5DgAgHnwfuZaP0OAlBr4d9ZMBeAEEHDQxpCoI?=
 =?us-ascii?Q?PU9jA3u60Vg7BHC2XkGYS0uAJiDlRTOlT1gHLFL75tq4lX0CZJGnyCU/5Zwi?=
 =?us-ascii?Q?rwghteg5XDIANV2oUT30gf0EBsXqDMs/G5Ve5jHoZEHxtNzFEpPchLEPAg8F?=
 =?us-ascii?Q?UeUKDXHANIlX0+mnaLtUq6RMhdvbWpUoGmlJlDjMFVKEreBEE2kp1zkm0PLX?=
 =?us-ascii?Q?yv++kAw2Sof3TX7hMBabPjQz8m9v0nU/n4GmCCkTavH1CrggXS2bmnsLM95+?=
 =?us-ascii?Q?GhiXvwEAbMkyP5OcBDyH9sYBJPp9AU+cOU5u6hkKwLM6WTMYwTA8x6J0oPpu?=
 =?us-ascii?Q?OOtkSaukMVXVdNy5NIMt1chSLDBv+KsTEXqCvCYg+Z0wxjSxLJBrIb/vk3Ys?=
 =?us-ascii?Q?CNLbmTdJ3jUlLafudKN+sxkrRYv80p4kkJXvN8NYQFlr9Dl3U0ud+MkioNyn?=
 =?us-ascii?Q?BZE9zsnA51ViRRwws2IJRSN2Dnua7dEoon3CMOffUjUTwmbCS33fKbKdZtU2?=
 =?us-ascii?Q?YBiVIS0Me7mJcKKYUnCz/8LuC0BqOxC0eCw6azSPEa5X0tetdVcBSpOxUd/m?=
 =?us-ascii?Q?z3RHcxmoGkKci1WWlZBhnJ7BAzRurBAnhnBoAGx3XMSS9HGGLg2gOKlUZ+pP?=
 =?us-ascii?Q?sLfV9EPmcd2QvEFlC5kRbVF/ARpLKp2FpupHBk+ejHwckaioAwn47xE8ALvu?=
 =?us-ascii?Q?z9572DpUG/uPif4HkEuem4qTDUR0h5wYW+xMfS/Y10we6gjmxDMRELxvxLsz?=
 =?us-ascii?Q?ruIGBCIFpzgrqX0jsxxicYRFIXJZpD19ZfmOr6bLxqI1cghOAw6SJnp5R2fJ?=
 =?us-ascii?Q?5twVQf6as5m4GEXkyfVEwV8tKW/QfswVZlm1IGuTdfQ7uoIj5QwVOmLAaRRr?=
 =?us-ascii?Q?anqoidUOVFfi6PVNoaFslTze0Qj89fzLibhGtjYI4JNoJpWGvCxmkLc89Ptc?=
 =?us-ascii?Q?Sq27PHwAw5nyDxQ+Mo8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nsEY/iefSRgpeC6MsnESXN/ZlV9f9EU12xYjlxe7DCzfiDu1RZC2TEwV9O6w?=
 =?us-ascii?Q?muE7zAgkK2CenDNzdtQdqcsTgKTovc8PA232t9uuZV2OpwiG9lC1VGfF+wcy?=
 =?us-ascii?Q?Seuq1vKOBnLHFNZGUE9pegzIz3A0G5xBHgd4/DkQWY0v8m78QQtfbEbr90Cj?=
 =?us-ascii?Q?AHl8gKfK3M/ha4uzo0UtlhxN9So7KCalfaxUrz32X/xNzEU3cpE0X++SKkps?=
 =?us-ascii?Q?eoUCPaG2qgX6fhq7hwdooJycelgjE0zveJFYMpQoBPR8kFckhGZMk46E6JvQ?=
 =?us-ascii?Q?d2x4l8Jb7QvqjDPCSDA03arasytY3lQJVgtEfAnFMSmdprVOlh2++6c0mVsI?=
 =?us-ascii?Q?BQma8XIw2uC8NWlBOafmcctEJS7q190GNTY1o/G3WRmd/Aai35zflx4Xj6F/?=
 =?us-ascii?Q?eygv4EkSu2pMkLqvLcthhlAhvHvTi9zbfpzKjLMQjPKufFLMzQijrfEAfko+?=
 =?us-ascii?Q?7WjbEQ6z2IG/WM+rRLhXKozgbzEMotGJN856YRtYTml7xjk27tXS2MPjd8F/?=
 =?us-ascii?Q?z18vFnVoQkoOTGt+uYMnc5WUhOfHkITgO25kYjpW365ubUWl/UyCeP1Y1wCQ?=
 =?us-ascii?Q?f6/OdCXmpfgGtJirBpep2WJ/DDo+Svqms82Jc000wdKCDSsPbVzuBwv1H7hn?=
 =?us-ascii?Q?UwkMnjWhKZWIte+GXUz88U3ElM05TleUa9CMCy517zBDMh5iqqtfOaojmmXK?=
 =?us-ascii?Q?A+bUtcoxKBnMKh/cWfLFUJQUCNDk2fbpwj5VBsZYZ+ZIf7OvXSd9ut2UA6od?=
 =?us-ascii?Q?LqovRYm8+AF4oGg37p8V8PBR7hCf8ZmPLOOVZNJw3rQitr6qa0+tw2tEE73w?=
 =?us-ascii?Q?Mc1OBXmCn5zUlOpVr5nK+ILIzMsv+jfo292FWO3rRyRUdIbTLmsfuh6ibXSA?=
 =?us-ascii?Q?1vH91D9QRHYTvVxvFxhKVOXuMNFczZrrBMmtjOaqNfD9rEkorCUeM7UfzZUG?=
 =?us-ascii?Q?ofGe2avyDtkpMSKJ/q3Ogk7d2VhJQ6ICvGbRG1l+zrdYSMnpkQ3VjcpW4ah+?=
 =?us-ascii?Q?QxyIjmNQiccaOS9RcUB/nlDKTHnmfR9A3BBCrF74EVFy+X4qoHZKN8kkUBg0?=
 =?us-ascii?Q?YGZq0VnY2g+E6zjt6h0mS3BGSpPzBj05aR7qj1ZDv7r+QhvRJZ8y3CC9k6ZF?=
 =?us-ascii?Q?mVbifIprxP9aA/vJrqNUBjkG+6kFy7+RUNVWCMWjS1X4l0voAcfK6wTDYiYp?=
 =?us-ascii?Q?FrCIOzdHUek/NvjJ6Gwshgb4uIMNp5uWiBvABTLiGlRKZw2MQCIOI54AVSvU?=
 =?us-ascii?Q?NSD4tFb8fLn2A6SZEpQTlq3Ube0/r/RMbp6cIb59sPjrmbvYFQy5kRfSU7++?=
 =?us-ascii?Q?sN5T38q3WybaQx3FTtCXe2iPjV6i0ktveDFehPZxQEmuzR9QlbOKR3BEks/L?=
 =?us-ascii?Q?+Qu+lgcHLlFFr0jxbt5KGhQdGDZ6DUoo4oDdJ3YWgFjRFAx+NjG++YlBmthu?=
 =?us-ascii?Q?UVsvi/hD5s1VlT/1DPWMtU936pwrbiOQcJSRoO1/D/lTd8VqT6GIr6ab78mY?=
 =?us-ascii?Q?qaV641tNlYBGCo8IMGxaF3jYTDHyD9fUzvDANHQn/4+xCiRDpD20/otPBace?=
 =?us-ascii?Q?6HuaTJaratfu/L2DyNO3BOkVy7RyNZYAoYFPAyYmfi5rPnpmM6r9uTYceOu3?=
 =?us-ascii?Q?NeGFNbU35EO0n/ZoIe2B74iXHiJ+1Y3qhHsakP5hnSEF704Hb+6ny8CpQtga?=
 =?us-ascii?Q?0sGWmP4tpKWnSAjojort+zLUV3n7+L6NVmFVlKG59Kt/rP5HRvexUEBs46Eh?=
 =?us-ascii?Q?dDRV/vyO6A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e670b6e9-496a-4979-51ee-08de684ea9d2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:47:00.0683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qk3SmsDT7WEVkFqh8j5vudlTcDFaqHXpJKSHBMc7Fub0hWv4gstgItq3YO79XbPjwiengGYl4pyw8UHuJ4bWug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506

Hopper, Blackwell and later GPUs require a larger heap for WPR2.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 57 ++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 086153edfa86..927bcee6a5a5 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -49,21 +49,41 @@ enum GspFwHeapParams {}
 /// Minimum required alignment for the GSP heap.
 const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
+// These constants override the generated bindings for architecture-specific heap sizing.
+//
+// 14MB for Hopper/Blackwell+.
+const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u64 = 14 * SZ_1M as u64;
+// 142MB client alloc for ~188MB total.
+const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100: u64 = 142 * SZ_1M as u64;
+// Blackwell-specific minimum heap size (88 + 12 + 70 = 170MB)
+const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_BLACKWELL: u64 = 170;
+
 impl GspFwHeapParams {
     /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
     /// and including the first client subdevice allocation).
-    fn base_rm_size(_chipset: Chipset) -> u64 {
-        // TODO: this needs to be updated to return the correct value for Hopper+ once support for
-        // them is added:
-        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
-        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+    fn base_rm_size(chipset: Chipset) -> u64 {
+        if crate::fb::hal::fb_hal(chipset)
+            .non_wpr_heap_size()
+            .is_some()
+        {
+            GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
+        } else {
+            u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+        }
     }
 
     /// Returns the amount of heap memory required to support a single channel allocation.
-    fn client_alloc_size() -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
-            .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
+    fn client_alloc_size(chipset: Chipset) -> u64 {
+        if crate::fb::hal::fb_hal(chipset)
+            .non_wpr_heap_size()
+            .is_some()
+        {
+            GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100
+        } else {
+            u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
+        }
+        .align_up(GSP_HEAP_ALIGNMENT)
+        .expect("client_alloc_size alignment overflow")
     }
 
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
@@ -74,7 +94,7 @@ fn management_overhead(fb_size: u64) -> u64 {
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
             .saturating_mul(fb_size_gb)
             .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
+            .expect("management_overhead alignment overflow")
     }
 }
 
@@ -106,12 +126,25 @@ impl LibosParams {
                 * num::usize_as_u64(SZ_1M),
     };
 
+    /// Hopper/Blackwell+ GPUs need a larger minimum heap size than the bindings specify.
+    /// The r570 bindings set LIBOS3_BAREMETAL_MIN_MB to 88MB, but Hopper/Blackwell+ actually
+    /// requires 170MB (88 + 12 + 70).
+    const LIBOS_BLACKWELL: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
+        allowed_heap_size: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_BLACKWELL
+            * num::usize_as_u64(SZ_1M)
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
+                * num::usize_as_u64(SZ_1M),
+    };
+
     /// Returns the libos parameters corresponding to `chipset`.
     pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
         if chipset < Chipset::GA102 {
             &Self::LIBOS2
-        } else {
+        } else if chipset < Chipset::GH100 {
             &Self::LIBOS3
+        } else {
+            &Self::LIBOS_BLACKWELL
         }
     }
 
@@ -124,7 +157,7 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
             // RM boot working memory,
             .saturating_add(GspFwHeapParams::base_rm_size(chipset))
             // One RM client,
-            .saturating_add(GspFwHeapParams::client_alloc_size())
+            .saturating_add(GspFwHeapParams::client_alloc_size(chipset))
             // Overhead for memory management.
             .saturating_add(GspFwHeapParams::management_overhead(fb_size))
             // Clamp to the supported heap sizes.
-- 
2.53.0

