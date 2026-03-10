Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010047.outbound.protection.outlook.com [52.101.46.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B9D346AE5;
	Tue, 10 Mar 2026 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138235; cv=fail; b=OTb4Y1c6SjJ2DnL89QjRz4tPLcG5wRS+IUM3BUbFYMWBzEct6ZM1zinyGJcluxnw4gC1Go5j+LvuJ9HBcI+Y+9WrcCYr7fGyCjWrRT25XH6KBuSXTe/bYZh8B2ucHArbNsY/9ur4mOD6pHCbeA1pSNijjLlAQ9nAhIPNpu/n424=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138235; c=relaxed/simple;
	bh=R7XcHlKkAPM1hEgb9VGNHsGbAfPM2NzJSLHbCRGC6po=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qaXQ+c+UucuqKakfEO9BSLHA0zxN5R5+Q+SNV4oTktp0LObuYU/nkLL/81LCiz/hGCOnpS2nsC08TpPv6zYUBBDSOd9c0r5rqp30LPJEAxwkI+vgRxEwsNbl5UXW/ptXusN2nqPKv7JeVtBBRO/B+DO88MHdOh7i4eSs3RQLT+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hPgCmaBm; arc=fail smtp.client-ip=52.101.46.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hPgCmaBm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MY/3T/JrqEim8LSDpNqyWwx6blSNhwJIq/+ZHFH63hskApDDuh6QdAd/aj4o+c43QwJZ+a6RCqIQyZaKSs2dggHidAl6tCEbfVSMIEoN8iOgchy/COA+UoH/LxC/oDbFGpaT0KtJDhsuYo62H51vuvCfiIsL+UfC2NQIpkRmwa3A0ef+g9Fxp/fVe5DLJDygptEjcovldHVwd33KfdqhnLIkeuQyw/vbTB8qwridB6dPR+v7f/lni01gXTx+RzmxU6ETCndDJiU0P0xVS53s40gkX8Sl+PTXR3sjwCcsZcDIuA/Fj17DDaK18E+hAZcUjUnU50Y9bY/joiAREmxkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVjWfgitqib7pp0fuA7jDr/zmO3iv02E9+HsnehZtBM=;
 b=LHCd+NEz8JJ8blQP1nikqyYRemweVo98xX1mQfbDBk/NaHrNw8p6ML9+yDQiywa+Sjeeg6oxKvY9Xisp7x/RXqvIytdtKm9zL+CgjR5hL+x5ZqQkMCEPvpYfqdLq3QqPQqhrt75do/2AQb/W48QHSgRzNoE5K4JLAKpHEB+5kSvo8fzYkiNbTSJ/5tY10ztqJjIHzu0CC82+bA6i2jslitouaE97iVKLiz8KyPCx/Hj8HFpg0i/fdGpeTKrpykP25NAJiHIiplkFfuZVaKH9gqMWK5YOX9o07S7VIE9ewenK0zM0UJWomaSPFnKnvuo5BEIw0G0a9SD/EvhqWjvXyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVjWfgitqib7pp0fuA7jDr/zmO3iv02E9+HsnehZtBM=;
 b=hPgCmaBmXRiSMqWbcAjeDFx9ks20+oPcbHyIIVa9lm+sYyddfyrTbuAQDcFoo0STgtbpRljusbMtI5IC9gCBeJbtlRY+ACXL/LBg51TE4xWgyuuFwGlWvxGcd8jEIu3vADQVMzP/wfB4vHVG92w9etrzoJjzcznp07Vf2x5/RTTfe9F2Vyui/+3jSdyQOQAMtjEeGeTNeXtgrsV9BJWsDwrc/H78L6BKMYapwi5qUR96jYQYGVbhf9IKTojUlofCZFjIT8+D6+rJCnVcNI8pNNMhqZK7gMOsnyUHpHeWi9HREmqhNelb4kYec9vJ9NCFoRlrYu50dWDxjUfyUFelpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7958.namprd12.prod.outlook.com (2603:10b6:510:285::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 10:23:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 10:23:50 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 19:23:46 +0900
Message-Id: <DGZ11JZQA2C1.3677FR4NRVB30@nvidia.com>
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
Subject: Re: [PATCH v6 09/34] gpu: nova-core: Hopper/Blackwell: skip GFW
 boot waiting
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-10-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-10-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 2290f787-1491-47b6-b3ec-08de7e8f1ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	fD5XJW88kxymj2x5rIgYTh6oO2V2jMGl3UD8SI8YYiOq4mVTeTlUEbLsLC+z9ALfnleN4Y0Noy1O0dZsVuQ+SoP7Zk70GewYUiZQzvszPXahtYpzCIA1USpETbTITrPqDialcCYL3BjrVObyrOPMrJBmYbwzlVaF2FDIuQNIs/gUplRg0eOGKtuflu6wtwUBtrgFcOQOa0k5Dsw66VHpuqAo/Fl0FUqbzymz13XBwWc358Wd/5FqqqYKuH9ILDjt8iMIxsk5E8zguq5lIj6aRuSjXRoilE5MbAuuuJPPTktmijIHFkoQzMGDxJurHcAIpDu7ElUZVQgALquTbR2E4vE/3zyCb00AuaR1o/yvjeGqktvHDXIwu9HvzRju3YsP/PSuvDZp4r2AdR7l7vb8I52iC0ZiECTpEwLt50LMWsilvZSnuJ9gTCINF3Vpm/zS5FO/6brI/CzEEKoU/QAlYL1uIlkqHDhSmZPV8WMhBlPZ7cr0T+K8jVb8v3bimp2JF7g7N/YbRTIT0jJWdQ8npJJJis45RNblu7+2ceMJ0wl3gn+YcxnxeWOZm+IMGIkv90dUdiAvJiF7H0rORh4vll1JyGGmtoOSDjwBqoZ4N4fKrVUYLHcBhtklMv0p52alPUIvWLl8F1zjEaJ7oGhWRYpWtRhPCo9bE2T+W+zjHYNJ6V5pwfhxMenx2yZfmAbP7GXqOkYLdkJ84vTSO1nB3hzbH5uLYGF4UHRTUOzaYik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXhNc1RlRDBrS0JwSmpNeUpEMVhhTGJEdUVDc3V3MlNVVS9ib29PUWxZUkQ1?=
 =?utf-8?B?NENKeUZZTWZvSmIzUEV1ZHptSCs3SmJMQVE0eWVMRkVnQW55Mm9pWkNZZXU4?=
 =?utf-8?B?RzhVSlBpNDROQkk0S2JncGc4bk9hS2t2MmNvZVJnTDh5ZFZkelJOc2ltT1pJ?=
 =?utf-8?B?ZVpxNkVZa2tYajcxRVlTSzBOb2ZVVTRZcTNuanFCcVBrZy9IU2ZISlE3dG1s?=
 =?utf-8?B?NHZxRmhTY0NpNm9KT012L0RZMUZxMHZhbDBpOFNjRzZwYm5qZFZmRDJIbXJm?=
 =?utf-8?B?M29QMWVZYUgvUUtWem1nVXFpblFZU3c1dytPTlpCM0twWWhlYkdqSGo0dzVO?=
 =?utf-8?B?T09SWUIyUFlVUnZLTkpCUlc5a2E1NzNpOWI5L3dxdzBsaFpUdmJOaUJqZXl0?=
 =?utf-8?B?a0hFUWJDUktQdTFkdmpQYUlKU1k3RnVoTWJyZE9mc0lzLzAzUVVFWkNrZnpP?=
 =?utf-8?B?ODNucTJ3aExMMEZMMmFkR0ErTm0wVHlOZ096VXdMNFZvR3pUS1pkdFdzRDZU?=
 =?utf-8?B?K0VmbnFyUTVhUThxbGpMTFN2Mk5mWVFmVmIyYUYycVRvaFhFNURsUmZ1UjdQ?=
 =?utf-8?B?SW9GcVNJMTM5d2NJTi9uUEhKYnZzK0lNMDBuOExIWlBuM3lYTjFWTmc2bURo?=
 =?utf-8?B?TWdsdkkzRFJaN0R0VVhOVnkwY0UyTXBGcTVtaEtGdXBmajRCOVFGOW90NzVW?=
 =?utf-8?B?TDdqUTNDUmd6cU9xUUltT0hjb1o4Y2YzOHFtdnNXZnRGd2ZEekFYekFZTkNl?=
 =?utf-8?B?anBJVDlWZ2NqR3g5akZNYllSek9KalZlZDQ1NWs5RGZFR2x1Q3BabzExUWln?=
 =?utf-8?B?UEJQeTQwZXpZRCtrdDJzMkt0VE8xSVJNdzduMGtkczFyUHhwQllUK01pSkdz?=
 =?utf-8?B?RkVtZFZWNDVwQU92RGVFSlpFZk9odDh4Zzc1ZlcvU1RxZ3JrL2pTdmFkTHV4?=
 =?utf-8?B?TGNUa205TU5zZXN5TlNmTEVTWGRTVmRCNDBpVnc3Y01RUlNwSkdHeFBjYVUv?=
 =?utf-8?B?KzhVOGREcytONzlrZk5NZC9NemdKT2c4cUt5RW1wRmtybmloNHV2YUFWUTFE?=
 =?utf-8?B?OTJCRnhYL2JhWmFaN0xrUVVmQk9abWZsL3hCcnh5Z3hSNjJSR3hFN2h0UmFX?=
 =?utf-8?B?bk1KSW82NkJvRTlzeTZVaUdqczBjcFJrWjhHcjMwVHhRVWRmcWNUcVM3ajRv?=
 =?utf-8?B?c3pIdzhUbEpFdzRJZnhIMnFxMjVyby9MT2tEdHpyRWE2dHpSS2J3ZnRrdXkw?=
 =?utf-8?B?d1B1Y3BVQ0FmVi9lY3pBZzR3bFZFZG1GUmJIUWhTSWEyWVRGN012MmR1RElS?=
 =?utf-8?B?UkxRK0h0OFpTR1VFay83NC9vaDBOZW9MTG5laGM5SlN6eXQrWkIrWFRFZzl2?=
 =?utf-8?B?bW9jY3o5d2VUb0dCZW9SUXRMeUZXSHRpYXlVTkJKSWFGZEZTY2d3MjF3UW90?=
 =?utf-8?B?WTZQc1l6SzVaMTdKUERjVTlzV0N2RUtDL1p3bG1kVVlVc3pESTIwL1hSRDI5?=
 =?utf-8?B?d0RrSVZpeGE1dVFGU3NlaVd3WmNPRU0zazJxZExma0VPOHRVMFlXWldYWXZw?=
 =?utf-8?B?eXhxN3JIUDhTL1gwZVVzYzYvcmc4WUpnalhNdjNhRmZLRHdZQ3FHcEhZZCt4?=
 =?utf-8?B?OTBHU0Mxbkc4NDM0a2VDUnR1MVZGdzAwZGU1QzZNZDBhajl0TlloblQ2c200?=
 =?utf-8?B?SzFtaFRYa3NFVGtLWDU1SGVlVWxvOU1wMVd1anRvamNYWnZvODF6eGpVTTZk?=
 =?utf-8?B?VjhxRlpWc3ZESWdsR2hmY3NNOUYwU2czQXZZeWFTcUhVcENMMVErLy9hZ2RP?=
 =?utf-8?B?aU1QbVdmUENiTWk5SzdBS3VGbXAvWXlJSXJ3bllGR1BUT1BNeTYwV1dIRkRI?=
 =?utf-8?B?UzFiSGdMRS9NaGh1K1NVd3d4RDBtZ0U5dGxxK2MxS2pRZnE5djJ1Y2J1bWhq?=
 =?utf-8?B?eWZ6Tkh5eUFkM3RFRWZvcmoyKy9BS2MxQi9jYWpJQTNSVUdLeTNKVSs0Nllk?=
 =?utf-8?B?QjVLa3BPelducFA0VE14YTI4eitMNGpZdUprNVE2VlVPd3dQdnJmaFcyUGRM?=
 =?utf-8?B?cnltZ3NtbWU5NnNkMS80V2c1ZUpxalZpNGg2YUdSbURPYURpWmMxR0UrejBY?=
 =?utf-8?B?YURyY1I2WjFveThWV2lHdEJkZ0V2eEE2Q2NHcjRxVFp1WUJ2OUFmS3hhNWpW?=
 =?utf-8?B?Um4yb2RJYkp2d0QvTWgxakFkdHBjeG5lVExSR3dUbUdiSkhYRWNnNXlpK3U2?=
 =?utf-8?B?OFk1LzBuTmMvVklDKzVlaEhyZlE2N2I0bnJ2YzZkSUlvREZXL0RIeUViR24z?=
 =?utf-8?B?WEJYK240dUx4OFRQNUJqdG1Zd1h5TkVLejZJaldEbG83TmdmdHRqLzNNS3Qw?=
 =?utf-8?Q?s4NYBPENmb4xlHYE4jfi5Lr28ZV1Mufg7dIBnR7I/jm9o?=
X-MS-Exchange-AntiSpam-MessageData-1: lzS0V27ryQkytg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2290f787-1491-47b6-b3ec-08de7e8f1ede
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 10:23:50.0082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJ1eHFck9PVxWP5H8lCfwEEr9Owg35O+ha+i/0fsM+lfhXxV47K/xDYxYQDATLJEw4ED1tyMOvawLfkToUo6XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7958

On Tue Mar 10, 2026 at 11:10 AM JST, John Hubbard wrote:
> Hopper and Blackwell GPUs use FSP-based secure boot and do not require
> waiting for GFW_BOOT completion. Skip this step for these architectures,
> and in fact for all future architectures, because we have moved on:
> there will not be any future GPUs using the older GFW_BOOT system.
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index efd1765b4f86..21a8c6c2d96b 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -177,6 +177,15 @@ pub(crate) const fn dma_mask(&self) -> DmaMask {
>              Self::Hopper | Self::Blackwell =3D> DmaMask::new::<52>(),
>          }
>      }
> +
> +    /// Returns whether the GPU uses GFW_BOOT for firmware loading.
> +    ///
> +    /// Pre-Hopper architectures (Turing, Ampere, Ada) require waiting f=
or GFW_BOOT completion
> +    /// before any significant GPU setup. Hopper and later use the FSP C=
hain of Trust boot path
> +    /// instead.
> +    pub(crate) const fn needs_gfw_boot(&self) -> bool {
> +        matches!(self, Self::Turing | Self::Ampere | Self::Ada)
> +    }
>  }
> =20
>  impl TryFrom<u8> for Architecture {
> @@ -322,11 +331,11 @@ pub(crate) fn new<'a>(
>              let chipset =3D spec.chipset();
> =20
>              Ok(try_pin_init!(Self {
> -                // We must wait for GFW_BOOT completion before doing any=
 significant setup
> -                // on the GPU.
>                  _: {
> -                    gfw::wait_gfw_boot_completion(bar)
> -                        .inspect_err(|_| dev_err!(pdev, "GFW boot did no=
t complete\n"))?;
> +                    if chipset.arch().needs_gfw_boot() {
> +                        gfw::wait_gfw_boot_completion(bar)
> +                            .inspect_err(|_| dev_err!(pdev, "GFW boot di=
d not complete\n"))?;
> +                    }

This looks like this should be a HAL method, wdyt?
