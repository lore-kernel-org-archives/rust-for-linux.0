Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020081.outbound.protection.outlook.com [52.101.196.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497A128D830;
	Fri, 27 Feb 2026 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195056; cv=fail; b=nBh/i+hELZar11aLgOJVFauJjf8QTGPsHjXrneaiI7GGXAWYtCxVpUI8xLleRiJkRJ+rBuc8ZBneF64hZ7uQtNFw1dwx8BwKU1yDZSihtEv4Q9FNlTUXdzW4b1nKjdZyCJq8Hck+fpkf8ntpz1Ge/EP+FHg2089f5Tw8sMooJUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195056; c=relaxed/simple;
	bh=LBxA33luQjeE0SvVR6YYAdZl5268dfaEiz5lPyOCwWU=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=NzdsWVKO0P1YCF05o/XLe3rxty4K4KoYymEbi3ww1932b/LOUQSYQkDSwcTLPMCs4+HDu8AQJkMl4PGGvwb1djCTbZEePFUZWHGlaN8+bVNxqMol5YWAsxPIjfTon7/+BDhyJlMVY4lsQS9ZCqmT7sebvvV6/u4u0QlFCB7Ktjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NI/xCwED; arc=fail smtp.client-ip=52.101.196.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NI/xCwED"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHWQ/ppGaZH6ljwMo9b4wvyncIBKWR3Jg8s4vyjPJM1oRVw1JGbpR/rZFCVokJoYVLNj0oYlshACKrCZx2No3I5DehqM4VKDLmR9tg+WOedHTBDsVZqJYV164M/GDtj57p4bdyhmjr1GD6ZRIl4IN5ocxfjZVWZeJgc1vPyy8zUlrTpnuiR0PrYyeouzWoKrO5OpuiNaNXzTJcHWiUqGjsZw+aEHZ5GaK/UxNPsEKXFnbMn3M8Dy5MxCjdiLkzPSNjgpoI4bmAXLEbjbSeCamaQJW8MK/gORcxff8TKFHDe7qb7+jL6JbN3BuQn3wN2bwBCWcpRR3WJQJBWQcjJFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0d9kesBISVTbZmvM1oF6ltxye0CAXv9QH1TcB/pelY=;
 b=NBHJh/vufIW4So27Ex+x93umVV1yge3FI5GHpMmgRDZiJQ70Djo9amac1JjUgSpmoSnHa6Tb6NmSxm//+Fv/0G2lii7tIUi17sb/CNTJRUZmwmOjlvYSh6sVKCW23NmkXHpbfbT3SB8xbYaiReZU3m/g57sr8125GzvoX6NjVNKzloyEU8f5PT2Tl56/wHu/VSczVe3Y9+jZZxGoyrpZo7zjjPq76no0DcmSIswJcOmebaeFedNyswqEbAgtATmEsES+hjgJYu+xsQYFjjDAXRmuFMo4j/h7p9r0/9hXCP6d7IrnpCF5LnhShHjN0FsQzTBBwTg30KfXn+z7J6D2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0d9kesBISVTbZmvM1oF6ltxye0CAXv9QH1TcB/pelY=;
 b=NI/xCwEDRe603maWEx51AzfJjDFsuydpfoo0+N3x9uLCr0SXRJEDdpwLTpBjXapIBnir3Pk6iY1qN1P9cwt+LSjucrmd7vn4vKHDJxm1ijnUvlYkG2aXxJdAUBdcwoTKTexn68qbmUO2uE/UYkTUFTfHmYeI749K82bL8DN3Ytg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1880.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:42::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 12:24:11 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 12:24:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 12:24:07 +0000
Message-Id: <DGPQPPOEVDZN.21JXCJC96SVJM@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Carlos Llamas" <cmllamas@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] rust: task: implement == operator for Task
X-Mailer: aerc 0.21.0
References: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
 <20260227-close-fd-check-current-v2-2-b3347edbb310@google.com>
In-Reply-To: <20260227-close-fd-check-current-v2-2-b3347edbb310@google.com>
X-ClientProxiedBy: LO4P123CA0610.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB1880:EE_
X-MS-Office365-Filtering-Correlation-Id: c3dd075d-fc0c-4915-9d6c-08de75fb1d09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	vu5W822S81Z5ipym+nba1baoNWcZUVHPrQyCbZmUFFM2y969I8LtPUZ2/vrcStr34jiOJgLg7atSZpPpQDKZLGB89OdmSQHQqJ/bj84gNHRG7f4PXCtm/xFtjJl3uHn7lykr6T1RCwBwrT35FCYYEnsVx77Rbfht+5v9ZVtTgNEymAPymcIyGnHuWAC5s2dwR9UlaPUNJPvIwXEb8Yr4DHChEvFF7ugIDKqson97j/7QPNyeRXm4Pg/p3BtHyGyGeZJaPsgCG/UxASZbuqVvn+/d0rolpcCEybpOxGSBy2/BW/yvMcrz2iksQbpyH6S8TfqBqpjTAFWKuUol2IQgYsGvRlvU6j7xUdWPfq6jlU9SjcdniSBpg1HbtjvAHVER5vXopK9VgGWKzm442uE2mwMVP9NjQPaaDnGVwj1GBycWKPJDrKUzpm5BByMChQCs0ww8tvSmGLfexDJ8NIONRA6nrleWluZFSRg4kxBuosEsBFTGRMCC4Ocs/KWztYE/ZdJqA62N370RprkglQkuObIFShEmxPi2ei/prysnKCz+x5YzLFm2B3MSgCgnxUBD9Aba+VFy+msP1HWb6x6nYiQ2ZTmqwGDJ8wC2z3f/0cq4aCavdKAQLipTvkEywrfzMDeHlhiIPKl3u2qr/qUGxD9V7SuKN8hkS7wcAVT4/kQjmy0ipVMAOjf5T3kDnsnp3VUaP09MNUNv3wBmzkqdkPaGDNVBWJ0xlLa16qhcwjUdGKjLVIqQCkaOTxk+Y4j9MiqhLe56ZrqG4m28Ba3jFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjV3REFxOE9JZUU1U0NGMVEyeHA5aFpEbCtLWDJ6dG1USXR3VXQ5UTRsbWh2?=
 =?utf-8?B?ZHFwZFVtcGdQNmFQNCtOaDJWMjNkTlhKTFpDK3dPd1hYTERoMHl1MGtjbUY3?=
 =?utf-8?B?ekJZb3lQbnFaSDYveUt3bUJtREJseEZQWVU2QWZEb05GLzFDVDVDRGZKcmZs?=
 =?utf-8?B?TUhnbnMwYldiNWV6bk1sNlJSU0VZRzd2SHJlWVFIMFRkeXc4bVNkalJ4clNG?=
 =?utf-8?B?anYrcE9ZZUtORm5wMHlmSUh2Q08rVWNJT3ZGWVBGbUVNbDBoNjZuNklGdCtX?=
 =?utf-8?B?cVZNdFpYSUl0dmtYSFhUSjNaYTk3YlBMdDJXTy9LVXlaWndKTlJzL2w4ZTRP?=
 =?utf-8?B?YjREd0w5c0ZZUHBkZWdvN3V6WDg5cHlnTDJNT1cwQmIzVk5BeDBOZnBQT244?=
 =?utf-8?B?S01aZk5xNXZPdXpRamxscm1DbjQ2U3BUNU1LSnZCTS9uSk4vcXFNanZCVlp2?=
 =?utf-8?B?dndHYjRFR1h1ZGJnODZPWStTaXRUVlpMejkzMk1ZcnVHTkMvODFmV1Y0NVNR?=
 =?utf-8?B?L3BUd3JPN3IyazdjR1dRUEF4ZEFkN1JaU1dZb2VHNHZMVjIybXJYdXczdmZT?=
 =?utf-8?B?c3dJamRyY0VSWHJSQU94UUZSWUVFVHlhUXNaQXZ1WnpxWG5taU1OMTZGTytT?=
 =?utf-8?B?YmNPUHA3Q290VjdMMnZBU256dkdlRGJXdnZ6RVNQeVQ5S2dsbVMrbDNQbnp6?=
 =?utf-8?B?Vm55MkJrSEsrNWV1VjhDYVA4dzhzdG5mK2ZJMVRPS2FEVnBvcmphbnEzd0xK?=
 =?utf-8?B?Q0RRRy9GT2l0NlAzQjF6bjlVQzNNVitQTzVlUFFmajFXRm40ZlNTZnpHQVJv?=
 =?utf-8?B?c1Y0bGxVa0R5T2xiNkZGLzNDMlYzdDJ3UjVzM3pYNGlsd1owbGVockpsSkM5?=
 =?utf-8?B?WW1ET1RJZVZJMjBTVVJMbnJFbHJwRjVPUGFRaklHZnRJMkJDTlV6QnpoZ2J4?=
 =?utf-8?B?U3h2MFJQZ0ZSYXM1aXN0MDFxc2c3V3l1cXFmb2JNS1V5U3dtVWkySGlEa0tJ?=
 =?utf-8?B?ekljZ2pYTi9rSUx5VlhwblE0dlh5V2p4V1R3R0NEVTBmMWpOeVlOakp3T0F4?=
 =?utf-8?B?aXpGTitST1UxV3Y4VUoyMEdFTEYwYUFtOHVhdCtuK0RZNkRjcVNqOG1acjJ5?=
 =?utf-8?B?SDd5bW1LTFhEZ3Q0T244RCtzVENDU0dtanBnSllHOXBCK29iTjhYQ0pNYlk3?=
 =?utf-8?B?V0lseWFhT3NQWTh1d0tmYk4yNlJzSlJLUUwvTGJuOEczQWtBc1RlVDFndWtj?=
 =?utf-8?B?LzN4TUhQckJtRzcrL2FBUnIxUG5pa2N5SGJQQVVkY3NxaVJjTVpuYVJ3NVd3?=
 =?utf-8?B?MUR5VG1YUDIzTEtiM0lNZTE2QnloWkIxRkpicXM1Rjd0ZTVoUXhmcWVOWEN0?=
 =?utf-8?B?cW9ubTkzRldpSTZuRmFCaE5ZK044OGR1SmpXamNCeHV6NzF4bmo1Q1NvdW1Z?=
 =?utf-8?B?ZUZYcnpxKy9STno2WkhlaW4zRGNENzEwZFhPNGRSSGZZMDlBUzlWYXFKRmRG?=
 =?utf-8?B?b0dMZ2k2cTJxNEtyM1A4VldqMEJRSDlkc2N0a2VVRldjQ0NxUWo5WCtRU0Yy?=
 =?utf-8?B?UFNvUUNLTFJveFRidTVuTG9MS05tSFRNNGpTSDdNVkVGUHBnTGJKR1ltbTh5?=
 =?utf-8?B?RkFBYjFZSittUld3TmFubGl1UE9CY2Y2MTFGRkhEZEpManpQeHIzaFVqQkxB?=
 =?utf-8?B?YkZOa01wVDJSYThCcWNOT0hHbDlQTi9hU1RVOENTNllxSEVKRERjblp6OXMw?=
 =?utf-8?B?MUlkS3BaeG9kTXI1MlgrcitRWDYvNDM4dkRFdkduc0c2djJXTlV2TW03SVV5?=
 =?utf-8?B?MmlYZ2xnZDA1Vm0zSG9oVmtTM3Y3NGpaakdCQTRxV2VYRGQ5a0VOWm95bHls?=
 =?utf-8?B?V0dpZjAyU1E1Tmw3dHdoODlwV3BYeXVQQnZiRUs5czA5V1hLaTNCVCt3d3lB?=
 =?utf-8?B?WVdtQnhWWHYydUFLRERvQnlnZTJNZGNnRENqN1laZitQeUc3SWgxVDFyUE9P?=
 =?utf-8?B?L3lDaTFNMHZDdFluSGVvcUFlQWpCczNubHFueEZqTWgrQk92Vy9MMEwzMGpj?=
 =?utf-8?B?ZDZlWExiSGxWa0Vzcms3K050Q3FUVHhEd1dNUUNWWkhuYUtlYTB3Uk56ZEVL?=
 =?utf-8?B?R1RaUWdUcytyeHgwNmNuZlFQcHc0cU1ZeWFITzhpUWhhdzFtaG5TWG1uNUEz?=
 =?utf-8?B?N0ZTVjZmM0s5UEhVam9RSW5sd3RFeEpKSjA4UkJTUDN6L0lMeFFjeDFBVlBO?=
 =?utf-8?B?d3VndVc4R1ArQ0E5V3hVRnV2NDFXcXl3bWkvbFB0dTZXMEZZcmlEN1VXTnk3?=
 =?utf-8?B?bnpEeG1LdmZacklXRjJKQkV6N0h5TjNPRzVtTFd3NEx1ODRPWWxYZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dd075d-fc0c-4915-9d6c-08de75fb1d09
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:24:11.8353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMcnq5X+b3lPRdTxzhQqZQpHMEg3ztyAqco2KqR9ahlngJhRz6XfhXgzmKzZqEmgaB+QJOCY3Sno4aTMwqIaYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1880

On Fri Feb 27, 2026 at 9:34 AM GMT, Alice Ryhl wrote:
> It's useful to compare if two tasks are the same task or not. Rust
> Binder wants this to check if a certain task is equal to the group
> leader of current.
>=20
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/task.rs | 9 +++++++++
>  1 file changed, 9 insertions(+)

