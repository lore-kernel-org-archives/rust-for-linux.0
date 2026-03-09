Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECD93ED13F;
	Mon,  9 Mar 2026 18:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082079; cv=fail; b=W7rzUeGpijMuDB1pKjUgegHF05DoyChRHr5PrQ2ELcElYjJwB8S8ef2FqmvQ2LUrsVe6v4Rm7KusuC2pyScD6sjBn2V00E2ZDUJbQzxva154dvz2DUqa7w1VdQjyWQT1s6Q3HM+le+Whq2qFJD8ypQHJI8lrtsbqPYSvMinLamw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082079; c=relaxed/simple;
	bh=XvNQ3pG2ICaLNNtRicgrXyHZkdw5Jo6qV8F6p8SAJvk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RTVhzMseXKmQL0o8GtFVWm9xlVJjgFV9EV2TqRU/IZUX7vS7AQA/Lwr/a4K3apypSleBG+Eg/g6VLALaThTs7dRQrv/7MbRHO4QLZoDN3OoiiOoygHyIE2MVSlCxRn+MgDYr3nB9zmiuipURj1C1ppCQsEsdGy3jMZRRK+T+aUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qKkmgvaH; arc=fail smtp.client-ip=52.101.62.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qKkmgvaH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2pslq8vZ7CQBIzf4aoAGbF7xMTPkySo2xv1w904m/eA1iGykiSX1CRCIzkHXl7nRJQgfQLHfPJf6ciul6JcKndtthtsuhnQAB0GtxHfYSgYIChna/ShtiUe9Ik1onfTBSbDKJeE0JTOB7cj3sCN8S3Y/XoDflB/ZZRlAP3wYXFXhaaN0Y5xPunH4Lo0wOgnkBhWMJSHztkjdXvTS3kVzIEoHmX0j2FDdUvtRMYFWFOHJ5zRr1S98T1BztF3OD4U0qnYV5sjg98lBVfQm5O37kKECi3XeUaw5lumtYiSOBhaHTMOzR+nkIpzvRpZ4GgpLs+C3g8SzYDrzYISVo3C1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RtEjnT8bBDkQnP8HHjXz9ENcMA6i2kbOzunpHmLZ9g=;
 b=nB+TTcrMGM0RH2JaqZSk5QL2A8nROsGG4PqkOlw8XsuQjwAAdpY3QzMnzIQkZaraXHIphLrUpyBE8GBpOyweUx1mrxjnEdZ1W1XGP/Eos7Nu5LUtDB3cULsshjF9amaxHgafdFhWFeKpXdt0XyUTbEyX88hpfAKggt5GMWYhlpLGg8KhOaMg0Rq0wEvlGcBxHoaGiJBDnDXnBN/fbgAZ0XHgvJj9vUC3Ug6Do7z5XtHcJIKClPdv84GIZlTczJZ1b+TZSbV2KUOZD3lUDx7Jlx8huqBzsT6YxeFPkreaQluL1JjzDXS/0FI48smFyM6aVEO72tv8dyKhyWTadNEenQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RtEjnT8bBDkQnP8HHjXz9ENcMA6i2kbOzunpHmLZ9g=;
 b=qKkmgvaH9OVLEbKABF6qUgfvWDGA8qExfMthRxbtFgdkUUBWM7ssm8d+y2kUPkAY0yQrS4FFNvkJcoU/EDngvm2hf+52He7OfOQICirvlYj/EUtHF4SSCYp5bKlyF7iPQN4HSjBQU9gCTkRjZQpbzUhPZV/al9x6av+whepLwhI1eBAfp4KXDYaO8Q1we0vH6oZvJ5JOBGbnqiiySioqDouG5twV3oV314ei0cUcoBTTylv+pRT1m/SPt3u+qT/+MZQAAik67G66k1XTd7Mld8f5FAbFXvN9VQaajCjWoLZE5MNAZ0yrSXe5AP39MUgyHrVVB2IxUMRFE/toEwJqgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB5842.namprd12.prod.outlook.com (2603:10b6:8:65::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Mon, 9 Mar 2026 18:47:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 18:47:53 +0000
Message-ID: <60035074-bd5c-497f-82ec-13fda2136fdb@nvidia.com>
Date: Mon, 9 Mar 2026 11:47:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH FOR REFERENCE v8 10/10] gpu: nova-core: use the kernel
 `register!` macro
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Boqun Feng <boqun@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-10-424f80dd43bc@nvidia.com>
 <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
 <d85a3776-4a73-457d-8722-82d8dfc58591@nvidia.com>
 <4f7baebe-e993-40b5-9cb2-3d4699da1299@nvidia.com>
 <fd45410a-43cc-4d8a-a750-6f3211dd2797@nvidia.com>
 <DGYGQ78QQUDO.1TVZTLEWVG6HL@garyguo.net>
 <3212056f-f1ec-4454-b07d-ec96ffeda266@nvidia.com>
 <DGYH0HGYXAHS.XZ9FXJCXDZ0Y@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGYH0HGYXAHS.XZ9FXJCXDZ0Y@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:a03:255::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: baa8ac89-2c23-49e6-9a35-08de7e0c5f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	UzUTily6uJ1y3NIZFGWoBBtgUa4mXvMFdfRFsetBDrocXUOVGvYzP+r7PO+HFY01Q1YHzfSFLWdbxKF/sbmOZAi/wksoDZ7sDsCQ84H1Sxl0/B3MDSD9p5pcyysgKveE8F5dC9dvs07l+1qH9nxXX0Rq1NuD8kZ9tXGoPOz8G0gGK3fdpmKu0pd/1WM1LVzi/O8Wi6i2eyWAAIGisZNVUXXAtcZIDfzUO8nKdNmvkAv6cYAeOnziLTny1AVz6kjSdqFB+rb/BsoEP0njXHu95FEiZB8vuRk4zJrqDcthuwXQDj6bnJbY3US5DvZhNZpDUYG09GacZm7ByHyXr9zeyGtkQog9wQIuGY2XryuFgXb50oomt+dOfwz021xK2/0dZvkfNk4xNlU+c9wpqKY3B7qOmHI1JBJDs77UX7EG5SNBEMAdl/Unc0molqwwaSxvXYrptHTnJHtbUlbv85ai8mxfxe/nL6kAvqB1Nuhzvtr3iaNx0ZK3hzhJwpW0U+U0udD5PvMEck9w4rYYmKRzOWxvJUzy26oeqUBLp/F0K6GDLOdd84iRWYOwPl2Cjs63zUK1D2lxPwMkWv2RRnWHmiqTTZ0E7PMuk1dQFvCSOdwtIRO+n39tyZBG00pcyF3XFgqzsZ4laU36+TwMRnzPAYIv/UyQGTxoMM8xy69FGaG54zeSuvT/y9ptJtfg7GGMRk0H1fsF4ASZdO8tLHJfmAlrFJFdZMi6TZABvSvmkw0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHFmUFlpR0s4UkpiRlRSNmJ5R2E3Z2RkT0NzT1BsdkJmK3dsSFMrWjN4M1NN?=
 =?utf-8?B?MEZWMit1clViT0k0bU10T1JtT3BrbGI2QS8zNDVvYWFSRU9Cc1Q0eHR2YnFD?=
 =?utf-8?B?L0NvM1FxSUk4V1I5MzRrb0xOQXBrT3FXV01oUWtyMlVmMDgxTllSY29Dc0Z3?=
 =?utf-8?B?blJlMUhkd0RrTWhPa2RNOTZxeFRtdlJIaTVrQzZid2lKZEl0SlVRYWIzSUJU?=
 =?utf-8?B?eGtPbXRDZDdSSGs3ZG5obSs2RS9lVllmZmJISVZjaWhCWm1jRTk2ZUlqYXo1?=
 =?utf-8?B?anBlazlveVBZNVlaZVhuUzREek5IMUo1bEpkY3RCRHVSdGFQdEN2eDNuQ2U4?=
 =?utf-8?B?UHYyKytNb2kwUk9uOEtFSmlCYzMySWJnM2dUSjBIUlZmNDZWMmxtNnZVWGZa?=
 =?utf-8?B?Ums3bDNRdkZGcGR5NEg5OHBXWDcyNU4yM0tXTitReVZzekN6Vy9TZE5lTWJR?=
 =?utf-8?B?REZQZXRPL3Nmd0xxTjNLZGZHYmhSSVZ6VFgxdlJxazNDQ3ZHSUkyOHFlVGtC?=
 =?utf-8?B?d3drR0JiK1gzQjRSdGY2S0Y4RHRVd1pxaHByU1pIUHg0MG1FUTNxVjBCOWkx?=
 =?utf-8?B?YVdmaTZvaTA0TGVtYnN0bUE5dUpRMVlsRHlBVVkvTi9RUVlhNjQzdUJCWXZ2?=
 =?utf-8?B?UDhIRk1LZ2p6VVBVRENjOE03WXlHYnI2Uzc0aXVpNjVtbDVOeVRtdE0xYWdp?=
 =?utf-8?B?cVhFeHBkZmlGMFFudUpRQU41b04rNjNURTZxZCt3MC9CV0REZHRKODN6OWZy?=
 =?utf-8?B?clhLbSszVG03QzFTVkRPSzhGcVVBVTIvTGZzRVNHdTcwSFlTUHBtYVVtSG02?=
 =?utf-8?B?QVd4QXE2M1lIZCtGaHU2RGRDQ3l1Y0xWUGRnRFhSQ0k0WnpOcnBMMlYyUFdu?=
 =?utf-8?B?bzJCRVJ2RDdTZ0U3WVF4SktPVFhVVlNqUXVOcC9vTjM1T0QvelNQTGRVZk15?=
 =?utf-8?B?TXE0ZkRLVzlCaWlHUUhjL0ZxTGprWEdrMmhUMU5CS0QrdSs1SXNHUmJQL0d4?=
 =?utf-8?B?NjdleFBsR0Vlc3Y4M0o2MmVaRWVUcS96T1FwdW5kd1ZncmQ2RGcxQkhFVEU3?=
 =?utf-8?B?M3hMdnl0Z0pOS3Y1M1dXcWNEWFBvQlExQVJkOXVKbFpBUmZzNzR6azQvbG9q?=
 =?utf-8?B?MkF3T2ZwZGVDRHlFaHg2UUV3dDlJUXBESzNYMGcxUm1oaXl5amtrS2VrUDMr?=
 =?utf-8?B?d0dRcXhKZjh0aHpiMHh4WEV6ZnZkVjU5N3RtYTR2MXhPUnF5MTVONGFvUy9V?=
 =?utf-8?B?bnE1aER0VC81QWRicmF0dEt6Qk0rQUNkYUZpZ0FQUUoxRUxqMkZDNGZISXg4?=
 =?utf-8?B?YjFhbGJ4VSsvZUhvTmNXcHpXbmQ1YXdWSDdKY2dkS0N4eEZlVHZUNmVyV2VN?=
 =?utf-8?B?OTJSMEF6TFROZ3FrOGd5alRGbXRtQzFzUmRtVkIyNTNueitmSzZrQ3B3OHU0?=
 =?utf-8?B?THNSdk5QdThTN3FNY0RLQU9JbWh5QTQ0SHl4NTJoOXR2cmNBZUd6QWNHdGJN?=
 =?utf-8?B?aGxNbWRpc3dEbFdoZ2UrdmFkTjRpaWQ1eEtqZFJFa2d1QmFtZUdLeEszdDZQ?=
 =?utf-8?B?WlZOdnU0cnlnakxzM2oyY3dNeFNwZmpiaTY2UWdDaVB1Y25hMlRkSDkvRFpM?=
 =?utf-8?B?bjBBZzBXcTY0WVk0WWJoS1dvNVdYR2xEejM5YzhkZXZ2ZXllcGRMTDc0SzFU?=
 =?utf-8?B?Rm5QQmp4dEtNQ1lyUzdoRFVPblRCK0lIdVpOY0wyZEwzbndvMmJEYkFWUU9k?=
 =?utf-8?B?RDRxMEpWZGJEaDZQUzlSRytuZHdYajliUDZJWGxNRUJBWlhGSlNXWStzUnM0?=
 =?utf-8?B?alFiaXhaMmFoQlErSkNFOWpGVXI0U2NzVEZRSXZ0OUs0L2lwb1l5OU80a2w5?=
 =?utf-8?B?WCtwMHJ6UFYxYUpTYmc1bXp0dGFpRkU2emJPZnpBMkx0MmFWaDJtTGpDTTI2?=
 =?utf-8?B?Zk1TV0N3U01hT0ltSGU3VWFjblg2V2xESHNuU0RudXRLaUp2UEZmNEpRSXVp?=
 =?utf-8?B?RmZZNmhkZlhqWEFHZzU2ZnNISzdPYllBb08xQjBVVGJlNFdCTTZsOGllZHUw?=
 =?utf-8?B?cVNOMTIzNHRUUU9JMDR3NEErdHVORkV1RHhGVHRSeVZpZUpRUmlyVTIyTzUy?=
 =?utf-8?B?RVQzYnFKSFFad0pERHladHBUazFpOGxuTFB0b1JiME1PNmpoRU9jeWFxdUJJ?=
 =?utf-8?B?NTFwOFVGR0w3amZ1cHZKdFREWjNHOHYyNzk5MGhhMnNGOGJqQ3lCVkFTVEJi?=
 =?utf-8?B?UjJZVDBRc1hlTTB5UVRnT0F6ekI5clF6dTNqQ0t1dDN1RTVuZzJTNjdRcXN3?=
 =?utf-8?B?Yk5hcnJsSDdqaXJQV2Fwb2h3TW45Zk5LbzJoaTIyUlBGQ1BmZlVzUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa8ac89-2c23-49e6-9a35-08de7e0c5f01
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:47:53.4006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaTGr8YnnO+47CR14Nxzv0fWBkPmMdbuJpeHi2LJN7FpRPU5q549/GPDuGxON0AuJ+Jtgs3uj4Zj2xDs5DzREQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5842

On 3/9/26 11:42 AM, Danilo Krummrich wrote:
> On Mon Mar 9, 2026 at 7:34 PM CET, John Hubbard wrote:
>> On 3/9/26 11:28 AM, Gary Guo wrote:
>>> On Mon Mar 9, 2026 at 6:01 PM GMT, John Hubbard wrote:
>>>> On 3/9/26 10:51 AM, Joel Fernandes wrote:
>>>>> On 3/9/2026 1:34 PM, John Hubbard wrote:
>>>>>> On 3/9/26 8:43 AM, Joel Fernandes wrote:
>>>>>>> On 3/9/2026 11:14 AM, Alexandre Courbot wrote:
>>>> ...
>>>> What about this instead (*very* approximately):
>>>>
>>>>    // set up or construct NV_PFALCON_FALCON_MAILBOX1:
>>>>
>>>>    let reg = NV_PFALCON_FALCON_MAILBOX1::zeroed(&bar);
>>>
>>> This doesn't really make sense. What does "zeroed(&bar)" even mean? You're
>>> neither zeroing the register on the bar, nor constructing a zeroed value?
>>>
>>
>> The idea was to separate constructing with a zeroed value, from
>> the actual register write. I am not surprised that the syntax
>> is All Wrong at this point, I'm just hoping to spark more ideas
>> about how to make this clear and nice to read.
> 
> This is where you would use write_val(), i.e.
> 
> 	// Construct with some custom constructor.
> 	let reg = regs::NV_PFALCON_FALCON_MAILBOX1::new(...);
> 
> 	bar.write_val(reg);

Beautiful! That's what I wish I had written. :)

thanks,
-- 
John Hubbard

