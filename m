Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012049.outbound.protection.outlook.com [52.101.53.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB672BE057
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 00:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769819283; cv=fail; b=iyIGlb3RMAh54WU5omj/KMKvJYspP69jlSa+VZ2ROvCEEablHUpdlTkYAyzgaYHsD/AE6MVyRqZjLaA4bkJbL3oKpYMqrDhz91iSyb9KRdPZtvgqBhtAIHgmrat7HDFX3Yc0H+DD4qFD2wWrckO+VsrabGP8AmlWoWZCZykuCQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769819283; c=relaxed/simple;
	bh=eRDXbcBHpl7E8QNgkKadiw63BMgPTvonR3X7N9SEA54=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rC0DsVUxJTXL+NQ7CEgNoqShGFCDlWPRGqKUyqStcIY7VdHQxAhasngJnlFOA+ZjklW4WhrQ2k8fbNJTo1TOtygQNqiHw/PzUFZe9onmjnIXgzxXzCB4tDSBxHokuxgYKark81i0/uZJ1ybhHuJT9yc+3h/grQdojZqezKk9v7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LJMj0+TR; arc=fail smtp.client-ip=52.101.53.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LJMj0+TR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypr8uy6p8Z/j+2tneInDtvRTgsiTDY9oTm40xdOzftrJI+lNK+ZXA0L/Yz2kaNSRkb3r2Y1nPEuqZG++BXFPxRhK69l+J3l/H7+Vww+Cly5xSmPwqfmEECyJNM/5uS+tDgYMVCNE/LUz/IP53P1k4+WtsMJ7XGBKYWNjovORFu848glxYGzhcaS5CfzCqyhm/D1ziotLgFK7AFEbbjLbXMpq7C3pPWRs4xaNc12aMBBLOEy3G/vFOrcLEkvet0xO0MOsTg+HKD7y4d4qHqFimDKDWpjjT11MMMrzQc2zLU5j9/4lmTpA5aCbPcp6H3rxnkrM1YwJw3W80D7WkopeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRDXbcBHpl7E8QNgkKadiw63BMgPTvonR3X7N9SEA54=;
 b=zBoUGlEVp42YfQDFb6OH5x8S7R3/Q4C//C0KyD28r9FzwoWu69Rs+woIIhCkPaoHK8inE2vQNpnGSRZ7/hhUyDn0x+/tEz+HxhUuFg1NaMHu/eOFXcVjhhON94SyOzENDLrX8hNETBQCZRVKcLQar7VPt0N/kMd3ufrTZ3QE4LB9FjbqlPyTF6nlyyVxM/0t/lQrmUNxOxdhUqXR3zbKE8R/JbfRi2MmNhNLRtrCR95q/aCQ0kylZAMdhq7YLZYnddV5GmukU2d+jgS+4hiPl7VZKX2v8ItPXb9ZKPz9E4BFFwdHh3/0JiELhHRXwlAWidAPbYqS1Zul5OV3TBtSfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRDXbcBHpl7E8QNgkKadiw63BMgPTvonR3X7N9SEA54=;
 b=LJMj0+TR4cM6vxPaI8c9eKuCuiVsNmk2mqQJ+oAtbMS5gOr1lRQgsvXcMp3Zs+ablIclPA20U9GgPd/CxsCWh9gdGLTOJnFaCET2WaxWz+ppuc2OLN4aVLhuxfn+qkRKYgscS6W+qywdQyt8BcMWx2xmJkS5fE0tyEGZ5NEI0nlwVgU8v59fSCUibah0GIvbKKzthngaZlnFEvelRrU2RHTrI33SiJS7rmwvxHnQse0q1+iPc33pKP7M/8DEY4ijJjk9Xyi/iiS7MjiVJAQTUbeTVlYUmmFgkvHu9MQi9UY8/8hmiDfDIaCsy5SeUHcrU/MysQKtrFCsdsAe5ckI9w==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by CYYPR12MB8989.namprd12.prod.outlook.com (2603:10b6:930:c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Sat, 31 Jan
 2026 00:26:45 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591%5]) with mapi id 15.20.9564.010; Sat, 31 Jan 2026
 00:26:45 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, "dakr@kernel.org" <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "mmaurer@google.com" <mmaurer@google.com>, Alexandre
 Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Thread-Topic: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Thread-Index: AQHckMcO0eg+xcWa9EK4OKU7tGQKjrVrYNaAgAAGTICAAANhgIAABHwA
Date: Sat, 31 Jan 2026 00:26:45 +0000
Message-ID: <f723d517b943b9f4c10764daee9ff711e15b6834.camel@nvidia.com>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
	 <20260129022837.4133832-8-ttabi@nvidia.com>
	 <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
	 <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
	 <DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org>
In-Reply-To: <DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|CYYPR12MB8989:EE_
x-ms-office365-filtering-correlation-id: a28f0afd-1452-42df-a939-08de605f6a4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VEFlb3NwejE5bk5SZWFUbkVxNXBnVVVJNzNldm1rUnBzQ0FmMXA3bnF3RXNm?=
 =?utf-8?B?U1U1YzFvekFNaXJ4eFczdnFTR1YzRGNNQTdCUjJsTUQyNk9DZ2NVWGxjeWxv?=
 =?utf-8?B?UFFZeUhYaVJKYmRYUDZxVFg2MDZNU1lvUzBmYVBQSVIrbVlER05vbkMrMWo3?=
 =?utf-8?B?ZjBmcGZHTitPQVVKT2pMSmtQWUpReEFxV3REUnRLbzN3ZmMyTW9FcXVDM2F6?=
 =?utf-8?B?K0VzU29RUzNBNXNTK2JYUUtjbUViY3diSHhiY0RyUFVqRS9tK3ppWUlwbGNo?=
 =?utf-8?B?ZnVta3Y1cHB3d25YaUtYMW5sMXk5WE9zOXJlb2JkNUZ1T25SMWJ0K0lCZjRU?=
 =?utf-8?B?WXl4T25sRUhCcjIvdU10L2J0c3pVNklCcUY5YlBmS3NCakVzc2txdlVxa201?=
 =?utf-8?B?bmdHWXBIelhBUS85eU4rdks4Y2xpcmVocnFZelh2RVk4VlczM1FtNzBnNnB0?=
 =?utf-8?B?WkNMdlIxcnhpRmdiNmdjblVmdEZMelBIN2UvV3ZDSG9FVjRDRU9WbzhMMGg2?=
 =?utf-8?B?SWdOd3V5cFlrNVp6dzF4NkVDRjVnS2RQSGlqWEplMnc2QTk0VTVyZVQyT3RR?=
 =?utf-8?B?T080WTBaZFRWMkhTWmZnd0YrMTk3QWc2KzBHdjBuVHhZOHM3TnFpek1MQWJ2?=
 =?utf-8?B?S1dqbGFPSm1iUUo2Um9rVG0rWHZGT25ZcmtrK1gyLzNmOUU3enN6Z0hVYTZ2?=
 =?utf-8?B?aWFZc0hIYnYrckM5UG1ZdkFTL1EyYWU2aTZkNHp2ZEY3cUhuQ0ZMcUlTMmJI?=
 =?utf-8?B?TEd5aGdMcHVrZjdQSUFGVHR2UlRFWkxzUlVkNHJQOHpBVUg5aEx4QmRMM2lP?=
 =?utf-8?B?UWoyU24xcVFKM0VLN3BkUkc5enVKNktHZmhscFlMc044Si9lL2ZYWVEwc3lF?=
 =?utf-8?B?aExnbS9uMGtXT1V5dE8wTm1EOS9YYzVvelpwajNjOHRpYm4xOG02STZuQlBk?=
 =?utf-8?B?ckwwQ3h5NUVHS1dhSVFqRFBXNjV0WHJxLzNpMmRDNGo4UlcyZCt5dndUY1VC?=
 =?utf-8?B?QU1YOTZ3bVlWN2U0UjRuZU8rYldvT3UzWmlTTUdEZXl2bld6MHVhV0JENVph?=
 =?utf-8?B?UlhrYTlTQVhwU1UwOU1Ia2x4MUl4TW5QU1I4SktqaHFmY1JCa0pOMEFsZ2Y5?=
 =?utf-8?B?UW5vRGVqenhtMEdPUVpZazhleGdNSlhHcVRpWFhnRTJIc3gxNHVneThUSVY1?=
 =?utf-8?B?akgxRlVFQlhFd0RENWx2Q1ozcDk2djZqU0tlVDlkck93dTZEek55WEQzRkQ5?=
 =?utf-8?B?T2o1R1JFLzJBVFVqaE9veU5MVmVpMktLQWZsWDJwTjI0dFBEVkNrOHlyOUkx?=
 =?utf-8?B?SmlSMkFSZi83NkZzb0FZYlAzdTZkNG9qMUVTdGR6MVAwa21CVDMybUlFeW1n?=
 =?utf-8?B?TUxSK1pocWd2UzIrZFNnSC9obFJEdnh0YmpDeExHU3l1R3RucEh5eUo1NHdp?=
 =?utf-8?B?TzFTZy94SUlpTjY2Z3Y3b3k5QmRYcDhxbklybXJXS0QwU29tKzFackE1MmxK?=
 =?utf-8?B?MCswV3Y1TmFySWtzUURuUFRmNWlwUEd1VWNHc0JTNlpETjZidmFPdlVvbDFo?=
 =?utf-8?B?ZkdGVDQ2anJZMzZZQXhUSnNROUdlNDd0QUlkVHN0Y09RbXFoS0Y5TUloYldG?=
 =?utf-8?B?Rk4xLzJ5Vzlpb1dxT2tCWk4zUkl4ZFluOXg1OGJUWEx3Z2VYRTBUbG1oSENF?=
 =?utf-8?B?UTlwMHkzd0VXd0JTUnhNOExveTFYNnEzNHJTaXQxM1V6WTlCaVZOMXZQeG1i?=
 =?utf-8?B?Qk03d3RKcXVFNjN1VUZZUW1xYnJkai9rR2ltRDZRT2pRTzl2WFIxT2NoNm9U?=
 =?utf-8?B?aUpsNTFDcmFJZVBHbis1ZkFFQ25UWnB6TThsbDdBeDdqWUNpNW1DQnlBREZT?=
 =?utf-8?B?Mm1PbHNGSGNXMkZlSUFjeWZvZDVXM1RRSUNHZW44SzhKMzkySHRyNksxUWFQ?=
 =?utf-8?B?MWVpUXdKSC8ySmR0eGpGQ3RCcDVJL1pjWkoxUEVsMnNJVjhtQnBQbDdIUSs4?=
 =?utf-8?B?R3J0VVpScmgwRWllSjRENjcyd3NtVk9aMUhVYXpoM0FCblUvcy81cHAwWkl2?=
 =?utf-8?B?MkM4K1UvVTFvdVFxc2F1b3BiYk8rZDVVZXJZSU9waThORXppb1dRMngzblZn?=
 =?utf-8?B?aWdURTc2dTIwSkllUm5ORGhDNFNXbnliS0N2aGRoYkJJK08wVG9yNHFON0Fq?=
 =?utf-8?Q?JTEZr8l3ExxvUgKd6FNSak0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHpDQTd4L0VtTURveU4vUmFzcHNXdmx3bHp3ZWkxOHZKQW1HaVFsckVXUy9o?=
 =?utf-8?B?Nk9IQjFiM2ZKVHRhTWtFVllJTmhoWUhTRDJvekJGNXorWlFqY3lxREFCZ3Uw?=
 =?utf-8?B?UnMvcFJnWi9PcVFvcEhZQ1M0U25oTGZhaDhOblBEU1JUcUNZaFFZc2pYLy8v?=
 =?utf-8?B?ODduMTIvN0tIUFJvcWZJOE0veHhxT2RLR0JaRWVTM09jRi9XazB3bTVXMHBB?=
 =?utf-8?B?QnhPMGxSVVNzdTFTenY1RnNDaHBiS0c5Q09rUWtPc01zcWZNNnpqaWh1SVR5?=
 =?utf-8?B?QjlJVG1UbUhoTDNHOHRmQktzRWRiSDh4MFRuQ2xVaU9jVjlsejRJRU44K2hu?=
 =?utf-8?B?cFBLTGlucXUzamlXR3Z5SnFMaU1jU2dQRjdzakVBSzB0em4wdlRHTTBCWXMw?=
 =?utf-8?B?QnBKMGFvcXhOcHhqbUhaclVkd2lrR1VLNTNXRFEyOGhibHArNEZqZ0E3bzd1?=
 =?utf-8?B?UFI4aXRuUWNsenpJeDRDZjNjUTE0Qkw3eGVyYVd1c3A4ckF4bzVycWhFYTBR?=
 =?utf-8?B?MWpUcyt6eVBsUE0vT1lBUS9JNGxZS1Z5Vkh3OVFnS2sxSElncmRlNUFSWXFn?=
 =?utf-8?B?cURvaTJoWWF5cmUrcnFlSXF5ZWJzN3dQZHIyVWdiU2hydnFyWjR1ZWRpcVk2?=
 =?utf-8?B?NXdxeTVuRDVVTVRkVU5HcE1tMTdFdzVraGNIb3h4S1g3RFJWQ2RmK3pjcHlH?=
 =?utf-8?B?NnBQYXllWElKc1VKbDYxeUFGTUtqRjByV21kbUxMNlM3OVJVajc0VHZLR2VS?=
 =?utf-8?B?cFBEMkh6alMraERRV3c2NkhqZi9GRjRrU211dmc1UGl4amZHWkZBdk9aZXhn?=
 =?utf-8?B?RzdaNWpwdS8vQW1SRkJzYjNha0ZtdXhyc1ZyM1B0U3BpRndvUU5XVExYY081?=
 =?utf-8?B?cnRxZ1BkUmNiRXBEYU43dEJLQ3dCOUs2d2pTbk5BRldvYVhmRitpMFVRNkZR?=
 =?utf-8?B?YlFvOGtLL2lsUDZrVGRJaTJYUkZKMEdBOXZrMlExYmE5eDdvUXgyd29pV3lz?=
 =?utf-8?B?TjZGdU5PQXQySjh3dStkcHVueHNXdVJmQUc1NXZkTzZaNDRVMlY0QWxZUGV0?=
 =?utf-8?B?YTRWeGt2SzZZd0pnVXBVNkFITUtzRkFFektwTjkrQXJMeGxtZlB0TkdKMXho?=
 =?utf-8?B?N2lxZ0o2dzRVRGJTT1paMmN3ZE8wbTM0QjNVT24wQys4N1VWcEUzbUM5eGhW?=
 =?utf-8?B?dmd0cVR3MnNVQ25LbE9MM2U0OVVSMVRIYnN6Rkt3M2ZtN2p6ZGxnZmpvdGV0?=
 =?utf-8?B?ZnROQUVrbXI2V0pRSURSMEE4cytRcFlpejZuSDE3SkQ2cll1SUZrYVVLa0V5?=
 =?utf-8?B?VHcyZkJlRlhzSkd4KzBzcWJ5UzRRZVdBcHZqUE9OeGZ4UFNjNEswSEE1aHQ0?=
 =?utf-8?B?dDFhV1QzMmF1UXdkakJJOFljMnhQUmMwd2RSb0hNYmdoM1hPbDZRc0tzdTZP?=
 =?utf-8?B?bnVYV29WYjZzaGluMlZCVmw2aFRveXNDMDdUQ29vOFRud2dqRXVISTY3dWhS?=
 =?utf-8?B?QXdTMURuT2I0SnRhbm1ocXNjMmlBQzBCUHZEM1Uxd1psMUhWeThmcTRnOFFP?=
 =?utf-8?B?RDZ0eDBVVzJHbDNMSTJJaW80c0ZDSHFNUEtzYllrekVOVmRzcDVwcmxGWDgz?=
 =?utf-8?B?MUZVVFdvVVFRRTJZdld6bVJ1aVAzRXVWRG1wdWUyOVhVSmQxK0toTUVGZEZK?=
 =?utf-8?B?VFBpTzFxeXJnZjIyT1R4VXZPdlZlWDVRN2RKRmVmWHpyNzU3THNJNUw3RDla?=
 =?utf-8?B?QlhHYkF0OUdDWldxM1FvR3RsclJrSXpSVHRra0d0bExRZDBvRUN1Qm4wSlpn?=
 =?utf-8?B?bnBSWHpBRWdPQVQ2algzYm02R2xJc0Fzcm92aGh3RS9XcHI0VkVXSnFjRmo0?=
 =?utf-8?B?V281QVlrTnhWOEwrNnVLMmpYNks1VWQxYkw5V2NsdWlRYnpsSmluNW9tWEVy?=
 =?utf-8?B?RWxtaVZNZkliOEFhK1FScEhHNDRKeFNCT2hyTGlGWGc4Yk1yWW8rZ0Q0YTlo?=
 =?utf-8?B?Z2NFc0dRTmFqTU0yZm15T3hyOXZlOEFpZVZiQ3hCNmNzejZhWDBiK2hQeXFQ?=
 =?utf-8?B?RzQzUm80aWZlT0s3SHVFZDMvUC9EbGt3Y2o0cFJsWmlnNm5SdzFLSVVsODVq?=
 =?utf-8?B?enMzT0N3RHMydEgzNTlMektMQnAza2NNNUhkK21JQ1hqZWlESkFsRXpVc09t?=
 =?utf-8?B?TzRFOTBUSko1UTRIYi8wbmNuaUdpQkp3TUZwaEwyTTBHMzdhZTBtY3NsUEk3?=
 =?utf-8?B?Wjl5VlJtc05QS01JZS9kT3lLb3VHbzZBeFl1UG1Yazhjb3F5TEhxOGZLRGln?=
 =?utf-8?B?dzI0NDVpTFFCejVUUzZTMTU0WnhXTTZqNkF3b2ZNVVA0bGF4WlFJdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F79005611B0C21449078E8AB0036C2F7@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a28f0afd-1452-42df-a939-08de605f6a4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2026 00:26:45.4279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zB2hwvYOBgXTAZC/B88VIMv6WAKxoAKoVjuXkq/RNyT/4D1kV9+71n439a/3fjib33/vlNZ2vxmC9p+C0aRM8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8989

T24gU2F0LCAyMDI2LTAxLTMxIGF0IDAxOjEwICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+IE9uZSBpZGVhIGlzIHRvIGNyZWF0ZSB0eXBlcyB0aGF0IGxvb2sgZXhhY3RseSBsaWtl
IGBEaXJgIGJ1dCBhbHdheXMgWlNUIGFuZA0KPiA+IG5vLW9wIHJlZ2FyZGxlc3Mgd2hldGhlciBD
T05GSUdfREVCVUdfRlMgaXMgZW5hYmxlZC4uLiBCdXQgdGhhdCBmZWVsIGEgYml0Li4NCj4gPiB3
ZWlyZC4gTWF0dGhldywgd2hhdCBkbyB5b3UgdGhpbms/DQo+IA0KPiBUaGVyZSBpcyBubyBuZWVk
IGZvciBDT05GSUdfTk9WQV9DT1JFX0RFQlVHRlMgaW4gdGhlIGZpcnN0IHBsYWNlLiBUaGUgb25s
eQ0KPiBLY29uZmlnIHdlIG5lZWQgaXMgZm9yIHJldGFpbmluZyB0aGUgR1NQIGxvZyBidWZmZXJz
IGFmdGVyIGRyaXZlciB1bmJpbmQuDQoNCkRhbmlsbywgSSdtIGNvbmZ1c2VkLiAgWW91IHRvbGQg
bWUgdG8gYWRkIHRoaXMgS2NvbmZpZzoNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcnVzdC1m
b3ItbGludXgvREZSNlJXUk9XQllBLjFROUpLSDhVRFNYT1hAa2VybmVsLm9yZy8NCg==
