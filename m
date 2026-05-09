Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020086.outbound.protection.outlook.com [52.101.196.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9529352F87
	for <rust-for-linux@vger.kernel.org>; Sat,  9 May 2026 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778338237; cv=fail; b=O8WTaoaxOWflOARQoeR2JmqwzZyQnh7WYlmKSt1M19ZI/4OFhGLYNwUqqYk47J+HYdeGJAmJgLLH3vKtU6vaeO39zUDml81qm1fAo4b/CYOGX2j3d+VVkbuSdOuSHMFAHfVJO88X9hxIUXs3d7kvjSlrXA++q8//NotpphJaTUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778338237; c=relaxed/simple;
	bh=uq3SV8veMzySPrGSol5wV3WkQQIfy7MMjp9geTJ5Kko=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=dv22i9tfVDU69nWaZ7lJzNymFYoybMVmWeuGpOZ9ARkAa9YzhcPI+ntWCHPuwcYYkw866myI7JcmCTVSYIZTsk00idUkfWB4CzmF/C9XAvtW4FOO43stjwSz3PteBhbz2RH7xQBhefx2By6yZ1aGRJmOyXnl1lMTDUr1cIN5EVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=vVppza1+; arc=fail smtp.client-ip=52.101.196.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="vVppza1+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGoMOf9DhJgKQB1qzj/82VvuJPuDxhfTA+WfJ+p6oR2jo0qvSPnVVyM14KpPSFxxJ//MCjEKRPNSnm88k3LPlHXxYmhF1x4zQRUhZKoFeOEwxh7Yz+XE/qoS/5X6wNAJ2lQiUBu9Cq66kcPWC+ckJbr+1wl8GsTJSNrr65l1w4VfX092X9U8g2Oc9TOB8cshzE9QvbmyfWAWmwLVMOVfs8e/Yo2oXXGGxF80CeF0GxQHBRjy6JGFAxwPTUT30pLGaKAzhE8bHO3FZh2Ljln6/uATg6I8DGilakW62J6vPfcFy5qPeu5VvYDP+vMSAAdOR1p+eUJl++dWci/rIOKHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uq3SV8veMzySPrGSol5wV3WkQQIfy7MMjp9geTJ5Kko=;
 b=Lc5au2m7tFJ1L+Ly+r5ip/L0jcdxu1CPSgAW1uGAuFO9zrK2N1RF4zgaY4ldsibCtijbCiqDLpwHUCx7A5CCy1pfuy9eoEkWlKY96sEg0fo+2mCi5GNLswS3YlxQhPiwWinzhVuuuY6U3OPqpUc8k8fyRfoVKwuhL7tZgOH6BDs1dMPs3zEeFn45IgLUpTxWoQzOc/wO4lDNSTa2JVN9oB8xRgn1uS5oT+ZNuaRH7ifmtuXb95NpXf1eEvkIJqXf8jY1Dantp8KlYrHBFLPFlwelHPM1hQZFeWWWQM2Tx0YMjrORpajJdK2DZds4OmWsqz26tQqNy/UgDUxr+Fl4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uq3SV8veMzySPrGSol5wV3WkQQIfy7MMjp9geTJ5Kko=;
 b=vVppza1+PnbU0uzRIf3ayVk00VvHlyCU4YldZWQXB63+/gPlmzEYoQBfLxFgF+nkpyOYk/0AIV+i3xPpth0IsB9sgRVK3o2i3rhLsQQ9UpLBLkm8+gRsl29dA6L2OPBo9aCVm/w+5H3FPQMTIrs/vuMP+3SbeWR2tM8lEqqnCOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7423.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:217::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Sat, 9 May
 2026 14:50:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9891.020; Sat, 9 May 2026
 14:50:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 09 May 2026 15:50:30 +0100
Message-Id: <DIE8AGXTZXBL.2RY8JCWNOD2HG@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Sang-Heon Jeon" <ekffu200098@gmail.com>,
 <boqun@kernel.org>, <fujita.tomonori@gmail.com>, <frederic@kernel.org>,
 <lyude@redhat.com>, <tglx@kernel.org>, <anna-maria@linutronix.de>,
 <jstultz@google.com>, <sboyd@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: time: add debug assertions for out-of-range input
 in fsleep()
X-Mailer: aerc 0.21.0
References: <qBPUAToMpl5CvVd22lUrJOgsVSuqVYKsjEHpbs1UK-VTO-vN8UFOa35fFMsYOHoBuUp9HcP65ljAxmLQMcGS9w==@protonmail.internalid> <20260508173827.1123011-1-ekffu200098@gmail.com> <87a4u96m4c.fsf@t14s.mail-host-address-is-not-set> <DIE4WB0VE43Z.2ALSYOD50N5X7@garyguo.net> <87pl346466.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87pl346466.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P265CA0198.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: bdea77bd-73d4-448f-4304-08deadda512f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	IgIiZMSL7y9KBGh7uGhPcBlhN3BYuiNO36YdGiBE6AEK2qDbkV/Aow1bFObGvr7tm6aOm+ySxri90LtG7Yvz8QrV4JkXlm/NHv92dYwZBMebpbpLGCBE4fWX1FtDL29u/xIxPUPaDDg/V7YkM91E9mD8GRUdxkLDTUVeurAuFW6Xvmyq4LHNCxwMSZQaF2rTvlOoCvaZ/+AQxjSnkDRUXenhlYpGSqb9cjf7JudBvTz5RAzHXbX2aMhw6B6uZdwGAGBzuizE6VvRaDc9opEoDNmJKyTIwQxVi/szsxSsdKhCpzh3UFZW8Qx0u7rW+pmYUastqG9flqDH/iIEsve59tG8Vv45s55eDn31oANuyQ+OV4oI6zSlZZT9MvRpTR5DqfsxCdOXye90EhoXfsoMf2h+B+EC1ksJgXlXJ8C8u9vs81IRVJoxnf7JUFrjhcz1w2FXV1DRW0xW/89Hjbi+00zcGxcnV0FL6gJMUSkTE05bGWYJwCszjmlx/gEhV1nIUY6g+pnnGGYtdmy0Eh9g4OsReD7Gkzde9dc4CR2w/aoXAnBC+cJUf8JgeIkogN7uANDPFt/GwOgVDWSV5hkMmwY1NnA5doZZYpsMSm+AdPRjkoPJmmoyhKoqBjRSTNxxeN140EMbLCjPqzu517Bn5tjbzY/zk9Q5dVNdgUvQ09Ifggk1dwV0KweQ7xw7+31h+g8E5kGKVpKHSokohaVJopzXu0fsy8ECdLxzn35nZW94qEvh0oY9gTT/1CU+clv4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlR4NC92NU5JMHNrbkIrbVdpOFphZk9JS0dKK2twOGFMZnZZdXdEazhUQ3pL?=
 =?utf-8?B?S1YxRGowVkY5NDByZjV1V2xNeHhhRElwdWRJZ3QyZTZHL2tQbW1ZZzk0T1pa?=
 =?utf-8?B?bWR1QVovQ09vSG1iTmY5dlFyeXJzKzFHTnVUaC9zVERWcFpMTlNETFEwQUJV?=
 =?utf-8?B?ejMrUE42TlMxU1VENTZxanJ2cUozZXpobzFrSUVmbkJ2bGJtSkI4ZlZOUyt4?=
 =?utf-8?B?R0UyanZDaWYyVzZ5MEN4UTdIT3k3djVONHhUUlcrUXBJZWUrU3IzUjl5QTJN?=
 =?utf-8?B?bmd0a2VjMzZBUndoek1aQUR2cnZadjZIclYvcEtHL0xmR1ZaZnIyYitPNW9S?=
 =?utf-8?B?YS9wRnUrK0Fld1NmMmJuVHpCT0V4R2k1UUx6a1IvLzZvekRSeDZOK2wxMVBl?=
 =?utf-8?B?TWNOdFBIOXZVQmF6MURmaW5UUFNYNXhxdzFNcUpoSjZGV0RaUkRGSnYybWVy?=
 =?utf-8?B?MWM5Q1g4RllYK01JcEgxNi90c3A4TmhZN0pJdWtmdkU4YjF1RFBSQ2xqZnR1?=
 =?utf-8?B?SHliWjA5WEhWb0phT3FVcTlKbGhrUEtBNWpXTFYyZUlhczBkcmloWnIwVGNB?=
 =?utf-8?B?aWhZd1hmam04enoxWkZjS3JIWGV3MmtlaGd4YzU1VjgrdU9uSEdPb3pSTUt6?=
 =?utf-8?B?WDNNeUl5NzV1TE9XeG9jREgyYlFad2IxaThJR1ozam4ycXRtUGEwTjRRQmFs?=
 =?utf-8?B?YmR6MkcwNFJ0WTdjakxuMFU3cE1xWGFoQkFtcmtzUGN1cjFRMnBwbG9jcnZl?=
 =?utf-8?B?bnhyb2pzTkpzOGo5dGcxMnpSaGp1c1djZHl0MjIrbVpZc3VJRnkrd2JvQ2xz?=
 =?utf-8?B?YUhUR1NIb1JVeUU0ekZuaEJKLzNXdERxdzlVTUlkOXZPdHVkTFlaZG1KQ2lB?=
 =?utf-8?B?ZWNIdGN5L3VMZmpzVUJHMWJFTXJuUk1lSkZyNkdyUkFCK1pZTFdLR21WV0ht?=
 =?utf-8?B?MEZUWFNqb0hGS1ZacFFrRHZiTlo2Z2VHemR3TkZSV0NtZTlQenkrSGxEQ1kw?=
 =?utf-8?B?MTBVNXNJL3d5ejAxd0V2WHNBdEs2bFJicVpDeWl2VkhXYTVxTW5PYjNXM3Mw?=
 =?utf-8?B?dWhPSGhsY2x5MUpjUDJUMkdPaFJOSHpsQWdKNXZuU3NaaTZHSkR5Y25SNzRC?=
 =?utf-8?B?bSthS0EyTWhRbGZ1S2NPL2k2ZlNXTXREbzBzMm5tNTNsTUtwRm9menE5dTRq?=
 =?utf-8?B?UVNnRlNRcU9GcDBtTHZXNkFlUURtTG9BTGU5Y0xYZDVPYTRrWDRDdjRnTGFP?=
 =?utf-8?B?eEdNMTA2YXYyVWVyZ0tXbmxreDNickkzRTlpckk2emlCdXQ0eW9TTTg1dW9a?=
 =?utf-8?B?VGNRSEZ3WHN2TDVlWHUzZlNlYlkvbEN0WThBbFBhRmxYdXhmeEdNTzlLSWJF?=
 =?utf-8?B?citVVi9IL1J5Mno5NmNKMmtDL0o4bVYxY3ZreEhqUjFWcFM0MlZVUjZXU0Jr?=
 =?utf-8?B?dVFUNUtjZWdXdmdmOWF6ZDN6V1JBUzBuUHNIMktsQXBnNlVjMHNGYXN1SkhY?=
 =?utf-8?B?eUNqdXd5WUFZK0xWT3JsWTFHZEl4VnBOL2w2b24raFZvaEtlSzVDNEdzcXZt?=
 =?utf-8?B?MFdhMFB0bUk4RmVGYnQva3d1eXNKTlFsZm8ydmUwRHBPRnhsQWFPeEhucnJ3?=
 =?utf-8?B?THhRQUI1UktGQlM4N0Y2TkRmRWRpSjFVMXNtS1FHaTFEZmpqQXRNZURreFB4?=
 =?utf-8?B?Y3hXR1d3WWxEY3laTU5OS1FsSlhpU0N3QnFvTFhSZjd2VWNrT3N0TVptT3pK?=
 =?utf-8?B?Rnk5NlhVcm1jem10ZzA5RU0rc0hURFFzUEVjRDdtTXNwL2lXU3RrTFNJaHhN?=
 =?utf-8?B?a2NUcDYwL1N2TGlLM0U1YTU5U3VLZHZQOEZBbHRCYWtKbk5RK1lyZTk3Z3ZU?=
 =?utf-8?B?QU9Yb2x1bXhDS1hPL1hrd1B5Vzk5S2xQVG53MkhiRnljUy9QMVA4QlNVTVRK?=
 =?utf-8?B?T2FKNUlxRDBJWDZiSU9Hdk5Gc0xhdXN6NWdSQVhXUWdubXlQM2t3SEhDTVFi?=
 =?utf-8?B?WHM4MG1GVG93SkNRQm1ZYVFwSWRUMTBGbko1Mm9VSHJCaGdXS0txZzhMYjJq?=
 =?utf-8?B?QWkvTkQwNmxMbDNRYi9FMkhqcUdpdDc0cW9WdGpibXZ3eHNnQW0zQXhuUDYr?=
 =?utf-8?B?a05OdmJQeDdBMVB6dk5kUzgveUQzcWJieXRPZEZyNi9oN2YzejNEOE1hem1K?=
 =?utf-8?B?RFdpMnhrTE8yRFAzQTAwWlJkbHZ4KzZuemNiQjRIcnRpNlVSeXIxTW1xRjVk?=
 =?utf-8?B?YStSSklvdUJ3VWhGUDRUc2FhMG54NWNBRG0wS0g2a2ozdHFHSG1VTmpxdFNs?=
 =?utf-8?B?VC9TZlBhZHM0RDNVZXBueVBmK0NCUkgrQmpPTy8yMk45bFJjNGYxQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bdea77bd-73d4-448f-4304-08deadda512f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 14:50:31.0659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCl+6ccatRBOx2li7MCxprKKftXgPK7vK7UrzO329ddJVoZA2rgLnu6mVuJmTIbKEd2yTRiCRv1deX5QmDPb/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7423

On Sat May 9, 2026 at 3:36 PM BST, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Sat May 9, 2026 at 9:08 AM BST, Andreas Hindborg wrote:
>>> "Sang-Heon Jeon" <ekffu200098@gmail.com> writes:
>>>
>>>> fsleep() documents out-of-range input as a bug but does not check
>>>> it, unlike udelay(). Add `debug_assert!` calls to catch it in
>>>> debug builds.
>>>>
>>>> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
>>>> ---
>>>> Hello,
>>>>
>>>> I found this small inconsistency while reading the code. The same
>>>> check was applied to udelay() [1] but does not seem to have been
>>>> extended to fsleep(). Please let me know if I have misunderstood
>>>> anything.
>>>>
>>>> [1] https://lore.kernel.org/all/20251103112958.2961517-2-fujita.tomono=
ri@gmail.com
>>>>
>>>> Best Regards,
>>>> Sang-Heon Jeon
>>>
>>> Looks good to me. Could you add the warn_once and remove the todo as
>>> well? And add the warn_once to udelay as well, so both functions have
>>> same shape.
>>
>> If `warn_once` is added then the debug assert would be unnecessary.
>
> It is different mechanisms in different situations, right?
> `pr_warn_once` prints a warning once (and a stack trace depending on
> kernel configuration?). It would be enabled in production environments,
> and it allows the thread to continue executing after triggering.

The existing comment and your message says `warn_once`, not `pr_warn_once`.

>
> `debug_assert` panics when debug assertions are enabled, otherwise is
> compiled out.
>
> I don't think one makes the other unnecessary.

I don't think there should be two checks of the same thing. Even if we want
different behaviour depending on if debug assertions are enabled or not, it
should be a single macro that switches behaviour based on that config.

Best,
Gary
