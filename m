Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010028.outbound.protection.outlook.com [52.101.61.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1521635972;
	Mon,  1 Jun 2026 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300122; cv=fail; b=ur7Zv6GO70lVDeOfe2VSM6kKLIkrgOaNWX8cEDZEVjCd7pATu1yJwnGtlJ4sAclHZKeZoxBQpXUkxSswBtiBJKcsPfDTMLeci0NLSYVWy32qd3Bxq2K2RYzhyvOoJ8Qpqo0xZ9XrTlF+SUNH8mcO0v0RDYz2Dypn/8hEwJ7w4g0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300122; c=relaxed/simple;
	bh=zBoLO/OZcQ6rz7ANboTQyP6xmf+fFRqyhvIKyhx+hr8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jArvVBbPErAXVhTOqgkWx+BQXMji7UknuX/maqchMlT+NzjPY5Erz+RhY7RXL0ozvjOSviTVkDQZ3Vgj2G5ullbu0lPbWGwVGjweiFd3pOXD8o/qA21g5nFaxkT37Ko0RpOPXzAkE320lMl+vjBS4mp4pnb2VbS4ERIJWR1x92Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e4NTClGb; arc=fail smtp.client-ip=52.101.61.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e4NTClGb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8tn2XhRmi0lkCnwyx1ClZ6GdLDmR3gcKf/1uBheSrlyGubSars0iX5CqWIox6gR4zrskVpj0LRZ/SX7WpwmToRURv7sCwZebXbeIyY3TFng8RSbhpgcEHXdmqQpKo0VD00SdkKe6C+f5m/XTpWGFpMQ9ixh5t0jM1h0+S27LWTq7+ygxao+5hn0FmwWIltLcy4U8hnX7ot31AtfIwZyap9M+pWP3NH+xqVI7JUt+oNED1q3ig0WyKDFjEqkgW39Wsll/3IiHMNTWpredCeydBACQoCuYiniqVZp0S0eIJZuGEKlZ/a7WRABSw47G7YeIzMHnF8ilruzwyI3mQFd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ovmHB35/85ryoSuZOVq9OtZ96k0MhcdqsrZuvAYJ0g=;
 b=WjlwnUxygT1UCE4sbrcjb7YoyQ33yr7UukGjHY1n59MaS2YLtNCvEj1gandeVazPyTZ6emXgvuU5HbI5H/6MfRCCvaepghDT+EACGgiVHfTszsn3bi5wOVIBeeWc404M6xGq5n5dCxVGcw8FtcoKXEwE6S/vmArHYELOO3H709x61RxYbUTxKOOwiIXtlocwMox9yuTDleq5Q7X7piTrgh9ThhepLaJCnN1bKZi8qcG0f5k3WPgyyFNtRfL6v5/y/eA4eY8S/bP+NPNPBemCN+9IRap94i7AlN9p16lC/TpGCMRXpJyaiSYi1WeBSo62sFuuZztqUP1s2ajyVWs+CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ovmHB35/85ryoSuZOVq9OtZ96k0MhcdqsrZuvAYJ0g=;
 b=e4NTClGbsn8lJEKvKw2+S/xGCCsn76Tw9shs5Lj7DB1+y7vmI525d1Ps++x2/Btk8vZkZOz0Ibo29nYCh0k8FHwy+1ZNlhhwbKBqnUucaiVPxUycLLaHntGG4UszkkXbnLDoo0a24kL4k6phReBdNoVhqSGvYEcpWCfNtswjOaMVjQAtIJCPdFCNCQnyON3zLouX56wZZFEtSa9W3DuZLq6MEdKNMx1KPX7LbeB8G0K19pcm3Lveco4x9cOibftHzku2SknchtuDyUJMaz2za5VEvUhfpZtjLRxhxDnDjy0lyYn++Nc0vGX/cDhWDsNEeDKCf3eePO6Q5Q4clL6ooQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 07:48:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 07:48:32 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 16:48:28 +0900
Message-Id: <DIXJPV5RWRNK.OLQ2M3QL908W@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 12/22] gpu: nova-core: Hopper/Blackwell: add FSP
 secure boot completion waiting
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-13-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-13-jhubbard@nvidia.com>
X-ClientProxiedBy: TY6PR01CA0006.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: c3805bae-f49d-44c4-e22c-08debfb22db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	t4WbuShGDm5hKlYxux6ULrwMvlNePg4u9+gQI3STvgt7wvlRgERtIy+8NZPFy4gX9p1gJo8XnR3r7+we9zqO+iEWfPhpBa2lHTjNYhxkXcPx3lacWVKFL3eBcCxM3nGifz9faV7JfFy18a1sKLbhRLiJu9GJVawQ1J9t53+mjsSJITl4LA0Z7jvT3fTR82naUtbamyGEToBygaV+T/+n0vmxU44CxHiLDTemlc6wiWii83yIjyKDbFWBhb1qwB3N1oD/f9Xm5kFJIukVMQQ4XIySNEdjT/XJyJguLUP3iM0utobHZrZAz0dCl45Unnbqr8JVbPS/C/zO5ZSRIQeW/mpcsLERKe0rkrxzKggGB0lHfAjOXspNZgNTTQX6zYeVH24VybnVJBfneYCaIHh8FJX/104P/Wl1hDIj+CNKb4k+9oHR6BZkGlTuwLWSvitNSQ9VuQBAggMXOSF1EtMc+poNpNGgEHxH5mvpQnSWLuIYjMWkCZfF3Kny/56L/OyqxwXUOsDr/gaDldiZ+jCTxrYXSqMAdjgR1SCABEmVxijQmr0h2jsZNHXBTrSCS/Ve4dDCmBxi9+mxKHB8bMynCCqHgDhAvt+gqfvEA/GUW8BzFRspIyqxdSFzQxJPyhiRJ3+VLaQqhgTrc/blHC4CgxJ/H8mdu7SLm4ma2FnqGq9pjp5xgP2R3ypzdredowEW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXZzYVBmajBnNmlPNDBDS0RjTVpKMVpWZzhLMW13ZTJObTlIM2Q2VXJwc25J?=
 =?utf-8?B?UDErWUhWNm92MHBUWUtxM1p4RWk3eHRIc0tlNTlTSUxHVkI5ZlU1cStsV3cz?=
 =?utf-8?B?SG9ad3pMTDlXV3NPRUllVGpYbFhTMTBDRVR4MFVQNUZMWGxGZ1lLb0IyWG1j?=
 =?utf-8?B?aXdOSmlMWThrdk1EV0xzUVVBZEtQTUJJaVRHTzU3dXlDNGk3VVNkN2VKSWdI?=
 =?utf-8?B?Z00veFBkRG52R0N5ZkpWNjgyTG11K0dLNlZKN3NCMEorc1ZtbFU4ZzdtZmNt?=
 =?utf-8?B?WXJPa1Y5RzNWTUkyN2RmSXNQUExSMnRPUjZUKzVHM0RjazZudUNtK2RaN3Q5?=
 =?utf-8?B?SE9ibnZwRStMcDhLbzhIbkJVUHJsUlVuT0tKVmkxajJmdTFKUXdwejVjR2cw?=
 =?utf-8?B?YS8yM2RxQnF2SzhGMTIzbTd4MmoyQ1AycERMZ1kwWnRyUGFyNnQvRGVSMXV1?=
 =?utf-8?B?djFBbU1GU0Y3aHljNUVmdEhIWFBIcTFKSVVyZWJDWTliZ2tvekUrUnEvc3Ux?=
 =?utf-8?B?Vk1xRk9McU01c0NubjY3djNZb2JNcndpNUd5WjkxWkk2bnlxcXdLbDV6YmpP?=
 =?utf-8?B?dHRZc2hZVG83K00zMVFDeHB0NVpSVWFpSXFUNjJVY0V0ZXllZmVaUnJ0cWUx?=
 =?utf-8?B?cjBSM2RjbWtKZW9VVW5SL014UHBTT3NsckZYZ0VqQVFOalZGZy8xL1V5dlIy?=
 =?utf-8?B?VlEyWG9sdkkvNFNkN1V4N1NVdWQ1SGQwUUh0UWd5bW9CSWdZQzlvT2lXYjda?=
 =?utf-8?B?K3U2RzVqSVhxOU1aS0w0Q0M2a1F6MENOZHg3eTBMZ0Y3ZFpHMWVjQmcwalQw?=
 =?utf-8?B?aElqM0FmdjVoM0Q5ZlJJYU1LaFBVaVlPbHpVTmlMd3V1RDhrTUo1dzBZOE9l?=
 =?utf-8?B?blZndjVCTTEzTTVsVm1nQmVOUlpYQVovR2dSYnZQdjZzNnQxamF1TzZLRXho?=
 =?utf-8?B?M1ZPbzEwbC9pY2dqRXVSNzNoQXRYTUY0QVYzUVQrNlpvaDV6Z2p4TjMyK2h3?=
 =?utf-8?B?OTd6emJUTDEvMHdDOTFya1oweXRYN2x3TFBYK21CSUd3L3RKcGpCWHhXUzY0?=
 =?utf-8?B?K05aOUE5VlZLZEhMc1dVN3dJV1ExYTRlci9DT0FCRHBWS3hjdEZaeEgrdS9U?=
 =?utf-8?B?OWdRS3IyOXhiS1Q4TktNYTljOXFlWURKR0VEWFZXQjNpQjVkb1VGamwxWDFZ?=
 =?utf-8?B?eEVHeUw3UTQxMFp1cnBGQWNMVkU3bHh5M2pOTnhjMU9DR2JnSWwza0hzbWNy?=
 =?utf-8?B?Wm1zNzZSTElNYWxzK0NvendtMW1BVDkzZ3JEMTdkYmZLT2pVUmhQWlJLb2FH?=
 =?utf-8?B?OFA4OCs2MDQ2by94azRFcnp1ZmdRZHR4REZVYUZ1dDVZdWwvVC8rdzRWTjVk?=
 =?utf-8?B?S1hrNG83cm9jYmZpR1VoV3l2Vy9zQ0czYTF1N0lKYklIc2IrajNNdnFvQmM0?=
 =?utf-8?B?UTE3NkxibXB6dkRad0xQSHd4T210dW4xbXBQaFZiODBVc2dzWWs2T0RhZU5h?=
 =?utf-8?B?OFlOWkFMUXcrK0NOY3lGK3cvS2tqMU5oSVdvTGhtbkErNmdKTnViZ2FTdWRL?=
 =?utf-8?B?T3o5VXdoRXp3TFpFZTlubFhYODV5NjZuQUs4amJsZVBrYzlrQ3RPRnJPZjF0?=
 =?utf-8?B?WlZFUHBnbnFCWEhFOWFKcGw5cFFMaWFmc0d3RU1CbmhSWVpIQldHNGQ1ZVlv?=
 =?utf-8?B?aXdvclhjK1FRb2NEMDZMOVFnSytHak4ybmdZN1d5TnlTa0FUNXhMZmhxd1hv?=
 =?utf-8?B?ellrNWsxUmpMKzN0WmVrYnpPdk11SUdNV0NETERrRVllSnR6R2VucUR3Rll3?=
 =?utf-8?B?N2J4VEJVVmdWWXZ6TCtCSjYrSStEMEhKOUd4NkdlQ3R3NUcxWmtjZmY5dTNJ?=
 =?utf-8?B?YnBtMGs3QTk4RGdLRDJhWERKeWRQWkhoVmZjN3BzbHJoY2hnTnlYU1VGc2dM?=
 =?utf-8?B?eUhRRk9uOFp5U3cydzdlK3czU0RTSGs0WFoxc2NQWGFPanIxU1hCekIrcWFx?=
 =?utf-8?B?YjBRSUNnUVoxZTFjZmxoRHFwNTUrL2F5b3l4NFFKOVJrNUNQeVJaRzl4THdE?=
 =?utf-8?B?dXdXTG02WTQ3N0o4dWEzTHlBT096TVExTm91VmhiQ2xZVTZ4UXhJSzAyQzlJ?=
 =?utf-8?B?M1lBRHQ2cVhkbWpRcWVWaWkxSHpWaUJoRUpZRzdLMmJnL2ZVaUgvRW9obWU3?=
 =?utf-8?B?NDFweXVJeS9TT0xZVVhVT0VSUllXYWcvTytkZ3ZxQnRSNERlQWlhalExa0lT?=
 =?utf-8?B?cmI3MVZkOW5JRGdkV1hQOWlwcWpWR2Q3MFBIRjU1ZXJGN2JEaXVHYTlZRnRz?=
 =?utf-8?B?RFRWQmJ3MEtIU3g2aWtrNHFBT0RoMGF6aC9zMmtndlpNOE81Y0RUWGtLOXc4?=
 =?utf-8?Q?Aop+WSmA0PyU+kAe2ZQ6+PtjizTWSxDNbiVUpoTuF3A0B?=
X-MS-Exchange-AntiSpam-MessageData-1: ygVZo89qhlcPgA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3805bae-f49d-44c4-e22c-08debfb22db2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 07:48:32.7080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phz3uv9XyKewAHRDIJq/aOi97vgLvpxDd1OrK0D8imCr/p37R20IxsKcKTyF+KwByzEdvebHf+UKQoOsIc0VMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> Hopper and Blackwell use FSP instead of SEC2 for secure boot. The
> driver must wait for FSP secure boot to complete before continuing
> with GSP bring-up. Poll for boot success with a 5-second timeout.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fsp.rs           | 51 ++++++++++++++++++++++++++
>  drivers/gpu/nova-core/fsp/hal.rs       | 27 ++++++++++++++
>  drivers/gpu/nova-core/fsp/hal/gb202.rs | 23 ++++++++++++
>  drivers/gpu/nova-core/fsp/hal/gh100.rs | 23 ++++++++++++
>  drivers/gpu/nova-core/gsp/hal/gh100.rs |  5 ++-
>  drivers/gpu/nova-core/nova_core.rs     |  1 +
>  drivers/gpu/nova-core/regs.rs          | 36 ++++++++++++++++++
>  7 files changed, 165 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/nova-core/fsp.rs
>  create mode 100644 drivers/gpu/nova-core/fsp/hal.rs
>  create mode 100644 drivers/gpu/nova-core/fsp/hal/gb202.rs
>  create mode 100644 drivers/gpu/nova-core/fsp/hal/gh100.rs
>
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> new file mode 100644
> index 000000000000..ee8fc384fe38
> --- /dev/null
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +//! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
> +//!
> +//! Hopper/Blackwell use a simplified firmware boot sequence: FMC, then =
FSP, then GSP.
> +//! Unlike Turing/Ampere/Ada, there is no SEC2 (Security Engine 2) usage=
.
> +//! FSP handles secure boot directly using FMC firmware and Chain of Tru=
st.
> +
> +use kernel::{
> +    device,
> +    io::poll::read_poll_timeout,
> +    prelude::*,
> +    time::Delta, //
> +};
> +
> +use crate::{
> +    driver::Bar0,
> +    gpu::Chipset,
> +    regs, //
> +};
> +
> +mod hal;
> +
> +/// FSP interface for Hopper/Blackwell GPUs.
> +pub(crate) struct Fsp;

Throughout the patchset, this type is never instantiated and is only
used as a namespace for static methods - something that the `fsp` module
itself could also do.

But I think it could be useful to create it and pass it as the `&mut
self` parameter of the other methods in the module, as doing so would
make the module more resilient: we could request `&mut self` for its two
other methods added later in the patchset and guarantee that there won't
be any concurrency issue.

This should also probably create and own the `Falcon<Fsp>`, as it is the
only user through this patchset (and this makes sense from an
architectural point of view). The `FSP falcon engine stub` patch could
then refrain from creating the `Falcon<Fsp>`, which would be created by
this patch.

> +
> +impl Fsp {
> +    /// Wait for FSP secure boot completion.
> +    ///
> +    /// Polls the thermal scratch register until FSP signals boot comple=
tion
> +    /// or timeout occurs.
> +    pub(crate) fn wait_secure_boot(dev: &device::Device, bar: &Bar0, chi=
pset: Chipset) -> Result {

... and with the design proposed above, this method can return
`Result<Fsp>`: we are not supposed to use `Fsp` it until secure boot has
successfully completed, so making it return the instance that enables
the other methods guarantees that this has happened at the API level.
