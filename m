Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021092.outbound.protection.outlook.com [52.101.100.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E293845D4;
	Tue,  5 May 2026 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979772; cv=fail; b=DSzVTUB1mIh8X22ZoB1MGiWNKx/z1A8FxO4uduSFEqVCDtej6U6QOdRZuqV8d6uLVclKTXR+hVeeG2+wWg+bnURMMLI71QEFnb5ixikwr8np91/19tWMOJbvgwf6CfreXhxR016tYKvxgU4GPJ5wKksPTEY5dVfJG442seYnOY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979772; c=relaxed/simple;
	bh=hM4pZfFuSLrF8tv7inHZ1ztUqxTfUjK00oDMzWkwkAA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=CdJ4iRyM/pSkUKlXfS/eTcOFu3AXMNParJ9KdHITtne76hHcLOhdOVox7exhpRbU0AMmn+S6pXolUAtcXqquVNJL8urOsd+aRt06kYY1MGCj9X9yVsljtLZJ3jCzMTr1m/wnUvSt4l3qGqeuUJrquddvIA5ITZj4Zgr8JjeTd90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GTltu0E3; arc=fail smtp.client-ip=52.101.100.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GTltu0E3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6OaUFA1ViQa/DGdI8VqT1imM/mhnVT/XnAem0VXHyA3gv89xHRIXANZCgs4NXY2EZ/RAZHqmOs2qGA2z9nVwMsdMLgOkl/yQWYT+xDB4YCRywzMvTxXzhuBrmYGjdaMwNZpP9Qk269dyyXN+hREbyMS/YiRcRhtFwHt/qyZiLU0DFcO0pCf4Wkb14ahdXaWGtjU1wJyVGvC9bK2FzynNYW2ZuDT5vYEXPzY1nQzmKIFlsEYZv5mipFelYOQwCSLQSNQriw807dRejNFAlcyK9WyVmcUFn94rj2f5aA1cWfm3FwTIyM4O7sxl9oQvvyRoWS1UPkBXBulsQsKtBYOGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7GsAFkGAbR61O7tm2TwwdERdu3jUZ9eB6GuMAzyyoY=;
 b=OYuRIbWn5G+VBU3k3+dzqvAXnmxo78RuEDoq8Sr05InYIJRHZn8enoAVFFs/vPKBSUVUTAmIOVjtPZqpBdITJJ5DECTbyMD70I4hktKWuplPCC65i/DTz87tTjBgsnLhb1V8Eu+Mve7CKOORdQWIodSct26+SEzG2zN15W1B3nzjyYyw6fCqENs5/sHBG22EuItpf2n0yFGQlRKO/zSMCfNq09NVI0f2FUwJM7hj/HhYiqoOTiorfoAD6iYy9WYKYNV4VX0IDWHpUOdBFU1jB57bPDd+nQCRAyH9bO3QTdph4gkrZO0lLaYAq2GnrFHQpE8Jfvj+T32c3LVfmsitoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7GsAFkGAbR61O7tm2TwwdERdu3jUZ9eB6GuMAzyyoY=;
 b=GTltu0E3FShoB7a6ouFA23allfC7AkCCipzajusGjzPFlkghek/IBxHUlDDA3Sq9l4E7q3Udw4Ly1gCQ/D8ZZnCs5hv51xU541FRyALkaqbZ4lj71f1X46g2dd1jeqJrUd0lTQxg019OV244lIpCyu8EKtPTnBrN41s3NaqUWsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2432.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:16:04 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 11:16:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 12:16:03 +0100
Message-Id: <DIAP83C37D9N.1US9NOU3ME7YI@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Linux Doc Mailing List"
 <linux-doc@vger.kernel.org>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>, "Trevor
 Gross" <tmgross@umich.edu>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
X-Mailer: aerc 0.21.0
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
 <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org> <CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com> <20260504222637.176edc7c@foz.lan> <CANiq72mk=gyGcQCL_DU4tKXN4U0rqH3wD7S04AuT4UGRFjCQaA@mail.gmail.com> <20260505020831.698650ec@foz.lan> <CANiq72=2cB_bDa0c1FA4aOMx8d=RyuNs_O+_72EiUurMAY+0mw@mail.gmail.com> <20260505074534.5fefbed0@foz.lan>
In-Reply-To: <20260505074534.5fefbed0@foz.lan>
X-ClientProxiedBy: LO4P123CA0206.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2432:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c6b20a-95f1-439e-d752-08deaa97b219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KNWnK+lxdwd3xXOHgyO2UZ6yLB4pgl71iQsNMbeZHfAyIFbJV+K7PPUHt32YGntk3BOJ7vmIXelu8MdrYljmN0b9qI7UJ2LsuFOtxMyLJhbUNWvhBZafJJW5mxuKF1MjR4APi47u3HvdgSBsb+FputTl0HGPG2T4PnUev8Dt5yWgiGXIQy7jrSvjdcr8MFjhC1JqC7M5PlQh35EcBUxgEDhF0EbYOOIkdEaKdrB1AbI61en28dAwA67dM07psVzMhCEfJU6qEEGS07UhP/9X1JPmzk2gc9PsNTkEUSvkmInXZHQe2NTm5HlYYJw0UHYXYh/LblZRmPLF8wKMbxNex7pQ/A1y8Vj/ciixczv77yvbRFPOlgcWtLuajl/SnDwORFZIwclp/NyFgxa7cFjSHGnLFczjjoKdY1WCsAAZdkMbcgP78HIvVW0W881BPJW8cxxqLa6dXLBGorzp5YCeFd062GYe3I8vkLmu9UQ6wzWpeoHQPlBkY639pKj73OxQBsr74Bm+G+FOR1OTTaymIYtU+J4dYEtbFhNIbKW8C3rd0R8+EvgYS+nPpm65CwQV944MDabvLHg28CV4RgqkTHiDgWpaNzd02Z6KRDezz7w0MVYyxAEzKgDF3UYdBlK5QYzxmYUQnZeIhRRHpu11unw482xk8qCUp4GEYgZut33iZLMfejWaA7u+lsE1vvw0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm9PQ3ExNG12QkRZRkR1R0JQWGwxdTZmakx1MHh3SmtGNWJWQ1JnVGw2R3FY?=
 =?utf-8?B?cVJXU0x0aFh3aktsZ3pUTmdhV0pwZmR5YmZnYTNBZzhQN0l5TnV2ZWs4VVZu?=
 =?utf-8?B?bHBVbDRvbTZPcGxEMkU0WHhObEc4clBMTEFURVhoNWIrWXdwb1hZOG96Ynl3?=
 =?utf-8?B?eE04a0JHV1p3SThSWmEwaUZQR0Rlb0FHU1oxcVpPdEh0aXhIaVBUdkxYOXhJ?=
 =?utf-8?B?UWxYbHIzQ1M5WHlzSEtiU21YVFFJRmllWEVONXg3UEZ0MTVNc1ViSW0yd051?=
 =?utf-8?B?MnJ2aWdVS3RZb1dCZEw2c1dKWkVJRVYyWk5kTUpnWEMxbmljeGY4OFVCK1ZK?=
 =?utf-8?B?SUphN2VKUW9VSnAyaTA1ZDhobFREQzVUTnM1YW1Gc2VyN21WZGNlRDJvRmtO?=
 =?utf-8?B?TzdldFBZdlFOMUpkNXFTYmQvOXM5YU4xQ0tQbmo4K2xlKzVrSW9jYWtxejF4?=
 =?utf-8?B?QkFRYmpRZitaSktUdEhXOHgyNHk4Z1JDOW5ENkZtN21RVEFFclhTVUhrSDhS?=
 =?utf-8?B?NkkveERiRFRzb0gydFd1S1M3cnVkQXNxc05oMWhtYndlczJZdTlJS0JTT3hn?=
 =?utf-8?B?K2E1YXhkT01jSFp2NEhvSVM3QWRHZk9DYjRuaWRwSWJZYU1SZDhQNDU2MGtM?=
 =?utf-8?B?UklydTBQS2dac2xCUmFFbjQxV1UwbExITW81ZHFWUzBYUVM1aUw0N2Jycnhq?=
 =?utf-8?B?Ymk0SThiRzlkRU9MUEozZ3VRa1lMbllzNXk1eHpXcU9Kdkdua1JveVVzTnZD?=
 =?utf-8?B?SkFGbXV4aE9aUGdzS0FhUVpzQWkvZUZjUnJNdStIMTZCaTdOeGtUcjhzb3lS?=
 =?utf-8?B?aENKVjM1SXExRi83Z0pNSVRpWjRiTDZBa2I1bUdZZVY0WU9xNmVuVDlKdmZ1?=
 =?utf-8?B?YW5XWGpFTXVjSmpZaU1TZGpJcHpjYytaYXphUDhTSmV3eHNpanFxdzBqd1FL?=
 =?utf-8?B?TVd1OVlidGhiUjduTE9tV0NoRU1zdyt6ZUZDVkdDUUlaZ3B5U0VxL2Uwbzhl?=
 =?utf-8?B?Mm95UDBvc0JWWmRiN0puTlhFbUs4cDFrYm8vVUpUZlRkMjdERytEeS9VbGRE?=
 =?utf-8?B?SHFOMUVOYzBwMEE5RWMwN2tod0JhRjR5Q0FYdjhNVjdQUHVKbnl2M2N4K3dV?=
 =?utf-8?B?UmwyRzZXbmNhSHBhc3EwRmtUeVRjWUdjeGNuYmNJNjZNYUdoK3BDdENaaUlr?=
 =?utf-8?B?dzdHbFRiUUI0MlN6RXJuWVV2RHBrdlVYdGFpNFkyUjVJVjhKaVIzQklLN1Jl?=
 =?utf-8?B?OWk1VGNmak5LTkpOK3NIb0d5b2dndnl5QThkV2FKMlVpVDJXOTYvMUY1U1FG?=
 =?utf-8?B?VjFFWUdPd3QxWng1TklOMjc2SmRjMkVwZzVWb3M2Y1ViMU83RndkUHRReHAz?=
 =?utf-8?B?WGs1TlZRWmFCY0tVYkxIQlBBSk9EZDkrekw3QkpZMkpWaXJnWjl5eDNnYWs0?=
 =?utf-8?B?Q3NYby9iaWJoVUVMRUZqLzRySVR1UUovSDMyRGYwSVFxbVJGWmFUR0g1djE3?=
 =?utf-8?B?aXhCVFYwb1kvWkQ5NW5HTnFmK1VJR000YVIxUXdzNGYxcjc5ZUVTTytlRFlv?=
 =?utf-8?B?V0NITjFHWHRLeGllbDJEcmNaME4vWVkwai9lMm1wckt5dHhKY2djaU5QQ2Nh?=
 =?utf-8?B?Z2VSWmhKMHFOdVJ6NU8wTXBSTGJBdGhoMit4TWpYSUtEaUQ4UkpSZjdjbC9Z?=
 =?utf-8?B?RnM5MllDL3pOMHMwdUhvZ0Rtc1hBZEFFaEFpbjkzVmZiNlVDdlZGS2hCWG5z?=
 =?utf-8?B?U0lvR1BlRDJNaWMzS3pIOUl4d2MweGdYQlNWL0kwRmxJODUxQ1BtQ3FDckxn?=
 =?utf-8?B?Y1R5dmE3NmwxWk9URTcyNkZvZmZRZjZ6ZHBLdExrWWZtc0VadWRUbFRJeVpB?=
 =?utf-8?B?SGdYaFYvbFdFZlYzbGtaWWNYaGVLeU1EMWlMcDhtVHFwb3Rjd0tUdkNyTmM1?=
 =?utf-8?B?aC9HQnYzZE5SbmwyS1hiRG5JVmdUMXFSZHducjdWQWp5aUFtUzRNVENrdGVK?=
 =?utf-8?B?M3RXRlVNbGFvcDNCSkxIYlFHcnZZd2paRGNkUWNiRVBmalN0VmhVRXJSUmd4?=
 =?utf-8?B?SXlESEtxMDdMVnRvM1BXYXd6SFhoRmVIbWFiNEhIRWJSVklmRUMzbmwzci9w?=
 =?utf-8?B?S2FYUVdUazJiWi9BeUc3QlVnYkhRSEtyTWdObjRydE1JL1FnK1NBeitvdTVp?=
 =?utf-8?B?bzh2NGdLNklGckpMd21pZ0kvRVdLNzlzdmZQNkFRWkNIenQwVEsyNm9zdXlw?=
 =?utf-8?B?T1A3K3ZVaWJQcEZSYkxMOXJjQUFlamVVL1J5V1YydGRmYzA5YzdHQkROUUNZ?=
 =?utf-8?B?OVlkZ2JHUFpBZjljeWN3eFptK0w0bitVNXY4YjNneHBHWmhEeHhFUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c6b20a-95f1-439e-d752-08deaa97b219
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:16:03.9161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HU18koGJtz7XCwVn1rvKEaQco/enF8N0mQih4grQ9fwMee9YzrfjGcyQgY898Drytry1Jxd13GFTcHCBVI97Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2432

On Tue May 5, 2026 at 6:45 AM BST, Mauro Carvalho Chehab wrote:
> On Tue, 5 May 2026 02:20:45 +0200
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>
>> On Tue, May 5, 2026 at 2:08=E2=80=AFAM Mauro Carvalho Chehab
>> <mchehab+huawei@kernel.org> wrote:
>> >
>> > Also, with time, maintainers may change their employers while still
>> > keeping their maintainership status.
>> >
>> > So, I'd say that whatever is there at the "P" entry, or where it is
>> > located (either on a ReST file at the Kernel or on some external URL),
>> > it should reflect the model that a maintainer or subsystem community
>> > that actively participate at the Kernel development agrees with.
>> > This should be vendor-agnostic. =20
>>=20
>> I am not sure what you mean. By "vendored" I don't mean
>> companies/employers, I mean that the file comes from an upstream
>> repository:
>>=20
>>   https://github.com/Rust-for-Linux/pin-init/blob/main/CONTRIBUTING.md
>>=20
>> Nevertheless, it is true that this really is a special case, in that
>> the upstream project decided to provide something that could then be
>> fit into the `P:` field.
>>=20
>> One could say "let's ask them to do rst upstream", but to be honest,
>> it is simpler to just put a hyperlink to GitHub's rendered file.
>> Markdown is anyway a better fit for their file.
>
> Ok. Then it P entry could be:
>
> 	P: https://github.com/Rust-for-Linux/pin-init/blob/main/CONTRIBUTING.md

If you send a patch I can queue it up for 7.2. Or would you want this to be
taken via docs tree instead?

Best,
Gary
