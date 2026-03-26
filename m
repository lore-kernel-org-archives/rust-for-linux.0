Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C5F1E51E0;
	Thu, 26 Mar 2026 01:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488230; cv=fail; b=Sxj/VXQBbxr02CpwTWdHAPm0usqHQ6R9jk8f6/cbDcGzn2B8S87BDOGx0y3I8rB+MIbGhv7/ZQynruL6CzNhQ26g7s1MwivOC73YEGCQjT9ri35gdRIQjazFhKSszS18waMQ4Vg8oONg+Lr968ZX6XK8TMzbUQOmD3zj3nRelSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488230; c=relaxed/simple;
	bh=WczjMMaS1lvZuMqf3fY6YncBrQ16b1xFFhyEoCsGcF0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xn6S4ZZ8oagUPETuX7f6hoziczkLokOXy++MPv9QJQq5s/u6IdKki/VIsJC05Dt5SfpqnmhJi2AVdDMGLHOQHJgeBv8nzADg1td+1T+LFUyjnACYkM+8LziBFBchSUQgcAWioiXUX8R2XzKfBE6lkU+VLvgx7PLVclcrrhCb2ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BYzNdkwp; arc=fail smtp.client-ip=52.101.52.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BYzNdkwp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNyBR3ifpUkPB2Gcwz/TPt3gllP4fEIg1PJD2RULZ/Cfj1L2AodrghD7FSjUvr4ADslNsYB7NcpBLhgj/w7ZIeIrhSF5CdkkRqBsoZ337xZxP6yoK7GX6yTGXzYhV50HRrE77Kn2Uj+AwuP7TnxJXqUR6BRQCJjBbIxMarnOGrdoDATDzzabnhYcird5E/KcMu/WpYEKU/qHn6yg84zvVsgmfedYSTUr9sftBwbfKU1y3d11jq5SvBeHrbL50inSzs/uiNObKRSQdVjrzLYy8YWKo7lTtpvF37rhNPIps8nBE6P7p7GilXrva4U6yplgLL0DYTRORFNXfgMCzosUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDnjUaxr3bcBPMsP/IKk6RGTjGrEUSn48id/Epft+rs=;
 b=cSXDk6oh4SX4ZqWTWn0KS1mC0rGDvpTT593+rfRie/cPCMP+45yipmF/2XdhfcSdiBrcqKztTmglE+pVkvUOvKaH/mJvE5qeTi6fjee7jhKsQ7Nk8Au9KQp+Qvn3RL0Hs3SzIj88lZkK1TbDTE3O94Prtaa24RbNvH4LIE1ysOAwCJNDvN7VeT/4dbENo3w80OqUTzQEljFFmBWBY1pPiArYf0B3Js6+GQZOcVU8s9rp3CJI6kU5WaGAWn2MgLnBFPvH7sPy/WD0FJMyhVnvLvSRiETdKsQmE+LsmlY6T/YWk6qN5qbzohGPA5OJDjorKe5H+dgO2n/WZwoIAfHFOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDnjUaxr3bcBPMsP/IKk6RGTjGrEUSn48id/Epft+rs=;
 b=BYzNdkwpdhw/TD9/F+IxqnQU5APjWv8x4dCx1C7+r6LWQsNxGOZV3XJ9JTYI5h7vC1lLOp4qOprXbcuUwcdFgW2kDmXqs1pTMivwqok62sISXnD6WRy59H1MWiiCbyhEZOut0KtPqbzgWktbEOUaCh8wDim/BcsnJXcxX/Jf2hW2NP3qaBaSztDrLRbsNdjpywCd9gP/aiLoZeNjRxfwKdMThb3pLNBfMyvOXijFrhA1zcjIFv/M7nk4t+y4+fmVESs9IoPLY/mgXJ6qHNvIBFSaFvd2pqusU0KDLBtLGFR2S6Tk8NsET+08t2KisMxx+RDCs2VFvnFZYxMYTVOJVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB8354.namprd12.prod.outlook.com (2603:10b6:610:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 01:23:44 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:23:44 +0000
Message-ID: <5c85f08d-8fb7-4d9b-a7c5-5ad9b991521b@nvidia.com>
Date: Wed, 25 Mar 2026 18:23:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/31] gpu: nova-core: Hopper/Blackwell: add FMC
 firmware image, in support of FSP
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-13-jhubbard@nvidia.com>
 <DHBZF8OMKTXR.3SU4C77OS4WR@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHBZF8OMKTXR.3SU4C77OS4WR@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec44eae-fe23-47a5-2212-08de8ad6525c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	db5O0uEDawWMZqAAH2eX0VNvGLm2nE/CuQq/aYijfzTCtepSqDptHlz2aMEtGaz5uFdEXAUdhB3O1Q87ENgyMoEDfq7cg/8q26n9EEa0xi04coNdS9icc89zvtLhmESvU2QTY218B/tKz6EK9iViQe5a+UzfWVfvGqTPkqXfcRtGX6X0tnB4Le4rBAHtE4KJ3iyo7ZPxQ1yRI3AyNUebMX4wFuK23OQDX+mU84Gq0sLXgpqL0VLfVsebrPwVJ++cm+GFJG/oCkm7A5feMCdFaXBXkSZOHAevuhdYOwvC5D6dN8T+ZjzKdR5utE9mXWp8yP27xdCrNvcew0z7k46HrSVNE12jgv9TZFpfPbjXrr/+MJ3krlmSQ9+QSVZ/JV3YD3qwypkTbi2u6o4gViPoaam7W4JIi3YSbh/w//SkC3ZXmXMhLmiKAkiqkjxLjjplBTTBjhcNDwJOaOHN+jMILWFs/JmKK92cympas1PIpjWfZbzRapaBQryMW7jOZ7lnvQOH9t5lB1ltqnRaf8nvbE1Dr/HojlD0U2XJ3/18zibDvLUfTmSXBeVWm94xPMFblx7RlCjWbifnGPjF2CcVhz2SOvRxe/SthHL+XI6IB+nep9/OftGZ16a0hJcHSjGcjzNskFBKvWV59LaofnL9lLm4bdixhyrYRMCFkwRvhhwQrNzCfm/pURN3OmUjnERHW/1DrjFadbVKc7kdQ3bKHqGoppyj0lULikutTTC8/8I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVU5dGRyRGVTUDlHQmxMWm5mZmNlMUtjdkpzMEhKa1JrZ0l6UEt6cm96MmpF?=
 =?utf-8?B?djRoQUhoWlgzTW10SFUyUlduWUludUdaK1cvUjJ4Tk0wTFAzc045T1FzNHhw?=
 =?utf-8?B?WlJlV2FGdHZMeWo5dm5VVzc5bkVPVWdjTE5oelRGQThJbko4aDZyRktIUDRG?=
 =?utf-8?B?VWJ5eGdCQzkzalhPYW96SENlbjlNSFd6ZU1rT3ppNDRqMlNlMk4yOFJPNndl?=
 =?utf-8?B?VGlycHVodUVWMXRWS2hoUHJUNmZkSk8rUnpRWm5XdHdzek5hRStOcTBlaFpM?=
 =?utf-8?B?YlFHV1djb3Nuem8waGMzSkI5RnNVclFMSHpocUEweFA2UmF6MWlST1F4S2ly?=
 =?utf-8?B?ZEo3V3BCS2MwQmJObHkrVXJ0VlBiU3V4WndKc2pXMTkzSzI2N29FVUpuYWk5?=
 =?utf-8?B?aXE3eTZrMjB1ZU56b2xMM1cyUlVoaEZvRlJBckVZRDIyY3ZkcTVJWW94UXN1?=
 =?utf-8?B?WXErZVl6ajdLR0dTSGhmbnYxYS91ZG5oK3pDYWxQdTJZS3VzamlDU3ZuVU9s?=
 =?utf-8?B?akxmcVR4Nlg1QWdhZERyS2NuT3JsbXBLVVMzZml1bWloWW11ZmZNcDV4dDVK?=
 =?utf-8?B?SVRzOEI2SXpOQVcwZ0NQUG92MFA0andNZm5iK00yUVYwcjJQS3c1QWl2S1ph?=
 =?utf-8?B?NWRib0xoZStDdjBvK3J5VEE1aDZwVlVhRytQR0oyUFJwZWVVckllaC9MejQ2?=
 =?utf-8?B?SWczek9vZGpmTFNzWWovMmduS0RCZzFXWk5TczVUcm9MMExxNmxEdWVja2w0?=
 =?utf-8?B?ajBQYTB6SmRJaXN4YmJqbzZkUk5HVEp1NURkNC9RZEhDdHBBQUc1UTRpUnRU?=
 =?utf-8?B?NmF2OU04VExNdWM3MjhzM2ZqVDRhaEVVNzAzQUhHRkorT1NZcHozZlZVei9l?=
 =?utf-8?B?M09zaWxkR0FPR2hMMFU2NytXblJUeTZOQk9VbFNmQnB1ekFyc2Q5eU1oS1Fs?=
 =?utf-8?B?U3RzN2N4QlpQN0lFVXhBSjlJTkNOMmR6cnpLcHBzVTZRM0Y2NkNjM3ZtZS85?=
 =?utf-8?B?VXQwcFNOaURDSWFpWDZwa3NzOGdGd3lTbnBsOGtZUW5VUk1wSnZncmhCMEJX?=
 =?utf-8?B?Z1k2Q3V3Rm9DTUZjQ2kyYlRIOUpIbVQyaWFaMGlGZGVDQUpYbGRYYWRmU2s0?=
 =?utf-8?B?Mi9IVjdYUnBZck9qNEFUMkFlSFpqTHc2LzBwZ0dSbm5kUUlqVnFLMFRtdURt?=
 =?utf-8?B?Z3kwK2NiUlRrbTBNbG0xQko2V2hUakJWSEVrMHZNMndLYVhJcUFJK2QvSVFk?=
 =?utf-8?B?a3Z3RjlKTTRFbjBxK2RWUGlHeXRBL3lPN0NxWHdtMWlSUXRYOUdRczZHRlUy?=
 =?utf-8?B?MC9ZS2dqaGhwNTVYOFhkL2pxamovMzZtWUhMbzI3a0d6OFd6a1I4MXY1VndK?=
 =?utf-8?B?V3NNR3dZYldCOFVyazRIRElOK3Z4N1BKcDJMamVmdlBiZUhrZXErMVBqS3JX?=
 =?utf-8?B?UVhiQ0JzN3Vzb1BXM1ppZE1raXJOOGcrOGZxL0FpeENOWnF0TXB2bEhyb1Y3?=
 =?utf-8?B?Z0NFN2swZFhqdURvekJiSzk1TittRDJ1c0tlUC96WjZKYmhVL1pRR1djQlVG?=
 =?utf-8?B?ZElQeWlRTFNqeFk5aW94ZGxqbkpOUTNvYkJDQ25GaGZNT3U3eHFSMEk4V2Z0?=
 =?utf-8?B?Q0s3V0VUTHdSK1NOM1E0S0dON2dsT0xoeXo1RW5OLzhjWXRXQXpvVU9FS0tt?=
 =?utf-8?B?Q3AxbUwzV0ZySEFIQUFUemE1K1lhWGR5NTFtS21qUWdRMHJhcWxOL3ZNWnY1?=
 =?utf-8?B?TFZXQ0djQXM2bCt6ZnNLVHJmN01zcVZLUWptc0ZpbWdER0UrblJVMTdJeVgx?=
 =?utf-8?B?cnpLOXM1T3ZEWTc5eEZqMnhXa3RBMXd6bng3UE1JNnBBazQ2KzlPclRwdUdz?=
 =?utf-8?B?Qm5GaTd3eUtoSE5ENEExc0tmbjBYLys3aTZuR2FnYU9yYkVaN1JUSHpBaDVm?=
 =?utf-8?B?RmV0My9FQXBVWkpyVXZCSjI3ZS9Kams3OEF0THBkbjlvNGU5YmNzcTJSb2RS?=
 =?utf-8?B?eHJ4UG84NndPbElwMmhRK29MSmx3cGpCV0huQmxmc1hXbmVXektVVHpBdm5n?=
 =?utf-8?B?QjFvbE1vcFJHczhTVFBDTFJYTnRXem5kVEIxQnBma3IwYU9maGxlenk2RCtZ?=
 =?utf-8?B?clFsbFZsTEFjc3FsTWphbndXY0RPSmJ3Y0VUYTJBWXc1dVJzNVFDVEpkWmpO?=
 =?utf-8?B?aGYyRUNES0VwVC9UekEzSE5XSmVtVkdKeVRmb2ZuS3dLZ21iRkxBWEtQS3Js?=
 =?utf-8?B?R0ROdFAyWllmb01WUTNRMzJPdWRFMmxmMldqK0dES0tabFVRR01zQmVCWUxP?=
 =?utf-8?B?UjE4R3ErNm8zQXllSlFvdFp4THRZcFBjYnB6cHhIVWpCSFp3UWhSZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec44eae-fe23-47a5-2212-08de8ad6525c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:23:44.4432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3I3a1gEDvLh1MjoNzB7vsjDf7f2NZ+Dg9YvNEFFKlBLAmj7x9mI60kYPMbKy1s1CxiaK8TI//G1a/njLdsBY1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8354

On 3/25/26 8:52 AM, Gary Guo wrote:
> On Wed Mar 25, 2026 at 3:52 AM GMT, John Hubbard wrote:
>> FSP is the Falcon that runs FMC firmware on Hopper and Blackwell.
>> Load the FMC ELF in two forms: the image section that FSP boots from,
>> and a CPU-side copy of the full ELF for later signature extraction
>> during Chain of Trust verification.
>>
>> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware.rs     |  1 +
>>  drivers/gpu/nova-core/firmware/fsp.rs | 47 +++++++++++++++++++++++++++
>>  2 files changed, 48 insertions(+)
>>  create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
>>
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
>> index bc217bfc225f..bc26807116e4 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -27,6 +27,7 @@
>>  };
>>  
>>  pub(crate) mod booter;
>> +pub(crate) mod fsp;
>>  pub(crate) mod fwsec;
>>  pub(crate) mod gsp;
>>  pub(crate) mod riscv;
>> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
>> new file mode 100644
>> index 000000000000..5aedee8e6d41
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
>> @@ -0,0 +1,47 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! FSP is a hardware unit that runs FMC firmware.
>> +
>> +use kernel::{
>> +    alloc::KVec,
>> +    device,
>> +    prelude::*, //
>> +};
>> +
>> +use crate::{
>> +    dma::DmaObject,
>> +    firmware::elf,
>> +    gpu::Chipset, //
>> +};
>> +
>> +#[expect(unused)]
>> +pub(crate) struct FspFirmware {
>> +    /// FMC firmware image data (only the "image" ELF section).
>> +    fmc_image: DmaObject,
>> +    /// Full FMC ELF data (for signature extraction).
>> +    pub(crate) fmc_full: KVec<u8>,
>> +}
>> +
>> +impl FspFirmware {
>> +    #[expect(unused)]
>> +    pub(crate) fn new(
>> +        dev: &device::Device<device::Bound>,
>> +        chipset: Chipset,
>> +        ver: &str,
>> +    ) -> Result<Self> {
>> +        let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
>> +        let mut fmc_full = KVec::with_capacity(fw.data().len(), GFP_KERNEL)?;
>> +        fmc_full.extend_from_slice(fw.data(), GFP_KERNEL)?;
> 
> What's this copy for? It looks like you never need to modify it, so keeping hold
> on `Firmware` should be fine?
> 

Right. Fixed in v9, thanks.

thanks,
-- 
John Hubbard

>> +
>> +        // FSP expects only the "image" section, not the entire ELF file.
>> +        let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
>> +            dev_err!(dev, "FMC ELF file missing 'image' section\n");
>> +            EINVAL
>> +        })?;
>> +
>> +        Ok(Self {
>> +            fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
>> +            fmc_full,
>> +        })
>> +    }
>> +}
> 


