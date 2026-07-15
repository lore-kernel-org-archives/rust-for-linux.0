Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020092.outbound.protection.outlook.com [52.101.196.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D877481A80
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126308; cv=fail; b=IDgTkE1vMg0rYdzOrukHWNSkaw6v26YICbHbTFp83ljCpVEvXWjC5s6BN4OPuKdcsYs5A/UZYcsdcDhqPBfD6EqNDMr4+akye8wAKFYfwTWDUHKzsUPfHHOQOgbxG2CV3wb3Dq0VV+nTyz7RJbZ2G17eQCg5A/IZ3O9BQQF8Kfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126308; c=relaxed/simple;
	bh=8HhmH721mWZH3e9JlzrY7ncHRxqJGqnu0QA5G+8a9eM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VDpVj2qJ4XXTnLWGtJ1kcOx0P9x8N8IuSsyq3GtreNGVEmY4N8NgViMwiX1Ucw7+z1oJPzaeosNMZPk2Uyv8HzVZdtin3bYys64fP3aBP2zlibkv/oiYgft8HZhvYXj9EdImHwLZPWXnbB7y/1l8pUIhP/9EnVODu6lVoG+wYCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gS0njcxV; arc=fail smtp.client-ip=52.101.196.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gS0njcxV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+QTQwcLKB1vu+BIRtVnzHHrAvdwpuLlQ6O69deO0qOkzniIYIhWrdBnX2eooB45ydXhsRq/K9mmpaSc/FmcGJsnlj9maAO1ezOiUHhvOOu8z1gq5CFGB2GEco0EDa9VlcvAXVCu8j3D4HJWIVnnlNv5ncBjUE6b16Olwm5JIzz2yxk5LA6RcQVN2uPauaUZOn24M5WmEq8QxtqidWsiM3oqChTZZRL1KWNlt7sDJ7/8FJCLXyQW5ttMy11Vhl4dorIhABIYw+gpHX8zGDIXHvjbtNXEjEczvsqE5GpnXCBRew+fEnhv3gfllT2kUmAM+M7AMySlHBHYB8buuLUGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HhmH721mWZH3e9JlzrY7ncHRxqJGqnu0QA5G+8a9eM=;
 b=JAcEwMQ7Kj1it2tJuuDtqWLJnUm8AUfUL+ZnlAc1uGstRSj3R/vtqEHsEArzBM1PLyTM3fn0L6l13d4DhRFCdzJm7oMdpUtPhCcLpuS5MgCBn69fX+5QT2yBG3w/Nm0Vl3mHWH+6WjZ9BWB4yNWK0drOT8fdTOXq/EpvUt9qtnGE3Y3vguy3iMivMtAZL009cmtGDfZCrwnRiaszV5zeAHd+VyEtoOC8f5VKbECk2uuip4hk7cKZJfKPQzRE40xySkBKEOFthu1sMkw8HPrQlTGwd59qROOihQRkth/g2M0SHlzCSrCnsLvhB0hCEQy7ow90Bni6AoxYyLSt4GMrcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HhmH721mWZH3e9JlzrY7ncHRxqJGqnu0QA5G+8a9eM=;
 b=gS0njcxVZzNicXIWs4++xhoJA//wNbI5VdgNuHfsDVJwoRMYANEKBeNIXw8N+Xo82w6Jeh4TEfy8JH6gqDmKHnV5OZ0MQxy3uAH31Z+CYLRgrtE2RZmfX5e6nLjjzxyrIRnzsWyt7n5UPrDDyJEyfOSHiMJBm7Zmr77NpWwLEdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB7391.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:349::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 14:38:18 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 14:38:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 15:38:17 +0100
Message-Id: <DJZ7ZM736AAP.2P7XFVPGPE0I1@garyguo.net>
Cc: "FUJITA Tomonori" <tomo@flapping.org>, <aliceryhl@google.com>,
 <arve@android.com>, <boqun@kernel.org>, <brauner@kernel.org>,
 <cmllamas@google.com>, <gary@garyguo.net>, <gregkh@linuxfoundation.org>,
 <ojeda@kernel.org>, <tkjos@android.com>, <acourbot@nvidia.com>,
 <anna-maria@linutronix.de>, <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 1/4] rust: time: add jiffies conversion helpers to
 Delta
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>
X-Mailer: aerc 0.21.0
References: <qkuR2hizBbyuYmC9pigSGc_wAIN33sdtqV2v9CS9TjAP3UsxypcGi7F5_XXauq7AtTNawHIM2zR6awW7O1LsCw==@protonmail.internalid> <20260712235246.3069713-2-tomo@flapping.org> <87ik6ghha8.fsf@kernel.org> <20260715.212021.485543459172925773.tomo@flapping.org> <87cxwogywo.fsf@kernel.org> <CANiq72n8-=QF7T9d8hon82eQktyRW-_1YsCQwnLZaWmmcx1hUw@mail.gmail.com>
In-Reply-To: <CANiq72n8-=QF7T9d8hon82eQktyRW-_1YsCQwnLZaWmmcx1hUw@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0468.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB7391:EE_
X-MS-Office365-Filtering-Correlation-Id: 69428948-67ca-474a-3a36-08dee27eb612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|10070799003|366016|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kdTPAfmowjp2Xo2jPPOXalb5kEJY40MyWGD2F2yyXbXc59dJjCawN5q+JovM/ulerQGrTMq4ASrmpMyqvkJ7sKxW2f7mliZUmtFhO4GmBIaCkUBNHfNOL8KQs7PY6Y6Sdm8UHU0rB+vwtFciUeDKTFkBmFq3+ByxmVkW/PvYIMHpaKL9pw8BeyqJT6QvqoO0xQ5kLxqYLzRIM2B8+vLf8SDNfeHxiY9I5ruyp6XequcWnSufaS2AfULo4t3jGgnUvl4b+TOORuFVXmmWSBpF4dUqM4Efg25ZwNkg8VA9VPE69jNunUn0qs6KGXol6pV9g4MQ1UdParqziNKKeglGYJt0jZXiTakIxKt1bd1r/IFVJPwu+RAtaf/Fzbc4pCeyA51OK646GdGPUllfbIrPOJHN2QpdNAU5ITOw8CtkoK3PjngZWBeVKvfcr59NPvMCW2sg6+3mON+IR1+MOGkpowGNu7zyxyvjE+gnNS7P8SMPCKj6kgSghZguh2VlKIs4008SneDlor7pXJxuyVYOZjcg50BUXyn/tTa60aS5exqdSp9ryaHjUB4VqebE5+pq/mc852p1tDFy/326EDK2OmDnbTc0TK25azEA8VJhqhqW8+nXVwj4wabl9QSd1SLcuBuDSX9E1ChpyhLX+JZIVobHEm7w1jTXmj/eHay57DI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(10070799003)(366016)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEUwWDM1RjVHUE8rYUdQdFU3Qk9oUktLMnlQQmltWjNkS0NjTVhESm16ZkZk?=
 =?utf-8?B?eWVET1ZkdHR4N0p5UUs2cjZtWUdiZkZTdjV3ZDZIQ1N3RW1Id0NmdGd6eCsx?=
 =?utf-8?B?RDFoVXhubGhHZU5nQVVIdHNtY2RHMzhUQTl0N2xmMlY5aml0NklSUzRKa0NP?=
 =?utf-8?B?QWxBSjg3VUx0Sk1Oemt5VDZTMzkrZUZxZGlEb2lEcTRqTElIS3l3ck81SjNq?=
 =?utf-8?B?bUxUWnM2dFBFODlsQlpUZHcyVmJTSDlyRCtDVVRXcmVrNWljVDlqRkZ3RFMw?=
 =?utf-8?B?c0NNdU9NcmtRNzEwYU5ScHZYZzRPcVMva2c1YnJ6TmtNTnNVa0xCRkk1YTY2?=
 =?utf-8?B?S0h5ek9RQVNQNHR2RFNLQ2JlcnoraGJ4SENhVHVvZ1YzSVVXS1g5aXU5NE9h?=
 =?utf-8?B?L21wYlR3alRQV2FIWnpIRGNXU205OG5kTiswK2hWYUxReTBDNDczbTFJdUJk?=
 =?utf-8?B?dGs5elBhQ05ncnhVa2hOZFJqNHVJZytTZFMzT2QvQlI4RVYzaFNzcHU3RGRo?=
 =?utf-8?B?L3pLNGFzQ0VKZmdHSEVMVm1LdEhCQVRXZHZKOE42bTZPeFg1dndmbnArWjUv?=
 =?utf-8?B?RGNUeFczRnN1VkI0Y2dWNlpXMmg3WHZpcXB6bWFVTWhQeXQrRis4bnpwdnc4?=
 =?utf-8?B?eHg1ajhycTJFSWJ4OVdwOHh3bVVBaDl0NHk2enZDYkRleXkwYzkyMEJHeUdu?=
 =?utf-8?B?TGg4QktvTTNvZjFmUEV0QTBZbys4bDB5UTNaVEJ0Q09aWkZ6SzVEenoxT0d4?=
 =?utf-8?B?N2xKNWFPaW5wT3lQbXowVjZ1QVBRNlRXemRiMXVvUG1UZjMxc25zbTBwNHNB?=
 =?utf-8?B?Y095Q2FPNk5Cem13VjRCQmE4UXIrMHZETk5vVy9IZTNodXFHdndUSmZSdnds?=
 =?utf-8?B?aFYxQ1FkZlhQWkhUZWU2TjRRVFRuOEJKWHhFQmVwcGRvS1VBQzNwUFM0aThB?=
 =?utf-8?B?aWZReG5ucFcyeVBvSzJia29id01OR3NqdTRyYTVQME5pUUFhZU8yc3lWaktM?=
 =?utf-8?B?c2ZicER4UWJhamVYbkNoOUVjNytKQTRuTTdnUmJnOFJqd1RrMmVuSVJVWTRV?=
 =?utf-8?B?cHhQNGk3UERwZm5YaEN2cUlOMGRlWmNVdE02QkR4N3NCTlNYRzJOeDY5aWo1?=
 =?utf-8?B?dVRVNTM5Z1FEZzNuQWtXbHNLd0ZQeFdLNHQwellXZllwd0dMNEhmUmtlVytK?=
 =?utf-8?B?WXJKZkM0UUJwS2FiT3pFNXdxUjlrR091THN0VDRJTjhxaUZxenNnRHRaai85?=
 =?utf-8?B?ZFdVVDRKMG9SbDBKc3dTVUJacXdKZmg3UVlsSVoyYXFLRjNGK3dKaW1OVS92?=
 =?utf-8?B?OXRnV0FuNGtVdEhKZlJ6anZ3UlBUbFhHeXlTMHFuOVl3WjJzcmNpMWpoc0kr?=
 =?utf-8?B?UCtKN25mdHBLZUh1RCtUZ1FSSGRPVjZrMkZkckt5YkE3d0RzUTZMbEcwbHFW?=
 =?utf-8?B?ZmNDQzBrVDg2UXZ2bGorc1RmVFpPdHErU3FzUXhTUGdrMjMwZDczMDg5VlVE?=
 =?utf-8?B?Sy91bkVEdEdDTFpoT3N1RkMweUltczN4SzlHeEFjdDhPOTNENTBtM2dkTlhR?=
 =?utf-8?B?VkJFeWtuWWErQXBuR0JGOEVwWTIwdUJOMHp2ZStabkowWXlKYy9QZG0wdmx1?=
 =?utf-8?B?N09jY0NzeVNJZERkUVo4d1VmWjlvTUlKVXNLM0hpWWpKQ0l1NTFlVzJ2ZmdN?=
 =?utf-8?B?ejMrM1RGTXl1bFd1QTRRcHE4T0NmMWVYVUF5a2tvYzBjWUNMM0xuSjh3ZkNF?=
 =?utf-8?B?Wk5pMWxCcXo1TXhhalBhdWN2ZHlKbnpUWmVaV0lWSTZDakozWE5tT3R3N0JV?=
 =?utf-8?B?a2JLMmk1Q3ZzU25XU1dvUjA1NGtBOVBUKzNCblNSSmdhRHNmUzE2RkJKWjJo?=
 =?utf-8?B?OGNuTkxTalZ0dDd6QWdwS3I2aHBtdlJqdmQ0eDJtWkowcDNuRUhPNzRTUWRT?=
 =?utf-8?B?YmgzSFNhLzBVejlLeUtpZTFoY1RCSzVsaS9uYi9RZEJ0U2JEZW1OZ1c3djZW?=
 =?utf-8?B?c0w0aHIvK2RPUHVaNjBPZldsTldwSEl3Q3YrdUxLTWtpMS8wcGY5QnNERTNR?=
 =?utf-8?B?Mm8zOWNLWUoyeEhGY3lvcVhVYnlDNElkaTJrN09VKzFHUDhoaUdpN0RmN25H?=
 =?utf-8?B?Zjl3SER3NUhZNm9lS1JQdGVweE1tSi8wdmJrWk1lMzJNOGVGVm8wVHJINkRw?=
 =?utf-8?B?UHZWV0xBbDhlVGZwN0NtWWxpUEVVaStYVURZakh6d0dtUUNjcGxKU1J5ZlMv?=
 =?utf-8?B?VDNoclZFUVdrTE1JcHNhWGpKc2c0OXFBL1lUR0hxdDJyVW5BVitaK0RLQUJq?=
 =?utf-8?B?TEZUU1AzYWcwZkN0dlc0cHpHTTVYbjJhUVpXend5NVF2ejNYdENIdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 69428948-67ca-474a-3a36-08dee27eb612
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 14:38:18.5095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SMQFV2LDShIl3+t1n/W6t+dte8ebMKzMZPEwCpaKe/Xb/QgoiIy/l48lHuvM8dyZ9FuWz1ODzFIsPTr84/0Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB7391

On Wed Jul 15, 2026 at 3:22 PM BST, Miguel Ojeda wrote:
> On Wed, Jul 15, 2026 at 3:34=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> I think widening to 128 bits is fine. My question is why `NSEC_PER_SEC
>> as u128` instead of `u128::from(NSEC_PER_SEC)`?
>
> Yes, please avoid casts if possible.
>
> Regarding `u128` -- please make sure it works in 32-bit architectures.
> It seems like you are doing a 128-bit multiplication there?

This will also need a division when HZ is not a factor of NSEC_PER_SEC -- w=
hich
will be the case for HZ_300.

This should just limit the precision by doing a multiplication with
(USEC_PER_SEC / HZ) like jiffies_to_usecs.

Best,
Gary
