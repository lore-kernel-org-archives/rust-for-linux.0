Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022093.outbound.protection.outlook.com [52.101.96.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4537395DAA
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 14:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127089; cv=fail; b=q2RjFumKgO0Sx8mtF7I/pMN2fkMEO8nNctyTIBjpSt82gMm2AcNWNqFkFDXy4Eg9gqJ7P7F3lAWQYiFt3Tc0ogkDXI591mYHdVVqrqmNjGi9kY3g9UzBeuVjnDbU0SD6C3+ZZTGyjNUl9NuhcIPPS5i1juoNyjuZ1WG35+S1Pgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127089; c=relaxed/simple;
	bh=fKsmgK+5FPRGcOT1Gq/2fDGxAx/oOrjL7QYyNknAcKI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=vDigHCzyZx7649mriWfKBlcsXOA6ZWrq55ApF8x1ZhVNMGI6oWnTcuJfC6pSlD93HsqjofroPN7zzj7gloQwqpUzzgOR48EKvQGQsc61ja2ofFKQ3af4IzZVyZZa+p6XqsHOat02RQj72n6kFfv9+5PA6ERm2toicuX3F/l781A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=VXdcFjua; arc=fail smtp.client-ip=52.101.96.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="VXdcFjua"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSDUEhiYRXg2V5LzXAKZRaAwlvQa8FQrSw7nfkHwLcqyb+vC7UdR6Gx6laWmgnuk2fPnYD4nMiJeMVUdYGq0sTXUKRuOkq8g7UtTFCeWkIhW5/mOQ6CKpRjKVuoJQO3na8O33DvHPl8H1SiosWUHFTO8uQbZXDtY0hLnAhIE4NwWFqOY5Iz2zPXjZTtjhfeumclh/mcbDUOfktmfTLUf1oquRhCgIR3c4r6XzAVjxGOGuerrpGTGGgzcl4I2e7kNF8vu8EQxMzRYdpCvxK3Ti6/WmgNI0HmjHz+bW1pi1rI2peTbLt8DGCJD+NbUmutuAvPti3N06KdibXzi0+e8HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKsmgK+5FPRGcOT1Gq/2fDGxAx/oOrjL7QYyNknAcKI=;
 b=X1L7g5Jhrkl9LPGa9z3qNp74U2GwW6u5DUQqb6HJTQ6OXh7wLu0eMu0xehjz4YXTXZT7VBuAt0SMAX8xhyFg/VVpGby43KMJ1l7qEFOzJ9slC9OBVAMNUrce2CRuKmQDFP/L7QN4Z6akgMZSeywKG0OQOl0N5w7DHD/BwGZqKHcROhxhAN6BHtF3RAWLZuqzLXLfUtadZR3i0iSemMV7jRa8dKwFzkSQIrPm1FlQA/qvbVWmrchxSvNL4DUMNFqply5QAcCpxjHVwMzUKodiGlEnU+Bc04ANT/0cwKxLtzW869sMk2fkF9HrJyQBE/Qp/4gnBjc/pgDFibDpI7ZrnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKsmgK+5FPRGcOT1Gq/2fDGxAx/oOrjL7QYyNknAcKI=;
 b=VXdcFjua/nCHx+KMoJAPxNU/d/2G00d/RRvoe1QDeN8wXf002BsIs961QbvBW+o7LCn9sA1mueNmKIW+TMR4f9tHUkqtcTdGpClN5WhstXzxrl72Mgw8M/ytm8TNoNf4hnfWLNURou80xkb5K8aIKqyrOy53RGOH4wERW2tNd38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6897.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 14:51:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 14:51:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 15:51:23 +0100
Message-Id: <DJZ89N38SHOS.11AK80GIQXGDX@garyguo.net>
Cc: <tomo@aliasing.net>, <ojeda@kernel.org>, <gary@garyguo.net>,
 <dirk.behme@de.bosch.com>, <aliceryhl@google.com>,
 <anna-maria@linutronix.de>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <frederic@kernel.org>, <jstultz@google.com>,
 <lossin@kernel.org>, <lyude@redhat.com>, <sboyd@kernel.org>,
 <tglx@kernel.org>, <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3] rust: hrtimer: Restrict expires() to safe contexts
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <a.hindborg@kernel.org>
X-Mailer: aerc 0.21.0
References: <hGNrgHLZgzaLAav_TQCJaAHYX3aWSPyoHeXEf7u3ioJunfoFTIPF9Q8PnCvfRKXq2SS-fNdOn35uMiTaF90nKA==@protonmail.internalid> <20260303061000.73970-1-tomo@aliasing.net> <87y0gcf9xw.fsf@t14s.mail-host-address-is-not-set> <20260715.202254.38223441240127219.tomo@flapping.org>
In-Reply-To: <20260715.202254.38223441240127219.tomo@flapping.org>
X-ClientProxiedBy: LO2P123CA0075.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 35edaf3f-9b54-4933-1330-08dee2808a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|23010399003|7416014|22082099003|18002099003|10067099003|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	bG27pmt6BV8y60CZNj1b94UC3CW5NOR2jvOV/AnJlkGoYAm8XoR4D45yjcCSubHi0T3XaTzyHASXbzCRcUhM1uT3WB3G0TtLiIYjpU0XhtpeihUJosoXoziSsBe2B0GoONWaCIPL9HQrdUx70tzBPSeJa55iu1Ukh5+Q3dmiWv5yNHu3uBEcGPibybI2FQE1zxtZyyKblXrHsm5me8bri3UOY6WCuCb5DPNLYZjFaBsheHMeHo3DHdZZgJfiH0VBF6R3CPJOUxXD1gMPb6iTpfzOUPjiznSP+UcQv3mS7iWZDvtg78Dx9sIYiaXHULcekgaVIDJC6gh6mTb149XvV/QePb+F0cwiQWDENuQQxICS3yjKks1eBDBDhT+lgEhKd29i4FafvdSKh7Duf4FNGBuCo67/lM7NU/NX7oNU7X//EWc7zykQqVnBczSWvNxp9hFPNJ4mHwx02XiqB4haKHFRLKZCSru7dYZ/vWMvYMYjNQdtIZjXXSwnK6ZfLUgkvZK9FhfjSAJTwQjdSPu8dI+s4xtVj0Nynf9LpvogVzMPD/bnHmHFXM4KOuMyQrZiKXUNVBL0o8ZJqJh0aBcvdn/l+iiGWZ8hHi8OlKiZ+rwVTYN66y/MqEBhC5wUCcHXG+qTl1oOeJEeJQdSQelyvGZCGEWwWtvNQ2Xwz4EdU+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(23010399003)(7416014)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1duQlBlYk5OK0pQK1JFREVGVjVhcnpCZEVJWCtGVVI4dVBqSXhqd3k1bDFa?=
 =?utf-8?B?Nmg4cVBJNG0zUW5uSVVXT3Jqb05ZOUtadnJmYlA5bVM4eC8vYWJBVlE1UW9x?=
 =?utf-8?B?Y0JRM1pRR1pwUzk3UHkvSDFOVzkxN3BEWHFNbVdibUpDU2ZRWUZEUTNSMUNm?=
 =?utf-8?B?YnR1NytsVitxcklSVC9aTHF0Q05CQmg2MjlxMGRmU0tvTUdBR0t3WVBaSll2?=
 =?utf-8?B?M1BpTmhGVVFTVWFiREV6RmtmV2w0TllyUWFKMWEwQjBzajlvN0xza0MrZytV?=
 =?utf-8?B?ODZkeEovMUlncUJETlRYVkFSd1MwclhFQ1dUYkozRTdDZitQSjRrQlUwQlNw?=
 =?utf-8?B?SHRKbTlzZ3RNcXA4RDNQdXQvVFVzSFRKNHBEUkk3UXFWNHFzNkpjdkRGbERu?=
 =?utf-8?B?QkUyc3pPdHRFNmlIN2ZENGdaNWZienc1VjFrZjRyVnhGNDkrUXkzWGp2RW9r?=
 =?utf-8?B?TE5XcVBHakhEOEVvNkh2TURFQ1BodVR0aUxjZlBiRWF3SjlUN2h4QzdQR3Ju?=
 =?utf-8?B?ZGZXUFdOMWdiVTFjQVBiRXJ5U1B4b01TOStTQytSYWIzMVJTYlNHcG5ZNG9u?=
 =?utf-8?B?blBoNFFXclVScXJoZHhxYkZlbG9Pa2RpT3JYQ1hUYTBINWd1SlVTNEo2Vmpl?=
 =?utf-8?B?NCt1bndrMUxZOWswTjRiZStZNlRlaXduSkFrajI5THFqV1hURFVrQ2lzRzVS?=
 =?utf-8?B?dms5WDNleWV6bWpPY0RTQ1BDV1JYUnROa2JqZ1FiRnRmOXgxbUpPaXFaMXlM?=
 =?utf-8?B?cmRzRlQ5cjRBVmdKeloyRTVLRkZvNU1INExCSGxFVW9ISXIyaTZGbDNrRk1q?=
 =?utf-8?B?a0lEcFQ0NWhLYVNSdVdPeGdsZkNQRXVLYWpWQlZnajZLNmIzWnR6WXE3Z3hU?=
 =?utf-8?B?L24rQ0JEMnpGR1NjQTg1aXBSSjkvRllwZ3Fpa0ZoSlJlU21XaGQxUnVyeHU0?=
 =?utf-8?B?U25jUzVaNytLQXltYklNZ2J2MGJIVEZXYUVtT2hXWWpGQ3lOU0E4TktsNWV6?=
 =?utf-8?B?dUIzK3FkN3pFWmJsSkk2eHRMUU1qNVE0cmlEenRMNkkySWpIeFVKSmdiUWJL?=
 =?utf-8?B?ajZjNDEwdGJVY2trNDlhQjBaS2YyM1lzNjlPL1Q4RVc0NTg0bmRXUHhoc0Vz?=
 =?utf-8?B?aHBJUDV1RXpVMTYzdTJUN29GVjZiT1FZRXJhMUZBOVpZbzlIMGJrVGZCY3o5?=
 =?utf-8?B?NGMyUGRRNGthL3Z3NGFwSHZKdEtNYjZEQWRUMjJCb25nQTdNRnROYktpem9F?=
 =?utf-8?B?dkNVelhSMXpqbXduUkZMR1k0ak5VTHd5enNmRkx6ajdaNCt6eUJVdVNvVC9N?=
 =?utf-8?B?UGV3YkQyR3V1L0xKQVJ5QXZUSFNXL1JmdU9QdWN1VmZIR09TdW84bWE1ZVNv?=
 =?utf-8?B?UzFUTzNEdUxVNllsWHJrbER4cGZxZVkzTmZsVzkwN1g3WUpRM0E0WVhXMUVr?=
 =?utf-8?B?ZkhkNTNJbms1aTlXSENSUzh3SFgvbElkSkU5eitQbDMyL1lJZXo2MVFteGI4?=
 =?utf-8?B?MTBFQWx1V05ZOXlHeXJqNEdNcHNtZHJ0WFdDZm9Od3ZGYXhxajl6eTVKVzcx?=
 =?utf-8?B?cVNxR3M1Y3NDdTVQN2dSSS9qalVJbjFYcUZMdmpueVdBTUwzbWNyeGRTZUxG?=
 =?utf-8?B?R0R4UDBsemd6M1Eya20xb3RSRXM3OWFzTG04eVFEWFE2ZytXMitpMmlpSTdG?=
 =?utf-8?B?L2Y0UjZ1a1pQK21CQ3V0R3NNSHJ3NVFUYUFHZWQzOUhQSUYvbm5DbFBMOTIw?=
 =?utf-8?B?czB1aHZwVHRaVEhUTlhsNFg2bTZxY3JiRkMrdm56S3h6S09kMGw3SlgxT2xK?=
 =?utf-8?B?dFJBazVIbHBvYjMyekxSLzN5djl3SGNrcExrZ2FiM3J0WmUxN0lkNm9LUFFl?=
 =?utf-8?B?a0liczJxbFQySFhocjdvQlN0RXN4MVNldVVnUWNkc2NralJQc01hOWZZdDMw?=
 =?utf-8?B?T2tuTFQ3ZXVpU1dQOTRnQWl1VmNnZVBhNWk2ekdTK3NSVFVyQktkZ2tlTlVP?=
 =?utf-8?B?TlA1SEE1TzNPaHJXZzBIalJXKzMyTXErZlpqRzRlMWU2Qm9xbkNjelZ0Y3ZS?=
 =?utf-8?B?Zktia0tBOVN2RytaMTdkc0tlNG9VZGZVUlhDTGpZZWZCcUxidHQwbzVpRHRp?=
 =?utf-8?B?ZmwxNW5zM3VuRCs1SkJxbW1GN2g3cUt2Z29qakVTMXVEb2VQTDkyd3h4Q21m?=
 =?utf-8?B?NWNlNVlxTDlucmJLQ2hSZUNVV08xSnZqWFNPaVhraVpoL2YraDRwMWRHN215?=
 =?utf-8?B?OW5JWjczTDJ5OFczRDBmYUxPK2FIM2VmT3BpNWE4QktpQmFRQ0ZzK0xnVnM3?=
 =?utf-8?B?ZTRjbGY3Ukx1dlRxaVZ6TDRwd1I1L29ONTQxUUpnby80K3J3QlY5Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 35edaf3f-9b54-4933-1330-08dee2808a48
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 14:51:23.7937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLW2ZoPis6R+dWpO148a5e7DO+UJges25SGpXlB2hs3B5mpeYm0VmBzbOQtoufhAp15D6Y6OoqHKbbr6gEUJ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6897

On Wed Jul 15, 2026 at 12:22 PM BST, FUJITA Tomonori wrote:
> On Thu, 18 Jun 2026 11:56:59 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "FUJITA Tomonori" <tomo@aliasing.net> writes:
>>=20
>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>
>>> HrTimer::expires() previously read node.expires via a volatile load, wh=
ich
>>> can race with C-side updates. Rework the API so it is only callable wit=
h
>>> exclusive access or from the callback context.
>>>
>>> Introduce expires_unchecked() with an explicit safety contract, switch
>>> HrTimer::expires() to Pin<&mut Self>, add
>>> HrTimerCallbackContext::expires(), and route the read through
>>> hrtimer_get_expires() via a Rust helper.
>>>
>>> Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
>>> Closes: https://lore.kernel.org/rust-for-linux/87ldi7f4o1.fsf@t14s.mail=
-host-address-is-not-set/
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>=20
>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> One thing I'd like to double check before merging this,
> HrTImerCallbackContext::expires() now does:
>
> unsafe { self.0.as_ref().expires_unchecked() }
>
> which briefly makes a &HrTimer<T> from the NonNull<HrTimer<T>>.
>
> This is only sound today because `HrTimer<T>`'s sole field is
> `Opaque<bindings::hrtimer>`. As you pointed out earlier, if we add a
> field to HrTimer, "stuff breaks".

What breaks? You're just converting it to shared reference.

Best,
Gary

>
> Should `expires_unchecked` just keep taking `self_ptr: *const Self`,
> like `raw_forward()` (and like v2 did), so
> `HrTimerCallbackContext::expires()` can stay on `self.0.as_ptr()` and
> never form the reference at all?


