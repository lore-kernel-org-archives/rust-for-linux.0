Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011049.outbound.protection.outlook.com [40.93.194.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78A137E2FC;
	Mon, 20 Apr 2026 03:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776654630; cv=fail; b=nNNqLrDPrKTY2munIXHIkAO9g3GAd+0RsBdSeiQEFPSS1zLH6nN0pKe19IEvmTZX+ePuo3xgl1sykQm5Ipve3M4iHK0HODSUOoxMmkvi2ROhOSL8IDEQOVrl36NElF3QBvsY8K4/1cFaRcPZJUUz2ZPvijkLp6kyJZw6RcsnQrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776654630; c=relaxed/simple;
	bh=k1EM10lI2wRueQCJdb/wioeiLbwA9GqDEwIEuDN6hHY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=RPWiWQU7SLMDtdUrIbgrpEzZw0Ds1qEHAD103hsBMZxgF8NtkOyQsajlCEpVX/ze8S2sAhqBzDJmYOvA2BVWe0uDKqpPiDwJ+n7VGiMa35IqDrlmF3KUFjRp6TFeaJy/UxTlZo8uoZy4VYp4USjjsK/aCe4qqGCxr7pyYv+hTBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y83BGiYF; arc=fail smtp.client-ip=40.93.194.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y83BGiYF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PI0VFjwop3SU6WmNng2CzT127JDMLTt4j87xE8mx4/CQf7eG1aY5xC6ny2zbh/T8Rz+vacYNJiUjZw7Zu10oo9ZmEuzddVpJCaRcCtdrz2elRGESNigaL17RnM1rG7SYsiljrpxs+Ulp0qFjFFbxfJK6RgqTse2Aym8JDh9+/u6Sgl4sz+kPBKYzbh9tRzphb22vumn3Td1DpnYrXzVW+3v0LppNimAp4lRjW4m9XOKsYiYdEtEp1mABJm6WcJNCbPDX/CkE5lCm9d92vkGNWJ0uCtv0niELgLdkpmm3UuTU90fo0wlD0G1V857Iebsf04PhHnB0mV3qI+M1brvgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7XwKzzlHc3sk3hvobEYhhEtN32sH4B8TsDYcPYbLU0=;
 b=GZkWC++noOwJilE/TKJJGzwOg39Z1BMDl4L2H7zoVO/pG7JD5w5cjLZ35ffk3L1qBItOVIg8w03d/Qls9R4c0dREJ+aLO3zjXyvvNefPB3vJu8tFm5++n184VbA5/0OjPq6smok2gsm5IMOS113hx1oj5gUky8ATWmRorZ/dkCAlguIyPF+0783CBX9QuUqBtngX7pyCXzzsZdZNedjn11teNjwUUyGk3sjs/H2WUmQm2mcisGjB/7z8OwWbSwQn8qI2+jGKhK4rW9GfuJXI4Dvx8pndn/FdKIpkYSr1pKIPlOJCraSeYe8J0hNUK3Ku0GkRC3hf3gy1ORPXaKrCtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7XwKzzlHc3sk3hvobEYhhEtN32sH4B8TsDYcPYbLU0=;
 b=Y83BGiYFQhU9ebYpuucpnkvc0/PYuVKis2DGfuA9SLGAbKI+4cjWDknjk8duoMFsD7+l5u5fa2Hgzwa0NxukuS6TNp2hb//WDoK/Sk2N4B7vVn5oZag8cUQ6lcBt/9KrpbkvAsIjKAvKsqYP3kWwD9RGQPae8Z5zIrluzEyGxAtRhlhVRivz3U2yjQaTFg5qO9kHSjk8bYMkuPVpc1aWEYmV3bWYXZvP0VA5SuEmwOhgZLF54znL1NsmYeBPR/3cSNgB//GRB/kgJPhpko4qqvEkFiJFmOsKLZKauJXiSIZw+rr85b/6l5VUHdW8QIXrU6zgiYi+gzCnYQDlCV6h0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB9424.namprd12.prod.outlook.com (2603:10b6:8:1b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 03:10:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 03:10:15 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 12:10:11 +0900
Message-Id: <DHXNHX4C2JII.1EORRSTDK7DZ1@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 09/28] gpu: nova-core: Hopper/Blackwell: new
 location for PCI config mirror
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-10-jhubbard@nvidia.com>
 <DHVHY4WIJ66W.1193DRXT7CFPE@nvidia.com>
 <e0bc7607-9fe8-493f-ba4e-19612be54d33@nvidia.com>
 <4cf5e6fa-cb89-4878-9b5b-963aef46cfe5@nvidia.com>
In-Reply-To: <4cf5e6fa-cb89-4878-9b5b-963aef46cfe5@nvidia.com>
X-ClientProxiedBy: OSTP286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:227::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd1bb30-742b-4044-b76c-08de9e8a5845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7uJH/Lw1YqU7S/8Hiwhk7UE9Yxw3vV6VVg+8X9oUxJFHrNIZhdPKIObtj/biuc6jMYdKNgl9BOsfwS8h7l8CMMwzq+8GFsGWX4pyU4ulRQmLbRNgrAJ56p37SE1orKgT5gT12uh59oQftKhWplKScCwlRpkIT1LVmSdS0LkGKSiwcd5GikciaUPyz7YmjIHAM2BmfFwbf4Lvtmm8H/dbUHZDSaHjxUeed5O4Wg3OJaL+4n7sfX7CGEKBrJTf4dYrnj7duhZe86Xmwq2LxW9rDND5c3+2sCF/MP/yhGRAIb/BVqqvQDsvyyjD/8rCaUqep+UQxB8wN7lWpihMwPlV0ZWqcmFO8mrvPRxvmpqUBNFPuql1QS/OXIpqTxhEA1X3VSZ0fNo7OvMi4IHR7uuYMdZnNwoTd23ydA9Egpj5OxXKeCSCnyJ7mB7IZSnM60qRehlkem2jYR2Dlsu1S7FKwjydurTiyIYNhnn+RYlNkfaOzd9aVmupV3yfJjTVGaWHUM+pbXA25HBW+SUcUpxFmG/S9N8NZpFXk3kIN6QNcfC0RWj5Nsu/D5DEtkbO1R0J1SId9Imgbz6pdES4jbMFH5Dz1Lq+fpkmWiB6t6irIZs/Jjr7DMUwO1l3aqvUBIwH5IUurwOXrVc+p0jYazyZy8JWLiaJ3cceENAlupSvQlrvS5hb+YbBV40YP6qTm/8AMqGLF/I1cTD+ljiEOFmnF7Nsttnt7Vgl20XRhEM/iRs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHEwcW5MQ1dPUko2cjFuWEs1dzBkQzBlK0lWOE1reDFoSjVEN2UzZTZYLyth?=
 =?utf-8?B?ek0zUnhuQ0JKblR6Si9PVGpYRFYyR0Z1R2hQb1FEdlBKMm9jZDJaNkxsV0o4?=
 =?utf-8?B?UDd3TUt5L24zUXhKZisyTS9ac2R6RE84eEthMm5EWWhQVFN4OGZ6Nmt1YmUy?=
 =?utf-8?B?akJMczBGZEQybU1YMEJwWm4wNFJzZGROcEVhbjRuZDNoZGgzNTNseEwrNDgr?=
 =?utf-8?B?bkpqbWtEZU5Ka1NxWHU4NGFYbURTbnliaGJWbkdMVnBZclpoclR2eHNtRk9k?=
 =?utf-8?B?Zy9uS3RpWFI4QlFNL21WWkhoUGhITmJjVk92RndtaHJWdkgxUnYxamVNNlVk?=
 =?utf-8?B?MGpSWXdUbmsxbmhaVWw4eTFlM2ZpdURRbGV0SFBqM2xDZTNjaFRzV29NMEdj?=
 =?utf-8?B?c3hsWFdaSmMzRTQ5WmdKdENTQS9WRVhJQlpiTE5PNWJmMFFlVTZXbGx1ZWc5?=
 =?utf-8?B?NlpVNE9rbW0ydnpaaTMrbHhjOFcyMWd0Skl4NXdOUmNLaFdRdVBuL3pkNFFJ?=
 =?utf-8?B?VHg3L0FaU2lEME5jeURhYU9MZFFQNGQ3YXlsczhSakE4NjVpMHdjK1Z5b3RQ?=
 =?utf-8?B?ODk0MEsyWWlZclZ5MlRtQ2I2VnJaZGZibkl0ZUVMRkh3ZFcrQzA1NTZXWUhH?=
 =?utf-8?B?SFlicU00RzM0ck5HSXE4Q3JSZzA0WXE5ejV0YkdCSFdvWEFrbU11dTdyK2lM?=
 =?utf-8?B?OE0xTHZPdThndHltSlNpMjBNM2E5bFFWczVMWDFnMjZFV09LbkhNb2hKUVM0?=
 =?utf-8?B?R01kMlBydVVaaXB3dHF4NENqdDlDVUxkc0tzRlJYVmRQdGhoS1Nia3F1NGVJ?=
 =?utf-8?B?c0tGN1BRaDZFQkszTTdia0VBaUVFOHJIaThlQ01JbytkRzJIS3BvS1R2L084?=
 =?utf-8?B?MEJiN2lSZ1RhOXVqU2ZYZ3F6Z0JKaC81ZktVWXZtZ3QrYnlDMENHUWdsOUtD?=
 =?utf-8?B?emtIS3F6S09BcTRDZzhXTlZoOERZOEZmNWEyQVI2UWFxZ1kvMUFRZmd3Um1N?=
 =?utf-8?B?YlgyNkh3Q2pwUUFHK2JRd1ZHYkpZYmNuWXBmV3pDZ1F2UDVUdWo5aXBOTyth?=
 =?utf-8?B?OWlIaFRiTXJtYVFUY0FVRlBQNDZDTnZacFF3bG0vc1paSzB6eG1nN3VmdFBQ?=
 =?utf-8?B?b1VpYUl0UCtYWmorZ1AvK1dNaUs4TFgxdGVxdWdPT3k3akdnR3JYUTBHOGd5?=
 =?utf-8?B?bndYU01kV3VnYVc2bzMwa0ZMRnFvWG5pRUg4bjIrYlZQclF1cVY0T2s4M25r?=
 =?utf-8?B?QWVzbGNReU0rS1NCaVI5WEc2dU90R2VKR09BeG1yZDlTVkdOL0ZvczNtUnMw?=
 =?utf-8?B?ODUyM0gwVHYzSVJpRFlyQmtxSUEyMWZhZVBxWDJvaGtQYXhtS1lKZmlnUG5K?=
 =?utf-8?B?cGVPZ2IrR2oyVzVnMFIvMS83M1A5UzFvVHRMY0E1V0JFZ0ZvdURMVzBGVk5X?=
 =?utf-8?B?T2doY2ltSmJrZnh4L3B4U3Rzc0xIQ0FFWlV5Mi9DaUNwOEJSR254NmxPZlEr?=
 =?utf-8?B?aVQ4TjhGeXBkRW5aS2dPQnUxUTl0VHR4SWY4MzY0RXEyOEp4emNWVXkwVVJl?=
 =?utf-8?B?V3gvTW1IUTFsN1ZiOStpbGdVVnowQ0svYXhsMGI4RWorVmtTQlhZMU02UFB5?=
 =?utf-8?B?N1VTTEVMbVQ3L291UHJqMWdSbWlUM2ZCdWgvMVFPYkNUNWtlcWRWSlRXQk4w?=
 =?utf-8?B?Yi9lTCtvWmdFbGw2SmJyemQ1WDNINHZWQkdvWjVZQnJzdFZNY0pHTU83OHdR?=
 =?utf-8?B?QkRlTFlSUG1BdG9iZU5PdXdGVHV5UTdtYjViL1ZtWFF4YXBrU1Q0ajgzR3Vp?=
 =?utf-8?B?R01COWZrS29sdzlqcTA1aXlDVEFrK2oxSGlYWVFQWnhMS0xpbmhNQnltYkF4?=
 =?utf-8?B?dUpRcWU2Uk1FQnlJVDdQZFVnb1E1c0xPbG5jdVo4Ny9mMGpsUitMWnppakUw?=
 =?utf-8?B?REE2SGt3a0JKQjJKN3Y1V29GVlN2d05pSkI0d29JVnBPMFFRaHVNZFhCQXBP?=
 =?utf-8?B?VHlxaDAwbmZmM1RwZWMrcEd1SGY2T2NVbnZXWHozT0ZSa0ExRFY3WHZCY0ls?=
 =?utf-8?B?QXhTd1Jjb0lDaGxlT09KUzhqeVJDNHJKeWFjVG13NHBSbElvd0RlNG9GYkdu?=
 =?utf-8?B?My92TWc3WHVVWDl2MXpxbkNaeVF6aTBhSUpWWTFXMkczSGFwRkNNYXQxci92?=
 =?utf-8?B?T2xJUEo2U1ZGUzNIWFNIQzJsVGpGOWpBNlB6aEZzTG9MenJOR0hIMitMVlIw?=
 =?utf-8?B?MEQ0M1JpV0JVMnFVV0VTejNNNm9JbWJLSlIyN1lTbjBkSkE2Y1hVNlRrK1h2?=
 =?utf-8?B?QmRCcVo3b0dUeFpxWmQ0WlByZ3ZnUFpUNG1hZDdHMW1SdDRacCs2WkJVeHZu?=
 =?utf-8?Q?XUS/Tdz8Hk1HDJKj9oRbWpHy4K36Od/maEM7xEdJrZEMU?=
X-MS-Exchange-AntiSpam-MessageData-1: H3EWtBcxl81Z1w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd1bb30-742b-4044-b76c-08de9e8a5845
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 03:10:15.8747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xa4+dp+welxlUrsAzPWXjBla3WlMkgkiS29ef3CD+8ZaloDS/CMNE9hSVuXHMzl6aAiHjLgjc32uHhUKekhyMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9424

On Sat Apr 18, 2026 at 10:54 AM JST, John Hubbard wrote:
> On 4/17/26 6:46 PM, John Hubbard wrote:
>> On 4/17/26 7:23 AM, Alexandre Courbot wrote:
>>> On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
>> ...
>>>> @@ -24,7 +30,10 @@ pub(crate) struct GspSetSystemInfo {
>>>>  impl GspSetSystemInfo {
>>>>      /// Returns an in-place initializer for the `GspSetSystemInfo` co=
mmand.
>>>>      #[allow(non_snake_case)]
>>>> -    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> im=
pl Init<Self, Error> + 'a {
>>>> +    pub(crate) fn init<'a>(
>>>> +        dev: &'a pci::Device<device::Bound>,
>>>> +        chipset: Chipset,
>>>> +    ) -> impl Init<Self, Error> + 'a {
>>>>          type InnerGspSystemInfo =3D bindings::GspSystemInfo;
>>>>          let init_inner =3D try_init!(InnerGspSystemInfo {
>>>>              gpuPhysAddr: dev.resource_start(0)?,
>>>> @@ -35,7 +44,14 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device:=
:Bound>) -> impl Init<Self, E
>>>>              // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seem=
s wrong because
>>>>              // TASK_SIZE is per-task. That's probably a design issue =
in GSP-RM though.
>>>>              maxUserVa: (1 << 47) - 4096,
>>>> -            pciConfigMirrorBase: 0x088000,
>>>> +            // Hopper, Blackwell, and later moved the PCI config mirr=
or window to 0x092000.
>>>> +            // Older architectures continue to use the legacy window =
at 0x088000.
>>>> +            pciConfigMirrorBase: match chipset.arch() {
>>>> +                Architecture::Turing | Architecture::Ampere | Archite=
cture::Ada =3D> 0x088000,
>>>> +                Architecture::Hopper
>>>> +                | Architecture::BlackwellGB10x
>>>> +                | Architecture::BlackwellGB20x =3D> 0x092000,
>>>> +            },
>>>
>>> Mmm, similarly to the previous patch, I would prefer to have this behin=
d
>>> a HAL, but I am not quite sure which one would fit. Any idea?
>>=20
>> This really bothered me, because I distinctly recall very recently putti=
ng
>> this behind a HAL! And now I see that I did that in one of the "much lat=
er
>> this year: future firmware directions" branches. ha.
>>=20
>> I went with gpu/hal.rs for this. Yes, it could get large, but let's see
>> how it goes. This is the first item in there. I'll apply it to this seri=
es.
>
> Oh wait, I wrote too quickly. That's not quite what I did, but anyway,
> let me take a closer look when I'm not so sleepy. :)

Having this in gpu/hal.rs sounds good to me, fwiw - I don't really see
where else it could be anyway.
