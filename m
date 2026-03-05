Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021134.outbound.protection.outlook.com [52.101.95.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B893A0E9B;
	Thu,  5 Mar 2026 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715595; cv=fail; b=ed5aCflfUH2lWKOgOHjnIhUWkFlZasNJGaOydMimoKUTaLBTAbFdu0xlMRBXo6ithvxnEZm8mhJzP5BtjZePf7oFrdwm+Tc2Db+WTOJ1m3vO44sSRF0rrl0PkI/GIjHs5YjMp4Ce9XIH8cZqLEmvp+1t64KlcTtQLL97LTRKQvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715595; c=relaxed/simple;
	bh=fGH2f1cqu2HPphtDpsct4GPsQ7FjbZ+uOUZZxMV+nTg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qf4ggan6Wnk+tSLCKVZOjoZRDc3VGU33UlLsn3Bsk2+x1i22E90VHqvRafch/WU901lGwsuPkRRRIuxZlZ3c+OBkkB0tFQlaE50abqVGj+liVJMRW45xM8LUeuUgjiJVVu86tpGE2oGK0zDZ2kXbXPLk/H91JJBkd0E3Nv1U6UQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qlWib7eu; arc=fail smtp.client-ip=52.101.95.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qlWib7eu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrZcuUBkyfQNXtCb6jnGlLZeegiPO/BQkSQMgTV0u87hb7Bsk1/fcbfRt6uEH9HLpnf64D9/OA0yNCQPxCz/1IDrCiL1IEQqk6PzBNJAL7aJDjrT9SBVhfxZrQ8BrSNnu0Ke8E/UihtaZ5CtJqCqdMbgHIW1iDZLFS6W2q7Pp7I2GUkW8rZu69eoeABWIhC39Ul/vBPBZZllBCcKH+Q3Qh5Jod2Zr9R9wAFzkdZAEzDxuCeJCrlS8DV2sMdr2id1TDnMSqBgCQkekVRySl8od02LCsr/e8w2vxGwHYALduUF76fbg3u8Iu92Cq6ovdt6eN+rsG5rBJYdxbouvlv4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGH2f1cqu2HPphtDpsct4GPsQ7FjbZ+uOUZZxMV+nTg=;
 b=glxN1XB9yDnROMndDlvljBs1gTQLPNYpRncKzT2llbYHiX3Z+aQUtWjpoBTTrgVOJDSsR6dSLte+2Nfwq2jJ4chysYlf7b8E6H/fTn6hytof6z8z7G1Qte2ogFefEwR5pvfovB/SeaIzau+qRjGN8jcRXboY0CFdx5sL+30jcYuRkGxZkaO8C40J7Do7pNzY2Rlc5sHUysq8Ann7Ky09VRuSlrnYXkuHf0JGTO0wqDlOjaihWvJH3Z9ZROpNjDfxV9lCFisCH1OXsSIXGLXjUEBYxIhFrJiY7UxSCLkJvUPoImEenVKdMlkvSfOelhfCGKLuJzfHoRSpehE4qE7nrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGH2f1cqu2HPphtDpsct4GPsQ7FjbZ+uOUZZxMV+nTg=;
 b=qlWib7eu9b9zVXuZcXRtsR11ur67ejq1as+SDLAmKN9QfmWP4P43pFwOJ+mv+xgTuatCSFRBL7MWEftkrbh5S5NTP0cpNRtyH3ha6oYK55N5h1QVrKMplYeHlvW15dMlo3FbDxNvc4jkVdjyHGVm81qs4wKhOmePrGCbt5U4v7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5939.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 12:59:50 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 12:59:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 12:59:49 +0000
Message-Id: <DGUV8B15O29J.1X1II82ZHOI7Q@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Alistair
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
To: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
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
 <DGUUQRCUTQJF.15MR7PAFJQHNF@kernel.org>
In-Reply-To: <DGUUQRCUTQJF.15MR7PAFJQHNF@kernel.org>
X-ClientProxiedBy: LO4P123CA0555.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: e690248b-2e2f-4e9e-0af0-08de7ab71613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	MpZlr7DTg1KvTwvJQ2qM5WFRnUGWfK1bvEOdJ3/h99US0eVHOxhutF5XTVSjlIz7Ine7LPgjrHZQZoLF2KuZtw8V1ZohduCjosUtgg7U9aI2kLJU7k3qjVHuMrY3j1enX06Ps4H4ztUg7mJ/ZzMdqHSRcxMzl1HL9M70SV8a/c3UunNh2pVa8RlmRJZW2k5MT/UDGh8hqrPXtyFY+qmnWnHMh2A6j8sUzOfUbSjj4boz3LEm9LmnmTQzKm+HutmKyUf5Kwg7R6GFmujTouz0xlaU0RY73fVLWBDQSc17HyDvNo7Y64zPabT2hDjlEDzYjtq9c2w3b663PUnCsvcgH+PUQ1nJsjmz9GCVylHZXdprQXlPfMMplx0dFNrt9YkQBzzLfqYfHRYfPz/cS9TmhRwDFpEXqOXd4YHjgL3s0h12i/gXRYqkcXlnhNoc6L0NVvC35N6rKdZnPQ2NeJlQkEZkKDo7sjqffAFvY40Ratf1l1TJT+BOyC8qPHyX7wveYh/RsTdkZfcwBYjCPlBu2yJxJeh1qePK0gArHtHZsGIGDb0603JCGWn7uAQIRBxBOvRbiy8W1v8+1T79Crm9r6dWYKEO7xUb/WNpFSiQ5P9uA6Mfjk1w+fqJielj5UmbBiQBeLEoXMA29h2+0gQp1V5VYOizVqY/9KxeBeVr9mmOOucBNdMz9xdFbmD1gEy8MT8qXU21xuF9VFmBj0B3nT7O8JjCxY8cmuSiHltuQos=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlJJK1BEajlRb2QramtwNUl6anZlWVhnYWNnK3FqZGs2L1NxQStxck9Ta0VH?=
 =?utf-8?B?R0xRendrWkg5NS9pVFNVaWtnai9GZ2wzSVdVUE5LcjFzU1lmVEllOENJMkdh?=
 =?utf-8?B?NEJqUnZYNVRKUVZEUGh0V3loT24rOWVUeCtmdlIvY1NTMy9KVVhLU1E4cnAx?=
 =?utf-8?B?YTFXNEtjNC9Dd0FsZXZxUEh3SGdiYWhlLzJ5bnpKbGJPVFFJczJoVU1SZGNw?=
 =?utf-8?B?Y2hDNm55TXM1R1NmYjNkVVlDb0tTb0duZFRjNmJMbHplaWJJR091ZGNmWGZE?=
 =?utf-8?B?SC81dk9KVkdFd1lJYWVUS0dINVpWZGpRZStVUFdLbWNUb1I0NWN5UVFUTnVJ?=
 =?utf-8?B?ZVBMYk9QUzRDbU8rZENJL2k4WkVwbnlXWGZmWnhBQ3ZRRXlQdERoOVZudWlz?=
 =?utf-8?B?cGp1VnF2Z2ZCOW1IdDhoNkRZcGE2a3RiYkc0OG5MS2E3Njd0VjZwaVRTcVI5?=
 =?utf-8?B?YnRYKzBVVlgzUTZ3WHpsdE9KRklLbncyS25rdUloUGdTNHV2WHdDZEJxWTEy?=
 =?utf-8?B?VEpPS2xQQ2thZkJzVkVxL2hGVkc4VVFRVWtoN252TU5hdmxRenVucExielJZ?=
 =?utf-8?B?TS9EWVc4aTF5TXNsSjdJbW5pWHZwdlkwODFNbjNMcktmTW5CZHFhRi9XTUZw?=
 =?utf-8?B?bjNRVVlJWUkxRldQcndCMnRSZi92cWd1M3N6K1hxZXIxVlg5RjhkRDlHcGEv?=
 =?utf-8?B?L0hKVVNCU3N5MDdHallMaU9sbGEzWTBMSjN5SjVZOVFLd1dMckU4WUhNT2NR?=
 =?utf-8?B?cFpLNmJMV283c3JoUU9LanBSb3ppYmxJQng1WERVR04wRHp2aTNTMDJXYnZS?=
 =?utf-8?B?ME9lZVF3MnpSOWJBODJzbmYwZm04RzBmWUdnTkpPQXdjSy9rNkhQWnY1dDh6?=
 =?utf-8?B?Tk9HeTM1ZElZcWZhSXdEWWdhd25TSUxiNW9WT3g3Y0w2SE05MytkK0ZPSTN2?=
 =?utf-8?B?c2RRcXhSNVlkWWJNZDEwa1NsbnQya2c3MU1wVFdEbktWVXNuVlJmalFkN3ZX?=
 =?utf-8?B?S0gvUFFHQXRkVzl0N052ZXR5b20yTTdkRFJwUGNyUjZGU0NHamJMTmJtTlNQ?=
 =?utf-8?B?cm45cC8ySWFZcEZka3NxalFYd3ozT3QzVWE3ckhnaDVNeXF3VGdETnJPbVlR?=
 =?utf-8?B?YTFIQ2RJQ2oyT3ZJTVQ3aFNlck1XQkhKTlZNUENKUEtQc1JrOW1lQW93Q1hY?=
 =?utf-8?B?a084L1AwYWJ1eEFNNnRuZ2dGQkNPVTlCQmNBWmI4ZUdHTkFSbVVINmNtbDZT?=
 =?utf-8?B?UFJER2dtZExPd0hMcU1KcXg4b3F3RHJYT0J2VlVDTGtVYnd5cnJKWmZYWlpl?=
 =?utf-8?B?c29VSUpRUWp1TG9yREJrME13MkZQUXRoc09BNWl2eXoxUkNnU0xxS29pbFFs?=
 =?utf-8?B?THlaUUlvOWRFTzE5SjMzR0VOc25pS0dreHd6YkxMNndad0sxRExyNUlyN0tN?=
 =?utf-8?B?Zm1jb0FsUE16NkhxZkVld2NCMmxxY0FyVHVFOGx1T0IwWjZLQWRhbWFzVk1J?=
 =?utf-8?B?QzNGdWNPYWNCQjRFeXZQaXQ1NXdGdXE5eTRidEJMcnBRcVJ0RXpuRzFGcURG?=
 =?utf-8?B?RnJneFpkcy9VaFpaUzkzZ3IvZnNWNnBRTkNycXo5bjYrVEM2RzhOYmR2WjlO?=
 =?utf-8?B?aGdwSS80aGQxVVF1ZFRkS2dzK0ZRbXZCa0lwWXBZRE9YMGFVUU03d29PRUVj?=
 =?utf-8?B?b0kvM1B1ZDBlYUV1MTZMMzQ3RitYblUwNVpTTHkrRTd1eHp3OTRhN1gzZlNo?=
 =?utf-8?B?Mkl1Ym5vb0NEdjVCajdEdU9SYnN5a1lNYUhydWtmbnZzSlRZTjNiaTdiVkxm?=
 =?utf-8?B?dWRVdDdQYXllTFRPeTRxZUpxa1lGUDdPTUhlc0hiTVh3T0IwSU1TMUVSOHVX?=
 =?utf-8?B?YkNSam5kSU54VkphSnBIdzJ6Z3NXejNJT3o3dFU1SXFlT1RnNUt4YUo2L0tx?=
 =?utf-8?B?YlhYeWYxa1o4ZE1yUW94NjhQTjFmN0lmVGdQNGJOMmQ1SWE2TDBXbDFtQnJt?=
 =?utf-8?B?YjBESU1RUEtLc1RhTUJJMm1XNFV1YmJjNjROOFd3R29LUkovRmdzTmkvb2Rs?=
 =?utf-8?B?WXJlaGp4MWtJK0VacUpoQWY2QnR3QW91eTVTOERQZnFxQ2NnQlBsNzN3cmE4?=
 =?utf-8?B?TUJyZEtUZGwwUGdaa1RyRFQwaTIyUWpXenlXNGFZMHJYUjZqdGVVaC9sL0Rh?=
 =?utf-8?B?Q25JSXc5WnFGcmhyZStKQ2VBOXA5VWRCL1ptZHowSmJSdjFyWG1xMUNjeklL?=
 =?utf-8?B?K1BjWGY3V0dVcEFtZ2xZdy9hNkcyb0lpZ0FDdk52NEpVeDkvMkVuNElMei84?=
 =?utf-8?B?OHo5UFdRV1BBaFZUT1Rsa3VsYjdyY3lWZzBYQmFLZkR5TWE1aGxYUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e690248b-2e2f-4e9e-0af0-08de7ab71613
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 12:59:50.2034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKyIRdP10efQjp1CjmbjLhCmvtaTmHiIkXYvXPem+QgorAtZME3DvnHkQLM2cKkhrFBKFW8ILMTIK2LrCk4s0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5939

On Thu Mar 5, 2026 at 12:36 PM GMT, Danilo Krummrich wrote:
> On Thu Mar 5, 2026 at 1:28 PM CET, Gary Guo wrote:
>> This is fine, too, although I think just returning an `Option` and ask u=
ser to
>> unwrap it in const eval is better.
>
> Well, that was my initial proposal (except that it was Result and
> const_expect()).
>
> IIRC, you were against this in favor of build_assert!()?

I think I was just commenting about the API design, and not the idea in gen=
eral.

My view is that should either completely mimick the non-const API (just wit=
h
functions so it doesn't need const trait impl), or we should go all the way=
 to
`build_assert!()`. Either is fine.

Best,
Gary
