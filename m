Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013037.outbound.protection.outlook.com [40.107.201.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704C223E33D;
	Mon,  1 Jun 2026 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303095; cv=fail; b=A/5mLD2vXkbyyvqXRXgZvK5IlI9/r3fGk7JS+TPeqr7aBD9+VIEAMPWQUrnjrBWQLrLR9Wx62JXA94Y/UwZgkFiHSSZDkPO7G2BhDy/2XDeqhc1eF0BUp7Q4b3W/LFlW/MZ/crim562X39vkPL04XAgUJy4ArNvMc1GmnZSFVzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303095; c=relaxed/simple;
	bh=B/KxhU+lh8tYsMVh0trmjhgNignpn7K3JPaiiEH2Ctw=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=St3euq92iHSr26FoiuSMWpbba717zgFrO55TYhqFErzApDSHp4MErdAJ+O0G9R7tIeItLWpxF3xAS+r/ZzPlzRvA9+HxHIt6Mp3VnPA9nY6MF4lV7k3dPFNkRXza+2UcGhFyLJESp3Ygc5uWZveVhNCGen+AO9iaLnWhtnkQmu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QRzw2am9; arc=fail smtp.client-ip=40.107.201.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QRzw2am9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eE6J8uIuApba54SGXVMieEa72FUE0GaK5ml8NHh/G51kEPdsJTW2fYUOIpvbO6HQoP2u0QejvYfbIXQ1JLp0rEi7Q2y+XDDw2t39gXvMQvoXXiASzkTPGVN7vRrFLOLb1K/6g5CBksGmiYwjUzEL5hzmQH1eVcxajH0bEuUWeC1PoESfZ7qibKkjt+azBde74eYkza3qcG/L17nMynIj6sxNGSZEkGLWvWVr2khnSZoaDFbJlTi/oA+/fIadUR1/GAg+P8AGnBgY/S2a6FKv13qcuSTznfpdJcTi0pEE3Ce2wOd4nmPW3TNMsuBgSq88PpJtRIv/Tk6+CgS8f4untg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9O6oBhzToH8/ER0snjDPH4t0ZdtVwOKE+35aajExWEg=;
 b=X8mmT21l/HBhGMAXtQRhGKODZAGvyCdIlAxj4wUO1+66wnihxLqsWOfzAnYg+Dwx8PqXWRqwn2nxTE9bz327AUIW3rkY7knaFFnzbWJ21cBMg+yrx9HRuZNJaTRa+qBJZGjdxl+zxT/9Q3ZOjXjkQoYzqn2wxR3bkziCvTIK16Kaj68mX+9Ay5eqa08c6PGMy4h63/GiNE1epM4oEFnaCAlXxswYMdpdNyWLTuMa9kmZgbqFh3U4pM2UuwRJbdOfHwolJ0sC6AVmHMleWz5WlrmQKV9ftPQDah+Ba4zxZTueMDufBwTOphfhKmR3MnFoTwvWy67VoGlzSpg0UcOiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9O6oBhzToH8/ER0snjDPH4t0ZdtVwOKE+35aajExWEg=;
 b=QRzw2am9130YphQlcbH+AsOqB89k5HLceqbwk4ZSpZ9E8dT8D48mBBcCYu8+viuELSswkvtBTl8bQJxKgevnRQdVOaIM7d1QrEpebxIlC6EfbeJQC9yTN/pbGzE9SWm41e/EJ8vdLBFqNTihtYRLEkdQE3sXtwOhw/ckqnYS9O+OleVCnzdBsWw/s1mUByR48si6y1gi4/bko8BdDaNCpZu71fQ49Kp2SfgB8Wz0Mxo4s7mJaSiolL18Jsk/cjGzDsApBVKSYnRHymLMfcr/OCVY0X3AgjVPMsBywZzPAi0BKW22NQWeiZ6NfzshvjAlu5IXQHVjkAOvtEMybWgrEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA5PPFCB4F033D6.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 08:38:06 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 08:38:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 17:38:02 +0900
Message-Id: <DIXKRT8QYWJY.3AQ8DE7O9X29L@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 11/22] gpu: nova-core: Hopper/Blackwell: add FMC
 firmware image
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-12-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-12-jhubbard@nvidia.com>
X-ClientProxiedBy: TYWP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::6) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA5PPFCB4F033D6:EE_
X-MS-Office365-Filtering-Correlation-Id: 23493e30-c5f9-49eb-1100-08debfb91a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|7416014|366016|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	51RcIcXVetXhPP30nV+Y8+9xZAQrERDmPVL7nO0sfessYwJDA9LSjvetWWYgmOvwqFwcK+LY2qxuyjbXfCGttSMy6vrg761Ooy9ATTTP8LQaEHyozOFPOvm8iDqZPwVgR303GWVEblW9OR+IaZzwdO6yNNiqngSsWaB17AME/p/bVp7HHX/AZ/HH2yeo5mjo5CChFIaF7t/GLvECoVRSyLxX4eRpOEErs+7gRe9ZnlDcZyWFwFgEvKLrNHPdTp3/pKULkmYyvU9V/OikgwyK2nrowQZOfwVJTgguRrJoH5Arz/G756imx2HdSEU3QD9CbnWVdNQBRGfKzkyTJ4j/ERwYJAumumGmBBeg6GTHhjD3LqxT3lVPeVfck6ftHuw6xTsjEuwzgnmLqKIpEymUWm7TJBJip8yGN56NeutR/f04yBZBE8u68TyfC0urj056vaHnfgBswNJn5TWVEVAzpPUG+EIkn8sDrAXSQ1PM8ZSjuzN6tOwNy7vY8Zwm40RJrqGODuCBS5W6NKEADT1w8LiL1DUOAqxEnJ+6xPxK8mabC9bz40mNr1eKtqlPnQQeTJ22+U99T4NS/JKp035pG6EelutETbUjFQSMt2O2UhWuIbUL7gz7b98bJABxQ4AVW6jhpjQgOWFKbMDLDDD+Hy7dBJf5elfTizKwgGV80VHMUfeLesGkAkuvQmy654Ds
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czZUMUFoK1VMTUNpL1dZTC9xZnRuVHE3S2dkRFE0VTlwR1h1ajhOWmRvc0Yv?=
 =?utf-8?B?Zk4rUHRJMGlGQ000YnYvcDFLZ0xVQUhONHdKUXU2RU9DNmZkZmp3UytSa08w?=
 =?utf-8?B?RDk0UjUreVNmUGVQb0o0aks4bHZHbmE5dWFCV2svVnlWcksxaElseURHN0xP?=
 =?utf-8?B?SDBmZGp0OGh0U3hTTGhqaXp2UHcwRGhOUTJFbjRuQ2syWm5XMWlZcVNHQTNH?=
 =?utf-8?B?Z1FVYmtyYlRyY0M1MCthdm85ek01N3J0TUZXMmkwZEhjQXlDNjM5UDdOek9i?=
 =?utf-8?B?VGJKZ2gyVGhpVis0Q25tM2VyNFRHNWwvOFVFc3FEU0cya20yMkRiNHdLZlhG?=
 =?utf-8?B?NmdDQnlxWmZOVHpPTVIzaExMcGlBaWRQekZrejNwbFk2UmRjR2xPK1JCUUgy?=
 =?utf-8?B?Sm1xOW5LUGhUOUZQNWprOWVidHFrNG1sQnZDZ0NZQ0t6NEg0RXd5WVFSY1p5?=
 =?utf-8?B?RFY4eHlXNWp5TXhrNnJ4WloxQkp3MXdWWXRSWXJPV3VRM1pkNU9oL3YvYjB5?=
 =?utf-8?B?aDREOEttK3lZVzU5TllYcGxtTG9yeml5Z3dTUUdhcndFWStESTNpcDZ5SVJX?=
 =?utf-8?B?cC9jUTg3UERMOHBRa0QxUHMvT3Y2Z0ltaGd2bzdUdUo5Rk83R00zeEFkR1Y0?=
 =?utf-8?B?b3NUbFFDc0ZNWUwvRGYvMktla3ZoazNyUTA2dXcyd0ZaY0psd0ZNL2l5K1ps?=
 =?utf-8?B?czhUSkNQTHl0UWJBYUFuYUEwY3VER1QxQW1MaDQwTGxUNUtob1RlTWxhUHlH?=
 =?utf-8?B?akVocFJXNkFXTG9qZis3R0NLM1ozRlkyQWtBRTJrOFFVdG5jeGRDeWQwUXl5?=
 =?utf-8?B?eWJFNGxuTjk4aGxBelNqTTFMK1hPWTEra1BTUlI4Mm40dEJmcGlBTmJpVzNh?=
 =?utf-8?B?Y0NTaW05cUJJdzJYZ2VKSzFHb3A1ZDE5cjNicTFVUTQxSGd2MkJhTVBoeDhC?=
 =?utf-8?B?WkJFKzdtQldncUJSTW9sL3o2K1pHZnE5eEs0NTdnTEdaMW54YVVTdXZhWTVC?=
 =?utf-8?B?VHUrMFc1Wi9IRmVicS9iaG9DS2RIYVB4bE5MZFZUM3FlWEZJb1ZZbitTQkRl?=
 =?utf-8?B?SWVwMk1peXlGNEtzQzh6eEp6SE9UY25lWXJKdVJHTE51WTdMdlhlQk1CeXVN?=
 =?utf-8?B?OWorYytqYTdnVTRNWFV1a3o5Qm40ejc2dlNkSTRqaEVNTzVNNk1JV3ZlYTYv?=
 =?utf-8?B?b1p4TXJMZFBVdmIxN0I3M001c3d5S1orRDE2dG5zaVFDenRFY01ybFdhU1c4?=
 =?utf-8?B?aW5Gb1lDYittY3lidER6eG1tYzhMRE92WW5YUW5tRHowVloyelF4NGUwWndl?=
 =?utf-8?B?TFJ0TkZlaDJaYU5sS0xCckpOZmFCcFRJZ0sxaXZnOGVLK0JFU1oyZ1VqdS9q?=
 =?utf-8?B?cDJuZUIrdW51My9xVTVWRGI2YkdwdUtoSGV4MyttTnFVcDdncXRwMExEN2Zz?=
 =?utf-8?B?VzBOaXQyT1QxSUVYR3N2RnY0QTFWN3EwSzJZbFY2dGlpMWIrdnpReXhCSm90?=
 =?utf-8?B?b0MzMlBWWm4wdlUxbkdHYWRWRzk4dGRqMityS0NoQURXOUFDb3I5WHVYVGFO?=
 =?utf-8?B?bFdaaTEzWjJnUXlzWWhqdUx6RDR2WEZjSXdaN2Z0SVhaT0h3Rk5pb2NYQUUw?=
 =?utf-8?B?VFJLNjQvSis1b0ZxYVhmbjFEa3VWdzdsdFJVUEhiVEhwR0FOZjNxMGV3S3RP?=
 =?utf-8?B?K1NwbitMeTdXRDBDVVhaWGFJdmJ2RHV2cnFSdG9ZREcrT0twNjhtNEpRMnM0?=
 =?utf-8?B?ZjRoMVFLRWZ1VXF2OGE4ZmhKOTJVVmJ2b09QbjRWVXZKV1VpNENBdTFrVGhp?=
 =?utf-8?B?MnBEb0lVTjZ1TmdzRVlJYmdqRmNWRThpOUJ3NE9jeHdUeGI2ZHRQK0dIeTZX?=
 =?utf-8?B?V0lIcHk0aXZNZHRrMjBVdFB2N2Jxc05sMVFQa09WM3NVQ0FETWMrWG96OXNh?=
 =?utf-8?B?UTNqeDV5LzRNdnAzV0YxYkVoY3dMNStIcWxmN2RGMDkzOUJld3JYREdTaEtY?=
 =?utf-8?B?L3RkK2xIWWdBZXRONTgySkVKVnNpOWhoR01KTU8zeis2RkNBZU9NdktEbzdj?=
 =?utf-8?B?YTdUdCtyR0hOeDhJTE9vZUpMaXJBVEVUSHE5dFFXRC9ETWJoVVlrMTV4QW9t?=
 =?utf-8?B?a2dWSG1EYkJibzliUnBHdFJoZVE5bHV4WjFpdFVwcXFCaGtiR3REci81S3pH?=
 =?utf-8?B?NmxWSW1LMGJ5L0dSR0w5Nk0vSzdtZ1hCUjNZTVhFUU1MNDNpV2J2dnk5SnQx?=
 =?utf-8?B?cFNWTkxZVXRkRnA2VVl1cnZsV1RsckQxV2RTMGVUbS9oYXlzeUdncnVUWUFE?=
 =?utf-8?B?a2NFTmV6S3lRQ0FxZ3h2UFYxeWxlRktYWHBKRE9iNXpOWXFlbG9JNlFZb3RV?=
 =?utf-8?Q?oKJuLwbjWexjazEZ7KV81upaDq0TDkour65zRLxQsWZtk?=
X-MS-Exchange-AntiSpam-MessageData-1: WuMpR8KlYpceQQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23493e30-c5f9-49eb-1100-08debfb91a4d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:38:06.6054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSXwe1sm6KDZ+o+931pjONVnRoI4/W2zDzcAQ9WP8Zj5tpDkcqL21srWlaWfsa1D4qmKeUvsOIymO3AGNyxr7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCB4F033D6

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> FSP is the Falcon that runs FMC firmware on Hopper and Blackwell.
> Load the FMC ELF in two forms: the image section that FSP boots from,
> and the full Firmware object for later signature extraction during
> Chain of Trust verification.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs      |  1 +
>  drivers/gpu/nova-core/firmware/fsp.rs  | 47 ++++++++++++++++++++++++++
>  drivers/gpu/nova-core/gsp/hal/gh100.rs |  5 +++
>  3 files changed, 53 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 866bc9b3571e..6edb50b83a29 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -28,6 +28,7 @@
>  };
> =20
>  pub(crate) mod booter;
> +pub(crate) mod fsp;
>  pub(crate) mod fwsec;
>  pub(crate) mod gsp;
>  pub(crate) mod riscv;
> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-cor=
e/firmware/fsp.rs
> new file mode 100644
> index 000000000000..011be1e571c2
> --- /dev/null
> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +//! FSP is a hardware unit that runs FMC firmware.
> +
> +use kernel::{
> +    device,
> +    dma::Coherent,
> +    firmware::Firmware,
> +    prelude::*, //
> +};
> +
> +use crate::{
> +    firmware::elf,
> +    gpu::Chipset, //
> +};
> +
> +pub(crate) struct FspFirmware {
> +    /// FMC firmware image data (only the "image" ELF section).
> +    #[expect(dead_code)]
> +    pub(crate) fmc_image: Coherent<[u8]>,
> +    /// Full FMC ELF for signature extraction.
> +    #[expect(dead_code)]
> +    pub(crate) fmc_elf: Firmware,
> +}
> +
> +impl FspFirmware {
> +    pub(crate) fn new(
> +        dev: &device::Device<device::Bound>,
> +        chipset: Chipset,
> +        ver: &str,
> +    ) -> Result<Self> {
> +        let fw =3D super::request_firmware(dev, chipset, "fmc", ver)?;

Do we need to add this to ModInfoBuilder::make_entry_chipset?
