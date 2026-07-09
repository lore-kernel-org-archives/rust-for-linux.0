Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022140.outbound.protection.outlook.com [52.101.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57143B14D0
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 21:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634313; cv=fail; b=O0FOAnuPdZp1mWAMyQJ3WVGQLOlvU9vJVe0LjbhtC7pxynyo/kkEgOPj3NVskZ3Dh2bSOHUnNGN94JXlMXIT7Qv357UwcBS5OdAwFo4eN1DU1Xhvbr2CmCUMYBKQw0ZxJK4i7usJle9PJ9L/7zB0Uk+i/T+wljB6qD6pNH9t3Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634313; c=relaxed/simple;
	bh=0jbqtf+zxzF/RmJOI9xEHhw4z0NrW5V7ywpTDSyPNKw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jV7EVw7lfMNen4GG8dX/g1q86KDkHsC2+dNm0cOchdLk4vCjzKUpdnL12Kf6CSU47XBunSuQhtXPbZFKS2iGQhmLAtMx3Hdg6wlOiA14EeLQGT4YEYcot7sIuK0os98hyXFYYs0p0OSUV+khAvSt6KvzgJNY28E70rSXs78xUXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=uTmNJoNB; arc=fail smtp.client-ip=52.101.96.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="uTmNJoNB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIybI2AnHMzds/qFkD1lfdGgAEKOk38+Quuj0U8OonxAeJcxnrPad/gw55B+CI/20Gz3pA6VSBV758UGWxLaSOeo/IN8sMRlCpuoab8CCJGc1YpuSQLNOKCxOOKv+6xQtIuPTQbvTW1CHCbtQOghXAPusQWnJF1vGEwlaMLpxzZV6+iG15asUHkW/KeeSETM4PVAJ7l6yAzeqlemhWbryKjPAkKDSbZp1ksK/wio1+jyDzHn93bc0TH8lGKFBopMPzkUvf69TZQmQqO5xxNCAQ2FkNB6/gMXH3ow+fNFJngG3hT63r3cM0zq7vQA7eoz1XCgFq1VA0ePjs6vfY3OfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqgALT+fTULa0T5FxjBsCcfSu3UZyRHpi3sA1lVUQp8=;
 b=jFtrV4HQftgMIQTJKba15GogjF94zr7wk092y4zgYkwKqjEhDvZb3UZdaGBqPhkpvIBoVaWMNtHe+EFA/pI/fmPdtzVDbiQXWAUiS1FMnWAkkNEm9iH689BMHFJNfoUaCDiX4BFk0shQ/XCuWyrShGs5KYykNG13v100WO7C0TiXhp7DKQlIREFtb+j7cy98j1ZtyndhVTdWPoWmvuFW5FiiVuu+jbOHimHKuzRrf1lx0J4EdpSanFTMeLjx0iFQGirk7Y4GUiVFMzTK+9EP3h/vhldiH1Ke2SEn3YbhVuOiMJqPq/lY0jEXsMnwoyfGSam/p2g+nYRQoBouHhD6hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqgALT+fTULa0T5FxjBsCcfSu3UZyRHpi3sA1lVUQp8=;
 b=uTmNJoNBAKIjC0qfDf6890nEzbevl/HH/gF6IE7ssaim5mqxBKH0ufxT8mT+f5ZbmMmGuqN43v//xacO34GR05/MW/2yaXPVi5d9nZp2NhNBlNkS7Hi6wRDgBGeuTINAMKL+Vm2LoijkyW641x57c5wi2TP7RXBUv759B64daBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB3145.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:15b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Thu, 9 Jul
 2026 21:58:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 21:58:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 22:58:25 +0100
Message-Id: <DJUDLC05V895.2BR44YV9G2WAD@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>, "Joshua
 Liebow-Feeser" <joshlf@google.com>, "Jack Wrenn" <jswrenn@google.com>
Subject: Re: [PATCH] rust: zerocopy: update to v0.8.54
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260709211311.142544-1-ojeda@kernel.org>
In-Reply-To: <20260709211311.142544-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P265CA0151.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB3145:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c6103d-3dea-4a05-fb5a-08dede0533d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|10070799003|366016|1800799024|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wwGlriK4IvWuD1t2jt67eGtX5wRDbx3lwXxKJtPinOx2DhDJ1wAOPcWSswGtoFr5Dr/hfDznhVzSG0/tgGi6x/0jS4TOFlOH3jYPBUfqIm5yxwLXeF/8BEWRcZ8cJ4uDNA/53Yn+iVdQQnbQH+1x+ErvdKV8zz+aXVgv6m6oPP6oAxy5YEzU7JsM1R4emA0jmgsPCy5odJLEkxQz+7wFUd1DnXiAWrDzeavISTDWsWM04vlKxIfnMqh7CJqp1SViXPGqtAAa6KpOeFiKvNpj/yc/oubJhRT3bdCg3dq9tojGZPidT2G2jgJ//CikUx96I27GMWV7PoTBn3D6G3olsgnNBisyhHqCkuieIl0ATWxpYzzYu2RZCiyLe271s2N1wfgmZ1de83Rx71f2mhP+XDaJML1NMWJArNmDuMlY0PgV6IBa1EHu7fkPCMPzcpiNRf4R6eKvWJ6I0zs9lX/6rq8+IeTmSLY/Aawez8RJQ/sGg1e/9fjDSPTBhoY/3Jfrdb7tU96kbCTN/+lFtYKHyHyNhx4P1WLF/oNJCOG0W65mDzRshRJ9clxyaGqJAcSvzvFMKKkrtKuv6o8sO0MpYdUhffybuu2BW1fXP4oP56x+IrF0aVktbhQ9CfpuQvI/MC7LGiGBbrYZNWT/N49HNXN7I61nlNveXilnk6OIfew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(10070799003)(366016)(1800799024)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlZHUWlvWS95SWJoa0NLVndNL2hRNFl3OW1RTUVCTml0YzFKTi9OMXovUmdP?=
 =?utf-8?B?Wnd3ZW9mdFUrQllOdGxqMWk1MTl2eThPcU9jSGZMQXNRVDZRTGQ1RWJRTUNq?=
 =?utf-8?B?KzYvWDZhbkVkN0RIMnFHN2FGRWcrT20wdit5L25FdmdzUUJDVTFXaUJDNytr?=
 =?utf-8?B?WUxMTm9WY0VxSVptSjRuaGwxeWlEanczTjMvSWdKZTZwazZCc0s3QkR4YUcv?=
 =?utf-8?B?b3JpOGVpdUprWDMvMHBkSkRobVNaUFNXZ0RUOEtqRDQ5Q3ZQeDRoUXYyMkxu?=
 =?utf-8?B?NUpqYml3a21TT0lmWlBWK2NxMDFJTmdkTEtoM2wxTi93NEd6V2tueXZJWExm?=
 =?utf-8?B?N1JFMmVCK3pJU3BjQ0g0eUFZaGJiYTFrbVdYR003ZTdnOG00N0g4WWxXWmhJ?=
 =?utf-8?B?UGhKOUlDMVUvdW05WjhWUGFsR2tTK2pwYUdDOTdZNzM1SURkTHRIMEFmc1or?=
 =?utf-8?B?TEg1bnYzWDFhYi9hSDFSQjVnYTg1WExNMnEwWTNiYzlFL2U4b3NNWXBDcW1a?=
 =?utf-8?B?dC9XbVorS2x5RHgxakdaVytYN2xLdUZKTWdPaHZOcnlVT0hOMTBLWDRHZ0Zo?=
 =?utf-8?B?T0l4K2JjamRDMWpqWmRDSDh4cExnVERaSkJzWXZEMG9hSHRQaWgvWjF2c21P?=
 =?utf-8?B?S1luRE1lM2wvaDh3aTUwQlNMeFoyUmQreGM3Qnk5QkV6VGEwbldxVThmaGdw?=
 =?utf-8?B?bURJeWc2Y1lkWWNrRUc4dVU2b1czYUh3anJteWtMV0pYaE1rRDFUMlYzRGF3?=
 =?utf-8?B?OUhFMk1SdEJwSHpBS2RXZG9sc1lwdXJReVFsWmdqSTNGdDlJc0hkS0xLckFq?=
 =?utf-8?B?YUdJQ0wzdmQ4SkxucGh4WCtqZE9XeGhFTDJqZGs4T3Zad2xZTStRaUxVVHJi?=
 =?utf-8?B?YlgzTEtYbjhnYWJQdjhIN29FVG5NeUs2Mm1lZGw0NGVYU1Q2OEg5WlZsVzJW?=
 =?utf-8?B?WktqVmtJRkhYeW9xRkQyeDBvbS9ic2Q4aVFRNTh0eks2dFpFTllwY2F1aUYw?=
 =?utf-8?B?Q25JbHhIaDY3Ym12Z1ZtcUFwald2QTVOQmxqRHQ3dVBMZSsxbnp6WmcwRDNj?=
 =?utf-8?B?Ullla0hUVG1GWE1FdGwvUThvaTQ3ZVZIT1F0SnIyZk9QdG5XL3M0U0dDWjFW?=
 =?utf-8?B?cHVzN2hDd1FBMG1uRGRNbkI2UTBydkZIR0ZKM21pWEllcEZWc214MCsyQ2JK?=
 =?utf-8?B?dnN6MEk0MXozd1JZSnk3NkF3MjlJZmJ0eS9OTmFtWDlIWUlWUG13RG5PeGIr?=
 =?utf-8?B?aDZNWkFtQm9RQ05OYVNoN2tmU0IvZmF6TlZBeURJSTl0ZTIxU3F6eTNFMGxN?=
 =?utf-8?B?TFQ4SEQ3RjJTRExrUjVmMGo1VDJyS3hKWHdzakN6dXBDQ3JEeUxWSFdVai9t?=
 =?utf-8?B?NnBwL1dQSk5aenhIME5PV3krd2ZTT3RtRUozVmpHZWJPWStHekhTOWFoaTJT?=
 =?utf-8?B?b2ZTcG5pdU9nZDBLTHRDM0FNaDEwUzFNNlM4VlpnVVBvVEZNNXp0ZTNoSmdp?=
 =?utf-8?B?ZmFVMmdGOVpWYWFPMzV0b005N3dIcEJjTWVXT2ZjeVZZbFV5bVR2U1NUbkFp?=
 =?utf-8?B?cUlBSjRoVlMzWm1aUGdIL29Kc1VLUE82ZXlwMW5YSWdkdmF3UUNoRVZPMVVY?=
 =?utf-8?B?M1Q5MVdoNTYvbjlSOERQUURFUkhzcC9qRW1Fb3k2MnZHR2NCanQydVNFdGo0?=
 =?utf-8?B?SnVsdGg2S3FrdVYxbUg1OGFlYmVTVkM4MmZuZG9EZGNiTmczZDQvZFgyaDBh?=
 =?utf-8?B?QWtXKzVrZENwb1BIR0ZoMnhrZWo4cUsxMk9MdXdvZ0xlRDlDc0QxaVpLY3FK?=
 =?utf-8?B?TXo5M0dqN3NZMXZVcS9WOXNzMUU2TVVObEZMeDZMemh1U09xTkU4aUEyaHZM?=
 =?utf-8?B?d05DdDZvMkFKZlRSOU1vMTV0WGJaL2hTV1NlSDdVWEpQNGhkZWpTbXp5bmdi?=
 =?utf-8?B?SXUxSnE0UVNYdzNIcmkrUjJvcnEvdjNLdDNnVElvMTRlWWRkUURBZ1BHODRq?=
 =?utf-8?B?YnNPdnZmLzdWU3ZXdWZWTDRiM3pxMjdGK2JjQkJVSTRJYklPK2tzK2RoWmlx?=
 =?utf-8?B?RUhqdzlVYWhHWTI1ZnZUNkplNnRFU3pqYjR0Z3gxYnVoT0dFSGI0a0dBeXg1?=
 =?utf-8?B?Z09uSk9YVmg4TFlNclRVUlk1MnYvVk92aE5aY0krMGFNeUtaazVDc1I4UDNw?=
 =?utf-8?B?bmY5dUJuU0ZpdWszbFJqakluYnErNzhxZnZ0R2pwcklpc2QvNEZ2cytWT2dr?=
 =?utf-8?B?anFWM0dkNHJMbzc0VFJ3YytoVzhINndydUM5d0xCVFltcDZsOXBFeFh6cHo5?=
 =?utf-8?B?UXFDUHFDa0g3NndLem8vb0hVcm5JaUErQ1BrS0IwL00yZHVLSWNkZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c6103d-3dea-4a05-fb5a-08dede0533d4
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:58:25.9449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVBWPSjK5mQkmulgcdE0UhMAZQ5IzGTu/ANMEwugr2VXn15q/JPC4aiUKoGLktXpFiSzCfiYvX/9Hh+CJ7G80Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3145

On Thu Jul 9, 2026 at 10:13 PM BST, Miguel Ojeda wrote:
> Update our vendored copy of `zerocopy` (and `zerocopy-derive`) to v0.8.54=
.
>=20
> It is a very small delta from v0.8.52, and most importantly it resolves
> the unexpected lack of inlining [1] which triggered a modpost error
> under `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy` reported by Alexandre using Gary'=
s
> suggestion [2]:
>=20
>     ERROR: modpost: "_RNvMNtCs5wX7wwEUCR9_8zerocopy6layoutNtB2_8SizeInfo2=
4try_to_nonzero_elem_size" [drivers/gpu/nova-core.ko] undefined!
>     ERROR: modpost: "_RNvNtCs5wX7wwEUCR9_8zerocopy4util18padding_needed_f=
or" [drivers/gpu/nova-core.ko] undefined!
>=20
> It also resolves `most_traits` being unexpectedly documented [3] that I
> reported and adds a missing SPDX license identifier [4] that I requested
> to match the kernel version.
>=20
> The following script may be used to check for the remaining differences:
>=20
>     for path in $(cd rust/zerocopy-derive/ && find . -type f ! -name READ=
ME.md); do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.54/zerocopy/zeroc=
opy-derive/src/$path |
>             git diff --no-index - rust/zerocopy-derive/$path &&
>             echo $path: OK
>     done
>=20
>     for path in $(cd rust/zerocopy/ && find . -type f ! -name README.md);=
 do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.54/zerocopy/$path=
 |
>             git diff --no-index - rust/zerocopy/$path &&
>             echo $path: OK
>     done
>=20
> Cc: Joshua Liebow-Feeser <joshlf@google.com>
> Cc: Jack Wrenn <jswrenn@google.com>
> Reported-by: Alexandre Courbot <acourbot@nvidia.com>
> Link: https://lore.kernel.org/rust-for-linux/20260708-zerocopy-export-v1-=
1-2bfc355853c6@nvidia.com/ [1]
> Suggested-by: Gary Guo <gary@garyguo.net>
> Link: https://lore.kernel.org/rust-for-linux/DJT6235B3DOV.222XR5O6VHG4M@g=
aryguo.net/ [2]
> Link: https://github.com/google/zerocopy/issues/3466 [3]
> Link: https://github.com/google/zerocopy/issues/3457 [4]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> This goes on top of the v0.8.52 one:
>=20
>   https://lore.kernel.org/rust-for-linux/20260625231919.692444-1-ojeda@ke=
rnel.org/
>=20
> I may land both in `rust-fixes`, especially if someone else can confirm
> it works for them (I reproduced Alexandre's issue and this does indeed
> solve it).
>=20
>  rust/Makefile                   |  2 +-
>  rust/zerocopy-derive/README.md  | 12 ++++++------
>  rust/zerocopy-derive/lib.rs     |  2 +-
>  rust/zerocopy/README.md         | 12 ++++++------
>  rust/zerocopy/rustdoc/style.css |  1 -
>  rust/zerocopy/src/byteorder.rs  |  1 +
>  rust/zerocopy/src/layout.rs     |  2 ++
>  rust/zerocopy/src/lib.rs        |  1 -
>  rust/zerocopy/src/util/mod.rs   |  6 ++++++
>  9 files changed, 23 insertions(+), 16 deletions(-)

