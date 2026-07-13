Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020122.outbound.protection.outlook.com [52.101.195.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52293F65E7
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 11:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943742; cv=fail; b=ZC+byBbP+aKkG+KWysai+TiOg6wnfD6SOhXitg5D2aZp2OkhlSE8NoJPcBJJirZ3Xp4t8P3EvcwH8LNWemZtzFgSreVYg606+mxj9QBiZZVQW8hWN2OVUC3CB5oJBXowDPn/YmxFmnBXDj0/NLt+fhW/+q8uADHULp5HCNiowJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943742; c=relaxed/simple;
	bh=ubv29Z32tfsHzxFmld0rwTfktKXKhL79dQ8Omm/0SMg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NddBpsPeXcARfgko6dWlKu8YAAZ7AGZs4ZUITkdNnqWNQmdkfM7/trqUrKLI/nWVS9/UvRzh8WZNRffY29KFryw3u6JfBhkar3cJoQiUjV/h1LKVZ/Zj2IfneowQ62VszddmmmTDMhbosq4gHrLJiQoTzoSZFiKdObwLBdsPPq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Y3eAficg; arc=fail smtp.client-ip=52.101.195.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Y3eAficg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8waF8D6PHiQXF5SmlPC2KVHS+2onP0dfNc4K2u9om9Bk34xDsV8ObPhYNPeOJd1gUoO+eyvj8Ym1N5N8zeur65nCyoBk0y6GLzKaMuZbpHIT8K3Hw/tpPtPt6iZ6sMruaA40c5+sasHjcjAow8mtUHmjX22jj929XFfdOeQJ+tv5wkZTZ9I0RalIApB2QtKh20aIgps62FgRrVdqt7QnUjUT5r2SmPS9qr7vuvqJ7fyYkBWnlEoNycQtP4s+NzK9dsauSuFrfF4jkFNzjFhWvzVwUWXdRZbeVcrpjGOmsbEsM1bCpoOlFlheKtqnAgBaqb4VRwVCGhXxC3E4Su9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTvo0NkMiMi3vBgcGjuQxzjHjlTuP7BCoL0Dka76+bk=;
 b=xz9tF0WLl/dMKpe1zoDSQsBeQciybxZoWHwNmq4MCPRWovOgy0MnHyAZ+FqAbsB65VW+P+47mU0ANip8MK7xqMavdDlndknau7Qq1zZqlngZoxqoirfy00pJ7uJ/dcaJb/4EiM4BUnADwWcl3MgFbsje1XETG6GP9xc93l73Wu+BYrgwq9aRVLnFa44aCGOMPxXjvMBfrcA06fU31mnIWRxD/IH7EPRk8SVeADBA+GsjXYVq+nbnPTykPKkrOxoTKEe6AKZ0jtHYL2oJRFLdHcwbVzQj3JZVC4WJUNxNqlQ+4bEnJBf64+IDkS4NVrcg1aeBLT9LVQjRLEPJSG7FaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTvo0NkMiMi3vBgcGjuQxzjHjlTuP7BCoL0Dka76+bk=;
 b=Y3eAficgj1Mp/Jk5y8SYmdlpYgo9F1Uc95t+vk2VIeL1BQjG0G2LZNfMjpS7S0OF0Rg4gcp2X4Y0gYP1YJHfYf4d0+LN3MmN8ZBPW8GlS4jqJ7laKG+P4GH/f038yhrBagTZuj9YNb+dYBo8egPMsqJKip8WtMIHU62ImfNE+xs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CWLP265MB3569.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 11:55:37 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%3]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 11:55:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 12:55:36 +0100
Message-Id: <DJXF9YNZ0JNN.WIMNJSH4BH2Z@garyguo.net>
Cc: <a.hindborg@kernel.org>, <arve@android.com>, <boqun@kernel.org>,
 <brauner@kernel.org>, <cmllamas@google.com>, <gary@garyguo.net>,
 <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <tkjos@android.com>,
 <acourbot@nvidia.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 3/4] rust: workqueue: use Delta for enqueue_delayed's
 delay parameter
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <work@onurozkan.dev>,
 <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <20260712235246.3069713-4-tomo@flapping.org>
 <alSpDAILCIIU4q7u@google.com> <20260713090732.115293-1-work@onurozkan.dev>
 <20260713.184034.916211318483609924.tomo@flapping.org>
In-Reply-To: <20260713.184034.916211318483609924.tomo@flapping.org>
X-ClientProxiedBy: LO4P123CA0636.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::14) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CWLP265MB3569:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2262d5-e92f-4ef4-269b-08dee0d5a72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|7416014|376014|18002099003|22082099003|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	H6sENIuVuyt/p41pxKAMaknZsZnkCPFXThN1esXddWGykCNoTGsf06CPtCGXXKRCEYyTwR2nnEQyrYKBxSYZhPPbzHridN5J2OXCtNQiosfxxVO1QR27CdVojpY/cyPC0thS1odeB7FafzAFx8KP3pVKce6fO8GSxCLybh4YcoMYfAZJ1tXLIzW/EK7v61wIupBG2oqtYh/iVrF2jjDA8GVYKzE40droLMCtrFMkJEI3mTj691z7GopjsrgV3djtR6fYzusQvfiTR3CAFVYZUdrEoU81Lxu0SFJGoaxFxgDLyNfopmlTBnbRWNqybTPnXac1ieZlzfeYgynFUsVC86O3N6sa9VRoS8gXLYHWE51KB3aslsznMN8fusXiruaOP9dgddgxtzuLlUOAyF+svOjux4yMHhgh2LUyZO3mM/RmX0utsr+PvHxKg6Wc+Y9buUaELyThIEsgGnCIJwokxBJN+G6sm8on0FS56WRXhd+E9gv1WrxbHX/VSNjVTZ7m/GbHiPl/XyTRJFgwQfHfMeYDugqcxTN/nW8q5DUVNTfZjXAp30qMJJIuZ5a8GUJ6MMHnhqiE6lKMFFUY0PQ4zCXL5ioQkngjJ3tEbcVZHnhMB6FGXxDm2WGllCB6XFnLTxIJYHz77pzb/JpDQYx9xL/z9gbgmGcmF6vT6CaiTYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1VJVEUzSVBJS1puM0ZSbG9wY0tmTDBFNG5qemVyR3lUQTd6U25wUlUydEty?=
 =?utf-8?B?TDJkenkwSUdvMTZMUmRzQ25NY2RJNFl1L2xUelozL01QNmVNZnpxQi9MMkph?=
 =?utf-8?B?VXBrUzRXV2NWclJqaGJvL1k4V01nNjAzUGs1c2FMd1JtVkQ2ckw3WFdLWkNT?=
 =?utf-8?B?YW5QWWNhMWowMFNMOUdYZFJNNGRZdnpOdXBZV0hHZHhZalFRbUNFcDA5Z2Y2?=
 =?utf-8?B?Z2psU2ZaSEFnS3BHREcxMEUya3pOVFAyT1FxSUFvV3hIS3kvT2VCS3ZFWXFi?=
 =?utf-8?B?Uzg5Z1ZaNXJRUjFWcVB0VHhNMzd6cmFTVW1NZUNnV1JnWVM5eTRYSk9BaW9m?=
 =?utf-8?B?aEhkVFYrZnFOTUFKejJudlpuRXJ0c2I3bFh0TmlTTU94T01DMUs2bm1wc1Rh?=
 =?utf-8?B?T3V6NmJzSEt0ZzdJdG94ZGo1NkpnMFEycFlUdy9VTWNNd2xES0hBa2ZkMUtK?=
 =?utf-8?B?b0tSQ0xFL2ZxN29LdUFQQTMvNUduSWpZaXVnV0lKWVVscXBDWENEZXhsMERj?=
 =?utf-8?B?SFRJYkNyZHFycjZ3KzlmZUg2K0JCUHp0OVMrWFRZRHNqWERGa2tUdDRWakta?=
 =?utf-8?B?L2dPVjdBcytDN0drQWkxWkdwNXJRQ0Z5bmFyTFhwazd3T0ExRmh2cHd6bzBN?=
 =?utf-8?B?KzZUSXN0aU5VZnd0Z0dRdHUvMFVGZlk2VC91MnF0VTd6SWhmbExERWlEODlr?=
 =?utf-8?B?ZFJ1Rm90TWpibFFZeGlqRnlEY1dwaDcrV2xVOUtJVWVkTFREMUdUMjVZL29n?=
 =?utf-8?B?MXhIZ05OS0JNbytrVXI0UU8vdWc3WUxUbzlLUHFEUGMrd2Rjd2ViN3pBWFg3?=
 =?utf-8?B?cVRteFNrZmIxY3BCZHhpMmZtU2hOQXA0TEFOWURQdThOTzhiU01SNGVwaDFG?=
 =?utf-8?B?L1NFYytiMDZET2dhcmpoTG5GRnlrcTl2a3liYzJFeldpRm02T3JadVg0ZTlN?=
 =?utf-8?B?clBTNzIvMUlaWnZESTloQTJQVFZ3dml6eC9NTTNObWhwOFAyanhXdGxYMXdO?=
 =?utf-8?B?azVmRlZFY0M0YXBlQlo0b05vbjI2RVFaQ1k5Q2hrMnJZYkFOaUR3SCswUkh5?=
 =?utf-8?B?RzNEU3o5MTNsU0Job25hVEtTSTdva3BoMUtIekY4TGx4anlkSWhxYjZlOTFR?=
 =?utf-8?B?YWE0R09DTFg3djIzZjJpNlFSY0Q3UmVqdDNwQWpYeDB6bURTUkRDZ1pDR2pW?=
 =?utf-8?B?dlRYSnpjOXo0V1p5U1hDR2dIVkxpb2tqbGJYUE9qMnJXNDcxY1pDZE9QelVN?=
 =?utf-8?B?blowOW15TXhUTFJrQ1RaODFkamlBUXI1dmUvUS94bk1yWW1hSVhSTEpvbVpK?=
 =?utf-8?B?bVJhNXBTQ1Jpb0VJNG5GKzVjNVVXclc4aDRVbC9iMHRNMVJYY3V2WVRzZVNG?=
 =?utf-8?B?M2hLZHUxMVEvTElHZ0I0dEV2SG4zcXBXclNzeGdNS3ZZMVVQOXNMamFwYVNH?=
 =?utf-8?B?Y05OQlNQNEtHMzJ5eUJKc0xNZUFXQ3dHZTJveG1ET216eTd1ZjRML2lrTk4z?=
 =?utf-8?B?Qjl1ZHJYNmtYK0FKaG01bUNoNEVDVVp6azRXNTNaaC92NEppVWs0U1pHdzND?=
 =?utf-8?B?ajVoVGRtUGo1MHp4Qm4ydXo3cTRNZnFKRFgydVhDRVRjSEFmWCs4SWpXZmFS?=
 =?utf-8?B?VEZrREZ5YmdFZXhHY0hkVHMvUFpGT0Y1WnczeWlmUnhVOHAzK2gxTVNaVlJF?=
 =?utf-8?B?aDZ1andvMk9yMkthSmdyaVAxeUFPbjBJU0N0WWpuOU02cGRvYXUxeG1LUVlH?=
 =?utf-8?B?Z0s4MWtPQnlKOHlFNFljUHNhVG1FZjNWTDFaMTkrb2J4SE1xMDBRZlcrMXY3?=
 =?utf-8?B?c0xkMU1kdTVtVnhjRFFnS1ZDMjhmMU9VSXBnYnNKMTM2VS9xc0xpU0gwZTl1?=
 =?utf-8?B?MkRsMkdGc2dvTk1oWnN6Um9mVm0xQ3lnZ1QxRGlsU0RNL1ArM3IxWlJqNnIv?=
 =?utf-8?B?UDBNSy9NUHdpM0wraHR3Ykc2dTZRWWJGMFdSY1JQYmJIdGdHeUNFM2hTVzYy?=
 =?utf-8?B?SmNDTks4b3lNQTdTN1Mwam1CWk1IT0NQaUtMc1FqK3pDSmpaVG9DOGZnOXhw?=
 =?utf-8?B?Mm1IZGdiZWJyOWFCWHd4dFBMQnFiWFBadHhpekxWaE5yZkJiS0g0Y0VXSVdh?=
 =?utf-8?B?ZzNsRWgrNU1raDJVaU1wdmpiVzV1cHQ3dE5RK0xJVHN0dHordXJtRTJoZ0tH?=
 =?utf-8?B?eXBmbGM2YmxjcHZwZGJMSEtHVXhEL2xBSVJKbFEvYm1vQ3AwdGFNRitIcnpy?=
 =?utf-8?B?eTk5NmZMdnQ1amZoS3R5dEc4amVzNEROR2FKN2srb0FCR2orQkRkOXZXZE5T?=
 =?utf-8?B?UDgwNW54S05wOHdzNUlyY2JaVHZOa0xNZUJhbXlEbGJIa3VvQ1h6QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2262d5-e92f-4ef4-269b-08dee0d5a72a
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:55:37.1663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EymLWvU5lDa42QSwgteKRUx9qlfBTPYSZ0MTruBi0pw9s8wHAMnfqDNayXWkUlhXSHPjgmn74Jclpb68utk05A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3569

On Mon Jul 13, 2026 at 10:40 AM BST, FUJITA Tomonori wrote:
> On Mon, 13 Jul 2026 12:07:30 +0300
> Onur =C3=96zkan <work@onurozkan.dev> wrote:
>
>> On Mon, 13 Jul 2026 08:59:56 +0000
>> Alice Ryhl <aliceryhl@google.com> wrote:
>>=20
>>> On Mon, Jul 13, 2026 at 08:52:45AM +0900, FUJITA Tomonori wrote:
>>> > From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>> >=20
>>> > enqueue_delayed() took a raw jiffies count (a plain c_ulong alias wit=
h
>>> > no type safety), so callers had to know on their own that the value
>>> > meant jiffies and convert to/from it themselves. This mirrors the
>>> > issue already fixed for CondVar's wait_interruptible_timeout().
>>> >=20
>>> > Switch to Delta, the duration type already used elsewhere, so the
>>> > unit is part of the type instead of a caller convention.
>>> >=20
>>> > Use as_jiffies_ceil() rather than a plain truncating conversion:
>>> > queue_delayed_work_on() treats a delay of 0 jiffies as "enqueue
>>> > immediately", so truncating a small nonzero Delta down to 0 would
>>> > silently turn a requested delay into no delay at all.
>>> >=20
>>> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>=20
>>> It seems unfortunate that a caller might be forced to convert jiffies -=
>
>>> nanos -> jiffies if they already have the value in jiffies.
>>>=20
>>> Alice
>>=20
>> Yeah that's not ideal. We can solve this by making the argument somethin=
g like
>> `impl Into<Delta>`, right?
>
> With impl Into<Delta>, the argument type changes, but if Delta's
> internal representation stays a plain nanosecond count, then .into()
> still performs the jiffies -> nanos conversion. Then enqueue_delayed()
> still calls as_jiffies_ceil() to convert back to jiffies afterwards.
>
> #[derive(Copy, Clone)]
> enum Repr {
>     Nanos(i64),
>     Jiffies(u64),
> }
>
> #[derive(Copy, Clone)]
> pub struct Delta {
>     repr: Repr,
> }
>
> The enum representation like above works? Delta::from_jiffies() just
> stores the jiffies count. APIs like enqueue_delayed() that uses
> jiffies time-unit don't need to do any conversion.

I don't think using enums is the correct approach.

Why can't we make Jiffies a new type as well? Then we can implement
`From<Jiffies>` for `Delta` and `From<Delta>` for `Jiffies`, and then the A=
PI
can just have `Into<WhatEverTimeReprItNeed>`?

Best,
Gary

