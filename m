Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011031.outbound.protection.outlook.com [52.101.62.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5726031AA87;
	Thu,  5 Mar 2026 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772695624; cv=fail; b=rnfFcmwB9H+5od6/F0aQC19p1DQwtD4RJX5n/rG94D39j+A/LEsYqHl8sxkUB+ZVI6uvRvPhFGKMSTo/tD7KwKt84ntMziO4cp767Al2/Hh4z4qCX9S85jEfkTjGkQqrP5iywtJ7w0Q/NugWGToCxAK165zxIVT/OHMDj/E5+GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772695624; c=relaxed/simple;
	bh=KoiABLEHtXsNt2tHnDn+z9XaixdbfWgCCBl1L+ddZlM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=rzJAWv5wa/H054S8cXnjoN/+iRuDKgbUbV4fHIJ2cFuROM64VTLI9KD+CeZTigM9FB6RYWr9eli811EWmpbBYW7z80YZ/+kPrnUEiKoOWP26LbupzNxxF5UV8ifjjs4mmhsLhyfAFHosawVC94P0w1dFjED6GgInOhsPDD3ZBew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L77FrTV6; arc=fail smtp.client-ip=52.101.62.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L77FrTV6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9srbtJSfGWNreC3JylOea74Eh+h0FYfeRWXzYz0THEFSLDkGxGitWpm5QK8HVUkF7GHENVTu1E+sTCdzUnphoG8ZQuXqEVs7Ls87Q1lHB47SVNqNPpZf8CGWZWuPc9bfcG+ZXH1vj21EYVk/cV23Q47005VeTGx30Twc6MRCJbTQ3tvcmyv3K5snE9rnESj7NQXHbI7FSe5FACoP/nJ46WBFaxo6VSqJTDeptxel6k2UbGk7ohTJk7qfjNrJZgXAEFSmoDIwXhe6m+TElX8t6kuzG33R/gUHChCKYAxte3pz6WVgIDeUAjxCHlSvcOiCa+nAnOcY08s0of6hBXi8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MarfVSpt55ksqrl/r14s49vkStluAppldE+5lN+l6nE=;
 b=zFfhSGZ8HO5t5sftXlAL/b0DI0hJ/qCMmET7C6M8pNDBIL1cz7inaTq3pom4IP4wTxi7ghrT0IZO05Fb26fY+GbbX9yzG2b0Ds+vetVpcW/OxVvmRAfQs2YnDd4oK9F9X/HP9GLgv7TviInnDdNa/iB4WUz4lkLTGgP8vbv22xYxPLiNWKL8fV/K0LS88KVjImg7FrOvXPE9457FP7d0f7VTwGEJ+L8TTcCv2+l95mivvs+kYN7pWQZ2TTZQ4f+yxQLozV7qdR3T8iraxUlkygoREFstiA6rEIZA8i93pghJzVFIFaRZrHfmsEIEU/h7X4wAdA7aUU32WdM+1jQjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MarfVSpt55ksqrl/r14s49vkStluAppldE+5lN+l6nE=;
 b=L77FrTV6UcGUKlbAG7MmOgb7tAfusfs3kJQDB/ev1TvS0l+PLtYH1ukgvLCn9ZeH1oG5RLz+o589YwxUIP18AVnngozpJF3G2akEp6ZaJIQV7RVpLPX9o8MFCOcgdLuGzgiqmx45WqIPIE4Abe5oRpa6F9Qp5hUf5v2VPqAp0MpFcfKznZkLR+bmcCds4bA/xyDP1issmMbKtOG6EDnEMWzQ45tU0ol8JigLSV6dkdacfoyjuneQ3ULeDjON6VeuAxcT7yw5LQ/0+b6faRhXrChfoMyYIDeyLhOklULM7bXq96o4XbQXfkXdWAJD8rlGHgs+wWQttQoTb5QaAbBfwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB7692.namprd12.prod.outlook.com (2603:10b6:610:145::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 07:26:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 07:26:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 16:26:52 +0900
Message-Id: <DGUO5DR4WL2W.21OSXWPYKC239@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Benno
 Lossin" <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Dave Airlie" <airlied@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nikola Djukic" <ndjukic@nvidia.com>,
 <joel@joelfernandes.org>
Subject: Re: [PATCH v8 25/25] gpu: nova-core: mm: Add PRAMIN aperture
 self-tests
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <DGSA61C5BMSB.1RFPQAR3NFHKB@nvidia.com>
 <855853e7-f9cc-4661-bb62-c8d4fff86a76@nvidia.com>
In-Reply-To: <855853e7-f9cc-4661-bb62-c8d4fff86a76@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: d1856c95-c7bf-4b03-83ef-08de7a889435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	Tie3nn8P3uyc8YGOUxS5zhuEiVBAjYMnvIMESnfe4LUXUVD+UUfUkPT85l+J4Pp7zFS/6Du4z3kXoF0o5oMlyhIVTu2wwe6rXB4pvYSwO8n966QrEvYTAh1013wl0Wd8L1opDVqAduRUONh1+iRsKYCfwk2lWOyIRVWi32u0ZzXPtbSehzztNzvQPzJ4KOggHva5wdgid/LCdZ02bqplp8WSsSpPVWldKRFGJ9kpQ+Stl2Gqb1yrkBFB9+Mt1fizDsYWWZ/y+7z20p2XMxP8/MCx7rc4MzesH15ITFNIB0DZgs/m5fU8G4naC7zxZaw1B3T7ELEmEkXhU7plEQTlqvCK0GzkPJX+V22JIlidLeS1zxbzuHdhJZgWH+rssVda8bz70eNQx2SN0mBoeBQ7Iu4bJJ23KRCz8O8QmKRNGySZZXOMUYIN9GhoirITk2Khz7Hdex5KT0X94wrdLGMJOydZLOYUs4gBDo0LW8c/F5Kn+ElqmsNXpPKgX3JPYeEX7DimXK1hxjwBxmnRtI6JPXDji6y9fA1Fux1FdmB+x1JT4Fft/edbwplkHuSUaPpBaJfVgU1ri08EeqYl+0+v/Ee11jm95ljar3BR4A7bJ2dnfO+peX/FqSP9WYqiguq4+V/I8XLZh5YgjnkFbsZWfnDDNuRtgNImFZwkTsBZUYZlFPEGUtUlx3L11GmsyhwPRrqOq70KaXP9M6ojr5SHn+PcMzwRhtvUwQ/5xYcZwkQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0o4aG9FaFZmNVEvckhnZ2FERGNtVEE4aXNjOFZ2dUg1dlJZV2tLcUJaSmFi?=
 =?utf-8?B?VVFJTjZWbWpoSmZHNWhrYnE0TzJZblplbEN6aFlGWTUzL1BObUxmTTkzQ2cz?=
 =?utf-8?B?WWE0ejN1Z2hVN3NUNXhtbWZKU1dQd1BQcVFid3gzSlZlK3FDQnNhaVZ2d21z?=
 =?utf-8?B?QURPcW9iT05vbjNoRUl3SXZyOFZQWDhKdDRDUjFjWE1ONE5KK0M1cEIzU2Mr?=
 =?utf-8?B?UWgyS2FXbElOS3ZRV00xUERFYy8zU3RaRUZxSnBZNXp1SmpTSm9JR2dyNVAx?=
 =?utf-8?B?WGRoZVpoeGMzRGhyRFk5M29JNXJaTnNZU3N1YU5EYUFYYlBBRnlkZGFCYVlz?=
 =?utf-8?B?NWs0d2kweGZOdmliMzhpWDl1N2tlRGlvOC9ERlhxTzlPckMxTnpuYTVXajFi?=
 =?utf-8?B?MVlmQlFQSE0zalkzNFloNE43S3dpczJVRG9hcGYwZXVsTGt0RDE5WnpMa2M4?=
 =?utf-8?B?MTM2d0IxdFJaVXBaYzAxcnN6cXI2NXBRc3B1OUJyVzFVTmNNdzliL3F2dzZO?=
 =?utf-8?B?clhiSmgxcE1kRHIrak12V25pTXEyZjFpT3VwSmlZQS8wbHdrcUhUTmEwVU0w?=
 =?utf-8?B?aG54akpIMmRhTElLRXFWbzZTYXkxMngreFNEUTg0emc1TzlTZFhMd2J1ZzZI?=
 =?utf-8?B?ai9WT0J6MU5iOHArMHYvdGJod1R3RXl2NG9ZTjQ2NHpYMnJtZ1JXZjVKR3hs?=
 =?utf-8?B?YXNpQTdTZ1A5MDBxelBnQTNJOHJXYkloVDB3MEhkc3lObFlkTjI3SFdpeHdM?=
 =?utf-8?B?K09jdEJKN2p0cmRSNXZVOStNRHNaWXBrT1FRenpFQnVMaTMzU2RHSXk4RG9E?=
 =?utf-8?B?R2M2ODhLWG1zYjkybEpEaUxobGI1clo2RGluSGVZL3V6VERrQTdxakh3VXQr?=
 =?utf-8?B?bEtCamxxVk1aenpUY0pPckFlSVJjc2lxbjk0alZmRjZOQ3dTTFBPNFdSRXVy?=
 =?utf-8?B?OS9CVkpacm5IenRoRHlpbUFCZ0JWOVg2azFMOHJtOFB1MnNxOXJOTE9JRDNX?=
 =?utf-8?B?bHZKY0Mzbi84M2RRV0xJYnhGR0ZEaHN6WkpqVG9FSHZ6ZXlFTDBtNjZFVmV0?=
 =?utf-8?B?REFhRURHMVZ4WVAyOVZHbVlJaGxFT2NWRWd4N0ZwNnlDV3dXTC9NbTJJdUZF?=
 =?utf-8?B?VU90eUNpSmtQU3I1bk55SjFNNjhYV0VZNU1PUnYrMmd5MkJJSUEyMG9Tdkxp?=
 =?utf-8?B?VGd1QzdCdVZLMWE5K2JLWS91cnJTcEVOd05YM05FcGEyWXMxRHhieFJkZnkv?=
 =?utf-8?B?ZDJET29UbmxHU2NHekNyNjk4NGFZbmFDYnV3di80SnV4YXhLUkNUbjJLYTFR?=
 =?utf-8?B?TUE0Zmp2dEI1aVJIRFJtdHlyZGlGcnlvRzYrdUV0Z0VrSU42L3FyTTVUelFF?=
 =?utf-8?B?NVZMdi9pYVJNM3lNYmRoZzRmWW1IanE1Zmo1Z2FUYTFlQ2h5MG9XU1poMVZo?=
 =?utf-8?B?cFFWdGJsRkt2KzRYV2xOYmNEMEJwcmtaMlRUU1loWnVzTW1xNDQrRVRidVNq?=
 =?utf-8?B?QWtJb2FQOFlQYTlodXUraGxYUGJ6T0tCTHFuN1Nsb1p0SVdVMnZRZStPTGcy?=
 =?utf-8?B?ZVhqbWl2T2JCSlBSTytSVWFtb1FzTlljREhRN25OZFB3NGU5ZFBLK05tcktQ?=
 =?utf-8?B?NVBEWDRPTC94WmRFWUdvZWg3N05QeW1IMGpTcnBlRkZyaHg4aitUa3BWYW5h?=
 =?utf-8?B?UjNqQXlWcUsrYzJxYnlWMktpQWJBTnNoZUQvemhJYmhHcnBaMXBFeW51QTZa?=
 =?utf-8?B?TTVQWHhxQTBlekc1eUtwTzZjV0FnNjF4YlpOaVpWUFQ5WVhvcmNYNGVlclhw?=
 =?utf-8?B?dEdzRXUxRGJkOWZ1elNIWHFGQysxVGt3TWQ0ZjBqdzlZV1pSS1hXMUE4dlYz?=
 =?utf-8?B?ZUlMK2J1L0pwYi9haWZPQmRaTUFCY3JNaVg5bWhGa2FRM2xwY1dqVVJHTWU4?=
 =?utf-8?B?eGt5ajlsYXY3c2E3K0RmdmVEM2JNYzBHeTk4YlBLb1JhbXNYSWdGOHZPamdm?=
 =?utf-8?B?bVlrdFhxakVCSlVLeFZjZ1lwMCtmTjVIZ0FpQzdpY0NNMzBTbEJLY3RPYnV4?=
 =?utf-8?B?YVZQMjVDV0FJK3VTZDRIRi9HOCs3NWxQLzFOeG0vamlydXhUTlVnVGY2dXdj?=
 =?utf-8?B?MTBraTR0R0tBR2htU1hkM1JicC9VakhQNnc5WC9ONnJVbjhXVjA0RkxGVWlI?=
 =?utf-8?B?TWRSMmtXUVdhRzZuN1pHeWZTVnpwc1ExSzhqU3NnTXdOR1ZNbllqNlE2bEJr?=
 =?utf-8?B?MEtIRStBbXg4UnU3UlNiNlMyL2JRNWMzVXdXdDNhamZid2RzaVZXRGZJQThF?=
 =?utf-8?B?Q3ZFUjRUd2lFMEROWFU5dWdOaUdzWnd1T3l0dXVZUm9aMmNUa1hKdUlOaWda?=
 =?utf-8?Q?XKc057utX/E53z66zFZ16r3u+1c7zsFNgeD8gVKkF05Ua?=
X-MS-Exchange-AntiSpam-MessageData-1: LHy2iqlBf+BxCw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1856c95-c7bf-4b03-83ef-08de7a889435
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 07:26:55.6575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7kNAG1bu2jVRGRA4MWlxm5Sz4DHcH901BZCUpBUvX+I/FAvuioTPIAsTf83YCL7dLLdOMnIE2TS1wDhJta6rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7692

On Tue Mar 3, 2026 at 5:11 AM JST, Joel Fernandes wrote:
> On Mon, Mar 02, 2026 at 09:04:07PM +0900, Alexandre Courbot wrote:
>> > +    // PRAMIN support is only for MMU v2 for now (Turing/Ampere/Ada).
>> > +    if mmu_version !=3D MmuVersion::V2 {
>>
>> Why is that? I thought PRAMIN was also working on Hopper+. Isn't it
>> orthogonal to the kind of MMU used?
>
> The PRAMIN aperture window register changed on Hopper+: pre-Hopper uses
> NV_PBUS_BAR0_WINDOW while Hopper+ uses NV_XAL_EP_BAR0_WINDOW. Our
> current code only programs the former, so we'd need a HAL to support
> both. For now, V2-only is the safe choice. I've updated the comment to
> explain this.

I see, but then it seems that the correct check would be against the `Chips=
et`, not the
version of the page table format? I understand the two are linked
transitively, but they are in practice different engines.
