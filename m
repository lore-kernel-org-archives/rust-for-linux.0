Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020143.outbound.protection.outlook.com [52.101.195.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6812737EFEB
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jun 2026 12:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749471; cv=fail; b=ZFWFQEutGF0eobTtTdtSNKZFnANNM2TR6A+2aYe19yd6XwaO3+7xGfup9D7TBVWhY8DgYmF/qv2pq4OuDk4iPSZveTXNUxcVXFrqzsBVfbtrwQXmhbTwF1NXoXENNxZlP6MIpiJhF5+MUBy2auEXMEqotxUfKw8zAdbAXUz92g0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749471; c=relaxed/simple;
	bh=0nTmzMKjVgtoF+PO2NS4e4kS7yHWss/QYo7IFHXum6A=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=f2csQEdhETgS8VpUtaEgJNjVqvmmrn+jL3NggA39iIrXoNSLPU7n5hATpfeUpQLK7aAXN55GaFRCDs1UaWooN3LcZf2lPw5gH72DN4ohkNyxI8QvGvaUlP7LnkwcTXOkux9jaBgUpqt/QYAWJnoY6LCv7J3jCirrI98Ci1CQZ5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=tTNsXBiw; arc=fail smtp.client-ip=52.101.195.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="tTNsXBiw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBF6RSUE5+oip7OAZU593JmXPjeKS/SRLgg5i+PQINT356pisD7SnoJafbA3iO/MrtubdF8IIwn9ohdj/lMkZKGRyRt+BDOR0ZViFZXk0wxhRcrGCUD0m4g61g/tPaKoEX/8xFjrwPD/xH+utA/2epe9ku2d6BY8a9ZGoV4vWXaOmOfe03jkL7Nh6beb8NgiauD/o3eF+V2FVs3vc5mluFIV6uNSjBoXQLwUxprh0iUB2FMu2koYELPnVnd37aGo0jDnaLnyWFeDxwDWI1U7gjeCFlXwSs4/8qum4E7o/bmgs7Vqq8W1Pcqov9FonUwxp3vv9Lx8fS00RhbptGquiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nTmzMKjVgtoF+PO2NS4e4kS7yHWss/QYo7IFHXum6A=;
 b=ezcgbvvL26pCF2qx3gQVGQJGWAj4GMgP0ZbXXVcQfF22x5XJsFeNpopawL0ae/wQ7hbNaKGiwowBV6E9leltPb2Ap6hQLQYb3/yiCt8v04S/TPuaa7HMNayRwYwgW1i93tw30nLDOeuflm8RQRLDWJMwPecoSFk7JFhf5I9uNZFc9ZiuWj9xqvCR31k1/qc+vsU864ACWXN1C+MUgcM4VL0l8SdWvXugakHyOJNBgXCftVfJ/sy2Yr8qrAFZMrNq9kuXuRPPgFa+nJqkKtCwp72pVbULiBXyNXrLbC9gb8XXxtV2nYHBevq8RGEsdqhC319fXQu9IuoT/IForMesXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nTmzMKjVgtoF+PO2NS4e4kS7yHWss/QYo7IFHXum6A=;
 b=tTNsXBiwrna8/C09BFWkwv24AfHn7rkh53vvwcI8YoD/mTXWoqqh/2YtL5JyAQs3hIX6oiM55tkLfzwKlb2bBkqhmZZpg5/3kXqJun7F7Y/SWcMh0d1XhjhleksyQ+j53k6Bakpy3IF3mGEcpbvwFZxzFpvh5SUC+oZJESmHF7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOCP265MB8566.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 12:37:47 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.010; Sat, 6 Jun 2026
 12:37:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Jun 2026 13:37:46 +0100
Message-Id: <DJ1Z03DMKJOI.APL4BE9O9B4F@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [GIT PULL] pin-init changes for v7.2-rc1
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260602163949.2215642-1-gary@kernel.org>
 <CANiq72n3t1VW5oTFeEZt-raBFnhO-uw_Fjm17vEY2SuvR8XNWA@mail.gmail.com>
In-Reply-To: <CANiq72n3t1VW5oTFeEZt-raBFnhO-uw_Fjm17vEY2SuvR8XNWA@mail.gmail.com>
X-ClientProxiedBy: LO6P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOCP265MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: f977da9c-b6db-42ca-3ba6-08dec3c869bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KIAhpVrSgmDc/t2xmzHT6721N4YWzDvaQhsfdxERuDJau5rqnQlANSNQAXeWj0UN7qa0H13Q6NVFQn7zI/zxi9WUgZre1TPMybzhWGT5YuI0mNwlO88TRgwN6CqzNo7wSaDJSgjdXiqfZgjEQX4eBONJ03MX8e9TVCkO3Hl8Jv/pkcTJfPjews0suh/pYAWtkkWyi2MLPKD0MdVagsNrMQ74PnFpEsD3d8BVIrQgbcUOPn9KFbv216SQtNr5n8229/Jrpu98k03T0iTARmSczmQ26gAOZ9YXDdd20LOzzULyCSJ0A/qP9fG2ENVlZaC37hXasWX6r09dZDgfpBdom82V+tMYgx5XIPJ5CQullGKWzT2pNhDVrSl0TL5bx4xNlEGusVP/w4yuIf3uAC6NWQDZkhWcKpLCk1r7i//NSQWsRBDTA9RTQbCRlE+NTvnRkgjHii3sE5Wzcp2kN/VXsXZCTfs3BogbuAgPav8fi7UGoUSM71oRmFttilGYjdJlHwNl/xbQMYfJ5gDoSN0wM3OY/O5d019wLAeICtLFoIl83ygcYL3afgYgloZzm1c7MUeLwHEgjzYTrb2l9rmwegfobCpmA+ZWuAwGRLaxsDN7uwdIWpkcBpDZ070apLLFUfzQ3/2/0I6lqIxgbCnj1TTFchqrDNRZPWz9yaE9ZdbMzeIs9B5kxbY8+q3Vc595
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlVwemx0SUhwNEw1V2wwSWlhL3RNNnpKQmlWUExGZUxQZ3BsV011S2tFUzFT?=
 =?utf-8?B?ZW0rNno0N3dLaXVHc0tXYVBWNGZzTjVMRnVBZGltdG83YUJvSDNOcFhpUVFt?=
 =?utf-8?B?VitRVlYrV3J6Rm83VW95Mm05Z1BHaGNBdTFad2RuU3hPbzFjUEhzd0JPamlv?=
 =?utf-8?B?LzVadHdEUEgwSnFGOTlpbml2QVJ3VmVzeDU4R3ROVGtFOFF5RkN2VTV0MzNY?=
 =?utf-8?B?bjZzTVhMdlIzUUdZZituaEhDdEs1KzlPOVJBMUNOSitsYkpDeUFOUklaTktj?=
 =?utf-8?B?T1dRUURyU2pXaE02eTJYZFV3QzlRUW10dmgvOHdFaXk1Ynh0OHQ4ODlpcFh1?=
 =?utf-8?B?TFJJbFBzeTZxdTIzY0psK0c5bGVMOUJrbFRXcTBhL0tVVnBmU0s3c1JjVjd3?=
 =?utf-8?B?cXM1ekh4ank1aUgvVnJPSzltZWU0bmtFZEZYWUZCb05GbXdZb1E0aGFUTjZS?=
 =?utf-8?B?cVZUbjV5MCtsSC95cWoxSDN0ZlF2cng3WjlNeXNsbVVzbXJid3lSY1BrQVo2?=
 =?utf-8?B?bTliUTg2YmFYRXJFZHc0WVNRZmhFTFpsamVibit6S0RXNFJUL2hCSE1LQmF6?=
 =?utf-8?B?dlFpNG52REorTkhOWERWZG5JQ3d6d3E0MzVXSEFsNXdHZVMyRTV1YzZrVmlB?=
 =?utf-8?B?ZnlxZzJ0TDJvYkNMbWxLc2tnOWM5dlZQTnJMbElJdzgvRU9XbSt6VDYwN2ND?=
 =?utf-8?B?OHY5d3l0UDJpMEtjYU9Yd3hCQTdyQ2lLeDdKSStkUHhudmtvM1ZMak5Rdnkw?=
 =?utf-8?B?dnNQcG8vc3pLeXIwdUpVbnhQWUQyei8wUG1lcmJHcndQRWRZL1ZoSCtoRlll?=
 =?utf-8?B?VTZFZVRzSS9odWx0dkNzYnh0dUVyZnoyYnVTK3hxVkVzUU9TZ21HNURFZ2Z6?=
 =?utf-8?B?ZFJ0OHRXLzRmTng2YU8yS2xmeVBhRC9YZDR3RklZa0VmRnhTNEtyZ3hIMzBN?=
 =?utf-8?B?bnVSYk96NVNNOEoxWm1TT1ZsaW42dFZNU0lqYWIyWlVDWnBlNU9ick44T0ZK?=
 =?utf-8?B?ZUQ1WkxWSTlicUZnVXRFSHFSWWZwYXRiNnlMRlR2UVIzTXlrbVVMQThIbDVl?=
 =?utf-8?B?VkhvV2lwTThaZk8wNUV2dzVRMmc3L2xMMWVUdXUyc2I0ZVFHWWVERWNPRFNY?=
 =?utf-8?B?QnN4bTVIK01lc0ZIV3BUUFBXajE2bm1wUFMvOEgrWFFxcmZ5azNyMVlOc3Nm?=
 =?utf-8?B?RHc4aWwyWVExbjMwcTNTVmRsem9SNVE3NWFoWmpmbXFjUitFQVM0L0p6amxY?=
 =?utf-8?B?a01WQ2RaM1JxWkw1OTVieWwzN2lLbzhYTjJzSTJsZjZBdUZMTHYxd3VWSDF4?=
 =?utf-8?B?WmZNc0dtcEpRMlRLcjFqUytRZFg3U1FzWFNPMFVrNThwbGhTakRiMUR6TC8z?=
 =?utf-8?B?N2NIbzhDWjQxSmtNMk5EbHBWZk40amZNM2k1azRPWGlJb2Vxeml5eHhZZGRz?=
 =?utf-8?B?R0lLUFc3NUZDbFFMQm1WR2lVenlrL1U1cGhpNHFtSFV0aE5ndlNXQ0lHSW9q?=
 =?utf-8?B?NjVTZ01xR2pTQXl1NmxxemNiK1V4eURRZi9MdEhZckNuQVRBSUlEWnJjYlJ5?=
 =?utf-8?B?UHlyOVJsbzFicWp6UlZyQis2YVArK3VTMjdYUStWTnd1Zldzb2dQNTY1SVV6?=
 =?utf-8?B?bElyU3owTjRyK2VMeS9ocG5vbW1OUlNBc2dNeno5NXRFbDNsNVNlVlZJOGVZ?=
 =?utf-8?B?TjJEVWMwYXR5MUU0d0NCRzUxQTgyaCs1VERMRTU4ZzFVanUwOXFGWmZzQlo3?=
 =?utf-8?B?SW5JOHQrRU1OSVRISlZqUyt5Um5IVHRLalJla3FZV1BWNFlmVkxQL0VqRDlw?=
 =?utf-8?B?TExDUmM0NVYzY3kzR1Nlc2JOZVA1MGtMNlpBc3Nydyt6dGdFVWU2L3hGMmRR?=
 =?utf-8?B?aDdnY0R5VVBJZVVqMjR0dTZNZzdFL25rR0JUWTlyNUV3bUhCcGpoUlFQTTli?=
 =?utf-8?B?MDhjZ2VVem9ueDhjd2VhQnFJeGtROHljRmRwZXVWVjVpUHJhbFU5RzRoRmp4?=
 =?utf-8?B?dkRaYytYRjZZVk12RTd4eVpuNzRlVG9hVnA3eUtoRFJpa1NpdEY0cHpObkFu?=
 =?utf-8?B?blNFdnZsS3F5aWJkUlBBbTZzbWo0cE5pdFRTYndXZlJQZUdBM2IrSXNyNXV5?=
 =?utf-8?B?Mzg1ZDBLaUdHdEEyc25rNmdOMm5pSVJRL1NscFlkeGI4MENoV0xianJ2MlMw?=
 =?utf-8?B?UERrVWc4V3FNcVQ5aVQ3NGkxdDFNVWdsT1c4MmhxOEhtTVNJYjRFcGd5OWJT?=
 =?utf-8?B?L3VZZllUYXMwWGExc2VPQWxWdDhoSUJlU0lRTlQxWUpmc0V2SzNMUjRJRlp0?=
 =?utf-8?B?RmpHa0s2dVNPV2RFMkZqUGV1Z2dHZnJqZDYrdHFIZE1kMTRrSm9Idz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f977da9c-b6db-42ca-3ba6-08dec3c869bd
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 12:37:46.8685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CJ5+5gkh6SSsBDlxJ/k+f24L1NtlrMxsMT7A5rkU0uVVufLQ0L4PAFEFczri8b1pjMWK51WZ+fDFzuSKvsQ2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOCP265MB8566

On Sat Jun 6, 2026 at 1:27 PM BST, Miguel Ojeda wrote:
> On Tue, Jun 2, 2026 at 6:40=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>>
>> There is more developments this cycle than the last one, with a mix of
>> improvements and cleanups. No breaking changes to users expected.
>>
>> Tuple structs did not make it this cycle, I hope it'll finally land the =
next
>> one. I have also been working on getting pin-init to support self-refere=
ntial
>> types, which I plan to send next cycle (although unsure it can land in t=
he next
>> one).
>>
>> The refactoring commits have been in linux-next for a while. There a few
>> patches taken later in the cycle, and they have all been in linux-next s=
ince
>> 2026-06-01. Feel free to wait for a few more rounds before pulling if yo=
u see
>> fit.
>
> Merged into `rust-next` -- thanks!
>
> I have reworded the merge message to use the style Linus expects for
> merge commits, i.e. mainly using the imperative, like commit messages
> -- please take a look!

Hi Miguel,

pin-init's CHANGELOG.md is following a passive voice style and I was follow=
ing
that style when writing the tag messages.

I'll make sure to use imperative mood for the kernel side of tags next time=
.
(Maybe the pin-init changelog could use imperative mood too?)

Best,
Gary

>
> (For future PRs, it would help if you can follow the style)
>
> Cheers,
> Miguel


