Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020083.outbound.protection.outlook.com [52.101.195.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9471339714
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 16:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773678578; cv=fail; b=Vv3k5Y2fLvLLlj88FyEjBU4mWV5bnvTJz0AH/UByzkwGf9zWdRs8HfFO0+ue0XWnZ4AgZIkJAQqsH5yPhQ2pnHRuk7m+eMKPyDwy4msC5eTvSfo0xK0zcWwJvhCJVRz9jhhrrmb/onhHIPPL9KpG33UYZXWF1dJywEJw6z45dVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773678578; c=relaxed/simple;
	bh=xpaGrowLQei5HErYaujTvh+NXm+KkvzZFnbDHUasEIk=;
	h=Content-Type:Date:Message-Id:From:To:Subject:References:
	 In-Reply-To:MIME-Version; b=GSUc8ajCtRF1ozajtEILPGKIhUmgKdnwzvkihgciUh+eghKYn8ArlkWPXq4j0hmxBbAjYCyUCahsFq690KowWb9VRPdYdvK/JSd7SpVfM2pvxj/pWYWaQPdo302idEjGkVhzXikv3bUclKz4xwfa/EWFUD0x0H530aLyf6wUOUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=o9XuPiOK; arc=fail smtp.client-ip=52.101.195.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="o9XuPiOK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYMFqNb+nWsqajYXkKAOkMv/v2szYFoviTnssDi8Kcez06cqDLFzvPdZJwyJnPOdDITjuRei3dfKDHQfLeWCMZQpyrISdmqWtDCFQi+xhZOY2AoM5i495avPI3w8S5EwJVdngs5LscXQ+C1N0W/5/tDr1Nn0plizHVZJgwv7J2Ib7lM9CApY4MfjOIBTvweqKjg59w8SaDbXnUpCEI46GD60Q/DMgqf8/XzViQ3/X8TylBqcUq70fEeYGlHCE6s+WkhIrRaZpMvHM3m8m+q1D7Zv+mMxMa79JMA2fY4p9D+wp3ZNaU1oLlVkUNqa51tjwn8vVvXlhl4+zAigLNbZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lZBg+QMy6ZjHBIE10DzZYpnts3ysWNPT5wOB/pPseU=;
 b=pPURUh/lT4zKYFG5DBwcO8tMeS7/aUjw1Mv0l2T90JU/BFtLuG92ALS66s/601DYeYq4T1CpUSh2KsnYSRxLvSLlnqVmann63rT0NqOpfJZS62MiP7G3CUZLG9/Yo6Be+pPRW/CXtJkg62vVzd3UYiKZnp0lqVjMcq6L+2Q4eYruNsCa2/1sg2CCtlO6DisRJb0nUNBgIDgEhC2qY9+gYPaNcmUYm0Qf2+CvjkMnbwwTLDYci3GZvA0PFS9tryM1qKZdHq072Z6gM5n53iVjpWEOlRgV7VvnBlnvfGvQn6RVquRjH/CaKhUxdRHZo9yAPKzpTn51733R6+/olxmdSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lZBg+QMy6ZjHBIE10DzZYpnts3ysWNPT5wOB/pPseU=;
 b=o9XuPiOK+jcDYggpMf3FqjjMvnETbtgAkAKfemHlajJdD0khTn5nSxPEAKzj9GJXGPIL4mvCllJkUsEUFpYhtYLLmFQCO/JspaSVZs812wfWjs8JHNxAuKMahcOEPMLOFH+vWxHE+MaiBbjGTzyQJ6de0ztidJPLljg/RUvmt0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB7285.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:308::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Mon, 16 Mar
 2026 16:29:33 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 16:29:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 16:29:32 +0000
Message-Id: <DH4CKVLS33NI.2U81BZMKVKW7W@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Gary Guo" <gary@garyguo.net>, <mmaurer@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v9 6/6] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
X-Mailer: aerc 0.21.0
References: <20260316055736.1690546-1-ttabi@nvidia.com>
 <20260316055736.1690546-7-ttabi@nvidia.com>
In-Reply-To: <20260316055736.1690546-7-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P123CA0201.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: c7909100-e8a5-489a-978c-08de837934a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5BYYElJyzOla6Zr00XiHAtsXv3acIvWqcMyy4O6xDtUmTJV1OVQyz1IV5Yo9dUFOlWnkOMcp+YDNNqCKkeGO9llkdpFFJoJwcu9nsRQE23lKZT3LVRLP2UM7lOHDLI2QKFMoT1zDJiuJMcvlB31KOzumto9B0xLCsjtubbY9ZYszVpwSH5cCFRpFhiho4HL4LH916M6C2VmUYRjXIKseDci/THi4BsorRpkmv6rijw6BYns+kM0UHqDGxaHH7R27mkhyHz3hJwhQaWxvSzfWq5nKT/n95bzWi2T6/39H2qDEouu6VwVGlPtyc5nqF3/Ru9iH2xhiL3VGXj2LnU3DDgOkSMyGLf7ZViczYJKTkiA91QwWCk+C7oZ40MF2jJ4Tg16S1NaIGIwso3E9Ukz1no1o0Er9LuS3yp5rYDCJfXSCpW0bnAoXgVc3mZozbPV5hV0257LJ52cQB/+JquBvnamwY977PkN3mwFt2M5ptjC3GdiJqFyzJNNlmjFCV0sNh0cf0NcXqxYmYPhSgsa5QuaEjqDR2aCZmEGjzf6OP6oIN3KOwLDHBrdHOapm4euGyQHZpEoglm7BvZMOpW23XFG0i3sHvGWURI42Maa7mPmlvBjZA17fj3KcGycrlM2AKwSElss58ncVXQzWaKLtC1ZDtm/IbjRkWcsnfVpVa29IvOkC+IqK5omSEBjjJQxdqsI/JvjEV0nYRSBZ8z33ZPDkxmo22a8Js0l8nE9CG21FtIwUdrhRZbwRzKsMiESBLzJPEhHVQzWgNlasfCCx3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTFrYVdBemFwSVJ4Y0FiYUF3czY4M21UQzJVaFdudmtCS3ppNi9vYUNDZWti?=
 =?utf-8?B?aXVpblhPb1FnYzJiUUcwc0lCdVdHTFQvc0JQK3NKM0UrL1BueU9tTVd6ZVhZ?=
 =?utf-8?B?U1F5U2Vld0ZXVjNtWkNEK0NyNDZXU0dKTmFqdk90RW5jZFZNTmFmV1dZYlNC?=
 =?utf-8?B?OG1Dby9PNk5WMGt4RnJyV0RuOGlvTjNrU1o0cVNLdVVPa3RyaEgxVy9hdG8v?=
 =?utf-8?B?UTBoOExJMXpQREJNZXErckUwTmgzandLZmU0dzFub0VmTWlGSlJOWlgyVkpI?=
 =?utf-8?B?QWhuelVFdXZ2NVdmRUFRZFZjYzh3M2hZN3Rkd29wNmVxQmZPM3IxRzdNdVM1?=
 =?utf-8?B?YWZhS3liQW1lSUdCTE9MamVVb0w5OGhyUWhlK3Uxei9zcEdjT254NHpXVXNY?=
 =?utf-8?B?cExrK0VRRTdCZnhkNkd6eG1KTFczcmxkNUpZenlTWUZ6ZTlWaWp0T2ovRmh0?=
 =?utf-8?B?SDI3aVdKTVZVam9mZlVwQ1o2N2pwd3F5Y0s5alYxSHV5eHYzRG9wWFYwYm5U?=
 =?utf-8?B?MStPLytCT2JraXk1TXlMWVphOXp6ZnZNNTV5RVFaYmQ4ejB4YUFYQnY3N0JZ?=
 =?utf-8?B?ekpySUdNT0lQWk1NL2ZVNUJ6QVM2VEswMm5kNGd6T05RMGJJbEUrem85ZDZL?=
 =?utf-8?B?Rkw5Yzg0T3VuZ3hPT3Y0bnpFWWdLOGlHbCtxSEpGdUFSNGc4TEFZenFUYkMx?=
 =?utf-8?B?U212WmVXYTNFcVN5c2xCbDZlTnRISkkraHF6c0MzVldFT1dyblVCYkJjTUtp?=
 =?utf-8?B?bHZnNUlkd20yN1VpaXFmRW91L0VudEw3SzNScldOZXBDQWlYNDNqRXRoUyta?=
 =?utf-8?B?NmFCNjNubE8xaklpTFA3MGFJQm0ySkJIK3FhSVA3aTQzYWdqTTJHRWIyTjNB?=
 =?utf-8?B?Y2h1b1B5QXVGUU42ZXM3WVVRc2xsZG9kTmQ2YnVxSGR3RXNHTnNiQytETWMy?=
 =?utf-8?B?Nld1Z3B3dWIzdkpia1hZNTdGN3RuZVZuZ0F0RlJMTmNiMEMraFFVQ0tya1Zj?=
 =?utf-8?B?Skh1ZU1SZGhsK0NuMW9xaU16aDc2d2UzWC9tcTVJNGhKTFJTaHoyN2JmUE1v?=
 =?utf-8?B?azliVEN5QlZkQ0RKZ1BjaHFqbkhJMkJ6U0tvTnZQOGJmeERwNmxUbzBaeGo5?=
 =?utf-8?B?eW9SRStlTXdRV2pSalRRY1k5TS80YnBzeHBQSERORmE2d0JmVjVwSjVJKzM2?=
 =?utf-8?B?Z2pxdDIvalloT0ZQT2xjV2p3cFgrOThKZHlyQ2FOeUVZZk01L1RVc20vZi9k?=
 =?utf-8?B?akxGMy9aRHhPZExBUW9jMnlNUnB0ckYwYTV2dGNHdUM2RS80N3ZqRFhPSFd4?=
 =?utf-8?B?TUxSRDhDZWV3V01IVzRXTTVtL2hRdGhZVThKcDZSeGg1cWZGYnNFWjJZY3dC?=
 =?utf-8?B?SHYvOUVKQUE5NUhpem4raEJjUVRGa1BCMm8raFkvSEZjU0RvVklHMUJ2clNx?=
 =?utf-8?B?SG04akJ5aHZ5QTJpZm9xbitPQStRcmNKUmd4c0VnK2hqQWkza2l4dnpPN2pQ?=
 =?utf-8?B?akhaTmcwM2w2NENKT3hBUEZpRWhQUTVxQVhmR3JCMUlFb1B4U21aTWR6YnQ3?=
 =?utf-8?B?cm5DeGVmUG9mc3VOWGJKTE9kNElWMU1QMThsQTA5bkx5RXZaTDBZQ1p2Z09V?=
 =?utf-8?B?V24wL2J1QWFDaWxkWUMycGJoRmdPU0xQamUrT3NIQ1RpSzYxU0h4MkRSUVRS?=
 =?utf-8?B?ZWpnT2FrYXNhVzFkbEhXaDJKMnp4SVA5cjAwUlorZk9zY2Q2TTYza21ZK0Nx?=
 =?utf-8?B?bWV6TTRuUGs3RDBXOVk4cUxFVDBvUFA5aDFIOXR0dm9XYTVUc3YyZjZCamJC?=
 =?utf-8?B?ajJjc0xLU29uems4d2pvcG4yY1hEYVYrTTBOMCs2ekVaUjJFUkREVGZVb0Jt?=
 =?utf-8?B?OEM0Uk93cUpmOERKMFI0ekJ3Zm01bWJUNjhSVnQ0Nytaa3RMeCtPdndQazFZ?=
 =?utf-8?B?T3pWYWxkYndhU2RhTWp6RDJaays0bkZuTlVYMnk5aTJldFA3SnZIRE05SDY3?=
 =?utf-8?B?bDBZUkZ5elhxLzMrUUhEbmZsUVFTa0ZrYmh4b1NyWVpRanJqWEtWNUUwQmlB?=
 =?utf-8?B?SXp1dXhHRnMwRm5FcXJiV1hLMWFOYit2TlJRQ3lUaEdRTUZGZ3JzbDUwOG9j?=
 =?utf-8?B?aEF3S0dFQ29rYVpYNVJWWVFmd3ViWnZiZnVQcSt4ZzRiK1loTlo3OWU5Qkh3?=
 =?utf-8?B?RTh2WXBjV2w1N2xCTjJSTmk2TlZrdm1kcDcwMkZVT3lnTnVuemYvVzhxQTZ6?=
 =?utf-8?B?cGtvVm5MN0ZBVXd1U2QzT3ZzL01nVnkwVkZFRFNudDcxc01VUXNYQ0tyZzQ2?=
 =?utf-8?B?RnNRYUxIVjNWMjNHNmpNbVY1RTJlYllOdmtDOWlNMkxUYTdrZ1UrQ3hEN2Nw?=
 =?utf-8?Q?n5dRL2xz1XWCOtgw=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c7909100-e8a5-489a-978c-08de837934a3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 16:29:33.1310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrxj5nKP3r6s4dK4onn9DFTY/9JLvYmNnlEbZpUZfz06M7Fi8swKGiBve2QKV/iMaFUOtCprpGUDvunBVPLnng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7285

On Mon Mar 16, 2026 at 5:57 AM GMT, Timur Tabi wrote:
> Create read-only debugfs entries for LOGINIT, LOGRM, and LOGINTR, which
> are the three primary printf logging buffers from GSP-RM.  LOGPMU will
> be added at a later date, as it requires it support for its RPC message
> first.
>
> This patch uses the `pin_init_scope` feature to create the entries.
> `pin_init_scope` solves the lifetime issue over the `DEBUGFS_ROOT`
> reference by delaying its acquisition until the time the entry is
> actually initialized.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs | 49 ++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index a6f3918c20b1..484e6aa48bf3 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -3,6 +3,8 @@
>  mod boot;
> =20
>  use kernel::{
> +    c_str,
> +    debugfs,
>      device,
>      dma::{
>          CoherentAllocation,
> @@ -100,17 +102,24 @@ fn new(dev: &device::Device<device::Bound>) -> Resu=
lt<Self> {
>      }
>  }
> =20
> -/// GSP runtime data.
> -#[pin_data]
> -pub(crate) struct Gsp {
> -    /// Libos arguments.
> -    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> +/// Log buffers used by GSP-RM for debug logging.
> +struct LogBuffers {
>      /// Init log buffer.
>      loginit: LogBuffer,
>      /// Interrupts log buffer.
>      logintr: LogBuffer,
>      /// RM log buffer.
>      logrm: LogBuffer,
> +}
> +
> +/// GSP runtime data.
> +#[pin_data]
> +pub(crate) struct Gsp {
> +    /// Libos arguments.
> +    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> +    /// Log buffers, optionally exposed via debugfs.
> +    #[pin]
> +    logs: debugfs::Scope<LogBuffers>,
>      /// Command queue.
>      #[pin]
>      pub(crate) cmdq: Cmdq,
> @@ -124,15 +133,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>=
) -> impl PinInit<Self, Error
>          pin_init::pin_init_scope(move || {
>              let dev =3D pdev.as_ref();
> =20
> +            // Create log buffers before try_pin_init! so they're access=
ible throughout
> +            let loginit =3D LogBuffer::new(dev)?;
> +            let logintr =3D LogBuffer::new(dev)?;
> +            let logrm =3D LogBuffer::new(dev)?;
> +
>              Ok(try_pin_init!(Self {
>                  libos: CoherentAllocation::<LibosMemoryRegionInitArgumen=
t>::alloc_coherent(
>                      dev,
>                      GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgum=
ent>(),
>                      GFP_KERNEL | __GFP_ZERO,
>                  )?,
> -                loginit: LogBuffer::new(dev)?,
> -                logintr: LogBuffer::new(dev)?,
> -                logrm: LogBuffer::new(dev)?,
>                  cmdq <- Cmdq::new(dev),
>                  rmargs: CoherentAllocation::<GspArgumentsPadded>::alloc_=
coherent(
>                      dev,
> @@ -153,6 +164,28 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>)=
 -> impl PinInit<Self, Error
>                      dma_write!(rmargs[0].inner =3D fw::GspArgumentsCache=
d::new(&cmdq))?;
>                      dma_write!(libos[3] =3D LibosMemoryRegionInitArgumen=
t::new("RMARGS", rmargs))?;
>                  },
> +                logs <- {
> +                    let log_buffers =3D LogBuffers {
> +                        loginit,
> +                        logintr,
> +                        logrm,
> +                    };
> +
> +                    #[allow(static_mut_refs)]
> +                    // SAFETY: `DEBUGFS_ROOT` is created before driver r=
egistration and cleared
> +                    // after driver unregistration, so no probe() can ra=
ce with its modification.
> +                    // PANIC: `DEBUGFS_ROOT` cannot be `None` here.  It =
is set before driver
> +                    // registration and cleared after driver unregistrat=
ion, so it is always
> +                    // `Some` for the entire lifetime that probe() can b=
e called.
> +                    let log_parent: &debugfs::Dir =3D unsafe { crate::DE=
BUGFS_ROOT.as_ref() }
> +                        .expect("DEBUGFS_ROOT not initialized");
> +
> +                    log_parent.scope(log_buffers, dev.name(), |logs, dir=
| {
> +                        dir.read_binary_file(c_str!("loginit"), &logs.lo=
ginit.0);

This needs to be c"loginit", same below.

Best,
Gary

> +                        dir.read_binary_file(c_str!("logintr"), &logs.lo=
gintr.0);
> +                        dir.read_binary_file(c_str!("logrm"), &logs.logr=
m.0);
> +                    })
> +                },
>              }))
>          })
>      }

