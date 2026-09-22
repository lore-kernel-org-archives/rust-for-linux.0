Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022130.outbound.protection.outlook.com [52.101.96.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1462541E70;
	Tue, 22 Sep 2026 14:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085778; cv=fail; b=JNYKI7vHPRtvcwXRprJOX+5QlEnorouI9r4A/RaIw4SQn4SGR7mOuk54RoVg9F+8W8Szq0cf/oJIwdlv8FjsKmGwZpJzY08YewH3h+hmOyWpnEviVCgGVLAPHXVgtO4HQ8kBmrRn5B/UqjKwKVNh0z8aJvDGqjnCeCZ86jg5ajo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085778; c=relaxed/simple;
	bh=GdaXTjgII/GjJeayArlJLL46TsxT1tb8H3Hdl2/Qp0Q=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hGG4oVNvdWJrecl8B3BXqsP9ujhXMYXHMZDDJ2YRXrAZqN5qkY6r7usSES6GFC9iXNBl5WLiUOVjZ80KqMkH2Bzjh3cQtO9Zpe9N/WgJ37bT0Y2ad36G/SoF0QoOZfMSuhcRABLmuyr3zTSOqXJok+KbqOLXVrGO4QNG9Bd3Ixs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=me+qRIes; arc=fail smtp.client-ip=52.101.96.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="me+qRIes"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omigL5L3iPV+IEVsGAnUafk4vpT1pT8BauO1EzGuDhe54MeJg6mVSvikABZEzHADn75ZDPyyAA1UWkWbwObQmfDdH4XlvCfoEbe5u5S1VTqoMYUt9zrsuk3aTgnWqrFCeG033UW4+zVY23qJB6pLyZuA5ie9g7HoaPlkLpHXnZ1ma6oxFNeR9snzLTDDvLkSUJyOrtHqgtQaxpswGzqKCAttqhkhELiSkAaPQA7o0iFwJfqFRm54I+knTr50YVR4lmGUAopB2dBL6cVYCOtGVc00zBmzXxSSbu5cnaDJhxbB0e/KxEHsWon8UcBxKfUdmBj3FJf4oEzRhcZeQJR/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bH/2PoOYJKg4XmHFZwjEhMjEoskvWp+usqvYwx/CmSs=;
 b=Ece0+ZobEn/7ltlAnSRmnX/+z6M6w8clwAsETmFvTDK955NaMGf+TzcTorvR8bPFRcMpdr6Szp47QXGvlnGTR3vGwNsS1fnEnAaqrSesyxyjZsK0TkEPrUA8YBHFdIKOyPddo0JOUo9xyi04e3XEpBYHNPybJUHxujYK68YiKpfDJjBhdEr+DWooZwyb05gH6Xq3ZObaIJVOzAoNEEDSWN0a76b6kYAu+qUCbo5ECSLHJ8bQh3MyWx0JY8EEQJS6kf+haDaY7wRYz0n8XqcuHXMaOqYyOvSYjRlBp/00+KzprdMjduW5vzxuEAnONm6wHdXqHdYe0UIeJfh046Da0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bH/2PoOYJKg4XmHFZwjEhMjEoskvWp+usqvYwx/CmSs=;
 b=me+qRIesr9Ubfjv/RsPDGajuUpfVY9BFcnzykBE0dTDRJW79m1LT+nBjiqfQvwH5nXyVvVu5TPTwdfz/607kDmiGvjtVDmtm46ayIky2iTsMc1Z2pDw9eIEPE2ny9sSj7pTsEji/8CCXUhMCEFmHryfbIVRhyAqiVPsmr2Noflc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO6P265MB6030.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 14:02:51 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 14:02:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 15:02:51 +0100
Message-Id: <DLLWG2N3ZTPY.1YC2GW2DGGEH8@garyguo.net>
Cc: <gary@garyguo.net>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <yury.norov@gmail.com>, <ojeda@kernel.org>
Subject: Re: [PATCH v2] rust: bitfield: require integer storage
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Yilin Chen"
 <1479826151@qq.com>
X-Mailer: aerc 0.22.0
References: <DLKWS377R3K0.1XFDX36YZWRQU@garyguo.net>
 <tencent_6ED5B37F63268169D25F84557BD655D9B106@qq.com>
 <DLLW8NY8GF79.3U3VGJF2C3Z63@nvidia.com>
In-Reply-To: <DLLW8NY8GF79.3U3VGJF2C3Z63@nvidia.com>
X-ClientProxiedBy: LO4P123CA0451.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::6) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO6P265MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 1664b125-b19c-4ee8-d8a4-08df18b2311b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|23010399003|10067099003|56012099006|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z5xaHpyTEClG072NLEM6LO5Wc4Kl75fHTtKeIv4XssL5oOfqEzLnGyJ6Gc2/GdFZ9k8CkJIUl37LW05qxcy99UT4lXktnLK64VbanC62B4wWTuX9iWuJuiLtDvbjrOmQ+Qxw7Q6pH1PkjaMml1UiGmobLm7z4almqoHXd4bApKQOr4ycnzGa8/XW7SpsB8ZlBgxDEnOoDH5gDAOIDdy/XkHXR4Wo1JQINPaO9/E2LRkpYE9HCeYEYlr7OkOW8VpP5OuKFetvpKvpl+IbhpLOt7ZAFjToenLgFxknZ40az0U/OxNjJQFiTfJlDMYawlkr6gKmokdOMN64OS0tfvUbYkHttbyYX0TvVyJqzF5BzSHm0zzgOTJucYY4MmVBiZEa3lsD8yVjQx6lm/5CuTv2Tnsq+hT7tjxEMIPGRRz5ZMB+lCfk9ltrI0j+JV9KA18qfNgif5PqOG7TiSrD2KrSUyYvvoZ5qVJg/5ikgXOWkWoeCFX18Sn8EIAmLO3jgWKeeolQw5DwVRm3KrmQ9rAkvbp0SdMRi4+EOIgdTxC6Zg0iJbxKm8u8YAPNZmvuuZB/CWqJ9CPXE1YMZNVxTh+zaIyeh3s1Lg8NTA/2+f49wkLA1jl27GqivCyp3Gf/V3tW5Q4TUxZXJuxywpxkkp4Hp4LZWj/1AMDag8NbPqVyKJA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(6133799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zi9YT21jWC80eU5TMkFkS1JNZysyQjBjaHE2aUN1Q3lEMHlJeTZxVVVsU21P?=
 =?utf-8?B?VjFvZ3RZOWhRSnR3SENnRDY3OXM4cm1KN2R5S3lGOW10K0lneVRqdU9xMk1U?=
 =?utf-8?B?cFN4dTBXbk92eXl4aFZ0K3MwWkJsN3Zyd1ZCSlVONkVnUXlYVWpwZTQ2eDIr?=
 =?utf-8?B?cHFKV05QazI0V0JXTGlsdjJxQUVzUmxydFlJUWdzUC9wYXVlUHc5UFNjMms3?=
 =?utf-8?B?clNCckxScE9ITm1IbVQ2SUJGUzJTcGJ2SVB1aUpqaDhhRHowNnc0N1k5N2FI?=
 =?utf-8?B?ZFJYOFlkNHo4MXRqSXNPNStuSmtqamczMXE0SGw4QjNTdEl0ZlZmRmVyUFEw?=
 =?utf-8?B?NVNQQnFVQUlkZ0QxSWI4K3I5eWw5cUd2Rkd6UHNDTXpIb0xhSjBtR0NNSlNW?=
 =?utf-8?B?RXlLMWM5NW5uUW84MnhING5SdG8zNHpldnZHaGY2ZXdRelQxU2FSVUt2U2Rr?=
 =?utf-8?B?TGczNmYyYjNMeTcwQTFyWGhQNFErSDRNY09CVU0vTXZRYmpnSks2WEw5eEpF?=
 =?utf-8?B?aVE5TTNCSG16cmtoQ1VUK1d1QldwZ0ZUNnd4enRsSjRUbkxyRXl4OE1EQ1dL?=
 =?utf-8?B?bHF0ZXUxSm12MnA4dExTQm1hWFRrVldaRnQ0SmRndWh4cDNIUU9iSWZPWWFN?=
 =?utf-8?B?NG1uTVd2eHo3RDJTdDBadUNTRlpKS3BmWFZYZFk0SFdTV05pMm4zYUF2ajBt?=
 =?utf-8?B?a3VjWjBJRGtyUHJ4alpCNUxLV3YzWDlsNHpTam04dmNOU0RLd09Hd0EwcTlx?=
 =?utf-8?B?MXVWNjR5WlpKY3YzcVg3NVdPaHZjNm1jNkRnQWhhcWtsZlRFdUI5aTc3aks0?=
 =?utf-8?B?bFJINVlFdkNtOFRtbnRmUHg3c0tJeFcyMlVGUStXYUZYKzRFek5DRGFyVTh0?=
 =?utf-8?B?UWtyTXZhdVZYYmtPek9od0RrelFHaUNGM0VMWG1iMjlDQllXYnl2U3NWSVBl?=
 =?utf-8?B?dENORkU0eG9UWVplZWtVNEptVHRGWlBlajJ6K01kQXZ2YXdBQXlaNlhIZ3dQ?=
 =?utf-8?B?SlIrcW12cFJjVXRUY0tkM28zcWNXcWo2S1g4eHNINXozN203dlIvRGNqbWpu?=
 =?utf-8?B?YThtaHI3OFR2NnB3dFNSbk5EODNQWEwraGxxMGhDVFh5bVNoc2I1bmFFMWZO?=
 =?utf-8?B?NmJDcWFHdnJOTUFNeHNKNGZrWmVCemExczJGcHo3TFJsRnJNUHo5YUxaNXJw?=
 =?utf-8?B?NVBydWxUTWdGN1ZuK3FxSytncW1yaEh3MjhLZ3pYTXpkdlQrMWVibEtENXV3?=
 =?utf-8?B?VXB5ZlpHVldzcEZCM3FEYmlBNXFPTGJhYUJEZUM4cThBMGhDc2lHT1dSTHRS?=
 =?utf-8?B?MnZ1eWVTZE1LVlUyOGw1MnR5SnBVK2tXeGc1SU9oYkgyUzVYc3d4RzE4YTNT?=
 =?utf-8?B?V2JMYVZUT3JCZlNya2xhTW15amZwclB4RVhwSmN4a2FjTzVYbi9wN2pDUXgr?=
 =?utf-8?B?MWc2ejBiWEJqWjF2VlkxQXUrMWk3M0J4bCtsbGQxV0NsUmxqMFhodGVzbGIw?=
 =?utf-8?B?Rk90cVk3Ny9mak1NaHFwR1J6TTE4RExYSHd4d292eFplOVlEN1gzQm90cy9N?=
 =?utf-8?B?UEFnMlJEdFprUmNjYlB1MEM0K3J6cXZtb3RSOGR0UEprV01NWFh4dExmM2Vv?=
 =?utf-8?B?ZWhDbnBiZFpobCtLTWVsK0gzSGZ5UVNzUW1Ldjc0dGNwQXFaeEZZRUZQVnpD?=
 =?utf-8?B?QXVES0RHNTNkSnE4MC9vYzhnMHhZdmpTRFk5ZldFSzAvblpYU0ZRSjZxUHZz?=
 =?utf-8?B?NFZHc2pkeEVLSGp6V2d2bCtaN2VYY2xma1pPcFRPdkE0VkVOZ1VKYXdZRnZN?=
 =?utf-8?B?Z1RkTzkwNWJoN1ZlZDBrZUxLMFMwRnBJQmNNZFRIWUdqbnVuY0Y1N3JEWHlO?=
 =?utf-8?B?Slkrc0hFUXBKK3EvMjlwVDRTcUk2K2gzbEF6aDB2SGlNSjVwNzdtZFVNTVZ3?=
 =?utf-8?B?WkZEZVNpcVBaaktHQlJ5SFpDVjBkRFhZNlp3akJjakxPak0yN0Q5VmwzN2pw?=
 =?utf-8?B?VmNvQTNGamJUZStDZlRBY1QxdnIrcVFaOGhGUDZwWTEwZU5lc0lGSEdLWFJO?=
 =?utf-8?B?dEVGbDVXRjUzNTlBaVc5T2lGaCtmelZNSVR3bDRLamJMc1ZsYk1SbWpZdnVa?=
 =?utf-8?B?Y0swMEJWbGFrdjNiOEoraVErN2NwakptenVrczRPbEJkK2tHSkNrL2IzcEcy?=
 =?utf-8?B?Q3ZDMDN0OXMvQ3BhZEFDL1F6R0JiVWpScGROdXhxOHlhc2dBcC9Td2UySUlx?=
 =?utf-8?B?cUlOUXlINFZEaERxWUovbmxiTVhodFRrd0VnR1ZrMDRWbmI0NVhNZEVta0x0?=
 =?utf-8?B?dVF0OHExbVZORnFDcnIvaEd2cGF3TWZPdS82b0VhUC8rMDJjZDN5QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1664b125-b19c-4ee8-d8a4-08df18b2311b
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:02:51.8194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVAfl7OV/2h1caSktvO97qcl9ustQ6KrTuCVD9gMkTEF+HoixQQHq7lhJpSdhVv9B1a5rLXHkNMpjGjWgCSBMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6030

On Tue Sep 22, 2026 at 2:53 PM BST, Alexandre Courbot wrote:
>> =20
>> -        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
>> -        unsafe impl ::pin_init::Zeroable for $name {}
>> +        // SAFETY:
>> +        // - `$storage: Integer` is sealed to primitive integer types, =
for which the all-zero bit
>> +        //   pattern is valid.
>> +        // - `$name` is `repr(transparent)` over `$storage`.
>> +        unsafe impl ::pin_init::Zeroable for $name
>> +        where $storage: ::kernel::num::Integer
>> +        {}
>
> While I guess that would somehow work, I think the proper place to do
> this is the struct definition, i.e:
>
>   $vis struct $name
>   where
>       $storage: $crate::num::Integer,
>   {
>       inner: $storage,
>   }
>
> This makes the error message also more explicit about what the problem
> is (a bitfield requires an `Integer`, not merely the ability to
> initialize it to zero).

Agreed.

Best,
Gary

