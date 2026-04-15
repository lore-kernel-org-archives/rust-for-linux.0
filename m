Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021099.outbound.protection.outlook.com [52.101.100.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE214279355
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 13:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260752; cv=fail; b=hdM8BV8cnWRxouVzwBFhHOwmo75dEekq13FRKC8bSWtr1+PkdoNMPakzBS+KNwdpiPthOhyXmCFpBedlUVtyC3sWsqJkOTbyv5861uabWSolG4VA+ce3/LKiUVFXk2XtLjHMzwY2IVWbpwHBAy9mY1oa19ioqpLigrTVNaQDoVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260752; c=relaxed/simple;
	bh=HvPz7K6oDyuHa7GcKvPx/0hMEBeMgXqU8cCtEhzuwtY=;
	h=Content-Type:Date:Message-Id:To:Subject:From:References:
	 In-Reply-To:MIME-Version; b=nd7bEjzizojfpm2n9HbnLMTTA5BNfNpq6DjwYQm/hXCmq74LC3AQ1NwczujS1l1PfTz8hLdC/Z7/wkpfX30GOscKZrL4MJy21kwTSY13qtBzyujcVm+gpVkkFV5A8Y0ewOs8IXB1LLRZ5whxgEDFATX25CatU8ADFZbLZKymod8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xjAAgpN3; arc=fail smtp.client-ip=52.101.100.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xjAAgpN3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHSp2dmpJHvtqZImoR5w7Vst3ZLeZ7SuiubsLtWmDuTpNlm491NjhmSGu5fX0k9qnsoM7zLIr9dOoWLprvzsp7PZmSsK+8+OlmSV6gnu4f6VdhRf/HLfovIn+T9W/xxzZXyIW9cuzjWFqSCS+D8gi3YznhV6bPVoq58rRv4gjvdhwG5U8WAFxT0ULqTtHiqWSjHrSkvT94ezq5Ek8GcDMY5EPLTsGnx1b9J6JsZUCoNloFv+37w6XQPhxBdxTRSdVv3J9HcYFkeqGC7/Ke7rRfXDExAJbrcRIIdnEXNXAbMY40fxBTw/c1zsNaY69jBPMEh/mu9SARkhKyAxbZqOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XonOgBoknvBvT/cY/zvKA+8WPYMhX3tDP5DY4Fxeahk=;
 b=fkK+z9P2+Je1SpKQv1I3N2rUGPgaKGRIL/RRKnxxPLOSvy/L+RH38NjdT4n+wESGwnW4KlvoGSTZbphy9jSjdIPitIf+CU/fY7hb5g5j+3nn3dhuelvHaheOjSHUUne9Vt4JUBtXTBSeETBsnBNbHmZ6IfiTZ91GFvvo6D/dw4JH+dvyYqOPLSg6ujRX5yb2U/6zUloqXPBxzdePip1tAJvaEGLEoZwVuhcIdvMpqf3os6dLc8xkQRWYDwEf104BTb/GqfjdgwwaS/LELjAtKFl7GSt8UYuP0mla6HNhQnQkM0DA77fAF6FGUlku02auLQL9K+u6C0H2NTp9Tddd9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XonOgBoknvBvT/cY/zvKA+8WPYMhX3tDP5DY4Fxeahk=;
 b=xjAAgpN3cQQnN49TFoDvSISuWg3xk0nFDXqM5KBCkNregCJZTK3NMQi6BR/39X27RPcR/J1cFahwjQX6VbdtZgod6NKaq0nXedaRb1zhxDDlm11H+cl5LmTjzbL8zdV2F+gCVuX8bESU57SgdVQ+BIRDWleWVZtZyzx6wfggfZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB5965.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 13:45:45 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 13:45:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 14:45:44 +0100
Message-Id: <DHTRVSYVZKQ4.O3G9J0M423B4@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] gpu: nova-core: use correct fwsignature for
 GA100
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-2-ttabi@nvidia.com>
In-Reply-To: <20260414235047.439322-2-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P123CA0225.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9fbf25-a405-48ce-d850-08de9af54b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WkfDd32A3rGuzPUP9sTAJmWvYv3+irtysX99h/aP2X1QOAMKx/Z72khblf7FHsfsxRLi0zHrznKjPKxdyJoEinuin+AoWiFMXRhnM0drk/+M5/heBvsf2CSNH8DxxosA2RkjW1aqQUt02geP8buJe2NL3rVILe/beIssuOme1OfGmccsvyBxyjvgbTj5UMzY+LejiysDzzwTyZZpN6464p6kjETEaEb8Q9N6/5NjaddvNezOk9a23bpcwjC4BYgIabllS94ZfcV1SoXtNcKGWnJrNwqoi60YBa0Drq0UcDlo34pgaRSVhb1+bN5krGgMTXBGKY9Am1jInbgfLi2cNJzJAFXg31LQTeAxb44xrJh0FwVUA9gZpk9efuAzM3DxRoIwIpQBGINqXYwD1GtWi2J+JMyOSXBha9e54iI63x6pYCE4vYmQ5ISF/X90w1xlJoXmeFWwvufaeC1HAPmRkupscdkr+B3IzqvtEsAesXo6CG0vTIP8zHeLw5P7dlOtEVPa8JGJptVSsMiZG9GNRbCc+I/mbAngS+49qYkI8DHnxVKw6JG3FmkZ6AxfOZZ1LqXn/mtdxh4U1hNouz/4MYXGzL5iKtjU3/F5cMsPyCmYJlLwzHLQWZMSrvmxR63Mj5bAcgI2CND9IN9L3uqHJ00Qauu8NzRZqN5Dur4LlFriEX9Awl9VqEPfOz+9aqPf/VdVIuj8sChf2R+BmEi2IEL/naTmpnUPIjfaK3pMAPs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzRIdkdxd1QxUjFwcVZhU00zQ3R1eHVZMTh4bHJWRG5WblNCK2U0YVZMSC84?=
 =?utf-8?B?WmpLcVdkUWprUTZRTDhwVi9qd0VjdTA0VWxQRVljWjNvdGJRcWlUUytXWmJ5?=
 =?utf-8?B?TWpBUkI5d0VCeHIzVTFNbmtaeUZhWDdaUFpSWFF6WDRDZDJEdyt6Y2YwZFNr?=
 =?utf-8?B?R3NsenFyOTNCdVVIalRIRDR1eFhYV0xubTZkZVJMdXRYTjBBTjlMQnRyb3do?=
 =?utf-8?B?Q3NIT1ZQakZnMEdLMHpBUlBteXZxYTR4M2Joa2k5dTR4LzljY3h3eHM1NzdC?=
 =?utf-8?B?VE1KalpEdVdFRjVTUE40N3FOY1NOa3cwbnA2a1NYSlRxL0p1NlUvRTY5MmxR?=
 =?utf-8?B?aHkxR1EzMzRueFNLQVBFVng0SUhDME53cFRLMmlmK3hCdmxORUlPaU9ESksy?=
 =?utf-8?B?c3JzOVkvZDNnWlh6OWFFSHlMSkFoWVJCTEhLWTJVbHRLOFM2dDQyc1d5d2p0?=
 =?utf-8?B?Y3pOdW5XRHJjWW1KQnlXZ3FIK1RsbzZHb3RXZ0pJakE2b1drYnlveWZLT25Q?=
 =?utf-8?B?a09FMk9iaUtCS1hMUkJJVlN4dlZDdTJBbzBoOVVzTE10YU5LeFd2RXBYMHFT?=
 =?utf-8?B?QmdUTVNwT0hFMXdNUlRiYnZlaDJSdW1VYWFOUzUvQ1hMTUlBNklUaTNoNVk3?=
 =?utf-8?B?c3lub00yTTllazRQanBIVCtEMHJCV1dYMDB5bXl6UjZaRjR2T1dpVzJydnk0?=
 =?utf-8?B?akhObm5rdWxyVndhK0tKZ3dpUGhqOXlWQVc4OWYwUUNvWlZmc2gwaDZPbTlR?=
 =?utf-8?B?TVpQS2hFYVFMWHBicG80ZEYwUS9INDZMOEYyWTFnQkxFR0NjblZ1SFpSTXVw?=
 =?utf-8?B?WXozSWJBWWJMWGtDVE12V0FWU3FNOS9kYVdXVEZ3dUxkdGROL2l5d09PT3BF?=
 =?utf-8?B?VzVKRHVPdFEwY01FU2c5UG9LOGlSdG9MM3ZTS0dSYktDdFBEOXZoNEZPRXhw?=
 =?utf-8?B?SnpwUFpvN2daZ3FmbGNXbkYxU1grT1kxVWVndkNKZEE0eUJyOUhmWnZqaGtY?=
 =?utf-8?B?OS9pN1pvQ3ovQ1BvcEYrRWRBZG5paGVZaHVra0V0cTNBbjZCU0xxaXBZTUNn?=
 =?utf-8?B?aHdkVmV1WlhKQUh1ME1tdFR4NE1zZEpJUW1GTzRVTlRhbnRLa1N3TFlCcTVr?=
 =?utf-8?B?dFVtemQ3bUthdmtsWkZXcjJjS1Flek9WMG5IMUt5aVo4US9ncnlBNkVuTWNT?=
 =?utf-8?B?MVJCQm1Ecy9VMkhram1UTjFJOTN5bXNVVUpQa2liVlV4UEhnc2lsVWFhRzFo?=
 =?utf-8?B?ZFhjVzhlZ0FCYUJkbmFJUGdsUkR5UUZjVE1ZNVR3VHRsS3phREpOY0Y5WFNj?=
 =?utf-8?B?MnNQcHlMT1RhTXJiUk0zbFh3OGQwanZkTmZOMlpvSjA0TENEU25NR0NsVnN3?=
 =?utf-8?B?MFMxSVYxNjlwaGJ0VTFuUWxhL1J2cDF6Mk1yU2lFQWU1YWZmL3ZXZXZwVHI0?=
 =?utf-8?B?elFqWmpzNE1jb2lWMWg2d21YY20wN3JyanBYKzVEYnpHUnVZelI5TG5yWjA1?=
 =?utf-8?B?RkRCWWI0Q3FOV25zQjlTR0RyKzE2YlBUSW44ZFE2eUxLRkFmQ2JPeis1UUNu?=
 =?utf-8?B?SGxidU5KTlAyL1RuZWc2OG9ZOHNNMVVNVEFwMnVzZWQ2YUVOTmJaYkRWK3NH?=
 =?utf-8?B?MFlWdkk5WFp0UEJMTDM2emNVb3ZDWlQ2NXh5Z3ZoZVhtNDRCWUZJeVB4R05j?=
 =?utf-8?B?NE9vR2dJZ0FNTmx0M3ZDRGpqN2x0WjlkREdlOWlJWnJnYi9BKzVwRkI0c3lD?=
 =?utf-8?B?TGo0ei9jUlV4SGJaNkk2RmlpdVNqQlgrSGRhRVhyTVFIdXVlbXAzd29TOGpL?=
 =?utf-8?B?anRuUlRUOFMrRCtLeFBHUzA5VzhxeFRGTTZodWZVYnZYMkJHN3UxRmc2VkxM?=
 =?utf-8?B?V1ZibWt6OHZaYnhDeHJSWUUrWlFQcnVXVmJQNjNPcXVKdXpZcUxSZzlMeFB6?=
 =?utf-8?B?ZGNoRENqV0tKb3ZrVDVsc1Bjenhtam1MUVFNMWpPeHFnb0VJY0d6dldXKy9Y?=
 =?utf-8?B?NUVBTHU0TEFFVzl4UzBlc2tLZmtxWDg4RTNuQW43NjNmUXkxTDd3U05mY1lo?=
 =?utf-8?B?Y2ZQZDdsK0xRNGpQNVZ4NFNpOTlBWnVFNi81dlR2cnh5dWlvWkZtKy9ZM1Fv?=
 =?utf-8?B?OUhoVnNRNjRiclA4OHVqTkl2UWhIRGIxeERSRytpMXVXZDFndHJtc1RhRmVx?=
 =?utf-8?B?OHFDUmNBcGtROC9lVk5vQ0FwbDJkdGxNa2RaQnRMRk12SUE5aHdkeVdHS0FI?=
 =?utf-8?B?dm43YkZmdm5FVWRwMHBnYllFWlIwYnEwOGRKTzFWeHY4NWxWRU81T2duZGht?=
 =?utf-8?B?SVZWcVpxNTQ3cElScE5Eekt1KzltaTZHSFY4dFQ2YVNvcGtUaWtidz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9fbf25-a405-48ce-d850-08de9af54b04
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 13:45:45.0792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMy3JKkFeKbBD6nSw3WMJjSEkApmH4WlDJrBYUlB9jut7GO2PX1unRDrOJV2nabT1eYtf5RAn7SNHstxs7DA7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB5965

On Wed Apr 15, 2026 at 12:50 AM BST, Timur Tabi wrote:
> Although GA100 uses the same GSP-RM firmware as Turing, it has a differen=
t
> signature specifically for it.
>
> Fixes: 121ea04cd9f2 ("gpu: nova-core: add support for Turing/GA100 fwsign=
ature")
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/gsp.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 2fcc255c3bc8..63e464788c0b 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -139,7 +139,7 @@ pub(crate) fn new<'a>(
>                          }
>                          Architecture::Turing =3D> ".fwsignature_tu10x",
>                          // GA100 uses the same firmware as Turing

This comment should be removed.

Best,
Gary

> -                        Architecture::Ampere if chipset =3D=3D Chipset::=
GA100 =3D> ".fwsignature_tu10x",
> +                        Architecture::Ampere if chipset =3D=3D Chipset::=
GA100 =3D> ".fwsignature_ga100",
>                          Architecture::Ampere =3D> ".fwsignature_ga10x",
>                          Architecture::Ada =3D> ".fwsignature_ad10x",
>                      };

