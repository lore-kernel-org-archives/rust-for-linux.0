Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011018.outbound.protection.outlook.com [52.101.57.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B23A2BE7AB;
	Fri, 17 Apr 2026 14:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776435874; cv=fail; b=LDekVMw8hGB+vVAx11iOtXaJz1XaembyFqPDbZvnVXvYIqKVmtS1QHwr6BRh0hk7jIe3W8lxK0BwsfJrYX9MN04sNl3o68eB+AQ4/b5S5mJLoxlF2x0rvzof41B3QMoNxgirxb0VwLxCQd7WGVu+zDUlsa/mErAiwBu2z6RTdOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776435874; c=relaxed/simple;
	bh=cLImIVzLKMJohBxSs6tKRTpOmsqgTMkmuLczkNAHGh4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=QUG15X1SkLG6NMICYmMMP9NzupAcf6BCs+L7HrdGRJUfuqiYggkwfmriCsUMCi7s65HgmUyH/usBjCwCexr10XBjnonnY+lcLuo578Vao0cnvWdf+wjJ2ksLl0co096bdeEOH4J2b69cY38D91wPyMmD/C6m6Jhte33B4O5gis4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A+m49J1W; arc=fail smtp.client-ip=52.101.57.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A+m49J1W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUL7lvogmwN1nKjhHnkKHk/erfPj0N9Fb/wIiLemnXOy3PURbVS6uv6UuoPJCsXFyKGqYZlToFssBtCgUDYLYJY/7Zug9ABACvPRwqBW427S6jF92MNltsVpdT69kJj2vwD8luQuqSNddzeBR2/AsM7JKPPP1qHDhslAwfFZxqBw/H5tbTk7DYq0Cum/7Bnu5Enqu369zj2gjEKvkX9ggsdb2nW7u7Hl8ywu8UGxkKfSHUcezMt3POoM69g7+f8VfglH+aB5jilZ0ISIBHEd3nRmUix1FF9ALeH7wzLF5LAvOYnLOW/2CL0iJXWDJk0abUm6O6jHVCIXnFR3CcTQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJIeOMtViRQ+Kw7gFiwOhjleL+0Y9HT7oqW0OpIGPh8=;
 b=M2icgXgTF1A9sS8CBSQUAYTUpjOp1au45fOFg3Ok9MP+anitu0PiM7vLobv8lgjCXvPgaZnXTQk6YHa03GG3dPfxWEvOAAWdUcB0A2RjzKEXewSDz8/z1HiDSuU+XcIGMu9h8H8oU80yjUWBq0PzYpvCtedGyqLzQWie/T/biKIHjGekge36fBZ/fDFYW7Zn7FKyyatkDMUsn8+w7I2//eI3jVnJTlIfR8cz5ZVzwwrytYTCr+S2CzApQf42IdKu+OjZb18d8Rre8tqwTI6j2E5OWnHZSJxkrT5ZyFHCwgZqOtXXz2eryg/Wz7J3R8T8ZuCBnI9KO93ZqX8wZV3H7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJIeOMtViRQ+Kw7gFiwOhjleL+0Y9HT7oqW0OpIGPh8=;
 b=A+m49J1WwSFJ073RmzkyPP/F28zJhZYTNomoKyQBQf+ydSbVXSP0HMvxFv85SMklqWFJ+RUfQTa8buyUWFPKA2FQJ2cDBBtVGIWyetqPujA1OdJlZGK67JmxJ4r1HPl10UDbOgxU9y2AYhH2iR5ngdEAkuYsbVnF96OJLclo+dn0tEfaWasWE8LdxpdqLjKlvLXalhOBq7mTL0mW8DXOg/Ukz0dxqqGxpg8kUx4rMDhZkfC12mcDnQMb5MXNi3Bis8lGlswCmfk3uXYaveIqFztedCvieND+9CzuNdmhc5RL9xuGP6Np8DNAWdWE9WAnWJrfomx/y//eUJfsiDHdBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8135.namprd12.prod.outlook.com (2603:10b6:a03:4f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 14:24:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 14:24:27 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 23:24:18 +0900
Message-Id: <DHVHYF54HOAA.3A11GW7G3WI7N@nvidia.com>
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
Subject: Re: [PATCH v10 17/28] gpu: nova-core: Hopper/Blackwell: add FSP
 secure boot completion waiting
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-18-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-18-jhubbard@nvidia.com>
X-ClientProxiedBy: OS3PR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:604:dc::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ac35b9-44b0-489b-6653-08de9c8d07dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VE05J8BWeeDmnXKpc4RSLTGme695H5XUAyW8t0lH/PpJhovCDbshfF+ne8liagGYhnnj5FrY7zApcZVO96+x5cQeG+46uX9etqHPak1dlfWZiPJEQ5PtmZJ1JgND1fiv7nukNJAqG8VON7K2fqNBF7oUonlQst78jgYffIjuG2yrixdRcNGIPqJTP2XdKfzDsNjY3hqfO5ojEh/dl2MdRPL5vxknXfHkDtBTvpMomx7pcg2EZHiooTlTr2tpIpw1hIywWGYf+rQW0U+ZhEIOHxksw3PX1pG7QdXtefUGWfk6dQaevhTznmP/9yk1aLG96fD4j7CYIH5G7d+xAzOTiyaP8rUmxL8ADUcIaKJjORMsu0HvS45O2hNlaVWMIvKxVBj6NmBu7lv9O2gA+Hau1n965Rqxr1d7TkIMD07Gft9lKbVQj6jcsqWo0bTZbTI2mS4mKIogXTXu8tmmOhd5PSwwuE4OPywwkVF28AYVHrU6w04Uh1vrwpkL9MwoCMcIpuSZeR93yreIRayR3f8OxGelE8gmvnBeDweYNpHuNywpHPwu4AUMWfVL5Zkg3bScv5MVr6mY3z4p1GwQYIeZGa+0JgiQTq2M5nLB4M3iNAbnLx9Mp/JC7wvtdkXzqsx+f/L8w1DN5jhU7Jz2oTUEpitUrB2d5X+2lL/cGAZ0xH5CDsBOPKx5MdQyM6qMhYrhPfAgHSIxzBmaX+l+ZfUw3O4Z1uvAfdEXuv1+2MEG/Js=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWlFS2gzTnVnRWNZNkFhUldUWHFTT0VlWDhGRlhzMDZkYW1RU24wV01rdXd3?=
 =?utf-8?B?ZVRjRzZ4T1ZiRVZ4cloxY0pqMm5WNzZiOHZSaWxhL0x6aHREYktEcGpPREdE?=
 =?utf-8?B?YW4yTU10T0t3bjJsc0JwOEpEdEJCN3JXUU5CSGlpKzcwTW9SU3dueXpVdUNV?=
 =?utf-8?B?TkgzL2dBUXpVSm4vMnBlRzZUQ1NUNHR4TGVGeXNQMi9uOXhUay9lRnJkUSsz?=
 =?utf-8?B?alNBaTZVSUN0b2xYQ0dUTnY3V1VBTWRYTmtYNDMwdEhmb1dDbE1vNHR3NzJG?=
 =?utf-8?B?UVpCZEE4ZXBWZzFPYlY2UzFtUkdHbUp1RDJCeDg4VUQxVzI2ZGJPSzBLeStN?=
 =?utf-8?B?T1pZSW5ad0FjRlZGTFFYemNQZDFSZUxIVHBPVjFaSjhPeXRUTnhoRjBSc2tj?=
 =?utf-8?B?d3pHOWtCK0xnTTNQaGtnM1I2cWhDNWtqUlhqMkNsZ3hhOTVsOHJ2N2laN3VR?=
 =?utf-8?B?bVlmaThrVy9xSzY4ODB0Q3g1ay8vY3lMNy92b3pLQ1JFbE90OFRJM3RIU1hV?=
 =?utf-8?B?V2svZ2hNZFlCYXVQL1VJSlVCYzJHbFNUN1o1Z3BOeXVlTUllK09sdHlkTzcx?=
 =?utf-8?B?eFBVWVpPWWZPQVlydTMwUmFsWllGNFoxTVFrczJiQ3FZYjNMVlk5M0NyUDVZ?=
 =?utf-8?B?dUNyK3ZYM1pSaGZVM1pYcUNsMUszT0RPcmZRY25qOGdTbTMramp2aGd5TW5p?=
 =?utf-8?B?WGhKUFdGRzAvbHpYTVJnd09aL0hGSVVNNG1zZ1p4RUhqcUF0cEQrRFAwZXAr?=
 =?utf-8?B?Qit3NFE2SEJZY1M2OTlJYUt4STEwVERXMFE2WE9lQUcvaEdXRll0SENWMm9I?=
 =?utf-8?B?aHYvQ1NpeFFFSnlkVGxHZnFxSUMvMTZtampaUk1iLy9JdVZNOEw3UUhVQWZ0?=
 =?utf-8?B?MzJQL0haY3lUQXdXMXcyTldyM0l0QW9OSi9NS3ZtalhIdjcydzZoTzFtelJZ?=
 =?utf-8?B?OFpNUVNlZk5XWkxsL28wdU04dHNlSGR4aExFYnR3VzkwT3VhTTdkTHVsRklZ?=
 =?utf-8?B?WThmVDZDWkt3N0JxcDVnOUhnbm5VSXlUZGpaTU11V2FKTzhkUGdPV3laWjNK?=
 =?utf-8?B?bnEyZW10QjZXdE1zOFJ3Z3JQZXdnNlNsQnR0NjgvaUJIckRCd1hqSjQzL001?=
 =?utf-8?B?cW1hOXUyTUFIQU9EUGNzRkJnV1lLVVl3TjZaRUFlOFJXTzl0SzRoYnlleWdn?=
 =?utf-8?B?WmhScTA4ODMrU1dKeWk3NnIxNldaT0puMEwzbkthK2tRQ1pDRE14TjE3SDVO?=
 =?utf-8?B?UFBrbEFlZWJhK0c5VWFrQ0FnZUtyVTlpbFZqU29MUzAwVmM2MEJnQk1oekVs?=
 =?utf-8?B?TXNoSHdlZmtQdFFod0phUWd3Z0JReTUvOEU2YVcxRGE1ZnlQODR5S2hKUEdS?=
 =?utf-8?B?eHFSZGxocHhBbVpyWWZ1LzBXa1N0b09GRHM3YUM0TVRBMUgydDJaNmpzNmJN?=
 =?utf-8?B?MG4wWnBsWUphL3oybGc1anVZWHN5UHJEQnZtZXgvQnM0aUdwMU9CUWx4aTVS?=
 =?utf-8?B?d2xsUkxlK3FmTVNlcHhPNlRodGlRRGU5K2ZueUY1cXJGb2twT2M1aEcvcHZw?=
 =?utf-8?B?ZzZTOFgxNUxjYkl2YVNDdHhmYWFQT3l4UGozVDFrQS8zSUhCZFRUQXkvb2ZZ?=
 =?utf-8?B?QTJDMEg3VXRYT2NWWEwrWkZhejdMS3lzczJHWEkyaFpJUm1Xb1FPdHUyOXdz?=
 =?utf-8?B?dXhyTGJpSlpKV0pnYTJWZFJFVEtHWTFMNFdzejNCWmgxSUJLVnFIT3RLaDVa?=
 =?utf-8?B?VzhTbFVab2tsZ0RZaUtZM0hKSUFIbjRuSy9RblN5L3FkTisyeUNJNzZmZlNy?=
 =?utf-8?B?MnY2Y0czSjdHSnFDSUppclZSUEpDdVBzbE92OVZuUTY5NWx3aHVZb1cwVDRM?=
 =?utf-8?B?ckJrcmRnT08yT3oxbFhjSTNnUTI4dCtteHdrTTl4cDk1RVV6WThoLzcvb3I1?=
 =?utf-8?B?NkFUNCtDODVhV0RaZnRheExLOEo5VXZTOWJtcGhBNS9qcWttRUV0N05aeVNs?=
 =?utf-8?B?SmEzbmdFdWdCL3pnL29IKytzTnVvMlFUbXFaZS85V2tNbkZtTXdZM2xXNzg0?=
 =?utf-8?B?b2MyOFZZaDNVOGFPaHcza005MUpEai90T3dEbHlwa0RMcFVaMDE5dHpWWU5o?=
 =?utf-8?B?ZnFWdDcvUjhtNGhtRWtZeW1hd1VKaGVwN0FrZ3pEUzRmZllBdXlLWEppNHRS?=
 =?utf-8?B?THVWQ2JYVzl6ZUdnYnN1YnYvOEVpQWdPWWpsUm5oMEpnOUVQcDJmSVppMFVq?=
 =?utf-8?B?c3VTQW80RHlMZmQvNllwYitoUS94OVhiQmdGMkJycjRBRGZxMmtXUWNQSUNl?=
 =?utf-8?B?SHhTcGNRaklhcFZ0Smg2a3J2T3A4OTFpbzU3VnBTMUQvR3M2WnhVanlJWkRN?=
 =?utf-8?Q?MpjkFlEWDB/cVkI4z2FQ3l+nfS+3nM3sjFjA93XHgWC1x?=
X-MS-Exchange-AntiSpam-MessageData-1: VT47A0dmAJSvSg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ac35b9-44b0-489b-6653-08de9c8d07dc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:24:27.0985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iOvyndoPTp80vYOUveuCK0gPOFsDSwi2zTO5F1XrcBOl6Nk0E31FTe4DBTPpoC22nUKGF8tEM/NaG0G/qjwCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8135

On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
> Add the FSP module with Fsp::wait_secure_boot(), which polls the I2CS
> thermal scratch register until FSP signals boot success or the 5-second
> timeout expires. Hopper and Blackwell use FSP instead of SEC2 for
> secure boot.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fsp.rs       | 53 ++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/gsp/boot.rs  |  5 ++-
>  drivers/gpu/nova-core/nova_core.rs |  1 +
>  drivers/gpu/nova-core/regs.rs      | 29 ++++++++++++++++
>  4 files changed, 87 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/nova-core/fsp.rs
>
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> new file mode 100644
> index 000000000000..55e543e80de8
> --- /dev/null
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
> +//!
> +//! Hopper/Blackwell use a simplified firmware boot sequence: FMC --> FS=
P --> GSP.
> +//! Unlike Turing/Ampere/Ada, there is NO SEC2 (Security Engine 2) usage=
.
> +//! FSP handles secure boot directly using FMC firmware + Chain of Trust=
.
> +
> +use kernel::{
> +    device,
> +    io::poll::read_poll_timeout,
> +    prelude::*,
> +    time::Delta, //
> +};
> +
> +use crate::regs;
> +
> +/// FSP secure boot completion timeout in milliseconds.
> +const FSP_SECURE_BOOT_TIMEOUT_MS: i64 =3D 5000;
> +
> +/// FSP interface for Hopper/Blackwell GPUs.
> +pub(crate) struct Fsp;
> +
> +impl Fsp {
> +    /// Wait for FSP secure boot completion.
> +    ///
> +    /// Polls the thermal scratch register until FSP signals boot comple=
tion
> +    /// or timeout occurs.
> +    pub(crate) fn wait_secure_boot(
> +        dev: &device::Device<device::Bound>,
> +        bar: &crate::driver::Bar0,
> +        arch: crate::gpu::Architecture,
> +    ) -> Result {
> +        debug_assert!(
> +            regs::read_fsp_boot_complete_status(bar, arch).is_some(),
> +            "wait_secure_boot called on non-FSP architecture"
> +        );
> +
> +        let timeout =3D Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS);

Let's inline this `timeout` in its only use site below, like the other time=
out
is.

> +
> +        read_poll_timeout(
> +            || regs::read_fsp_boot_complete_status(bar, arch).ok_or(ENOT=
SUPP),
> +            |&status| status =3D=3D regs::FSP_BOOT_COMPLETE_SUCCESS,
> +            Delta::from_millis(10),
> +            timeout,
> +        )
> +        .map_err(|_| {
> +            dev_err!(dev, "FSP secure boot completion timeout\n");
> +            ETIMEDOUT
> +        })
> +        .map(|_| ())
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 1998bd230185..9609cef3ff51 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -33,6 +33,7 @@
>          gsp::GspFirmware,
>          FIRMWARE_VERSION, //
>      },
> +    fsp::Fsp,
>      gpu::{
>          Architecture,
>          Chipset, //
> @@ -199,7 +200,7 @@ fn boot_via_sec2(
>      /// the GSP boot internally - no manual GSP reset/boot is needed.
>      fn boot_via_fsp(
>          dev: &device::Device<device::Bound>,
> -        _bar: &Bar0,
> +        bar: &Bar0,
>          chipset: Chipset,
>          _gsp_falcon: &Falcon<Gsp>,
>          _wpr_meta: &Coherent<GspFwWprMeta>,
> @@ -209,6 +210,8 @@ fn boot_via_fsp(
> =20
>          let _fsp_fw =3D FspFirmware::new(dev, chipset, FIRMWARE_VERSION)=
?;
> =20
> +        Fsp::wait_secure_boot(dev, bar, chipset.arch())?;
> +
>          Err(ENOTSUPP)
>      }
> =20
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index 3a609f6937e4..53558ac0f619 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -17,6 +17,7 @@
>  mod falcon;
>  mod fb;
>  mod firmware;
> +mod fsp;
>  mod gpu;
>  mod gsp;
>  #[macro_use]
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 6faeed73901d..e4de7bfffde1 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -511,6 +511,35 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>      }
>  }
> =20
> +// PTHERM registers
> +
> +// FSP secure boot completion status register used by FSP to signal boot=
 completion.
> +// This is the NV_THERM_I2CS_SCRATCH register.
> +// Different architectures use different addresses:
> +// - Hopper (GH100) and Blackwell GB10x: 0x000200bc
> +// - Blackwell GB20x: 0x00ad00bc
> +pub(crate) fn fsp_thermal_scratch_reg_addr(arch: Architecture) -> Result=
<usize> {
> +    match arch {
> +        Architecture::Hopper | Architecture::BlackwellGB10x =3D> Ok(0x00=
0200bc),
> +        Architecture::BlackwellGB20x =3D> Ok(0x00ad00bc),
> +        _ =3D> Err(kernel::error::code::ENOTSUPP),
> +    }
> +}

This function shouldn't be public as it is only used by the function
right below. But anyway, it is the wrong way to address the
architectural differences since it bypasses the register mechanism
entirely.

The two NV_THERM_I2CS_SCRATCH registers should be defined in `gb100` and
`gb202` sub-modules respectively, similarly to how
`NV_FUSE_STATUS_OPT_DISPLAY` is defined. According to OpenRM they should
both have a 32-bit `fsp_boot_complete` field.

Then, `read_fsp_boot_complete_status` should rely on a FSP HAL to fetch the
correct register (again, similarly to how `NV_FUSE_STATUS_OPT_DISPLAY`
is accessed in the `fb` HAL).
