Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010051.outbound.protection.outlook.com [52.101.85.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B637F8A3;
	Tue, 17 Mar 2026 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735938; cv=fail; b=VuFtP+0lXrfH1znahGBh0gUMcOt6PK9kV6NwGqbzczwA874xGxAGw2Ock1/qztagJTM9Zo2Tw5ho18btMFv8B34ohkHtjLZLeFtj87oPsCzYWJQOn7g5TcY63rMuqw7rWISr9t+iKfY2AxGiwl2H2gF/I8mLwmRwgTE8UDNR7Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735938; c=relaxed/simple;
	bh=Yo77OISOho81Ux6gAN0SPcSI8PWp6EhCcnx/7mtLNnc=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=hTlwCcbNJ8vG/76cIZgDN9twtk8rUeGdpaHvNFAW1PJWCwiAhISQ+uXgZzc4U3HZwPnylVjbQleUPg3DV7JhfOwLcznwpQ1YRD2zV3J8PH2wD//frrjfJbDHVDj2BqMDxbKQ5VFPw7MRDcS1hNsJ4LfEguHQ7JEAYGfTiuawUZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CGblmlw4; arc=fail smtp.client-ip=52.101.85.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CGblmlw4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLb/39AY9Z4OdALB4ecS94rzHrSIxAjmmGmHlXrd0o+3fktRu9pK0TZalEa4hERrY95w8j94Xo1Qduqc8gI429nGJ3OzNSQZAivbljbgfiqX3hWKvHw8FhHKSZu5X7VP2BgukmK+b4Fi8ElT5QtfNDbZVdV+q70EtLWZWnunhh//h6RAgLLoh8PyrVAsrdY2cJLGtk40d98w/JNL1llsEAoboNuwN195nUlC3sXkmd3xmldfzhGQDQ/6GEWkUDm4Rl06bGT2OlCWG4PKKLy1CZHTEbWj9cRf7yohn5k7QNR/CJtyozq29Puil/LYn1z2cu6IyXBWKdo8BANeRyU6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/p2EwGtvqoQZftCHPggeKL6Iff2FBns6bCIckRTQAE=;
 b=G1TLkAD+7648BVozDkYtqFoAKEfraGY63jpY8BXhEve1VDMRQIGBLmRVH+7mtKCKFXL0FA8Vi54WUq+Wwu9Du9NzXB5fjalHYyeCtQ9NPOgrtdE8jIXQy1i+7eB5+WNRCkHTOxrpoLcsEQU1wSEYaoeXlQJmDRuGCVP2mk7ijIpuNs+VJKuyY28wItzuyPwhHor+bFQWcb66dC77hiHXQhYVICtWw6Hdqm8Wa/sW1rbaQr5eNWkjJPN/A9aaundtmC22prAzM7iJCJ5D87vvP1myw9kCDEtVTuvAs/8nRHQmPNdsZxP7OhLGR9G+15fKFMIEIBlwjJc2KWzLJ2yRpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/p2EwGtvqoQZftCHPggeKL6Iff2FBns6bCIckRTQAE=;
 b=CGblmlw4SVta6XEb7+qQz7SK6UlMGngeGl4TBwDWmVxd/XInm74ChNjoxE7lYe6sItJWBi3JVlW8Fgg25EBb0EEWTpp9jiuBMC6lxzJ7Ec2LbxjO7vmivyFtUPiD/JW/Ombm6CHImENkKfv4JxscwXCkCVVx9t60ppQUNjs5XjFzTDgyLhakgV9dkRqY+cfYilurFL+QC8B9N5HE9PzHnGXAZiosuucp20didfCOe7v/01St5VVZIJ62JUOgajrF83l/uLiv/683UP7KuE9aduCM7YM5VMuSYllcBU89QCBtRkTurdITBw6RumUAmzfMTSW8c9/qQ3xyqa8Lnbn7bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 08:25:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.016; Tue, 17 Mar 2026
 08:25:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 17:25:30 +0900
Message-Id: <DH4WWTCNMZG4.3LYZJSIDANCH5@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
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
Subject: Re: [PATCH v6 30/34] gpu: nova-core: Hopper/Blackwell: larger WPR2
 (GSP) heap
Content-Transfer-Encoding: quoted-printable
References: <20260310021125.117855-1-jhubbard@nvidia.com>
 <20260310021125.117855-31-jhubbard@nvidia.com>
In-Reply-To: <20260310021125.117855-31-jhubbard@nvidia.com>
X-ClientProxiedBy: OS3PR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:604:dc::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec75c1a-4e16-48a2-2185-08de83fec21f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5c5fljepZe1RV6pdcPTJN7+qzUqrS39qKNBUJpbDUZyWRdvVbmWS1QOZPb+qkYUct6LB1y562V/cjuXGI5d3yz5oAYlE1qMNk8c3qthbR5/9z80vPtJTAQd94Jl/x7miqtIDjHdhlYTb58O84ZLBwbh43FY/VgWUgPCQ9Mh6yUlavWYTBbwAV8i9eqdcFZr0iX8AUBpVuQFVrUjiWBgSDpaMBuRm55RJ5HbQ2LaKfgDFAPhnGfJO7lgTTYcC1/pL0SC1L+hfcQzKZESn8xal5RSHqf2T5Y6TENOgpsLEyvhNTCLDe3QrJbwF0SL2J0Oe8Ew+eihVBQG9s2+i5seOMvazKzMe32IXksjAtSvPzcchkb7sBfPz1BlFiu9EZ0jye6tC6RtSdFhjPxsjjRUZDr+eR7PPwna90qTJvq8CcEGApWD1Oh4qpPypTxZeDBPDaZGt2PMz5Dzuzvsq+WIPOiZQaCAY5qDQfiOz1qMxs8f+4GMimD6xkmPI0RLYshAW56R0pZSGE8qN0az+b+t9uxn6ZAvfSCTEeR4GG7WE0aAfqJqHo4p9AJQsbzy88z55XkLFF4cEqPY2LAb/lCtHpFCwWgTnuBxvj4TfugVQn1Vqd5hE+XZ2TgV3Sma7t/4z7RAhuFM/y1qqRnc9sF47PsU/ru5eaFe6J/YZTO9ubdaUusVNJZf1gsTO2ebms2WoA3fvla7hPKRxm0jnAm7RaNPpdxjSETj+t4gLiKfkQG8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0pXMHo3ZEZDd0NnMGdzczVDYnFFbkUza1BHd3JFbk15WWdZcGZTMnVkVnVJ?=
 =?utf-8?B?WVo1S1VTTXNJaGpwTExMbVVTa0x5T29sZlFFMFJpdlplWmx5dnlZa1M3NnNG?=
 =?utf-8?B?ZldRWFFrVUJSVmwyaCs3VEpoNHNVaWhrZGpBS01zQXdUbi9EWGhuaU5hZnI1?=
 =?utf-8?B?L1hDSFkrZURSTTBZRlUrOWdmSy80bFd4eDV0bUF1ZmdXZzMzYThueWJPZTAv?=
 =?utf-8?B?NlpuTFlra2ZubUd3bHkvQURYZWN4MmZyN0RBb0l2UEM2NjlZRlc2VjFGc1hB?=
 =?utf-8?B?SFBOTm5VYU53YzRXVW5takFyZVZxMW9hdm44RDlPYkY3eUVkR2lIMndXTlJW?=
 =?utf-8?B?STZsSzZON3lCY0lMemlkak5SR0pJZ3hFTnZKNGIyY1Fic0VCbjd6TkNqVTBN?=
 =?utf-8?B?SEpMdm1JMzN0VURxMTZzVWU0QWt1aWthV3J4cENRZnc4djdXMGNkSHEyK2ps?=
 =?utf-8?B?SWNWbXhlWkNUS1kyNVpWQTUzWnZ4QkR3RW5acVpxTEp6ZCttb3pEQU4rZUoy?=
 =?utf-8?B?MWlyaHFBUU9sMmFtalVTSExTSmdsdGdOUnptTTFNakJNUXFMK2hLajZvY3Nj?=
 =?utf-8?B?U0RBaVJnaWhTYWtXaHhERThEb0dTSy9ieWRNR2RxdmZ2Q0NISm53TWNtRmJ0?=
 =?utf-8?B?RkpVMVZBWnJOaHBXbUpGWklkS3lacXdxZ0p2WEh1TlNtSVlKRWdJTlFQOVp3?=
 =?utf-8?B?ZEJub2RpNXRDblFkTXFSOFdRaDQ4RVV0Um9ERFYwUWxwZEkzVGxjVkJHNjZO?=
 =?utf-8?B?UFo1S3JYZThoMGhrOG5BRllhYjhJSlJXUXI1QjUrTnR0NmNvY3lORlJjUnEx?=
 =?utf-8?B?VzJ1WEM2RkRPdmVNWDdIVmxtaTN4WTdtZ0I5Vm5SaW9YU0UyOWl1TFRDQXYz?=
 =?utf-8?B?SWtJRFNibjdoaERuVFJGOUVOQWc4dlphcUJlZnliSXpmUW1xSGNoajNBUVFv?=
 =?utf-8?B?YXNZaW1mUU1LcXFadFBIazlhSGpWZjhqM3RjeXU1eFdjeitSa1FXNGRvSVVt?=
 =?utf-8?B?NHJnVWNpRHVMbDhTbTJaU0sxd0JJTDU2ZFVUMGJqRmxIU0ZHRy9JMGpnRk4v?=
 =?utf-8?B?SFJMakZ6czN4ODM0cjFsMG1UOVRaT3pacjNOM3hyYXYrRGRCRGZMOEEyUUQz?=
 =?utf-8?B?TnRkcFNIdnhVTU94RG14bmNrM3ovTC8rM3ozenQrMUVmcmszUkZtRVBTVklk?=
 =?utf-8?B?WnVnakQvUHpQODB3emtVRlh1OUVZYkZIdGNCaDRhdE9CVTFYVFlUQmpiUnNQ?=
 =?utf-8?B?ZjdhU00xVkdadUo2V1dwNU9KSEM2T3RKeGFyM25aZjA3OVBCeWJxbmZKN3g2?=
 =?utf-8?B?YmE4dlQ0TXpEeVpOYXl0M2F0TjhFMkhlVWFwekRoNkkvdFBuM1IwR1dzNDh3?=
 =?utf-8?B?djNGYUFONVRFYU1IZkM2QlFoMHpVeEwxdVViWU8ya21WOWtzcHhTYzRxODBF?=
 =?utf-8?B?TE1ERS96RS9GS2EyK2t4cVZMMmVHcmJ1dXFoVGZISkJZaE8rTXgxZ0p2SU80?=
 =?utf-8?B?SzFoY3BndWkyTTlEaW9nYjhVd3c1R282am9VN09zM0p2dVN2dkJkZUZjaTRL?=
 =?utf-8?B?cFRPZ2lMVVZEOEVzREJyeGR5VkZMOUptTTUxUmZROGgwcmtPYnBXeE5ybi9G?=
 =?utf-8?B?UStqVlNVQmM5NEFGc3lhZHB3bFFaZGJMWlRybm9qc1o5MUR3Ymk1emdwTDNN?=
 =?utf-8?B?dlZIRThjanNKWWJiTGYyWjhoY3p0YVJkMkJDVGJSRlczaUlvenRBWlFtKzhI?=
 =?utf-8?B?V0xDUnFPdFpYWEczbmZhMnZSbjE3U2YxektpQjRMM2thOXA5K2lLQXlqVTdv?=
 =?utf-8?B?K0J5L1ZOZ09JaFVOZnp3TFQ3VGNWczlKUTZtaEpPWUJzUjd2dUxRVWNUVVZI?=
 =?utf-8?B?VHowRHZlYTRtVHlxb1A2VFhSSTJ0L3l0K1dPWGdMdWU2a1VRaHlZaHZCMHFq?=
 =?utf-8?B?cnNwaThhSzZ3YVVMZEQybHhiRFdxNXZ1TUJaaDI3QndESjNTR3E4c2ZpRUln?=
 =?utf-8?B?Z2tBRzV2UE5rME1ZbE1Tc3JtL21QUEhBcGtmRUNJQ1p2c3g5bjBtd00zSlc4?=
 =?utf-8?B?Nk95RCtPY3Myek8zMjhwVTRnWitjQXVYMzhwYVNhdEJpZVI2dy9RaUJoMTQy?=
 =?utf-8?B?TnJic1BSMi9YL25DOU5xcDVnWUY0U3B2U0dFSit4VXRsdkcwbXVJa0FyZkNH?=
 =?utf-8?B?TE5rQnp0YkJUNHBoUVhMcGZEUmlCbHhueWNwTVMvOGdUNG1pVHRLdTUwN0pB?=
 =?utf-8?B?NmtZcVp4S1l0ZE1iOWoyOVhKTGIvS1EzaWNXd3gzbTU4ZkxMcGE1VmxrRkFx?=
 =?utf-8?B?d0Q3UjIzcWo1VmtyUXZkV1hpWHJnb2MwRklJY3RCWjMraDBaUHhBQys4dFdL?=
 =?utf-8?Q?/XPFZDcmL65+dYLpNq9OlqEnJGLMcmd4/41VRu4xQh5Vo?=
X-MS-Exchange-AntiSpam-MessageData-1: NkpAT42lqxqsnw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec75c1a-4e16-48a2-2185-08de83fec21f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 08:25:33.8065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kc5RMqOpLgHIMz2ysvKCezNx4XfDudeQ7kU8XE5SBR0GSHmtrU2FtbQ3o0GJRgRA5siykG0eHXrE9aTuzjF/kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111

On Tue Mar 10, 2026 at 11:11 AM JST, John Hubbard wrote:
<snip>
>      /// Returns the amount of memory to reserve for management purposes =
for a framebuffer of size
>      /// `fb_size`.
> -    fn management_overhead(fb_size: u64) -> u64 {
> +    fn management_overhead(fb_size: u64) -> Result<u64> {
>          let fb_size_gb =3D fb_size.div_ceil(u64::from_safe_cast(kernel::=
sizes::SZ_1G));
> =20
>          u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
>              .saturating_mul(fb_size_gb)
>              .align_up(GSP_HEAP_ALIGNMENT)
> -            .unwrap_or(u64::MAX)
> +            .ok_or(EINVAL)

Since we are turning this into a fallible method (which I agree is the
good move), can we also turn the multiplication into a checked one?

This (alongside making `wpr_heap_size` fallible) should be in a separate
patch, as it is relevant regardless of Blackwell support.

