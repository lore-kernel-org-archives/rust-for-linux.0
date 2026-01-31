Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F48129A9E9
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 04:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769832678; cv=fail; b=pkzawv3PCKF2q2HCLwsdbO9jWewkMFmgQm4J6tuGsUGbp/gyPYYsofYIKikuciPjmDdruP9agE/++DQddrP8eoqc78CeWk0pVWmPyqeQ3Ct4C9ye707xIdDAx4pk49+ASxTVB1pgiJcn2k72M9o6O+E35cdQldVH++/fnOvJGKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769832678; c=relaxed/simple;
	bh=gdhn2Pp/ARlVudBWZ1mfGGDXxmMz8gbSHXEAn5swop8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UYFETxVpfe5duYMiHI0COcJZ3L+ThrDJtVRlEGkp3SqYWpr+/Lon14Ot/4yXboPZxvyIN8RqxcdmhbVnohkci49mbC1cFO45RTKoZHpMn1hpXQEJ62t+cQIA/J6q0JV/J8qV8cNv80HDlJB0zGhpHwrH7QwkmHLWv4rKl2U5/yA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zzwdz5u+; arc=fail smtp.client-ip=52.101.85.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zzwdz5u+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRlPuPM1v0gsrexb504K5ouGm/8rDFgbwTbMRDBp6y9XbDzlXa0YC1OnvL/YXbFCYiIA9pCvH52/M52vhdkXlhHGMrbQzx8QQX+rTK9ZKBepsRjgnBqGTyavQtY4M5162RJ4S3cTQ0xowXeR3BQrkxIMei0TE/BwkX/KdVCOj9KHBWcTzlwucSOLcNYnxmDrQV8B8W9+1vNfWTspjk0Jdmaa2dOM+iVZBSFgP59Z/1i16bHkTyDave8rM22psrPmj1Udt3+ClgHAqaAmHlpiJJ2wn6gBSaY46zexpn7i5ozxV9cORHOxM3JwkdSBs8G4X9DS31WOZ2tiwdFhE7ZxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdhn2Pp/ARlVudBWZ1mfGGDXxmMz8gbSHXEAn5swop8=;
 b=rZytXy5RJAA+3lsDLpUIcQGJsa5LV4dE0dN3SsbcUuIovzZVuIvOYoRxp53y/eGKDaKANTnmOLyhof0S3zEtKCC/XQZAWkNIYWmY96HF3bA5L+XTm+yrB3RyYoqkwEuD3h9DdX1AX6Lobw9dzLezx3xArXkfmCmCU4eh6FhzGAaXj7F8SuofzjZTlBrHM4g86+Tw1O3P6bo3oQz2ISCEvOy0NHQYosfo8efZH+ODghEFaOSKxLsq7/BGOfcu4UxJ+gPshcs1ySleRhbEr2Bc+Qf1bSc4lQXs7MPUGKaB+dimWp2cUIAy5O/wvNb18Z8YPy0nAT05PxsWg2juSXJN2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdhn2Pp/ARlVudBWZ1mfGGDXxmMz8gbSHXEAn5swop8=;
 b=Zzwdz5u+KjCdJ8ArQJGp0gm+UnfX6OScf8hFNjG6MEluRYPgIt+XLB4LhUHYKCi+CylrPfGpyEtFEFqHXeuB2El9CjfgTwWXliLNuM+uncCBBwtNmKObTweJjEiT0DjPky9aAzXA2I0+QMjXsLFAWJS7g76J9KO8PDB01q7PEenlRBzOZv2X5iqtPZ2EA/y3wIwA+m0PWjIuvfGHbQrO6F3W8Y9A5gEuHuWmEXn0/mkqDEv4NmmSapl9IedHiG1NedWARWo02m9oc0bHkHfMIjrQoqsd8x2UPmZ32Po2O12dWyty4l4183pODBxnLg9/e1VMnJo9K91lZY25mg2E1Q==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by SA0PR12MB4350.namprd12.prod.outlook.com (2603:10b6:806:92::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Sat, 31 Jan
 2026 04:11:14 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591%5]) with mapi id 15.20.9564.010; Sat, 31 Jan 2026
 04:11:14 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "mmaurer@google.com" <mmaurer@google.com>, Alexandre
 Courbot <acourbot@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Thread-Topic: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Thread-Index: AQHckMcO0eg+xcWa9EK4OKU7tGQKjrVrYNaAgAAGTICAAANhgIAAAZQAgABBoYA=
Date: Sat, 31 Jan 2026 04:11:14 +0000
Message-ID: <4c690d376047080cc1354e2062fc49847664dcc3.camel@nvidia.com>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
	 <20260129022837.4133832-8-ttabi@nvidia.com>
	 <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
	 <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
	 <DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org>
	 <ab90ca9a-a721-41a5-9b28-2af73fda3212@nvidia.com>
In-Reply-To: <ab90ca9a-a721-41a5-9b28-2af73fda3212@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|SA0PR12MB4350:EE_
x-ms-office365-filtering-correlation-id: 6bf9522b-d9b5-4234-41b8-08de607ec674
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VHdONnU5UThiczBRbGhqL3VWamIyK01LeFZkZkZscGoyaDRhaExzUlVQMHEr?=
 =?utf-8?B?WnVkeTk3T0pmYXR2RjczWnBQLzlhOXpVNUFJT01oRHU2QTNsM09IVW9aVDhi?=
 =?utf-8?B?NXF6SXI2WWxaS2ptNU8vdmZEU0hoN0wzN3FpdHpLc080N3VpMHJ6eHFBZ3Zr?=
 =?utf-8?B?NnJldWszQkhSNTI4VmhYekVPcGpmc1FoZDZoUlhxNmFNdmF0bWR6RGtYdUIr?=
 =?utf-8?B?OElHUUVHS2FtTFZxeVpob0FRMHFwSHRKaVE1eFdsZkJsTEZ6dFh1RE9Bc0w3?=
 =?utf-8?B?eHNpYWlhQXpzN3dYYXNOa2gyL1hMaTlCZTl2ZWs1SjR2clhybTlTNDhHdUFJ?=
 =?utf-8?B?WjlKenVWRGlSaGVkNjRTaUxSVnZzQ3VuQ2Q4K0c2L1FCanc0MHdDZ2xzdVhO?=
 =?utf-8?B?L3RKRGpZYXd1bkNUNXZaWFVOS2NKMGFsRVZOUE9aaUZYYURIYjkrRi8zTnJy?=
 =?utf-8?B?eHJXR256MldBRFU0SXhKSjJxY2UrcldSVDgrV2lYVkN4K2ZGaUg3T0NOSytz?=
 =?utf-8?B?THVDRXlYZzFuQ285ODY1WGNYT3diVEVONGZPNGlVb2x6a3J2YWdoSjc4Y0lF?=
 =?utf-8?B?azFoczRYejkwcGVkamlmOG9ETEtUZ3JDRXVsZ1lmVFJmcFo3bk1uZGNIWHpX?=
 =?utf-8?B?czZxU3Z4R1lUdGMyck9BbUFac1lkR01DTGwrMTNhenl5ZFpQQmU5UGNGdkpP?=
 =?utf-8?B?OEZ1RVYwUVZrSEUwS0NRMnM4VFliT1lFbkxOcWhjNWtXdzJVUFlleVYxUjRj?=
 =?utf-8?B?WGFlYXBjbVc0emEvODFIVXlERnVUcEZHMUFwbVZwemZpR1U5NkxlcWxvTUt5?=
 =?utf-8?B?NlZxR3pJUWRkWTRVbzQ5dStzNzNUZkZrWCszbDNEZGNjdXpOeXVpdWhZSlpj?=
 =?utf-8?B?MmNVTjVZRHIzaVhmR1VnR3I1L0dTd2dRTnZGWVBxNjVvd0ttN2hQdW5reDIv?=
 =?utf-8?B?ckk3a1NUd0VPdTJqdWVzVjNEWFJJaFhxZUFDZHNvUXhiNGw2dm5TNXlHSTlH?=
 =?utf-8?B?TXRlQ1FWMzRzNXMyQXRidml4dW1EL3I2ZVJsQVpZdlFIcWEvWkFONm9DakRl?=
 =?utf-8?B?c2lIb2dQU3hGZWdHcXpaeTI5YWJFSG1vdm1UN2YwbXdTM0JGMGJQQVFJaGRQ?=
 =?utf-8?B?WW1ua213ZzVFejkwTlZ3ZWxyazBhaHRIbkpXeXloRlpjWGFUWVdoc0Y2MHJr?=
 =?utf-8?B?QjgwR2RveWs0cXB3VXVoQkozQUYxWDhHam9MSGZJQmNuRHNHazZtYmRRSnRm?=
 =?utf-8?B?ZDI0bFpaN2VBb0dwUmF3VnRRRmR1K3RnMHFndkF1Zi9sbEFIWkR3SkswTVho?=
 =?utf-8?B?NWhFb3IwY3hqZWxpZVhUcUU4QjZDaGVzT3JBYnAwL1d1cUJBcmcyTW9JcWpS?=
 =?utf-8?B?aTk4SzJPQ0hCazczZUpSeFFDbFRFNENmSUc1UjRVQVh1b2QxTldkNU1FWGxV?=
 =?utf-8?B?US94YmNObUFQblBhSm5YTmJhT3lLNlRibVBMKzVwRW1qL0crMVF3bytpS1dU?=
 =?utf-8?B?QnFRV3pUVldnVGphWFcycXBqTC95a012cXZYYVVocmNlejBnc0RNSFdxZktj?=
 =?utf-8?B?MmxvNjFwL0tqYXFFNFRLMGNkbGdtK052RUt1NDE0MHZNc2ErTHh3aWhvUy8y?=
 =?utf-8?B?ZjU2NmJpOExhNDByaGFacnNnaG9qbUc4dGwwU3EwTzYwbC8rR3dXUHRteVNh?=
 =?utf-8?B?VDN6Y08zR01IaUhrMXB4eFRPeHRSRzlrWjUrMXlkSExpWWNyaFQ2ekswY1d1?=
 =?utf-8?B?UHljcHZYN0FrK3dGeHVXWWZKczV5bk9rZmpDWGVyNG5YY29QeGFKSkJZQ25P?=
 =?utf-8?B?ZkF0NzlJaGVxOTBnWTJia0xXWW1WUG9hSkZtM0JubVNnK3NhQVhuOTVoZ0o3?=
 =?utf-8?B?M2M0SmF2RFRWdWZmZkY1anYva3M4RUhuWXcxUVlYT1NOeXk4RzJCdzE1dlpI?=
 =?utf-8?B?bTQzTDJyeFpVSDB6OHRvL3gycnRWemlzNnhBdlpITGdGTUMwemxEalR3ZE5h?=
 =?utf-8?B?dlYwajg5WHd6VUo0UTdhRHF2VWRab2xCTmQ5ZkdFcVJQNysvZjJzK1JpSWRu?=
 =?utf-8?B?MW1tQlQyWXp0Nk5ua0Y1bDEyYXR0dU1QWUpnd05NZTZqS292WWJmdnhiYzlV?=
 =?utf-8?B?TXQrTjBrK214TW9sd1A1OU1nNXZZc21VZzJWbXVsR2ZYOTFsQkxFWmJzVlNr?=
 =?utf-8?Q?47U4I/WSdbsOeEQw/EVGoOw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dVZIV1hSSWRqSnFKclVWUjZOd0VIM0FnbEF2L2pEaUZWRVJZa0tHZ2tNZmt3?=
 =?utf-8?B?TWh6NHVqWkphV2dnSXRmYjRuZzFqQ05aU0sxUXYzNy9XV1lqWVVDZWZIYmZD?=
 =?utf-8?B?YVJ1THVqVStrRVNzTWFNWU5FTG9wMzdIZ3F1ZUhGQXFlbFNvUXdibVM3OTRE?=
 =?utf-8?B?V2dQd3Q5Tzk5ZzJzRVJneFViY1k3TTVZOU1aaHZmNnUvQ1liaHpFWHNHYW1j?=
 =?utf-8?B?V1VjOGNaZ2JvMURzL2tNQ0NwelQ2c0FoQmoyRkpFQkdOYURnU1FucUQ1T01n?=
 =?utf-8?B?UW1OcGNQQk1GNENjdkI5ZVdCekxELzNYRExuQ1BISWlhQ1IwWFJYL2VnLzhJ?=
 =?utf-8?B?cmRGdVBJTW5OR0IxUUlFbmhTWVk3Qll1R2J2dzNETkFJaEdJK3FyVE5PL0N1?=
 =?utf-8?B?MEJIVHpmSTVZUkdOYWhMamthdkU4Z0JiZEY3NXBCUU45K216ZXB5VWFzSjg3?=
 =?utf-8?B?cS9yeFIydjZGTVlXdTlTemtjRXR2MDYrckpZZDFsbDBRQzJPTVVHYk1YK0hR?=
 =?utf-8?B?VkhNeTRJOW5hY2xrVnEzNHhiTjZ1a1JhSXdSZkg4NFF4WGJtTXB4bE1heURi?=
 =?utf-8?B?YTFZYVo5MjN2bnUyUE4wNHo4dy9wN1J6MEJaSmt0bnltZDR4N3AvYTErU0pQ?=
 =?utf-8?B?VERKbDVOWFcrclFYSlF0Z2owb0pTVzZPQUMybHJXNlJ5NWhleWdVajZTYkQ3?=
 =?utf-8?B?UUNMMjYwUFp1Y2kzOENYSDFzeHNVNFE1RStwbFJ0N1VKVTMyVjJycG9Hdlov?=
 =?utf-8?B?eFY3bnBOS3YwWmF5ejhCdU1VVFJQNWI3cnREcmFxWjRHUngrYmgwZzRzNVcy?=
 =?utf-8?B?UUN1TEkySGRGZVhTMk1ycEJFT1N6SUpUU0h2bU9xQ2F5QWpVeXJzZS9jd29M?=
 =?utf-8?B?TDhrSUp5T2c3NDlPMnNkV2h4TURpaERpakRlY0hVR2RrRGhMTnFsN1lmSnBR?=
 =?utf-8?B?R0x6dEZzM3E0TVc1ZXRyOEJLaGNBZlNoeVBobHhDQjA2QktNUC9HM3l5bmt6?=
 =?utf-8?B?TFplMG14VWJMc2ZDbEl2L2FSdkJBaG9RWThWa0ZvZW40Q3BLS3RQUTdxei93?=
 =?utf-8?B?b1U2c052V1NYazQzMXB3YS9Da1V5cTV3S0NJWnhuRlBqazVWWk9PTFd3QVI1?=
 =?utf-8?B?NVFuY1dLY0RiM2k2UUdUbUZTY3RQZUJRdlB4U0Jzei9hcVQ1d3BNSFdmU2pZ?=
 =?utf-8?B?U1M0cEIySFlJOGpMQkFySmpZUzVFNWx6c1B0TUV1eXJSY1R5K3VUT1FnaXJs?=
 =?utf-8?B?em1PazlPRWxGR1NOcGIyVkJpK2t1ckNNK1MveXJyd3pQWXlkaFF3OW5EYWZD?=
 =?utf-8?B?RHBDaGRGb2o1blFyZEtEdTJFRkZneW5rVEtxMTBlSDQ0bmRBd1hVRU5Wa2dB?=
 =?utf-8?B?dllUblIxamFqZFBIcFhERDNWeldnUUF6UmJRM3k0M0x6ZDlJRmoxT2tRVFdz?=
 =?utf-8?B?L1NsU1lvTlh5WDRFK2pjWmY5dGd1NFAxY3RpVGFQR0l6d2k0UzlHdzdlY2hx?=
 =?utf-8?B?RVRzSEVZQ1JoZ2g1bURwSFJ0eU5qR3RRcmRSdFpXVkRwWktsVUp0ajJpTXBT?=
 =?utf-8?B?c2ZzanAxY1BEYURuUVYzakJsWmM3aTRMOVRUbXd6UnB3NTRrYk0ybXpiZUlF?=
 =?utf-8?B?M3FsZGdkN1ZPMm5hR2NYYzJVSHNLVG54U1EvSmNySHRpYWwyZHhOTllnSTN0?=
 =?utf-8?B?ZjVKQXZaNk1RNlFtdmRuREpmQWxwWUVBeE9qYnBGSlFaQ1d0NEd6cEorbmla?=
 =?utf-8?B?Y25TWDJGWElkU0ZMb01HblV4QUtPTEkvR0ZmemVmRFNZOGs0dTNmT0g1ZkVE?=
 =?utf-8?B?SHNIMS9ZTG1lRG4ra0swM1kvR2JFUGpRL1B0b2VBWTg1RzZXRDdBRm1LVGxE?=
 =?utf-8?B?dDZ0aXFmb0IwaFRrQUxCNEtvdzlQbEd5d2c0RWZLb0ZNeGJja2dFSC9kdU9l?=
 =?utf-8?B?N3ZSRm5YaDRmL3U3UUw2a0pScUZyQS95eVNZV1ZCT0pqUXpVNExtelI2cXov?=
 =?utf-8?B?cE03U200ME5vVUF6SWdBQ0NhUHhHYXd4aFo2RzNQcGNDYVAzTEFqdFZLL3hl?=
 =?utf-8?B?UUMyY3E5b0VQWXMxeHMyUytHaGkrd2JmRTJlQzZzd2J6T0Z1ZEk3ck9IQU4x?=
 =?utf-8?B?WVV4bC9QVU1TMUd4NFNzYmt4a2ZER3pjQUFCSGJsWnhjNVlaNEoxM0tZY0xV?=
 =?utf-8?B?endqbWRsTHlWcXVOTW5mTnhEanNUTU8wSDQwa1liakI1cWZIZzNoNmcxSW1U?=
 =?utf-8?B?VDcyRXpvN3J1Q3UrdEpQSXZva1ZMMEpQWWU1V0wzczdsNFB2SFI5Tkk2WTMy?=
 =?utf-8?B?VFZpZk50OFFxbmd6MFlCSkpwVFVPVk11NEFTeEVlNHNkakhzSkxxQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <953A15908E57584AB746BE9038465ADD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf9522b-d9b5-4234-41b8-08de607ec674
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2026 04:11:14.4337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2JYOn6SsGytxho1ydLVlP4reKvIpMjZY/79OA065LZZJq/I5RcwXrq9a6ewSoJUG0gQPRvNwkl5pjczQmquoAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4350

T24gRnJpLCAyMDI2LTAxLTMwIGF0IDE2OjE2IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IElmIHNvbWVvbmUgaXMgZGVidWdnaW5nLA0KPiBhbmQgdGhleSBuZWVkIGxvZ3MsIHRoZXkgY2Fu
IHVzdWFsbHkgKGFsd2F5cz8pIGZpbmQgYSB3YXkgdG8gbGVhdmUNCj4gdGhlIGRyaXZlciBib3Vu
ZCBsb25nIGVub3VnaCB0byBnZXQgdGhlbSwgb3Igc28gSSBiZWxpZXZlIGFmdGVyDQo+IHNvbWUg
ZXhwZXJpZW5jZSBkb2luZyB0aGlzLiBZZXM/DQoNCkkgaGF2ZW4ndCB0ZXN0ZWQgdGhpcyBpbiBO
b3ZhLCBidXQgaW4gTm91dmVhdSB0aGUgcHJvYmxlbSB3YXMgdGhhdCBpZiBHU1AtUk0gZmFpbGVk
IHRvIHJlYWNoDQpJTklUX0RPTkUgKGZvciB3aGF0ZXZlciByZWFzb24pLCBOb3V2ZWF1IHdvdWxk
IGRpc21hbnRsZSB0aGUgZW50aXJlIEdTUCBvYmplY3QgYW5kIGRlbGV0ZQ0KZXZlcnl0aGluZyBh
c3NvY2lhdGVkIHdpdGggaXQuICBSYXRoZXIgdGhhbiB0cnkgdG8gY2hhbmdlIHRoYXQgYmVoYXZp
b3IsIGl0IHdhcyBlYXNpZXIgdG8gY3JlYXRlDQoic2hhZG93IiBkZWJ1Z2ZzIGVudHJpZXMgdGhh
dCB3ZXJlIHRpZWQgdG8gdGhlIFBDSSBkZXZpY2UuDQoNCklmIHdlIGNhbiBlbnN1cmUgdGhhdCBO
b3ZhQ29yZSBkb2Vzbid0IGJlaGF2ZSB0aGlzIHdheSwgdGhlbiB3ZSB3b24ndCBoYXZlIHRoaXMg
cHJvYmxlbSBhbmQNCndvbid0IG5lZWQgYSBLY29uZmlnIChvciBhIGNvbW1hbmQtbGluZSBvcHRp
b24gbGlrZSBOb3V2ZWF1IHVzZXMpLg0K
