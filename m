Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013005.outbound.protection.outlook.com [40.93.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FCE2BE7AB;
	Fri, 17 Apr 2026 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776435884; cv=fail; b=WOjLBSuul5vaA+1QJBGaVlNK8dFVjZuRRv9eubEyA3gJfH+7a9pn+LoNhb0c8c19AWxK3hWfX/7ui0CPiHJesDKMl2tJGkW6fe+HDlvaqXwr25cZ8raSr485J7G+4OZ7g5IU9x4pV+iVhiCMiDuOsJb2eHCSj0nA2SKfbB203Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776435884; c=relaxed/simple;
	bh=FtT4pAhXbxwEKKE1HQAC17yRu+8QKzzxuuJvpalidxQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VunLu/E2ZbbiBODDJEpHa8ucvUqlCA+m73ZHiPwBJSBwG80A6cke4LXWyAl2otTBhMeg7zzl8rs/rZyAYWcn75s7sbKo4TxH5qWOdWxaWuHIySpYB7za7BIUk6vmeFpnnLEDH2DSNw6jMIlZa0DaFT89pGyFtX2UynXHl3f8+Ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WbhMbjaf; arc=fail smtp.client-ip=40.93.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WbhMbjaf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVNZo5o9mmo4+g9wqikp0lXNvyTmWNwCuqdhmUPOYQYP+Tf9jlmVSf9EZT3b7UXmj4/FM0HlT69vo+/DnmSaIpVwI/Bn4I862joSJMg6vVAeSgTYqmiJfygiGvG8i4IPaAaliMVBIYIOn1g76Cokik+owpaYHQagM7eUga4TbDJ9ulaq6rBV+mjQQpDAS4oyQSXk6HWYL+sMWyBmmDmnozdx8NVol5Y7Cnk4D8ro05BpnDsDx/Xbu/OX4BNiBmdG9t0AS49vb7StN7dCmpRkK5JlCQdS3RDeLde5Z6M+HdedxwR0+nQi9wygkhQJdS9DZMR3Yt+lq9VKckkOSRhw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtFSdeWq722Oc038pY4ee5WOJL9nTAqh4vlCB79cEVA=;
 b=ZNW8Lq5J1U4rLKfCpJUruRSK9UpTFAXR0HSrtdWxqsHezPszEzfZnuuxdvDZTQQlritadxRNgQPX3IAy/xVwJowpKDZZJE1R5Fakuu5pM4HEd9EAyo3YUQwWznzcGbUfmJLAdrKz5p+cAHc8MZc4sxDua/t0ncqTe9Ja4sREOtj4fP1IH6K8/ZGkG5un9noMCzL3ApffSJfKvH19n8MsYCSzFR7UApZswyze/3enxZrWNEs469M08M/Hjjw+HmvtbRxyajgdtFRHKIbmCTzwPPvuaPWNKCz8PUbjfQYFu8rKyK0ZLvjAcAveONdLI/ubvvJalNbGBdoz9dekpvKLpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtFSdeWq722Oc038pY4ee5WOJL9nTAqh4vlCB79cEVA=;
 b=WbhMbjafUnKyuZ9uqwW8E55Xsx6uYQ0iSYELwMqSzDWiVxhQnr94bwcAIkwRBWWI5NOCB8VLhKL1MM/rfigEvfP3S6vsAzOXnLpTv4PRXE+Pg5lRCPP3nPzHBd8iIWVhmMk6I7EVpTAF+XsCbt+AO5S/TjehBGaqLOZatdD9qJMJbAmY7nHcw+O1+RzKw7es96OypCyJu+5TecLdtkl3nmiND0pyeZeazp8dG+CLZ7p7fmyQ/tPX86FYuf5PN7iEtj5xadS8JXgDRv0V5sauyHQuL3pdDQR38/XQaAGCSr/ezrfZLrcfVWN/qtL2CBJVM3CGIv+Pp6tKv8SQl+w0/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8135.namprd12.prod.outlook.com (2603:10b6:a03:4f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 14:24:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 14:24:38 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 23:24:34 +0900
Message-Id: <DHVHYMGOZ58F.2E1GSYX4L27NU@nvidia.com>
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
Subject: Re: [PATCH v10 18/28] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-19-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-19-jhubbard@nvidia.com>
X-ClientProxiedBy: OS0PR01CA0172.jpnprd01.prod.outlook.com
 (2603:1096:604:26::23) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: 604ba000-e513-4fbe-acbc-08de9c8d0e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	s1NwndkXCxYqVfpK4iIanDEyCAoKWZMzzQIPTuzVL2Jq+z/kqRI3WtAyUvvlBNWnBYRRc3kEBXKt22FaYRWwAIPf9SHxG3aBWB2l+16u3Ge8RymLN5vEZbqx5z8Z4VOuj+jjcB03L9gr1biN/r4Xf7fpvj2LOy720PSbMvXFG7tJ5puA+YjtBIZ8OFYdx8OV4RkFugjcztZ/OMTySPwP7pDlmegVIACezr8iuFhbtdgMmhQXVAyZHu5jknWL9VZtF2yIKldX0HvRrIhhkM9JK8VGHp+JlTDL/5B7fBlRCafg8a8mkgTSl1MXbvywlIgC2+ZnF6zOZf45X5A6g/TmiC7yu/OhC4ODSsVZu+13XL4/JuekXjbzph3m5xtxkVqlA7Bqvu09cSHuCv3xn8vMFYxWwLg+wOn/x3PDB172sHbC4y2t7mmY/2WDgLgd3dNycVI+qbhVBbg28zRflhVOLG/6JKFXc6wVXjz+lUZBHgEdZDbWOBG8X7O6XxLVbEGOs0tGE2hDojoXyWb2vX4sG1B7P4HiUJCkXzNN1fhtwPJE8+lcrWnDhuj8pOdrkP/RvMteSPI0Vuy7alZRkXFbmuTR0/MUTVuqcDNEukJf7ucmT0e5OvMT9yMNJjIY5/CtWHloLMG8LcUhVV5c4z/w9zfwueVCHmJFYWrKCgwJ03wwbWpRruj6N6QEi8SYi6xllPHo6Wk/zaQiCvyRpSZd+/dA3mu/fnuWp06lHuYcth4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXNKZ2dQSk5FVXZ2K21KYVhzZm1EeE5yYkk4RzZGKzJWc05ZWndMRHN1Szd3?=
 =?utf-8?B?cDJoRDM0bFQxS1lEc0d2V2dYall5QzYrd1BPaXJsRVpWV2E4eFBVQUZxZ0xD?=
 =?utf-8?B?Rm1UVTUrY3liWGtxbXNRRlRCNm9QRllKcm0xQnVndGlvS3hxNTFVclJ4M1Mv?=
 =?utf-8?B?cnEra2RqTWZwb0NoZXM0eTFSajRYanFjWVNsV2pFQ3FmYUZzTTVBMkwwWnI2?=
 =?utf-8?B?Z0pUdU5MUVJBSVNuK0Z2azVGU3NNdWdiVzl3TnJIUmgyZDVWaTN5M0ZzSHVW?=
 =?utf-8?B?c2JUU3VpczZPM2xsaW1sTlc0R0liMEFRVzcvN1V0ZjVqREFkS3BlRlVUeGFh?=
 =?utf-8?B?eDFZWjJqT2Z5Y0hpVWJudjgzeXJyTFpwMmNHSjRIOFpRMkdKUkY3ZC90SmdD?=
 =?utf-8?B?TG03UlNNakdlOHB6dHdzdEdwb3NMbmliWHU3N2s3bnBSK3ZOb3QvZmZFTGI5?=
 =?utf-8?B?OEFsV21CemI0MFZrR3R3RzI2TWN5bkErekIrczNkelBPZDJrL1NGWU5aVXJy?=
 =?utf-8?B?TWdMQm0xUVhSRlVsWHB3b2dGWHpSRndHSzdWTy82ZnVUc205bmxQci9XM1Vn?=
 =?utf-8?B?Z0dIUG4vcTczR0d1WVlYVndaNDZaR04rQ2pXS0xTTm5ZWFgxY1pqNFNHMUsv?=
 =?utf-8?B?L2dSbXJmWW1kL21wVEJ6djJQWkRJVkc5ZzEwVlpNQWg4U24wbzd6MjRyWVJN?=
 =?utf-8?B?WmxSR3I4ZGVIS291YUM3Y2hJNWd4ZlcyR3h2aWhuVU1Cd1RyaXhzaU0rS0ZU?=
 =?utf-8?B?VDNNL3drZG50ditsVm0vMWJzalk5M3g2dk5pUVA2aUZnOHZ2S09oRkQ4ZFJM?=
 =?utf-8?B?dmhablRRcjk5ZUYrRnJWMWc2bG9NZytMZGtjRG96K2lQZjEwaUVDUXpaZE40?=
 =?utf-8?B?S2trQ2lYdTdLYUJxZHp6V01aaEN6Q3VqTDNtVUl2ZHNCcGxYRmxybHo5cENs?=
 =?utf-8?B?NE1TOWRjY0FHSDJNWlFMaFM2WEdBWFJ3Nm0rcTNkNG5LTmxsb2VEUXd1MEc3?=
 =?utf-8?B?dkNOOXlDaXlhblIvYyt1Mm9obXpBZ1RNbEdIbkN6K3JWNXYzbU5xTVFhQ0E1?=
 =?utf-8?B?TlNqRGI4d3RycmFNZ3ZWMHdVTnNQSXZXc0NJbjhYR2VnM283bWJkL21BT0d2?=
 =?utf-8?B?UU5VNXo0ZEs4cHNSMytpbGhWZ2QxUUptaW41a0NzeTVoKy9SMDhqN1Y2eGU4?=
 =?utf-8?B?Z3d3aEh1dUk4TXlheWx3bmtYRGxJUFBqU3Z5K0U0eWFDUVk1UlZFRGUzODA5?=
 =?utf-8?B?WDJISXVEaklQUU9uWkd6UHVyMTF2aGJsTFI5NnFoeEllNWJrUnNLNlRwNnlW?=
 =?utf-8?B?WUw0SkZrclFvT1ZXNzJTZ01uR25mUEMwdEVuRkRjZFBOMEFHY2ZERGwrTCt3?=
 =?utf-8?B?clU2RXpQdFVFVXp1OUk0cjZWU2NmWU9kTjk3dEpmWVhTeExzYlVjUUJkM1VR?=
 =?utf-8?B?ZFZ4Z0F4dld5MzJaRVdtY2Qwb3FUb2N0NHNWTjQyRHFuSnhraGswODVuSzdo?=
 =?utf-8?B?dVRYMnV6TVh4VEdLdXh2YThrZ095Y2FKUmhvbXdzcWJhMXk2RzFxQ3d4RUJp?=
 =?utf-8?B?SUUvZXdMUStZaVBOY0g0WTFiT05OV1gxQXNXT2F3MlNzTmczZHRIOExOd2NN?=
 =?utf-8?B?NXhON2dqNjVUVFIyUXZTbzZwL2xOQkIxNmJNL24vTis1WE5DNldkMXdyV01C?=
 =?utf-8?B?djg5Z2hxdHNRVXNkTVBxNHNvRUhNbUhBUXAwRzZVbGNKQTNUTGRNQnNseTls?=
 =?utf-8?B?ckp5cmQ5eGtFU2JrTWR6NTVTMmM2RFN2ejYyci9RcmlXeVdNSUVqQW8zTTBv?=
 =?utf-8?B?V0gwYnpNeDhndmhjNy9sU0QyWmN4azFpR25kaCtVZUZPZCtSSmw3UTZJSk9F?=
 =?utf-8?B?YUlORzZoZjlYR25sZXp5aTBqdHhFL0pYS1I1M1NveUx1WGRsYmtZejNsbUJm?=
 =?utf-8?B?dTJqaFBuNjZSNmRiUXF1b2dVcHBmbnNpb2NkOVJwZmVuQXpyMjhWbEwvb1lG?=
 =?utf-8?B?RzZmdUw0b2t2K1FXK3hHYU9RMWpNVHBVUjIrUmI4enpWVW1MTHZSME1kekE3?=
 =?utf-8?B?SlBvU3I4VFlYMFRTODFSTmoramR4Y21oNFpreWR4M1FoK2d5QmlhQk9xc0Nl?=
 =?utf-8?B?b3dpRUw0dnBBa25ieXJTNXpoQmlEVXdoY2I2TktBKzZtaTZEeXNBRUU4clQz?=
 =?utf-8?B?U2kvcEQwcXFFcXB3bmVRaDNRM1A4akd4WjRXOE56Y0xOZ2ErRmlqazM5TVBT?=
 =?utf-8?B?VHcraytKb3dHZkRhQVExQ1JRd042TEdML2RwYkVXRTZMWTBQMnNoSDVFQkFC?=
 =?utf-8?B?M29jOVpLSUdjenlvYkJod1VhUGZobVlzTmdQSXlLa1NPVitTUEw2K0xyb0Nr?=
 =?utf-8?Q?jiNz4nQ9h8+TmkNmT3IKL1ZvIwfi7Rvm0MmgOlWkgF11K?=
X-MS-Exchange-AntiSpam-MessageData-1: um0KOBZXNP4H2w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604ba000-e513-4fbe-acbc-08de9c8d0e7d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:24:38.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69rGwXgGEOAHQoFXBVbCIBy7i9wrVRa7xi9p+2mWywasCjLWPKirH4TXeosniR9HK+AOEd074AZ3Y8w+qVYPFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8135

On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
> Add extract_fmc_signatures() which extracts SHA-384 hash, RSA public
> key, and RSA signature from FMC ELF32 firmware sections. These are
> needed for FSP Chain of Trust verification.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs |  3 +-
>  drivers/gpu/nova-core/fsp.rs      | 78 +++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/gsp/boot.rs |  3 +-
>  3 files changed, 82 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index bc26807116e4..6d07715b3a49 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -26,6 +26,7 @@
>      },
>  };
> =20
> +pub(crate) use elf::elf_section;
>  pub(crate) mod booter;
>  pub(crate) mod fsp;
>  pub(crate) mod fwsec;
> @@ -646,7 +647,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Op=
tion<&'a [u8]> {
>      }
> =20
>      /// Automatically detects ELF32 vs ELF64 based on the ELF header.
> -    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&=
'a [u8]> {
> +    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&=
'a [u8]> {

We don't want to change the visibility of this method - thankfully there
is an easy way to achieve this - please read on.

>          // Check ELF magic.
>          if elf.len() < 5 || elf.get(0..4)? !=3D b"\x7fELF" {
>              return None;
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index 55e543e80de8..8287bda795ca 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -18,6 +18,18 @@
>  /// FSP secure boot completion timeout in milliseconds.
>  const FSP_SECURE_BOOT_TIMEOUT_MS: i64 =3D 5000;
> =20
> +/// Size constraints for FSP security signatures (Hopper/Blackwell).

This doccomment is about the 3 following items but will only appears on
the first one. You want one doccomment per const that reads something
like "/// Expected size for X".

> +const FSP_HASH_SIZE: usize =3D 48; // SHA-384 hash
> +const FSP_PKEY_SIZE: usize =3D 384; // RSA-3072 public key
> +const FSP_SIG_SIZE: usize =3D 384; // RSA-3072 signature
> +
> +/// Structure to hold FMC signatures.
> +#[derive(Debug, Clone, Copy)]
> +pub(crate) struct FmcSignatures {
> +    hash384: [u8; FSP_HASH_SIZE],
> +    public_key: [u8; FSP_PKEY_SIZE],
> +    signature: [u8; FSP_SIG_SIZE],
> +}
>  /// FSP interface for Hopper/Blackwell GPUs.
>  pub(crate) struct Fsp;
> =20
> @@ -50,4 +62,70 @@ pub(crate) fn wait_secure_boot(
>          })
>          .map(|_| ())
>      }
> +
> +    /// Extract FMC firmware signatures for Chain of Trust verification.
> +    ///
> +    /// Extracts real cryptographic signatures from FMC ELF32 firmware s=
ections.
> +    /// Returns signatures in a heap-allocated structure to prevent stac=
k overflow.
> +    pub(crate) fn extract_fmc_signatures(

If you make this a method of `FmcFirmware`, you can keep the current
visibility of `elf_section`, while also simplifying the caller (as it is
only ever called on the data of a `FmcFirmware`).

> +        dev: &device::Device<device::Bound>,
> +        fmc_fw_data: &[u8],
> +    ) -> Result<KBox<FmcSignatures>> {
> +        let hash_section =3D crate::firmware::elf_section(fmc_fw_data, "=
hash")
> +            .ok_or(EINVAL)
> +            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'hash' =
section\n"))?;
> +
> +        let pkey_section =3D crate::firmware::elf_section(fmc_fw_data, "=
publickey")
> +            .ok_or(EINVAL)
> +            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'public=
key' section\n"))?;
> +
> +        let sig_section =3D crate::firmware::elf_section(fmc_fw_data, "s=
ignature")
> +            .ok_or(EINVAL)
> +            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'signat=
ure' section\n"))?;
> +
> +        if hash_section.len() !=3D FSP_HASH_SIZE {
> +            dev_err!(
> +                dev,
> +                "FMC hash section size {} !=3D expected {}\n",
> +                hash_section.len(),
> +                FSP_HASH_SIZE
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        if pkey_section.len() > FSP_PKEY_SIZE {
> +            dev_err!(
> +                dev,
> +                "FMC publickey section size {} > maximum {}\n",
> +                pkey_section.len(),
> +                FSP_PKEY_SIZE
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        if sig_section.len() > FSP_SIG_SIZE {
> +            dev_err!(
> +                dev,
> +                "FMC signature section size {} > maximum {}\n",
> +                sig_section.len(),
> +                FSP_SIG_SIZE
> +            );
> +            return Err(EINVAL);
> +        }

That's quite a bit of repeating code. I'd like to factor this out into a
closure, but first a question: the length of `hash_section` is required
to be exactly `FSP_HASH_SIZE`, but the other two sections are only
required to be smaller. Does that really make sense or should they all
be strictly equal to their expected size? Because AFAICT 384 is the only
size that makes sense for them.

Assuming we can apply the same length test for all 3, you can replace
all this code with just:

    /// Returns the section `name` of size `expected_len`, or EINVAL if
    /// the section doesn't exist or doesn't have the expected length.
    let get_section =3D |name, expected_len| {
        crate::firmware::elf_section(fmc_fw_data, name)
            .ok_or(EINVAL)
            .inspect_err(|_| dev_err!(dev, "FMC firmware missing '{}' secti=
on\n", name))
            .and_then(|section| {
                if section.len() > expected_len {
                    dev_err!(
                        dev,
                        "FMC {} section size {} !=3D expected {}\n",
                        name,
                        section.len(),
                        expected_len
                    );
                    Err(EINVAL)
                } else {
                    Ok(section)
                }
            })
    };

    let hash_section =3D get_section("hash", FSP_HASH_SIZE)?;
    let pkey_section =3D get_section("publickey", FSP_PKEY_SIZE)?;
    let sig_section =3D get_section("signature", FSP_SIG_SIZE)?;

> +
> +        let mut signatures =3D KBox::new(
> +            FmcSignatures {
> +                hash384: [0u8; FSP_HASH_SIZE],
> +                public_key: [0u8; FSP_PKEY_SIZE],
> +                signature: [0u8; FSP_SIG_SIZE],
> +            },
> +            GFP_KERNEL,
> +        )?;
> +
> +        signatures.hash384.copy_from_slice(hash_section);
> +        signatures.public_key[..pkey_section.len()].copy_from_slice(pkey=
_section);
> +        signatures.signature[..sig_section.len()].copy_from_slice(sig_se=
ction);

If the size assumption I make above is correct, you can remove the
slices on the destination.

Also note that `copy_from_slice` can panic, so these statements should
have a `//PANIC:` comment justifying why it cannot happen.

> +
> +        Ok(signatures)
> +    }
>  }
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 9609cef3ff51..739624af1cef 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -208,7 +208,8 @@ fn boot_via_fsp(
>      ) -> Result {
>          let _fsp_falcon =3D Falcon::<FspEngine>::new(dev, chipset)?;
> =20
> -        let _fsp_fw =3D FspFirmware::new(dev, chipset, FIRMWARE_VERSION)=
?;
> +        let fsp_fw =3D FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?=
;
> +        let _signatures =3D Fsp::extract_fmc_signatures(dev, fsp_fw.fmc_=
elf.data())?;

Once `extract_fmc_signatures` is a method of `FspFirmware`, we can
remove that new line and pass `fsp_fw` to `FmcBootArgs::new`. It is
more logical, and will allow it to access both the image and the
signatures from this single argument.
