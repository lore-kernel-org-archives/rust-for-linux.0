Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC36D2BE048;
	Fri,  6 Mar 2026 04:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772772789; cv=fail; b=nX0JhuUUrydr7vIa+rcbv+tuO86kYcZTSD1jvegE4uqkYanSF8xIy+dM1zDVAxy6smb8FxghrXldsJwLRiuo8lvs97l7DkW4dfWLXvPPN8rUQyR7PNfNNpRo0fyu9+9Wq3W6uanWhtyXyf0GmyzvfbwjUE8KEQrI4pg0FcEqN1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772772789; c=relaxed/simple;
	bh=ZMatNdTBp4zkU0aR6MyUgvzfh9scLtSxdFEwiM4MdUc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gW+WmHnspf+Miod8YoSC193sHlwuJLAq60Mi5jfqGNs88KAyiv06+ymwu5dDrV4FrY75jMvCUFVcUHYH93zXFrxlzRlGiwZ0DAFRmTgbSc3B5am/rSJ5x8+DFhgjFvk+lSci8lcwNHJBkHZJGtwLvpfroYR+ECFM7vnnFiqMrFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k9ZCUX+5; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k9ZCUX+5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiXfvD/mOb5gYATMYHmHXxJmR36UiI3PEet6Ha3Btal2eq6AS6Y8yvdgj12EJTrw4fjRpiujQOb92jtJfEdfInQ+572WO7A3qAxa01M1ZcNiTMAECsjdziL3Ln84eg7OegK2Lhl6Kpdfpkx5d9tUJzQXSHra1bxd7sgOouykyoMoBrAWrRtKX2N49a1QkKebnV2+i6lruI/f8ZitVxjpuJQqnpY5tnZQISXIvsHih2HukapSKUUB78utJRg6ZWZZaaBovXwb0z2SqcX/z9iasGMo4rrjE5rK72e7kLZnj4ihHt+rn29EM5Trjh/yVt+WZ7kLzIM/eYyD2MaHMiX+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0FrlLKstD7V3MD7Dyhsh+R12xbYsBkvZ6tlBJhfGQE=;
 b=jg94rqvrLC7oNAYznT2SSOTsATjyMI0VgWo3pkxbB4/3bAeygyTVr8L50nhX70BvEyfzdwSpZzFxNWDXBYBl6EwNRAxFTNhdWMy+rcAfNbvw9od3Bi8ivrTJC0Pp+wzomhmxroN1vki4SInkhh5Rn7WcYC5Ku2ADyLT6zf8IhXGJVJnAgt45QA2aC2bBWKyKQ2mwNiT92tp9CvQu4VxUGccrYH9n/6iCxDSBooxYm35R7YjPlvNiWw0qA4FCJ6YMzM5fwOucbaJX4qPpElP1Z5cGyz7YHIPQEtxoEOVcMMMa+LvFVcpUa7W9vGRlTRJ0VyE/GJEPUfp+JDZz6SeWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0FrlLKstD7V3MD7Dyhsh+R12xbYsBkvZ6tlBJhfGQE=;
 b=k9ZCUX+5VwW8atWXgzlO5N023riHaQyP7JcwqL27eA+yzk8EBmbHVelqGPMXA00SVXjvPiUgmDO6X0KuEPkDiQUz2Lq+2+qlUD9b3Qgwo7byqZ+tMXFF3dOo16mz5IopS1h2yO4z3k9TGh1LjqxOpp2EtxtXFQ+oMWhCpsC5kZ+5altVk3eCcZQMBFi+Izhhcb2TQn+eaxcEperaWkmF0vY9I00eamAxs1ypTYONUtTUhWsqNSlp/BmiffAwAqOR9tSb1WcTgzqgM1V3wwexyQOSmm4FRMOJFeSFlApfsmjlwoDV3rgKvdO9kv+HHgMvBTCK3JWWg2fYtZKvxZBVkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 04:53:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:53:03 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Mar 2026 13:52:41 +0900
Subject: [PATCH v11 04/12] gpu: nova-core: falcon: remove FalconFirmware's
 dependency on FalconDmaLoadable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-turing_prep-v11-4-8f0042c5d026@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY1PR01CA0191.jpnprd01.prod.outlook.com (2603:1096:403::21)
 To CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c729fef-4da3-4a93-2833-08de7b3c3fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	8S92rpcbzRuQbt45X0XB2Z+606dzxZlFQ+TGnb2S19fSeQ8oFfei0p/S6eF7yQZq77Fm/5C5xzejEyaE5/uCeFTBgv6zZlyvrDwZFsfmMeWzGzJcl6wmREywHUXwZYRoZTPRLdBU9zWAbfwl0yRpQq2V4GMTLkzwE23fiZJwaUmeMiBhDpu5Tz09RdIune4TPJlUanH7mdp5ptCcIc+Xs9HmwbqFfSAA6Ol2m8iz4oRAveLthQT8L5F33IKnGn9HOUBMFFw+h9LlOhKskz10jVUvN7iJ/Hjk0QjoMBCuM/ZQhB+WNpO8EsMvVvsG0yqxmEvYl4GVaZBYnokcGU36tUrkYtsD8QEE5yC4L/R66AD9kqIAjJz5FRJCUmFeFPbHWVAbtrc5n1S6ODw9n+GiuoFEB1UB3oLcYROVGsasRMdgcPUq387TpzIH7ojWRU6/YE954TTul2Ovq/NTJhCBJicvfwTx7UVBOZxr0AuNWFY55yrtIAQK9+GTYwCA68dLxOaaKgG9/PZ23bNk7fCOz9qr7TGpi6z4o24yCGINeyTaaS6ImMaUF/4QbAtgFWqziVxdW0A/UJUIrJOimahisRO+BLLWOmL2cBWMMQResdwTy5Wkd+q5msvnwdr/75NlzRlqFeSsOatRek9PrKDYAq/cq13X+gDGJvgESQaFiWJoPB68yy8xambLLxdxgw4wyhxZQdb2KBtTnjr8fncCJmil8i00QoFcXUPp/8iEox4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmdwRG1jTTZ6cjliREI3a1BBSmdnMFM0VmFGV0ZMcVJ5NGIwckNnb0ZuZGlV?=
 =?utf-8?B?Mk1WRVlJZDNGR1c0RmZvcTV6ZUtMdWtwNVFMbEF3K09ZQkc0dytPN0MvWloy?=
 =?utf-8?B?YmViT2NrVGs4RHdxNkM4d2w1eUhZY00rVVFIS2loUWZERDFDbDI1V3BueDh5?=
 =?utf-8?B?NWU3WEpLTFl0N2xwaUtrY1YzYTJkRE95cVJNVWg0MnYwOGw4UTUxN0ZTYXBi?=
 =?utf-8?B?N0RJN3pHZlBIbnhWbllsRDlYdjZWeG5PMi8yWlY1TjRJdUhzcXlmbWtvYnla?=
 =?utf-8?B?alJUOUtYWWw5OFUrTlZ0TkcvcjQ2VDBiclp0S2VtSTBrUElncFhMYU5nMEYx?=
 =?utf-8?B?aFlxY29TVHVrc3AzbG81QjFmMHppZE54bVNqZWhPalp3aS85SWtRS3RJZW13?=
 =?utf-8?B?SHVpYUxhaXJUM1I5UXM5Sms2Vnp4TnYzQU9DZlMxdDl1c2RwNENHQ3dFbktr?=
 =?utf-8?B?T0FMdjRQQ2FmVUZUazZDalVieHFjMW11SjcyZEhUREp3a1IweStLU0hJWFVj?=
 =?utf-8?B?V2NQaU9OanM0WTk0ZERjNmZtdXBGR2U2NXhRV0NyRzR4eHdScUVQWmJHNmM1?=
 =?utf-8?B?OWRhTXIreVRJZkZDZm5hOVQ1U3NpVXlKUVAvRTlmV1BodWM1T0ZuWkhXTzRV?=
 =?utf-8?B?Mkp1SVZNcUVYWE0vamhidkVJNVNSQk04bnM2V3V5a09BdlNaYXlPNkFZRTFU?=
 =?utf-8?B?WjEzYzdBcnV6WVFRZGloUjNZeDBSbFFNYmtZWE1nMEM4Q3NTeGNkaTN2YnRl?=
 =?utf-8?B?TG12WmJ3UFZraXpST05CdGpkUDJ3THZEUlBUZWFRT0VtNXJEM0o4aitZNlBM?=
 =?utf-8?B?ZFVJU2RKbmUzYmh5ZEpTdDVLa1lrTzIwUDlkQnZ6dUFHS2xZOW5Fb0gwZ1pY?=
 =?utf-8?B?VUVGQXVJeFdIVjVrdXQvMW5DSUNnRlZIVUJnZUdnaFlFeFZqREh2SmFIMzg5?=
 =?utf-8?B?ZTZCUi9Cd1BZdlFpclhnT0Y2MnNHcnFwMnFlNTJxZnk1YkphUzN2Tko3ZUh0?=
 =?utf-8?B?RElyWW91Ri9HR1hNcDlJa2dIZEFSV2ZnVzkxejFuTTZjOXF2bE5oSi9jWnNJ?=
 =?utf-8?B?YVl2UERWVjZ6cmJKRmtvMURKclppSFQ4MldncDZKclhiMkJPd2pualUvbHhJ?=
 =?utf-8?B?dmcwTGlHVjNSYU9BT3BHZFJmOWZlb1hFY1BvK0lhbnJSc09mdVRrd1AyNDhr?=
 =?utf-8?B?SzFiVkJrL1RJY0d1SlR1RUpGWVh3WUFaeHVlVW5WWE8xYlVTN1dJM3NOd2Iv?=
 =?utf-8?B?M2lZTDBlZ3VUZHY3dUN2dWtHTXljSlY1TzkwRGNRTnJHVm5iVUNJQzNzVC9t?=
 =?utf-8?B?djRSc1gwbEZ0cU9tR3dISFhOa0JDQXJEdlBrRGJmeVZqS2dtRldXZjJOcVVG?=
 =?utf-8?B?b0hWU1VTNEZXa25Ya2ZFYTVvT2wwNkUwQkNQTXFaMGtBRGdZc1hsNGYzRk5Y?=
 =?utf-8?B?ektqSGt5Vnh1VGFxTEFuNTF3OXh1OHNEdk5PT0ljbldlbjQ4S3BXU1RWWExI?=
 =?utf-8?B?ZDZOdlFqc0tVaGJCQjFmNmJlRnFDWFh4UFdXRWZ6K2FFQnliM0VWVW9EeS9q?=
 =?utf-8?B?YmlLMTBCYmxMRDkxU3pxQk1OZGlrUTlzQ09zbTZFZE1nSlUvL1ZlNmZlL1NK?=
 =?utf-8?B?bUwvMXVsRlU2bDc2UDBLeEVoMytsTUtCTXljaDRlUFhJK21YdWNmdEY5enc4?=
 =?utf-8?B?cGhHdXFaUEZCbTdQODhFNXBaY095Nm1NYU5FUFd4b0lxZFA2SDlkeG55TzFn?=
 =?utf-8?B?dEZmY3o5Q1hNV0lmbXo4OXBWSzhZNlRPcHVnRnZhczdBV3h3akZnVmV0ckdG?=
 =?utf-8?B?MmJrMjJGTGh1WDBxRWVpanQ1L0N0UVBCekgvSE1IR2VPQmVDbC9wYSszMlhX?=
 =?utf-8?B?Y1NWR2dCZWg4ZHEyUFBEN2NjbDVPM0hiSi9lVWxJZ25ZK25WcEVoaStiY2tL?=
 =?utf-8?B?ZmlSY1JTUTBOekJQOHRtQWZkL2F6U0VaT0xYMnkzVTEwbU5KZGdkcHQ0V0g1?=
 =?utf-8?B?Q2tMeVJFaU1Hc0xYVHJ5V2JBajZnSStXb2lsUkkyYXkyRERvYUM5Uk9icDUw?=
 =?utf-8?B?dkdldm9ZQ1pvRVY0N1ZWVTA5cUtlNzhhbk9URWZSSUZydGNwNVltRlRKYTZW?=
 =?utf-8?B?WW9na0paMGhiMWdMeW1lU1NQM1pkTEpYNytjRHd4MFJZeG1MY0gxMFIrMU5L?=
 =?utf-8?B?b3VVRUNGS3cvMHJzcW8xemVqckhjK2JmVmtTSlI1T0RtdkRVQkRlYXVhd1dH?=
 =?utf-8?B?bnRTM2M2Yk1wY3M5QjBiK3ZUd2pIZVZ0NWtmejBwYUgzMmpTU2QrMzBvaXNQ?=
 =?utf-8?B?cFBDYytEYTJMNGl6WHhyV0tKMmkzMG9JL0d1QWpKQXE4RTlwUXBMeS9DQms5?=
 =?utf-8?Q?ZG1zRxDCg76u1aqAGfYZyKsyUVxP7+rxdaMuUh+ptKm7c?=
X-MS-Exchange-AntiSpam-MessageData-1: i7jEpyvsmgY6Iw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c729fef-4da3-4a93-2833-08de7b3c3fad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:53:03.1351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mi/QhskMDfhMr4bL/5DYYs5ILHuN2XzgVJ6Y4muI1PAC4E8fRICTgohEuW7jrgPqgXrYDK7apCwN+SSQwX+6ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569

Not all firmware is necessarily loaded by DMA. Remove the requirement
for `FalconFirmware` to implement `FalconDmaLoadable`, and adapt
`Falcon`'s methods constraints accordingly.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 9eb827477e5e..450431804e1c 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -378,7 +378,7 @@ pub(crate) trait FalconDmaLoadable {
 /// Trait for a falcon firmware.
 ///
 /// A falcon firmware can be loaded on a given engine.
-pub(crate) trait FalconFirmware: FalconDmaLoadable {
+pub(crate) trait FalconFirmware {
     /// Engine on which this firmware is to be loaded.
     type Target: FalconEngine;
 }
@@ -521,7 +521,7 @@ fn dma_wr(
     }
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
-    fn dma_load<F: FalconFirmware<Target = E>>(
+    fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
         &self,
         dev: &Device<device::Bound>,
         bar: &Bar0,
@@ -660,7 +660,7 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
     }
 
     // Load a firmware image into Falcon memory
-    pub(crate) fn load<F: FalconFirmware<Target = E>>(
+    pub(crate) fn load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
         &self,
         dev: &Device<device::Bound>,
         bar: &Bar0,

-- 
2.53.0

