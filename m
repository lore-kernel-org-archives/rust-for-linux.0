Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020085.outbound.protection.outlook.com [52.101.196.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BF73DD52C;
	Wed, 25 Mar 2026 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453540; cv=fail; b=G5pf0vtg32a64IQo/TgjD3WsXs4hPooZpuDqxSNyYKcVrgsyK/MjOdYfae+XnWbBcHozTHqFxzxopX/XPrlfij2UHjTaATDXYhmrb29l1ZNvHPmWck3k8A/ez4XVUjZq4Ql/OItMdIe9ulMN/4G8FWbzsgMo1iUR1DdTw+egwGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453540; c=relaxed/simple;
	bh=ZV9QNOyUmpWSv5HXqyCplYIXYOoOP45VZkygY14ZLhc=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=nB9QTQmf2ha+5HSSzxv479n2HBHpnlXbf2RVzBgxxyUHbjXqVYfEynxkAdqg0y5ZwXEi1lkvg8UIiCbqsQoa2xNwmm8AAOvQDhOSNqzIn9pqPFBagkATTwkyGWJwBOqGgMK2ldUa7y3P978olEkDrQ/U18zgXy9c0MLlDgn4/t4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LVj584mV; arc=fail smtp.client-ip=52.101.196.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LVj584mV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfZWTQLPhgSb/bsl7A3CEh22yevvQHw+QHb5ye3a4W5xk2iPOGo3WbuZjxIUa7r7XuXnjmT1mlFFW38TxBbcmsEycMb2fGC1KKyCIt22uq2eFxFegPsa+l9N5q2AmzZOyFCONOrozf4LFnJ+kl+Y7hDq9iKWM/17xny/3wcRWc/MYWIBxBGZ8S43pi+DUXJ78UVyIxQHuuHCsBYi11XkdZbranTOy4zbj9MWvTQW7T95QyNKU83UIf2PJyVrQew060TfDC/2J5IGkwUX4/hBQn6RWMSPyhj8YROMqby1SBHO57wHfrqEmeSGBQEIiZz2HaCBjMOx2W1yJa0HWHHfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdOfCkriLL4xB7k/HZdBVKD3R61PHHjq0Ona+oXVnAw=;
 b=vv7H0kXDHQ8c8NJhZ55IDZiEYLWpVPMXXIu1dIdNuDq9fd1IfztNrkC88vJxrcm0kYTC3JTW+qtixeCvQI36v/WXV6dvUOS1puIYkCjxPMRZDz8kqjAfTKnryN0YQV76qFLIAJjsJlw0/nG9tV6pwix9pp/lTmCnhexFQrKNgsRMYmqG/0oGw04I2xE7AXAjp3yVs2cY8cWSJa0cHdOKUiQzaUj8LOh8Uu7ah/a7RfmmMYNvxYmQcXFQ+PhUx54gJuB7mzasYu9tUpwSTdXSxrNQLu6cP0PRTw5/OT6m0JORFgWfc92kH/HCQ0Xr1NB/+aRoOAwo63sKnP6Q46AVyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdOfCkriLL4xB7k/HZdBVKD3R61PHHjq0Ona+oXVnAw=;
 b=LVj584mVHKa644mqyaLtmKIU+97Zo4wzYwOTRjOE2+7SZRX4H5SvCvi4GvQMNVYd7MLOSWqpQgLOPDZFRt1HgFx2DL/SwuOalh5vIBAM+T+Wf/AQME0yqYR5yJ+e74q0FVAeFAeTR7ccHnHUsM8Du2XY0Qm+ZjG9MkGjRiwStuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6778.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:45:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 15:45:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 15:45:30 +0000
Message-Id: <DHBZA23V0KRU.36XBA6KHRKKOG@garyguo.net>
Subject: Re: [PATCH v8 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW
 boot waiting
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-7-jhubbard@nvidia.com>
In-Reply-To: <20260325035242.368661-7-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b5a516-1909-460b-c02b-08de8a858b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|56012099003|7053199007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RZDpxuDRlejkOF5UN1bSGAltNPjHmJyhOebaXeyIZ0PkZLaQ2Rr1WIxDROeUJZsp0Vhs7e5+lDKN9Uv7uHXkkdJwLtwEweCp9PH0m7JQVVwsCNk51LegHSx0TU9F0mSWnHCT+T9+0yqOQFAmTMIu3I8Egl06Y/NbdYlzLgGNffHOSeImlF/8/HbiaZFah8BznPjavaBwiovWXTsZDfalOX+RmmIO/eINykpumfuik/wJRswWaukhrE5qFHJjQxVUcQHbSpmV6kbki+EcsWR+Q47cukVkE+wSdnND46iXoiYFIB8uoDS4bbD591Y/ecr5HeHy6+I4avcXpD/GezxMPSKIInNe0ahe61BB5Gc59JEqVhIqeWBUZAZXiZt7/CT0yXHT2qUm+t6IvEOg/gwFbjxQ6aUetOfFHJ+F5NdpwAHaX5VWnPpuGzE/+mcI4eGHQJ4XaTbAjkYX3V1REJ5dEOzmgodvma9wxwyELYMHOWi/raxvigpyzZiNOV+StciIfPXYNZ0jmidzS/Ml3jqm2c0ur3VUiqTzVFevP1tGQymk4Arf+3waRGwCG90W3nQVxc9icb1iKu7HL/zfC4NsPEHf5lywGQYvFrtF6vAs1CcjPvU5SZsf1XOPq3snK2WshsPNU5LpAl+mq7BO/NAAl93LPbQLQysAjldfbliCHFJsKYX9ZMvpGuI00gkIipN7Ds4nhoP+5F3wqQR1lIo3Hd5GGco94vHd5jPOI86YYzI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(56012099003)(7053199007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTlrUXNhS1BvNWZLY21tR21YYVhrRjZSNDVyelV3ekN4TkJOYkgzaU1yK29H?=
 =?utf-8?B?SjdIeWdEU1FneTJMNDNhVGtiQjgrRHJRWkFwMFpodGtxRnZDcU1pR3dmbHdE?=
 =?utf-8?B?bE1PT21tU2JuY1hYeDhEanRNNkJTSkZDZVc4ME1qSUF2dm1rSytES1dSVytU?=
 =?utf-8?B?TDVhZXE5aHNYV0tic0xna1ZPUHgyL1ZwQ2ZsU2wyWWlZMjB0d3hnWDJ0Mmdl?=
 =?utf-8?B?cFF5aWJkenM3K0pzanlNRGVRRXkycTV4UG5IMHpHZXY4RHF1cW95c091ZVZR?=
 =?utf-8?B?TEswMzVWWnpNdVhXVU5Hd0F6RTZ3RWVkTEV2QmEvWkt3cDBQZ3BJZkNUeTBk?=
 =?utf-8?B?bFlXazVtTE9URnFoUi94SEVyMmV4OHpkTHordC95UWV1MWFyQ2Y4Y3d4RFZv?=
 =?utf-8?B?NDJWUkRYUkFTK2dVeExucE1ReW1wb2dUaFdzQytJaHVmQW40WUY0d3Y5WE9W?=
 =?utf-8?B?Z1I4TUlud3RlVDlMMXgrVTI1c0R1SmM0RzZJVlRNWTh5bEwya3BFQi9DaXFK?=
 =?utf-8?B?Y2JvU2lTbzFoVG5MZkUxV0hpZXNrNElhbVVHSUNFWmF3eTFyV3ZudVdJaXRS?=
 =?utf-8?B?VEU5cTV3RlJaeVE1RExMY21jeFFocjArNWFvYWRueEpDZkNVVGYzdFg1OU1y?=
 =?utf-8?B?c0tJL00vOEdPVkp6U3MyZ2g4TTI0UVFuMXkyem9QZEpseklYc005VDcxQnlw?=
 =?utf-8?B?OUhWYkZRY0Q3cktGV3dvS1dFWW0wOHdyTnNpeExJbWgyT2lOT3FJYkZzOUx1?=
 =?utf-8?B?SCsvUTZ0NTFTeWxSMDZ2ZDJZaGoyT2oxaDhWR2Q3VnZxSm01VkZMUWc3Q0Fn?=
 =?utf-8?B?VWh3d2RvQjBOZFRlMUxOWFhTa1NscU9aZ3lnYUdqeWk5T3FTZm82dWdmQkQ4?=
 =?utf-8?B?a2lqdnA3alcvQjNZZEVqdDk4dzhiUHphMW9BUER2OUtSUFdzdjNoaGdsNkRU?=
 =?utf-8?B?MXZ6cDdvbGJWUkEwSStuM1JuSmg4Skt4WTdMNFAwVzg4YjNZN2N2SE41bUM1?=
 =?utf-8?B?c0Z2dlBtT0hrUTNwejN6akdMVExWMlFNenorZTMycEJZWStlTHJLdyt6WS9F?=
 =?utf-8?B?L29ManhLd28vblhFUVRGWGh0M1VvWk1BWWRWcENJSjZQMDV1ZTM1dDRSdFg4?=
 =?utf-8?B?d05CeStEbGp6ZkR5c3NKT3dleXdBYnRwRXZpRVJLYWd6VnFMbVNUMzFHb0lD?=
 =?utf-8?B?TUtxTlhTck0wN3ZOaTJCenAwbC9jZXlBK1pNZDUzdXIxcXpNMDh2Ti84UmVS?=
 =?utf-8?B?VEhFWlJhZmd1dE5iNzZndVR2MHRZZXNacXpFSkVYZngwNk9rZGlxNVNlZWhu?=
 =?utf-8?B?M2kzZ2d2RkV5UkJwZWErYVU3ZU5hQTI2WmJzaXZnQmV0QkJYKy9Vc041Ukxk?=
 =?utf-8?B?VitGRnFONVZBU0tRRkRuU1JYS3AyWHMzRFN0SHVCYVQ3WVAzSVFjUlh6bWNJ?=
 =?utf-8?B?TWorRUNSWWZhWWp2cVNxMHFuSlR2NjJuRmorMHNvSmR0alExcWFYZy95T3Zl?=
 =?utf-8?B?bTNubHFXL3Q2bVB5MEVOZVlyTVJZVlZHUVRVUFg3dmVTY2xZYTdlczN1cFZ4?=
 =?utf-8?B?ZkFlS2lDUXFhUTB0SjZ4ZG9RMzBRbkM3NHJNMWJldDYyMTZkMnFiejBWZHB3?=
 =?utf-8?B?ZFVSSDBoT2RGMjYwL29nd2hERE5xWkVsMmlueXlNbkVLRS9mM0k4N3BqaG1G?=
 =?utf-8?B?aXJFVnJuSkNyOHF6RnZuNEYyUnZaRzZJRHFZSkUvVW55SndUTyt6KzR2VmZV?=
 =?utf-8?B?MVpmbTJYRXQ5MjJSRVZmWWxKbmpQWWIxYS90SDNraGNCUStZeEdkYjBWM1Ez?=
 =?utf-8?B?UVRMdlQ0eHo1cHF2YnJIZGUxdE1mSm1TM3JENGtDeGE1WnZucWRMcGwzY3Zn?=
 =?utf-8?B?VkpodFFPaTZuOTBnUHU5eWRDeFBNc2JUUEExcHAvMjRXMWZyT1Y4UnE0MHRr?=
 =?utf-8?B?UWhoTTF6WCt6Uk40NVc5eHBIYkhRbXlrZENjQWJzK3NPa3JXWnNxUG0yQXdt?=
 =?utf-8?B?ajZaWmEvUWg4cU5iL3pQWEtZd0lCWVZKZU9rSm1lN1hsSkJMb1VCZ1l4QXlj?=
 =?utf-8?B?VFJqTG1XMUlGTmtZZEQ2SENQSElQY29UVlhPemt2b296TzV0ZnFFMmhoUGta?=
 =?utf-8?B?cXZXWWtzL1c0cEUxN3lIU0J0dm9rSEJhQzNZeUFyL0V4TWRsQzJBSE9ST1ZX?=
 =?utf-8?B?U2hOcER3aEk4MFFoMWN5VkVnZnJNRXJSTEtDbUFKRldnU2F6dkJJVFErNVlw?=
 =?utf-8?B?ZVptQ240N1dRZVAzV3RzZW9YUzVrL0dxNkpoWFJvVUJ2L1VLbUF5Yk5sQVZj?=
 =?utf-8?B?QWU0VmxmMk40WFJlY2JPQVhLTHYxSnEreHRLWWIrbHRCZ1RlUXFoZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b5a516-1909-460b-c02b-08de8a858b4b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:45:30.6177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eNH9ZYJR/bYkLf2gzjvno7WmzauIA0w1/MIkWFXxLUaDvoY635jaUWEzYWryYtSdgXgEGx3AecFLm50WKqb3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6778

On Wed Mar 25, 2026 at 3:52 AM GMT, John Hubbard wrote:
> Hopper and Blackwell GPUs use FSP-based secure boot and do not
> require waiting for GFW_BOOT completion. Move the GFW_BOOT wait
> into a GPU HAL so the decision and the wait both live in the HAL.
>
> Pre-Hopper families (Tu102 HAL) wait for GFW_BOOT completion.
> Hopper and later (Gh100 HAL) skip it and boot via FSP instead.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs     |  6 +++--
>  drivers/gpu/nova-core/gpu/hal.rs | 42 ++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/gpu/hal.rs
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index e7c3860cfb28..5cef5b29cd3f 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -18,11 +18,12 @@
>          Falcon, //
>      },
>      fb::SysmemFlush,
> -    gfw,
>      gsp::Gsp,
>      regs,
>  };
> =20
> +mod hal;
> +
>  macro_rules! define_chipset {
>      ({ $($variant:ident =3D $value:expr),* $(,)* }) =3D>
>      {
> @@ -309,10 +310,11 @@ pub(crate) fn new<'a>(
>          spec: Spec,
>      ) -> impl PinInit<Self, Error> + 'a {
>          let chipset =3D spec.chipset();
> +        let hal =3D hal::gpu_hal(chipset);
> =20
>          try_pin_init!(Self {
>              _: {
> -                gfw::wait_gfw_boot_completion(bar)
> +                hal.wait_gfw_boot_completion(bar)
>                      .inspect_err(|_| dev_err!(pdev, "GFW boot did not co=
mplete\n"))?;
>              },
> =20
> diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu=
/hal.rs
> new file mode 100644
> index 000000000000..2f9e18e67a35
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gpu/hal.rs
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::prelude::*;
> +
> +use crate::{
> +    driver::Bar0,
> +    gfw,
> +    gpu::{
> +        Architecture,
> +        Chipset, //
> +    },
> +};
> +
> +pub(crate) trait GpuHal {
> +    /// Waits for GFW_BOOT completion if required by this hardware famil=
y.
> +    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result;
> +}
> +
> +struct Tu102;
> +struct Gh100;
> +
> +impl GpuHal for Tu102 {
> +    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
> +        gfw::wait_gfw_boot_completion(bar)
> +    }
> +}
> +
> +impl GpuHal for Gh100 {
> +    fn wait_gfw_boot_completion(&self, _bar: &Bar0) -> Result {
> +        Ok(())
> +    }
> +}
> +
> +const TU102: Tu102 =3D Tu102;
> +const GH100: Gh100 =3D Gh100;
> +

Why this instead of using `Tu102` and `Gh100` directly? They already exist =
in
value namespace due to the type being unit struct.

Best,
Gary

> +pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
> +    match chipset.arch() {
> +        Architecture::Turing | Architecture::Ampere | Architecture::Ada =
=3D> &TU102,
> +        Architecture::Hopper | Architecture::Blackwell =3D> &GH100,
> +    }
> +}

