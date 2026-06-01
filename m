Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011018.outbound.protection.outlook.com [52.101.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7A833B97A;
	Mon,  1 Jun 2026 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319613; cv=fail; b=cgm6eNmUZuuwKdr7+AGTGsWa5lkeW+/3/jCePNsu7xU+R62Qss7QNufIWIUlhAI4RRPjxceM62wT9sKTpQTrqUDrMrSh/OV+T5tuPR7fwZByx9Lvg0w9q10cqwUqozFtuqCnOVlXKoVyzORgvbBQWnKJ92xZ/xXDv7f7BE6pCtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319613; c=relaxed/simple;
	bh=kEdsg/8jZ0eanezzV9cnOdFQZo0sCEvRKbadkrl7luo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=d0KVqsBrrXN1XCDk/8uJ6WYsHdf3XMDwHC/d7h9NiqibfLQ9xTyXBgMgmbqQHlJqxIifHLdCeMO2e5mW74IoNvP59xn22TGRvHgVWqFde/K/m5w9Buh1DSbRwrk9U1VpQ87f3dTM94z1j7ZGf++PfHf+0jOCDAzJoJ3ROPG97uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X50iAlfJ; arc=fail smtp.client-ip=52.101.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X50iAlfJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=micwNRCJtMQNTq+BWkCFiTpD3qt1H5UcL8a3d5nUeDEYWSDf9DR3OGbWAnKbjjLSOpVXRZu9WFQ5JXJ7vlg+IOjIXi9i4znRD08R7CPWIq5gPw8eWyPwe67dVVvnBZfh0Wu67MYuxdahwUdZhZBigTAwlrz1AJaxENUwcN87KVah5gHh16jr2jfQCw1pl4sXcYRbGbmX5U4GhGe9/rLVDTmfc9IJl0xowQZGhqB2k/OKgqQdrLIdKVdtCXr4pgSiRL2TYWPfInxG7cbunstby7DO8otZtACDExE3OgAEKLKMGhV/INUmn5zzKoWHgb298pMGdc493XWwOBHoP3MRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bX+zm2+eWd5P5E8Zk9M3Na+yN3i7/jXM0rITCiROLsc=;
 b=ac51KJEXjyQoCaH97jlpQewCQIRYlfuLF5SVumCEyTbyI5c+EWPu5j8JZmqrlw5XFuswvzRov2jTauFAtxmKqoz0CvlU83khgtfaMvJQlYgk5qQWFkFzSJP3H66x5eSFU8I5gcXBKeQE14fosT3t6DEbkM7SiHFCqs+f05/0bUpnmOklM0o4jCTBsb2QEgfaZ/t6fwDld2aiJ4ngfeoM/ZPmCypapNQ2nJbdTxX1p6h0jAgy4usrWQjflAqB9xbOJpZBd1awcfdgUOnMYvSJNh9yIfuYqBOZGOKfY2UtYLQFQb56Qj8FZaHlRNHQiTn/dlzkopKtBn4ckyGWZoSRxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bX+zm2+eWd5P5E8Zk9M3Na+yN3i7/jXM0rITCiROLsc=;
 b=X50iAlfJV/ZA5NZFaLWNkLxclDBYEhXCQ4GLMtHnGPCpUJL49HYeANgUdgSc9xJsam6Lssazh9tb2I1+aKCIc7DlZ9ZEPwth9bG4JNzKN8XgJ7uybw5cIbOqPhurJ7S9HV3hrURP16iJ1yLR8m/kJwg8V+7KRJz9ZmobHvLTUEMzJDW79rXK/NFy3RVBZyZ9IZt+kMH8cJm5rwCFFWU2xDI+kS8vdin2+arGbBmNV4Uer9cYFeTRWk7HizHXZVFK3IhIFoRf5LrWQUTbni7jzbfNnk0lA7yv/h9F8BIbp1mal3CuDYj7RQ/1LxXLL03o2EjkH3wIbnPZ7w4i/OZuhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB9398.namprd12.prod.outlook.com (2603:10b6:8:1b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 13:13:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 13:13:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 22:13:20 +0900
Message-Id: <DIXQMLMN7RQO.1OUEPLVALLMXK@nvidia.com>
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
Subject: Re: [PATCH v11 06/22] gpu: nova-core: Blackwell: use correct sysmem
 flush registers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-7-jhubbard@nvidia.com>
 <DIXJEO0ILZVH.2BOQ4HKC3396B@nvidia.com>
In-Reply-To: <DIXJEO0ILZVH.2BOQ4HKC3396B@nvidia.com>
X-ClientProxiedBy: OSAPR01CA0313.jpnprd01.prod.outlook.com
 (2603:1096:604:2a::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB9398:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dfe7114-6203-4ac6-d8e7-08debfdf8fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|10070799003|376014|1800799024|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PmM/DBAmbCrCTK3mX0UHnmtp26IgjiqDaSJw0ClZRyXtlePsewJmTwcq363tUPQgz5vBR88eC07/WCWPHwIVH5uBAyBrlduXVx4k+fUNWyA3G66dW8XIJ8j7BeL9wb5oAkk1nkVb3Nod/F/74VlKhbXco54eglz0i5bW3s0yOcAEggpNrZRYExzwV0kQjRUKM13BZL3n11p+/F7U0bIxE784dryKY/x+NGaAYcDebyNpp97/cvUb0DpsO4+JdN/rN/LFcLHNnnzcoAnN+cfUGU4dMYIOQRk30hAYIKiEIjHf2WkSvytF1/uoD3TdLLEiBERZWaH3uinWjAeDQV7J6jTqO6273CmLYQRPHBwRdsOIyERMry6d0a04lFt19WECNmfh73X71kbQoCI7fVzmpwxtn0HNICKB2eR2N4k/2h9+g1Vy5e87wb+KWoiTZw7pxN09Mg31Q7U7FRWKFgnNNbsqkoebd67VRBoLwVaJzsCE55lyGq0w2dtbmUd8Qy1My6VLM0/Vwfm3ADeGCm/iWZFM3ndqCVhfJSRe1aErEaNcqsqH0FNydK6isicUcuCknfMlEy6wN0NcoosFCSMlbLKMpFIZMwYvXzVqEH9gLhbxgnsIBo9xqDeSZOzpQjJhTfWQLrO5bbVpoF1uxj/WNFLeTQx37jz5jwAyewmFGMGm7jWm3WxigzlCL//OPlg4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(10070799003)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFE2cUtmSXRwZFhUeFA4d2lHRHQxMWlPR2todEZwdjNZNXZDUC9HNXNoVTJs?=
 =?utf-8?B?bDJXSUlyNlMrM2JhczVxbUFqekFoSEJiQlAzREJvTVM2NVZmWndXNTg2L2dS?=
 =?utf-8?B?STZWMFpFZi9wc2hoVWcyTFNFSVdJN2JuQTZQMDRuQkI2ejVUajFPbllwRGVs?=
 =?utf-8?B?ZG5uQ1dEQUU3NE9zOEpmUE93TSsyVTRJNi9kZG5GQjRES1ZmZmlyY3BhMGNB?=
 =?utf-8?B?d25nZWZYeU1GS0UrRGlzdVpDdVhpeUxvQ0FXeVoybmRNdEpOS0xHY3BUTFZC?=
 =?utf-8?B?MEcxYzN4ZzRVMUJBUDB0V2lrdS9rYWEzdUN6VHNiZmJ2TzByQ1B2anczUEJm?=
 =?utf-8?B?UW9XNGlodWhBRm1lanVHKzlSWjlOZ1RUU0hFRE1rR09jdzFDVjdmSGpHZUd3?=
 =?utf-8?B?bGwwUE4xU3pZdW9hWmpSYjlmSDFyaWNhRFRXblgzU1BBRlJNVVcrOWV1Qm1O?=
 =?utf-8?B?a0ZwRytZSEtubTExSi9vMTR0QmdjNkp4eG5SSVdpSmQyQXljTUN0U0RaODBY?=
 =?utf-8?B?U3dzUWY2THBSdVdnK3Azb3h2RjYrSU1EclUwSlJ2K0VCWFBHU1Y1dlVUbDhX?=
 =?utf-8?B?bVhwTHFUQ2g4cnBZeE5lL3ZqSmNQZkhOTGdHSnVrNVc5b0RDWXFrK29IMklV?=
 =?utf-8?B?VVBjUTVaZER1ZGhBWXlSRDZ6MmxjbnFSaGUycCtDb2R3aEJyKzhiMUVMZG1Z?=
 =?utf-8?B?MFUvRi9Td3EwTEwrUDI5TkdVVGFzcEc3aDBwZy8zOW1pS3hVU05zRDFhNUUr?=
 =?utf-8?B?Wk90NnBvT2xoNkFzNEJoSjZqS1JxM0FHM0hyd2hWb1VCVSt6NFd1M2MvNFlp?=
 =?utf-8?B?N2c5YUowMVlydW1Dak5XblcrRURRK0tVWllBQWVNNUl0WnZ4bnhPdThSNUpG?=
 =?utf-8?B?Mm5aRFdCRG5DQzU0aUJzckNSRXNJT3VpVS81ODg1MWFBL09kQXRlYk9wZFpq?=
 =?utf-8?B?YlQ5Vm9VWW41cURUcnpGU0RHTEh5WExFcFlwMVhjWllGbWo1QWdtSi9TTndF?=
 =?utf-8?B?UVdxa0NINklpWnAyL0VoYitCMmEwZ3M4R1JMdVJhOVhkaWMzcyt3SVBuT2lG?=
 =?utf-8?B?WHZwaUNGMDVla0xxNEJFbEtISTRrRndyWGNHSEg0cW44TnFwdW5NcngzZllv?=
 =?utf-8?B?Q3RlRlVMRmR6QUJOMStlT1UzTUZqQVdZbG5Rc1hGbVJoZGsrblM1OFdWM0RH?=
 =?utf-8?B?NnRuMEVOZGYyckd6dDg3Zk15SVp3djZxU3lWbkZCOUNmYW9zQlFRNncrWWhp?=
 =?utf-8?B?QXVGaWNQaGFPV2ZRU01rdmtHcDZ4ME1MMzNZbGFaaldmVVRtZTdWdGNZMWhY?=
 =?utf-8?B?aG5NOXJIajdHdGpRUlBsRG4zNXRid1pUdGxQQXkvemE2Zk1GZDBrbUpIV3U4?=
 =?utf-8?B?QURiVC9XRUFKc3VoRnN3MHNQbnl6NStIY1VZOWpxL0dvSzZMa3I2cGtJMzd5?=
 =?utf-8?B?dnpRNjNaVGdncm53SmdMRmNrNW1zVkdIcGs3Zm5YUC84MG9sYklZVldYUlJl?=
 =?utf-8?B?UnArZWhnMGUvcWQreSt5WGFRdnpkYTlxbkFCb291aFpNKzhoQ3lGbVRrc0dz?=
 =?utf-8?B?UUJlc2FwNDRncmdNVzk0K3JvYWFuQ2d3bU9TL3U0V1lzVXZEMk4ybHl4V25K?=
 =?utf-8?B?eHdveExZWW1YR012NkNtWTFiS1ZqV3BnUDNoVGpOK3VqWm12UTFoMk9VanJ4?=
 =?utf-8?B?a2RuNXpucmVNTkFDTVBLdnFRRmpNckFMSUNwSHZjdDJxMVkxYXdwK0xSMDNx?=
 =?utf-8?B?anBWRmpxUzJIckpXK3NIbVdCanFaT3FPVWIyWWcxRGlQQmQvYW9TZ2Y1dnJF?=
 =?utf-8?B?RlRGKzdndHdieCsvNzc1TlgyMFFYckFDbkRlbnNGdU9nN1ZrNy94cytWRmxW?=
 =?utf-8?B?TkNKczFHRjFxdTQ5dm1hL3BSVkQydlpxOXk5Uno2cHdJbkJxTDMrdGl3VitP?=
 =?utf-8?B?d1IxTHl6WnJGaUdUeWYySWE4WDAvY0x5WnMrbGZqNnlNRnpLU3lTRXF0YWQx?=
 =?utf-8?B?dWkxa1pGK1p4MmpybVZhZG04cDVscWd2bFJyV2o3NUtkb1BVa3NzM3JER29W?=
 =?utf-8?B?M0RZcTg5MElORHVDV1FwaGM2M0h6SERkeHFkTVF2cCtlMVJyVEU3eXJ5QS9Q?=
 =?utf-8?B?YlgrUFpJK290cUtycTNnTUlEZytnZFhEVlYrb2VnRWNFeUNpUUtWdklFQW9i?=
 =?utf-8?B?MzNFWVlEVmxOTjlSY0luazE4RGhWREpNMGpiK1FzdDNEZmEzV2V0d08wZFpv?=
 =?utf-8?B?cm1DWXJOYmlIbnhPOVdabUFHYk1kK0ZJY3JYNmU3TzR1cWFra3psVnh2NllX?=
 =?utf-8?B?bXhPUjhFYzQvMkhMTk5tMGpvVmZrMy9McEtDUWI1ZHI0Wkd0UXlFK05BLzg4?=
 =?utf-8?Q?QMKtYBrA9Cda27C0e8396aPWGV0VaTvdI9Wb3q1e0Jji+?=
X-MS-Exchange-AntiSpam-MessageData-1: +qD+xeTz/CNNGA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfe7114-6203-4ac6-d8e7-08debfdf8fc1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 13:13:24.6584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i58PmNevKBj2QfHehmUymHx9cTsbBQtFBAcJv4pPp9n6pkTRfmM1nZmAo8ZD4s1n47y3NiMthPIBmFeZeJj7Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9398

On Mon Jun 1, 2026 at 4:33 PM JST, Eliot Courtney wrote:
> On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
>> +
>> +    // Blackwell GB10x sysmem flush registers (HSHUB0).
>> +    //
>> +    // GB10x GPUs use two pairs of HSHUB registers for sysmembar: a pri=
mary pair and an EG
>> +    // (egress) pair. Both must be programmed to the same address. Hard=
ware ignores bits 7:0
>> +    // of each LO register. HSHUB0 base is 0x00891000.
>> +
>> +    pub(crate) NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x00891e5=
0 {
>> +        31:0    adr =3D> u32;
>> +    }
>> +
>> +    pub(crate) NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00891e5=
4 {
>> +        19:0    adr;
>> +    }
>> +
>> +    pub(crate) NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x0089=
16c0 {
>> +        31:0    adr =3D> u32;
>> +    }
>> +
>> +    pub(crate) NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x0089=
16c4 {
>> +        19:0    adr;
>> +    }
>> +
>> +    // Blackwell GB20x sysmem flush registers (FBHUB0).
>> +    //
>> +    // Unlike the older NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers which e=
ncode the address with an
>> +    // 8-bit right-shift, these registers take the raw address split in=
to lower/upper 32-bit halves.
>> +    // The hardware ignores bits 7:0 of the LO register.
>> +
>> +    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x008a1d5=
8 {
>> +        31:0    adr =3D> u32;
>> +    }
>> +
>> +    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x008a1d5=
c {
>> +        19:0    adr;
>> +    }
>>  }
>
> May be nice to move these to the place (HAL) they are used if they
> aren't used anywhere else (and reduce visibility).

Indeed, we have a thread on Zulip [1] suggesting to move register
definitions into subdevice-level `regs.rs` modules. I guess we could
proactively start doing this with these new registers; on the other
hand, I'm also fine with keeping the current pattern and doing the move
later if John prefers to keep things the current way.

[1] https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/topic/=
.5BRFC.5D.20Moving.20register.20definitions.20into.20the.20module.20using.2=
0them/with/599138666
