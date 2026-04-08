Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021139.outbound.protection.outlook.com [52.101.100.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420D146D53;
	Wed,  8 Apr 2026 11:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775647898; cv=fail; b=SAx2RFaNKKtdZRcovoN3ezGrJoz3XWfYJycNihXGwRVWLuBdgHRA/kcVZZgfeVPZ3AVqzxviBA5CgWUQHs/SpI2K9Jh+dWBa9C/rNC7WgtaVe2UxEzNoAgID6Dt//UprptNe6iporejeS7r8PLt/FVvleStqcmQzn+2tG8yp0iM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775647898; c=relaxed/simple;
	bh=2hapH1yAMb6ByJSOjPbT4QEJTJy1TRkNHq3PC34MMXU=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=R7iEmg2B3aKL22dbTzxfjJXnQUtFn9gaYM2CCNKdOdEklYfXC+7olKIxQZhiGDl4Qe6Z1/KOwEENZv8rh9BDeDUZeVm+PsQ1VnSxm/LROA7Lip3Yc2AygU9750ZLeEvid+p9lHfz2yD3WSiwRTplus896HcRN0JzrYBGYeJuyIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xCYjByia; arc=fail smtp.client-ip=52.101.100.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xCYjByia"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXex3U/oy2OJS6j75nu7QYcigj78Uloegr06PD2eeXssFe8XCEXEFJyy1B4yXDJ7J2ScJ5QVfAAk4WMOhMehqAdq9sMX4eAW10bffV7oeB8oHL/sa0aZF4qp8VljawQXP8828jDgdz3lzs5BaNzSbnhEoEZ22+OC7Ef+Gu3jDHPPVnW/Dvg8repKc22Jlms4zTk83wrfdIhyQqvZou510vwjDGD0JuM73bzHbMTqSOyoeV+oDEqC22rcuDM8Mh0wsy9hIJmGKQlgRNbdNhQGU4ybBGtZ3jJw0ufrEvkikRE4M1im1HjhKqQKZr1lJVL9yf80L7N8tmiDKdGzW0IU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNLJIZ1B0qz53BXACf4wenI7VaVL51/srHaIsxGwSX8=;
 b=B7zErmnHUDp3GMOgKOW51coAhh0QUFMw+iflFgZUKabTrtVeeHPdkyi0hFbJ5r85eptSIsfrsvNcqlqIR4Scbozmup4MuyperVKngWha3Y49pCzer5sc+b7AojVmkAvmE/K3UdsyC0nRMxRRwVSpS5xuO684edOuKZ/CEbrN0SeBEvimhqtr8/cb9Jk2jZMlLxe+r2zFEK+IRFIEyJAbqv8g5f3QuyTErGL6dexWCXGKkUxy3GIevPMXt/RyyND3TFVnLaac9PRyNWkBbkUtPyOJQgtvgdSkrtNQLQHyxbrauIS5yR22X4pbEQ27zpu1Zbkm/D2v5i0OtMgRX++4Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNLJIZ1B0qz53BXACf4wenI7VaVL51/srHaIsxGwSX8=;
 b=xCYjByiaGxvKCz/JDnDfVTdzYAWX/B6DJ8/KhWo66JeJCGwx4AuH5mfLL24JdwK1urw6NhHh8o4AyRHRaBHyyi3gy26pO9MFnNxSKRthjMb8nFZE8559yD2ANTWVbx3WaTvuCbdOSNbhe6/P8aXMRbXu1ucwOx0s1reBJeth9qQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB9175.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:498::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 11:31:33 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 11:31:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 12:31:32 +0100
Message-Id: <DHNQN8UBPL47.MF7V44YM7M1O@garyguo.net>
To: "Ben Guo" <ben.guo@openatom.club>, "Alex Shi" <alexs@kernel.org>,
 "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang Mu" <dzm91@hust.edu.cn>,
 "Jonathan Corbet" <corbet@lwn.net>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/4] docs/zh_CN: update rust/arch-support.rst
 translation
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <cover.1775619061.git.ben.guo@openatom.club>
 <0e367d0dc8d74287dee1605a48ea80159fa464cb.1775619061.git.ben.guo@openatom.club>
In-Reply-To: <0e367d0dc8d74287dee1605a48ea80159fa464cb.1775619061.git.ben.guo@openatom.club>
X-ClientProxiedBy: LO3P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: f36f3b2e-ab2b-466e-92a2-08de95626303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Tpi9RilkPaBzZ6zq4BWMCEziEozrUQtpLjZKBWIjCGk6koV0gkyMGed5Sz47euVsisWm+7sRuRSQ6fv7FDbvoiyEhdXIDfb2IyOZWZlfmuzdl4T3Iy0CJiLl2Rz7wRl4i2TryFquXT9utw5a7UCw7GTPJgnBabXF7fXc4T1FIUJkEUO1Xr5GuET8cKtpB0W8rZB4FtDYFdQ/ShzI1teHoG1Zh5vkFNeFFSGOX71ANepd14SPCMwAx5Dhw9bfTy6sQHng4g9U0NOplbcmyenV2BMque9TjDL9bO70r1XI3h8nZJcY7S4vOkIqt10+z++NLVnz8ZXhfS3NzwbWYt3qjqndoG+38iZW5sPA37DCM+qB3NlMLVWRr5j18rb1ePimYfwymOz2x/uxcBTYjtJglNEkSRpzssVmDPrZisLcSBT4V8KPGatwOHJLucS36Pk3HF91TpF0OGQwDKhrgZeewyzx1NcQudVsIeFrl+vINLde5WvWX48wJsi82IVmkRY4R5GN31YSflf2Iaky16mOdfrch+pHQpBOSZjdPoUKXgEmxCzDeNylGXzCbZ0F2Ihbx3dvSa2+E7awdj0L+eWdBD+mD60f1CT+st48kF3CwKIeZgwJckIzTehYG33HruGwq6qSI7HMdBwsF2OkJQSAQsV71RTL9I2vT5JNXTR2quilA0mDjKA9w54jyARHik3+l+/rikgO9AncK7v6eIPWxQ4PFik4QBO6NkHjkA+xhvY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFdQRjV6MXNEdzhhSUF0MFZWV3UyT2tKRW5sT2JOelVRZTZ4cVo5ejRQTHhK?=
 =?utf-8?B?WkM4aVhsMGRjdFM3aHVzdEdNKzhwK29wMXo4NWo4SW1YclVobWFhTVRqa2hB?=
 =?utf-8?B?VWVyQzkvWlNsYXBBbTc4dXMxNVpEVmxGZWtIdFBKYUh3VGx3UTBqb1pvZXBq?=
 =?utf-8?B?cFVhRXNRODdsUmhnMEF6cTVVYjcyZWVsQ3NaMnNyaHRyRWhGTDFuZXRrRGt5?=
 =?utf-8?B?Y0VhRU9Gc084aDNEbUNGNitGcFVjNEprODdsTHZWSFBGbm9tNGo3VFJPVGdR?=
 =?utf-8?B?TFAxelpxbk90N2ZobUhJVWJBNXBlSEVUYzhWajFlSGF6YkJFOGRPMkw0UWpN?=
 =?utf-8?B?RDJtTjl3eDQ2cFg1ampjaGpHbHFvN3JzeXliUEpiSXFjcy9ZU2o5MTkvWE1s?=
 =?utf-8?B?bnUxaTUyNXg3S3VzRlM2WHZveThxNjZuS2UvclJOdnJMTGtmYXExdE52RTRr?=
 =?utf-8?B?b2s1T295T0c0cWlRVXhwSGtzbTN1clVvcEd2dGE0Wlp2VGZHRDg5aHBTUlQr?=
 =?utf-8?B?VWQzMFZDM2NlV0pNNFVEL1IzMmJ0eXNKd0dIZ1o1d29wYkZWcHN3eWhJeVcv?=
 =?utf-8?B?MGF0V294aXNWaHJPbTJETlY4c0R5UkVDSVBoSFV5dmtwUVpvUWhtQ01hM3o5?=
 =?utf-8?B?SCtLUml1Y0gzSnF4Y0FoNzRtMm9TU2htd1pHSUVPN0VrSjdDdUhudkNONnpw?=
 =?utf-8?B?OVgvQXFqL2VYNlJQdnBzV014NlhVVUFvNnFNRStTbUtRcHB5QUd2Smk4eEJI?=
 =?utf-8?B?eEQ2Sldvd2FES0JjUW90NVhkQzdIbUUvT3pZUDFkT0tpenppS255cXBVUEtP?=
 =?utf-8?B?Y00vWlVLOEhhQkQ3b29vUGdOeGRLZ0NtVyt1SkN1aG1TdUdPSlVoRFJFV1hy?=
 =?utf-8?B?MU54UHhwRklyaEZ1WDZIeWViTkNCaktXU1dDaXJ6SFhJTHpJa0t5Wm1uY1V6?=
 =?utf-8?B?WXVHcnVaajUrYWNRK0lubGFBZWJNWktCdDR1YnhoMFRQVExtbXhWNjRoclp6?=
 =?utf-8?B?ZGR1cUNJcVpxcDB3U3BwSjdTVC8wVk5BbUUwRC9ZZ3hxeWxlbjMzeTliNWR5?=
 =?utf-8?B?dnM1VEc0MURDY0FHRjFpU1hoaEx5MWJ3YzczMXc5VzVWcDlUdGpWdTdJWFlj?=
 =?utf-8?B?ekdNVTdYUlBuanF4ZWdEUjNQdjFZSTE1eGdUSGRVTlFreEFJb1BtTWJ5aGhr?=
 =?utf-8?B?cnBsUlk1TnpqVGhxNTJtaTQ0OEVodEQydGNiM2xqMTlqUUJjdFJobW9pTGhH?=
 =?utf-8?B?dkFsNEk0Y2Q4V0RaSXAyK1hoZ1ZSYnlQUm9XbUJ4OFJiUE9BS0F1OGZTeDlD?=
 =?utf-8?B?NjNmVFRXOGdQbm04R2xoL3FmQndIZmVURXhtelUzY05iYWZqbVpqQ1hRRWI4?=
 =?utf-8?B?S0syMWgvbEtWNTQ0WW9nWlBRM3dPYzU5Z1pRTXZIaDZQaDZXNk1zV01URlZt?=
 =?utf-8?B?d2xnSnBxZUdockxrWDh5UGZySHZNaXAyS2dydStLc3ZYMWUwWUs0cC8rTmJI?=
 =?utf-8?B?WGZsVlY5ZElxZDdIVDNuNmRnOGZOSGUzNzFWc0tZKzRYYVpjUE9iVE93NE1C?=
 =?utf-8?B?UjcraEFvV051Qk93TnRiRU5qVFpGd0ZTYmRueXIxa2xvTyt3Q0ZEclFhdHcx?=
 =?utf-8?B?OVlvY3VEMVVPTHFtOHdpcEFoS09SNzlCNVo3OFcxK21RS3pFTHlOczdTT1lT?=
 =?utf-8?B?cXJib1ZXZVlYc1ErZURiQlcwUzNrTEhrbmNZU1ZVYWZLdlNmYWhHbE9SWHdx?=
 =?utf-8?B?alM4U0VCTS9nUjJoUVgxcVVwSkVtQVVKWWdlNThFRzhkNGFOQmp2eVZ4WmlQ?=
 =?utf-8?B?aDJLR204aTFxNmd6emNlTHRudlBJdTByWlNBNm9hVU5JbUl0SU1GWUZPaVk1?=
 =?utf-8?B?TklVa3Q3aUNhUDd6bm43TFFlb3pkQWI5SlBvNmY4d3d0NjFPQ3FNbXdBandE?=
 =?utf-8?B?UDFIYkNGK1ozOUs1bjRuN2dRZEcxMjBzQktaZUNWelVmMXhON04rNUVDU20r?=
 =?utf-8?B?SHVydFl4TXJnVGYwcHJtSUxMcXk3azQrQmFlOTBUWjliamRKSUl5alJsZkUw?=
 =?utf-8?B?RFc5WVk0QXd3TVlDVjZKNDJLOEJWVWMzeGpvRDl2Zk5aV2FvRnFwUE1sOFQ2?=
 =?utf-8?B?cE1YbVg4amhvVjNOWDA2L1FWRHR3eUZLUk9sTXdzdDBLYWloNExKUEVDTzRo?=
 =?utf-8?B?VlNJd1RQUk9pekJwdGNXN3VzZCtVaGhhc3Bkamg3NDlBZ25VK2kyYmxkR0t4?=
 =?utf-8?B?TjVkL1llTnZGNi9XL3FnbUJLQ1RmaEZZbFZkZGtZZVVrS2x3cS92YS9yenRZ?=
 =?utf-8?B?SDdYMXVOY3RudXU3UUEwTWhqMGd1b2N5cW1ETHArSmQyVVRsRUFOUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f36f3b2e-ab2b-466e-92a2-08de95626303
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 11:31:33.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2C8XWxytdZFk+al4EIXot3pZF/Yus/x/71ewFF/jTP1P2c/qcAIkcn1WNzNE3bWs6F9MJH4//dyH9HtamFCgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9175

On Wed Apr 8, 2026 at 6:05 AM BST, Ben Guo wrote:
> Update the translation of .../rust/arch-support.rst into Chinese.
>=20
> Update the translation through commit ccb8ce526807
> ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
>=20
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Ben Guo <ben.guo@openatom.club>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  Documentation/translations/zh_CN/rust/arch-support.rst | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

