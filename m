Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020111.outbound.protection.outlook.com [52.101.195.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD7239FCC2;
	Thu,  5 Mar 2026 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772719554; cv=fail; b=I3KnMUxlNuESkABnplDC9LL57geyCFJXLOe3G24s7Ehaz+Vrl6zZMc7qqcINmB2WPNxOYvGVTf5NBTH0LayeDqpZQ1/0+4oeCPHeUVIR7QaswKgy7MziU7LafhcM5xOGAOMMQV60saMaQCgatTm5pW8DaV/qfCp/QL79qkYAkHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772719554; c=relaxed/simple;
	bh=rEN+Kz3FS6nE1pMCfu1NLFErZpQqKhy1iixjWE+Y8AY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=WIPVetish3JkV34Cse4joXySKkAAZwP+GmctsYjzqPSvOjHQQXgrDPp45I0Lfsp94H/1EUWIr/th+o7gKt1AZHAJ9A6qxatezOuu3XenaKGeBFmiAekzNhSQdWrDUSrrTYoBjfkY+ZTL7rD5HQmMC5ejUouIxGZlFZZUFbD4NQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FU4s52jf; arc=fail smtp.client-ip=52.101.195.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FU4s52jf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXtWDDQqgfO8eRErgkNLGB/zoT+3S3XkUVKT9wYZHVt5rkZ6fCfpnFLrpIsXVqvcp0Pl4oycxu72CoYvtliRsgPYvrXbT4gRV25uPFnn7u5+VOsAFrTlo/xMYl05WujWEmNCPnudofosgtFX7PAEZv9BJq/LXteJTdrhqx5pIcga79v2HN7marl35CCQBoKHLoXPRb8ezePCU7D9hp8WxMJP/QY4HSUQALCTFKPEptSUj0iNzt4Onx8n2vvPqInmQNwNoNWGe3FaYTql8M8P31z7FJusj5WjfcfmsMx/s1WnqGux8hEii6kZ+4QVzz/Qw53QNKAjGeXC4iBr6rS8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OK4AJMuo6hUidNwsq5l7x9vlq0SwlXiluScv/lfohoo=;
 b=Rv8anekgkm1wur9nHVFlebma1ibpwa4gHfuyURn+p4wyDajlHaRvkvsa+fHPvezPG5RGEJqRjQFwFL3pEMDG84Ja0fW1qDjnylq+9aMUhNYLYUQ1FTS+vskz1qzsQUceY/plsPvNm3jYRyH85jvt3ZaW8evJ8PVTWrovWOKBuMy0iFNCWcS4Rmd3CJhjc+ZHqv7iiVa3Mm9uuP5fVcXaNmlJ2rnKTt2l/0CPcTT/u+FrIW9kMM5WrGu4cFhclIqoce81sUl4I3u9kZa8SXUngA4Anz4jnkm6nhEOX89QJo2MAoJpqkW3NOKLNpFuBG7a+ghlU+dSMvb9XTkRwiT5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OK4AJMuo6hUidNwsq5l7x9vlq0SwlXiluScv/lfohoo=;
 b=FU4s52jf37XV+btDD+0BNDrFqez3OxEUf3/gldJlt7rAynkkGQaBP+mlLkZVAtgEDUkgrjloQPnE3jWnltqJhB81+Dlk4md/jSHWG91840dSRJ3Nth/1CWWcFrpBBnDT1ar8yvlLPVFMt/o6x6UfggkXJLavvWCLg8HOPY6YJAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6447.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 14:05:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 14:05:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 14:05:46 +0000
Message-Id: <DGUWMT9LMQ3J.15EB6M581ZKVC@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
 <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
 <282c94d3-f32c-4851-969f-61fc968de6a7@nvidia.com>
 <DGTYFUCCECHS.T8EW6ZPL8NZS@garyguo.net>
 <2fe31d10-733c-414c-9936-2d892f2a4186@nvidia.com>
 <DGU8CN7OXXB4.1S5OOWY9GNRKJ@garyguo.net>
 <3ff4588c-1322-4723-bb30-9049d0b316d6@nvidia.com>
 <DGUGFGFA7FVJ.297YIFEBLO3SH@nvidia.com>
 <22041c9e-1eda-4273-b5be-6f277dec4a4c@nvidia.com>
 <DGUNQN0P5850.3E1UV2JK8WJEW@nvidia.com>
 <DGUUKFDDA1O7.29K9XVJRZV6BN@garyguo.net>
 <DGUWID9C75CR.5V8H58RTA0FJ@nvidia.com>
In-Reply-To: <DGUWID9C75CR.5V8H58RTA0FJ@nvidia.com>
X-ClientProxiedBy: LO4P123CA0075.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f3d94fa-e3cd-467e-0646-08de7ac04cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	F8m7Rrr4sndyEG1jVC5lvA5DwwRAVB3mysCgnqb7lVfYkXV3RYQZLzf2rs55LuwZjY27pYZ3C9FHU0w+i8haWF2pMXsK8fLenHY1OPbez0sjhv2VTP79ON2pvf53SgD8Y0RSg9LNKuoF8DciD3sKJh3huv1lUk1K4Qc7+uJbcgrPyXITjXZC8w6PJggh9uP/oeKjXlxcBrJpfbS2KgNj9cqYlrpgTpafFo/A3U+DGlXR42W0EkBZiEM0lOsqLQd4SZ5Hgcs95RTmNIk28dBXB/vyReA45cffjvDItoVNNsn1d+SYIfynCKTHznKF/56iVgU83Aa4XChtpIvA3h9gHxKDszU5mSAn4e6TXEb1uIecv8t4kKu+BmejI7Z6LOnIT0R7C0060BTmxweAGUxRbv/hGE/s64flD34QxYPm+HWlsbnHRN9O+DD5pASDGRE79L21bSF9T2yLnCThNKFLelB3wBa1LdgzFWBzsa7YLHkR2F+DUCup9SWyiWDmGGhoE749ZPallM8U3NYN0NaXkHmhSryucvyHJtJH8skVENQvLeKMPDDuh9RiXwRieUQ8XRW5uT3xRHJWRjk8TeRoYfLCFDS0SkmpeslTPpca6MeB8BoEvAYCWHB3zkld5dYGC5Cy2Y/YMHpRybkF2j5R/ZSZPyU2sAdf5hnq1gOu5jnrrlyOUvzMp8FqNbih183oyK1BNDbqBpvF0VfBuylDKLOiK2H5F22XW0KfZV43a04=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWo0b3l3ODRNSXV0MzhDMnA4azRSYmUvSTQ0OFJlZ1VDZExqa0E2SWhKR3ly?=
 =?utf-8?B?VnJPK1dMWWc5UkpBK29rL2xXS1hXRVQvVmtESWE3T2NhVmN6eDJZSUNVWUZk?=
 =?utf-8?B?MDFTbUc3d1dZQUpzSWhvK2ZvcVZTUE1rbVh1WlNKbmcwR2xKK2hxb0VsSlB2?=
 =?utf-8?B?ZmNhVWp5UzI1RGtaNlE1VlY5dGFOSzhHOGR3S3ZzMnZJZWlJL3haRmhUaVlm?=
 =?utf-8?B?SEw3a2tXL2o3Z3dOZTFNd0JvdmU4N3FaZndjWTQ5ekFUK0F2N05UaUpBUnAv?=
 =?utf-8?B?L0xpVjhYTXpOSjh5M2ExVzg1VWppRmQ0VzkzZkdlSUlvSkxkMW1mTVZUN25Q?=
 =?utf-8?B?VUR5SzlMSTY0N05STmRTQW9YU25GQndxVnBzVWNOYjZmY25QRVNIM2FGVHhj?=
 =?utf-8?B?OFIvb2J1Q0pIUDVxQm9WYXF4RDEyRDlyT1YrN3lpdzh0Y1NFZUF2Ukt2OVoz?=
 =?utf-8?B?bG1FbnJFKzhqMjc4YlZGNWhEQlVYcHJHYUF1UlQySGR2RklZMEE0M3dGYXFQ?=
 =?utf-8?B?bGorRDRMaFpWRkZVTk5ZdUZkOEJKQ3ozOWQxRWFBU0ZVMzFVbC9ZNzNkdUxO?=
 =?utf-8?B?bFdnQk9zMVcwTUFyY3ZJY1ZidGxML1ZsYi9aLzFaZU9Ic2pOUzVybW9WWUZr?=
 =?utf-8?B?RHRWYzQrSHV5aEo0WlBRa1lYT0JRZ081WUo1RXZjaVIyZFppMysvQ0FsNEdq?=
 =?utf-8?B?djVFVXBxRzhMdnI2NGszOTZxNlc2OUR6aFlVUGJiWXlGTzlURzBZSk5DRk1a?=
 =?utf-8?B?Q0J4M042TnliaHlkS3lMS1FpVy9WcmFsVVkydnBLenNTS2RJZ1ZCd3NJV3h6?=
 =?utf-8?B?dURFMURCT3licjgwSkEvVFVFZklodVhNTVF0OTZsVklZM3JHZlIzdlNtQU5X?=
 =?utf-8?B?QmE3eGE2ZGxmbWNGRFFCZit4dDJpTlM3ajNmWkI2T2czWGwrOGhBeDEvMjN1?=
 =?utf-8?B?aUtZV2d5ZmJ3Q0RYV0JmRnhzTmNTNHZxNnVtdWZXNzk4T0JqTEZsZzBteEc0?=
 =?utf-8?B?ak01SHZZWjBrTUR1NUlOSzFzSFFiNHlUaXhyTUNZOGhuOVM4bFJpRm1OQTY2?=
 =?utf-8?B?KzVwbXNEaWVPWUQxc0dGVlUxZ1ZRVVFuWE8zSDBsZWU2ZjBHOTdHblEzZTdl?=
 =?utf-8?B?NitaVUMyN1VySE1kQlRtQ2dDOTVKWmFWOG9ZZUJoSFQ1QW1vNitUTXE2djhu?=
 =?utf-8?B?bENXdWxDM3B5eFRpTkxsallVSVEzbjNybXZkQ1JkVElWVzFObkd3Mnc4VVFI?=
 =?utf-8?B?am9nWlI3L0NmWlhnZDI1N3AxZTQxVnlJbmZsdmFldGgxMlJVMG1SWVoxSnpn?=
 =?utf-8?B?SVNuMkFFQmcyZU4zNUtBZytuU1d6TTYrREMvWGxUeU5mMDJmRnhib1NUK3RF?=
 =?utf-8?B?R084c21ONi9OR0NMMVZEbG1RMmhUQjN2TXVPbWhqMm5IaG8vUHhQN0srcW9S?=
 =?utf-8?B?UWtYVmEwT1dHODlsYVgzQTByTGxUSmN3MXkxQUROYUVva1FIY2NqZVNOUEpU?=
 =?utf-8?B?Nk8vZy9wcDNSUk1RN2lQR0RvdWVLckJYOG4rWFlQSGR0eTNuUlJrVlZQcTZq?=
 =?utf-8?B?RWhwanV1QXlCUlgyWjhjTU9IOGpjV1NyUlpTSXJuZVc5UFJ4c0R6Q1UrYTc5?=
 =?utf-8?B?OUQ5ZkhEYXBydTBCZ3d0MXcwRC9LcHJlM2t6VFJBYkIrZS9MU0N2a3BLY2Q0?=
 =?utf-8?B?OFRORVB5UW9ZalJPZDZrN2JibnBKQjh2Z00vdlJlR3F1eGdIMFltbU9TenpV?=
 =?utf-8?B?NThJM1IxQTZkbTNvYVNXTGtKK0RGMmpUL1RjaFpFOEhzTm0yaDZFUWVSNnQ0?=
 =?utf-8?B?eDVpa2Ixem5tdzZDY2I5Q3NvcjhqMEpjRUZicDBPdXNQNGdmS3FkYitKRUNG?=
 =?utf-8?B?UlRRdE9tRjh0M0t3ZUdHeWJaejFjcVhxZ2RycFFVbE9GaFZZMGl1Mi9DL3px?=
 =?utf-8?B?U0s0bUlMYVBjWCtQc2xBUS9XNllXMnJRejhXUFJmb3BCUWNDUmVacFRrby90?=
 =?utf-8?B?YmpQUmlONWFQYjNqNzE4V1oyTmN3a3JWdFo2ek5BWkxLSTcvS3MzUFRTaC81?=
 =?utf-8?B?TXdFOE9BODVOeXFZSDZaS3NDRDdWc0R4K1k3L0dVbDYyMmE4UlpDUWFZVUZh?=
 =?utf-8?B?ZHNCdmN2RzY1a0ZrSFY2UUdtc3RlZW9JanFUQ1Z6d3FqV1RPZVE5dXdHMm9y?=
 =?utf-8?B?THhxdml3LzdNZko4cFJWSmtjcmIrcmNEV2VYRG51UHZEcGx1MGFPVlVsK2RB?=
 =?utf-8?B?V2NOa2ZXcVpES0VPRFV2M1c4eUxZaDBsbFlnQkpsY0k0d2Erck1NWW8wRXow?=
 =?utf-8?B?QjF2WCtXWENrWUpoS2s1VlFrNHo0NkpaMUNWN3lBL25LYWtTNW5xQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3d94fa-e3cd-467e-0646-08de7ac04cd1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 14:05:47.5150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FesGkOOkCtcAfF8s/4kfyBZlyD0MahZLS7wzU40oYJ+qbGh3WdUWmrIxqH5HWxeSDoEWLYiDuDOsD1wRjDSF5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6447

On Thu Mar 5, 2026 at 1:59 PM GMT, Alexandre Courbot wrote:
> On Thu Mar 5, 2026 at 9:28 PM JST, Gary Guo wrote:
>>>
>>>   const TEST_ALIGN: usize =3D const_align_up::<256, 10>();
>>>
>>> This uses purely const asserts, but you have to work with two `usize`
>>> arguments. The version below looks a bit nicer as it leverages the
>>> power-of-two invariant of `Alignment`:
>>>
>>>   impl Alignment {
>>>       const fn const_align_up(self, value: usize) -> usize {
>>>           build_assert!(value <=3D usize::MAX - !self.mask());
>>>
>>>           (value + !self.mask()) & self.mask()
>>>       }
>>
>> This is fine, too, although I think just returning an `Option` and ask u=
ser to
>> unwrap it in const eval is better.
>
> Why? Aren't unwraps something we want to avoid?
>
> We already have fallible methods for non-const contexts, so why give
> another method that essentially behaves the same when we want to use it
> in scenarios where we know the result will be successful anyway?

Unwrap is only bad when it can panic. It's not an issue for things that is
apparently const eval only, e.g. inside `const {}` or `const FOO: Bar =3D b=
az`.

Best,
Gary
