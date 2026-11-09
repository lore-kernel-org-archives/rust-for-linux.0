Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794233320;
	b=2eBsChf7CY28vvf5lOSJ+3VM15wXPabefY4jkPw4k+H7A8QeFvfjhPptaTlZVcBhDPvd
	 Osk3lVZmryHpm/sxaHLz31NZYVYINnFRkU8FtcVUoH3mn6vw5TMKQ/SatJ9nF6/wv4rR1
	 alxUhgU56s2EAAzwYpYnNJiI03XWAXIk6IS7IWk7h2gwrsAQcvklJ0TJ4eQQ9YEubdlno
	 NBYPaXzso/hjoefHxK+/D71orwNAfii494LvF4v+SU+hwAKiDoIeX9GmKQhQ4CDO+5F59
	 niWoh/LNw5t8qRMVmu5GM1rlWZqzOJuMwg5uB5zD5nl21WAFWKfPsNZ+lZk6WMtrK4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233320;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=UiTnC8sHw9GVLPg7xBH3xuwzAM2KqEwz++Y0cMW2AB4=;
	b=l0btMHrjr+Qj64xuTC+WOhVvRx5Jejxj9IV7J1P5sMRlW68i/Tesk7YDMVv3ll2oUkfx
	 jYbckEdz0iENSv+XlzfZHf2q/br7WQzMHBwx/DdCJZqjNOXF+6XnDpQRqSFAt92ukmZH7
	 t4A7lewzVR4+xjgkw2GCZ7RPdZFhVc4SgsmFXKkIcl8uJl5mTGCAtZrGJaaEobFkosJIh
	 MYUOWLo8ERmAuybmUpJHvhHbkk+MstpJTv+xZJGcwjev7voWrWPbe2GogdBeUIF2b7nrT
	 l2aGpTDde53lM3ZUzUWF8mxDd19PN1VxS6Dd0VLvO7TQwzNHdpLPECWaz8Jsodmcl4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=Sk4kKLhJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.136
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021136.outbound.protection.outlook.com [52.101.100.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152BA606A323
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Nov 2026 14:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 152BA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=Sk4kKLhJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCHvQl1oi6sk38ndzwCgX+7TGaodrBkbGM/iSOTZz4ys8VJCB/pcc4uxm/RRFNIsKX6FlZ6tWadtAW2CkgY1Nx+9fo9Ee/JziHRbVoiMOdpE93Ydw0sM1oAslIptMDT8nQ7va93BmXypS6X/OJxjdll8wUpugZZr7syq14uW849M3WZDIumbfbwYMsMyhBXibN+UGsPIskBFZ17FYcNGJjqi50YJt+Salbts7Dmndb4wfL8iKcO4VW1Ye5a1tGFQlbHycE/PfMzXFG3aXRVCySf1asqcdVLoRaXyFZ41kT/07ukVCqrCeo1ZqzrEsiCmlKi5yO4ZRUwNxOPHE+dIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiTnC8sHw9GVLPg7xBH3xuwzAM2KqEwz++Y0cMW2AB4=;
 b=m2nEPuvyPkNPczfoL4+0kYeuZ2bjfU20gByupucecgcNFBcMyF0g91Gbwg3uyz89jySFTyxkZZt9AQqGJ7ycFthb4RtS/yZSClyUhtDtahGuCsKYmuR998wcFXBQLK37IKR0wCSklExLHkHea72CCuP2QifEzptR/zEU4pTk4fbn+qPuEzrouNfnI6pxy3ygxsy5BJy4nWIOvEfj61hNWnoC2oqWjI2o38xmZdK2DvjwNxrKsUnVrnMvCTuYLezI44oQG9+YM3NgJAG1HddZTneY2wX8PgQ07NRQXchq15fBwlrb+VSBhYvzXO8WGcNp+kxW2aCfgsEISL9dVz7XIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiTnC8sHw9GVLPg7xBH3xuwzAM2KqEwz++Y0cMW2AB4=;
 b=Sk4kKLhJERx3s87HokPgyimF+vNYQ7QEShigV9MgIrTx7C4nwu1zlZ0VOLfG6IYHntNI9Wma7GwJqOzWC2VWq1/ySftmpUQRb3fsOtaTUjRWTjzJKbFxi3mNVrmssSdlkF8OyvziSf7Yhcy1dJ1Ho72PrjSjho3HKjx4mWPrT0g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LODP265MB340279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4dc::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 14:08:35 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 14:08:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:08:34 +0000
Message-Id: <DMQQMLKPTZX7.F75JGTOR6T0T@garyguo.net>
Subject: Re: build error of rust ordered/unordered sections mismatch
From: "Gary Guo" <gary@garyguo.net>
To: "Wang Yugui" <wangyugui@e16-tech.com>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20261109074705.418E.409509F4@e16-tech.com>
In-Reply-To: <20261109074705.418E.409509F4@e16-tech.com>
X-ClientProxiedBy: LO3P123CA0032.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::8) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LODP265MB340279:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3a28c0-1dd1-4d92-2e4a-08df3e6af172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|56012099006|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wXzLiIJKvfu2DrOT3XO1J5ov+mlnH0hZqj/w+7zj/6mh/qGp1pk2aETzPuuPL2PeFoA6JgZOS47ku4C1KPoUQKC1Syl3ko9R85NMMtv5DpWQhhxYpaosJGA8hpmSKN36+3FkiZu27Oc4eM910e6eCJJ2VvY0mGHifCZGjgpF5eYVbQlt6zWiCtDvViPxyJdYQo+GYbFrbY2/kid+jrGpfQI/HphgnTW0wRTDvc3UYCFfbQcCvEniDrvOZKYQCAzlQVi7ZSUVZAB/ldP1OcGHXpYP9qCRAyAxzN1jSmuXqMpbtQnkH0bIshZjzNu99Mpa4snMUe371bXVIpAwW8XneALjutw8QZXAkvjsd5RTt3uZ/R2n3Lv8iZ6thR/u9wxffjiXNlq7FxtfkACYg6hbka4EwT3zaBBZyZUxXeGb7F0PRju+3TzjcWSO9E0CTrCLc9YLrzKspZM6DUL+NWODf8QyutlOZYZfNMwWapVGK3rjWxp4SgTD+ENkQ8B37gYpY98nLXBDKeHy4KafVrHX3O6OLS1ulMOvPBQR4TfcMuByg22apVjlTk3F+VZOSOxNXwC8NrDUUxQlFsSQUH6JohlwbwqtYt3BCj4/Bza3DNJ74LqiW9biFgMR4LNrK/42jhlvOoJ0KFATKVqrKPxDsyUlEW3yiSMzQ9zPAICu7hg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1dHSUdrNGZlUktpYXVRYm9BSm4wVUozdXlNcXVpdUJQcTBnRm15aWpYZUZq?=
 =?utf-8?B?MlpvU2toYmd3ZFpVcjVwZnNKaG5YeXNtcFYwaHJpaU8wNHUzMWZlTmdrQS9x?=
 =?utf-8?B?UTU3ZldQWW84dmd1L1VtU3d5RW0rMjZwT2piZ1RpL2lxZE8raHZrb3J1K0tM?=
 =?utf-8?B?RFJINGZiWHliNDlaWDJVN1FIU3pCeFZJcHJrYUZEUzFqTEl6NHgvOTY1TExj?=
 =?utf-8?B?NVcyUWFUOXNSZUQrdEN2YWtLSVBaUFNMKzFyVXJFWG1IMWJyRzhKbWpITG1n?=
 =?utf-8?B?UEZTL2RwVzRSK1Z4OS9yMTNlRXJHNzNFaEs5M2ZmdGVHQllnSkFmYVhuaUNo?=
 =?utf-8?B?aHlNeWduZ3VCT1YwVkZqOFNualR3MTM5OENIVTZTZklnTldlSlpZcy9qMzBE?=
 =?utf-8?B?Qys3SFhNMFRsQVcrdTdXR3VNU0pGanEwbTc0TkowbVlKR2lXWEhOZFZIVnI5?=
 =?utf-8?B?ZzFyZ05Mdmw2WlhwY3BzS2ZwdDJPVFhaMXdGQ1VpenRUcnlwSTkvN3djNi9Y?=
 =?utf-8?B?UnlBaVV4Y3BrSzBuOE9pNUZJNEYwcjBXNEpjLzV4OUlxY2hxbWJ1M2xTMjl3?=
 =?utf-8?B?SHJHQW5qbnJGekY1Tk9kZDUvemRNSmUxc0VGT1A2SDRWeloxUHYybzBrUmVG?=
 =?utf-8?B?RWxvVk5oWHJDQi90eDhQek42aTVpcVlUTy8xWjVOcXhNS0dUcW5aQmdqUnRD?=
 =?utf-8?B?RUJWMStlRWZ4dTg0cndPZVlDV1duWkxCdktlVWpZeC9jSUNwQkM3NkxBMEpP?=
 =?utf-8?B?Y2RHa0xMN0xTVkc3OUpyeDQvR01iaEVOVDMrcldZUmpFMHhmWjgyL0QvTDhN?=
 =?utf-8?B?Z2MrRHNLanZocHl0clFiMG81bkNTNFNBektBSTlZSzFvZFBtalAxSzZ1WUpO?=
 =?utf-8?B?VEFJanBSbkxkdzJXN0xFdGpRT3dNL3d5TjgyY0NIUzZmQzF5eUhmVzFSU2Vp?=
 =?utf-8?B?Rjl3NE1yaUR5WFFLK2xOUkg0RTRIVVN3MkViYVVyWmIxUE4yNjZQWngrSnVE?=
 =?utf-8?B?S2pTaW94cEwvTVNpM3h4TTRZbjkrUmNRa0kvZHRpQlBQTzZleVF2R2x5a0pY?=
 =?utf-8?B?bE9rcElrUk9QaVRBMGZ2dFBHQXBBKy9HbE5yRzd2bGFhNmdEQllzMUttWWRE?=
 =?utf-8?B?c1BtZU5TZVo4Q0F3c3A3b3o4REgxQml5R0U1RU5JV3Fyb3d1a2pMWEx6Mmtn?=
 =?utf-8?B?aDZjQTVNcTM0OSt0U2htbmJaWDdLcHl4OEtnYU5VRVBLZDJCTkpucWhwRDR1?=
 =?utf-8?B?WjUrRmV0RGZOdUxCVVU4c3JvS3RqMk9sYzNmUlFXdDYySU1WVGZNeWpQdEFB?=
 =?utf-8?B?MnRGcVFieGtWQWFpbEZXc21wSGN2SG05SHcxNjhxVHdlM0RiSWhVV0RZVkN3?=
 =?utf-8?B?MEwrcEQxWnpMTHJLeVVrQnNQTlYvWVZpaXh4K1BlZStYYUVKMVlTMDl1QTF3?=
 =?utf-8?B?cmhnL0YwSEZIYXhIMW84WmlRUFdUVlNrVXBPQUh1SjlIYWNVV3BoQWhSaDEy?=
 =?utf-8?B?bGJibEpWSCtYRUsxV0hSSk9QbDVZdXloMHdKcXRDSU12d2ZzblpEVHVac0dM?=
 =?utf-8?B?RWFpRVZtWi9WYm5WdGlhUGx0dkRSTjR1b0JVOWMzNEhZbUwxSFBoKzdvQWJZ?=
 =?utf-8?B?THQ0S2ZUTTlEcEF4a2JzK3hsRDBtZ29GOW5uYXNqeEg0VDRnbWU0aklIL0Rj?=
 =?utf-8?B?ZVVCTGowclRJcXdrQ29QYmhoRk1vVkxsUjl6TWtQSlRWNXA4L1B0VGZuZTR0?=
 =?utf-8?B?UDQ0WFVUOHRuZ2FVb1VLL2VNSXV1c2VlMzFXQlg1WXB3YVJ6V2pOcEdBZTlp?=
 =?utf-8?B?bS9vTytEK2lJQmxpYVJwbjlIdk4zT3dybUtJZnR1ZUFEYStsVzlYQVkvb1Ry?=
 =?utf-8?B?M1ZVOUZZOU9leEZyNTFJRUJxRG1kZnMwOGVGU2RzQjhHY1h0d1N0ZzhzTzRo?=
 =?utf-8?B?UnF1MzZ6NmRZaUdoQ0VoTnE2T1hDSWpVdVlrTU9TaE0xMnJyaE84Ykx3VEFr?=
 =?utf-8?B?R3RNdGk3MkJjSlpGdFduRHhEeENQOHEyVWVSSHVRS3diV0Qzd0xCNGZGZ3Zu?=
 =?utf-8?B?UGVMZDdHYWdheWZDRWZjdWNpeGJyYjFqemdIOUpndyt2d01HOVJ1SlcwU1Z1?=
 =?utf-8?B?T3ZYR0JLUzFmakFxc1VXQkp2Q2pudjZ5eTZvenlmVGgxOElMNVN0Z1Q3MnBL?=
 =?utf-8?B?SUdtUkdOZGc3R2FnN3RZc1FLSEExb05JUVc4aGYwdEMrVnoyYkV4YnZkMUNZ?=
 =?utf-8?B?RUlhMGF5Q1c3a3FqOUxZZEpaaURUallpY3VjQmJDaU1sZER3VFB6bXdQSWlQ?=
 =?utf-8?B?bFpKZ1JYYkZhbVE2Z1FyNm1ka251R1JHYkVCSkI0WnY5V0lnTGFqQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3a28c0-1dd1-4d92-2e4a-08df3e6af172
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 14:08:35.5623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9Br++JvBbWcTH10eaKMQGPvkhryyU6WnCTCslBeQXDrnfQph4uxhD5Q4LbALTO+turJATnl9mDTMIwIIkny9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LODP265MB340279

On Sun Nov 8, 2026 at 11:47 PM GMT, Wang Yugui wrote:
> Hi,
>
> When I build kernel 6.18.60 and 1.68.62(maybe more versions),  a build er=
ror
> happended.
>
> ld: __patchable_function_entries has both ordered [`__patchable_function_=
entries'
> in rust/core.o] and unordered [`__patchable_function_entries' in
> io_uring/fdinfo.o] sections
>
> # rustc -V
> rustc 1.92.0 (ded5c06cf 2025-12-08) (Red Hat 1.92.0-1.module+el8.10.0+401=
91+971f4d77)
> # bindgen -V
> bindgen 0.72.1
> # gcc --version
> gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-30)
>
> But kernel 7.4.0-rc1 is built well on this server.
>
> any advice please.

LLVM emits SHF_LINK_ORDER for patchable function entry section:
https://github.com/llvm/llvm-project/blob/main/llvm/lib/CodeGen/AsmPrinter/=
AsmPrinter.cpp#L5232-L5252

You can try building the full kernel with LLVM toolchain (LLVM=3D1) or upda=
te the
binutils to 2.36.

Best,
Gary
