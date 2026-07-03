Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020074.outbound.protection.outlook.com [52.101.195.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458F91FFC48;
	Fri,  3 Jul 2026 14:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088676; cv=fail; b=clFTOQEs7Fjwiwsaq8o4wLFS5hAOfhSbWIUKONz4juMx2FLj+2SkWfzR6qdQP2fz/FS9v5fVb2g4u2c2mtXFdBQO5CD1iQkBMimdAEhZRq6saR+cQLhQH1zsOfZoY9BgPrF0fUtkwuT6B07mB8g/Jz2I2dNSlaUomMxVcUlS9V0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088676; c=relaxed/simple;
	bh=yorPxRWOXdhg/MNBkSM4Ekt1xviCucMIq57VG7WwwJ0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=UnRhXNqrAdG5V3aDxvhpThnjZJIeWrfDizpNKRk+y3ZeihQAammR0EbBIPJNANyH3gajBW+HYbpPJe57fuCvwnzL07ilXni4sqvRnPFe8ax+6Czga7QdwPilqimjZ67OHHJZHvdJleay0ZM08StnX8oitk/uASJgB6Wx82DVKSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=d4UmWcKB; arc=fail smtp.client-ip=52.101.195.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="d4UmWcKB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phTbJrSXGapjdmw3mcXXm27V9JJj/ZVVkJEOPCaVbseDkiJh6Yr68nIH+GxBQRXK+lvMqPm8k+5ctBCgf5wKKkjA8VbpEdtabyIqPUi1mzDpR6kXktyu8vlXvQnWSI+cfXz+b/wOlWDg0oLJnK6czWwC0LKkGVLhmR30tPP5QHOWu9YDRUUciserCVijXV4JGJ9zYaaiekt5oF5LTDY52/x9ljp4M1KC48WJLuCZROfwJHZic5im6rGAhk4ZsgUg+j0o8tV0gfmPMIJFDti6kQxx+rmdLqofv6ZzCxvnUxfEQqmvTuJbs5ziUzxqWxkYIYP1X+yjNPDatH8/ncUhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xq71zzd7x88UuNnIufAUdSzXZPFJ+WGJxL3hMQd4zD8=;
 b=LrgFaF0vMTag+VMqhzGcGtlUVTssAKBrtrsZS1Rg46My2VJhe4ZN9yW1rYWtVtP3+5DzH4l+lSNFy0zWZSEQMea4pxfroILshqETuvzz9iB8HvCKSFXwHsvQT5rGE5U1FHNlnqjJFNbW/DPoOWVpV1wT8vHL657PMiwEoPj3Jg1DZAaI2tSXkCQFtNmSbG6mqqAJ53qHKP7BrJBQUrBwqCTmaUiBouDqc6OOJ0CRVhlX4Hwy4ZUsx9ubM7ZUZY73VNN4/NSyLXV5cjc8sTGQmg0sXUxN/LJtoMkPHC/Iqcr8ViPiNPxAaXpcpwjVz31/xTWWWDVmLLGTiIBJSZKNEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xq71zzd7x88UuNnIufAUdSzXZPFJ+WGJxL3hMQd4zD8=;
 b=d4UmWcKB060eKEvZ0op3Fpc/N9tGXUSmHSr2Nolqo5o4nqPNGXPjLKcLfpd/6Qf1aUa1Tx2/1EpDAlcpQqoNJFTFVQ8sC7wYEV8f6yycaDb/w4uMj8zC0L8O7JXM5DpINj4P3+4/tVLYFD/c6xHKYJRHvIAJRvaFkbPesFW2Tyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6514.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 14:24:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 14:24:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 15:24:29 +0100
Message-Id: <DJP06ILK15W3.2XGWM3VAKNF04@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Lyude Paul" <lyude@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Will Deacon" <will@kernel.org>, "Waiman
 Long" <longman@redhat.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RFC 0/2] rust: sync: create lock class using
 `#[track_caller]`
From: "Gary Guo" <gary@garyguo.net>
To: "Peter Zijlstra" <peterz@infradead.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260703-rust_lockdep-v1-0-1c21c62d0341@garyguo.net>
 <20260703140140.GE651302@noisy.programming.kicks-ass.net>
In-Reply-To: <20260703140140.GE651302@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: LO3P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f146e6-9064-4d46-9691-08ded90ecbc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|10070799003|366016|1800799024|56012099006|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	LZ+dwpflDig0J7PnE3AYOSmYwV7MqvRaOBzo47rTDNwqpJdPKTg/2a0c5kHRChnJ0ro/GcU+pJ59EaVuYciEjwvBhUQZAHcOj6PbuS7S39t8LwGGth/AFcH21KK6XAehrKf+r2hjdQ6usK5XBlQReX4YV5CE6F8iOz4MrF0C2jIv+z1tuS/jxc+LJoxjHpfSaJ+p83DWkP9NymMmT+aJPm+951j+PqJhaXQ+J4nZ0BAEVP/kt1Cqo5Pct+fpv+D2ibGxPveYBu6wOIOYojGQ5BDqdFx8rH6yHL55sFGEDmhbzfK4ro6h5jh1L3eTgJufIr+Ai8oFCbO21pjr0dshxwV5xqKThGY74VWcQi6ewL+31193igpHdhUp1uFKqm6owVycWGWOtd2EQWa3Edr8mRsraXgKKPAPAmMnz0bQPRBq7TES2PMtU+XTPHHjoonGysfZgI6mBuupBXyDkoFaHMu+fdHGO8cDnxVtPqCetU2vm08GJqLepd5C/tv3u18tukmr6UvNxuSFdpNTWySUUlO0SQbFeEXRcg9KweOojpU2U669RT3R0ZRZFs0crHs4dIkb8Nq379BXcaNTf0iMaMf7xDyKBQJN1OmboMdblfL8cSkIxtduQ000hqlDW3dbEHMMVYEPdPLUgBZ4l7cClj56Tee6I+yXTr35tVg/MH0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(10070799003)(366016)(1800799024)(56012099006)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWxLeWxTZzBkY1Zaa0w1RnBJeWduV1AyTHd4TC9VNUcrV0RmZ1dZSDRsUXVw?=
 =?utf-8?B?R2xLbStya2NubzA4L1J0V2xRemFvblZZanc2VjlmTFRlMXBOeDFLQTF5U2lY?=
 =?utf-8?B?MzBtenpCRXZrcWc5cXBBVkdUN21jelBPdW5hSTlTcWpLdDJTQkgxWDY5VEU1?=
 =?utf-8?B?RGRhQ3RLYy8rTEJhZ09LdU43L1p1SnAzTDEyeFUwK1BQVkd0am1xZVYwczhp?=
 =?utf-8?B?QnZiQ0J3bXk0UmR3RTM5eWkrL1p3RW1lc3RPQzhZblFLNHoyL0IyNUd6TnJq?=
 =?utf-8?B?S1NaWnZGU251OEhNdFVZWDdkWW9NZzJjWWFhWWhSUDBCWXhFRDRoRGhGelFQ?=
 =?utf-8?B?bW9IK3I0RmlhNDhWK25iRjhBalFXT2x0cVdZQ0hJaEFVV2xnUjRxNUo5bjBN?=
 =?utf-8?B?bCs1N3prWU1ONEo3b0NMSVhqYzY1OVowMnZDSGZnRTJIeGt5UWxYWWx3Ymhh?=
 =?utf-8?B?MWRBOU5BZEl4blBQSjJPcHI4VEIwdk9Zd2ZrVHh5dlFVTEdaZnlqVmFEZUI2?=
 =?utf-8?B?QjVSaHQxako5MW4zN2lLdzZINUNuUGNISzZGMkZSUHpDOXBxR2pBSmQ3VDlj?=
 =?utf-8?B?WDFxeHJkZVNmTWs0SjZqS0dmczQ5eUI2Y0dQdjNISHBIc2tyWmNDUWRjVFor?=
 =?utf-8?B?VjBRd0xacW1pT3hoaWdZOTcvRW5mdkdIWmxZTlFJNWNHN2M2SWhoUkJ5RWtr?=
 =?utf-8?B?R3dKZkNUbW1tVmdNeG0yNlZzQ2pqMHNsRnh4bi9PbDgreXhHeWtoMzN3OWE1?=
 =?utf-8?B?ZktheEk1NVl4cUVSbElXNXRYbFFVVlVSRU1uT0pmQnFjdWI2V3lnSmZNdWJr?=
 =?utf-8?B?YU5RdklTYloxbHorY3RvVDVIY0MxRlU3RStzWmVBRzA1ZHFkMVM1WEJTUVY0?=
 =?utf-8?B?RFNKUzZpTTIrSlhybFROOFk1Z01wL3lLcmpJWmQ4cUlCSTREWVdsV21UdHJW?=
 =?utf-8?B?bmhaNUMrNFhJcUZFTGFVSndoVGJIckxwS0NVZnpkcDdrTmdsNzZ6d2YzYytu?=
 =?utf-8?B?RUdYVU1DOW1nTWUrZUVCNDJsZ2hFQndHVEE0Szl0eVo5aEZkNlM0d2ZwWjBS?=
 =?utf-8?B?WVFNUHVVWmZady9zc2hmSldjN25QYUViMTJHQXgwcEp6OVVLVDhDdS9qdUt6?=
 =?utf-8?B?RUhMNC9yaHZiZkdPZ2hoU2IxT2Q2bGVnenBvOE4xcnY5K2FGYzdmUnR3TzJY?=
 =?utf-8?B?SnZQQTN1dXo0WkRhMFlVYW84ZmxJWTVpbHNJYWtzWlcvZlFGS3hBVFRjeGh4?=
 =?utf-8?B?NDJiei9PSURSYU5wNlVEOEFYVEhrck1QVUs3bDUzRkxkMzVjcjNXVjVHOFh2?=
 =?utf-8?B?U3BMYStXYkJvN3lsWFU0RnlaaDdvekZFL0VveFUwcVNZMEtPVDdtVDNqckNE?=
 =?utf-8?B?aDcya3o5eS8vMFJNMkFsemNwWitWb2RkYkowM045WmdxT2xINnhqbXd3NkFr?=
 =?utf-8?B?SmJpMUpUWDgwRDc0MWNNRkI4bzJocHBabFJpbnA3eWlYbDNleStvTTRRU2ha?=
 =?utf-8?B?MHRSZ1pncStmcnpPYWl0Mzd4TEQySVZsbVorQzFjck94R1RPU3N4L2ZzVEdp?=
 =?utf-8?B?Z3Zab0xibXRKRVFHaXNPQXVGeWhRblZCMjdjbllGbFNkbkRRVlUwNXBwaWZT?=
 =?utf-8?B?TnAwS0xNOHlMM2I5T2lRQmhSam1Ic3dvTi9qeURTSEN6eW5VQXNKQnN2czEr?=
 =?utf-8?B?OVpMQzVsVk5kMEgvZklFZDhPT3dZMWZ3bmlMWVV0QUNqZ3RVY2JWdVdHZzRG?=
 =?utf-8?B?SGVGTmtDQzRzU1IwN21KTjdTcGx3RkFhMEtuRERyZ0V4T0lXdkJNenBYR3VL?=
 =?utf-8?B?ZUJUTUJDWndFMWFsVGNFN1JMR01FREx4ZFBGZkRaRUJnN1Frd25lZkt3c0pn?=
 =?utf-8?B?Wk5wVDVpTWRjYVd1ZHFDNjFWSEdwM3BVcm9VY3Q2SjdZdStEMFM4emJMejVT?=
 =?utf-8?B?T01sWTlWWmZadEg5TFAxU1k5T2tQRkZnSU9wcG1WRkZUYWYycjVaN3F6cG4x?=
 =?utf-8?B?WmlzSTg2L0tJQ1l3aUFIVHNJNW56eTVCejhDOE4xak9EdTgwdTZYNUhRN0Qr?=
 =?utf-8?B?WS9GSTF2WndxaktMY3J6elJldnpXNDJPME1mblByKytObUhlWCtFNnM2Nmxm?=
 =?utf-8?B?eC9zUzJlcnovM1JsK3ArZmN4T3ZONnNVOWE3VFUvOVFVcDlZSk81TjJEdEl0?=
 =?utf-8?B?OFZwb0J5eTM2UnFqSXRTelJORFFoMWxHdnQySXlVV1pWUlhiTzJ3VHJQM29h?=
 =?utf-8?B?Q0VBdVcvMGdrMEJZWldFK3FIcHduUEU3QW9BN3pBcWtsTnVMbFJocEx5OE1F?=
 =?utf-8?B?enVWMUJ4VVJJaG9xMUxYRFdrcXc0R0lhTmc3SC95YXRoOXJTMWt2Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f146e6-9064-4d46-9691-08ded90ecbc8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:24:30.6198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9J7TR7sVwEVqdiAT025K8+OlFDfPCbGhn2WQP+n3Yq/qbdC9l/wBJAfwVMsmOIhs3CEVqwq+LGlwDWj00YW8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6514

On Fri Jul 3, 2026 at 3:01 PM BST, Peter Zijlstra wrote:
> On Fri, Jul 03, 2026 at 02:47:25PM +0100, Gary Guo wrote:
>> Currently we're adding more and more macros so that lock classes can be
>> created. The only purpose served by these macros are to create names and
>> static lock classes so they can be tracked by lockdep.
>>=20
>> I've come up with an approach that uses `Location::caller` and Rust's
>> `#[track_caller]` feature for this purpose instead. `Location::caller()`
>> will return a `&'static Location<'static>` that lives in `.rodata`. As
>> only addresses matter for static objects, the address of the `Location`
>> themselves could be used for lock classes. The `Location` is of 2 * usiz=
e +
>> 8 bytes, so they could host 2 lock class keys, so `DelayedWork` which ne=
eds
>> two lock classes can also use this mechanism.
>>=20
>> The `Location::caller` could also be used to provide the name; currently=
,
>> `optional_name` just uses `file_name:line_number` as the name, and this
>> information is available in `Location`. However, `Location` encodes them
>> using file name as a C string plus two `u32`'s for line and column numbe=
r,
>> so it cannot provide a single name. I came up with an alternative method=
,
>> which is to use a special string, which lockdep can recognize and delega=
te
>> back to Rust to print it.
>
> Perhaps add some sample output so us simple folk that still think rust
> looks like line noise can have an idea of what it'll look like. Because
> I just cannot make much sense of the above.

The above is mostly about the Rust implementation detail. On the lockdep si=
de,
essentially the name will be "(rust)", while the actual name can be retriev=
ed
from the lock class key.

So for

    let foo =3D KBox::pin_init(Mutex::new(42));

in, say, foo.c:123

it will eventually call

    struct rust_location *loc =3D /* static generated by the Rust compiler =
*/;
    mutex_init_lockdep(foo, "(rust)", (struct lock_class_key *)loc)

And when "(rust)" is encountered as lock class name, instead of printing th=
e
string as is, lockdep will call

    lockdep_print_rust_name(loc)

which will be doing essentially

    pr_cont("foo.c:123");

Best,
Gary
