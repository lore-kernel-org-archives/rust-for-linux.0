Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012005.outbound.protection.outlook.com [52.101.48.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A7D23EAB2
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 18:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765651313; cv=fail; b=hSr2n0thqU+P71ZwxC2erTRrOCLF5xpPM6GGrrgeBX5jMEtQkRXGu60OA3RVI8Z33IjqFE/Ot0G+e7Sh4hK4gjFGIEH4MZ0d4xK5eLsf0GW/Yy9diBwncZlDcznI3yqGUOLrtC8XkbR/dUzv4aVQ8dZWe9a+77aOob2Aqe4b7OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765651313; c=relaxed/simple;
	bh=XBJhd3PAvk+wlkw0GygRBPn84yfGfUkgLEUD4D7FuOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ERb1maA5L79P6W1dfk+xPdX8Nr205NXv1N5e+ASr0p9KcgWKMy8LAgB/9dXGuu1dokI+dauamTk9VTTACCLm8RQ9/OjFopzyebKdX3dgAY+g/L5s8vwEsdz2hmuZwXAqaLMQ+DO7yqUDzq5Rdkiz9KhsLqdotxc4bErSO/SKuDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uT52E6Mh; arc=fail smtp.client-ip=52.101.48.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uT52E6Mh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FW77X2DhMW8FmbCljhcm1xK9gZiTtjROmpdn+QHRZIK8iSLu1bHWoZKnYNkDtNTmJuq4M2v8YyIT5C73vOdKd4fgivgk1vEQB17QPo5v5DS2wNyt5eC+BN/aWWQHcpg/xt51iIWHIamnZGkuYede/DgYWlbyAozibXSIBnLYRg5pyDMxy7ivCdNjgkLyY3TgSqL2OOFkf+VhHBsjnAS/ZnOY604CgXnL3k8B4uN15vAmNjPbhPGRBUr/umjAOTXHLbQD6Tr9BfbSaR+jDdyiiKZJEnegO/62WPKPADn+lmKbasSGmlv5GNZ0gWz6qnkTeDwiprpWl1tv6WluDnX9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsXexrgtVsp+mDx647XcWsRjir6CSLEHPCaDxuNwuBs=;
 b=Leq5tfH8lnR2MAEM1cKkqc+fgsJHPCwgRC8VMwsNlj+LacbfZPl7qw095o+MwEGA3Pi5BWADbKHjLcxPHFCED71wiSaHHgqkgYHPi7maaOwkGPYly5BvwTcN1aOX86y06M9TNnW0p05uFZRje0cDywIYzm3mLAE+YZK+4mOP86TPa6XV09RuFZnm6s2rcnzh0f0khJ/mVL4G6ddZb389ryYz448y+CNJ9p2kRy/OgTsgQcKPcYbZfjst6ry7TI/KuHOFXkqrKn5WSdAO9KidqSEUwBzBT9ciTvuRNwd+2ppQuNLmHtRPj4MYjgcuEp9fOLSs1XpzBW34YvDI5YkbwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsXexrgtVsp+mDx647XcWsRjir6CSLEHPCaDxuNwuBs=;
 b=uT52E6MhRwV+cBheM21Ixpe8yvhIVsusrG4h7/snT406ceYzYERky9UxKSOFl80kKxAxOAxqVQTC77v8z7Q0ZlwFGKUxGvco/F3uQYHdsH1P4ogIxGrpBtbvdXtkK3TsQTDdJonPkbYZYY2m9/MiXArFFcJF+PkDnkqmTqLn4za4BFQlCCBeCSXj/wuAZA4Ng5HubqVdBqFcrD27TKYkk9g9fX6zEQAIAPl8tjU1DTwZaCgld4rdTTBSb/zhEisukTiDnqMM3RB6cYtN0okpMi1TdYcnMuPU6VJ/E7RH0PenNhyaFNJPk+9MVGwGqMYF0GDjPCOV5KO3bfyaRBFUqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB5710.namprd12.prod.outlook.com (2603:10b6:510:1e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Sat, 13 Dec
 2025 18:41:46 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.011; Sat, 13 Dec 2025
 18:41:46 +0000
Date: Sat, 13 Dec 2025 13:41:44 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Brendan Shephard <bshephar@bne-home.net>
Cc: aliceryhl@google.com, acourbot@nvidia.com, airlied@redhat.com,
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2] drm: nova: Align GEM memory allocation to system page
 size
Message-ID: <20251213184144.GA1915064@joelbox2>
References: <20251208064405.573026-1-bshephar@bne-home.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208064405.573026-1-bshephar@bne-home.net>
X-ClientProxiedBy: BLAPR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:208:32a::10) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: 27223941-8b2c-4cd8-81c5-08de3a7744d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QQW8SHdSjG+khifyBptC/WqdNJZ/RrJDymNifLl50oGYCISC+IDHmMUmQNTu?=
 =?us-ascii?Q?TdaqEOtSg6/SLJJd61zMvmIptxULParj0Xx7AmrykESoL1XsukEXBCdP8iFk?=
 =?us-ascii?Q?c7ZfFTeMRSAmgDEDpVU7QQM1VCsglxwx/KXOBGqHn/leFW2P6IlU+HKKrMm7?=
 =?us-ascii?Q?QqP0q1yCeRFzWqVEPZlWcVElI7lcCRvK604LBHJ55AwXIud/myHDZ4cOGR8d?=
 =?us-ascii?Q?zJYH/4H5NnTk3V3KHLJu2HHULuMiupCQGGJwjxR6wjnCYsZCMDdbeYBtFkGp?=
 =?us-ascii?Q?u/gyvrKprfTI/vrjmoaTPA9s55MCxf6GEqDzQMLrnjmaSs9rzFLXdaPB5v+B?=
 =?us-ascii?Q?CYp7w32ksnsr3t561tDdKuVreHUIUKOgYF+PlQ2P3JZh0PktjyEVv+bPbf8o?=
 =?us-ascii?Q?XyxJFlHEMyjuFgLtNM3957JiDM/W92wSADQ6YgRzYHqO1ql9/VritgLJ/BHy?=
 =?us-ascii?Q?tpuNIqxF7oINplA63JQ/Zp/qgWn/U3TkqxNNsKyjKjvwNnCnIPrYN2Y1ng8W?=
 =?us-ascii?Q?KfouPAV70W4Sgz86vi4xqPb6DonhgSrOD5P//U+hlxIRS3D9seIA2cP6Dn6N?=
 =?us-ascii?Q?QsLkW65DpejvwLWPprpMM/LR9a4aHl1vaJr+EXrFtbtufGwBmHC/3OWzrQKJ?=
 =?us-ascii?Q?XNvfw325LCUjCwffTIuHnuqix1E5//JPJnm24q07YiE5YDBo4GRCyFb/iMle?=
 =?us-ascii?Q?AUq13wMmoa15ApfpJ4g4M2ez4/eM6XWyjPxQK5P0w1+yv9k24BQWn/6NkMij?=
 =?us-ascii?Q?UwWycgqaEaZAf0rUGSidztI1iQtxfDAIRBRkDJjzadPJbHuidr3QEzW17O6v?=
 =?us-ascii?Q?+hNpYMSnOesoLZCuUae1unnRselYuQjs7qhzzdCyCeL+c0jlA+fPdCcAWuY0?=
 =?us-ascii?Q?HDqAzM6oiXKQvEbdfOUD/dzH0QPusccsggluOvAkzsls//b5GqBF+yQ3V2Pr?=
 =?us-ascii?Q?wg1mJx/yy0fPrk6PMqBAF70IsoU5LFm/93pie769ScZHN9No+t5W31X2frdg?=
 =?us-ascii?Q?P8HrKrTebS+mPtTYdbjOauRAz70RAT7bbi8UjOCaa7AAtMdHyM7MZYRBcjCC?=
 =?us-ascii?Q?d/vnmhidOKMCmJsMX9ErhSHn4F88R9EjNHgxeFJYAFs9IcQ8Gd+a9FjV33M1?=
 =?us-ascii?Q?zY8qgvd15O3JLGDozSxu/M9bo7R3Ka18jg0MDcoQXkLNj7xn71V78tTfOxaw?=
 =?us-ascii?Q?7xG0pX2jTfVOZ3lrMu/WBYg43xbIrakPmAiXWkHj0g2ZNINPAccHOpeNgMx5?=
 =?us-ascii?Q?ih8Y0dMYxHd9A/gBlWPK8aYJ0r+QKSX7yMKI+5HcJfUzhhflu6hkcBV/IzSQ?=
 =?us-ascii?Q?N1fXsv/VvlEspsYXMfqWb2Kp8K4izTwuVXO/niueHkiaoavi9eJuhf4j1Kvy?=
 =?us-ascii?Q?DDTjdqFc2iEDvQ82lZSpsQXKwxdJtFpQB/lk3OuB80DPaeIzxm6GGuI9GKNd?=
 =?us-ascii?Q?ZylA/ibnap1MJShFRmXwktjb6dnpfuVYRKlHJUnWae0RGgW4lVdqZg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eet5ETQpoznA6DVSx8o+US4lO0QsWNVG3GWVSwUgmq9HNFBs0IRM1U6IlYSR?=
 =?us-ascii?Q?AGCWofZRE5Cl5czjUrh2QnuGMYDmd3yazion8a5T9omvL0L4hxjctrYDdw+J?=
 =?us-ascii?Q?gQ4rOCrNsGvZa5Os6s9cAC/7FRPMDDmD/tN5/JbVKhTIH0wG+fdDFceo6+BQ?=
 =?us-ascii?Q?isZGO8lyzmvZX4hMlpqhLd3BUGtnfsClt+UKkW74yeYM4Gww8vTANDhyVkZ+?=
 =?us-ascii?Q?doqzIE81LLUVHPn1WnGo0Ryv3BjYyizaKOp/rjF3YCDT2nukqF7DeOlg+U5t?=
 =?us-ascii?Q?Rz8DdFbAz/wEL6VIaDbuibKASUodcWMrU/Y+k7ArM+llXA1WfxPzZvUhT9eZ?=
 =?us-ascii?Q?Y1OhMXZy60g5sB2lAMObSOKlAWOtaVZq19ny6FGuyh/jF6mS95RivXV7z1ux?=
 =?us-ascii?Q?bZidV+piVgg699V8wBSVEtMlPNrKl3Te6rYXuLh9yW2ZpZ7uF6aPnWZi/g0S?=
 =?us-ascii?Q?YZkrxrrKBfB/xyVb8rL69GJd6qNi4Cpn0t7rhnCgf5R+Gc10RqmXObg/kH2h?=
 =?us-ascii?Q?i5ltf4YsPD007GlP/s2oZntq4oVhm8w+wVHCzgtw2Hqr/fUTt8OTPogzQqqK?=
 =?us-ascii?Q?hHlmrNySuPNwh1fl/eKWYPLWThrBkcHs5iYJf5lp9fxC5ZJMmY/2qg3vUAvQ?=
 =?us-ascii?Q?lqc7lHpyuoo6hAJGjEaSL6wwmSSX27t2TRbQXP57wNgQ+YbVWKxcSuRPIDV3?=
 =?us-ascii?Q?8G7e1vJQOw8XIN+g9etBo4gBU6+qJVBblt5sgOhZTNFm6xtaDATUdybCoyZU?=
 =?us-ascii?Q?hUkAvslRGH2L4gmzRQXhCQ4J4uq+7LJZSDbt7rkaC8L5HknMuMsM52+ZAGah?=
 =?us-ascii?Q?W14hAIr60TcVAZId6KHcNRFblZGS2rc8sTneXMql3ShZMy14xRNDI8abr2MI?=
 =?us-ascii?Q?rSVvwJgqgHGl8dWawggwvisJLt0eqnF3PJ8erD6nnb+Lulbw/X3pi0o8TSvE?=
 =?us-ascii?Q?d/oZmk4+mTSr9uW5xHbW1fs4f7uEUFY7G81rkK26hVxGKcIZqCQJE1Lsst2I?=
 =?us-ascii?Q?zqxaSYu65+Ppg2jwOp26rD3eYPrXGdYZRM9jbSi6bEA3rA1hT0GztUp0OYx/?=
 =?us-ascii?Q?9lH/oWsAw+iyX49Ddlz4NlGznAmXM04zIsBzI6FPM05Hh3Y/y2wG9Jo2bgUD?=
 =?us-ascii?Q?IJlZZwJG0IrFlxK66HsG6wgV2rK8XI/niT0ZX0WLFv436N1fsR4C4UZUd/PY?=
 =?us-ascii?Q?pDjtu24YL3K6UFfpP7Mqm2sJEJxNslhBvz4s7p3ck7vNormwNnJFLQl1O95x?=
 =?us-ascii?Q?+iC067hvboR9TfcZeWL4MSk5B6ZkZwktcKRB+Ru6QNqkih41aiciloCfxMxZ?=
 =?us-ascii?Q?0GaKJ9cdj32x13axyvGR1q/ynVCuHEFpw7lrrmlYZuCO9rVdrzxo1+YY+VYu?=
 =?us-ascii?Q?6Zbg0N/Y+sqrEaXzLRRFrSjUgznlmLRejuR1ho52AxAiBgo/3zgXIpeKhqg0?=
 =?us-ascii?Q?PCdHihy8IY10c2OswuMEPMy2ad1fKb4uvqpx9MLgwQNCOq9F8ye1jpibG7hi?=
 =?us-ascii?Q?ckm8OW5bhcIT8WFJvzDkJ2Hat8C8XodIWyCY2XvCTilCfCL/mTi1pdvv28Kq?=
 =?us-ascii?Q?K7WoBeQ6PwRDHPKL7a+kg3MOaIHqmFkPrrpX6s4E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27223941-8b2c-4cd8-81c5-08de3a7744d6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2025 18:41:46.4967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gq995Th+i0qQ3I5u/GmLVwoMpiVrhfT5pPdPC8Sk582la/lCj2a5QTRTH5hhCE+xTiirI5XIljQjL5v31ORZ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5710

On Mon, Dec 08, 2025 at 04:44:05PM +1000, Brendan Shephard wrote:
> Use page::page_align for GEM object memory allocation to ensure the
> allocation is page aligned. This ensures that the allocation is page
> aligned with the system in cases where 4096 is not the default.
> For example on 16k or 64k aarch64 systems this allocation should be
> aligned accordingly.
> 
> This change uses the updated page_align() function from commit:
> "rust: Return Option from page_align and ensure no usize overflow"
> Which returns an Option<usize> for overflow safety.
> 
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> ---
> Changes in v2:
> - Updated to use the new page_align() Option<usize> return value from:
>   Commit: "rust: Return Option from page_align and ensure no usize overflow"
>   https://lore.kernel.org/rust-for-linux/20251204224006.353646-2-bshephar@bne-home.net/T/#u
> 
>  drivers/gpu/drm/nova/gem.rs | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index 2760ba4f3450..41439f3b9361 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -3,6 +3,7 @@
>  use kernel::{
>      drm,
>      drm::{gem, gem::BaseObject},
> +    page::page_align,
>      prelude::*,
>      sync::aref::ARef,
>  };
> @@ -27,11 +28,7 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
>  impl NovaObject {
>      /// Create a new DRM GEM object.
>      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
> -        let aligned_size = size.next_multiple_of(1 << 12);
> -
> -        if size == 0 || size > aligned_size {
> -            return Err(EINVAL);
> -        }
> +        let aligned_size = page_align(size).ok_or(EINVAL)?

Don't you lose the size == 0 check here? If intentional, please update the
changelog mentioning it.

thanks,

 - Joel




>  
>          gem::Object::new(dev, aligned_size)
>      }
> 
> base-commit: 37bb2e7217b01404e2abf9d90d8e5705a5603b52
> -- 
> 2.52.0
> 
