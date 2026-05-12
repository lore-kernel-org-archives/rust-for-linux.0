Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020084.outbound.protection.outlook.com [52.101.195.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E320138399B;
	Tue, 12 May 2026 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585191; cv=fail; b=eZkCegkb/jdlDKrRafsGvnCls4zFhuKQG0wBE6AwOLMKi7kOB+E8P3mhNbncSikvzsUSgzwzwqS4mE4d213khZ9MBJ1IXyAinWjDCYavPedYfojr+0o49wrXEaAyJV0XDoresUM0HVwg4Tn18VbD/bEuQTbpkdd9amsvp7CbdEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585191; c=relaxed/simple;
	bh=1vCYPS84ZsC0lMeo4dsXO7ZCWPzXm5JW14abJ+/RHgk=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=frHyjjJlE/dUeOZHB8oHWiXdKMMkjwU1uRN6bv47cQfq9YWv3EdtOoq2HhReicOe2lFC3wRV3kIG4u6iPsp0FQsKmByxPVgquOIT2UzOFfo5tbr+L1glZJOQiKtrJDsRZkQlLlhDzRC7CCt1QTWwBUAH5X/ftU0MeiI/cFR9TsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=A2owCB0h; arc=fail smtp.client-ip=52.101.195.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="A2owCB0h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwqDf6uPFrex4nDHVMjdXW5+nFMfo5S/rhdmY352jJxuVlcz6n5gEtmEeHxaa1OckKnnp7JgTmA8jFexwzrMqVXtNNPqUiAWFny+l9RWq17fzQszXxrw1/SfnT6uXnzsfMaAKhL6b5fwoi27rUfw+Bs0hi/BDtuJg7WZaPqIRY7tTW5ejU60E4dwEjA/NylYcB1PzNtsfKAGcmhWKbQUkdThhOPXh6r1PdPDLTjDUVBPEiI9B6YsYVSdptyKjAHhIBJSqt0nUBWEbS7pG2h5Mt/PXFSn0KOo7jWEggDELvQnQVxisLl+doQk8NuqMA9FuxV03n3k+LVPGDOOWvjM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JvRIAiBDA6J8S4pudZQALpZU7OM0F38bmQ5mPPTDfY=;
 b=WBRywm4asBBcM2j97v2XoixxpNv8J6ruCI9JY1U0zClJiaVYZHlZvFl/2VXicGwYOMQNcCDg1K7MRNIVSVH2obt/fhItHtdN+WmkxdUP8QvHwBOHANFjUOQbTm9SIUc2Hq07Y7jXFbW2Mfetwx/XKg+E6oZ91xplWpK6Yp0Z9BWMZAp+KLCcteF4lY6I4i5fxcctXlhdCVJjuLsCuI5XyCXkzil8VRJNiIn7vCpy4CuarG24hm/o3+LpF6y4TBnBQT4Nr0QvLVpZZlLbWklcKFUDBBXRqA52AXAwYLjFKMto0vmsznY2wtsW3SMtQs+1PtT1wv21tO2f2e6UpEK0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JvRIAiBDA6J8S4pudZQALpZU7OM0F38bmQ5mPPTDfY=;
 b=A2owCB0hGS+jtUSjbBqEQBnTQI0L2AIm4wjTtz93Z7U8+OzzVzPoif3ZwcA3FbXX5M6uoARr4hFPhBVVt04nRPJUOotOh6LIcjnDmf1w7dSJymhw1JV3yarFTH7aTJnr/ae+02OxVutN+y0Iyz9F4kz2Jm7jZZHXtHw29rHyles=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6222.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 11:26:25 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 11:26:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 12:26:24 +0100
Message-Id: <DIGNTTXFP7B7.3HYL4G3GCWVWF@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
X-Mailer: aerc 0.21.0
References: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
 <NEEh9XY18Nk7vKZB-Vz24V-2y3HYettAoZbomSB_Ml5KPx7kzR7hsLBSfRZbDRVM7XM3rowqFh0X0IIeuesa4Q==@protonmail.internalid> <DGPTYBO26YBT.3S14I9F5YT1PW@garyguo.net> <87o6laatg0.fsf@t14s.mail-host-address-is-not-set> <878q9p59v9.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <878q9p59v9.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P123CA0483.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e35079-82cb-4c77-e452-08deb0194d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	YobIZweaY0iD+YN0VTDrYGE3/VFmHW9rfSZCCINechyZYrXXsk5Xwv4KD4Q1Hx70vm8JZY+VH4R9l7hKTapH6lweEkd8R+iWUt+YTPWxHhEZIETaqXzGV5zUxMsL2xY0HK7vGd+WwLZ2DV6eIxu8GeZwS98Kb7FSXCZDRSADKSeZ7Fe71eHmnRJ0bMccrh23l7wKf1BHqv9XPx9OcWNnKA+M+vvssRqIQo28fUE02GtOEItV0Xm/Q1/g7hrQL8soTdnlcAHEKN7ovAf02n8MDsiyqCrXnYABMT2qcp6L9+20bisRj1C6iON4O2mNKw4qNN7UyNY72y8lytKUHyzH37LWx9PuR7a7gItQEWxfZFgOy1b51k9UCaxats3JTYMGt0/3JJvO4UWZNdWHLOTkQUe18iSwutmIvJru59oBv/2YYW9ESDzZWgieuczYEhcPFGKW01/WQh6QGr7mGoFMzuIuGM5RBfcfzd9A1vwGNu7zuT0QIXuDCiJAU2JmKsjSpfCRwTgMvfAeo0jRVAaS41f1yPQu1sgzil+pJ76L4/Qmr3V83TlAT3RznckQzgFCN1lTPUaqq4Jx89fRB8DM3HzFBzs0Bi+ONtGPcGCL7OinPlYi32KpcPSP0dwH5yKLwNMTFHGmS7l9ROuy+fB1TuA4G6re45+qc1gQlARKEgDv1ecMJO/KFpUuY7kal7HPlMzFR2hHlatESPhSjMmERA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vi9lOXJPQkphdGM0OFJDeUtweU9ZNXZwZUp0ckdXUy9XOG9zNWI0NlQ4Q0hP?=
 =?utf-8?B?NjlGMzRqd1M4N2pIbUpJcC94UWwvcFVncVZtQ1A5UU5RbzZhR0RuRVh1VDVH?=
 =?utf-8?B?Q0FJNmwvd1daMTV2S3FqMVZycWRSTkpMdDhFMkppK3ZvZTU1Y0RpUE5oTVBO?=
 =?utf-8?B?Y2svWTJ3QUl2eFFNVlY2ZDYwWmNCWi9qZGkxbmhPdzVpV0JrUU0vek53SURD?=
 =?utf-8?B?RHFnano0aWVEWTl6dEtMeUlSMUJhREhZR0NTb05vbGZsem12OEU2VWhDa0NT?=
 =?utf-8?B?R1Z0SjE3dUFhYmwycGo0L0NxMTVUaUdIRUF3WWtZUmdYVE1oRkZHcXo1aHRX?=
 =?utf-8?B?YkFkd1JDNGJoQUFXMTE1dTdFdkgzb3c2ZC9qZWYzeU50RFNLK3JlRWZwb2VN?=
 =?utf-8?B?RTBUU3ZzcXVhV0U4QUF3ajBzSFJWNjR4U04yc3BmMlVnRDdUcDA2Y3B0SDBz?=
 =?utf-8?B?SVNDaXVpcmhmK1BUTWhWM3BFYVliYk1YZ240cVZNdFBPanFIK3Fvd0dlaHlQ?=
 =?utf-8?B?MUdKWkdoTmtNb2Zaa3RIWHg4TDZ6dmtlOVdCRHZtS0E3WlZya0F2SkFFdHVI?=
 =?utf-8?B?TVNoWXgxNVRVMm55cW5yeUdIUm1TSDVCZTl5MDhpRnpTV1hwUmRrKzdtMEk2?=
 =?utf-8?B?cUdXYTV1SWNuUVEweDNxcTQ3OC9RQ1pyUXVLTy9EdjVWbnVvTzI0VjNWd1lL?=
 =?utf-8?B?NG5tK2ZmOUFEYkcrdGcwVTlxN24xY1Vub2trSmQyMTg3NWRuL3U4QzJQWDhS?=
 =?utf-8?B?czZpUGRaRFdEZFplbndicno5dEdTazFWaUk4WFFlaWY3VXA3bnBUbU1pWUkw?=
 =?utf-8?B?SUxFWUQzR0FKVlVoNlRjU1BnOExqY3V6VlRPVzNPNTJHQ3YvU1VZZWw5cWQv?=
 =?utf-8?B?WUNhSFNwVExJY0VFSlpCRU9OUCtpa0VMNVZPVUJJWHU4MEUyTVpZNkE2ejAz?=
 =?utf-8?B?d1IzZVlEcnNBaHM0eDdMM1B6VGIzU3d0UmdPOTFrNUNBTHpxUENLZ0hpMVFK?=
 =?utf-8?B?VHQ0ZjJqMWRJUjB6Q2NFMG1pc3dWTVg0dlBQazdpNDNjd1ZDZUJqWmxwenZ2?=
 =?utf-8?B?ODE5VEYxNTJmaUR0TTdiTGt6QXJocXhRSWFUeUxQSnlSN0ZhbkZiOWh4K1pm?=
 =?utf-8?B?Ty8vTkFBOHRXYnZtbTI1SC9PVGJLM044RkJrdVdKOEFSWVdhSndPdDVUNnd3?=
 =?utf-8?B?WDcvTGVlUmtRTGQ4bTdhQ0R0eHpCQ0x4VXZMbFowTGpIdTVKWHIzREUzclVT?=
 =?utf-8?B?S0ZzVndwNE1ZaGlCMDJPeUJwZUtpRXVFSDVpQnJSM2I4YzJMY3M3dzd6YUlU?=
 =?utf-8?B?RHhxL284WDlQWGt5VGpRVFpFeGpvOGk1L2NlYWdzdFR2NlkweGRhY016WUlW?=
 =?utf-8?B?TXhlZFJObWlZV3RqbGRKaVZTbGZIVkNZclJuWUNxTWRWYnBPaXJIT3NkUVEy?=
 =?utf-8?B?bnJRbU5IUzQ4LzFmUW9NMHltSytEMkxiL1E0dTNWVFFnYys4MkEyTzliNUsw?=
 =?utf-8?B?U3NDY1pqQW9McFQxUFBVdWtjMVhDbi9qZnZGMVM1cnFvUXRvbWdKbEVLV2Vh?=
 =?utf-8?B?dmxaMit5V3ZOdXFkZVd5cFZyOTZpOFVvNnFMaUNBSlBubkNhdHpDRDZoRkZB?=
 =?utf-8?B?SHpvK1lWeFJ6ZlI1QVYya0VXY1MxNDhTOVNXK1ZSRm5yN0QxSGEwemczcDV3?=
 =?utf-8?B?SGZIeXZqVEcrOWFKbGxZMm94V1Z6TGx3N0xBVXNpK1NHQktydDZmelNMbVJ6?=
 =?utf-8?B?cndYYURDRmd4Kyttczl0YkVKMWFaeVp6c0ZacERybVFBSkRmaVBaYXZYdk1I?=
 =?utf-8?B?am5NSDNlZ3VaYWJHdXZabkNXRUw0dXF1eWVKMXJiL3Z5RVFBb0hqWkVvd1dE?=
 =?utf-8?B?TjZTTUxvalZKckN4VEhxQUYrMW82Tk5yK3ZXMkVlL3M1NWlmK3NJeTNHM3ZT?=
 =?utf-8?B?M0t6TVArbWk1M21VTUdEYW9ZeDZsdGlIZmFJQXVVMyt6RXRiSUlTVlo4NCto?=
 =?utf-8?B?eDFoaDFZM09vUDBrUUlFbjZqb0J3VFNVYVhxazNGVll4dHprSVhYSURIeDdF?=
 =?utf-8?B?NUtSS3pwNzVkWElvd0dyU1Ywb0haYWx0bXU4elhhRzV1dzRFSnc0NTNWVkph?=
 =?utf-8?B?RTB0SHZYdmNzVmFFcUQrbGRPREdGbEUwR2VkWTlnc3V3RVJUbmE1bjByaGpE?=
 =?utf-8?B?cWRqS2Eyb0pnSlUzbFFCVWhMQm1YNkdXWElkaVpJQ3k5REFlUDYzWjhGcDFU?=
 =?utf-8?B?MEVkSTZHVGRwYnMyc2NKZHBVRkVWWThBbW5hZkFweWt1OWxkbjMweXZESUFy?=
 =?utf-8?B?SGNSV2hUK2U5eTJabjJyeUdzOVZDNFZ1bnJwU0Z6emtRQ2pDR1hHZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e35079-82cb-4c77-e452-08deb0194d1c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 11:26:24.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5tYbImzUXoccSFb9GiNRLhxL2VnySeqSMIG+JFOY8yJUNaQpuzj/G7jNO76Za54COgi78Z+9dijxqBBfd1IIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6222

On Tue May 12, 2026 at 9:07 AM BST, Andreas Hindborg wrote:
> Andreas Hindborg <a.hindborg@kernel.org> writes:
>
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>> On Sun Feb 15, 2026 at 8:27 PM GMT, Andreas Hindborg wrote:
>>>> Add methods to get a reference to the contained value or populate the
>>>> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
>>>> directly, while `as_ref_or_populate_with` accepts a fallible closure,
>>>> allowing for lazy initialization that may fail. Both methods spin-wait
>>>> if another thread is concurrently initializing the container.
>>>>
>>>> Also add `populate_with` which takes a fallible closure and serves as
>>>> the implementation basis for the other populate methods.
>>>
>>> Hi Andreas, in an earlier call I mentioned that I'm working on getting =
SetOnce
>>> to work with pin-init, the capability of which I think is a superset of=
 you have
>>> here.
>>>
>>> The API I have is
>>>
>>> impl<T> SetOnce<T> {
>>>     pub fn init<E>(&self, init: impl Init<T, E>) -> Result<&T, InitErro=
r<E>>;
>>>     pub fn pin_init<E>(self, Pin<&Self>, init: impl PinInit<T, E>) -> R=
esult<&T, InitError<E>>;
>>> }
>>>
>>> To achieve what you need with a function, you can simply write:
>>>
>>>     set_once.init(pin_init::init_scope(your_fn))
>>>
>>> The patch that implement the API is here:
>>> https://github.com/nbdd0121/linux/commit/4aabdbcf20b11626c253f203745b1d=
55c37ab2ee
>>> in tree
>>> https://github.com/nbdd0121/linux/tree/lazy_revocable_nova_wip/
>>>
>>> which I haven't submitted to the list as the user side of this API isn'=
t ready.
>>
>> I probably evicted that from cache.
>>
>> It looks like that could replace the `populate` in my patch? We would
>> still need the synchronization in `as_ref_or_populate`, right? (or
>> `as_ref_or_init` if you will)
>
> Looks like this is not ready yet. I think we can move forward with the
> current suggestion and then wire up pin-init when it lands.
>

Alvin's been carrying the patch in his series:
https://lore.kernel.org/rust-for-linux/20260326-b4-tyr-debugfs-v1-1-074badd=
18716@linux.dev/

Best,
Gary
