Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022104.outbound.protection.outlook.com [52.101.101.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF873529403;
	Thu, 15 Oct 2026 14:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072948; cv=fail; b=Sdsp953b7Z/K2+c+VzFzJCvM6QbQ9CslDtSNiQm4gG9ZhBR6bw/O2EnKGKph5yJ5Kdf7GRtZXKvpGJTj6D4MjWnabXnC4reRD91S3cPxWc3OLfh3LU8gbi3L8sduUl00JMSXP9J7rCTJWMiLrpo2yrG7k3TP3InvQpNH8l0rHJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072948; c=relaxed/simple;
	bh=ulEEnnY6orpXyuWcYZJi/g6cqx679Q1vcyRcXcS6prY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=P5lwDfb0JOSv/P9VBQ5wZyM8zLYKHvschdlbrKA4uA0UC2XMWi7j6jcQ/8LWnocJXoMdsfz4JsRpEbvQjK/+K16NsCK7zZSp9NbwxwEME8inqwqA4bv8I/UJ+TC+KlgKn98vjv52Xf2Iv1Q9Rd07s0RJ46Dzcws0ieKszCRyQyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gr6y2W3I; arc=fail smtp.client-ip=52.101.101.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gr6y2W3I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8T3ZzZtUCeu7g2jNJryeTfQiBsY7PtTrOWEpoBontiAHh1YHKT2yXxMFTBdyyN+/aV6eaUPFLHDeRxGYKqrHDPfv5yJi2T6wwm7WpE0rcVhFrSA0ktsxyu8qw7A99tNntsCqduvBSfpw16OVR1GMNHEIeav6JwxsBEtgMSUGs29DKf4UX+W9cvsAUA/ZgRuXZq4GflivUnqdqC810uNx6oc2OhXXBILfS+j/3820a1WuHuCHIeLgeOCoUGvBHyBtyVvpVxMA+8LxqTeaTWRHtYawo2jb7dHVeK+NSeorJKSDDvF7OyDwPyWODZqn9j3PYN8QvmgZCRghdQQE3zPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oW12ZrY087H523ufmpFiXxHFc6d0xE1j3+jFJRKJPk=;
 b=e1gWOGzqsK9+4D2LdKnA8JJ4c8DrncoPTwkmzZEY297y1LdCakrYjIq0UNsfQVElYUuJh1qvL6Jd68eFbLTQZou2eYAiTmfLjRhFsrm9t1lF5w5ljBsC7HBs+lnRSvHXmj4ZMRYNDdxpJqD6TjlUqcF+5NwmqDTesIQ1Vk4i6r+rGrKn5xNSPQRWtJEfcyeUzeb+2VtZwLu6qDeG7I6Q8yiN7B9iw0pRxuuP1tjiod/sX1mKYsLdRr0yRhAJEIBA0SUrv7lM9FLsyK7ZIwD+N0hUF0zeTh9vG9RT9et39xkAYdhun3wAW/XaCYTOvv4XHwGvVsTUMJswRy85dl7/fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oW12ZrY087H523ufmpFiXxHFc6d0xE1j3+jFJRKJPk=;
 b=gr6y2W3IF/G4PE7P9shhrBN7HQ9eW3lBJJyHTNRxSPsCUu0jboVTrIo6xt/hxoZqvV0zBNMpt3O4zvpPCDR74qb7Wd+vjlsRmU/Wo+q0Ad1BN3y7yZKUv6AvyDVwsAQAqLJ1ocdsIdUx758ihPRzQZ1t5d55JhXna2vwIMnj6mM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB5938.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:02:22 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 14:02:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 15:02:21 +0100
Message-Id: <DM5GU8594ZLL.2VNTOLDKDU2MD@garyguo.net>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Lorenzo Delgado"
 <lnsdev@proton.me>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Thorsten
 Blum" <blum@kernel.org>, "Francis Laniel" <laniel_francis@npnm.eu>
Subject: Re: [PATCH v3 1/2] rust: non_empty: add NonEmpty
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
 <20261013-nonempty-slice-v3-1-4463cc0338f8@proton.me>
 <CANiq72nok4xoA6j1SXVdWKLEKAqj3MfzCa-Sse7NNbkrn2MXiw@mail.gmail.com>
 <DM4MPF17NSQL.2IOMXIQEVINKR@garyguo.net>
 <DM5F615QE0QH.MV46NZSC3TR0@nvidia.com>
In-Reply-To: <DM5F615QE0QH.MV46NZSC3TR0@nvidia.com>
X-ClientProxiedBy: LO4P123CA0672.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::10) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b2d56b0-fa25-4904-d784-08df2ac4ef18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|23010399003|56012099006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	QPrSMyNgvrB4lvLsiBS0BCfeOfjfKwSDivbR0XSHkaV3Qs4hqgGE5Peux2pmXiUltKWEywQItomfijfHe6B0EW6QDIbZ/PN1+IEZ0Lg933EXBWTB4eyo/jdRng25ssu3Eh82A3oUfif1/8P4wzGLMWHloPp5XouQTLvrrkmknquOIFdyPKQMob4jUYhmIPHUwHwTViYLhJNCZ7bzq/xILXdsLo2/TWJgjXPrSapRUtQte+yKHSQKlyBteQFOqhK6BUdPJR0ccDfAZ9uSiG1dwH0CpFISzkKz/VvAa56K9kCjnYNDgXYHCJbMymauIa9gdBqGhkgWix57KI03goWwvXehmV4D/G1TYFmKD02JAlaYvGbWG/PtNUgdtYBHzsgS3+WO78HrHjXjP9sXByWMGpoLkqJ7/Y36Fxmq5R/Q7eWhvBhO5GTECYr5L+tGif2fbe9BYAyoxn/4OCyU8VkpSw8/FLtN+maTQY8ZMoit+GWs4IQKEBGEWsI9rThM8CDDYhgFc57gqXlOUAqux0oEQK6hx5R9WGqMFfhPZQG8fQE9n/WFg4pl/Z2vyMxApwYitO5IDMrhTagkBrhxPc4/7FOi7UHflIqCUKRmE+dWlwFwWMz8g0xzc5Vxo00MOy8Bqij6IdmqRaouRBEffphTbzeQOHsbLv0Md9JNBLIt0i8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(23010399003)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlVaaXIzMEpVQ3VGeWp0Y1pYdjdNejVLZ1pYRUg4SE9rVUl0TnFxUEJMODRu?=
 =?utf-8?B?a0tCSFFBQlpZK0tjemJmTzlTdDFEaWREcU9JeVA2YkFJUHdSNHhmeW5sS0lj?=
 =?utf-8?B?SkVueCtvWS9SZFRrZG1TcXdKRlJteUJ1bWpBVFZMVkJoUWRKR2gzVlVva2J1?=
 =?utf-8?B?Y25OTStWZU5seWtpTTMxbG1mckJuWVRQYWxuaE1TbDNkSjlxcUJnYk9wSmVr?=
 =?utf-8?B?Y1FEMHd0VW5TeWZwY0k4R0xjdVBhQnZiOW1ZcHRhUnpVNXBON0xYWFlYelVn?=
 =?utf-8?B?NmR3MTg0Z05PRnpmcjR4R3FIcTQxT2JxOTZUWVlsWEhBR0dLTU9RVnFXeUQv?=
 =?utf-8?B?WTFlN2ZKZUZjZ0QwR2xOTHBoQ3BjVGZoUmY5dlA4U1M2bE52Y1ZKUWJJb0Nr?=
 =?utf-8?B?MzJHaWQyemhacXhmOU1QeklUeDI4eU5WblFKWnJzaUF2cEIxZ1JQM2xHc1Y3?=
 =?utf-8?B?bjNYclVnRzlVL1c3TWxhTjdQWFZhSW5iQWpjUHpKNHlOUmo4enNZbURMSWpG?=
 =?utf-8?B?NWMvZzZhd1J4c3RtWkpteDAvSEtqUm1TNkQ0bGtOMUh6Uy92cHlubGwrS2pM?=
 =?utf-8?B?cElSSk4zdDZieWlRL1Q1UW9IQkVoTmtsVURYOFB4WE9qZEg2Rk4vU20yM29o?=
 =?utf-8?B?TDRzWnVQYWpwRDZOY0syWWxhbVU0MnMyV0lBaVhuSkFyNXBINThtd0ZMRU9L?=
 =?utf-8?B?TElVdUZFNkg1dittSEZuRUlCY0kvOEViQ1FIQW00b2x5aW16V0pVYm5YdWRi?=
 =?utf-8?B?a3pKK005V3FhMlF1TCtuMlR3T2liajdsajR4NVB1RkEwZGlxK0JhaDJ3S3hV?=
 =?utf-8?B?ekZ5Y3U4K0Q4K2tvcmVZUit5ZU96bWZ3ellQOFRyYTJJSTVDbVdlNDRLNFJH?=
 =?utf-8?B?RU1qRnRDSGw4N3hkbWNWVDNIWnBDamtqM0ZCZVdHOU1TUlNZSDl5VXFyZ0lV?=
 =?utf-8?B?dzdRMlJNMlFZR2RlKzJGK20yaFlMaTdHQjFuejNrdFgvdGJiLzl6bFFoU1Ex?=
 =?utf-8?B?UkJDWjJDZzNzRGVQcTZBN0NsYTlVaEVlSHd2Zy9CK25jWTJ4bXc0NGhNMVNL?=
 =?utf-8?B?cEFQUVBBUmpFS0Z2REpsRHFMZFlIeVpmdWNjQ1BzRHQ0L3RKdVd2NkVJR3M2?=
 =?utf-8?B?YlhQKzc2N3oxSVhwenRMc3NHdmlwQ1Q0amFFckR5bUhtY1A3SnNtTnUzYlJJ?=
 =?utf-8?B?MzBQbXBHL0ROdlpBMUFEdENRSGZ3WnBtb1BEQlg3S3llRysxV2xDN1dzZlkx?=
 =?utf-8?B?ZFI3VUZod0Z1aDc4Tll4cFNSRHpTRmFJZmJHRUxCMU9yeFJmUEdDczBtNjU5?=
 =?utf-8?B?U292NUlNZ1cwb0JSR3dYN05pdE8vSis4cUtZM25ocmR6bHVJb0FHZWt0YXBS?=
 =?utf-8?B?TTdHUHZ0djV2OUF4ZG4yRG9URHVuSTk3MkJXT1lLRmtFWG1rUHNUcDdkQ3E3?=
 =?utf-8?B?TmlWZ2JSODF1eG51NlVYQS9UdldiOUx3YUhJaWQyTElyZnF6WER5NHVWVWt1?=
 =?utf-8?B?RkFFYnZiTklIaW5FT3daR3h2UWJlVDRIWml5R012T1JNK2dBZXlzTmNYNDlZ?=
 =?utf-8?B?WjlXREpIUHN1eFBLZ0ZiMU9PN281V3lGOXlWYWxKN3hSSGtJZlJldWszQWhH?=
 =?utf-8?B?dGgrbnlha0lBeHIraUg2R2NmUml4bEliYURRMENIOVFjdFhxNzVGcHRxSjVj?=
 =?utf-8?B?dytUSVE4bnRySzVaZEwzS0tSNXJkZ2ZtWHRwK2FYTEtNVkt4eGwxMEZlL0k1?=
 =?utf-8?B?RkhhSmJSK0JCalRKZzl2ajBvS0dqVE44aVFiNjlzbHk4cDhyN3NRdEt4VjJS?=
 =?utf-8?B?d2NQa0ZiamFuZEp1KzliWWVYczRqVFlXTW1CK0pBUEM4NS9BQ2wyVFNUSUZu?=
 =?utf-8?B?TVJWZTBtQmVWUE10NVNPME94UGZHWTdmQ0ZpTEhxZXdwTlRPQ0c0SHhhd1lK?=
 =?utf-8?B?K1RmcEUrZFVqdlF1WFZZclZoUTU3S0YvOE1UN3BNMWJEZlo0MXR2UTJlTGc4?=
 =?utf-8?B?THNlUlJTTzV5cDNheHRBVnhBM3MwTlNUOWMyZUx3UlZ0eXNOOGUrUS9kNVZJ?=
 =?utf-8?B?Zm5oRzlmeDErNGZmRlhUMzc5VHJ5NU5OZkdZcGVSQXFNZTB0UEJRbm1aRmov?=
 =?utf-8?B?eDBHdGg0dHFxczRvMjc0akVIYzNCa3hCOE44ZUxhV1k5UEgrMkRmWFducmhM?=
 =?utf-8?B?bW42NDMxczdyMHlIRDBESCtsVmp4dzRpVEtqNC96WWQ5S1I0dDJmakZtUTJa?=
 =?utf-8?B?eERjemkwVVpOUzhnWk5WQW5TN0szemcwbWV6VVR4MjhQK3I0RkpkV1haQXpI?=
 =?utf-8?B?MmR2NE9rWGFwSElhYXJtSm9DTGlUQzhoWFV1cFQxNlFkVkpBcDM3dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2d56b0-fa25-4904-d784-08df2ac4ef18
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:02:22.3894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCmvv437WFCt+pa9Id9ADXagM6thDHN+CSeiLd2qT6fL+p9ADSni8OTR28asqjCdenzJJpkoWSQ6mQ1gAjAqIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5938

On Thu Oct 15, 2026 at 1:43 PM BST, Alexandre Courbot wrote:
> On Wed Oct 14, 2026 at 11:25 PM JST, Gary Guo wrote:
>> On Wed Oct 14, 2026 at 12:55 PM BST, Miguel Ojeda wrote:
>>> On Wed, Oct 14, 2026 at 10:30=E2=80=AFAM Lorenzo Delgado <lnsdev@proton=
.me> wrote:
>>>>
>>>> +/// A container that can report whether it holds any element.
>>>> +///
>>>> +/// The result must not change while the container is only reachable =
through a shared reference.
>>>> +///
>>>> +/// Unsafe code may only rely on the result for a container type whos=
e implementation it trusts,
>>>> +/// such as the ones in this module, since a safe implementation can =
return anything.
>>>> +pub trait IsEmpty {
>>>> +    /// Returns `true` if the container holds no element.
>>>> +    fn is_empty(&self) -> bool;
>>>> +}
>>>
>>> Do we need this to be a safe trait? If it is unsafe, then we can
>>> simplify the invariant and more easily think about the type, like
>>> other `Non*`s, no?
>>
>> I think in this case the meaning of "empty" depends on the container its=
elf.
>> Unsafe code that relies on "is_empty" would be the `NonEmpty<Container>`=
 itself,
>> so it just needs to trust itself (as boundary of unsafe is module level)=
.
>>
>> I think of almost all of the text above can be removed. The invariant of
>> `NonEmpty` can just be "`IsEmpty::is_empty` has returned true" and how i=
t is
>> interpreted is up to the container type.
>
> Is `IsEmpty` actually useful? It needs to be implemented for every
> container we want to wrap with essentially the same boilerplate code,
> which looks a bit overkill to me. Couldn't we just do:
>
>   impl<T, C: Deref<Target =3D [T]>> NonEmpty<C>

Slice does not dereference to a slice, and arrays doesn't dereference to sl=
ices
either.

Best,
Gary
