Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011031.outbound.protection.outlook.com [52.101.57.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC488EED8
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 02:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773887194; cv=fail; b=ExafSNt3exXFUZ+UQl6wGExPaShKU8BQ6zuke2wHhckFqVO9KbQhwLNNppkHt6q5dijY+loVgbhcJx5GvaoMUPH5R3TBBQph0KC5/ijJuBIGBX0D+oHT+4oNQPjI8caQ4KGTD30uQeZ0wmaDV+c/zfvVK06tX/UrbY7LtfN4nRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773887194; c=relaxed/simple;
	bh=fMeiTJRyU0TFVhYlUFL0klEG2bZnt1adYw/eoMy8Ik4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=a4rvo8YY9GI5IRDRUuZWOPLN1gMsV8uLBA7UtXUp4PuQip/vsSgalRbr1FKz7CpHphKAOexc5qopSQwNUul3bJNHX/UYZ4GrB9cFzBS+pt63eB8dqkJmHDVoac/TeFGxXRqq9dVVeCmlO34TgmZnx9NhftfzpF4IsR+brvNNXZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rzRQCNwe; arc=fail smtp.client-ip=52.101.57.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rzRQCNwe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEv+VDVJZw+Q7z68ENNlzjMhv/1hF/tXZ0vDVPnHFrwaZxPq5CM94c9DhcsZfZJfQmODZuXbvDjoblPyl75C4Any1BUnU4VEOXJbb48eRX55KaisgLMgt02vV8zoz8GbGnTnZJkAL1DZeL31jrJG+r3AKWYtlqNA9sgQ/f6CnBioMHfFdsofHDVa1j3sYCLtax/Mh+vqrizJjVra9AWbB5ZYM773yXP0siei50hHzbNUu4W8+eZbXOaYglz2f132AsytUJeyTGdq6D/c2fXg5OHmxUcyWUhgtXk6GdisgbUMSobsSgkuvbonxdtS7Ki9F0hrr2QU7qva0rQ8/+C88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNkEh9lbqfm46BbL2VA/cnN2kW3h4RcYbEPaJ7JE+s0=;
 b=CIS1s2EgtqoBIyxSv+2S1rlZtmSUFifkOd9n7HonoEF8IZ3NZpqB9t1FOKq0Pvl2lj60IgBLPFKUnrOF8sxpA5iwAuMzsEpwd+wTKp8nCaVxGdji6kha3dZ9vS6v0UUdVs1ZBXXcMKjUfdL8fY6znrFzoGMNfOw0Z4ipcPc8QsH8tcXGy+KyaIIQpIkRYy85C9SKkY4YsQDAVdiwfUyikGw85NljECEWcMInuzEOhbeMKpj9qTcue5R14mLbxNj5RbAGqAkB0WTI++hYIiNnqI/IvPe6DnIiOTUn1tpTybVHOb1XFlS72qqwIljlRBofGlsbOCinonkUlIvUZ52bIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNkEh9lbqfm46BbL2VA/cnN2kW3h4RcYbEPaJ7JE+s0=;
 b=rzRQCNweR35IdZ5ud8vAc9VoyAh9dPLI75o0PL5Y/+ySl6ezEEtXoJv/ykBsE4aE0YEPfVPo2YSYmDwO1BEVXW3b7KOMpjwZxNXF31zlLV9lvTAS/9hrCtSWgzuLfM8szIQekpsTa6pSVDg/8eJEPeJnkeZd1awmul+/h6I2u3yL9wKE3yQOPTcvyPCce9rx/r+TDH9GGnyOgeC3apeNI/bFijUs/bK0ZSjXdDIYh+rVLrLFNW/ikCVvht3BwrMRblgVLYr/Vrr8RyCm6+PkHBytjMonQ5go1STl34y3RIE6F1EZDyF0Yf0kP4niaFhADU4i+kVSRPqTEu1AeWY8Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7000.namprd12.prod.outlook.com (2603:10b6:303:208::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 02:26:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 02:26:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 11:26:25 +0900
Message-Id: <DH6EIYXIPMNX.2VBWKCBK75H08@nvidia.com>
Subject: Re: [PATCH v10 5/6] gpu: nova-core: create debugfs root in module
 init
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>,
 <mmaurer@google.com>, "John Hubbard" <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
References: <20260317235403.1094713-1-ttabi@nvidia.com>
 <20260317235403.1094713-6-ttabi@nvidia.com>
In-Reply-To: <20260317235403.1094713-6-ttabi@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0166.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: aeebf273-2ce6-42ee-a6a7-08de855eecb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FwLQOIfszAWiPcg6oTmm8IH9WSEoXt5zWbt/vURjGCIwNYIseQn3V9BoqaZV/ehJawrA4wzcsu8tG7/3njGeAlctbFcLG88HhRldFWAfsseysfdw8MmqaBLyIIYeMo6mDOGjmD3vWOl4DEcX1uDLiLbsB0KIEyok0DaEdYBpp8v0KfPmEZB+VznaewxEzB11FVZ2RLoto3dAPytoZ+O3KR73SEhacbEiOZuaavOKubJbiZxfgi9kD5pdhS0lnnIfXdifbTh6WIzOvHDAvfGzZTdGSaH9zEooDKtItuc1qyilM84ZBrhXO/lEVEYiZ3ikuNNzCkcNgnZYuBRffbjfF/tKxcDJslPq7B9NdaWgCeRYULzA1Ir5fh23KU5ARv25TROWWEfOwWowi0jtjXa9uxmeI3p9NDVP0xa+EyOiER/1+dmJhTyVtLktAZybjnjzMnMd16EI1XZ0RkFHURF3gK3xQfc/4/duoOEWUzS5RS15cvnJby28J7rLM6EvpOFIxiiu3ggFWYW8f+9I+jpnvGBnijiRvf6Xf+HAZfPpg5NVU7/pSMwefyEp9gOhLdcWzh4YfmDUc7MlOR4ConVYKRtXDv9471sOMm1y52FyujichMDRsVikuudiZgrhU/EE3JFaaOFPaDwcugH1hEsHo8TFshmi7kFbympue3rXenI7Gjo2IT+x0mRb/VPVtQPcy6Nvt9dEnS7PHstRAfZj809f7Ak9ff7pkdLELT2QZfw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NithV2JTblluTzIvRWJSVE0rVEIyRzZ3bWV6QVlwYnVveWhBMStzUm9Rb2F4?=
 =?utf-8?B?N2E3bkFDS0JPSUlmYk1yV0RQNkxvSU0wc1k4UVlMS2R4em92N21rV3Q3S0Zz?=
 =?utf-8?B?UnJJTzExeWZaTklhTW52NmxyVHRYT1dZRnJaWHJjbnNGeUZxN1lYUnp6dHFu?=
 =?utf-8?B?TFNIa1JHYmh3eTN4bURxY3lsbFI2YnhtQTZ3ejBnMlBNdDFtN3ZMclVwb3BW?=
 =?utf-8?B?RDloUTBlS1ErTzFtRGhUWDI3c1dGenNIOXdMZnFUbG83cVF3cldmUjF4WG5Q?=
 =?utf-8?B?UEFxZE5kMXFZaW9QckdPZDczZENSWHl3WnIxUGpwRmtjVzhNNXRXaUhzMWE4?=
 =?utf-8?B?RlhIS3huNWloNGVqcExaWHNaSFhCTytpZWlqaE9vY1lQUWpnVTY0QWdFU2Zx?=
 =?utf-8?B?ZnB6MWRLdHlQNDRTOEFjMzlkSDNRMUErZTIwS1k4SEk5SlFSNDE3NEVTTTlT?=
 =?utf-8?B?ZVR2bllPVHVkRmxVdU80RjhxNE5POC8wS09USWhzbXl5ZjYwSDZVNGRVeklv?=
 =?utf-8?B?QzFTK0RjWVhEazZyelEvNVdUODRhbG5hcFFXZDhvVUd6c3hFUEJidkQwZ2VO?=
 =?utf-8?B?cWp6OWtidThuNUtIeVpNWFdiYVNmYnZiUUdiQWRVcXhWNTNXWmJkTnJYY0Nx?=
 =?utf-8?B?K3hTOEZqQzFOVzM5MWRTRXZNK2hPb2FyTUNnUjFBeWo5dHcvWkhtWUk3eU5t?=
 =?utf-8?B?KzJqSGlJWDhPVnN3ZDhpTG1JNEhKZ0pCUDdqS3hpTEladE9GY2p1R0R1MWxY?=
 =?utf-8?B?UHJLbmNCYmRzOUEyOW0ra0NzdHpwVzVOV0VmK3BCUGtwV3JLK2VUOTl1Vlkw?=
 =?utf-8?B?bVR5WlN3TUtyd1JXSXBaTUFrbE9NN3RKQ3YzR3NOU3VEYnNjdTFwNmUzV2xj?=
 =?utf-8?B?SHhvOVQwdndGRHRBdWFFK2l1WS85OU5jQzlOUXNacGtYaXVOVjFrSGw5b2V3?=
 =?utf-8?B?ZzdTWUhFK0k4M3ZwNkpjbjlpbFJwNkkwL3M4bjYrZVh4OGdNanBOMkorblpm?=
 =?utf-8?B?RXA0ekJXUHNFbnNCZ1pJV1VJQUdCY2Y3M1VtdFJueHhzQlNrK2pDT3pSUGtG?=
 =?utf-8?B?RUpWZ0xQY2cxT2w1YzA5UVRSTFZPMXlnS0V5OTd6cDhlK2J0eEU2ZkpKS3Ni?=
 =?utf-8?B?L2RwZWVuMm1tY0llNm4wZHNseGsvSGtWOFlqamdobXZxUko2ci9WckVYQ3Z3?=
 =?utf-8?B?VlNINEhlMXVUWS83ZHhFUisvb05va2U0VHZySi9ZcVRGM1h1SUtKSlA1VTAr?=
 =?utf-8?B?NUEzam9NaE91cUlBL1pZc0N4cnEzWDBEMXIyR296dzFwUTVKc3JHaFc3NDE4?=
 =?utf-8?B?WmR4OWlYY2ZvZFpwbjVWbFZxelBmVDdQRzExVFBjWGZYdlNFREg1c1FyemZQ?=
 =?utf-8?B?cnpUSDFuUGFtVVppMTV6dFhpOWFBRTZjSEVobURnRXFsc3NWRnAzZGJHb3ZU?=
 =?utf-8?B?MXRzcUhUVkViY0R0YUMzMzQ0bEQvOXNDRWw5U1NkQkR5VFczWUZuM0dKZUh5?=
 =?utf-8?B?bThiMjhGeWNqZ1UyUSs5eHEycE9pNlM3RVE4dTZhZHM0TTdIdWYvWVpTRFRw?=
 =?utf-8?B?RGx5QVptOXdQdWNzMUVtQ2YyRGp4OW9pajUvcC81NzQ0U1lnWHRTZ3RMMHRl?=
 =?utf-8?B?d0xYN3R2c3cxVnZ3SU44N0hzQ3lrZGQwbTBaWUo1NXQ5NHBPY3RYOUNZRVZ3?=
 =?utf-8?B?NzFsNUpVb0Y4bWFhVHZTV0pNV2liOXR0M0hmYm1kaXMrMlVpQWkxVEVnTzRl?=
 =?utf-8?B?aGEvbkJSQ1ArZXQyOFFEQTJjT05TckdlTk1CNFBvM1ZZWi9Nazg5T1N1dGhp?=
 =?utf-8?B?WlpwTnpNVGNKZC9ydENIU2hZcEpVdUh4M1BMZ3d0eHVHMThGMGZzNi9TNldn?=
 =?utf-8?B?VDBqdWNTeWNDUkg4K3NFOWlQN1Y1TmR5OVFOeVFqc01lTWFNNmEzN09BaVNq?=
 =?utf-8?B?MHNHS3VIOU9yU2JlNG9BeUpZZUxCazM3cHRMaHcvWkpaakpva3hCMUhLS1Vu?=
 =?utf-8?B?akkxaGNyazRNdFF4dFdKNzRpUituZ0p0TVBUajA3N0NaNFd6K2Y2K2ZQdktY?=
 =?utf-8?B?VGZTb0lFMG1uMWZHNGxSc1U1bmlIWWUyQXJVNDRDS0ZqLzBqWWc5Mkp4Qmdo?=
 =?utf-8?B?SWNJTUZXU2M5cUVUTHpsZEllVEtBNklGR2tzbUx0M3h1NTRvYWFCaVNvNjAr?=
 =?utf-8?B?SEM0cDVkUUNJam1LYk5aRWZIbTc2YVpzWHk5VklDWm1VeU0rMEUwRm44MmFP?=
 =?utf-8?B?R3NidmxoT2tiYzM4QmVrZmdDaGo0MjZzVnptV0xTZjQrWm9aVGVDNW5PNEYw?=
 =?utf-8?B?WGtOREd0WkY1VVNsUi9LdmJSa0pRai9YZVZ3ZEJqbUpiSWZhdk4xOTB0dEpu?=
 =?utf-8?Q?1Ym5HjUt9oQ4Vv7jjExusROB0nEHsw7bvnuURfSyhC2Tf?=
X-MS-Exchange-AntiSpam-MessageData-1: OYHD80/g1SBqHw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeebf273-2ce6-42ee-a6a7-08de855eecb9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 02:26:27.9488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxfcHyxE6uQ1Vkiezw4IX28qRH0TBH6Kt9mdUKrYTo7HubjKIvpWno25O0yiE4lB1th01DSbyAmvaZQRdQZ6AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7000

On Wed Mar 18, 2026 at 8:54 AM JST, Timur Tabi wrote:
> Create the 'nova_core' root debugfs entry when the driver loads.
>
> Normally, non-const global variables need to be protected by a
> mutex.  Instead, we use unsafe code, as we know the entry is never
> modified after the driver is loaded.  This solves the lifetime
> issue of the mutex guard, which would otherwise have required the
> use of `pin_init_scope`.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Tested-by: John Hubbard <jhubbard@nvidia.com>
> Tested-by: Eliot Courtney <ecourtney@nvidia.com>
> ---

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

With a few nitty nits below.

>  drivers/gpu/nova-core/nova_core.rs | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index 0114a59825aa..b7e6c6274aa8 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -3,6 +3,7 @@
>  //! Nova Core GPU Driver
> =20
>  use kernel::{
> +    debugfs,
>      driver::Registration,
>      pci,
>      prelude::*,
> @@ -27,16 +28,40 @@
> =20
>  pub(crate) const MODULE_NAME: &core::ffi::CStr =3D <LocalModule as kerne=
l::ModuleMetadata>::NAME;
> =20
> +// FIXME: Move this into per-module data once that exists

I'd change this to do `TODO:` for easier discovery.

> +static mut DEBUGFS_ROOT: Option<debugfs::Dir> =3D None;
> +
> +/// Guard that clears DEBUGFS_ROOT when dropped.

Item names need `` quotes.

> +struct DebugfsRootGuard;
> +
> +impl Drop for DebugfsRootGuard {
> +    fn drop(&mut self) {
> +        // SAFETY: This guard is dropped after _driver (due to field ord=
er),
> +        // so the driver is unregistered and no probe() can be running.

Here as well (even if it's not a doccomment).

> +        unsafe { DEBUGFS_ROOT =3D None };
> +    }
> +}
> +
>  #[pin_data]
>  struct NovaCoreModule {
> +    // Fields are dropped in declaration order, so _driver is dropped fi=
rst,
> +    // then _debugfs_guard clears DEBUGFS_ROOT.

And here.

