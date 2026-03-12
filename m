Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012006.outbound.protection.outlook.com [40.93.195.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB9B1DDC33;
	Thu, 12 Mar 2026 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323615; cv=fail; b=JPPbb6Ax07EH9zOa1cSm+DsF/q8R782dbHGsaM73/0ImC57ti1n8Qfda0KFBglMMHO9fbpKl+umRM1fG9BGZLkubIcWiGI8nxnEwZsNl2xTy+QZji45VhgL3QDvrPge3oLK884gRGEHeqixctBZ5Jdq9lc+vefSnM9fMEDLFZW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323615; c=relaxed/simple;
	bh=MDLWt089c2nPiyVZJ4xhk2nn2VxF/t43qBQKPIbHAis=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qO+VzPHZsar86ZwM+cFLVbMB5bMKEIekWsOTCbNXDFVGHV3yJdO9Mh8mOdEqcQ2LykJiH80e0bPCscyFrscG4JS9NcBJOLEjNtpXARaMOtGF4XLbOCVrJOgx7MnTRDEtlZ/Tv0FSISRhcezKJaw9S/2iQ75wPr5MPNDIL0QaiXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KdtzCr6J; arc=fail smtp.client-ip=40.93.195.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KdtzCr6J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiPE2pEZIJqhyDOgvY3yu/P42YnMgDixzTJU3meMwttVFqumxxbyrPrxcEzjFPisDrtXCoJKj+l+4jrNB5vdInJ1kYS67eWrTnQiJ4zkxadbe5s8OAYjelltaCP/e+IMoW6BjJYhbXGn1I/E/rA8TcrzOquIGdSYwFb8t65XN/ZrdoJuQ6hEttR1sYzBQVnNdjGDO9JSl4rDzEAK1ILfPW/P0da0lBLtr+xdtdKuRIU8EZZ5d9pb8bxJy4eVraW9Ex52eblXCoqPjg27B8LwgMm8Vh/6XPgT5T/UuiWNwqKpiFrVSxYRVcYS1fIKwQ7rROtFR6h+5GpDBlBDL2heLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ft8sn7ndVsCSHZdUfjEjW/4uO0jSexefHgqa7OplRlU=;
 b=W2IFvv/78SSa2t8f197X1Tu8g0+jzqQEWQaUCdtLBCLkor5J9rJ2kGUACxHn1SNFLWGPE0xbc+iObctrSB1RWqLuaHnIq6nJoFnFL4Z+iEBMI1B7HN4WMaGw8g+Ss5fm3yunTZ1xpap3AH0yLGBksBmMfUvL7jiCyoMxElOr/1FoxIwHOxH3VsUntfT4itnoER+f2M1b+04KRbdOECP2Thaf/y81brv1TLOpK+mWbwXjWp7g13dAq49rGNJQMJFhhfgXlk1edHFe8f35FAJrIcS3fJWFd0VFYLqNAnqkL7E4tvg1/n7ZyeBzv4fShou5k9C1irXbu8taTcM2xw5V5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ft8sn7ndVsCSHZdUfjEjW/4uO0jSexefHgqa7OplRlU=;
 b=KdtzCr6JEa6Fd4+6Wb3cZMmmXxz1c8X2Al/kqmK4v+ZnyQEbjV+R8gAz7++Jwz6Bk1mG+S1ohDJuc/+2/nVGvrIXo8VYGSlstO/hHMJWu8+lfCX+1e84IIZO7Xqm7ZtPovGjAgPe6pB7bFAphqMoeVgwh6K2PQdxrLRQ8J53loJmbbwWlQ/PhLGL6mXF8y3Z6rJSfr9mQsJsOvb3KgVSOVnzyB7V9cFD45+7fW9IeEhMRWYcf+8BQdM7poVCXg3v3QpGyBbwOhxgzm0vEvP2bKgxvfu8qVeIiIScANYmzVXCgHv+OhzgzA6y7//maTS5RTw+alntMe1T6GqrpkisvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 12 Mar
 2026 13:53:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 13:53:28 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 22:53:23 +0900
Message-Id: <DH0UR584E7YD.1A41R0UEVJK1D@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 07/10] rust: io: introduce `IntoIoVal` trait and
 single-argument `write_val`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-7-424f80dd43bc@nvidia.com>
 <DGZ8XPCCUDQ5.14RUPZWK8L509@kernel.org>
 <DGZZLNFLSJ4E.2P42FMI1XT47W@nvidia.com>
 <DH01GX7X7LSY.1N6WXIPLDCSTX@kernel.org>
In-Reply-To: <DH01GX7X7LSY.1N6WXIPLDCSTX@kernel.org>
X-ClientProxiedBy: OS7PR01CA0129.jpnprd01.prod.outlook.com
 (2603:1096:604:24e::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: f68dae97-bfbd-4c38-23c8-08de803ebcd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8+Y99ufSQZHSUXyl/fSRmNDOocRtXkomvbOSRQs6tuJYv608LNhfFaJmTM1uKMeHz04amJfz2NMjKmTV4UK1he0jdXldn6QtCzHX78QQm1rEY36BFWVPlQktagl5gp5Z1spDTvyUXJ31ZZlzSYnUd60f0ZsWKmKBL7paYocAiVV0dhSc07HnzGpKUsZ/VTNIZ821j1cIGLhUAzQrZq0Ww/DSTBOva1wzJ5PNbmFsaxI42dY16PdI5Keh1tNQcCGMqHZAINvvz5LpXWSD595kBTujcWIejcI74FAfGBMF7xShMNqPfXmyUBBzcqlN8/77Vv048N6gt6fnrUaxWXnl+pFcC1NwiulRxUs6ihZOEvmZ2sDo7bzFvSyIjBDrgMx1Bo76riZWQC7Z2GrC8TgggICE/LZLT51+hwXIB9olPVxustuHg2KNTsCRhBUYjjCbomKRKK+gaxdkhEfMAfpnEoYcabeHNxWxwxCn2tW5492zZyQiF01DoOOF/aXZvUgFA6LBhDM3lw2s94SeEs5r+yRu+IT0SVJijZG3tu8KXmnV0QZ9dtLrN6GtcfYhb6IH5h+rrYkdCAPyFbPqliKDJurjT9aOX/vvzLeYBbe+d8PIJCDsyXZTlIQP45QN/XVTQJmUuoqjAeJUGg+5c8uwdeVmrpFWtM9pEBKlfqhoeih2K4MDZCXUvK2tUTCLLZXnB+zjTJado6HcI5sI4rgh0MQO91nbQVJ/98xuLc7Emho=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2VMb1k0WE8vbjZxd0Q2SXpkenpjbWJES0ZlZHU4R0xZcTI5U1BUd2tvV3Ew?=
 =?utf-8?B?ZXdOK0E3QlBEblJHRUVGbFh0WUZSeTZLUjdXdFNjUzNKa0FPTk5UVzRzNzVn?=
 =?utf-8?B?SndmYkV5M1ByK0NRZUNPa20wZHI5TVdDOXJvd3d0QmFlOExkc2tjbllWcjB5?=
 =?utf-8?B?OUo0T1JYYWoyek02cmFCT2Rtc1dIRmxBTDlZQit4Z1JYV1lPT2RoK2lVeDBj?=
 =?utf-8?B?d0ttMVNvVmM1RGF3enh3b3VzMHhpdGl2UUFpOXRtSWt4MFBFYjFPZlllSTQ5?=
 =?utf-8?B?VVdMeTdqR1o5MG5aV0J1MVRVUVBNLy9DMk1hekRnNE9hQ3YrUGJaSXhRNEJW?=
 =?utf-8?B?UWZGblVLRHhVellnZ1orbXQ4eFB4V0FyZituR0xPaGtTQi9SWXBPUzB6VUlz?=
 =?utf-8?B?V3A2bnM5WmMxSS92VCtEQ2tIZ00vMFRRZlB2YnZiR3Q3b3pFRGIrVmZhb2Vu?=
 =?utf-8?B?YUhESSs3bGxzVTlFN1ZnY1prd3hMZmFCbTlqVFZBcjJ3b1dVTDNic2FJVlBu?=
 =?utf-8?B?a1dralc0aHgvUnlibFZpOVdHTDZjVExudE9XUlVmdVh3bm5BeGg0TDNrSHl5?=
 =?utf-8?B?c3EwcDFWU3RseXJlZE90R0tTc1oxdW9aVzdJeTFwc1FRcFlCWnpMMUJBcnd2?=
 =?utf-8?B?Q3BQcU5NQnpFWk5vVndsTEdRdFNsUWZWaGcxczRWOWZhTnkxWExERitKMjZ5?=
 =?utf-8?B?WXJ4bUpvT0hKaml0WHIrNDFwSmJJWmNHbnhabkRqTjRseXRRTlFCcjdsbGd6?=
 =?utf-8?B?eTQySDB3NU9wa3BGQmxUbExqZUo2L3JMSHhWZzhnUyt1NE9SZFVRTTFvbk9S?=
 =?utf-8?B?QmFmQjU1bSt1TkJIdzN5aXp4WVlVL2Z5VlN3aTlwUXRweGI3b0cwZFJTSHNK?=
 =?utf-8?B?YXlMZjB6MTBrcVVxb3Noa05TWkZwTVNNZWdoL29uMWxOWlpCRUNLRHY5NXZp?=
 =?utf-8?B?ckFnbWRWSW0zam9BZUFJbmtPa1E2eG5zVUdBcFg2MUl1QXNKdFczRW4yWlJU?=
 =?utf-8?B?eXMwL1g5Z2t0My9FTUMzY2VyU1llWHAzOXpvM3JLZThZUmlxa2p5V2p2QWY4?=
 =?utf-8?B?aDh1Nkh3SFE0eUN4Y0JCcVpQcnNMQkhjeEFnbk0wQUZLZ0VCU2pWQzBKdUlD?=
 =?utf-8?B?Zko4Z05tZXVjMVhLS3dIcDVscHNTVEkzdkc4TWY4UWRaWHUwS25CQmVFK2Rx?=
 =?utf-8?B?MWZCQUFYNk1ScXBqL1ltYUZGMzhKa2N6aytlcVNuZFFQeUlkd3hyRzV1N0R4?=
 =?utf-8?B?R2N1NCtCMjVhdEJQVy8zaldLaGZJMUl3c2E3SXNDRjErd2duTDhScVpPTnY5?=
 =?utf-8?B?SGZ6RTZib290NDVscnpScldBK2pYMTNTbXY2ak8zTnFlRHNVM0NzQVhlMDNh?=
 =?utf-8?B?Uno0V2g3bHBTT1VJRTRlRVVWZzl3RUpVU3FQeC9YSWhIMzZ5UWJqQzFHYnJy?=
 =?utf-8?B?TG1FNXJMeXRBeHdGWnlmLzAxaGdkZHhCdU5jcDZ4dEdtclBiM293MGNOd014?=
 =?utf-8?B?ODRrcDBhWUpiT3VVaERURjdRVzVONFR0dUNZUFZJUUZyRzFTZ09Gc2RDd0Nm?=
 =?utf-8?B?VDkwRUN2TzZqckQvNTk5L0s5NmlqcVFCRTZ1L2k5Ym9mN2VFMGFIdm1ScXl3?=
 =?utf-8?B?cmtYR2M0eGJtdzF0bFQ3c0oweTZORUZzWEpra3F6S25FdXRMK3hGbDY2Qnpm?=
 =?utf-8?B?bmpSeVRaMGhyWHoxenFmb0E2UHJ2YWF0aWFwZlJrUVpQZjd2MFhIRVhkVkJG?=
 =?utf-8?B?dHRWT0t1V3ZIU1ltbUN4cW8ybEc1ak1QazRPUzFQb2JKM0RmTjRwa0w0TDRy?=
 =?utf-8?B?Y1Q1VHBldzdDTFhqQTVVWmhoM0tOWXphZ0tzS3pZTXdHY0lZSGJFYkJybWtB?=
 =?utf-8?B?bWUzKy8vQURTYVRwWXVkL3FFdkphbTRKUkpQWlJTaU9sUC9LdmVWT29SR005?=
 =?utf-8?B?QkFyTEs0QlFyVFp1WDlLRFJvaXdBaDFEN3ZGajZqRnJpLzVnOXFLNmUvVGUv?=
 =?utf-8?B?VUhNNVhNNHFFUjhtSWd2NVlRTDhzaDJOT1pEUlF1eGZmak1GejRFMWRhT294?=
 =?utf-8?B?Z0YzQmZEdjM4cEZadDFDWU93OHo5aVRVcjdzd2FiMkxUdXVIbnh3MFBFeHRp?=
 =?utf-8?B?TitsdmNBcEQ4M21NdHZ2YVFjZmtnbEJvc0IxbWQ3ODRGOGpUVlFvQmlKN1ow?=
 =?utf-8?B?RVFRdCt6NTVjUWlvNkhSVzdXbGYxUFZjZENncUxnb2xKdHBpVjBhL2w3MUx4?=
 =?utf-8?B?dVIyVmpaZEZxZGx5eGYzTlNhck9leEZVb0xjc2QrT1JZSlR1T1Mrc290bnNh?=
 =?utf-8?B?R2JkQ3AwOG9XQ2xVdk80QjVBcU1DSjZiRUZoRGpZZFNtVjNValdWYUxlRHVt?=
 =?utf-8?Q?KQaVekQ4hO0u1cNOaDJvMQVU1QjjBF1H3NjncU1wIYzR+?=
X-MS-Exchange-AntiSpam-MessageData-1: 0VeT3cCjztkpPQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68dae97-bfbd-4c38-23c8-08de803ebcd1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:53:28.3672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMvK8ypVdTUcXP1AiWdzaPT1GpWRJdUNtv7TNZAXC+EIH95LyOxKugKAdvxga3FmZQV09IqlaVqdB3SWoXyewA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384

On Wed Mar 11, 2026 at 11:56 PM JST, Danilo Krummrich wrote:
> On Wed Mar 11, 2026 at 2:28 PM CET, Alexandre Courbot wrote:
>> The fact is, there is a symmetry between `read` and `write`:
>>
>> - `read` takes a location and returns a value,
>> - `write` takes a location and a value.
>
> This is not entirely true.
>
> read() takes an absolute location and returns something that encodes the =
value
> and a relative location, where for fixed registers the relative location =
is
> equivalent to an absolute location.

Let's look at the prototype of `read` (inherited constraints in parentheses=
):

    fn read<T, L>(&self, location: L) -> T
    where
        L: IoLoc<T>,
        Self: IoKnownSize + IoCapable<L::IoType>,
        (L::IoType: Into<T> + From<T>,)

It takes an absolute location and returns... something that can be
converted to/from the I/O type. There is no mention of a relative
location anywhere.

The very concept of a relative location is local to the `register`
module. `read` doesn't care about this at all. It just so happens that
register do carry that information in their type  - but that's not a
requirement of the read/write I/O API.

>
> write() works with both an absolute location and something that encodes t=
he
> value and a relative location, or a base location and something that enco=
des the
> value and a relative location.

Again, looking at the prototype for `write`:

    fn write<T, L>(&self, location: L, value: T)
    where
        L: IoLoc<T>,
        Self: IoKnownSize + IoCapable<L::IoType>,
        (L::IoType: Into<T> + From<T>,)

The first argument is an absolute location. The second argument is just
a value - there is no requirement for any kind of partial location
information.

It is true that in the case of registers, we can use the second argument
to infer a generic parameter of the first that is needed to build that
absolute location, which makes the first argument look as if it
contained partial location information, but that's just because the
*register* module defines this relationship between its own location and
value types (and the compiler is nice enough to connect the dots for
us). This is again not the work of the read/write I/O API.

So we really have this:

- read(location) -> value
- write(location, value)

Otherwise we couldn't use primitive types with read/write, since they
don't carry any location information by themselves.

>
> 	// `reg` encodes the value and an absolute location.
> 	let reg =3D bar.read(regs::NV_PMC_BOOT_0);
>
> 	// `reg` encodes the value and a relative location.
> 	let reg =3D bar.read(regs::NV_PFALCON_FALCON_RM::of::<E>());
>
> 	// First argument is an absolute location, second argument is a type
> 	// that encodes a value and a relative location.
> 	bar.write(regs::NV_PFALCON_FALCON_RM::of::<E>(), reg);
>
> 	// First argument is a base location that infers the relative location
> 	// from `reg`.
> 	bar.write(WithBase::of::<E>(), reg);
>
> And yes, I am aware that the above wording around the difference between
> regs::NV_PFALCON_FALCON_RM::of::<E>() and WithBase::of::<E>() is at least=
 a bit
> vague technically, but my point is about how this appears to users.
>
> In any case, the fact that you can write WithBase::of::<E>() as a locatio=
n
> argument in the first place proves that `reg` is not *only* a value.

But that is only true in the case of registers. The I/O module can and
does cover things other than registers - currently primitive values, but
we might want to extend that in future (don't ask me with what, but I
don't see a reason to close the possibility :)).

>
> 	fn write<T, L>(&self, location: L, value: T)
> 	where
> 	    L: IoLoc<T>,
> 	    Self: IoKnownSize + IoCapable<L::IoType>,
>
> Which is the reason why L: IoLoc<T>, i.e. the relative location is on T, =
not on
> L.
>
> So, what you could say is
>
>   - read() takes an absolute location and returns something that encodes =
a value
>     and relative location
>
>   - write() takes a base location (or absolute location) and something th=
at
>     encodes a value and relative location
>
> But then there is the case with fixed registers that simply do not have a=
 base,
> but write() still asks for a base (or absolute) location.
>
>> `write_val` is really nothing but a convenience shortcut that has
>> technically no strong reason to exist. As Gary pointed out, the
>> counterpart of
>>
>>     let reg =3D bar.read(regs::NV_PMC_BOOT_0);
>>
>> is
>>
>>     bar.write(regs::NV_PMC_BOOT_0, reg);
>
> I do not agree for the reasons mentioned above.
>
> In this case read() returns (location + value), while write() asks for lo=
cation
> *and* (location + value), i.e. there is no base location for fixed regist=
ers.
>
>> ... and we introduced `write_val` for those cases where the value
>> in itself provides its location, as `NV_PMC_BOOT_0` is redundant. But
>> the above statement could also be written:
>>
>>     bar.write((), reg);
>
> This makes more sense, as one could argue that a fixed register still req=
uires a
> base location, which is just always zero, but why would we bother users w=
ith
> this implementation detail?
>
> Is this really less confusing than an additional bar.write_reg(reg) that =
just
> works with any register?

I don't think it is less or more confusing, in the end they are really
equivalent.

What I would like to avoid is having register-specific functions spill
into the `io` module. I mean, I am not strictly opposed to it if we
reach the conclusion that it is more convenient to users - in this case
we could add an `impl Io` block in `register.rs` and add a `write_reg`
method (and possibly a `read` variant returning the full position
information?). But if we can just use the same 2 methods everywhere,
that's better IMHO.

>
>> which is exactly the same length as the `write_val` equivalent - it's
>> just that you need to remember that `()` can be used in this case. But
>> if you can remember that your register type can be used with
>> `write_val`, then why not this? This actually makes me doubt that
>> `write_val` is needed at all, and if we get rid of it, then we have a
>> symmetric API.
>
> Still not symmetric, and I also don't think we will have a lot of fun exp=
laining
> people why they have to call it as bar.write((), reg). :(
>
> OOC, how would you explain it when the question is raised without arguing=
 with
> implementation details?

This seems to indicate that instead of a `Io::write_val` method in `io.rs`,
we might need a `Io::write_reg` method in `register.rs` that is
dedicated to writing unambiguous registers exclusively. How does that
sound to you?

>
>> We were so focused on this single issue for the last few revisions that
>> the single-argument write variant sounded like the only way to handle
>> this properly, but the `()` use proposed by Gary actually fulfills the
>> same role and doesn't introduce more burden when you think of it.
>>
>> So why not try without `write_val` at first? We can always add it later
>> if we feel the need (and the same applies to a `(location, value)`
>> symmetric read/write API).
>
> If you really think it's the best solution, I'm fine picking it up this w=
ay for
> now, but to me it still sounds like we have no solution for a very simple=
 case
> that does not at least raise an eyebrow.

I think the current `read` and `write` methods are going to stay the
basis of I/O, so I'm pretty confident we can commit to them. They also
allow to do everything we want to do with registers. So my suggestion
would be to see how it goes and add functionality as we get feedback and
more visibility into how the API is used.

After reading your reply I believe an `Io::write_reg` in `register.rs`
could solve the problem of writing fixed offset registers without making
a single-argument `write` part of the core I/O API (and save the trouble
of finding a generic-enough name for it!). It's just not clear to me
that we should add this right now - but I can of course do it in the
next revision if you think the idea is good.
