Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021124.outbound.protection.outlook.com [52.101.95.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D953BD63C;
	Mon, 23 Mar 2026 16:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283568; cv=fail; b=bboLPFKMkHGMfG0bZK+7wkcApUmcgR/HDIepW951FJi+772VS8XG40sYfSKS6vAWHrUwSg9l8K2zQ6sERV7gQ2j9ixTSbFc96prEOCWfZdGYgjZ3jKz1UTC33yEimrci7OKOZa1l3bFbihJ9yeCbx0SNKcvBIYAJr6LyIix+Axk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283568; c=relaxed/simple;
	bh=iZBPGPadkSAitghfyZEi8h5eOHX5V5nzHm9WMuOXyH4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=P6ntqboI82+5mGIWNAUntAkEJuyBM/M1bFjXXkCtHwLfYFSp+33WQmTnwxAj7U1/73zzUiI4QNvR8y7/uECVL+JOr0XvhRQl79NuD5oSycEmmd2HeWefl2msuVHjRlZpKZvbi1y0fdv5jYY/WPEJDHYepjH32A4qI5QprNBaJ9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iBblyaxF; arc=fail smtp.client-ip=52.101.95.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iBblyaxF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKFHSOK4p0Q/ATPPLXMHCCVOCxWV6TZoyV1RL+Ax/98f9+ZG3oJjZkjotl3RSdYiH65HWMN/K++ylQjLZ9k/yhRe++MqhUfy5UiVynzYZ1hKekKo0u1+0Gisr427SQjgJ9+3TsznDC2PVxoVHqHaO6my9T9OaKURIZtUqhZ37yjnzG1n1M9fM6x6illBG0Z7b8pdYmWu2/noJ8s8o7BkfwauJyBRA7inaltXpEmmQACvU32zIiri3bO2igLcoIjAwhMygDxUDpflzeXPWKpKAWkWcvLnx63YMso/ZIAdBVcP3tDjDCCr8cMt5KpRGVrk1/Z5eyPuOVyN7syVgyP/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+muoVi+hpovuEISnDq9sk694HjU6GsUfH4ggtpmiWU=;
 b=ATnIrhYbVt5VXkOZ21LXyREn6j6yrK3774+xsJo7iMrgs2K9y5M5dIb8xZbfrH7hBO9OE29YOWNvEfHKY3//nlRNnJTl+KjEPla3NpAGYzpC1Rk6k9s5D/fmkuhS8sW3/EVHoFRYPtwk6P2stF3RkB0zkXr6nUsolkrtOvo5yGw+ZMi4Q8+JqgRsT2iazeLpjRh+OcL6nmxBZJQPactBAcbqMt1TIAnqvb5DzAVUQIHnHHwehhnCdVhoZO43IC0y+iPGSb2S/tnlXQjFm8g42haueJCAcgBo/eput2Uy2FZ/4vQsj6+jTnPnecfqG3dkIiZtuRO+affp78B9gLnv6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+muoVi+hpovuEISnDq9sk694HjU6GsUfH4ggtpmiWU=;
 b=iBblyaxF1bLUjEcIuv9gDvXTPcbBt6e2VrwrdnBKny3VwwRAtRQcsgEcd2F+4ris4BI8lUXVs9Cf4uuP2sY4b/H0Vx9Udavmy60XqLEa+amb2DXteMorQoz2XYr8JGT5AOks4Btke+lJjQF/eSMOJ6BrqIjGtOIPr7B0N2TyqEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2829.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:17b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 16:32:43 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 16:32:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 16:32:43 +0000
Message-Id: <DHAB14FI33XH.3NSA1457TCHL1@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update Rust I2C Subsystem entries
From: "Gary Guo" <gary@garyguo.net>
To: <igor.korotin.linux@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260323-update-rust-i2c-maintainers-v1-1-0744ce44f846@gmail.com>
In-Reply-To: <20260323-update-rust-i2c-maintainers-v1-1-0744ce44f846@gmail.com>
X-ClientProxiedBy: LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::31) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2829:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2a7bf7-387c-41bf-34ab-08de88f9cf23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020|22082099003|18002099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	pOP0SwMZZ49i3ppqTE2d6hDrROZ+sLjN6w2xIHIA8bXjwgaNudhjfIIZP3Lyo7sTyXFNp0pbR+LI6QydcKEgsjC8ma4EKDsGY2c8ZI912iAWZJA4aFCjyqxZeScQwKJRUj699H5G0WzGCNODXZJgm8eOE5RngyF60iriAkzf5hS2fFwjnwI5Ugzkja20aiSJqtyP3P/+I2JFs/qh+UQxWrG7ENg9cZV//KnpH3cA8gOjQPt58nAA7WWgaC16kQKLr7RCNCjYsGnJ2BDWwU3zbsNWGWExuTMU5XFuSbspAvhka6kx8NRh+xGprIhT5jzfYGQtZgjQ0D2HNqijWTVG0G90XZdcGDO1OT3jv9OpMN4J2hR+I10kyY7Wtim/LVIP9PFYkwBrItbwxjRLp58587rmXVTeqJmVMGv5HoUBKpxGFBlW07EIPlnEXwOaBGiCyQuNdNUf31D1kVgy8f71dMeQr8ZBDF41MK373z6az+lE53I9aQIJ8E63L3rwk2hpgLErxrPmIlvPukcJQLzI/a8TWXQ02UkKDoxpIVH34TlocqkPJzw82ap9SakyiwlQdCV3YGf3Bytx5fE2KHoF26ZduAIJxRhx299Kzw+NZHDEGYp0Yv1cNZpDUVvhJLGoB+HegfNWACkTePRe0lSB4eZF4SzdonytmcKktcK3s1BEhA+OASpfOlclQWBUrIGTsOIIRgduWlzXxdabw5oyeWEVHeDCL15FRGmEaHDNqhIkIH1nbXeLcFDVKPYfPNefw/XHb5jGd0Ml2QTCy7fHwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkVLeGh5dExHLzhwaTVtT1BmcGFYd01qL0I3Ull2d2txMnlxcmFPVGxadXJj?=
 =?utf-8?B?SWFYV3Y4a25EWUdTVmtKK09CbzJLVEdWZk9UN1lWalVJeFY0cC9abk1Ueiti?=
 =?utf-8?B?RFFKNWNTcXpHQjRuZ2NTdUtkSkd0OGNnSHU5Q09lZG5ENHZVcGJYMDZVd2Nq?=
 =?utf-8?B?czNCN3FtWExHRTd0cmNGMDNjY0d5SDlqZ0RvZnRLc3pnVFJ2RUs3cjdhQ3l6?=
 =?utf-8?B?TldaLzNoM2ZmK2dZMjVrZUVNMERBaGJRTlhLWVExRWt0aHV0ZS92RTZUY0FP?=
 =?utf-8?B?RHd1dkpOQThwODQ1UTJVWjdoVWhDUXpvTzFueTN4cEYyL0w0V3luYnc3S1Fl?=
 =?utf-8?B?R2pjU01WZStkTWZNK2VwVFNFclFkaHFTWEVVVURCNUVRdG1tc0xvSGxVRDQy?=
 =?utf-8?B?KzUxMzVUWFNRbHNZTkNKWERXSXdVb1I3ZCs1aWM5R2NyQ0pLSG9XelFlTlF2?=
 =?utf-8?B?dTNOOWVYeXhBeC8rUVFJOEtxOHhQSzFNaVF6dzBtL0Z0QStwcWVGVVlBWllv?=
 =?utf-8?B?cHI3TzBucTNUdlRFeDhoLzNqWVY2TTFERDRsekZPb2FnRTVjK2hLOEFKb2dz?=
 =?utf-8?B?K09VTlFPTy8ybFF3SktMRVUyZVVwcElPQ255L1A1LzZUN25tZ3RaYmh5aDd6?=
 =?utf-8?B?UmJLb3REOXdwV2hrbmJXc01BanYzRTdCV2ZxZkljaGoyZWpBQkw4andsZWdh?=
 =?utf-8?B?MDBmbE1wcjc5RFJBK0tqN2YzV09IdmplWnBFK281Um1najZ1NS9ZdkVXODAv?=
 =?utf-8?B?T3dkcThKRnR0N0ZyaDRNVFBETzdhaFZ6OW11Nnk3cm1DYUw0SnFMNlg2NC91?=
 =?utf-8?B?KzArOWl5Y1ZYb2lOTUFtUEhlZ2hIMGtKelkrZ3ltaERlK2xibFJHUHdpY1BT?=
 =?utf-8?B?WjNQMjJOR1M2d0pqNDdGbmxLU0xiVnZFSWU3Rk94UlVQVmRMQmtFbjVQdDUy?=
 =?utf-8?B?MXBHazlPVXc2V0pvenZ5SVRHN3pzaU5MZHl1UmFGaEJFbW9kSmpMYnhCRTc0?=
 =?utf-8?B?V3BiSUFkYSszTlNtMmpYS21YeXd6eVlEYmZGU2dqTmFXNkxreFVzZExoL0JY?=
 =?utf-8?B?UDZxdWVwRy9Lclp0a1FZRG1HWFV4SWdQdkQ5RkN0Tjc0WGF0Wjc1K1krUGtm?=
 =?utf-8?B?UXV5U3BLU25wZjJBUjVBV1ZYUnZBNm8wRS96YjU5RGoxbCtXUXMwSkpsOHRo?=
 =?utf-8?B?Ty9QRFdjMThITnpYdkQvNGQvRXlKL1pkMjZmVC8vMTFHbHdXdlZLTFdTNkFX?=
 =?utf-8?B?c3JhaENGOC83RFkxd3VubHpOVmhuWjBwUWhjelRqZUlua3g1OGg4VjJxRFFG?=
 =?utf-8?B?dDB2VFArSklMMTlGS0E1SUl1Vkw1RXdVUXZNV3Zac29ZbWl1bmFjUHE5Vk5U?=
 =?utf-8?B?VHN2R3Z3RWFlNG9SRVl4U2Y4M2UrdFYzaEdRd2ZEYURFZ0FHUzZQdnNza1FZ?=
 =?utf-8?B?djBZKzdnT2hkZm45d3dVWURyMkdFZVJjVWJobk1DNldZZUN6V3J0UkdqeWdW?=
 =?utf-8?B?ajQrZkpndFpJN1FyeVkzMUJtQ2V3SVpkMjFuUjErVjluRm5yQzB4S3p6QUlT?=
 =?utf-8?B?dXA2dTlCdHM0U25vT1JhZytmYlI1SnQwVDZLQlJ1N2VrVVFtMGJNY2RDeHVY?=
 =?utf-8?B?eFhiWlZqelg0YlIwUmZVd1psNFFxTVN3UCtGaWZ5Qmo5UTkxUnMrZnMrL2Z2?=
 =?utf-8?B?ZzFhR2FlQWVMVHY2bHBLamF1NlloeHEyWFViby9ZMTAxM3BaSExrYitISmNm?=
 =?utf-8?B?ekNHMjlRMktPTjhScmtSSDJIZFdud2NjZW9HSDQ5N3JqMW9Oek9FZFAzKytH?=
 =?utf-8?B?cTFEZllRSlRvdnFTNnlXbEdoaElIODhJTFF6eEtHMjFKZlJJdDQ4K241eXdo?=
 =?utf-8?B?MXlzSXpDbzg0VXd1THhNcitqSng0cGttOGNMUkM5ZUVBNVhZTHowU1JQSTZr?=
 =?utf-8?B?dk91T2hINnJwOFNzQTd3Rlg5NU9HdCtKNHBoUEVnMHcrVEpCejFDR1dZYmJD?=
 =?utf-8?B?Rmd3WVVNTkd3TTRqYnloL0ZlV3ZyY3pLZzVsU2xkbjQxRG1nQzRkeW96bllX?=
 =?utf-8?B?cHZJYmI3TEtoL0RCZkJNQmY2Z3grSzZNeUVqdHdVOWVyZ0wrS1R5SWdDbGFP?=
 =?utf-8?B?cVllbWY2OHpHRGdJNFppTUZkdVRZY2xnY1ZVK284Z0V4NGx4Yk9lR0cxN1h0?=
 =?utf-8?B?REhKU0MzU0RvWWozRWNWZXZERnhheWl0MHZxL2lhVG1nZ3o0UFdMQlNYTlNL?=
 =?utf-8?B?Skh2RmdiSG84eTlmS2YwZHVEM04vUTl1VFBLakdDdTZzdURIdHN5V21XcEMy?=
 =?utf-8?B?emVIR2FkdzJiZmUwdWgrcTl4amVBTmM3dFpzRjVFbUlvZ2dLYzNBUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2a7bf7-387c-41bf-34ab-08de88f9cf23
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 16:32:43.7335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScWwqR8YYeIQsocwHH6A4EgYU8C/9KUSUESgNgXJWZ2feMOUV/Ai+eKTCPWpNBVs2yx/y1/Wkd8Uc+oU4s/A6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2829

On Mon Mar 23, 2026 at 4:06 PM GMT, Igor Korotin via B4 Relay wrote:
> From: Igor Korotin <igor.korotin.linux@gmail.com>
>
> - Change Igor Korotin's e-mail address

You probably want to update mailmap too?

Best,
Gary

> - Add git tree entry
>
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 77fdfcb55f06..302ddd2d8ec6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12021,11 +12021,12 @@ F:	include/uapi/linux/i2c-*.h
>  F:	include/uapi/linux/i2c.h
> =20
>  I2C SUBSYSTEM [RUST]
> -M:	Igor Korotin <igor.korotin.linux@gmail.com>
> +M:	Igor Korotin <igor.korotin@linux.dev>
>  R:	Danilo Krummrich <dakr@kernel.org>
>  R:	Daniel Almeida <daniel.almeida@collabora.com>
>  L:	rust-for-linux@vger.kernel.org
>  S:	Maintained
> +T:	git https://github.com/ipv6forever/linux.git rust-i2c-next
>  F:	rust/kernel/i2c.rs
>  F:	samples/rust/rust_driver_i2c.rs
>  F:	samples/rust/rust_i2c_client.rs
>
> ---
> base-commit: bf074eb6891be799174ff42e0051492681fdc045
> change-id: 20260323-update-rust-i2c-maintainers-2da57a4f75e7
>
> Best regards,

