Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020129.outbound.protection.outlook.com [52.101.195.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1F52EFD9E;
	Tue,  3 Feb 2026 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770134024; cv=fail; b=U3p4MxJOwGC53XyUU1HpQm7CR5eslCwsAiMw8DhQimHYhuhXrVBZax6qwmCEYPGZhE8hB/s3e1wVtce3dfc7nPcb+0RBxouzWQ4LLMEpjUpeKMuazJthPR+zejPG9II28UYLtuTX18zNxW3vn20fAZAl+sgWy7mWqzxZrRlF2y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770134024; c=relaxed/simple;
	bh=dsYDJ1AjjpiTjOgLsX/1nPYDaqgjrSwNNT/EejzP37g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Zwu/rd8rzTA9uk4ZcWI+qe1w9xYVFL/UkiDCfLBy7r8Tu8xLyO//bXmW5xypagDBmeL+A+2g3557LZrNXGL2ZFE7PUpHCxhlNKP93S0PvEydEl45Qrp7pJyp1tc9CiBLR8ielOnGMBZyZa7h0JyzYVhqHc8+nm9pIADNgRhMXRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zM6hXC1w; arc=fail smtp.client-ip=52.101.195.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zM6hXC1w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlaSmikWa6ZBc4LkTLPBxWrH6H7ty3Bp9KHKFc/YDfUQuLgnSeY7JfWST+MXa6nhUxBpITPpRYjoaz9+e3uBqcF1tr1MHLe8JDs4ZkEDhjHrCak58WN0u466Bp52sSNnoPEA4qrY3lMsumcJvcTr0wup7qkLn+pNYl2LLmR89Oq8kb8jhfT/mMm59vFHzVDvt7DWWdRkOluRC/Wm2oyF0FpP6du4kWY6jEnmJ+3eVrEA5/3neOhbeNht6jKThG0+AcMlAgAwB5p3SwXBPIItxrANXYi8R3Trx5jyQHI2+oC1snaf3z10AI/6HmGHHEfF2cEZwGB9tUDX26HykDKrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhy9cV81gHwpgmiWcdauNK4syd7f0a5eYcmvYKsYNSA=;
 b=uyjDMMh/B0SRdaMDR2voiUgKHOxUqXU2s50UaF0pMi+1/Fv0zD8hucVozhFmNU4bsf5IAclntvf/KytBBe5ksc3iDAHoxMDgE7BSqhtU9c1CNy6b6dsMp9HilTOvtjjRSlDoeXcX3YBZUdble9y+lBD4T7cstzio/fbD0ALIiHpM8aKh7c7WhyjbpRl/ta9fkRDPp34NqfIXXqmRFzXQg1hHsG/iQvgO+3H5AQcHGm3YNHagx1v+YwdfOAzstfdW73kDT4BPRl7TBJLPKJrILp/8MPufV4cd05lNSpVSTfrqg+Ne9MUSIxnP/1LLv7VQPwvw0qjFkdyA+UCAqa9XTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhy9cV81gHwpgmiWcdauNK4syd7f0a5eYcmvYKsYNSA=;
 b=zM6hXC1wKFtQOsjfbGaAl1EYmVorl3glsk6SCaSPfeqtu6Af9SrA97k0utEP+2+rdkE+TGL+7seKOCJw3COpjlMnJxYQ8c9uq26sfaU6gz5OQlxD4NPMYzRG4nw+inmVBUQFKBWi68LUJExPQmmJI9SH9KCkwhfVtnj6QbgFZ7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB9189.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:492::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 15:53:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 15:53:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 15:53:39 +0000
Message-Id: <DG5G52FJ0I1F.1OHNFAXKXOZ1R@garyguo.net>
Cc: "Tejun Heo" <tj@kernel.org>, "Lai Jiangshan" <jiangshanlai@gmail.com>,
 "Frederic Weisbecker" <frederic@kernel.org>, "Sebastian Andrzej Siewior"
 <bigeasy@linutronix.de>, "Michal Hocko" <mhocko@suse.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>
Subject: Re: [PATCH v4 1/2] rust: add system_dfl() around the new
 system_dfl_wq
From: "Gary Guo" <gary@garyguo.net>
To: "Marco Crivellari" <marco.crivellari@suse.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260203152818.317806-1-marco.crivellari@suse.com>
 <20260203152818.317806-2-marco.crivellari@suse.com>
In-Reply-To: <20260203152818.317806-2-marco.crivellari@suse.com>
X-ClientProxiedBy: LO4P123CA0296.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: 84acbeed-b05e-4e10-f7df-08de633c666e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXBxeERIaytDUFRFd0k0RmtBTGJEdTdpdkEyakV5Q3NvNDFUL2FBb2lIL3VR?=
 =?utf-8?B?MFhCV1dOZmtHeXJScUVpb2FaOFpVbXAvUEtocmdwVTJ1QlhiK0dCMnFjT3Fj?=
 =?utf-8?B?VnAwRVdxL1VuS1ZnY2Qzc0NmZld1TVRxVUIwNUs0T1hvSHVzTDQ5MHkxcFRO?=
 =?utf-8?B?Y3BKbFRkM2d3QkM3Wnp0RG9Qb01WTTNBejNhWEwrV09mRWpGdVR4MHdrUWlO?=
 =?utf-8?B?emJ2RzIvOUNNRUh3Y2FqME9OZXJNb3dwV2gyaTNzaU1IWlBJQ2FXbWVMUDNU?=
 =?utf-8?B?akRISUpzZUp1aTIvR1NrbDlnWWdoTkhnVE8yNVZob3U2dGJjVk83VlpWWFZj?=
 =?utf-8?B?NzMva0loa0Rqbm1VZkFKcEtvakJoamQ1Y1JOb093R0wwbGhnLzdLb1QyLzJt?=
 =?utf-8?B?bWNPMHdES3BFR3pqQytEdHNGR0xDaXdaWTluTDdmMEU5cG1RbUh6K2hPRHFQ?=
 =?utf-8?B?TGVlU0tkVzhiZGFsSTl5RnNuenpwR25pUEhWN3hYSjQxK0pPZ016bUxXTW5S?=
 =?utf-8?B?b3NacnFVL2FSdjZhYWtyZjQzajZBTlJaZGowS2J2VWMvQmZMUy8zbzhuZ2hE?=
 =?utf-8?B?QzRRdWVRQ21KWllCcTJ5OUppWnk2UEcvOXQ3OWRvTDQwK1V3NHNUUm5xdzlj?=
 =?utf-8?B?NnZHSkJlOEFiVmROSUNQWWVITHRLSkdiYURDU1M5YUdTR3pxbkcxS0RtZ3k2?=
 =?utf-8?B?enpUUkVNVTZwbjF4Mm4zS0tadjJyMm5hOUVjR2gvVFJESXR2RDVCWHhUZzg3?=
 =?utf-8?B?cXhaWU1NdjIrY3l1QTgxMzFvakd1bllvUzNCbUl1WVkvdHpCMnpRSVZ4a2FL?=
 =?utf-8?B?SXVjNEdac2lKK1U5WWo2b1VISVR4ZWxreFd0VE44YVlDV3Z3WHVzMmZLVEJD?=
 =?utf-8?B?M2NlZ2RJcmszcVUvSDAzRG1zcHd6c0R1WWJCNlovMCtVL3d3Q0JkeitjMlBP?=
 =?utf-8?B?MEtwOGt0TWZ1eW9mUUlLQUxQSmxVUHFYWS9hckRxVTlsV05tWFRCU0czVzRk?=
 =?utf-8?B?MGxIS1NVNDdZRUdhRWE4Y2ljS1NGaEI1aFEzR2FLeFRHZWhrd3daT1JJMFNT?=
 =?utf-8?B?YUNNVVMyOTdSRVJxSENlYUllek5vRjNuL0hvRnZ5NjZRSFhHTEhtZ1FmVDI2?=
 =?utf-8?B?cDM0UGhjSlYyelhmb1IxVnZ0Nk9ZNGtEb2hOUUhya0ZpTExkSGVCYnRrQ0VV?=
 =?utf-8?B?MFE1eXk0bDRRTllmYmRHUWNpOUVKUXplNDl2R3lubWQ2eUNKYTVpdHczdGhM?=
 =?utf-8?B?R1N1TjIreGdYQU1PQTJXdXU3RndEbXNpM2dUNjgvanloZXFmNksxeVlzaTZz?=
 =?utf-8?B?UUQxbUl6dkd5TTBNdXFhVWluK0xQZGRaRGNKS05ucFdCTHRaQzUxQS9ucTNh?=
 =?utf-8?B?bDJwSHpUVEM5bkFYdHJCTlRpNkdhb1RiTjQ3dEc5SlBncHkxeUk3U2ZQRWFD?=
 =?utf-8?B?cU5zQ2Y1V2lVYnNuOXRwUlBvek85ZnQzNFFKbTUwOGxtRDVSWkgrNkhFTWxI?=
 =?utf-8?B?NzFISGNZaTkraERPWm9KSVZmWUlRWHIxUXoxUnJpU1l2WlYzakIzeGFDbzl2?=
 =?utf-8?B?cUhnc2pqTjVLWVBkT2EvMVlsdDZpdzNnRm1tVXFVTVBRMDdXR0tYZ0RPOVBT?=
 =?utf-8?B?ZGM4NG5vek92SEk4VzdTb0NpRTVHbGYwTGVic1ZuSitTd2tVVTRlUmZxbEk5?=
 =?utf-8?B?eHJNdHk2VmlFYkhuNUFxVzV5dVExYVFIZ21MOHZKckJqYWNUVDFZQmxUajQr?=
 =?utf-8?B?Q3M2U1hVdGFDR01OS3k5WDNqeW1naU43d1loQmZvTHd2ZWRlTXZ4ZDdkb0Zo?=
 =?utf-8?B?M3crQ25ZY0ZsMG50RVlIOUFDU25mOUhQMklwUlRJUm05b283emlWK2pvK3Rr?=
 =?utf-8?B?bVJ4MDJXNndhWWVWVEMzd3g3YU5iVCtUb3BNT1BBUHJ0NnZRTmNZeTlMSEpi?=
 =?utf-8?B?U2hONFhrYXpKOHFreTE4aW5CdVF1Y0FaNXQ4bXAyTGpPVmVvcVUydjN2WnF0?=
 =?utf-8?B?VnhacVNZSElUYWV0YjlXNVkxTGxibnBDdVdsNzVOcko5RzlCR2FOQWZ3ZWtF?=
 =?utf-8?B?LzVteHhFZzdEd0dieDVEM1EzUzdjT2llY3BoM3JDb1dOdFY2SXMvNWd3OE9h?=
 =?utf-8?Q?cRuI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHRBZmQ3VFV4UkFWS29ScW9teHBoWTFPcHJYS29sQkJLQVc4OHpGaENyU0g5?=
 =?utf-8?B?NmdPbS9QRzA2ODBvc2kvd0hUZnRIYm0xdCtkWTVuM2M2VWpFeHk4c0d0WnBw?=
 =?utf-8?B?c004U1dxNkt1Z1k5RDVuYkhGTS94Z25RSm9pNG1GQU1qczNIc2lHRjhyam9r?=
 =?utf-8?B?RVFaZCtDM25LM0taMkFHeTBPUWNRSGNJbFNVbHJhT3JSaWJkS21scFVsVE1s?=
 =?utf-8?B?T1NRNDNwb2NKVkVzQlhLeng2NjhrU2JEUFVzZkh5RnYxWmVienNDTE4xRTB4?=
 =?utf-8?B?Q01jeFVqSmQyTnZodTR5YUxCdHM5T2IvVGdBOUJsM1FKMzhzVEpmY0xNUGNC?=
 =?utf-8?B?WTBNaEdrNzRKVk5JZC9PV1h6RWpDbGV4SldpTDlQZSswSWRuSmE0K1ZnVEIw?=
 =?utf-8?B?MkVYTGJwd2pHTGs5WUlnZWdaVEJIdytObmtaWXJSaVo4SG9laCtqZ3RyREJv?=
 =?utf-8?B?RnFIMDNzMmZGU1ZnVmVmUDhqbXEvWk1CTE1oekl1dkJ2Ryt2alRNNEt0aTRk?=
 =?utf-8?B?SnBVMEJyV1ZEbHpRR3ZsVVBMamRYdTFUalZyRmxmWlduZWswWnBwYzdFdi9x?=
 =?utf-8?B?UEZub3dXdmozcGl4UjE0ai90c2I4UzU1Z3lIR0JsQkRhRzJIL1ZCZlhjdmFS?=
 =?utf-8?B?c2tUN3ZXdmRleTkxTkl1VlRxU2NNbjUwTkUyNy9MeXpSaEZ0aUlvVTVndU1L?=
 =?utf-8?B?OFVjVGdnSmh2ZXVpdUt3emIrMWkxMkZLN0VMOU1RcXF6SGhqTDhhaTIzb3d2?=
 =?utf-8?B?bndyVDhXcDAvcTFjT0RCSDlvWWZscXpvT1FaWHJ1ZDM1WFAxRmdhRE1VbXZ2?=
 =?utf-8?B?b1duaUgvZG9MMGFXMjY2VDB4Q2JvZm5nMG1acmNmZ1NXczhYcCtaZFlESTZ6?=
 =?utf-8?B?cmNTNFBnMDBSenFRN3AxOTd1bjdyUzA4dXZPQUZKZ0JaSk8reSt3bS8rSW93?=
 =?utf-8?B?aGtSYk9JUGx2MmJUMUNvT3dCbE9sV0J5ZEpGbDMzejZRVk9zdTJ5WTA2eGs0?=
 =?utf-8?B?UnhjU1d3YUNzajJFUE5idUQ2eUNjelM3NGRBV3BGVlduRlBrQkJSSk1EWVFk?=
 =?utf-8?B?MGQ2aTAzRndzd2kwSHo4STNYamRDeFZheCsrQXJrR3k4YTFaUzRSenFvMlBB?=
 =?utf-8?B?UmUxUGpuemM1Ly9BZEE3VXYxbFRjVWk2dDdoOFZXM0E1MWMrRG9oUlVibytT?=
 =?utf-8?B?d2xXQzVIZmdacm1hdzErbDhwR0E0eVVDZmNpbVJMcEQ3OVJybm84VnJia0Y5?=
 =?utf-8?B?QVZyVktra3g1alFhd2VYWlhrT211Rkg2a3BtYnljc1daS2VoKy9rQlllNUZt?=
 =?utf-8?B?RnNDSDNCbzlld1NWOFdVeWxKcGNpcmhXa2h4aUEyUnlQT0g1bFB3ZTVqTTd1?=
 =?utf-8?B?Ri9RUEJJTVc5TCt1N3F2anpXTGNGMmV2cG1ZM014MzRzcEN0MUFHdWNoNXFz?=
 =?utf-8?B?MFBvbHc4Vmg0OHBiakh6WTE5OUtpc0xyZDF2RFl0dHpnN043VmlkZTVyRVVt?=
 =?utf-8?B?N2tyQlhFRjBqVUViU2pjbUtiMk9yenBkR013K2NOaTRreThpUGtKMUVteG1E?=
 =?utf-8?B?Z3hWNzFjSkt4dlBLZ1F1U1NpMmtRSURkTG93dTEwaU5DNHdtRWVxRGdJeXdv?=
 =?utf-8?B?a0hTT3JXWmlYQ29zYVp4M1l1andDejFsYkw0RUhFYzJNc1RCVzZsRTBCRmQx?=
 =?utf-8?B?YWxRUkFVTVl3T0tnTGV5VDd1NFpPSVFETFphdUZPcFhueVk2bzVndWU0VXl5?=
 =?utf-8?B?MUgxT0NMeW1rM0lNc3hjeE9qa05BR2wrTVZZdjZLa1hLVnZOZWdBaThvNmJV?=
 =?utf-8?B?NkpmRzFadTMrL3lKVC92blFIR0JvcWpVb2EvdHRTVjA5alhJMzc5b2Fab1lH?=
 =?utf-8?B?SFc0WVZsT3dRQkZIWi96WURoMUNRUGpib2d3M0FYcVFCZjZwZ3FuQjlabkgr?=
 =?utf-8?B?NnBGTkUwYXZxT1hQMU9TZnNuemVETVQ2UGdLWDdYcmxrS0RDY1laVWp4Ykt3?=
 =?utf-8?B?cUl3OUpDb3U4NXhTQW5QNFlmNTlVN3Fpbi9MS3NKRmdhM1crTzJ1MDRqVnQ5?=
 =?utf-8?B?ZEJlblB3NEt5bmxPMUIvSHJ0UVJmYjFLKzM2bUlFbUdDNVJDUllTWjBhdlNM?=
 =?utf-8?B?R2w0N2JmallzZmVjTW5hU01RcWhJWmo2ekFyeUV1REFyT3k1S3FHdEJFU3lh?=
 =?utf-8?B?YlVpZEl0VU9kL1JJRjErSFZORWFpOGVEMlJaNHBIdWJNNUNIcU9YZDdIaWo2?=
 =?utf-8?B?NWRyTkF6TmQzM2ljblpKaUpDTkJ2OCtnajAzeXlCMVNmL2pZVHBKVENwUGw2?=
 =?utf-8?B?WElTWUFFTWJWRTJwdU5DR0tSYWtLQTRTdVp1Ujg1Uk5Ua2FwVGluUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 84acbeed-b05e-4e10-f7df-08de633c666e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 15:53:40.1985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcMMsFa104BtcClOGYJdtpYSEHXtfI1R0jAtlTSApcPlvZOu07vLCtNp9nEwg+EIMhWdrB8Br1MQ2LyYL69YcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9189

On Tue Feb 3, 2026 at 3:28 PM GMT, Marco Crivellari wrote:
> The C code defines 2 new workqueues: system_percpu_wq and system_dfl_wq,
> respectively the futures replacement for system_wq and system_unbound_wq.
>
> This change introduce system_dfl(), that use the new system_dfl_wq.
>
> system_unbound_wq will be replaced in a future release cycle and should
> not be used.
>
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  rust/kernel/workqueue.rs | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 706e833e9702..300cc2bfe012 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -968,11 +968,25 @@ pub fn system_long() -> &'static Queue {
>  /// Workers are not bound to any specific CPU, not concurrency managed, =
and all queued work items
>  /// are executed immediately as long as `max_active` limit is not reache=
d and resources are
>  /// available.
> +///
> +/// Note: `system_unbound_wq` will be removed in a future release cycle.=
 Use [`system_dfl_wq`] instead.
>  pub fn system_unbound() -> &'static Queue {
>      // SAFETY: `system_unbound_wq` is a C global, always available.
>      unsafe { Queue::from_raw(bindings::system_unbound_wq) }
>  }

Hi Marco,

The Rust change looks good to me.

Reviewed-by: Gary Guo <gary@garyguo.net>

Is there any reason that we cannot migrate the user early by just returning
`system_dfl_wq` inside `system_unbound`? (I guess the question also applies=
 on
why system_unbound_wq cannot be the same pointer as system_dfl_wq).

Also, I feel that `dfl` is not a very intuitive name. I searched the list a=
nd
the commit history for a while and cannot find the exact explaination on wh=
at it
means? Does it mean "default" or something else?

Best,
Gary

> =20
> +/// Returns the system unbound work queue (`system_dfl_wq`).
> +///
> +/// Workers are not bound to any specific CPU, not concurrency managed, =
and all queued work items
> +/// are executed immediately as long as `max_active` limit is not reache=
d and resources are
> +/// available.
> +///
> +/// Note: `system_dfl_wq` will replace in a future release cycle [`syste=
m_unbound_wq`].
> +pub fn system_dfl() -> &'static Queue {
> +    // SAFETY: `system_dfl_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
> +}
> +
>  /// Returns the system freezable work queue (`system_freezable_wq`).
>  ///
>  /// It is equivalent to the one returned by [`system`] except that it's =
freezable.

