Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011056.outbound.protection.outlook.com [52.101.62.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618C3C465;
	Sat, 18 Apr 2026 01:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776477259; cv=fail; b=VeUYuZmL9WIi32ZFHaLFPhmkVHo6Gi+ji/twzu8hYw/uyhtDKIHRQaaCD7PYK5u7ptltKhGzoznBd+xi7icBTpmRylUNFlDLItBvW/E3ln7j6P/yhwRldgdVqUoZ77NVGMQqah7Hohrw5GRAKlczRVfDiF45uQWkd/3bOj+x55I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776477259; c=relaxed/simple;
	bh=14o6ffKfMqizmH5tSBVKMQ66RoV2JN8BgOOti2BwUUM=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D0zRxd3xc3Ak9+n0zkn45GrYdFMUcaxmf0hfuk5kxESLbytnhuBrqGH4k+oOon94jp1+hFNgTmADefRcBzr7AwkK4YD3i2/fRKS03F1xsW5Qy9f7hYEIYyFnoXBseWWUdiTujpwCEaCEw1xyY1NM/3WrD4I5+TXb+fA2XA7oCY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HVeU8T2I; arc=fail smtp.client-ip=52.101.62.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HVeU8T2I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppkwMLDVQb+raeTiOEWfaTiSkRltrZMvdx6k9Ay9I2F6QbMy7sQLLCg8l9b2rLkQoPLohpWASAMIhN/ScF3+5iwxnddWgliERVsKBR/l6S4YjS9CqT57eyw3/S4nXGNFHBfTxF2jgu7oh3Cj90loI7DJeW3LEVOmIkgUDRVYJB4mzGMMtpWsSdoyI+0EoAxVff4KU4Oq6u3djMgD+00ciS4iEyqM2AoI2cwb4NYPptnaT5oZlZtATsSy05ky09AC3Mk748BGM/W4l0NXyQxCFlF6Nu9NFL6XvPWpo2UFrTmBAaGebGZGlPdJHGMDkkGBgr5beEtVQiDbFek11Keptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+xtrIdDo9a3o1MknMRXo/NA0ntijAXwf+EUXAcFZ2U=;
 b=GeXXns2KzigwjhP2yddF2AedV9S9EEjR9RrgVSukvkMuWQ74VzgPMx7XAK0EQJvzl4uiCC9xuyjMDBGXufNGMp9BZRkB8zylCdzCRCh1PeG8HeM4HVB7clCpU6qUm6kY8pQMby2/ckJcxkbJote7Qil8pLeIDSCmec57Vt3USzWdLIZrsbEc4VWIFs+MY4K3osCBlthAvA1Wcnd/TzDb8e62EFks7w5vwA6fhYZBW6rXIPP+d46nhlR5q7he6c9Zb11uk7tuI2TpiSfxauucRsOKnAvV8ZLmtaFNGaivyt0X9t/JaE3dbDxJLoDff3ADYes7uUaFjm0FyZZGOmHM6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+xtrIdDo9a3o1MknMRXo/NA0ntijAXwf+EUXAcFZ2U=;
 b=HVeU8T2IUbSvENEo7tiMGw0IzTZ8tQxG3dBmMhLBg0oVrCnH28Y1XdFG12JLFDW12qKsIBhEmxJ5jDgUe2JyH8SqXCgV+/RhOIYtnTI5RmHrjM8TbzehgfTnpcz6xdWNFpp0BjwB6OHOY0ZvZhRqCXd5I1OqmIK/f9s+8pIaeicd3eMyWc/WEzu1Ucc1I9+gVF72UTb4jLXoZyFc8X9yz/D28YNRhYhoa+FlJwL70XeQHjPnt+stbhKXvZ7NaBxzvJIp5GkX3ilyM6PcGygWeivhG5/azVu6rd62232gsE/TxHW7q8UcsLf0glh4Z0okyf4Ld87RX+dbWSvJyhc05w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB8181.namprd12.prod.outlook.com (2603:10b6:a03:4f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Sat, 18 Apr
 2026 01:54:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9818.023; Sat, 18 Apr 2026
 01:54:06 +0000
Message-ID: <4cf5e6fa-cb89-4878-9b5b-963aef46cfe5@nvidia.com>
Date: Fri, 17 Apr 2026 18:54:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/28] gpu: nova-core: Hopper/Blackwell: new location
 for PCI config mirror
From: John Hubbard <jhubbard@nvidia.com>
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
 <e0bc7607-9fe8-493f-ba4e-19612be54d33@nvidia.com>
Content-Language: en-US
In-Reply-To: <e0bc7607-9fe8-493f-ba4e-19612be54d33@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0046.namprd17.prod.outlook.com
 (2603:10b6:a03:167::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: 513a3921-6f20-45b2-a307-08de9ced5fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IHjraAqwHI0Zq88cFgK245qq+jFrA4cbe4N49hHg3tJN01UvmMUPtuqXHXBRu8rZvQ9MtCkacfBPrFNsA565SXP6MNUn7zXLgmoq0KquVvZfcDbZcHI/dEXswmrwJPyaSvmLHnFYnavKnMgMoOSjPG0YjX2S5IfJL0Loyw3mTKYvKYGTClwdG3Lt5nCq4zQk8zHJSFjoLpjoE11tf3NMpRNYVtSwW9AjeWy2dPH4N32KRE6aDZOlrddCgJcP5BE7VfHvVBYsZnxYD5yZNOjpt45MRqyKKd+n0eEWCFv9A4j97lepv8RiU8R7AWdhszwTEvr+hZbtklSs0teR6cDn937YO2CR0XrfnxUtt5KW5z4znDnVkvHJdku1KgcZ8LixK9AZrJwpTY61ldfKOdSz/R/rmH2ZLqjU4iKecn8va2rpXOyBP5bcwLPikCi+NcC7NKRUmcHMAUykSK5jgNFvXL92IRNtjS5LOY4ycR96ivXIUbS9wcW4WQ3m3JvkInOnrhqrI7gVO47i54jDRRrzlYq7noSvBtj6GgTKmfT8+4PSMFTYyEbOcEby4uernRXOThVJtUPZufo2ACsnrW+juV6ePkN+xUTkZYZ9jL/lnly/ruKWE9BX/AeNOE8kqlEBCgeCzUnBiObe5dDcJKmUVOUXO2jlYDY6PYCInUpQTLrHrPfHI3R60t6URZ8z8Q2VeGeEF1nTLHN+5IL1IplUYElxGp6oXVuUfwTN2Ax1GIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFRqTUpkYTB4RGo3WTZLcG53cEhBcE1SWEdiUGJmd3NFdzdwVWg3THAwNlBZ?=
 =?utf-8?B?ZkhWRWtaRWVkeWpXV0xhY1d6UlFRdnNBVUVEc2d5dU5HVFBaZWg0S1VqUlNl?=
 =?utf-8?B?NGxiOERVamdCMjRlb0loRXYyTEUrQmNmWU14SmFmRkZZb1RwdFlhRWk3UUp2?=
 =?utf-8?B?ekVWcmVUTjl4OWRsallyWW1WY2dWUHY5M3V5OWtSOENlSEtDRXlxNHZadXhx?=
 =?utf-8?B?RFBQNzJaRjlBSjRSaWNTWWVXcGxobi9jRmJNOWxHMGc3U3F3SU1YYUdVMmFn?=
 =?utf-8?B?amFWMlQ1L1dVSVhEbGRLRmZ4UkhBd1Z3eXVtQ2RJbk1NVGF3RnZGanBYb2hm?=
 =?utf-8?B?c3Y2NWJZZXRvLysxVEpIcTY3QXJ2d2JmeXZ5TXBLbTRYSElVSGVmZWpSZFc1?=
 =?utf-8?B?SmY2Yzk1TDVuWk9wcnhnbEE5QndSYWlpQlI3YXRWNjk2bXBxc2RXdllzamZz?=
 =?utf-8?B?c09KVEF4ZTdtUFlHempjR09RME1MVWR4TXRqNHYvcjM0djJWSSsvYmtEckU0?=
 =?utf-8?B?b0xvOHdzNXhoRnF5YjA2Q2dmeG1FZk82WktSVFJvRVdkeFJKNERNQ3h1ZS81?=
 =?utf-8?B?eHJYaGdjNlZMZEZZSnNNeGlDYVBlNjBTUE5RMEh0OGgwU3I5Si9SWUJCL1Vp?=
 =?utf-8?B?ajJvbDNRZGhHbml3ZUhESDVuaWFIUFVCeDBHV3cvalVNRDNpQS9XbGpCU1F3?=
 =?utf-8?B?SVlZL3B6MFc4dWZTblYrM1Jvc2pkWExsZlZOV2ZMaWorYysvOVdHeENFR1Mz?=
 =?utf-8?B?c0hzYXhqWXBNQ0NPdm9kUkhWOFJCZzgyM0ZOSTdpUTRsdEFRdHp3emdqL1hT?=
 =?utf-8?B?Um5JaEVlVEo5NklQYVpwbHUzTkRxVHJmaHZCdG9DdE1EV29XakNVdzhWQmps?=
 =?utf-8?B?ckxsNEl2Z1FVcEZlNHoyUGt0TEVNeVcxc2Jyd0dhdkwvR3FzazBKSk5tYlFp?=
 =?utf-8?B?ZWdSK3FxNUIyaHlCMi9EQzdoay9kem4wK0FiNGdUaktTdWp5SVA5a3ZGVG1l?=
 =?utf-8?B?UVoybTdJRXBhY2FQeGk0enVkdW5Ba0w3Q2RSc012aFozNk1MZWk5WXA4RGFa?=
 =?utf-8?B?RTd0L0dUMEYzS2szajFwdi9vVTh6aXFDa2taQmVwQnhrdGhSSmNRS28wZ0Rx?=
 =?utf-8?B?RG9icVZkWVM5UXQ3UU84bTFVVy8rNGNNVTV0SSt5ck1JNVJJY2ZqKzh5bE1X?=
 =?utf-8?B?bHJkbzNZK1FMeU4xWVUrL1ZVMytnUnEvWGF2aEp2WDI0WWlIRWFwZktWWHNB?=
 =?utf-8?B?NkNmRVh0UnRqTlZYcmJ6YlRYNklGOVNiNXhtMVhTSGpZRUVQK2FWWjgrWXc5?=
 =?utf-8?B?U0NBMUNiV29yUmdwNWtJSm5uVVFENXl2Zk5reWpBMkEvcGlZNmZZNlFFNm1Q?=
 =?utf-8?B?Sko2WGNxZGZhVFR2OVozWDhKTENEand2UzE1M3RMQWdZZnhkNTFQdlZTSGhl?=
 =?utf-8?B?UlVVNFVKQnk0d3VsN1JXeVdnRU5kOVZPWllVMTNWUkM5Wk1jRXJIR2pGdTQy?=
 =?utf-8?B?TGNzY2N5UytxWlByU3dKLzZBVE5xdTJCK3VaRFNFTlBScUZWbW5yNWpsUEdl?=
 =?utf-8?B?R2JCMzNaRlRJNjlZeDFzakpIWFFTMEp4bThuLzRrblI0QkROVWdvZW85cnB0?=
 =?utf-8?B?WlYwd2lhYnZ5S05iVHJQMEpJN3F0YWl4WDliWnUwZEdoQk43WndkR1N1eWdt?=
 =?utf-8?B?MHdCK0hhNFU3U0hmMVRlSG1waXFFTWg3eWVmcEpMSFdDRXE1TjM0dURsZU1j?=
 =?utf-8?B?a1drVTAyWmpWNFBGUFMzdjFjTUY4MHYwY1ZmV1RRdTNCT1FWV2JQVTNxU2NP?=
 =?utf-8?B?YXBZbks3dThCOXFaZnZLMEFpUE5YelFHWXFoMm94bVN4RFE2SW4vMHhNV0sv?=
 =?utf-8?B?d2tUTEhWdG5HRGF2cG9EcUpnVU5DVWxpNm96ZEtmYkFNWk5sRlRrUWFkSVJW?=
 =?utf-8?B?VFlEWitmQjZ1cFpDek1IVHJnTkVZQytINURUM01lL3djZjlUTTIxQ0J4RmNl?=
 =?utf-8?B?eVluODA1SGV6bGw1OVhkb25pN29CcC8xcVM5QVFQZ1FtMVRCcW50N1RMYXR0?=
 =?utf-8?B?cTNaL1QyTm9FWllOT0trQXkwMmhQbEYwa0xhcUNmbGNMdEpVMG13Y0xhK2U2?=
 =?utf-8?B?bndVQlIwME5yRU1tTDgyVGI4ZldUUmxydytpOGQrZlV1QnQyRFNXK3V6YzFY?=
 =?utf-8?B?bEZ4cG9xUHBJbVNEN1FBV1ROWFp1dndrOU5CcENQRUEwL1JZcHVsUGUycnhW?=
 =?utf-8?B?Z2FUUFY3MHVhaDI0SWx1MGhVa25FS0xMM1N5N3FOWDJpcFU3TVVZZmhhVjNQ?=
 =?utf-8?B?Yk9KUVJVdmpFSXVBcElKeUVPS1NGOVFBRWV2VkU3ajVnelhxSlBWQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513a3921-6f20-45b2-a307-08de9ced5fb2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2026 01:54:06.2427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98KkkPrfLAQ7V95YlL4pBHAA9sW9yJANAfuGBgWfTjgGoV7G4cXhHJwNIVYaCCnWixpb41rDmg/4RdkSiKk5SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8181

On 4/17/26 6:46 PM, John Hubbard wrote:
> On 4/17/26 7:23 AM, Alexandre Courbot wrote:
>> On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
> ...
>>> @@ -24,7 +30,10 @@ pub(crate) struct GspSetSystemInfo {
>>>  impl GspSetSystemInfo {
>>>      /// Returns an in-place initializer for the `GspSetSystemInfo` command.
>>>      #[allow(non_snake_case)]
>>> -    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
>>> +    pub(crate) fn init<'a>(
>>> +        dev: &'a pci::Device<device::Bound>,
>>> +        chipset: Chipset,
>>> +    ) -> impl Init<Self, Error> + 'a {
>>>          type InnerGspSystemInfo = bindings::GspSystemInfo;
>>>          let init_inner = try_init!(InnerGspSystemInfo {
>>>              gpuPhysAddr: dev.resource_start(0)?,
>>> @@ -35,7 +44,14 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, E
>>>              // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
>>>              // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
>>>              maxUserVa: (1 << 47) - 4096,
>>> -            pciConfigMirrorBase: 0x088000,
>>> +            // Hopper, Blackwell, and later moved the PCI config mirror window to 0x092000.
>>> +            // Older architectures continue to use the legacy window at 0x088000.
>>> +            pciConfigMirrorBase: match chipset.arch() {
>>> +                Architecture::Turing | Architecture::Ampere | Architecture::Ada => 0x088000,
>>> +                Architecture::Hopper
>>> +                | Architecture::BlackwellGB10x
>>> +                | Architecture::BlackwellGB20x => 0x092000,
>>> +            },
>>
>> Mmm, similarly to the previous patch, I would prefer to have this behind
>> a HAL, but I am not quite sure which one would fit. Any idea?
> 
> This really bothered me, because I distinctly recall very recently putting
> this behind a HAL! And now I see that I did that in one of the "much later
> this year: future firmware directions" branches. ha.
> 
> I went with gpu/hal.rs for this. Yes, it could get large, but let's see
> how it goes. This is the first item in there. I'll apply it to this series.

Oh wait, I wrote too quickly. That's not quite what I did, but anyway,
let me take a closer look when I'm not so sleepy. :)

thanks,
-- 
John Hubbard

