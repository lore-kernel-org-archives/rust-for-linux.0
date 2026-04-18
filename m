Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012061.outbound.protection.outlook.com [52.101.48.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0AB296BAF;
	Sat, 18 Apr 2026 01:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776476824; cv=fail; b=ttQQYdDVSai2FZ2i1hgjxy5yhNu/9fHVljyGSvEpH2pYenIEqQ+xvJl/E6TyVr4NtP4AzNtDdWS4kHwSHFHHtsNqyq0Y2tSe+QMirL9piSVuPq+OQIfrtxzq0/Q0mkl84z8CuhqwNnsrHVuzC9tHNXsrSv4pDY1TFT/8PYzZ0nM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776476824; c=relaxed/simple;
	bh=SoU4mdKJQXDDy+l8UFA5Cb5DxjsFkxfP9A2DkpNjLEs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KLFOtB+5IABqX1UJxbcbH3BuhC8Dylt7QdyRNe2BX7HfZaMBgFPdRiwGwclH/YmDyBgFxidKu+RUfYlj2TlbBTK1hRkhO9xHo6ree17rJcd1VPivuLfS8uNqrmhjc7tWlalpXgsxAZEn+bU8Tn2GxjrXM9Qfn/U4G+ivDBGuJWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tzq1C5Wk; arc=fail smtp.client-ip=52.101.48.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tzq1C5Wk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQgmCd/98l729cBZ8K65r4vl2F0C+GHcnV+NAXKRZxZMPSuOy5ymTpidhuUW6AI7jXAKgvIpoEXhTwckzoSAN0RkxJMqTzPSek1mPq1Ld+NF87lJIgvMet2zI5QCuba6MqvSdJ2f9jJ6Wk8WvqO7n+Qm2QfOXhNaX/cfC1oWVSrwOIiNJfN1oIqOTtqwiqaCZtGE2xYwz2u65S5ehF9b9ITceGa6gaHMerOC9BhuGvvVaeIeXE5t1v9ABJKVe5HATHMYZpbqSdNsp67YOldqNMvUKR3vIflrElGiEkWOz4pCCBPGoxpIDsl4szcdo+GkZqAomBySVrj34kXNwMOCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgXMM77+tomzym5RaB08ZSbolenI2q9GYeFWDHiaUL0=;
 b=eSaIv0KrhGIfDKpfQA9BVKFu0fPMATpPRvn61u3ZDwmMXlwfdI7IMB2wNZazxg/68aq+OVgPVI5s3I1jxFaHD6c0ihHExQlh0cJ2BwJ0ZSCQERqJvKb/CIG8Hu4Te8OrCCk/e6MUmma4d4ZONNjC6HRmmoyVz0803QEOnTcgNug6jFMaI3iLGQRR0bTfCluvn24TcUnMYIq3sdjdMIQTm16/P6Mo7GBGUsVDhnPZD1tNJoLqi6ywrAZFb3V9xlNszeYqj80lcV1ErBUGuWWRLN9XTRf1c/UK7vgMvrshP0LZ7sBoflHlaf0klHyEs8xz4BaP9A0DV7oy7grmgkzvSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgXMM77+tomzym5RaB08ZSbolenI2q9GYeFWDHiaUL0=;
 b=tzq1C5WkuLo0khRAdXSG4I5Eh0tskm8hnwH7ASlznQ7ABJ9IZ2Idc+cSRP1vYTi+8UZmmMql2gc28j6unT1fRzjNKJ5AR1R+EbfWqPz4ZrTM3CnDWeWpmM8kJ/ss/BvCCXznyEYx9uvaUAqoS+N0qjF6FbuJwZ4ZQk9eBBMbAbK5S5RRzT5mSHaDgTYJG7Elf0lEzkey1LvWQCvfcqP86gb/AsVn2SGRkueU8VFfwXULD8zAOFvLjzYSyIWK8UxL9fZNLycbrgC2xXN/RM351bX8ejUtS/C1Jcb0D5/uBv1uJEzqv7lzdRx4iR0uJ7njvJE/34CzBMWwFMUXlMkP1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB8181.namprd12.prod.outlook.com (2603:10b6:a03:4f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Sat, 18 Apr
 2026 01:46:50 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9818.023; Sat, 18 Apr 2026
 01:46:50 +0000
Message-ID: <e0bc7607-9fe8-493f-ba4e-19612be54d33@nvidia.com>
Date: Fri, 17 Apr 2026 18:46:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/28] gpu: nova-core: Hopper/Blackwell: new location
 for PCI config mirror
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
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-10-jhubbard@nvidia.com>
 <DHVHY4WIJ66W.1193DRXT7CFPE@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHVHY4WIJ66W.1193DRXT7CFPE@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: f0910d80-1c73-4a68-60b7-08de9cec5be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	n+83gWzoGSSa9hsu4Gq2Fs1+C2DRacE5vlqEOwgWzQ07FRNQUZjzzS0JflgndmeI0Q+QXErV0btd9qdJ6+C4sweUSm4jb4/1NAm74ItSrY2GNSdn6HtS/8KMmRXzcAvNnL8N/DVWbwg6O7OmI9zsQJFY3pqhacUmAECCNjTqPpuwmyOvAWWFiFMHHw3nwjc2hgjPGgRSE+L2UVixcxMXAx5hx6FH2ONkPbfmGdN7uJEQguEPkRDMCouXEy4caigcSa3f0l4p9rkKJQ8K1LY8Yb2CVtcW1uHkfiXWUSQjal+cvaJNN10nLQEncruFuXtNf6XhvsIRwW53N31f8Vj6YVKCzwdMR5c+NITymHY/gwbbEtFUfUYuGGjZejCl7qxlebHNLJsKVcrjL0wCxfIuaaiBWp3WrCvIjF2AjClBbXGNb3G2nzbIiaEH7S9I+9clrWeFifOwOIUpF0suTZZ+/i7xUUrDtCdnnHgKfkdRh5fdJ0H26dGGj91nl5aDAOYn4vkycWzR/d27QDjZ13I862Pa7VgxsR308Lmp+V2CFnBSiE/gTnJ9haICaFmJ5Bbf0asCNgBj+abZONyvoqDA/CKYqscYUSEXiSc6iSKVqOfm0VwbzpDYI11zCmRmfZR/QO9H+WBHfD42xYPoHwNw/NcSIbFjJRJnI6yeyjpJ6rOynIySS9mD4IOOT6/eAeo4vIcktlsCBv8xG68jF43RGWmf1AZwkZngX9J53vV4LtQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzFQeXQrNGhmaUJvZXdSMm5xc2t4c2Y0K3ZiMzcvM2lBYUlNQ2FxNGNvQmNU?=
 =?utf-8?B?ZU1wMWhGSHgxZ0V5ME9EMEwvVGM5ZjdiNnpJZU55U0VOTElmS2ZaRjYvWmFT?=
 =?utf-8?B?UmUrWE1YNDNIZE1kQlJpd1RWbTNCWCtha21jVUd2UEN5UmEvODZiOHlxcXRw?=
 =?utf-8?B?by9lQ09tYkRtbitVTlNVVkZkTHNYL2xWN2JPWGh0ZStML1JocllEMlIrclEx?=
 =?utf-8?B?TTBxVUdTWDRoQmJ6MzVIcDUrRkR0NW9DNzVOUG51WjlwbG8vY1daV203V1BB?=
 =?utf-8?B?dlRJRXlyMEg3NDRialVlVFk3aVV4amNkQWNpN3BWZUx1d21HNnMveHB1bGFQ?=
 =?utf-8?B?eTExZWs0WlYyeU5Gd1NxQTZuUVdpYUFxaElrNHByNmczSGpqTkx4SzRPQUpO?=
 =?utf-8?B?OTZvSHBRTk8xRVFRSU9nSmc2TC9ac01aNExyZFgvRWNNQWVuRFJnb1BONEhz?=
 =?utf-8?B?cXBja3R2QWxScW92QllrUVhWdnU0U1FzbkwwcTRjUkt2WjY2bktxcDlRWVFK?=
 =?utf-8?B?Q3lHWXUyWVB0UVN2OUI3WHFqckU2MVVxSUNyTDhrbG5Uc0pDaFBGN0s2Q2NB?=
 =?utf-8?B?SDZtTGVNNlZhOCs0dXgxSkNBMEdjU2lyWm8wSlIwb1lFbmhUMzF1OFB4T2tF?=
 =?utf-8?B?UXNuUGtRK3FOVnRCUmlCTXlXbmp0MWVGclNoNFFublZQZXJtRWNyd20ySFp1?=
 =?utf-8?B?MkgvelV4SUJsTzRQcHd6L2gvTC9LYXNqaGVwVmtPOVN6VDNEVXNFR2FnT2FQ?=
 =?utf-8?B?Ukx2Y2Exd3hId0YxTDdFcjYxZlhYclI0ajJGa1R4UWJaazhwcXVSWk84OWVx?=
 =?utf-8?B?Y1FadVRMWGxsdkxUbEtpYXRqVHo2b09MbU9tZzZLdnN4QVhMSG01VzB6T2Rr?=
 =?utf-8?B?clBKUkxxRmNhUVgvR01LS1JHSEpCZk9BSnorUC90N2lVeXNVM0VQamFDdS94?=
 =?utf-8?B?WFVSaW5sZXY3ZldIeHJNWjdnU1p4QzduWXJZR3hrTHg0Q3VhbWlGd3BodUh1?=
 =?utf-8?B?aEd0OUEzUGZlWjdUZ1ZTL3M1OE03d2F1Y0NMZGNBTnJWbURDVWpDYVVBcEli?=
 =?utf-8?B?MEtlVTlXbWtITVR2Mjk0UEYzZTdKK1ZrQy93VWNtNmdrQW9ROHRhV2QwUDRv?=
 =?utf-8?B?UTdrOWNSQW1DSzM2KzFSQlY0SFdSRko4MXAreHdXVWdCaXppNEh5Q2RXMXZP?=
 =?utf-8?B?dkV6c1VESGtqWDFFSmo4UkVwWHJ0RVlBT2pxaHFkbmJ0MW56SThkT1NoWWpa?=
 =?utf-8?B?LzJBTlV3akFNdDdvdURJdVQwRlhKcGlUaFhxRFFGTDZJSkJ3Z1VVTzlxcGE1?=
 =?utf-8?B?L1loVEszSklOT3ZFSXQvSjIwSkJYYUZiM2Q2SHFQenBGeVNaYjBGZzQ4bmps?=
 =?utf-8?B?aXI4ak1HMk1lK0t5VFhPaXFSN29BMkFVODVhMVBicHVRdTF2Sml3UmFmL2l2?=
 =?utf-8?B?YUVyUm9lR1ZEcXU1SGVaL1JlMTFyU3VHTUNoS1JTNUttUHNoUTdyZUxyWEVO?=
 =?utf-8?B?bzY1ZmdyYlVVUjMwcHVrdm1qSzExTW1mVDFLZVl4cHUyOXRGZXJXR3VnL2dB?=
 =?utf-8?B?dFMvazRnYUNJTytYR2FhcnJkYVZ0UkQ1MTF6RmxhamU5Zi9Ub3FRaTBHQk1a?=
 =?utf-8?B?UDlIV0s0T29XOE5aQWpFSDlvWVBmaHhJQ0VrNm1yL1V2cytDRUFyR1FzOEVp?=
 =?utf-8?B?WEtvT2QybnBkN0JkQzdMaGFWQURQMkRoZzFaYSthbHBZc0Nob3NKbkRneWYx?=
 =?utf-8?B?QnE0WHdkSDZpQjROcUFRSkNHck1SY2MyalNiWENKMS9ob0ZTRElXSjF4TnBM?=
 =?utf-8?B?MFFaV3hQRFloSTBiRmxTOFkrWGwrbGZWNFgvVWppcmNpbkN1NkxvZTRDa050?=
 =?utf-8?B?RUE2ZnNrSC9ORmtkQWFrMCtUYTVROFc2bVJ1OEgwQjBFMHZmbXhKTGpJYWk1?=
 =?utf-8?B?NXJwZ1lzMXc4S280Sm5LalVZSnRMbUdhVUp4ZDNwUVlFUFhVenlYZDNDaEFL?=
 =?utf-8?B?MnpUczlTSkxvbFVneUFYb1NKYkljNVBJaFI4Mml3NFVuN3Q5cW8wbHdmUDc3?=
 =?utf-8?B?NTZHWUJCaStHQWV3SXdpS0tDSlgweFRDNGZWWTZHWHl1cTFNSHJVNVY0S0Vp?=
 =?utf-8?B?Z25TZlBLUlptalZZZE54MGtnMjVLK0RvNno2Mm9JRzQrL1Y0TDFTV3RHSUV5?=
 =?utf-8?B?WWhNWlQzRmJpbms3cUtMK05pd0wzc3JJL3pkL2lpbnh2Z0tZZFZOeTh4UTdH?=
 =?utf-8?B?a2FjZ0svY2s0ampUUEFFM25rMmVORTN1UzVVU1hwTVFxOExQQWxrV2hiM1B4?=
 =?utf-8?B?aXVFcDVRT3JYek5ZWFY2cDJ2eWRuNU80b0VmMHVWZlZEdkk4VFZTZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0910d80-1c73-4a68-60b7-08de9cec5be4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2026 01:46:50.3101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzmLZLRuYFhTCqGD0wACpC/olFQB196Cn20FNgRTe5FfWv4Csh1ulT8tQKguglGdj5LBni9itmeeR0I4vYhDsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8181

On 4/17/26 7:23 AM, Alexandre Courbot wrote:
> On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
...
>> @@ -24,7 +30,10 @@ pub(crate) struct GspSetSystemInfo {
>>  impl GspSetSystemInfo {
>>      /// Returns an in-place initializer for the `GspSetSystemInfo` command.
>>      #[allow(non_snake_case)]
>> -    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
>> +    pub(crate) fn init<'a>(
>> +        dev: &'a pci::Device<device::Bound>,
>> +        chipset: Chipset,
>> +    ) -> impl Init<Self, Error> + 'a {
>>          type InnerGspSystemInfo = bindings::GspSystemInfo;
>>          let init_inner = try_init!(InnerGspSystemInfo {
>>              gpuPhysAddr: dev.resource_start(0)?,
>> @@ -35,7 +44,14 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, E
>>              // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
>>              // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
>>              maxUserVa: (1 << 47) - 4096,
>> -            pciConfigMirrorBase: 0x088000,
>> +            // Hopper, Blackwell, and later moved the PCI config mirror window to 0x092000.
>> +            // Older architectures continue to use the legacy window at 0x088000.
>> +            pciConfigMirrorBase: match chipset.arch() {
>> +                Architecture::Turing | Architecture::Ampere | Architecture::Ada => 0x088000,
>> +                Architecture::Hopper
>> +                | Architecture::BlackwellGB10x
>> +                | Architecture::BlackwellGB20x => 0x092000,
>> +            },
> 
> Mmm, similarly to the previous patch, I would prefer to have this behind
> a HAL, but I am not quite sure which one would fit. Any idea?

This really bothered me, because I distinctly recall very recently putting
this behind a HAL! And now I see that I did that in one of the "much later
this year: future firmware directions" branches. ha.

I went with gpu/hal.rs for this. Yes, it could get large, but let's see
how it goes. This is the first item in there. I'll apply it to this series.


thanks,
-- 
John Hubbard

