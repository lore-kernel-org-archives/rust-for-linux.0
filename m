Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020114.outbound.protection.outlook.com [52.101.196.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA37F390210;
	Thu, 12 Mar 2026 16:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333546; cv=fail; b=Kdx54DR13CPVPwfCq08N1JRC6Bzi+eFy0R/e4+xVRmTVdO78a3T8WpaqClG6KEHlXlnSe8T38PICuu/gL5uvpS/w6CFAJT0p7jnkXM+zdgUjyIexi23UUBZ1izy4cY/Brm2VIb7NWCz/wh3HHylZgr5SQBHn16hvGztPXRfZTwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333546; c=relaxed/simple;
	bh=dKGC/5+dsYBya7+xh4u9/59QglXk6zuRt5mVVvxhgPg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=Plw/yaXZI8/FACxwozztyvblyyDfS1Alv/QNAK2q+jF9489DM9kLm//r5hBBAcp8dr47rElxFDJU5HyEQunsUM4LKb40KI60mUmcU2ZvWS9d5h8ykmM5MuF4u6DKYoAugPsbioCmUmcxLMPk5iigptD3H2LvnS/VoDxzKPewCQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=I06Q6Ww3; arc=fail smtp.client-ip=52.101.196.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="I06Q6Ww3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmUCu46HmZkL6R8VfjHzGkC6T5r2m23jYhoBXAcm7Loj/1Cuzh5xdi3x3sHGr+0GwQsnAhVL2/E+8yraClgnoE0koEmFg7tNCfl5nJkORL/vqV/FUGmuDx0ZYADRKE1PWXL7pJ72BmtwfWJHa+BS0Bk2VU87vPllgjM684uv/2MDmKOZhSJIOlJpXbQBLVedodc4wsofAVxWNCNArJezkBwua18pSE7MzoRrKx3KNvEBnQlLhbXfwDQqNxucK5PeEftmk74bloPZK3mwiojPpoABwNj33QeeC0rqsH9wDlvvS9uZCqm7HTKcwF6ZydFOuqvWBlVwzee9sRx4bZT2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8m/585sVreSlbKnYv27TfLKp+K07X32yfXveixabzc=;
 b=G1NOOYZJpTw70Sj1gdnU36mi/EkQmGFtiTFxk14rKnAum5aFv19/u/Na/cu2qCTYiGwrBU1OgEk8+ieXsZNemKMGj5HoahJMkFX8evl376RSy2PgZFXw8hNMy+S/T7lG5IoRWKMAco32DHo23zBsV0vZpSZxKJbCViIIovAQGsjZ7+tflSQuCBrC/ZhqefUKWPMkoKG9+tCRuiig7+dm+hKoslNzcWOS/khnIsg4YLlMFYjGO2sdeRTrHThmZx1XJBHPUDL7B59rZqhJZLGDZX/ocHJHqBpfRvUqjEebmFF1sy1qm1w981xzgEXERnhzf8d1vnnd84xtXHRt7W9mvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8m/585sVreSlbKnYv27TfLKp+K07X32yfXveixabzc=;
 b=I06Q6Ww3JyizTla70/FbracCt8kFf/TIZ3o3R6XFuQ5BdKju/KHmKFnFDsMh6LpX3oI4Pa5CxV4gvLM75sXzdSaRGuZ3eaz2veK+sRRFUHiVcL0K9QBmS/OT6FZ4zblq8JkhzqnAOUSht84SLDMcT8/cGghJJPV2Rb34S90pP3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2095.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 16:39:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 16:39:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 16:39:00 +0000
Message-Id: <DH0Y9Y1KIOQO.MECK7D06XFXP@garyguo.net>
Subject: Re: [PATCH v4 3/3] rust: workqueue: add creation of workqueues
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Tejun Heo" <tj@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Lai Jiangshan" <jiangshanlai@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Philipp Stanner" <phasta@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, "Tamir Duberstein" <tamird@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
 <20260312-create-workqueue-v4-3-ea39c351c38f@google.com>
In-Reply-To: <20260312-create-workqueue-v4-3-ea39c351c38f@google.com>
X-ClientProxiedBy: LO0P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2095:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d104c9a-2a39-4793-e5d3-08de8055dd89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iZLhVua+MZ9Q/h/9KJfHAY7B3UM7ZAxPodqF2fLLtQpBIJTRbs6BVbP4G4nDmGDbMXnynOYDZYNk6ftXgmifYucTZaQaO0TRY50G66wcUNVRwj4c2FS+Dhtf44FxNjNxh7pNiX17n6NRuan41IRafiNNSc2S67x1ocuQ9NAm+uHvy2jKB3Bhy9YM1TDsS83LtOHWxHexHga92qbaLK38EOr0mKN5iJMnBXarvWpR5HN/Z1LqfmAMww6srE8yBgLQX4o1QC3yJRGOZlPXbXqu9kz2PWT0nBeXuvE8jwwqBqlA5JSwJQuTFYE9gtnHAwj7rAfmEQ5bjYmS8qUHZ3wfIAeCSY5UPm4J5M71ZDMnlT6UlxQ9jKQ1NuEdnlBvylgawqbF/7zs5ua/uRAm4wpJukuUqsfJjr/X3AAoftX9pNxQPzS4hYcMXYN3h0ZpIwdmkeyzZAVCkMN+4YRO1QV11DApwny4jmoDqV+2dslsUBqV+PRVkktGzU3jX8iCpeLpclz4N8jxzGYWoM0JP3JBjNfaUt+kBAafdBWQ34h9y7ldGBXcDpzioxfFzShWAXfshq6MnDhCzBOHv+OpufzHIaH5a3audKgDanp9BEc1It645RxPz48Lr5D6rPR4Oc08vG7nPUknEN2ZjKVhfgNdCg8/naLG7j9PyRFz92UCbj2izjcPAVa+sCFoAGItWiLe/ove3+p6a3UVk/ci1MnvXdfoAtauTwUIHYogz5MoV6k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0hJbkRybUphMWZXZVYwdGhSN2VqTlVScWlVN2hGejlSeXBHZ2pORUQxeHU0?=
 =?utf-8?B?SGs1Wmh6K2t4M1NGZFNWVitwNlU1bEJZUVFoMndtSEUwdDc4MGhSa0QzYjdy?=
 =?utf-8?B?RUpuZDZZa2pEUzdVTGNrblE0dTVsZHg5Umc3RDk1dmVPZjc1Nlh0Yk93MW0x?=
 =?utf-8?B?amp3RVc1Q25Hd0hZVkprRUZXam5YNE9XRnZGdUxRL1UyRVN0cE5PZXYyYW0v?=
 =?utf-8?B?UW1zZjhrdGNSRG9lU2VtVnJmK1RmZVNOcDhoZlJxMlhVaVorTXdTSlBCQkpR?=
 =?utf-8?B?N1FPNU9SMHpEQjMxT3RQVklYdVBnSzc2SXFHeXVsbTM0bmN6cENRMGpnU2Vq?=
 =?utf-8?B?MloxbWg5WGplbUhydVlTNzAyRHBCcmt4SUxNN0EyZk1HTk8wTnhRdlpUZnpj?=
 =?utf-8?B?dTBIbFZ1STRWOFVpR2NtRGZwOVFUUHR0cEhpcjI4WkNEMTYxZ3drUUliNWRX?=
 =?utf-8?B?bGNwRXFvakJPM2p4MDkyM3RoZkVUNnVVbmQ4ZU82cDZheUtMekdGUDNrV3pN?=
 =?utf-8?B?UTFJeGZlSUV0eWJGN2pUT1ptREZhMmFDUHQ5WTZvWmk0SVNrMDUzSmRCa2pq?=
 =?utf-8?B?anovNW5FMzJSeFMxd1Y4dkx0SXlJRGRldGNNT2dMOFgzNWdLUnJ1ZXhNTFlJ?=
 =?utf-8?B?U29uK3o5K283OWVicW9LMlJyWjRjbXloWi8wSUNVS1YvdWROa3laZE5VeEQz?=
 =?utf-8?B?V0Zha0Q1Y0R5b1dNRmVXOXc0ZE9DRkoxckF2WTdUcVR1VGdJU0tBclJvSllr?=
 =?utf-8?B?SXp2YTRoYTEwc2E5M1h6M0NQNytaYjFxcDU3VjNxanoxd2I1OGZkNFBOUUFP?=
 =?utf-8?B?ODRYTTU4ZkdsNVoyV2dQdGR4MkYzNkxCNEtkVENhNE8wMjgySGI3V0RaN0sz?=
 =?utf-8?B?TzVhMEtpZGtjZ1ZlelgwMTFLTEZkUVJ3Zkp4YmZLOUpoMHpIbE1tczlDZ0Fa?=
 =?utf-8?B?VmIwcmgxdVdaSnllTHJWSzROR3FxNk5zZG1xMXd3ejBjSnlIc1JLWXlpVjQy?=
 =?utf-8?B?Slg4S3BWdGVTRlVVcXRYb3RyQ2dlQzk1MFl2c1dNc2cwS0xieEx0d0xJVk0x?=
 =?utf-8?B?dXNHVlUwN2pLbU5vOG9WdEt4OHJHWmgzK2lTMGw3WVl0bnE4aGJKMEgvSkl6?=
 =?utf-8?B?bHR3OHRGNnpjZXJBUy9tVy95M0ZOTjhkN3pJSXhQU2JFa21MUjFPQ0RPblBu?=
 =?utf-8?B?WFNTT3ZOcHprU2ZxRkU1cEJwZ1dSa2F0UXBhZzNKSjFiRk1LVkYramZuNXdu?=
 =?utf-8?B?Qzl0RGZPS3NjYjVLdU9vb09uY0RWdTdRa1pOUkxNQVl5bnFja0xpcTlVN0hD?=
 =?utf-8?B?Ry93ZVcwQmExQ0RMYVV3UHdYMkNJRCtnQXhoNE8wWk1zZlVuWkNuTE1HSTcv?=
 =?utf-8?B?VVdrUGJ3Z25icXc4Rkl0dVRYZTI5bkN2SVk1U2NRRWdaMEJKT2wrS0F6M0lR?=
 =?utf-8?B?M2lBT1E4MGpZOENHeWRWejZPZ2F2YzNvaGRWZ3RnZ0Z6NkR6UVY1dVpvNVF6?=
 =?utf-8?B?eUJYZ1Vpemo3WVhmYkthbjlZT3U0RkZwMFNXYk1LdzlPNDZQWTgxbmMvbW01?=
 =?utf-8?B?K1UwV1JJRjIzUStMYzlMV0xxVUJxMVdwT2c3Q29zWFJtcE5aMHRGY1U3UVQ4?=
 =?utf-8?B?akUwaFY3MHorU1VRa25MV2hBQ1o2WEhrRFhoSXE3VGJrbkpJVlpCYXYyZkhN?=
 =?utf-8?B?UzFUYllVNVpDM2ZoUVA1NGVlZlQ0TWxBRzBuaW44Y2VEcjFzTWRkd3NUUHdr?=
 =?utf-8?B?eS85Mkp5QzhqMXpDaE9sRGs2cmttWnZlZDJYdGRXOUM1WGNGSEdoRjlja3Fw?=
 =?utf-8?B?N2doZUdNcHhOblo5OWJzNU5Sano3YkpnQ3Y2Z3JaQjhqeGpic1dTWkpkdEtp?=
 =?utf-8?B?NldtbzdQV3ZYeFJpa3NCc2R5Q2FGUDgyWmpmcmRXRTlnN0FYejFXendZUkQ3?=
 =?utf-8?B?ODF5MnRNUW1RaWtGeGxxaVNqSkhycW12WUN0dGd4NEZjWjBBV1VKSzdsc1pl?=
 =?utf-8?B?bitGNVlncVY5dWx2RkFoMGRhL1ZqdXJQSHpYRHV4aEJnSUUzRFkySlNjM2tE?=
 =?utf-8?B?UEhuaG9IV0dmN281YUNkd0VwZ2szTGRZM2ZXaktEL0QwOXprREwwWlh2blB5?=
 =?utf-8?B?a2dBT0lFenFzQ0daNGkzMFdxa3lrNDdoekM5dTFkbG9BQjlBZFBNNlV3RnlX?=
 =?utf-8?B?OWtCQ1RKWDV0U1MvdHUzemZqZ3RwNTFUM0RUYW1hL081L1E0MFNOUDJWSzJO?=
 =?utf-8?B?OWJ3dGp1c0pRL2pES0NrNktaZ1M4R05YTVhBcXFKc1JaaVRYQUluM245K0Ey?=
 =?utf-8?B?aXZUSWh3VXI1OHJNSUtna2lBOTlaTGhhY3lRdzJRSjlrTlVmblBLZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d104c9a-2a39-4793-e5d3-08de8055dd89
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:39:01.1513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWK2k6HvkxXPtXeX0oQ3r8oE24dNxzKBItBPSMHgsiYcVxPCQ0JJnlGe/SJmKCV8whM3YU/0mKDUc9wlpy2vEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2095

On Thu Mar 12, 2026 at 9:23 AM GMT, Alice Ryhl wrote:
> Creating workqueues is needed by various GPU drivers. Not only does it
> give you better control over execution, it also allows devices to ensure
> that all tasks have exited before the device is unbound (or similar) by
> running the workqueue destructor.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/helpers/workqueue.c         |   7 +
>  rust/kernel/workqueue/builder.rs | 380 +++++++++++++++++++++++++++++++++=
++++++
>  rust/kernel/workqueue/mod.rs     |  44 ++++-
>  3 files changed, 428 insertions(+), 3 deletions(-)
>
> diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
> index ce1c3a5b2150..e4b9d1b3d6bf 100644
> --- a/rust/helpers/workqueue.c
> +++ b/rust/helpers/workqueue.c
> @@ -14,3 +14,10 @@ __rust_helper void rust_helper_init_work_with_key(stru=
ct work_struct *work,
>  	INIT_LIST_HEAD(&work->entry);
>  	work->func =3D func;
>  }
> +
> +__rust_helper
> +struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, un=
signed int flags,
> +						     int max_active, const void *data)
> +{
> +	return alloc_workqueue(fmt, flags, max_active, data);
> +}
> diff --git a/rust/kernel/workqueue/builder.rs b/rust/kernel/workqueue/bui=
lder.rs
> new file mode 100644
> index 000000000000..d4d77b96f9c4
> --- /dev/null
> +++ b/rust/kernel/workqueue/builder.rs
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Workqueue builders.
> +
> +use kernel::{
> +    alloc::AllocError,
> +    prelude::*,
> +    workqueue::{
> +        OwnedQueue, //
> +        Queue,
> +    }, //
> +};
> +
> +use core::{
> +    marker::PhantomData, //
> +    ptr::{self, NonNull},

This is formatted incorrectly.

> +};
> +
> +/// Workqueue builder.
> +///
> +/// A valid combination of workqueue flags contains one of the base flag=
s (`WQ_UNBOUND`, `WQ_BH`,
> +/// or `WQ_PERCPU`) and a combination of modifier flags that are compati=
ble with the selected base
> +/// flag.
> +///
> +/// For details, please refer to `Documentation/core-api/workqueue.rst`.
> +pub struct Builder<T> {

I would name the generic parameter `Kind` rather than `T`. `T` is too gener=
ic to
indicate it's for specific kind/type of workqueue.

> +    flags: bindings::wq_flags,
> +    max_active: i32,
> +    _type: PhantomData<T>,

Hmm, it is somewhat awkward to me that we are having a `PhantomData<T>` her=
e,
as `PhantomData` is documented to "behave as it it owns a `T`", but all the
possible `T`s that we use here are uninhabited.

> +}
> +
> +pub enum TypeUnbound {}
> +pub enum TypePercpu {}
> +pub enum TypePowerEfficient {}
> +pub enum TypeBH {}
> +pub enum TypeOrdered {}
> +
> +/// Entry-points to the builder API.
> +impl Queue {
> +    /// Build a workqueue whose work may execute on any cpu.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq =3D Queue::new_unbound().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from unbound wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias =3D "WQ_UNBOUND")]
> +    pub fn new_unbound() -> Builder<TypeUnbound> {
> +        Builder {
> +            flags: bindings::wq_flags_WQ_UNBOUND,
> +            max_active: 0,
> +            _type: PhantomData,
> +        }
> +    }
> +
> +    /// Build a workqueue whose work is bound to a specific cpu.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq =3D Queue::new_percpu().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from percpu wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias =3D "WQ_PERCPU")]
> +    pub fn new_percpu() -> Builder<TypePercpu> {
> +        Builder {
> +            flags: bindings::wq_flags_WQ_PERCPU,
> +            max_active: 0,
> +            _type: PhantomData,
> +        }
> +    }
> +
> +    /// Build a power-efficient workqueue.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq =3D Queue::new_power_efficient().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from power-efficient=
 wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias =3D "WQ_POWER_EFFICIENT")]
> +    pub fn new_power_efficient() -> Builder<TypePowerEfficient> {
> +        Builder {
> +            flags: bindings::wq_flags_WQ_POWER_EFFICIENT,
> +            max_active: 0,
> +            _type: PhantomData,
> +        }
> +    }
> +
> +    /// Build a single-threaded workqueue that executes jobs in order.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq =3D Queue::new_ordered().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from ordered wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias =3D "alloc_ordered_workqueue")]
> +    #[doc(alias =3D "__WQ_ORDERED")]
> +    pub fn new_ordered() -> Builder<TypeOrdered> {
> +        Builder {
> +            flags: bindings::wq_flags_WQ_UNBOUND | bindings::wq_flags___=
WQ_ORDERED,
> +            max_active: 0,

This should be 1 instead of 0.

> +            _type: PhantomData,
> +        }
> +    }
> +
> +    /// Build a workqueue that executes in bottom-half (softirq) context=
.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue::Queue;
> +    ///
> +    /// let wq =3D Queue::new_bh().build(c"my-wq")?;
> +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from BH wq"))?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    #[doc(alias =3D "WQ_BH")]
> +    pub fn new_bh() -> Builder<TypeBH> {
> +        Builder {
> +            flags: bindings::wq_flags_WQ_BH,
> +            max_active: 0,
> +            _type: PhantomData,
> +        }
> +    }
> +}
> +
>
> [snip]
>
> diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
> index 1acd113c04ee..6049c0e8e4b6 100644
> --- a/rust/kernel/workqueue/mod.rs
> +++ b/rust/kernel/workqueue/mod.rs
> @@ -186,7 +186,10 @@
>  //! C header: [`include/linux/workqueue.h`](srctree/include/linux/workqu=
eue.h)
> =20
>  use crate::{
> -    alloc::{AllocError, Flags},
> +    alloc::{
> +        self,
> +        AllocError, //
> +    },
>      container_of,
>      prelude::*,
>      sync::Arc,
> @@ -194,7 +197,14 @@
>      time::Jiffies,
>      types::Opaque,
>  };
> -use core::marker::PhantomData;
> +use core::{
> +    marker::PhantomData,
> +    ops::Deref,
> +    ptr::NonNull, //
> +};
> +
> +mod builder;
> +pub use self::builder::Builder;
> =20
>  /// Creates a [`Work`] initialiser with the given name and a newly-creat=
ed lock class.
>  #[macro_export]
> @@ -340,7 +350,7 @@ pub fn enqueue_delayed<W, const ID: u64>(
>      /// This method can fail because it allocates memory to store the wo=
rk item.
>      pub fn try_spawn<T: 'static + Send + FnOnce()>(
>          &self,
> -        flags: Flags,
> +        flags: alloc::Flags,
>          func: T,
>      ) -> Result<(), AllocError> {
>          let init =3D pin_init!(ClosureWork {
> @@ -353,6 +363,34 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
>      }
>  }
> =20
> +/// An owned kernel work queue.
> +///
> +/// Dropping a workqueue blocks on all pending work.
> +///
> +/// # Invariants
> +///
> +/// `queue` points at a valid workqueue that is owned by this `OwnedQueu=
e`.
> +pub struct OwnedQueue {
> +    queue: NonNull<Queue>,
> +}

This looks like something that can become `Owned<Queue>` when Andreas' seri=
es
land?

> +
> +impl Deref for OwnedQueue {
> +    type Target =3D Queue;

#[inline]

Best,
Gary

> +    fn deref(&self) -> &Queue {
> +        // SAFETY: By the type invariants, this pointer references a val=
id queue.
> +        unsafe { &*self.queue.as_ptr() }
> +    }
> +}
> +
> +impl Drop for OwnedQueue {
> +    fn drop(&mut self) {
> +        // SAFETY: This `OwnedQueue` owns a valid workqueue, so we can d=
estroy it. There is no
> +        // delayed work scheduled on this queue that may attempt to use =
it after this call, as
> +        // scheduling delayed work requires a 'static reference.
> +        unsafe { bindings::destroy_workqueue(self.queue.as_ptr().cast())=
 }
> +    }
> +}
> +
>  /// A helper type used in [`try_spawn`].
>  ///
>  /// [`try_spawn`]: Queue::try_spawn

