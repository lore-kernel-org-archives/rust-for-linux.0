Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020081.outbound.protection.outlook.com [52.101.196.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4F232AADC;
	Mon, 20 Apr 2026 15:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699516; cv=fail; b=EkB48X8nNBD6raCsw09F+VziETHV7TUPhnCsp+ikQOVpxtdvif4uymc6NzVk8YM+L9Q2/cxL05dfNSVyLhgdPU8FHqu/YoAmdR17sQtdlSqADpzHmLroK/nO4YGQahZ3K0uEPj7xF68qkQg+0E522ldkV6tjhcUpXWIZc3E9xfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699516; c=relaxed/simple;
	bh=CcYCTI2ngVR2A7oUOZeapF6GZ0acbKqwpTB5lZudJIg=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=YX5+zaZMh3biBWAgVQwuK+XJp9ON1EzK97ZMf3S4kiuQF2S9xspTD/ENcG1mSq/TFiqQ7OsnRflMq2nxDZBghm8dxGUOEmqLjjSNr9Lzzzo1IrpbR/UvACrq2Ox+S7d4gNXtU0rDLPeED58W7Soz08g+bIKzNiwjwZ/apE3kOCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Gsw+Qsne; arc=fail smtp.client-ip=52.101.196.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Gsw+Qsne"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+NU6jnnaidbK0Khtd4+BwLCFB5Jh2TRg+Pf5rEV7QFAuJpq33WDCINXRq/nuu6oFgmx9e30iUa8smXd9t8+rfVonculpouv9ZFhIxEBs8x7uJVf4dwHOJIAcFDOj2Pm2fYQTLAaN/0T4vnYcJKBj1kOA6L3Y6IWK7mqsv5wMxmFzLWUmPozyCKKSSB4s737svHWMmB6MiK7DEedm3KbzCOb9cxB2dLgfH+4ubV0AzoD0LEpdBomSFnqAl9Wkyj+9G/740y7yjOoxKnxaPTbXRkCxjaoLa6UKa5yaEPQiToa5Qz6LpdCa3ncR7Kz9PPCtuqJQ9okOfeO5TevKWTNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y844hGU6GEmxVpI6CjymvEDZ1pA+jm0vCBeuTVg2Hy0=;
 b=TdWEpGPoBxHcV0hvdQXo//nCdJs1AiQurVnCdyIwwv23oqfkMN2XWuUOdxyy9ym/KyfF7qAV1bhuZjvImgAl8VvUnBKXGf2lEUpyROYQ+wojXGY2eiWi5NnyhioXCbH/h4PNbnNUOt4tp/jTrkSJ9OATbGRb9pRtStqirYsF7rjRFfjHMlsAkHVtyjSuOEBrd9O3HKWUs7hH8zB1YjUorSIQ9JCev9steRB5U9HBCL/88rWc+mCbuAke0drkwxrcxwb9TJK6lanMcYkK5sSdvD9GzjY6mzQ8lOM5TJQSlolDFkGuLqxb5em2SPjyTtLh4Lq3yEqksUF4nZWYbXVR3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y844hGU6GEmxVpI6CjymvEDZ1pA+jm0vCBeuTVg2Hy0=;
 b=Gsw+QsneYw2wxU/9rbzwJjNU5cEFSUvGv+021UItinaaaCJ2F/uX8MYmIf6CngITIGhsu7AwA3nnIhI12Az2AKo52ytzSqQbKNWrZsvntQEy7ykMY/iOYcnybTz69M8DXwV5INL6jil6X4Rghixpjt6LVC1EDgNaR2nHQ84me5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB9285.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:495::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 15:38:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 15:38:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 16:38:28 +0100
Message-Id: <DHY3EUA4LHIE.FAP0QSKIZWYF@garyguo.net>
To: "Alvin Sun" <alvin.sun@linux.dev>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH 3/4] rust: xarray: Update StoreError comments for
 alloc()
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <20260417-tyr-ioctls-deps-v1-3-41c6e9bb061c@linux.dev>
In-Reply-To: <20260417-tyr-ioctls-deps-v1-3-41c6e9bb061c@linux.dev>
X-ClientProxiedBy: LO4P123CA0652.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: e541bb14-ed5b-4db1-afd9-08de9ef2de93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3ac+nOOBg/ZJXnVYMHEBJTu/BmpOxAwmYk7OcIhLTTUxFvIwUcHeVazC9JDVXZiaRhN4uCahr5xhY5X8KgWyyyG0WOwvnMNN0GKswMCymdIyAvUnFxcLNYimAg+jXfnbatRkT9PJU+vUrav9vKYCib2EBM1h8EEMKkMjnci0BxHVPKEaY/dh0O6AMXbFScnggabgA1OvBeDCgMdY0lqWulCBYY2g5q94bZl3RyYR0yGS3V2Eijyjz+ElBZtGVzl20P4wgMHpcOQGegtr60PPFspw/21zVjrSLul10LNFMI7uNIisJuax2BO2Tbv2icl35XBIh2YsMqkF3bFkZg2VwsE9Yvi7ILn7byfaR9hul8q/xu1fqPW+OLHmLfFRj1ralVscA+rcsz0656UFS6K/KDPvHZXuGL5+W0L/leE5LZDt9DeV4OGCjE24e/qYpiOiBjte5iVrhA3MkpCSs538RXIZM8/NTRNVgrh0tRixINyAFukwFwNXdFMDMTmnSB91Qb3chsloz8CJuVt1xdkcqYGufGy/+3mXpA//Wnyhxm9FPOtr8cMji9E+OQ9grmmZ8O0teqq7ZY0OGI29rcZ/Zq5e4+PIiirA7LftE/mbGWbzJCssbuauc3vm8MSKgsnY/GoHWOfogced4HkeSdk9qbCMguIql9qc3PVC07NaeNEu1DxKndVrUSjvrAbuSJATlWXxlZ1mj/rXU1Jyuu3mJwSLGmDfu7sBDXihhQ3LtdSlCTdtg+X5j8zm0VAES6+S2Fza5XShLcjb0nyk7qN/4A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1hGTCtyRGVwOStVZ00wUnl5U1JyTGR5NlRRa1h0L0l0eGs0Zk92L09WbUE0?=
 =?utf-8?B?ZldTeUlQcDYydFhCMWZNcDI1UkpkUmFtMmk3N1dUaVgyNnV0a0UvcnJJTUhJ?=
 =?utf-8?B?bXVXNThncGxuaHllR2R5dnJOczB5MXlINi9rZmZ2S2xEWmhqSUJBR2l2OGV3?=
 =?utf-8?B?WEpsSEtobmxFVkNuNlo5Rys4Z2FLckR3cllvV2ZBYVdud3lkNTE0V0h1R3la?=
 =?utf-8?B?d0xnbHRnRlR3N2JoQjlzQTg2RThCMEpqT3R5dy9VU1N4c1FpZ0FsT09uTmEr?=
 =?utf-8?B?WHFWR2ZzZGMvUmUwKzJvNi81WnE5WkFCOHVjK1UwMnZ2djZiZU1zeEZTT1o4?=
 =?utf-8?B?cTNKK1hqMUtJMUo2NFdsU2JEdHp3L0ErbU5rc3RiUnBRTGduUWRab1FpbHJH?=
 =?utf-8?B?aDdTcGlxbE1OeVYrMXBoQ0wvOUtNL1RHU1l6V1JleFNqZFVUenNrQmtUSDRW?=
 =?utf-8?B?Um1hSUpiVWRPbVRmOENncWJmR0JtWnBqOXlIRldTUjJqcmMyL3pSMjFLODRI?=
 =?utf-8?B?Z3AwV3dsQko1cjFhSkovTnppTzhlNHdNdXpCU1owRjVYVER4emlvR3UyVU8z?=
 =?utf-8?B?cDMwWWw3UU5KaEp0aks1dXFMUS96UUtFZGdCdk14QXFTWWhMNzJTV0UxaWpL?=
 =?utf-8?B?NFY5RHJSKzhXS0VBNDRVV01ZMFpOMTlQb1FyNDZUSEJnaGwvQkQ3N3MxZk1F?=
 =?utf-8?B?cExPWE5Pa00yNmNMSFpaSnZsM2JhVEZtS0NrVE94U21wbEFoQ29JNEIyZFlz?=
 =?utf-8?B?ckx6QklmV1JUWUhZZ0wyMWJxaFZ0SEtYb0ZvUjVtN3JTYzFveEdmdys3ZFBX?=
 =?utf-8?B?NzZ2RlQxZWJoQ1BMVDZHK3V3UXJhT1A1Y1FPMkJ0RnJOWDZ1djlQaXdodkFm?=
 =?utf-8?B?bHcvaWtBK2VqUDVNM0NjbzQ3ZitVcTAvbXVVYzNsUmVHejFlR2FRSS9lT2Ru?=
 =?utf-8?B?MGlSZUtVeGVnU1JMVkVaRVBneExrT1RoKzJzRXJ3L2gvTzA2TnU1OWRyZ2li?=
 =?utf-8?B?ZHlHNmM2MFgwalF2MkM0cE9jMmxSL1pmaUNNeGlDWmRpbmhEUXRsYWZJTTRk?=
 =?utf-8?B?dWR5elU5aXErd2ZMaFZ1aEpvWjY4a1JyWFJrcWNRV0JJQmxwaG1RSko3d21Q?=
 =?utf-8?B?d2s4SExDMEtVbTVKeDJrYjhSQzY0YnhsQnhuRHR1NmtYRVBPQnZtUGQxdkh5?=
 =?utf-8?B?bzQ2aDRqTk5wNUsrTkJyY25vUmNzMUsxdXJKOXBtTUl1cHVtTkJzNXNTV0pS?=
 =?utf-8?B?KzJUbE9UVmMrSVpmSmtsN2ZRdnZISGFHaXdkcElxKzk3MUFTUjgreGVrS1ZQ?=
 =?utf-8?B?NkwwZGNndzRvRGVXYWszYjExdU1hL2xRTVpWOE4vcXl6WE1YUVJWZWtVY3c0?=
 =?utf-8?B?UzEvc2dxckZZM2pCcUNGRGI3aXJXdUZtd2U0QkdSenBwc2ZXamlORGYvRmF3?=
 =?utf-8?B?ekxzRzM1bVhxbndFcDJRait3L3NjZGxWRjE5NVB4V1ZlMlNXUC81alNqOWlp?=
 =?utf-8?B?OVdXYnRaaFZmUjJPVDFyZmpJOHBEbDI4WmVMTS9rSWFpWm5YNVJKM1czakhr?=
 =?utf-8?B?MVFCQkJCa2ZmQmFzN2F2U2h6UUI1QmFMWlRISjc2U1I3VkgrY2F5dDYveTNR?=
 =?utf-8?B?YTN4cExOSEZwaTR5OXFwNHFHOUR3U25Icy9PQmhKbXNCNWYyQnZuQ1V2TWN0?=
 =?utf-8?B?NGpFK2tRZTBEZDh6enliazlxQ1lJcW1wWHJNTFVGbjBkbjk3UWFTeTI5ak5H?=
 =?utf-8?B?NFZrVU81WTdESUwvUmE3R2dEZmtnakxjNkp4MlVlZG94YjFJTldScXpoQ1VJ?=
 =?utf-8?B?dkZvTi9CRWlUSlFnT1hOK010L0kyZTUybGdrTklBTGtoQWdUcm9SU0FRemo2?=
 =?utf-8?B?YjhZTWlyR1hmOE8vVG0vcmxCOXRhMEtiM0F2akZQeEhJTmtEN1hTdmtZTDRx?=
 =?utf-8?B?c1Q5cjVWMmphWHpPSmtiS25qSXpoOC9pK0dsN01VaWFoMGp3eDRkMjRIQnRM?=
 =?utf-8?B?bnpjMFNFTFRlamlXWjQ4a0lXRDJxTUN4VEJvWit2UjJlYUZCd3ZjSDdmZ1l3?=
 =?utf-8?B?UHc2UWtNVVQ1ZjFMNEIwZjF1d0pqMU5ZaXBzOXNETTBndS9iOGJobC91a21q?=
 =?utf-8?B?N05YYmphZzc3NWlKRjIwYmRUc016WjVnQm1ONWhWSlAycWpSeUFUTTdJaUQ4?=
 =?utf-8?B?YURlWnNtcE94SnljcVA4S0pyTHJIWFN5aWVjbGtrYXJSSlpYNzNaRGtCeG54?=
 =?utf-8?B?ck80ZHUzWVk1RWdNMlFwSHBZV0lJUFdvNDJHVmc1b3dTeUorRi82a01wV0Nx?=
 =?utf-8?B?U0FMc2dUM1NLUms0Mnc5UXVRcW9KclJSNVgzcFlHYUh2ZE9tY2didz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e541bb14-ed5b-4db1-afd9-08de9ef2de93
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 15:38:28.7246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFxLSoaLDyCezNmf63qovT3CBqO9YWPan2zKUJYol5oVt2i9Sv/caSilNeHGFqTvGnsFHiLtHpJZLERRI+KaaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9285

On Fri Apr 17, 2026 at 2:05 AM BST, Alvin Sun wrote:
> Update StoreError documentation comments to mention alloc() usage since
> this error type will be used by the upcoming alloc() helper.
>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
>  rust/kernel/xarray.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index 1b882cd2f58bf..235fda0e394ba 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -161,13 +161,13 @@ fn drop(&mut self) {
>      }
>  }
> =20
> -/// The error returned by [`store`](Guard::store).
> +/// The error returned by [`Guard::store`] and [`Guard::alloc`].
>  ///
> -/// Contains the underlying error and the value that was not stored.
> +/// Contains the underlying error and the value that was not stored or a=
llocated.
>  pub struct StoreError<T> {
>      /// The error that occurred.
>      pub error: Error,
> -    /// The value that was not stored.
> +    /// The value that was not stored or allocated.
>      pub value: T,
>  }
> =20

This should be a review comment to be folded into that patch series.

Best,
Gary
