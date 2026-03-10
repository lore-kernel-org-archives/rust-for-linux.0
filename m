Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013035.outbound.protection.outlook.com [40.107.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25403CB2E1;
	Tue, 10 Mar 2026 08:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130619; cv=fail; b=ONyXE0aEjkAAplMISLyJTwzntKuMkhrydMSZj3Je8RmM4slQlx+aQoOjwwo6dhpz5iilmnnKGFr0AeloskK/ff2CIzEnkTlD29D70tIgs2klOrZBjkBC6tw/32Yc9tcRGvaMGREFTQjan1YMtnsl5eb6AQKxhqK35FL+tbcYRRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130619; c=relaxed/simple;
	bh=46uqKRIBsTDPFGWwdvyIF0sAMLj/oje4SJyMV33nI0A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KWWZnEnjZhLTaetsBV1PFnTF+QPqppH1lXPyGmC7dhKh6ZrrdhSmhsMZW8q8a/pVQsVRaUgKFMf4kGbcy1tx6F30YD5D95rtGLY0byD2YsWURtLPvUm6dOs+SaUOPDRGf60uUVekRfsSt5BoT9h5PoZlVO6Zks6CAOwuJm4fKJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ljoD1XYx; arc=fail smtp.client-ip=40.107.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ljoD1XYx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4rCE7uBvbhJs5XmvHeF6kvvO3oVwGZTEj49zhj3GcCO01WUk2xACeedIs7K2miNHvU4bhM0VMSRK1WsMGoSxQ6CIT457IA4hExnc4S69+sGmrKkMR+tS6Dt9QIwfzvJQ1udF5KFU23hPdTX4n3F/EC/yidxrwgQlVqx/iq6//dl/aFikuFTOUfYOZFu8RHGvVykXJpFDL0hZQQ4Vwm6a7kgJbmX7QAWigptEttsl97Zefsalf+LaFFEyMpuYoprcf05D/MJ9sL5y8PZfHv0gQdrSQOW90ZYuwuOQDPrrG2btKZWmJ+EH7M1ZPECpWuS+f9n2c8V2HSFfukHjAxPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMPEm/x8/cGs8vzBEtrPPuSFwWczTT7Fm9pE7blVcfY=;
 b=ccGwEK3cx917nSMhCh3ihv5s0ScxViJm7WsT3KeEtQ6NLlG7EU5JRfTHbR2wBS1d1JYpofxq2Ig945s69aL2dnyvBK1tR499Te7Oty/cGme3jtbNlxwQX3TKUTKuLI39z8ZxCT+R3Fanws+JsDbVomVysy4JEnvsNmEopSIWD6DzNTu0fBuk7Bp2aSR6xVWbx+6A/3cnT+Nrg/W6rUcc5h3bXCd+lnb7nvT+fRN5+5lvSmA8sVFi/UZYuupaf66EFh05hvHRYuVJFvOA13Jqc0s4a06OBFkLfl+8XQJSswBfVeDD5CrHW43XGYZDP1dI6NlUVMvk/J2uoz2vgXiKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMPEm/x8/cGs8vzBEtrPPuSFwWczTT7Fm9pE7blVcfY=;
 b=ljoD1XYx33dwGrqC9PEzxDbh2aZjHZr8X48v8yISC5CbfW9eSRMKgsj0zO7sCn+ZeJd1I1ghI+Rz9ktjZzKd/bu4SWXIN7YxMmEDsHpL/OP4tDXZg7WL2pRMCZnSKapYAx5nBbgEs+sGTFVh4hayeqFj8WZps/x10nwxml3MJnwttE0Aa84FqGLsg0LS263mNQkRPpQAusPrgNvuZJxQFAXusNxgGWzYMm9h5Op3p0aWNSYwHGnAbYHjzNkg1RIxF5Mssh72MuqNK4BJMJ2Hw07ApVmGhHhGv728Ji7L/vi/tZ1KDhOOSPN2eu04UnBovjrfWDlci/+dmYyN+Ity+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 08:16:54 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 08:16:53 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 10 Mar 2026 17:09:16 +0900
Subject: [PATCH v4 2/5] gpu: nova-core: gsp: add `RECEIVE_TIMEOUT` constant
 for command queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-cmdq-locking-v4-2-4e5c4753c408@nvidia.com>
References: <20260310-cmdq-locking-v4-0-4e5c4753c408@nvidia.com>
In-Reply-To: <20260310-cmdq-locking-v4-0-4e5c4753c408@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0094.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d8cc43-c88f-46f5-9032-08de7e7d62dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	T5ES8HfLhc7AbClrYLJSDAw8A76Glhcsic3mQV4hzDBSiM9WIhm7dUztk2ayR+kUP3Z2TMM/JF43yVLA4ouIWBM6JCF99oyhd0LS/2QeCoFB+jv6qOa/S+gvJwTqdm9qxUTORaajfhE2OEkUiP7DKNyjVvhVwMUdF039quGPO1ooeQSQsvjzdLPfBcJanYOvs3bD7GwAzUga+y6X9Lqf1llgYVSBB46Y8dL/Ty3z4KlfDXLR2toBGfY51q8THkuopZc9kUX4uudZ7zMlpteMlNnwYaMzMSfi57IbldX75iPswVTdL/zX6fDEuOEtjFdbf8nycGggl0S8xD6D/5V0dkeyI0RW4Hxl7LfmzKDywpl73M9BDetmjRwcrPr2zlH5o1cQC5WbqDsuzyFoqxodJ4hRxNswCeky2Oecw8yqOwIhBb2elgq6U/6E6HuV7RjFHvZvWv0OMwRmyYD/0e6brcZnul1qNbLXZ+MybUXSNaoemoyjIewW1XBhgMfpFTWNSw+NKWIydozP6JqvqeZXjoZn83U5aYxDuhRtFXZzUhgw+vVEkBVh8ISZDk938Hi5OumFUxmS0t2iZgAaOyirZTjgauO6RLn/BTmWbqppqGSSJlaKLHN0nhJpqzQ2s11InR1SOBIIseFckhgJgnOEWWQygxQSuZBJoJtP7wuWD/QwI67eVJlHIPOyzPGO8gVozVHr/sgnRO637D5UcAjjAMCEhuCGU8gVJudGXYuNbOw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUJvSE9lR1RUYjA3ME1DRGhISHY0N3I1Yk5wMzUvMlVRdmt4RW5CUjBZVVBI?=
 =?utf-8?B?djVkM2Q4Q2lMbFh4WTFYMEp6empVanR6WXlndzlHamtiZkdnVHFTeis1ODlp?=
 =?utf-8?B?YW9qMm1Xa3BQQ3VacC80N0llMytwaW03RFVHb1VtMyt1U2JkTUJ1aGdsVG1Z?=
 =?utf-8?B?RzM1MDFLMWtwZjY1S29DOG9ERnJwa3JXMmU5TmlwSWpZdTVHZHlXd0dXLzBy?=
 =?utf-8?B?K3licHlGci9INlkyMFduMTNJTVRoRUtqanFuZXh4NEpqdzQzeEV2OW9kRFlN?=
 =?utf-8?B?RWRWbkNqeUJEN09odXM4OGZsRDUyZm03dUY0U1lFK1FzTXVQYitpYVRrbU03?=
 =?utf-8?B?eVczcjJrZnJsckhwWVpCVTNFMHgyR1lhNXlaZHp2cHFOd2FERGFtcU1xbXk3?=
 =?utf-8?B?bHRLVGg4TjVWN2FycUwwb3RDcGtGeU5LUFZTaUdrb3ltdVRUS1hmbnF0Y3ZI?=
 =?utf-8?B?aFBYdlhMTkUrZFlXbkdYc1M0bi9UcDd3QWNCMmd0SC9ibFZLL0xiTkh2RmFp?=
 =?utf-8?B?T0pzRXBXaEVsT2NUYXA4MFpML2lrRXBrWGgzU0Z6QUFpalhFRHVkL1pCYlpt?=
 =?utf-8?B?bWxtWEdock5OemZ1Ni9oUFZzSFpGRmduY3hpendQVHlqN3VaSUExRTY5YlBa?=
 =?utf-8?B?YnMwd2c2NzZydDU4YzQxK0tvZlhObkFTcFFHVlpOUVl1Y1gxTDVGUDhCK05x?=
 =?utf-8?B?MGRwY2gySFAwWUxid1hVaE55U0Zid2syWG16QXEwTnJWVDdodW4wK1Vvdm1W?=
 =?utf-8?B?UXBiaHROOFhXMEcxaWxCRjdsTllNUFVyTHJ1dkZTcVN1QWxUdm1VUDc2cDZE?=
 =?utf-8?B?Wmp2LzBvaXNWQTdBNWpMOGd6V0F0VlhTeDNtbFBTRnBzZ1duTWZyZGx5WU9j?=
 =?utf-8?B?NEp3d1Nvc1ZiT1RFdXBhVjZPTDIxUURGMjVONkRKc2FabVZzcmtVTmxSb2FN?=
 =?utf-8?B?TzlmU2VheDd4V1E3Zjg0c3ljOGVWcEFlcGlwRkRsMk5rYmlMWHQvOEdNQ1Jz?=
 =?utf-8?B?djVDVjRwM2QvVlVVTDFtZlFsdEQ0dGNqK29XeUN2cUtpWW1tdzVTVTFhbzZH?=
 =?utf-8?B?V0pNa1p3dmVqZUtpZVNzaHZreTFUU0I0SDI4VVdjYmxCazhuTnVSaUtQaTFx?=
 =?utf-8?B?dHkvdDdmV05sVHpmeHNMcHh3Sy9rZmx2SDRQa3YzeEsyVXlkeUg0ZmtCRHFk?=
 =?utf-8?B?ajJUenFXRnBCTnJiUzBhMWt6aFIvdHhsV0FMQW1CV3FtTU56UkhEb3JmWmlk?=
 =?utf-8?B?UVd2aTk5L1NZRWxrc0wrQ21GZ3EweWtSMWs1Y2JiVUtXdVJWUjJ1Y3BzUDln?=
 =?utf-8?B?cWhtaTFpK2Z3MVhYOHExblZYS1JqN2lDWEovUWtJOTBhU3pjVXVTd2JKcnlu?=
 =?utf-8?B?MEMvejJzUkN1cHlVMWowYUdYUzZFVW5TUGppWkNWZ2RWZGNkaFlnN2FVYm93?=
 =?utf-8?B?TUZ2bGRFZUVYc1pHTnN5UWZ6bkhWQ2N6UnlGN1RXSmFraHFIYVNiQnBzM3Ay?=
 =?utf-8?B?VmZkc3U3cUkybEhoWDVqdEl3S0Z6b1dXTEZHTkd2aDB0Y0lhOXUxeURTVFlt?=
 =?utf-8?B?VXBoWUZ3M25ibk5ncEgxTFdoV1VlZitKUEo5cUttdzUzRnlwV24rUHV1OEF5?=
 =?utf-8?B?MkFBeDlVZ2JHYWg1UnZBZmhoT2VHdnhMZjJwbjAyYUhNcVZBL1FRY3hnMENG?=
 =?utf-8?B?YW0xWTdUMmJVeUtjcmVCNW96NTl1UTUrbDFlTURBSlRBSHZmY3JUWm1jZHNM?=
 =?utf-8?B?SWNuUmNIOGFocXNnWTREamZGZWtaQ3lIa0R6S2VaZjNmbFNkVHJPOXFOV3hW?=
 =?utf-8?B?b0dVb2tpK3ZvUlJrUmxlNm1Qd056TEVsSWREUkJEU3BzWFhMY2tzaVVaeGxZ?=
 =?utf-8?B?NnF3WFpIZWhSQTlreXVEeDJ3TVM5YkVxamhoVTJJV1VFTFdIc2RWbHJETkRs?=
 =?utf-8?B?VzVRRVZEUHVhNUtJdG9ia3cxb05jNUpZMFpYT1l2dkFlWWlvMEV6M1czRDE5?=
 =?utf-8?B?d2d4WEpoUTlqbFh2bFlXbk1ZaU9jSXRtRGphUm9vSHVJSkdXbDY5T0N4UStW?=
 =?utf-8?B?WEk2VkdRTElWTjNUZDkrb09IbHVHK1dmemtLRElqWVdQN3g3bDdqTEl5dm1O?=
 =?utf-8?B?NVJZc1YvR1FwRm55WjB1ZzkzRWNYbmNGTU1xbFpTQVh6TzlHb3V3RGltOWxk?=
 =?utf-8?B?ZUltYnU3L3MyZUo2TWYzTGtFRnFjSjlVLzRCUER5VVFPNUFpNEJLeWxqV3di?=
 =?utf-8?B?ZXZXam1HaTQzbG80dkcyeWVMSHU3N2ZBNnR0ZUpYOGxmdG1MVGgrS1ZkaWFq?=
 =?utf-8?B?anMrVG9TZU5SV05CdFZzcTJSUlJEV0RKT3F3RjFDSURsS1RpWjNaSFpzNC8v?=
 =?utf-8?Q?os0wKxTWrkJtdZRFqUxUW9J96by1FbzWD7SBBPJS0zrIH?=
X-MS-Exchange-AntiSpam-MessageData-1: 4Pwnusg2lvnvDg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d8cc43-c88f-46f5-9032-08de7e7d62dd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:16:52.9714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WW/LFk9Y0yqDRvQSBm64CUYrKRJVkkchh8u2oMHdHRjAXXlKJAJSZylLg1bBIC40GICZPFAGhZxRAzyargdpHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614

Remove magic numbers and add a default timeout for callers to use.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs      | 3 +++
 drivers/gpu/nova-core/gsp/commands.rs  | 5 ++---
 drivers/gpu/nova-core/gsp/sequencer.rs | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index cbdc76a33a54..08ac3067f1b5 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -496,6 +496,9 @@ impl Cmdq {
     /// Timeout for waiting for space on the command queue.
     const ALLOCATE_TIMEOUT: Delta = Delta::from_secs(1);
 
+    /// Default timeout for receiving a message from the GSP.
+    pub(super) const RECEIVE_TIMEOUT: Delta = Delta::from_secs(5);
+
     /// Creates a new command queue for `dev`.
     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
         let gsp_mem = DmaGspMem::new(dev)?;
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 8f270eca33be..88df117ba575 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -11,7 +11,6 @@
     device,
     pci,
     prelude::*,
-    time::Delta,
     transmute::{
         AsBytes,
         FromBytes, //
@@ -165,7 +164,7 @@ fn read(
 /// Waits for GSP initialization to complete.
 pub(crate) fn wait_gsp_init_done(cmdq: &mut Cmdq) -> Result {
     loop {
-        match cmdq.receive_msg::<GspInitDone>(Delta::from_secs(10)) {
+        match cmdq.receive_msg::<GspInitDone>(Cmdq::RECEIVE_TIMEOUT) {
             Ok(_) => break Ok(()),
             Err(ERANGE) => continue,
             Err(e) => break Err(e),
@@ -235,7 +234,7 @@ pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticIn
     cmdq.send_command(bar, GetGspStaticInfo)?;
 
     loop {
-        match cmdq.receive_msg::<GetGspStaticInfoReply>(Delta::from_secs(5)) {
+        match cmdq.receive_msg::<GetGspStaticInfoReply>(Cmdq::RECEIVE_TIMEOUT) {
             Ok(info) => return Ok(info),
             Err(ERANGE) => continue,
             Err(e) => return Err(e),
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 0cfbedc47fcf..ce2b3bb05d22 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -358,7 +358,7 @@ pub(crate) struct GspSequencerParams<'a> {
 impl<'a> GspSequencer<'a> {
     pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
         let seq_info = loop {
-            match cmdq.receive_msg::<GspSequence>(Delta::from_secs(10)) {
+            match cmdq.receive_msg::<GspSequence>(Cmdq::RECEIVE_TIMEOUT) {
                 Ok(seq_info) => break seq_info,
                 Err(ERANGE) => continue,
                 Err(e) => return Err(e),

-- 
2.53.0

