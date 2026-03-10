Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021113.outbound.protection.outlook.com [52.101.100.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9344130DD24;
	Tue, 10 Mar 2026 02:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108093; cv=fail; b=dc1s8LWSIqebGmSAb7WAHw1aeSAEIRmnWNY/g6OQfB+E+EjQaM1xKd/D6hxQtJLrANVOO5HowX/hOYLkWpr6oSZ2lE8yJbgoJ9rTtfeY43ZdF+HPkEptlqjf+IoDcylQqA+EeMwdgEOgElXeI+80x2MMjjWJ+wbhNDcsbqdQvN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108093; c=relaxed/simple;
	bh=tES81/Ykg+9ttebjYRX7JK25POY3cDMiLr6cDPiK7Ag=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=l+OhjdkoJewNryiHtGzpmT5raf+a70w0+9HyoPW/IIZhSmZclzjsXmO+7ZA5WBaMh82sn7GCFrkb+/Mj9PSRSwaYSkkWIstreuRsF1C8pqb1TQBGs8knWp0DZdXaHzs4pexVCI7CvyVQh20a8Ct1nnnWeUu4SZ/GkOvKzYZbdZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=sx+N26+Z; arc=fail smtp.client-ip=52.101.100.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="sx+N26+Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EquGyBwDkZGYzDpnQfNfBY2rtd8+vSAWJjQy3dLQXQoGhzQ74oOHvx8jYKBkD3dN7UTRWVwE5Ru1cQ8sJpMFlR7HMJ7mzgoXHnIk3eDmr4EwQVSQSU+TQMO+7WOMhT81VRCc/8YJ1L3MxtMUbkpUduIUzUJX410C05FMNTlxER5I2Gjq/9kmEtzvFqHfIUYvhdQy8NsOIzkZTupz4NzlJgKHmLnCMZ2a7afjuAplLJeqKAPK4uj4EA1CU8FXmm7bG+1CqKjcFQcnaOc+CuOULC/fPEVgPJFzbAOVIVgCxDVRGL0LZM8JyEdS/qBMsLQdvljNS6BTTWEV8F9Qs4dsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjMkCE8GUcl0Z6y+ZgjAWABJj4TINWnbesUhFXDhxsY=;
 b=T+zNpXCiJ9YhdQeCUzN7wm3tEuXXSZ/MVM9VwoUllHGfRVfnLXH7hT3UXIhkShOWQzGVcx7fwJ0yCL/05y4aYpynfCbSCMDt7GqAB/7XIhUkI4cDXQJW9gWjEkF/A4/NtMic6Q5V66J2Klp4qkPqhI06MVVnfo5Gv8KpbyEwg2B25i2UNRmSP6kfyf3gxQnsYxmOs8AGe8563zuzZNLtdhpAalwjJcPOOcHMyNBTRSWhwGwO+5Zx/sC1fxgBgbmw7l9TQCwcnm7yM7Z2YvnokeuNKH81G9oKXxJF2+U0o1Pvf8kAW7mIc78xDjiE3ey2HZkNjx8qIUJF1hO38LYdjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjMkCE8GUcl0Z6y+ZgjAWABJj4TINWnbesUhFXDhxsY=;
 b=sx+N26+ZI+DIpHrNG7WdTdeXxZrw8BqVSUJ6OYv9kWECq+Bls+gNA2Xg92j54h7Bok58H1Eo0jLAdCC+1p1HpCe7Dlj/lyVbRlzoffNJmjh8X1fs6ULITS1O+2EbmkLGQd+5/B/z24Vkn/+CvUJX0i1OFeTgsvrCzJDaSfjQOi4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5608.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 02:01:25 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 02:01:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 02:01:25 +0000
Message-Id: <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Gary
 Guo" <gary@garyguo.net>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, <acourbot@nvidia.com>,
 <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <20260309225408.27714-1-dakr@kernel.org>
In-Reply-To: <20260309225408.27714-1-dakr@kernel.org>
X-ClientProxiedBy: LO2P265CA0148.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7e4eed-a985-4c2b-e6a8-08de7e48efba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	Z3ffwQgKnOGBqCv3D+MVSJOttbM+anlTY20pKgJ9thfcOuudICpI4RE4lMEwpFJFrmhRLAfaOcIFm+TNDbUIMlz5yfDvZoT4wx4Bc18Wf2xmYHZJoRamaaoWiTGPr4ompIQkYxTnaCD7fwKyR3rKMvuPBiAdngWNIhiFsU7RqX5KjQYSQM22Q+wZLNSGn2acW/jVNOycSLabHFCK7EmQIh2QcvbGp0xBOr+5yRXhqqtaAmU8uIJqVO9Or5Ui8e7nfZHq6ukneNUTJO4tiRRVD5jFRIuieieJ63/NZYsNm77ykc+Qh24uwMKXxtodiYRlGBrkDny/mNfsdiY7Cz5H7QS0afMHPv+3+h91vKR2NCVU7lHHO6dlfqyftjJ9hENiLHehKYCWI7GHu8mTqy0rDjnzQQf23HeLFRhGfMsx1kDInsaj8C4NkZx03Si+Fpt44TNnNTxNyI9HdQqaMBcUK2YBk9qLfJhmY9XkhsoptVLHNFpVFG3w3DZrntGdpTmjhKSyOerwgeYu9rx5AYUi4Babx69VwRRhiLFfyciwc5OVFS357tB/OTLnep1Yb8LnkKlCAw6WdjrV+7oDN335RvXNWNBVgYQ/iOWQqtZsLf9nz+vC6jDvpATVnqH5Ukz57aktP1aJ870xwbwKtFH67LPI27UoSyHIYRu3+1x+4E1T8j6Yj0i5iTXNDVDqFkg6d0U8xWqvC2oB3BC/SrdcR2ERXEYeLK3HZesNrYAQU3k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW4zK1pXbXhFeHBtcG5YMVhWY1hFQzNVTE1Wd2c4Y0diSVh1aHhvU0hjeXor?=
 =?utf-8?B?bEhkMGJ6VVc3RGlIUStFVWp3VUE5M3pob0ZYTXRhQitUYzU4WWc2cWZXME1x?=
 =?utf-8?B?T1RVUlplMVlZOUpRVjVjZWswWUxhWjFBbGlueVl5UktQTndkUUs0VlJuVEI0?=
 =?utf-8?B?S3dTVGE3Uys3WTR2Zm54encwTDUyeXdacmFVcFlVSzBocjYrSzUyZ0d1SXY2?=
 =?utf-8?B?QWJtWXV1czRhOEMxaE5iWkNocTIxV05OdGQzRXFxWEtGc2sxSUFkRUl5KzRl?=
 =?utf-8?B?RnlWU1FPbzhLQnBHb2FsNVpOYkZOY0doWjdCbFozQjhpZy9nNFBLQ0NjSzN6?=
 =?utf-8?B?OUplRm1MK2ZJaVAzZzFkWk5KTytvS3grNDRidEk4ZFdZNTEySTYyV2gxYWo0?=
 =?utf-8?B?UkpPYms1OVBIMDNGamtoNmwxakY5a1ZCcTJtWlVLS3JwWVBQZVNiR1pUUktG?=
 =?utf-8?B?ZGVSN1luaHNrd3lLeTdQNkIxVGtkeTBSUkV4WlJZUEFSTHZqc2ZjcTlvUzVZ?=
 =?utf-8?B?RlNSR2xpTGpyU2lwamtzWGJ2T0YyM0drZXREdDByc1hUUGlQcEhlVFRBcU5T?=
 =?utf-8?B?cTBESFhpQXJnM2hKT3NiaHExODhOTXlvVW5SbXBBaTA1SW5OUlpkMEdZZGI4?=
 =?utf-8?B?T1M5MnVKSGdHQW5vQUNpdlE1a094alhFbk96SHdLR0FFamw0TzRVMWY2RWJH?=
 =?utf-8?B?MHdFZEp4MWx2ZWhNKzUwczRpSm55TkM2MWJjTWNGSXQ2VzhZRGo4Uk9tUVJm?=
 =?utf-8?B?MCtLTVBpREU0d2xlam1iWjNQTEVheGNHNSt4bE5Cb25Fa0lJdjFiQlZ0U280?=
 =?utf-8?B?Y25URHd6Y3lsM1RjdFlqMWFrNnJHMlk0aUFXKzcwOFZDelA0L0M4aENpVTZr?=
 =?utf-8?B?M2RsUDR5NTlxZFdmZ1ZWTzdFV0c1dmdoOVF3RHhNODB0cjYzT28ycUQ5ZUk3?=
 =?utf-8?B?dGQzTDFjUXVyWURMZTg1NE9ZZEFEQ1c4Y3NvQXBueit2cjFhYnJ1ZzBaUGYz?=
 =?utf-8?B?RHR6UUFVbGo4b3VOdTlsUE4rbTdDWGNURGEzVHVvRGtyTUlCamZzeE9JYkZk?=
 =?utf-8?B?TTdBNFdxTHhSWnRXVUdPS1BKaWFTSFJBTUVmRXJ5QUdCSlA2U0lDQ0JCRkxO?=
 =?utf-8?B?QjdhcVZOWUVsVWNkRUNnaSs0MUhiWXExUEE1dS9pbS9qWjRvY0hKMENURTlK?=
 =?utf-8?B?NEw0TmJjbmRRQWFyL0cxYTNadncrWU52aFBQNGtveUY4N1pJR2orejlteEov?=
 =?utf-8?B?UzJuTnlFZVQ3eDJqamhBNCtOTjB4SXFoT2o0UHlQV2FtbE1EeGZYUERmd20y?=
 =?utf-8?B?ZE1PSFJ1TlhmbCtZb0NsUWVYVlpWWHduajhVM1pTTzJkaWg1OE8yOTRkb2xo?=
 =?utf-8?B?T05KbjhYNTNzc0E5ZjdFY1NVV2J2cVBxeDBSR3U3dm9wdHVOOEYzRlZINDlB?=
 =?utf-8?B?bEdudHl0bE9tOExoWHQ1Nm8rQ0lSUGpBVHdXK0xkdUhFMHRxTCs4RWZkOGJ6?=
 =?utf-8?B?QkFHdU01dmowTVFhWDNiZEFDSlZ0bExMY05qNHczRXlKMWM3L2xuQ2xOTytP?=
 =?utf-8?B?MGJKRVdGSmVlOUI5KzIxMkREVHIrMzBGVXppRGFiNzduOURpVnBtNGlNaDFv?=
 =?utf-8?B?bHVuZG1EVVVjbXZQVWc4ZVBPcy8wdTlLeENkZVhDeEpUa1BkTExqUlBYUDJW?=
 =?utf-8?B?M1g1RCs0aWNJWlhhSEFyVkhlVi8xQzUvc0FHYndpRHgzeUFQRVRyZVpMbzlh?=
 =?utf-8?B?UUg1VGFMUVl0Vk16RjBDOFgvRDFYbE5remloZldBc1M1OVNTd1VPSWZrUGlR?=
 =?utf-8?B?NlF0V3lnWlFCSHM3YnJBR3lWK04xdFlPbXhCWVFlZElmVGdsSkpDMnpsa05X?=
 =?utf-8?B?SzNpaFliMExDdG9rbHNsbVVLcWh3ekNYaFRMMkpiMlFMZ1ZFQzVxR0J2SnRK?=
 =?utf-8?B?VWhuRWl5N3hLM2dXbytKbUZNNytmZEdHemF4WGdBdktFNDl2UVNOYkcycW9m?=
 =?utf-8?B?RHFrbTM1Y3RUdFpkYWU4OWVQTGtUQ3JBRnVFUC9IcUFhbDNrUktGZzFzakVH?=
 =?utf-8?B?U1hpblhkQ2JocVE1bVVINmV1dzdaT0I0S0JjZXpwZjRWclMvUG84THBQVDg2?=
 =?utf-8?B?dURhMEZKSWRidEpDNnd3aHQzU2hEd0szem5jT3Nob21peUVXSUdVWTZXVTBm?=
 =?utf-8?B?WGttWk5seEtIcWNOcUJqMlBMb09XelJ1UlQrclF6WUFsTTRtaUVoMCtVdXJs?=
 =?utf-8?B?Z3hRTE9lN2x4M0tkOWx3UDU5ODU5Z01RZEFIMWNTTVIra1BJQk0yTmRTMDQr?=
 =?utf-8?B?eVRnNlJMV3dZZUsreXUvd2dCYkpiSWFBNnVvcG4rdmlNelpvODRBdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7e4eed-a985-4c2b-e6a8-08de7e48efba
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:01:25.8668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0Wra2/9TufG+vMNd7Si5GSGz9Z12WuQeIR9zqGqmA4b9hTBQfdEg1KPLMGj4c7KkP9HA9VpW2hjZxWNwTgrUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5608

On Mon Mar 9, 2026 at 10:53 PM GMT, Danilo Krummrich wrote:
> The DmaGspMem pointer accessor methods (gsp_write_ptr, gsp_read_ptr,
> cpu_read_ptr, cpu_write_ptr, advance_cpu_read_ptr,
> advance_cpu_write_ptr) dereference a raw pointer to DMA memory, creating
> an intermediate reference before calling volatile read/write methods.
>
> This is undefined behavior since DMA memory can be concurrently modified
> by the device.
>
> Fix this by moving the implementations into a gsp_mem module in fw.rs
> that uses the dma_read!() / dma_write!() macros, making the original
> methods on DmaGspMem thin forwarding wrappers.
>
> An alternative approach would have been to wrap the shared memory in
> Opaque, but that would have required even more unsafe code.
>
> Since the gsp_mem module lives in fw.rs (to access firmware-specific
> binding field names), GspMem, Msgq, DmaGspMem and their relevant fields
> are temporarily widened to pub(in crate::gsp). This will be reverted
> once IoView projections are available.
>
> Cc: Gary Guo <gary@garyguo.net>
> Closes: https://lore.kernel.org/nouveau/DGUT14ILG35P.1UMNRKU93JUM1@kernel=
.org/
> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings=
 and handling")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs |  71 +++++----------------
>  drivers/gpu/nova-core/gsp/fw.rs   | 101 ++++++++++++++++++++----------
>  2 files changed, 84 insertions(+), 88 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index ae54708c38eb..00a4062a47dc 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -2,11 +2,7 @@
> =20
>  use core::{
>      cmp,
> -    mem,
> -    sync::atomic::{
> -        fence,
> -        Ordering, //
> -    }, //
> +    mem, //
>  };
> =20
>  use kernel::{
> @@ -146,30 +142,32 @@ struct MsgqData {
>  #[repr(C)]
>  // There is no struct defined for this in the open-gpu-kernel-source hea=
ders.
>  // Instead it is defined by code in `GspMsgQueuesInit()`.
> -struct Msgq {
> +// TODO: Revert to private once `IoView` projections replace the `gsp_me=
m` module.
> +pub(in crate::gsp) struct Msgq {

These could all be `(in super)`?

>      /// Header for sending messages, including the write pointer.
> -    tx: MsgqTxHeader,
> +    pub(in crate::gsp) tx: MsgqTxHeader,
>      /// Header for receiving messages, including the read pointer.
> -    rx: MsgqRxHeader,
> +    pub(in crate::gsp) rx: MsgqRxHeader,
>      /// The message queue proper.
>      msgq: MsgqData,
>  }
> =20
>  /// Structure shared between the driver and the GSP and containing the c=
ommand and message queues.
>  #[repr(C)]
> -struct GspMem {
> +// TODO: Revert to private once `IoView` projections replace the `gsp_me=
m` module.
> +pub(in crate::gsp) struct GspMem {
>      /// Self-mapping page table entries.
>      ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
>      /// CPU queue: the driver writes commands here, and the GSP reads th=
em. It also contains the
>      /// write and read pointers that the CPU updates.
>      ///
>      /// This member is read-only for the GSP.
> -    cpuq: Msgq,
> +    pub(in crate::gsp) cpuq: Msgq,
>      /// GSP queue: the GSP writes messages here, and the driver reads th=
em. It also contains the
>      /// write and read pointers that the GSP updates.
>      ///
>      /// This member is read-only for the driver.
> -    gspq: Msgq,
> +    pub(in crate::gsp) gspq: Msgq,
>  }
> =20
>  // SAFETY: These structs don't meet the no-padding requirements of AsByt=
es but
> @@ -321,12 +319,7 @@ fn allocate_command(&mut self, size: usize) -> Resul=
t<GspCommand<'_>> {
>      //
>      // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
>      fn gsp_write_ptr(&self) -> u32 {
> -        let gsp_mem =3D self.0.start_ptr();
> -
> -        // SAFETY:
> -        //  - The 'CoherentAllocation' contains at least one object.
> -        //  - By the invariants of `CoherentAllocation` the pointer is v=
alid.
> -        (unsafe { (*gsp_mem).gspq.tx.write_ptr() } % MSGQ_NUM_PAGES)
> +        super::fw::gsp_mem::gsp_write_ptr(&self.0)
>      }
> =20
>      // Returns the index of the memory page the GSP will read the next c=
ommand from.
> @@ -335,12 +328,7 @@ fn gsp_write_ptr(&self) -> u32 {
>      //
>      // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
>      fn gsp_read_ptr(&self) -> u32 {
> -        let gsp_mem =3D self.0.start_ptr();
> -
> -        // SAFETY:
> -        //  - The 'CoherentAllocation' contains at least one object.
> -        //  - By the invariants of `CoherentAllocation` the pointer is v=
alid.
> -        (unsafe { (*gsp_mem).gspq.rx.read_ptr() } % MSGQ_NUM_PAGES)
> +        super::fw::gsp_mem::gsp_read_ptr(&self.0)
>      }
> =20
>      // Returns the index of the memory page the CPU can read the next me=
ssage from.
> @@ -349,27 +337,12 @@ fn gsp_read_ptr(&self) -> u32 {
>      //
>      // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
>      fn cpu_read_ptr(&self) -> u32 {
> -        let gsp_mem =3D self.0.start_ptr();
> -
> -        // SAFETY:
> -        //  - The ['CoherentAllocation'] contains at least one object.
> -        //  - By the invariants of CoherentAllocation the pointer is val=
id.
> -        (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
> +        super::fw::gsp_mem::cpu_read_ptr(&self.0)
>      }
> =20
>      // Informs the GSP that it can send `elem_count` new pages into the =
message queue.
>      fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
> -        let rptr =3D self.cpu_read_ptr().wrapping_add(elem_count) % MSGQ=
_NUM_PAGES;
> -
> -        // Ensure read pointer is properly ordered.
> -        fence(Ordering::SeqCst);
> -
> -        let gsp_mem =3D self.0.start_ptr_mut();
> -
> -        // SAFETY:
> -        //  - The 'CoherentAllocation' contains at least one object.
> -        //  - By the invariants of `CoherentAllocation` the pointer is v=
alid.
> -        unsafe { (*gsp_mem).cpuq.rx.set_read_ptr(rptr) };
> +        super::fw::gsp_mem::advance_cpu_read_ptr(&self.0, elem_count)
>      }
> =20
>      // Returns the index of the memory page the CPU can write the next c=
ommand to.
> @@ -378,26 +351,12 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32)=
 {
>      //
>      // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
>      fn cpu_write_ptr(&self) -> u32 {
> -        let gsp_mem =3D self.0.start_ptr();
> -
> -        // SAFETY:
> -        //  - The 'CoherentAllocation' contains at least one object.
> -        //  - By the invariants of `CoherentAllocation` the pointer is v=
alid.
> -        (unsafe { (*gsp_mem).cpuq.tx.write_ptr() } % MSGQ_NUM_PAGES)
> +        super::fw::gsp_mem::cpu_write_ptr(&self.0)
>      }
> =20
>      // Informs the GSP that it can process `elem_count` new pages from t=
he command queue.
>      fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
> -        let wptr =3D self.cpu_write_ptr().wrapping_add(elem_count) & MSG=
Q_NUM_PAGES;
> -        let gsp_mem =3D self.0.start_ptr_mut();
> -
> -        // SAFETY:
> -        //  - The 'CoherentAllocation' contains at least one object.
> -        //  - By the invariants of `CoherentAllocation` the pointer is v=
alid.
> -        unsafe { (*gsp_mem).cpuq.tx.set_write_ptr(wptr) };
> -
> -        // Ensure all command data is visible before triggering the GSP =
read.
> -        fence(Ordering::SeqCst);
> +        super::fw::gsp_mem::advance_cpu_write_ptr(&self.0, elem_count)
>      }
>  }
> =20
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 83ff91614e36..ca03d497246d 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -40,6 +40,75 @@
>      },
>  };
> =20
> +// TODO: Replace with `IoView` projections once available; the `unwrap()=
` calls go away once we
> +// switch to the new `dma::Coherent` API.
> +pub(in crate::gsp) mod gsp_mem {
> +    use core::sync::atomic::{
> +        fence,
> +        Ordering, //
> +    };
> +
> +    use kernel::{
> +        dma::CoherentAllocation,
> +        dma_read,
> +        dma_write,
> +        prelude::*, //
> +    };
> +
> +    use crate::gsp::cmdq::{
> +        GspMem,
> +        MSGQ_NUM_PAGES, //
> +    };
> +
> +    pub(in crate::gsp) fn gsp_write_ptr(qs: &CoherentAllocation<GspMem>)=
 -> u32 {
> +        // PANIC: A `dma::CoherentAllocation` always contains at least o=
ne element.
> +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.gspq.tx.0.writePtr) % =
MSGQ_NUM_PAGES) }().unwrap()

I wonder if I should add a panicking variant of index projection for this c=
ase.
Perhaps of syntax `[index]!`.

We could also make the existing `[index]` becoming a panicking one instead =
of
`build_error!` one. It is more consistent with Rust index operator that way=
.


> +    }
> +
> +    pub(in crate::gsp) fn gsp_read_ptr(qs: &CoherentAllocation<GspMem>) =
-> u32 {
> +        // PANIC: A `dma::CoherentAllocation` always contains at least o=
ne element.
> +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.gspq.rx.0.readPtr) % M=
SGQ_NUM_PAGES) }().unwrap()
> +    }
> +
> +    pub(in crate::gsp) fn cpu_read_ptr(qs: &CoherentAllocation<GspMem>) =
-> u32 {
> +        // PANIC: A `dma::CoherentAllocation` always contains at least o=
ne element.
> +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.cpuq.rx.0.readPtr) % M=
SGQ_NUM_PAGES) }().unwrap()
> +    }
> +
> +    pub(in crate::gsp) fn advance_cpu_read_ptr(qs: &CoherentAllocation<G=
spMem>, count: u32) {
> +        let rptr =3D cpu_read_ptr(qs).wrapping_add(count) % MSGQ_NUM_PAG=
ES;
> +
> +        // Ensure read pointer is properly ordered.
> +        fence(Ordering::SeqCst);
> +
> +        // PANIC: A `dma::CoherentAllocation` always contains at least o=
ne element.
> +        || -> Result {
> +            dma_write!(qs, [0]?.cpuq.rx.0.readPtr, rptr);
> +            Ok(())
> +        }()
> +        .unwrap()
> +    }
> +
> +    pub(in crate::gsp) fn cpu_write_ptr(qs: &CoherentAllocation<GspMem>)=
 -> u32 {
> +        // PANIC: A `dma::CoherentAllocation` always contains at least o=
ne element.
> +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.cpuq.tx.0.writePtr) % =
MSGQ_NUM_PAGES) }().unwrap()
> +    }
> +
> +    pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &CoherentAllocation<=
GspMem>, count: u32) {
> +        let wptr =3D cpu_write_ptr(qs).wrapping_add(count) & MSGQ_NUM_PA=
GES;

Not really related to your change, but this `&` probably require a comment,=
 as
it has different behaviour compared to `%` given the `MSGQ_NUM_PAGES` is no=
t
power of two. I suppose this is actually intended so there's a way to
distinguish between empty and full ring buffer?

Best,
Gary

> +
> +        // PANIC: A `dma::CoherentAllocation` always contains at least o=
ne element.
> +        || -> Result {
> +            dma_write!(qs, [0]?.cpuq.tx.0.writePtr, wptr);
> +            Ok(())
> +        }()
> +        .unwrap();
> +
> +        // Ensure all command data is visible before triggering the GSP =
read.
> +        fence(Ordering::SeqCst);
> +    }
> +}
> +
>  /// Empty type to group methods related to heap parameters for running t=
he GSP firmware.
>  enum GspFwHeapParams {}
> =20
> @@ -708,22 +777,6 @@ pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32=
, msg_count: u32) -> Self {
>              entryOff: num::usize_into_u32::<GSP_PAGE_SIZE>(),
>          })
>      }
> -
> -    /// Returns the value of the write pointer for this queue.
> -    pub(crate) fn write_ptr(&self) -> u32 {
> -        let ptr =3D core::ptr::from_ref(&self.0.writePtr);
> -
> -        // SAFETY: `ptr` is a valid pointer to a `u32`.
> -        unsafe { ptr.read_volatile() }
> -    }
> -
> -    /// Sets the value of the write pointer for this queue.
> -    pub(crate) fn set_write_ptr(&mut self, val: u32) {
> -        let ptr =3D core::ptr::from_mut(&mut self.0.writePtr);
> -
> -        // SAFETY: `ptr` is a valid pointer to a `u32`.
> -        unsafe { ptr.write_volatile(val) }
> -    }
>  }
> =20
>  // SAFETY: Padding is explicit and does not contain uninitialized data.
> @@ -739,22 +792,6 @@ impl MsgqRxHeader {
>      pub(crate) fn new() -> Self {
>          Self(Default::default())
>      }
> -
> -    /// Returns the value of the read pointer for this queue.
> -    pub(crate) fn read_ptr(&self) -> u32 {
> -        let ptr =3D core::ptr::from_ref(&self.0.readPtr);
> -
> -        // SAFETY: `ptr` is a valid pointer to a `u32`.
> -        unsafe { ptr.read_volatile() }
> -    }
> -
> -    /// Sets the value of the read pointer for this queue.
> -    pub(crate) fn set_read_ptr(&mut self, val: u32) {
> -        let ptr =3D core::ptr::from_mut(&mut self.0.readPtr);
> -
> -        // SAFETY: `ptr` is a valid pointer to a `u32`.
> -        unsafe { ptr.write_volatile(val) }
> -    }
>  }
> =20
>  // SAFETY: Padding is explicit and does not contain uninitialized data.
>
> base-commit: 4da879a0d3fd170a70994b73baa554c6913918b5

