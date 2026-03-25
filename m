Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013064.outbound.protection.outlook.com [40.107.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6D93B2A0;
	Wed, 25 Mar 2026 03:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774409431; cv=fail; b=GwlYmkL0NvrS9FGSOMrywS3Z3Bs0bhB7CYvqs1hYC3LhrR0qbBJHODEbI/i5zt4jrD1fs7sXtKpBAMrsdWpZ6FzW1t/9ZyALktl1TNkBzwVgvrM8X94eTawpU7FOlyAT1Ua4Tm+wi4Vm2Cxg1WkujgP/yjJANFPSVGhmWrxVDco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774409431; c=relaxed/simple;
	bh=ucLgoE4oIow7udR6ebAqkp1Ac09G/qBGEysn0amRrxs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XpZTtNhiXkQ5TlczWTGCysCeZPa+ejSlC2LXN+fgqwqxj7CQoHdsKM1QZRo/EhpwJFoKl3RX9bA94WMgFgBUsoW5xHRXNqpBM3mnoh9QY3ezkIDjFn2rMQUJVMD5rJgk1mui/8Qy/08H0sz4fn8LlDNiZnayd/IvNgqCXAFhJcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f8452VJG; arc=fail smtp.client-ip=40.107.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f8452VJG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idWdYWgsiPDLxSVe0jIxzCF8VyXQ9k/tTyt8aCVDuoOQrZaIsoSzqQ1XRVBuHcllzPjtWW9vnZZwhcxRm3T4F1EWYss2m4CW42bWyrPZAXF/8nHnAcuXOZkurL5M7Jj/2sGma4I6Ko76EfZmXeUBFXhQQ+6mbeP0YU88zgn/4ZcuOd4dnOoDeMSorerpKPB2o5I1UsPzJmdkVflTbZOptvupBEYrfg7xBXuBjGPhj3L0VFuNjr4HpKF/z7Hvb2I4uCPWtkjhzVKQde/Dorxuv60Nuke6AZD1SVsmCY8P0EIT68MY7I/W4D1hadzkHBV3x+3ONM5mchUE5WVopVyIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiN0TI9xzqEyZnKLugvw7yrQBD0ERjauzfecf6VGhXQ=;
 b=geqetn7QBZgzgpg88YrywNQeAXO2vELI9pKkTkl5k16SdKQFq52p6G59eoPc6Dsh64Y+tidtgiCgCUxu4cwoN4v0GidrHmp3X/gbCO2MrL25skT6+UtEJiEtAer0RpBO6iTGCbfVMoXgfbvSsUdtGdws37VnSSna92OsbMe/KUlMXuGwqaMlymWjQGanhiy9waJ4EPHCrA8x0HdW5h2HVd+FrQEK5oqmVGfC7mQXD/Y0sv2aRao8MK0XT7ixd+twumyiy0CdkFyQBzGywkZxaWuxd2RlCnkqCdvGdFq1GLh5wtssyMAs0UvVlns06ucA5ROwtgnBm+htyTS7wimEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiN0TI9xzqEyZnKLugvw7yrQBD0ERjauzfecf6VGhXQ=;
 b=f8452VJGfPxPch8v6ZTAq3OS/xWDkrJIkFitKApV3Fj3G7CuGsJcCyZOVyjUQu3g8L5NL8d9eLEm60VULDFiPBj1/a5qdGkQ3uDXqRihR9ELlsfI8gva3LD+us64stBbDjza70Kq5D6iYw4ow7Pki6mnquZSMBI2RGZu3JiHFXLtxk3pnv97x6ylzjEMdRzWgGw7CHKTrIeXbtSFi2WDA6+LhtGh4n5uDzBXYZASU4xDWFHC8S7vPFFKaRAgLxRlHrspuCCNpCZPnwSYvXSm/PziNO477k51MiCpoGusyAmwtGX7+1M5uOE9IiI4DIn7v5EEe2caosGjRf4tE0pIZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH1PPF7A6EE32B1.namprd12.prod.outlook.com (2603:10b6:61f:fc00::616) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 03:30:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:30:24 +0000
Message-ID: <b3780f18-a762-498e-aac5-6a0938d26c5d@nvidia.com>
Date: Tue, 24 Mar 2026 20:30:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/31] gpu: nova-core: move firmware image parsing code
 to firmware.rs
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-8-jhubbard@nvidia.com>
 <DHA6XCMN83HZ.35I7YETBZUV7B@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHA6XCMN83HZ.35I7YETBZUV7B@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:a03:54::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH1PPF7A6EE32B1:EE_
X-MS-Office365-Filtering-Correlation-Id: c050c8c5-ae9a-4f70-6ec6-08de8a1eda2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	VvwvMqADj/7wuOYfXQL9i8TVGUspI35o7xGRPFmrltqjY37T25sN+baioiu2fCaNWGRWMXL2nk+Ksqr6xQuwFc1hgBvPoe0qDBmJs5rnJ+/i7zxc1nQIT8Cm708IiX3E47Orns3Qc8Xa41svRvNHpIhiSyZMkFYFZmgD3gYSH1fuorYp3xlHulmSYiK0WBB5PjPCfnF1z645/5kDZYYCoNkdVSpIYFXh8EflQ5MX+unG/fIky4estWdjfpi6asvYOddB+4KuxIDfZeRatvERvJOdYJTTQRiVTEeg8Kl+stHknDLeWUP8cYZ6UHYi/WcrFUynGUXGBoerQLhN+yez6PAtOL79Hyt8xCSQww8jvJOH+ossjHbEBrhrxa2OFYcvNyZY630bJRq1LHN3Amru3Jz1BpJqHcPmZtwyVdFPkgPB9fpX2psItCPIraQa2rGbCKHcAs7wrlzgSWG0nBmFMI13iECoIW9Xy5wwSW4Sxp8ereTu/ete+tZpqfpR1nRlc9GtHGiNzGVxB5GFr0iLDe/IW+pARdgTGQ7RJrh3e/dw+CckaGb8GJwPXdCxK+Pc8sVAIgPru1u0BoDfE0CqWN3TZ4RwYiabtvfY7Iakikkn8UT65PSOprHB5TVykW+aM2YAYHebRkAfHICAKAwdj2MDTKA7qW4CJz++q9xbqbH4VaIz2DGx42O7j5V6Bm2odNLfhJA4W47+n9REu0fjLS0M30cZQrqNLcYI5ZsmPDgaqtIYFiCUkUbGR5OYTkee
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1JOdkh6K0JBQktCQVdNdUFHbVJCb1VIK3RwWStXNnc5bm1oMzlmUE9HSnhR?=
 =?utf-8?B?UGNRTHdCM2VEZVo3MURyb2paeWtORWNEdWYzMWQ3WEJTbG5rWVl4TDh2anhW?=
 =?utf-8?B?aG9kdkwvdGNXK1Jza3hFMzVURktMcE11NSs4dDhuY1ptV1B5MEF3QXZ6OERx?=
 =?utf-8?B?UDhUZHkvUjdFS29XWHA5THl0YnQ3M0tYL2ZLMzdWTm1KYVpmVVczTEgvc1l5?=
 =?utf-8?B?eUZ1VEU0MCtNWSt2Z2k1ZnBYSC90QjhPRExwVUFrTnQyQmZwejJXYW0zdHhR?=
 =?utf-8?B?eHIzQ2RPMXByTkRrYlFmNkJyOWhyRFpBek8weERzTmpSS1pucklLakNRSTgr?=
 =?utf-8?B?Q1A0b2o2YWx0eEw1UVU2MmZqc0Y4bjdoMlQvSFFaeEJGRElaeGJaa0c1ZWhI?=
 =?utf-8?B?SVl4SnZDcy9VRGxiR2Z2cG1jWHUyQTcwUTdGejVoR2hKNGMyYlRUdktNelRH?=
 =?utf-8?B?RXJDeHRvRVJuQUZBYVlhVGphRGpLUE1tOGFsVVY0c0tsRWQwUTRwa1hwMFNx?=
 =?utf-8?B?OUtkM0ptU2N4b0ZGWUl3bWxSbnlqVWw2SmxZM3Z6TkswSW9HaHBtSzkzV3Ji?=
 =?utf-8?B?VnQ2U3FYNXZSYnBSL2pTbjdnR041WlhYR2taanc5Sm9zOUVXRmJwaTFjYjVH?=
 =?utf-8?B?cXBVc0hrV0FtMHR2WmoyR1EyeFJvSWlIZGVFcEFiMEpvNXVwMWxyR09tVytq?=
 =?utf-8?B?ZFpOTmZNOTJVZkRWM0xZb1gvMWhTTEszZENkK1h1c0RtTXBsRWt4ODBlK1F6?=
 =?utf-8?B?aVJtVFFYVzBVQjA2bVV5Rk00aEgwdzlzbFVSczU0dlBqMFVzNnJnUG1KdUNS?=
 =?utf-8?B?cmFQTDNOWGNDQ3FraGlLWFFvWmJ1b0NRSms5YUNKcllpMGxVeTRzdHZYdVcz?=
 =?utf-8?B?aTNkWUlpL0R5L21WR0VLVTREeDhUelg4d0RybEhJWmNJVDlKdEhLY25scGxo?=
 =?utf-8?B?bFJPbjd2eWtpcE1XYVBWTGdUaHgreXJYUHREMlc0VkhwcG9CSkgxWllVRHFB?=
 =?utf-8?B?czdzckZybUprOEhYSGF5V2kyUW9nMzJMNVBFR2FNRVlESzF2UEYwTGc3UkJ5?=
 =?utf-8?B?ODJDem1KYTdPNmFMalZEaTM5VVJqMnphM2xqVVZPUDM0UElxTEo3WncyYzZu?=
 =?utf-8?B?bEt5aXUxM041bVY1Z0hqSG9oZWloYXdUZlcwZWdKSWxBcEZ1ajZRWXAxYkN6?=
 =?utf-8?B?eDlSMjFFUnN4aXlBZVBycWJoQ0phWitZbFRWN2VjeVlPV3J0d0lsSk1GTDNB?=
 =?utf-8?B?M0NnTjhncTNHUHNoU0dRa3lTQ1c2MmJwWFJ0K2JOa2hla2Jyb0ZaeUNpRW94?=
 =?utf-8?B?Zi9SL0FkdmRjSFBqYXpaOFZXUEZWVWpZTjRpUURjVXpQdm9DaTNQajBPeUJu?=
 =?utf-8?B?QVVaRDBwQ0NaSGo0c2t4VUhHTWlyMjZHQ1I5ZkFPV01YaVRJcGxFT3JXOVk3?=
 =?utf-8?B?cUkxZGxYYUI4SDZlUGZVZnQyRkQxMUV1bnBjTXNOQ2pBclVwMFVhYTVTem4w?=
 =?utf-8?B?aHN1bTM0eEZ6Ly9DVTlIb1JyU3lBUFZwdkdtS0JpaHFrTXhDM2c4YTVrcXY3?=
 =?utf-8?B?NExmbEoyeE5ObEg2L2dUOVVFSk5obDViSEl6cFlOY1h4N2w1M2ZzRS9oMUxU?=
 =?utf-8?B?WXZIaUoyQzlJOTFxUXN3M1RwT0xiTzNCbTJOUGtacVp3Wm51aEs4Z3loVGZK?=
 =?utf-8?B?THFOUVZqb2Y5T0NEMGdnNHVWK2JZaTdsUW9FWVVaWFFzWS9LUlVrVi9WUWE0?=
 =?utf-8?B?T0U1Zm41bFRnQ1E3WGRmOEdVQzl6WHZpRFhPVXh2SjhVMlE1NXkzZDN2QWNW?=
 =?utf-8?B?RHVpTFJlempJMlk3K243Sm52Ylo3cUVTVHpqeXJ3ZmI1aWxNTGFQQXJGWnlo?=
 =?utf-8?B?THJFZ3NPYlVGQnBHYUc5bFZJOU5kaVpqcHJpMDNNc2xZVDZjVndGQmJ6Ums4?=
 =?utf-8?B?eVQ2NHh2UzhVb1JHd1FDaHRUcmxpbFNTOXdSdjE4WFpKN2dQa3NRd0RRRFdT?=
 =?utf-8?B?N251MjExLzVrRnlDanVrV1E4ZzR5dFg0Y0lrb1lEYnFBMnZwcjhFblg5ZlBK?=
 =?utf-8?B?eGFSaWMvUTVGanZ6MU5YSkJHYVIzQ0JPU0xDMi9DSkJDbXI2N2hmT2xFNVBu?=
 =?utf-8?B?d1JiMm44bldld3dyYXFKZ1Z0bFpaN2h2NTdCVU5YUldDcWFsemt5cFZFL1dF?=
 =?utf-8?B?N0tnQ2tOaVljQ1BXdXhkNCtvN2FKRnlLcE9tSmNEdUdYMjFpRjduN3htcm5J?=
 =?utf-8?B?eE4zaUtJVlplbGZRUllVNzlmN3NWWi9nYjdSTmYvTENqYWZseEEwYmhYc3VH?=
 =?utf-8?B?ZGdDWitpbWRWcmQzMmszaUlCRGJLWjVoWlBXME9zcDVCTDZ4UURTZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c050c8c5-ae9a-4f70-6ec6-08de8a1eda2b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:30:24.8839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezlgkk4Zn+xLcrPSQZLeKLV0b/KXISf9DOvCTmiST6q8KHGJfr5G2+4lWT0tfG2//1gnQwbkVgLBtZ9Iuc+HBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF7A6EE32B1

On 3/23/26 6:19 AM, Alexandre Courbot wrote:
> On Wed Mar 18, 2026 at 7:53 AM JST, John Hubbard wrote:
>> Up until now, only the GSP required parsing of its firmware headers.
>> However, upcoming support for Hopper/Blackwell+ adds another firmware
>> image (FMC), along with another format (ELF32).
>>
>> Therefore, the current ELF64 section parsing support needs to be moved
>> up a level, so that both of the above can use it.
>>
>> There are no functional changes. This is pure code movement.
>>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware.rs     | 88 +++++++++++++++++++++++++
>>  drivers/gpu/nova-core/firmware/gsp.rs | 93 ++-------------------------
>>  2 files changed, 94 insertions(+), 87 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
>> index 2bb20081befd..177b8ede151c 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -457,3 +457,91 @@ pub(crate) const fn create(
>>          this.0
>>      }
>>  }
>> +
>> +/// Ad-hoc and temporary module to extract sections from ELF images.
>> +///
>> +/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
>> +/// to specific and related bits of data. Future firmware versions are scheduled to move away from
>> +/// that scheme before nova-core becomes stable, which means this module will eventually be
>> +/// removed.
>> +mod elf {
>> +    use core::mem::size_of;
> 
> This import is not needed, `size_of` is already in the prelude.


The `mod elf` block is a nested module that doesn't have `use
kernel::prelude::*;` in scope, so `size_of` isn't available without the
explicit import.

Or some it seems. I'm not experienced with the module scoping game,
and so I may have it wrong.

> 
>> +
>> +    use kernel::{
>> +        bindings,
>> +        str::CStr,
>> +        transmute::FromBytes, //
>> +    };
>> +
>> +    /// Newtype to provide a [`FromBytes`] implementation.
>> +    #[repr(transparent)]
>> +    struct Elf64Hdr(bindings::elf64_hdr);
>> +    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
>> +    unsafe impl FromBytes for Elf64Hdr {}
>> +
>> +    #[repr(transparent)]
>> +    struct Elf64SHdr(bindings::elf64_shdr);
>> +    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
>> +    unsafe impl FromBytes for Elf64SHdr {}
>> +
>> +    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
>> +    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
>> +        let hdr = &elf
>> +            .get(0..size_of::<bindings::elf64_hdr>())
>> +            .and_then(Elf64Hdr::from_bytes)?
>> +            .0;
>> +
>> +        // Get all the section headers.
>> +        let mut shdr = {
>> +            let shdr_num = usize::from(hdr.e_shnum);
>> +            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
>> +            let shdr_end = shdr_num
>> +                .checked_mul(size_of::<Elf64SHdr>())
>> +                .and_then(|v| v.checked_add(shdr_start))?;
>> +
>> +            elf.get(shdr_start..shdr_end)
>> +                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
>> +        };
>> +
>> +        // Get the strings table.
>> +        let strhdr = shdr
>> +            .clone()
>> +            .nth(usize::from(hdr.e_shstrndx))
>> +            .and_then(Elf64SHdr::from_bytes)?;
>> +
>> +        // Find the section which name matches `name` and return it.
>> +        shdr.find(|&sh| {
>> +            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
>> +                return false;
>> +            };
>> +
>> +            let Some(name_idx) = strhdr
>> +                .0
>> +                .sh_offset
>> +                .checked_add(u64::from(hdr.0.sh_name))
>> +                .and_then(|idx| usize::try_from(idx).ok())
>> +            else {
>> +                return false;
>> +            };
>> +
>> +            // Get the start of the name.
>> +            elf.get(name_idx..)
>> +                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
>> +                // Convert into str.
>> +                .and_then(|c_str| c_str.to_str().ok())
>> +                // Check that the name matches.
>> +                .map(|str| str == name)
>> +                .unwrap_or(false)
>> +        })
>> +        // Return the slice containing the section.
>> +        .and_then(|sh| {
>> +            let hdr = Elf64SHdr::from_bytes(sh)?;
>> +            let start = usize::try_from(hdr.0.sh_offset).ok()?;
>> +            let end = usize::try_from(hdr.0.sh_size)
>> +                .ok()
>> +                .and_then(|sh_size| start.checked_add(sh_size))?;
>> +
>> +            elf.get(start..end)
>> +        })
>> +    }
>> +}
>> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
>> index 8bbc3809c640..c6e71339b28e 100644
>> --- a/drivers/gpu/nova-core/firmware/gsp.rs
>> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
>> @@ -1,5 +1,7 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  
>> +use core::mem::size_of_val;
> 
> And this one is unneeded as well. Actually I mentioned that in my v6
> review [1].

Same situation: firmware/gsp.rs doesn't import the kernel prelude, so
`size_of_val` needs the explicit import.

> 
> [1] https://lore.kernel.org/all/DGZ150DHI878.2YXL15FY7W0GG@nvidia.com/
> 

thanks,
-- 
John Hubbard

