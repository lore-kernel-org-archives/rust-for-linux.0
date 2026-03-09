Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010062.outbound.protection.outlook.com [40.93.198.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF858301701;
	Mon,  9 Mar 2026 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079522; cv=fail; b=NOdbfv7W0nJZz15nWF2DlghmGm19jCFr5hdPOHjOTxAwdw8v7eGM6rR9Ti1YfRY7jUb9I99dWjL47v7bYUhAzB+Z3a5ZPD2Fa8z8JgQk8niPAkwrkdiGYMyxtQGafTIv/VDZpaLAJVcjY7R21E2hcbsGJvGLDQfXUAxb6EDMmCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079522; c=relaxed/simple;
	bh=dh6vpEt6Ug4pe6HhQ+TatPs5BUypbuqgJKemt7bJyIw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LR7FR9wOUQB8XzY9dfbDv/yGIpFI+Zjx8riW8FwiLDKimphYFnZyekNg66BS75BS/rXhJuZshH6mTwVc6K2TOJsMM4JHoDkIynhJYi4PpPX1FBEVarVtnRhHKH5bK0+85v5c1pKf7Ir6EOG0Flfv0+5V2nVlvHBN3j2Ob7qvOh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nBbsnDsJ; arc=fail smtp.client-ip=40.93.198.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nBbsnDsJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kcw7KkRaTTt74grU91qz2UF3f0qXsLoHyjj+grFqmwPjLK+p0NiO41U9MMm29VZKaQys60F491bJvQ5c9xIKqvwClx9UYrpIISED5xnxEnR7BkTSxIkFGaRZh+UjPr5UtnHika5JrIX3iMh8+c4QliZZfJWTo6LidnmFUq5NE5pNWGKh+mlLUjb/onV0gVJAgHwmsaW3Dbhs5dFY2UpEf05/nNaCH9TPHegHyfT37IuryktvQchAh4Te/7CQJHSM2kxO1J+AfUF7ATP1MRdZhooE33kzhj9qaiW4/m1YmIDjrwR38ROqVI1B9pjg4XAPaI7s5eecAgBHKhEnlZ8BZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjzbC98Oa6A7X0P+t/YOhU8Chcvf40lkz82tsQVa6m4=;
 b=JIN1ugrCx43xLPC3juVId8fXzyl2veqtxV58CnPuku1OzT+HdfeUIrxv2taRnYubmcdob4ZusgpJM4R8P6EhnhieTJ2qqvF4L4Eo6wy2I776EO0aWeiayXm93FQfvTfPZ9tNNHzAseCSxepINyNq+WkCmCo/xhIbVqnR6XiRkbynlgRorCCjil1pMsjN3MS49rFAAcqnWXrHUHXanpgun2yypDwGYGS5jc9XHMqwnGqEUZ2v3JnlX0ubEbDVyTlXAK9x9fY/ddIYJxEnUsvXn4+gVBPrPeF/3u3tZSK7ewAlAruXxfVNEVtHEkdL6EOQSD0yXepYyLMJ7NdESTOVBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjzbC98Oa6A7X0P+t/YOhU8Chcvf40lkz82tsQVa6m4=;
 b=nBbsnDsJdF1hwQZnrPg55ZxNTeu5NlYn8bhecZDExiomj2AC1QhR8/u07wgaMYg0htFiAgpztpSNWkjLmqEk7CZi4/innROG/UabSpMJ5X0pLZu2mdzHlBltdKWC61HsWLtt1Lu60SWQWlmYA160owzH0PyZq5R7D3b1oPsbOgTAZZLX9bc34HJAnbWhVuULLdQyd8qmgUeNTEQ55M8gtGrvc8gZpXYCqkA+AeJpDDkNU5rha/vfJ1aEqzxvWnf4Os90XEdr2dWu0Ph2V5LHfLzN+m7AfCf/2/f5w4uiNUvMTlOiRiOobjqgqz5DZ3Epf4ZCDVJP04Ncsp8aDqpqng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7109.namprd12.prod.outlook.com (2603:10b6:510:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 18:05:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 18:05:15 +0000
Message-ID: <ce90fd70-09c9-44f5-8335-f81fbe8f702e@nvidia.com>
Date: Mon, 9 Mar 2026 11:05:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/10] rust: add `register!` macro
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0044.namprd02.prod.outlook.com
 (2603:10b6:a03:54::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5aef4f-2ad9-4d14-7c8f-08de7e066a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	UJqudYeV3XKRbcsiQv2qOo4I0v9Upd6a9SQLx14wE1F//WAz4at420Pqw6m5rsYRoyGXU4nzi/2TXEDnAfqkCMtBvb98V1HvipdDiOdi9dnrnE9ACcxACMQOjq2G4LfibPGJo4onjeAhyVznvHDHcvdLUnL4FlrMTjq9ED9iQ50mnlMppg5sJOLV3hBas/0oA4z3ySb5t2ekry1BFSoyr8mZCnCTuV/lPGXNfNoDtx3CsYIV66N4Wutmhug1AcD7MvPS71wjM1CGjbKhlu0WROb9vPPSPpRW9znoXq0Dc6MqV42tn58d2kvVw2Csi0v+BCrrqCZh2imi9wqRM/G0qu8QafTjmGLR/9AnC836xC0v3VYdsPNq9BxZ03tHsSTUwngSs/rAkpbjoWnFb4hEbTJBJuU1B2e3BNKrrUS106S4VW5pGrAk/P0edYNQfo1+4UGx3GKpoS3WjNhUVbQKWpt63COd9tXnuCAmAKH5qAs6KzjWUcarxJo9StQpa3HO87RVf10Dp2CTIQjJVLETlIxAIPLr+JepReb1UsVKZMJ0aYdJ9i/HRzsA2injg4Si6LcYq9nfu7HOhzdJubt9X7qWS+1SFTUV3zosrctGbdeTtZKFvgZNIbiKsqSrnMu7r7Dp72MAPlx+KYDzLsa44NvtETPrxOl0GHkjMcrE+QywK2+oYOn9aj81naY0/oiPZ0LHquMs1LbeE3Qh6JcNF7y3a4TCXPaQGLZO00jjtzGxITIYV/uyQBakpjVCshSM/+A6AH2jlZAyknkshuOyJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dis0RFRyWElyWHVCVjFwNkdsWVcwTEZCczY1UG5BUzlIdExEOVdENXJkM3J5?=
 =?utf-8?B?UjFmOERyVGtZaVVJdXlLZE80akFGTWJ4RE9la28vL3FUQ0E3UE50ZDAxZGNW?=
 =?utf-8?B?bXFpMFlML3JCWDlZc0U5M2o4MERldXFDeC9OOW1JUW53RmdTYm5Bdkx1ckxG?=
 =?utf-8?B?ZmNycm1Lak1FRGhxRksreC9lSXR6UHMyUEI4VVR6cHFvUWdKaXZMb01vWTJ3?=
 =?utf-8?B?K3E1U1U4YlptRGkvVGFLbUlZZm03RUtsR0pmZGsrVzc1QUFTdEFzK2xMT1dw?=
 =?utf-8?B?Y1RQQm9jbEN4OWRlZHBucm5JZE5POXNUM01jTmFtbU5Bc01KK0Q2elhFZkJi?=
 =?utf-8?B?dFNhZUlsZGhuRE5FSkFZMSswSGtXVEFWK090M05mY0UyUnNtVFMwWm9MWFo1?=
 =?utf-8?B?QUtOQSt2Q0w4STF2UEZsaHppb1lVOHpVMUt4b09vS2UvcEdsTENSSE9VLzhN?=
 =?utf-8?B?b3Z5am5na1p2bUtyalhXeEY1UkJmTmp0MExjZm8zN2tmdEV4a2d6cG5nUTFy?=
 =?utf-8?B?UmhGTmhjS2dSOGQyMm11Zk1sTlFFWXplbzhrVlM2ZkJmRjQvNW5VdFRENG9D?=
 =?utf-8?B?OG9hUzk2bjMxczZJZWd4U2tmM3NtV2orbWNUTStEWnNNNHl4ZGxpOGZ5YXZE?=
 =?utf-8?B?SVpBUk5uMzlqanlBVlEwdVVPeGJqZ0NpZFZ5MysxTjhZZ04rdWZ3YUJETkMr?=
 =?utf-8?B?VVVoZWFKTXpXZkcvTmZBZjBOOVhwQUUxTmsrMW04cC8zMWNsMFJ1SUxLSjNi?=
 =?utf-8?B?RExYblA5QzNVR2NKSG9MR1FZUU5GV3k1RnA4MXV3SzFqcFVZU25EQ1RLMnlx?=
 =?utf-8?B?bnhrYmlRT2tkVElpd0hJVlBuTnkzdFpNdGdwVEJoVDFvOEJycHhNMmVYV3Jo?=
 =?utf-8?B?bXdqMDBsQVNLdHRrWDRJWk13OE9aTTVXYWRSRjBUT0V4U1pBckFmb3pEeDE0?=
 =?utf-8?B?NkZwR0JSTnMrVVd1c1lzMERsanZNeE5MeE1UUUFrYU9Bck8rL01QWkZLZ3ow?=
 =?utf-8?B?OUxvUHlrMXZycGJVc3NVWTdVU1FyV1hUSDZ1Yk9GcTN5YWZkY2w0amNpMFpF?=
 =?utf-8?B?Um9IRU40VW9hR2dVdEZRazk5T0ROclRqSHhMc1QwZEIrNnZxRGJONEFBYnow?=
 =?utf-8?B?N2xCejVRd2cwNk1laHc5bjY0YXlDMytNMkZ1elpkRFRJYkU1eFdmUGhyREJ2?=
 =?utf-8?B?Rmc0TG1WQXd4SjluZ21qSHo3THIzWUdyRUx2Y1hkZEZKWWl1T3NkcmhaUWNN?=
 =?utf-8?B?Y1ArbldocTdJN2RGSktqVnNvWENMVTBuRmhlQnAvYWtLQndEM0tnQmkwbVps?=
 =?utf-8?B?QlFUampOTkFuSGF1SVBrekxsbVVWOFgxSjY2aDNmN21HRTBNTkhUKzNnd1Z3?=
 =?utf-8?B?SjMwSHFDT2c5VHRibVhadWR0NVVIMXFzZ2pzUkV5MUJLTkFPMEJuMVFqZ0hX?=
 =?utf-8?B?enE3b0t1ZktsbEVBc2kxQWlaSFdUS0lzMjIvL3pzRVFIN2dwRkJid0l5MWlI?=
 =?utf-8?B?Tlk5MnpwQk5pZ0M0dEdxa1pZZVVId2RsRVlHM0ZCU255UlppZTJzeVFEYllw?=
 =?utf-8?B?UTlVMW9vczhqLytqTHlzMDJtNEx4U0hpVjY2VWFLY2ZwNHo5eDRrVG9wR09s?=
 =?utf-8?B?ZkhJRnA5dGIvUFltSzJQU3JiR1JHYlU1Tit2WlBBRFVJaUlDRW9iTkdtYlFV?=
 =?utf-8?B?YUFCQmNkTzhVNDVvRjRIZmd6Zmk3WTBmeVVpbjhZTEVtQ2Qwd2Q1aGlNcmQ1?=
 =?utf-8?B?V0hUSmdpV1Z1eGV6eWw3R3oxTUFSdW5UYTNPZDU1OFBiTGt3b3htTXlNR0NR?=
 =?utf-8?B?SnBCZ2wyUENyLzRRNmZ2WGozWVRMY0Y2NHlFc3VDT0xLWEU5cEgrcGRsR0pC?=
 =?utf-8?B?UEU1MGJ2NUg0MStsNmlsZ1hPaDNSckFaYlBiYjdXQjdFQ01iWUJHMkdZMlcr?=
 =?utf-8?B?Rk5FN1RLZVlLVGg1ZU4xMnVRWEpKTlVzYnRncEZjdTZyVG9CL2xYcUphQnBL?=
 =?utf-8?B?Ni9BcXlXc0xjb3hmMHBYRzh2UExXREJ1UFV4aWV1Zi9lOURZMWg2SjdsQlBI?=
 =?utf-8?B?ZXhPTzRqeUpMaTZTUk1jR052dWk4KzArQ3J6eSs2bGVjSE8xUVVMTWsyWUJ1?=
 =?utf-8?B?dlhaRE15NXdKZWtCcjRLWEpXdVVxakpmVHcza25SRkh0SlZvSTliTUhYd3JW?=
 =?utf-8?B?dnh4UjlRRmVER3pVc2FnSlJBNmswQ0UwMHRVT25ZdUlwd2JFUW42UVVHMmFv?=
 =?utf-8?B?aW80Q3Z4ZDFSYzZiL3NtYTYxUnNUUVFNWGVNM0JYUXA4MWFIdHZYVGwxdmEw?=
 =?utf-8?B?R1ZyVXBWZ284YXBMbWtSSE92UVdZbGFmRjVidWVmTmQzVUY3cW5lQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5aef4f-2ad9-4d14-7c8f-08de7e066a52
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:05:15.4181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iU1HhLUlamG1ISWjnQGonUHnEpxk2lZCDPaEcB+FBncGJ2SLu09iHR6qIkNt9Jvir9IotrMAuweNbNhFptwM2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7109

On 3/9/26 8:13 AM, Alexandre Courbot wrote:
> Another revision, another redesign.
> 
> This one eschews closures completely for write operations, and defaults
> to a two-argument `write` method backed by a single-argument `write_val`
> one to avoid register name repetition. The two-argument version can now
> be used in most cases thanks to a clever use of traits (thanks Gary!).
> 
> We went from this syntax:
> 
>   bar.write_with(regs::NV_PFALCON_FALCON_DMATRFFBOFFS::of::<E>(), |r| {
>       r.with_offs(src_start + pos)
>   });
> 
> to this one:
> 
>   bar.write(
>       WithBase::of::<E>(),
>       regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed().with_offs(src_start + pos),
>   );
> 
> While slightly more verbose, it is also much easier to read, as the

Yes, it is! Let's acknowledge the progress in readability here, even
though we are still working on minor details in the other thread. :)


thanks,
-- 
John Hubbard

