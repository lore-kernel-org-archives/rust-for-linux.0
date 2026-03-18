Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012002.outbound.protection.outlook.com [52.101.53.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11A833123B;
	Wed, 18 Mar 2026 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806871; cv=fail; b=ow/2bGRDqhLeW3vUz3QoSDa89SeT7cipG3DPzsrtu3nrP4mlfmkQotfwL+vqn+zs4y0j0t4bzi0CMeqVI5thK0VRJwBfYaShBVvOPQQznnEf9lb2sM7btJhR59ex4SOUjeqji7+rxUHFycbZ0q1ZxrhJLtsi5F04p6yGF+92/nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806871; c=relaxed/simple;
	bh=5vAA4gmMfz3gSgU/U8Yf4XEYpG0k/+YlbC2zw2msH/o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kdLrsSnsilPWUe5PMrE7UnLnt+lmgIOOrX1gXbw9Wf1+rS/XcsYwmEXwRnCYhmhIVJyeH4KgqcEqmrpgmx1vPPKuk9PLuVVGxhNXHNiuX3zbkAEykxilbgzmrYNCTMlSHhFWel6lYGU0jIT1JQva1eaKaiuPMctu6z+LdAz2v+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oNLzxGn/; arc=fail smtp.client-ip=52.101.53.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oNLzxGn/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5+WV7+Uyc9T8nRYooGPfR4J0MlxNvLB5y9llA5euXbBPOXOBgSoGb4tVO54g5qidPJsIvEOOmf9j+y1aBfLULWgJlm19lknBYNc/UlC24Ryh4vdRB36U9D2BlGss2k+heIMxfrR7kg4miDusSkJrWWSXq3y6XYUgVRdbUH/ossbei7933FRcNGyyV/DdmRyKQbmwZU91DiTjjVjUqJkgVzB82MrSOoxaltpa3q4xmfTYTj4FsKxYmwlsXcReiIrOCTGQJmZidtNcQ0ZE1X/Tqc0IAKgofbk18cAxqfJMHQULhbmZ30F3IBq8CUSBoOy4DpHSF834zjFK2DUVDEDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Huaf/o1Cjs+xS34E5Rj643prJfR5euRLoBT/pxx9S44=;
 b=t7a1cxAFqGo91pP8EEiJB3vpBWFOape7bVKi5/IDpeU9Z0YfdtFv5LZKUjOX+MKxKUFBoKAuFnH9Xl3pstpSgPgFW6Il+wHrqQsYc3uHz4ihuP25dHxivsKH4dYfcoXoa61p1Qn8OTOgyukTW1+QAmpSEpKSKsUoR+v+wDJid4dwZlzfIkvhGbpPiEt474PY6apR+1GuEH4LY8Z73JPR2VdYOJYz7HUCG9gIlijb+eO6Da6KPjphycHsp3slVR5/tQwrxp/HJbovZ4/pv5DOL+Hon7yKfBr1RZZ+QBvMs073/hY2gYY1vy8sKrwQGzkeh8tWhss0BLe4WJ0JRs2vAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Huaf/o1Cjs+xS34E5Rj643prJfR5euRLoBT/pxx9S44=;
 b=oNLzxGn/UFnlzdc++QpRpSf7cEBnmOmgCdC/3VH7XhH1FHExgxVu9/o+ijjmhWTOorOmGBDzi0b0DLsOKKlt1l+Xe3rfsqTe17gCbRmqt0IKlUcfQRHbjGXABVQRvmxsjcZGGHKiIpzdNhlsU5iLb7A32UHmG6FSFT4jjEhLY1NHJOusFxPEsxuWvo0nXchs/mCx/zOi8PFi5+3wiyLZXHcdcjauFvlGVQU4aKDDgrAVawRZ3Rs2nU0xTgnAmUfkgbPxIleurfrPRPDvtofYmGc2ucOKJk7LLHaF+gYR3sGukUKt34gGaWK2tyeYWM2BAvXPtcpunhnzA7un4f8PSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS4PR12MB9634.namprd12.prod.outlook.com (2603:10b6:8:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 04:07:43 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9723.016; Wed, 18 Mar 2026
 04:07:43 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 18 Mar 2026 13:07:10 +0900
Subject: [PATCH v5 2/5] gpu: nova-core: gsp: add `RECEIVE_TIMEOUT` constant
 for command queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-cmdq-locking-v5-2-18b37e3f9069@nvidia.com>
References: <20260318-cmdq-locking-v5-0-18b37e3f9069@nvidia.com>
In-Reply-To: <20260318-cmdq-locking-v5-0-18b37e3f9069@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS4PR12MB9634:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f697e9b-893a-4814-5010-08de84a3e774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VGldUJKpwG+SLGb/fIOZn7bPvfn5vkWMCvT3HFuO3QsO3V1HbcgOEdHSyP5NZxcdtx+9iHLZ33Ky0CC/Hox0KOrATO4w5RdKIzVhqmoYcL2IWVljAXotN9jnezyY7qTA+PVoU8C9nk5uKTgNPe58JI/z0kvIfrRKEbStVQA8+thiuFGk0DcOjIF85K741eoCa52iyRKLkeACaspD1L8KZQ1ZmJJaR2cqDl8S/MJxQXOHPB9/Q63MFVS3ANWTRJgx0UdLy2imOWvumH9FX9cAP22Hd5epD+evwR62WvgSPdCvaLz5hbWa9hB6OY0D4j9itNbt902Dlc5PNGyZFGZVTOetoyfyRjWVhV/kqup0JRAK9XYuufIop9fi6+CFy/qUPJlaPZsxJOvCUYvx8leeG4cOiUSwKIel7A7NQkGs34oEylu+PRV9iAEeq0275XbFlbUn81z0mLH0bfpJUpfWFdLHwmByijg0oMFTeUmikfyU4XrDbTuGwSSZikzOh5cq/o00KPUeHMtgz9b0fiux04hnhPurfmdpq/Atf4A6uU/KMDlJvyF1hqmf3XtjoNVSCbRWUlvTNnT0xugB0jaCBFbJwsQjQIv9R+GbJbzwjI4BCklFjQA5gOtNfLYNKjr50FCqB940rrAW74sq2JIsnLDBc16cUEjO1/C5lQlXpPxe2xHLKtA4rc2rCMDmKIdD63UtTA21zA4OgNYYnxSnvELD+kq2F341EndgfVXi8aA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3NybjdOaGh4UHZjYy9Udm1NcXk5em5GYmRYRFkzV2U1SGRVRjRBclN4ejRw?=
 =?utf-8?B?Y1h6TVRuUnJ6YmNaQ1hNZ096cmMwZkh0cmtJZDdlbktSREF1dlFkVDlMck1I?=
 =?utf-8?B?MWZvU3dWSVFVSk56WW9Ydk9RSjBjdjByRXBoazdvMFFibmMwTCttdUIxQzMv?=
 =?utf-8?B?NUVmS0pzN2txZ2JSVThLenRNcW9NcDhrL2ZocU16REtFYjU1NUdtMXZDT0ho?=
 =?utf-8?B?YVVhdURUbGk5SmdHR00vY0dSckdjTzIzM0R3WC85SWY2U3RlM0lEb0ZUQjFU?=
 =?utf-8?B?VW1Qam05MHRwS3FIWnV4b3dxQ3Y2Q2NnbzVkM1k1SWRFYlNWYmk5eHU5ZVIx?=
 =?utf-8?B?TmNYQ014V1dGcU5ha1RwMGJDRi83OXpYOGFlQUYzNEpNRUxuUTVrV1k2dXBr?=
 =?utf-8?B?cVV1aFpxRXVDWTNrdzNsNEwxVmhTUGo2Nmw2U21xZm5JakI0enBTNkZOcDRx?=
 =?utf-8?B?S3h4U0g5UnJpZVlEa2R0YjhmTCtwT1VtMjY4aHBFMmx4T3JNdW9EOUlFYUNq?=
 =?utf-8?B?b0pyV3htLy92ZWVrZ0YveXg4M2E0N1hEYmxlT0Y2eTU5MDJQc0dteDA4SzRO?=
 =?utf-8?B?Ym9Obld6Qmo1VC9DK0FFdHljQXI4c0U2ZXRoZTNvM3hqZVJOTVJzZk5sQ3g5?=
 =?utf-8?B?Z1EwcjZ2dVVPdDBtVDc4YlJyZitrL1RCNEhUNWpmZjJpZlFSQktjeHpCYTJB?=
 =?utf-8?B?Y1R5R1drM0RucUlqVUU1TkJwQkJCT2pUL3IwSWttMmF5c1dROVBSbUxJcmtj?=
 =?utf-8?B?OHAwSm81R0o1a0lqWlcwdEVJNkxDS3lZVmRtUHRiWXZ5T3Y5YThLUzBKU2Fw?=
 =?utf-8?B?RmpaVjF1eWJPRlNsNm5MUmJXSFZXSC9ERXZnQ3c3OUk5MlUxWnRlK0VvMHhC?=
 =?utf-8?B?eG8vMktNcHdKZmFMLzhDelZ3R1VLa3VFNFlvYStFTXJsNTZXL3E3NkFFb3NR?=
 =?utf-8?B?eDZHUDBEaFFLUkw2VzBIZ2RPcWFhblROK1JuZU9oUXhMMU0wL0tTeWsxcE96?=
 =?utf-8?B?dndkUUtRQTRzRnk4aU9mTW1FNjRoOU93VUc2a2RZNGhZb0VMdzJ2ZjNLU0p2?=
 =?utf-8?B?MlR4U0Y5ZHdZSGlubHpwblp0OFU4TnByeHk1U3lyMVN4ZlJ2RHlsaTZSSmV2?=
 =?utf-8?B?NFlyczRzWlBqbzI1a1pnZEtTTmhBY3RmQVdrM3FzSnNXYnVlQVI2V2xVNkZP?=
 =?utf-8?B?OFZsSkQ0WW84Y3JFeE9aVi9ubndyNUFxRGlvd0ZyckhCeFI3OVhvdDBHTTNE?=
 =?utf-8?B?NmVFQ3BZZy9hUGtvMDQxdHRvK09FVjYzbDZqaWJWaXVpV3FxNEd2NW40NDky?=
 =?utf-8?B?ZXM4cWE5ckJTNWJxNUFaK29MSTk4L3BNOUQvckcwdi8vZ05aRUZOWmVMVGNM?=
 =?utf-8?B?Y2x0NVZFM0xHK21FMGlFUW1GQndiYlNhN0lVVjFmRkk5a0p2NnNtVE9JQVlh?=
 =?utf-8?B?TVYwc3R2VTdlSEZtMVRXemFQRFhDZzZocHI0VWMyaTkrNTJnQkRBT3hmMHRE?=
 =?utf-8?B?U2xNNk01N25NamZYRVBQR2ROOTNVUzhqdVd2NEZyTHRsTHZiTmpzTGFOR1l0?=
 =?utf-8?B?UGorcmE1ZU5GYlY3WUZOdU8raTdObUNRdUZtS2poOUh2eERzb0JhUlBOWGVv?=
 =?utf-8?B?TW9QVU5TUTFyYjM0TVBQR1JOS2hMcnlNb2pVTWY1WTVicHE1S0Z2cm1GVnlU?=
 =?utf-8?B?Z1dQV0lFeXdRMXdHeVNha0paWDJud1JqQ3pjTm5aOHJ0c1dUTStudFhuS2tq?=
 =?utf-8?B?TWVpbENXelRrblUzcE5wZms4UkRSc2pRcituV0F3cGE0cTZKUEhWd2FsdjR0?=
 =?utf-8?B?MDFRYUNKbWZOZlp4aXpVZUxmWjZCaUZXbmxGQ3pZbWdlMUpvVlFLU1ZRWWZs?=
 =?utf-8?B?aEVjL2tNamRveEMvWmU1RjBVZDYxS2I0c0d2ay9MNXU1VHd1dEY1ZjJ4cEJl?=
 =?utf-8?B?SXdtRUZDL3ZVNGFmV3NVZkE3VUtQRmVZMW9MT1pPeVlhUk51Y0VYZ1NNdUoz?=
 =?utf-8?B?VVhrYVFFelcxT0RlTmhjUEt3R2VCODhDNjRSRlZVckZKWDByVXJlWXBlKzF0?=
 =?utf-8?B?SGc2ZkhYZjZyS0RjZDlQdUZLSkJxN0xqd1RCektTK1p6ekJtbWZQcHZhUlZ3?=
 =?utf-8?B?cEFjWXhwRmZGeUpPWHdzdUhCbG1nTVNHSk1SZ1JKZ1YzYWFXNG15Z3crbG1V?=
 =?utf-8?B?NVBYMjJVaGIxWjhYYWNqZ2Y5RWhGRngwRE1LSndPRnhCeUR6Mi81N2RJSXFU?=
 =?utf-8?B?REVMUmltZjVOWGZaRko0R3BHTWNOZmZLNUs0NEJKa3lIdExjV0h0QWlEcldy?=
 =?utf-8?B?NXlDd2pnUFZ5OUs0WWNhamc1bXZnS0kxR0U2Lzk1aTVGRkRyUDVkSk0vVG5R?=
 =?utf-8?Q?xVnMA5xpi3z3i8DmbS+m2igTJZBgSCbEpN4istW4bgzf+?=
X-MS-Exchange-AntiSpam-MessageData-1: Jdab7ak0i8kv7g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f697e9b-893a-4814-5010-08de84a3e774
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 04:07:43.1781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47fSuVS7RczfFOp+Tzfhoka03PNgf/NCvg4faG4qRAgotJLOwV4mLunpRq2fl4rB/ULiOvhvDoaejNo2b4x/4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9634

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
index f7ca6856ff35..c62db727a2a9 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -467,6 +467,9 @@ impl Cmdq {
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

