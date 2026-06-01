Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309F33E9C37;
	Mon,  1 Jun 2026 18:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337943; cv=fail; b=I3vjpcUAtD2j4zwjpQ99qP8LV2v8vESvHp05cFE/dxtB4DyMNCR8UG3cj0WkYyjxx+PkGXkEqhdPr4AK++iLrPgWIL5vVWh4/KaTFZmsF8MCaZhW7R3sMD0Xvyaj6PHSZ7PE9pIvB1fxLVNS7yQ8MsyFdp/rrtGdO6w8wyA5raE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337943; c=relaxed/simple;
	bh=VpeMABrUu+S8+RunxJEt/ImGml9vbEJn78IdhXVt550=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NE0utoXt842eqyuyEwZIoJuLFGbLpHbsqcy8ruqwWWWO6bxuGB9tC2ohzSNBVvP5oQhegTo7NnpnR3dW6OQN2uV/644qinbSYh8C0hAX2Sx70zG5KmLnbJ/pql2YXj/twrwmmpB+OxPy2y6gf5d6rUY5gik/BbztspGqE4HsCkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Xd22WGFO; arc=fail smtp.client-ip=52.101.57.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xd22WGFO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubns0UK0+XsfC6jPtebBbUGpv/rIJ7c8OXcn2hr3Y0eddqEwLUn38cj1WdcD7l0ryjml6py3W4oeg7i8yZ2fn6NYSR3L91BCQSOhxhLxl8AINwY9mbyAxorIjfxiqr6KuGJRA1Lgjhp3LaWWRaeDFBNE9F6mWGLyufrlLMT/njP99nvxGjBY2Mr0gxA+T7MbLz8Ty1sfl6yHsaotr7zwT7MTCZ2ouZ7i0Pigf5nChCXay1rHdkjAujYO0T7gp9F6DT622n6wFJQvL/xGBC4dss6UcTHYwM4Fz74dVn7+cDf84wfO/AhsBceO5qJtY2960epADaAsFI+9PZ939zpTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdwRACJpxxUhVdrkR+zkafNXJlE4bT3B8xoQTUO23+A=;
 b=sNTrKNWOR2jT4Omz9jWEaOSPCUcOkJX+MezcnJVZOQzqYFq6mcuUIQw+BBDM2mGXffomFZiTuIo8ius8QgxwLUoT/cfVkxTaAIK36qq+Mn1U//3jAAZ0oRrA6uAHEr6oClnv2+ldasvuaFgVz9YvfwcTtOPYH5Nx4/KTDIo33l1F4GPCwFjHq7K1yqoNmhw1rEGys1OSRp/un7304XfKbze35+bkKaTOSxoxqCF62UXQe6K3FSctUc8Zo6BP4u4NZlt5oYl0/qOZI6zu1Vq4eCSR1Y2M23dXt/bfPTOnMiZMCbJqtHnKXXZnI/Q8RWjYsTqpciYmWUc1UlC0oJdjDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdwRACJpxxUhVdrkR+zkafNXJlE4bT3B8xoQTUO23+A=;
 b=Xd22WGFO6S2gAVMqzA9KCC/ro3Ec33smgnltyBFp0JAA4UXvux7l5WJipEOKAH8XaZR84N7o9QxBEiZpmZn10aeRr1DGKawKkgbUB6otjRPK+s7ak+gZvibiiQFJ/lk+9QRYUuNpAH6Ansm3kfckanQJIdJedsPmtFy3aYVQQDqBMAC4Pl/nvh1uPR5ZV84qfaIcmdxaFafhM6JQ0wBuIGhEI5ynfuG5U3jv7LRN7UGQ8NJGqlC0ho2kDGaV0n8/+/6X3BE5GqYCWoUvv8PTGJhdSi1jWZoVDvcNStr9WgSc/k1DpPg11rZ37+ymhbdFodON5UarV80SwD7L1Xn5rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CHXPR12MB999244.namprd12.prod.outlook.com (2603:10b6:610:2fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Mon, 1 Jun 2026
 18:18:56 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:18:56 +0000
Message-ID: <f35f8864-ad18-4401-a312-7a7fbf97cdc2@nvidia.com>
Date: Mon, 1 Jun 2026 11:18:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 12/22] gpu: nova-core: Hopper/Blackwell: add FSP
 secure boot completion waiting
To: Alexandre Courbot <acourbot@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Shashank Sharma
 <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-13-jhubbard@nvidia.com>
 <DIXJPV5RWRNK.OLQ2M3QL908W@nvidia.com>
 <DIXKNSBMSIEB.3SURNUK64U50U@nvidia.com>
 <DIXQICPUBDR0.L9ZG8IIGMHQ1@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DIXQICPUBDR0.L9ZG8IIGMHQ1@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CHXPR12MB999244:EE_
X-MS-Office365-Filtering-Correlation-Id: 8689cab9-8ff9-4c5e-b52c-08dec00a3e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1ykXPD5FbNCAMR/XEGWB/cErobayHYQ0khUuWbJvIZcKjTPdhGCXdAipubyZWZyERANyqPSHdk6feRkv7EArpio7aJPDVMLEZ43CQQrHPJo43EXcuB5Y6rS0KudcgqYK7+TPlufhEuqyec99+DJcy5brXePNBSHiCJwYW7tZKnTfyk36HR7v0Nb/2LiuYUrOCZT6wDq3iCQY7hgLKwuILU2V5HIIPLEudx6gobY86dlNrptaWUzwyJBrmB9esxH3VxwStKqvMMY/njgm5zOvshdMogg/R3YFIWF65OYftEReO2L4DEt+DSTjGcLPgWOIzyiBXo66SLU2iKqZFMQnkISP1miEE6/ugX/1soc/RKsMwdgfi9ETWbB5N/mo1uKKJZM9o97J5hz6yp2xNg5G2BcE5Acs4KefJurxJFm88KvucjP554Zi9134GEtUriRJT4nA2YyrF/Wq0lDkKwdTZsW6mmSKxTTiRr+ayaW5fqVVC3E+w338VmNsuU9yTpPAYQ/CXSok0zXttqBa1aNEapD56+QDQ+c8Xr/MBAZIWzhqB3jyh/MoWHmwIqfMfdU1pNaDoRCRG55wld0DdiokI8Lv/LcITJD24BnHO4VCLN5RZ6n2xYIBdBrL2JUksKmVe3EMKXKBU5mwoQhRZtP6y2hgsqdHbZuB3L5HZBQJ9y/uXNk3PKuTKHipgud3QHJl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmR3Q3MwZUhZeUhjZXlqa2tSMENTU3dWWktXbE1ldTRGbTU0eUpsL0p2R0JU?=
 =?utf-8?B?YjBNYjkyeDBoRHZwM0ZldWR2b050ZWh3ZjhMOUNUUjByZlJhR2FGdXQwZWJ0?=
 =?utf-8?B?S05KVVA3NkJqRTAybDhZOEt5VFRLMEZmTjdreCt2MFJGazdhSWd1L0RYRGZ1?=
 =?utf-8?B?VzdkMkY5N1VvdlJaV3BHTWJ3ZUl5S0FIV05TWmthRURyQzBsb1ZGcVVXVVpj?=
 =?utf-8?B?ZEV2ZUhPcW9BK0ErZXRzNGNZOWFiclhwRmp2S2t1WmY5Um9sY0dPTXJsb0Z1?=
 =?utf-8?B?V3J0TDRDR1Ric3FobVRaTUZ3aEF3QzA5eXNzOVdPdnEwWERWMEFtcW9SanZG?=
 =?utf-8?B?KzFRelFXbGlnU1l0YnBuMXkvOTIreTVpR00rbkYwc0RwWkMvNk0yKzBTL1l2?=
 =?utf-8?B?VFBlNWdQRC93MC9LUEpQSjgva1I5d2xpU3FoUGNTYUF4dFJadkFGWllqeUZW?=
 =?utf-8?B?Z2dJN1J3bGQxWEk0ZVhob255czJmeC9xaHVwekxwTzRzcUhFcW1sQXRlaUI3?=
 =?utf-8?B?d1o2bklpOHpSRldyTzNiY3BKTUFCS2dUZHdXS2N3UCtCRTBmV2NUc2k1emwr?=
 =?utf-8?B?dVQzYzZCaWM5UFBCekpVa2JCUjBaOU91dzhwT2VMZ2FXalcwOXZuVEVWNmZS?=
 =?utf-8?B?cVhzSnRJQXByMFNMMVVjNUMzeXR6SDZoaU0xenEwY0RlUitxTi9FcEV0dzlE?=
 =?utf-8?B?UjJEODdEUUVUOHlkMFUvaWV2YVdnUTl0Rjh0RnlFenNrVUdWdUJ6d2tESnla?=
 =?utf-8?B?Ym1wQjJyS3czN0VTbWFwMXBKb2UrOXgzTkh4RVVqYUpkT0dOWGVZazcvTzFN?=
 =?utf-8?B?T1NYSkdraWpQR1B3Z0NDTkNLUnVyYkNIMmQ1c3MxbG9yS2JuZkpwV296QTZF?=
 =?utf-8?B?Q1BuWUZKNnlhMTRXK09Udmlkc3hacjdvaDJPR1dGNjNoMFNJRlQzdlpBOFh6?=
 =?utf-8?B?M2U3QzhTQ1hMV2dpbUpBYUc2NDhsV0owRTF6eGtwUGhQVU5HSkdkRnQ1TS9G?=
 =?utf-8?B?Vi8vZUJQaUR5M0NuR0ZwUmhMWmRaWjZMbVh1TEQxTVJJWTlDS1J0aHZNWjBl?=
 =?utf-8?B?bVJYOXhTSXhUT0U2TVUvSHQrRkNtYkJlc0JiNWR4NXN3WjBHVTZ4MUNrdU0x?=
 =?utf-8?B?MzdlTnFwa1R5S3Y0VDM0c3B3WEV5anR5d0JjaTUvOE14MldSbzd5bU9HaDhl?=
 =?utf-8?B?UDd4WWp4TWZkcmFnOXJlZno4V2hNaGZsZWVkTjFmSjBTMytOZDRQNUFCS0lr?=
 =?utf-8?B?SjlpZG1DbS9qYTBqVTlDZE10Qmp4N1NPTThVazBjK20vQmpIUFQvTm84TUVw?=
 =?utf-8?B?WDY1NjIxdjM1UEYxY2pUVnlsdno4c2R2ZzNFVGhPa1U0dG5rL3JuNWlUc0xQ?=
 =?utf-8?B?NjR5Nk8veHNwTy9GcWY1b1Q0S3RObmVmR1hTVG9vb0tFTlFpUHNOWXl3TXM2?=
 =?utf-8?B?ZEViSUpUYnpQUk9qTDc3VE1hYnBRcUZ1K0s3K0tnZHFFc0tOMWZidFVTNG9C?=
 =?utf-8?B?VmZseEd4eEFBTVJ2d3BFOG4rNDJFWHdjWmtaei9RK0N1RUlhbnh6VGFucUtz?=
 =?utf-8?B?MVQvMDFqYVZVNUgyWUFyK1JiVEU2aEtSZExPc3lYbUhTUDR5STlXdW9lUWFH?=
 =?utf-8?B?WGdNelpOMmVGdVUzSWpadjRwZ0krNjZuWWlocEE1VHA0RFdTWXdNZGI4bmVH?=
 =?utf-8?B?WG9DWlpucG9kM05xNDRwY05ybGdFdG9kbUFlZVhSTDJ0MXhXVmVXUWlRZmJ1?=
 =?utf-8?B?cytjLys0M3gvdStTTnNOVTJBVWZaZ1JNbHptODBhQWdGQ3hBOEUrOTNjVzcx?=
 =?utf-8?B?M2pWdE1KNlJpaG5NRW5vcmNaWDlGSnFPY0VSajFZQm10alNkYm1oY0w5d3JB?=
 =?utf-8?B?T0pXMWthOWFIczVzMmw4UnVkRkg2VldaZm9KdC9Xbnh3RGlneWV4ZWg3SUx6?=
 =?utf-8?B?S01jNHdpSHpsK0JHaHg5YUNONTJod2RNZ0g5Mm1WdnNBUVlBaFJ5UncwUUda?=
 =?utf-8?B?MElYdnpMckJHeEVhU0tvZXQxTGRSQjhOUWZ1Z2NlMGFsMTVLbU5uNWR6ME5R?=
 =?utf-8?B?b2pkQTkrN2J3Ykk0S3R5L1pKakxGajVkWXdDMDEwL1U5Ykpyak9jbWRNdlN2?=
 =?utf-8?B?VmtsU0VLS25YUlRNczdUQ2FBNys1UDMwZlAvelVEd2xGVldXRnh3Syt4OTFB?=
 =?utf-8?B?am1jekxxN3JqVldqUjRpYUlCZ0F2eW1NbDEvTDVzZ3l1czhYMzcxdlUwcU95?=
 =?utf-8?B?RUxKYStMbXlaYkp2VXhPeWxTSERidmhRK1hsMUlsa3dMbDhGZUZCRXNLYm5O?=
 =?utf-8?B?OU5sL01HV2tlUktoUkRvdEU3MGFPLzQ5Tmg3RG05K2YwMXlJWktmZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8689cab9-8ff9-4c5e-b52c-08dec00a3e1b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:18:55.9576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbWxvAeNQGh8B4LSAip7U6ZSfwiGkZWWxMad92aDyDJEjwFloSokfkrBWmRm1z/qzzaTqFLrQfO0R0aIY73l9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR12MB999244

On 6/1/26 6:07 AM, Alexandre Courbot wrote:
> On Mon Jun 1, 2026 at 5:32 PM JST, Eliot Courtney wrote:
>> On Mon Jun 1, 2026 at 4:48 PM JST, Alexandre Courbot wrote:
>>> On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
>>>> +
>>>> +impl Fsp {
>>>> +    /// Wait for FSP secure boot completion.
>>>> +    ///
>>>> +    /// Polls the thermal scratch register until FSP signals boot completion
>>>> +    /// or timeout occurs.
>>>> +    pub(crate) fn wait_secure_boot(dev: &device::Device, bar: &Bar0, chipset: Chipset) -> Result {
>>>
>>> ... and with the design proposed above, this method can return
>>> `Result<Fsp>`: we are not supposed to use `Fsp` it until secure boot has
>>> successfully completed, so making it return the instance that enables
>>> the other methods guarantees that this has happened at the API level.
>>
>> I think this is a good direction. I think we can also make FspFirmware
>> owned by this fsp::Fsp object - i.e., move more control of FSP from
>> Gh100::boot to the Fsp object. You might need to change up FmcBootArgs
>> and e.g. return something from `boot_fmc` to keep the DMA allocation
>> alive.
> 
> Good idea - that would also remove one parameter from `FmcBootArgs` later.

OK, I will trot off in that direction, sounds good.

thanks,
-- 
John Hubbard

