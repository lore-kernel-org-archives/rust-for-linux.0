Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022121.outbound.protection.outlook.com [52.101.96.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FF843B3F4;
	Tue, 18 Aug 2026 13:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060414; cv=fail; b=Kvp0KuhHhlbdCd/t7XnA6yvSJb92FYHsdsM3yj8wnY7jZHfVmTZ4yYPL8YcTQ5/1WM3eVDC7ad7Kd9d2d+z2iytVRMTh4ZPp2q9GxlnFGPg1zpZGTyPl3FrdeexknUb/KuEBZFqJbvfGSmpq1igXFxwELJX5LGyrivtZ+pLlcig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060414; c=relaxed/simple;
	bh=IHljOVyECepzpaVcySwgAtP/ndtnfDfjy+J2S43D5Hc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PVNX0kLYocMex8Opod+wAjdxN3r86tBSGE+I4iJvGWTc7AM4vdXUFsSsMVt/ilXByC2T31gU12q9p/PjvR91JAphS2OmFLmXIy++FuDyer8jnMjYBHhK3JEwLRpHbtmJ6QeLIrauH4E25Pr9GPU5fQktZFaZx1XMn9XE06HYPYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=nFgeK2CT; arc=fail smtp.client-ip=52.101.96.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nFgeK2CT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAgBH2XD9dLsWxRGEFgfyFb10bVADow0k2XX/P1Gfa2ERJSb/XIuPQl/ZLlk1vgvpktqhe/2N/e8JJKPDrdWFLduy2q6fAbpCMz+dF0MPjnQbJRm12quUZ4uTtN3PEtG3FPgN661eI5OCjGsbUAekoAK81ri/+lpMhq4espzCK1tAQ28BLgjXhMjbOL5mwSIrt2WATmlg/NMpLyHda6GKlhWCWgZwUnfkfVdptTXE/pKXD7sMGd6LCBjYtS3VqHdKmZlRjjnkCMs52blmZNls9LHWakj2s1DP/7BbMOCBrekoQDFKX6vVVcMRN9qf+Q6CGrNmz8OmOKQ9xZ5zPagOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwyE/vqNGjhelz6jUCwDFZM6undcib81FkODdsvDo7A=;
 b=r822It0WoZerBjga3UXjHHqG6g4odFmD2YlEHIvs3/oA65s247+VTlTe5rsRv+nAifB6hL4iloJpjAKubiP/zyuMMJ3y2SxlJqtUuhEjLngpW1cr2t7TTPckpAw/4IwUXLa2cHWnN7wOxV8QQ/tC460zTBCGmKd6Aoml1NGS3SfEh4ocPmo9LrJ7btlPl+Ma0Tt/zCNX2zTpEZaHdCtAnR0omPAEWBB/0Smb8oMTbxtL/IL2UXu38HZXr1f5+dFS89797HMXiZylWfeHc3ArXDCyLZE13zU5HilZDZZw1hk6fGC0+1zELFcqjrV03V+/ZS/3xl00l5aWwz+ejBDCBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwyE/vqNGjhelz6jUCwDFZM6undcib81FkODdsvDo7A=;
 b=nFgeK2CTGklt5S/cH1Uuvtj7IoY8+QDFOEBUPJjz6L9EQokC9UOtWNtSFMcY7B+30VdJF2w9atHdb1HkcNLzg2DSXdDgI+TJq1TmEPXMxFEuSV8pYJglNWP3kG72hRd2U7nDXs7xQmTvji+HtJ2gJMeLKCm+rm8p8mDOpebstcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOBP265MB9435.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 13:40:09 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 13:40:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 14:40:09 +0100
Message-Id: <DKS41MD2BJW6.1JDVD18WMX40T@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Dave Jiang" <dave.jiang@intel.com>, "Saeed Mahameed" <saeedm@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Benno Lossin" <lossin@kernel.org>,
 <linux-next@vger.kernel.org>, "Jonathan Cameron" <jic23@kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH -next] rust: fwctl: replace `__pinned_init` with
 `raw_try_init`
From: "Gary Guo" <gary@garyguo.net>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260818105350.361218-1-ojeda@kernel.org>
 <20260818125558.GB5432@nvidia.com> <DKS3G1HH0835.P8T7VT9VW24I@garyguo.net>
 <20260818132022.GC5432@nvidia.com>
In-Reply-To: <20260818132022.GC5432@nvidia.com>
X-ClientProxiedBy: LO4P123CA0306.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::23) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOBP265MB9435:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae7c11d-dcdc-40b9-683c-08defd2e38d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|1800799024|376014|7416014|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	D+kKl9po2IiBy3u/HPm7+i1NlewP9H0AFhJm3Ti2cVbPdBmoliNnfkWoCvA9FKRq3qwFBFlV2LGqVjM0QXcvL5TmKB/SD2bfyZ3UA+fWdBgz0DtmeVUUWVYrpSwLZWLlebppuKHUmUgzbUJuqTlmdDSFuaDNz44gP+q1OsCbUqTEQzLSxpTjgPoQY8fw5ryx4M085YlN1EsXS/p+yOEV7/6H60UnJs9CsFvqiIcaBkn0WPeyhKQ+b4uQatUFYaQ+XG5njHFw3OjVdimUT9dOO3eLQwkl395TztXBw5Jg80Exp2XW6wBAGX+s1YriJMkG1VyeihqQZ0kN3uat9VZl7V0W8g4+2cTsIkY49ubanhOnFZ9RpqbHx1B084n05XQ+kybaIaOA9G27UBuSdE4ZAy/QXrMIijPFSK8txI5Ui/N8xqe3PdVrybpZyPZTnDz9e15EYUNBmyBwDWdHE1ez1q38fe+YfBqRuD4XvLulZn+FJpdxBiDnsHMYBTYzuGZIAmP7wQIHkdxgaN23ayIWc9R50Exvni1A7euNJS4vMngYlItNK603RbiXl71eXa5CVQev9Cl2RxPFRWa22GsA7u+78vVUkuuDYjQKd8QO4WylMlNooauAm2o//ILWVNl9UL/Ap3hhTgz4SzaH15sXIEqdRYDAti/ELG+EqIrx+ww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(1800799024)(376014)(7416014)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3JCWi9PREV5SXhKR3d6eTZKdEg3U215RnYwS1NHR0Y0TEJ4QWdVVUV0Qlpj?=
 =?utf-8?B?c1hWSUthUTN6RUV4Vm9TQVF3ZUR4ZVdDa3ZMMlplSnM3eDF1SFo3amxqNzU0?=
 =?utf-8?B?emlsN2hUR3N1N25sRXkyQzY1bnljbXlRQXlqZDNSMjNhczUzT3dTeFBHL1FT?=
 =?utf-8?B?MXMxQnBXK2pnTWc4akJ6Z29PYzRhY0dJUE1RcVNockVIbERjL2t0QnZSdkFS?=
 =?utf-8?B?U21ySEtGL1RZT2dnMzM3SmV6aWxDTTNLc000a1JHbm1jT2RBWlIyTURzYXl1?=
 =?utf-8?B?SjFETFlsY1kyUkhIaUJyblNqVGpDQmNXdDdFOVRVZXhsVzVGc2wwTzZneE5y?=
 =?utf-8?B?RENMc2pyUjBRbmRMRlN0ek9vUFJFVWgzNktSWE5FVG5uV0VTZWFPZjhQNkg4?=
 =?utf-8?B?ZDJHbklzSkVjZGlaVDNZME5kMHNueDdpNmp2MVZHUmR3bDgrYm9YeE15eHl2?=
 =?utf-8?B?cTcxSklrbmI0b2dDblZoblBXM0I0K1ZHTHhqNzFwajVuak5OaWI3VlF1TEEz?=
 =?utf-8?B?bDArczh4QmpPaHFXc1lLdjdrRkpKUlJBcjVpL3l1SUhSTW1tQ1FoVXFoTlFD?=
 =?utf-8?B?OVYxVSs4dHJ6SkJVY2tiNkpvR3VkU3JlUGQ2clUzTjZhWThBSDlhdVc3TXNK?=
 =?utf-8?B?ZGtkampiM0dreU9zWjY1WlhSWklLaWNOMTlTOWhkVXhZSytwWkRweVNaQmU0?=
 =?utf-8?B?NWt0eFZYSlQ4NHJuaDdka09KZGExZjdIc3VpRUJDbmRhMHRnVTdJQzlaZGtq?=
 =?utf-8?B?djZSV2puUUNkdnhXbDN5MnczY25BMDhpLzNNZHhTU2ZFY3N2M2VocTM3b2E3?=
 =?utf-8?B?Zk5QejdrQnZ5anUyT216SnJiS0g2amxTQXVpRnVkWnFOYldJd0F1akY1R1U0?=
 =?utf-8?B?eGh1VXAvcHZpRkU4TU9rdXpFQjY1TTNDUVcrdnByWDBHQ1BWRzRnTXdjQ2x6?=
 =?utf-8?B?SlBQSWh2RzRNM2cyUGNPS3hOM05Od3ptaFJLU216ZWNZckEzL2pTRXZJNDdI?=
 =?utf-8?B?WE9YcDljNFdPbXUra0FlUldDTG5RT3l2Y0RLUlNqMG1XaFB5Nmp4cFVjM0JO?=
 =?utf-8?B?cUk5VHFpc014cktVOUgyRE10VHo1MDBOQ3huWFlpNGtoWjQxNzkxY3RjVEpL?=
 =?utf-8?B?cGJ0bmd4M1NwQ21zZFVJSHVPZW9Cc2RZdld2cTA4MnRzem5wbFV0bWl4cFQv?=
 =?utf-8?B?TGIzYmJxRERBWUJIdk9INXZJRWxOTEFNQm1KZGduRm5yeEdHM3JPd0ZCMlFx?=
 =?utf-8?B?ZDQwTDNhczMxNDZHU2pMZ25EcVNZVis0WFVSOWhoZGN4d1Fvem12WXlDcVNF?=
 =?utf-8?B?SFhBRHcrY3FLVENocXdqUVNBeHo1VTJlU0UvcjJSRXpCZ09vVlJXVTNKNjEy?=
 =?utf-8?B?c1dZamtuMDlRQk9MVjNaaytFUGhDSlB1ZlFvSFlYcUpPcDlNb2Nja3d5bDBZ?=
 =?utf-8?B?QTlNeWFFMXJJd244cE5hdlYwQ2JoZzluWU9sWDZuY0ljVkdLN29nS280VmI4?=
 =?utf-8?B?N2dWbkExcTFQSXlCUjhMclF3UEI3UFhXa3NYR3N2aW1aRUREVnpFbDNCWWpn?=
 =?utf-8?B?Y1V1VkYyYUM2dGxDa2FCSXJxR2dxeHBIbmVLVFA0U292QlNZbnhIRzU0Vm5O?=
 =?utf-8?B?MDZHYm5CTFBuNGlLZUJkNWVuWnBZUXdnM3E3eVBGT0hKdTJ4V2x5eDVkNTRt?=
 =?utf-8?B?K0hTb0xIb0M3Y210RW5KUTR2YndJU1lOSFV6cXUyK2xPRGFYWitxdXBPTHpt?=
 =?utf-8?B?Y0JmRnErZDg3dUpUK2EvVHp6cTB3WGcwaGNEWjVzRDRyTEJ0NjRxVHlnTmdB?=
 =?utf-8?B?eWR5U2xzVmQyUGxaa3FwR2dYajRPUmRNWThzOTdyZVU3SHU2NDNGSVZzMFZ0?=
 =?utf-8?B?TW84aEpDZTFtNFdYZmQ0clR1RW4rWlRObjNLbjZIZmN0cU5zUHFHeldENkY0?=
 =?utf-8?B?RXJDMVRydU9ycUkvb2pPY01waGs1Qlg5K012WFdBdy92c0hiS0c0L3Nxc2ov?=
 =?utf-8?B?NE9vRElYS3VoSFhuek9MYnNDaE8xcDZjdWMwbnROdGVyODVQcHh2QjZmRTRQ?=
 =?utf-8?B?bnJna05VQ0o4c1E4REkwcXVMOVZzUDkvRzA3NGl4ZS9RcXBhclNTUTA0V2g2?=
 =?utf-8?B?eVNZNWtER2QrWUpma0gzN1BkMWM0RzlGa1c1L0M3WDltcE1ZdXNyTS9kbnps?=
 =?utf-8?B?Y1BEUU1wM0FoemZIaXROTWF1YzNQYXBLY2dVSUxLcFVyMWFMU1FRU3E0SmE3?=
 =?utf-8?B?d3VrcHJzSmJIcHZzck0zYktyOHYrUWJsNHRBODVWNU5uWFNzTHBOSUYxYzZv?=
 =?utf-8?B?NWZobGhKVjlEQWo3TitpRG53dFI5UjNVNTNrK2gxZnNFTW9pdEZaUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae7c11d-dcdc-40b9-683c-08defd2e38d6
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 13:40:09.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z30rhwVkUkj3EuIO85boF3913DtkG9infKfZcuQ10aBz1HUZ8mdIBeR0YnlZifcgFqO0GTpsrQyVHioUYhXeEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB9435

On Tue Aug 18, 2026 at 2:20 PM BST, Jason Gunthorpe wrote:
> On Tue, Aug 18, 2026 at 02:11:57PM +0100, Gary Guo wrote:
>> On Tue Aug 18, 2026 at 1:55 PM BST, Jason Gunthorpe wrote:
>> > On Tue, Aug 18, 2026 at 12:53:50PM +0200, Miguel Ojeda wrote:
>> >> Commit
>> >>=20
>> >>   ea7da3116015 ("rust: treewide: replace `__pinned_init` with `raw_[t=
ry_]init`")
>> >>=20
>> >> from the pin-init tree replaced the method before removing it, but co=
mmit
>> >>=20
>> >>   e052daab94ee ("rust: introduce abstractions for fwctl")
>> >>=20
>> >> from the fwctl tree added a new use.
>> >>=20
>> >> Thus replace that one as well to fix this error in next-20260817:
> [E0599]: no method named `__pinned_init` found for associated type `impl =
pin_init::PinInit<T, error::Error>` in the current scope
>> >>        --> rust/kernel/fwctl.rs:465:49
>> >>         |
>> >>     465 |                 match T::open(device, reg_data).__pinned_in=
it(uctx_ptr) {
>> >>         |                                                 ^^^^^^^^^^^=
^^ method not found in `impl pin_init::PinInit<T, error::Error>`
>> >
>> > If you delete functions like this then you break everyone elses branch=
es :|
>>=20
>> I'm not sure how this break everyone elses' branches? It only breaks lin=
ux-next
>> but that's why it exists in the first place, to catch tree
>> conflicts.
>
> linux-next is to catch missed things, you shouldn't use it to
> purposefully cause conflicts during the merge window..

That is an accusation that I find unacceptable. The API removal commit land=
s in
linux-next almost 10 days before you pick the Rust fwctl series. The confli=
ct
between rust and fwctl tree doesn't exist in next-20260814, the last linux-=
next
tag before Miguel sent the PR to Linus. How come I am purposefully causing
conflicts?

> So for example introduce your new API and do some conversions, then
> remove the old API down the road after the merge window is a more
> expected work flow.

I'd happily keep the old API for an additional cycle before removing it, if=
 I
knew that there'll be additional users. However I couldn't predict that new
users will be added late in the cycle after I sent my pull request.

Best,
Gary
