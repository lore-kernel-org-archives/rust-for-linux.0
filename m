Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010036.outbound.protection.outlook.com [40.93.198.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76600346E7D;
	Wed, 25 Mar 2026 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435557; cv=fail; b=rt52lHtS4GBb6ZwMcsOqUNLaj80zGfNWzR2NFaoHEeR1CTwyuKKzsgOYkcZDbJqOmiY3tE8WEfVk4L816x/3gGzCx1I9HKytMdmTMJwR+bNFdf7s6UCw6FfZ+UXXbgxYFyMh/MINInzeAYokDd/5wTLsrTItdqEx4QlWrY1KtaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435557; c=relaxed/simple;
	bh=pcBAhaXsa7E0D7r3Nro4wcWOID0NAREbVpLvkxGarFg=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=SQP5VmzapmdJWwYEEz1dnkyPsnkArVeWxL6Bay9bi+OCakBNpJmneTyCdlzxsKYKx1USZG1I/ZWOF0S2XwxT0uAkzovEk+LdipJCsQmE76gmwnkSZ6QEEEbgfehhiQutjhRsJcvjDvmBPkTjVI3p8J0jWOxAzYLx/HBu2GpITvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nhfscbaN; arc=fail smtp.client-ip=40.93.198.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nhfscbaN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AE844MxVeF3OqGCGRj9a4Geg4b6mFgj9IwMSJvlDHIBvrcz76c4bLlz73KA1r8DHLOiliIUEUZxxesN6vSxRgXFhF7oOtJ4TxrEUpedyEruwoShiPTXXLKkyQ/EbOF0eDgAIXLAS08xOMwTf/FYD2+s1RAn7rQO8gf66K2ypxC1sEABwT5zCGV80+x5gU4fnTKN/nHm+chP92m3krIwq7l5cLMFSWk6ln7gxqAfOwtnXEQ3Sz3PCzuTjY65/3em1Xa74+ediOXzuEJXtWWVyP2AYD6L5wphE7b2sbp6AebXbuZ/pvizgltJtBdV+GAoy5mLgNG+M7qO3YeksyfM3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhqfi7oqz+vqTNdxDW4umiqS6Y0KaKq6JWLS5AUBCfk=;
 b=ZB3s7PqpWAi9su+i1fE/dCR/iwnrOG9YMhz5jGNSCL/GRxyN24L7prC1D5FrINBawWDtbsm/haKt3ADI9i6k3C6hOWtoTjsBSWLa5UBr+MD1VZq53lowH78IO63dQ3QKg9I1Eg8f4NeWCBrhQMi+v072idV4ND9Euf12+JptMiSNA4jw/Dp8p4bG7gvwcmki3p3weLII8dOtddAGXkOyESC+nIi9UZVOhnIuIVH80xL2qEj26Z6+EnmHpGXa8AbDoIpDu301sydIDcofOGvzs90a2h5xggZo0YbBLmZdgWARjt0ocKySYX9aJH0F3KABJ5uXXdHz7Dv2qkr4tNvVEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhqfi7oqz+vqTNdxDW4umiqS6Y0KaKq6JWLS5AUBCfk=;
 b=nhfscbaNTekMztIaLjn8HCNhwopa1SLE5mh3DSmi4oHzHXWReQUURUO8XV3hWOLFWNy6Ry4CQuOSA1+LdFAbzu4N6Hber2IepOurgdu9QVLXK+iZJOymaeaxrPvVpIzro/kxQeI6Je1O2q6bhnUY/reLM5nesjQEYaUd+tEdqtVZAAkqoO4uTeDUGcEUI29A3Jm/1nZPR+/eXqnOWRJHx1YAzWTNIE1bVimQKgFZuAWeY8q89PaVVpfnnX7t5p24aEU3hmkw8z841RlsI6IaEfjl13JTPr4NdtkbsUr3UfQ1FHfkcQoCVOANRCDBNIzRae8Z4o/i5vwRDKwuRpj48w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8098.namprd12.prod.outlook.com (2603:10b6:510:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 10:45:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 10:45:51 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 02/31] gpu: nova-core: factor .fwsignature*
 selection into a new find_gsp_sigs_section()
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
In-Reply-To: <20260325035242.368661-3-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-3-jhubbard@nvidia.com>
Date: Wed, 25 Mar 2026 19:45:45 +0900
Message-Id: <177443554510.105362.9416236198599659187.b4-review@b4>
X-Mailer: b4 0.15.0
X-ClientProxiedBy: TYCP286CA0140.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: f6943c78-ac8a-4393-d1b1-08de8a5bae51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IfP3q2hjE4c9tGIAOb/hOA/CV5ejR6DK3+++DUq44mWA6RQurlIK8VZHudMhh8fBWV1F80KrUfAMNyuZsH/c7GLUgGhZ7xjUT/CJ8XuiAfGMEF0MHFx7TSUgEmMqyGZTfuF8hotnry6l9SDSBZXe+2dQ2KKO5Epet4gwn+vZPougzZWa/V4qMfo4DHP545EM/2VD2SNIriMgmMzWHMuKFLgvvwD1g/NC5Cr16+cbdE/LBBZlD0aHxUMP3nw/7j/iuR9saSwU06FsVxnkdVVzNU9c29VkHZeh+ePhML4Ew1e1eyFcrhkqmrgt0SidVXFoB3zfRBxfSx25diNlix3wje87e2O7YZ1Lxzi93Enxw74cZmYk0uPXeMmNIGZRAbPPwNSGBngNyz0wKaXKUKAVLP5jszEuqN66RvBM1FXyn6Fc4aJoGio2kVRaspd9g6bUKLpQAB/8seCBpxNXp6ifJDwfGOCwAeSbs/k6ryP6UrtCEnAlHIoudAloXxdRHEhvhNK2DHOVQasOy91YsTlrR8YGvbsnFs/S8/1VYtwPbcwcuhHZ+inNs1mJl9iAHQefzOQK6LTAQwzNB3ZrekXfa22rYcerBe6VQFPHpGA1ENJgETYfdL71HfjDqo/bW0FoeUTP8A+AqLWoRFjlTDsLqcFUI2BDSo87EohAtEh3/mYrd1PB77xz/oZiBmjfg+S2GZMps5uQvEEqhzmjyfckplpPlvPClgOGruyUh1EUcqQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkRUbzJGb0FXYnV0QTJxNzNhUElKSlRTVTF1MkxCdXZaVTBqZEZnT3E3b1Jl?=
 =?utf-8?B?UXlDMDhSMzhMV0pEbjNHcnhVMlAzQjhXbktnMjdPYklBdEZDQVJtcWVwMjI4?=
 =?utf-8?B?Unl0UUI5L2N2QWsvVU9WaTc1MVdOVXA0M01FTmpNQTEvbkVBMzBhMko1cXR6?=
 =?utf-8?B?SFlEYXlycVh5ZXFWeElHUkRWcVpTTjZDQnBJZUw4UXIyL3BNMHZ0ZzluOFZI?=
 =?utf-8?B?QStZR2JOS1V4cysvWXJMMFRVWTF2YlJneTlGcEV2aWQ5dUd2M1N0NTgwVFNL?=
 =?utf-8?B?Q05sSW9JZGkxWTlGNmQxZ0MwSEVIUGgvQUFUa05mM1RUd292cGhNb0V3K0k5?=
 =?utf-8?B?Mjh2dFdydmk3RTBuUHVUY3BqRi8xK2JZMUVCOXR3akloZllpSWorL2h0U2I1?=
 =?utf-8?B?L1doMkdEb1ZTR21wc2pBaGNwcCswa0NlaGdSa2RMNDFhQ0crZ3E3NStxeU51?=
 =?utf-8?B?U0Y2TXNRZUZ3ZE9TRnl6R09GRWFweWhCL2g0THBPK095bGRUazlUWDBWTmJ6?=
 =?utf-8?B?YWlOcHBDNmMvVTNuZStTR0ROVVFTV1p0M0trTnNoTmtGZ1l1a2ZRZzFzeEhw?=
 =?utf-8?B?aTRYUW8zUlVoZDRkMitMLzRHVndrbGdEWklhVzRpOU5Ob01VQkgzSXZDbzlt?=
 =?utf-8?B?ajlQMkMvRkVJck5uNUtMTk04dUtWOExSQjRSSDJkRS9PbjlXVkltcXF5YlRY?=
 =?utf-8?B?M0FZemJ3ZHYxcFNsTDYrcHRQcndQZVlFQXI5VVlqL2J4RUlURVBNUjdzQlV5?=
 =?utf-8?B?OXpIZmhxY3FZRVlJT3QzMjRJU1Q0YzdTNE9rYUJtR2hObFh0aHdnNmNOcnIx?=
 =?utf-8?B?Z0VMSnJ0Y3NvVmMrZjg4MkVpQk81OThFVi8zeHpHejUxVGpTTjlFU2c1Umlh?=
 =?utf-8?B?QTFrZnJLMDhUTVhoRzBmYlFrN2VZRWg5L0xJR3ZwMTRRaGV3YU9JZnRYR3Ur?=
 =?utf-8?B?RG9qbkFyR2Z3cTN2dWFJcWQrc05BSEZDY0VTOWpiLy9tY3kzVHl2cjNadytK?=
 =?utf-8?B?UGFYMko3b2VlcytBZmpXaEVBN2NBVEdJR1p6Q0tyeGZxaUc0WnRKWWlUMTJD?=
 =?utf-8?B?b0NJem8vYXR3V0dVS1MzMlEzWkc0NnR6RHIxa3ZOL3cyM2Y2Yy9kVUp5eTVt?=
 =?utf-8?B?UnVrYXQ1L2tnRlVFV0NwTHlQSmJRcThaVFMyMGRtZlVGVVZuSGtxbHFFYkJ6?=
 =?utf-8?B?Z21ENWdMSm5WSmlHRTBqdmNZbHZmd0FXVWVQT2R4WWhucmdVbXdSSHc2WE1J?=
 =?utf-8?B?aitBL2ZOYmUzVnpZNGVjeG1LNWhHZ1dtOG44T01SL2dpeEZScHBtYmJuVk5Z?=
 =?utf-8?B?a0tTQjVBT2hRUUpRU2NuWVluQVduaGNzUlU1TCtTTzBycmxWY0lkTm51WE9n?=
 =?utf-8?B?V2Q3YzVCMHlSZ0h5QWNUZGt2VUNhUWcxbFAxVnNONE55RWlnK3ZUdjV2M0or?=
 =?utf-8?B?emZCekNGKytNYi9uNkV1MmZEM0c3Y0l3amVwNnhhTk9FMTF4OVJWbWlHdFB5?=
 =?utf-8?B?VTNxNFhBMXhQM1IwK0JZN3NSQzdkMjFtVFFWL0h2NmZsQk44S0VwV0JZazI3?=
 =?utf-8?B?L3ZFaHBPUUc4aEtkL1h5Mnh6UG50STBvU2RxVmVNZlNySW1ja2VoejNyb2tp?=
 =?utf-8?B?OVdJZlBTMGlOYXhLY0JETU5jTFhtUGlmZGVLbUdUUUozTmxCZWNJM3pQWjBm?=
 =?utf-8?B?Tzd6NkJoS253NDVIbkZucDJudWtvbUVxTmxRU0tBdFFXbk5ycXpXZVlCdDcr?=
 =?utf-8?B?VXQwdUlzeXcvNW11anNuRXpXNCtkRmo3Yi8yQzIwQkQrVUQ5RXBMaDYwcVVo?=
 =?utf-8?B?cGszOEkxWHdnNUlZQVMxQURleGtGVThkbWFyeGk3bkcvZTdJUDVNSERCemxI?=
 =?utf-8?B?MXFzWm9LbjVzV1NmR2RFNll5UXppVENUUmxrbVVvZkxMT0I1c3puc2p2dWJu?=
 =?utf-8?B?T0ZNOXVSRGNiU3ZTbE1IZmp6bkFOUUNZVHhQYlBCNlBwajNJaXBwdWRHbEta?=
 =?utf-8?B?WXlNY21kd2pGaGM0WXd2WVVFNkxoanA1WmZRcjczSXI4TTVyd0ZvWWUwL2da?=
 =?utf-8?B?NXZ5a0FLLzJMaGNReWhTY2Q1SUhxSE5USGJaU28xL0UvalVVSm9hUEtNKzZI?=
 =?utf-8?B?OGwrYVo0YTZlWHplRUtqd2pBNkpWclhkZ1VjLzdpQWc5S0dkcVFqeW1ydjZq?=
 =?utf-8?B?TDBjdVRjTnBrWGtWWVlrb2ljd2dBd2dxSE5Xc1pZeXVCOTZGbWk2ZDk1Mm03?=
 =?utf-8?B?MEhUQndCbFMxemlISk51ZVE1c041aGpSYk1aRUZHZ0FaTGU3L2xKS2ZrSXc1?=
 =?utf-8?B?TzJyS0NnanZBNUQ0UzB4RXhkT3NpVUNvaHZtNWxSTXMwYzJFOUdzK2pPSVhw?=
 =?utf-8?Q?vNit8m/82+i+MozjCAY9VOyArYjBwqmTn72/nf1oKhJ6u?=
X-MS-Exchange-AntiSpam-MessageData-1: 5+PMJ0oAWaVoAg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6943c78-ac8a-4393-d1b1-08de8a5bae51
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:45:51.0189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8poOYfnl9rkGnPGQZr5s5Rf08GrcUiMdzOwVpDMwsCOFGVj3sNAy0+AiPpoNSeUFScVIaH4Y2ydVMI07cPTalQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8098

On Tue, 24 Mar 2026 20:52:13 -0700, John Hubbard <jhubbard@nvidia.com> wrote:
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
> index c1f0a606f5c0..8bbc3809c640 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -146,6 +146,24 @@ pub(crate) struct GspFirmware {
> [ ... skip 14 lines ... ]
> +            Architecture::Blackwell if matches!(chipset, Chipset::GB100 | Chipset::GB102) => {
> +                Some(".fwsignature_gb10x")
> +            }
> +            Architecture::Blackwell => Some(".fwsignature_gb20x"),
> +        }
> +    }

The match statement is exhaustive and we never return `None` here, so
there is no need to return an `Option`.

-- 
Alexandre Courbot <acourbot@nvidia.com>
