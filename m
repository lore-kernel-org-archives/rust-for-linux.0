Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010067.outbound.protection.outlook.com [52.101.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF51C84DC;
	Mon,  1 Jun 2026 02:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780279645; cv=fail; b=muyMoaNnA7BX1RLvrdOvDwsEIjih+ADfogW787K99297F5R8yZcdEZxORNPX/Y7iuUVgzywAFCtvUoG8X9H7cgdZZItBydD9j2mGjiEeXqtOTt6Cf4r4DJAIib0pbRjmWCoz9TE5am6K51+f+Nxk6sBBNCkZimnlGWWbUelQ6Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780279645; c=relaxed/simple;
	bh=cITi9w/c4UKA7w2lU8xzBRGHAxHSCpwcu411cQWyYnI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PlUQ1kXTsqtOsCrGu6GEP+OnswbnWn9MnzyvRIamBPk5ld0OUwE0KE3sALv2JnFtqPXRR4y/0bIe5Owc8/bCTW5w9lV3SbM6JIA75OEYTO7qkcfze+POGxlctySkAeMa18w4b4xN8LYYW/4af/e1N2BDn4SMcnpFgIt1W7BhZeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=df2fduBd; arc=fail smtp.client-ip=52.101.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="df2fduBd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDMccRsuyyieuW4oli+BNxxISbThVS2Sdy3j+TuhnCLGyiTKI3S5VMFxBc+H/jJYJAW5JYMsuOEGM67/fEbVopRWgSo8gkTkatbaxOyLkgScLO6HJQal+883eP2wQh2sWOsG7c4P1iDmKAtt2eMzZnOJaWC1t+s2U1oRMKqATV0tEOGXiyjfdCbyewlU2V5FVjoBa1Jz1JXAwmowwola19jSQeae0NTIFvU2WQ9Ma7MaU97OCgx8YQsfpdacsyjfbDfLmjo7yZK80jXuHSU2qLvk67Sk9gSefEPjQMYXxahAZPcwjKuT4bLLhsYP7rJY3Tu8PQJaT84bFX06mFUw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWKrgtftLgNFKpru81uo3qW19zova11XtlQi0S/Z9t8=;
 b=refm7jqCDJJhOOAs7m542DYBX5AyzOTj5RwJuPiaKWd8344GV4g6D5/u3yDgG0z5y8M7fwmpaX0T9wnUhUuszOAtDtkBslJoWOQsAVY7XrpWHWt+RNCby8eb6hFPdhmgUNyGI8eiuBDYXZddYUGUZ9kPRG/DC36BbtLPMWVfLEz0Z3rIIT5dB+g10GGgiA56s0DHUZjNUWKO/ibtb+CaP3eHPszQRyYUmmbGVs4k7idoAICeem7Ni8C2xITNbye7UR7L1+LI811VXdJBXB31RGDnKNbRfHvqIC6WEb/3R1+Byrl913RVn6ks3cOrwoD1Yc16yev/owkHtcx+lNiGjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWKrgtftLgNFKpru81uo3qW19zova11XtlQi0S/Z9t8=;
 b=df2fduBdt8ZQLc82Xde2rmtrjMuwL5bdl1hvkqldHVJBb9On0srCPGB+gMLKwKitOnppdhS1C5Hnsb8a8A4vKppRqXA2/XTxjcPEx5G/G7JfXg5cPjKZnpEb3a4hTrEr2GJxNpkSUIquX2+PTG3tAMdi/V/ZGX5ykmOkpgQE7DmG8j9v3+Tbmt+xbQylBprq0LOl1AnDQBUd5tcd5VoddhEjdKNP++uTdRxWkioncaoe4ZbZUbs6tJuj5POmFhPxr1sv++F1H/vzKwRG1PztwavQHoHIKcei3XxMBqIeavLklh60kUuWXwxvJdCcdCN+nXfKftx6jNjqqPhkp8IdOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB5607.namprd12.prod.outlook.com (2603:10b6:510:142::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 02:07:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 02:07:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 11:07:15 +0900
Message-Id: <DIXCGM5BG9PE.1ZA1O9T94CGC@nvidia.com>
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
Subject: Re: [PATCH v11 03/22] gpu: nova-core: Blackwell: compute
 PMU-reserved framebuffer size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-4-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-4-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:405:1::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c741fe-2403-4e68-4fe3-08debf8282a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	oMtMymktNBnOWQ7Mm4LrB47jQmYHEibPmjiA3TrDk6+LxXa/cUkvlh7JS/mU5FzU4YjnB4svsuETSFaOVbBUi3vqhw5tg81zpWVqG9Lyk2rUCkFB6D52JjDx+j2UrPprae3CqfuMnHIb6Zf8bUeQsfUeSRTSVNY9+tILKIZ/QY1ocTsAl6KuJ5PIFm6fQDGiAQtRIa0oFhp9N/WQKifCrrxHKZCIVWepK65CHIkEYj6MqcoOOXbeO9feItRXr76NUNPCyuVxJXIeJl2GnRjbYIa827pJiH6iJ37ZZCWXxCpgQCVXFXhFYb9kzDnF6GioUDK71YH5MrR222iG6YZOnBmJoZMkL6x/bcCSpiKm6bMwyiZPNPoEQDPZn1jJ7iYRMqHsCwr5Fd2v4zLGrhno+nt6fZIPl5zfJr2mZzEtxuPEOAYn6VoaqSjTGk6RYkhMdaBDybcfRC8HkKCnOJMdX7+CF5J3QHotdNRSe2yW1/ZUC0DwBSEYrdO9o+OS9h46EcWmxJzRbfzwv4drFdhxiTf/ViAJBkGba96wwUXjS/4A5PDU2KzyduOMNj0TtHbXS43mOR3LjXzM1afj8vSXYbEFnJu8kdgH8TGU4yt+tz5nPFPc+m/J/V+j3LbwhA9aDvIJtfucWTDZlotBjbsDbBXv+iTntSHbJOnPdMzDBsfzEzx68oIkfxFzjK84C3+u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXlwT3ArdUZTaEZUbThLNGN1bjY5Q040UWNVTEQwai9SV1JpdkRCTDdRVXgr?=
 =?utf-8?B?eVdzaDRHWEUwZ00wdWpOYWc3S21GZVZSRmxMa0lsMGFldzBZN0dQa1NBTlht?=
 =?utf-8?B?Uk9OUDRkWU5wRUdHS0M2Vjg5ZW1xR1Q2SFpGbG90Z09hNlZrdW1iRFdQQVdh?=
 =?utf-8?B?TnpNNDY3ZEVGbUFTZjdCQzh3STRNc2hkL05PelliMWFadDhTUlBCbGh1aktU?=
 =?utf-8?B?aHl5UHNmR2pRbEdjVmlSNE4yRk5sazhKZ2tNZ0JhK1VVbDZhNWJNMVBZUkVh?=
 =?utf-8?B?M2JWYkhNT2o4b2t0OENSaXZuNmFtbW1HamdIT1ExcFBRR1FnOC9vSHlaTWdD?=
 =?utf-8?B?WFRWaTB5UGc4SS9LSWk4NWRmR2c3MUw0aU1uT2NrY1plM0k3dUc3WHJQVW9z?=
 =?utf-8?B?dUlUK0wxWWFnaGx2S21nYnkyaUE2VGRMZDNxUjV1VWJ2TWpUR01aa3JxcS9u?=
 =?utf-8?B?ZDQvQmFldTMyWmZ4RzBRZW5wYndNY0RhMW10b3lNbXpibWR5d05kQW1Id1Fp?=
 =?utf-8?B?Ym1aRi9Hc0J1cFpXQ3BSUWtES3ErTzdMYURmVnF2d2crZ0NmOFMvYlZnZWdu?=
 =?utf-8?B?REcyK0xCTTdVeDk0cmxGaDlWNXQ1d3hWcHpIWktCK3ZuaFhONlREeUl3WG9q?=
 =?utf-8?B?RVpUK0s2R2EvS08vRzMwTERtcHhDTmRSVGlLdVhiVXRCbjFuVnArajN6dFZw?=
 =?utf-8?B?dGdKcVlqSU9Ka0tYZllKZlI2bXV0V3I4ajdPcW1QTlpMMGsrL015N3ZMblFo?=
 =?utf-8?B?WGIrejJ5Z3JkYzVpc0N4Tlp2a2doNElRV0g2eW9rbW84MlhZOVVONkhTcVM4?=
 =?utf-8?B?M0IzdE9hcmZTOHhSVzJzWTRRMDdkM0Z4WHNqT1dvbWY3S3E1cEJ6eFFMTmRi?=
 =?utf-8?B?SXo2L056NDRxWTIwanVyR0hBeEZRcEtHS3k3ZThuL2NDelZyRGVjL3M3a3Ny?=
 =?utf-8?B?aFYrQW00WEZlclZVTVV0ZEwrc2R1OE11NG1STXhuN04zRGhPWVNVQUFCSWk1?=
 =?utf-8?B?NTh5R3JsQTF3c1d5V29IdGdkRDVFckQyQ1pQMEdGNndxb25wOURyT0w3UkM1?=
 =?utf-8?B?b2dtOHhOeWJBaTJaRnZkZFNOUE9odDViSjhNU2hOVlF2UDFVODdVb29wU3ZF?=
 =?utf-8?B?a0hudFdTYmpzK2RyTkVkTDJpTFc5aS9Ib1FZZ0srTHp5RnJFZ2cxSEVPd3BC?=
 =?utf-8?B?TVNvSTZEK0lSTDdEWjhmdzFhV3BneVpzc2J6Y1IyNzdVSHNDeE1ka1Nxd3hX?=
 =?utf-8?B?cnRjRTZzenFhWTY5S3IrcTU3VjV1MHZzbGtyRjd5cVdpaCt4NE9xTitzemM4?=
 =?utf-8?B?eGpwMnp6WG5CTldVVFZsaGU1Vk8xTE1lS01PbzNScnR5RHl2TktnU1VqY3Zl?=
 =?utf-8?B?ZkorK3NJdWprSHhnMlpQd1NOQXNaVG1ITVZhMEs0QVVXVFVrQzZGNHFKQVdV?=
 =?utf-8?B?cDN3bThkM1ZsUDhWdk1lV0x2Q1p2YVZnRFVMdGEzVFB3T291MEpZL0IxWHdQ?=
 =?utf-8?B?STg2WHNjTTlnbytLQzdYbStkLzZqdnZMYldMTlo0TDhnYWZsUU5WM0YzM3NG?=
 =?utf-8?B?b0tTMVZmV0JhSG9LdGRMN1I2cXFwdVJKZXZ0MzV3ZlU4b3NDNWhVL3haTWxi?=
 =?utf-8?B?QUU3MFI0Um1Fa0ZDbWMwbFVScFBEZzBuNmYzOUdHM0RFMHFjNDVoeUwrU2R0?=
 =?utf-8?B?OUIyM25YMEg4cUluVy9qR09qZW5uY1R6eEZsTWt6STU0WUt2Unl1V3pLUW1D?=
 =?utf-8?B?RUZ1amhkZHdIdUlwWS9mdXQrdkJWeGMxQ2kyelJrSnlEZDlqRG5iaDFneG5p?=
 =?utf-8?B?cERROFk4QTNsZG1oeDA0ZW5wd3liZE5sd2pjckNGOGhBNzczTzIrL3dobklY?=
 =?utf-8?B?M3JadS9ncGxWT0VoemFOV09icDlJR2t6Z1A4UERsOVFxY1B5Y2dIWnpFWWxy?=
 =?utf-8?B?dmtyZ293N3grU2V1U0tPdm93dytqeDhNWTl2TFdXT2JpMnM4Y1AwdHRHVnho?=
 =?utf-8?B?dHVRa3BxWjYrTmwzUThiNnFtdUNHakdkSWRyeWp4ZVp3dWorbWFEOGJucVY3?=
 =?utf-8?B?UFIwcnY3QXNIUlJDUEV4by9UUGhNUFpRdS9XaTJZLzlDQVpScklkS25XQXlN?=
 =?utf-8?B?QnlaL21mMytPM0d1MGdMZFdKYWdja3ROcGFVc2FRS3pSZ1cyWnRPRVZCeTg0?=
 =?utf-8?B?bEhXbnZBKzRkMXlUSmozc29PZENBdDU3ZndvY1VqRENsSENvbTlhR1VjOElX?=
 =?utf-8?B?KzRPQ3BYL1hUdG5od1JoUzIzbXVEYU1GVnlZN0o4TSs4eWFHTFhRSkVWY2da?=
 =?utf-8?B?MFdvMGw4cHF6WC9GYWNNK29yM1BkU0JHSDBLSTJpZzdMT3NhMS9MWXdVMUtV?=
 =?utf-8?Q?RA/FKt6OUXSqroDUusWh7BEs5m/Ahd4U+Qp0H9AGrfBER?=
X-MS-Exchange-AntiSpam-MessageData-1: 7BGAAg5TZupylw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c741fe-2403-4e68-4fe3-08debf8282a1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 02:07:19.4778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnWPjmkwjW5RoPREvD8rDF7Ugn0E69LB1qm33jaCOdYpNWX0t54pmkZmGVbzIqlY/xaWxinyQTXjLY+oVaWFEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5607

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-cor=
e/fb/hal/gh100.rs
> new file mode 100644
> index 000000000000..c122ac2091f8
> --- /dev/null
> +++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +use kernel::prelude::*;
> +
> +use crate::{
> +    driver::Bar0,
> +    fb::hal::FbHal, //
> +};
> +
> +struct Gh100;
> +
> +impl FbHal for Gh100 {
> +    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
> +        super::ga100::read_sysmem_flush_page_ga100(bar)
> +    }
> +
> +    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
> +        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
> +
> +        Ok(())
> +    }
> +
> +    fn supports_display(&self, bar: &Bar0) -> bool {
> +        super::ga100::display_enabled_ga100(bar)
> +    }
> +
> +    fn vidmem_size(&self, bar: &Bar0) -> u64 {
> +        super::ga102::vidmem_size_ga102(bar)
> +    }
> +
> +    fn pmu_reserved_size(&self) -> u32 {
> +        super::tu102::pmu_reserved_size_tu102()
> +    }
> +
> +    fn frts_size(&self) -> u64 {
> +        super::tu102::frts_size_tu102()
> +    }
> +}

As of this patch this HAL is strictly equivalent to GA102's, with the
first difference between the two introduced by the "larger non-WPR
heap". Could you move the introduction of this HAL to this patch as
well?
