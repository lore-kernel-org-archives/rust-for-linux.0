Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010031.outbound.protection.outlook.com [40.93.198.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDD13A8FE1;
	Mon, 30 Mar 2026 22:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774911275; cv=fail; b=Q3yXLCiYCFcS1Mfir88BrDvL8GpNT2klr+Usg7c3Q/+TnaAVsGh2Y+0ZCHlazOXIUGxYDNpqDYHE5pvsAJF4aIduD5nCNqX4QLDlqXwL+/6gjIX35Z7G2UZUoHlZjKOjQNDIZehMYmnmpCnGUOEK9qOoVFLsq3sP3HDU2fVuSww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774911275; c=relaxed/simple;
	bh=XkwsF84SntKYPkIe+km2DNYyYGlBiAfyQUVd2auMWbY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RRBP+c5nCZ2DOPokbxVaV+v7XllQsEm1UAnwjOyVv5Zg0jFcBSPTXQQiBR1jUGPgQvXmk6IKYnDqyVh0Zritikht8NKsQ/jeScbBpA4SAj38NT+WeUOagjRwRrdFsI49ViT/8lYM2luRkiRiBgZzwp9lCJA/oIjV3XuQnggyG7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qUskgpoz; arc=fail smtp.client-ip=40.93.198.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qUskgpoz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhWFfGdxwbvgw3lXithzDlWegSTtnAN04VnMdU3blQcMeU9FjnBxtDWv+ElEBW/9lHxizDQtEwAdJ7iq9bWk+KNRBGgTYh25HVQcW4rwMzeh0gTJ6E3Sy7YRwhULggNgOTiZteK7xja4Pwf4BuxgycLUGelrI1iUyBU0xR3vBx8eAiPWC53//LY88PkwKiJRcbGBNZPeM9Tkiwn/bEqQfL9+T2Fw8xGVCPJ7Gp433rqNVwhttynso75n8xvTV8rV3RSLc5Y2kxj3l6/vq5k79TuJCqo2ifVOb5ztfddqKX9+Gcjd0hdoNj/UAKyh18KvRj8plTUGBeycmA0nvjpeqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnCv657HIDdKFz0MYZenhcu0NehjhN9sKregw7ua7uE=;
 b=uQsxge3ZQm08j67TXtzHqOu8b1VUmpzUT5+2Aat/G690bkz3gNIsvfr7E4KxrJbfPjYqT/bbO25HVkuP4dFE673rz7T2McuFy0lpq6Ljj9+PVLoSUzSnXftb5s5F2re3+7Ki3Y+EH+BT2RtzuqpS9wCkoFXeLeuOliRj4LbW/TaqnnwxIfgSB4YuHhaOa48ny8BhIgRgbc1j++ai+jzuo3o0KlUjsgqmWw4kcWQu7bnmPF3m/er6gRV7SnQhlEWU4DMP7GIwbno+YV+JLSFjPEWX3I5mYmW6fmueujpBzjujOfWpqhOVaNkkRyxt4ZyFtceRphzJVs1aONSBgTSLoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnCv657HIDdKFz0MYZenhcu0NehjhN9sKregw7ua7uE=;
 b=qUskgpozhVGpWc4RCYBEK1gBNOB1PUS5TDq6KgyqLbo1M6UmI83HhGNH4aUplkTucjRZ/6kILWaZkm+wIDELNG6IYzQgd378ALQIywR+VQeHGBaZ6cr1cGoU/jAV/5TfykUsDxSzUFZQXnoZoL2zvAs4beZMrV0ITOxZUraeunpTgShRiOzMEbnWuO9mFlS2+VV326GQzLyf4W39uPTM/Gpjag+lEGfUy5b/a3rVgtrr9TzZmbdA1HsZLmpAkx5HSEzHRDsBO1cYX3mFowB7cv7jhywVLdUZD+vXOZ7leQKAwuquIounnLfeLcKd/GQR5/+RlUvlB3ys2Oso12Hhnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV3PR12MB9215.namprd12.prod.outlook.com (2603:10b6:408:1a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 22:54:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.011; Mon, 30 Mar 2026
 22:54:22 +0000
Message-ID: <07c99095-cf03-4f0d-acf5-6324a6466f43@nvidia.com>
Date: Mon, 30 Mar 2026 15:54:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 24/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain
 of Trust boot
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-25-jhubbard@nvidia.com>
 <DHG7OGJPGEMC.295BL05EFV4GN@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHG7OGJPGEMC.295BL05EFV4GN@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV3PR12MB9215:EE_
X-MS-Office365-Filtering-Correlation-Id: 1619b367-4ecf-49f0-9dbd-08de8eaf48d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	k4Me8Wj3VQpL76BcHrzME3WVwUsgDodOPbELQop3fyX9pZhW93s0pehLKqpnYPxSa1FHkWWfclqTctHuwBCQbxq9rtDjmgstnvyMr82OIi36Fy6d5hgWoBSwJN3QNqfi15Ywaml3rHtjqv1+B52JYcaVuvCkIJjfQzMIhvltnarVHcO6E+s0VpaXvnO2Xsqc6Hr3nWJpnyJ1fGsVfFEUbSf6/AvUMtnQmOKCBtfc6f5996NTw66MmQy3Kqw0kFck82WTEpRAPJat/6khvxzZH5UgfGIiESE071CXrSeuS7Rrs1+bz7qgbSUeiM4I3eFwU2iBt8DY3ogJ5r6eqIMr7dxSL1ael31hHge8QA1Mffy2pNPveKu3laav0qSFCGo2BAnPxixlxqrU8Fb5STRyKUKDuOEO7/MXeKTG8ZZ3SA9KxVUeLe+Aof85H7pIMBvfw8Emjkj9VgmKIOof2AneWtHJKUUR3MOZFBldfD8Fn5kWTJx9znIzVl7w859s3//eCYuTTogSMDucGA6Xk7PgzM5N7uue+riKd2BCh43hzgVnplJ/WAZCVXwktlaolEm5A3Js6rdZTRnLE19hPjEgVZ9QDFXf66pkVetZ3njl/UEq8tz6vkZOC0CNFw6GI2R2kk9DWEftywuW03FKH+H9FZ+s7acS2WFwOPZAz1Gxldb3oo8SImPz+fgved3eP42Kt85R+t0D8am13QpOrSZZtLv4pD1NBOREWQxbu56sHnc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGdURlhzMU9hVmlVU3VoQWtRQndiMjRoNnVOeksweXQ4OHdiMjdUR1huWm9h?=
 =?utf-8?B?MVd5dVo1ZktwdFFOSE52eTgzakV4QVhRWDVXNnV3VUNlOVE5a05XU0s0Tkta?=
 =?utf-8?B?REFLV3M3b3JpMTMwdWZpU2RsdGVBcHVxT08wN2Nob3RqNFBXS3RadWpuelZ6?=
 =?utf-8?B?MTNaRU53WWVzR3RINHhXMUsvVkx1a04xOEEvWGlXNUozNkZrb1lGYUFBb3Nr?=
 =?utf-8?B?QmZsSlAzUkNnRU9odUJCUEFLQzRuRGpRcVF5akJNUDFCZ3oyVG5JZm5xTCtG?=
 =?utf-8?B?Uit4R0NsL1o5cGxTSGhVb2VaeUJDb3BtbzRXbnQ0M2Z3QnVRR1dBU2w4cFZS?=
 =?utf-8?B?emlXaGtDTE1hWXViT2YvNDV0eXNYVExjbk43ZU5kVVpBY1FnZGpST0IwZVdF?=
 =?utf-8?B?dUlEWHJOUVIwcEFIU0U5aURGR2ZGdzA1L3BLbnFtNDNNK3h6VlBSWDNmN0NG?=
 =?utf-8?B?dXBQQU4ycHNNOHlMWnQxRnRjYkhwSmthd3RVQ0laQm5ReWxBT1ZpdXBld2U3?=
 =?utf-8?B?UGhhVm1XT0hPTGM3L1MxQmRZeW4vRk1Mbk5sK2J4bFVWRDNrcnlRa2NvdXlV?=
 =?utf-8?B?VkJxYkFLQTZtVXBFY0xVZUpOYWh3NHlPQVp3MW1odnAzeGM3RXVUN1A1Q05W?=
 =?utf-8?B?MlhrdVE4dmQveWpIang2ZytRRnRiVEZMcHpObXlJK0NOUTBqOU5ZeWY2aHEz?=
 =?utf-8?B?TUNDcHpSNmF2bVFKcExKcE8xMzJGdUFoYkplSmxlcWROSWpDMFZvMHV0N0Fo?=
 =?utf-8?B?UTFHYmdiTGg1eGxyYXN0NTBhY3poK1NxYVdZbkpDWUlMWnFhMHBBSEZVeTdX?=
 =?utf-8?B?VnZVYnc4dUQ3ZkFZbjNvZmZPbHNBbjdoVlllQTc1SGVjQUhMYjR2aWpCLzRC?=
 =?utf-8?B?N21KVkJkRTZIZE9zenFXK2R2Ky9GRUJ4Q0wxQW1maG5ZU1dhdFdwUlp4TGxj?=
 =?utf-8?B?VnRucU5RMjJaK0MvRFp2YTQ4WUFkZGsrZFZ2Mkk3WEtyaGwrS1BZS2pTM0pE?=
 =?utf-8?B?Z0ZzVUtwNUVlZ2lnRmZpYnRNMW1OcVAyTjFyK2xmRWhkRDBqYkRHRTJXMWpL?=
 =?utf-8?B?dGJ1V1JNSG5PZFBKR3VaN2x3d3JHWnZUWDJyQ2k1RVRWMmtEL0EvNXdtV2Mz?=
 =?utf-8?B?SGhYM2xaREE4cXUvaDZsRi9DSTBkWFo3SWk4WjJVYnpCN29jQ2dQcFlLZjVs?=
 =?utf-8?B?blRqUFdxWHBKVitYdkNBamNZcm5kdFJyWkRoRmh2aWk1cTMzc001MzBGQnRC?=
 =?utf-8?B?UkV5Vm9tZ2pYZTJDZFFVdGFLZDA1ZHk2SHRVUWlkZGFiQTRvOEZPY0ZHc242?=
 =?utf-8?B?SjFHN3QvNE9FendMbXZCdDV3VVBxTGdjU0h3VkgrelAzcnJicldiWUdXVTM4?=
 =?utf-8?B?UVI1UXVaWUFFTnBZRktaamFYTzA3UXNMR0hnb29IeTlzK1FiNWxleXgxc3BW?=
 =?utf-8?B?NGdBUUlMK2ZBdkNRZ1lWaUZKbEU0SnM3UEZmMitaM1BER0tjNTkvTjM1ZmRH?=
 =?utf-8?B?THhURnhTNk91YktkRUlvT1p3d25nSDFZMUpKaFJ1SVJ1aW1VOXMzb0R4SktC?=
 =?utf-8?B?WkprWFNlN21SdkZhSUhjTGt5V1hNRVRpUVg4ZTljUTBJVW1jdXJxQ1poLzZP?=
 =?utf-8?B?MEZWTmtsR1JzaTk3OTJDUEZML0pKSnRjbjNJcjB3cHloU1dINXVzam1xMnkw?=
 =?utf-8?B?SGs3NDVHUHVvRGJoRzFLcFd1WTBRY1YyT2ZtNG01eHZaYzhrWm0wYkN2RS95?=
 =?utf-8?B?Q0ZVR0c4emFGYjBQcEIrck53MUZkU0VhV05WZEl0c0RBRVo0UlZEVjJyTGFk?=
 =?utf-8?B?K0NvOW9HeDlOS1lNY2JWQWpUMFIxSWlHSmMrVzY0aWtSdS9JeW43aXJBc3NV?=
 =?utf-8?B?MWtYajZxNVd6eHlIMVlQMzBLd3JIRUhERVUwSUhtREltNTltVWpIMFEzd1Zh?=
 =?utf-8?B?R2NYd0tKN2tGcGQrMjhLOFp2L09haHZWbDlhdVVrU3hWOFdINzF4Ly93R0kx?=
 =?utf-8?B?V0hGa2ZNb3k1SVgrOUc5NmphNytXTDV0Vjd4YlFFNXY1M3NiVlgxdDBnQjJL?=
 =?utf-8?B?aUtHSzFYVmNYRHdSYzljV0V0VkgxMkRFSE01c3hCNWp0K1hLbFNXaW9CZlZo?=
 =?utf-8?B?QzZ6eEtNOGxramMxRGRkNXhXcHNFQm5LM2ZvejRRZXRuUUplWHZGcWk2SWFo?=
 =?utf-8?B?OTZNZURMbDNrODloWnppWkZ5V3A4L01iU2VXQmxNZlBEWVEweVhSSmNjcGJ2?=
 =?utf-8?B?SXRISGhybkZtWWFxSUlLZTI4NWNhazRMUXBPZkNUSjU4RW5YVzRBL2VYeWRK?=
 =?utf-8?B?ZE5RZ0VaMmVYQ2w5TnhhNVpGZWord0MrbWZXVFhSa2pmalNZb2krUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1619b367-4ecf-49f0-9dbd-08de8eaf48d9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 22:54:22.8183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7AsJ/BQR/EdMkpFmFRUeeHIiPzKuva9B5NOVeazJW2IDgd2Oru8CKzZW3D2AU0f/iwUuk5nKI1JkJr2p2goHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9215

On 3/30/26 8:11 AM, Alexandre Courbot wrote:
> On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
>> Add boot_fmc() which builds and sends the Chain of Trust message to FSP,
>> and FmcBootArgs which bundles the DMA-coherent boot parameters that FSP
>> reads at boot time. The FspFirmware struct fields become pub(crate) and
>> fmc_full changes from DmaObject to KVec<u8> for CPU-side signature
>> extraction.
>>
>> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware/fsp.rs |   8 +-
>>  drivers/gpu/nova-core/fsp.rs          | 170 +++++++++++++++++++++++++-
>>  drivers/gpu/nova-core/gpu.rs          |   1 -
>>  drivers/gpu/nova-core/mctp.rs         |   7 --
>>  4 files changed, 172 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
>> index 028f651553e0..5bd15b644825 100644
>> --- a/drivers/gpu/nova-core/firmware/fsp.rs
>> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
>> @@ -14,16 +14,16 @@
>>      gpu::Chipset, //
>>  };
>>  
>> -#[expect(unused)]
>> +#[expect(dead_code)]
> 
> Why?

`dead_code` is the specific lint that fires here. `unused` is a lint
group that *contains* `dead_code` plus a dozen others (unused_imports,
unused_variables, unused_mut, etc). Since the only warning is "this
struct is never constructed," `dead_code` names the exact lint.

That said, you're right that this change doesn't belong in this patch.
I've moved it to the introducing commit in v10.

> 
>>  pub(crate) struct FspFirmware {
>>      /// FMC firmware image data (only the "image" ELF section).
>> -    fmc_image: DmaObject,
>> -    /// Full FMC ELF (for signature extraction.
>> +    pub(crate) fmc_image: DmaObject,
>> +    /// Full FMC ELF for signature extraction.
>>      pub(crate) fmc_elf: Firmware,
> 
> Let's make the comment for `fmc_elf` correct since its introduction
> instead of fixing it here?

Agreed, done in v10. The introducing commit now has the correct
comment from the start.

> 
>>  }
>>  
>>  impl FspFirmware {
>> -    #[expect(unused)]
>> +    #[expect(dead_code)]
> 
> Same here, I don't see the point. If it's not unused anymore, let's
> remove the `expect` entirely. If it is, let's keep the more accurate
> `unused`.

One small correction: `unused` is actually the *less* specific choice.
It is a lint group containing dead_code, unused_imports,
unused_variables, and about a dozen others. `dead_code` is the single
lint that actually fires on an unreferenced struct or function.
#[expect(...)] is meant to name the expected warning, so using the
specific lint is more precise.

But you're right that this change belonged in the introducing commit,
not here. Fixed in v10: the introducing commit uses
#[expect(dead_code)] from the start, and this patch only changes
fmc_image to pub(crate).

> 
> Btw, this is the kind of stuff you'd normally catch by looking at the
> diff before sending it. I shouldn't have to do this.

I actually spend lots of time fooling around with dead_code and
unused, trying to get it just right. There are a lot of patches that
add and remove these.

In this case, after the dust settled after applying the v8 review
feedback, I did notice this unused-->dead_code diff that we
are discussing, but I just let it go, because it's only a couple
of lines that end up getting vaporized by the end of the series
anyway, and I was anxious to get all the other things (especially
Gary/Sashiko's big discovery about the two Blackwell arches)
posted.


thanks,
-- 
John Hubbard

