Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA771E2614;
	Mon, 23 Mar 2026 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271648; cv=fail; b=Lj47OXBp9GQ6Jw0/sIf7FafQfF1s96NTuBZwkDAGEc3jEOHFRjZjeQLlabO4nWgd3DRcK3Lc+FYDV9/LANx94y0BLIFC33/vlE5M5rYf7HCNQYLw42qwLHRI1DQnklGYApBrexsGpzvOOm0F+hcFwmUz0sNUKQLyYmMR0Rm7EOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271648; c=relaxed/simple;
	bh=DmyOEPEysZm8YzxHG9BX0nj/HPdGUZtC34S3BUBfm8s=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VJg9ZRLzn4p7OqdyrPsW7cE7ZvfCa8mVdcibbAF9kT8JICKibUPCoqiBYH1EDcjV5rYAqBwsO0ZSBXUHU1ZkSZJEISZ63Kl/KChpxAqtFYCxJnd9fCawQNWV81SKegD61AentlcF5XBz21Dg1BR6XoPygLkUDJbwWAgvQOJFBEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pvAfez5T; arc=fail smtp.client-ip=52.101.57.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pvAfez5T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nc7jkOTFGJ2kCHSBKzo8q8r3h9YGF40TaPlaJ81l2nYM12D1n/UFFqVoPoQztHRGv64vqMRhoeXP4QbLNwhBALIvTXLjX/x8DzRmUjx7hd0he/VzeivYsfA9R5IcDmFexjtybtHKXHN0W8TAUw0hqpi3V6WZP9kPUKRhMtQ5CJ+P6VmGgvk1BYcgMzyyc+H/Tk+Ig9CRs697l1NZ8KaYJ3xciX30HgOeZhAjkgt7LHPG6dugP+xKi5FCQn9HltTbn55FEY4FJa+aV4LGWJ1JSEzvmTL1Bzgk7lRgUmEBkSUdjiokPRX1brVfcalPTezeMr3nvcT1DQKN1EjCdV8hYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjeIp95z8cW6EdyVBxhugsrPtZrSt1jMMOJYGFUAycc=;
 b=LJSyGox2CeZaqglTBPGhwhWbhT0awU/X5xLG8bNgxpFLLF3wpWkrkfb0QuYJEJy0lk3AdZVQ4pNDqoZNWU7YJdsbknzvqfsV4GimvMZwAPT/KRi5qg9fLhDk8TT0kc4LMmVlwtRr82rri2HCneSlgVPGwK5OBjujnNiC5o3Is8q9HT1gQoKp7exUhirNxtLJ3TDe65dBgBhhG+nGrzJ6Fzh2drCbS1pKJuJMIaCblXpxs77HCHOcD9SvkmD65rLOifD4E5IhE928vzYAEmpIKbjP1lDEmUiwBHmBm4HYc3Vmdz4Z1njiP3bbH+tmua5uXMy/H99Y1BM/aW9i7IWWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjeIp95z8cW6EdyVBxhugsrPtZrSt1jMMOJYGFUAycc=;
 b=pvAfez5TqsIHVvbybJM7fGOWa/wGrnwJicB5FcGaQBDy6aC6Iy/F++5EsJBKA9g5cQjLE1igtVtVVYiluPMyoGtpD+6r1hmTXNjLj57ycoISdok77Mcubh9CzRnu2LLH1b4SIP6GRN4rKM88rWONw9HAYVhqoDY2no2w2VWPY68EbqLx5NVc4HbZ5DTZIR8dS17fUBh3tPgeb9nUgIwU+2bQHByaG01JcKWS/G0aGQPveluTiouQMFfiyDVB3RiJw4uWJ6Qk8DisIO+pO+oUE4IltViCAUgRkn27T+03kboYxMa5qa0/Wc6KomOgr33ceFmQVaCrITb81+v24gvDZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 13:13:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 13:13:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 22:13:54 +0900
Message-Id: <DHA6SWNZI9PT.5YBQUG4BB31@nvidia.com>
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
Subject: Re: [PATCH v7 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW
 boot waiting
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-7-jhubbard@nvidia.com>
In-Reply-To: <20260317225355.549853-7-jhubbard@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0064.jpnprd01.prod.outlook.com
 (2603:1096:604:253::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4374:EE_
X-MS-Office365-Filtering-Correlation-Id: 05381962-9ba4-4f7b-eda4-08de88de0b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4nIFAvPalgKI4ZPobWHdF6m59AgTUagMaJ6Cdt9V+cyxIhu+/oeHactUMp3MXzFm4NmYrVidqBJjs3ZI3T7PosgU9xH2Y24F0iLja+ZwqapLSkMP7TYagKQw26vbSSgAG2vGxgpmbG8GKq8OpyerK8YzdRVeafntPFx2Y8fo6WFg5nYcnQD7WQl0OW4uJm9pkPByeGUO2B32zaavyq0UHtIHPVuh8Yw1jTX395lprH+GzDzqhsB6Eq9Z5kyIlDC0Mn4/cDV/3Ho4kC1qKeg6pUKA65lPU1srDI3FXcH4ZdxkxLhNS9+CNlvtXs0eXzJ9BfFNk79T1nA5pa0J6Cop6A++X9Yt9MIkG29WSWyrsF7PPMarTQ5dbg58BKiEZ2lVp8XGjoWjLqkxW7A6eCsLgnOtVOhVLUZQUOk/Whflqq5CDUIR5MZqkWczvh2l3gRTerLSeS14h7TIgNMEgV6gTd4Li8IMhrNUOUv70mjI5n8Orpfg9c5Jw7772VurUcx1D4sqUYbcRGFHCdo7HmhkC0J/bqtq5vs1sL22IGorTPqwLXTNhSAEj9nCkc+Z9sh9IUicuJWHU5bN1UcRWUcXfBufRwWtNhJFXcKu+4Dc/JKNmLA9NS7auqFpIs0CiV1numVDYrVN7D4AVTZD7CjZeQGxSvE+M6rjCyAiqUFeI3CNMvlt44O9Nk+b2Fun+ovz0onTdQY5cQd+5taUdk54alUYCYwiOpWEnpe+OliQNGU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnhnSXQ5Z0syWnVtMVZaWGJWbnpWakc3TEs2QUMzR2ZBWTkrMU9mbGVZVHJo?=
 =?utf-8?B?UkhudTBZUlpQODRFRzZSeHh2L0F5b01jVTBiNk1sQlorQVVreW8xczRJNWty?=
 =?utf-8?B?V0Uyd0Z4bDYzSkF0T2JhaWJqWEt6YlNUTHoxSGx5Zjk4cVVEdnJ0Z2tCZEhL?=
 =?utf-8?B?M3RZYjZHZXFjdjlkS0l2SEJQaWdseDlZY09KTGZOZVNzWmdxazhvSFhCOE1j?=
 =?utf-8?B?VThTU243RFRSeUZVMTNlQ004c2RkajdWa0RQUEFUQTdHOG9wWXpFZ3VhbWdU?=
 =?utf-8?B?SE5GR0hNMWJrWVN3UGVlbFJ2YVRFaU9vTjhsUHJ4cXROd0loUEIvZnYrV0Fz?=
 =?utf-8?B?YWkvbkNLV2N0bmhNVlNlUWd4ckNEYzF2enNKTi9rWUkraEdoVU9KZ1hHZGhn?=
 =?utf-8?B?Wlk5R2gxOWNwWU96NGo3R3MwSVdIR05nSHpHaFY4SUpuMHdkUHVTVkdScDRv?=
 =?utf-8?B?MUcrb3hRUDBYblZ5L204R2N4OGxRZUMxMS90a1pKSjNZSWhFQ1d0dUI1VXdM?=
 =?utf-8?B?QTJvYWl6WVN1OSsvZkZNNzFvdzBSQnVnT3ZONU9zUVNwM3NmWGROUDZFcHZF?=
 =?utf-8?B?MFRVWXZmZVEzdDhJTDFOQnRSVDVWTnRaZEZWbCtPNllXSkgzcjNibWp3RUpu?=
 =?utf-8?B?YVhMMFRQK1paazJmMXpzeUxTMWExcHptV0NmRGFEYmtTWHhIVFVSUUdRUUEy?=
 =?utf-8?B?RWtwaWtVVHE1YzVFM1JwYk9TNHp3ekdKTUxJSjV0aGFra1djZThFVHFlUlhV?=
 =?utf-8?B?RktBK2xCSk1oUzZOeFYvK24wRmc2QmdrNEM5S1R6bnNzdHZ0aktGYldmQnRs?=
 =?utf-8?B?V0oxaFlqZnZPNFJhaFJ6UkJBV2dFdGhIcEdMdDRmVnNOVS9NUW5VcEh6MUhX?=
 =?utf-8?B?ZC81R2lyYi9Ib2RxaGR5Y3VxR0RTcjZ1ZzdTL21VMG1XaWxaOFZHM1U4ZHRm?=
 =?utf-8?B?OXZGTkpxZVMzdzkyS24vaVVOMEJ5SjFkRHlybXpUZGorRzBabjlRMDBoOXdZ?=
 =?utf-8?B?RGNRaWppNHVaUlV1REVnYStGbUxnRkpmZ082eFI1R0NEU1JGa3oxSFVGM0xZ?=
 =?utf-8?B?cWZ5bHZPc3hnRDd2cStvNGpCNGNUc2dNSFhFYzIvU0xxazl1VnBteDVTeTQ3?=
 =?utf-8?B?NUJzeE1ZdG8vbGRMc1ZwU01XdlpFbUxjVlNNSDNsOFZpRjNRd05FaExVd2JR?=
 =?utf-8?B?bUdyUmJpZDRPY2xtWVNIWitPQVh5bEc2Z29qT1NsK2paZWpuRk9FdU5TWHNu?=
 =?utf-8?B?SVJIMnAwSHVJQ2k4eDlUS3M2L1lOckZNTWJ6SkZBZFNLOGtTK3d0NjFFSjlL?=
 =?utf-8?B?aGVLUnExUG1KSkp0VFZmUWNYUHNXRmUzeW5FTzEvbWwrZUM3bk5aSzZjVWln?=
 =?utf-8?B?UTVEUHcwd3Z3VnlKYWM5ZldOb3VMRHlWN0RBYjBUMWxvS2poTnhDU3BPYmZE?=
 =?utf-8?B?bkQ5TXRzdHQvdGpZeGhOMDR5WHB6bW1vNlZzMi9QMTFzc2U1aklCZERUK1VW?=
 =?utf-8?B?UkZGdW1qR2k3eE1POWxHUHhiOGhaQ1g1WGhjMXM5azZMS2tlam8xYkp3UFN6?=
 =?utf-8?B?ZlUxSW01MWp1SzcrZ0ovZVEwOHNUREdVRGNVN3FRVWlzWWxzK3BEMjB2dUh3?=
 =?utf-8?B?emZMTXFuVXhMbDhaS1dpOWZreER0Rlg2N1crV040N3ZqL3RzcnlIU0k1RWVv?=
 =?utf-8?B?YVRhL2Qzai9kNHJrUy9zUWtncmlsZjRmSVRaazNFYll1R2VoU3JudURBWHkv?=
 =?utf-8?B?clVyODFtb0ZiekNKazVvSzFVSldkSzJWRVMvV2hlSzBLSjBsRUFpaUhTbjFt?=
 =?utf-8?B?ZXI2NWNwc2pCTWlQZ3Z2SlJBbXlSSFJjUm1OTmxMNUVsazRUVGlUVDhvMm9o?=
 =?utf-8?B?djZsSzRTMDJFcUMwanBDdXNHR21QWU94bTRPZ1ZJY3VoalhtSDZQRXZJNmRY?=
 =?utf-8?B?ZGh1VzAvQVF1YmJhK1pKNjZQeXFOZC9xSFNic3EyN1FhclcyUFdjRnRXTm9q?=
 =?utf-8?B?dHlDdTFVWUZCbEJmQ0NibDd1Z3N6WkJ5WmU1M0xHTVVpVzBCbkIrUk9aSTc5?=
 =?utf-8?B?bW1YVmFUQ29QYUsraGZqMGRzQTBSZmpYK0lXTHRLeDRxa3BVb3JlYy9USUVH?=
 =?utf-8?B?OXovaytLYzB3T3hpVHdETDE5QkdoaklkTlZvSk4xVzN1eEdPSlZJZUQxSHVJ?=
 =?utf-8?B?b1g3ZUNmRzAva1VPRFNMbERkcG9adU00UGVYWkltY0VCQjZjbjdGNXYxUEhR?=
 =?utf-8?B?aG5ESVQwc0JxYUQ0ZHZTTmMyNUlCWUVNMGJpYWRsSjJRdUN3Wks2OGZEOXQ3?=
 =?utf-8?B?aFN4UFlaZnJZUTMvcXFVZU81UTg1THVYc0xLdnlTK3hkRlZrWWlFVzBvTHd5?=
 =?utf-8?Q?jETgym+wdhzMXT66txc8H8XWNm2va294xZO3No4HbL8yW?=
X-MS-Exchange-AntiSpam-MessageData-1: zyuB6HBK7jfIxQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05381962-9ba4-4f7b-eda4-08de88de0b0c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 13:13:58.4155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j48a+102MO/Q/5Wvb7Tn54XLx3rR62ljdfoUwst2dgfsT26UagwqjRnb4SdGHhKvrycsq2E/16bPEYZNtmyzJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374

On Wed Mar 18, 2026 at 7:53 AM JST, John Hubbard wrote:
> Hopper and Blackwell GPUs use FSP-based secure boot and do not require
> waiting for GFW_BOOT completion. Skip this step for these architectures.
>
> Move the GFW_BOOT policy into a dedicated GPU HAL in gpu/hal.rs. This
> keeps the decision out of gpu.rs while avoiding unrelated subsystems
> such as fb. Pre-Hopper families still wait for GFW_BOOT completion,
> while Hopper and later use the FSP Chain of Trust boot path instead.
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs     | 14 ++++++---
>  drivers/gpu/nova-core/gpu/hal.rs | 54 ++++++++++++++++++++++++++++++++
>  2 files changed, 64 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/gpu/hal.rs
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 9e140463603b..93f861ba20f3 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -23,6 +23,8 @@
>      regs,
>  };
> =20
> +mod hal;
> +
>  macro_rules! define_chipset {
>      ({ $($variant:ident =3D $value:expr),* $(,)* }) =3D>
>      {
> @@ -309,13 +311,17 @@ pub(crate) fn new<'a>(
>          spec: Spec,
>      ) -> impl PinInit<Self, Error> + 'a {
>          let chipset =3D spec.chipset();
> +        let hal =3D hal::gpu_hal(chipset);
> =20
>          try_pin_init!(Self {
> -            // We must wait for GFW_BOOT completion before doing any sig=
nificant setup
> -            // on the GPU.
>              _: {
> -                gfw::wait_gfw_boot_completion(bar)
> -                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not co=
mplete\n"))?;
> +                // GFW_BOOT is the "GPU firmware boot complete" signal f=
or the
> +                // legacy devinit/FWSEC path. Pre-Hopper GPUs must wait =
for it
> +                // before most GPU initialization. Hopper and later boot=
 via FSP.
> +                if hal.needs_gfw_boot() {
> +                    gfw::wait_gfw_boot_completion(bar)
> +                        .inspect_err(|_| dev_err!(pdev, "GFW boot did no=
t complete\n"))?;
> +                }

Good that this is moved to a HAL method, but we can go one step further
and perform the actual wait in the HAL. I.e., this should become
`hal.wait_gfw_boot_completion` and the wait would happen in the HAL
itself (where such low-level stuff belongs), not here.

We could even move the contents of the `gfw` module into the correct HAL
since it won't be used anywhere, and simplify our top-level directory.

>              },
> =20
>              sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chip=
set)?,
> diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu=
/hal.rs
> new file mode 100644
> index 000000000000..859c5e5fa21f
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gpu/hal.rs
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use crate::gpu::{
> +    Architecture,
> +    Chipset, //
> +};
> +
> +pub(crate) trait GpuHal {
> +    /// Returns whether this hardware family still requires waiting for =
GFW_BOOT.
> +    fn needs_gfw_boot(&self) -> bool;
> +}
> +
> +struct Tu102;
> +struct Ga100;
> +struct Ga102;
> +struct Fsp;
> +
> +impl GpuHal for Tu102 {
> +    fn needs_gfw_boot(&self) -> bool {
> +        true
> +    }
> +}
> +
> +impl GpuHal for Ga100 {
> +    fn needs_gfw_boot(&self) -> bool {
> +        true
> +    }
> +}
> +
> +impl GpuHal for Ga102 {
> +    fn needs_gfw_boot(&self) -> bool {
> +        true
> +    }
> +}
> +
> +impl GpuHal for Fsp {
> +    fn needs_gfw_boot(&self) -> bool {
> +        false
> +    }
> +}

3 of the HALs do exactly the same thing. You only need two: `Tu102` and
`Gh100`. `Fsp` is also not a valid name for a HAL, so far they have been
named after the first chip that makes use of them.

> +
> +const TU102: Tu102 =3D Tu102;
> +const GA100: Ga100 =3D Ga100;
> +const GA102: Ga102 =3D Ga102;
> +const FSP: Fsp =3D Fsp;
> +
> +pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
> +    match chipset.arch() {
> +        Architecture::Turing =3D> &TU102,
> +        Architecture::Ampere if chipset =3D=3D Chipset::GA100 =3D> &GA10=
0,
> +        Architecture::Ampere | Architecture::Ada =3D> &GA102,

This must be a copy/paste from somewhere because GA100 does not warrant
any exception here.
