Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012064.outbound.protection.outlook.com [40.107.209.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF691917F0
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 02:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773368013; cv=fail; b=Yp3t4Axrki8DkDR/wOz9UvZb492pjfZokkEMgqUS0cAQmr0w4UcqDQkMRbRJfRDB2YxAljqTOzYWGguPs5XO47hYt843wYDtr9Xkpi3i8fUjQrRXQjRbV+8jS8A4D9cn/yCMhIBXnWN5pebIAvTRQHNIJtIoO3dK03/6tCvLxzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773368013; c=relaxed/simple;
	bh=Go0GCSiR4qTTY5eRHBwV1IqvEpKItohpgOKWVBJ6A8g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NV5NzysY7OHCAX5iY1sc3RoQI1VB0ud0QPlS2NDnydShc2psMJqZ/arPFEqnXS8jst47+qPxMOBxAs1z04NXefLk1RX5kRakeOS2o3Jmrj/CUtjMvQ3Ui0M8HRRVV91KGpsY9Nz1FmhqSa5Y3Koh2WTbQ/hN09W/eUF8oBPzrVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uWwoFgIp; arc=fail smtp.client-ip=40.107.209.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uWwoFgIp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6cwdZM6adNwtn0ckIkiK9NbPoJEfmBqJuF/nIy50vESmJUmpN5oM5KelVwk0pZOIBwqwW36MY43nQa2Z+NO2fXKQVoBukahPnSU/s8Gxi1x+ly07QVFpJKaolzEK0RXWyLeWuq+49fryMADWc5HOMKR6X3Emsuh+vKjSuwFvphfgVMh0hl6JQHLBnaWpiAapuouqIsN1NNNjlXSV5EiuNPHDGjGRrlsOMYWdKi6v/ODy+q+hZfzVhnchMkxIGjIjXhGSB8lSv1XycqBCQIRK/lg9vGu6B6DkMK0FC6qTRX81BKM9zlAC5hqq2WLTYxDRIrmnoQ/Kwf/hUthHLPhpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5/jyUQvShbOTT5ITc7T7nCSca736+A11pF9a7hVo6o=;
 b=PDN4ljr+TKwb78IfQpPNM3MwlCEj1IrYDbzj9irXDty97NHGpP+7k9pKCirzm8Yvy69pVY+DhxxzO/feOYdiWSERE61vlMz7d5DIlK6dDUabtudZKGmpCVf+qItSABIn1xXTb2N3ejBGFydI/CwylkIzUn0jNGU19wz9YxQ04YcenaTMHFzuSBu7FRlqDLeWIvWa/vhdHlMydFfRvI8uKmRVMa5TZ543suIyVZyacGNEs75ygSun2JO+EuUlDynWrnQ3xvcY40q4rVaWSFhrtIcy6Q3OEWuTfLJm2Uv5p2p/fqrFwbFslkD/sN4VSoIINn75fpKyizYfrcl68ELrog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5/jyUQvShbOTT5ITc7T7nCSca736+A11pF9a7hVo6o=;
 b=uWwoFgIpS03zyyKTYlF3l/k7qSXM2uqAfg38/ORexi7daMCYX4GujvUJQQIzISj6sg49y5NrsXcvQawADjCG/0KTfAR6OB3eWUU+DgonBLeMWaiGDiknQ+EtPAu5n4yn/Fo68Ir8UcrV8MeDSGLtxBZJCJr3z5ozV3799s5RmzZpM+WJoWMoHFWGSb7ZUt5oJl3b3Foso5mfO8KRDt5l23vAKJhLdrgo8LRxEGtVmyH8WkLeuGm24hF5Ry4HOSOOJHbOJo6GanrHmthh0/rGKaq9ugqHwZrA0gMYAUVwpj6xm3FoIsSyQUxP0B7HisYTbZjzKjM5NpNyf25ogstkvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Fri, 13 Mar
 2026 02:13:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Fri, 13 Mar 2026
 02:13:29 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 11:13:25 +0900
Message-Id: <DH1AHR75GRMP.3K4RVG31XF24A@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 <mmaurer@google.com>, "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v8 5/7] gpu: nova-core: use pin projection in method
 boot()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260310220000.1897166-1-ttabi@nvidia.com>
 <20260310220000.1897166-6-ttabi@nvidia.com>
In-Reply-To: <20260310220000.1897166-6-ttabi@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: b9089450-3c8b-4935-5659-08de80a61e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qFVxgdyt3Q8MPXvkHvz7VWr9ua+OWlfJfFb8h7UNxkF1K8hvlnNhQNVnf7dcdd0xlyy/yqx1dRfb4Ev2XQM+sJzimn1w2GAH6vRXOXSgpeASQaOhSUT9eE8LfSnri2vU4Ubq8K3WzCAK6R01QO7EjsZ1qc6Fxi3Uj89BZoIpa3qPdicjUkBRtbzamy6k4CfS6AoCSzG3Hf246vcLyNEeHsy33MCfB8rbbwCTPjSwi4ZQIsuWFDjVaUplxgCzziCA6SQJZQmPa2rGv/HsIPKK29dVnvGNXEd/A9SlRR6lR1QC4GSDGypiFI8NacDDJz+oNpfDrD+JM4g0guGaIsZRNRPeyMrXXOJRD1Na8MXE4C0i3qWILG2pwA8EeseZcQRvmNbivU+lb5OtE/lKZ9EkfmVNxL6SAv7rhNomHnY15mVOxFpVR4bJKQg2PKJV/xacLXOk3fOiF5InuEogstM+TMgfVX2/94kBbkdmgVa6DDSkCUslkZy3ohT18BS3dfMRbPsILvUZG4+GbPHO4jcQBpcz7nJVLxdslVbrjGt+4t3cieFn3Fj1Rft/sdJ9meiz8oWuJ5VUrLZgx5+fEAsYwisQT0/urQ9thix5scEI6KWsWc9gR+9QIeqlRSy/pDtq33+hNh3tHKxFrxehQZrP3pkT6tYWIX0I82FyKR3k2Jntl7KNvIFZ9xOBtiePOGmNk3ptVoZ63YTLjKGwNV3DKHyiPhzywrs1ccW2QpOo0VRYjvxDaKEZW0xGM2CQGfU2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE9aRFMvR0FpV3JXTDNJMmVPUUZIL0hvQm1wQVp5SElHZ1JIQVdlYVE5R0Nm?=
 =?utf-8?B?Wkdwd3NLZzNkd216SWN5ZGxpVldiaENyY2RtMGVodmRzYitiZjBPakJSbGNS?=
 =?utf-8?B?c2JNVytUZHdheEJkdkNZdVo0amxFNVBTZUQ3bFljNExUWTl5RzRsS2NraytR?=
 =?utf-8?B?cmJVSU1WSEV1NnZOamVGeUtjUllRLzBjM1k3SVRjZ3BpYUhGUEhiSVRWSDFD?=
 =?utf-8?B?V1JtZm1vcXNxVm5oQ1R3T2VlNjlSNmpaNk1qKzJ3NGJrbUhyU1ZINEY0QjRm?=
 =?utf-8?B?V1hCNlJWMUZmclB1SERCMXZldWgyeUkrYXJvWm9sOXk4Y0sxYzlTeG51eHZs?=
 =?utf-8?B?THVGVTgzaDB6azhzYmgxblk1MTluTCtxZ3RESk5nbXJLVGF5TGU2ZmljMm1N?=
 =?utf-8?B?b0s2MGthMmlsdVBkdVRNUnpQWW1lZHl5dGU4UHZwR0Z1NHJUU2YrV2ZNUzcz?=
 =?utf-8?B?RDhDSkdwWHQ3Q2F4SjE2bXRjcmsxOVN3YjJtK3R2bDNsSjBuUWpOMzQ5Q1E1?=
 =?utf-8?B?ZENKR2FKVkxzQXdNL2lobVYvRWl0NVA1YXo5MmZQRVc4NU03TGE0eWQvM3lP?=
 =?utf-8?B?Q2lDQWdyK2s3NzdiSlN6YVkwdUIrQWN3cE9XdHRxV0JFYi81NW1tc0VRMDVh?=
 =?utf-8?B?bkFGZ0lFbE01SEFNblJhOWxBTmcyZGx2M0NpVG1oUlZKRjNHdDcyRW84TFVt?=
 =?utf-8?B?QVc3L3NjRXM4cEdTM3p2Y0pUOTkyZHZGQzZtSi9OQnMxYTBBeDNGRDVTZFVU?=
 =?utf-8?B?R3hlVyttRmkxdDFiQ3V1TFBZalhzNVI2U05rM1ZJMU53RkpmR1R3cEdzM2R3?=
 =?utf-8?B?QnFuWDlvcDBjVDNlbForT21OODRwNEJvMGthczdCenRQcTUzUjhSL1plZzNi?=
 =?utf-8?B?T0tDemFHWEh6c2piMUU5a3NDcTQrZnBpUTFZdEdBNlJOVldRZ2lRVVJLSVBx?=
 =?utf-8?B?cy81eWNESmJhZUY4bjdVQnBLNjVoRmFIV1YvTDN2T3FiV1VIamtwVVI3RUkz?=
 =?utf-8?B?L3B3UUg4WVVCcW9HWWE2THZ3YTZ0aWRlMS9vMnZIVTZid1BlVW95SFMrZ01n?=
 =?utf-8?B?cUtWaDNVS3dNSU9rMDhSQ3dBc3p6M1MxQ25iQnRWYjBrWEcrZm5Bd0diZGxo?=
 =?utf-8?B?emJEei8vSkU0cVRSdW9aUVVudkNGV2l5T21JNkJwVjhmZVVMNFluY01IRXZD?=
 =?utf-8?B?U3h3VnFjVHE4cjFMWndKbmp1UE1kaEw2Y0V3RWViYVN0cWNWSGZUZnF2Rk9E?=
 =?utf-8?B?TTZacGpmajJuMGtrU2w5RjFTTVZhL05ydytIWWhwTDBDOENZaGpXRnFBbHRy?=
 =?utf-8?B?MVZ3K2Z2YzNnS3B3ejl2c3V2NjJFWE9IZGw3bXRhaE0xb0FvLzNqcmhaTWhl?=
 =?utf-8?B?N2FMT2hTVm82YlRwc3NYZmZIcXIwdTBoSGp1WU14YXhjSHdaRjRQZVZGanZY?=
 =?utf-8?B?UGt6ZkJyYVMrSklaYStOMnlLeVhzRmRrVHhwdlhucmo3Qm8vWDliOFpmaXJB?=
 =?utf-8?B?aVNGYmphdmttWWFpMVZXYzhvaUd6MCtRNHZQQUxCNE9qdEUyYW9uMjNvc0w3?=
 =?utf-8?B?dVpua3ZhVXJTT3dCNm1BbUkxNUxCbWZEUjYvSUZoREZqQ2lZYUJOZGNxUGhj?=
 =?utf-8?B?Ukp6UHhRVTE1ZlI5cHNid1RvUFZlM21Jd2J6dVd2SG54TFBGL0VaNHhQbWhy?=
 =?utf-8?B?VWgzUkZTKzJvZEJucWZzcEd1emdha0k2VXhnczNCNVV5SFFVUGVqdTI2QlFQ?=
 =?utf-8?B?ZHJ1UjVwb3dPRlpaT21QT2ozNWdmc0dhbTVTV3pkcWFOKzluSEp3eUlqS28w?=
 =?utf-8?B?OUVtczQyTEJtcFJQdEdHaVJobi9rR2VVcXhPL1Q5M2dEOWI4amtEVVk4MlNX?=
 =?utf-8?B?TDhKL2J4aFBBQWVGQjgydGhocTd0S1pVNWxkeUc1MHlhQXBvaDJOS0Y5dVdJ?=
 =?utf-8?B?d3Znbk9CUjV6OFJNNWlKZE14eERLZldWbFdBWVp5b2lEdVRPYnNzU2VZV1py?=
 =?utf-8?B?VGdESE9BR1N1QU5uNnp3UGUzR3ROQmZKWEExV3lNaGlpVUY2UUQ4c0hTM2ZK?=
 =?utf-8?B?NytpeFF6SCtib2xLUkg1bi9td21RZlg3azlxNXJ2b2tIbURKL2pkMUdLRmdY?=
 =?utf-8?B?blljRkZDMHQ2UmhmMVBKV1BNM3M1WUZQRkZWWnpqUGVnUlBWWDE2MENlN3JV?=
 =?utf-8?B?S2xnUGgwOS9qSDIzQ3ZOOXlmUE14K3d6Z0FidE85WjJrRDdhblFjZTViWi9j?=
 =?utf-8?B?ZmRhQjZxVEZWbEJHNmpoTU9obUtWQWZHU0FGVjQ0eHlaWTg1amF6U0tnQ2sw?=
 =?utf-8?B?bHgvLzE1Z3YzRlpqR0haM1BZS2dEN2Z4eFg0NWtTTjQ4ZmJma21PeUw3dm5K?=
 =?utf-8?Q?+aakmNvkwmH/VEI9l3lh9vx4Jx7bFoccEtf3MNae6AW1r?=
X-MS-Exchange-AntiSpam-MessageData-1: B1kiexilpqZGIw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9089450-3c8b-4935-5659-08de80a61e12
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 02:13:29.2456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkYAvY38w5T7PC7vEg99Um2v13EkfOYZFtSJvWnQrhlCd9yDCayo1h4vqMQIB/+KB/+5Kb1szIkG0sSzbX8ZwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715

On Wed Mar 11, 2026 at 6:59 AM JST, Timur Tabi wrote:
> Struct Gsp in gsp.rs is tagged with #[pin_data], which allows any of its
> fields to be pinned (i.e. with #[pin]).  When #[pin] is added to any
> field in a #[pin_data] struct, fields can no longer be directly accessed
> via normal field access.  Instead, pin projection must be used to access
> those fields.
>
> Currently, no fields are pinned, but that will change.  The boot() method
> receives self: Pin<&mut Self>. When struct Gsp contains any pinned
> fields, direct field access like self.cmdq is not allowed through
> Pin<&mut Self>, as Pin prevents obtaining &mut Self to protect pinned
> data from being moved.
>
> Use pin projection via self.as_mut().project() to access struct fields.
> The project() method, generated by #[pin_data], returns a projection
> struct providing &mut references to non-pinned fields, enabling mutable
> access while preserving pin invariants.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

This is going to clash with the command queue locking series [1], which
we will want to merge first. Can you rebase on top of it? I suspect you
might even just need to drop this patch and things will work.

[1] https://lore.kernel.org/all/20260310-cmdq-locking-v4-0-4e5c4753c408@nvi=
dia.com/

