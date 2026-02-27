Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010012.outbound.protection.outlook.com [52.101.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E11633260A;
	Fri, 27 Feb 2026 12:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195591; cv=fail; b=R1kri692KvxWXOvy22mrK5ScTe/THNncpzQRsZRH7sy8J2mkKtMHdMBZzi9PxEeykbsn8w2D/b9vKSvsPRP2rn7y+HiunoR2F777blDmbtw3oRTiGJX/Bvb0prldysBE6C/AdNoUMSmxZB3xSwo9sf6Y3HP/xOtUt//TToGONrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195591; c=relaxed/simple;
	bh=H4B7DfURXRvUP7I3y9VTcxuqhAJeGOCNdF9p8VtGjls=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pZHuk5RpN40ZIyK0MX9zs4HhfRObWEfRMwh5y5xCFy36GBUC6GD1tKvo6tZRqqbA2rOhKGE7CJrgZzvWyv6LqYZPfjdLt2ZLcWsWfZfSS8dH+4xuOy+FqefPAJhGeV08hUhGKDMLIvONPXKCetUbxxb9yeqJsRVdpIQ+AIwNN9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UpOOV5OW; arc=fail smtp.client-ip=52.101.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UpOOV5OW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgZ+0PJae5gkYRevfavszmrEpJF/eiUIwYQT+3uIDE2s3taEBUT8ays2ehtmOVNJivYZ4LwPdBa0PlH/guHB4P3fruUeSKvHGNsOs9/uOIOV9eK3BIwu3l/wyTAe6fg1u6JcZ029FR4T0VKq/Yuv2Nhx3z6ZYEw+5SpxILyLmVwebgERKXSRxbakCksVZfTGKlTKj47lYHvBW/tof9WaqHGVtYhTAfge3yxXYFzUO3hHCGY2NfQl1jZApMOeu9FFZGqaAaGp6ihahxV76aEqlqcF3M/mUv1ZfhuCyMi5DiPttTsES4YQVdYGaDvszyuM/JwLI+qZEe95AIHD2ylmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1VcUb6T6Ku2vjx7NwTEEsSEtHkDqguSoXQ/nDmJzDo=;
 b=qE0vcmkcm9DyPxPBjOMYf781tga6CzmnlGqbqzHGbb1CXSD4juHt/Bf+o7aZWENao1S5fMIv0oaJvspx28aT6rW47TGqdA2pescA+u0jXbe8WaIpp4lPEPwP1zxFs16BaSFFoJsZpUTVIyIN4pdlM3YGnTZlQZ0ASgBBbzt3w4j5BxlZs2ec42lZAA3za3rBFvqXdvWw89vpBDLFImnEoN2qEpICSM1Cs+Wzj6Mx2Zy9ZjEifUXW/gtWsu6yjlxKWwn0Z5eaqFtoP6vwFKqoIGGTKCeaTkXsPTlP32R3ayPFmU2cAjlKJj3PSgyWoKctOTbK2GlXYRSGaqphUBNdtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1VcUb6T6Ku2vjx7NwTEEsSEtHkDqguSoXQ/nDmJzDo=;
 b=UpOOV5OWhEWIqQM0PlUrZ50g4u61MWThDl8kppIsTyqfC8lIgmsYVhXzL4tPbV9OA2FwCwJTlcfFW8gNtGoVBnYxGoLBS5Nu1XeOarHDrgB6ShX4rKMhS5o+plWWb4O/7I/AC/nQ8v70dPBQeH/68rt6UeSp8a7HSCsXatWLHDQjuancenkvC/8kecNmhQUB3OVoe76Oxdy/esd42lGXvCaZvXKzMr6/tnDTWbx7YQgR4E8rua2g8y/v6NGFXlqRnyIY8xm+vohku3zXCQMxVzeVk895C3fkKmixeiIqTd5bcTVaLxGdodA7L4khwqw/peZd0f6uiotlY+4XH4QRzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:33:03 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 12:33:03 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 27 Feb 2026 21:32:10 +0900
Subject: [PATCH 5/9] gpu: nova-core: gsp: add types for RM control RPCs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-rmcontrol-v1-5-86648e4869f9@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
In-Reply-To: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0126.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: dee898ad-ddc4-413f-1158-08de75fc59ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	BItH1kzprXApP+Polw1hJSR5MM2dc9fXyFMnkGFLxGMk4dreBvS09xC9SpwsGRCzslR4LRV0j4abR/bGft90+5KeylNPmN9VlZrHHk35DPNIai3zwWw57D32jgMsiwuLyzUpeU3JF6ZTtSCLRm7qd7V/apkOFMofmW5oVR7ORFrsUg3vmkxviIkmpeIIQgAYhH7Bh0ZpKJT+FsXgMmFCmUMG9Y/SAUi9v7Ek6bSn0EQVit1HN2C8XjUAQv7YHiPXo5e4a7uuywulfwI69P/rj3y0Hk7cK2epZ+SXojAM8nWZQ2qf/1WhTzODzI22LJFq+YBovdVO+3AdMi45bA/690fG4VwNpk31ugiZ1se4tkaKWKzRW87PZdVs0XwgOi/0B+i8EOBTa2d9JEbGA7bs2ObtfqH+t6Isy5smov+5hozUphvzLb1dZr2eZFpUII9aLVcXSm6Cee4Y/ddD0VwmsJlddFAilQs7MmNygoRpf5WefaA/kjj/BwZJQFHT/RPT7PZ2x5dEm5fjck2Xh1WewQwQ95PxMupw+FfrOhM6OXb3g7BmOhoeWV+TSbNuZuTL93nCd+q82t5wrOyjAACJ6DqvoSiySLPfa10XbsN+XBYSgWLwbe1zNDttmA3dblkoPWtSXAsINPvPZl4NRV0DDLlWYtXGTHQ3pE2CHFIF6P/xNRqyW1wM09KnKcq/L7sj705ODjOZVBxbCc8EGI86ica44kwSjkDgtrKtVf8Cx4U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3F3Slp2T0FoSVJXSnFFM2FBaUx3OHNidVNEU0M3MDVBSWtJbVo3K1hYVVhY?=
 =?utf-8?B?YjFWell1M1J3dFJ2RlhLMVQwVUlnbHdwZWRSTTJHam5nbHFhNUE0KzdKbGds?=
 =?utf-8?B?Y3MzY2RBMEk1ZWFTdjZndktDRitaNmNYTVhjSG9nTmpkL3RkY3dBd1huWk82?=
 =?utf-8?B?Vnd0SWc2bFdSWjVjRzk0bDBISG8rQU1wYmQzRElJbVVvMU1SU1IvdmtuaEhU?=
 =?utf-8?B?SlVoZGJXN0NKZDJiSEwvUVU0UC9MOU8zby93QlUvdHE3Y3lxYW5MbUhBVjYw?=
 =?utf-8?B?YjZyNUF4Q29ZUnpFR3FXR1cydDZEOC9TTkVMbFBmMXZVWGw5NlVnYkROSkpw?=
 =?utf-8?B?TkRRb3owWFpvRjBHVEhqVjhZRHFzRHBMa1pEQ0E1RGFkQVlhdjdEZmdQMHlN?=
 =?utf-8?B?Ni80SXVuVTVoL2lxTmhvcXplcFptWFJhR0oxYUREc1RnaHlWeHBaeWppckZS?=
 =?utf-8?B?WEYzWnI5MW1OWFdMWDVMbWhwWm84K3czTWR0a3Q3b1NQSGdxSnZkV04wTXN3?=
 =?utf-8?B?YzFTaXA3TGxPQVE5eHZLY0k0TStyeFFmdTdoZzJvaE1tK05ySUsyNEtITmVB?=
 =?utf-8?B?dnNpUmJRRE9KUTBqU04xZ0M0dUE0endsOWVWVHovRVhWd1V3TzREMzhEenYy?=
 =?utf-8?B?dGprN2NhUEFpVGJxQ05NWjIyaVVla1ViZ1hnQ0N4MEdDbk5ZVTg4UmFCVG5W?=
 =?utf-8?B?aG1tdHIwM3lJdklZaWZGbmdWSDdNMU5iUEZrWWdaNWNFcTBodUxJaVFlS3k2?=
 =?utf-8?B?QU1oVncwZ0g4UXFIcXhDaXUxbkE0SFh2NjBPL1lZQzRqL0xIMThGclNBTnhs?=
 =?utf-8?B?U3FMa0ZxYnpuSU1aaTBqZnR6V3ROc1ZSd3dhWFRncEtWa3o2SVFBSjFhaS9V?=
 =?utf-8?B?MngyMGl2cUhVdUViYnpMaHV6Mk5rTWhNTHZ4RC9UVGdqMzdnNDFWSXI3NVVV?=
 =?utf-8?B?T01mR09uanNTV0ZrSXB5R0x6ek03UjgvSFlUVDgwa0VkcUNSZkw0bTJ6MVh1?=
 =?utf-8?B?dlE2em40UnZKL0dkYkJtT3FJL005b2pManpRM2pzaEZqekUrTDlubFJkUHZZ?=
 =?utf-8?B?V3hqeFZTZ1YwSFM4MkY2OENqZTNXbGtRSWM0K2tiYSsyUGpWZnY2Qmx3WkNW?=
 =?utf-8?B?aWNjRVk2K3dYYnVHclNUb2xWN1dHYkRjWFp3cVE3T2dHcnF6d3ZMRmZNajV1?=
 =?utf-8?B?eHg5TER4ZTJ1THEyQkVwbk5jc1B4dGVXcjV6cTNzRitJS0duSDkzaGtVTW04?=
 =?utf-8?B?bHJWaWY5cGFuZVhoaXBMOE1WeGpVUXNNREl5WmdVdkFmcnlvbWRWdEk4L2Jm?=
 =?utf-8?B?bDRLMkNOckhUcjY4N3lTYkxONHNmck54bVIrRXJjNVVESDN0Y0lBZ0hmNWpK?=
 =?utf-8?B?UmtrQjN3T3pqbGhlZFZOd0Q3OTc1NFovK3FjczM1cHkrejhBVHFPUVV1cEdW?=
 =?utf-8?B?UWF4YzJzU3NqT3BtZjI0TUhLaDkzTDNDZ08yY2dZYmlFTmFtWGo5d2xEVVBQ?=
 =?utf-8?B?bUFaWDZDdktYam5leXczTnBOV3pyTmRHZlVmV05NM1RuQkJESXhzRGxJaGg0?=
 =?utf-8?B?WjBvR1ZBVlVCMkd0L1MzSGc1VzNZNnRBZEtXdmo5ckRoM2F6aXNKQzVOdE92?=
 =?utf-8?B?bjJRNUFMbkhhemNkeFhKR21hWW5TUGNNQjNMZUZFcmExZVRWbWtUdWN6WS9W?=
 =?utf-8?B?UkpuditVNjBzbUp2cVpLT0xwR00yeVdaTllwREZBRldndVhHVmFvc3RmdHRx?=
 =?utf-8?B?UExBWlV5MHFIdGVsdldDWWhrSW5QY1BESkhLR0FjNFdldG1vSzhpQUZ6blhK?=
 =?utf-8?B?L2xZNll0MFpQUUFRK3lpS0F6OEc4Qi9ieFlodXZleWdqVVFXdWdjbnF2VHMv?=
 =?utf-8?B?TGhxWGtaaTYzbi9BNnR1MGI2bmVlSUZOR0laOWRCQUlIOUpQNm1RMU9QRGlr?=
 =?utf-8?B?cHpSdi80bGg4YmNnM2sxN3lhQWxmQWt2SmNNNGtkbXNSQkQzSjdQc05xb3ll?=
 =?utf-8?B?TzljSTkxcVp6c0VTN1I0RDVSanFpdGRWcnJlcGdoeklSbnp4V3lnRXdia3pu?=
 =?utf-8?B?N09DNWpsYkZsNkg1bkIzSTJ0ZFVORmFKYjB5alhzTGd4aHZGOUZ0Q2taU0tn?=
 =?utf-8?B?VkJoWUpMaWVNZmpaZjEvZEQrTGFpc3hTK1dEdkVYVGFGSFJ6UjFMejYvQlZ1?=
 =?utf-8?B?VFBNblpzeDYwWmNFZjNxL1RMSnRCdVp5aFhTZW1INXNSV2szdEQ2Q0xaWkxW?=
 =?utf-8?B?ai9yM2RYZGVXNThkbVJ1Vm4yRytxd09yU296d2QxN1dqUGl1cE9hZFl6cUoy?=
 =?utf-8?B?TXBoS09jdEJSbnpyT3QzUzJEajNzL2h2Ym5CNFViUE1kNkY1WWNwRVlhQlQy?=
 =?utf-8?Q?VCeIbM2AIWSOOIHi9EMA9fxUgrKFwlN/Xyk2amGtC0G4U?=
X-MS-Exchange-AntiSpam-MessageData-1: Odn7+I0mMpaafQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee898ad-ddc4-413f-1158-08de75fc59ce
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:33:03.4484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1x+KPX3+quK0yNFl3KoTnc6UgAlXwQtKeRYEWJUqbuD67vGQwZ0i/6/Ol2AQHW/fThs6bW1Lsw95kBoOtciJSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287

Add `RmControlMsgFunction` which mirrors `MsgFunction` in fw.rs. This
denotes the type of RM control RPC. For now it contains a single
discriminant only (which will be used later), which is needed to prevent
compile errors when using an otherwise empty enum.

Add `GspRmControl` which wraps the RM control RPC structure from the
bindings.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs                   |  1 +
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  1 +
 drivers/gpu/nova-core/gsp/fw/rm.rs                | 82 +++++++++++++++++++++++
 3 files changed, 84 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index c71c45462efd..0796e6c0baf2 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -2,6 +2,7 @@
 
 pub(crate) mod commands;
 mod r570_144;
+pub(crate) mod rm;
 
 // Alias to avoid repeating the version number with every use.
 use r570_144 as bindings;
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 05e205e6dc58..ece31cc32f5b 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -44,6 +44,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
 pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
 pub const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: u32 = 65536;
+pub const NV2080_CTRL_CMD_CE_GET_FAULT_METHOD_BUFFER_SIZE: u32 = 545270280;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;
diff --git a/drivers/gpu/nova-core/gsp/fw/rm.rs b/drivers/gpu/nova-core/gsp/fw/rm.rs
new file mode 100644
index 000000000000..8bb7b11736b9
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/rm.rs
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    prelude::*,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    }, //
+};
+
+use super::{
+    bindings,
+    NvStatus, //
+};
+
+/// Command code for RM control RPCs sent using [`MsgFunction::GspRmControl`].
+#[derive(Copy, Clone, Debug, PartialEq)]
+#[repr(u32)]
+pub(crate) enum RmControlMsgFunction {
+    /// Get the CE fault method buffer size.
+    CeGetFaultMethodBufferSize = bindings::NV2080_CTRL_CMD_CE_GET_FAULT_METHOD_BUFFER_SIZE,
+}
+
+impl TryFrom<u32> for RmControlMsgFunction {
+    type Error = kernel::error::Error;
+
+    fn try_from(value: u32) -> Result<Self> {
+        match value {
+            bindings::NV2080_CTRL_CMD_CE_GET_FAULT_METHOD_BUFFER_SIZE => {
+                Ok(Self::CeGetFaultMethodBufferSize)
+            }
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+impl From<RmControlMsgFunction> for u32 {
+    fn from(value: RmControlMsgFunction) -> Self {
+        // CAST: `RmControlMsgFunction` is `repr(u32)` and can thus be cast losslessly.
+        value as u32
+    }
+}
+
+/// RM control message element structure.
+#[derive(Zeroable)]
+#[repr(transparent)]
+pub(crate) struct GspRmControl {
+    inner: bindings::rpc_gsp_rm_control_v03_00,
+}
+
+impl GspRmControl {
+    /// Creates a new RM control command.
+    pub(crate) fn new(
+        h_client: u32,
+        h_object: u32,
+        cmd: RmControlMsgFunction,
+        params_size: u32,
+    ) -> Self {
+        Self {
+            inner: bindings::rpc_gsp_rm_control_v03_00 {
+                hClient: h_client,
+                hObject: h_object,
+                cmd: u32::from(cmd),
+                status: 0,
+                paramsSize: params_size,
+                flags: 0,
+                params: Default::default(),
+            },
+        }
+    }
+
+    /// Returns the status from the RM control response.
+    pub(crate) fn status(&self) -> NvStatus {
+        NvStatus::from(self.inner.status)
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for GspRmControl {}
+
+// SAFETY: This struct contains no padding.
+unsafe impl AsBytes for GspRmControl {}

-- 
2.53.0

