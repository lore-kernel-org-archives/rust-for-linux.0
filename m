Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF25B611E
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Jun 2025 17:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970955; cv=fail; b=e6sjSNonol4WjCbn+u5LHMfLYPb5e98IlqwJ1/+DgaLtIaQAmry2jXlNVPqiULXBUN0dviYKgrcFpFdTKBKT9soTutmUdVWMMZprObyZu+q5tzZEHQ/yH5yoVhrfzsO50lS6V2XK/ADJvLcSLYKLX6ZwvPUJtDjhuu7JSU4lGYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970955; c=relaxed/simple;
	bh=Al/T0ycmmrrH6hQoDJn+b6d7v2jSd1uc1GdBZPz7pN4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XvBlUgH9piQPEjAMKASMq5jfAdW7WnSBIyHjSyRiujRLsBq3BUuqU38cw7lDOTsjPJDFS48IiBbTT8c0nyVkr5+lRo8f7ZWCCZ7TI9YrV45V5KhcnvmP1XpPR1ducLVoSs/n+/CynsYO7SpQu9wN0DeUOu+iLT3NO4uMY6i873c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I3SLkCYk; arc=fail smtp.client-ip=40.107.244.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I3SLkCYk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBS1vIxquDq+tNWeZjpWEj4oCsvDXO1z8cl1Rw1HdXZpiA2Zijcm+uKBS/KYXaN3yIZds2I0KS0SWpAAgCbkk1nZG5hcopOXwj+iSOSpJ9nAM25C2h4JXovH6kzaWnnOT/Pq8cQs9Z41gz+9QfEhMQiMcZWBfADbtlOjUPk76uzpQcZ2C1cbhGC7tIioJ0biPCbdhMNZ3byi9kVgkBSYJsW0Qf6fGhALinEKC3xGPcJBeVjMbHnb58qTRlqPm4eK9uEMkfY35dequGSw9OwLQ4hHTreV/xqymlr7U1pwVB9ka61hSoTrv8nQEmu86TWoEz4ukAU2FVD5jfJV9igkww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Al/T0ycmmrrH6hQoDJn+b6d7v2jSd1uc1GdBZPz7pN4=;
 b=I6LCBxF/doGl06eY+joD5jpf/N/yFHEcXEbsqq/UnIew/C0QYHnSkoL+xuji9wlYjQ35y0tFkv8MqcL0jzBshTv3sgIsSGIuAQl/pAHZ1ji08RnQUYLAJOOD05ylEwfJJa4wbEY39crVoHuAM2ZNXqqct1jugc/s8obJqaoaCcXoi26d44txZP8RSgYU7l5HuUjaO2cgEp2S+FWHbhJZsA0TTpX6b52ZPTf0t8tr8L0x1u/ukkY/UAjdUu+F0zgwj5pqYDyNn2h6nnQHcwYXmn9AwW7jrwDEKDdizq6bgHUbTzB1OFrppbwbsrhoFz4tSxtOIKa054tS60LjRZFp7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Al/T0ycmmrrH6hQoDJn+b6d7v2jSd1uc1GdBZPz7pN4=;
 b=I3SLkCYkE6L2pktvdDn+XGaJw+C/DY24V00xdnc8ZVkmtLgUao3+otrBWE4o5ouJmjs3+dTGVN7lDf+iGBiR7l28uhShWh6Nhiu46CNVtnzGS3/xKol8Za6tjsAX29JhXsTHNgN2ABzTlhqkAt/nJedkEds1lFyI9sHW8tCnE/eDuziOTVozpRnADNo+YNgKmWbduQFW7inYV0ak2kpOquFebTS+slzQpkQBRgTilManLFK8OAN+NxURWsIr0CUfGMi1eJEkABrH+umLaGKkLzKkNIYZi0HwgfvnMyFOXrPmkwnVQvNYSa7LdhwNxCljGKKfOPjTDz2BdMLP/eACyg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SJ0PR12MB7005.namprd12.prod.outlook.com (2603:10b6:a03:486::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 17:15:51 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 17:15:51 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org"
	<dakr@kernel.org>, "lossin@kernel.org" <lossin@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Topic: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Index: AQHb0Mn7MGE1brglZEyKYzrCM8w6zLPqCw4AgAeprAA=
Date: Tue, 3 Jun 2025 17:15:51 +0000
Message-ID: <2846f3423a0641c54ef0368308549fe51c06565b.camel@nvidia.com>
References: <20250529184547.1447995-1-ttabi@nvidia.com>
	 <DA8X4RXQKX5J.N4S9TWX90OU9@kernel.org>
In-Reply-To: <DA8X4RXQKX5J.N4S9TWX90OU9@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SJ0PR12MB7005:EE_
x-ms-office365-filtering-correlation-id: c3a9e728-3e2d-446a-eea5-08dda2c24a5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?STZUOVRyTlJVVThRUlRJdlNXYkxYVmhWV0RKSzNMZkNpRHBvRG5wckFwbmZq?=
 =?utf-8?B?bWdzRzErdWUwd0pNbUhBbjNEcCsvTDB6YWJvRzFWUXNvb0Q5dHJYbUJidjVm?=
 =?utf-8?B?aGhkMi9FZ1YweVdQUkhYMFdhaUIwUkt3N2g1b05vcjluQ3hGWm1YNUpuNGt0?=
 =?utf-8?B?MWNFaXBldHZwekhGaGdGMGZFU1ZtM3FaRXkyTUhJSVA1N2xwL1JOT3BoZk9T?=
 =?utf-8?B?V01RQi8vVWI2bTRocVZMQkp1Tjl2YytBSzRPdnl6cFRUdUNNaGlLWWxkOTlk?=
 =?utf-8?B?bzVqMTRRZUZlYnJmeFNYSGNQTU5NWWdXSG9jdkNvck92dERuZVA0bW1NRE9k?=
 =?utf-8?B?YURCSExzZDBsMEdzcTNac2lDM3oraGxkelR1S1V0M1IxelVMUmc1bkkyN2tQ?=
 =?utf-8?B?MFlaRzJjWDQzcitEMGh1dHE5bHh0eDdSano0ZFc5a3RYVmcxTS9rVCtRR1VX?=
 =?utf-8?B?aWFnZHUvRmFRdnV3NkQrQ2xXa3ZOSWFmcnlmRkxiZHhBVmEwdlZSampKbEpB?=
 =?utf-8?B?cEYrOHVNdHdqenY1Q01ZelBBdm83aEI1ZXJjYmVya21zTlZLZ2dkTGlrbXpi?=
 =?utf-8?B?SlBLYmxNa3VKWW9YYVExcURBRG5TSVdIRy9KQWlzMUQrVEo5OG5Yak9TNUQ2?=
 =?utf-8?B?Nlo1OWM3R2pnSWFUeFo5dnpqQXF0QVRYSER2VklGcTh4OEpVQTVRZUR3THlt?=
 =?utf-8?B?R0drdjBDWVYvNTF0OC9KcUszdTd2aEtFeXFYc3pEN3JmbjhubDdQZ3NpY0c4?=
 =?utf-8?B?VkVXS0x1dTQ4d3RVZjI0RE16RU05ZXF1cFkySFZqYWxBT3hwcXdwQkdrbVds?=
 =?utf-8?B?WFFJM00vV1VmUU9sbC81bnhzUmFSZXJWanpHWWJmc2xFOGtGSzliQ1Nidnhu?=
 =?utf-8?B?bHFLMDN4L3RBUWhpdzgzL0szY0lyUEw2blZiVmVnaUVuL21rSnp3aWp4VDlL?=
 =?utf-8?B?WDdxVytQbGVwT1hacGtXZVEzQkhrQThFV05PMFJXRzRpcmNwU2grWW5vNFhW?=
 =?utf-8?B?N2ZZcXB2Um5rakJwSW5BSFhvU3RML25BaE1sRVQ1cTBFN1JvTW56aHhFQ2lo?=
 =?utf-8?B?SldZY1g4WGV1UTlRdHQvSjhvanJmWEhSN3FnVlJaTWhkZ0JxUEZPRXI3aGRT?=
 =?utf-8?B?MFJwaUxycmorOWNOcC8ydHZiM3BZekZ5TWVxaXoxd09SbmdkVjlMeVA2K2JX?=
 =?utf-8?B?bENKOEM4MmlWRGdXelVVV1JGMWZ3M3UrYnV4QkNyRnZyVndkVXpNVXFDeHkz?=
 =?utf-8?B?d29vUjYwT0JWOFJ2SFY3STRMMUtTWS9uckdxdlFWaXdZaUhaVGkxNmx0TGtt?=
 =?utf-8?B?QWlEWVFGelAyWTNFaXRWbkhEMk5hNUROSTBVZm5kNC82ME54NEdWMjc5T0RF?=
 =?utf-8?B?WllidjJyRGZYQVdsby83M3dtRlArRGdRNXBpZ29TYU9xZ2VVQzE1WUhWYjJj?=
 =?utf-8?B?RXBaN3U5bFRpclBzWXdMeVZrb2VnWFFLYjNtVllaT0RrV2hUN1J2Q1lWUGx2?=
 =?utf-8?B?YzhiRkdwWHhpVVFHdW5aTnJzZWNCWWpxMmtZaDZtRmZheTBoblZoZWZndUJp?=
 =?utf-8?B?c1FMYzZOQXNMRHdvaGJMK1NuUXVtVGNoa0cvTnB4RGtqaC9wUWhwcGJOU3JM?=
 =?utf-8?B?eXUwd0diZ0xCWEhXV1ZYMzBaWDhNWHlvakNscWhCelJnUnlHZ2RvQkVObTNO?=
 =?utf-8?B?dHJwM1BySHlmVDFQazZVRTVsOU15RG50V1UxQ2NxNzVhUm5aM1I0V1Jsdng1?=
 =?utf-8?B?WE55ZCtWdHlwUXBuSHQzZUFCdmZucDFPSFF2MHNpbzk4c2wrVGRKVzZjUW1Y?=
 =?utf-8?B?eXBLVnRzMm9RYkJzMEgzR3lZd05GSm1Cb3ptR2RaTG0rdWs5akRQUm1IV1M2?=
 =?utf-8?B?YkV4WFJqMEJhcDZ1eE5LaWRyczcvYkl2a0FuQ2ZENzhtaWNxU05hOVBoY3VM?=
 =?utf-8?B?UFFTMlhxNEkxalhZeXZxL0U4VURBanYwSHhDQTB2b0p5aVZ4UDFKZHpQdkVZ?=
 =?utf-8?Q?DvFUCT20bnlANeTS8NPHphOs8bXTZQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3ZSZTVmTUs2WUZuUnYrZFNaWWhkUHplaGtDREFHb2g0clNXUkxSVmp0RE1O?=
 =?utf-8?B?bVNDbXo1RURxN3lERjEySklBbXpZaFJBTkErV2Z1V0NyLzU4K3h1RVlBaE9y?=
 =?utf-8?B?UWdQSTFRRmJ0YW8zbEJOeE52SlZLNm1EYXdPeXVkSFhaMkMxOEdCcTRQMmZW?=
 =?utf-8?B?ZnNucmdSTnEvZ2hmanBjS2lndnBQZFJwOHFvSC9ITk1JSUpvNURiVVJmTjdx?=
 =?utf-8?B?emthekt0anQvRXJIVUZVcndkTXo1TDAwT2JNSUVockpNSnFjUnNtK3M5OEFL?=
 =?utf-8?B?Uks3aTdSRUNxa1IyOHI3NXlQeUFibWs2VXVmVmVuN0t6d2ZoQVJwQmJNU2tF?=
 =?utf-8?B?VUNrZWVXYlpFOE53V0FqWmtHcVdVZ1RIZ0pkcFBJUzZPdWFtWTREbDVrcitU?=
 =?utf-8?B?VWZoZzJwbFFKajdLRjNhSkttSVJ4ZG0ycnBIK0Irc3EvalVNbVNjQkE2VXpT?=
 =?utf-8?B?T1d0VjR4NG5hQmVlMys3bVlHSTcxSGM1cEdnU0FkalNhRHJ5bStGVVNnV2VG?=
 =?utf-8?B?RlRtNWphT2RzYmZOK2sxUU40dElCSG9zdmg3VHhaUHdoWHZkZ3grc29hZVUr?=
 =?utf-8?B?c2E5TVlmdVY5VmhOOS9BQWZUZ2tnV3pxQmozeDFLVlNJVjdBT1FEN28rV0hY?=
 =?utf-8?B?RGRkVnRwNysrbHd4QTAyUUVpbGFXZFNHZWp3MWpkay8wN0NaeG9ya0xuU1Ir?=
 =?utf-8?B?OGZBL0QyZDJRV2VhM1F3NDlIN2lReTBXN3FPMzdLalpiT2ZBL2ZGYUlSVHNM?=
 =?utf-8?B?WThOeTdDekIxa0RQay9PL0V6SitvWEhtSXUrS3Z6QnJUakhUMEJ2ZDdQaGt2?=
 =?utf-8?B?UVpXV21vMGVyVDYzUjA4eXNUVWNrQlJjb3FuOUthTldlZ3hlUGRUWlZmckVu?=
 =?utf-8?B?RUtraHdtT3kzenNabSttaVRYU3JicWh3RGp5RFh0ZUhZRzRRUmRlYjdTZEtI?=
 =?utf-8?B?NkNGSmg0UWdZSkFadXAyMzNOcjNuZnFCVjFBNjVZelJjbkNkZzdJZUR0UEg3?=
 =?utf-8?B?RjdNSG5uQ2VnU2hKN1MwamVBVEJ3RElENUJIY01Fd0hUOFcrM1liNlYxb3kr?=
 =?utf-8?B?ZUF1cjVaZDZwSWNGbkNiOERPN0lJTjIxYjF6RlY1SVM1azdjSkJKQmc3dlpM?=
 =?utf-8?B?dzZObW5Sd0VRSFpRRzVmd3ZZYTh2S1R5SzM2LzNtVW8zSzRidnpkTzJNVWRB?=
 =?utf-8?B?c2RHN3FsVFphUWVDaE9LSU4xMUE2M3NrTnpsSjRUWXBtZ0gzZEtCZlpMQ0V4?=
 =?utf-8?B?RDA1VitlSUFtV21RSWlNWEFFRC9zOHlKMnh3YXVwNW5jYmFoS0kxQ1AxL3N0?=
 =?utf-8?B?TGhnOWFOOExHN0g4NmNBejk1RDRSWGJ6WCszWTBtL2p4a1ZGOGZRc0JsTy9J?=
 =?utf-8?B?NHB3M2NOUG1YUkRVOGQybE9IZVlpZDNhNnl0a3kvRDNMWjRUbjYvajdIOFh3?=
 =?utf-8?B?WkpvMTRZa1hlaU1JYTlFcGNpaDNMRTRTdmFBRTNVUTMyc0pMSGlyK2tudjJF?=
 =?utf-8?B?Sk5aOTdsTHprbCtnbjBkdUZDS1ZlclZZaUxwSWNFSkNGNXlVZTJqenk5QzNo?=
 =?utf-8?B?Y0NHNXdZSnh4cWt4aFdycnZ2RjMvNk15djBSRFNxRk8vbUxqcnVBOXlYNTVY?=
 =?utf-8?B?eFNUZ0hFdjNIOWx0Zm1nbFdVK3d4dkhGYjFvdThKRy9wVUdTL1dOMXREWmUx?=
 =?utf-8?B?V2dNVVUwNDJUcldPUkVxeDVFUS9rcHoyeWFxU01VVkVvakRMZWVPYUE2MU1h?=
 =?utf-8?B?Zm1IWFcvSUJHQ3hLUE9LOWp3TDlXbVMxRTVRVkVXLzZVQXMyYjZqcWNCeEkz?=
 =?utf-8?B?c1JZY1lraWU1Z2NaY0tYNjJFZHBjdkY1K3gxL2haVUVqaTVlZFNvMHVQTXVO?=
 =?utf-8?B?azFFTFQ5Y3NJR1hIbnFGbzN3Q1ptSVdYdWhKMFlHLy92NmYrQ0lJV0tmMEVS?=
 =?utf-8?B?QU9tK1g4bWM2aEY2QmVlS3I5UlVEMVYvTTFubE5CdUdwUUkxMXBQNktSWlpU?=
 =?utf-8?B?cjFYYVhTUTM0WWw0TFlSN292RDhFRk15NFJvaUlhNkM0N0VtUXRhbzl0QkZB?=
 =?utf-8?B?dGh6QmsvN0ZmaVRnd0gxZEIrMitNOERTdnUrNndxcUpTTEVQZ0w1YWhhUGQ3?=
 =?utf-8?Q?7h6VIammrJQwK4GI5R4Xoe+Un?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2C12AF86BD74A47AD08CC84C95E3510@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a9e728-3e2d-446a-eea5-08dda2c24a5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 17:15:51.1302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p4r/7t4TCS9pvAqG9+bxycQyoCOWrdeBOOaur09DJiwMjEt7VKmd/34h2sI8vZBhflEqBNf85Z750HqE37IaEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7005

T24gVGh1LCAyMDI1LTA1LTI5IGF0IDIyOjE0ICswMjAwLCBCZW5ubyBMb3NzaW4gd3JvdGU6DQo+
ID4gDQo+ID4gVGhlIG1hY3JvIGdvZXMgYXZvaWRzIHN0cjo6cmZpbmQoKSBiZWNhdXNlIGN1cnJl
bnRseSwgdGhhdCBmdW5jdGlvbiBpcyBub3QNCj4gPiBjb25zdC7CoCBUaGUgY29tcGlsZXIgZW1p
dHMgYSBjYWxsIHRvIG1lbXJjaHIsIGV2ZW4gd2hlbiBjYWxsZWQgb24gc3RyaW5nDQo+ID4gbGl0
ZXJhbHMuwqAgSW5zdGVhZCwgdGhlIG1hY3JvIGltcGxlbWVudHMgaXRzIG93biB2ZXJzaW9ucyBv
ZiByZmluZCgpLA0KPiA+IGFsbG93aW5nIHRoZSBjb21waWxlciB0byBnZW5lcmF0ZSB0aGUgc2xp
Y2UgYXQgY29tcGlsZSB0aW1lLg0KPiA+IA0KPiA+IFVuZm9ydHVuYXRlbHksIFJ1c3QgZG9lcyBu
b3QgY29uc2lkZXIgdGhlIC4uIG9wZXJhdG9yIHRvIGJlIGNvbnN0IGVpdGhlciwNCj4gPiBzbyBz
ZmluZCEoKSBjYW5ub3QgYmUgYXNzaWduZWQgdG8gY29uc3RzLsKgIEZvciBleGFtcGxlLCB0aGUg
Zm9sbG93aW5nIHdpbGwNCj4gPiBub3QgY29tcGlsZToNCj4gDQo+IFRoaXMgaXMgbm90IHRoZSBg
Li5gIG9wZXJhdG9yLCBidXQgcmF0aGVyIHRoZSBpbmRleCBvcGVyYXRpb24gb2YgYSBzdHINCj4g
KGAmRklMRVtzdGFydC4uXWApLiBJdCBjYW4gYmUgbWFkZSBjb25zdCBieSB1c2luZyBgZnJvbV91
dGY4YCBbMV0gYW5kDQo+IG1hbnVhbGx5IGNyZWF0aW5nIHRoZSBjb3JyZWN0IGJ5dGUgc2xpY2Ug
dXNpbmcgYHVuc2FmZWAgWzJdIGluc3RlYWQuDQo+IA0KPiBbMV06IGh0dHBzOi8vZG9jLnJ1c3Qt
bGFuZy5vcmcvc3RkL3N0ci9mbi5mcm9tX3V0ZjguaHRtbA0KPiBbMl06IGh0dHBzOi8vZG9jLnJ1
c3QtbGFuZy5vcmcvc3RkL3NsaWNlL2ZuLmZyb21fcmF3X3BhcnRzLmh0bWwNCg0KDQpPaywgaXQg
dG9vayBhIGxvdCBvZiB0cmlhbC1hbmQtZXJyb3Igb24gbXkgcGFydCwgYnV0IEkgZ290IHRoaXMg
dG8gd29yay4gIEl0J3Mgbm90IHByZXR0eSwgdGhvdWdoLiANCklzIHRoaXMgd2hhdCB5b3UgaW50
ZW5kZWQ/DQoNCiAgICAgICAgbGV0IHN0YXJ0ID0gZmluZF9sYXN0X29yX3plcm8oRklMRSwgJy8n
KSArIDE7DQogICAgICAgIGxldCBlbmQgPSBmaW5kX2xhc3Rfb3JfbGVuKEZJTEUsICcuJyk7DQog
ICAgICAgIA0KICAgICAgICBsZXQgYmFzZV9wdHI6ICpjb25zdCB1OCA9IEZJTEUuYXNfcHRyKCk7
DQogICAgICAgIGxldCBwdHI6ICpjb25zdCB1OCA9IHVuc2FmZSB7IGJhc2VfcHRyLmFkZChzdGFy
dCkgfTsNCiAgICAgICAgbGV0IHNsaWNlID0gdW5zYWZlIHsgY29yZTo6c2xpY2U6OmZyb21fcmF3
X3BhcnRzKHB0ciwgZW5kIC0gc3RhcnQpIH07DQogICAgICAgIHVuc2FmZSB7IGNvcmU6OnN0cjo6
ZnJvbV91dGY4X3VuY2hlY2tlZChzbGljZSkgfQ0KDQpUaGUgZ29vZCBuZXdzIGlzIHRoYXQgdGhp
cyBhbGxvd3MNCg0KCWNvbnN0IFNGSUxFOiAmJ3N0YXRpYyBzdHIgPSBzZmlsZSEoKTsNCg0KdG8g
d29yaywgc28gdGhhbmsgeW91Lg0KDQoNCj4gPiArwqDCoMKgwqDCoMKgwqAgY29uc3QgZm4gZmlu
ZF9sYXN0X29yX3plcm8oaGF5c3RhY2s6ICZzdHIsIG5lZWRsZTogY2hhcikgLT4gdXNpemUgew0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxldCBieXRlcyA9IGhheXN0YWNrLmFzX2J5dGVz
KCk7DQo+IA0KPiBVc2luZyBieXRlcyBkb2Vzbid0IGNvbnNpZGVyIG5vbi1hc2NpaSBmaWxlbmFt
ZXMgKHdoaWNoIEkgdGhpbmsgd2UgZG9uJ3QNCj4gaGF2ZSksIGJ1dCB3ZSBjb3VsZCBlbmZvcmNl
IHRoYXQgYnkgY2hlY2tpbmcgYGlzX2FzY2lpYCBhbmQgcGFuaWNraW5nDQo+IG90aGVyd2lzZS4N
Cg0KRG9uZS4NCg==
