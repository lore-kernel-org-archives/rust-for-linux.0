Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7114E37FF43;
	Mon,  1 Jun 2026 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319288; cv=fail; b=q0HpyJpPuPX/TjJ3zqYUkNAT4Wd88/nmR3cVM6pVet4XoVUaYcA1jLAwhXvxQdTyfgezZ0Ysbsrc5ItA1YXlwb8aCoCOlibhbpeRUY4N6U8Sz3crduFmsm0i8nCbo/E8C2BtLh755g3OUb9kgd7itpv9xHAFhegwOgf7Kb8anDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319288; c=relaxed/simple;
	bh=X+As131sKjNK5XS1fJE9bKWWPkvTqrBYCtBcn8ikMzQ=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=PQKk590TVlm47p+TXASmi3cCF/7ux8I4+PIjc3Rcx7De4zN07xnLLIxIqEPx6jyg9DJ0Tys/+k2PPOmOpZJRKFLMwXOdcNMfTqbTy0o8cToPES1zbEdtqJOB7KaKrAtuuGl8pYr20GjnnZxW1D9h1b+Egv6CFuue3HAQimPcmVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=efAk030j; arc=fail smtp.client-ip=40.107.209.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="efAk030j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLeHJqNMAOi4blIyUvUMEjWT+9O87yvIAhW1/fF6tCiW4DNTxGk6z9DhtHzzDJ+7F+58Pjqi0JQvEuX05pv4WPmRwQLIGgUj1A6j7b5e/wmreZ9y65ghZFiaPQmIdLNnew+kUyJvbUrdLwlILhw3v0yY64Jg68iHne+RHTovp1pW8OM+Wowo3xUU0X9CPwC0MOpW2UOP5atSrntMegrHdu463846LkVmXg/6CbroVG8sw8iidRuwkyfmrbPIc84uP+/TURp/ECB9CR+YJS64bIKtHFuGMx/gTOYPTlKuyTR0Lke5HD9ooa5SXsSFK/G/17VH8VrVdSp8CrQhouklSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDw2UAf8whhbWVahukMDwLMgxcV5PFpyIHDHIBHpYEU=;
 b=kUROiELpM2bWHmbljpqubyspy/BBpEbuJroo6z+LIwaVXgXuUHKKWAueYZtQK/7wRKmpPkNKE84sqh+HN0vKCncuf97y21PyAHrxXUmB+5P7j0++TSgzn9YA7ySnetP5fPj1Zzf7Gn0qU0ncBePoCMjmg0wijaGRcHuIPAnPAsUnnpuxbBH9zxD60fALU5N+pJF2kqlyfyP/zlaP5L7uLPrqlEwor7Do7598Azgql5ubEwnwcjQxVQXf9Ol55wMFxY7h0/h0Ujls7JZN80TCvbPZ0XFqfB3CX16DYVPfCPzBz87qC9vNgMumvTZGdt/xuIER5g80L3sNIKKilCGfnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDw2UAf8whhbWVahukMDwLMgxcV5PFpyIHDHIBHpYEU=;
 b=efAk030jTYEPS2bSTd9fTBnxe2nb9PMcHKOTcMuQnfa4S6HYzoAIWbnkx4CKaXaKXZIAvt2M0kaN1IVpCaqGEblNIeb4ACcEQ9WQk4qQf3Z/2wRYR6+THBEZCHCYLxlDV+UdMmd5G1MmKfxX1a8MC+mvh9Vm/Wu4Z/8wVsqrjHJQOM1/MOlRZTbYfeTCBYzwhSgEVRbCdQiQSc7C3GTQet0qFBgV8cgNcblz4eiBsaar4/zH5T8tVRhyIrzuJ45td2jcY6atDusqHdXu6vMAJgDPdK9BM7e0Z2oQmh5sP8YJ89Ai+TkIBaZrQHFOPiVivQCNSAvryyvX1Gzf3nKpyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PPF0A63E7557.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 13:07:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 13:07:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 22:07:47 +0900
Message-Id: <DIXQICPUBDR0.L9ZG8IIGMHQ1@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 12/22] gpu: nova-core: Hopper/Blackwell: add FSP
 secure boot completion waiting
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-13-jhubbard@nvidia.com>
 <DIXJPV5RWRNK.OLQ2M3QL908W@nvidia.com>
 <DIXKNSBMSIEB.3SURNUK64U50U@nvidia.com>
In-Reply-To: <DIXKNSBMSIEB.3SURNUK64U50U@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PPF0A63E7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a77e6d-712c-4287-680e-08debfdecd40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|7416014|366016|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	WLKx7WVtzsF6EjUfw5Knc5UH7wMHWndi4R1hllIxsyh7efceXjYroE/H65welS1wfAzuaDmnyaLhLXzne72rshnUQkJEhNCLgpmNtnKV5R20BSo59X1Ynx/cm57x56b7UJtV5Xh2w7rjrpnbiWdXwGRRqR297mA+7Zsdpqn6mmWbHlBie/qOm9QNd6cg9BOPDdo4pQ5vxOhnsXr7OPRU7Ssx5EJEZB2Ln1OlUWNPhRivPrs1qXMnTlWb9TBqyZWIDnOJpH8jELJ46KHUMqnbiE4zD9N7kNGIVEwHgPO9HX2JIwdzuN22hB3XUDpuVoljK3roXiqaj7jVkEMULXz1RcMDLUUN371FSBpbJbj/maDzNK8W5pnVJxzSmqotMI7FDnsDfCcoRMgfzLirxo4Jw5sHGiTnlRQwgwG/6Z1z/new2N7z9708FdYm4EZeLj9Da6ERhpt6zHOpnnlg9ODj9w8a2ZBmHucBiDeuEX4sLcRB9xs52jZLAmMUklaCUJKfirudGB+fJQW1Hh1+WsOYh6rsXMRz7HM3pv+FqQrUsfYGdqU+rP8vz09HJ/oFXF/J6DJNwi5cqJl0Ehn1xUIa8STnt4OcNVYrrjZ6v5eR/p42gJ3NDlKO5yoZCgH/XXvkYOHEws1oGsfkPD8CSE5ttjxWeEAPmY9FfUy1Gzw+3YlM/YDYrmL7AfyAuu3dhfMsIps3LM39i7q9rSRKklL00w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0huZ1VqQlhLUy9vTkFqSGNhR2dSNUlLNGlOWXFIWWh3SGh2WWtsN3c5VWtt?=
 =?utf-8?B?T2ZJSjk5dmJ2TEQyazduSXZNVkhMSnljblRla3IwQUgrKzM1dk9peVBTY1hW?=
 =?utf-8?B?ZkJHV2NhQ0ZPL1BkK3VuaVdjNjkvZE9wa2JHb1RmRG9CcVkzRS9HMzRjdzF0?=
 =?utf-8?B?eUdoK0VlZkttbi9SOW5vSDFHVEI2clZONGl2eUhlRG5FcmtxWERNV0pjOTZU?=
 =?utf-8?B?bC9wRlhpa245V01GMzFodUlUR1RuZnNvSEdWV1FqYzhmUGlOTFlSbTIxU1NW?=
 =?utf-8?B?elNrbXFHSW1RMWd0a2tmeHpldy85cTBNUnR6T2tRMzM2V2JrUzl0aHVSdW4x?=
 =?utf-8?B?d3NxNEdxMlpsaUFESzhMa21Tc3UxV0pYYTNPNStpOWJyQmFFZ2M5NDV2NEtR?=
 =?utf-8?B?dVRtNUdKYm1YMHhWVXZ6ZVpoenppdkxzRGpXbkdMeGwrblVJczQrQkhWZk1w?=
 =?utf-8?B?LzQyL25vRzVyblZURlZteVUvV1c0b2IxT1d2b1JIMGVJRjVPRjZ1ZUpadUNp?=
 =?utf-8?B?Qmx2eitrZTZPU1ovdFRjS0Q0UVQwWjlMNXBhNHN2ZXdiaENrTTk5RlFINElm?=
 =?utf-8?B?TVg5UmcybTFhMkN4bWhPSkhyeEtSMDArTTZEb3AzNUNaMlVQeGVaTTgrRjhk?=
 =?utf-8?B?SFY0V1FRUlNOS3RYQ2d3L2p2L0gxcTVBbUhUL0p6NitqSE82SmN0YlFibzdY?=
 =?utf-8?B?MFhIczV4QkJSaitWd3hxVDFZVUZrL20xdmlCNk1CYXZ1RFdLUi9kWnlrUnhP?=
 =?utf-8?B?MFN3WW9jTVNPK0dqTG5qZmpzMzNNK29PV2xVOVcwTUFua0pETFZMTmErOUcv?=
 =?utf-8?B?UkxRU25FR0MrUnp1Mkl5TEUwWjVyWUplR1JaQVVKcGhCNEllU3lZTmZvYUd1?=
 =?utf-8?B?aVlNNURya3pYdkt0aFRrdWZXcU01elkvLzVmaEV5UG5iZzUrZlMzWGEwZHM1?=
 =?utf-8?B?Mmk3aU11OGJwaDhoaFhTaksrcm05dENoeGd2OW80Wm9odVRKRzZYdVN5T0g3?=
 =?utf-8?B?NXBLcHRNV0x3MTU4eTYxUy8xbU9aMU1wTlpaTzQzSTNocXk2RnpPaTFtcnBi?=
 =?utf-8?B?N0RmUlY2Sm9IUWJ4V0xhR05HVDNiYm1ENDJUVWdVOUtwN3ErMDI5dDJmL0N0?=
 =?utf-8?B?UUZJKzV5TWxEei9hRXRNSTloTFVlTjgybG5VTy9YU0htb21Ca1lERVNtOC9s?=
 =?utf-8?B?L0JMQWJJNUFXMCtsUHZwcmlPN2REVll1RmswZjNFTFFvRDZOTkw3TW5SWGlw?=
 =?utf-8?B?bjBEdSt2SWRQam1aUHRWVFRWNGk4azFXMTd3NGd6Nm83UzBqTkpQbFpqM1Ur?=
 =?utf-8?B?V2tNQ1JMTDBibXdZOGV0WmV2cGwwRkJQa3NReTlJU0Q1dlFZNlBLd1VCZXhT?=
 =?utf-8?B?dDNtRkp1TktqZ081eGpvQmJkZVpPM3J6K283TDJkdXlhdHIwY1VwWk5Xdjhp?=
 =?utf-8?B?eHpwQk5SRklSelgydkZoME12NjZKSFZqRFVqRzdYYkJGTEU5VVRnazZNT3VB?=
 =?utf-8?B?WHhUT2VEU3VsQ3RZeGQ1ZHgyUFBpSEx1Mkp2MlcycVpGUEhjZkgwRDdaK3Yy?=
 =?utf-8?B?aFl0dkRvZ09iWUJ0azh5bHBIQWpERDdBaXlrVlpVcVM3eGUrSzhBdWQwVHYy?=
 =?utf-8?B?ZnZoMjFWRjlyVDJxSHNveXl6NWJWd0VGRlplYmxiRGVjcnZCbFFsUEY1VHNG?=
 =?utf-8?B?MXBjaForQnpVbnBGckVWVGNsRTNSOE9UbVhMRmI3cTVnMnp2a0YxbG1pRlJB?=
 =?utf-8?B?WExuSnl4Z1grZGxCaGRBNkwvRDBFdmZyTEtoam83eXBqaXVaTzlSRHhuaHhV?=
 =?utf-8?B?dENvZU1tWVZkejBUcWNiT0d0NEhZM0tQb2tkWEdVbS9GM0VxMDVNMS84SWdk?=
 =?utf-8?B?bDRncXdxMmI0ZUUrTmg1R1lwWjh6NVBPOVBPeTNWUFV5cW10OEhoamxqc0dp?=
 =?utf-8?B?cDlVdE53VS82MmVOaTlkUVhDMGVQL2M3S0hVUWdrVzJiSXJTOWgzT2pNUzhR?=
 =?utf-8?B?YnphemZ0YUNrYlg2ZmowYTY3dmRkT1gzUkp2ZGZwL0c3eDYrak5sTGgybElp?=
 =?utf-8?B?c2orRkhnSS9yVGRPQlMvdlVTUXd1YnlHZ2RNcmV6aGtYb0RVZWJLamlyT1Mx?=
 =?utf-8?B?ZXNscXBuNjV3cFA5SExIUUhmMUQ4c1Jud2RKdjh3aGlzMnU1dVRDa3Z0NlBn?=
 =?utf-8?B?NDBUc0g0M1FScENGcC93N3VCeUM5LzRUODZMbGdXTG5oOHRJcTFuaGZDbklU?=
 =?utf-8?B?K0dQaEVqblR0RU96RGczUzJFQ05VUFZYSlB3VGdzNlZUd2N6OHczUXdPL1NP?=
 =?utf-8?B?L0xqT01lc0taR2k2MDdweFFTSGYzZzBlZERhR0ttSTMyMGI0dGhrZ0czbTZS?=
 =?utf-8?Q?l3X13Dg2qm+KUCist87fEtqNuID9aGjbd/s/+z0+ANW4Z?=
X-MS-Exchange-AntiSpam-MessageData-1: Ugez/X2b7DYTPg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a77e6d-712c-4287-680e-08debfdecd40
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 13:07:58.2893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UznpmUGKQQJJsPaVN4T1iyD1wjBBGnM4ATkC58Liijrzu8GPSBtTPaJFdHnZlPy0vz8ND0hI6KXrUo3XqDSgmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF0A63E7557

On Mon Jun 1, 2026 at 5:32 PM JST, Eliot Courtney wrote:
> On Mon Jun 1, 2026 at 4:48 PM JST, Alexandre Courbot wrote:
>> On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
>>> +
>>> +impl Fsp {
>>> +    /// Wait for FSP secure boot completion.
>>> +    ///
>>> +    /// Polls the thermal scratch register until FSP signals boot comp=
letion
>>> +    /// or timeout occurs.
>>> +    pub(crate) fn wait_secure_boot(dev: &device::Device, bar: &Bar0, c=
hipset: Chipset) -> Result {
>>
>> ... and with the design proposed above, this method can return
>> `Result<Fsp>`: we are not supposed to use `Fsp` it until secure boot has
>> successfully completed, so making it return the instance that enables
>> the other methods guarantees that this has happened at the API level.
>
> I think this is a good direction. I think we can also make FspFirmware
> owned by this fsp::Fsp object - i.e., move more control of FSP from
> Gh100::boot to the Fsp object. You might need to change up FmcBootArgs
> and e.g. return something from `boot_fmc` to keep the DMA allocation
> alive.

Good idea - that would also remove one parameter from `FmcBootArgs` later.
