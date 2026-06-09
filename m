Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022099.outbound.protection.outlook.com [52.101.96.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952714183A9
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 12:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008600; cv=fail; b=mcDfa6DkW50TBrDjyTgG2rolR/+/7vbrjv1XgepklcNf+b64/OcwaQMvxRygg9VSO0m0FCNz9u7CLU+pX5WEJuB2FzoJ8pqVEKbOZmA2R2utZjR5335aC3/8PHBqtQR93tL0d6mtW7GVPRXTqx/7mwpA2XHn29uBWTXo025wCdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008600; c=relaxed/simple;
	bh=huVVbm8sR0CoF7Pd7CepMC+wqZQ8ZItj0iDLibfqHVU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ehTRu1eLcNy3i+ncDZPJ2ZVH1VtYWbebKUh3S95B8Qwr8wbhb0P5zs1K4/gnLYgbWLQBqC/N1vobvAb5ctVORyu4EEzgQyCAwFjkeZDEvm++/WTSEeKMbPY/ungat9zqqxAeILI4GS1avlteju0yFH2NzN42/mSsJg/RdzouCfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Iy6U/S9J; arc=fail smtp.client-ip=52.101.96.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Iy6U/S9J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgk+2mdaPIHGYK1Q210+Q57uTdW13t6m8JJJmlGfWR/OsxROGKnntF0kYGqig9N1opT+wCgFZPk1FLCWjvi7aqCiNxtiDx22hhLhASrftMyUbTXWe86nkqMcWyaC7PZEnKeDYS2XnkkKjyXh/vHZJco09R+xIMS9XYdQpAClY4OxP/ahaJ12K2XglUdMHuA9Ct8pg7WdoGKJuib81yNDwvCzQ/wV24wVl5XXaBCt+in1JCQ1POvNfD/TJk/bLhkSL8crZiG7UFMnHR5wW5/tSfuIyR08qNkDZXkSgrA/Fzj1PryTnde1td6kil+uaeHybWSClTE7kZNoPJqHyEkYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xFOFDydhvatoB2BljPEF4PezTTF1SC+Cep8oRB9LDo=;
 b=UFU/EnJKbU45QRSq8W9ri+6Squ7V9BIowokrljY312Znt+Bsf2AMO/Mrb6DwRZ+Cwoc/jjQTS5vRrnAR4LEXS3hrcKpZDDVyjzDe4J1F8Aph1V/MoEg3EL1dP0h61yv62ZQ8tpT1div9XWFpj1w2LWUzl3vzx8gC3LPzy9wxYws7yzgZCK0Zj2adHVjGMs/QVbfreb18i3ZKUxG6J7YpeEx5uhCY91F4kIAsISLGOuJjZd5o0thvHET61rbgBm6a/r0hJ0H6OwC9y+gCabcg1bvoaqmIqZb51ebO+nVmhBK6UCFeKbGwIPhNJPNjOG5vc4UiTcDUkZd2QNDRzYojMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xFOFDydhvatoB2BljPEF4PezTTF1SC+Cep8oRB9LDo=;
 b=Iy6U/S9Jj0VPKop3vDxG11P19Ovpmlq97n+ELRYTTDu7bFIdmke6aVx/MdJ3Mi7l837mmASdVKJWAmqmrSJBehFflykc3KcMHToSLaYVo4aB/ML7C5RVd1k+kIW89r9nPbIN9ydPuDo6ukefc1hMgcSoKxeQxaxf2j7bThYyq10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2630.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:88::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 12:36:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 12:36:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 13:36:29 +0100
Message-Id: <DJ4IUQUEW8CM.XC423JF26458@garyguo.net>
Cc: <ojeda@kernel.org>, <sashiko-reviews@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 01/11] rust: xarray: minor formatting fixes
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Tamir Duberstein"
 <tamird@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260604-xarray-entry-send-v4-1-965f6028790e@kernel.org>
 <Yb-tTMBfsrAuBw9NXgUPl-MY1hGnE7OrQD5JOEwzYuL2Af2BZYrfDg5FzWfVfmulrnBeioLiEacxVMKrswog9g==@protonmail.internalid> <20260604201631.450B51F00893@smtp.kernel.org> <87fr2wgew0.fsf@kernel.org>
In-Reply-To: <87fr2wgew0.fsf@kernel.org>
X-ClientProxiedBy: LO4P265CA0146.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2630:EE_
X-MS-Office365-Filtering-Correlation-Id: 850881ab-6608-4ce4-222d-08dec623bb16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|6133799003|18002099003|22082099003|56012099006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	S7glOJCE+Orx4RzvkVWsP0L5B3bw0oAmGFIoH82Mf2SO2CgZyqGd2hrKG1ilqxhD+TQXEQkJFQV9z5hiiA/0wDjiFP8S5+9dNSTfzcpl78TJIm2OHy4S9u+/RvFmtl3PBvUkQS09WPLmSwUpqxocCCXU40D4D0hiQXTn+8EyfGQYlKxjZ6+NbfcbC9/To60UODYLkFyHlbnOFoj2dM/LTg6y4f2LJ6vJNZ5bzhG1TFlCy3mg3Rwv1je2OaTV67ZEwoZUOy2AOBpvrRXj8BkY9vkXs/PGWF7KvigO/Xps6MjIIgIfMaCZ7Cdhn16LegvM1LBdFvs8qYZKQughZAIdqMNLg1e8kCY63KyjTtOLodnd+g56xGmNBbzKxlwjG6Gh6RQEOM5EC7fPOAfCWyed4UxFy417Hi12hNm/PqvELiGu76QLwci7rNQmTAnD/PFpEj/9wnf/ZtvjbdB9z0eRmWcThwMvhHfcXklxf+53nKrpSEGwz87XLmA8nTi8M7+gUF/sskdOU9lb6DaL2/G71tIFY4y8prlwrZx07w+LuIR2tBdGW+OgCFtN1gP8B0oAfUD/V8cluBEl9gPz6/x0DGSbtpyzKABWvR/LP0+H9f+daoM3MVRkTWQr7YXy16BdcjRSDoefI/RtIP+GScbgV6bZKWVaSnql5Y6IVRXZqsA9V/tncIYCWQoZeFonUUKM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(6133799003)(18002099003)(22082099003)(56012099006)(5023799004)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amg3d1VNbCtMaFdIN3ozQVdyWTg5WVJGM3NSV2sxUkI0S0RFbkU5RGJEYWJj?=
 =?utf-8?B?RXAzSXFLS29iL1ZzODVwcFBOdzR3QklKaTNScEthZ0QrZjQ4S3BOOFA4aGl2?=
 =?utf-8?B?cUdvS2orMjdOTHhtMFFtR0JrTmM0UDVTVHh1S05qbnI2VzFxTDVsbEZoZ252?=
 =?utf-8?B?QWc4Q2NmamdvQk5OV3hNMzhjLzVxTlVubVIvYkcyYjF4UmkzS0JNbFNJY0Ux?=
 =?utf-8?B?VitxMXpXaWlITWZLNDFGNWo5SEJCVkw2MDFPQ1Bwckd1ZlVBSHI1SVkrSEtE?=
 =?utf-8?B?blNQMTlLS3Bzc1FEMU8vUDNPUlFrZlE2cHhqalE1anozMHlkS25PR2hId0dY?=
 =?utf-8?B?K1M3b1diajJIUFAwVS96VnFxNzkzOUo1OUN3NlRmVzFFdnNuRW1TSXl2bzly?=
 =?utf-8?B?MkhJaGhnSXJqa2dLYm5PUkwvMmwrUkdxcUluNFJnOXp6WmR6TmxKMmxQV0Jr?=
 =?utf-8?B?T2o4RnFJWGJacnkzVzYvR0FyQXRZNGVNVDR1aVp0bVN4Z3BpZkZpa01BK0Z1?=
 =?utf-8?B?ZE9PcElGZFUyZkROamZtOG9EYmFXSkhyVVBuclF3RXRpWUVNdU5MUEhtVExR?=
 =?utf-8?B?VlR3cXkvUlNReFlJMWVJS2M1a2JHZUlWRmtZVUZSbWRqZ2pneE1abmtYaHRW?=
 =?utf-8?B?R2prMFhMZkx0TlhkWDhCQUxuSDNJOThyQithOWtFZmJBTWJvbktpOVcra3pI?=
 =?utf-8?B?RWQ5ZUVyaFJmaUFGVXFldnhpcW9wWDZlMG5ydVVBWTFjZ3FuOG5zbThmRDBa?=
 =?utf-8?B?SEZ0bjZ0UUlZT3c1ZWcvZGhBVGhOMkZndWlnaFZvYVoyYmJrbnlmNFRCbWNB?=
 =?utf-8?B?a0FaNG5wYTUrR2dYU2pEWlN6cHJwTFl3cjQvSGpzaHRTdHVXUHJMdGRUQXlY?=
 =?utf-8?B?TWgyd1ViVlFMUG51Y2VzZ0I3c3lTMi9FbDgybE1Yb1hpTjU3TEY1U0kybDFR?=
 =?utf-8?B?SEhiWW9SdXNlM0JhT09EZHR1NW5CdU03ZXBtN1F0Q2ppMTlaWW5rVkxOMlRL?=
 =?utf-8?B?MVBGOVNWQnpiRzRxVWhMQktCWEVDZXhkQjN6QVRBTmlaZkdXdW1pakhIWVRi?=
 =?utf-8?B?UFA0QlY2U0c4UEEyUmdZRDJFL3RwQWdoNGdlY3B6a0lrRWRPa1I5cmZKZms3?=
 =?utf-8?B?Y2dlZ2VEQjlqcjFtYVdOcXRRNkdTTklqNFJ2c0lSOWhHYmprV2daZGJRdGV4?=
 =?utf-8?B?VTQyM0RQY3J4Qzg4cHJDc0VZcUJSa092bXZhRHlLZzdVck9WUWxXV0FmOG5F?=
 =?utf-8?B?Vi91YlA3NGR4RUFMOHNEekNHMUNLM2ZrV0twQmMyZ0dqMlNBT2NhQURLNkR1?=
 =?utf-8?B?YThPcm12SUVtUzNiQ1E1YURKR3JJOTZnRWluWHMrckhsRGJUS3ZVb09lLzR3?=
 =?utf-8?B?RWEySFZHeURzSkduYmhmOC90dnZIcTI0QXBBK2xZcVg1TEpneC83enptZEtR?=
 =?utf-8?B?ak9BTVNVZFg4bmVKTVF6L1V0Qk5pZDMwcDJVTW0zamkyUjFWLzQwazN5Rk5Y?=
 =?utf-8?B?N1FHelJMbjE2V1FkQk44WlFRMUprdW9OV04vWTN4Sll2aEt6cDVNNnFhc2pR?=
 =?utf-8?B?MnVsNVl6Tjh1YUp2YnVKb0RUaVg2MGN1MndCVnZOd0VyaUhpUHFRTi92NDJ6?=
 =?utf-8?B?Y3FqdjZweE00dWtyM28vQXp6TmVtYy9weHUrZXd1S2h6V2pzdzdob3RsMGM0?=
 =?utf-8?B?UU1EYmpZTVhsWk96eGlIeUZZeWx2dmEycVNOOVhLbndaY2ppcEhrb0NLMFYv?=
 =?utf-8?B?UEpqQnJVaFc0RkdrT1NUMUZ4K3ZhUXEvWmFBYVNnN1NOM3c3c2ZHdXI4eVpV?=
 =?utf-8?B?ZElSRUZhckhja3pyaEtEczNZdVRrSW1pMTRxTTkwVUY0bEU1MHdzUk9hcGNS?=
 =?utf-8?B?ZHRSN1VqcUVuTWZPankwUUpuN3UrWUJvWGVZN0c5bk9lWkNtYTc0djA0T01n?=
 =?utf-8?B?WkI3dDhhM1F2b3NYcHVEMWZvTXBvL3llWFdXQm1veVZaMW9UekZVekNzLzVz?=
 =?utf-8?B?c3ZMSlFRL2RXZW05WjQ4K1RlK2o0RXpHYmtlRjBnNGhyeENlZjNjdXdHTWFV?=
 =?utf-8?B?bFJDZFNwbzZIS0lSZEtwSWxyWUsyaTJoTjhVWTByUk1sUnBsaStLSDVoUXNm?=
 =?utf-8?B?eXZkRW1ZY1BSNXZLR3BiVjFadkx3Q29PaG9YNk9seEkvRDV0aVdSeXVmTVFp?=
 =?utf-8?B?WUJZbU9hMytGOVFCZjNMZ2FJWHhKRmVXcHBwVVpPVlBTYnRScS9QaUk2WDJo?=
 =?utf-8?B?SHI5OHU5eEdGT29yWXFybFdoNzUyUklWb05XRkMwak5XdERTTkZqSnRUTEpn?=
 =?utf-8?B?bnkxSktseHc2bERDT0o0cHBEK2RRSG1RcWVUT3RvOUkvSm5xQlRJdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 850881ab-6608-4ce4-222d-08dec623bb16
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 12:36:29.8957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1b81/PFrEHW8QhMxSFmVmsevzIFaIjvI8r/Bd45LsokvHF14hG05i4s3TDzOF+rtSDmb16vJMXPwN17m8YwfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2630

On Tue Jun 9, 2026 at 11:57 AM BST, Andreas Hindborg wrote:
> <sashiko-bot@kernel.org> writes:
>
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>>
>> Pre-existing issues:
>> - [High] `Guard::store` temporarily drops the exclusive lock, violating =
`Guard` mutual exclusion semantics.
>> --
>>
>> commit dd1e562319819f32e9d1d6de7db886673c5422d7
>> Author: Andreas Hindborg <a.hindborg@kernel.org>
>>
>> rust: xarray: minor formatting fixes
>>
>> Fix formatting in xarray module to comply with kernel coding guidelines.
>>
>>> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
>>> index 46e5f43223fe8..b80fb7a262d0c 100644
>>> --- a/rust/kernel/xarray.rs
>>> +++ b/rust/kernel/xarray.rs
>>
>> [ ... ]
>>
>>> @@ -44,7 +63,10 @@
>>>  /// *guard.get_mut(0).unwrap() =3D 0xffff;
>>>  /// assert_eq!(guard.get(0).copied(), Some(0xffff));
>>>  ///
>>> -/// assert_eq!(guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(), =
Some(0xffff));
>>> +/// assert_eq!(
>>> +///     guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(),
>>> +///     Some(0xffff)
>>> +/// );
>>
>> [Severity: High]
>> This isn't a bug introduced by this patch, but since Guard::store calls
>> __xa_store which explicitly drops the xa_lock to allocate memory if call=
ed
>> with blocking flags (like GFP_KERNEL here), doesn't this violate the exp=
ected
>> mutual exclusion guarantee of the Guard?
>>
>> In Rust, a lock guard is fundamentally expected to provide strict, conti=
nuous
>> mutual exclusion for its entire lifetime. Temporarily releasing the lock=
 while
>> a Guard is held breaks this invariant. Any caller relying on the Guard t=
o
>> ensure atomicity (such as check-and-update patterns) will be exposed to =
silent
>> Time-Of-Check to Time-Of-Use (TOCTOU) race conditions, as other threads =
can
>> mutate the array while the lock is dropped.
>
> Should we rename `Guard` to something else to clarify this, or do you
> think it is enough with added documentation on `Guard`?

It's fine. `MutexGuard::unlocked` exist for parking-lot crate, it's not tha=
t
we're introducing a new concept here.

Documentation is sufficient.

Best,
Gary

>
>
> Best regards,
> Andreas Hindborg


