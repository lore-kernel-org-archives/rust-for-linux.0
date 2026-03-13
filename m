Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020079.outbound.protection.outlook.com [52.101.195.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0343A6B80;
	Fri, 13 Mar 2026 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408617; cv=fail; b=AzoLYqguMuq8a4DYZFQ3niwy/klyx6rxbdmtd1yQuF26VgTkoUgWiNZpW0+dP9uMN5vnij2Kp5HHJR4+tZmlUJu02eezdY8lEhMHy/XUj/bRmpF89gRl9AjiyeqGVz+8xW8tZCH4aqJv9mdYQNwbz9uekmdv/xcaKAI/4N7iL6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408617; c=relaxed/simple;
	bh=IJ7Yet8LcFcCdMec3vVS8iS3CRwIVkS5S4FJwVQc3gQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PwzaoMVOkYW/CzxnKFufcpxyZg5WMrP2iywEIXmhtNFhUtbpfgCSHTOzJMEwEcILb5DV2zYR7n9dbAR+TjOfObVGqWxml3CIzGZ9wgJwEgdzSdzMM3wOf5xqQs/HBhCAPCaj5glN1dHVr7EC72oinxHZtBx6zQNai+yMlCQqy0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iduyAkEW; arc=fail smtp.client-ip=52.101.195.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iduyAkEW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1btGZvoixRxB+yHaG6x8U52a7r/TeD6phPeUl5StFqe8tZXS6ICeHHjwXagn2T3X3TB+uxy8BQHfgZ3K8ClNiFx+bONqEBO6ZuwUN9lItWO8URBcEBETD3d7+fbv1JKWlbYbBuIWXxzMsJLlJs6ze3BLG9duiVuhBu2p6LrcYlfyI+f1xztcQo5MytU2HlS9J7Ef1YBWISiD9K1+8tVbkJ1iAeDPaYDrJD2IhraYLyxdD2pdZViHqckiQNfRgGHfuWxZaA2uum97cKJ8yaNoKipsSuRoR61x7jtGxF2MyjAIe1jufBNm1GCd9wLQFab6iYhsC//bCPdEksLqqaNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXuyb5/v1V4GMKFpRjmDZy6DSxKUPfoMzYSrlmndfsQ=;
 b=WhYEJCefWmpRZuR1h/NomvZstMJ77AQRXgTNuHbWoE3MWSACFw0l7iUNtBs4jc6KO8TDWuIq3aZVF2KTegE+ydHeY0mfzVJjwEp0HWduqjAz3QEgq8O+rk6fchGerx6b8vKCPRK7T7za+zv6bWyF6sUYWsdOogiV7/Ro6n6W7QgGPGzSg1alWS1B2rudNThp+RfuSJdcHuZPmf1iTEw7ZbWE8eLlDYxA5jLiPP0MAg49vpj5kEar/SpTd2LJg4FtQvfnzHM80OMCCcrDIT9p/ILMwGtvP2XqaetGrRDEhZrXVufxfX+QEaCMJEwllnbvKLnOP/ac+y7cZ9m6fzYn8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXuyb5/v1V4GMKFpRjmDZy6DSxKUPfoMzYSrlmndfsQ=;
 b=iduyAkEWw4A7tejkoLjb1BhJOcDuYWvzAylK541eDj6InbnUwfUcNs22QJkMOY0LHA3ZU+3XAkSgkYaHuYDskA61zKcMiY1thWGu1sBguNmfRls2I8Y0jXLK+Zj0BcX6j8GVxnjl7658Fr/gKJOE4xKSUz5QopJqU9GdSXcMdcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2068.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:73::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 13:30:13 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.017; Fri, 13 Mar 2026
 13:30:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 13:30:12 +0000
Message-Id: <DH1OVXRNQYH8.2F1YACFDP80XW@garyguo.net>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Waiman Long" <longman@redhat.com>
Subject: Re: [PATCH v19 1/5] rust: Introduce interrupt module
From: "Gary Guo" <gary@garyguo.net>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
X-Mailer: aerc 0.21.0
References: <20260302232154.861916-1-lyude@redhat.com>
 <20260302232154.861916-2-lyude@redhat.com>
In-Reply-To: <20260302232154.861916-2-lyude@redhat.com>
X-ClientProxiedBy: LO4P265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2068:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d7ebf0-f403-4ebc-f843-08de8104a812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UmOsVBNPRXbbgB4an/J2DR7Gutx7jvjP85HwDKEPeg841/u/2wEjVWnCxNVRgdcgrVHQgoimdLnMrcfWWVQkZ2Xt8xYjT96ok8yuOC31BS9mUaARUhzTRVywT37q7KkMgu245Zye+jDW+Jov/m25iUxyCp8CLXXCdgJ42oYojWk2lxiNDAfTFi4H/eIfhCYRbFJMU9hoX/NdkQ1RacpotNR1js4bChI0SzfWicVLzDgz6yCXS357nZgKBuZcJVlehNn0+9LtDEA4W0RapcvJHfOvURHuvO548LEnwK/6zX4oXsJSfE9/8KDIkDjPajvoick1whiSzXgchkPMvsmydzHRhMMMU9oWmBw+OAolgbFQOHJZ5nWHuud8tm/HcbP5xiKm9rcONkx9+fcJNLL5pAYtuPGibNFyC6LUNj/h5E95zxKaiC1O/Kle5xTifKxubfKSiA4qxW5/XgBkQWS5P+w/JpKVkTYkntpThvUUOwBt2ZbfVhbt+QfMLesPnssygkLH0hgAWa9pz8RdZyly7eBvgMar6bapquFnDO6CvbIBxkeACsUVjKoPZn1irjaw7gfeJoR838C18VFkk27H9yL7HqnkjIRvO/tL+nYXQJ2lauAEktgQdRucmzAA5MfXj2i683sYgx57P7dmMJ9vxpUIZnQZP8uTXko1ES6v8Q16zRvZPPMpCKavkd1fIY/50H2qlAAhjdle33EZ4yweFm9bK+v0T3EeSTSANuBkgrs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFBMNUxHcVZzcFN4SlV3c3BGOVNwZWpTUGxTY2ZhTUkxM1VaQXd1SVErNzFE?=
 =?utf-8?B?Qy9UMTQxTUpxU2hkdU9SZHVUbkxkZmpkYXpzMWtNRXE3S0RLWThQL3k0ekNj?=
 =?utf-8?B?Y3VxSUQ4NmxSNlFGWnNSd0w3V0RrNmNqN2tpNHZKTk1WY2lxMVNlTlNNN2hh?=
 =?utf-8?B?bG5rT3p2ZzdTZnNVQithYzhiYUtIOG12L0tmY1phbUM1ZE4xYThwZFVYRnBj?=
 =?utf-8?B?ZC9QR29ydXpLR0YzN3FxYWJVdEs1dHk5SUJTZG8yQVdUU25LQ0V1ZmlyU3Mv?=
 =?utf-8?B?aS9BaEtiSzNnWWRDdjZ3bHlUakdWMVVWakFrWWtSK2FqWnpUY2pqUnF0TGZU?=
 =?utf-8?B?WnY0V2FrRlVxbEhZUWd0Z2JYQm0rcnNlS2s2b09TQ25YTm01ajUxRU9rSGpY?=
 =?utf-8?B?Zy9aeFQvZG1DSGIrWWN2STVwZG8yakNJRkhzTXdXVS9xYytjNnZUbWJKcm8w?=
 =?utf-8?B?ZnoyTkVGbTFvbit0SitzSDZYMjczNlVmend3NVpaWmdRVnUxSGh2NC9raEFL?=
 =?utf-8?B?bkdwbHdsN3N1RmNyZVlxdUphSjNPR2d5dWRod2I0WGh3YmFkTWg2MHZMUXF6?=
 =?utf-8?B?VE1BMnVDenRvZURYYk9abXU3Rkk1QWFIb1o4NWtDRmZRc2ZKUmgya1RCQmNE?=
 =?utf-8?B?NjdxU2Nqa1FCSjJDNjJGZnY2dHRQd3BLRXZXVGlXMkpYQXZ6QVhvdlFiQWtD?=
 =?utf-8?B?UGZqN0xwUXhMMmZFbi9MQVV5Vzh6TGgyZDlSenhFWmcydkU1a1pOeHJYNEQ0?=
 =?utf-8?B?aTkxdElybVEyWWlldVpNNElZS0kyc0dQakc4M3hvZkVxYjZsZEdoV0R0NGo5?=
 =?utf-8?B?bTNXT0EwZkthczlKV011alA5ZGNZUkIvQWdSYVhFRVI3UW5KZXI5M0swTFdK?=
 =?utf-8?B?cXM4eVFwTEVxeGx6Y3p0TDlTYWNFWm8yd3lkR1NuOEpkYUlQWWhaQkxhaHM3?=
 =?utf-8?B?STNUMC9oR1h3KzFIT2o0WFRnaXZiZmZQd1YveU9uYWVoZkdreFFwY1JqNVpZ?=
 =?utf-8?B?cE1lb1RzY0Q2cUZCSEl1S1doLzdxS05MbmRJVlZmNlNWb0VYNnJBS0V3SlBx?=
 =?utf-8?B?YzRyZXFxSlkyTis2dzdtcUtvWnhtUm54b3RFekNaOGFxVmtSV2IrTTBmdWRQ?=
 =?utf-8?B?TEhnR3NaRkZJeHpYYVNiekJ1QVl5TnN4RTNBMTJUVnJrYmROeUJsdHZNcjBh?=
 =?utf-8?B?cVZnRDVnQTZIdUt6U3dQQXFMN2JncFJUdUFpZTR3b0FFU1ZRMFJRckgzRnFQ?=
 =?utf-8?B?YVdmelRxeUZ3dGNtSjdLb21lNXFZcW9JZ0w1UFliaVBJenhkSzcxalRsNmdk?=
 =?utf-8?B?TzcwODUyRTN0ZlhhSStXb0JjOThBVnEza0lvNXFHd0s0WmdGTDk4L3p2VGZx?=
 =?utf-8?B?SWxQNGhEbjVDRDlWTWlkMnc5bDIxcUxZamJ3cXptcncvQ3RQSEp5a0pqVk11?=
 =?utf-8?B?TjExUVFtcHBpMzJRUEFNOTRScTFGci9LZXh4c0JwZXhvR3RGTi9NRVdIMUNx?=
 =?utf-8?B?Z0FFNVc4UElyOVlQTUpQNFE4TmZHTVdhSXNjTXpBVXluYjh2TlRSbHNlRndZ?=
 =?utf-8?B?VEJVb1hJR0NRRzJlaFZuOFVaa0oyci9Ea2VsRTgwaEpNckNpcUR2VlhlQldH?=
 =?utf-8?B?VDMwNXA3WTVaa1QyKzVOVC9TTGcxOVhHd1dSbFk4L2NidVUyblo4eWluT0NI?=
 =?utf-8?B?aEg5bnkyUldscTJ5dkZlOGI5UEFtSVhOOEZsL2tHb1k5S2xwZ0wvOFEzVmw0?=
 =?utf-8?B?SnJuSDVHZXpwZDgwUVY4d3d3bUpyMU9XbmsxMFdyQ1ppbGpINGZWdmFmQTFW?=
 =?utf-8?B?OEJJRzVXdFY0bVJlNlNydVFldmI3Q0c0WmZOL2t2SC9wVDBjcERLRnIzRXZM?=
 =?utf-8?B?cVkwWnBkdGczbnI4MS9EdW9sRllBME92UlE5UWhuOVhFU0kyVm5iditZSy9t?=
 =?utf-8?B?RThWNTJFaUE5OXV5YWNOc3FaS2pqWE5OcnBVK1FwZlRjRGZ3RFdMZXpvbUk0?=
 =?utf-8?B?WDVxb3Rxc2RSUUJxMGc4K3Q1a1QvUEdnS2IrR2F2cHNuREJ2T2lCa0xOeEM1?=
 =?utf-8?B?UzVmQjBYazVwVlFRelB3TFYydldrT0tMcVR4TEZOdHVlVDIrSTN1WUlyMDY1?=
 =?utf-8?B?MUd5UUZGbGQvb2IzT3JjRHgrTE9mV1RyTEhkeDhYb3BPSldvaC8yVXVoTzlH?=
 =?utf-8?B?S2drY2N5Rzg2NFVBMDlkRS9YSmI2WkFLd3hlcEM4NTJwMGlmMDRUZlJJR3Zy?=
 =?utf-8?B?Z0ZsK1dHOUVlWUlvbnBvc3ZNOFcwNXdLbVZtOHliTmlza3dzVHdkOTJ3SElB?=
 =?utf-8?B?M1RKWmkwOXpwU0ZxY0JqOWNQcnIvQ2htTHlPQzZCMXJnU1NaTXVudz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d7ebf0-f403-4ebc-f843-08de8104a812
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 13:30:13.3627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5u+eptiDLlOQ9OTp5y4iJ5OxmIczzzGdTHkAHp9kaJImDdrsd2IuSWiLW3ZDad21HOoamFDWRgSy41xC+ksv9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2068

On Mon Mar 2, 2026 at 11:16 PM GMT, Lyude Paul wrote:
> This introduces a module for dealing with interrupt-disabled contexts,
> including the ability to enable and disable interrupts along with the
> ability to annotate functions as expecting that IRQs are already
> disabled on the local CPU.
>=20
> [Boqun: This is based on Lyude's work on interrupt disable abstraction,
> I port to the new local_interrupt_disable() mechanism to make it work
> as a guard type. I cannot even take the credit of this design, since
> Lyude also brought up the same idea in zulip. Anyway, this is only for
> POC purpose, and of course all bugs are mine]
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>=20
> V10:
> * Fix documentation typos
> V11:
> * Get rid of unneeded `use bindings;`
> * Move ASSUME_DISABLED into assume_disabled()
> * Confirm using lockdep_assert_irqs_disabled() that local interrupts are =
in
>   fact disabled when LocalInterruptDisabled::assume_disabled() is called.
> V18:
> * Add missing __rust_helper annotations
> V19:
> * Use crate:: instead of kernel::
> * #[inline] all of the things
>=20
>  rust/helpers/helpers.c   |  1 +
>  rust/helpers/interrupt.c | 18 ++++++++
>  rust/helpers/sync.c      |  5 +++
>  rust/kernel/interrupt.rs | 89 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs       |  1 +
>  5 files changed, 114 insertions(+)
>  create mode 100644 rust/helpers/interrupt.c
>  create mode 100644 rust/kernel/interrupt.rs

