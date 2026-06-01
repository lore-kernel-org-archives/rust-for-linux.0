Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011036.outbound.protection.outlook.com [40.93.194.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179843A05E5;
	Mon,  1 Jun 2026 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325163; cv=fail; b=VWIWwQZ+6TFP169/q+4gqhhuFDuIHPeRJk1rsH7q2FII4Cs65VZKnizcWhUZDzXVMZ3ZhB/h8gc8SZYJF6nOPvENiC/zQP/WbuAEEQljrqRUwDqXIuqrV7iCDnI+msuGSemTIdFxNUmhqlTZ0/+elrZeuE6N5aJA5GnshkA90uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325163; c=relaxed/simple;
	bh=gUUBvtBm1SZhy3lY90GYa+XLUgpI+hkNMjIcC/veCDw=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=FVegCr0r+oSrHfrpwLkGSB4VDOoc1wiX09OZ9iCC40jJjD4h/ho4Tgoyr+yq35/EJubZWiFGfYqxC6zFPnkMV1Om2/tC6qoOB6BxrNnN71IayKmg7c29CZizRx4BI+p8MysaG6hnnm6KNaw8dZ7Cc3pVww1VSZhCp68nPovh1Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JR4wSZ2a; arc=fail smtp.client-ip=40.93.194.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JR4wSZ2a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tt8lvM7kJsWmi880ryLP1iJM3uByF8tpMALSKIoPcyVzmk3JO92cdsuZ8yxB2jr+dx47yFmHpbFLas7ETzadtSGkywo8i5BXWei7rVMvlPBuWX6oaB9AkO0vreVAowMOOn156zWOq5gn/dplXTP1gNJ7cnDI04jQcVaP73njGMY7bR2iqkuyD9KstDOmBNgY9Lhqdhr8ILlAvGb1XVkyrkVj3DMm5MneWnBRyMIoDmCtO1SV0ywl1hbCz97KIiYRmsau5WPNfuJsY3cgteSt/ydOth6XNouRr3UzpYSNKUGKTaT2v+nTbKMEHKzX4EXg4TSXDjNHRc4E4d1+1+P9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWKsR9GQ5BQMlheN0pIWIkfM5+u8O+XN5S6xTRKQlzo=;
 b=KvfEYPBOgK/tmkvd4N8SRLEGpVTHVVoG5UmPcCESP+t2sgGL2KeRNhsuSix1AQvhnmVYxYKlo6Z54rlJnLMLnJOgaOR6AAzkn2gKNC7Jx9muKzn6EIKojPjWr7l4mNzeLdLYQbyPTxCrjMHE6kkScZ4mKRXjOolfj/1JV1VgKbTNKlV/2Jsi0vJfS9YW3fm12+FBbckGtGyVHvXW3Xb2tbJc1g90GuRsmZscAgTa9tLgVAZhlrSkcYO42M9w6rCMgusztazjuIUBHCB30VLy4TbyHpDK6AUh8PCV+fgAXaeZ1TX3JAKGOK7lRqkwGbkQn1jFfkqt8ZRQ0c0EKMimRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWKsR9GQ5BQMlheN0pIWIkfM5+u8O+XN5S6xTRKQlzo=;
 b=JR4wSZ2aUv/JCiAN/mW15oftXRhrTwcOYF3u1/9yW0PIIJfXJc7vTiXrh35tmDnYjZxfNlg6YfSo/SNhGUUVQzHuM9HikuIlwtnkk9pVD7G9rQOxJfjXV2uBhIRpfkXa+ZpHV61hdBafsj0ef5pVO8A74d0dQ5FzbcMa1ngz84dRtGOZs+uKgAaN861H2vatOOf/kisFfSGnMuju2XTmOhFfoADGgjKldlu+jhYGs/dgxc3EXp6i0C+GfoGAPxp1nQ/VdpkI0c4RB8YvsGp3BW06AvhGVRc3S5rlQS4ziJTyQFt1O/XcHrVfs48iOlKy+8BS1sOy2cU5RCykj6FH2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8311.namprd12.prod.outlook.com (2603:10b6:208:3fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 14:45:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 14:45:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 23:45:49 +0900
Message-Id: <DIXSLENUBALG.8QIP71NU6DM7@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
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
Subject: Re: [PATCH v11 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-14-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-14-jhubbard@nvidia.com>
X-ClientProxiedBy: OS0P286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:b0::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 429a19ab-d8b4-40a3-5dc5-08debfec7b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|4143699003|18002099003|22082099003|3023799007|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	pjy9/+cIuGhgBdq1dQbVP+V62vxzD76zNcl8b7zob5F6YUONSw15mYLa+Nm6CKQkY+fozUmPoT9ONduK30tDLjRoB9aswWICUSen70T5tByH/sYDqDhMPiJhQOyI9BxfzQz0u0AM0I4S+nJAvcKwmNXI/8GiXvXkWcv5T2s4JNfiXGvJaQx8TAB1vg79DfkD7yev4j+vOrsoJNu+P96yG6jcNA6gtMN2V1VpkdzsghBwTf2jUIBOGorYK6oXW/YglCtzZyvk00D/breT//jGdwomYPoR1PfXA9cZunbvHEB3iQ4BC8bANdZ7uUWsdfGXe72C0eK9HOiYfa7Q7DL7YFHdTnxSWhl7MS4Nbp62yzWdO9rQcoMB2n8/ph83ChfN2sjQ1VsHOztwYHDxiCFQVn/uFRFJxyzZAgfxnpQr1b17UIUo3am/u3ncIJm1kihEqQ3HEkCCB4l5hfXiQysiOCcMsJHjwJDCHOy1QHDBI95iUEmmd3Uu4vEUNfWlarru+n/9lLUNYeS+/TGDkC0nZaug32TcIT+IvxLSa3ODw0CexF6GGoAAeT+2vhE1oZOn5JEoFyLXHeU9Kxs80NovWqSm/P3uz33aWE9dIoVCyvdRxrPB0PUWpM57vK3cKiV/ndIrYlU8sPybjh+PxiTVMg6qDVOnzMbUj5Kyih7a/MVK9YCT5z6w+ZyUy2MgddTd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(4143699003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGdZOXppakw3QWR1aC9uWHFQRzB6dldDT0JpOGRYRktjaUFtZVArMGxJTHpq?=
 =?utf-8?B?S05MYTdRd3lDZ25McU55emZCVzVETlNjZlJYUkJ6TVJWYWhOZlUzbGVUR2tX?=
 =?utf-8?B?QnowcHZMbHZmWnNMQlI4TEd6NWt6TTM3dWFTVm1iQm9FMFZiQzVkcDVJSkRD?=
 =?utf-8?B?dXRINnNxV2Q0TWs2dExlenB1NUlRZlo0WW1mSCtIVnVjQnN1RnZoSlhYbGU0?=
 =?utf-8?B?eG8yMXNDbENNRUgwMG9vYUJFQ1pmbldaWWw3dDQ4ZTVrZGV5Vk1lU0l6ZUw2?=
 =?utf-8?B?OXZUK2RPL09jRFFaRS9melZiMVZiYWpwVTY1OUkxRFVQZUR4N0laWE92SXRy?=
 =?utf-8?B?cWREZkNXMzdvekx3MUhRQjZXY3lqdExmeGU3VjVRbG9GYTBRS0hJS3VFYmFP?=
 =?utf-8?B?bUlYYVd2bHk3Q2xVMEF4QUJUWGxjZWUvUTkzN0swaEtxWVlrT3Fjd3hFT0NS?=
 =?utf-8?B?bHM4aXdSb3NIV0hqcDYwM2VHRXNnUWhIUC95T0RNUklFYzZKblVjeTBPYXZX?=
 =?utf-8?B?TWdkZkV6NUdGY1RXcUh6WjJ3RWdzNGlPQ05HRTlrVUYwbTJsV05kRUdiYmhz?=
 =?utf-8?B?MHIxekF5Mmtab2pFbmlicnZVYmNlY3QyaHRpd2lDdGhiNUpFeVlpTXBwNXcv?=
 =?utf-8?B?QjRUN2VmZEM1N0laMFRyT3R3bW9qRjZoVDZYS205SjVUZU0zckt2aEhFT0xY?=
 =?utf-8?B?KzVib0kzMFBCNmZYTU5nVno1L0RRTDZhcmVZWFV6QWNjbklPbElqOEFQRFFZ?=
 =?utf-8?B?RkpiNVFCSlNnVDhwejNJbHNaVm0rRWVURXpaY2NqQ3l3L1Q3SUYrUm5KZFAw?=
 =?utf-8?B?Vk9taUNXMW1tcWwrU25SR0x5UDcrOGk0K2k1R0JVZVBuYTVqT01VdXJWMU9I?=
 =?utf-8?B?UmdFSGFrOXpEQ1lmMUtHbHNKSXE0a0N5QW9IQjZuUXlNNjhwK29xbjhtRjBL?=
 =?utf-8?B?M3licU5JM29jcDN6V3pnVG40Z2JqOVdQWmNoVXZjSkpZMnp2ZCtFZ3p0Rmx2?=
 =?utf-8?B?MGNPM0ZBbmlUN3p4bGZFSVVoSHVrK3RGZTFPVC9YM01KcGdYMDQ0S2JuQUJG?=
 =?utf-8?B?bnJjUHRPUXJ1M3JaKzg4ZG16UHhhYW1iV1U2R3FucmVPZmNuYU1SbDFWUmJC?=
 =?utf-8?B?RVI3RnJiR1VxdVlmSXRPRzlrQjVtOW1sSmp1eWJ2YldrWmtEdnVGeHU1SkN1?=
 =?utf-8?B?L3hSNHhSb1VHeUV6TjN3WHVKU3RkUlgxamtlUll6RDkzUEFqR0w3ck1mNjhi?=
 =?utf-8?B?aHgvbVlqRWZYemJuNXhuc3NYK3ZaWjJOQk1ucVpWdkFPNlBUV3RaQkNhUytX?=
 =?utf-8?B?eWMrU1d4cFE1NisrRDdhbTMyZC9oRlVVbFBoWE9tQUFKcHlsN3BFZHdxZ1Y4?=
 =?utf-8?B?eUUvNWt5T2xLVW5Fa01OdHZwQUU2M2V3RHlIV2hYY2lHVnI1cm1PR1Q3UGYr?=
 =?utf-8?B?VUFhQWQvb1dCcExDaHRXWFYyVVZ0MWJZZmZxYjdHRUJNWjJNMEFqQXRyRDVF?=
 =?utf-8?B?ZzhBOGhIcGc2UVBYZmJ5VlZJUWtmTmtZM2MvajdaRmlUZ2ZlTHA1SUJXb0I1?=
 =?utf-8?B?L0pTeFdqbEdlNG5MS29GRTR3L2l1bTVHWTJCRG9yQzZyOVZ6VG1hUDRnL2xk?=
 =?utf-8?B?czVzMVhNVHQzVWxIVFVNcElGTFk1dEFheTlSQ3psbmUreGdjZ2lxQ2NramRm?=
 =?utf-8?B?SDgvWHd1SDZkRjFaRUhCOGdSNkd6bFVJNkI4SGMxUXRqT0duYXVXQlFXUStE?=
 =?utf-8?B?bTBTcVc4SDJyZi96WUZNWjhEYUxlSTFHeGdWUUR2VVRLNVF1NURLR0k2bUtW?=
 =?utf-8?B?dWY0cm1IMnV4NnVYakt0N1JRL1o4Y2ZrMExuVjRLNUUxbDhzaVRHS3ZRUVhQ?=
 =?utf-8?B?UHo5Ti9jQUFhVWpzQ3FsUHVndzNpdFJVRDNUbVhRVVBweTYyK0FuNTNRSmdh?=
 =?utf-8?B?VTFWaVRFNnBrcm5NcTR2U2hVc0haUzRycktFbHJvLyszSkFIZW4yS2hFeU1S?=
 =?utf-8?B?UkVRckFXbmZMNDN2d1JpWUJXcGF4UDQ0dk51Vmd1WjFybm5DQ3N2WjVGNGhO?=
 =?utf-8?B?dWdUQTE5NUVzUGFLcWJ4eW1MWk92c2xwdnVqNjNVckk0aUdLbjBoTU9WelVC?=
 =?utf-8?B?SW9CeG1qOFhtenhJTmdIbHVSNnFuZWt5bnJIK3BrK0Jqdng2bWMvUHppM09q?=
 =?utf-8?B?ZTcrTHJWYS9tcnNtZXM3UE5jQkRsQU9kQzE3YmYwaGZ3SkVxcmhsdEQwZWlT?=
 =?utf-8?B?RndwUXN3dUNUMFpzK1VwTnV6d3orM3RyK3JCRytZdGRaTFJrZ3VQa2Q3TzVT?=
 =?utf-8?B?M0d6cVduL0FTbkFZdUpGSUYxNEJKQmlHcUVRcHZUZ3J1RURhL1Vickl6UnZm?=
 =?utf-8?Q?xaawI27/yALEpAEYKcUc4dZAkgjWVe7z97aVxqTfEbeTh?=
X-MS-Exchange-AntiSpam-MessageData-1: XTjrRW5mg9y5Og==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429a19ab-d8b4-40a3-5dc5-08debfec7b1f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 14:45:54.3522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wF9euDlDzdbVazxhr3zFEx7rJkhfqzDM3Yp8Z185uMhbiVIbOQ67MjWy9knRKDbXLpyK7eFY5pd2IIAFRoNjQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8311

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> Extract the SHA-384 hash, RSA public key, and RSA signature from the
> FMC ELF32 firmware sections. FSP Chain of Trust verification needs
> these to validate the FMC image during boot.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs     |  2 +-
>  drivers/gpu/nova-core/firmware/fsp.rs | 90 ++++++++++++++++++++++++++-
>  2 files changed, 88 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 6edb50b83a29..569efee0d4ac 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -641,7 +641,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Op=
tion<&'a [u8]> {
>      }
> =20
>      /// Automatically detects ELF32 vs ELF64 based on the ELF header.
> -    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&=
'a [u8]> {
> +    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&=
'a [u8]> {
>          // Check ELF magic.
>          if elf.len() < 5 || elf.get(0..4)? !=3D b"\x7fELF" {
>              return None;
> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-cor=
e/firmware/fsp.rs
> index 011be1e571c2..dc28d0cc2d03 100644
> --- a/drivers/gpu/nova-core/firmware/fsp.rs
> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
> @@ -15,13 +15,35 @@
>      gpu::Chipset, //
>  };
> =20
> +/// Size of the FSP SHA-384 hash, in bytes.
> +pub(crate) const FSP_HASH_SIZE: usize =3D 48;
> +/// Maximum size of the FSP public key (RSA-3072), in bytes.
> +///
> +/// The FMC ELF `publickey` section may be shorter, so the remaining byt=
es are zero-padded.
> +pub(crate) const FSP_PKEY_SIZE: usize =3D 384;
> +/// Maximum size of the FSP signature (RSA-3072), in bytes.
> +///
> +/// The FMC ELF `signature` section may be shorter, so the remaining byt=
es are zero-padded.
> +pub(crate) const FSP_SIG_SIZE: usize =3D 384;
> +
> +/// Structure to hold FMC signatures.
> +///
> +/// C representation is used because this type is used for communication=
 with the FSP.
> +#[derive(Debug, Clone, Copy)]
> +#[repr(C)]
> +pub(crate) struct FmcSignatures {
> +    pub(crate) hash384: [u8; FSP_HASH_SIZE],
> +    pub(crate) public_key: [u8; FSP_PKEY_SIZE],
> +    pub(crate) signature: [u8; FSP_SIG_SIZE],
> +}
> +
>  pub(crate) struct FspFirmware {
>      /// FMC firmware image data (only the "image" ELF section).
>      #[expect(dead_code)]
>      pub(crate) fmc_image: Coherent<[u8]>,
> -    /// Full FMC ELF for signature extraction.
> +    /// FMC firmware signatures.
>      #[expect(dead_code)]
> -    pub(crate) fmc_elf: Firmware,
> +    pub(crate) fmc_sigs: KBox<FmcSignatures>,
>  }
> =20
>  impl FspFirmware {
> @@ -41,7 +63,69 @@ pub(crate) fn new(
> =20
>          Ok(Self {
>              fmc_image,
> -            fmc_elf: fw,
> +            fmc_sigs: Self::extract_fmc_signatures(&fw, dev)?,
>          })
>      }
> +
> +    /// Extract FMC firmware signatures for Chain of Trust verification.
> +    ///
> +    /// Extracts real cryptographic signatures from FMC ELF32 firmware s=
ections.
> +    /// Returns signatures in a heap-allocated structure to prevent stac=
k overflow.
> +    fn extract_fmc_signatures(
> +        fmc_fw: &Firmware,
> +        dev: &device::Device,
> +    ) -> Result<KBox<FmcSignatures>> {
> +        let get_section =3D |name: &str, max_len: usize| {
> +            elf::elf_section(fmc_fw.data(), name)
> +                .ok_or(EINVAL)
> +                .inspect_err(|_| dev_err!(dev, "FMC firmware missing '{}=
' section\n", name))
> +                .and_then(|section| {
> +                    if section.len() > max_len {
> +                        dev_err!(
> +                            dev,
> +                            "FMC {} section size {} > maximum {}\n",
> +                            name,
> +                            section.len(),
> +                            max_len
> +                        );
> +                        Err(EINVAL)
> +                    } else {
> +                        Ok(section)
> +                    }
> +                })
> +        };
> +
> +        let hash_section =3D get_section("hash", FSP_HASH_SIZE)?;
> +        let pkey_section =3D get_section("publickey", FSP_PKEY_SIZE)?;
> +        let sig_section =3D get_section("signature", FSP_SIG_SIZE)?;
> +
> +        // The hash section is a SHA-384 output: it must be exactly FSP_=
HASH_SIZE bytes.
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
> +        let mut signatures =3D KBox::new(
> +            FmcSignatures {
> +                hash384: [0; _],
> +                public_key: [0; _],
> +                signature: [0; _],
> +            },
> +            GFP_KERNEL,
> +        )?;

This construct may create the 816 bytes long `FmcSignatures` instance on
the stack, where space is at a premium. `KBox::init` guarantees in-place
initialization:

    let mut signatures =3D KBox::init(
        init!(FmcSignatures {
            hash384: [0; _],
            public_key: [0; _],
            signature: [0; _],
        }),
        )?;
        GFP_KERNEL,

And by chaining the initializer we can also avoid making `signatures`
mutable:

    let signatures =3D KBox::init(
        init!(FmcSignatures {
            hash384 <- Zeroable::init_zeroed(),
            public_key <- Zeroable::init_zeroed(),
            signature <- Zeroable::init_zeroed(),
        })
        .chain(|sigs| {
            // PANIC: src and dst lengths are both FSP_HASH_SIZE (verified =
above).
            sigs.hash384.copy_from_slice(hash_section);
            // PANIC: dst is sliced to src.len(); src.len() <=3D FSP_PKEY_S=
IZE per `get_section`.
            sigs.public_key[..pkey_section.len()].copy_from_slice(pkey_sect=
ion);
            // PANIC: dst is sliced to src.len(); src.len() <=3D FSP_SIG_SI=
ZE per `get_section`.
            sigs.signature[..sig_section.len()].copy_from_slice(sig_section=
);
            Ok(())
        }),
        GFP_KERNEL,
    )?;
