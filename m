Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012028.outbound.protection.outlook.com [40.93.195.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FA72D6E72;
	Mon,  9 Mar 2026 17:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773077668; cv=fail; b=tEbmnmhsjFkdDxJUv6mNk1+jLSpWhGTfEtMc0X83c79m4RUNIkv2RHggPeLzd5g2TzWuZPvBmn2Wq/k6/jU1C0M9JIlUGylvy4oPXxZD2BwwVWMl08MPfRx9SAtNr0wp5g+d+As0Lo8MxvLLUa9dxWjNbfauv52jjEED+kY5hQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773077668; c=relaxed/simple;
	bh=TFoy7ya29Omyz8vC15rXC/YNhqD+xr9th4AiMW/un04=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=islPJowU5TD85/YzC6J4r9ehfitSbfrWiAbUE+lpUdGz+vJqXDTKUPZiBOUBAlR0BAuYoDeB2KvPLZpRj6N5Oyu/0cVFqBTTY2gYeul7+4pRjKXbeUzJ5w6w/Nj1TPDCPEQHWiqWbTjJFOfNO9pYQXUS5ZrC+TFsYkc8S7qJiFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i2uH62bS; arc=fail smtp.client-ip=40.93.195.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i2uH62bS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqfcqW3FIY2PjYOIOjCxG4KRn1xTpBAb44MEs0qNvqXTWiQc9LjiblMoi/g/YP0I6vkAXhLk8UhGsbyC2BCkrDoV4eU5e+hgbdgW3GAqsjbTgD3sJj40OqJ0vOde9xVNMkuvYGqzNhGjI44SrvZdvO84jA6xeff7Efaxx7NnOjP3aBcwwZC23NVupbl68G65U/xPmU42XU/rthRPgHiGraoWEbduJaOOjhP0LNi+lBO+BaN9nMR3EQc1TCFSlixIsZ/R6HPYIsKQjdQQ+a1iz1jXB/k4ExQ7qVptOwTuDLhi9wrz7N+orxlDMoXlVCqBFdBtvCPDo1VnUuyWZBi0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+2S59g8duqQldICCAL+AgrJQEJ6mgjXnEFdcLUMqLs=;
 b=F1hTT7vMSthoEpZtoNaC3fUGxul0KyjpY63MUVntm/482CedHO8zNhI0ZAPFbv66A+Jy4+kW4wX7RQCKK5rSZTQpI3YLTaibm/ba8Q5t+ZcbFZJCL4bDfzj0cCbZx03V36ktRwOHr1w+SOSC2O8wfm94rW4CTXQ29hhxi/6ps5t7Hknh8aLuut5nMisua+/JkKy9pP4p3zJ6Impnm1uOrbV9gK7T03KzLwt/h9P6rdSgoPIWsA93TSWdf0FfOP48tOGBk8mDVwl5moRKbBoA+lZdD0ffK6s23bKHastFkDmN2m2aiaunFcq2tIA2NoeJMkUJ8Vsij5MQ5AClq437Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+2S59g8duqQldICCAL+AgrJQEJ6mgjXnEFdcLUMqLs=;
 b=i2uH62bSdOrtBBQ0H99WTy5FanAVgBouJF8PMtNmf5BAZE6OfIGXwwfcpGysIbs4pfTl/YAj8O/DUvAfef/JUYqj3oU+83ZbsEYNCEYSsJDREB2Fti8c6eKRmm8oH6VNdcamEw2nJOZMRt3hynjEeFM6SMhM6P1N3i3abcuVM9MqRB5GP7jOBLZiU2dhEhyrj6CXk43G4HBKbspjlVesCktBDHrLdJ2N+1bTUP9b9MiDh3pRtsLGqbLTMBbFHej5PR/POCReFAgI3W+bLkyvkN8zEMc8oPuO9bEf6uxC11j97Tsi+D15PmjYiy97zjP3+g7Mx7xb1eCaiN0yboGtWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB5723.namprd12.prod.outlook.com (2603:10b6:8:5e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Mon, 9 Mar 2026 17:34:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:34:21 +0000
Message-ID: <d85a3776-4a73-457d-8722-82d8dfc58591@nvidia.com>
Date: Mon, 9 Mar 2026 10:34:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH FOR REFERENCE v8 10/10] gpu: nova-core: use the kernel
 `register!` macro
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>,
 Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-10-424f80dd43bc@nvidia.com>
 <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0061.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::38) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB5723:EE_
X-MS-Office365-Filtering-Correlation-Id: c639b61b-3a41-4afa-14d8-08de7e0218dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	yoOCdlmodHXeO/Ca1kXhVBW/ZEFLdZiWGS//5PnkHavpU6GtW89dhDl6EKBlQC4N6fmV1A+1girOo5FVWL3TL0Vlk3CAJjMKtAAc+vtLFdi8QTgG2+9HxiX96QLIl9p9usLJkaGNJe/HqHeNfutsC7Md96/QqfRFld4tvlJHFP+xf/zPbmRDd867AgwfCYvxZk+ZzBkfVmOaQzN8coeJj4N8aWmbR15UuSN7kkIDpBjkt7OBWecAyzxj5dHRY5uPR+k+yHIx/JNY4fwWN4J85uK9cFNuLzcy8p9nFPwp9cIF2k+fMkvnqnePMgN0oEX5TeIc3KPbuKidQSoSOR+fffb4fCUA9NzxgfYqmIZfjmLphgjwPoGtAvA3a9ez6OEsIYqQazd96+8+EHnKyqvhnQnv5KiwrVDjdqkM6wFhkvwbFSDDMtcVhLAH8AwOvZpWjF1pbXjmDi5DNTbtO8N/VXBNOVAdKTcvzwIPaecGgdV/NEWpIbkvqWkdKiPOGOKzL5hH5ZJO7DSV8I1QWA9UK6gYxnLUB331e7jBM0aY4kK3qG/EnfB3SAAYzDU/GUkcTBKGAB4G1ZX33G7oinRmar36opmMpfvLehBkTx3b10Tq9LEUi9IUxys7575qh07QWguuG/+ueVzMpbE7y9002KRHHHCkyNJ5kXXzUjXPp96sRt1PkEerEg2GYQ5rKlV+sK7ZnigFE5PP4YYhxfmHPZn+Ywy3e629pDHSlHLt6xrI6PyArp6t0O0dHySR8OjvV4TswvTa5cqsgZLDFLBOQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkgwdDBTb3BORG9yOWYyYjFDRWUrWE5GQ2UwZ0hlTWR6UHZpeUJzWEEvLytj?=
 =?utf-8?B?MGhLUElOWHljNW9JcmJlOFl6NzdhUloxUUsyTEZSQjFtT3EybXFQTEZRZFJm?=
 =?utf-8?B?SGtGRVRvckdBT2JydXpkQWdMd2dWbVlLRzdCT2w2VkJvM20vRlMrekxQODNa?=
 =?utf-8?B?cWNvcDZTcGx4dU0wOUU2RDhmTU9zYU9iSncxWngzdzBrb2NuYitvTTVIS2RT?=
 =?utf-8?B?MGdHbnVpQzRHUHJlbm5yUmN4QWcvaFg0WHBpSXZlalFUQ2dBNFppNVk0cEtO?=
 =?utf-8?B?MHNUZVViT0RDUG9RWjY4Q3RLZzExM0NhQWp4TUFJdEU5ZjRFTTFXQ0xldTc5?=
 =?utf-8?B?UmlGK0xRQlV2T3RGblVqY3czY2FtdVJ5bVZ0dmJrSHp6UkxLeGVZNDQwNFdJ?=
 =?utf-8?B?Rm0zL3JYbldBUDBmMGV1aGNMdjJOU09DUHRNWUZDa0xDZ2RhTjVaQWE4SytJ?=
 =?utf-8?B?b3l1VE9WL1FHZEYwK2pZbzg3T1lmRTZndVZaQWI3MDRYWFJVcDBqdHFlMWx1?=
 =?utf-8?B?MXVmQkhXbTh0eTV0MU5NN1A1aHgvVmdBUGFhdThpanZoY2hZM29HZzNEZG1a?=
 =?utf-8?B?Y2Rid1R5QXgyNmlJMFVsQThsQkJNaHpQdXhRM0hhTFFpalRNaFFLWllMVUtk?=
 =?utf-8?B?SS84SE9DTDdpQ1VPRGlLQXNQY2M0dk50dVhyQUd0alZhRXZOSG0relJOMTI5?=
 =?utf-8?B?bG1VcGlXNEUzQVBqUEVSSDllWll0ODRVTk94MmdGR2J2TERnalgySFUvdFZ0?=
 =?utf-8?B?RGswR1ludytjOURUNWs5dVl5dHBJTVkrekd3UStFSFIyMVhpWWw2dGFWS09D?=
 =?utf-8?B?Y3E0SVBmS0Q4WE03WUR3S3lyU2FiNlZnTEVGbTgvcnJMT2tXTDhXQzFndjlK?=
 =?utf-8?B?aCtoaHJyc2MrWVVFYnFWN2hCdDZmdXFoWVZONmJuVHd1dUtaaCtJc2gzazNz?=
 =?utf-8?B?N2Z1SXpRa2tIQ3lrQktRa01rbmlhdzRiUHZpeUVtRHY3K25PMHpLOHgwYWxl?=
 =?utf-8?B?WEdvNExSNUxuWVdLM0dLRnJiUGNKL2lOcGEwTnlDZDB1SFZTd0M2d1JGemx3?=
 =?utf-8?B?S3hwRFZNc0NQeHgzR2YxN096RHVlRTVpbEF3cm1XWUlsZGtVZUZLZHBzY0FN?=
 =?utf-8?B?KytnOUhSdTZHN2ZFQUczUzJVTmEwUVRVcHpady95UThXOWI1R0VLWjRWdHd0?=
 =?utf-8?B?aENGYmk0UElmblpSY1hWWm05V0tySTNDTTBxYjZZUVBUUEFoeEZLT2N0L29U?=
 =?utf-8?B?TkZsbnFoTVlpUnJKZFFvOEFXMDh2VHBoT1lja3pORDU5YnlWNVdYRzYydFhL?=
 =?utf-8?B?VzdDSmxhQ1U3THlUTXRrdHhBVFMvRGtjSGhRUndIOVFxTVlybDgxWlRGNlBG?=
 =?utf-8?B?Q3FncFBpYlJjU2NUTEpCQ1owTzcreitnekdacDFoWGpXaE5ITFRpRHlzNkYx?=
 =?utf-8?B?MGlFTkwwQkpmWTFubFZSNUZYQmxENTdvN1dYZWROaDRkOFFVSGNkVEhkbm9N?=
 =?utf-8?B?bkJLSC9SNThqNjZJanVIZW8rcFltb3RaQ0FIWWE2eW1kZkpSM1ZvblJrN0t3?=
 =?utf-8?B?bHo1SDNteHVZTmMzV0FRMExFN2pSQmlKZ3dJdVJFU1J3NFZmZ29FUEl6cFhm?=
 =?utf-8?B?NHY5aTBvZGY1U2ZYK0grUkhURnBYODF1VTlOSXdabkhPYjQ2bXpEeUV6V280?=
 =?utf-8?B?YnRERmFCNW11eGJwdWFkdCtrWDIyd2tpd3BKUHRmNlo4TnpxUTB2VlZhcWND?=
 =?utf-8?B?YkY3dFdYVHFjRWYvakhXUWFQMVJZdXBkdGJwUWNzemREMVg5ak5McXRCVkkr?=
 =?utf-8?B?S1JpYWJNSEhjWW40Q2xtRE95ajJwQytWUjB1bG55aU1xL3FqdGsrNzhvaTFl?=
 =?utf-8?B?QkVsTlUyZjQ1dWw3K1hsS3FPRXZoKzJyRmwxam5LazFrYnBFS2NUU0taUlRw?=
 =?utf-8?B?UlV5WlpsR0JVc25FYXV0aWFwL1NDNzE2TzZqUGxQNnE0c0FNSWYyS3V0RGdT?=
 =?utf-8?B?ZXYvb0tYazl2TmhOWWJkS1B0aGJ1ODh0cGRjSEZGYlFQNGRERDRlZERqU2d2?=
 =?utf-8?B?ZVpuWGJVdHoyaTlMRzNhM3NHZUExd2pPQklZU2RJRjdkOTVhbENmbmdmd2dE?=
 =?utf-8?B?RlRDTExRRDRnM1lZci9paldOK1ZPd2k4K24xcVFQVnQvWDMxS0xXMFAwK0hk?=
 =?utf-8?B?ODV1dXdRa3FiejIxSDdjWnVySEoyclY3cXZJWTZZa2g1TytsRUcvV0huN3RG?=
 =?utf-8?B?SldyRmM1LzZrWngxLy8vd1A2V3NweW5rQyszd3VPei81QmUrakp6dU5rRGRV?=
 =?utf-8?B?ZzAwNi9jOVdjcmx4MERIZ1hOWnU4aVF3Z253eFRWMk5PRXdoTUNmdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c639b61b-3a41-4afa-14d8-08de7e0218dd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:34:20.8134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRv7RllQfjFVpRUPp8UXChoJX5NEPxB9v1wzqesvHmdozGXNnTe7FT28YgKFc0ZhN2B7RfaNRB7xtH52SEUfLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5723

On 3/9/26 8:43 AM, Joel Fernandes wrote:
> 
> On 3/9/2026 11:14 AM, Alexandre Courbot wrote:
>>
>> @@ -797,26 +792,30 @@ pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
>>      /// Writes values to the mailbox registers if provided.
>>      pub(crate) fn write_mailboxes(&self, bar: &Bar0, mbox0: Option<u32>, mbox1: Option<u32>) {
>>          if let Some(mbox0) = mbox0 {
>> -            regs::NV_PFALCON_FALCON_MAILBOX0::default()
>> -                .set_value(mbox0)
>> -                .write(bar, &E::ID);
>> +            bar.write(
>> +                WithBase::of::<E>(),
>> +                regs::NV_PFALCON_FALCON_MAILBOX0::zeroed().with_value(mbox0),
>> +            );
>>          }
>>  
>>          if let Some(mbox1) = mbox1 {
>> -            regs::NV_PFALCON_FALCON_MAILBOX1::default()
>> -                .set_value(mbox1)
>> -                .write(bar, &E::ID);
>> +            bar.write(
>> +                WithBase::of::<E>(),
>> +                regs::NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(mbox1),
>> +            );
>>          }
>>      }
> 
> TBH, this is quite a readability hit, the previous was much more readable IMHO.

Yes, I think so too, except that "WithBase::of::<E>" makes a lot more
sense on-screen, than "&E::ID". The latter just looks quite random,
so this part is an improvement.

Let's break down the remaining troublesome part a bit:

    regs::NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(mbox1)

* "regs::" can be omitted with a "use" statement, right?

* ::zeroed() maybe should be the default behavior here, and then
  it could also be omitted?

* .with_value(mbox1) I'm sure this is necessary, but the construction
  is unfortunately much less clear than .write(value)! Thoughts?


thanks,
-- 
John Hubbard

