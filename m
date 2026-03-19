Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021139.outbound.protection.outlook.com [52.101.95.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98843DD516;
	Thu, 19 Mar 2026 15:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933524; cv=fail; b=Y4l1dYKFrj4oIqT9bKK5H9GRu7SUcKtingkhfAqek38gaT3udf9iyKPj9h91+jNYa6ygsbAL5Zlc6nzY/0KJCP02WSN29pL5zHeES1+CtIsJ5vSZ3tBGOKkumA1oUseH/aKxrtbp6zH8toA8PuqO8LAN4SGO4VJ5K/oIeV5cty4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933524; c=relaxed/simple;
	bh=mKQQj/GuaidLYowJ5S8U0TJpDY0OHuaTxV2lHsn+sao=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=o2rRmooaVZ5WuE5jGCSeg93FFZYUXDBaGg5QtrfcdSNOLf6GsJEJNm19e4BZLtG9kVUayUoBh7cUsyADvljEB4prToJU/setbHJ2jvcbWeHtgQnQceEzHsl2fNdOu7aX+qUhoKGyHZpOaLd1UAN112HxZeM7hVMV5JyMW/OgEZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fh8eXx8Z; arc=fail smtp.client-ip=52.101.95.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fh8eXx8Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jflffg1uWPdb+t2b3lRVYU7/hMR1tYCZyCbV05rp4rb2Zv4r1m6ypHdYXgCnGl9oW7GsCyCr9yY7BsViemJKJobqOTWNyn7LrO5OrjBNfefrfGSzIGw3zwfy403CUoE9l04mGlnRjWv4orU8SgneCp779MA+PYvURQbGAaara2Ph8WunCmb4bLMrSSonrb5FdHKUARfuwnQ1T6GQ1SgvfTVQlfu0353Kelpv4/XpVAXuLr+XIcbgq+rxH/GKsD/zhfG1G9xKI8invMN/AZM5kq419C1JCs3U3ot2Yq9Hy3tB/F0R3b/y6dhdcqSYZYmeZ0SH74MgsPw+R5UOqngoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YlM+AGPii8CRTUeDHd3VHXTK73S3/5bGYT7eW+i4nM=;
 b=V87tUZrvMgy7naQC7zqeyDUGjZ3SC6krfjUIB+XPh8rt/c5TRnEL0ctslM0vKJsqprgw+Afcatz6h5l+wrGRFMzcI6Yo13FuM/W6vXsEhIweqG3y4OiihprSsP8Z3DnPLsTgIFsP+0YQ/G6LTc4MOBrFvnIq0eptVbSedlR3FeTe6ef3PBljfBPJ5zP3OSbVYT9FHWDa1EVcQzr8Y+0bMphSi0ngWsoiJAu4i7lvvhYKMWpyit46AOBhBuEHmdKsfFQ2oh4Nq2/LJhBmYGgTJF+HIpNSd8z78EegUL1gzUTgO/GL8ehhbAIWdHX2ZMdLdF0j8Pg4ISMNCJ5yVDpCvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YlM+AGPii8CRTUeDHd3VHXTK73S3/5bGYT7eW+i4nM=;
 b=fh8eXx8ZRCVM3LJCZuduvAOjifrJwJVqwx9UPmQ2muELpAOlcvCNbdB8zfUKsZGajbK69nvTmbyxNyuXAk4yTsWwh44rpOf2eFXS5pKq0JeFtwfSN8eTgr7l5oH5U0GG9gm0KFFtLkpYQAfxnXV9YRM1qBgWUTrOI4m6fr/BxR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3089.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 15:18:37 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 15:18:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 15:18:36 +0000
Message-Id: <DH6UY7A4QHMM.3GI402M0XOZ9A@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] rust: pin-init: properly document let binding
 workaround
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Antonio Hickey" <contact@antoniohickey.com>, "Janne Grunau"
 <j@jannau.net>, "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Oleksandr
 Babak" <alexanderbabak@proton.me>
X-Mailer: aerc 0.21.0
References: <20260319093542.3756606-1-lossin@kernel.org>
 <20260319093542.3756606-3-lossin@kernel.org>
 <DH6PJM6X9R2C.29F8J9JWL2S9C@garyguo.net>
 <DH6U85G4S7IZ.2JBY2FTMVSJB7@kernel.org>
In-Reply-To: <DH6U85G4S7IZ.2JBY2FTMVSJB7@kernel.org>
X-ClientProxiedBy: LO4P265CA0239.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3089:EE_
X-MS-Office365-Filtering-Correlation-Id: a41d4c29-5130-4010-4313-08de85cacb2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|22082099003|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	BRUfeO9VgT+2ISCMdAIsqnZzHztGkXXa8Zx/RWJe4Bris44olnW24n9IF2T1jr9JhhkJj169jSmM+EYU3G3PPLJHjcwHC8WEN+m/d4FoBApCBikBsdgCXYQJIXZdb2vhSb5gKkf17IMwclb//Wyr/SsGqlNbzGN8ewFXEUZaG1C4CO01/uQlU89XYwdJL7u+kwl+8ObvNC+ryPVQD8FR7gmFtbbWAlUHQRgw0SYDYLEUG5hIc/tATSD0DPWt0ZxH5r76YfY+7xiEn/7tO/0i3NGXpmrLNS7ttt2UhjyOHA1DvzEIRVyVt4VQHat7M+8LD8qABtdC9oVmhmOLW4SmMlWZp/L+v61EcpHeJ5oo/RVrhd14xgTI8kKItBhz+9A2grEQluBb3UhD4eM5p6PNfk/PFRyn2uFl/LG3+5J0QuH9j7jAungIIZ4DFRSmnQBsBMEnCudkroH4WyC/vyykO85zt+9Vd6pO/30TEX+FYMfmXJRrFLIiWGVAvzpsSXZbFg6EuP3JQGkTeK39LzigJsqr5e+XkX+WudkuZZMQDg3yqr4nMceZpa64VdKq1zMnRZZ5xyD1i+HQ/g08yJ/bo5QEt1HBSvJa5f169+utKnsl+CTjBNCaDU+v3HcQbgKJImC7vikRz6+mXLgnhVGzhpmoMD8RS2QlUhwmf++MOq3pVxA4/PUGPh8Mrno+P7m8TYw9nCaiehNAiAxh9EonHBYkhoEV8we6szbgMBnWpZA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(22082099003)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0dCU0FQQU1DNVNQK3dkcndsemNPazdUaWpYWHgrcUJyWTFlOUUwVXlIZk43?=
 =?utf-8?B?dnh1Z2tVUmRzcmFSczlMWlYreG8rdURHL3c4SitCeTNUZWVDS1BCT3ZpVWNU?=
 =?utf-8?B?aCtHazIwWk8yaytwZWpSc1gzMTFGT2RiZGc1R2Q2Qy9VSWk4cjdmNnlIT3RH?=
 =?utf-8?B?cUFYSDdUM1JiMjZoNDhkVTVBSWdrUnd2M0hENkpoRi92dkZXd09ZZHkrKzFH?=
 =?utf-8?B?M3pvUEV6OEU2b3p6RTZZN01LRmpEUjFxQzlwNzhncmNFOVpGNmRIYnRCWEo2?=
 =?utf-8?B?UzVWaGpCeWNpRkJsWnhkOE5YUm1OaitNMEVrYkg0Zjh2REJSOENqUjlFdVR4?=
 =?utf-8?B?UWlZYmt2U0l3RTBzTlV5SWNCaGQ5Rk1rSDIrYkl6dlF6SVNPMFZIOThVcmds?=
 =?utf-8?B?NWFKVlRJYzVKWE5vVlpBUGtkVG5kWW43VmtXbS9ZZHIvc2xhMUtZMkJ0cG1o?=
 =?utf-8?B?ZmxSMldLWUpGUkJpa0JZdVErT01pRDkrTFQ5V2lKNzhFbjh4cTZmbDVnR0I1?=
 =?utf-8?B?d3JacTRzR01WT0h1Z0s2UU1tcWgzRFJjcVk2QURLWG5nNGozY3c4eTVsaC9X?=
 =?utf-8?B?TlBlMEg5VGdCZk1nUTlKbmxMZ3E5enNxNUtxYW5BYWhiUVVOOTgwZzUxWGVW?=
 =?utf-8?B?TXVEeEtoUXV6cWN3RDdWUUFCeEd6eUpwMG9IbEo2cUEvK1JyVU1qRHN5bWgw?=
 =?utf-8?B?bmxPcXdSUm0yTUVGWlMrZDBXK0tJRGhZaU9YRnVkbWlXVHFKbVpNN3kyMUMx?=
 =?utf-8?B?NlAwVlUra1U0bi9SSnR6ZkZIS3VjNXl3TGxreEN6endSMm5pSDZvUGV4U3F5?=
 =?utf-8?B?ZXhXWElKVTdldzY2KzhPamF6SmQxcHgvbEhtNEJMT1RyM01YaUdpZ1A1NTZv?=
 =?utf-8?B?R205aVNmU3ZSdmFJWDdNQkgxSTRjTXpFMHZTSVBLNEhyZXBtUHlGSGJORmhj?=
 =?utf-8?B?dFdxQjJYSXB0NC81TUFNcEJ0U2FHQjV6WHNxRDl4RndjUjVMa1FxaUFTdGw4?=
 =?utf-8?B?K3RQVUFEczhNZEcyd01yNy9meG43di9WeGU1ZzB5TlFZT1hSL2F6U3FrWjlw?=
 =?utf-8?B?RkE2OWtnejk4Sk5DdEx2WmxaWDdjZS9TSExHUG1LSW1zMEtxeHAwaW9QQ3Ju?=
 =?utf-8?B?YjlJcWJ1Q1FjcnZNYkdGOXprTWlBeE5rYUplMG1xdTcxSDFjQ3VMUkpJQmVs?=
 =?utf-8?B?QXRVZGxFU21zbFVTUFByWWorQkt1OURLbGVIbm0xampLL2V6OExncXE4eERC?=
 =?utf-8?B?M2NOWllpS0N2MnpNb2hqcjdKVlJBZHhhWVJ4aXJ6MjVyTEZFbEhwZVhYM0Zx?=
 =?utf-8?B?V1NPOHJaUEk5OU9yNUdHcWNZK2JMUnZNSWlqTWlkS1JncHNFQlovQkVWc2xt?=
 =?utf-8?B?d05TNW83ODYxMjRnMGoxZVlCYWRpaDFtL0d4T3Y5VFlFd3BVS1R0TW5xRHNS?=
 =?utf-8?B?SWdYcmNPL3RRSVp1STJVSVllSmUzdlQ1OTBvenRMd3A1RHMrVitQYmR1ZmYw?=
 =?utf-8?B?ZVgxSXEyUGRET3V5LzJVZGRLK3NuczVTcUlSMGxMR0J3S3V1ZWFETXZaT0sw?=
 =?utf-8?B?aENtUnJOUHlYVGxUaGJ6S0JPdmJscXlITkoxVWwxMzV0dkN5Q25uaENjenNk?=
 =?utf-8?B?aVNMTmo1cStEUGdRZnhmcUtzM2pTbTRsV2xOOTZzYllxTVlicmtBZnN3cUZN?=
 =?utf-8?B?akdheXRIM1RSZkpOeTJrQXk0YXVaUk9pTGZJRFNrWlloM0U0SkxVUmhUWk4r?=
 =?utf-8?B?S0F2emE5YzI2NjRLaGZsdGtjblNVN2FnV2xXdkNMUDAyckxtMFRtSFNVdUQ4?=
 =?utf-8?B?ZDhmRFphL3B6SHMwTVBObE5ENUxLbHNBeFk4VW84OXNqV0ZtVnNWT2NVUkNr?=
 =?utf-8?B?a29tZW1CV05XUXFjazlXTHo2UGF0SVBaMlpRT203Ym1wajdoeXZib3p3MDFW?=
 =?utf-8?B?QXQrQ1c0WVQ1bVczb1FYRGhrVGVTTnlORU9xSGpNaEFMM2FCOHNLaHNwdmpm?=
 =?utf-8?B?dkxhWHpjYSsyVm9NRHZMamFXTEVsbTROYWFJOTZjeVVzTHBUUWt2TVUya0Zh?=
 =?utf-8?B?dzZCalhRUTNUSTIzVUQyQm1MVm5OeWRwalhBeUsvNG83MUVUT1RuVHNqa2Va?=
 =?utf-8?B?WWM5b3lGZzNXTFJOR1lWd3I2eU43T3laMkZ2R3N4dEFDaHU0Rkd5bk12cGhB?=
 =?utf-8?B?M2R3V05kRU8xL0hLSzJZQlZ5bXJZTTVMODBvQVBHRXBlUWVoUy9kUzNhNUph?=
 =?utf-8?B?a1RGL3VrMEppdEp3ckgxeENmL0tCb1dObnh0S3l5VTNMdENNTlQ5YnpiQlAx?=
 =?utf-8?B?TmliT0Yxb0hIVENCT2Z2VFdPdHdSdHF3cllVdyt5REJLZyt4dTgyZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a41d4c29-5130-4010-4313-08de85cacb2b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 15:18:37.3157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMIpPxu6916Z+i4POKUaMlTlCImi56zOB2VxbYARp1zmWzi9nJrXL/gS8OMHn01GfS+dCd7RZReDFyfi5GAWTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3089

On Thu Mar 19, 2026 at 2:44 PM GMT, Benno Lossin wrote:
> On Thu Mar 19, 2026 at 12:04 PM CET, Gary Guo wrote:
>> On Thu Mar 19, 2026 at 9:35 AM GMT, Benno Lossin wrote:
>>> The three let bindings (in the bodies of `cast_init`, `cast_pin_init`
>>> and the `init!` macro) are used to avoid the following compiler error i=
n
>>> Rust 1.78.0, 1.79.0, 1.80.0, 1.80.1, and 1.81.0 (just showing the one
>>> for `cast_init`, the others are similar):
>>>=20
>>>     error[E0391]: cycle detected when computing type of opaque `cast_in=
it::{opaque#0}`
>>>         --> src/lib.rs:1160:66
>>>          |
>>>     1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>=
) -> impl Init<U, E> {
>>>          |                                                             =
     ^^^^^^^^^^^^^^^
>>>          |
>>>     note: ...which requires borrow-checking `cast_init`...
>>>         --> src/lib.rs:1160:1
>>>          |
>>>     1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>=
) -> impl Init<U, E> {
>>>          | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^
>>>     note: ...which requires const checking `cast_init`...
>>>         --> src/lib.rs:1160:1
>>>          |
>>>     1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>=
) -> impl Init<U, E> {
>>>          | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^
>>>          =3D note: ...which requires computing whether `cast_init::{opa=
que#0}` is freeze...
>>>          =3D note: ...which requires evaluating trait selection obligat=
ion `cast_init::{opaque#0}: core::marker::Freeze`...
>>>          =3D note: ...which again requires computing type of opaque `ca=
st_init::{opaque#0}`, completing the cycle
>>>     note: cycle used when computing type of `cast_init::{opaque#0}`
>>>         --> src/lib.rs:1160:66
>>>          |
>>>     1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>=
) -> impl Init<U, E> {
>>>          |                                                             =
     ^^^^^^^^^^^^^^^
>>>          =3D note: see https://rustc-dev-guide.rust-lang.org/overview.h=
tml#queries and https://rustc-dev-guide.rust-lang.org/query.html for more i=
nformation
>>>=20
>>> Once we raise the nightly-MSRV above 1.81, we can remove this
>>> workaround.
>>>=20
>>> Link: https://github.com/Rust-for-Linux/pin-init/commit/bb3e96f3e9a4f5f=
ca80a22af883c7e5aa90f0893
>>> [ Moved this commit after the previous one to avoid a build failure due
>>>   to unstable features. Changed the cfg to use `USE_RUSTC_FEAUTURES`.
>>>   - Benno ]
>>> Signed-off-by: Benno Lossin <lossin@kernel.org>
>>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>>
>> Perhaps we should import review approvals on GitHub as R-bs.
>
> Yeah we should. A quick internet search didn't reveal a magic tool to
> me. Do you know of any?

One idea that I have:
* Re-target a PR to a temporary branch and merge it
* Have a GitHub action that walks through PR in staging branch and applies
  tagging before putting it into the main branch.

Fighting with branch protection rule might be needed:
https://github.com/orgs/community/discussions/13836

Best,
Gary

