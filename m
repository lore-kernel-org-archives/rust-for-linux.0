Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7A03BC67E;
	Wed, 25 Mar 2026 10:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435690; cv=fail; b=JxJiTroHkmf7EK57b8A2dhuC6G4+xjebkjolZuMyTquYr6FOdNxXllAMP8QOLs0hdKJHo6TTpOkn+ogeaA0KMUDaIASQjj8/EPkkazR70lXcs9NsX2DVTH5Pfe0cwERtiw+omX/3Un8yohUeA/GVb4MYIsSbWJn3/Vgp99wig30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435690; c=relaxed/simple;
	bh=j9hwgot6shLJEc0vwi6ig7fGvUVokHPvhjAfC5ZhKIM=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=p7/or0FFfsFiFMVG0uuD8VYnnM4OiKBTGG6jnABr15KoRaVdSJiMhsk/QdZ6bEJbmFLCJwbTTBeBScBBXFmUS4llqsNaW7x0BUQRtd66BZwbThc47jUby7uwHVOCmvsPkeaIgPYDwe6OD6EPkehfPTaZRbS0CNqjWmakyNjddl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tjuZ2UCO; arc=fail smtp.client-ip=52.101.193.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tjuZ2UCO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9TzUooS8ucNoRuv8QUrSaolTgzG4kOUzHb1dBo2HVIJNTaW3wvxdpUDX5gWSc0Ky0c1VkpP60dkZPPsxkJgg8giHX88y53zaJbTGCgp48ViEgQm200aC3l04YJy3vbKL9LJJO/GQIrswofNEiZdypfWBSmOf6lYwEAOxs03H93bJhe1RSN2GYVXvk7lvzCPCkjRt6oycpBV5GWiOyJu6icbkCLQTByn5cQojYvTv52NfQWaPHhmxCI0tViCtOt1xqoQNgWWFIezdZDqwAy2Pf3gZmmD16MeG0+RM1RrppuE/RPLkxTRyRF8q4Vm57Ee8u8wAPGw56Ry96I1T6ZzUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctyDvUKIaneHQK2R62uqctqLxqktpDOO1PtaNd75YiM=;
 b=mZuIEYW14s074lLkpVXR8hAAG9l5QBY3k6YwGZPCMZluXGJ0TcyT4xzTvYo+5fUDgw8/0rB6/jHRfB046JV/9N/tjvfZ+QUWSmpBZFAIztqUyI0Jj35tdo21sM14VlFKtac8bwnfi827WL2NxuPO7GWuUSp3NEg6T6/FUcO6UycGirMXtKISccFlK9LmEJ41RmjsgqOkhG9C09aZO3z+QarXx0g1mGNtezzz57xg8Ik5QExaKi4zw2ks3n6QuXYx7e2ZpKKJ4du3SV3lyuZ6eXZxl7vH6IDmd4Cyofd344hEd0N4OzGEizbhhbzeKe1krFXRuAkT0yxXfNSH1ndwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctyDvUKIaneHQK2R62uqctqLxqktpDOO1PtaNd75YiM=;
 b=tjuZ2UCOTbhPZb5BJit4pN67iqCsQZP+dtrmt0BYoqkOlL2w2o5GY4N8ewIjBORs8UwotKxN94vkVIThWobdhk89NdHrxOOCmDKmD4qHr+okr1bLZE/t/wp898/BEjpwwhroslZ52PhYiJFDmq6awzzdnGZiaP+kjFimHDIDVfFaU/XWSpjR7K6cW2C2qmdJrmTt4hRnuqEhSmAFs3VCxiBbwa6gRMSTsEysS8xjMsYExxiAhsLamj7A+2yohaOXgY7LjeKClsKhALtJRI/O9QpJn29sUkrUs88zIJG/huiq8QBGD0HO1f9tQu1tB2UxV1cUF3MOP9jFBSp/QoDnKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8098.namprd12.prod.outlook.com (2603:10b6:510:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:48:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 10:48:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 04/31] gpu: nova-core: add Copy/Clone to Spec and
 Revision, add chipset() accessor
From: Alexandre Courbot <acourbot@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20260325035242.368661-5-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-5-jhubbard@nvidia.com>
Date: Wed, 25 Mar 2026 19:47:56 +0900
Message-Id: <177443567642.105362.18071452933227174303.b4-review@b4>
X-Mailer: b4 0.15.0
X-ClientProxiedBy: TYCPR01CA0121.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: f4369d70-60a1-4dd4-262e-08de8a5bfec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ksjv1ROtpu4kmkmEMlXujN6xtcBXi7De+hvhU6T+VdvLX0X7M90wNAxO1laKZWMiH65OYKwpzTsxyCYHrMFonb3870PSKW4ljZf2jWJ/LCA64Njkn9Xig/b0Eq/fO6+cnNv6sNwVPZRdlxL+xZbENXy9ZApjp9vczgCA58kx/6B5kdVvuzSPw3IHiVj7TgCGCf4wbbqHKKWz9rGRFJ5jBPp5QxLruQDGmIcWU2NBhX+XiqnpamGRF4/YT7wFOh0qEZzav/eG8O0wlwfx55Vi2co9mWValueLT72JqKZF5HD/X3aq6KIbqkhwE1drlfESfpjcb1E5UtNr41WmgNhVsPhqxwbsPR1wpoHE4g/HUVwsrVPdD9A+3K7KEUPn2eQQNWxBIUx4zKYNz+2L8vfQLJjGP2AEZyzNmhbc5Sfdl6/Nbzn0u4IjGk9f0hrLD9POzOorgqqqd6UryzIEz1C3wc31/sVOAemhyoKlaoOBCEbCYFHU//5LTFnqkjmuxHEQhmahZueMQdFJKmiT+6w9oZy/axSGquw4an0eWzN0JN5RX6xYq345aI0aJdyjZwNWlPR0cd/L1ygnsm0bakX28vTpiC3mEloadDCiBcZrgaqpuAms6AnAhMrxsgaS/8HkKA9beQFuC0jEPAN9+8GhDXDrhEJvm5/VpP+n0H/giunyJ6Kj9ewlZBoSYKHVJLPB1iz6opcykofTwD1/WEdBWvtXHwdmtJXEPqUCgiQ0BdE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkJnd0dDVlVVcU93bXZseTlScEhXdnV1N0RBTm92Z0d5K1VBMitqMXEyNWt1?=
 =?utf-8?B?cmhuOHRENzRBelBtNnk4a01zdzhLWXVJejV5T2g0OHlyMVAyTktlOGtXUm5N?=
 =?utf-8?B?TUhiN2NIMUE4aTc5SWxOKzZnWWgyd09EMnBraERPdkZNbXZxQU4wZlZ1UmRu?=
 =?utf-8?B?NHFnTittZXdzd3NENmpnOU5Xb0ZLTVhsd3h4b2hSNEFPNHNnNGFFcHE2S2FJ?=
 =?utf-8?B?YlpFNjB1S3pUSzVFdTJnbXNUNkF5cHUxcEpLVmNxV2pDc1cweVE3TGxReTRB?=
 =?utf-8?B?MkdLR2EwU3F0V0tKNXNRY2hmVXFBdmNlZmp6VTRhRjJzbnNlV1lUQ1lCeXdq?=
 =?utf-8?B?MlVHRVZzbkhweEcreWxDb3lyMXJTbW9waUlna3RxeTZ2TFI4U2lwNUFJZFZz?=
 =?utf-8?B?M2VLNlFFS0lYOFFqZHRpSnVjb3VuUUREekJ2UXlCVWtlcVErbDZONVJNa2Fa?=
 =?utf-8?B?WmdiMU1MYmVoOVk2R3ZTWkFUVW5qZzhDNmF3Vm93UzlrN09WNkdmMVhEMEcz?=
 =?utf-8?B?UU1yb1pNWlV4bnh1NW9saGVqWlNHdUtjS1hlNHJHZm9QR3VFaTM0M25kb3lH?=
 =?utf-8?B?c1N0RmduZExwN3ljT1BDdllaS0w2K0NLZWJ0VHpSUGJ3YXhqcVFldCswKzZH?=
 =?utf-8?B?RnphMzJJQ0lnOXVBSFhmci9jMlJmMjRqUnc1Q0JnaHBybnA1NEozVWxhUDVj?=
 =?utf-8?B?c2VBT2pzU2hUZFNCMms1bllCSXowOFFqbjlwQVFNanFLRkluUWJpWWxIaFJE?=
 =?utf-8?B?am90d0NXcTI0Um1peDBpalhzY0NjcnUwcHgrbmZtSmZkR294SDlQRXpYVkU1?=
 =?utf-8?B?anN5UEt1UjlRb3dpUmcrZDVjSG1JdWNkK2VTSUM4N3pwVjBzeGVtaFNQd0FH?=
 =?utf-8?B?aGQvUEJDUnNlaFNUei9jTlNpN3VMY1Z3T2xDY0VkbThtU21QdkV6MmdJbmVC?=
 =?utf-8?B?bVQvcC9ONnZHLzRqQ0YydjRUTDNkMzhzcCtSVVhGM1hFQk0yZDhVSmdlN3dL?=
 =?utf-8?B?RUE1ZHpiK2RkQTJPb2tIYjZLLytZbVVNdzlVdlRzaUFxcUw4RHE1K3E4Szcx?=
 =?utf-8?B?ZjN6dHRBeGw4UDFLalhHOGFxY05mWVBLdUkzaXNzOEMydGNhd29iQjZ5VWlH?=
 =?utf-8?B?NkR0Rm02bXMya1c5YzZ4YVhWL1RmU3dQb3ZDYTArMlhTOUFlYXVFVktSVDJa?=
 =?utf-8?B?dlQzR1g4NjhqM09YYmtqL1BzSEVaeGRoZmkwbG9hc3YrT0hJaU9VUHEyaHlV?=
 =?utf-8?B?cGdGTnNIT29qY01MTFpNUVc4VTZ6ZzFvUU1nYk1FRVkzbFpWTXQxUythbDQ1?=
 =?utf-8?B?djNhWUJ0Z2pJaVloNlJUcExHYzlLd1l6dTZUZ0wwQzAybnpIYlZUMCtOYlQ1?=
 =?utf-8?B?Sk1RRm1KQjZSNlRqRStseDJOM1BaclRkK2ZSQ2Nid3JSK0ZJcmZVTWRmdGEz?=
 =?utf-8?B?ODNUMWJ3VHp3UHdBaFZ1SngwdmdWOTFORmY5eVNGbitYcEUyL0k0ZHNFczNW?=
 =?utf-8?B?MWE1ZE5SVHRxUzFyV3Q3cGhDeENqQWNmS2UvcVdRSWdsV0xlcHRGSXR0T1RJ?=
 =?utf-8?B?cU1icnYvQjBnRTJLd0xvczFSdkkrM1BIZkNGbTZiRzMySmhHd2dQbVFWbUpO?=
 =?utf-8?B?OWJXaExSRHArN29rSDZCOGF0eGRYbldjUjVFV3VZcW82bXQ2WUNIMEFwRUxu?=
 =?utf-8?B?VU81NnNoZjBFSTdPUUJYUVoyUWVvUzRKbkJPZURHaHRWNTRMZFJha0Mrb1ha?=
 =?utf-8?B?S01BMk50azVWUmRiTGdUOWxaOTh0SmFjSUlJVXc5b3dIbVJmYVZjSU51ZFlz?=
 =?utf-8?B?d1lNVm1Ra3dpbVJzVFlNVkQwT0RtMmdXaWRrZXUzZUROVDNZZTdxcGJ3MXNW?=
 =?utf-8?B?M3VNNm1FUXJPYTJTY0pHNmpoZ1hPYjZxS2VwblRqeTEvdGZWaUJUR2ZJWFE3?=
 =?utf-8?B?RFhrZndwQmxVWFBDT2VvWUVQQ0U3L3BhSVgzQktUUUlncUw4cWRrWXVsYlF5?=
 =?utf-8?B?MlRTUTk2cHRPQkxYczlycUs4QVJDTjJhMVFmVUgrcVVqWnd6c2FOYWQ0ZFQ1?=
 =?utf-8?B?dEVnMlJNUFI2QTJsbEhPMmFBNjNZQ0I2L0F3eU9NQ3M1ck9OZUw4amUvbStI?=
 =?utf-8?B?bzRtN0ZhK0twcHhsZ1MvWnd6bHNjUm9jUytiaDRHaS9CcGFFN2xMSGlnanhp?=
 =?utf-8?B?ajBneURnRXIwYTBDc3RJWVVqZXFaRWYzTEU0WW85K1c4WlRtSkVYWVdIVFQ1?=
 =?utf-8?B?T3BGUGE0WFZGNCtjeUVvUTliUE9wYkhJb2NjZDFYVHdhTSsycWxQcVVZK2xu?=
 =?utf-8?B?dFZSaHU1NWVrUGw4TkpHeEhYdkxXNHhGWTZTR3crN0R6R0RISjBMQVh3VjRa?=
 =?utf-8?Q?GAbv858mhPzxsKQpHbMiBmJUjrxCwg+E4vfCafITdyp1E?=
X-MS-Exchange-AntiSpam-MessageData-1: q13fE5gt1U39FA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4369d70-60a1-4dd4-262e-08de8a5bfec3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:48:05.5456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFm0o4E17UReQPQpRqfEPNWeR05HiOf5Hw9Zs3uEufNg/0DB1or+3ZQh+3Eu4cbJSOKmrC0HYHRDOy15GhN0Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8098

On Tue, 24 Mar 2026 20:52:15 -0700, John Hubbard <jhubbard@nvidia.com> wrote:
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 3b4ccc3d18b9..3cd7709883be 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -291,10 +298,9 @@ pub(crate) fn new<'a>(
>      ) -> impl PinInit<Self, Error> + 'a {
>          try_pin_init!(Self {
>              spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
> -                dev_info!(pdev,"NVIDIA ({})\n", spec);
> +                dev_info!(pdev, "NVIDIA ({})\n", spec);

This doesn't belong to this patch - let's apply this when we actually
touch this part of the code. The next patch removes this line, so that's
the right place to fix formatting.

>              })?,
>  
> -            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.

Same here, why remove this in this patch?

-- 
Alexandre Courbot <acourbot@nvidia.com>
