Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B7232937A;
	Mon, 30 Mar 2026 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882381; cv=fail; b=KhK3iG6pDGzDp2HUJWjYrb3LMKzG+EIy6K2gYbFZ1bJuJodWDcGdKVQT3RVX/Cnz1VEdY8x7OllfFSld65kOxlfmVtPVfTJfhlOFksg5hu5Uqyfnsk5IWakA9X0yKK/UgqKHOsCczzUIXCc51a97ZxPcJtuUY6/bOjJicbZW8qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882381; c=relaxed/simple;
	bh=IwkBpuIMIJusbIdDLga+3z8xVQutK+wZd9V2OX64I2w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=krK/8frTi9N8Aecs2Qj/Vq9whYb6gblhVpBavuCs8Y8vnFQPN5kBz2hQRHwxAayDaWajFfmDnLtDYkZRH397X9XqRbDEIY92hYbumyGmqqGVupmHvyzhJlTexhz2uLc58QwG5h1d/VcCkF3HhxK7CTyB9XEmgE4oYjCGdz9HBcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HTV3Bq1H; arc=fail smtp.client-ip=52.101.46.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HTV3Bq1H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVnVLxejEBZBchEy3xyud5AvavRPouiTdMP6eKZeYKUbMmmpl06jip4+AztT/8njwkfFVVFGGzbmMnz6NeDUayHClY+RLuAi/K6UHR5K6iK9chEjOtqXGgLEMu/hVuulvuLbMu+aasx6hAXnIsrlgiPOcrN880Uell3bWUETGXxo6yRJP+YcKZrIsLsORiWI/jKmZB+s0xcBa27Ff6wX3VKjCfM15EbDrqo/gvVjSKr4EGUQHO4fjQnhDLWKrF37kGoMh60H4B8cgqpGgs1Uf8BXhHmwsvdcPyNHmJIrFQbb2NaFp9q8FsqSbEdIbfdiIgM6hUDVBikYbGQr9t5prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuZ6A7BIYdu5gOYnSPK1NZMZqcwfwwfZdPGgKLKabsQ=;
 b=wd1q+kLn486Xe1A/GqJRCRM409iYUofig7EOskSsUi533EuFojIe2lR7MyXBUoZj78y6JWYurq74G3nqjRndzyPPtHnk+m/qW1Ji7dY2Nhixqo8y4NkYmrLO2VCDz297g/PVmXqdls30gaXt3ABZlvPz6C4SnfLirtF/e/ovAbIzLJTdpQZ8YXFKQFLcgTZcjeUDEfEIf9LVv74ULAPetmbV1B3hpcyzXDmY88jhK7yWnEBSebBHNak815ygcx2E5g2cNY/6Xn6xJwltG5bjB9Dv3c1dwe4zK2xkevni2WxaLJmi32pYh9InhzFzzhAiV5LPpG4UZzk2Z0ZtyoqLFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuZ6A7BIYdu5gOYnSPK1NZMZqcwfwwfZdPGgKLKabsQ=;
 b=HTV3Bq1HjV0dnngByQIqy1ZB6ndw26mnvRi6JaJaKCwjMPGC6y7KW4o/CAx8adIZQDfaoDoz0f/Ao1w0MoHYnbCYvHBkOfLMSasH6jkCFHeSr1DPyD2OI6Hkyfi/76/97pWfsv73uEejqlVE7TyDx0Q5nCPzKwm4+w25+G/eoEVE9ziij0FjnzgdX+a92yHti1o6k36skZPVrhauZMKfB9ZuZP0o5+/k1X/2Hs6CBM8DlngqGaBUU0E9CONglvCuoUKR2yBRiGCCHBMJaEnx6WIz2Sx554dtbrwjk4K3WOCFX4SuKH04hb9hEfwRPJi6RFJa7Up5BVCgFWV5wTIVuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 14:52:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 14:52:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 23:52:45 +0900
Message-Id: <DHG7AEASTW6E.2QTXB1D0GA0UF@nvidia.com>
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
Subject: Re: [PATCH v9 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW
 boot waiting
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-7-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-7-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0065.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 711e5a14-8bbf-4e8f-0175-08de8e6c02b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	mpnU5uvHqzs5jiIxujfWGKwYGXEsjgWVs2LJ6gc0dgZRCz+uUpTubEeXO9QFr0plj4puZyFh4Yt37zDnzB3ZDQ4mPzcbbmp99JHr0In7NX/3WTnPFreJ1+a1nu1+3mEUgL3/EKBAaslPdn4F42ahsQN3JjZ78JarTYoQVJP8JX4m2v90skqLr9sY35+1GdGWCuAfLhj3pnOUKKS+is+sf0vOmZaX+EMIDRddp3tjdBV/5HDwgGU7qgERs4RDi3HBG+3X2OJz+8kye+o/d4COO3bGl2Nc6omb3M6/Q60BZ7Kuhv5bx1ZzC/NpxbLukAhYYNvjqQsGZrJ3tvWpgBHxzx1Cj3T/dRYlQl/e9AEku7aduGpW2dCaelHNGaqNw2UBTZoGsZTDuxdyDdYbVjSUauSksM5UjmbVgIARn8iV8vFsEbKJzGNPINn7qJMRtG3mpYddQRSQBcsorqLGnP0RQoV7sTYYRyhLOE+Jkdwz42DT7UKK3tWVrhE9zfbLi3bNlKyNB2sVoNzVDyHmPnHRgBeWbckExOp9EvL6ZIhKtDWga6SZrbgPzTWn9Pbu6RO3/A3EsX4BiJSLzhfvmubte77mKvmjsiY6kgqfaWa6rYemRrO6/Fr+omfVc9mvuQNoDTBd1egvRNniWbgS5D9oM+9jtMzFR/OLOtNLzRLeHloIRXI4hUjQCfd65Yt+Ki9B9kocl1ptgKH55Dtf90AzG7H5uElZbxEGonq8zqiRpUY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkJWbXRpa3lkdmpKNXdEL3cxS2VtWHZxTHN0dlAwVmNmZFZ3Zit3Uml5K0k1?=
 =?utf-8?B?UkxZTmVXNDRydENXczlidWFXNnpZUlNlSFJPZWNkR1dYcW9yV2Q4WmRnN1cv?=
 =?utf-8?B?YVVteTE3ZENRd3NFUkdmdUM1M3FSSWpqSjlzU284djJodmN2djJORG1VMlBO?=
 =?utf-8?B?a1NTYnNGWXk5RmU0cWxsRHVoaTZ2NVFhYk5KZUsvMEhPTjZ4QWZkRzZtMkZt?=
 =?utf-8?B?V3ZkenpmVWFvNHZFRUdvRU5Iek1BK2wyQjlwZEFWc0I2L0hyenlBVjdheGZD?=
 =?utf-8?B?TVNYUWVLOGZETWFpbGNIVmNHdHZJSlhuYkdIVWoxc2xxUGpCSG9UeG44cy9Z?=
 =?utf-8?B?UkRYOGE2RHdvL0VkaDdSM1FOeUpjYzNkQlpuSU5JaHMvdk1kNndSekNCMmR6?=
 =?utf-8?B?K2J3NEU0MU1ER01QUVlrQUZzTEtSL3BFUW0ycHp2SXNvNUxNUGNKa2xFVWRI?=
 =?utf-8?B?WS9HTHZVb2duL1pQQXpXZS9DL1hYSHdYZTVRMTF1VjI1T1I3YW9LVjJvV2s4?=
 =?utf-8?B?OG9xMVBCMFV0TVhjakhsZXl3Z2VnTUlyRGQ5K3JtQjN1OXJsaUg2cDNYbHlz?=
 =?utf-8?B?UWp1K1BaSnk5RGxwZVRrMXpKMElKTGVsaThpcXBpdjg2YktCMjJOaVE1cFo5?=
 =?utf-8?B?akQ5dHg0SGlPTUNZSFdLU2U5RFBVVkp6bWRBZ3NMVDlKbE1td0xVODB0RDYx?=
 =?utf-8?B?c01PSGxWcVc1T1BFWkhsTGd3SHdmY1RVcmg2eVBKSlF0RDhsMWo4TS8vZm4w?=
 =?utf-8?B?bHBaYjVtNVBKNXhBS0UzVFBSRDViUVNWa0xGWkNxeks4TUJDSHN1b09LYkNI?=
 =?utf-8?B?Q29vcDJ6MVJIOXE1ZzkrY2E0S0lrY211WkxZZmxhYU5yRUw5K2JJTlloU2lR?=
 =?utf-8?B?aUZObnRtS0pWSjV5N2ZSRGhtVEpBcE1TQklPSDVkZmRMWGl5RkRkdDIrd1dx?=
 =?utf-8?B?aFdRSVJiNkZRYUFZNENyMEV5Vjhyakk1MFhJcGFGMXVRS2J4TXkvTEFCcFZt?=
 =?utf-8?B?NG1uVFF4bkFrRG5nR2I3NFF0S2NDOUcySTZYRTFwbXdtR3ZHYW5LbVQ1Q0Zx?=
 =?utf-8?B?Z1pEMlBBeGljUWphN0tXWXNZR0VKaWZsTWczYlhqNzgxOGQyaCs5akdoSkZo?=
 =?utf-8?B?cTVXczU0YnJZQUgvMVRIUndrUmM5Q2pPeUVwTisyMHZQVjlzSmNGUW5SSHJX?=
 =?utf-8?B?c2wzejJ6WDN4YXJRM1ZsNVZzTG8xWlNPVVlxald6c1E3OHhraWd1OEY4QlMr?=
 =?utf-8?B?cDZGdjB4dUsrNFp5UlgzWEdzL2h3Z0VsNTRGRUI1V1o3NVh6SEw5TTFzRlVn?=
 =?utf-8?B?VVp2L3hmVEtmMGZUemc5NlRQMVNCdFhZckxpV0lQSGp1d0Zyc1F2Y05kaFJF?=
 =?utf-8?B?WXhYeklDcHY4OVpraDNMNVBIMHFVeVpOQnNlbnpqUGpUelNIRUpzZkw1NnRj?=
 =?utf-8?B?d0xjL0xDakhBVGtFdk8xYjJZM3laSzVxWHFkUTJCTHVuUitsSURJZ3BJbHRX?=
 =?utf-8?B?SExHaXFTQXpUczBJYmJBK3NBanZrZUpXekUxMmJrc1NIQldONm5TT1I1WmVm?=
 =?utf-8?B?NlZuYmVBR1EyZGp1QnZiRXFsM3hzYS8xeGp1VU52TFVneDBwMjRaTlRqVWJh?=
 =?utf-8?B?TUZ2TkFJYVRhdU5XVC9mdWRoYjdSRlNVUHoyWFhYZ3ZLZDJiQ3NTOE5iUkhT?=
 =?utf-8?B?L1l1aWwyTUEyVlNjU2w5eGZ2TGpMWkVTYTZ2cnp2MkVjTm5UaytWSmZRK21r?=
 =?utf-8?B?MVQyYU9xT2pla1JHNG1NZEVpeVI2OElmRHZ4NUh4c2ZLTGhWRG5Qc1A4RFJk?=
 =?utf-8?B?VWZ1bUlmU2tVaUh2c0J4Sjk1RHVidUFLcHVEdFp4akhlcS9ydkJWQUY2Y083?=
 =?utf-8?B?dzA2UmRnakFUdFdCR3FNQVR0c1ozZW90VCtXUHh0WDQ5OGF1c0R4WjBuYlFJ?=
 =?utf-8?B?V2Q1ZC9kcnZhL3h5R2tBUHRrbUM4N3FvdmdEckNZSnUrVmRIVFltQ2RZWGc4?=
 =?utf-8?B?QlBQbDgrMWFYVFBmUmVidzVVbk1NVlhiVnIwWGJSZk1NMzhSV2hUZ1hDMU1U?=
 =?utf-8?B?OVFGY3VTam5ienBEekN6WmFzcWdyTnZpc0loYldNa3JMcm81VmNGaGRxRFoy?=
 =?utf-8?B?QjZqd2E5WC9sYk1YTmEzd21xZVdJRHRuMWNnYmtYU0dnajYxdktyUUhLWjdX?=
 =?utf-8?B?Mm83cU1nSi9PWFE0Y1J0WUpxZHhIMzBucGp4dW1BSzVRdVVIVWZvcFc2cUNM?=
 =?utf-8?B?c2FNRjBpSmJRRDhWQ2VOTjcxSW1iVlp1ZmZsdEdpZVlXZXRMbFk5bDh2Ully?=
 =?utf-8?B?MHd4c0JxVThaeXdQUFFJcnNtNXpQcmFLUEZDL0djNmVYdHM2Tk5Yc1lTZkFn?=
 =?utf-8?Q?RX6RzIiaGsnQGPEY8kSwyFsBc/2TkGXNVN0UREuCuzvBJ?=
X-MS-Exchange-AntiSpam-MessageData-1: 2NCiEIcgl77lGA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711e5a14-8bbf-4e8f-0175-08de8e6c02b9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:52:48.8320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0EACIRQqtdgv98sdOkT2JofcdV/teu/akogp5kncJvUXXhzOYZvQo9knhm/mmRhlYdOCIg74CVRGYI/x6bkHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245

On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
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
>  drivers/gpu/nova-core/gpu/hal.rs | 41 ++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/gpu/hal.rs
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index f70bfbda1614..8332ad67c0af 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -21,11 +21,12 @@
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
> @@ -311,6 +312,7 @@ pub(crate) fn new<'a>(
>          spec: Spec,
>      ) -> impl PinInit<Self, Error> + 'a {
>          let dma_mask =3D spec.chipset().arch().dma_mask();
> +        let hal =3D hal::gpu_hal(spec.chipset());
> =20
>          try_pin_init!(Self {
>              // We must wait for GFW_BOOT completion before doing any sig=
nificant setup on the GPU.
> @@ -319,7 +321,7 @@ pub(crate) fn new<'a>(
>                  // still constructing it, so no concurrent DMA allocatio=
ns can exist.
>                  unsafe { pdev.dma_set_mask_and_coherent(dma_mask)? };
> =20
> -                gfw::wait_gfw_boot_completion(bar)
> +                hal.wait_gfw_boot_completion(bar)
>                      .inspect_err(|_| dev_err!(pdev, "GFW boot did not co=
mplete\n"))?;
>              },
> =20
> diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu=
/hal.rs
> new file mode 100644
> index 000000000000..164410992659
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gpu/hal.rs
> @@ -0,0 +1,41 @@
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

Please take a look at how other HALs are implemented: each HAL instance
is in its own module. That's not just a cosmetic choice; it allows us to
keep the chipset's specific HAL struct and its helpers completely
private and forces us to make code-sharing explicit. Furthermore, this
particular HAL is bound to grow, so let's split it properly from the
start.

If you do that it also makes more sense to use constants (contrary to
Gary's feedback on v8), if only to align with the rest of the driver.

Once this is done, making `gpu::hal::tu102` absorb the `gfw` module is
trivial, so let's do that while we are at it - having `gfw` as being
driver-wide makes little sense since it has a very limited role for a
specific subset of the chips we support.
