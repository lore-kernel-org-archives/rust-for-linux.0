Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5F32DF3DA;
	Thu, 26 Mar 2026 01:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488110; cv=fail; b=AGepQ95bRfQ1ME7LyyLY0ONPxOhb0LdxXxWnycMt//P4qPgotqb3/tuysSzH3yOuzF/qL67qUq3WE1G4yvufer7Wo/k5+WYjWyRk9vguYeOsPKB2/mREDjwuD1u7ZoVAltACuGOkXo1lTQjx58WANz0z1pue62gxs3F+9pV6gi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488110; c=relaxed/simple;
	bh=l96aH26MJJ1vhoqMBbzmQNp3e1qUNUbqjUIkiLaMSqA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bGWhH4iBykgywNag3stgIOm3oNmD1eo2s57ywOGtH8gOSU1gFYi7ak+lPbQOouyXqPiM72MEciWSivb7Rw+T5KgmL+DZijk+GaWE5hmMcez7LNUTh+YpIZM3TmNV4gzSlObYZ9YLraCRFQmODsXEAMDPVbXzb7s4QiZs5lL/JLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=khfFNU/b; arc=fail smtp.client-ip=52.101.56.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="khfFNU/b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMlb+yxNHjAwozo/cig2IY49MO4mCfj9VszXZZX4JybsGjPjmximXSf+IqLh2Sw20yWKpGSs4dKCpd4FXSX7sjw/vcwvIyed3C1c6XMbICJeSPDyQlBs0GYnrhdnb5/sTILtccukWFf2ElV07xgIQbAHrQOVhJLR49BEeNCCBy3MM8ltIh/ko7oLnhprL4Kf+3ea6fomcf+NUcdZ2/hX5D6soq1jCPaiI7m9Lrb5pqgK9bRGfXFkZywTbT/02f/gazCg0QUswZp1WNYqqhHZdY0W5i9IF5x4Oij+/ff6AMBegHE3jPPOO48HV2bPUlTZPNFKHmQl1YHROfhpX8Bq7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JhT1NtO4nAJr4gGfQdJuYTr6lGVuMkoOmUeyrT/ACg=;
 b=OumhmQSOvurMccJJj+BgW1Qv7ZGKR6yqgx07BlTyxILmCYIvsy0hTg/Ci/JENpW76+pfuziYrOAxNDkDzXda6OEobgpfANnxb7umfHRn/ZTCW7UW86YjpWVyJIqKAzFiNq43gdA3HD0ewv41KnI5Giz1dZ8CtwKJ+sY40fgNn+8fPXO2kr0yjrB2xJyOOgvJQ2WEYJSMj9+2f4ExpngxhDdeE6zwrwhILJwDbuiMM6SMZIpWSWQwRUvIxLonc2ZkuHIrLbyLHvh9o/BPzrbC9mFT/87DMjgG3ZJ/O1QPhz6xviDEXnXd0y8Tz8Ft8apw2tq+kLuTfvafYv3/ALpLcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JhT1NtO4nAJr4gGfQdJuYTr6lGVuMkoOmUeyrT/ACg=;
 b=khfFNU/bz0mLelpBf3KH4Hw6bOSlZDLHpUZSwEuHPG0xyluDH7Sh8P86nVXFwzxfbw2Yqy3T31dJ3oEPUYSP+uA179gAHt8m5wOV+DLyNdFARQyEk2n5qSe12dmYHycgFVoDhwNpFhq6tT7lWOOgqAn4R7pye7o5OGOkaXj8+bLLn2xu192W4RRtjk+nRRcBD0iueSBQA8F1+3jlGfwLGC6Mde4DdneQnzqvo5MLG83wk8UjTjFYjZL6P9qL4rfoh465BcNxM5OeMZX/zMpURC3w5pJ1/TacR0Q2uV6QgomU6Lc7yIXH8JtvoMqAAATvIplcBd4z80Vawv9vbvia9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB8354.namprd12.prod.outlook.com (2603:10b6:610:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 01:21:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:21:36 +0000
Message-ID: <a1793e7d-cee9-4a46-b1fb-fb44c8eb2c58@nvidia.com>
Date: Wed, 25 Mar 2026 18:21:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/31] gpu: nova-core: add Copy/Clone to Spec and
 Revision, add chipset() accessor
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
 <20260325035242.368661-5-jhubbard@nvidia.com>
 <DHBZ7W9YXXKP.2PJ1UM4E6TYTW@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHBZ7W9YXXKP.2PJ1UM4E6TYTW@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc3be3f-fa82-47a2-d1ae-08de8ad605e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eXXICFrJ5UKsHxBK4vJFHmHCkwkeVtG7U2QDyk9hbh+vzB82s+jHqvpT75who2bDdln7PO3kg6PmiMPaiRXMiVvZsxx7DDJCE1n15jaxg++0tGJRXkS5G7UNBaCyaKAD1s8MNQnp6LSyyyawGbYA5k3WkcxPb+cDkGspktFTYAdWF5RLWSWvwTHNYerhowNq7DPHdrxQZs35zrsJK7SAx/vDYRRRewQa9N6j2l2ozTEMiYRffSfOdApq5dYrLdITqIceQP1JgZr9GOwPxkj38+Cv3tliIbQ9YweFrAPWg2eVxh56F2nGP4vPhfm6AcqhU0Y7PBGNmpfQfKt9FqRvkL2n2A3nbUEE82uniExTLRu5lxKlugVJjecpP+T2OSHA4s4Hjwa18CoM4Ypj+ZiJAJTXDYMvhex/JdKW2HyQnYfarsIuWWYEIkLtNQs+c0IZqdHjHEKqJteG68VPEXhrM7UMSkdV3OCUH9G84ErhAJaOmviy42bnU55Zizk5p3P0l3M7rroHv787veYLgnpAheIRaIF08FfLrCD/FJnTXQJb7UiU8QIB4lVynlhqmMIZSys3A04oNTrHCUjrJSoe5oUQp5pHhBmid/Kt5NxBmUR7mzSYSZDHSYEqKo2wV3gmXci+nHQ+udmok0+MPnW8f/VtBQ9cOkYZ0kBqBLQOv1nZigsxNqCeqY9cJSKrQAAEjoZTNU02lLcuRfT/o5Wf6F10jYoNxs53TsS0DUvrCdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2xrYmRpTEc1UDlRcXROQW43RktpRjJiYWNpOWtMUmc2K2ZpREJ1T2E5SXdO?=
 =?utf-8?B?TlNnRjlxTG9wUmg1UkRucC8rT3F4dUhGcnRITzJ2dmVkdXcwa2JRVmVGd0Z2?=
 =?utf-8?B?YjNDdkhZNUQ2d0x5Z01OQXJCTW44ay9xVGt5Q3oxeUxFOUltYkFaZlpJVE84?=
 =?utf-8?B?dGErWngyZWwxRFR2dDRZTGZBVkJnUUF4UGFWY1RXV1VsZjlDUUZwamR5NTA3?=
 =?utf-8?B?VEJzM2oyanZuMjZSMW1RNTN6Q1V5ZXIxbWcwVno0ZGVEaGtpdWVhRk1iL1A4?=
 =?utf-8?B?dENUaU9kemczZ3B2Z21vdzNQZ1RFVG9YSHk1cEQ2d1czNVBsbXNoTU01TU95?=
 =?utf-8?B?dDFmYjdlSVExaEpKem1HemVWQnRCWFBXSlZmZUY4QWt3dFU5U1FWcktOTW56?=
 =?utf-8?B?TEpZZ2l6N3Fla3V0aGpEVXZLMEFPNmNkN2ZuOGQ0eHZWSko1VFBjam1CTExM?=
 =?utf-8?B?YTQ1R3lSMmtha3VrS1M4ZWNhZXQ0SGlFK3F6WXpKRGZBVTR2QlhsVktPbDFp?=
 =?utf-8?B?U3AwSUI3TTFETjVrcXhRSGpMMWRXcnYyQlMzTnFWTEJvSGF2alhHaUp4OWpH?=
 =?utf-8?B?aVBicDlXamJubXVJUjQ5d010YkhYanRXSjFFamEwSnloMUxIVWZTdFMrU2NO?=
 =?utf-8?B?YWt0aHAzdWgxRE1mUk84eHdoYVlES2Vac2RKVnluQ1NUSFpRNkxhQTI1NzhM?=
 =?utf-8?B?cUFGU0E0TWNlK3ViZFRvZEpvbnFKRjdkemhLdFE0WjUxenZKb2xIVUlBQTJN?=
 =?utf-8?B?MjNVWGhvNHI2ZGtZNU1yNWZkaThrMjQ3MWpObXYvYWdxNjczZTd1dU1WQzdp?=
 =?utf-8?B?Z2ZJR1pidDhBMnMwK1NLb3RZL2RlNXZpMHdxOFNPa2s1WTZqUzdQdG9QKzI4?=
 =?utf-8?B?bEVFdWp3d3YwREhhb1RudkZ6MUhjOEdwQTFMVjI1Tm9DeVJueVlEWkJiZVBW?=
 =?utf-8?B?cDdMWmpPMG9uWlFPSE9nVjRrcU8xVmpiUDZhekRyOGhEQ0RiRndDNzVLUldv?=
 =?utf-8?B?RWRjNGNOdDR6dHA2SWdkT3FYazM1SklHTVd1eVFlSnlXYzZwRE8zUmViTVBO?=
 =?utf-8?B?cGdUdVZFZ0FaS0dBU1VxVjdiVDV4KzBkWERraFFVUEsvbUo0ZlRIVCtuZXlq?=
 =?utf-8?B?YXEzSEtCK0RoS2MwWG5NNkpKWkErVVNXSWFWSjdSN3FnUk5MSzB0bGxDbzlV?=
 =?utf-8?B?K1J3cGdsUVNtNnlKRU1uV2MxZXNldzArTGl4cW9PT0NRcTA1eU1FRGQyeFA0?=
 =?utf-8?B?RzErUkJERUJTNjBTMUxJbStpaGtKUVhSaFBXKzNBTlhPS2pwUUM1MXh6ZWQx?=
 =?utf-8?B?Y2RSdmt1TE44aWxqazlZNWk1OTV0YmZaelowbGdaM3FWMlN5VVVPR1NGTHlK?=
 =?utf-8?B?YXdKZ0lNVEVFdFhwczNkcnBmbGxIVjRUYVR6MFJ3S21BT3V5SUVyRGJHSG9I?=
 =?utf-8?B?NFpSUnlJNlhZelpFUGthWnJCMVBodi9Pa0RmS2o0Y2lkemJPNE42dXlLZFJt?=
 =?utf-8?B?d1p2K0JFQzFpZjZPNGpYZDZwNzEzUFJNQTZLaFk1eldOTWRyVWo5RHE1ZkZZ?=
 =?utf-8?B?eEZZYjFJZ015dFVEL2hnODliWHk1OGtOb3lLQkxSSndFaVFqNWZ2TlRraTBn?=
 =?utf-8?B?Y2l4UmNJekcvM25CRk5lRmdLbUpiRE15K1RKbnZMWEthVW11T0FLMVZHUHdQ?=
 =?utf-8?B?NlhmdlB3YVJxeERaTUlPRjNob25sdGZkazhpUnNuUjlETFIvdVpsaC9LQXlq?=
 =?utf-8?B?Wk54RHRpb1ZTWEZKdUtON0RPUkJLcVJjNnZqS3BZd1FGaFVKbktsYm8yY2Iz?=
 =?utf-8?B?cXFJSWpVRHN4dHltemZiYnZzaTViWExtSWFOeUx3MnFmem1uM1hZc1VSNjhp?=
 =?utf-8?B?eXNhN2RvcGpxMS92cGJpN1NmOVA4MU12bWZpbjJkUzVJTXYyWmk1eHRTbm9O?=
 =?utf-8?B?cEIyaWdNM2pGUnJ5cDZpK1R2Yzh2MTY0V1I4UU5KTEhqNE42R2xxeCtqcTgw?=
 =?utf-8?B?YzdEbFhjOUhTWUdWaEdXaWpUQUI5RlNyeFdoNVBBamZsNDI0SFRyemVma2Vn?=
 =?utf-8?B?UWJ0RnQybDN6bkZ4NlZ4NjRvbmtDcEJzV2pyZ2N3bmVaSlp0YmsrRDA0TzJ2?=
 =?utf-8?B?clpHcEJRQ0JZd1VUemwvNlNabHdVTmlYclBvTGR5VmhMNEY4eTN2RUtXTlF6?=
 =?utf-8?B?RFNDZ0E0Zi9kbDFWTmFjUHVsejNOTkV4bWc2UHVOczQrbm9xNGpiNHRLT01x?=
 =?utf-8?B?U0t4QndMLzdiVTF2Tlo4OTcxK1MraGx1WDdxclRQcGtmaGNTTzBVWGRRd0Rn?=
 =?utf-8?B?OHRDb0VzZXlhZ3AxSnlSc0NQZWJNK3JpekxyYTRrV2tYbk5KVUNOQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc3be3f-fa82-47a2-d1ae-08de8ad605e5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:21:36.1884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFKDL13T+qU263fZ7XRS29NHU5JhT0ksDaGbpDnfDCxmtuYKeX1NFHW6FpNjVFi77i1nqBJ7hcfrPWpIxlp80A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8354

On 3/25/26 8:42 AM, Gary Guo wrote:
> On Wed Mar 25, 2026 at 3:52 AM GMT, John Hubbard wrote:
>> Derive Clone and Copy for Revision and Spec. Both are small
>> value types (4 bytes total) and Copy makes them easier to use
>> in later patches that pass them across function boundaries.
>>
>> Add a Spec::chipset() accessor for use by later patches that
>> need the chipset outside of gpu.rs.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gpu.rs | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 3b4ccc3d18b9..3cd7709883be 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -184,6 +184,7 @@ fn from(value: Architecture) -> Self {
>>      }
>>  }
>>  
>> +#[derive(Clone, Copy)]
>>  pub(crate) struct Revision {
>>      major: u8,
>>      minor: u8,
>> @@ -205,6 +206,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>>  }
>>  
>>  /// Structure holding a basic description of the GPU: `Chipset` and `Revision`.
>> +#[derive(Clone, Copy)]
>>  pub(crate) struct Spec {
>>      chipset: Chipset,
>>      revision: Revision,
>> @@ -241,6 +243,11 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
>>              dev_err!(dev, "Unsupported chipset: {}\n", boot42);
>>          })
>>      }
>> +
>> +    /// Returns this GPU's chipset.
>> +    pub(crate) fn chipset(&self) -> Chipset {
> 
> Given that you mark the type as `Copy`, this could be `self`.
> 

Fixed, thanks.

thanks,
-- 
John Hubbard

> 
>> +        self.chipset
>> +    }
>>  }
>>  
>>  impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
>> @@ -291,10 +298,9 @@ pub(crate) fn new<'a>(
>>      ) -> impl PinInit<Self, Error> + 'a {
>>          try_pin_init!(Self {
>>              spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
>> -                dev_info!(pdev,"NVIDIA ({})\n", spec);
>> +                dev_info!(pdev, "NVIDIA ({})\n", spec);
>>              })?,
>>  
>> -            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
>>              _: {
>>                  gfw::wait_gfw_boot_completion(bar)
>>                      .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
> 


