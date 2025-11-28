Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011051.outbound.protection.outlook.com [40.107.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A9B23D2A1;
	Fri, 28 Nov 2025 00:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764289671; cv=fail; b=E7DsqkOCg7UN5LSMypsU18xUDBlpx4+ScMTe3U3HwWIcFAK54OTSGJH5hf8Ssrpx/pwa4NXTn8wLvM0PYRpo9JeLi5Qt/27ioHvrMYOCwUbeE+9N+QypJdbcQFi699YiU+Sfb01ROwesNTvBswgdduO83gRKaYpip91TTKZFl5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764289671; c=relaxed/simple;
	bh=JY7tn/VwUbqxQGnat1gAt5PmvrtpmameTYb1CdJOgmQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lkdceCCn4+wC+sUBziB2LH1uK1p5FsOAscEDVGmf7GiqvFk7o2QRLumB9wHDks+RYxbyztlBhJr1/Sd05heXQT6nG8yo9iH81qrDyfpwC1qGip0S3DabjIsyvv2DUKzBqKm0BsL9Ze41BNXUKtmi8MaRIRgjPjpCwfJg/pJqFH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ATNExwB4; arc=fail smtp.client-ip=40.107.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ATNExwB4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkXdDgZrO64qbOkdmBWxY6P/26Sf0zIBA7CQFigSKy8Y5pXkmQqb3msHjhkssVyq9ELmhV0h+CQoRLhkKsKNzfxIG7tfnMBt2sSpUuye6XB+4O7trkrs+Z56WQHeuNq5KldzmpnQMFLwU5ZZRDxrBPQ8M+YVr9TDzszjXf8Gm7ELg9ljW4BDRAbhbDS+skmLhO4jWGxzPZ8TtVW4h+hODcZkCmTdeWLvnRsMtca5MsoBu1Zdt6o/RTXN9L7TI8Eqsb9NMVkZqOSBh/hWNRjuDcfTyr/0gvYwOuKFGYoMdBWBF6CACK5hKHVtj47V4RqfIlOVWYejk7PHHSBULiZjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCUGR4FFbNo5zYYKgWCc3KKh67KhdNKH2ypWIWdanG4=;
 b=GXXAFrtmgbAXBMw4ZNTD6gqwkLgNKaMJqNh7v7RjcWURHmEljTIFZWJRmXc562mQ+vw2RTPBJ6W4fI1g5aDT88czU8OntnSvHXsA+aUTYmOZP8psckifXIWR1t2Xs7NKE7GyqmPwAJ5z0rtFurmoKzdxarC186NPxi3161wdhqdWmy6fuShPJG9XiLf6keZafQofbn2CW3YiXVwvpAz8DvKFBIG2BVqHfE3WYB6f7Jp5Lh6YmFMDOXkXznq45Vy+QkXZGDV8OWAIxwcJFUkAmD0b+Ybm9MEAuk4fif0YdjyTM1dc7bLMsMV+tavPlyeyO5Qeorhxm6GJrdCMQRNDUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCUGR4FFbNo5zYYKgWCc3KKh67KhdNKH2ypWIWdanG4=;
 b=ATNExwB49hfFDqOgD6TjTIeKmJUN9gpos1Jq4rVM7A546yHSkwGSslP6cHlFbirMq7lNQ82/IK1Dmd8LV3n7zhO6n/MhFLg/ik+Jn9mru3UOaZLQpLC0Zu+ZGeBbolszf1mcHFl2A15yxt3L+bLiqrBbzYhTHabyYURnoaw2i/aBO/TohLbNFto+ZQb3XxTYnCFjM2tyWdTV06Oddz4A5luYzMqECYwSvaS39PeRn1k1SIv2HbvFiGqivd5wAHbkQ3ScWO1tLzdhFz1TMtU2yUNRZ583Wh/73JT0k0q6mtO471ucb6PIdfPgWFpDem7QMUH6zbdHyRXGcpF3O2pFyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB8048.namprd12.prod.outlook.com (2603:10b6:806:31e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 00:27:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 00:27:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Nov 2025 09:27:41 +0900
Message-Id: <DEJWHLBKP2OS.2EI14OGPEERJ0@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: io: always inline methods leading to build_assert
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251127-io-build-assert-v1-1-04237f2e5850@nvidia.com>
 <A1A280D4-836E-4D75-863E-30B1C276C80C@collabora.com>
In-Reply-To: <A1A280D4-836E-4D75-863E-30B1C276C80C@collabora.com>
X-ClientProxiedBy: TYCP286CA0164.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2083f8-64da-4339-7599-08de2e14f3ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjdyaUt2Um9Idndwb0NVV3NZU1pjUkVVSlZEN0FzcjJ4UnFsVGJBVjBxQmVC?=
 =?utf-8?B?L01iNnFOcjhKUmdkallWZVFHaG1DeTB2RU5hRjgxTTBJUFcvaE1kalFVZnli?=
 =?utf-8?B?NXdNZ0ZvRlNhVnFxREJ1MXZXVDBFMTdtZndtMldzMkZjSENpeit6dGN0M0dX?=
 =?utf-8?B?WW5oR2srOFkyVjVaNHlqYTN0NVQvdGxvMzVmakFabThDV2hvOTYyb2VzTHM4?=
 =?utf-8?B?VGZ5M004YzV2R2svYi81RmZ0MnhpR0huaDhDVFVTR2F1VHNQWStYUStBSGdv?=
 =?utf-8?B?MjcwMTV2Mk11ajdKeFlzVHpmY2JtTW9kdDNuNzhtaTBnRXplQVJ3RDkxOFhk?=
 =?utf-8?B?UkFDYzQyVXRMQmtaMEZiS1hTdG5BNnFlcFRnUDBqZWx2bHBTcEVqZXRyNkxE?=
 =?utf-8?B?a2RXK2RhQi9jWlRQQkU4V1RGYVA3eWlyK3lDZmp2bm5MS0RLUGpIQ2x0c01P?=
 =?utf-8?B?T1FSTHFKUVQxWFNDR250cVpsSDlpWmxSazRkck9kdHRGQ1NmWTVCRE9oWTFs?=
 =?utf-8?B?TnF5NUZnbG9kWFE3YmNWZjlxelBqZGVXQStFa0hicVdIRUsva2hQTy9HN09L?=
 =?utf-8?B?WlRuN2EycXNWYk9VbnJ1Q0dvVEVPdGsxUFJxTVg4cFFiRlNFdnR2MFhkalNQ?=
 =?utf-8?B?eFVncUxtSW5YNTYzY0NldWJlcXBOUlpFT0pBTjZMQ3RyMWJSTlBCS3V3OEhy?=
 =?utf-8?B?a3hpUDQ1b2lsY3BESkpPT1o1U3BVTENhZW9na0JqWCtTRG1kTTlRWlYrUW5M?=
 =?utf-8?B?T3lwTmZOeTNBSEQ2b1BEaHYraHVxZDA5UnBUVk1UVVcvTU1ETlJkeHoweFhC?=
 =?utf-8?B?elRpQkp6UlphQ2xLV3dwMG0wUEp6Nnoyd3lSNjlmMCtPaWpkMCtvanNTdzI4?=
 =?utf-8?B?ZjRvQjdUTG1CNFVEbEppdWlWdUN1d1RIRFBVSDFuVDA0cTBvTmpUbmY5SVZG?=
 =?utf-8?B?THNCQ2twam95eEl6dit6SS94VXVSeGtrbmhZbjc2UzZ1VnVranNjM1BCRzF2?=
 =?utf-8?B?UEp0amxZWERKSnIwOFBIaCtGQndFempON1NaQ3FiM21EZkRvZTlBVktDd3B3?=
 =?utf-8?B?RXFDcEQwVTlUQ2lBZEZtaEUzQ2creDBxQmFlY01US01QQWNkWUorY3o5MzRv?=
 =?utf-8?B?N2xiajVCQmczbnBDN2RJTVZodWVIUWZHNG9PMUFWMXVSblR2SXpUU1ZwUUI0?=
 =?utf-8?B?UzhuZm0xL2lweHJ4NjU3cDdCWTBNaHZVMjlMZTRqVTlkYms5c0psM0ZJZWRu?=
 =?utf-8?B?M2dHNE5panRla3Rsek9qcXVDVUtnc0VtOUZqaC8yMS8wZk1VeVZtM3pKZmZj?=
 =?utf-8?B?RFd5NDN1b2FtaWtoWnpRc0x0eVFZZnhpWjd4dkdnWlNHdzZUVU5Hbkc5dUxM?=
 =?utf-8?B?T081NmdoK0VucHdiS1JnVGJNRllVWDRZYVlUUDRJZEdYSDNJbnd2Tk9pOVpE?=
 =?utf-8?B?QTFxM2ZLcmVSbnRRRG03bWFrWWQ0b1VPUTBrazRnajZ1cktLQXFSR3VxR1BK?=
 =?utf-8?B?cXF2Wms4aEs1cGYvREJVV3NicDJjZEFMNTZNVDUreDJqNWVoVEFadTdRa3B2?=
 =?utf-8?B?ekdyNTMxVHBEdjhvbWdpM0U3TDhDa2RXSE5vTkRzQXR5bGFOY3dZVE5lR0NP?=
 =?utf-8?B?c01VN2dBd2VCczlnbDVnaWY1MlJSNHI1bE1tNkpWRFp3R2lnSS84Q1Q3Q2Y4?=
 =?utf-8?B?c3ppUE91Z1hVNm4wMVo5UnQ5NWdGM3lDaGh3Vjk5L1Npc1lSSUtZS2M5TFdW?=
 =?utf-8?B?MDNEYkxkd1N2YTVzTkNkTFJpOGk1K0lRK1RuNytiN2VsMlVsZ3paUGZWcDFH?=
 =?utf-8?B?emF4V3JSdFNxTENzTjJOc0pLdzkxYUV4SGFuVVN1QVliMDlmeWZNZ2xHNXJn?=
 =?utf-8?B?MUNOdmdOUVFkWk1DV1VXdjRrU0ppVWNwZzBMV2I0ci9KWUtSaGVmdWRqSnBF?=
 =?utf-8?B?azcrZHZ6N0tnOE81b2RJNkdSUm8vU2dQVVpSbkxHdG1VdEJUWngwMHdnMmpK?=
 =?utf-8?B?REM5YW1IQ1RRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmxONi9HNDVEblVVSkFMc2w0d0RiNU1GWWFyRnNMMlozM1IyRjdRNW94L3Qr?=
 =?utf-8?B?dmVabHJBL1MyemVaL2VVSy84TWFEdkZRNmtvUGQwQ3owRitsT095SnFKOWFl?=
 =?utf-8?B?RTdoZFNtZlNWNTY2aSsycE42ZU9XRmxaa2h1ZWJDQXZQT0JuRkhRcFF1WUhw?=
 =?utf-8?B?SHlqV0tTM1E4Ymhwc3o2dUxqNUR4OHppbjh6aTZNMlNiOHhuR0JsSEpoOEFQ?=
 =?utf-8?B?cUhzaURxRVhxcFFmWVlqQ2poVldLKzBRK0NDWC9mTVl6citzNCtiSloxeW9P?=
 =?utf-8?B?RVRNcVNXSWhPOFJDSjFXVTY5TEh4ZzQ5RDJwbjZpSVhoc2VhRjJNdm5EeDBG?=
 =?utf-8?B?di9iVzdFSWJUUzIrVDVnK0VPUEladU1NemNlcWZOQWt4MFNXQ1grL2tzMzBP?=
 =?utf-8?B?aTJ4RE01TE82OUNQaUcwOVQwOG5yZDVObnpaVFNVdXUwNk1ZaExkZVAxZXM2?=
 =?utf-8?B?K1FjdmhJY1NINnhJZ2V1eGh1OFJpWkM2SWdVNmE1RVVFY3BxVG03cmlqcTlP?=
 =?utf-8?B?ZGFheW44WkhlQjdvMmxBQytTdURXMFJOd214cUFSY3ZQeERDa2hGeFZ1ZDZT?=
 =?utf-8?B?Q0sva1RpTTdSakx1UVRhc3ZGVEFYdXhQdU5lenNGZXdnV3BVWkNqTTR2bXNY?=
 =?utf-8?B?Ynk4RDNNR0o5eUZRMDl2QWhLQ2wvQk9VNmh6bTF3ZUMrUG45dDE3RkZ3d0Jo?=
 =?utf-8?B?cmwxZmpZemVYRnVrVktFNHdFWk8rNW5SMkhsSm9HbGNyK3cwQWFTTFdzMGlT?=
 =?utf-8?B?K25PQnZEZkdXU3pDYk11Nk1jNXdsbm1wVlFqL1R4Zyt6N0p5d0tMTjk2cVlD?=
 =?utf-8?B?STViTFZiTjlIR2V6dTJGS1VNNmp6cXk5VTh6RVc1c3ZaNFd4NDdXTk81amlX?=
 =?utf-8?B?bXJoZ3JiUW1hNFF6US8wSUxLNmJEdkNoMlgrUEJlcTNxTmc0MGVIOHNEcDNq?=
 =?utf-8?B?Mm1qU0UwWWw1b2ZTWXA1YnordnlXMDY3ZUFESHlCYmMvb2tiUXJUR09meFNu?=
 =?utf-8?B?SndDNnZjSkhpbWREWmR6WHJUSnJsOFRTMFJuazJiMmhka20zVWYrQTNnZlFn?=
 =?utf-8?B?SU05MTBCSXVIaWhzSnN5TlJwN1dPZHVpdmUvVTc3OU5HM3BQOWRLSHFwMlVR?=
 =?utf-8?B?LzVGZWplVUJxLzdCV1NrNytFY2trR2pneDAzdjdNVXp5RWpaazAvTUtVK280?=
 =?utf-8?B?UjYrdzBwYmJTY1JCOEc4TER2ZTkyc0NTM1RVRWdoTFNyZjAzWHhlQTk4R3Bv?=
 =?utf-8?B?TCtRVldlUXJUaFl6MVBpeHRhWk9kK3h2Z1pqbGlBMk9pa25oeUx4OHZZdmhz?=
 =?utf-8?B?LzBTSm1JWm4vVlNTQnpWTm9MbytST1VzNjhrM212bWxwcWozdzJiQkVkMnlK?=
 =?utf-8?B?YitHWXBudERITmhUckwxRVNuYmFrODc1S29RNWk2ZWZadjE4cVZXaHJicXNU?=
 =?utf-8?B?QUVZT0JPTENhUlVnN0Q0c0VzT2cxYzBqa0dBKy9TWDJQdDJCRFBIVG12VzE5?=
 =?utf-8?B?Qi9aVEJOQkhtelJ6NUdVTEsySkZkajRQVWxnazRQSkNyV2hodlZEQzluZ1dP?=
 =?utf-8?B?VGtCSzAzTTZjMVJsQkRoVFgyU29JSkh0V0hjelBMd3RNeEdXMk1mOG51czFi?=
 =?utf-8?B?Smx3a0hSdWhVcUNVY1c1Y0poTlFsNEo5QllCcXJlYmdxbnF1SW9oRzBFUjB3?=
 =?utf-8?B?b2RIdFozSjBlZGRoK0l6VFB2MktnWlBFRDdnYTF3K0oxRDdZL3lCZTdrdHhh?=
 =?utf-8?B?OUFNL1NBb0VRMFc1dWluZEdJb2VqaUFUQnltVm41VE0wRHRHdFM3RWl3SzNi?=
 =?utf-8?B?WklhQVZTMzA4L0I2ejkzOGlNelkwNklLMWx3a2tEakVwOHZVNkFPRE1mMWJn?=
 =?utf-8?B?b09lZXVDRUVCcDF0SjB2eDZrUXhqUTkzSnp1TEdnaEIrcmgyZzVMNG5qekY2?=
 =?utf-8?B?clo3b0MyVC95NVg0MkF0WXorZ3loYUJtTzZtQVVhVnc4eVBQQzB5VGdkMUVG?=
 =?utf-8?B?dHRPZ3lnUzVjTy9TL09xWHU3U1RFKzBicTAxckFsZTBBL00xUHVvbFVodStr?=
 =?utf-8?B?UVFPeUd4bzhXdHQ0UjFSM2hSK29nMGVmOXF2UVJTemJzWU1uNm9aSnRaMVlC?=
 =?utf-8?B?amMrUkp0VEhmaW1CZmFCclNQRFlFTTNUclR6b1E1dU5BNUxWVUZQSFVoV3hG?=
 =?utf-8?Q?I17puGS7p6e91PpF6fuM2Uz88kt8jQCSI8Q7QGDk5HKV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2083f8-64da-4339-7599-08de2e14f3ab
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 00:27:45.7102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drN4z/EywxgXKRcYI1xWPDVTQoRJ5xOUYECjmjzLj4vFPcrzP++0mpLzjKF0XgXI4nMNN0zbpmbGPXHN1v42BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8048

On Thu Nov 27, 2025 at 11:53 PM JST, Daniel Almeida wrote:
>
>
>> On 27 Nov 2025, at 10:30, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>=20
>> `build_assert` relies on the compiler to optimize out its error path,
>> lest build fails with the dreaded error:
>>=20
>>    ERROR: modpost: "rust_build_error" [drivers/gpu/nova-core/nova_core.k=
o] undefined!
>>=20
>> It has been observed that very trivial code performing I/O accesses
>> (sometimes even using an immediate value) would seemingly randomly fail
>> with this error whenever `CLIPPY=3D1` was set. Removing the CLIPPY optio=
n
>> makes the error go away, but that's obviously not a great workaround.
>> Clippy appears to influence the way the compiler optimizes things,
>> making it on occasion generate a method where we would need it to inline
>> in order to satisfy a `build_assert`.
>>=20
>> Fix this by instructing the compiler to always inline the methods
>> leading to `build_assert`. This stronger directive is effective even
>> when `CLIPPY=3D1` is specified, which gets rid of this error.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> This is the same fix as for another build error triggered by the use of
>> `build_assert` [1], which signals that all callers of this macro should
>> all be tagged with `#[inline(always)]`, as inlining is a requirement for
>> `build_assert` to perform properly anyway.
>>=20
>> [1] https://lore.kernel.org/all/DEEUYUOAEZU3.1J1HM2YQ10EX1@nvidia.com/
>> ---
>> rust/kernel/io.rs | 9 ++++++---
>> 1 file changed, 6 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>> index 98e8b84e68d1..f161ec8056ce 100644
>> --- a/rust/kernel/io.rs
>> +++ b/rust/kernel/io.rs
>> @@ -142,7 +142,8 @@ macro_rules! define_read {
>>         /// Bound checks are performed on compile time, hence if the off=
set is not known at compile
>>         /// time, the build will fail.
>>         $(#[$attr])*
>> -        #[inline]
>> +        // Always inline so the error path of `io_addr_assert` is optim=
ized out.
>> +        #[inline(always)]
>>         pub fn $name(&self, offset: usize) -> $type_name {
>>             let addr =3D self.io_addr_assert::<$type_name>(offset);
>>=20
>> @@ -171,7 +172,8 @@ macro_rules! define_write {
>>         /// Bound checks are performed on compile time, hence if the off=
set is not known at compile
>>         /// time, the build will fail.
>>         $(#[$attr])*
>> -        #[inline]
>> +        // Always inline so the error path of `io_addr_assert` is optim=
ized out.
>> +        #[inline(always)]
>>         pub fn $name(&self, value: $type_name, offset: usize) {
>>             let addr =3D self.io_addr_assert::<$type_name>(offset);
>>=20
>> @@ -239,7 +241,8 @@ fn io_addr<U>(&self, offset: usize) -> Result<usize>=
 {
>>         self.addr().checked_add(offset).ok_or(EINVAL)
>>     }
>>=20
>> -    #[inline]
>> +    // Always inline so the error path of `build_assert!` is optimized =
out.
>> +    #[inline(always)]
>>     fn io_addr_assert<U>(&self, offset: usize) -> usize {
>>         build_assert!(Self::offset_valid::<U>(offset, SIZE));
>>=20
>>=20
>> ---
>> base-commit: ea34511aaf755349999a1067b2984a541bee1492
>> change-id: 20251127-io-build-assert-3579a5bfb81c
>>=20
>> Best regards,
>> --=20
>> Alexandre Courbot <acourbot@nvidia.com>
>>=20
>>=20
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>
> I also faced this with genmask, by the way, i.e.: using genmask with an
> in-bounds constant would trigger a build error. Very confusingly, this wo=
uld be
> randomly solved by moving the genmask invocation around in the code.
>
> I wonder if the same fix is needed for it as well?

What you described is exactly the symptoms I was experimenting (notably
the "moving around sometimes fixes it" thing) so yeah, I think this also
applies to `bit_*` and `genmask_*` (and anything that invokes
`build_assert`, really).
