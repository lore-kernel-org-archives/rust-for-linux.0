Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCB5372B38
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 22:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773699939; cv=fail; b=hGgavPoblpoU1BudUdFfiB7YjUqOUVfdPar9JytOZsBoawF6pMEH1nS1Qx2jI68L60onzQKeRR9r36fGGaRBlcTalp2Dn1lI+rvYhyRTI/qwmMLeGhKWrHwSzsiE0NPJYuSO449AVq12NKFWBhgssTwm3X54xhhGCSImGdhIr+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773699939; c=relaxed/simple;
	bh=M6kSykRvjLH4tUPgslgNmUV1M9QPzF+JwfCeLUSB5uI=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U6erxo4YHbMCbMC+QS7GJssxQ+5OkJECFASyAo9AwUZR/+0BxWCoQ23oGhZfnehThFzhd1VFHd9ScMfdsJCBknWpxdrFdB3kGlF21IF2ximjMOl+3VlPMyr9f9YRR7mvSwnpQoCpS0mG5P5B06zlG+1hgLZiS5Win5c0C3R6UX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ho/Ov6qs; arc=fail smtp.client-ip=52.101.53.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ho/Ov6qs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCsTu79SmAnZLcKT/3ndtvPqzuUiaj5nTKpmr/+ikyeVmtgrdKdX6Cj6/S2CJKH7oKqO1fjcyIhk193C7g4tVMLjXrlAW7NXw1kA5K+AAI80ua49QuFAQID55mKTDNCNw6g4BFPQr9HvR9cpu/oPfyTD9xN0a473gESqSSOLwGkcHKums+X6qR7crig7F8LX5bnIasnj/XB2/ihepXBTOVOv1iqV06Dm+uAVk8Bt/tjMk/M0S0bRb/FjRpdzMGqa2Mr8y6KArMt95AX7ECyoipmRQp3YLV34uGoxhUdKC9mVy2DFUyAcf46Un0NWKKniqT30nQEYxjBQD7Enqu+HXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvq50RZJNF6wiJO3NwO2py+U07vXOJhs7c+VcmSYVYE=;
 b=dBuO9VcpW6UvkNMPPgRFyxtuIpd9tVWcoAv5fftZlDFYMjhUGmcOowMkrR1PWmhu017M4zjE6ZDgcyH57UVTQzyxOy0MAjP2LQSeAMuGGk5UlJnbsghlNwYei6ggFIOtbWhu0T2GJncxat7cql4CmEiG0HsKT+3VMgoBsD6yZ47e4fcWo7COTRbuAS3g5KgFREQYL/HIOH63vNYXT5ygbJTpN/hwKdVXzkVm9RL89MAmMqbXUFvIQhgYZ8H6bbdsMEk4hf7efnQPC/Tq8Zkvb4f9gxlpmM/wtZvGRwLME+ZmUcdyy/NzRh5JLH7So4pvp30PkVupZ45roGWPrg06gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvq50RZJNF6wiJO3NwO2py+U07vXOJhs7c+VcmSYVYE=;
 b=Ho/Ov6qsXRSy2meMysbBCwhb0RahkoBK5jdlPY1MQOYSG5I7xAPp4nyOLZ1NnRAV2oUpIIPkM1qDouUqXuRJ/l61E06HrY0na3h3k0FF/yAO6rCKvNh4GGQHkMRgonBTtmgjzW9ZL/b+Wg/p64n9rXXRthwCypDVm86cqLlHENBTgv731y9IOXFUjJZ4gh3zPmjNsuCwP8F2Qdddcb3kHiFZmdPZRswvxEe09b6HgSFgWapIeJe+doS/JU+XwvNPDquCK1isKlvaMI40Vm9mjxacxAvdzVvGghKWIbd1MwU7exXTLPmpIeBd4Zq5DOU8n1IC5KnG6ljSFl4qt47pxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB7536.namprd12.prod.outlook.com (2603:10b6:8:11c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.16; Mon, 16 Mar 2026 22:25:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 22:25:34 +0000
Message-ID: <6a313afb-4e23-4c86-b44f-04cbb451c853@nvidia.com>
Date: Mon, 16 Mar 2026 15:25:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: Nova developers: avoid nouveau mailing list until it is fixed
From: John Hubbard <jhubbard@nvidia.com>
To: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
References: <2a914258-bf58-4b46-99a7-d8c76fe52671@nvidia.com>
 <bc2517c2-6772-4cbd-8fd7-6dbdcdd13eab@nvidia.com>
Content-Language: en-US
In-Reply-To: <bc2517c2-6772-4cbd-8fd7-6dbdcdd13eab@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8d3ee0-f56f-4dcf-89c0-08de83aaf0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	bbvLUQlG19X9upzGlrucFqmxuvuOGbQUFcHy70SpgN6bh64Nj4BvAmoAB5cOxeyfTK3sUlBNHwGwgVwze//rKwM6ROl07Gijnl/USbCsWfMPLZfDRA5YiDL52+UdNYuvz4QdrqhOSyvJGB3y6JZQrJVs4MEIZ6UPpL6YCu4qZsIoeG+l7ifNR20zg/tldFTKnaucQCK0TeePQBRgLUyV0Q5P0NeEWDU0bz0BGWAYprcVMXEC2em8Hz7fqx0sTtXTTQ1xP9ce1+iDbsJqjFmL6Fwif/e9wohXPAgZq27OmzemH0+2LhNKgWz3BG8G5ldli1HFJ4rMSRAZRz8rBtp+IU7VfpwPFGDLojfbMQbgy+4yh8N36I4OGV4r1V66/X/nzV3fmSE5Ro2ZDKvP2NDpD+m9XE/eZKHufZgMM7w2kbLFg9x1WiDBmVL5NcHsKUJv+elQBEJJZWw/1euxXXH24nLA6/97T3o4vjrkSZLadiN7ChGyIJeoJoSW+1hmWIL9TxsPkcTugXUWh7vaKxJvkqZkITpvAOxqGYEpnzPeZ2rA7IqceMqbdRRfD5yDQ6JUsNPcWLGtRB+KnUDf+ewNZMQ2VndpmGHZvizHEnVsU6ZdvVBF7xwXNocwCZUmQ1GdDSk/ntIpmXPoWHUW0fZ4YQbJb2wI8lPGj4qHvTzRI9uLCbHdfgzutwv3LUjXYPxWfjXnV+sCKY4+28qicBId2rlpv5/ptB8mPVKiottg3zM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEUwVDE4NXVRb3p5dHduZkJVVkw2V0RhaTd6dDByYWxyRTgwTkg2aW02UmpT?=
 =?utf-8?B?VWVlRG1IM1dSR2lFV3AzMWJ4bHRrYXdSeUMwRmdMV0N6NnJCajJ1RlRWNjJi?=
 =?utf-8?B?VFk4UytIUlk0eHViZ2lkSGVXT3JsUkRHeWFJN0RkaVFNcVpkV29VajRIYjRm?=
 =?utf-8?B?Tk1LR05RQ3VSUm1GVFo0Ty80bDE4RWhWOU9pWEltejlXUmh0VGp1c05pT2Uv?=
 =?utf-8?B?ZzVPWUtoQWpjaXFOUkRKL0F1aEJqekt5aFNxYlFNclNLRERRVTlpeXFuQWZs?=
 =?utf-8?B?ZWdaMnRTdWs4MTdPSlJ4TXQ5RkE3TEY0WmQzS1M3aXVQOUVtYkVXRVpoTXQ3?=
 =?utf-8?B?QXlDTHMyQnFFQXhuRzA0MERGeVhrYjUxMWk4Yy8vV1R2WnlBVnBFOHR1Vkds?=
 =?utf-8?B?cG1QZThCeEdhaWlwTlM3c0M3a2drTi96QklmRjhiWmQ2YVJNTy96aXNnV3pK?=
 =?utf-8?B?dTk3d1kzWTNDN0hYT2RaVmdZMDRpc2ttVnhHMmNSZEdhcU5qaFZSL1UyNUhC?=
 =?utf-8?B?MzAwRGdzZjBoWjhncEdWdWtteEhHV253dlZOMk5TTDgzN2h3bHpQR1pNT0ow?=
 =?utf-8?B?OTREZHNNUEEwSm9FMzFwUlY0cDA1L0JFQ0JVUGZJU3I1Smc5VjFRMytKeExw?=
 =?utf-8?B?VE12T3ZSMnJuUXdSZmxmUUx3YS9vanBDaTJOTTFxMnZ6bXcvZmszT1prWHl6?=
 =?utf-8?B?Tnl5azRrRTQ3WkRxTlhtUUlJSG1zNStaakJReEk2c3NJMGhwWjVCdkFSelBL?=
 =?utf-8?B?VkJ0U0NXbVdiL2I3bWlaOTcveU5TV2d6QTVHWE43VjFZU285VWp4dFk3dzhT?=
 =?utf-8?B?U0ZpMzZpWVRLaGtSYTI2M3hIdUNDekcwSFRWS1pTTGtaeUFxUDcxYktqRm8y?=
 =?utf-8?B?dFowRFIxdUFhOCtXajQwcW1YeTRuc21LazBWYS91UFhuWTVuY2pRcEdxMEZB?=
 =?utf-8?B?Q1lvMVNoSEg2clRMNkwyT1h6Zi84dkRFaTZPOUxVb01xNFFVUjRjc0ZBZzZH?=
 =?utf-8?B?SjZpbGxlQ2RzSmpCZkZ5ellPV1FKc3YrTzUreFVWK3JHZlRkK1N3ek5HWHZ3?=
 =?utf-8?B?UlBqWjAxcElPSmZGb2EyTTBQZFJnNGVlTkQrVXAzcFg2KzBDejJwOGg4eDk2?=
 =?utf-8?B?UXgramtoRGFNMzkxTzJma255Z2U3THlQY0VwQ01yKzRvMGx2clVpT29CeDMv?=
 =?utf-8?B?RGtqWEJha3ZDQXFFZFAwOFcwWnoyY0oveW44Z2FGblNoZDYwL285YUJpOUlH?=
 =?utf-8?B?TjBJajRjK3d2U3VIOXd3Q1RubFhBNlRmbGNKM1VmZnA0bmVUR1ZQS2tPY29R?=
 =?utf-8?B?UU9KeTlNTTcxWXE0MVp4WHZ3MVduMEJ3Tk5WamFVV3c3RDYzL29hRmIwQjhs?=
 =?utf-8?B?d2RZMENyN2Q5eFUvWWRpNkFCV0M4U1EzUlQ0SzRRdVNhajlvcGRxYkNPQWxp?=
 =?utf-8?B?b1dNdjBja0NVNDRzVjJkVXRJMFJGRGZsYWRYV0Q1VFJhL0s0em9mZklGakpp?=
 =?utf-8?B?MlBoaC9yemhZVW1XTUd2S2FTK0U3WThOcmVhb2M2T3FpN1JEOTh3QmQwY0xz?=
 =?utf-8?B?Y3N3MlNsSXlWZWVMYlZpL3VoZERXVTI3dENia2ttc2NPUlFscVA2bWZyQkwy?=
 =?utf-8?B?cFpzM1cwWnJiRDcyUDF2WTJUc1MxMU1iaUk0ZjFWaTMrUFIrTzFxOHpYR3pq?=
 =?utf-8?B?MWFBTllCWkJ4TmR0b0FZSGc3VHpmL3I3MU9MS0M1Vktya1NJaUdEVkR0UEZZ?=
 =?utf-8?B?UWVISUxXNzUxV1VaZHBvTEx2dmdSVlBhQmNUWE9lcEtobU1od2tzR1o3Qmxo?=
 =?utf-8?B?N1VBTk1reHZKNElxc05lUVBDcHB4eEErZUVWRFJBR2hMbVRwSkQ2a01xR1Bq?=
 =?utf-8?B?WHdMQ2xHNExUWHE2empMZWp5eWYydDBjVlJNOXVwc1NtU3dVMGc5QmlUak80?=
 =?utf-8?B?MkZFNlNPR0hOTjFLZjcrVmVadU5aSnZSdXJLR0t6Wktrd21UeWdmYjdGK25S?=
 =?utf-8?B?ckx2TXpMM0ozblJ6Z3pmT1NQeXpJK3MveE5BLzBJdXNYdUNZZ2NmVnlHYWFr?=
 =?utf-8?B?Tjk1Zjh2YmxtUThNWVVXcnYxOFpnODJXTktkbzRNdVpIT21LcFIxeHlxQWpy?=
 =?utf-8?B?OWFGOEJZVXVnNXpMTTZ3TE9YVUZRK3NKMzd0akd5YzFnbEhxeTNiNWwrSWNF?=
 =?utf-8?B?cjI0Y3NoUTl5WE9VNGVHVHlCaW1hWndLNFdGdjA1UmEyMGVOWlJEVmUrY05o?=
 =?utf-8?B?TGd3NlhwQWJjemNIRDNKMnl1dStQaVdYWHdwWWFsY3NIUWlUMkk5Vjc3a3Mz?=
 =?utf-8?B?ZTdFRzRTOVdpTXFianZVSE1sNElvb0JhZWkvMG1YY2VoRTAxelFYZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8d3ee0-f56f-4dcf-89c0-08de83aaf0b2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 22:25:34.1515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVa5Ci92FrWX3lstAnPzKisyeiuCJz21RdZeuqcFxB71n8zfK3B3cxxnbT696YMKg1C4iItrvbhCrw93XSzlPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7536

On 3/16/26 3:24 PM, John Hubbard wrote:
> Hi Nova developers,
> 
> My name has again been stripped out of Cc on your replies (only), despite

correction: that should read "on Joel's replies (only)".

> being on Cc in the original.
> 
> Alex Courbot, Eliot Courtney and I, working with Konstantin Ryabistev,
> tracked this down to a problem with the nouveau mailing list, a few
> weeks ago.
> 
> The problem shows up when using workflows that use notmuch + b4.
> Alex and Eliot have work-arounds, which they have applied in the
> hope that the nouveau mailing list would be fixed soon.
> 
> Meanwhile, seeing as how no nouveau mailing list fix seems to be
> showing up (Konstantin, I hope I'm wrong there?), I'd like to recommend
> the following temporary policy:
> 
> For Nova (nova-core, nova[-drm]), DO NOT INCLUDE THE NOUVEAU
> MAILING LIST.
> 
> And if "someone" wants to fire up a new "nova" list, that uses vger
> like the other kernel lists, I wouldn't complain. :)
> 
> thanks,

thanks,
-- 
John Hubbard

