Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020126.outbound.protection.outlook.com [52.101.196.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD2844BCA4;
	Fri, 27 Feb 2026 16:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208303; cv=fail; b=VlA2gPYhNVHIDelM8LflsFoPe3PdEtj1b6jw71sH9sjrkz0uuu77dzMPuTFiqD8MRfxGGvlFONZiekd5zvHjAnFaz+e401JUWc506LtqLj3hzQSYxrDtWb0BYxUzM8qbOvCkdaGlOScXkUUHWW8uPQo+KuWUvbprHPd8LGBysak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208303; c=relaxed/simple;
	bh=zAPK1Sxb7Ej9rwP5eV6bCOft1PozYnE+cncAXWwcxB8=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=IokyrkqSVbY0QTymCqGS8b480WnSzDK2H/uO3DNKxMZMKksPSCG2EJTVsFsLvBCza1iMeBoMkaNbPCz2y2mvBpZRl4xRbEGTllNxYdkvo+Nv38jpLl/MzE3L6fmZqxMUrJqutu0SjlrVL8sgYs8Sa1GuLg14xZkBTClsPDiOJ2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=cvrwySkx; arc=fail smtp.client-ip=52.101.196.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="cvrwySkx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6CdO0xrynsWoo1zwZ0EcTzr33LtSUNC2Bs2D6CZHkPqGqg3TBa6jaaQdsF5r0RrunlYN4Ilf0/vyKTnJa4kszXurFvF7MgglM9SXeHefIWGPEUq+SufoZc2AjttLUu15eTJUFpCo7LrByAjo6VPltt+4FzebbO2Q8Zq4qYUg81l3NrV8DyrxvltoAJgi0OrMvQl/v+Kos9jwQalR/DOyPLBIpPUuV2wVGqj4kAmwF+TWLfs2wq2coRhgwzQYCs0qyGc16HbAmi7X64/xZL7PDwZGjkNFOpgXNLLJ7Ax787gg+JXiBqqGqPryM8OOOr7ljEOK2H4oUyLua88qWuq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHZu9jtDqK/NmIOip4dnqF5qbxMdy1JlaRBLxXMcNIE=;
 b=frFvJunXjydXf6M8P7bTZUQ/hqUPJJyVzobitPXlNmAXbDder1EEECSxqMYUlybnggq8yWF77E/uBeaTW0+gGh6eLCJtxNV1uZhGoX7m34whnbnk9GM9UFWRovOlFzYDVs8NnoBT9OV/xVl67jyWCNzZZQw4Tv+QNZO5Tnq9McI+xQnumQsDyJ1fgE5TlAUEXwYixZpC3JgMsZVUqMOHsQVDKXbnA/KHIdgq1SV7nNZ9Cm7vtXG4iiSiDYu/6zpMraZ6jizILi2QhdFyayRW3gymTSG/OYC6TTqqQUXNu55z2xMRF7/wnLtLLXcjVZa31Xmi5R66SVjnugC+BojJig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHZu9jtDqK/NmIOip4dnqF5qbxMdy1JlaRBLxXMcNIE=;
 b=cvrwySkxFcZZL4XnFCcJ+j81qWRt5oqvt9KvdewEr/ZiVQksD6bsIVrAuBAS0GKffkIZYQmX2WtcMCXan1OFXAROnxQ0ex1JalW/gqd8HsUi1XdbqO8b6I5p0fp/B4a1rx1cuckaz2XjN2wCeNO64QiyD+loMFiuPdwWLxEAQTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7675.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:21f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 16:04:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:04:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 16:04:57 +0000
Message-Id: <DGPVESJHRDJZ.3VHEZW1ZM7Q3Q@garyguo.net>
Subject: Re: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
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
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-2-87de133f7849@google.com>
In-Reply-To: <20260227-create-workqueue-v3-2-87de133f7849@google.com>
X-ClientProxiedBy: LO4P123CA0185.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: fe92277f-3ab7-4f6f-ac16-08de7619f46c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	/hM5x+WyhkF2YLbXBJFeXL+Uk2YTfmFbEyt/SMMY3DR/+PBmvAxjpI6v9mO1ClfqSIc38minLqgaTp/iiWxG6wssMZE8OgYFivVHfusmU8lFAxIQTknG/xPtlBcJZNOTSRtUG6Cz204pT5dUiOrOW34sfulSBuXYnDoenMdv5ooexCezXpMRnUzKTxKlxEqx1yuWOjJrAV5UzyAfcuNPh5J4IvhX0zLgo9c+EFrmodYKX7RzY4Gzqhyw7emfLyGIVhoqCNT6boXHZfyKtVARxSzdnMmsz0VJDBYK5MG2DxpNswoCVksjjKyKZtcMVLuHezILieqqt975+RfMM7Is0ZlUec8TXPJhO/Cno40sbTLHfxJfkKkmagshexpvQLt6/Y8iIN9TW3Kzp9gGTxei3FSv9iJq1FW1ComfxD5HmAkOa3uES775CTRaujusVQUTe1wGrpqCSDfdPAiqCfw6CBlLumKT36V+ECI6aq+CQrzak7M5lwLnYLwLv+gSSyMSJgT4Ox62iUI+Ie3JTRBzjXGg0BI9rfQcox4crMIqK2V51dSRwLaVDvKyYKlfewN7+79od4VlwvXibZXSc7tedd1B3L2XBj+RUdXWZBH/r5x62soL8FB1ivYVi2tsjBXCNN8rPj2bkAwYtVDhIcRAx3NrWrNkMcl9ElC7hQpX23XA9+OVhB3sZuO77RcXa3O8T4smXhfqAF9lc19ACZDKbPmXnXNrY6SeDuX0lb7W3qo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTNBWXhjWDQ2NWxqUTBHak11RGI5OEtvQWhudFFaQUVEZVExWTIzYlk4bTc0?=
 =?utf-8?B?S09tdERPbGJpcG01RWhya2pWOUZESEpCYUt0UE5Uc280Mjg0aHZLTERGczZm?=
 =?utf-8?B?dHA0TXRQMTVkNnV0R2U0aFRodktYU1RQbTdyVWE5Z1hUcWtJMk1aOEhSckVu?=
 =?utf-8?B?ZE1VRkJTaEFJYldmWVBjWDJPckZHVzJSLzM0TytlTVlKNVVHaGt0VVBmVEx2?=
 =?utf-8?B?UDdTVnJ4dDNzMmtLSUwzYXJ2NjFaeUV1ZTFtQnQxclpzb1VTYjI0a2VTRThz?=
 =?utf-8?B?M09vN1MzMm41bFZwTTFBd1NTZUd6c1pMZVVyUHBJT3RuTXcwbzN1LzNhMTh1?=
 =?utf-8?B?MjBLNDQzWlJld0RzQlVlL2txYmUweVFqaFUxMEdCL1B0TjgyZVlmS2dhc3du?=
 =?utf-8?B?UlNQN1A5Ymp1MW5Tcmp0RHc4RStkOWFlSDlrTFA5ejV2T202aHhUQ2FuRUtq?=
 =?utf-8?B?aXFObExGeTZWSEp4QVcrUlJJUFdEU3g2anBmM25VaGRQNjJ1OEthM09QMUM4?=
 =?utf-8?B?UmdwRXo4Zlo3d1hsRlBSVDlrdzgyRWlkZGNxdFdCc1Zyb21jdTRHbjdZZXFp?=
 =?utf-8?B?eHVBVUNPQlZKVkJqbWVJOU5DRXZ4bUpKb3JYdE9YR3pBM0pQVFQyWnI3UHhP?=
 =?utf-8?B?cnJWSVlTaTlVd1drQjNtZVk0bm9rQlE1STQrcWxFQ0NUcE1KZit6QWR1NlZJ?=
 =?utf-8?B?aFQ3K3BMQXdGQzh5UmRzT3JkQU9yc09pVzFxanlMRmswMEhZV25GU1VIRnpw?=
 =?utf-8?B?bFRlcTZmYUg0dnJyb0cwSjhWcW5OTHB3WU1nWEF6cHRIaVJvd2RtKzhpY2tM?=
 =?utf-8?B?bHI5MlhjSXFPS3BBazZhYkd5M0ZIQ3c4UXVWelZQZzZLWXg1R0tHaEo3clRL?=
 =?utf-8?B?UnZFWlNZYVJhMG9OeVhacmFVVU5NN3E3ZzdTQ2toOVl5dXdMN0hzTXYyV3hV?=
 =?utf-8?B?M1hLTUxFMlIxckhmUDZLQThBOHFaTVB1M2hQMStlSlduNEd6ZWlKQW5QWVJu?=
 =?utf-8?B?cnpKbDYzUDc1bHhNYlNBaEx2TTg4T0srZ25xVVBXSThaTERFYUdxdzMyZHpB?=
 =?utf-8?B?V0xHMk1QWTNpdVFNRmxsLzM5azhrWXBWRUgxVDhlMHdyeXh3OW5vSWt6VW1R?=
 =?utf-8?B?bFNCZm16aDVsSEhZeDVTR1BWSkY2Mk1qRzFxVWg0Qk9uZk95bHo0OHVSOUR4?=
 =?utf-8?B?Rm1FamVuOW1zcVJsZ3hJcTZuanNERU8ycmJJaTBBSVYrS3doT09PT0JSa3pJ?=
 =?utf-8?B?WThweER6OTFxWEtpZ2ZpT0VwT3FkYjZTc1RtVDh2Z2dONjZIZ1RrZkxEMEgz?=
 =?utf-8?B?QjB3WE9nNHk2RnlPcmVIaEliRnpJSFJ0TFlJZHpVdWc1bnpYUG83ZE8yNTdt?=
 =?utf-8?B?Y1NmMWtCV1FqdlFtOGJ6OHI1ZXVKWHhvaWFtMDZ2WnJqMm1XZFZCWDQ0S1da?=
 =?utf-8?B?MmZWY1BOUjh3amM5SFhQUVlhVHNvQzZiOHlDaDJtMEd6aUt5UFVuV2VpZkZh?=
 =?utf-8?B?eDQ4amgwNk53K1FTRG5KTitaQ2IxdWpSTmNpVVh0RlBqVjNhZWRBeU5rVlVs?=
 =?utf-8?B?MzRUS20rQ0NsMUtwKzhFdFRpUE85aUUwTXpsNUJVWWlSM3hSV3h4Ym1Yenhk?=
 =?utf-8?B?NEVsa1BFM0JJeDFnaVkwS1JGaWMwN3ZRYlc3ejNjbzNQa2ZnellyVmx4bmlB?=
 =?utf-8?B?YThYaGlMSHF4TGF1eTV1TmxBbEliVnBIRWczZXUwMW5PNTlYTkdTdmowQ0Jz?=
 =?utf-8?B?MkhRekpvaHVoZ1I4cXBkR3puQ2lkRWZvM0JFM0thRWRtYytTdExGTk5lQTQv?=
 =?utf-8?B?L1ljUmppQjdmcWpGaTVDSXBjeGhvVXZydzhhY3lsbUEvYzlZMkIrMlBLTlRm?=
 =?utf-8?B?N09heTA0dTNrN1h1aW5yeTJxYVJNTGVhbDU4Yk9zaWtkNEpxRmRhd1NZcTlh?=
 =?utf-8?B?Y3pLZFpKa2tNWlRvZFoyWmdJQk56L3F4SVUrTlhHVHZMUjRzV3VsTlowbkRD?=
 =?utf-8?B?dHMrOVFweXZtaitxTEkwK1UxM2I0TUZHdXNJNHJMajhTK0Y5VTZFUmpQZU1Q?=
 =?utf-8?B?Y2xCMWxLbUJ2Umsra1lZcEpnWlo4YzJ4amh0QWJHMWtTRERpOGtSZGYrYlI0?=
 =?utf-8?B?SzZBM2k1dGxPbkdOUW5nejBZM29GdUFsaWNtbGo2am1EQWhTaVhyNnE5OG15?=
 =?utf-8?B?VVRST3UrcDh6UVloeUZSeC8zNnJ1K1Zja2lFZnRXWmt6Y01qcnJCT1JyY1Iw?=
 =?utf-8?B?Tk5aY21ra0dKRVZNZVJjTmZiZXhXRXo3Q1hrTVJPSUI4U3hvK2ppaG1GeE1t?=
 =?utf-8?B?c0JyaEoyOWFDMnByb0pRNittUkVleTRTejZuN0FqeHIyMi90eDBydz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fe92277f-3ab7-4f6f-ac16-08de7619f46c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:04:58.1012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFtt64nla9qz0/89NDsUt0azXW/iC71j/HRUGt+j9rqwzdnbBfdMhDbu4f8XxoEYTTh+/ihZ4hY8YcaiNJEg2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7675

On Fri Feb 27, 2026 at 2:53 PM GMT, Alice Ryhl wrote:
> Creating workqueues is needed by various GPU drivers. Not only does it
> give you better control over execution, it also allows devices to ensure
> that all tasks have exited before the device is unbound (or similar) by
> running the workqueue destructor.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/helpers/workqueue.c |   7 ++
>  rust/kernel/workqueue.rs | 190 +++++++++++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 194 insertions(+), 3 deletions(-)
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
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 1acd113c04ee..4ef02a537cd9 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
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
> @@ -194,7 +197,11 @@
>      time::Jiffies,
>      types::Opaque,
>  };
> -use core::marker::PhantomData;
> +use core::{
> +    marker::PhantomData,
> +    ops::Deref,
> +    ptr::NonNull, //
> +};
> =20
>  /// Creates a [`Work`] initialiser with the given name and a newly-creat=
ed lock class.
>  #[macro_export]
> @@ -340,7 +347,7 @@ pub fn enqueue_delayed<W, const ID: u64>(
>      /// This method can fail because it allocates memory to store the wo=
rk item.
>      pub fn try_spawn<T: 'static + Send + FnOnce()>(
>          &self,
> -        flags: Flags,
> +        flags: alloc::Flags,
>          func: T,
>      ) -> Result<(), AllocError> {
>          let init =3D pin_init!(ClosureWork {
> @@ -353,6 +360,183 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
>      }
>  }
> =20
> +/// Workqueue builder.
> +///
> +/// A valid combination of workqueue flags contains one of the base flag=
s (`WQ_UNBOUND`, `WQ_BH`,
> +/// or `WQ_PERCPU`) and a combination of modifier flags that are compati=
ble with the selected base
> +/// flag.
> +///
> +/// For details, please refer to `Documentation/core-api/workqueue.rst`.
> +pub struct Builder {
> +    flags: bindings::wq_flags,
> +    max_active: i32,
> +}
> +
> +impl Builder {
> +    /// Not bound to any cpu.
> +    #[inline]
> +    pub fn unbound() -> Builder {

These can all be "-> Self".

> +        Builder {
> +            flags: bindings::wq_flags_WQ_UNBOUND,
> +            max_active: 0,
> +        }
> +    }
> +
> +    /// Bound to a specific cpu.
> +    #[inline]
> +    pub fn percpu() -> Builder {
> +        Builder {
> +            flags: bindings::wq_flags_WQ_PERCPU,
> +            max_active: 0,
> +        }
> +    }
> +
> +    /// Set the maximum number of active cpus.
> +    ///
> +    /// If not set, a reasonable default value is used. The maximum valu=
e is `WQ_MAX_ACTIVE`.
> +    #[inline]
> +    pub fn max_active(mut self, max_active: u32) -> Builder {
> +        self.max_active =3D i32::try_from(max_active).unwrap_or(i32::MAX=
);
> +        self
> +    }
> +
> +    /// Allow this workqueue to be frozen during suspend.
> +    #[inline]
> +    pub fn freezable(mut self) -> Self {
> +        self.flags |=3D bindings::wq_flags_WQ_FREEZABLE;
> +        self
> +    }
> +
> +    /// This workqueue may be used during memory reclaim.
> +    #[inline]
> +    pub fn mem_reclaim(mut self) -> Self {
> +        self.flags |=3D bindings::wq_flags_WQ_MEM_RECLAIM;
> +        self
> +    }
> +
> +    /// Mark this workqueue as cpu intensive.
> +    #[inline]
> +    pub fn cpu_intensive(mut self) -> Self {
> +        self.flags |=3D bindings::wq_flags_WQ_CPU_INTENSIVE;
> +        self
> +    }
> +
> +    /// Make this workqueue visible in sysfs.
> +    #[inline]
> +    pub fn sysfs(mut self) -> Self {
> +        self.flags |=3D bindings::wq_flags_WQ_SYSFS;
> +        self
> +    }
> +
> +    /// Mark this workqueue high priority.
> +    #[inline]
> +    pub fn highpri(mut self) -> Self {
> +        self.flags |=3D bindings::wq_flags_WQ_HIGHPRI;
> +        self
> +    }
> +
> +    /// Allocates a new workqueue.
> +    ///
> +    /// The provided name is used verbatim as the workqueue name.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::workqueue;
> +    ///
> +    /// // create an unbound workqueue registered with sysfs
> +    /// let wq =3D workqueue::Builder::unbound().sysfs().build(c"my-wq")=
?;
> +    ///
> +    /// // spawn a work item on it
> +    /// wq.try_spawn(
> +    ///     GFP_KERNEL,
> +    ///     || pr_warn!("Printing from my-wq"),
> +    /// )?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    pub fn build(self, name: &CStr) -> Result<OwnedQueue, AllocError> {
> +        // SAFETY:
> +        // * c"%s" is compatible with passing the name as a c-string.
> +        // * the builder only permits valid flag combinations
> +        let ptr =3D unsafe {
> +            bindings::alloc_workqueue(
> +                c"%s".as_char_ptr(),
> +                self.flags,
> +                self.max_active,
> +                name.as_char_ptr().cast::<c_void>(),
> +            )
> +        };

INVARIANT comments?

> +
> +        Ok(OwnedQueue {
> +            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
> +        })
> +    }
> +
> +    /// Allocates a new workqueue.
> +    ///
> +    /// # Examples
> +    ///
> +    /// This example shows how to pass a Rust string formatter to the wo=
rkqueue name, creating
> +    /// workqueues with names such as `my-wq-1` and `my-wq-2`.
> +    ///
> +    /// ```
> +    /// use kernel::{
> +    ///     alloc::AllocError,
> +    ///     workqueue::{self, OwnedQueue},
> +    /// };
> +    ///
> +    /// fn my_wq(num: u32) -> Result<OwnedQueue, AllocError> {
> +    ///     // create a percpu workqueue called my-wq-{num}
> +    ///     workqueue::Builder::percpu().build_fmt(fmt!("my-wq-{num}"))
> +    /// }
> +    /// ```
> +    #[inline]
> +    pub fn build_fmt(self, name: kernel::fmt::Arguments<'_>) -> Result<O=
wnedQueue, AllocError> {
> +        // SAFETY:
> +        // * c"%pA" is compatible with passing an `Arguments` pointer.
> +        // * the builder only permits valid flag combinations
> +        let ptr =3D unsafe {
> +            bindings::alloc_workqueue(
> +                c"%pA".as_char_ptr(),
> +                self.flags,
> +                self.max_active,
> +                core::ptr::from_ref(&name).cast::<c_void>(),
> +            )
> +        };
> +
> +        Ok(OwnedQueue {
> +            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
> +        })
> +    }
> +}
> +
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
> +
> +impl Deref for OwnedQueue {
> +    type Target =3D Queue;
> +    fn deref(&self) -> &Queue {
> +        // SAFETY: By the type invariants, this pointer references a val=
id queue.
> +        unsafe { &*self.queue.as_ptr() }
> +    }
> +}
> +
> +impl Drop for OwnedQueue {
> +    fn drop(&mut self) {
> +        // SAFETY: The `OwnedQueue` is being destroyed, so we can destro=
y the workqueue it owns.

Hmm, is this correct? This should say *why* the call is safe, not what it i=
s
doing.

I think this should mention: (1) the pointer is valid and (2) no delayed wo=
rk is
being scheduled on this queue.

Best,
Gary

> +        unsafe { bindings::destroy_workqueue(self.queue.as_ptr().cast())=
 }
> +    }
> +}
> +
>  /// A helper type used in [`try_spawn`].
>  ///
>  /// [`try_spawn`]: Queue::try_spawn

