Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021103.outbound.protection.outlook.com [52.101.100.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47F31AAA8
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776272231; cv=fail; b=l4ZX1iCAnwhXIAWTzIPVr8F3OkQTWuUjGGJJBfcFH2TcK0U/eNSrDWoS9gADO4HSBSwluVjWwffx56A5ScdVLLsIb6qfBdYiLJ8ur/CkAE8igAfpGdpRCKLgMalEhaJr63Bvgp9Ao8dOVc28z8BU4hkbe51wStE7RatX/x0iU8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776272231; c=relaxed/simple;
	bh=YNhcqjA4d+MuyhqJiTnmNlMfCYPUAxmgEfju6Q9u4Xc=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=ah0JDtlPoj8Q6sUEa6QoCJpf+5X6hfgcfhybcK/d2SGmCJ7DqYhSUAAQNaNjDTTgSFuqpNRY+CurDzjrM8HHKeWUBb8HWpHHrMRjqo+oYwxHVCJ61XzKWH3cvuw6wunQhWWPvzmefuHHZa85akeU2CoNQ9tmgtQTAG7E8DIfyJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jfTWsbRN; arc=fail smtp.client-ip=52.101.100.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jfTWsbRN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoriquiOPn9e60yYEHbgd7CdO29IWSwf5oydmDzv5elbQkBJDK/TuLabIBvmr92E3AoAvCO9yV/v2v3UMbsMuVEu4iTp9MrGzgyzKW/Jn+d7sI9gmTxGuxcUrjB2INXh1LXPXiUTiu2DhbmYGvuz10w7J+uuwoHOecYlZha44yA5qE5Eor2tb1PKSUP7IRkL5hoUQg+ap3uePCqdSSxx96H6TL4WPuBQ8NN++xlzflXNbrINKwD/4ysLCVWUWPe1VDOPyoOa0nMAL2muQYYRl/Ya3Gpu1jA9aLNamBeYydDwhdh+ojnINVU6n6lxoyj1RsoHydeKBluEmqq3SdXDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bLLRwdGzzcMB3XtfskmpH+RnwJz04Vz57hsA41f9mg=;
 b=xrBdjdHumaX8z4jtzLfJ7R/to5Z36d1nEQ6yH8Zk9PxZfda8flmTd5njAtvu9yMNkyc0SJON7iK2hQXM4lilYDcklFWB/wjjZSvkDJPv4qIpdbVP8CoJflcNRAJLpUXsU09mxEmtQfRwUUgiaJHrdYNP5Fs3FYeBQgXl7L/4/03stR5XiIm4yFJ0WxHMJ9a++qWEf233w7/PPfZbX7gfFN7v+shGW+/hj4RphqnlDpkflA3wn+u7P4Mu/1bSWeiyY2FisVAndXzR0PKw7z5flmSJMDt4eDKAzdqflToJsF0seFiBdCGEFtHQ5a81ug5yywHfhaSFEB9p9o46QpR53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bLLRwdGzzcMB3XtfskmpH+RnwJz04Vz57hsA41f9mg=;
 b=jfTWsbRNuucZo8vrf1KJi7JQji8cK8GjnSgOav6nBw1heFZ/4fKdXjp8EmqznWB4TtGIt+oZTa7dYJw7CKB6hZ7MJw+nkEfN+UkKWj2fZ52yyE1cD7YS99uRya/tpKj+TgUH23T5KZFYJbvDUhCEAomfCYg/ZKEfwWUe5xv8z2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB5325.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:258::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.42; Wed, 15 Apr
 2026 16:57:07 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 16:57:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 17:57:06 +0100
Message-Id: <DHTVYBQYJNUM.2MJBIYWP3BLYN@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-5-ttabi@nvidia.com>
 <DHTRY8R0QQP7.18II4DQCILU5M@garyguo.net>
 <DHTS5166DEXA.G18MTZS8U52V@nvidia.com>
In-Reply-To: <DHTS5166DEXA.G18MTZS8U52V@nvidia.com>
X-ClientProxiedBy: LO2P265CA0490.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB5325:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d5e9d5-c7bf-46ea-6222-08de9b1006db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bdZRyf9nV5LTYw96G3l9FR5rrd582vbkpFx1N/v1Y6m7avOiFPCN8I0gNJnC9vgAStwTNRB9Q4ecGqpThRnWylOxybaNSixXb3S7HYfAv4IYFhzwhpI7wkPHLhaYrmO3DEzjlyud8uaudQ4FoWFMm4ZzdLOz24CxuZ5+yfh9WxgQNl8gzh7QbknhqGT8lBM9m0AtTzdNmFi62XQ3jwtYVBVrIs6fEgpWWUDiBIPm9Zq2Cb/5OBSvvTY98qdwyTphxhRlXIrRGC7i5d4RQVoaG1ot8NHqB6KlIk/QPnXu3z9K3CzTSgL8mjXZwpLczd01Ub1jQfaddqeOSPWBW6dwD6ZNZR4FbYBHzLll6mGXQ/7J2GcIvLAUk1PW7hG8WB/9HWbiwFDsh5poBbyFUgqF4/Dw5/SAIPMykfUzLLM2F6mwI6GX/giTj8ZTNnA1Lb20qSCXhn+iORsAVc12fkuV0d8r8FlYIlg86R72MtRy31h0yczFePJuXE9+5UMnBY9k6Jt2dJ8dwQscI51QOG0NcK5CuULU+rJFJeu2EP3C73UwU9yaNUaVi5/CCxROCcY31otrVQ7L0Mo0QJaxKUnLcg1dRjtw0X4H6J06OxmmvTGPWKfTmEej4xyraaoZt2eVAezUbBdMCXH+vkB2WpHJ03jiMc8Ii52yOPpAQoDaOUD7l8KsPAUUPnoIHmQc8XsIwkEVAOR8QGfzHUXWEL1wp4ZXVzlrGLnq5xVMM9m3NSE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0tlV1pIU2tUeDh2OWl0bStkTXd2S2ZvYUhtSmErci90bTdiTWQ4N20veFg2?=
 =?utf-8?B?dVJHcFNuVFdDVm5pcUE4UTk2TC9GcytQSDhCR0FJVXR6T1NsTUJocU9BclRE?=
 =?utf-8?B?S2M1UVV1RXBCNnpyZzNGY3REeld1dENmTmNwelY2emwzNGdoRVZTcXc4QWZ3?=
 =?utf-8?B?WHFvUCtKKzNZOGc3NllKQXJuemhVQW1PY0RGQjZDQ1A5NEdlN1VlSVdtenkv?=
 =?utf-8?B?Zy9JamcySU9BYUhiakl5cWp6ejFuY3ZQSSttd2JKclpCTVBHang4SWRkMHhx?=
 =?utf-8?B?STErU0dyVzFFR0RZcEtpQkZMSU9VajNwV2N4VG5MWlNONmc3bWd3R0U2L1lQ?=
 =?utf-8?B?VHpzQUxoY2Q2clIyNitLRHg4clRZVmdHd1NoSEttR1B4ZDVOeE11TFp4QWhR?=
 =?utf-8?B?TEFIZm0vZVoySkMrYnhSdG00czNpaDdoMzNiNVdBUnhlS2cxQ1J2MmVJNTlk?=
 =?utf-8?B?dnoyRXhGV2kvUEFFaUpXaVBEeUJQQTB2K2lDR25CUnZiV1RmaWJYbkJyS0xE?=
 =?utf-8?B?cHpGYm9KWkE4RUtUd3lET0pLY0l4OS9MSVhBbE0wUjJlV1hUWW0ydXlHR0da?=
 =?utf-8?B?YjMwazB5WkZ0UGdBUHZ5dWRjTXI2YjRwQm5RUlc2dzRTSHlSU09rTDdzWjRT?=
 =?utf-8?B?MFcxajVZS05Iay96UGJ4ZGN5bCtRd0FTaWVVdEJPSU1DYktIWFdvRW5WVThH?=
 =?utf-8?B?K1RkckZjUWEvYk5Nd2RNbGFvbndjamlrYllIWVpQNFRMQ3RibFRoaStQamUw?=
 =?utf-8?B?THVvOTViSHppYW5ZekpMcHJyd3A5eWE2RWRndytqUW5HTnJLVUEzU0VUZ2hy?=
 =?utf-8?B?ODF0UmF1K0ZScHEweFdETFU2QVJ5eWpzMzlrenVyMDBrQ0ZzRmpGSkRHQkdF?=
 =?utf-8?B?aWwwREJFSmNzSGNzR1o4UHFML3c3dWxzRFpDZjRmWHY0bU9GUWxaS0NMQlVX?=
 =?utf-8?B?dUVLWWNUamt5VEI3b29mSEpvSFhySHRuY1VoVG1XMm9mVlpUSjRZUE0rTEcv?=
 =?utf-8?B?MHRpNVYwU01aWUF1czJuV3IxZnJoTWlPWElySlVUNDB0emtIL1h3Z3cxVWZw?=
 =?utf-8?B?Wm5zbmtPRnp6T0NLUHJXSWRpa1hBKzNFbGNUUHZWbEZnTmVCb0QraDZmanJI?=
 =?utf-8?B?bE9BRlk0L0c1TVVJdDZUZVZqTkNGODh1dm5EamcwQ1dtMTFKVHJJczJ3RE5L?=
 =?utf-8?B?SHRXN1NLekVsUTVwTHZLU1ByakxEZWo1dEVmeXlBOEVGdXRtdGZrcWI5aWgw?=
 =?utf-8?B?MG8raDA0WjJ6ZUwxL0Q3NXc4bno5eU8vS3ovLys5ZDNjT3RTQnhla05rbzc3?=
 =?utf-8?B?NGZzZlNpSXlRbk9JSWUrVEhxK3k3RG5SMGNUdk1abENtSksrcWwrVHVaKzdk?=
 =?utf-8?B?SVlUQUxmOTNZVk5ZaGtHbllaV09WZk5UbXpaZjlxTWw5dFBNckV4Y0FIVHlK?=
 =?utf-8?B?RWhHNitYeTA0Y3pWUjdhYVZRNEtQNll4NkNoMXNhQU8raDYwcHFxTXAxeFBE?=
 =?utf-8?B?NkhrdTFzaEpZSmJHUjdmZGg0aTNKRmJKaHNaKy9WUmd3NFp1VHVkbklhWHkr?=
 =?utf-8?B?MDV5N0s5aGVXN2lvQmlTTHZNZmNyRFVRSjYrS1BEZ1VSMnhYVTRrRkp3cTR1?=
 =?utf-8?B?eWw4WlUzUVJ4TVN2SjFpWU9KeUFMZjRDNmVpUkNDR0dhZE04MENIR3R4cTRQ?=
 =?utf-8?B?dkdsYUF6OXU5TGNSeEowbnpEZ01XSEszWVV2QmxUSFlCYm9oQlNPRGV0b0xh?=
 =?utf-8?B?aVJPckNlSm53bXluc3h5NmVSOFl6K043bzJselFSL1ZvSXY2TklVRzN2dUlQ?=
 =?utf-8?B?Uk1CeldEeGN6Z0gyL2VMTXJBV3ZpRjc5WWxoaWI3N1FOemFnZFZ0UVRtdDNM?=
 =?utf-8?B?QkZqeUs3Vlc4dXZ0QVJHNVhrZGJHMml6c1hLKy9tZzNQSmtKc2RFYWtZZFhZ?=
 =?utf-8?B?N2lINFdHVlkraVg3a0pseXNGdHZVWm9EdTRucHc1VThxQXJwS29meUhPUWIx?=
 =?utf-8?B?Y0FNYWttK1N2aG1xNG9QS1A4YUFOc2Z4Nnh0M2NSdFZSMXd3MGo4MnhIU1Jt?=
 =?utf-8?B?bWtLNTZHajNLVTZFWWFoeUJDakhmYzJBUkNBWS9Jdnl5UGZtb0NMYm43Q3VX?=
 =?utf-8?B?OEMyaURrYjhBeVg5NEZTc0pxajBIL1lkUy9DaXVMbFJIYW5Eby84R3JFK0ZC?=
 =?utf-8?B?M25YdW9OODU1OFd5b1pMZ2FKOGNnRjlPb1ZlamlrL1krNXNxbDhYN3hUcjNK?=
 =?utf-8?B?T2M4UlR0eGhRbmwxcGd0cThORVk2TGhDVWUvSlRvWDAxWjI2QUd1UWExZjUw?=
 =?utf-8?B?Vk9IQUgxKzRQSURQTFRhZHdXemNYdXRFK1d5WnBiaEdiRk5VMkhzQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d5e9d5-c7bf-46ea-6222-08de9b1006db
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 16:57:07.0654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUeGCT7HlkDdylkir7pHFOnXFVcxA1ST4cGyHVRlFF0SyXdsOunR3CsulO14xBKW9DG+AtoG6HpRC4mCvcfQtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5325

On Wed Apr 15, 2026 at 2:57 PM BST, Alexandre Courbot wrote:
> On Wed Apr 15, 2026 at 10:48 PM JST, Gary Guo wrote:
>> On Wed Apr 15, 2026 at 12:50 AM BST, Timur Tabi wrote:
>>> Introduce FbHal method frts_size() to return the size of the FRTS
>>> window.  GA100 is a special case in that there is no FRTS, and so
>>> the size must be set to 0.
>>>
>>> Note that we cannot use supports_display() to determine the FRTS
>>> size because there are other GPUs (e.g. GA102GL) that have display
>>> disabled (and so supports_display() returns False), but the FRTS
>>> window size still needs to be 1MB.
>>
>> Do we want to special case 0, or shoul we use `None` instead to represen=
t that
>> FRTS region dopes not exist?
>
> This was discussed in [1] - using 0 seems to be the correct approach.
>
> [1] https://lore.kernel.org/all/DHRQL0KVSETV.2YWE5W5JFGHJE@nvidia.com/

Okay, so thye important part is frts_start still matters. Perhaps this shou=
ld be
written down somewhere, in the commit message or as comment to HAL.

Best,
Gary
