Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35E237B3FE;
	Wed, 18 Mar 2026 19:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773861296; cv=fail; b=QQ224UnCqpYDntsn9YcJ2GriLz/TcOotgp/b+Q+j6JyyHDi0TGOBGPLZpbxOA753PdSZFLzvXetRHVVOTNu8jDh4zMlSoADqu+dnkhYD5pPpB7b9NLTDKEibTxbf8IdF+uNmgyxkwdKkuXaz3Q8dZlCk4fAomLcbpFagCB9wQS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773861296; c=relaxed/simple;
	bh=opBDIBdE19yYRVgLVWfFUDcfxENfRohNeF3yxQas1aM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JcJXM0/s/uKd1xhtFgRGl55QkIAZ1/SK5Qv/ie0cWSKeGAEZ3KgApzjfwqiYdWpyC/emxUvPvbJ+lEJRmBaPHPTJAkdR30xXR27ZiMQKADivFlpTUYb1A0BPDxGNx3TToWVwaHeI+HdPHaBtKw/WcbTk4aF8S5zttERRqp06znI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R63zl5QW; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R63zl5QW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHDNy1pkNoJzxyIkPSiG/aKqXamyp5ixFYe+VJqhxjU/q2H8g0tP+6bcEN0wO+LNi106FE+aNhoE7T9th8CkVYn3Hia9/Kp+2oaQZCX1K+h/A4BAVC8F6lCENsHCb2JLB8dBksr7Y5OgETx1Ud42a3ZOpZhS26e+cWdRo6QmiI02cWV9JY3aSqO3Y2FYWbpLHbsdpy6KqfKn9wzcKkWJpsmMyHeJhSJEug+MfqQ9QzRW5PRT6M9coJ2Nuv1fj47pbl1/TIjnvsOytwrCk2NIh6JyOLGOdi0Bz08nPFl2eDm3eLnotvQ2dXXyNK1+ql9B7bTrOepedBRJ2sDoFMBa/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foAREIQRBEWGpOoVs++CKicJ44urthMMeHDPPn6h9Rc=;
 b=JOYMgbv/GTWNeLDLmQoJWb6UjU5DXJi0I/o9rQ6lAYaOYqlLxbiasT3RwS01UX7nAVr2zyOBTJZ4AzmrocnQCqhHXad8dM66H3cYgs0TVemls84Rtorh3jDBlgWgO0D7Gz5yqjkrNGIKbGe4OaNcAYwZLkXYWoNWOsE7RVuY5S4WejH2dcs/LFppYaR90xfOqFK2PjlbA4mJGk36J2//1VmiES8Ix8h2EV2tUhokvMPhHFpaNys26SCDjRwA6rcqZaoJYsyq0yWZwWytYYL4D70wqWxkqZvP+A3l+XV/m68B7gkGFLaKDr16DEo2UYy1hmMjUtqwjt9Fuh5nILubBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foAREIQRBEWGpOoVs++CKicJ44urthMMeHDPPn6h9Rc=;
 b=R63zl5QWsKyLTzF30mf/7UoW6o7KsNUYGrlCoxxLd7y79BD/OF8QPTRZSM4Bqkmv3OIDEFXdTgT3mr9a4oxCdHOr4/u9gLV9oOYaOtnq1q7OtNxT7fK40CKXL7B3Atbs9IePubXbqo3QIibzZvAT8MwXlsHrUCEkePGXaEJpsmZrY3jnN/2NoiBwcR0SmUvjzwG3yCWFKYooPEOSDouoUYZjSfxVilEZ9TcQ4DQ6W8OxwnO4kGs4U9pPurbxZ3V8kniFiZ/lfCvk+elgrTqBEqeGFjIv8rFmga7xjLl6MTAOjcTWV4hCT8/aL1pvpdtIITjctCYqPMXZRPmqIY/ZAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB7711.namprd12.prod.outlook.com (2603:10b6:208:421::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 19:14:39 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.007; Wed, 18 Mar 2026
 19:14:39 +0000
Message-ID: <f064904f-647c-403c-a58b-fc8888c0f5e2@nvidia.com>
Date: Wed, 18 Mar 2026 12:14:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 18/31] gpu: nova-core: add MCTP/NVDM protocol types for
 firmware communication
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-19-jhubbard@nvidia.com>
 <b6d58cbe-a375-40f4-ae70-a3d7344160e5@nvidia.com>
 <DH5H95R3ZKJK.3SMHG8B4JP051@kernel.org>
 <DH5WVJLR9I2A.335QA8BGKWDZ1@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DH5WVJLR9I2A.335QA8BGKWDZ1@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:a03:338::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d79dd4d-7911-4e4f-ad63-08de852299f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9j0Z+PYi1aNlixIK3CIjCYSA0hnOfmUKewjo6LmD/i47yPfJEmu3JGjLRMXbawQW4xiVTLMmHfRSWWt8Hy3rjTq4irRRUblM8kePkSG9cokvzS/xCUcyNkZr4HopKuC0IQlCWBDQw6g9ZYkCdV6XAeOuAY8v3kR7uoPyGkxTAJq8QfgpZwbjv+klWr1v6G0MlYa9gBbaJ3w/LFSKdN60RWqClTNBKVDExb5nAGyZfdL9/UCZvyuGqACHcospjlPixP3ne/yRJ+eWAKVoDGx33B3QhyF8YXipSEuVOhzt1xDozBi+mjZJmYp4upa1zZS5slOtvqY0IjeS27XRioFjG1/ff4xAJ9igaHp7iM0Ce8VUmA51Z5pLjzf60tI7ZkEl4phvWbufmO21QOK+o0zEEvAVIwUQSTJh/yw9EnB9oZskaIVxVg2IVhzsmrSrog/biBiT76I0GpLma2zdVvpJiOwLANWtXKhTSJCY7FU347zAaxcLCBYM0RG83uLjYjtnzVCWAKztEvHJg/9Z+GUUJ6P3jAgw+f8Hw772uk5hgxJE6HuYUf/d5o6woK9S3g2cMIPheVrLuVYxSkl5aQvDOTDURiQK9vZjtf/pdeDBBzKXX2+Dw+dxbAgCe64fY646EoxWu8CjyFK9+2Xr0bM8A/6atfC0vE/rbxLaM1/alsy1WM2jClt4smminlRO0wRyxBJCqmepCgHhHWTjrAyYb2tR4WSrQPyqGbBoC+w3ajo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGhKVHRrSmNGNGRPRFBIYjFRRXY1VVl5NnE0cTBnMkgxYThqQ3BhZmozTkJV?=
 =?utf-8?B?MkpGNm8vYXZhVTdrZFFoZVhibENEYUNPUXVjaThwVVRwY2psVEdESlVrNkxM?=
 =?utf-8?B?djh1Z29tMVFhaWlVRVVHdnJBUDNWalBMVnBBT2ZFdThPZ3pEbEk1allTckdw?=
 =?utf-8?B?Z2pZMTYzaCszbWtqNWRuREQ0WUdOVU52ZHJTcTRwS04xNzBZVTZtWGZyNE5t?=
 =?utf-8?B?UEhvNUdSMkdQT0c0OEVvZUgyVmRITitOeERDVC9abHRHMGUyKzRRcG55RURG?=
 =?utf-8?B?RFpLbjFaZGRrbEVRSmFLU3RINlBXUkRja2Ntb21FdDdDOG5Oc29mL0JabmVZ?=
 =?utf-8?B?UnZFOWRIOVpaUlUzb2dIOUVTK0JFa0tac3RKdFNNMndkSStpZHhlUnlCVkNp?=
 =?utf-8?B?a01xNzZ0ZjdMZ2trMWszbXJudDRob1lJTGFzMTlYY0VQekRkU1JQNXV4QXYr?=
 =?utf-8?B?c28xR1Zjc0tZU1pnNnRVTUNoMnZ2eUZ4R21uakQvOXlrN3BDN250eGdIM2V4?=
 =?utf-8?B?VHNqVDRWZ1RFZS8xWktQa0IxUjBKMllYZG8rR05ROVlieE5pZHNOTTF2QWI0?=
 =?utf-8?B?TXVwL0RiV0FEcVFGZmFzZVppYnVNaFRFZWpYVHFiV3hGMDArU2s5ZVVHa08w?=
 =?utf-8?B?bDQwM1BkWlFtNTgrTytYTFdGamJZbi9qTjdVZzYwUEtsZVdESVlzb2RBbUE3?=
 =?utf-8?B?b3NKSVFNN0JuOFBaVHNld3pXMkF0TUtmUGVGQ1E5djhrYmVYaHBVQ0cxWXN0?=
 =?utf-8?B?dUlMZ1JyUVhRUFo3N1UwendYaS9YSGlOeG5tdDhDcXFuODFsUWhhYUhBb2pL?=
 =?utf-8?B?QlNxUlJoRG9nVVZWT2dlTUJKMFpkcGZwTjl6SWZsT3Nla0RyWGl2N0VjM01X?=
 =?utf-8?B?NXpDY3ZVcFY1clRWZGU4WXF0ZXBwZldkNFduaHlLNTVpY0MxWXRtczhNNkVh?=
 =?utf-8?B?c2xDL0ZlWGw2OGhlL2NYSDRMeEdacDNneVh2c1I2L2t2MUp5K1VnSWFmdDNJ?=
 =?utf-8?B?bWJPZHpFWk45YWpFOTFmVEwrcDN5bzBTbkdMODJrNmZQZEM5b1hqbSt2U0Y3?=
 =?utf-8?B?ZnRzMFBjSkQ4S2lHUnZkc0ltR0Y0cU9CRTZRbExPV0xvUDVDL1YvRVZyQzRP?=
 =?utf-8?B?MmZmTEZGK04yWkROb0JhY3JQd1Nkc056a0RpK3NUUVlWUi84dk9OdGRxTlo2?=
 =?utf-8?B?STZCSExYcWEzOFVEVzFTSUdSUHVxZUdRQ0xSTU1CZmxiK0ZEOXJReHVuLy9q?=
 =?utf-8?B?VUx6emhaenhMZDNJYzFUa2krT1JRMU5EbWNZRXNMQjl1Ym82NXNxUUxLMW5v?=
 =?utf-8?B?MG1XOFFBcWF6Z21uM1htTjJGbHBnN2I1MmdhYXMwYTJML3dyd2hqQ3lLdWYx?=
 =?utf-8?B?eVFWdjJpdk5ZZ1RoRWJBU1crTTVnNzRVZGU4K0tyQUttWGRZcjBCY0tpYjRx?=
 =?utf-8?B?K21rbllBOGo0ZFlONVFpV3lrVm1aZC92SXNaOWJlUmY0OFErS2VWQ0k4cXlG?=
 =?utf-8?B?dUNMeG5PWkc5THJQSSswbW1Cd0RCZi96TVFDbEtTc1VnMU5Mamc3K0FWSDVq?=
 =?utf-8?B?cVNDa1FOa2FiV2QrSzZ2L3kzOHNKNkRLSGRwd2lORkQ0VFIvMUp1M1dpQm9k?=
 =?utf-8?B?VlMwWWJSaXo5UjdyNW96K1JtaW9iR2o5UkZob3RRRm1nRUxPOTlnWFNqMjht?=
 =?utf-8?B?SDFRNjkwNjdUUFAwMng0NW5nVGlMc2E5UFhWN0hVZXVmcjBXM1N3bzJjRldH?=
 =?utf-8?B?OEtYT1hsSXBpZCtjck9MMFdHdkNzZEVveW9IaUpGYjNZQWcvOERBdlFac0Nj?=
 =?utf-8?B?am92TWhsWEw5bFpITzR5UzNkd3ZiakhMWHVqUUJtYXZlZnJxVEVtRU1lTmVt?=
 =?utf-8?B?UURCYUx4K2FBeHZXRGNsdnJIZlpzWmlTdHdkWW9hbkxxU1dzaGI3T3Z1VnpK?=
 =?utf-8?B?aExUL28vTk9HRjd4eWMwN2Flb1JScTVrSDNhS25paGZ4YUg4SFpHd1M4Y0hK?=
 =?utf-8?B?dGk2b0VWVVUycmlCZ3RDOTBpakx4aXlQWXlMS05jNXhNQVhBMFl4SWZ4d1dR?=
 =?utf-8?B?MGF1SlFVZU0yWXBPdnBQVEpDYitPQkF0OHZ3enB0a3A3Y01VcjZ6c3g5eVhi?=
 =?utf-8?B?OUNIdy9Bby9WQmZZQmRWVklnVFR3RkxzYzVQd1BFaTdkazg3YzArRXZCU2Vr?=
 =?utf-8?B?ZXk0SGxkZGhUWkI5ekp2dDk1WlVTeXphYzM1VkRMSW5VNFlBcCs2cjd5NEgz?=
 =?utf-8?B?VExobjUzQ0dYcmRoRG4zV1pnWUUvc2F6ZDdxc0J6QjZaUUg3czVkSFZVY1hV?=
 =?utf-8?B?NTZ2UG5VZGk2TzdsZXJmY2Y4bUpLRThIalo1WTBPZU9CazlDMDd1UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d79dd4d-7911-4e4f-ad63-08de852299f2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 19:14:39.3831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYsio0RNdk0NH+Gorq1bO3pqOTzzqoFEAbt12cIUIMZqhmkFmWVp0/JGfaOAF9Nak0hK4aVUy3+wzLMWx8icHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7711

On 3/18/26 5:36 AM, Gary Guo wrote:
> On Wed Mar 18, 2026 at 12:21 AM GMT, Danilo Krummrich wrote:
>> On Wed Mar 18, 2026 at 1:01 AM CET, John Hubbard wrote:
>>> On 3/17/26 3:53 PM, John Hubbard wrote:
>>> ...
>>>> +bitfield! {
>>>> +    pub(crate) struct MctpHeader(u32), "MCTP transport header for NVIDIA firmware messages." {
>>>> +        31:31 som as bool, "Start-of-message bit.";
>>>> +        30:30 eom as bool, "End-of-message bit.";
>>>> +        29:28 seq as u8, "Packet sequence number.";
>>>> +        23:16 seid as u8, "Source endpoint ID.";
>>>
>>> hmmm, I seem to remember my very slightly younger self insisting
>>> that fields be listed from lowest to highest bits. And now I've
>>> violated that in both headers in this patch. arghh
>>
>> My now slightly older self still thinks that what you have above is actually the
>> way to go. So, I think your current self intuitively did the right thing. :P
>>
>> It should be either
>>
>> 	31:16
>> 	15:0
> 
> This is my preferred form as it closer to what hardware world uses and the order
> is consistent with most data sheets.
> 
> Best,
> Gary
> 

I'll let this patch alone in v8, then, as the most important
thing for me is the bit order. I don't worry so much about the
vertical order in which bitfields are listed.

Whew, I do hope this (along with my recent rustfmtcheck sins)
are the only remaining items. Getting close...

>>
>> or it should be
>>
>> 	0:15
>> 	16:31
>>
>> with a strong preference for the former, but this
>>
>> 	15:0
>> 	31:16
>>
>> still looks pretty odd to me.
> 

I will concede that the above is an acquired taste. :)

thanks,
-- 
John Hubbard

