Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022081.outbound.protection.outlook.com [52.101.96.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3F73D9527;
	Mon, 14 Sep 2026 11:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385618; cv=fail; b=IDs2tCoQa6LUtn9N3yyy3uxZ1FFOsx6LsxbVNetl4H8i0qE4apm3M/omLeRT3KQBWSJ+kzUpHOac0X2kRshOcZSj510dWouwkt8K2oud/Pn6SagkgiEtW65INV2HNQkKtzEA+Rodl4mUVaI4udjRIlxFpPeHRDtfVSqs3SVkOiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385618; c=relaxed/simple;
	bh=knKG6MZG3+yLUQf6gyPehktKmPvc8UpthHhgmuQWynI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TvMP1e5xi0jKqAbSVRDMhxhMESC6lg3S/qVmMX5r1oyuB7oqtbiqhDmRvtK4sXV+TQmcX6M5NK8lndCcHNlshCGsuntARIFPv7QRuxaUyizdGun/ahKgy3rD86AXSIEVR+0oNs5/gVXtSbKvS35SUJ77hKxB4gknuFu6p2bQRuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FEjQL2x9; arc=fail smtp.client-ip=52.101.96.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FEjQL2x9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/4Q2zxm7Dr1Z0Kt7av3+/JMRg7HSDCrCACWGU9ltIq6YTydvH2dQBgq7F/mGy8+5gKcb/WBfsVIpZjDtPGfyhJfx1LVfrUSzmlRhdaQE73hUxEGUjbQX4PF47Up1xIDOewNUMO3Ou88ctM0l4g+NQzHtPbQ/+RFrjLi3u6/rZDB366chXBDcLQDQ2tbkYg1PZ/NwGw0U8gbmhGAGDSbIY6Bn1cL0aKwmSJGWIpDWTplhu8+OFrnq/72f+7u4EtqGiLYoHJHxLtVneSALzYn0pV1bRfRPPZrKdvlAhNNJYK0jTIgj1VlfcZ0ZU1Wp4cIzFKY6MtV0sKbaHy+V8m9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOJoWc0NADFJoqZ7Jq4t7XYV7QIuzI3q+aLqXOOFQss=;
 b=HUpbk8kCwG2RkV98leGX0YqqeePCGKHyHoe/2nBCNvLHdrfNOiw3ZgvbTiI04T0a7s+IX8JCIM87q/fDyGwWWfmz51iT41jk0Cz4Y2keqzFHxBZQOQynIzoerVUtfdqLy5CAaqtUXFxNlu+dA7gDcA8LOay27WS7Q71L33NzzbCwuVAXJLVVo0UqPY7Dvw8rHjWoaUOvB9MvxN7RQPMzDcRseKcEY7eKJgkMpynuAKP2ReSAZAFrngA6v/t+6SBRII/Fkis7fG51Jvh19C+j4fLKuEz6aXa9JleP4PO2AszYn7m60Z2uuUGLV8Ay6ZRdBgo51LLAyr0uIJzWRotb+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOJoWc0NADFJoqZ7Jq4t7XYV7QIuzI3q+aLqXOOFQss=;
 b=FEjQL2x9GgQsRWsGKWtRlMwMf1YPPLC4fvOxjcwN20XyvdN4I46iZoccYRRnboDqFQtGzWBxxJ5wv5DKq+Z/G8XarDSn3E3ftRNz+IfrDC07UT3Sl+FyoRS1kbV1Q23S5f1zVQ43Pr/tChWd/hfdbwczZFo4uJJNJuUue+bV7WM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6604.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 11:33:32 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 11:33:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 12:33:32 +0100
Message-Id: <DLF09DXIHB6X.1U9MWU2V1T29W@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "Mohamad Alsadhan" <mo@sdhn.cc>
Subject: Re: [PATCH 0/4] rust: pin-init: support tuple structs
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20260904-tuple-struct-v1-0-72c50bd037fd@garyguo.net>
In-Reply-To: <20260904-tuple-struct-v1-0-72c50bd037fd@garyguo.net>
X-ClientProxiedBy: LO4P265CA0127.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::18) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e17b3e-a6ff-4c05-d2a2-08df125401bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|23010399003|1800799024|366016|921020|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	cLVbd3leaQAUDwYe9Fub4AlKAw1vxm/36Tk1/sbaKHtSx57xonBaXjHv5BDNlFRz2gcz61yCSPbKOYFNeCoJwsAmFyAYgwSA7Dt/KdiTa2mrKVlVv3wRQWJHRx6qzDYRnYOvx74n4XV+41VQtaanBbFpDScg83A2zpTJiDsx1EiD73iyogklWATX9WieMHPF6q54bI60DSMZULxnUDdLawBOv1anqpDyqWtibRbg+LUHCMEjd42BgyYXC9WFzZGfbE044U409j4ws06zx1pQybMYnjMrysS6N4BZ8DErket379JnVILOhsWxZyaEmG1WIpx4UpE38p9iUrCf8JONNnwJTaKO/5l7EcPPhUCPqYfPYyPpGbkMUbSXbLWNXuysIy92g1KIxwlp8bsTtBS4w9KM2zUV6p0VV27p8SUQ4ms8txpOPa/Ncy+Xl/yXT28zfzGk1bYxjR5njITR25MYkGAhUUZVv995fXzqTglOuKNC7tCz5o6jj2s/1/0Y2qQ5Oieyj1RsT1NHH28/RP8Bw38olFggH0b4lX4+qwpmvNnUcBVPlD+0x+PV9m0p6YIkdMPdoaIBihPAS7aw6J9KCBpuGUNXuTWZYpUL/truE4gQS6Z5ZbZPhjBpO9INOkMamok6vMG0DNqPTWEzl4aFl92KMDTkXDFSr50wkiALg2JSgrcEqZWBAtDbrb4thtoHu2uITp5jRwXy2sYDyIZ84w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(23010399003)(1800799024)(366016)(921020)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3NZRm8zd3RlNVRrSWxmWTJNM3lISWNYR3Q1Tjh4S0V2dkV3c2licmUvOEdj?=
 =?utf-8?B?cnpSQjA5VklNaEtzSk5yYk0vMG1hZGxnTGd6cHkwZFFTaEw0a2ZHRk52ZkVy?=
 =?utf-8?B?YjhGdDFFa0hvSm81SnhlT2hiUlhrSERXVjc0UitNQlpnU3hpQml5LzhoWTZ0?=
 =?utf-8?B?anZPL0Jqb1MyY2RiT3NIRkdZMkRkVEdmdEZManpZUGNWMUpZLyt2U3VYMHow?=
 =?utf-8?B?U0dDQ0dhOXFHRVRPZVB0Y3VCZWJ6RGpjL2JRUG8wOEczK1NKTFkySXEwc1Jk?=
 =?utf-8?B?VHA5bGU5ZEJ0MS9yRmEzZFJ6aVNtazZwb0dXVEF0SVk1azkwdDcwdEJnRGtY?=
 =?utf-8?B?enpZcThXTjFpS2Z3ZzZ6SlppckRxc2NvOG5uVTV6ZDQvY2wxa01sMWt5dEFa?=
 =?utf-8?B?NG1kOWRSY1VZdGdaZEYvTHJKZ1BpTmlRMld2ZjErUUxtNzBKYmdvaGI4anJD?=
 =?utf-8?B?SmRzYzRmcWFldzhmV3Q4VGwxdVJaT2ZiQ1Z3TzRqd1J1YS9iKzFuTDVSeW83?=
 =?utf-8?B?dFFaajdUalpZM3pjdHhFU1BNWm5xS0lyRTdsUzhoSDgvT1pGaWFSQk5TQ2Nm?=
 =?utf-8?B?aVRWYWtWbmdxS1IyRjl0cDUzc1lqTkRjeFpkbld1cDN2RUZTRzJvMW1JN1Bo?=
 =?utf-8?B?VVR3OGppSTU1SS9DWkpCUDdXNTZ4bFBoVXkxMWwwSzZOanQwSkM2ZEJ2YkNM?=
 =?utf-8?B?QTY4anJNd01SY09kNmFVbFFvWVcyNVcra2ZvWEJTNFdwRkVHY3ZZcEpXdDNO?=
 =?utf-8?B?eUw5NjBtaEtBOTg0ODYzTi95VUtDb0t6MHFJZFZYd1RwTktLT1JoMGVLd1Rl?=
 =?utf-8?B?T0lKcUVtdXpDM0tBWG0yTEhxeXBKd21KK21nZzgrY0g3elVyUi9QdEI0SlZk?=
 =?utf-8?B?NnFVc2lib1ZGU21NRDFOK1JBbDZobmlCcFZxR08vZUtId3FsM3crK3JNeHpU?=
 =?utf-8?B?eG4yc3lhMVFXeWZzNHR5Y2wrUzBFekZLMG1QUFA2bkxOWVY0L214Sm0zTzBH?=
 =?utf-8?B?cVJXTlErZkgwcVVuZmJ3alpEMzNVL1diUGJKazVwQ2psNWdDOUhXS1ZBMmpK?=
 =?utf-8?B?R1QxT0hmbTJLSmpFK3QrSStaVm9XWlptZ3pEbkFlMlNHM0lJUU41cnBMckVL?=
 =?utf-8?B?NVp6aVkwT05uS25ldGxHdlNpK3hJblRyTWhyUmVzbFF3RDNNTFBqZTNOVHNV?=
 =?utf-8?B?aDRuZlgwZUFFK1JFNEU4RkU0VFFhbyt3NmFRdzVtSFJGMFd0ZHhSUWRjVzdS?=
 =?utf-8?B?Q0VOcmlnNCtHcFFEQmN4dXhwSlRSZVpENEpCdThRU0FienBBNVRneFdkcGQ0?=
 =?utf-8?B?UXNvbzdLeFUyY2J6cDVaWjl6dHlDWGJqdytOQlpna2VRbW1maGVoeHpiZWdY?=
 =?utf-8?B?aUlMZXV0LzdVL09VQnVHSWRlbUx6Q0l5ektkdm5xdnhUcUtoNkdkQTNnei9y?=
 =?utf-8?B?c3M3Vk9Xd0UyeDBsVENTVWhjRnJjMHVQamtUZkt4dmh0VFQyRStpTFdHVG9j?=
 =?utf-8?B?amlHUUJ0d0VGTlZGQ1oyQ2E0RDVhYS93eEtFNnhYUlJXK1pCaE1na2xGUTFu?=
 =?utf-8?B?M1h4YnBoZHdKdm9sZE41V0lJdXlUTi9LeFU1T3J3RnMvNDZFUGxSTkxxY24r?=
 =?utf-8?B?WW1zWVFpa1JiWXNqYzRwYVZNRDg5SzVVOXFpWUZuNFkxQThyeTFONlZMTnN1?=
 =?utf-8?B?clBEUmpSR2tFdkFnYjJPTUNBYzRndkozOWdmUDV2MjVtWExCRmE2ampmVGRY?=
 =?utf-8?B?NE1yU3JhY1NyVDJGSHBUNUdkQWVLYXozOEptWDd4aHJaVG5RSlZwTGYwTStK?=
 =?utf-8?B?MGVQUkJJdVM0UDhRVk96NDduekUvY0lyZkFMeTBrdXo3Mk9CUGZWK0RPMlB0?=
 =?utf-8?B?ZllxTnBkNHR5cDliQTJOSWcxSy9nTkF2Vlp0YkVzK0o5UXd1U0NFaUJBd2Jp?=
 =?utf-8?B?UnIzWUJ3eThxK05zNW1xeGh1c1Bic3k5ZDhhVG9lV0tZV0VabTJMWWVEeFlp?=
 =?utf-8?B?VzByU2FzNmUxYU5QWldlY1pOazhwazdJQUFvS21yOWVHVVd0eExWSmQxUW5u?=
 =?utf-8?B?Zi9YalF2WlhGTVVHZDV6R1p4YWFScGZQM1FKRFNqSmwzanVZVHRQL2lkZ0Jp?=
 =?utf-8?B?Z25nbkxhTG9OOVBBWG5ETkk5MG0zak5lWDdSejMrYWQ2ZmtySGorMUllLzd1?=
 =?utf-8?B?VFhqbXFJNkpwR3BKUjUvVVNFanh5YUdreTNSNjB2NWxPQnB1VWpMbk51cktQ?=
 =?utf-8?B?eVEzNFV0Z2lhZExaYW5QUk9SU3RCT2pvQVlLTzZPKy9vekpxbEdoUHMyczJs?=
 =?utf-8?B?ME5BOGhlOUZTVWJYQzZHWDVxSm1UcTVnZkc4ZzcwOVhQd2doT2R4QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e17b3e-a6ff-4c05-d2a2-08df125401bd
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 11:33:32.7370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jXaDK5ZqX+l5LVTo81tQlR141AViDCqQ6PNqtl4gRgv4CRcD7TH8mg7KHeV+3MyINnhcF+kkFx6kHq7JGuXyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6604

On Fri Sep 4, 2026 at 3:12 PM BST, Gary Guo wrote:
> This is a long requested feature to support tuple structs. There are a fe=
w
> cases that structs have to be converted to become normal structs so
> pin-init can be used.
>
> This series add tuple struct support as you'd expect to work. A caveat is
> that pinned initialization syntax (`<-`) only works with struct expressio=
n
> initializers. So
>
>     #[pin_data]
>     struct Foo<T>(#[pin] T, usize)
>
> would need
>
>     pin_init!(Foo {
>         0 <- expr,
>         1: 0
>     })
>
> This is to avoid introducing new syntax.
>
> The upstream pull request for this series is
> https://github.com/Rust-for-Linux/pin-init/pull/155
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> Gary Guo (1):
>       rust: pin-init: internal: extract utility code to new module
>
> Mohamad Alsadhan (3):
>       rust: pin-init: internal: pin_data: support tuple struct projection=
s
>       rust: pin-init: internal: init: support tuple structs in `[pin_]ini=
t!`
>       rust: pin-init: internal: init: support tuple struct constructor sy=
ntax

Applied to pin-init-next.

Best,
Gary

>
>  rust/pin-init/internal/src/init.rs     | 494 +++++++++++++++++++++++++++=
+-----
>  rust/pin-init/internal/src/lib.rs      |  12 +-
>  rust/pin-init/internal/src/pin_data.rs | 129 ++++++---
>  rust/pin-init/internal/src/util.rs     |  54 ++++
>  rust/pin-init/src/lib.rs               |  71 ++++-
>  5 files changed, 638 insertions(+), 122 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260904-tuple-struct-5b5b6e6a75f9
>
> Best regards,
> -- =20
> Gary Guo <gary@garyguo.net>


