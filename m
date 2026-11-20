Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.120
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190434;
	b=h7c7azS1+xD7+2+KmnYhAmWX76zMPT/JdHAP5UVIhLGa/OZF3YRXjnSm0Hytkm+0kjyP
	 6Uvw2yiP4P19zMJOgeov63mO3rYOUwlvEkiRvHvvR3sED9RaFzcgcsb8YiblwUenZAigc
	 n23ancCNheBmSD9tmbJG/5tEuLPOiRyzOZVarnCj766M0XQBHyeICF11PTkEZgkUTvEIN
	 WeGjElO/wy8POKwDqqY5rLQMhvZFAjVpN//0OWlUcLrDgX5Yr3R4DAryzgRUB5foeZeYu
	 WaD/E8iHeEcHQ8aA+jO8NCQcpVQPIxeMJgRw570ih9QaCPBgr5dTDwBAWRweEt1Zz7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190434;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=r+pO4msdhS2G5lt8dacySpfGdGj/tc6xwteK57jDFzI=;
	b=AXLYeuyyRecHKGFv28q/7ALQjiVatRg14VA/nnAcvVgWO+VZ9F965lChFYW8roU4g0MM
	 cvAbTDC7gysMD/EzIJPFtNMcir7CnCo2avykcbBCY7ogS8blrY7AJtUzKggkvVVqhSDCT
	 lGbHH+MHHK4qZYAToi/KGAetR+xFmEjOwKGTtfLL19a9YCuXy8UfAO6BJtb+eiiBBN82W
	 Es2MLzMtAy0/1tNNEODZvWskgCX+X7OPNQd/v2JLtzSejg+cdYFV+Vr6EZtPhYF1K27f3
	 bb5WjeBWqCW8BzPLM48CZrqQp6DG8sKD5nQNWUTxy4cqyR4s/jrKpH2wB2suq8FHy2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=M5zRSiXl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.120
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020120.outbound.protection.outlook.com [52.101.195.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CDF606A325;
	Fri, 20 Nov 2026 16:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72CDF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=M5zRSiXl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsH2LYQIlFRbyvcB/hI3BN76zAWdoCmtevJFMNiLkiHb2sA79bvUn3kAXotZJQYeQ6bAAtHYniLn22+Npsg+cEydzrF8XUqSZj5+x8OQkkUqe9+5ZmMc8SfoV8YI7ric5fRtdqNu38NXklSlf/7DicYgN+0MvHODaX7+DDHD4mvWH7guZstgtbmUdivhhJjcZmu3pTyplIS5F8elFVdBLWitwm+dpWOdFXP2r4jTh8wgaJdpCbXbWyoXsa1hTkvViQzIwF/l2OYBjafdo0XhlMDoqcyzt4Kbrigwg7AXsgqqumg09XYc7oruGN0cyvkkkNUYP3WrY3lVmv2LAuAZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+pO4msdhS2G5lt8dacySpfGdGj/tc6xwteK57jDFzI=;
 b=VjW4M98QjztKXnQuv9Re03ijAGJNA8mNYjDOusqq6XwYGx4eEc+9jcaR0cA6op/d8tHnxFB1ffOSRZpmUhZP2JfmZQGiObUKvXiSEUx7mSl+4LIRIqWhTPWuc8S4qubuDhDqxZ5jYmkStZ8XnDhOaaZmOxzA8VezNxh5oZNldZ4m+jeGX5TTfsvKNCyntbyNiqizaiKso7X4i5v7gjLgQ5+UHlq/r5cQixCD0p8sWpViOH/VobKds1XMVAYqtEELfpXkVBPoFBEEsKITEBgtVgnY8OQVEB11RhSJPF6uLqR3oSC8Hfhqnt9wUlYXIc9RBQuCndspUwI+rSu8yO0AJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+pO4msdhS2G5lt8dacySpfGdGj/tc6xwteK57jDFzI=;
 b=M5zRSiXlSv7Wv/0mpG2yr9BMYvBrJdyedknZApHkA1NLjcinqSbBcMNAVYnTOn7D6d5TT9J7hu6bRIuM6vSo/INJFhMFzu1flsFIKZpAu2FHYf58l+KLlqr4SUNRcPsAmAVJBXxOXEWoXPcwJZ9EOoPVF9QlR7XNbOJKQ7vHiZ4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LO3P265MB1931.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:00:29 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 16:00:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 16:00:28 +0000
Message-Id: <DN05W9TA9SKZ.172IM0Q6N4DDW@garyguo.net>
Cc: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Gary Guo" <gary@garyguo.net>
Subject: Re: [PATCH 1/3] rust: pin-init: internal: allow
 `clippy::large_unopt_stack_frames`
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net>
 <20261118-dev-project-vis-v1-1-2a5f433bb516@garyguo.net>
 <CANiq72nNX41q_ZLOUUbyPmPownON1uxCLh=RXsVGBjFmoWhSBg@mail.gmail.com>
In-Reply-To: <CANiq72nNX41q_ZLOUUbyPmPownON1uxCLh=RXsVGBjFmoWhSBg@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0485.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::10) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LO3P265MB1931:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5d8432-78ca-432a-cf9f-08df471f6626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|4143699003|56012099006|261009223027099003|261021121427099003|261022075727099003|261026121527099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	U48Iw+QB5Vxnn3vYGrtbhI7GqHuqhl8lA1whqeXJbv5YJo0hiJyl9lTInjG0MhHPHxGGuvgNNF58KuD5JGlMMulHdH6IbM2LgXYTIKUMuN3JuemEOvujrxBCJ97SqNTOyUmveCE73qgK9+JlwymtV4+QgldTDxCshW+tTyAQuinLgdLP0kZZzR+dET+2/wxLLeXuJep4HYN57yP7R7sp7kRHMoyUGaXAyU8e0GQ9VQMq97f2pr9nQmaOcHKBMhmHXakkVPNxmhvgaD72mZMR+T3YGzk/AzreWvbyzdW5ZvAtDzNr2kVwEvuzrhCYCjbpr9nnx5/JOu+d97Bx9I48M5GkmZDo9d/KdaaObFYaoMUl4RqTbPNXPhLQTRYKxNH5S2ZxQ41sTGlsBmee67wOygIo6U2EojEX+wpRXuQZe2+doHR3E7LaRebN+GYzzjoU7BEro3X1oSJZQ+Rjpe2Oidr2QInnAqImyY/SBWJoQTZHk2W/3A9igCuRDf0QkVghmbU8QEWtVuSQSOr2BNeaWLe3lryO2j2u4OclMOU2shTE3lVUlagWZR/8UTuvgGLk6giTXH+/OpZmNAkOnw/xyvmGJN7pHA6b8m0BS/CcNLbwcZbSm3vhhx3rRWXmXgvf4m/Eh91/DwcFlRbmL/AtSo+5fgvsHoBMHbvyHjIBkEw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(4143699003)(56012099006)(261009223027099003)(261021121427099003)(261022075727099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VElWUW4wbkpNNlZNVmZKbHpJUW9Pc05CU05pNjFrVm1RTndlMzVwR2c2VmFv?=
 =?utf-8?B?UVBsMzRhMnBRNDVhOFZha213cXFERUdPMjM3SStaMS9xSTE5dHpwWmFIcWQr?=
 =?utf-8?B?YXVlR1dVcThYSDh6RzBnR0VSbXpXSzN0U09IcTIwRFNSa3U5NzB4cnZYOFJM?=
 =?utf-8?B?dEhtRXJwam9jZ3BRUVhRRWFYWUV4NFYvbUdnYm8xRklIajI1VFJGZTRvQWha?=
 =?utf-8?B?QWF6V3pRbUEvajIrWHIxeGtPQkRLY0FpWUcwYUpDL3l5WmxJcStwMXNmc2lB?=
 =?utf-8?B?MU05cFpXR0Q3Y2VlNUVqVWhGa3FUdk1pcFM5UVZqRml2WXFLQy9pbDdsZWV2?=
 =?utf-8?B?Si9PVWtzTDRjZEhRdmFZUXIrZzNNK0tnWElVNnE5S1Q2YlZzazRjU2ViOHBy?=
 =?utf-8?B?KzN3V1JRcEpVWGE2QXdnL29QODVQS0VlVFpLUUtOMzd1bWlzTTVKRWx3NVlt?=
 =?utf-8?B?Wk8vdzBqL3Z3eW01YnhYcXk0VUdIYnM2alBKcFVnbXJpVStlVkMvaGtSYkRt?=
 =?utf-8?B?REsxTDIwNnlpZmd2TDQ1cnRiNGpwR2ZtSHBKc0lIN1V5N3JRUkM3WWZZWXVo?=
 =?utf-8?B?VzZQaXlFMDFjZjdGSGVXbENXUEJMaUZmVnVNQy9Zdm8xU2Znenl5cXcwWlQ2?=
 =?utf-8?B?dDhWaFdRU3RQTms1SytzRjYrZm5kYmlOc0xYWjdKMjQ5aVc0K2RqaFJheEZL?=
 =?utf-8?B?VmoramNkbUhOOGgxQUtaaVFnam9DOE9UUitZM3VLRGpqOGtFdCs2RkJVR1ZM?=
 =?utf-8?B?WXNpTkRiRWhpY2RsbFpqVDJiNWRzaEVwZ253SEhPSmJmdjF6SjZ4Rjc0K1hB?=
 =?utf-8?B?NUZQODh5bDhYL3ovZDZ2aWxCdTlvM2pvTXY5emIzV0Rqbkpick5YaUpiZ3BU?=
 =?utf-8?B?U1JGTXd0aVl3UTNMalpwb1FLZkE1ZHd3d1NaRU42UmNVSDJqUjJRY3hhQjVk?=
 =?utf-8?B?RXVTT1NXbDJhK3h6QUpRcWlEbWJoQXJCY09BeXpHcW5CRlJKZ0VKemZ2K0dj?=
 =?utf-8?B?RmJiSXh3NjNDVFFyRWRKb2tHYThpTVZJVGV5ZmRjTjhhekZ6VzBkNGliVGRK?=
 =?utf-8?B?SWorVXVFQ1RVdEV5N2liOWRwdS91RFJFT3ZtamlIcDlJaEF1REdwL3VHSnJB?=
 =?utf-8?B?Q05WVEdkamgvOE0wZTFkdVB4ZVhNSlFHdXhmV0VKUlYrVGFzNXVscjBnbWRn?=
 =?utf-8?B?Q2tUcnNBajdTam5KamRyRnRTZXNIdXNhaXhDNGpJNEVIRDJ1eWhMdTdYVlMr?=
 =?utf-8?B?L3dxc0pIWHIvdXI5VlhkK3JrZWhYTXdUbFFlVDVYV2RjN2RwOXN2MGJCZG4y?=
 =?utf-8?B?N05YdElzR1pMNVlaQ0I0OG1OTE1udi92RVl5a0U1NzlmK2lOUkVGdlRDVloz?=
 =?utf-8?B?Qk03Vmxob1kraGlSODBrenQ1M1ptdXBkemFlcjFGQ2lQK2NDLzFWNm53Qnk5?=
 =?utf-8?B?S2d0bHBNTE4yZkh2V081Tmg0Sy8zRDB5Rmh5NXFoUGY3ekNvTHp0ejd0Slhz?=
 =?utf-8?B?dlBJc3ZTOVVYNkpiTEUyUVcxUzBEcHYzT0kzNHlrMlJENnFXdnpnM0RmQmRn?=
 =?utf-8?B?SXdLZWYxYWlyVWF4czFNMGdJTVBtNnpKYXk4aTMrZFVrRHM4a1kzcmVSYXE5?=
 =?utf-8?B?T2VyN2VpS1RLR2V6RDFoWlNXa3pIL3pJTWNlbVd4amo5em1QcHBzcmZyV2Rn?=
 =?utf-8?B?NnhjT0hDYXlrNUhnSkJiYVRYRXB1MURkNTNuemJMaVhwY0h0dzhTN2ErcU05?=
 =?utf-8?B?dGRzd1dYN3luZWdDRzRvcmg5ajE1UkpjRlQ2dCtKaXRDZHBVbDV1SmR4MFFn?=
 =?utf-8?B?SnpDeGVId015NU1tTlF6bzcvMDQ2Nng4c1p4OWNVTmZ5VHdGdDRQK0JCZWJh?=
 =?utf-8?B?MkE1MDUrWDB2K3B3czNwc2xFeEhOem1WK3RpNEtSRXR2cWVzTW91cjN5N3FG?=
 =?utf-8?B?WWhIN0plbzZDby9UclhCUTFEN3lHV2c5NVVIeW5id3hjYWVxai8zUTQrK0h1?=
 =?utf-8?B?QVJlVXRCMWV1VndTRHhSN1VkUlowV3JRVkJFSXNzeGtySjJRVVhrTWVPbFV0?=
 =?utf-8?B?cHBlR2FOdWhHdk8vZjZDTHlFYXo3aHVHb1JEdm5wSk9KcUY1TEU3VDBTSWNq?=
 =?utf-8?B?T1VMQitNWmFCSEV4aGFrOXZxSVNPMjgvcGRJSndXRmJ0QXZIQm9qNDVmM3FU?=
 =?utf-8?B?QkJ6SnZBdUpYcWlCQ0pLZGRSK3puaGV2TzVTVitrQU5DWmJ1UzRiTkErS2Ir?=
 =?utf-8?B?ZlVQdzY0VmFsdW9GdGgzaithYmlXemJ0ZmVWQlFnMXU3eDFRN3Ryc1FTajhl?=
 =?utf-8?Q?LA2z3u0/mLhyCiLA8E?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5d8432-78ca-432a-cf9f-08df471f6626
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:00:29.5076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3nAu+mmkrLPY8lgf7Pngja7LJMZlWgcaITLV7fLUqENVSnz6IJ41ClEN4/2iDU4Fh7o/w1f4i7iyYNm8HTXGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1931

On Fri Nov 20, 2026 at 3:07 PM GMT, Miguel Ojeda wrote:
> On Wed, Nov 18, 2026 at 3:31=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>>
>> From: Gary Guo <gary@garyguo.net>
>>
>> Since Rust 1.102, Clippy renames `large_stack_frames` to
>> `large_unopt_stack_frames` and make it warn by default. This is a good
>> thing as in such cases pin-init should be used rather than potentially
>> leave unoptimized large moves on stack. However, this also triggers in
>> unexecutable code paths that pin-init generates for field duplication an=
d
>> exhaustiveness checks. Allow it on the generated check closure.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>
> We hit this in stable kernels, so:
>
> Cc: stable@vger.kernel.org # 6.12.x (Rust is pinned in older LTSs)

Do you think this is worth taking through rust-fixes, or are you okay with =
this
landing via pin-init-next?

Best,
Gary

