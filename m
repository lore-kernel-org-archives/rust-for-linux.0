Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022096.outbound.protection.outlook.com [52.101.96.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773D9392C2A
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661786; cv=fail; b=f+fGZypIkeDyxzzNaapXAAQfXyGZzHih2K4HKXj0oQFHpZGsGVuVJKlEaOrpLxCnZKykySCJMURSN+mm/M5SPUm5OniaOY9No12pr6Y8bSdD1TKWY3oVwI6dvsZBCa0kImG6OdEOMo4kbYNaJt1eRuBOO3d/ToFrRmKs0d5+OA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661786; c=relaxed/simple;
	bh=peXq/NN268ul7OVNPlAoi1w2xJltB+W9jeiSTWBq+B0=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=JRFrVXPY0a7ZlzDhkiShwCFak7viySNdYnPDV2PpmECOcdOOPDDjLLxQq8PE+EWiyvvP5bIJLabb0o4lSpEn4hhzQPYO4kGkkNZigG25CQIESQma4G6D7VKf5YijkXXHeO7RjaHHW7aR5vvxCO8EdGbtvkIFo2E+DZCQUE+5iZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=SRmP78go; arc=fail smtp.client-ip=52.101.96.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="SRmP78go"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HocJvwoilbfqIVAiIvTuCpOBbO2zgIjyxfXxP7ZdYCH7IIbTWnb/UBbkF92uVsovIiffiiEaO3ZISmSB2opggFNM5FDcw5Z973xqAOow3FSTd8g7TSXhbLvpfVgdnwsIJ3ZG1S66QRdijw7QzKhQPNDI3hFJlxqfHI84jBJPCDnpzKygv7smCo76BB+/NnVtyIXgdJnHepmSipt7wZqPMNVviXT+vYhnoZ52ucpN5NV21Hllpb3HPKkkw7p7lZXwG5Yu3yvN6RB9KjcshSf543FBgD/NM+crzadnYghwSKMiPm1IPjRvoZ6R6132mZqO+oUeqqqLkYF4dyzG5MvSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5R8JjHhaNDzswKpzOtOROFivlETxyd6ST1fCv3Jzqpw=;
 b=eWRjkok5X269uNAfk5f73zakYpGV6XzVRO8WMzIdbzYcnB1PNswkCYc9VHYDmtA0hfX0g5Z8t1kdX7q3LtejAkRNYWZxWRjh0c7vyirlW61o87avloY4yOnsldbzSrIKonXAj9MdMay9eBtLCRWL5gUA4GdFgZ8N6eCxNrn6BlD92yySazXtMkAyiE8ScHs73sDTiE7hXMXeB+2OYgVT/SqQyq1CZvoMqrXDQy4fyd/O1/lngNAIRdWimeM2indsrBu5r8Y2jPPPEwD9kcBdZz+kJtc2sH3q8WTAQG68cXRWaDTxYVXqMeVaFqrrlBw1c4QcwJYQdDMkqVtSkdpiTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5R8JjHhaNDzswKpzOtOROFivlETxyd6ST1fCv3Jzqpw=;
 b=SRmP78goNYRW3JPgrYPzgfdteYQK9/6VUSehE/mxKhWw5bbILPygEo5aW4T5HPkhOa3Lbuk3LhE5jKqd660RLfH2l+S3IjyOmYxhTK0Ef9SIUDzS2mgpdB5fVd37D+8nu9O6/ocEnOzdcTBGxdWKoO01nLvT9jrTFQ5XJ8ig1ss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5652.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 11:49:35 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 11:49:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 11:49:34 +0000
Message-Id: <DH46MIRCKH9S.2LQT4VWSJAJRK@garyguo.net>
Subject: Re: [PATCH v9 1/6] rust: device: add device name method
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Gary Guo" <gary@garyguo.net>, <mmaurer@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260316055736.1690546-1-ttabi@nvidia.com>
 <20260316055736.1690546-2-ttabi@nvidia.com>
In-Reply-To: <20260316055736.1690546-2-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P123CA0585.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: 053d1db9-76f6-4276-8684-08de83521851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|921020|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	S2wh7uQCjLmwfbyfZbYqGjYbb6JL4Umfgp3y+X2kGPzY/UGZgV/cc/yTFwAGaLo4CzMSJivnbM7Af4Jvn8TllE6uCIjoXx+MLRE6F1A6g/JUkP3tpBs7rowb/tK/pv25vllf3/ca8Dg+x+WFidh3DfA33jBkspFVJS6lNZtwPH2yRMc6x2EXmqSYGqL+tDx5Fu9RoqWi28Rqk32BhVQkTH/ZlGwk7RrZIgdeVteAbqeNc8rDJ3J4H2yg111p4cjwwFhBBXZ+d2KSQKXNySwwdNvKfQ2Bjm0tRXmk9ZW1RGVBDn70WXVDkZNUE4g8r08BzJTLHoQcWkJF69GPveghJZNptCv0I6k96kjucX/k76pNTZbKM34Il3ZdEwXq3KIoQoQEKaC9kk3yrYz/G49kWm7hvGJSs4YbYA+DkCbrgnEmhPubrVXUkd5ok+haXZPZWqvVunvJd8hSX1zGR2MPHnTEQY6xUGMZ0RgnzPlsEX+NDIvKKuWuba8r6EO188PEEbTtOI+NzTmLAEQxEN5BG2g0oFJGFm5X5GWk2S4mYfcdTmPElXl2a5IsvrRMRvlVSxTW5lTSDXOquWz3wVQhCX6xeMzn8R5AYRbgCcCTMr2PV2Rl1M5iLWAKbSvQQDrONj8jucM3kGtVYlq9OaiSfg1vLpHXpvXlrXROREQxSvTI62N5nRqmg3DJIuNGPrZulbEYBJCe4VQdmeT13UDojSXAZi21BPiPgK5RE4BaiEoFjT3N8gAopMGPlNY3AnfJVI+lS2zcqZKBsaJVR3+Htg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(921020)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXhhbGdmRWtTa1J3ZU5sTDluZDZ1cTNGYndkUnhwdEo2ZHA3Wll3cTQ3dHBv?=
 =?utf-8?B?YVFVMGVEZzhYVzhGMVRmV2pYLzMzSi9pMThRdnZGZkNqVlh3WjRrOUU1Vytx?=
 =?utf-8?B?SVFmeEVTbVFyR0ZETm54UVlMb2N5NWZTRlN3WmZDOWM3RTRnWXNVSGVTM01i?=
 =?utf-8?B?ZjNMMk1RL3Q5VnJxOEs1NVlxaldKS3FjMnRKVTJwUEFiNmJ1cURkdjBJOWFU?=
 =?utf-8?B?cm9BMFRKeFdxeE5YVHh0RE1vTE1oWFpBQUlVWGI3L2ZSWHR5dU91YUx2MUE3?=
 =?utf-8?B?NFFxWnNZMi9JNWQ3dDA3YXZOQmFRQWFFeW9RM1ZnR0t0cUtZNHg1TGtSazF5?=
 =?utf-8?B?M3pHdmVYdjFaRTNxSEZ2T0ZJYWV2Z2RaNTQxVUVBVXZoM3l5MUdhUHhYQnNk?=
 =?utf-8?B?VTRQQUkwMDBnOEVwZ0JFZmNkUzFaT1l3Z1ZQOTVoNVNTdjdkRGFEaXkwKy9W?=
 =?utf-8?B?Zks2YkZiWmtLWEVraUQ5Z3dnNzZOVzRWTzQ2STQyRDlzc3RuaWY0dWNXYzhI?=
 =?utf-8?B?OWJ3VXRkQzByUFZyeGcyN0cwcS9hakJDNmd6VUVKOTZQUm5XNEEzZWhBd1hN?=
 =?utf-8?B?Zi9sN0FtMDBwaVBaTDRJRG9NTVhqL0FaMDJpQ2pqQ0JHQzBOQnFkM1RGMkE4?=
 =?utf-8?B?ellrcEx4Wi9TK1EvdWswbUZoNzF3SHNwWW5QMTlwbDJhdDNHVDRQejF3QWQv?=
 =?utf-8?B?R1BaenU4WXdCN29iRXJncCtwMEMrMVdwNndsaXFnSVJmeU9xVDlFaG52cGhj?=
 =?utf-8?B?dVRWWUpyNFRtY3V2ZExDL1ZIQmZWLzNJTUpKdDRyRlNkYVVucDJsREZhcCtD?=
 =?utf-8?B?ZU5aaEJxWEdYSm0wU0hQS1NiaENrdFluVXVrSjZnazFoWlNXcnMydzZsdkps?=
 =?utf-8?B?NVV1RHFwdVIvbTRRUnJvMExVcFlOOWQrVXI3RURnbDVrWE1VQzVXMStldFls?=
 =?utf-8?B?M0xtS2gwdE1FaCt5WGV4R3ZuNTdFUDB4WnNIenBjODhlbUlzR3pFRXRqU0NU?=
 =?utf-8?B?WEV0dHRKT2dPK3VIK0MyR2c3QkdGMmJpYi85U1pzMk5TNmcxVkVCdWNib3Mw?=
 =?utf-8?B?dzY5OWw2ZDJRaHkyUFNQOVcvaVN2Wk1xOThVeHBzVE93VlY0R0xVT2s4alUy?=
 =?utf-8?B?ZlZpRjF2dWo4azB1SXVxaFN2SDVYcmlOMFpSeEM0UGZZRE9pbEljRnozZzlQ?=
 =?utf-8?B?VlZ1QVNBZHNVMmgzZWUwL25NaTY2MmkweFdWYnV4VHo5bFAzamZqWlptMStj?=
 =?utf-8?B?R0VKQzdQRERpN0R5dk1ENnBrdlNOTmN3SjJpV3orRUh5MWFSY1FML2I1VUlB?=
 =?utf-8?B?anpMQjZ6cFlMd2g5ZHo0UjZ2RXo2SGorbngyQkVsalhWbDJCWnZkVlB4b20v?=
 =?utf-8?B?ME1Cb2xhVWh3bmFEakVNR3pkTFJET3FLeWJtNi9Lc1V1N0QxQkY0b2VPMzJ0?=
 =?utf-8?B?QytmMVFVZGszMkJUbFVyRXlaMnloVlhLeHF5aGtxTU5RU0VMQ1RDUnBXMGlm?=
 =?utf-8?B?UlRxY3JZNXFHWWlGRm9YNUpHSjAyejZoNDRkbjEweVVraDIrNXNGZ2tNY3RV?=
 =?utf-8?B?c2RsRnI1Y1ZTWGk1bWxNNlBiUm9PVDRHYVk3eVI3T2lYSmIvQzNsSEZIUldU?=
 =?utf-8?B?VTE5T1ZteUJYcGpTSkRwcGVzakF0VXNsOWFuZVlhYUFjaUI5K1ZHNWRtM2Z3?=
 =?utf-8?B?UGEzd2dwbXE5ZW94ZHVCdTY2YWswbDV3d3RJS3RXYkszejVLZDVnU05yM2N5?=
 =?utf-8?B?dzJXd002eG9CdFlhbEo3Y21kRkRBdVQ3NFRHNlZ3MWxTTnByZ29uZllCcllU?=
 =?utf-8?B?WlpsUHE4WnloZkJsQmkzUWR6QU5JdDlHTkRDQlBVOVZNT1lhdzZBakd1SUZN?=
 =?utf-8?B?MTFVcnowSzhySTBFWWJvVlZxdWpaTWcxNGVBak9WTXFXT2kyV0FNWk0zSTEz?=
 =?utf-8?B?RlQwcW5WL0NYY3FOSVJQWFEwOVFVNzUzNTIvaVlUNXlXOUw2dmdnMGZXQjBZ?=
 =?utf-8?B?clVyUWpoOCsvR0U2MHFQb3RTbkRnb0M5dWhOZ3ZsTWxZUG9BMXBXS1F0eTFM?=
 =?utf-8?B?UklrSTI0c0s0bXpSdXdMaWxleVl5QVY5UTNNaStOMzllM3JpUjFRQnFNemRn?=
 =?utf-8?B?OTh6WXVFWkYvekN2ZFZYMGhaWUd0eE1JNmxhc0tQRjB6UHpFM0YvTlY0L3Q2?=
 =?utf-8?B?SEhyTjRMUktQendhN0FFSCtlVXprTWhxbGpBcThZeWRranlLZU43VklOVm9X?=
 =?utf-8?B?a2VnTXFTc3hVa1BQcE1CS3VEU1YwV0FMMjdvNlQ2Z1IzYkcxU2R1ZjJUZ2J0?=
 =?utf-8?B?Y09lRG1nVk53L3BsWHJOSTQ0am5oQmlaaHBoc0gveGhONHRFaCt4dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 053d1db9-76f6-4276-8684-08de83521851
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 11:49:35.2735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtTQxdzxrFLoCNojd03ti8w9seW8/iG7+Bvi7km5i/zkVCR2RHBR+Z0doS/1PiumitVKGOhEaNpoDFWgfBoiDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5652

On Mon Mar 16, 2026 at 5:57 AM GMT, Timur Tabi wrote:
> Add a name() method to the `Device` type, which returns a CStr that
> contains the device name.
>=20
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/helpers/device.c |  5 +++++
>  rust/kernel/device.rs | 11 +++++++++++
>  2 files changed, 16 insertions(+)

