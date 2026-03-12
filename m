Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011053.outbound.protection.outlook.com [40.107.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2762236E8
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 13:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321944; cv=fail; b=g5qLvatrnCm6rEhlHxb0Kfj3RYv3BxhX+Jh1Gl5o8FUAvUsBjGUmCI1JO6cTDm8dv2nV+vlUoJdrTh6XozE7GdTGs+LksT1pBm9oHCdgD4P4s+p/WKJ0e2LJbLy+c+kHzi3dnmKKzxgZy+VNKi+/uabnHk/a3c9P/r/v35RrgvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321944; c=relaxed/simple;
	bh=eQgiUCBqcbmehMALbAeknf9utL0Ad+NVGJ+WLF2r5rY=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=hBJF8YZBLygN/DJy86c7pKVw+kC6tIGzUPU3MB05OxbYav1923n0xb72cIROMmX4LPLfEaXcjCeTbE066uUQSam7CivNjp70kGHxvcO89yfEELoPYcnr+rmOOWJWX2l4UV50+ULovyOe4GyStnppwwd/Yk6ed74tscj/yP5/C04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lQ4lrybA; arc=fail smtp.client-ip=40.107.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lQ4lrybA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nn5kEXTJFK/7bD1OlKrnG7FSBSdQtgWmLFByQ/3BHv4QuW+W7bjn2dRyNW843D8bGAzPDAnBFxA6mlOkBXF+RrvC/AQSZ9ELnBbYtSZXUK3xLoSPjSQwiIK3EBPvCjtsoZ45BzDbISOj/ydXrVpJxDVi6FslZNtQMW5fNyE1xouZfkrYZmAxaeqksSAEbf6T5ACUAFzIDTYFKsb6CnbGM3Zr4wzg5D8WuVTi3prlemSq6Fh7w4cnRCzdi+XGqUz+Vc09g662eBcSdsZibfbVatm0xyTcDK4r7lm66S7k65FhA39SDH/OE3symUQ+JXNGJbILqOyhXxu4/YWyksqZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srTgcODO8+m1Ix4iWCkZ1TGaDw66EHk+unGmTzOitY8=;
 b=xRMn+F/xrYWCHImXgy2OO0obADo4Pz27XNVd64B5NVTjj4v31ucaB8C4AXr5KVcBDoDqbz1pzQZu9vQoOPYXFZ19YxVYq62Hlg9rSIuBryo2D/PtWg2DT+ZMPrw9VE3OmUwobdu3keWtmZAJ5BSyYdfYh+njCWGtOIbj2yApTtOpA+jCh4ks6gYGjsDBW49XbkFz1uQfhZ7eYFwY0IgrIwyAEjLobttUPCvxCIQrgp+qbCFVtZXFpySr9Fihf/pEr7VFRfd25/t3qMecK6lFWtcIWsjqZeO2ZulxojWWgPeUKn2hGXAzasXJ7dPvD/91PXZdiD/4TaSkWDAz3bLoyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srTgcODO8+m1Ix4iWCkZ1TGaDw66EHk+unGmTzOitY8=;
 b=lQ4lrybAP8a72o5y99zvvtXSaIkjqdalQwh4rD/KBiumX+rKDFRNKOrSeP6pwuQ9byI0UtVXUYZJfQf/nqsZVKWeQeNE+Z2EXz3WhJ71SWBDqevqSS8rj9wnUes+C2MRbHi48DeGYQqPaJupsyt0TRjqv4o+FTBmTIexQXphB7RsbrcE3X2XALVTN4LHJlLQX4dHSO06ciH2OOO5QkHVQbkBjC2ceqZuFDmIrrakIctpp/DJIxN6tr708u0o26ST9lK657KiEBa5kNdaekrnSo33lzvKSoeiVtHrPbC3VfZZYQSZT3JQcliKyy3NHlbeq/k8Zti3z4jVVs3p9/29DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM3PR12MB9285.namprd12.prod.outlook.com (2603:10b6:0:49::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.6; Thu, 12 Mar 2026 13:25:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 13:25:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 22:25:29 +0900
Message-Id: <DH0U5S2CK89E.35JMPLGPPNF6C@nvidia.com>
Subject: Re: [PATCH v2 1/5] drm/tyr: Use register! macro for GPU_CONTROL
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
Cc: "Deborah Brouwer" <deborah.brouwer@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Steven Price" <steven.price@arm.com>, "Dirk
 Behme" <dirk.behme@gmail.com>, "Boqun Feng" <boqun@kernel.org>
References: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com> <20260311-b4-tyr-use-register-macro-v2-v2-1-b936d9eb8f51@collabora.com> <20260312093953.78f53864@fedora>
In-Reply-To: <20260312093953.78f53864@fedora>
X-ClientProxiedBy: OS0P286CA0063.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM3PR12MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c071dd-c36f-4741-68e5-08de803ad6c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kobEB2jXtzsi+97xRhSYKat53ydqYRsTjO1bXTOP/KNFEEeMFbauEDKjl0M8wC84PuSzUoI1uWa+p5h+zD4ROYlkd49C1Z7HSbroVKPeVMjzF/MrCNVy5d/o1+kni7FEIiueM1810ElyopWr10nbp1YwvAOiNYyi7RNGk62w//TbHFKzh4dPzh8X6GLFEiw9uGmmDW1yllCn6UO27wGIQskDGtU19RUaBP+IsEGhKX6knwLC69XTdrfn/KWrIrLEKCCALEzyTdYBvgp1q7fsSbG0/BJx6t/UeAdPo8z/3TyEWzDw9uctcstlJpo3f2fpysHkGp0feejI1Xc0wd9wwN0c0GnXW7wtAXvrbuE7V1MWge0+zetJlEVjd9TD1MUOYoKoiPokU0NP0D1o73jyaDPq4Mp8lwP1QWcilg6vK0/JoT83qwt6xGT0B4+1dH6bE2nTf1f630Rv2vvHuUDgf0DxqHglUNttOmOuP4yy9Hr6G3t3l1LjRduh4lzjQES7WBEfyu3vYD3qN4iXO92I5Lzfd8mmX+uU9UZ+YvsPyNhbVVEBnysaxDLTB5faHlXZnes20+cLKGXO/n1R6ZdcVjYrRjitjJAA6ozVvoYu+QCj3f5efI8kQT/PDnIpz40z0YVLCFw2cPAMjJha4HQbqM4ht4P0IxZvY86XebncbLlNIGZbrtcyz9WJXI8IMrJqtGsaMyoLwV/hmL06uht5v/dTqPpS3ej9QEd9YC5Ziw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUd2V2cya0Y3cGdmK3NPS2drTFRPSTMvTk9Zcjgvd1dHYnNjL3FwQk5vNU5p?=
 =?utf-8?B?Q1ZtUDZZVEFvWEpzbWtFS29PYzlJMkxvc2dRcFVYcU9CMzE5K01xUzlEc1Vr?=
 =?utf-8?B?V0xERzBvT0dwU3QwbW5jKzNpVFI3NjE1NGVwdlZMSmlmaTkwU3VBbGM4b2Nj?=
 =?utf-8?B?T1ZQS1UxT2pyWU16ajZteXk3Nk9uZE16UnMrQjdic1ZxbW9tR2x0UmJOakZt?=
 =?utf-8?B?MWs3cVNuWjlLcW9LM05vKzFYZmk1OXYyQ25BdWFQTnF3bk1uNEdxZ3BsN01t?=
 =?utf-8?B?aXREdkJnblJZbUFmUVM1WlppMUhRYXd2eEM5WForbTh4aDExMzY5MSszUGJl?=
 =?utf-8?B?TEVBbENvbTVJRSt5QVB1SDdaclBUSklseXhENWJoWi81ek9IS3VtMFhEOFA3?=
 =?utf-8?B?VUtYUklJVFRmcGlpUytBT3BaWXVLZlU5cFBjV001dDV1SmRITWo3U1N4eU56?=
 =?utf-8?B?QmZ2Vzl3UFNZUS92MUlOYk9nY0NRNUs1UExSdmtuWW0zbTZxVjRyZkU4SDIy?=
 =?utf-8?B?bFlDeGdwUU1DQjZIZmZmRlVaVWMzSVNVaW5HMlVhaWx4Ry9TZUFEUmlJL3FP?=
 =?utf-8?B?cFh1R1pVWVlPZXIxdmxCTlRhYzJPd1BPM0FNdU1NaXlqaXpUODNmUUxSdmkr?=
 =?utf-8?B?UFUzcWVJK3JQYW1QSzlTeDM0U3hNYUEzVHpKVG5WMytWWmZaR25YQUJ1N1E4?=
 =?utf-8?B?MXZ4SHFmRGdKUjJiR0JWSE1ZNFJRUUp5MzV6OUwxRzMrQTZIM2wvL3R2RWF4?=
 =?utf-8?B?UEs0WHVEMFZ3SndxUGNsSnhvS0M1VXROcEJjL2N0WjFZNTA0RE5zUjQrOUUr?=
 =?utf-8?B?ekRBa3orVE5TT01iQ0VzdTBMaHB2K1ZqTEpPUzFXcnljWi9uUDZFR1BoSldQ?=
 =?utf-8?B?ckxPY1dybkNyTFVaZ1ZZbEtoZHpPcEl1QlE3MnNST05sWThQcXpQZ0pxWS9i?=
 =?utf-8?B?Z3h3TnRTMVljUElYZ3R5eDY5MWYyN2hDZS9PU00vUDdmdGhxcld5NzVGYmg0?=
 =?utf-8?B?VGxKbFp2dGJEbE14djNFVG5kTlBiL2VJYWhFeGM2MDlIODVKcDZiRXlZaUJO?=
 =?utf-8?B?UTc4enpKRFZIdkNtVmEzQUV4bDErSStlR29zS1ZUcjkvR0hJTU93ajQwOHRm?=
 =?utf-8?B?TVBuSHlDUGs4azd1SjdQS21mMVN6ZE5kY1Y3d0hBdnVxWEJibkhjQTNZTUt0?=
 =?utf-8?B?TXB1WUVpSkVCYXN5Zk5UYnJUVjBMZ292bnozck40Y0wzTGQ2d2Zpb1hYS3BZ?=
 =?utf-8?B?VnZ3b2M4bFNRMGdBMW1sR0wyOUtJU1dBVGc2ekV4QS91WWx5aW03Z3JUa0kz?=
 =?utf-8?B?TjFKaTBrS015Y0ZMZGg2WWxsNS9UMFhvbDdOSHlhK3U3ckRicmFaalVib0hQ?=
 =?utf-8?B?SmZmVmdFbzJ2cUF5M1A4ZFZqbzdxRVpEWEEzWHpuV3VrVTBpaTVIMFVLSGpw?=
 =?utf-8?B?eXFPRnM5KzhvZmg1TC9EcXI0T2JxNEdRM3BCK1RBNUszdFhLSHJvRU9TZnRp?=
 =?utf-8?B?eEtTUmViN0lWVmxUYzAxNE5HTXlYcFdnZloxNklXN25hS2kzU3IyM3ZudDNM?=
 =?utf-8?B?cmo0VVZTNTFXVjJyWGYyMlUwR3pJamhtY2Nwc1ZLclVKQ095OFlCbzl5Mjdp?=
 =?utf-8?B?RGUzREx2T2dqQ2c2UGkzRzA3SEFsZWNJeXZuZjhycm9NQ2dxNjZOb05YUWNP?=
 =?utf-8?B?MmpleXd3RTNHZFhrU1ZwcDV4enByK0M1QU5yOUM4S1hDZy9MYnRndU5aZExu?=
 =?utf-8?B?OFhRcXJob0Ryc1ZKTzVuQkZXU3kvcDdmKzYwdmU4by80aXR5NW1wZUtMMVBy?=
 =?utf-8?B?OW4xZlpRdm40bVBoLzRqaVZNZk9lais1bk0xakRhYkt2cEFYaGNzWUJlbHZU?=
 =?utf-8?B?Mm92cDVoRUJEc21seW9FKzdhWE15MS9HRFoxMFdRUHpGSkhNM1BXL1hwNlJY?=
 =?utf-8?B?WE5LT3F3ejlHRzZwUitHYVNVanVwZ1IxVXhqQ09PYkY2MzB3cUJvUnZ1R2Vp?=
 =?utf-8?B?cmM2UURIcmZhWGlybjA3Yy9RWGhXSGpkQTFVWnptT1F2d3BBN2wwK2JYNlRS?=
 =?utf-8?B?K1ZINXltNm1qdUlRMlUxZHZmMkhTVmF0NnlCTzN1TGFxS2huRHl5N0d5ZHh1?=
 =?utf-8?B?b0tiY2NMbDYyOUlJbVkrOGp1TDBrcFBCR1FGdHBENi9Bb2Zvb3lLOHhWY0dM?=
 =?utf-8?B?T0VKTmJ5cGw3ZnJvelo3aVJIb0NvQ0lBcyswZXFWaUxJS2ozTjhHZG9paGlH?=
 =?utf-8?B?MSs2V3NVY0hWTWF3elhvd0NQUTUwVFdUU2p0eWJXTmNBUzlYOUNpL21yMC9a?=
 =?utf-8?B?V1hvN3dpdlR6eFQ4QWd3K3VQeC9yMFVURVNMMUlEQmVDcW1NbExLRWVDTWxM?=
 =?utf-8?Q?c8lMYnkE3IBSfKYB1gYMbjzwGc3W95LUEiAqU08akPx4q?=
X-MS-Exchange-AntiSpam-MessageData-1: t5ljYFOEurm3DQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c071dd-c36f-4741-68e5-08de803ad6c5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:25:35.3797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bo4R79aBbpiRQuxZOgvsF/OLUXTTUOLKm208W6+trkr6DJK1Q58b0CFKTpt5BD+XgYId4d2NIWMYxsfuHlWgJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9285

On Thu Mar 12, 2026 at 5:39 PM JST, Boris Brezillon wrote:
<snip>
>> +
>> +    impl GPU_COMMAND {
>> +        /// No operation. This is the default value.
>> +        pub(crate) const NOP: u32 =3D 0;
>> +        /// Reset the GPU.
>> +        pub(crate) const RESET: u32 =3D 1;
>> +        /// Flush caches.
>> +        pub(crate) const FLUSH_CACHES: u32 =3D 4;
>> +        /// Clear GPU faults.
>> +        pub(crate) const CLEAR_FAULT: u32 =3D 7;
>> +    }
>> +
>> +    register! {
>> +        /// GPU command register in reset mode.
>> +        /// Set command to [`GPU_COMMAND::RESET`] to set reset_mode.
>> +        pub(crate) GPU_COMMAND_RESET (u32) =3D> GPU_COMMAND {
>> +            7:0     command;
>
> Alexandre, dunno how hard it would be to extend this alias syntax to
> provide auto-initialization/expected-value of certain fields, like:
>
> 	pub(crate) GPU_COMMAND_RESET (u32) =3D> GPU_COMMAND {
>             7:0     command <- GPU_COMMAND::RESET;
>             11:8    reset_mode;
>         }
>
> so that when you instantiate a GPU_COMMAND_RESET, all you have to set is
> reset_mode and the command gets set to GPU_COMMAND::RESET for you.
> (that's for the write path, for the read path, you'll need some sort of
> match to do the re-interpretation anyway).

You can do this by augmenting the methods if `GPU_COMMAND_RESET` using a
dedicated impl block - in this case you probably want to implement
`Default`:

impl Default for GPU_COMMAND_RESET {
    fn default() -> Self {
        Self::zeroed().with_command(GPU_COMMAND::RESET)
    }
}

Then you can just do `GPU_COMMAND_RESET::default()` to create the
register with the expected value.

Maybe we could have a syntax to automatically generate a `Default`
implementation in the future.

I will have more comments to do on this series (notably the use of
constants), but it's great to see the register macro being used!
