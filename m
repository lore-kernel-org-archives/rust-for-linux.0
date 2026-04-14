Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012000.outbound.protection.outlook.com [52.101.53.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0163E51EF;
	Tue, 14 Apr 2026 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167692; cv=fail; b=AG8t0mMlxJmzIweNh/LZsjyH5LIzNyeeRAy4GP9bdHYsV/vJ4ZSl4VivPvrtuSAH092oGJDEcMxKsPAHZxaLKmKoYJDzVYsJwYj3HASmIrFNYCaOgEftYv/D+YjoIw/wNKX8Bs0eMgu/VkD89zOApFXxNXiGlRaTCsg4GLyVpMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167692; c=relaxed/simple;
	bh=HzN8gDqBmV6WGGz0Ipp/iB3VWDtmFu/u13vhu/CpBVE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XBl2u08jCJVVorkRnZ1i6G+I3iWk8Q/0mtE37L1o2atcXeA6NW6WTsza1yXVnFcxoEC+p3pVMab68j7JlZg6G5i/9nlZZIY84OvaU8maGSbfB+p4EwMeNWXYhlYw2BJZcNGd7XKbtjLVoXNqWPc5dCJsik7vXaNSCp4twcm9Bj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dLb0lnvz; arc=fail smtp.client-ip=52.101.53.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dLb0lnvz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVXiryuHEUbHk/SivKarGKj0Ob9qpUlamT2mLMkwxXUmvqhL41C5ovpg++k6FG6u5NgWVRzbFIOOlUY4ldqEG3xgMTqLgIDZ4YJFv3SQFvYyJWDQtx67Vm1aSZnkY7QZNSJYueUqVmlu0x0P1x5fkfPpbAebH3ko0BiPDU11+9R2pyIIRU2jzGTwn/cZ3mwaYcVNVXK6+9ON0G3J78qi4wJ1OfbIKaKE/8lywe5DUkrP8neCaRJocovw8GTDerzAzXlAIj2YshQgabsa8PiDVSj7KUsb8SvPnNKmqZi5bRe1e6/1VRK5lhLb0ryFhLa42I/qIdg5BGM2p/CMBMJ31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0zqFagrkwJ+Pk6zAFxMSA8BywMUcrv9SADWVL15F38=;
 b=g7xc9UZu+HDkyckatznJ6+u9O/Bste446+bNqCUJwaaOoIs/ugRblJ07QLIHDtYL9VGrAa2H3bZsGt6cjMJH6Cgx8oYaeHvwbNm7Vv1xilEHF/9+MCdvBG9XU0U3pFYo9MW+IztXBv4R/Mqnk+NIysJ2DaWGdnToRrFr1nlYjGso+7Gtz507+lu/JscyaJ8IwXMgQFkSHStukXDc+04x2DpjgQf5fmwVRBavHyvnP4J+rU0XV++iIxxugUvA1JLhDGQHJLyZiaMpql7y+g/pojmqvvFgwuzEg65PHQT3iMn+pSlp1qWGcqfcZDx8Q87bsutOsr46GrTJ6nbOy19PUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0zqFagrkwJ+Pk6zAFxMSA8BywMUcrv9SADWVL15F38=;
 b=dLb0lnvzCkRdLNlVFzvKVGnb+Fmb7w/mwSOSrebJcjKDSiOaUk3XhSh6feLtBLX5cYsOlqDTtq1YII52RkKJG1KggHzmpAacBHOXQlGrzKQdtkmMvmcr/nOmhjgXliNbDe4gAaP0NLMbxt/9tXfWVCJlACxTcHbVVMnkL25SXDXvLV4GolhnELJUL64gsl8RWrANqqMEJb6WaL8cWtIbOvoVtp3miw24/Xnp5IUQc21DteDp++5wZVLcpiosTBO73GKXhFbtqoJnm/PdjJyNqJQ54SoWBlZ3aeDmhJD/POiuo/G8yFapGroM3XPQxJeTitrQhunMP+nIEQrSkaT2UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ0PR12MB5636.namprd12.prod.outlook.com (2603:10b6:a03:42b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Tue, 14 Apr
 2026 11:54:47 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 11:54:47 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 14 Apr 2026 20:54:11 +0900
Subject: [PATCH v2 08/11] gpu: nova-core: vbios: compute FWSEC-relative
 Falcon data offset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-fix-vbios-v2-8-705d30d16bba@nvidia.com>
References: <20260414-fix-vbios-v2-0-705d30d16bba@nvidia.com>
In-Reply-To: <20260414-fix-vbios-v2-0-705d30d16bba@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.15.1
X-ClientProxiedBy: DM6PR21CA0001.namprd21.prod.outlook.com
 (2603:10b6:5:174::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ0PR12MB5636:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5a3436-ea9b-49d1-d2ac-08de9a1ca066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ckMBCgDRhFOSLsR+fqomq9kwnublXNX7CnDtOJEoZ0QOYeJRMIPHz/Sr3bl49g9GhF2TfAL8rCEeQOZuMIpt9cPrpxjcNSB1bAEK1+fAUJRP6TakHSedIVQyYFs42Zhwkj8N6vKkxid9r5sUg3PLF/jYNuw3hgA3YvCEkAi/ChXDhhza/iGIpOMvstRSH1a+oAeoVFtpKicUM5kQjli/aSh9tZznX1ilkN98mX/Po1+Z5bxGOjVrc+U20jwF/bbmZa3g9NixDRnWhof5k0N3i3GQ7LTCnEpSuITK6DPQeYP/shbSlp6goGgKP9php2qk9zz7sDQ+bdM+D8B04fKcLnHT1Z97IYCoTa1rDdTyF7Bsh6560NlrertryjeubVePZe3hhlqT10264nitfPqz27iWSON+3SZwDWVHtyzGTaWp14Newir8gnEyJqcG524OS9m5E1J1wYA64RgqT6qNiSm6HoVOC/9lmkiDf7o6IudTZ5YSajI5o69azefjzwRDs7pYZtQr6MT/fJMn++TFFykYFjTqmF3AT5YPotvxtpZnEUcJzN5/iJpgX86BOIgz4DapK1epDK9YHzxZLR0kAXgsfK3JjBTmZ6Qt0sFPa5wVkGRjAUU3y/T9vj9cO+NpNnUByif5nT8obSXS5X18kMw0k+kVqROhmNY61H8Rr6nAxssnioop56XflxbK2B9fsYcPll9eWvTzfkVd2/xuitRwLd+es8HmLNfTxoDB8G8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTNsbGN6dUEvMEo1S2RWQVk2Sm45OHRmakVSWXJGWVFMcGVQYkU0OHlKRDJt?=
 =?utf-8?B?L085ektzZVBWMzNCUk9IYm1SbEVFdFpBU0p1ODFuUDZqbFJNU1pPYTcwNTdS?=
 =?utf-8?B?WFhuc01hWFZvNk9Ud09xUk9JaUhVV2JUK05YYTdKaVZPYVVrWFB6V3drcTUr?=
 =?utf-8?B?WWdTait2Tk1jS1ZjQUxsY2diZ2tNWkJLZ0YxSllDUGJVYlFISWVjcGNuSE5J?=
 =?utf-8?B?NWNycUNZWDdZdm0zUDUvUDlFZ1B0WFUzM3E4VkxSN3lSOGdNN0lwRVZMZkcr?=
 =?utf-8?B?djlUSHBUeWMvZkxTQW1MQTFNbEozK2pvWXdFOGlpMzMyMnNld0NZeThWNW9W?=
 =?utf-8?B?MGlwQUxSNWNKTjJGTk9wSjRYTzAycW80bUwvN0psSlFrYUpxakJLckoydzVN?=
 =?utf-8?B?cW5DYVlkemFEMmxMZkdkZnBqUWszWlFpclhSZHFpWjQ5N2xCVllKNGZtK3F4?=
 =?utf-8?B?cmlXRzhNV29aVi9OTk9PTWk3MTgrL2QrZHRnUFVycnBZS1VLbHRBOWlDMEZF?=
 =?utf-8?B?RjA4LyszZGczZERMcG5Lb29uWC90bXE1bG9nM1R5ZFZXUWtTOGpkdy93Ukc2?=
 =?utf-8?B?UUdGT3c5emhLMmdvYmtxMU5rWlMweS9FQjkwRy9yRHE0TzZiQ3lXTlF2WFBF?=
 =?utf-8?B?ZzI0N1pyZVBYNk80VTdacHA4L1BtRlEvMGlibnVHK0pYcExUMVdsV0lIYjZQ?=
 =?utf-8?B?VUpVMzFxMm1aUHpTSTAwNUJkUGVmK0swbC9FWER5MVVRVjZXQ0RmRnNmd0gr?=
 =?utf-8?B?UG1jYkhBM3hUcldLL2VvZ2pHVjgrMStzdC82NytPS0pSTFJFcnBoMWZMRWJF?=
 =?utf-8?B?Y3lKSHhIb0VjN0tBUVlmdFRSKzc1cUcvbVQ0REdhbU1WZjhqalZCTEo1Y3VD?=
 =?utf-8?B?enFsSWFrak8vaXdkSytLVXBIOTJyNVNqc2liMThoSWZNVHhZMytreVEwVUMx?=
 =?utf-8?B?OGlUcGdFczJXTHpRZlhxQTBteWFqTDByaVh4ZFp5alFNQVhTYVl0M2hQeE9a?=
 =?utf-8?B?UTFZK1hVUEluUU45VFhqY1NIK1Myb2FDMlREMkFwcG1ubjFOWWF1U3huUUc5?=
 =?utf-8?B?TU5DZDVQTzFFNXc5VFNxS1EzV0p3NDhpcVczc0tsa1FNcVhnaGpiQzAxVUwv?=
 =?utf-8?B?cS9pbzZpUlFUellhamdCNVkxZVhNamFBOWxWTjdJcEw4KzJMSjV0ZVYvQkgw?=
 =?utf-8?B?ZnVFUGx2YWg1TlNJQ0VFaDFDbGJFeWJ3b0ttUlRERDc2dmtSeUJpY3dyT3h1?=
 =?utf-8?B?L3JMUkE5SWRmQXMxNmlXdXlJblBxY1g2S1FGcDJ0b0tPVEUyajdYeEE2T1lM?=
 =?utf-8?B?Q2hMVHlzSW40QW1TUDVlM0VYQ2kzQ1ZRVFp2bVhJeEt4d1lLVms3cll2TEJH?=
 =?utf-8?B?d1gzNU9KMnFwWElqeXlXOW9ReUVjNTBRL3JaS1dJaFNXd0RJT2g0MFFGMFpu?=
 =?utf-8?B?ZVFwb1krdmFHdUVGR3Y5NE8weWtWcllxMnh6dWRRQWhoWHhwam1lOUhzTXBr?=
 =?utf-8?B?L1ZPamNHWjVQUXgwc1BrTFB4eHpWcDVOSmlqNWdGdE5DYUpMV0Nud3dleUFk?=
 =?utf-8?B?RDBHZkVRWmhhU2hTVVhpZkp1cUZCMEs5OFI3M2VTMGF0K3JXaENuOUlJRm43?=
 =?utf-8?B?Sm94d25DZURuY2QvcHlZQXlRRDNueWZlMHNoK1JzR29xc3RsMDdVZHhXUm9H?=
 =?utf-8?B?KzE5d3FteFUrTFJNdnJtcTJZY0ZMSkVJWGFVMGlSd29WMVV4YURGdHQ2R3kr?=
 =?utf-8?B?SnVqU2pNVmFiY2w3RHVHTG43QytEMG5Ec0d6dDRqZTM3cXcxN0M1dEY0Ky9P?=
 =?utf-8?B?Z3ovcWlpQS80VUM3UlFka1pyVDRqNHhEekpaQXRUbU5Yb2JWdkVHdE8yNlFk?=
 =?utf-8?B?bHlxYmtqV2dTdXpsUlAzWHZzcnNmdDgzTkhyTUVNZFBSdnAvQkdFbUhnOWcw?=
 =?utf-8?B?aU9INUFmZXJLdEVPc2JWMEIwbUxPbFVMazRBaHFybVg3SzhSZXNwT1p3Uzht?=
 =?utf-8?B?eXBaenZaMG9DL2d6WlpVWTcxUWdvRHhSSjRpbEg4ME9KcGtxUWRPclFtSXlS?=
 =?utf-8?B?REtjTVdONEw4cTl4ZlJYZTJKNkwydy8rNkZXaVhkQnpadXdlV1RhMmN3L0NC?=
 =?utf-8?B?QVUxeUV5R3JYelhVSUZFWWpqZFgxY3JMYWxtc0NqR3JYQkwyMkpxMWVnZ3BJ?=
 =?utf-8?B?dlRvOHAxcDdSdEhIWE1TaG5tRitaVjByOWZqWHZXeWtpQzFmOW51aEdJTXFC?=
 =?utf-8?B?NGFJVUtuNXBuNWMxL3RENEN1VmY5VmxrT2E0UWp0MzJYa1BCNDMrR21kMita?=
 =?utf-8?B?UGo3ZW1tSTM2Qlg2T0Q1dDU0Y2xxU2tFMUxEVDJZZmhrRElyaEVwZzZ2aGxI?=
 =?utf-8?Q?NSFHPizEDgx+nTd46WFZvIuuTPTjXqdvrSnA6gj19nFCP?=
X-MS-Exchange-AntiSpam-MessageData-1: Ym0QsyaF/ifTxA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5a3436-ea9b-49d1-d2ac-08de9a1ca066
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 11:54:47.5744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvOWnwwSmzMvu9ShIQ9jyPF0uNfV+FK9m8U3bATuv4aGoGnl/KT9e+1BsPg1qyZFLMMfbSVKMZJQrPurLcaUpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5636

Push the computation of the falcon data offset into a helper function.
The subtraction to create the offset should be checked, and by doing
this the check can be folded into the existing check in
`falcon_data_ptr`.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 48 +++++++++++++++++-------------------------
 1 file changed, 19 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 01f65d50cbb3..0c0e0402e715 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -765,33 +765,29 @@ fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
         BitToken::from_id(self, token_id)
     }
 
-    /// Find the Falcon data pointer structure in the [`PciAtBiosImage`].
+    /// Find the Falcon data offset from the start of the FWSEC region.
     ///
-    /// This is just a 4 byte structure that contains a pointer to the Falcon data in the FWSEC
-    /// image.
-    fn falcon_data_ptr(&self) -> Result<u32> {
+    /// The BIT table contains a 4-byte pointer to the Falcon data. Testing shows this pointer
+    /// treats the PCI-AT and FWSEC images as logically contiguous even when an EFI image sits in
+    /// between them, so subtract the PCI-AT image size here to convert it to a FWSEC-relative
+    /// offset.
+    fn falcon_data_offset(&self) -> Result<usize> {
         let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
-
-        // Make sure we don't go out of bounds
-        if usize::from(token.data_offset) + 4 > self.base.data.len() {
-            return Err(EINVAL);
-        }
-
-        // read the 4 bytes at the offset specified in the token
         let offset = usize::from(token.data_offset);
-        let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
-            dev_err!(self.base.dev, "Failed to convert data slice to array\n");
-            EINVAL
-        })?;
 
-        let data_ptr = u32::from_le_bytes(bytes);
+        // Read the 4-byte falcon data pointer at the offset specified in the token.
+        let data = &self.base.data;
+        let (ptr, _) = data
+            .get(offset..)
+            .and_then(u32::from_bytes_copy_prefix)
+            .ok_or(EINVAL)?;
 
-        if (usize::from_safe_cast(data_ptr)) < self.base.data.len() {
-            dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
-            return Err(EINVAL);
-        }
-
-        Ok(data_ptr)
+        usize::from_safe_cast(ptr)
+            .checked_sub(data.len())
+            .ok_or(EINVAL)
+            .inspect_err(|_| {
+                dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
+            })
     }
 }
 
@@ -908,15 +904,9 @@ fn setup_falcon_data(
         pci_at_image: &PciAtBiosImage,
         first_fwsec: &FwSecBiosBuilder,
     ) -> Result {
-        let mut offset = usize::from_safe_cast(pci_at_image.falcon_data_ptr()?);
+        let mut offset = pci_at_image.falcon_data_offset()?;
         let mut pmu_in_first_fwsec = false;
 
-        // The falcon data pointer assumes that the PciAt and FWSEC images
-        // are contiguous in memory. However, testing shows the EFI image sits in
-        // between them. So calculate the offset from the end of the PciAt image
-        // rather than the start of it. Compensate.
-        offset -= pci_at_image.base.data.len();
-
         // The offset is now from the start of the first Fwsec image, however
         // the offset points to a location in the second Fwsec image. Since
         // the fwsec images are contiguous, subtract the length of the first Fwsec

-- 
2.53.0

