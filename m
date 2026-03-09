Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010061.outbound.protection.outlook.com [40.93.198.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FA53DA7C3;
	Mon,  9 Mar 2026 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069284; cv=fail; b=r8c8QTt1NhL8ezM/IOvLi3pfjA/18dDyJ9MFLcSvvzTKapRuuDkrx5z7JeKhOMxtNz4TI6gPoAiOfBkCyxRc08xmdvUAjTjJzLXzO+DyKeDwTOkhIwMu+HkvHldqwcec3Ypa12FrLq52/dF21jFpAx4LvhLusCNAVCMLjGjnvro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069284; c=relaxed/simple;
	bh=pPQS9lbrS7Dj4lAMmB+EItnkWUlmtHHvnIxH8l+aNF8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jVfwNmrRMpIdPOwLJPgCP75KdlyRK5VSyIuwoK/dQ8UJBXbA0acOHCDYWs7MwUEhFd0+LgweVxbbAscKGtpO6lDXy1yT0mqpb4kafSs7KAZRYhrSHXuiA172AWfc6wxBwPoWn4LwdV7XYX2kCR+rf9381VX7tk1etYh39voYjv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jS4aqwXw; arc=fail smtp.client-ip=40.93.198.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jS4aqwXw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBOu+1vD6nNJ/SUV3g1y4hO/KNorfx+dREbw79rbBLrI5X4LJBNgNbE5ZbRsQIbkD14MYU5WemDZHTxNgFKD3hcb4oYpJVWw4l5dOSRaNp2uWuGZORuiHrVYhgHPfaesz7+4I5XrGrH0VdS39lYb7y/iGGf1CQNbm4tiAa6bkr5ac+4lY12GP3cJccJ7v+1WlkqtHQDLvEshhF7WKb5ckfC1hx1uQQi2/qN2U4AHH9g5QEAUJ/1teSI9Xsvz9js9oNPBbVzhTAf5ZkLlQg5JPtOi6pLpY3v1POiIzDonxeJm5/dPhxZNBN7Kg6Bwzw41O9fguESnl6YumCGathHqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoU6ThMforKVvi7iA3cbMKe8D4UDyjRSMXaBpWS+SAA=;
 b=dlMtz2lwvDTc+QT3hy6PXz/61ytPQ9z15n/n47vn5r88O1I461i3DaO6wO4ILw9c+ygXP7wBDdSg5DEMfiJvlZzkdf0f+dhwjJYkEJ+JL4jpvHluDqUf+JR4jBSaCou1AzidVIfaHREdwiWTYYiZcz30cdP9BuBSzmtaI2zZV6KfDouRy5EonpS5XkU9MW/Airpc2ia1/E98YHX9AnfXRYgPpZQUuT9fBvz8/UCGl/TTYeZ7coB4PXIBbSIHEsQBE9V3pkFIOxitc2nTqkqv/EZB9NmMi1nLi0J5Pj6o6Ft72jJxTj2GxrKXb3smRQdi+LE2YPgtdnsiEjfYSNAuDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoU6ThMforKVvi7iA3cbMKe8D4UDyjRSMXaBpWS+SAA=;
 b=jS4aqwXw5FwsUQ/f7YkaiA+3D7NKqve5dsFL6cFGdnJ0htEg3MQHVk7YXYPEQ9a3+3Y1YSlgVzpJUbW+L+tzkH1BiksBpZY+Y5iXX/XZeWr/w4QiAbazc1AK3q8xXIFM98FW2pUQBeh4UCo+LdlLNArhKJz6P7Iud+aqUyRQtO+zMBPrDR1Me/qvY6n92hN9Cfx7asftKC4pQiNKLCCHYFdMPOgsWvLZ0zuQwTkFQSKrI7u1cJWDMoZBSxfzBuT5H67wzPqYjqc2bXd84iiR0IMTx0gG7bLEIPEug/w5f9v7mpaecbD1T/wVWN2FT2TFuYHMV0lXiRO2uZhmSOvgzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 15:14:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 15:14:37 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Mar 2026 00:14:03 +0900
Subject: [PATCH v8 06/10] rust: io: use generic read/write accessors for
 primitive accesses
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-register-v8-6-424f80dd43bc@nvidia.com>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
In-Reply-To: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0367.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c3be781-cf02-4e81-132a-08de7dee93c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	Bt7Ds2ZNNvioTNWpzcrua0+VBJgjsYGChM/+dr9jmOMJRy7c03XDK0xDuqDhZvr06917mkvpPvplQgpcctW+9m+f77Vb/mQnSDYnnxQFUXqBZ1WEnmD1Wv0FuaJibel9EpLPdJIdstt1QoMi9As9ieRoVn/+XTGOdCXgoheT+QGOCUc4ZGBYmf9wt8ozmMAEapwNj8tc1+AmAlGI9Xy+Z05uUj7v6vo44QTM6yFQ1xCJrk5tTbRsnXt6E09RmVb3Qc9l3whaIZylniKAT0U2kMcGYYAVGPxojW16g4hqmh4cMHxfMoh6sWo44ESoBHoemONbk69oymtUAkocGvhO19FK2nzI06dMdFfk4bljHQGU3ouUDKnW62DZRD6sCpZee8oc1idvtV4Euo2G+vngIi8ALNVATqY8d4UM1KUUvUbQnzYpgWDFCFOU/cu6uLRvYVOmcLhlUXKa08oNvUbrSo738Zd85RkkAVzWKI+h2dqiGpBEfu84bCZ8qLTAsmEPxTpimbDEg/XXh4aJ6ddTwfueAxJt0pc+OtGyhgzreG2vMkuUGrdlRomzqudawroNtSk4Er9/b/+RVfsACx2hNgY4TwF4sjO8pm50Rvmpe3PRcXaOV6H2yCJSlAbrlkpIR64zQhgT6GKkIvURg1J4LcDpJ9vpAo9QZ/eJ5saP2Maw6atJ/7FdvTMmh2fCWOBh5c+6E4FgCt/AhOlf3AOusaOzYR3p4YLKpX/615mmgwaImFvosFaweEBTQZrwAmssG5Z/rr75URl77t4YkCX65w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDluaTh3MU5idlE2b0hKVHdsd1V1VUdJdCt0Lzk5b04yODFyUGtpZUl2YjRR?=
 =?utf-8?B?dnlOck90a3h5SGV2eitnei9NSWtBbGhRMEFPQytoeDZWdnlEeEdJcmwzNXhO?=
 =?utf-8?B?UEc3WUZvdmdtV0swREd6L3AzSG8xWTFjSThPc3JvQ0xNRXdtWFdXdXE1L09y?=
 =?utf-8?B?dWlOUXB5ajNHSkt4MVg4ek9adUN4VWg4SVJ1NWlFSHNKUGxndGpobzBoSUpN?=
 =?utf-8?B?dWJWY1VCMlRMMVpiWHJweWlOcmZoc3Z6ZmpEQlllaHpWNGVSSHB6UWU3Njgr?=
 =?utf-8?B?Mms5aUJsRDZVSzUyeUUxMVZHQVB4R3pLb1RqNkwrTExJcmE2R0dXUFhmZHdm?=
 =?utf-8?B?aUZMY2RTampEaG56Q2FoVUl0aUNEcFVFRTJ1bENERzBKdTk2NVAvclBlSmlY?=
 =?utf-8?B?dThmVmFIYnU1dVlncnU1V2Y3eG5XTVBMYjU2bEpZcFFoV3ZJNFhPaWFGQjhy?=
 =?utf-8?B?VGpkZURUcHdEdU4wQTg3aFpkTVhQK0VuejBzdHg5d25nRFRNYjRKa2t4NWwx?=
 =?utf-8?B?aW9GYlNGdTVHeE1QSkF6bm9NNnZqMHU4SFdUeEQzaDg3RWdaRGwrUXlkamZ4?=
 =?utf-8?B?MjhWZHRnRnh2bUtZY1VBR0ZkOGhCZDlxb0lJWHc2TE9rUlRsZjdaeURGc0hN?=
 =?utf-8?B?MHEwUzM4WlNZSHJlc0Q4Z1dBV0dkMWg1YzYwVlRGeWlPNTZjNkk4Z21yNk1L?=
 =?utf-8?B?dVVFZVB2RkphNVRuTzFwemVsQmttaDNNWGdmdVhDend1ZHkxT0J0Y1JUazNu?=
 =?utf-8?B?cHE1WW5pRDhJZHE1SHJiSVJ5V2JjU0NXWXp6SFBEZXVMUkNsWUNsWklVU0xG?=
 =?utf-8?B?YWFOcW5GOGYwYjZRbWNYWW91UmVjMm5FSktrWDVJbUlPdFBqUFVlcTZoVWxB?=
 =?utf-8?B?cEp6SjhpRVNIMXFBUHdreGE5RDdmN2krMWxhalNkWGx3MGNJN2hzTWtiMWRE?=
 =?utf-8?B?R2lwUjRPUytTMUZYakhqSFhXSENSZFJselhpLy9oL3c5cTBqbmlSWitGaVZm?=
 =?utf-8?B?OEZJeDkzcVg3aE5iUnN2QUdYeWZLMnZjOXYzZCt1YndIeUdOZFpSdUZlYXQw?=
 =?utf-8?B?WlMvN1JsWW82eWM0V0RpUlVkYThYc0tTQnhhNUZYS1Z6VGZTQlhWUWdNdUlU?=
 =?utf-8?B?cVM4dXRVM3p0bDA0eFZub3dJcStXeGxVUDYrR3E1S2J2ZjNETjM2UXRwWGJT?=
 =?utf-8?B?YWZmcW9OaUpUbFBqSlZkRVRMRG1QbnZFRmdRT09rekxVdU00RXRlYlVHTFNW?=
 =?utf-8?B?aHgyTlZQQTFRRmtOa2lNRzJ2Ymt4OURnZW9HclpLWDJTMU50ZU5POWs0SUtu?=
 =?utf-8?B?REhETjZQNmVwQm5PVnZFOHBidTVXZmxieGZ1UXVlOTYyQnYxTEZFaENpTWx6?=
 =?utf-8?B?UEk3M1hraGxmNVc3U2pULzJGQWNRaDk5VHNac1F0cFVWSFdBbzc4TFhJdjVr?=
 =?utf-8?B?QzFzazdNUDNFVitiV3c0Z3ZFOVFaeGRkS1R6QXBwSEJ5dGtrQjBxL0prbmV6?=
 =?utf-8?B?VHVKM0NETHZLckpiSjliaEM5U0lNNmljbmhYS3FQUUlPT2NObmVWZi83RkZ0?=
 =?utf-8?B?U2paV3p2Rmt0ZitUQ003Z2RVc0RLM1E1OWFSQmh5dFVrQ0VFRFdZRWhmam1D?=
 =?utf-8?B?RE9GajhZNGNhaVhDbjdkK2xJSGRjWVAvVWRVRE9WMDlMY0FpSktUSnZub2RQ?=
 =?utf-8?B?RkpLV1BrSnFEWlZyR2EwL1A1UjUwR3lGbm9URzdGTU9HRDlxZkN6cDJxb0cx?=
 =?utf-8?B?TkdoZkNRS2thazZtd1RmZURaL2JGSjlNNm5TMnJGbmNPOGVZQURYQWJQYmVi?=
 =?utf-8?B?ODFFRVNnciticXp2Z2FWa0NHeUZsUmxNVitMYmR6KzhDNDl4L1N1QU44OUdG?=
 =?utf-8?B?RzBlS293bG5QMlJ3N1RCczlWZ1IwSVI4WElmZVJwL2ZGcmd2N2hsSmlTbFJI?=
 =?utf-8?B?aXVaUHgxcngzemtVN0ZiMU9ZT0pFMUgxZDdlZ1pkR04rUzlYQWx5cXlQTk43?=
 =?utf-8?B?S2o0aVRIa1lXVlBHV2dCakNxMkFTSU9OZGIvS2Q2cGg5RVdEZmV5VkMvYWFv?=
 =?utf-8?B?Y3kwMlZKSXJTdXIrRUN2bzJvT0UzM0dLTmxCaThYVmlGQ2x6NmY5eEZFUkVZ?=
 =?utf-8?B?TkdpWnlyLzV0QW80bHBibGVNeElDSDZ4UktGK3lOcnkvVFB2TFZWTjN4NXpw?=
 =?utf-8?B?ZUl6RTRhV0pHZDk5empnNUFOSFVVYWxFU1VjbStrUVE5Vko0OU1hZ1V0WmJP?=
 =?utf-8?B?N1kzS1A2L2VSdlU5NEZ0QmlMZVk4RWVIUGxTbkRXdmZJL1d1d1kwRHh4bW9N?=
 =?utf-8?B?WlFLdEx6OUNzT0dhcHNSOEZJbE11TXNTdFAyeWZNOWFXbUE1RFliMUN0d3VC?=
 =?utf-8?Q?FdhOEFtib/eZCprEg0bTW5ADncqDVr9StPoGrbUVkEAEM?=
X-MS-Exchange-AntiSpam-MessageData-1: FxzW+n3Fpqjwnw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3be781-cf02-4e81-132a-08de7dee93c9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:14:36.9642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7ILU+iJjGYiuUUJgeWR6vfyiQ6tLHNsE6hpxtrbCFpdcePNHBI3Z9JRxO2ZxeRi7nNJaE5hTq87Fx2jBDlr8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

By providing the required `IoLoc` implementations on `usize`, we can
leverage the generic accessors and reduce the number of unsafe blocks in
the module.

This also allows us to directly call the generic `read/write/update`
methods with primitive types, so add examples illustrating this.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs | 199 +++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 131 insertions(+), 68 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 1db6572f4a42..ed6fab001a39 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -197,6 +197,25 @@ pub trait IoLoc<T> {
     fn offset(&self) -> usize;
 }
 
+/// Implements [`IoLoc<$ty>`] for [`usize`], allowing to use `usize` as a parameter of
+/// [`Io::read`] and [`Io::write`].
+macro_rules! impl_usize_ioloc {
+    ($($ty:ty),*) => {
+        $(
+            impl IoLoc<$ty> for usize {
+                type IoType = $ty;
+
+                fn offset(&self) -> usize {
+                    *self
+                }
+            }
+        )*
+    }
+}
+
+// Provide the ability to read any primitive type from a [`usize`].
+impl_usize_ioloc!(u8, u16, u32, u64);
+
 /// Types implementing this trait (e.g. MMIO BARs or PCI config regions)
 /// can perform I/O operations on regions of memory.
 ///
@@ -241,10 +260,7 @@ fn try_read8(&self, offset: usize) -> Result<u8>
     where
         Self: IoCapable<u8>,
     {
-        let address = self.io_addr::<u8>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 16-bit read with runtime bounds check.
@@ -253,10 +269,7 @@ fn try_read16(&self, offset: usize) -> Result<u16>
     where
         Self: IoCapable<u16>,
     {
-        let address = self.io_addr::<u16>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 32-bit read with runtime bounds check.
@@ -265,10 +278,7 @@ fn try_read32(&self, offset: usize) -> Result<u32>
     where
         Self: IoCapable<u32>,
     {
-        let address = self.io_addr::<u32>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 64-bit read with runtime bounds check.
@@ -277,10 +287,7 @@ fn try_read64(&self, offset: usize) -> Result<u64>
     where
         Self: IoCapable<u64>,
     {
-        let address = self.io_addr::<u64>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 8-bit write with runtime bounds check.
@@ -289,11 +296,7 @@ fn try_write8(&self, value: u8, offset: usize) -> Result
     where
         Self: IoCapable<u8>,
     {
-        let address = self.io_addr::<u8>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset, value)
     }
 
     /// Fallible 16-bit write with runtime bounds check.
@@ -302,11 +305,7 @@ fn try_write16(&self, value: u16, offset: usize) -> Result
     where
         Self: IoCapable<u16>,
     {
-        let address = self.io_addr::<u16>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset, value)
     }
 
     /// Fallible 32-bit write with runtime bounds check.
@@ -315,11 +314,7 @@ fn try_write32(&self, value: u32, offset: usize) -> Result
     where
         Self: IoCapable<u32>,
     {
-        let address = self.io_addr::<u32>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset, value)
     }
 
     /// Fallible 64-bit write with runtime bounds check.
@@ -328,11 +323,7 @@ fn try_write64(&self, value: u64, offset: usize) -> Result
     where
         Self: IoCapable<u64>,
     {
-        let address = self.io_addr::<u64>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset, value)
     }
 
     /// Infallible 8-bit read with compile-time bounds check.
@@ -341,10 +332,7 @@ fn read8(&self, offset: usize) -> u8
     where
         Self: IoKnownSize + IoCapable<u8>,
     {
-        let address = self.io_addr_assert::<u8>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 16-bit read with compile-time bounds check.
@@ -353,10 +341,7 @@ fn read16(&self, offset: usize) -> u16
     where
         Self: IoKnownSize + IoCapable<u16>,
     {
-        let address = self.io_addr_assert::<u16>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 32-bit read with compile-time bounds check.
@@ -365,10 +350,7 @@ fn read32(&self, offset: usize) -> u32
     where
         Self: IoKnownSize + IoCapable<u32>,
     {
-        let address = self.io_addr_assert::<u32>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 64-bit read with compile-time bounds check.
@@ -377,10 +359,7 @@ fn read64(&self, offset: usize) -> u64
     where
         Self: IoKnownSize + IoCapable<u64>,
     {
-        let address = self.io_addr_assert::<u64>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 8-bit write with compile-time bounds check.
@@ -389,10 +368,7 @@ fn write8(&self, value: u8, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u8>,
     {
-        let address = self.io_addr_assert::<u8>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset, value)
     }
 
     /// Infallible 16-bit write with compile-time bounds check.
@@ -401,10 +377,7 @@ fn write16(&self, value: u16, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u16>,
     {
-        let address = self.io_addr_assert::<u16>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset, value)
     }
 
     /// Infallible 32-bit write with compile-time bounds check.
@@ -413,10 +386,7 @@ fn write32(&self, value: u32, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u32>,
     {
-        let address = self.io_addr_assert::<u32>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset, value)
     }
 
     /// Infallible 64-bit write with compile-time bounds check.
@@ -425,13 +395,28 @@ fn write64(&self, value: u64, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u64>,
     {
-        let address = self.io_addr_assert::<u64>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset, value)
     }
 
     /// Generic fallible read with runtime bounds check.
+    ///
+    /// # Examples
+    ///
+    /// Read a primitive type from an I/O address:
+    ///
+    /// ```no_run
+    /// use kernel::io::{Io, Mmio};
+    ///
+    /// fn do_reads(io: &Mmio) -> Result {
+    ///     // 32-bit read from address `0x10`.
+    ///     let v: u32 = io.try_read(0x10)?;
+    ///
+    ///     // 8-bit read from address `0xfff`.
+    ///     let v: u8 = io.try_read(0xfff)?;
+    ///
+    ///     Ok(())
+    /// }
+    /// ```
     #[inline(always)]
     fn try_read<T, L>(&self, location: L) -> Result<T>
     where
@@ -445,6 +430,24 @@ fn try_read<T, L>(&self, location: L) -> Result<T>
     }
 
     /// Generic fallible write with runtime bounds check.
+    ///
+    /// # Examples
+    ///
+    /// Write a primitive type to an I/O address:
+    ///
+    /// ```no_run
+    /// use kernel::io::{Io, Mmio};
+    ///
+    /// fn do_writes(io: &Mmio) -> Result {
+    ///     // 32-bit write of value `1` at address `0x10`.
+    ///     io.try_write(0x10, 1u32)?;
+    ///
+    ///     // 8-bit write of value `0xff` at address `0xfff`.
+    ///     io.try_write(0xfff, 0xffu8)?;
+    ///
+    ///     Ok(())
+    /// }
+    /// ```
     #[inline(always)]
     fn try_write<T, L>(&self, location: L, value: T) -> Result
     where
@@ -464,6 +467,20 @@ fn try_write<T, L>(&self, location: L, value: T) -> Result
     ///
     /// Caution: this does not perform any synchronization. Race conditions can occur in case of
     /// concurrent access.
+    ///
+    /// # Examples
+    ///
+    /// Read the u32 value at address `0x10`, increment it, and store the updated value back:
+    ///
+    /// ```no_run
+    /// use kernel::io::{Io, Mmio};
+    ///
+    /// fn do_update(io: &Mmio<0x1000>) -> Result {
+    ///     io.try_update(0x10, |v: u32| {
+    ///         v + 1
+    ///     })
+    /// }
+    /// ```
     #[inline(always)]
     fn try_update<T, L, F>(&self, location: L, f: F) -> Result
     where
@@ -484,6 +501,22 @@ fn try_update<T, L, F>(&self, location: L, f: F) -> Result
     }
 
     /// Generic infallible read with compile-time bounds check.
+    ///
+    /// # Examples
+    ///
+    /// Read a primitive type from an I/O address:
+    ///
+    /// ```no_run
+    /// use kernel::io::{Io, Mmio};
+    ///
+    /// fn do_reads(io: &Mmio<0x1000>) {
+    ///     // 32-bit read from address `0x10`.
+    ///     let v: u32 = io.read(0x10);
+    ///
+    ///     // 8-bit read from the top of the I/O space.
+    ///     let v: u8 = io.read(0xfff);
+    /// }
+    /// ```
     #[inline(always)]
     fn read<T, L>(&self, location: L) -> T
     where
@@ -497,6 +530,22 @@ fn read<T, L>(&self, location: L) -> T
     }
 
     /// Generic infallible write with compile-time bounds check.
+    ///
+    /// # Examples
+    ///
+    /// Write a primitive type to an I/O address:
+    ///
+    /// ```no_run
+    /// use kernel::io::{Io, Mmio};
+    ///
+    /// fn do_writes(io: &Mmio<0x1000>) {
+    ///     // 32-bit write of value `1` at address `0x10`.
+    ///     io.write(0x10, 1u32);
+    ///
+    ///     // 8-bit write of value `0xff` at the top of the I/O space.
+    ///     io.write(0xfff, 0xffu8);
+    /// }
+    /// ```
     #[inline(always)]
     fn write<T, L>(&self, location: L, value: T)
     where
@@ -514,6 +563,20 @@ fn write<T, L>(&self, location: L, value: T)
     ///
     /// Caution: this does not perform any synchronization. Race conditions can occur in case of
     /// concurrent access.
+    ///
+    /// # Examples
+    ///
+    /// Read the u32 value at address `0x10`, increment it, and store the updated value back:
+    ///
+    /// ```no_run
+    /// use kernel::io::{Io, Mmio};
+    ///
+    /// fn do_update(io: &Mmio<0x1000>) {
+    ///     io.update(0x10, |v: u32| {
+    ///         v + 1
+    ///     })
+    /// }
+    /// ```
     #[inline(always)]
     fn update<T, L, F>(&self, location: L, f: F)
     where

-- 
2.53.0

