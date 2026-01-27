Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010042.outbound.protection.outlook.com [40.93.198.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CCF36F41C
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 21:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769547853; cv=fail; b=tsh3NkXjNK3JuaQRA65baoW+YD+tCRxGEzeg70MdYy1g1Q2PfN1tY9YNH30/eH5Jdvw18qSr4jtTt3BHj4HMxwkdLlxNuSlcbD7gXj3BB/K6LsWpMF1QcN4S15TQfw9P47IIxMlcinGAPjlFpObTYphA7YBhvmZsphiSC7GCS0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769547853; c=relaxed/simple;
	bh=lEUVelVeLt0Ibr7YDksT9KZ9Gl9CHPl3VOlFgYhiMrM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SLI6fhkf9tAKLmoXc4G1CDQRK1fsxjCr63EfAm9BPOALY48IUeUSP0UbavhqvNc1/HU+jbPKlDCacydSqLspQzEamn/vqZC4MBTuKwBuO5Wun1eX5Rim2bvHJYZFReG5sDB10/PMQS7V1ebw+jR/Dk2TtZUIBrrbLux5ZrVreQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hEAs2DOV; arc=fail smtp.client-ip=40.93.198.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hEAs2DOV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqqPsAPqMgJKehUdk7ueC2V9fbl8mKJdCDqQYJwD4+D9bVwfD7SeA8iOLapAxLradx2M0EXRqNeLytlJfcerVQSu0RnnHgpLRf5wY10O5VSlRJ0W8soXfNPlAoREn5VNUsQHL0OoDs63TAI0TMtH8S/S1cwZeO48DsVVQHWf6IrFASK0wl/irUoXeNFBjFdrM5z1XA/iZMPWiXOeN9LHvaEWQJeWiSQKMeyAp/Xh9ZZl8+SuflmTzuiXVCqmofdGFAJ0+jl4o9m8YddR8NmDuaSGIwrMsambChLQRpDSXrbjORnVcRgnPtZBVcnr7wLGIB9ZGzoQqoPJuldgecG36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEUVelVeLt0Ibr7YDksT9KZ9Gl9CHPl3VOlFgYhiMrM=;
 b=YjqCWdH9Qn/FWhBWhCRgmd5VhZSorJVLDYGZjCmHcSCBBqUxwRvV0PscZ1cNhcLXiQFMYggVhkMnND66HLUwWyn3dt0yuiH/JQOuRo73uX50fkQ6eyS8mz3tbt7T4hY7LutbA5qQZ4t+HcD01VCshSy+dJ8W3hEYwQK1JKZcgwpP0jOvP1w3wpGaM3GbrJ5+Ppx6unmwdyz0dpC/0e2A5OxBb9Cisf2xOgzE7Vmt0Khy4GbnJBujzwJOecJ8u39Gp7AN2DB4fwNdmr/SUSI7EVlWx4y8mMuKuyc4Ijy+FOydwAtX3VmSxWkMfHFSKxQTG06X9qIoe4xIalH9XZPvWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEUVelVeLt0Ibr7YDksT9KZ9Gl9CHPl3VOlFgYhiMrM=;
 b=hEAs2DOVu3xuGiZPigkzRPY2d6gq1pWg/Tzpyl7GVidHgFP8bq9fYlR1Xe1uxez7bcKih9QYv/mBeUcahwJ+Z/kLHzZxkqOTq1Am2mdyGhJWSfKdip0r99q2Uccha1aqHpOy2uR+aK1Tbx+QxGC8hPPj+GY5YQn/DAJGuqXHlG4trOH2k6ONxKxkOVpqxYe4IUXxDGKrpo2OH9D+ZJ/ozsRSRxRBLJBbq1sXBCzkczGdFDBWLgsGGgxOymnWrTrb/PYyRh6zNtaSYrtGXhjvH2u/b6P6n09yslPpamkb3E9aA0aoNTAbLNllvdfAkNkM77q+UUBnjcLZYS8FxVwlHw==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by SJ1PR12MB6098.namprd12.prod.outlook.com (2603:10b6:a03:45f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 21:04:06 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591%5]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 21:04:06 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "gary@garyguo.net" <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>, "mmaurer@google.com"
	<mmaurer@google.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 1/8] rust: pci: add device name method
Thread-Topic: [PATCH v5 1/8] rust: pci: add device name method
Thread-Index: AQHchzIlEBxzvkLqKEeU3XNB5ViborVWNSeAgBBdZYA=
Date: Tue, 27 Jan 2026 21:04:06 +0000
Message-ID: <04ce3a5880f3f96e083cf72289a2af220b3e3fd7.camel@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
	 <20260116214959.641032-2-ttabi@nvidia.com>
	 <DFQTGD2X29SA.SFSXUTFX6CWQ@kernel.org>
In-Reply-To: <DFQTGD2X29SA.SFSXUTFX6CWQ@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|SJ1PR12MB6098:EE_
x-ms-office365-filtering-correlation-id: 56837453-29ab-4b63-92a0-08de5de79bc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YnRCc2I2OVQxQTA5MHdGTitaOVZvTlQ0L3pLVldPTGw3M0FQcXE5cFZaQ3kw?=
 =?utf-8?B?MlNmVWNEN21GRG9vT2dweVE1Q2hBNUM1dlFKWG1qZFFtbXRnSTNvclovQ01a?=
 =?utf-8?B?dkg5eXc1V0dZT0p5ai9ZMU5jYi9PY0lVbjlINzdEN1FMVE93ellDU0tqQk5j?=
 =?utf-8?B?YUhGc2dlNVZmSjdNNEd0a3JFT0JMRGNOQjhFcEZaV2I5WXNQZjdkL2JIQjZk?=
 =?utf-8?B?QjlQRXF5ZU1QekFGcGs0Mkx1VERVc3c2ck5xT2c3WVR2bGhKNmw2V0JXSXpk?=
 =?utf-8?B?NmQxNHlyblV6cElKWFR3U3NhZW13cU9QV1p1L25GOWppbjh6ZW4zcUJKNFlz?=
 =?utf-8?B?dGZWTHhZZFcyMG44akZjejhrOEd1OEpwTXNHUndTTjVpbmtmelhBbVJpS2NV?=
 =?utf-8?B?VUtKYkloNXM5TENNVWVUTWt4TWNHRkd4a01keittK0djY3BSVjJNRXBxUjBp?=
 =?utf-8?B?SEFGUzJaczludC9UdGdTUVpZR1lGdHZMUGRsRTJlM0hlSldNY2VoZFJZbzQ3?=
 =?utf-8?B?K2pwaE1OYnVWSmQxd2NEWXRVTDNZc0FNOHV6WXNlOXJySzFTYlJiRTk3WGYx?=
 =?utf-8?B?TGp1eDdjMmRyejJVd0NsRGJRQURiOWVDRHlXMEJVVXIrR09FcUE1ZDRYSkRt?=
 =?utf-8?B?cVVNOVVNR1Q5aTlKZTVwYnd6QmpKTkxiaDRlbXhhUWpjTVFtT29mVWs1T3Rr?=
 =?utf-8?B?SXVIc0xXSnN5a3J3RU9UN3hoSC8wZ0g2M3ZsbHdFRyt3d0V2eDRyN2Y3SDBQ?=
 =?utf-8?B?eEFWY0lFQldTK01WTWhDUnc2V29ucklvMUNCalFiSEFaOFpHb3Vpa1RRUUF3?=
 =?utf-8?B?K0F5VGowMnhxN2hoaGxiZ0RkUXdyRjBRRVJjMjNzMGZMKzhKMlJ6MFRMbVB1?=
 =?utf-8?B?SWZrZUpCc3FsVk90MnNpWkhMbTdjNXd0Snhyb1dWamVFdWtrR0VwN3J3MmNK?=
 =?utf-8?B?NUl3L283NzFDVmJBVjk5VDhNb0JsSFRoQURpdGVHOWpsT3ArRUluUzN4ZGN4?=
 =?utf-8?B?Qms2bk4xaldEVEF5L3lQSnZMWW5qS1hlOHJRazNTME9NYTQ5aTdjY092Y3lV?=
 =?utf-8?B?RlhvbFZRWmdaZGhHQXFwQlZJN0tJcnJ4MHpnYUdWUkh6eDlndy9jZndsZk5r?=
 =?utf-8?B?ZFV1bENyVHR2L21NeGVodCs3SUF6OWUycVRoT01ac1RyNW1USjhzdGVENWNU?=
 =?utf-8?B?YXhqMG00M2hTM3RqcEE2YldIMGMwU0k4eEJwMDBaWU5BRUZTZVRZVlNFWmJy?=
 =?utf-8?B?OVFNY1lTNmlFMlFIbXEwV0lDYzNhUnhjNEgzMDhCVVRzRG9FS2RLc29MaTFN?=
 =?utf-8?B?YVNPcmE5NWlpcDJ6eHJkOXl0NytyV1BhNWlVUUltN2VtcXNPSGp2WkEydDQy?=
 =?utf-8?B?ajFZNVVuWlR1RWlVRTVmbjdWeVJydW1tWWlnM3BPNDAxa3RWV0RRMDNPeXZJ?=
 =?utf-8?B?TTc1MUxjcmxBT09hL216VGF3WXU1RXNtZUo2OHU0SzRRbGtOandPcjdjbDNI?=
 =?utf-8?B?YU1uWGs3aEZiLzRIUVhHNWlRdy9tcHpJczd5RHlVajRFdGt4ajhvbkJraXRk?=
 =?utf-8?B?K3RaeDgzclFDQS90WU9JSVhZK2lOcmJrRDlJVDN2dit3SjZhQW9uOUQ1VUdG?=
 =?utf-8?B?dFNLMWJXTzJmVlZOaktoTjNQOGFLMXRWYWpoWTZ0Mk5zaEhxcGFITFZoUTRy?=
 =?utf-8?B?blFIWjBETTRiYnpWOHllV2Mwa0hxL2xOU0hoZWlHMWpWa2RRRGNEQ2lPa2w4?=
 =?utf-8?B?K1RjeEYvR0xpeDEyL3IzbW1NcDhNVmw1bm5qM3ZQcitnNE9Ea0xGMk42ckFr?=
 =?utf-8?B?Z0lEZU9sdm1ncU5kNUVjbHpIVkdKanJ2Vmc2UzRNT2U4T1krWWx4RENsVklq?=
 =?utf-8?B?cFdvMlBhczRkOE5iVHRsV2JNQ0hLekRqaFdXejFWWFk5YlhwYnVyOWtMVFRu?=
 =?utf-8?B?Ynd0clRocTJZcVdDUjY4aU1rbWxTTHlDR2I4UWVubWJYMFMxUnB1b1JDNjFu?=
 =?utf-8?B?S3l3TXl1Y0VHaURSNHlheGlCMEphOThnTlZha1hkTDBtVS96eHAwQUl5NmNI?=
 =?utf-8?B?clNIZXZpREV4V1lXa2lnVktFRFdBNFd4QkRXUytTWmdlOHdPRHZ3VHQwKzBw?=
 =?utf-8?B?eG1SMmpRcFBvL0QwTDZOMVUvVG9ZSEMzejh1S2NHMVphTGl4TTJBUnQ4Mnpm?=
 =?utf-8?Q?JShuLJV4QDo51zRDBD8fvSc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGdyUTdlTlRzM01naEtVaHlORDYrcS9nZDRhMDFod3JVQmdWajE5eHNOMith?=
 =?utf-8?B?RVpNTVk5eldXQklpTmJaTnNIcXpmaUNkdVRSYVNoL2tYeUdvbTI2cmRTUUNO?=
 =?utf-8?B?ZjIrWmlFaGUwYTZLYWJaOXBFb2FMQi9XRTNCbWhqV20zYWNOMi84TFg1djN6?=
 =?utf-8?B?N2t4U3lkYXpLR24waGpKYUVXdXpVRXd3Vzk2QnVBQi9HTFUwRGZJd2RiVTVq?=
 =?utf-8?B?Qnp4RGpkUTliVVZFMWNxci9nTUV5b0ozQ1BuOUpjNzk5UlY0aWhRQjhBQnov?=
 =?utf-8?B?bVRLVS9wc2ZJVkdLeVluYnRjWkZiOExiWVFmdlB0dXhQQkRNRHpiNzlPVFBH?=
 =?utf-8?B?b3RJM1k4YzlIeGRacDBGSG5BOVhPZ3hTNHl5eUNnY0p1WWtMeFMvTkdIK2JI?=
 =?utf-8?B?TFZqV1BqK2dzZlRTa2tZdHE2NThqdHRrNjdGUG9HdUZCRm9QSlZSMmhMbmhi?=
 =?utf-8?B?WUNBNE9DWVpPZy9hb0hISE4yamlXQmJvamprZVZJMWFsNGZTcHo2OHk4NFdD?=
 =?utf-8?B?S3dDSXA0a0x2Tmg0eTE1WVcvTm0vWHlWUE5zTHk1WEMxMGZXWldkVVpZYXli?=
 =?utf-8?B?bTEyWWJCRFlTbDRKR2tlbTdyRnlyM1F4RlJtaFRka3lwZlRVR2lvVjVEdFQr?=
 =?utf-8?B?Z1d4M1d4ajNDMVpGQkYzbFI3ZnUxeGxvQ2YrU0NkZklUMmd2U0svTHAwUDNC?=
 =?utf-8?B?NUR0K1dNQnBYNDNIQWdjUFBVTy9ZQWdSRkRZUURmdENCWm5JalJmVkFWTjJL?=
 =?utf-8?B?SXgyeEVrK1ZrRlZvaUE0aEdnY2dMcmM1aXJaVis5dTh5YVpjTVRwWExIcUJ6?=
 =?utf-8?B?TDVMWk8zeURvK3NBUU11dWxZZmhRT1E0bXQvdThtQ3ViaTBDZmF5ZC8wRWFi?=
 =?utf-8?B?Q0NUdnUrK0VILzUxSzltaHdLdG9ZejZBRjN6M04wcit2TWRKNWZYMUhrVlh1?=
 =?utf-8?B?Z1YyWUhFVFI2Unl2azdRVUQyOEF5d1pPZlVFVjVSY1ZDU2tWd3F6SE1SSFZt?=
 =?utf-8?B?b2hibkt3ZFJ3QU1rcjFLUmdIK3kyRU80VVdwL1B1NTY0U2dOczVZWUVxMUV2?=
 =?utf-8?B?enNQRCtTMFhvakdheXJNbFBBdUlTdjZWNjVOUUVYZ2JtL3QwZkxWVFI2S090?=
 =?utf-8?B?OUJNM2dzaDY4Vkd6SER6MEgzMU52b2dIajVRcTFnT0Z5L3RYMXRpR0grWEFi?=
 =?utf-8?B?WVZ3aFNwZWtxYTBveFJsSU5mY1F3VVBscnVoZktMek52T2dUbUpMRmJNcFhy?=
 =?utf-8?B?ZG5RQnBnOUhUOEl4MjlmOHJPUGRZdEJpSDhaSkdiVVo1NTY5WVdRN0xseVNx?=
 =?utf-8?B?UzVvODlHbHR5dUliVm1SSTdnVkZtV1dRMTNDWVRJYjQxL3RldDM3alg5Zk56?=
 =?utf-8?B?OWdaWnVSdEZQNldhcGlqL2thTkpod0JuWVBZN0gxQ1dSblBORGpyOTZOSWUv?=
 =?utf-8?B?QTAwSHhwSWJKWTZCblEvdGJxZnFXUUF0OTZmQzhpWWZMVUwxU1JUbTV6T2pj?=
 =?utf-8?B?VVltTTFFanVjYlBDRnQ2NnpmOFVIdlluaXErczRqTTZMclRjWnA3SEdlNTFQ?=
 =?utf-8?B?TXFWYnAwQm5CN1dEY29YRmZsZThYMWh0VWhlQW5KcE12dGpLY2JWYm9wZmg2?=
 =?utf-8?B?WmdpR3dPZUZFRmk5RUVrTlZSSkl3ZFVCUjZPU3RTc1JoZVRXcmdwVmZJQXN6?=
 =?utf-8?B?LzVCZGhKOEQ5TXVvZ3BMSXZIMWkvOWE5eDhSZVZUTG9YVk15Qlk0bThuc05o?=
 =?utf-8?B?OXlHTUdROTFEU01ZR1NoMVJzdnprcjk3Y0QwT2UzTFpreFFacm9TVW1idE1v?=
 =?utf-8?B?Zm1BK0VnM2ZPVHBxbUtHbFhBUjh3ZU1OcjBDc0FnWTU3dVQ5VkxGVHJNanMy?=
 =?utf-8?B?dytmZ3FoVWFETzhnb2lLODJiNG52VlhKQ29nclg0Mnl0b0RJZXlLVm1QbStw?=
 =?utf-8?B?NUU0amM5WG1IeXFHMTArY0pvYzhWeTFqSjVZZW9FczllV05va24wcmcvc2Vm?=
 =?utf-8?B?Z3dXVzRlNGxRR1I0NkdwUW9mcTgzQUpMeE13UnhmRDJ5dHJoZlhJL05WMzJ4?=
 =?utf-8?B?V0VqUkx6U2wyS3EvOVQ4L3pTTkJnUkdOWStWUktjTy9IU2YwNjBMWDNsclhN?=
 =?utf-8?B?Q0l6c2QyRFI0MnV1cXMyODRyYXk3OWkzN0JRaUgvVlBmUjhlc0FHek5OREZh?=
 =?utf-8?B?TERtbEIrRTdUM3A3WmFsUjV0TGxOcFFOUjNYckp5T0t0R3RwSVBmaGZYMmFE?=
 =?utf-8?B?M3BkZEUySy9icGthQU9pVE04T1lRdnkxV3lJeDI2T0VOREd1S29uWjJzWVpx?=
 =?utf-8?B?QUgzR0Ztd2JRai9uaFhRZm5Sa0FIeXRFUTErT1hBS0NIT244clNIdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D43A432E29BA5A41A1BB725B846A32C3@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 56837453-29ab-4b63-92a0-08de5de79bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 21:04:06.5398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZKuc3If6vDSB1XpIBELEzArVCtePZ4OzLlc/uEJcDr6ghZyzz4xFxiRhlR7hK094EIcO65sDLKC0awRxxUQRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6098

T24gU2F0LCAyMDI2LTAxLTE3IGF0IDEyOjA5ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiANCg0KPiA+IEBAIC0yNSwzICsyNSw4IEBAIHZvaWQgcnVzdF9oZWxwZXJfZGV2X3NldF9k
cnZkYXRhKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkNCj4gPiDCoHsNCj4gPiDCoAlk
ZXZfc2V0X2RydmRhdGEoZGV2LCBkYXRhKTsNCj4gPiDCoH0NCj4gPiArDQo+ID4gK2NvbnN0IGNo
YXIgKnJ1c3RfaGVscGVyX2Rldl9uYW1lKGNvbnN0IHN0cnVjdCBkZXZpY2UgKmRldikNCj4gDQo+
IFBsZWFzZSBhZGQgdGhlIF9fcnVzdF9oZWxwZXIgYW5ub3RhdGlvbi4NCg0KU2hvdWxkIEkgYWRk
IGl0IHRvIGFsbCBvZiB0aGUgZnVuY3Rpb25zIGluIHRoaXMgZmlsZT8gIE5vbmUgb2YgdGhlIGV4
aXN0aW5nIGZ1bmN0aW9ucyBoYXZlDQoiX19ydXN0X2hlbHBlciIuDQoNCj4gDQo+ID4gKw0KPiA+
ICvCoMKgwqAgLy8vIFJldHVybnMgdGhlIG5hbWUgb2YgdGhlIGRldmljZS4NCj4gPiArwqDCoMKg
IC8vLw0KPiA+ICvCoMKgwqAgLy8vIFRoaXMgaXMgdGhlIGtvYmplY3QgbmFtZSBvZiB0aGUgZGV2
aWNlLCBvciBpdHMgaW5pdGlhbCBuYW1lIGlmIHRoZSBrb2JqZWN0IGlzIG5vdA0KPiA+IHlldA0K
PiA+ICvCoMKgwqAgLy8vIGF2YWlsYWJsZS4NCj4gPiArwqDCoMKgIC8vLw0KPiA+ICvCoMKgwqAg
Ly8vIEZvciBQQ0kgZGV2aWNlcywgdGhlIG5hbWUgaW4gdGhlIGZvcm1hdCAiRERERDpCQjpERC5G
IiB3aGVyZToNCj4gDQo+IFRoaXMgaXMgZHJpdmVyIGNvcmUgY29kZSwgcGxlYXNlIGRyb3AgYW55
IGRldGFpbHMgZm9yIFBDSS4gQWxzbywgdGhlIHN1YmplY3Qgb2YNCj4gdGhlIHBhdGNoIHNlZW1z
IHdyb25nLg0KDQpPay4NCg==
