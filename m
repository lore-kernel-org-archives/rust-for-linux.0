Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013016.outbound.protection.outlook.com [40.93.196.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D1235E958;
	Wed,  8 Apr 2026 01:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775613124; cv=fail; b=gO7BV+XGhL/4QQ0+mEn67jLBfo0xsvNbiQnRhgKjaEwyA6I1VYJlf0RDNUm/EJUS7Tttbm2mryTHfHL0sCT/iUkX+QUuGb4TcVhz1qM4v4RaFsQFvdw8EgRbN4p8n28IspIHwGuYmB7xXAqGROHZNFUgUf++Pky1qOpTEPXLH/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775613124; c=relaxed/simple;
	bh=YSfLnn0PsuyUJ2NfbDQU+inbPLG0XwYppdHNNDxRfJw=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=IoTRZZ9AW6lK0l7xUTkbouq4cl+Keo4wq6N7MtemX2wIlW/+kyYm7z5hWRo1tddnaMkpliOtcpPt/RuliOdsL3A9BqsxZBFnGEGddZbaCMh58gMqBtuBrrgeSphdy1DDY17aH6pgwouJdlP9ASXXDBkmx3hHpG83nxhyOxgGiV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bESNq1fM; arc=fail smtp.client-ip=40.93.196.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bESNq1fM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7CqqWB3czmoqj9ZMhGIHjffVxV0I6ljRPB3dqRYM1fTSlCMa9jfCgOnDUw2JTr+w7ExtjE9MmrmTW40Pbn5Ovs59IisbL8wo5ziUipIGbIObey1G8UBrHwBS91SSAL8nCMZUK3hltZamkzsOXSayrrtvGmLktLS3fdlBpZNoGRzsYJZ0wR06VhfaRU0TdHlrO4SnKdTW5SfVrtYXWEFsxFLq/I7bNPQe/yuGmMhJqPQQnrMczoILf8ByqjrM1ustmC8cYWr8cyWoo9X8URBQd5c3rU4ISBZh92XaTipCZUsuqRkOxwga+OwT351U6kVpq6SGl+YbTwJ/BrBF0Q7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2r+AY/B7XDCBhkWwDWQUGSfw0ItUSq1sId0cy4FdeQ=;
 b=bv+dfSox5Q9KmD/dwovMoViQrCnDpIUGJnKOv8Ign7UzSXncp6Thpe41aZ6tPIJHCG7rOOzubmFfF42Lq6s+uSK0oheb69ehf59Kvaidt8Dfaquj7sQv2zAG8yF3OCfD5kRVTYz6VE0Cv6D8zB9ZFTiaJAnlZOAVgUYS13Yoezgj/RSMcwNvc17jfk4NFS0sYMX9Yo8y3Sz0PJt4I2F66OGqtidrTCj2YAHM23E0Zo22k0vfuWNBNvtEFmrchadau33wV9XhN3Cp8RzegY5DvaFSSfaK2fL5W0isga0rdDgj7ivGVbk2gzyVci2VnGtdYAMHxcquOlSuBWQ94cgPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2r+AY/B7XDCBhkWwDWQUGSfw0ItUSq1sId0cy4FdeQ=;
 b=bESNq1fMTZGb3EqstB3PM6SJbXeX5tK9/nuXhecD4Ed+cyOz2b4LNCVfCu+PEJUTdOj+1M3OC36UVQd/SD8ysWIhJ49C3WG9NaCp+VtDz7rAPUrZopoPNLBWrWV7zLxHwNSRnOI1NRRaSMfQO6SZRdsmMREsqFfetzZLBwANOG5aQTVoqXX5Vtc09KsZaL0m0D5Ntt/gDZ6h1ex9WSt7wjCDg4KKSSyjPfxHhOq+clTRMoE9rqMawO+Zn/reNu9tKRfdILw/yWbJw0J6CBEutnhUx4XBN9uU1PdE7OSrmlSb+5dkauv8bYpU/DTCqIeCmgtu7tiIiApFJhdxgRQ12w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB6676.namprd12.prod.outlook.com (2603:10b6:510:1c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 01:51:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 01:51:56 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 10:51:53 +0900
Message-Id: <DHNEBF89VSO4.258WCJ0M744MD@nvidia.com>
Subject: Re: [PATCH v9 00/31] gpu: nova-core: firmware: Hopper/Blackwell
 support
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
Content-Transfer-Encoding: quoted-printable
References: <20260326013902.588242-1-jhubbard@nvidia.com>
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P301CA0072.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b41b15-bf1e-4f24-95de-08de95116a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	k83/V49IGNjpfbdBhgLveVumQGNeT7cdrUyQxeDq6tH1RTdFypnhgNIrXmkeu09K9wVanfWZ8ejN7N71/iEOtOnT5BKs6ZBDSEPyBCO63mUDJ+J8LaDj7UeKzow5dR1ACFxtCXTGuA1FWy2tQyTuZDe5XRmkIrVvPfMtbT79CHJCHsVhppF3XHsWytP4uXaLTkkjThSxGg5lPfOzqs3G0vABx3mP4JA9sXrzXQXv7uIJ7MiHCKqjhzm04eu2wGaqRomnfCqvf1g0JhbnbVA+lxytiwU4Gctf49hk/TMDkTvlGtlNzNI/7u+8c9fjluUm6QLHjrbX6v9LpwcdA5Y/az9jOTqgmnWkhyMSabvMl1VBmjQHzsp/MX86gsGmaH0j7O20FiQg64XDiHhkmUmbYoqvz4ijLXP2bYNJHVkymO3jsL6QglW88acPn8qkaHDCkU6LzXZV4cWbv+Db7yZyjj7ERuKhon6zldbqTaqhuBp+7lRun7L5Iza+vD8XJt61qFis+yb6H78z8ZPthpGofxR6WGhd64vI6D0hsJ9yPJyjkqTNgJi/9tfOtzq0aX846BP1rCLlt6YjqVu3czwiTOmQ2s1KXlCQwMN8BoDwd/329H29SDH91wJ1xTcwhavgsSCIvzpSJl2p6Lr3M3axOaxW5ix7MLbQiVddelVgTCugdo2nZIKkzv2Dh1xLu50MHexzPKXu829Wk300ZFsNsQT1xlXyqrc8ED11b7lqfXY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SCtoY0U5ZkVjL1loOG1JSitQN0ZQVk9yQnh2MWNwUW8wTUk2Ymlrdzl0VWM0?=
 =?utf-8?B?citkTUFHMnNHRlJQamdvTkFRb0V0ZS9Ob2lXWFIzNnMzYVlUSlRkTHkydE10?=
 =?utf-8?B?cTVvS1JGSkxwdUpSWENBTmFzSzYrOGh1Tk9VbTB1a29hTklEZ1RRNFBJUFZi?=
 =?utf-8?B?T2lPcmVHNnVkLzQ1dGVBMU5Cc3lScThIQ0JWdWFVTGdaNVYrZm9HK0dycW8r?=
 =?utf-8?B?UG1abEZyRk9PWDBWYTRRVDRMclExeHdveCsvbmNEd205R0RxbHB5bVQrc24x?=
 =?utf-8?B?b25pNzVtN2lVU2h5WWxMQ2pyQXpzQlBGc2dIWTJGaWFLS1ZFbE10T1JodWlv?=
 =?utf-8?B?c3ZjcjZBbmJldGNCTllhSHJ3UmVxVXNKSjdOSFlFWVQxOTR4RUdWVTZHd1ox?=
 =?utf-8?B?eGNxL3NvT3B2Vm1Db09oWDRDd0k5d1p1amtsWE9mQ2EzMElxMDh5YUtscFkr?=
 =?utf-8?B?M1E2YWduSUZWWERFNGtLb0djd0JiMzEzWisyaE9NNlZxaDVqRkpqSDkrYzlX?=
 =?utf-8?B?RUZrWkEvUXZJcFczVWNxcU5MenVYbERaVUFWRno4b2s2QVhjMHFEVDNhTHhk?=
 =?utf-8?B?TGNUZ3RwTEcrMVRuR0NRb1ZHWE1xZW93cGg4dnBFeGVRQlBYNmRueXVXbkhK?=
 =?utf-8?B?RnlGZWVnbSszRDZVakREbkJucEpLMkZzeWJGcFFad3F2V1BNUVpFRmhCZXNE?=
 =?utf-8?B?ZVB5QXk4NE1odDE2MGFBOGVMREI3Y0dBSktHMlJ6ZkhLZkdUVHREM3dybnpI?=
 =?utf-8?B?QzZpdHhlYUlUUVZhRkZEL3J0QXVnRE83VVdxT0xNNWZFTi9oc0xER1JnMEIv?=
 =?utf-8?B?L253aFRzZElOZ1diMzdHMlhrN3IwY1RJVGttT0ZlQm80eDF0N2VabGp6d2Fv?=
 =?utf-8?B?V3hsakppYjRKZ0RmdGdXNVlWMmNiaXQ5MWhrcmgzQ3E2MzBIS2RCbWVTb256?=
 =?utf-8?B?SjRERmlsblFzenoxM0xuenNheG9lM3Y3NWZOWVdlbStvdHZKam5HMG9Lc3JZ?=
 =?utf-8?B?NVAzc1hHME9iejZJOG1XSjdDdzl4c1M4MFFqREZ6UlRqOXBjNEh1MzBzcGxR?=
 =?utf-8?B?c0Fua3FDbm0vWGlRMGxUTS9VM2RhMVRLdEI2MTh1TjJ6UnVDT29qZmRuYlFK?=
 =?utf-8?B?T0c3Rmo3U3Y2STZTLzRCYjM2ZXBHa0xCdHBaVHFXYXhMWklPWUFvWnVHdW9W?=
 =?utf-8?B?M05Hemc5d2RkVUpWbmZnSzQzeTA5cnVSRnhwTW5CeHBaVGJGNXB6K2JVZE5l?=
 =?utf-8?B?N0xheHorNU1DMG9vSVVpenhvR1RaWDNDRmc2OW9qOXlBRTFqTTN3NUpyUlFa?=
 =?utf-8?B?c3c5dThyMDdLb2t5ME55cjk3Q3lheXhUTDFpWG9veFZlcDVLNEl6SDNxS1pY?=
 =?utf-8?B?b09lVSs1eEhhcDFUenFwVFVLazV4UUhsZmJsNXc4T29oQXBsOUNLQU96VG1l?=
 =?utf-8?B?aVB0ek15Q2k1cjVMTTFINEZHSGovSFdFRFNNOC9EMWtaSjlEYUVmeEpqYWdM?=
 =?utf-8?B?Z0ZvQmhYVVdBcWp1S25GbDExV203dUJ0YmRLNjkwMjZTT0p0YUdtcm4xeWtp?=
 =?utf-8?B?cU14cm4zUmhSekVsMFBWMUt6SVdXSS93V3pKWU9KZERxa3FneUlOd2I5QUw5?=
 =?utf-8?B?V2hCRGxCa0RqR05qcFNyckVZdG1jcCt2eUh3M1BKL2FoSitTQjVXV3ZtQ2xD?=
 =?utf-8?B?MnFMUXBhVEVsS0Z4dHM3Z3B2RnRTeXN2bnoveFk0VDgxTXZpZ2p5Y3ZGQUZR?=
 =?utf-8?B?Mm1sTk5YYjBPd3FaUGs1Z0YybHZvd2dTamp4anlCM2toampaZTFvQVJDNWZV?=
 =?utf-8?B?MEpZOW83QWZNK1htdjl2TFFCKys2S2M1TEpGMGx0Uk4vQkFQYnBDNk40VHMr?=
 =?utf-8?B?M1VySCtuTzhQblhOK0xzaVJCcWI2UDlRT1ZWZVFsRDlLZ0d4RS9saFVXclh0?=
 =?utf-8?B?ektDMXFVdzJEV0VVMFdrSVA4N0hVM25lRHMrOHZTVWh3d1dNMkhSRjE5dXVJ?=
 =?utf-8?B?MFRXRklXRHFuRDNVTWRIL1ovWkN5U0RQV0VLTUo4TUdlalpvMVNUbjFSRnQv?=
 =?utf-8?B?RnNmcFFzMzFhT0FoRVRwT3JwR283elcwTDFmQzFhTW9BM3FGMU5qcitrdS90?=
 =?utf-8?B?YVh4OHNWbHViYllmVmNEckEydWMwSTNsdFMxU2p0Z3JLVGlSa3o1Q0pkcWRm?=
 =?utf-8?B?aGdtQlBWU05qWHhIa1N6WGdmaGpPOWJ3aWZVWkdSTGFib25zTnordVZPL1NG?=
 =?utf-8?B?MWRtdkJ0Y1phOVhGRTFpL2xhSys0eS9xdFMyUkV6TkpBc2loRnBmdkNmTlJw?=
 =?utf-8?B?NVNFQlZlKzFjNjE0MmpSWTJWRW9EQk1kQTNmMGlKRkQwR2w2OWkxTW1QZkNI?=
 =?utf-8?Q?WM4VQADQilhe0pmGWyYiIITyB6Nun+lnZqNM+O3e88zY3?=
X-MS-Exchange-AntiSpam-MessageData-1: N1BV762+BYTtKg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b41b15-bf1e-4f24-95de-08de95116a16
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 01:51:56.6058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6oA/2BMBCs6P6MjfZVuUVDHXVVjr0mIxqAHdhJAU2Lnd/If6wy2be7oE/pGO9a6ypCM1wgKRdPJ4qHCJ4262jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6676

On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
<snip>
>   gpu: nova-core: Hopper/Blackwell: basic GPU identification
>   gpu: nova-core: factor .fwsignature* selection into a new
>     find_gsp_sigs_section()
>   gpu: nova-core: use GPU Architecture to simplify HAL selections
>   gpu: nova-core: add Copy/Clone to Spec and Revision, add chipset()
>     accessor
>   gpu: nova-core: set DMA mask width based on GPU architecture
>   gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
>   gpu: nova-core: move firmware image parsing code to firmware.rs
>   gpu: nova-core: factor out an elf_str() function
>   gpu: nova-core: don't assume 64-bit firmware images
>   gpu: nova-core: add support for 32-bit firmware images
>   gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
>   gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support
>     of FSP
>   gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
>   gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
>   gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
>   rust: ptr: add const_align_up()
>   gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
>   gpu: nova-core: add MCTP/NVDM protocol types for firmware
>     communication
>   gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
>     waiting
>   gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
>   gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
>   gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
>   gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
>   gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
>   gpu: nova-core: Blackwell: use correct sysmem flush registers
>   gpu: nova-core: make WPR heap sizing fallible
>   gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
>   gpu: nova-core: refactor SEC2 booter loading into
>     BooterFirmware::run()
>   gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
>   gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
>   gpu: nova-core: Hopper/Blackwell: integrate FSP boot path into boot()

A few remarks on the ordering:

- Patches 2 and 3 should come first, so the code is reorganized before
  we add the new architecture (and to reduce the overall diff). This
  also allows us to apply these patches earlier, as they are valuable
  regardless of Blackwell support.
- Patch 26 looks like it is independent from the rest of the series - it
  could have been merged earlier if it was placed at the beginning of
  the series.
- Same for patch 17, although the commit log mentions Blackwell (but not
  the code).
- The progression of the series is such that it adds new features that
  remain unused until the final patch which exercices the FSP boot path.
  We could avoid that by introducing `boot_via_fsp` early in the series
  (making it just return `ENOPSUPP`), and completing it as the FSP
  features become available. This removes a lot of `dead_code`s, and
  also provides a logical order for the patches since it can follow the
  flow of `boot_via_fsp`.

I still want to dive in depth into the messaging parts, but I think I'll
keep that for next respin to avoid giving too much feedback on a single
revision. :) At least we can say that the overall structure seems to be
converging.
