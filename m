Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013069.outbound.protection.outlook.com [40.93.201.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B482B29A32D;
	Fri, 17 Apr 2026 14:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776435836; cv=fail; b=CAOGKNhXeVkI223/H5y0l+/5fNAiWzJ2vVGEzt9DFmIjDTRHNRht42CBP1N/+7zTZLsWRs3zVzMKJm2BufvKU8p8hGRF5Mo1K5pNcLIqUawCbyH8lY3QGoRDLsumPhsO0PTNj5VeXADwF5e7bvi/gHIBv1GPbg4dd+osNotfesI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776435836; c=relaxed/simple;
	bh=morWDw/wdC6vnulasboOfoyWm7dS7P2KIdt9piI6NLg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ZvUjtxxa6oodET6Nb9m398bHs68YeA9nv8zAVaWP4/NbFaStxiIYSh8ssMSdfYG2w3FkyzaJtU3dYwq0FOZsBFCn+eL8CIg293jPrd0Z6jeMp+5Tj0qM7XQfgimKH22uTnkhJdRjByPQKgXHIceRsYOuNaOLjSPWYI1BScDhuRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=otRPsC5k; arc=fail smtp.client-ip=40.93.201.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="otRPsC5k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uODp3ZMIT+/S8H0Mrj0PGjhTI8058jPaIlnBq4lsewIX+jer4edCN1PQOx9H4BZNzdGOZbKvwtAuJv8Q5O+bNBMHcTAlOR8HO7+3BwqA6TgVuD4iwUFBIH7AeBy7Mf43TZBKDTVs+bFOvJ3WGUkYNLyrS80LU8IYqinbFzE9rwXZ7vP7rPSPA3n9/yokQgRYp+ctw6CrVnVA45xcdzREZxQiUEANevTZfB/zD+2L18tGoqsu7Cw7sQirDSrbHl5ficevEK4ThG0lYXL12EjnFVy8IXENr1oVfSBm6Uv5cT8DeizMosmpN3v95ClCHIOIfpGhAslpDpJAmHtzb2vR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rM8s5dLQDlowKu3akpqjYJcx3zPUOIQloZmO6vFeQl8=;
 b=TrOtWdRDJJQIn6GUS8+MefexKOQYMl8KwX1TsuWlmAYAIXjuARsgLGKBBu6R3BoYHqnVhFbN5wQKTn8rb89krP9v07D8BEVkFIk3yC81dk8wKuTo0yvbVPY14WMcNUDFVDEcmyjuZmT0pSP0i/QKH1YNAI6RvD+tkry2amBnhXabId870nmz8fVaj46FzBfAlqkRYGUDSHWDA4ZzD50VuJ1MADNSkafCproOZ7rmhlHCaoiLuoz1uZNAI5w8SJnEY/t3yZZSQY+ZGA6d3URfk/Dv9U1/BUYwIEhlQqnxiWFvxnhOC4scjgUKvvqMKBly07w/HUSgVFjQmoye78wapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rM8s5dLQDlowKu3akpqjYJcx3zPUOIQloZmO6vFeQl8=;
 b=otRPsC5k1+P1WPKqb8LOjt/3GUAT0rQZbmHyCfAkXGquG9u8HX/PKlVn1YjP6LOHPrHrLoS8J2gjq9Gcvp+pbo5fNSVz/l1Rz91CpXf6Rdd/ye29Skzkg1tYV/uYigl8cOiPGRhXgWHfc7wKO7qhU2qV0884DkwqbNmimR/Jf1TFdVSPEUvuXSrgyfTYQdYMoCzV2kQiv3F1f6dbXSpEJum6kSlaCXGge4PVpfAsO6DoJJ+ulPlNCEyTxW1nDnDltLYIYM7CjbFsQ58HSmEWqo9vpc5R/6DB0kxGXNC3fYrysdHVqCA5hh1C9bCDejfEGcpPxO40g6KrrbBQr2I9tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8135.namprd12.prod.outlook.com (2603:10b6:a03:4f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 14:23:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 14:23:48 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 23:23:44 +0900
Message-Id: <DHVHXZL72CJT.2R0Q6BBZWFIUK@nvidia.com>
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
Subject: Re: [PATCH v10 08/28] gpu: nova-core: Blackwell: calculate reserved
 FB heap size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-9-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-9-jhubbard@nvidia.com>
X-ClientProxiedBy: OSAPR01CA0256.jpnprd01.prod.outlook.com
 (2603:1096:604:29::28) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: fb65247b-5b3d-4ef3-a31b-08de9c8cf0b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bMn5/4pZgu7dAJ+mwpSVvD9kQK+9tFIAmJLm9h/Xl4Vev6saEm9Bur5I+S20pIFiQm3gGjrr0Sqs/BKZsQleMIK/hSKcarVfZ5cBnBe5iLdL6xx5F/yu55rE+k2mJp2Yw8sfL7NrdEi20o7Mml1C1DzQAi936vK6Bykn9A32CFtVou/WOL/CUtZ+YlA8gq1tkRTr4mrKr3QCPyQo9o+KJC3kcf1RPxMf2BXEXqMWkc2iAGRufktFf6+oN2QgOY3b/+WwYF0e/FjSb35RQVIycSg1fez1goT5h3lC+lOv/vrKJljGa9F7URL2ljwhEZ2ZCqLTj/p/jRTC8lV1CxV89lJqbRKq7MNyHEPE8CH9aexj2bO202c1awe/N/zUQwd9mJ2dVdTdKm5CbenL/z7kenn1oTvKvBRtQGcj16ZI1sTaa/kqCia8e8zSCOnwg+QX5YMLNDBOL1XIW2CKQtVf8YWPTCheeH7GrO+Dt+pdPQCY0lYyN6zEfKJSn2i5LpN9JTaxXe3RGO1szoHOYWDcjVLOU4fKEFBoFR8Klf8lvDv2wT5+wpObGNrLWnIenwZDYmOo443DWxT4kNnzBPokKQzbT3RU/en+zAd6waYAYb48Z/XDaJ/OCOhXtO1bUF/HivME9Jq4iCEe/gF3I+GvCN0sWrsWsqB0Z5KwXir2pHQ2Of5wGmwPqARkeJiHCKATMxORhz/aMtb6PqcC1UuCHX8+i6fJ9cS7qANd0N6VqSc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzJQdXF2MG9GZ1NKTUlkTkxXVVdjZmVJRStsRisrVnhpZ1ROK2tYTmJSYzdO?=
 =?utf-8?B?WWowSEdFOTZTcDk1WXMrbDA4cWZELzdWVUZaVlRLdVV3eC8xdjZxUzNvOVpr?=
 =?utf-8?B?UDBDZnAvZy9pS0JuY09mbHhLY0I4c3ZLUG5MdkNVMGxCQllHMTFoTEY2akFq?=
 =?utf-8?B?SlNOdjgzYU1FaGZHVG53T1FzblFTaXA5WGNOR2c3bTNPSDFIZDBuZHprL3Rh?=
 =?utf-8?B?WWM3b1h3Smt6TmJEQ3RLY3UvZUN5ckNwamR6SlRqS3JrRlB4N0xuc1NJK3hK?=
 =?utf-8?B?c3R5VGhrOHdFZ01zYzFNSUFzeU1CYXNoVkw1K2swNzkwM2NrdXJyL0ZVTU56?=
 =?utf-8?B?SVcyeFNZZ2RGQzFlNWlrNmhtYk0zeG9VekwxZkl3QmhVVnJqZ0ZZcUJaM2V4?=
 =?utf-8?B?UUp1TWFobGljTk5JdDM4K0lXRjVpSHVCMXYwQVd0YVMvNndCTTdkNkZ2cXNi?=
 =?utf-8?B?MmJkUDhGMTA1dTFNQnhkTkFvaVlHWE5GazRPdDM5UHRxVThBZzZtSFl4Qytm?=
 =?utf-8?B?WldnYVlhUEtORlZDWTJHbTVKYUF6WHg4TjBNYmlEcXJ4RWZkd203bXZLMmZr?=
 =?utf-8?B?U2F3aUNQZnVmUUw4SkNpVnJzVlNvMmdBa0JWV0ViZmZ4YlFJNzNKTnNGN1M1?=
 =?utf-8?B?TXU3cDVPR29BUEowTlVzbEJreTE0ZzlQQVN2Q0VJWXpCaTQ4ekRhbk9heHFJ?=
 =?utf-8?B?TGRlMW4zaGVnbDJ1MU84eWxBd1k5UVJ2bEp2STN6WUQzVkNKMnZiYWwvVmlE?=
 =?utf-8?B?UnprQzlTQzhVckh3U0pVaHNqQ1hla3RtaUY5RUlRdFBoNlVnQkQ0TGdmSDAx?=
 =?utf-8?B?OC9XaDdHYW1JTFVMQVNxelhmL3hsaGp6eXB2SWh3WkNSelRzSDArTXJQNncr?=
 =?utf-8?B?WG1vWVhVc3lWVUlodXp2UHloMGtqeHJiMFhTRGJwQVBPQUdmaER5bjMwUCtN?=
 =?utf-8?B?OHUzTEZZKzFjV3BwNUlJY0FtenRSRG53TUlZai8wV3Z3VFF1SjNmREFDMDhk?=
 =?utf-8?B?Qng0ZGRCdHlWSkdTaDR3TzNSa1VXU2lhbGJVc3ZNMFkyUU9qck1hM1Urd0NM?=
 =?utf-8?B?ZzRhSlJORFJmdGZNZHJJVlVrR0JyZ0t0dkFpZ0VHak9IVENEY3pGRTQ1SGt2?=
 =?utf-8?B?Vmg1N0xkVkJ5WGl5bTd6K0VyNHZGS3pHZkdzZDJKRzZTNldvSVhCYUpEd05V?=
 =?utf-8?B?RlBKNVMyV2tsYVhSbGIydnNaY0tPSmt1TmNoV1c1OFU1TXpHTGE2R3Nrd3N3?=
 =?utf-8?B?RjVPZGR4NGl6cU9Ta3l4OEFBelBoQlFMeWpPR05kUHJWSm93Qk1temltMEVO?=
 =?utf-8?B?dkJKLytIdEt3MUNwaldpcGZlMWVxbEsxS3Z4L0VFdjlldm9uNE93eDlBNkFM?=
 =?utf-8?B?VytjYnBvbWtLQWxPTGpLeUxaMnVVQ3ZhUEJ0SDk2VHluOHFOUWxhbXk5ZTdX?=
 =?utf-8?B?eDR1b20yZm16ck1yUUE2NHJPY2ROd2hrQlZOVGFQMUFLTzBRbXgwdUJTS0VJ?=
 =?utf-8?B?L0lZUHhXVURldXc2SGd1cUc3dCtaeXI2YmpQTlRvdFhCNVJDbURCUU8yNmd6?=
 =?utf-8?B?UmYzYzJnUlN3WnpyeHJ2SmkrendVVVBPUGxUTEJJNWpTNm90SXcvcWtMaVZq?=
 =?utf-8?B?d3FRMWZRMlk3K0txbnI4VmUzK0tJVEhFenF4Uk5kVi8rQWRCRGZybThXYW5i?=
 =?utf-8?B?TW5KUS9aRUw5a3NSejk4OThGUXQ4VEtVTHVCRlFDV2lIZFF0WVZJYzJUMUFw?=
 =?utf-8?B?UDBsZWZ6dTJEaUdqRHNQUFZxY3greDAyRTRxYnBVVkwvWkQ2V2RpUnlabVQ3?=
 =?utf-8?B?UHNWazdIVzBIZVRtbng5OXVTbURva3hGUEI4YVp2RXg1K2RVLy9RWFFVSXZU?=
 =?utf-8?B?bEphejE3NnNVKzlRVDFrS3hIemlJMVlveldvN0QrRTBFOUJLcWlKRFFMZmhY?=
 =?utf-8?B?eGNyMWVTaksvT2NRYmNiZEg0elJXUjNxRnFubGJXUnBXbTR3OVlkMUY5ZFd2?=
 =?utf-8?B?cW5DSVNsZnd3d256K0lzUXE3Z2xMc3RHWFN2L01qU3ZTMHErTTFSQk5iN21K?=
 =?utf-8?B?Sms0eEtHTGdmSlBhRzlpemJ3NFVESWJKWExUNld4cUxoTXo4NkI5bGFCNldN?=
 =?utf-8?B?dkZkbnhndUVmdnpJQ1BXSlJFcHVJc0pIUlpVMFIrOW95dUlNRmlVTTJNOFE3?=
 =?utf-8?B?Qk1MTWRSYlh2MHFiL2V6OFZpekRWdnYwZUk5SlNCK2pMaFAyNVRad3FYaDJ3?=
 =?utf-8?B?dUFrTlJIR3k0K2JYVnFoRHljbHdJc0twUWQ5Skprd0Nac1h6aVRDazVjTUZ6?=
 =?utf-8?B?MUtwTjhtNU1MZ1luT1lIVjNUSTFPZTBWRUd6L3dCNlNob1lsSWRJM2dKNm1z?=
 =?utf-8?Q?OEMiHLo8YiWySxudBadbOYyC4VIOOFrii6OLYUCJkfuXE?=
X-MS-Exchange-AntiSpam-MessageData-1: Im0XxlfrMMNKNA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb65247b-5b3d-4ef3-a31b-08de9c8cf0b0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:23:48.3263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxNmoxFVrGFTEIKe8033hzN1S8ZeQuHB+Vxii7hyUDs/gRCZANjlpX5iXV7tb4uX+alD47ZGzkCtDvgPyjSfZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8135

On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
<snip>
> @@ -168,6 +175,8 @@ pub(crate) struct FbLayout {
>      pub(crate) wpr2: FbRange,
>      pub(crate) heap: FbRange,
>      pub(crate) vf_partition_count: u8,
> +    /// PMU reserved memory size, in bytes.
> +    pub(crate) pmu_reserved_size: u32,
>  }
> =20
>  impl FbLayout {
> @@ -268,6 +277,29 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_=
fw: &GspFirmware) -> Result<
>              wpr2,
>              heap,
>              vf_partition_count: 0,
> +            pmu_reserved_size: match chipset.arch() {
> +                Architecture::BlackwellGB10x | Architecture::BlackwellGB=
20x =3D> PMU_RESERVED_SIZE,
> +                _ =3D> 0,
> +            },

I suspect you can just call `calc_pmu_reserved_size`, which seem to
perform the exact same computation?

>          })
>      }
>  }
> +
> +/// Returns the PMU reserved memory size for `chipset`.
> +#[expect(dead_code)]
> +pub(crate) fn calc_pmu_reserved_size(chipset: Chipset) -> u32 {
> +    match chipset.arch() {
> +        Architecture::BlackwellGB10x | Architecture::BlackwellGB20x =3D>=
 PMU_RESERVED_SIZE,
> +        _ =3D> 0,
> +    }

We should avoid these matches on Architecture in common code as much as
possible - that's what the HALs are for. Which means that
`calc_pmu_reserved_size` should call a HAL method to obtain the right
size (I'd also rename it to just `pmu_reserved_size` as we are not
computing anything at runtime).

> +}
> +
> +/// PMU reserved size, aligned to 128KB.
> +pub(crate) const PMU_RESERVED_SIZE: u32 =3D usize_into_u32::<
> +    {
> +        match const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ=
_128K>()) {
> +            Some(v) =3D> v,
> +            None =3D> panic!("PMU_RESERVED_SIZE: alignment overflow"),
> +        }
> +    },
> +>();

Consequently, this should be moved into the Blackwell HAL - which is
where is belongs, as contrary to what its name implies in the current
module, this reserved size does not apply to all architectures.
