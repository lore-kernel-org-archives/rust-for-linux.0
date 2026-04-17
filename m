Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B112B3AF661;
	Fri, 17 Apr 2026 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776435854; cv=fail; b=SoakwnwcCXI4d7t8LQP6XuuPjEZzWBd2/lO7dHLUXpP1TevvU+7LUjmCsVuC052y2rfAAzlVZQC3as56AMgC9+kVDrF6HwmTCzi7TeXwkLpqqSYuaK0VoVVI8x/lgpz+g7Ivbqmf+4vUarQpLEDTgl7OFB8AQwRU6V/vuhcqvLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776435854; c=relaxed/simple;
	bh=POyawfhAkv4t921+bBtB165AdVTNz+Eiejzd48Oa7rg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jWwfrALNHL6OWoMlTL72xbACqVFrpwnD4uEq7V8kT5wZOECnWrNS5ResZVdfHEQ9gicLf0jh0Bwf/z1irm9EeyfSu9QYD2HJjB1+ZVWHayc6kxIHZhogkH5aJVHuNCT/NMcQksulIYYW59/jnpX8BMa0h1ts6YUL1YwXOZWn2IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rN/RwiC+; arc=fail smtp.client-ip=52.101.46.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rN/RwiC+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/hqxUqoEU/rZmcj1ByvnT2AiZYuHawRYFZrnnAQ/iGmS+NT47kmWc7WZt74GILicq4Vw8AkC6KLJNQyLQSR6+vBSqUnyJcNc7++t9bGVgi60YwIQSD6ZJqlrrns7MlkX7ArKh0mHQ4EvJFTvLg7qrUf32fK9DCO1/N/qgGEae2TQ1zXPj4LTY+gu7+AJ8SGJfSsfhFykCm55/l7yPnk3HH7eQhopxuenN6QIejBYp1qYR6TDpQv+Qjzejnt4mqr7anYkVu0WnMPU2PhGtXuJYZUOdxKfMpblIYV7B/X11pUWcLGlX8hI37EkQCCanYTebPnn/AzzFLuqe5w2QByxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2u8puEU97F8LPjjEa5ckhyYkaTbiqW4crst4dhTq8w=;
 b=L/Uw+w5GwwI6v2q2G4YzARyOfrb55YnEA1vWWkP4gWvfX2tbuux19DBELrYgzxrpi3BqAfXDSWlz52RjeoX7Gb7ERdsUbjzP8iU0lLpoqDAcO+/7KhicqlBPdOWHclgz3yMONCwLOej2pUgUC/Bo8SO4cJP+t44hPAd8yxXw+kSqwlQa6z0ujbU3xoFZIAOzfuIVVDDBitqtCpLDNt8XD4d5y87YS8XJO/x3IfbhUxY+1r+O2TQMvot99Iz0bVf9U1fOcFNihidqDev0NL+uVpfsEo5L8fWPJ6my4J1IkAmAyOlG8vWEEeww+/XJnj9C0hwyQJLwDSRazMLmZJXb7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2u8puEU97F8LPjjEa5ckhyYkaTbiqW4crst4dhTq8w=;
 b=rN/RwiC+sMN2w0Mj6GWh3bPNsFqhLXD5Kddxf5GdjUsGbvdLa1noe0/tdNRIwG1EonjlOZGZd9piFuhr+EAEiaac6OhlawW8QqX2Pe4vPLZeeUAQivtp8gy06nX8TWASh3ODAylIm8d/OGFnt7Ikoy0im7xuLaihkBIaOuSJJCmpJVTjzSMD6fKHdkQ/fz29B6d7SOCSbEZMF6/tE9eMzTV8Ng6OO2zyRk+EyXWgZkLHZuTfqyBWWKX1E8uDqO7mQr+T47Npr5mqSPJT4u6LcaS9yzMxVlvZEYFs98/HmFK/WWQmxMggMq9pcacUY9JDxhvpByolmM+7ZaUVjaN3Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8135.namprd12.prod.outlook.com (2603:10b6:a03:4f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 14:24:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 14:24:09 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 23:24:05 +0900
Message-Id: <DHVHY96ZYSQ7.NSIVQC49FOK9@nvidia.com>
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
Subject: Re: [PATCH v10 11/28] gpu: nova-core: Hopper/Blackwell: integrate
 FSP boot path into boot()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-12-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-12-jhubbard@nvidia.com>
X-ClientProxiedBy: OS3PR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:604:db::23) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa4e268-ae9b-4aad-3172-08de9c8cfd13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3UIcQu5c6fSJXL8saGYpQ2AAkc5WmhaPZ40aji4sOwLIKjjBP1nvGRpRa+FTx+7qARcU3iYoKpyQbP0/ELws0qNkIg45z3atdxqnkSCtn6XBWXeA7KRg1dfpNdh3lKfzoBYEqn/bypLpU3Z85j5XcKVaR4wtHHIpyLGeSytq1tagDALIfVs0ncXtGGHPquQ1bDXHVxySZbexBTGvU0SpAIigx41oWpvkQISzNxlYWXRWehO7iqfiWeDVWY3F51hweDTacffyEsT1/CaOYZDQ3WiAabk6iy3UXv/mV4ta1M64TZqUX12unZwUtCAXkgK50RM51b9NhxL/WtPMr59phosW8MC/DUa8ZHNcUlcTVbCKFjUMS0iKRzkX/Znaf5iAH4H3+8jaQRnkHl/OXqG3J1zGn2mltFufcklLPiIAqi6bYd+G4jpPgZixOaGUVqlqDNNuaCGdC5sMmaFEycxYQzus+mB3aLQfifzXfdyYcKPOedgkhH2WxseuTIyyZ9UiZIxK7aMoO7XmMm1O2VIkoFVpmPhjck4DWgR+ooyIPZsHGmBaCm6mRPnoEkN51FL4enHf6VMD6OA163spngFoD1j38FHroe09d6L0u+bJHMgnjE7ycoPF/fh6bwPq/wcernxY2lRMWk8+23XO/TcO31aCjHNpUPtit8V2jKoUKuJdXQ+gj96+Uh9c4XlOrD57Be1/cmL9BLALd6quRCRS64YJ92wOjLlV5MTRbnx9O2M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajR1MENHdDhJWS9GUGw2bWRHNUtiKzB2YXJvR0pmREJIMFdPYWRDajRBSXFw?=
 =?utf-8?B?U1lxRDA2NFV5RTl5V1cxZ1o2cVBYR21JN3ZOUnQ1dWZxWDV3MWtpbHQzR2x6?=
 =?utf-8?B?MDh5MURPNzZpcGpSTUg1RVhEVjVTdkRKOElDazhwOEw4TjVpZHBQYkwvWlN0?=
 =?utf-8?B?N0ZvaTJqNkhWYnFuNU5MUUhVczJjNFBvcE9rd2k1cTBHNlA0VnRUWEJIMStW?=
 =?utf-8?B?UEJrRkNXT2VPU2ZnS0FLbXhGd0NvV1h3MnRnU2R5cE1mdDRVLzRQSmZpSHFT?=
 =?utf-8?B?cTNoRk5xdnZwZCtYU24wRkVUSXRSZXZOdFRUUkF6djFOMGZRK2taVXdqWDV0?=
 =?utf-8?B?WmVCQnE5WGoxOWNqVERvVFkzZWZTVlBzUmFaVlRwMGR3OHo3bDEzSGI4VHcr?=
 =?utf-8?B?M3Z1L2lGT3FTMXNCMjhtdG1ta0pvTnBvRHJPbkJsNGRFaEZXRHJibDFQYVQ4?=
 =?utf-8?B?MVdmTlRic1U2UVpmYlcvL0tSRytldFJjcmI2dWdCOW5JeFhmNkVveWkzeUVr?=
 =?utf-8?B?aVRNSUtXYzRNYVRFdldhMm1oWjNBSDNyNU1WR0ZpTGxvdER4TnBocmpMNTY5?=
 =?utf-8?B?T3g3ZngrUk9ldjYrN2RHWXNKN05GamxxRjFQcHUvQmNVVEpCQllybUx0eG5E?=
 =?utf-8?B?aVhneENaM0NlYlRmYm9qV1krVTZlaS9TSGtTT1Q4WnNZb3d5cU5kblkrZXJw?=
 =?utf-8?B?bjRrYjNidG9LM0dBclNQMVZYR3VMdk5MNlZxZXJ4L2I2UFd0emNubXliazlT?=
 =?utf-8?B?WjYxNWJqN3VrNTNoa085cWNWeHZUUHBGRTZrUHgrcW12WFdZK2duYldMbUF6?=
 =?utf-8?B?T2lRVU5pZHJrUFRVV2hPU1l2dVdPNWd2YlpEVE9NVThVS3NvZHYzeGtjNzJH?=
 =?utf-8?B?TXI1Y0hYQXhFekJGTGZRdGRBODVkZW12WVIyS2d2enFBZ3hoSFdNZ0swNkYz?=
 =?utf-8?B?VWF2QjR5NFdzUmFDRGJra3ZtbzNNeXhpcVRiZzdHdGdpR2c3MEhTMGxDdUY2?=
 =?utf-8?B?VmlJUHhPL21WNElpQmpRd1VBT0crR1pTT3BpbTB3MjhsMnpBZW5POUdhWVJ1?=
 =?utf-8?B?b29HY1hmNWtycEpocE5UblFLMFR6RWVWVGRyL0xjb0lLMmk1UEs3Q2RrT1hj?=
 =?utf-8?B?bU56TkJNcit3aEFFaGR5WlNXbDVLQVBqblhNZkRscXdScStaY0VBai9GVkRh?=
 =?utf-8?B?azdqSytncEZObWRwblNUWmNrV1pZcmdXdUNOMXY5MVlJRlNxUWxVMk8zTFpo?=
 =?utf-8?B?b0t3SFdZb3JJTGxhWXErS1pmT29zSzlJRlYxekJWaUQva2t2dCtnQSt1dC9W?=
 =?utf-8?B?Wkgva0U5UWVvVklLWVI1dXJ4Q1RJQVM0a29Sa1BQalppOHpYNXRGYjBpcEFG?=
 =?utf-8?B?K2hlME9vOWRpR3JYYkRtUnV4YS9qVEZmdWhnV1ltb1FrMXJrbXU3cGh4Vjgr?=
 =?utf-8?B?cjgzT3N4d0tqTXowVTRjdjFWUEdhaTdOVkE2dEFqT3B6UWc4UFk1RFNsMmNO?=
 =?utf-8?B?cTR1bGhuTElvNmp2b1VnZnQzOWI0S2hZYjBWSkVTM1pFZzRIc2lQTEVUMzhx?=
 =?utf-8?B?cWpQYUFwNVpNTXNZVXhiK3BYYXdRWW9UQ2FaMnlIbmJnTFJDcUdGOEltZDFU?=
 =?utf-8?B?U2dOZWc5dWpscWJid1pXdUJwOHNxdDFBSldRVTRQbjRhbCtYRmUvWENvRGh6?=
 =?utf-8?B?ZXovOHlHU3krODNraFY5ZWZYcjNoSzVtQ1Y5S1h3UW9hS0ZaajdXT1prQkI1?=
 =?utf-8?B?NHVaUUNweWxZODRzZ3ROUFYvYmVwUitBcHNkMndYR0h2ajRwNHIxc3o3RVRD?=
 =?utf-8?B?L0wweExiTXMwYldRU1pWRDlBa3V0alhqNXJRQnk2NTJOQ1IxZUgzNkk0cU9P?=
 =?utf-8?B?UWJwTmh1bzNDN2pqL2VpeWFTMU9tNkNkY0poM2djU0FSemNJQXJHTnZHcVdS?=
 =?utf-8?B?M3g4bUYvS3R5UUZwZFJESlluOG1nRFlBVk1pcEFzQ1NVZW5SZ0U0YlMwTVVt?=
 =?utf-8?B?bGtna0wvSmlUZG85K1RMMzZMN3pJUGdlaXQ2dTZhWEFFeDVoNS9oWE5kTFJT?=
 =?utf-8?B?c043Q2EwY09hd1VJRzk3YzF5YXQxZ3Y5NUErZEkyY3pMUzBxUG5YV3JmWi9F?=
 =?utf-8?B?azhMWE40c2ZkVG50THlscURENGhJRzY4aHFzOEhGTTUyQUxDd1l2b3RwNW4z?=
 =?utf-8?B?U0hqSGZpQzhTNi8wcjBlMEZVMTNRclVjTkZVVElYMGdMKzVGVlZCdG9nU0to?=
 =?utf-8?B?WmlwRGFMVldxclUvVVdGTEFhazd3NXl0UFArYlZleWNTNnpLTysvNVlNaVhz?=
 =?utf-8?B?Y29ueGtWTXhMSm9vQWJ1TzJzeXJFYTVOYmNhZ0JOTmErUVEzOEI1c1NBWksx?=
 =?utf-8?Q?PxI+9f4P6DxTFxPsucMDHgcWx30285itRoCmC4K+kkvsH?=
X-MS-Exchange-AntiSpam-MessageData-1: 0YTAxaVfJMe73w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa4e268-ae9b-4aad-3172-08de9c8cfd13
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:24:09.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0L2M5KNwmFCY/J3K8sa2wROkGi0Rfoqn6ob7g1HF0KSFVknvQP8U0cw361YESukZ2Q1jZ2+tMmUT6o3Lfrrvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8135

On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
<snip>
> @@ -166,39 +222,41 @@ pub(crate) fn boot(
>          sec2_falcon: &Falcon<Sec2>,
>      ) -> Result {
>          let dev =3D pdev.as_ref();
> -
> -        let bios =3D Vbios::new(dev, bar)?;
> +        let uses_sec2 =3D matches!(
> +            chipset.arch(),
> +            Architecture::Turing | Architecture::Ampere | Architecture::=
Ada
> +        );
> =20
>          let gsp_fw =3D KBox::pin_init(GspFirmware::new(dev, chipset, FIR=
MWARE_VERSION), GFP_KERNEL)?;
> =20
>          let fb_layout =3D FbLayout::new(chipset, bar, &gsp_fw)?;
>          dev_dbg!(dev, "{:#x?}\n", fb_layout);
> =20
> -        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_l=
ayout)?;
> -
>          let wpr_meta =3D Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::n=
ew(&gsp_fw, &fb_layout))?;
> =20
> -        self.cmdq
> -            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev=
, chipset))?;
> -        self.cmdq
> -            .send_command_no_wait(bar, commands::SetRegistry::new())?;
> +        // Architecture-specific boot path
> +        if uses_sec2 {
> +            // SEC2 path: send commands before GSP reset/boot (original =
order).
> +            self.cmdq
> +                .send_command_no_wait(bar, commands::SetSystemInfo::new(=
pdev, chipset))?;
> +            self.cmdq
> +                .send_command_no_wait(bar, commands::SetRegistry::new())=
?;
> =20
> -        gsp_falcon.reset(bar)?;
> -        let libos_handle =3D self.libos.dma_handle();
> -        let (mbox0, mbox1) =3D gsp_falcon.boot(
> -            bar,
> -            Some(libos_handle as u32),
> -            Some((libos_handle >> 32) as u32),
> -        )?;
> -        dev_dbg!(pdev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1)=
;
> -
> -        dev_dbg!(
> -            pdev,
> -            "Using SEC2 to load and run the booter_load firmware...\n"
> -        );
> -
> -        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
> +            Self::boot_via_sec2(
> +                dev,
> +                bar,
> +                chipset,
> +                gsp_falcon,
> +                sec2_falcon,
> +                &fb_layout,
> +                &self.libos,
> +                &wpr_meta,
> +            )?;
> +        } else {
> +            Self::boot_via_fsp(dev, bar, chipset, gsp_falcon, &wpr_meta,=
 &self.libos)?;
> +        }
> =20
> +        // Common post-boot initialization
>          gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
> =20
>          // Poll for RISC-V to become active before running sequencer
> @@ -209,18 +267,27 @@ pub(crate) fn boot(
>              Delta::from_secs(5),
>          )?;
> =20
> -        dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active=
(bar),);
> +        dev_dbg!(dev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(=
bar));
> =20
> -        // Create and run the GSP sequencer.
> -        let seq_params =3D GspSequencerParams {
> -            bootloader_app_version: gsp_fw.bootloader.app_version,
> -            libos_dma_handle: libos_handle,
> -            gsp_falcon,
> -            sec2_falcon,
> -            dev: pdev.as_ref().into(),
> -            bar,
> -        };
> -        GspSequencer::run(&self.cmdq, seq_params)?;
> +        // For FSP path, send commands after GSP becomes active.
> +        if !uses_sec2 {
> +            self.cmdq
> +                .send_command_no_wait(bar, commands::SetSystemInfo::new(=
pdev, chipset))?;
> +            self.cmdq
> +                .send_command_no_wait(bar, commands::SetRegistry::new())=
?;

Do you know why we need to queue these commands at a different time for
the SEC2 and FSP boot methods? I don't see any reason why we couldn't
pre-queue them as we do for SEC2 here, and doing that would simplify the
flow considerably.
