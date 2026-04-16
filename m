Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010014.outbound.protection.outlook.com [40.93.198.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EE21EEA3C
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 01:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776303260; cv=fail; b=bNKt8BPxktTr4lCfapG7cEba1qnjed2/BxCYJH5IMo3a8Y+grKVylX7/HdjnlgAQ9B6lsdKFoPnVHYplkNIlrIcihpuyQVtT58GjrH4OsH5fIrwnTrtdHx7izvBGNUqwCOPFyFwbF2O2ulBCLjsVVE/qNI447qHSyNve7zhtjYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776303260; c=relaxed/simple;
	bh=LD/Jwprhs+EsONGF0u5KUZ1DZ0CBoGh8gLm0Hvq+Iak=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XMKiBRFhYobf0UXyjP9Fw95wUPz174gGFoA59gcVufz/qca5CnPo1ZdYuOQQuaUXgl8B9m4bHLdNMt2vvvEuwDqb8kGrnXXxganC9s0vqlMgP1O6CidRJGmHBP+SUX6rqUOpSFtLdLYIqRi62EjsG3J0SVU+SBlW8jRTvuHU024=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JD2IE+jA; arc=fail smtp.client-ip=40.93.198.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JD2IE+jA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oymn1TTq2ovU8+NVVGEfoNXGbzHED54A/zwU0E6ZnMaxgKnjyT0sE6iThVZ2uPeAm+2TFJEKSEM5nsdsv62ujdQeln1pIhqckXL6qxi5xNY/0jMrtUDhWjZ8NlhT4QIw6BFFoS6Anc0rceZ+Vj1scb+vsS6XKaY7qQix3nHBFJ57iP9k4a1uAAt6RGce3Fls6tDusgGFxaUtB18XXTb9qZO1mTD5obNUC4rbT2mM+NRZHD4+aGVqKlk5uSTo3fkyve/GzqvLX/EQVqkXfEAoGqlxREyQe+qu0QON0YP3i6gGa9zPX2eVh13kroIGAHt+ImPPp4ZkM85fAufdNoCqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzlE2fiYfxR8/YjzVl9XNgOCd9fZfdTxAqIfc7jQik8=;
 b=SnvhwSmBbumTnw4Lqmv2VjFVzCpxjTyjM6G43Xns9tNR1sGzbYdimlCeUbJTWgkfQWDnudKpzYGJiZS2DGbJdnbpbx19bnHA/S7cmNjcktKxt/GyrpLnWpwGjUUzRO5+hiRmByWGcNIsPpEJv5oHfzEbRudCOLHQRcEkKD0yt0lo6VWogwaC14vaexFcDC6fdGwlDZAougdt6W5+nVMEDVYUNJnUCa3bplrX9pbvOwKACRdupewMXQz7muwmL7egS2f5CUbRwsXZmOJtSGlUOTSzqazCZNVAHkTcH04T9+hm6dmPS9NeEdYwEwNXBVV1kWYXMWLzNzQHPW1/12V8ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzlE2fiYfxR8/YjzVl9XNgOCd9fZfdTxAqIfc7jQik8=;
 b=JD2IE+jAwbQNH3XmY+/rneln8TrLBIyui8x01CDWpaYNDEbgwuux2LQvYJf7SOMTy4ZcwewVBKJoxFWsGfB7vglZ9r4AYm9N/MCrKIZflR0GAm7afE1CgcSLNobajzyBe+CQRb6Vs4o/ZYFLLAw/YCcpMBr/qz9fXM6ILe/1T3+fXERLU8p29MxmyBHHXIRKeLlNMV6PiZnEiX1XbijvOgawDDE9LtrKvtMVtobcP98gvF5nQJoj+CKQwZQgbL67D5g9wkRa6/FzZaSS5z691AQaR2MvS59SjFB8jE5YbTly6u/k+vVEWLr/UKQWw1RWcJtLHMZOQNIpTsLT9Tho7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6469.namprd12.prod.outlook.com (2603:10b6:8:b6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.20; Thu, 16 Apr 2026 01:34:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 01:34:13 +0000
Message-ID: <5dc896f1-fa0f-4ed3-9744-420aa35368b1@nvidia.com>
Date: Wed, 15 Apr 2026 18:34:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] gpu: nova-core: skip the IFR header if present
From: John Hubbard <jhubbard@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20260416002619.900779-1-ttabi@nvidia.com>
 <20260416002619.900779-6-ttabi@nvidia.com>
 <9dccf93a-8eab-40dd-b865-368e818ce105@nvidia.com>
 <7a84c308eac2534123534977260c383272dfabae.camel@nvidia.com>
 <279e47ee-ba52-4793-be86-ef24520c235e@nvidia.com>
Content-Language: en-US
In-Reply-To: <279e47ee-ba52-4793-be86-ef24520c235e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0005.namprd08.prod.outlook.com
 (2603:10b6:a03:100::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf3ac42-7a88-4e9b-d239-08de9b5843cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UxlasJ/PmZgaRLcF2ogDzB+ruMUIVUh4YSpGPAtFwGMNJqCR96Ft1ot7RJrWGuptJReBhqmalJI6H8S9HeExs8OxVAysrPBYChcry8TT92S9Rsv/5XfGZxn9UZzwSFbYclbRXZ5rwO2+3I/cnXCH0oDxSi5IHVcqoTUMeC0WqV3eQwF/Dx8z8/SPrZwvCbiq0MQUZbZPTmhw9JvsVpFYPP25gYLg9atIEEBPdW1LfQrrOx2vCaF+pDbcUOgRsBuCHApmu2X8YccHSWiN0b57lLeHm8CQPaNZ8Ta9N4Bzzr/U9Y7bFf9qoFXNErp2bD0XZ3AYZYvtuevTrwx33TQuHao0FQPjJdB26fabiHWiy7FUzTXiGvjROHV3v28lNtuOhQYtDICnoe8jl6W+I5d5CtPmuunDDlhFANYIdLITY8YHWGprh5nOEmTYelMduMuGk/zo7UmhUMlFjvHVVU1dYbioiMS5nqnJ/VDd0gptTgDCzl6dQoFLYFySb6YNyztHV7CFIJK3yq9YB4bcOpr8yCsqPGAKoNVsBa71BJ/W4QXVeKvcgOHMaiEXRF8kQm+6tKwm/euc2TzpmcJeIOHADv5RkGqSRpljbBsIWxqFcB63H9FhxpefDJ9xs6mlKY+1BoK8t12C5Pf6U8aq7u6AAMJXgtYr2zMrIVoQm5t5MDcgpmYFlO2FbicWz2dTZt545q0LV/YrHEjI7jxUyopqcMROkftm9n3g3mfaRztvBCQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk0wTW9VdEVIVWMyYnZWQjdwVXVwNFpTb1RESFNzazcvZ0pLVkpFQTM4YjVq?=
 =?utf-8?B?cVpZenVieW5OVjBJV1h6TnpFVlI0STA3OGxDVWdxbG94b3NmK25oTnVqNG5J?=
 =?utf-8?B?NGpSaHQraFpqRjcvby9YZjZTZStuZVBzbGsybko0bFVDaVpjOW9sUVRaU2JN?=
 =?utf-8?B?TjE5T0p2R1JLM0w3MndobEJPNXc5YVdLTzVUdVFTb2hLTUNHWkJIaGxabjRv?=
 =?utf-8?B?K3JKTU55SXNnTjA0RnRxRWdrZUg1Njh6MVQxVzg4M1B0TnVSdXRiSWcrSE5W?=
 =?utf-8?B?Ynp6eFB4cmsyYjdPLzlUYVljb2RCSXRZWmN1NkllYTV2RGhoaUNPSFVZZlJU?=
 =?utf-8?B?enJyZ3lVSnJiWHVrQlQySUV6VWVKemRQRHMzUm9vUVNhTHRCa2ZsdzFKNXVL?=
 =?utf-8?B?K1BWUFYrSzJhZ1FXdWptM3pKSUFZMVZPdTg3UWt2UG5KazNFdEJlcjUzMGNQ?=
 =?utf-8?B?ck85bWZnK1IyM2FnZjV4Nlc0alh2eGdhQ1c3ay9QVUVTUUcxNmY4RTFEcjZN?=
 =?utf-8?B?OGlWMEtkaFNNdFZlbHZMeU0xa1dyQ1dVSnF2SEdwelZ0SWpubUhSK3dyaFJo?=
 =?utf-8?B?QTZ2a3FpZ2JuOWdpVGNBaEpUbGhFZCtvZTIrbElJUlRzY1dDQm4zS0NTcmhM?=
 =?utf-8?B?Rk5weHRrQ29VVVVNbFV5VFZ1T0FueGdmVExWN0tsU2U5aG1sRkhPRHBiQWRo?=
 =?utf-8?B?bGpveHpSc0g0ckdSSjNTZHJvZ0U4RkhJUmZLUy9IRkpNdklhL3pGeWVrK2Qw?=
 =?utf-8?B?YWIzRk9EVXJISVRyaElSckMrM2RyWFpJMkxpUE1xSDFnb0lyR2RDazZDLzBz?=
 =?utf-8?B?SG9JbThoUU9NU051bXFxQ1R4djRSb25qaHVuNUFWbGQwc0svcllHbGNzZXQ3?=
 =?utf-8?B?blVJUEFrRHVOaGd2T2Z5dGZtTVc1TGxqNGtheU16MEN4a2J4S0NkRys2dGdS?=
 =?utf-8?B?bTFmcEFGUGJpeStGcHpQT0NJZG1vcFo2T1FaUGVUTy9LNlZhbGxEM3lmbUNt?=
 =?utf-8?B?aE5YdW4xTGUwSU9PSFNnVE12NHZ3bW4wZmtUbHNUcHV0NzJRMWVFamNlWTYw?=
 =?utf-8?B?bnBYVkd2elBFWXcvb1p1UXFiZXBuYlArd0Y0WHljd0hFTFRMdDUvcG5ML2hL?=
 =?utf-8?B?MHZ6SVp5eTFvMlNUUHR4QnBTNW9kWjlzZGp1My9IR1YvRDNuY2VZSkltNjZ3?=
 =?utf-8?B?aWN6QXV1SEQvUzFWRDlFM201T29LaWI3MWZRVFdoeTNzd0YycEFuak1vRjNT?=
 =?utf-8?B?NnZ4bmFkbzA4SWk4Wk1ZVHFTQkhvVzNua0NhUjVOMEtLb3NjV0xyTDdUd1Bz?=
 =?utf-8?B?Qjd0ejNEWGlQNmpOUSt5YXI1K2FwWThyQ0VhYUI3VkI4MjcreWFFNm0rejdE?=
 =?utf-8?B?SFNpUmU2Qkpndnd2MXY5VTRCN2ZQQ1dUcnlPUTNrdnE4akxFQ2hERi85cWZl?=
 =?utf-8?B?YU9hOUZRblNQcFhFM1VGZWhudXRHQklkUUFtRUc4K2dEdXUzS3YyaFh2R05z?=
 =?utf-8?B?YlNUU3Q2OXlObGZuLzQ0bTVhQ2RBa21NRFhvT2ptb0x1V2RseTVJV01kSDZQ?=
 =?utf-8?B?V0hYMzBiVmNGZ3d0OGlXQXJ2bGVnR04xYWtvdHA4ZVFjeUU1L1ZQZkVEc0tm?=
 =?utf-8?B?aWpocFBGZ2pnQ1cvcmpZM3lxdUdxZFczV2lCWi8xQkI4Qmx5SUxDL2JmWTNX?=
 =?utf-8?B?VjZsQmRPbHlmR3hCYkY0eVlKV0krdkN0OVp3TXQ4bzlCVDlWaWVLVzJFMXhm?=
 =?utf-8?B?N0crQ3dKTWp0cW1PaXVPTFNWYklEZ2RucEtMb08xTXl3YWZXL0dwWXBOQ1E2?=
 =?utf-8?B?a0hmY0hzeGJWZFBGRDNsQnlnSkhhRjdiZWEvNERWWUVtUi9RMDZTWEVwM0pR?=
 =?utf-8?B?NU1KRW0vdG5MVGp2ck4ya0VkUUZnRGo2Y1ZaaWpadHpRRVBnNHlpSVlSRU5j?=
 =?utf-8?B?aTJqbStTTW1lSk5Cc01ic0JtQ3VPcFMwUEU3aDJUUDJ5Qmc3Nit0WnRmK1NN?=
 =?utf-8?B?VkptanI5RFp3OC9tcndEcndhOWdRVnZYL3gvWG42LzZQQUplWEFka0Q0WEhw?=
 =?utf-8?B?dDFIYnZlRmdsQU1LOU4vN29wR2FvTTJHQ0tWZUxhdkxDeDV5S0pDY3BISmFh?=
 =?utf-8?B?QUtSMEwvaDNlNTZIeE0wdm52aWxaUjZSNkpLZW1YNDBjMkFXSThDSVVnRk4v?=
 =?utf-8?B?bXh5RW1qejk0dnA3UGVlcndpYzQ1c1pxWUpiZ3NUTlU5R3lrbVlwMW5BcnVN?=
 =?utf-8?B?UVhHNzJrTTYyU3IzVnM0Q2dtU0JKVnhkNHpkb0VxRzFtTyt2cGJZNFcraCti?=
 =?utf-8?B?R1BlN015S1BXRi8rTGQ5djZPQ2FvWnBROGMzSEk0R2JPbXFhTXk2UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf3ac42-7a88-4e9b-d239-08de9b5843cb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 01:34:13.1776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3oTGONf+uK8zqS6vntVvX5SX/WOHggvEHFHc+8mlvK41bOy/HsldELwgHovCpBszAN+fqjWzJV1v0zOsQ/hjUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6469

On 4/15/26 6:32 PM, John Hubbard wrote:
> On 4/15/26 6:24 PM, Timur Tabi wrote:
>> On Wed, 2026-04-15 at 18:21 -0700, John Hubbard wrote:
>>> On 4/15/26 5:26 PM, Timur Tabi wrote:
>>> ...
>>>> +fn current_offset(dev: &device::Device, bar0: &Bar0) -> Result<usize> {
>>>> +    let signature = bar0.read(ga100::NV_PBUS_IFR_FMT_FIXED0).signature();
>>>> +
>>>> +    if signature == NV_PBUS_IFR_FMT_FIXED0_SIGNATURE_VALUE {
>>>> +        let fixed1 = bar0.read(ga100::NV_PBUS_IFR_FMT_FIXED1);
>>>> +
>>>> +        match fixed1.version() {
>>>> +            // Note: We do not actually expect to see v1 or v2 on these GPUs
>>>
>>> Then why even match for it? No need to "support" HW or FW that doesn't,
>>> and won't ever exist, right?
>>
>> As I tried to explain last time, I'm not 100% sure that we'll never see it.  It's just a
>> footnote, based on my examination of various documents on the IFR.  
> 
> I missed that, sorry. Let's either delete the comment, or else water
> it down to...well, I don't know what. Probably best to simply delete 
> it, otherwise someone will want to delete the code.
> 
> Either you think that there is *some* chance that this code is not
> perma-dead, or you don't. And it sounds like the latter.
> 

...ummm, let me reverse the polarity of that last sentence. :)

thanks,
-- 
John Hubbard

