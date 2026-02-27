Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7A30CDB6;
	Fri, 27 Feb 2026 12:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195583; cv=fail; b=UQG3vJ0hcATIhfJEXmvMCXD6KC8sep986b5AN5gpDsZlu6EfayhnkwsZq+A1r1VN9ysH5udmLjBLhnzNiXCnbRA3hBDJhLpLUL+UIsYMkee35j7fj+5Xc70t94wPYgrAuEScYE6XZqX1eVEN5MWip9puBSkFbBvz1N7UGbs9G8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195583; c=relaxed/simple;
	bh=YlbwiKSqqT4a23Icq34LfUsvVwwtSB4/6eHWf7ZtjwY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GVjDOBuOo1RNMEKxUmA2PkDxkDlk7GwEuWH5/T+cIcIqTp1ms4IJarzH3rhJao72UiN+3kgxJlQcG089+9xKMtO911BHTS4Ex6+MUpK8+j9aKsavb5fGY7smWseDFiDFf8j7g/PLYyfU+rmkegGUXDKKl8yRnAEFsexEoELDDQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B1Ug0hse; arc=fail smtp.client-ip=52.101.43.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B1Ug0hse"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwhwQBNbcN5E02vI2FKOPK6P+CefQnj4sN7+qTsf3qUSvD3VMlXEgV3UkHWPvgETbhz2Ev44ZQ+or2Udia+IQM4Dx/ZHsFlsb8De4lR+/WB20ZBq6+hgzIvW/9YFz+aMBnCS98D3G2KnF2vaNbG2KXZYcufPHSt6Ni5hN4Jg/3IVCp+xaSqWgYzbaOa6WdfOhCNe4yQ6Gss/OTgvaSCFK0pxyrjUlnxNtJ9ZXZsxkE5x5ImE/9Gos+7W0m1xMQTvYomPt4y4TXcOs/k47NYbfiW0/crjHGUeZHvSONw29mREe3bKOrbRXhRPrkrGjwU03QSfm0mHS+XVEQZj/Rpt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRW1aL/d5DYpWRV5ydij8rbP624UomG4dN2QXf48veA=;
 b=wGqnVlxgQfysZbW8HDju+TfuF/XUvLLDek0Toi8iXbHgP5u6Bjw0NJ8LgQMc8lgJowJE0amkv9mktqx9SYnp0C3DjFZbbaMyew4cuGVnpM9c6AiW6NHMv0FTSecPg5891UXL/7CHkUI151Y16z6oqvEDvko8PxXGaTQI1/EoT//rz2Gf4R5jcToXDwurYweb7sTiOEzv/TzLOAoAYlmZc15teJIkJqnB/U2OYMcwCCvt5fed2s8fAdEIlYinn0W8BYKVxX4fIQRcbMhd5mwJe60gGM+FQpeRFfksCgi1M9yQ0vnW9NqP8/yPI9l1RiQcxPNWCCu9X+xpNkOuBpyNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRW1aL/d5DYpWRV5ydij8rbP624UomG4dN2QXf48veA=;
 b=B1Ug0hseIkWLpZQ/X0ifTyRIHoZsrvGP2KhSDtDcG/liHA2T4ZQZadVNw2DXocWz2QGv3gQkqI4M0/AfNrXwwejC1ACP+9jE/IT/u85ABu3a9q3QpuQ0m4Q3TbN1b7PjkcBqs1uqCX1DmvVM2Qxty8bZsiAnzeS+mGBvQx3OtG/HSu4em2ez1+Fc9lKcj8K3lU+ilF8d8jYnWaxSVY572WfLTMPu29IBnFi52L85mO4rcGA/C23Oh/3k7LnzjK4A31yBEXrnuVY6yPXPjVYvrRJ+d9C2MGg0uZ/9EJqwFh8xS7Ub3s/41FUCXA1qcVQbR7sy7Nkxe97m689eLmjCOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:32:59 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 12:32:59 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 27 Feb 2026 21:32:09 +0900
Subject: [PATCH 4/9] gpu: nova-core: gsp: add RM control RPC structure
 binding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-rmcontrol-v1-4-86648e4869f9@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
In-Reply-To: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY1PR01CA0202.jpnprd01.prod.outlook.com (2603:1096:403::32)
 To BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: f0be3937-7172-4d08-e27f-08de75fc5792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	+jKeQVfdL5+TpJXv/VGxxsCGRbhTNozIMTbhCQ6IcSiNzhhCYp4T5v6eo7LVUn7piG8clp0aEgxFKL2VSXGw0XBosqPPPP1OJX4kOv/7jLJ4RN26YeJu/U4BMm4O0MWkX+vk+P83fNgwBf94YCpmB6H5D5V+qL/6mXWNUW0z2teWM1KG8MSu4Fvbl/RWWS80gfBzDmbfCl6B8CmBA1IMm3xnkP0M8O4KPqcy4Diw4KPbGN8CFNdQ6123hUH8wyaHOIlUmx4ddiCG2Kvt54/W1XRJORIYJyhPtFSoe5rcKNFGkdzaMZiEz8sdiaIzqo24H+LzjkwvylX96ot9dDjMUqIcK5ayzNSj8zrybB2PljpID7zawv7HFvHMS7J1wPIbqu/vTtGh2parvA8/v0XTGEeKkBn/MhrX0pYfouFX6yA4zDe38x3b7H7uzfbG3t4beXwVUUxq56aljgCtgPzQgyyQ/85EkqEw+DYfidE471jSQdFW36xFl3hai4FvkmGgHdVO65uBHSTo5dAf8j9E9yn2BV9zAB+pSlMV3pyzst5B9CHZManqVFF3HqVBabAyexg54YAXiH+6J0GopOq8EFvOzPxC+8mEH8f9QYVQjFBneSkM9opHad5OMxh2mdcZVvJ3pfRSFIfXQVztUKZCdMyqNVOtQ+MBwpHbXPA6qAc3cx9tLpc1FpbgTlLSt8j6FKhvugDnEnspQ79wFuHM+1cSrSNMys2fWoSZCMhaxWs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDlza0lvWEJtZUo2NXVDei9iTWRRVGU2V3I4M3lJeWtpcUlUQXcwcGdOTml6?=
 =?utf-8?B?SW1JVlBZMkdmRkJ3bGs0UmVISEZpWEZwQSt2TU5MQXhsTksrU2hOVEhmNFVl?=
 =?utf-8?B?ZE5sRVltRWJVcHQrRzdXSjlsUUlBT0wrWGtFTG1McVk5TWdXbDRVOUlXb0Rz?=
 =?utf-8?B?V3JESEx4MlppMmhVTXM2VS81M1BSbmVzMDNINXZiZm5RUWx3Q3NKN3J3eHQ5?=
 =?utf-8?B?Z0IxNzNmQVY2STZnSkFkRWYxQ1JES1B5Zm9ISEZVRGRnZklXVmxMaytMZElp?=
 =?utf-8?B?R01MUUJLUDZzZGY3eFpITWJBQXJvR3ZxRDM3UkhKTkl6Y2YwUE5uYVQ4RklM?=
 =?utf-8?B?bVM3R0pwWmp0Y3plUGNTNlEvRTlFLzVGelhYRHJld0VQMGxMTmxXT3VBRVBD?=
 =?utf-8?B?Q05qbUdxbEs1VWd5KzV3VzY0Y0ptZmF6eXNLSmcyblc3eGdrL282NnpYencv?=
 =?utf-8?B?OVJXb3Z4RkZTTTBOSzk2bTdSRDZseXhBN2pnYjhSMW0xV01YMDlrYXZ3eExY?=
 =?utf-8?B?Nm5UUTYraTlaUGxNaXk4dnFLTU9zdmpvaXlSVlAzc0NlQnZCTEltKy9Xc1BV?=
 =?utf-8?B?S1dQbmk4VTY3bTYxdkc2d1ZkK0pQaVh4dnpzMTMvY0RhUmdESnh0NmNTc0Np?=
 =?utf-8?B?dnV0Ny9Dd1JENzdqa0k1ajhBaXBPUDg2bVozaXlPcFNGTXloQUpSU3VlRklJ?=
 =?utf-8?B?RWYwak1IQU5FcDFRdDgrNENXZ0hrNzJpQUZTVnlLR3d5WU5rNVAvcXU3Q1Br?=
 =?utf-8?B?dVR1NDVTK213WmltZWVEOU9JRlFRenZOWExOUjVHTEZTYWxSRk1SZi96NzBK?=
 =?utf-8?B?YUg4WnlCWWM4YldTSlBsS1k4SkhCUENTZzJadTlZbkcrN2FRTjNWcXJwOTFo?=
 =?utf-8?B?R21QU21pdUFwWm93eVNJaWJLZ3RlWEhvN2JYVStMREFjem84c3l0S005cUFK?=
 =?utf-8?B?WmcraWVRYnBTRXlRTldGS01NcnVWREl1Ri83MWZQSjJEcEYvSytsbVhib3Bt?=
 =?utf-8?B?akJIYVczM3IyakRUWHV1eFNKMFRIUlFmNTJlbnZiU0VHL0ZuRXFCVHZTYlc5?=
 =?utf-8?B?YTZKaUFTYVo1U3pyVzFBM1krSkNNaXRjVkZpQ2N4ZXI1RG45bVNEbjhTNERr?=
 =?utf-8?B?dzhRdXBUVkE5dzFTcU9jVWNnTkhjR1E4eXhJMGZTd3RRYWEzNkJ3SFFhcmpF?=
 =?utf-8?B?Y1BGRTY5QkJYMGRtQUtIQnlNanJLVlpxYkg1SjVQZ2lNSEVQVEk4YjVJZkdx?=
 =?utf-8?B?UVhDL25MbThFbEtzR0UrWkFnMnBkcjVIdWF0RW5mSWZ1N2ljRllRVXF1SEFK?=
 =?utf-8?B?aFZaWFJtNzFIT25SdElWck9BV0Jvd3grMkE5R1c0K2lMNitVdXhVMG9vcFhj?=
 =?utf-8?B?UmZySFIvSmZIRE9SVW5lL3hVelRjMG4vSDJrbGc5MlhzR0Z4TjJTR1JINEZo?=
 =?utf-8?B?ZnV0eWJoeHFianBWV29IdmlkSjExc0d0dkgyT3dCWWdjanBiSGExQjNMcDkv?=
 =?utf-8?B?elRoR3VmbFB3c3MrRHlPSFRUcFFON0xlN0R6L0tpM0E0cGUzR3JNQWxka1FH?=
 =?utf-8?B?QTFKY2ljcHcwckw5ZkVXU1VNR2ZyNmRLbzBLN2FMRS95OW90dXFvNStVbWtp?=
 =?utf-8?B?YzVvUEtjZ0thWit1eXdnZ2hSVHo3RmRBbmR0Mzc0Q3dyenJuWG1iTHJkVWla?=
 =?utf-8?B?cUo0M3JHcjIyWTF0aEJGK0pSM2JNVm0xdFp6UCtyWmhIaEhMdE9yaU9abTg0?=
 =?utf-8?B?Mit0QmZ5Q2lxbHdtdlVVWDlCZGF0WkJCNkZlZCtqd1NBWUtJYlFYV01iZzBX?=
 =?utf-8?B?d016SU9YYzVRY2U5TEdtUzlGbENlTnVadXJ4aDJpNng2M2NWelRzaEdkMHR0?=
 =?utf-8?B?RjhLeXlHSnFvbUp4ZEQ2NDg0MitLZmRqdXV4VWZQellsSFpGWlpmVU91YXMy?=
 =?utf-8?B?ODhuQ2VBYWNsY2pvZTZlRFB3THJvK0RKblR3ME05VURaVFFrNkt1ZEZqdjBW?=
 =?utf-8?B?aU01ZXhiV09Bc3NzWWwzQitjTlNrcUtHamx1bU1yazVRZE94NXFnUGhETVRR?=
 =?utf-8?B?MWZQK25hUUV0VnVwYUpQQWwvYVJBa1Jicy9kTDl3aWdCd3J1R1VwOWZuTXY1?=
 =?utf-8?B?ZnZzalNYV3FOMVFENzljeUIzRW5zQjNvdFZyeXJRdmtGU1N4K3pUNEYwZFFw?=
 =?utf-8?B?Qy9pU2dVQTBMNlA1U1ZUeW5RclB3NStZdktVdld2YmFtUXpMd0k2OXNHR0NN?=
 =?utf-8?B?REJ3NVp3TjB0K0QweUNIc1A5akRBcERvSXl2eS8xRGovczc4Ukxsc1RaenZQ?=
 =?utf-8?B?RDlWTThOcnAweUwyVjNBUlFjSmlRRVJIbzZZZ3A1ZWdKdm00ZXR6ckZtQzg0?=
 =?utf-8?Q?NORrqQizg86U6KkdHmnEUilk1erA8kYG3O206RacbQs1r?=
X-MS-Exchange-AntiSpam-MessageData-1: /Gb1UnsDHaRnig==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0be3937-7172-4d08-e27f-08de75fc5792
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:32:59.5555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lr0HxVcCkLQnSlQjT0xrI+cPbLr3fII7dZFjztToXRGrA/13iUd076Mnrho5yTTy4O2Xag343sx8O5UXn1pQCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287

Add the bindgen rpc_gsp_rm_control_v03_00 structure. This is the
structure for sending RM control commands.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index dd37a7fd58c6..05e205e6dc58 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -1025,6 +1025,17 @@ fn default() -> Self {
 }
 #[repr(C)]
 #[derive(Debug, Default, MaybeZeroable)]
+pub struct rpc_gsp_rm_control_v03_00 {
+    pub hClient: u32_,
+    pub hObject: u32_,
+    pub cmd: u32_,
+    pub status: u32_,
+    pub paramsSize: u32_,
+    pub flags: u32_,
+    pub params: __IncompleteArrayField<u8_>,
+}
+#[repr(C)]
+#[derive(Debug, Default, MaybeZeroable)]
 pub struct rpc_run_cpu_sequencer_v17_00 {
     pub bufferSizeDWord: u32_,
     pub cmdIndex: u32_,

-- 
2.53.0

