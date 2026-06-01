Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECE8361DD5;
	Mon,  1 Jun 2026 08:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304174; cv=fail; b=qhBhOo7gnl+/LDVLlPuGFOrnvtOGOt3Ek8RpX0aaqk4NLygQySVOtMVeIcKJT9BOhYBc3eFg/lXLxOCzOyEgGb3VAYtiFw63kxw5AFI+Qde3mPWNmlNIS+RVoa+bAg2wGF9f4G0qfNphNA8tCaeITli+BEXwEL3uFMveb+pbXXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304174; c=relaxed/simple;
	bh=Qr4knrfQhPMTQi+HaV4Hf4pXuIj5UPyWACySGVTrQbI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GbD6LSBQZZPQbfluD6iq4i9gFZX6+Fv4FgiKEOjcEeI899gP5lSsqcvdxX7TAa1Wdm7+ojgMunxjVo377/1165E9qvVk+4GPDOl0Cl0IxxuSkJTRPsMrWmwv27qxvlZbqxtY+5lc/D04pWatuZur/D7pkJGMlFkW58FDu7gh4qM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N8tFG605; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N8tFG605"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ci8hZ9XupqxAhuk+qp6nGu2X1734pJHhcKLaGIzRx/sMziu/SU2LIPJYDT48JDc/eC49ZWYd7DvMXAd89iGGeIxRwStmvZVnyNpS93vxk33kymxSP7qbi9rdiEPxsMtt1Xi4crQ50MPvMO3qZg0zYuF9VahJGW+mHmGM/Soz2Ct8v9U91msifKCWnamXne2HpPJAv35f2SmcDBn30+jJAf6+apSRO1+PKXWwyRCV+qO0yvh8Gyg6PnlmLLLcen9hf/DFrYswAT2d/1UMP1ooxTgTqQl4OUgiL3hL/KJmDAh0jmqQFmFuIeqzO6BtZd03pz+0wh/h+dwlVtTwmdJGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RT82hEStI7q0avIctFZBTmj4y8eKayQAMWRwVCT5qQ=;
 b=e0kDfInllLXsIx72u9dC5sDh0x0TkFirBSjCpU5UgnpE7uMLUEuFP5uqExnW6dq6+Boa607kDFRgyNP8M3tK9hwknRus0p81JNOqztl6QYBI3Rm6O+M81AR9kZiMX4jtYWREW3HlJwfT/joTTzXM6YC4+Xonds3Zt0TldAptGLGQ5pdz5+tO/a7sQ8LzsEIpgySI/zJDhfpOmBjqKdFwVdLJfqs8UCIJKNfDg4I4yD4cH3irl1SfzH8T06fdJxOZs6Z/+NaGbSzPT3HHdqyjuiIR3nAnvpN/zX8xgctLWjwsyGuwkkL7ih2QQSQGBPcu287Zb474g3StUzGf3bLu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RT82hEStI7q0avIctFZBTmj4y8eKayQAMWRwVCT5qQ=;
 b=N8tFG605sMb1wARo/aLfjmF4PZPAkwqFijAvldivthKL/MY4A/+WHGsgky7NyKmck/+eqT8XEBu6UXGKMBCieL6eFa8AY5LvD9Q3pVH4dhlN81nuWc/wDLqiZSnh90oQJ8oZZFZOIVa/dO2BfZ4zNlS83bp9bO3qoXpK97wWyozEGA2L0846IMERJKYSdC4sL+NDKVugQlYBT5TVYMap4/tTM0aDjmWoOr1o4pQxHkEe1x3l31njDX/iWC50syQDLHuDAns8JUe1KYgJz/9ck91IT/djQGMnFct/0+WZDosIIykiWRTqt2vsIwsXCm9wqulU2ojyFeb6edxQc1lpnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS4PR12MB999100.namprd12.prod.outlook.com (2603:10b6:8:2f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 08:56:09 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 08:56:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 17:55:59 +0900
Message-Id: <DIXL5K4VJE60.2PSQ5V6ZS17S7@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-14-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-14-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::6) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS4PR12MB999100:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce502ef-0ec1-4534-40df-08debfbb9c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	OhYcfjzax5hzQDCT22kRTc3bszZNdAvGLVSim5/DkTQOc6A7umlpG9O6eOl6ntsVNZaW5a6PJkPmAL2QkHyX+b7k4jNCQWqdZg8uQcwkz93SssfpY2rGg1PRsvdNnkcdWgxOxbBTnlFESYbOmTEg36eSlq27LOQNtnaviHekNTBoFN1nb1Ejxj0iSb0IUoc6B2mHbw2UBAalbhwfyD168PLJwqP05pMos9iAjMg7OA2pyFccxIORppck9Be1Tfptmrd2rQl/cl7a9H3e1I9YaF9c1tfITkJcR4UuPtiJ2VnEUlKhlTCPzLB7BcWh4+VOnCd6x8WRic8yUdk0ysYO5lZJU9onnE2NY7lr/dWUj015w1QbE8tfWcMf91zPM4/56SGLnT3RSVGbTjJ7x/Wsj8fkUBjDIVd0w5Dk5LX+bf+1TLw2rbDPiD3o+Ngf39k4MZvX/nK8KEzZfDvKycKmvV3GN5xKTuOBVJ5QojByT/MBhhhsd9Yh9S2CvrYame1nrjzLn8WB/PpoG5oDAnziPCNC1A5HyQUEHFn3GGPjm6OZeizQitoC10eBbmQbP9PNFDtAP0D05N+bJcvRxjqArwlDPUnK4HXuStMGjqkvS3UbBd/GqBOw/vKkKy0xNNlUFGk/45dYc8VSXImBMXg1LguHduMM259X4HeijJsXpmFiSwVhmFOWi6davtpECzeD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmJYWmhCSDJvVC9PWDdSRWdmanlGYmZVbEhhblprVGJWWVFwbnJoVWp0VWUz?=
 =?utf-8?B?WDduMWJyYjJkWXJJRFpXTDZuOWdDcGVSckJiR2w0eTM4bU5nRkd6K21PTU1p?=
 =?utf-8?B?TGVuM2JhOHhwMjFLWGZYamdqcmJSVHVTMmFpdHVNZE9NWWZmck9qZWNuK01V?=
 =?utf-8?B?VmZsOXloSWpNZTUzK3BPSEpBeHpDSDNaS0t1WmlQaWJzamplN0tNcm0ydWE4?=
 =?utf-8?B?MHhENFFzeDI0TFhoUzJTb0VnSmNyUUhoY29oa0U1R3JJVnR4QUovSUxWS2RQ?=
 =?utf-8?B?RTB1WFVPRnZOZ3ZCUitYdCsrMW9QWlZWeVA1TXFyV0szeFhQUTlWazBIa1BV?=
 =?utf-8?B?SlRhSy9oUmlvbzBmR3VGSTRrZ2VUMTlQMDQ2d09vL0dyVWhLbUZsWVFybUpR?=
 =?utf-8?B?WTR4VDNmdkNLTWs0TmJuMUV6c2hSR0ZwQkVrRExVTmVGaU9VaGw0QWxSZ25F?=
 =?utf-8?B?cHFNMzV5MHlEWmd0a3pxOEIxWGNPcjVtUGJCcFhhSHd1Njdka3NWbllLRkI4?=
 =?utf-8?B?N0llNHlpbWNvTWJrWTJ6TzJoTHN2YSt2QXpDUTJUYXhoakg1Z1BHMTVOckY0?=
 =?utf-8?B?OEF5bTZPTVJMRFdtSDNTcmlTU0RibWJOUHY0MlF0N3NLR29FVUthbWNvbm1L?=
 =?utf-8?B?dWxTR0RBU0ZBMEdsUUtWN3RIZjVsV2E5eFR2cnhvN01VQVg3NitKYnpLMFpw?=
 =?utf-8?B?Ym1wR3k0YU9VV1F2ZXlEdmtVL2RDc3FrcUZPRHRwT0Zsam5DY0ZyV1AwN2xq?=
 =?utf-8?B?WmQzeDgyQkFqZWlzTkJ2QmdyWVlEZGVCeDZRQUwvL0Q3VVlleEx0N3Qzdktr?=
 =?utf-8?B?TDA2TUNjaWlOUjVaUHBPVlpLMDhDQ1pDQWNLWWFQbC9VbS94M3Z2bFdSNlMr?=
 =?utf-8?B?dzNpdDJBdWsvL0V2Q0oxeGRYdS9YdDNHTVRqaEJXeDVuY1hTRHc4cUl4S0tT?=
 =?utf-8?B?OWZtVDFXaTE1a1FETk5DMHVzckN1UncyMEUyVms5M2tnZDJiSnNlbjlROHNz?=
 =?utf-8?B?VXVGZ1dWalRiWW4xbEJNR2NMd0w0VDM0bmRvVGM3VFJIdjFCVFBBNUF5ZWJQ?=
 =?utf-8?B?Nmg0U1JQbmZmdEpIY1VnNXc2S1VoalZKZEM3QlAxcDIrT3U3YkcvWEtBdmEr?=
 =?utf-8?B?eGVnODRQYjNXN1F1ZFVKL2dROG50TS9VZmt6NnBqYzRKQkFDZGhOU3p2TkVy?=
 =?utf-8?B?WGlxSkRUelByYi9EL2NCd2ZZQmdLcXNmYU8rc2NLMnpVTWpjdlMzZ2paMjAx?=
 =?utf-8?B?dDBZYzI0K0plRGhlRGR4ekVwOEw4WUp6V0ptSUxLL3JsWlgwb1VvRCtEYUto?=
 =?utf-8?B?SFlHRHF1MktXSURHODFnVGFxMit5S2xtTWc3eXllMHZpcE5IQVo1SlYwMlR5?=
 =?utf-8?B?MFdCMTBXYWZqSWxKZmFIallkRGF4Q3phOVBxS0RVY25WbXNERUVkcTdpQVI3?=
 =?utf-8?B?YnNJRlhkYWF1RnY1aUI3QWFTVEVRMnpPWnY3ODFZd0pFRVRacXJIT3dEYWor?=
 =?utf-8?B?eHRqY3AzaEJBc3RXYmtCQXVXVjcwVFhDTGJNUFFPK3JoVlFOcjUvSndFbmZq?=
 =?utf-8?B?N3BLd0RZUHdkS3NKV3J1TmhKS0NEVDlUcU9QY1NpcmNMaWVvVGhualcxY085?=
 =?utf-8?B?RlNxRm90akVtVWtVbGFVRHdEUXVWV0ErZytkK25UZ09oM2dIV3h2NjBNMnZL?=
 =?utf-8?B?bVU2RWxwQlhlTFVZQlNtalEwN2VYbmpnOWczOFoyRUQ0Z2xvYnRoOWFvbUt6?=
 =?utf-8?B?eFd1cXVaR0ZkN1hlLzhjV2RpOEJ5c2dKTk4zbVN6bnlYbllwUW5rYld3UHFO?=
 =?utf-8?B?cjRHR3JxdFdiQmNLTnlMRyttUGo2dnNGT2hHZDJVcWZGVldlc25vMjI3cVhZ?=
 =?utf-8?B?K0pPalIwa09MWkhsOVlnRER0d0U5N042ZWtiUk1zbnJrTWIvdWE3YWkvdGtj?=
 =?utf-8?B?c0pMTEZheDBFOFh1b3pvWEx3T1U3ckFib2pHTHM1dmw4OTZvUjdmWkZ3eC90?=
 =?utf-8?B?WFFVZFJXbnZQbDhwbVNrTlJPYktiYlBZUGlFMDhwUjgvRnhUc2Q2VXJMd2lv?=
 =?utf-8?B?ZENiZ2ZZUlZoaHcvdW5JTEtWMXhPVmFmaFNJTld5d0N5TjlDQjlrQVFOS0Vm?=
 =?utf-8?B?NjEyMkc1bXlSUXBrRGFLY3JJZ1FDcTFZZlh6TFdSODZXaWdIUWVDTkptVFZj?=
 =?utf-8?B?ejI2UzdwTTJqV05EYzRzL05tYzlzQmc3N21XbENLa3Urd052TEpsOTRCNnR4?=
 =?utf-8?B?dVlCUmpTZWRjZTBGRVFqVmdna3lGQmwrYlZJaTZZVU5pUUpvZFV2eXA1SDJl?=
 =?utf-8?B?UkZpL2xuVnl3d1RaQnhDSFMyTnA3a1VYZGxzQzBrOFo2aERRemFtVGdyMkFW?=
 =?utf-8?Q?UNBRBvMmsKDDv7owTU0FcZawPSCqVPkWSkrGz57npanO6?=
X-MS-Exchange-AntiSpam-MessageData-1: 3D5CSpmHkH7Kfw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce502ef-0ec1-4534-40df-08debfbb9c21
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:56:03.4045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asPBzD6+LeU+PV1aGM/enRk73axWe3wehIsyhodxUlwAPpbBX546wH3gUHAv4Ae7k0i5fQutSNDD/XFJ8j2PLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999100

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> Extract the SHA-384 hash, RSA public key, and RSA signature from the
> FMC ELF32 firmware sections. FSP Chain of Trust verification needs
> these to validate the FMC image during boot.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs     |  2 +-
>  drivers/gpu/nova-core/firmware/fsp.rs | 90 ++++++++++++++++++++++++++-
>  2 files changed, 88 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 6edb50b83a29..569efee0d4ac 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -641,7 +641,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Op=
tion<&'a [u8]> {
>      }
> =20
>      /// Automatically detects ELF32 vs ELF64 based on the ELF header.
> -    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&=
'a [u8]> {
> +    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&=
'a [u8]> {

I think we don't need to widen visibility here.

>          // Check ELF magic.
>          if elf.len() < 5 || elf.get(0..4)? !=3D b"\x7fELF" {
>              return None;
> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-cor=
e/firmware/fsp.rs
> index 011be1e571c2..dc28d0cc2d03 100644
> --- a/drivers/gpu/nova-core/firmware/fsp.rs
> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
> @@ -15,13 +15,35 @@
>      gpu::Chipset, //
>  };
> =20
> +/// Size of the FSP SHA-384 hash, in bytes.
> +pub(crate) const FSP_HASH_SIZE: usize =3D 48;
> +/// Maximum size of the FSP public key (RSA-3072), in bytes.
> +///
> +/// The FMC ELF `publickey` section may be shorter, so the remaining byt=
es are zero-padded.
> +pub(crate) const FSP_PKEY_SIZE: usize =3D 384;
> +/// Maximum size of the FSP signature (RSA-3072), in bytes.
> +///
> +/// The FMC ELF `signature` section may be shorter, so the remaining byt=
es are zero-padded.
> +pub(crate) const FSP_SIG_SIZE: usize =3D 384;

These constants look unused outside of this file to me so we can keep
them private.

