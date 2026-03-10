Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012036.outbound.protection.outlook.com [40.107.209.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16802D978B;
	Tue, 10 Mar 2026 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140487; cv=fail; b=cHodPJdFistxfnMNF/0d0CvWTO9m7DeLX9WEKSbXE4iah7hm1FjG1ufCqYZUQd2T/4g9DoCXTxizNlYgtNSH2/AQCKnRZDWJdItWBC1CGh3mvfRN3aybXeb4VKh41yAzDBDaVHZ0GXeSJA8it36ofJvaX6G8rCdf4vDNldM3hIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140487; c=relaxed/simple;
	bh=ZG/L/GTmO49eAGgxFaYwR6gYrIrLe78MGh++vlwcsCA=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=FJ9wdz9YSbdACDmNpSVRESWjrfPdDqvH0VfuroE6fa/qPs+buAdyXnxs43rfaIaCiIMxX6dww7piutujg5GBgDEUx17nOzZU4QHOsJgb5SyAryW5Q8F2SzNQaOR6LA/9t6HgOKp1OJiccO+WbkyVOrkwNk1x9cxWvQMB9qui+wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U8wFMVLj; arc=fail smtp.client-ip=40.107.209.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U8wFMVLj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eok6sziVJN7hnsvzYUb5bOQ712+2rtqyhcumboSqfnZu+drffcFNSutQcHjRxbprt9BbJunFDmsfOJeLREOp3I8vg0IUwQt362na6TB5gacblcE/Dx/dIqywFnIcylcvapglA19tSUhOdwNPycwb/yWjJi42xtMZQMhwbvXcPPtmPBKIQYAU1dpi1dd1X+wALQjbln0qV7Nm6qlGTF/6Jea8f19qJoyuFijnhh5tYDsrzljVdCPoWCpGrlb42FJKkq3Qs5zLC2u0eTD0oDJSrQ453DsZOi4cpqCXT6qKLC1n2FtrnXB2anKdFEsPBfNZmd/Xvo9jrF4QSW7ubpYMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPsM0h9mj/PAecnta695CEG2nGf/ZmylwY9JgChCPzU=;
 b=gdFoNzY4RklkfwdNmO3iWmKItDPiIkwS5Y1D05zLMzEawiuaYOo8CwlsosRQsj7f8ypNLCT8F16gzGcEeIuGSvjyVebmnrLLnsxnd2VdkmvXWVl5tqt9Yzw16fQnd7Him2y1sDgtTTjO1cyGiYrRlNkyZM9nJ/eVdt6ACNCc+WU5zuA9mNSnzbJy5au49yzXEAHruVo9as+3JzLNxKxlj54OvktzBYktL3KA1F08XgAnHpZrMQalcbReWfQMOpBJ7bOcEkpPgqZdAEjGeNeIMfmMjeD+rBhxdVG4ccVfxLjcg53S3H3rDFdAuj6Hrs4Cp0d/wn/7C08htxUMi14a/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPsM0h9mj/PAecnta695CEG2nGf/ZmylwY9JgChCPzU=;
 b=U8wFMVLjgu8tRxEmTLNlAHrjzVS27Nyh81U60TipEII1JovJ32m9xFgYT3bnZMYtkR/BWRoaEXFsf9psjiY84Q5GQiSHw5x/LAIljqU6P2Z5Rs6jONl6L7gSafXQIce8goJui/hzENF7bTqrlcMFgK8pPN1Tt86Bf2TM+VVHik+laTjTnCUm/ALExT9lhSt2hfBQs/HkSW8RuFQyI2Yvq/FspcZEEBOcbSpTF/6poL4O0Ast5ciaBk8LJ4IzGVjrk7HSw1aYYGfzlRDoLUDrHqaIKuxdH8B0ggvgUZf3V4zJHaZckNCYkNJbCdSmWDEChwQQZuJJE2khqbjPCiFEhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8831.namprd12.prod.outlook.com (2603:10b6:a03:4d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 11:01:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 11:01:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 20:01:17 +0900
Message-Id: <DGZ1U9WK73U3.3RNJRL02X5AOD@nvidia.com>
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
Subject: Re: [PATCH v6 23/34] gpu: nova-core: Hopper/Blackwell: add FSP
 message structures
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-24-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-24-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0067.jpnprd01.prod.outlook.com
 (2603:1096:405:2::31) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: 12afe3a8-20e0-4f24-698a-08de7e945cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|7142099003;
X-Microsoft-Antispam-Message-Info:
	4Q/wpyhr+rVAnUtJGKUua8E3Ch+TWxTESktn9wNNY9QVfwpqUKBc1KD5cj89tjCeEncpccRmfPqAiBBd39Ix0guLqoE2XWZNHMn4MFqBp3YoKc+Je6Tm0uMhYSoxKNJCpYPuOa0u///i5JwglBJp1BdEacdssCcAFp6oFssr1SfbJlFtm9w/OoIgpPzPmPfJPohH5C1IIq4Wj8MJnNI4btzjwi4EkKVCgSue0Cn2GbpbHvgDf2AVYzMa9uRFTpdiDZH7VMzcg23nRJrnuIpeQqMGkVVDe5zhMhq1xZtonj7yM25+qv0Hr07z1OXEQBcfjcsxOMsOltXSTCuyRomSBeJnPSmSiq2iUYWxwDq6dOpPgy7M3HE8DYzGqP5BvokD8sthU01lkVPA7Dgrsh/NlZBrAntDaOPP2gOMRzYUZJT6hPFvKhfQpIGDkN+fa9j7eOXX8WOh1LKWSeVtxKf5VXAe4wqul3IZbP/46xo9Y4QfDAQv2emqul+PV7RzLeiCgISceddXmYDMPYDlNLIFFhxXKEwSAZlHjdEV3xNSfXtissuNJXKuJek7qcaR0ww/u9y8q5i0MMDZxo30WdZwI3Vrr8QUigt+6gBOdt1ohPPvHQuetD52Dc+93hh/FKoYQZJXBsT92bbF7N6wICL70KJgaqNRPBd3NMaG7CTwhlIoW8fptqxodb7kAHEmN+qUyVmRaGK6X/6d9Waprq89Lw6OfjU1RIMoJLQnVPowaFk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2ZqcTBEM3ZGbXhhZnM2QkZ4SDFMQXF6N20vMWFwb3NoMHZUd3BKZXo4Y29z?=
 =?utf-8?B?Nmh4M3NyT0JBSzFtVC90ZTU1WnFXblhoR0ptSEswS1V1ZzlSWEpVN1JGSUhw?=
 =?utf-8?B?MUFLaXZpaldrZHh5VllsNUZSenVSdXY3a0YzRXAxN3QvRnd2V3ErV0gvTHh5?=
 =?utf-8?B?RGFEend6dGdpNEgzeXdGSDFDMnhhOFEyMHJsTzhOTFlZdHZINHVrSk9zMnpY?=
 =?utf-8?B?SzZqdG9TM2ZtMUczNkhRVWU4b3R5QWo2Mit5K01sTU1vOGFlbjArMFFRRS9F?=
 =?utf-8?B?S2ovWkI0Y3ZYbWRPTzJXVzBYVnJwTG9uTWxrVnhxaTV2UHVKUGVQbEE1N2kv?=
 =?utf-8?B?SllSRm5aYnY5S09RNHFabXE3M0wzeEg0Snc3cjJKQ3MwS2R4VFpZaHhaYUNz?=
 =?utf-8?B?OGcyVWZQM0tqc2dERVZ3aEhpRE94aTlTYWxiWWJDdXRkN3ZuUTl5a25uK1pI?=
 =?utf-8?B?bnoweGRFRy9NMkQ5NG9DdGdpWXFVdjROY1JUQ2NtMzVVR3hRNTlveXVlOW5o?=
 =?utf-8?B?c2Rpc0xiZGtyRFgxL0ZKdlJQYnJld0hHTW51Ykpod0hMNDcyS1I1aHdvZU1Y?=
 =?utf-8?B?QU9HMEJRb0JmeU5kY2NhYXlaZ3AybG5LeFI0SW9nRVdjQ0FUWFk3YzVZQmJC?=
 =?utf-8?B?VmErREZjMTJ3bGNxdFN3eW5PcVR0azBiTnFOZzdPTVM5UXpCc1p3TDBIekx2?=
 =?utf-8?B?UmNWM1pEZE41SStGeWV3VDd3Y1hhc0dwNFlKbUQ1M0RGcTlTVWx4d1FJNWJq?=
 =?utf-8?B?cE1XbGtBejFUOGoxZWx4NVFyQzYzaktKaEVNcEJVSkFrZnk3emlEZ3lMVk0z?=
 =?utf-8?B?ZEd2aEJHanBmQjNHNlplaXUza3NObkZ2OTJJK0RGaVh6blhxSVVSQWhIeXFC?=
 =?utf-8?B?M21HL0RsbWNjbCsvRlY0SU10cGlnUHEreHhzV0thVHNxL1lFR0NQYVFYWUZN?=
 =?utf-8?B?S0lsQlN0eUNpdS9IeHdaOXpmUFEwUkw1emVXVk9rRThKanJBS2lkQVB5cy9N?=
 =?utf-8?B?S2htakxaRWZwbEtSb3NzTk9lTmZXc2NkN1FnSG9PQTA2YzZBcTdaLzFjWTNi?=
 =?utf-8?B?bGxYMlE5T1JkdGRadVVRV1dkZ3hmeDRkbHcxaVFhejlSclZpQ0FTRjJWeG9i?=
 =?utf-8?B?RzlaNm01UlU1VmpNRU0rRmppN3NWaEJtbExmcm80Y09NMW15dHRwSEY0amts?=
 =?utf-8?B?dFlqYk04ZmtPMFlDQ0NxeXQvcTFkc2kydXI0ODR0Rk93OXhTTjA2SWhVdHRv?=
 =?utf-8?B?cW9MSFpaTzBCQjZBM0pJbGYvd1NUOGVwQ0pmaTBPb29YeXBJaUpkNGduTldU?=
 =?utf-8?B?YVV5a2RxUFdRaVNzZFM4b05ZQUhRL1FGTURRQ0JpNTNENTlram81MVBCcGt6?=
 =?utf-8?B?aFp2RllrelIvRm5YRHhKcExqK1V2eVZSUm5hbC9iWGp5RUc5MDJMaVpacTZw?=
 =?utf-8?B?WEdZZ3VtS3k2ZmhCaS8vRlRYaWJiSm04SmZsM01lblRSOVlMQ096cDF5dVpo?=
 =?utf-8?B?VlVqbUhBVmgwS2FMOFhVd3Q2V01yZDJyODBDbldUMXZOZk1SYVJkRThZdXBE?=
 =?utf-8?B?QWZUR0VjTEJIVzBHbU1zTi9XVzN6WFhOcUt6dldvbVJ3b01BU2wySXErekpS?=
 =?utf-8?B?cERJLzRtdytDQUw3c0VpaC9GNjl1VVRRemNTMUtHeG9yNGcyUHNjZzk1NmpF?=
 =?utf-8?B?dHBOb3F4ZDg1ZTlXQXUxb1BqWUs5MWJocFJDRmg5dkQxUG41V2ZJcFNxWERt?=
 =?utf-8?B?QXRkVnBPbTUzNS9oR1lhUk8zTzl2ZWU4cCtLcE5RRi9NT0Vub2U0bDJkcm54?=
 =?utf-8?B?SmhLSnZHSTEzVTAxNm1nQ01SRXpBUUt6Ym5FL3E5SFlYb1FJR0ZNT2tJZjY1?=
 =?utf-8?B?akVuWjVldjJjeVVlWFJKY0xEeFozRGZZZWxSdzVra3M3a0tTWlljMWZWMy9s?=
 =?utf-8?B?WDY2cURsU0swOG5Dc0hGaHZ0T2p6c042MmlBR01DUGErU2NPd0FTbjJsdzNh?=
 =?utf-8?B?WEl0bFZabjQ5d0pjd2RIVzlEc0NVeXhwSEdOay8zMlFwYmUyVzlBTWE3Snhi?=
 =?utf-8?B?UlVaZkdET0FPMmx3SEd6Zi9oR05qbEdUNjZWdk8zSUl0YnBML1JGd0hSWDVU?=
 =?utf-8?B?ZzMrem5HbUxLNDlzYW5lRVNsaHhBSjgvMDNodmx1aURyUk56VHFJNitRUi8v?=
 =?utf-8?B?bE8rMkRzaW51MWtyZUZkYXZETHN2TjZNaTZSNEJ1M1BneWwxMWlyUXYybHpp?=
 =?utf-8?B?amRJVEt0RHNoZEdvMUk2Ky9WYWtFbjZqaUlMOWNSYlU1OG9OUWdkV1IvUFYy?=
 =?utf-8?B?ME52eUlVV2JudXpzWGtPOWo5QlBwVzMwdXhCQkVxRStBbWRiWnJIUG5xaWRG?=
 =?utf-8?Q?DXWK6C9pf/t3yp8QyGOpkH38u6n5c12qPigmoOBAnEGS+?=
X-MS-Exchange-AntiSpam-MessageData-1: d2zWenqTq/aehg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12afe3a8-20e0-4f24-698a-08de7e945cdb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 11:01:21.3019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRtg6Sfh8Odv2/x/HzeRlBhsMIaWjDlVxnzLH6Rk4oahc8T2ilQz4TIz/yXoeoFBhxbzh0mfdk48u6GVJNwnaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8831

On Tue Mar 10, 2026 at 11:11 AM JST, John Hubbard wrote:
> Add the NVDM COT payload, FSP message, and FSP response structures
> needed for FSP Chain of Trust communication. Also add FmcSignatures
> to hold the hash, public key, and signature extracted from FMC firmware.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs |  5 +-
>  drivers/gpu/nova-core/fsp.rs      | 78 +++++++++++++++++++++++++++++++
>  2 files changed, 82 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 6a0a02177f6f..be41e07b8448 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -26,6 +26,9 @@
>      },
>  };
> =20
> +#[expect(unused)]
> +pub(crate) use elf::elf_section;
> +
>  pub(crate) mod booter;
>  pub(crate) mod fsp;
>  pub(crate) mod fwsec;
> @@ -627,7 +630,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Op=
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
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index d464ad325881..15731d24d0c5 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -105,6 +105,84 @@ unsafe impl AsBytes for GspFmcBootParams {}
>  // SAFETY: All bit patterns are valid for the primitive fields.
>  unsafe impl FromBytes for GspFmcBootParams {}
> =20
> +/// Size constraints for FSP security signatures (Hopper/Blackwell).
> +const FSP_HASH_SIZE: usize =3D 48; // SHA-384 hash
> +const FSP_PKEY_SIZE: usize =3D 384; // RSA-3072 public key
> +const FSP_SIG_SIZE: usize =3D 384; // RSA-3072 signature
> +
> +/// Structure to hold FMC signatures.
> +#[derive(Debug, Clone, Copy)]
> +#[expect(dead_code)]
> +pub(crate) struct FmcSignatures {
> +    hash384: [u8; FSP_HASH_SIZE],
> +    public_key: [u8; FSP_PKEY_SIZE],
> +    signature: [u8; FSP_SIG_SIZE],
> +}
> +
> +impl Default for FmcSignatures {
> +    fn default() -> Self {
> +        Self {
> +            hash384: [0u8; FSP_HASH_SIZE],
> +            public_key: [0u8; FSP_PKEY_SIZE],
> +            signature: [0u8; FSP_SIG_SIZE],
> +        }
> +    }
> +}

Since everything is initialized to zero you should be able to derive
`Default` instead of bringing your own implementation.

> +
> +/// FSP Command Response payload structure.
> +/// NVDM_PAYLOAD_COMMAND_RESPONSE structure.
> +#[repr(C, packed)]
> +#[derive(Clone, Copy)]
> +struct NvdmPayloadCommandResponse {
> +    task_id: u32,
> +    command_nvdm_type: u32,
> +    error_code: u32,
> +}
> +
> +/// NVDM (NVIDIA Device Management) COT (Chain of Trust) payload structu=
re.
> +/// This is the main message payload sent to FSP for Chain of Trust.
> +#[repr(C, packed)]
> +#[derive(Clone, Copy)]
> +struct NvdmPayloadCot {
> +    version: u16,
> +    size: u16,
> +    gsp_fmc_sysmem_offset: u64,
> +    frts_sysmem_offset: u64,
> +    frts_sysmem_size: u32,
> +    frts_vidmem_offset: u64,
> +    frts_vidmem_size: u32,
> +    hash384: [u8; FSP_HASH_SIZE],
> +    public_key: [u8; FSP_PKEY_SIZE],
> +    signature: [u8; FSP_SIG_SIZE],
> +    gsp_boot_args_sysmem_offset: u64,
> +}
> +
> +/// Complete FSP message structure with MCTP and NVDM headers.
> +#[repr(C, packed)]
> +#[derive(Clone, Copy)]
> +#[expect(dead_code)]
> +struct FspMessage {
> +    mctp_header: u32,
> +    nvdm_header: u32,
> +    cot: NvdmPayloadCot,
> +}
> +
> +// SAFETY: FspMessage is a packed C struct with only integral fields.
> +unsafe impl AsBytes for FspMessage {}
> +
> +/// Complete FSP response structure with MCTP and NVDM headers.
> +#[repr(C, packed)]
> +#[derive(Clone, Copy)]
> +#[expect(dead_code)]
> +struct FspResponse {
> +    mctp_header: u32,
> +    nvdm_header: u32,
> +    response: NvdmPayloadCommandResponse,
> +}
> +
> +// SAFETY: FspResponse is a packed C struct with only integral fields.
> +unsafe impl FromBytes for FspResponse {}
> +
>  /// FSP interface for Hopper/Blackwell GPUs.
>  pub(crate) struct Fsp;

All this code seems to be directly or indirectly dead for now - is there
a way to merge this patch with the one that makes use of these? I don't
mind larger patches if they mostly add new code, as it comes down to the
same at the end of the day.

