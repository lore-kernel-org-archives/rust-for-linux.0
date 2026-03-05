Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012067.outbound.protection.outlook.com [52.101.53.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D261BBBE5;
	Thu,  5 Mar 2026 01:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674589; cv=fail; b=u+Z0ug5/VUkR9oLUyXOXe3caCG/eZeWTOwNmQ58JPPElml95dn99w91Bw3cb7l1qdg5FnVlMaU2n2u6NrvD9CaYlVRHjQsgTAHXvwPvlaLxJJMbstNQ251eL1KFlBNvqh4RXezcSLx6YeU6VZjcPUlF2IhUYyqWrW1J5Cgt0gdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674589; c=relaxed/simple;
	bh=BowRfIqah3L3k+VeR+EDYk1YHA1ZVft1KPa+Q7WnDqs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=sltO5FifK4jAs3erbX4yfzfIhuwXstIBYXdOgouI2v9mkEPErERKBr7D1lXXuMNJ/qkAXwfLnuqErjKChjVniEUbwGD0So8/mNaWzm7hJiFcsXePauxdDhM4wfX7tMRxWWijUwkQi+VygIKRgVMvfcTaJSdhrFmLP1lpvIjvwS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YSCcbrLe; arc=fail smtp.client-ip=52.101.53.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YSCcbrLe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwBakWUZ/Hr1dT0V9f/+pVYVvhkiMFOjlIEBbqDIrurR2KcUvM0tdzFHjvrAjhLnaDmjWO5+XDuBfVw8YaFONhS7fTuytSi7WTQlZJoMjycOx5Wpba/IZeRCYsuLiEGW801TZSXX7fmXP7pWn1xUZbsiESh6hIANQSDSl3L87hsNDxHiRCmrB2FcaEl4pMrrE8s2Bc0MkXIXVOt0gGNgM7Fo5OP2DesTCA/k0HrcNk1gWniKJnLmSa/pYz4+llUmWtLxc4faMNqElDWyqnr/9t+FtwBucROwE7MAFhDB635UtxN21kdVMC0doYTjkXDzeVm6KHg4Cm5kZzzlFb42pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x26P+XBw1Sags0L+iW1zH7gY+v0aDccunOsy5NZrNF4=;
 b=DcERQ0Of/BVTRtsEzwVlXCz9N6/r+cv1q7XFSuhUv8BGo58UtGsPWRJqjRrcnYnYhZp5toTnfLXO3Fqc/DOEfV6cC3weJoEWRxfeFS7vnUhs6wQoMZipFBsQNwRhDLPQOVhg6jTHX22r6xiDvUV72vb3+Yab09E0EWqk5UoZJ7AsfDCTCDgBw5RtHmBMAUBBtjcHY6b3A0iIzAaeA8Y/qR3OBMYTQ8Ck4ahxJqGyUASqyZ3yxRsoGKEZiyEa2Xty9mb3xyRqDmB2Rma2zF7y55t/FrverpnXqpwmj2csWKsgd5jMRvd3Jiu/t6IcdVF9XTg7CF504w6m15vhd0dK9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x26P+XBw1Sags0L+iW1zH7gY+v0aDccunOsy5NZrNF4=;
 b=YSCcbrLemKATJ+xkLJBwsQrZokNRTA3ZqIKjJI1Copz54n02CEsHfheLRfiXdrbmPSliyMSkpekCp+Q9xJhviLIXrSSMid+43WYLGUqJL5A2OkeCriSNQTbptqUr3sqsTNuz0GFBA5isMpQk+mfMLxDN0jF3D4K9BSbmQkjFwng6R9IxVwYRguvDgQV4c0LE7P/Yr7ebd99lxpl9lRahl6mV917wgjPFirhjYCA1wA7mTPY564ypHRuQoOCyflYEAdR9M++UZJq1p1zzm7M9MggbCZSDdM/6uATssEW6JSXXDhtG6AOVC51n1ZFploCD5iKfJ2oBV8O7cePWEmjhEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 01:36:23 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 01:36:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 10:36:19 +0900
Message-Id: <DGUGOZL05DFW.1KFP9742934H7@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/5] gpu: nova-core: gsp: add mutex locking to Cmdq
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-5-a6314b708850@nvidia.com>
 <DGTZ9SNDPDMB.1MGVRZEY29WKY@nvidia.com>
In-Reply-To: <DGTZ9SNDPDMB.1MGVRZEY29WKY@nvidia.com>
X-ClientProxiedBy: TYCP301CA0017.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::8) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BY5PR12MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc8f735-08c9-4f21-4157-08de7a579c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	rbZMHkZ3hf4su6ERu6Oa2h4LEEcpVA4YyTrvW7vuR2qDRKJgyuym74cbdft1TwLZkpINjAb9wvHGmHSV/nkonA/bNRqyoWybFgaqq12joS0xphKwLfUgC9wQJTblce74HrKszZlyfWCAyHG94BsRNPxrQJdczyohREb8v+CrP/NzMlutEIj+iOoCCOlZ8iKyx5SUimOxyZfdViRuG6p27tsM6DWmrOOUMgBAF8Pz0C1TAgLVnALr8+HVPndH7VaNm8QUsb382JxCLnMx6OFJ211oUnMDSZ62m1v3KiwZ2LTDFxSuUfYbVLp8JVlqYK/pBm6Ptk1BcGBESkLvHhqhpRD0jbEL6A0nO90q8mIlHeYx3OFTHRPSfSBWDWjO/7pQ/vWJVJFF1kghQ210YLtFFlh62B3KYGhZwSSaPabJqLhGjFhsvI4W43+NmxIqmxAQZbSDCEzYBtIUBLimDbQYylYNvEpyUyh2c8W4T4y/ATq0NaZOGrOkTamyL6a0/n19MGhFLp6fRGO3B5Z+Sj3lwDjqtyJDRdC4OuUsfveQKnT0uzeqToY29pMpuU31HgZzm+iZK5TriPBbbHLBn8k24x3Nn9ILq3QnBF7wH9JllS7NGGnpAreEQknpjoubel7iZ6ws+ZDM2CnoQ4KGtc9w54QTqKPhQMDm2O/qZG16V2I3LmD9UoBNPfA54fRI+SvJ+nJS5ZvJ6QgB+Bgx+EmGIdD1JUiQrLAPCMNMJ6ngAy4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2oyZGFOS21HcXdTMitiVzRVaHF5bGZhOG5XL2dYZldrV3NGQkYveEVvbW9r?=
 =?utf-8?B?QlZ1UE9vZnJRcjRuUVJZSGFac0pRN09CS0t2dkNjZUZ5dFdScW1lRUt4eE85?=
 =?utf-8?B?UFRNWnNBbTJ3Y2dHQzl0NmxoNnUzdlFxNktGY1FpOXdSb25sN3VnSjFzQkZv?=
 =?utf-8?B?Nnl6N21nS2RGQXdHRTZJaFFuclNDeHhHcDVZUGR6UUx3cDJDa1NzUEFhb2Jl?=
 =?utf-8?B?WUkzT20xakUvbWs3RVNRSjdyZUljZG84QTRiRFladU1DMExucVlveUg4T0ZF?=
 =?utf-8?B?MTBVMkY0bmpscGU5WmpjckJYZDBHbFloMHBlbzJiWE1PNVo5K2NyaHVKTERa?=
 =?utf-8?B?V3d4elZHcHBPS1JrcUZiZUh3Zk5HNVpQWGQwN1VMMTE3Ly9FS2dkbjh3REk4?=
 =?utf-8?B?d00vbWhNV3VYM0ZWWmJnTERtN3dHZ2lhb3lpV0tiWHJ2WHFKUzBZQWllN0Q1?=
 =?utf-8?B?NVNqZmJYbFpRUGJ6YjZBZzE5NlVQQnRINFh3SUJmWlg4WjF0ZFFESWQ0dVVM?=
 =?utf-8?B?cE1oRjNMejQvUGhJWVJ6RDZuNlZvbnE1bVZDaEtNVDRpcFFZdnNsclN4ZXRu?=
 =?utf-8?B?NVhwWVBteCs0TStGMVlxbGtpOEVrS0g0dS9haHRiT3M5MENQT1lwU2hoWlAy?=
 =?utf-8?B?aXgrN2xoVEw5YzJRakFMeDZlSFVOc0lFN3VuTTE5aXRDU09helZuNmtPbEVV?=
 =?utf-8?B?UWRNUGJWWUlBcnI0cjRZa1Jpa1pNOXNNU0JyTVpkNTgzTjZpK2lHOWVxSzY2?=
 =?utf-8?B?ZmNpbUtEWlliRkJGN3kvVHpwdkxJMGZjWVFaNVFQdmh4QlB4WnIyMGpSNEpC?=
 =?utf-8?B?TmlkWXVraWxST0N6WmxOdkhJUTFPVHBXM09SQURtb2NuKzBnU2JuVFBKeFVu?=
 =?utf-8?B?UVI1UDlicUtnVng0RXR4LzFYTDZYbTIvTUgvQW5JTmxGVUZyaTlBSThIc3pp?=
 =?utf-8?B?TnpqUUVBd21CNitpRlZtOW93bTZnU2s1Zm9WbUk3T0R6WVlody9zbGF1Skl4?=
 =?utf-8?B?YWdpcVRaT2RjU1RybmlZTWZ3dVM3Tko5ZWU1eXhSbXNzWUw0R2NnNThtMXJE?=
 =?utf-8?B?QVBkVHRicDF5OGgxYTFUUy9UQ2cyUHg5c0N1YjNEcWlpS3NaRWNudXJncHI2?=
 =?utf-8?B?SGMvemZLZWxDOERuQWdvSkYrdE5ld0NqbXIyT1A0T0xpVjdBaEZiRjAxSHFQ?=
 =?utf-8?B?bXhJNkdVNXo4MGd6L29NYzZ2VXpQVWYzZGYxS2hUZUZwdU0vZllkekhqZ1g4?=
 =?utf-8?B?MG1vcVU4ZVZlYXI5KzB5Ri9HR3h1WnExTGw5ZGJ3OHlJTEl1VUNMTWF4SlV1?=
 =?utf-8?B?cUxoZVdBM2tIamhDM3pkYzZIN29Ub0syM2hZVDY3QUVnd2NndlpsdEU1NC9j?=
 =?utf-8?B?VzhqZXFVeUpIcjBDRXdoMWtBUmlYalBVa2lMYnk2bThuUVNrZ1IwTWcxaDhZ?=
 =?utf-8?B?N1JWRXBmZnREK0hKVnlSRGY1c2cwcWhNZ3Jtb2ppTXRta1ZNWFZlSGxyN1BB?=
 =?utf-8?B?dVBZMHl1dm0xa1Zmd3ZUdjBlVmVWcGhLQXJPblA4QmlWQnFOTTJQY3FadCtD?=
 =?utf-8?B?dzBOSVY4ZmxabElZUHA3UEFFN0FMRFRXUHhQa09DNHVheFZlOWZjMDlFU284?=
 =?utf-8?B?d3JENnB1UjlWa2RjVnhzTEFxRytkcTdpZzd3ekpwOGJwKzZ0S0xKNk81aWI0?=
 =?utf-8?B?SVVxZDBMSGc4YTJIMExqQW5sbVNQdzl2aXFXUUMwZWxHbVVRQkNvS1hiUFJi?=
 =?utf-8?B?djg3MlVCWlJLb2IwalpYcjJoVGY3VWlsekhNZVFZdGVkaTQ4RXRVOWZpZ1dk?=
 =?utf-8?B?bDdZcFpHU085RGorL1JnM0VvKzdiRUNSN3dwK1ZvVDVtdVhqMEhMOHcwWlVM?=
 =?utf-8?B?L0lpMEgvSVRCY2F4clZuaFY4R3ZLZUV0MkdKYU8zMyttUHZLV1BwZURaUHds?=
 =?utf-8?B?aDZidW9YYmVsN0RFZEQ5WjFVSXFUTE5uenJMQ0FzWVpaOHlkS1R5bGNxL1ZK?=
 =?utf-8?B?L1lmcllxa1VZTTJpdHU1V3RCMGdNcEQ0OVJEMEpCeGFTNlFjNnJoQUpIYjVM?=
 =?utf-8?B?THZXcG1JUC9lMXg2WGxlNU9MMlN5aFVBUVkyMEdzYkRLN00va2dpWXNSdzJE?=
 =?utf-8?B?c1JiejBENGh0OFlIc1dLM1d2cUwxNE9OOXFkMVpQVlJSUUs4bklNUGFlOWhO?=
 =?utf-8?B?ZU1ITEZhY09qNGx2UzZTR1JST3h5SzFoZUU2T3JKNjd0MTJwQlhSendkQXhP?=
 =?utf-8?B?M2lic0NJR1MydUEyWnJYcFFWOUllSGt3dGFoYzFyaTRrcGM0WHZUZ0Z0Qndj?=
 =?utf-8?B?QlJlTk1HaG0zUGI0VnU1Q2xMbUJ5WkRZTjg0N1B4WTZtTklMaWJ6Yy9oQk5a?=
 =?utf-8?Q?21a1BOhoEQkH+m3KJORpZOb1IHVM8HaR0ZZMBhilQBkIE?=
X-MS-Exchange-AntiSpam-MessageData-1: srLFzjFjTrbXfQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc8f735-08c9-4f21-4157-08de7a579c15
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 01:36:23.4059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3DNSVuJXkT6eG0g9Ot53sGXXFy0PATmFGKAhvDUdlShfZSFiG8Ce18CQVezwkPnsfqGw6+rB/iWl61X4q6Omw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306

On Wed Mar 4, 2026 at 8:57 PM JST, Alexandre Courbot wrote:
> On Wed Mar 4, 2026 at 11:46 AM JST, Eliot Courtney wrote:
>> Wrap `Cmdq`'s mutable state in a new struct `CmdqInner` and wrap that in
>> a Mutex. This lets `Cmdq` methods take &self instead of &mut self, which
>> lets required commands be sent e.g. while unloading the driver.
>>
>> The mutex is held over both send and receive in `send_command` to make
>> sure that it doesn't get the reply of some other command that could have
>> been sent just beforehand.
>>
>> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
>> Tested-by: Zhi Wang <zhiw@nvidia.com>
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp/boot.rs      |   8 +-
>>  drivers/gpu/nova-core/gsp/cmdq.rs      | 247 +++++++++++++++++++-------=
-------
>>  drivers/gpu/nova-core/gsp/commands.rs  |   4 +-
>>  drivers/gpu/nova-core/gsp/sequencer.rs |   2 +-
>>  4 files changed, 146 insertions(+), 115 deletions(-)
>
> Most of the diff is code moving around. I've been able to reduce it to
> +107 -76 by moving `CmdqInner` *after* `Cmdq` - this makes this patch
> easier to review imho.

Thanks, will move this then since I think the ordering here is probably
not too important to readability.
