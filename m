Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012044.outbound.protection.outlook.com [52.101.43.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEE833344A;
	Mon, 30 Mar 2026 15:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883476; cv=fail; b=aZiNvqaATE+4YpwRnQ+j6QzIZ14I4tz0TWGuja80R2RNrMduDkvAwIWRSbUutU94jAKp8WWSfL5yJw048vuCdWBLI2YVxJYha7GyXYAd2WCboTMFaowjINertg2P/5tQwlfiKxwsO9T2uzo3WMTRZAofNA37YyBj0eTd+cGYuEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883476; c=relaxed/simple;
	bh=O0Sxj1MvnxCy0RwfcQPg5Et/Ticm+skvjQrV61nL4bg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Lb0ZMlJ3dT4sjYuDjosfXJBFr1k6xF4AvH4HOp1erISqkBmLHpeS0RAGF3KZ+M7rG2okDgx0b/C30q3m0R1IhBPmz0X9thX+DWbGruq54oAt1dGhA6yuR8uU4ehbgpQL3wNHpP8pm3E8iomJlpO8fbKtMkSJwFQhMJF618gw0HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YK0kHTbs; arc=fail smtp.client-ip=52.101.43.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YK0kHTbs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RT4QihmEGf4jtauyv1leXqOap58Wd5EzCQWcn4EfJnZWNTSwynagKdNaSiarEi7BCBuMe0or9xLz5wlZ3PZQMvyCMXbDK+mbt30BQu45+hxJCm8wUrugxpxzHBtNGI0foukchLx1q5uEgclNnpzg0QK8nh3L2LbXPmK5C6bF8Z9KAuq6plkUv9w88H69NtbzUqhxHyGbYaLn+dNM+TzwPOkYDniwEYO6C+pgiWH/kiUuz/Hwbf/PVTeLAEgxodMVKitsGYVU5kXlPhcAEm4xvJw6GU9Kao0ev3BJjyPsyTiHTUkWJbtUO913yS9tCnnMaE944nbKi6AIQ3EVVKSV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHVL1vBqNDmpcTHthc5EpG+M0zehcMsanQyil+RsqIU=;
 b=lM+Hd8RhwXZEfzqzAzwxDnInFMmYrZISA5nJSA8ODHUw/l9w/wRV7M2v7Wsg9NLe6CL2lV6EwSvP0UsX0P0X/yxgcTSPt3OT4cQS6El6aZDDeszuJofgP2WeW7y0JSVrfN8fl210rtIm6ilohrOaMR7LHeFG+hMYhqWzK2gf9pHdmleFgoNQ0rhcXgHvsZg02UpDH2Yqsh4i7tWdyHMaNGyRwJ+9DM3yXWahiQYgIwDyrBzEdxwPMOaPA2Fah9OYsKDQ9Z5d8gcPnjGWSCgv1ywhl7TJUkIGer+LJ762sLVEt7oMGQS8PZi2mDggbqLtQni98uPYqjfR4jsG9Wzqrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHVL1vBqNDmpcTHthc5EpG+M0zehcMsanQyil+RsqIU=;
 b=YK0kHTbsa0kYvQ6wcIwKF0kYviYU4+0oSgO28fsKN13pGvYN/v5CHlEPe7BjCm4VFIR0G/Hv8gIHlTIyPgnkEWhS3vEnVwGVon1SoNHEwh2dDayacUfWEaUAEdsMddKBeb8uuLp/QYFrTRP7ovuq0ZanD1D+R0+U9CCHn9K0ErqctWn+x+j+YgaqVtSIaxP0MQ/SZA+b5gxLvbMOEPQaOadrOjslPx43Ykiz5F2snRsVBJYoZ/3tBs8Wtv4PaveGRDgkCVy9nlRaG7ZctqptpSgofJqo+s8zL/xeS954DvxSc5y5aoYD4dvu/NPA/FkVMH+kaLkMe7RVd46QvPm6LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:11:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 15:11:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 00:11:07 +0900
Message-Id: <DHG7OGJPGEMC.295BL05EFV4GN@nvidia.com>
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
Subject: Re: [PATCH v9 24/31] gpu: nova-core: Hopper/Blackwell: add FSP
 Chain of Trust boot
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-25-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-25-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a0cdeb-e0ff-45c0-723e-08de8e6e9394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+oASh7Wc3s9FV5sWweQneGBJb/XX/L3u7qvo8ndYXmhueq/OMSkLMWrg3vy4IN7+udzu+6IhuAiioswUolvM5PkCdPfvmRVwQ3aa7uolwWG2ZFchI386alTx6WwCqgfixfe/GMDejwWE9bl/TunHEapk1270JGKoW1i38NwoGfZtJVc6IuZhzAGnEvjbx7olEwycdiN8BYbalbnyZcsjQI/N4qN4ziyTo5XTAvrXXsaAUDGZO45J6O6+2QCkppOqM7vdlT/RLB1fplWoZhinzjZDXNtAa64sNshuKOIYE/0EUU7A+n8evHMBoUCd1iAcDjonQDYMIBNSqwm9MMblIua3VAtljzvLVZaVq7RnDrT5nKhjPREvhPW01LaIAwhOQRy050zI1b12G83uMQWbNG7upbBgOGHKOGbNLT5pfTH1NjfZDjmyDK7NGn16w+x8TXa+IQNyLb7k2Zpx4ssRc5k/T+EGZ4mUjrj+qGrYACRDvE4vFbPgF0WbDMWQWbfoSgknKEruEc74Pq53qGP8n6+i1We1qUEh1xwU7YJXE4H4i4As2J0U+k2RO8nIZIY7E21+CrXduOnQxIHL/b8znb8+hQhG/XSidA86vTKjIm1cgDJwgf5xZFkM2/2bXoUxpoFwQQm9/eR7fv/ewWLoiZrS/eV0ModnmInQb5TxvQTaZ1r0RuYAmLygbvrmXWIv9x+CzN5AffA2DIX5fVSOPKJc+RlFIMuxL53bjwIrFMo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnJqMzhZeXRPUFY2U1E0Ny94Q1FSdytycTJwRlVPZFhzU21aSUtHNGxzb1dy?=
 =?utf-8?B?blVaRzhWd2JqZlM1cFpMYlpZaTE5ZDdDa1AzeTFHZUtzZFJBSW9HWSs3N1lw?=
 =?utf-8?B?eHBCdG1NZytUM1V3MGs3UHgxRUpqdHV3cE02Q1ZyNFFXNnlYaEpTbmxIYkNL?=
 =?utf-8?B?SU1OMUthbFErRkN1dlo3MGh4ZnJVSDJWdlpNOCszVSttQWdFTUtYSk9NL1FB?=
 =?utf-8?B?VTlId3hoYkU2dTFQajd4RWtkWFgwNXR6ZGd2Y3BJNWJzU2xMNVFGaGwwcFBE?=
 =?utf-8?B?Q216ODUybzNiSU14THpKUDJlTStOLzVCbHV2ZjFOcHhIYjFEdk1SOWtRZlM4?=
 =?utf-8?B?R01JVVk0R1BOQU5BdnpvbExIMDZEbTJzQjNyVGswSzhubWQ4WWxmbjVpWVB6?=
 =?utf-8?B?MjBWTzlmTDZiWWtMYThrbWpGUWN3dUVacS9hRGtMaHlDbnA0d1I1ME9YOXRy?=
 =?utf-8?B?RUpvdUlUWTJjbE9LaTBPSDlZaWQ2MnFmNE9MUVY0dk5pN2FJbnRJdEE5aG5Q?=
 =?utf-8?B?ZWM0bFErSTNYcUd4aDhVbFdiNVN4b0VGYUJLRmN0Z3hoWTZxeVUwR3ZLL2hG?=
 =?utf-8?B?NXljdUVwY01GOG9TYUo5TkNaVVlKbnJ1OWdNeDMxYjhPNlFxRmhTb3luYVl4?=
 =?utf-8?B?Zk9tTVpxZ0ZpV2lUUFJncFU3V1FSRk4rTm1abENqM0tZZDJlT0xwMlZPNUpF?=
 =?utf-8?B?YXRjOXA0ZWtiTDNKaGNQbzZNODNvUndJSnBja2pNeUZIdTBnRU9aRStoMmp2?=
 =?utf-8?B?N2xITGtvOEtQUWNvd0NlRjJ0WXZoNEhNeGFKM0RSaEVHbFVxeERjd1lPWHRl?=
 =?utf-8?B?SXpGTlJuNllEdW95cXFwUDY0SW8yRXRoN2E0WTFVT1h6V2pWN2F4WTl3MXdV?=
 =?utf-8?B?ekgzUDZUdUhtcGE0N1BtUTVwWmFieDBtUXg0cW9RaWJXODRNOC9CaytuRlBZ?=
 =?utf-8?B?TGZKYlhtWStZMnIvUUY0RVVCUjBFSlNuNGhHMW9JTUhwVmJ0MTRIQ1NEMCtZ?=
 =?utf-8?B?VTNHWXJMMGlkYTNpY0FIbVh4Wk10VlhweWVkNXZxUnVaVHQwV3ZHZHpkbTJY?=
 =?utf-8?B?SzNUZjFXdkNQaHZNNHRqc3p6ZlhudVg4OXNYS3pNbXoxWnlBN0ZicVlsZitp?=
 =?utf-8?B?UG9MNHJzT1Mvc2NtamZEZmtqaXhEYVlBZ21TUndtN01uTnJSeHFwYTdVUlpD?=
 =?utf-8?B?aS9qZGY4Mk1Bek1kS01jT3hpam1OY3drcnFWV20zSE5uWTZhb1drZGp4RnBQ?=
 =?utf-8?B?YXV2REhZbGcwT3lwZjFLL0dCaTlIVXJZTmVYdUVkZSsvKzREOThJeUVaRU9B?=
 =?utf-8?B?VlNwMXE1eFR2VFZIeG92dHV0Vm9TRXVPVThUQmhkdVZHNG5qeE52N0lpczBk?=
 =?utf-8?B?ZG1MY21ER2hVUVMyQm0zam5mYmZDdUY5c2dKMFBlZmZoVW1OaVN3UHdqb2Zo?=
 =?utf-8?B?U0I0YmhCTXVodzczMWJTZnZ2TENkRTBDemZmR1hLS3pZSHNoWGFxcWFhclJ6?=
 =?utf-8?B?T2p2ampQUUxJQmZPZjluYTc2MWlIS1hRQXprenBrd0VPNTdVMHlEZlpDa1pC?=
 =?utf-8?B?RTk0b1NsSWhEMjF4UmNpdnJDYUhJQzJTTndHa3lYT2grQjFpTnJvUWE5UWcr?=
 =?utf-8?B?citmdzR2dSs3Zkh5Q0JsNUFLb05SU2NqckxHdTgvT1dIeUZiZ2FmL2Y4a2kz?=
 =?utf-8?B?SUFXRG16TkNJaUlLRVpwZ1RuTEJCWFhIbzhpNndHb2oyeEV4MGlYOWNvNHBK?=
 =?utf-8?B?UlhlZmd1a3JIdXVlWjNlQ3UyMGpHRmZCaHJnaUl5cUhLR0l4ckxIQ1JzWllT?=
 =?utf-8?B?VDhEWDBGL29NbjRRUWFXV1RRak9JcXFLRFpEclBUa2tpU3Q1STdMQllxblNz?=
 =?utf-8?B?S1Mxak5UT1BlNjZ1K0pKNUJ0Y1ZmT1QxNFBEYy9BTmQ4L2lwR092bFZ4clJR?=
 =?utf-8?B?YW1pSkIxN2tNUnFmckN4OHBZb1BOOXcvbXYrelMvMlc2bDlvL3lCRE0wbXg2?=
 =?utf-8?B?Z0tFR0lPOEl4MWdVNmtocDNDcFpqcGFiekdPdEMvUEJVYjNOWm1vSXcwaGJn?=
 =?utf-8?B?cDl2ZHpoQVlDbUZKRVRPS0ZGWTlCSmFjT0xPUUlCcEVFZEFmVUJlTlFlSnBw?=
 =?utf-8?B?MmZxZFBNYjIyZDA0YVNxYmZVZzArczRQdFplUFptQ0M5NTQrSGtoMEFJa2pX?=
 =?utf-8?B?ZlN0N1lJVHRmUzZwaVE3WmJmYk1LMjdCNit6NkR3L1ZaMmx5M3M2QTFsM00z?=
 =?utf-8?B?dzRVWmxKZ0hKcVR4dVQ3cTVQQkhOaTNPL1pSaHJOTnZDNWhnUGlIRGVwK214?=
 =?utf-8?B?S2ZjaGdXdGFUZjNTOUFMQWNwdkJYeFNCOER1cHRXTkJHOWZiTk5BVTVUM3pS?=
 =?utf-8?Q?IhSLP8l7tKMEJHqys2giz0Tc4DyoxiWE5SlG3CYomK70v?=
X-MS-Exchange-AntiSpam-MessageData-1: zJJHjPKRudRbOw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a0cdeb-e0ff-45c0-723e-08de8e6e9394
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:11:10.8808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRdsKgWFqpuYgndpEHX81FFTdBsL28+Jma7c4YI7n6ryMr4P9UqaMRLqdFMMX3Ith+LjlRq7owZ8Izyv1i4g5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859

On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
> Add boot_fmc() which builds and sends the Chain of Trust message to FSP,
> and FmcBootArgs which bundles the DMA-coherent boot parameters that FSP
> reads at boot time. The FspFirmware struct fields become pub(crate) and
> fmc_full changes from DmaObject to KVec<u8> for CPU-side signature
> extraction.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/fsp.rs |   8 +-
>  drivers/gpu/nova-core/fsp.rs          | 170 +++++++++++++++++++++++++-
>  drivers/gpu/nova-core/gpu.rs          |   1 -
>  drivers/gpu/nova-core/mctp.rs         |   7 --
>  4 files changed, 172 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-cor=
e/firmware/fsp.rs
> index 028f651553e0..5bd15b644825 100644
> --- a/drivers/gpu/nova-core/firmware/fsp.rs
> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
> @@ -14,16 +14,16 @@
>      gpu::Chipset, //
>  };
> =20
> -#[expect(unused)]
> +#[expect(dead_code)]

Why?

>  pub(crate) struct FspFirmware {
>      /// FMC firmware image data (only the "image" ELF section).
> -    fmc_image: DmaObject,
> -    /// Full FMC ELF (for signature extraction.
> +    pub(crate) fmc_image: DmaObject,
> +    /// Full FMC ELF for signature extraction.
>      pub(crate) fmc_elf: Firmware,

Let's make the comment for `fmc_elf` correct since its introduction
instead of fixing it here?

>  }
> =20
>  impl FspFirmware {
> -    #[expect(unused)]
> +    #[expect(dead_code)]

Same here, I don't see the point. If it's not unused anymore, let's
remove the `expect` entirely. If it is, let's keep the more accurate
`unused`.

Btw, this is the kind of stuff you'd normally catch by looking at the
diff before sending it. I shouldn't have to do this.
