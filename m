Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021101.outbound.protection.outlook.com [52.101.95.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40063FD12C;
	Mon,  2 Mar 2026 14:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772460549; cv=fail; b=vFcv2xl6F2bxQGMpHVBtBF+pzC2XWjEem9g3m/3+JzIalZUz+riO8u4TIOsniISr5Fec+rhqvRdoWKrWTodHuuUeC1zmcjsLUAljvdv4MKy254nFm75oO2jHj3iUjvjMaD2GUPg3cstTYHNvgPY1TPjdhZv006GT7wtI00nxc/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772460549; c=relaxed/simple;
	bh=Y/Hqme3c/DAGiUV2EVf3iqU3oXYPNBl2BS3APgkHBH4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=X2YnTD4VTHzAtEeDIZx/4vzn6B7ZmJhE2MWP7kx7ta2V3n1wNl7HnpM/aUYknEhMsgFxzmIkDS2OhMK3owBLSvaymYCat1VlKkxLxYXpcF1CA5iTpBCD76a1NP5Fq4XVacFJwW4bCB8KNW4O1cG77uxEfumsjdCbOV8pSQ8EEgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jpSk5Q3t; arc=fail smtp.client-ip=52.101.95.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jpSk5Q3t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFyhhA1kcvbZ1nRQFZATaqZ6+SpCNRwjcQ9GS8on6WbS1YvJUqvPPAal0iwjddpiccOQ/YdtUH5M8BkaFmCDqpN/bX2yc8Dl+vX2nJNpnXtwiBvRSjEyPu9sRFLJNJTDnNys3pUVAtMrE9ZfyeVYgP+ELIyAIR7hElTmqQBn+EdX5E+icJeaCplFXLSvKabt4iHUw88YSuB6zshi/1uMmdcgFGbWg3pg9ILvDJJRRi8mx/WQVZUPV27rm8NG+DSlhWydJWUG6P9M6YgkbpujJtyEYpwZ+oIxPfVjrAMKG0QwyCxO77jJUWVeOfPfcGaPMbkU60uD00DRrx5wMtLwYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjVnO6gARYFnC+c9CGDTs9aUucwmSX1zLPPy+VT3GSs=;
 b=pTfqI0OKk/zOz8Fnx7X8RbovsjJj3G+y/ecbiLywZvfJVOa76IgCvBs0Yx2EKamu67lVELKL7wYppkZX2OB/+vhIry8C3m5lFHxYzbKZrPo0qQzHYqihmdH4Seao6neEPUntYSudeFQyswZ3aHZ0CmxexdXEXkbLWIIguHGCMcgXpXaCnWwR5+W+Eu4qxw+q0reu4QIN8Kuur9nco4eiluakOQdYK+kMRWZrPfUoaowcDb2m6k7lkDzNcGBCbXpyAuEHTfsypRuO4OXTXi62WSKTi7rsHmfjzzvObB8ESi9LxjPJCTCJ0gBpSkgq2WsMNer5WQ6DbQr+F/FvHX/z4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjVnO6gARYFnC+c9CGDTs9aUucwmSX1zLPPy+VT3GSs=;
 b=jpSk5Q3t41nrK2MlfVR7R394A8wTDx3A1UW+obbMcA/5+Oq1g+j6ycqBLr40XgHKfX9LZXx8dSmcJQF0dpT0QNvNhY5nnm+ideArySGYAHqQ9rQEykcvWJyL1YMNYWmmgNnM7DbHtPHaXfxY6iA1EDW3wb0wQoegIHZ6gXuvHw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3252.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:bc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 14:09:04 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 14:09:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 14:09:03 +0000
Message-Id: <DGSCTOQYK8QH.2JT8CMI448WRR@garyguo.net>
Cc: "Janne Grunau" <j@jannau.net>, <asahi@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: pin-init: internal: init: remove
 `#[disable_initialized_field_access]`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302140424.4097655-1-lossin@kernel.org>
In-Reply-To: <20260302140424.4097655-1-lossin@kernel.org>
X-ClientProxiedBy: LO2P265CA0515.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3252:EE_
X-MS-Office365-Filtering-Correlation-Id: 60cb3993-7ee1-46d4-00a8-08de786542c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	OXNmg6eTkj5+Hsx7HjjjctWhPHQR3GCHB1sl6dd6jGuUf/RE3C9clgxToYqXMCQ3J+sEOXecrK+3G72eC+n3LAVOjbIh3bNCsCcd0uqxGF1w1tFSlVDWkYD07LhN9wqTkHCrZhXKoKo77K0acVQkf4CcK0m/MB3Yf27I9peaeyjJS586JQ4AjWMY5nfU6EeGnks8xUBAfxSeG4+HXLMw1D4lbbcETUHqbc1B7qectvYTqMBztT+i1NKqr5RfsOXL5vjmvyBnF3f3uowCeg3N4PHyN+KN/s5hp5rdr5YTkIyRStibZz+zxNdxdwzMX3u2NdDprCqLLJjQeijtM6qMLUJrD1RZh+7vYy0xP5xqgrXHD3thBWQfNXn1aHR3QVzvUORkzVzFAc3RbK8C+qv7YtMsfjpbjOHqEhevj5OfQG7kMaBT045RCTfnfFN2K6vvwyhxdy9hb84HvwV0ixH3sO3vd5t4EyY4gDt4ifZN7JsamWmH1yw20aNUOwdXNmU+DDr3nteaY+aKeRS7FEF546vYMXx4HPV3XeoA4JpzWxjVaYyxFuiKqZ2jBbjbwmOJRLfB6OhO2sVyCDNnd76sYPzBQmnvffQLnT6g/3cdbzKTdpvMVx4NI4q1EDfOXDyFC+RbCE+/lUv0L0v6NOUfe/NnxNAUPoohxCZgjmyn10NP3o+Bebviv8sl1PEnRM24
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXZXVXF5c1ZLYnhqbm9UR2FGWmJYbU1yRWhhOUNjSGN5VUhNcy9IZlZYR2ZM?=
 =?utf-8?B?Y3IzZmVPeUpkVVVDZHdVMllZa3dFeTlaR01Xd0FLK0dXaXZ4eTJEWFgxNnp4?=
 =?utf-8?B?bTIyT3JvUTFZUkFoUXEwRGVDNnU1UXJSK2ZoTUl6eHpvclpkT2VPWnN5V29Y?=
 =?utf-8?B?NWtYbVdLV2dCNzVVZlVSaEhoUHJWVUlRcU1BUXltR0RvWFB0RTA5eVJzSHpz?=
 =?utf-8?B?L1Z0dmUwMG53MTQyc2daUjVOUlAwd1JnOTNjTmFORkRGN1RMK0tWb1h6cFo3?=
 =?utf-8?B?RHg2cWdaUjMyVWhESXBKYlg1aW5IRTZ3VkpZdjN4WC9yRFBudURlQVBpQTlG?=
 =?utf-8?B?Ny8yN1JYWXhzbEJPWEZzQmxvVXk4YUdwVlhSak5kTWdzRVJTZGhuaHFPbXRE?=
 =?utf-8?B?bmIxR0lqa2dEWUIyZDFBUzlGZzB5TGtLQzNoU1pNZU54ZEE1N3NYNUl3WDVi?=
 =?utf-8?B?elBVdWYrRUlrVlpYRmhrMjUwdm1LdVJiQ1VGd09IMTFiSGNHOTlIcEpNamVm?=
 =?utf-8?B?c1RKQ3NzNTFLeERRR2pzdHVSeFNqSy9nYXMybFNLa2J2WHZDVlUxeVlHWEpz?=
 =?utf-8?B?ZlVycFNFeDRZakhqbXNNMndqd2NHczNxN1hBNnZSUjdJWC9hRS9zR3dSNnBJ?=
 =?utf-8?B?NEl6SzVJeWlEUnN0S3d3bGxHWk1GV2FQcGUrNE1Sd3k4aWJUaENMNzdrdUZa?=
 =?utf-8?B?aXp0ZFVERTBNU2VEYVNqRG5PVUJ2ZlJJZ1N5SDNORVpFbE5KaVFuVU1nZ3Ni?=
 =?utf-8?B?RXV2S2J6dkhnVG9waGJJYjZ1NENGb2k4T3YwSjRDcHlIeXRNR3BkOTcyZkg0?=
 =?utf-8?B?blMvRmpEMExGZGJ4NjBBSmhUYjJ6UVRROEM1VWJjT3daNWhoZmY4L0VGOGRP?=
 =?utf-8?B?U2VFRy9xcFkwSC8rUGNPTGJhTGNXcnVrRW5lS3F5aTJxeEdya1o1OFgzaUQ1?=
 =?utf-8?B?UHRxYVprRzB0ckNnMm5hOVJybXV3aEduSjFBckFaVk81TVZOOVQ1UUxac2tk?=
 =?utf-8?B?SXF6bHlLang3WGFyeXA2bXpOaXdDS25rd21ycDB1TzJ4b1ovNEkycHJkY3FH?=
 =?utf-8?B?Vzc2UVJGQlNXQWgzUnZrNjlLb20zU1RCVDVOWHN6K0hHbGUwUDlEdWM2aHlP?=
 =?utf-8?B?cnRyZjB3aElya1RaekNabjVpckxqbnMxbGxNMmtaMGJpK0Rvdll5b2JDQ1Na?=
 =?utf-8?B?cmRMZllXc0hNdlZiL090MUxXV1JBc2tpdUlKZVRFMUhyazJDUE9OcEFtTkR1?=
 =?utf-8?B?VkVOUnh0UFJkenUrZXJYNzQ3ZWEvUkI0TURxNkxQZlR2THE2emxTNHBHNmNB?=
 =?utf-8?B?ZC9jK0pubGY3amM4ODB2bk5CalFKa3pyZjFIa0tnVlR6eDdmbkN0L1dPejdB?=
 =?utf-8?B?RlZwMjF3d25kT0IwYXdOaUliT2M1QWs2Y2hJT0MwOEIyc1krcCs3QlJveTZt?=
 =?utf-8?B?OFFodkFtTHpsTW5SMHUySjJLNjNNSUxKZERXRVI5MEhBazliQjhWS2E4eGlP?=
 =?utf-8?B?MWdHTUIxU1lidk1JQ0FLZlMrbFloQzRkOVJZTmhKU0VQWFBWaENEUXZGdXBj?=
 =?utf-8?B?NEYyaXc3c0pFNUZ0RU44cnhxemZIdkliaHpnbWh0RkUvNlhZSndjdk4zWEd4?=
 =?utf-8?B?c1FJeHp3cExKdmhCU2hTS2p1U296YUFOb0hBQ002TzlSdFBRa2E0QUhXQmxn?=
 =?utf-8?B?TWNUQXVCR3BCTkZudmFrZEh0MmNTQkJzNXcxejVPVXJPQ0tIUms3WVNJNUtj?=
 =?utf-8?B?RGV5cDJUK2poTG5DSlNmSXowT1ZoQnAvVWFmWGtUeXl1WFRZd0F2UmxXUTJC?=
 =?utf-8?B?TzlUaGZ1NVZCa21PUE9DMzB0K0NMTGhxWlRkTlRXaWtlTEU3NWdFRURuWjVy?=
 =?utf-8?B?aSs0V09JYnRHalVzcHFZSG03Tmh0amptTEk5Vmwvdm9hYlg2RzJTc3JtOFlh?=
 =?utf-8?B?N0Ztd2prVmE5MWc2ZG1sMW9oOWxkNEJtRk1pT21YeFIyRGhqc2Y0OG1YNGFj?=
 =?utf-8?B?V1NnZURHT0dOTTRzYzdDYVJCTGJmYVczSkdLd1g0SU1KaitlL2tObGVDZTNt?=
 =?utf-8?B?ak9lcmZFZjMvT2I2Q01pTlB1aGdzQ3RVZ0VzbmJoQ2FtTjhQRk9sd0FmT2hz?=
 =?utf-8?B?T0pBWXdjYWxsMGFtOUdMdmlTaFg2Z0luamFwRkMxdEZZZzFNMm0vcm83YVZr?=
 =?utf-8?B?T01teFBKektVcFpnQm50bWNtdE1qdFZvbVhzYVIzbktHSGlXNDdkekRDemNH?=
 =?utf-8?B?d0NNRlppNU52YVdKckt3VXJkS3NobGgvMm01cHJud0FxL3VvMG9HdjBZQ0dv?=
 =?utf-8?B?T3NBN3N5L21yUW9SNDhGU0s2WnBqOXd0R3NERS9ZVDM4MkFQdkxJdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cb3993-7ee1-46d4-00a8-08de786542c8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:09:04.1337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ma1o9z4spIZU5lEHv37p6+JEFuoizsnT5GJseYPC6zzVWTW7Afw1/Ax1hvdQNu34xy5+KEPQSxWj3FMDBWSlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3252

On Mon Mar 2, 2026 at 2:04 PM GMT, Benno Lossin wrote:
> Gary noticed [1] that the initializer macros as well as the `[Pin]Init`
> traits cannot support unaligned fields, since they use operations that
> require aligned pointers. This means that any code using structs with
> unaligned fields in pin-init is unsound.
>=20
> By default, the `init!` macro generates references to initialized
> fields, which makes the compiler check that those fields are aligned.
> However, we added the `#[disable_initialized_field_access]` attribute to
> avoid this behavior in ceca298c53f9 ("rust: pin-init: internal: init:
> add escape hatch for referencing initialized fields"). Thus remove the
> `#[disable_initialized_field_access]` attribute from `init!`, which is
> the only safe way to create an initializer handling unaligned fields.
>=20
> If support for in-place initializing structs with unaligned fields is
> required in the future, we could figure out a solution. This is tracked
> in [2].
>=20
> Reported-by: Gary Guo <gary@garyguo.net>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-ini=
t/topic/initialized.20field.20accessor.20detection/with/576210658 [1]
> Link: https://github.com/Rust-for-Linux/pin-init/issues/112 [2]
> Fixes: ceca298c53f9 ("rust: pin-init: internal: init: add escape hatch fo=
r referencing initialized fields")
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changelog:
> * changes since v1: https://lore.kernel.org/all/20260228113713.1402110-1-=
lossin@kernel.org
>   - improved note added to the code in patch 2
>   - improved commit messages
> ---
> This commit does not need backporting, as ceca298c53f9 is not yet in any
> stable tree.
>=20
> However, the unsoundness still affects two stable trees, because it was
> unknowingly fixed in commit 42415d163e5d ("rust: pin-init: add
> references to previously initialized fields"). Before then, packed
> structs compiled without any issues with pin-init and thus all prior
> kernel versions with pin-init that do not contain that commit are
> affected.
>=20
> We introduced pin-init in 90e53c5e70a6 ("rust: add pin-init API core"),
> which was included in 6.4. The affected stable trees that are still
> maintained are: 6.12 and 6.6. Note that 6.18 and 6.19 already contain
> 42415d163e5d, so they are unaffected.
>=20
> I will prepare a separate patch series to backport 42415d163e5d to each
> of the affected trees, including the second patch of this series that
> documents the fact that field accessors are load-bearing for soundness.
>=20
> Janne Grunau has worked around [3] this problem in the AOP audio driver
> downstream, which was the reason for adding the
> `#[disable_initialized_field_access]` attribute in the first place.
>=20
> [3]: https://lore.kernel.org/all/20260301171222.GA22561@robin.jannau.net
> ---
>  rust/pin-init/internal/src/init.rs | 39 ++++++------------------------
>  1 file changed, 8 insertions(+), 31 deletions(-)

