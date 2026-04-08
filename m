Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013027.outbound.protection.outlook.com [40.107.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC31288AD;
	Wed,  8 Apr 2026 03:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775617366; cv=fail; b=h8YXpHqbgzEOpHYGVTHflea77oMxubGb4T19bNxD82YQzeFo+R7zut2wMYpifIaZyyHdusrxFjAQmq6qLFVAIsXUlkiWbwDv9fIyFLXqNOTkRpT6ESQzx5MNMR8go8lPn20EtgyPBBmH1P0eKTkbiVaPqykRXTpFbuS7SGlctBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775617366; c=relaxed/simple;
	bh=BUNln2BfrNWrfK2LNKHNjWn6y0IPMLT+kCcQzef4LLU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oRMgQN1337/XJuCifCYC0+mhuqvuRHMkAfUGO6cF/Zud92w/BEdclnbkK8C5BAOPWCapCyesOiJ94dlcTqXT6gPDK4Q6AL7Kpok2jPArlaFpeRY57Da4egXGdFHfmKZq1XsibhKElEHSIAxlTk/sAdktSmJRJI/E2g9uDhMEXK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dYLJB9Pw; arc=fail smtp.client-ip=40.107.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dYLJB9Pw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKXlVU6OWlvS61sSiwAmF00w0/N3f3YcczqaMR1pg9SSwZp4KHPfbQKYKlnq+CHbzDDmkHLNaY+X1u3HN0I57LpXN8eo1od7p6NCYpwHx874udtsKOSprnTG653ghwcuCzVRfQW8tSF1F0VFvTDa2qjXHWNLLNMod4r9638mjqohxabi0EXeOP8HBFgTZDGtcaRQlNjQ0t9cbe1JeL7qNyYmqGRT/ePReVlPVE/cpKnr8HzUPFETlgC4YMDIVgQ5L4eedLfaLZpH83PKlt+azMWbwYpBFeGWjgxgpQ/PRLDaibkfq8obN1KJF1CElTqeu10rEusmLTiyWs4p+N8P8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QH6QDOgY2hv9v+Q9iYsSvm/WVLCA7mKJhWlieuXJgU=;
 b=QSsDMbSz25f1iXw1sObQABOiLD57SGCNrT4LruDRj2tvbwE9eZwRQpf1L3ZJRviBVrdJCKYJVS6nyZ+eaCoYi2GKSpRtKYQYKVJci4cd+JIaLADi6cfl7YA1XQCP+QfpgSSpqxaog7/eG4qamaDa9Hpf/yGvGckEYkywwY8IPn2obYk8aXHXzKf4JhG8qxggPbZ77JnGEy6LCMwt1QTD8fVn7K10uQgolMje9KMX39EWgPrTIhxT4Y6ahfFsDPagvWxfKuY2PelGlpbITsMk9x2anawHhycdE3U8pQCEw1WFqG9LbFCaybURpSUutw5f5TFJgWcLRO5zob/lhySAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QH6QDOgY2hv9v+Q9iYsSvm/WVLCA7mKJhWlieuXJgU=;
 b=dYLJB9PwIYOf73MmGms8OVJSD8HuJCNi+8YM6ktj+rf60JADJ+kl/qguHCcJu2z8aHur7/ouEoYRU1gDJluKavGvgtcTcfC72GiW38LoIKNc3W5Y2gx1VGYrlF29U9ic4GO7FcxvZOsw32dBSDwGlP56UXR9YdyitTfRQRyjV4wLfPVK2qerfHWndjCWllOeSWwNbbnb+6+/vE7w/8vvZTzlm5HUgaG5IxxFLlDFbH+I3zOOac0ujN0I+cXti4Vl7F9H1s6fas6KfXHL/mB0j2jdp96CUQuQMV/fG9hQCPIt0A+wszVbBMc8OyajeGESo/dJz45uTWwVd1ZXk+dlhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Wed, 8 Apr 2026 03:02:39 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 03:02:39 +0000
Message-ID: <0b18c2b3-c052-47bc-ba47-5064d24f6b0d@nvidia.com>
Date: Tue, 7 Apr 2026 20:02:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 24/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain
 of Trust boot
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
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-25-jhubbard@nvidia.com>
 <DHNFS927S2DS.16B3V5I5ABI9I@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHNFS927S2DS.16B3V5I5ABI9I@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe9bca1-0762-42ea-3892-08de951b4b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	C5010yyzBewuHre5y6me9vl31qY2D3WPvgEoX+rCHvypHhmi6DpQf9M2Fs+4CYdfaxFfWg+wyL4Ac7604TyPv8jDI66s9UFC6bSoObc2MBfnBzV0e8nIJr3uT8EoAdWQzTxSpyCs7SjYJxPWr9Pk9yYPPVuxAXXeZlv3yQxKfZ4jjg0IZHk86u1x1SkUAAGuT7Wl3g6mVXK/7n2ANBDfR50HuGlEXuSte7mWur9vsisa2G+Iex00V4BhGCPqc8Dztyput95PIXiTQCOfBToxCRku3uma43IRe4cWUYnJXY+ZrGckLMWH+T4Wf96rUJeN08hB1XuJgUNIF2ZOlT0anbZyWUevtFodNqHJyAi+LHUZjQII2SIpRtCUpEqxwoXDXQ9X6HIM/xZFpW9AD7hvCvPXWcujBAB6XNeKwqYfGhjAqTbVE7s+k54cQeaIxsi17CIy6sgekyUXWhOmWDwaLYrUtqQTX+oKut4slHDpDdD4ZRRMlkZJHK1Ywh19ykOaj3Zo+Kr+jDEs86oDGEixj1iQJXsRs0JMlYlfvDGWOD378NNQbNGsoTnR25XCnNnb/klvNlQzvUgVSf52G4KbjXag34rG3wjlMdEJioj8qXbGhAC1pXTWJdkF6D164eY2DSg6/sfVw9/CvkTgVs/FPicRDzvfTBWIgWGJRbd3ne+kjKK06jEOAvnmAkYpMPBC5lA3EG5stBoyj2fJscB8105ghLfQo8cnUQQ52ADpfkQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NERySHlMREVEeThqWVFOUlVVMXhsSlZQbkRPaXEzK0d4bFVzbG5MYzNpUkNv?=
 =?utf-8?B?ZzN0NU9ZNHhPb2FXQzluT3lkaGR3aUVJYlUwdlhtTXV6ZnRpRHpXWjhTcDhu?=
 =?utf-8?B?alpGVkRwcWNZblBXcFgyRjhTSG5oUi8yYlRWSUJqeVJFUkFTanhLSFFEeUZY?=
 =?utf-8?B?WlVKRU1xRlJUTHBRczFSV2RVTjEyeW5JSytjd3N1YzJqNjF6MXN4aTRDc0U5?=
 =?utf-8?B?R1ZhTVVYWDFZTVVDbERtbGJMNVIvb1AxeGlJQ1UvMFVaOWxYMXJ1VGhaSVM4?=
 =?utf-8?B?aXpab04yMW83VTV3dzU0MVZ3QkRFN2VZUlhPd3JRN3V6aFU2L3VYS1dkK0Rh?=
 =?utf-8?B?ZU11d241SFBqVnpxS0swRG1FbnRaUG11UW16ZE1ZcUF6UEo1SVMzN0tGNjNL?=
 =?utf-8?B?OGFGZHJrM1pJQ3ZWbktYdzJJRHB4eTFwVUxvVnMxSUh1NlFHcnByaGd1YXB5?=
 =?utf-8?B?MG9RNHpmdEd6QkxIM09RdktYVHNLSS95NVkzVkVqT3dSYVRSMjhramg4aGxi?=
 =?utf-8?B?L1daSC9JbUFnS25uZi8vaG1ZUWROTXBpbXpyQVBkQ1FQcmVMdXdLb1N6WEhK?=
 =?utf-8?B?QWdhb2kwR3hBL2JTaVlkUWdpNkJVYkwvbWEvcHBYcllpSWtuRUlkUU9aVGhj?=
 =?utf-8?B?d3plUXhzbE0wU3QxQVIwY3B4NXY4TjFKeEZiV1NXMnBjR0xncUtXdU81V0lP?=
 =?utf-8?B?Yko5YzEvVk81Q2I2cU5hYU9zdzJaZkhOUjAwa09aQ09QeFVIY3RzSFJ6NFU1?=
 =?utf-8?B?MW9KV00yc1NmUkdqMDZDbDV0bTUzRWRILzZIVCtrOWsrZjFpWTl1RHBuOGFw?=
 =?utf-8?B?bkMvaVQ3Rk15bVl4NTFjY1FsLzN3MWhNYWpGR3FBcGp3VlJuMmZuNldVb0lv?=
 =?utf-8?B?QXlXaFZpRndsL0lVRDE5bWdGN09YQ3dJdW01YWk4WmR2YWJzd3lYTUVmdS9z?=
 =?utf-8?B?MHNFdFZSRmVxOWNJdk5hVUFJcUJ6WkludFNhbEo2cmlkMjBlWHlFMk8vVFVE?=
 =?utf-8?B?OEFueENIYUZ2WmhwK3dTcFZJR09ZNzgxelpoTjFVLzluNXA0MkdjU2RiNXdn?=
 =?utf-8?B?bFBMS1ZUT1ZleG9JUGZmb1UvS0tMUENoOGx2dzVXSmZ3eXVzRE41ODZWZWtw?=
 =?utf-8?B?d0ZMcW5iQnJNRzNWTDRLME1XT3V0dEV4cndlUmlPWkJOcHdzK2NBWkRncDc3?=
 =?utf-8?B?R3pITDBDZk14TXZWaHhyTWUrKzFqRkpXcEtuQUdNYWhKVGxqSUsvTVFVQ3dq?=
 =?utf-8?B?MXdVR245SVhiZlFYVlJnRWxXOFFaQmE1V3VZQjRxcGtBQ0NhMEpyd0p1dzh4?=
 =?utf-8?B?L21BZjUrRGwxVDl2TXk0NEJ2MC9zM05vQVJMV09XK2U3ajRZa3duNWkyRHBL?=
 =?utf-8?B?dy9sZUhqOG9oT0Y4ZjZKVktaVlJTRUtOVjJYWGYxSDFrSnRUckNHNitwRC9m?=
 =?utf-8?B?WXZKSG5MZ0hpZWV0L0pSOVk0Szc5TjRneHlzUk1PZGZsN2dxWTk2ejAvQUxx?=
 =?utf-8?B?NHdNSnRUSVA1eXg1c0ExNC8xWkc4TGpWN0hqT2V6VEs0QjFkWWVUN0ZLMXNl?=
 =?utf-8?B?TU5kNFd3VDdlVENmYzBPV1Q3aWdsQWd4Y2hjVkh3OHF2czNVc04vNENzN1lF?=
 =?utf-8?B?Wm5SbEIzb1JRdXhVTEpoRHRKNGpib0d2REl6ekQ0OXBKRzJLTzdWaHJXV0or?=
 =?utf-8?B?OGhsaUxxSHpaQkFjTWhscXFGRmhDMS9pVmU3b0JDOEh3NGVoZFBiOHE0T2w4?=
 =?utf-8?B?VXk5UUxFTzRzZVRwNFN3RUE1NlovZXppcHR4ajhiMWh0ZmpKZTdwSHcyUUVm?=
 =?utf-8?B?VFJJY3lYL1pYNkE0SjB5TVRtbXZWNHBwSXRxNjVEZXhrb2lsTDJ5TkNxbm5m?=
 =?utf-8?B?NXpHUm54YzZJQkgwMkttcEpIOWlJbjJ5d0ZFL3NtR21vVFVQL3hidkZTSVU4?=
 =?utf-8?B?eWg1N3NDNlB5eHNXcTNvVVhsL2lFbGdPTmFNVmZ4WGt1dXprZmUwcmw1OFhw?=
 =?utf-8?B?WGNxMW5rdWQvenQxNElaYWhqZElFdVZ3K1NmWmZrZzUzMDE1bEpGcW1xUEhW?=
 =?utf-8?B?amhTVE1ZVzU0V3pVTHo3Z0JSVTNoZGppLzQ1eFRGVFlHY1RoOFo0bEZ2MllR?=
 =?utf-8?B?aFNYaEFnbXhNdFVWSjI2aGRhaEdNNTY1V1k0Smc2RlgzM1dIb2c3Z000UU5n?=
 =?utf-8?B?TExkdzJzc3h5MTR4TVI1aEpHN2RVR2tmVmdzclBZdW9KTTlVQ2QrK1hmSGZP?=
 =?utf-8?B?cjhHSFl0ZElQSzNtL3pkbXhlT1FiMGtyWUdNUlRaK1FKOEp2WmlDY3ZNSXFM?=
 =?utf-8?B?SVVGczFFbXhjcG9kL2NDeGFNT0RCKzNuR3BmS0ZCbDlyZEZxSXk5UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe9bca1-0762-42ea-3892-08de951b4b13
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:02:39.0918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4AHipNPfnwb4bzsjejtCLfdMnhXF5WetZpzf/VHpnl0wDEPN1gdGCcBuVKJxMxdBRx5sRGxXgRkdmiS2oliZ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963

On 4/7/26 8:00 PM, Alexandre Courbot wrote:
> On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
>> Add boot_fmc() which builds and sends the Chain of Trust message to FSP,
>> and FmcBootArgs which bundles the DMA-coherent boot parameters that FSP
>> reads at boot time. The FspFirmware struct fields become pub(crate) and
>> fmc_full changes from DmaObject to KVec<u8> for CPU-side signature
>> extraction.
> 
> The temporary `KVec` field has been removed, so this commit message
> needs updating too.
> 

Will do.

>>
>> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> Was I involved in the development of this? The code must have evolved
> beyond recognition, you can probably remove this. :)

Yes, long ago. :) OK.

> 
> <snip>
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index ab378c0297c7..780a4d1169e2 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -138,7 +138,6 @@ pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
>>      ///
>>      /// Hopper (GH100) uses version 1, Blackwell uses version 2.
>>      /// Returns `None` for architectures that do not use FSP.
>> -    #[expect(dead_code)]
>>      pub(crate) const fn fsp_cot_version(&self) -> Option<FspCotVersion> {
>>          match self.arch() {
>>              Architecture::Hopper => Some(FspCotVersion::new(1)),
>> diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
>> index 9e052d916e79..c23e8ec69636 100644
>> --- a/drivers/gpu/nova-core/mctp.rs
>> +++ b/drivers/gpu/nova-core/mctp.rs
>> @@ -6,8 +6,6 @@
>>  //! Device Management) messages between the kernel driver and GPU firmware
>>  //! processors such as FSP and GSP.
>>  
>> -#![expect(dead_code)]
>> -
>>  /// NVDM message type identifiers carried over MCTP.
>>  #[derive(Debug, Clone, Copy, PartialEq, Eq)]
>>  #[repr(u8)]
>> @@ -101,11 +99,6 @@ pub(crate) fn nvdm_type(self) -> core::result::Result<NvdmType, u8> {
>>          NvdmType::try_from(self.raw_nvdm_type())
>>      }
>>  
>> -    /// Extract the NVDM type field as a raw value.
>> -    pub(crate) fn nvdm_type_raw(self) -> u32 {
>> -        u32::from(self.raw_nvdm_type())
>> -    }
> 
> This method was introduced a few patches before, and I don't think it is
> ever used - you can probably drop it since the beginning.
> 

OK. 

thanks,
-- 
John Hubbard

