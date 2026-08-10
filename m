Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020100.outbound.protection.outlook.com [52.101.195.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBA8238C1A;
	Mon, 10 Aug 2026 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358304; cv=fail; b=rSkY8Tb0+dxDuWBXBnNF7OCtLOHIFMiab4F7VPNcZFf9YjUzGh5moTkivR+fzL2O3FsQGzJVssWQqN+JAnD8YJnCFQDGJm/8RqjEdM2ev7w4v0tXa72R6pme5aEp7H0pvX2mbdSZrZjRIW5WH6lkLTbP2vRQ1Y/Hznm8syWAQZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358304; c=relaxed/simple;
	bh=h/kfynOAqEpfDDcHLj/brFy6aT5UDzkVxX1Amk9yHrM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GsBGMBd9QEc20OSimchOfkT66/5O5gB8u4/TCwYojoyiKxH/rKycbRTqiL1/QHQMSUBBDUG/GyeC7fqQA7iXNTFsjVLsTd802XWxEV/HenSkqQtMcfyUSRgKCdsYTb7w7nghw7uE8wCDm7bHkR8dQalRcvvSxlGzxI+jb9pVVnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dLnv/Hxk; arc=fail smtp.client-ip=52.101.195.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dLnv/Hxk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hi8r88fsGYNqgAaNrhm/yltrKHVFjYEJyyV+c4ZavZ/DVeJ0HauNSwipkwLAKbgg1CJbJNNQ10qea/Xagk6kl4NIKOjVAbFtzCsLle+tWHvbpnMVKRR8eAFD7GhXjMXg97mCtTvjQJDz/CtgLAZWjFDNuBeLTeTtJEO8OAj+Vl8y/8B7Q7hWYGwljPKjtoLThwkck8oFLpVIYTtn5jekM7OBejyijut+mAiR6dxi46kv7+yUVD4sq8WC+gqvE33UdxOWG+IzYBQGCt94CO6XoF2oAnatCvzB1Ax0f5BRgsRopjORA1SADLHdCWAgKWHBzL/YOnYHDgJPxqsTMWvARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjMooHYBRFz2NlParB7bGrFSykUJH+p3DCKZCqZxfno=;
 b=NSKvFZnRofO7QpS0liMhX2u5/yz8+3iWaquf6qPjBBSg1ppJhPh3lD99WkR/u05u2ffq6K2HCxye8klZLa6+atwapGXuJ8H6Bc5MZBYKZ58Ci4e17fmSbwE80gAU7EePDG63iR7h/zZJadR9jJtYu9bv8e3scuwP/5uEDoFWqBZqD7o6jGkJZDE8DzlECUkpFqDncr8TTn6PxZq9jZI/DHPmzcuvY0CRsdzrX8p3wv9/K6yPtFgYhjFIAwBQNF0CW4ykpyqdVKwuuNZzMMgRz2kGqVSw8MTkwNdFuQysdFcdpPGPz1Gqf4/0+A2KcINsA/9bFI5Vvl57thx+DNU3rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjMooHYBRFz2NlParB7bGrFSykUJH+p3DCKZCqZxfno=;
 b=dLnv/HxkkRznBzTKVRfOB0AkbeNm45b6fWZw1VFPuo/YvOzVyW/OLnFLTZ4DxOJxruIVEJfSpiJY+MZM4kde4qT1UPgdLZr2kwY375WSUslFrFz3TEec4/T1BgXUihXZNQ3lzcZHQDXECFw1mbt4h7IIQsRkO2YLLEwdsCld0lk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5518.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:38:18 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 10:38:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Aug 2026 11:38:17 +0100
Message-Id: <DKL760LRQDG3.2HMCBRNTECXYD@garyguo.net>
Cc: "Ingo Molnar" <mingo@kernel.org>, "Will Deacon" <will@kernel.org>,
 "Waiman Long" <longman@redhat.com>, "Gary Guo" <gary@garyguo.net>, "Alice
 Ryhl" <aliceryhl@google.com>, "Lyude Paul" <lyude@redhat.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Miguel Ojeda" <ojeda@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Shrikanth Hegde"
 <sshegde@linux.ibm.com>, "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH v5 00/18] Refcounted interrupt disable and SpinLockIrq
 for Rust
From: "Gary Guo" <gary@garyguo.net>
To: "Peter Zijlstra" <peterz@infradead.org>, "Boqun Feng" <boqun@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260807070218.27144-1-boqun@kernel.org>
 <20260810085255.GE1642880@noisy.programming.kicks-ass.net>
 <20260810085355.GM49529@noisy.programming.kicks-ass.net>
 <20260810093006.GN49529@noisy.programming.kicks-ass.net>
In-Reply-To: <20260810093006.GN49529@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: LO4P265CA0171.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5518:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd6371c-7820-4043-3e8f-08def6cb7d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10070799003|22082099003|18002099003|10067099003|56012099006|4143699003|4133799003;
X-Microsoft-Antispam-Message-Info:
	BwnyePZAU1Z6WRcog8co+lBq3NcJL7TI3aaKIDUjB4O3bWJcGMObAzJ2xSz25mJcTS9Ik6yqrtqPAsdu1t7Qp2Bfo8meT5oQxdn0Dsd4/7Hbly4+1cS4PB77FZYjP5b7g3mv5MT387WSyjZXCNJlHTgR29N4UZBRmO+cBtR4KsrHb59Mnj1yrLQgk0FhnIfMfd2XbpKnLzPT3la3xM4DnlQpaUeQxHPW0yVrilLHHXlC4DT3vet5b6C7clXfuJjtY8L4ed2YBZ8XDTnM3Cft8IDqo3EoYoXdff2z2QN6/XDEm+X7EC2p66zgaaBsfshWQDBQqUOqNm+xyFTpaMd0YvuCHQhFRKwLUxZ0B3m0JPGoKm2rNUsiMS8p78cLHmzNy/RplddQDnAcG0EXT+EYxhN4zQnf0ipbJrF5fVTSugCMP9mI8DlDf1zn8KUKB3GSaa2YiJ1ZXqR6OtpYoT4AjJQBCtjeKhBYMc/z/Mg5ZRCfrHugx+IO2VtGYIpULk8OnOa+hM6hOiLekugk9uYKx6lEtoDX7PIr6Z33oz/K3ZApMbMg3+FI/fe17MT5ed/ALUXUNPVmG/vre4E64YK6dHgMhKnTo0h+c5tjZgBubf4PiGPYhD5/t+oCOKV17GjmbPnzUk+HibH/J1xPT+93RPhBKfdP1hBJS77gUkqLdtY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10070799003)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003)(4133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUZBNFFKVVVRM2JDczVKYjV4b3VMNVlHanJ5S2lFclRleDkwNTVHUW5Jc2tv?=
 =?utf-8?B?Sm9yMi90SEc5azVKZ1M3Z21VSUdpVXloYUVNaUY1SkhER3lNbkRIRFNNV2ha?=
 =?utf-8?B?RlFsb3VCeWc4TGIyRmxwSVVlMTcvS1hqY1RxWXZlMXdMU0RCV3R2ay9BQzd2?=
 =?utf-8?B?UmJYWkxPZDN6WmdWVFZSdHZGekRKR21CNjU2Y0EzeGd6ME4yUGUyY2ZMUFVE?=
 =?utf-8?B?Vlo1WmFESWRNakhHdmZOVUgxcm9pMG5vMTIyckQ3a1NRV1JnOGp2WGd3RCtU?=
 =?utf-8?B?cHBkRVU3ZUlubVI0enczeFFHbzhySUN0bzJWYkszYkF1RVhDRVVxWXgzZkho?=
 =?utf-8?B?UjhpWThpU2M5bmlSQVVKZHVzNEYyWThYcWUrUi9FclFadi9oc3dFalZpV0xQ?=
 =?utf-8?B?cFdSMGtEcjNGbjZZNkpqbEhrTDVWT3VJcWFycFpzanVFR3F4Tmd2UW9Od1pV?=
 =?utf-8?B?dUJQNWhuaUpVbU1IejA3YUdFY3ZpMldRNno5ZC9obXB2ZGdIb1ZmZVpaUDJx?=
 =?utf-8?B?ZHY3VkVSWFhIaEVscFIxNXZNaGZiRVVmWi9BTkEweHZkdWJZRzRGWDRBRVBT?=
 =?utf-8?B?NnZnai9va3l2OEdSL1lCK0xqamJsTUh4VnNjRkJITHNtWWxLOEZJVEN5M2NV?=
 =?utf-8?B?ZWJobGNjZ3dPRFZIMGpMeVRvMTN2bU5OK0NxWEZFK0dHN25oc2FDa0tBaVMy?=
 =?utf-8?B?RkpEQUo0d04rNW1iVGRILzRFTnM1L20yOTI1cjhvUlllM2JZNDVKRXFuNDhV?=
 =?utf-8?B?ZVRzY2hXNUwrRS8rMTBKWHIwN3Bockl3ZlZteW5LTnJaM1JjVHRKTTB2Q1lM?=
 =?utf-8?B?T3QwS3ZzTTNPVE54UjJlM1lLUW9SRDBtc3YzVC9odXk3N2toUVpERE05Wk9S?=
 =?utf-8?B?UmZRNjkwU04xVGFkRkk2eWJwYW42cVBXd2Q4czd0ZXVzMW5WQ0JxMUZLMFhJ?=
 =?utf-8?B?TEF4YXZidlFNb0MzNk1ZdGRkc2FUcU9ZUjBQT09DcjZ5RXhhamV2aGwyUmcv?=
 =?utf-8?B?TlhvUlRjKy9JYmJJMzBJTTNNZEZiMkVMWi9XSnJ0S2hBdTJhdGpieGhqamJ5?=
 =?utf-8?B?ckNSajJ4SzNLbTI1c1R2VGxob202Q3NIczJmaFZSVFY3QWo4QTN0VHVtenI2?=
 =?utf-8?B?b2w4RjZ4YjdqY2xDR0RVVlBRZjdzbE0xeHJhTzNySTdseGJpUjJWVU9VeVVQ?=
 =?utf-8?B?VEFMWVNCUFRXbXlIbURmT2VmQmZVbm9pam91Zk0rS0lsVDQ5ZURTRm5FZEVG?=
 =?utf-8?B?UEFBZnRHNWw1SG5kOTRYS3hVd3BLeHcwYmhlV1hlQkpwMnQ1TkFad0JGZHE2?=
 =?utf-8?B?dUphZWVHdTRrZDBVY2JzM0dzTGM4ejZjTDFyOHdYUFFTbDcvNEpHSTRlb3Qw?=
 =?utf-8?B?cWw1cDhLRDJBb0tPNk1zUCs2YjJRS1JjcGZQT2gxbDR2bm1JQVFpNkJFQ1lT?=
 =?utf-8?B?VWZOWGtXN00vMEJOcllxODg3UVRyT0tOZSsvOEJJUnhHcFZ2NC9XRHB0RzNF?=
 =?utf-8?B?dlVGU2NsOXludVRjb0tlRmF2aFRjdTgyc0k4Q1NiSVJUbVozN3loY1N3TitZ?=
 =?utf-8?B?VVkvaUw0MGRXQUtIVHJDNmZzQk01dlZ1Q1paa1NkUkt3V3B2Z1dSSG0zVS95?=
 =?utf-8?B?NFBsTVhjTGRnWHRFaUN4Y2I2YWllOUJJUWMwc2pMakoyVU9UVG8xWGp3ZFFn?=
 =?utf-8?B?eU9mcWpIdXBlSkdLOTdhdk54aXJmQkN5R1lqVXM4dmF0clNDYmt3YXFoVjd4?=
 =?utf-8?B?dGJpUDM1YzZDcGNVaXdlY2J5V3B3YVJ6NTRkcmdEdW5Bc3NsdXpWODFtSmZP?=
 =?utf-8?B?MWwwZXByL2xReGY3RDMwSFdKd2lGQ2xCMWJFS3pkeUtUVmJJSDFGNGdXdVJq?=
 =?utf-8?B?MmpIZGxQWklTUFVFQVJrVTRxVXRqSWVzeEpiRmtSVGMxdGgrWVJzb2VZcjIx?=
 =?utf-8?B?S3Q5dXdWeDdTK3hUWmVHYWVFbGJGcWozQ1NhbkNDSzRaYmtOSzF5MzA2aFdS?=
 =?utf-8?B?VndxWjkwM0ZaVzdGSlF0a3BjSmp6SnFxOGFpcTk0M25wVTdwR2VrYmNiakxL?=
 =?utf-8?B?OWlRczU0SnhUVFBFTXlPamFiMVFQT3lpY1BoT3RtTEJEMmZLdThnN2RhNU9j?=
 =?utf-8?B?YjIvRkRKUlRpbTArSUZNcUxYZVpHQW12ZEVOemJ6UHpQV1prTjBvZkZoSkxo?=
 =?utf-8?B?ZVp4MTdIOG9qTlBGWFBudEYyLzhHd29uZmRzUFlTRFpxR1RGWWwvVmh5YjhX?=
 =?utf-8?B?RkJLZGZDOXVWNk1oM0pnQzM1c1Vlc3lNOEh5LzhuaGV1Q2RnbE1iZmFPbkFC?=
 =?utf-8?B?aXp3TmtKMSt4VzdLYWxmVzI5WlVTOVpHNFc5cmloNlNaVnF0RlkzZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd6371c-7820-4043-3e8f-08def6cb7d77
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:38:17.8717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caNa4xDTfdNiEmbkAOQ4dtAaC//tBrxrmyDAsVSP+nF2kNEtTsgy4y2QvBmf2n3hO7/ndFHScA0OPf1dshNQtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5518

On Mon Aug 10, 2026 at 10:30 AM BST, Peter Zijlstra wrote:
> On Mon, Aug 10, 2026 at 10:53:55AM +0200, Peter Zijlstra wrote:
>> On Mon, Aug 10, 2026 at 10:52:55AM +0200, Peter Zijlstra wrote:
>> > On Fri, Aug 07, 2026 at 12:01:57AM -0700, Boqun Feng wrote:
>> >=20
>> > > * Added underflow/overflow checking for interrupt disabling counter =
as
>> > >   suggested by Shrikanth.
>> > > * Added a max nesting level per suggestion from Shrikanth.
>> > > * Document/comment updates.
>> >=20
>> > Can I get those as separate patches? I had already queued and tested t=
he
>> > previous version.
>> >=20
>> > (although as it turns out, I lost one SoB fixup somehow, so I'm applyi=
ng
>> > them again with just that Changelog ammended)
>>=20
>> I'll grab the rust patches from this set I suppose. I had not yet looked
>> at those, since I don't normally build rust crud and I need to figure
>> out how to do that again :-(
>
> So on tip/master + tip/locking/core (its fresh, so not in master yet).
>
> I have debian experimental rustc, which is build against clang-23, so I
> do:
>
> $ make O=3Ddefconfig-build/ LLVM=3D-23 defconfig rust.config
> $ make O=3Ddefconfig-build/ LLVM=3D-23 -j64
>
> and that gets me a wild amount of build fail :/
>
> error[E0560]: struct `blk_mq_tag_set` has no field named `ops`
>   --> ../rust/kernel/block/mq/tag_set.rs:46:21
>    |
> 46 |                     ops: OperationsVTable::<T>::build(),
>    |                     ^^^ `blk_mq_tag_set` does not have this field
>    |
>    =3D note: available fields are: `_address`
>
> error[E0560]: struct `blk_mq_tag_set` has no field named `nr_hw_queues`
>   --> ../rust/kernel/block/mq/tag_set.rs:47:21
>    |
> 47 |                     nr_hw_queues,
>    |                     ^^^^^^^^^^^^ `blk_mq_tag_set` does not have this=
 field
>    |
>    =3D note: available fields are: `_address`
>
> ... this goes on for a fair while.

There was a change in clang 22 that breaks bindgen. You'd need the latest
bindgen, see
https://lore.kernel.org/rust-for-linux/CABwQupNfMAJOGqRM9ke6tj4f53dCCsBDKU7=
Vp+zf8mwk7bqt8Q@mail.gmail.com/.

If you're using debian unstable clang/rustc then you should also get bindge=
n
from there too. Debian sid has the bindgen version that works with latest c=
lang.

Best,
Gary
