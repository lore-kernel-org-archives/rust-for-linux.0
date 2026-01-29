Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021081.outbound.protection.outlook.com [52.101.95.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A176D34A795
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707498; cv=fail; b=F7cN46BK3AUHwcI5NszJ96DqKcFexsZ34P1Fwj4dv7c8Ir4IPcJciz5L1GYHDhYxg0bwodVhpNsfcVKrhfYgAksKwI91b8f1CPz1jqSkDLpv/WaxanriN1+Hp3ogyQlrm6uP3Py9GABtpB6tE7jcOF8CnIIHCixgFihVoION6iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707498; c=relaxed/simple;
	bh=9G9dlWtRfgBXlsHhA3YfXRBiDgG7ydjlwo9UWVDKXEI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=tewFV2xgIz70RdXurAa2ymoifbnYFsZD1opCteGFhMwMfwUHYtTFDhZtAVLX4aQoz4EVquToX8SlT78o1vvkLSzNMtiUxJHgahtoApCTyjKUtYqsLzeqAi9ArM7IfAGZ/ZPfyLIB8PcdBVneAM7INY20pDm1n7IMoD1iXhETa/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=RFN19Kxi; arc=fail smtp.client-ip=52.101.95.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="RFN19Kxi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tD+7bP3rH0yIhHZEMrXWaSQNGtdRYVPwmnKxHeh1SxsykSjM1kK5vl4omTSdxZvnGFTtLZA9ggQtd817L+2Hgxifa7jn1ktpWleUvPswtWyTglWdtNYcXDx+RwhwmG8ohiT7TG8DSZRXUGLbPBJQJP136NyL72DPrFrnUExXadb+WFfA6YzxfkejgrLQWZfNfMjSIAzJwdrAiBpWPf50gFWAMdNOjne1l5ivKkO4q4sNlmOVtwDjeWYxIMy6HjI95O8brQVEvhfUWhIp0fDwYwi3dY2tOBrPL3pI1am9fsJXAu/Lv5ALM69aYAJl7Fr6nzSWBcSyjdD61U+viQOP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2I/2iObXERMp/YEgjQBB74OG11Iw36zzGIhHR1kf59o=;
 b=oyh48bAvGWIc7YKpvBXYn585IwQJvSG0wCWcThDPgYbkna12Q8gp4RZ8mLutR/K+8LGvip23tXP4gGCpYktydQqYN439f5N9N4WczI/ZPaOzTJTl9vzuGJ6jolGJA7rfgwckTiwc7Z23OLw2Hg9d7yBiXDGJH8fYUu7I0UlL2PxoAsSmf0F6+qZd74SdufSm6V1gLGg6APLiPCTuYz1/MBErB1BgEqcFv3nPs6Mik77FRpOgf04wkujQGXCllgYdeCATXRc7oLpDm3YmstFqLomGAok9u8qz8Jys4Y3iII5I/P7eastR1GFQfAhCX/rCjzc/BNyoMcJEKlYptLhgcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2I/2iObXERMp/YEgjQBB74OG11Iw36zzGIhHR1kf59o=;
 b=RFN19Kxilgo2y8SSCORhxtREMmCbydh1BshLZ+MX1FgDlBIBwNTOMTASHAXNlz4/ZimN8HPX0OdjduhdiZk2pxTtA1Jo+PtWHumI3+sBRi9TY+qDmjVwXyxZVUeKgxEQPippg9NQMYyiFYzw8iJGIF6Rv9sFofbpLqHoShNf5Do=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6923.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:323::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Thu, 29 Jan
 2026 17:24:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 17:24:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 17:24:49 +0000
Message-Id: <DG18Y53B5OWJ.147OR1P201GRJ@garyguo.net>
Subject: Re: [PATCH v6 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Alice
 Ryhl" <aliceryhl@google.com>, <mmaurer@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-3-ttabi@nvidia.com>
In-Reply-To: <20260129022837.4133832-3-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P302CA0042.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f1db73-c1ba-487e-251d-08de5f5b4e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWFYRkxnak5ldkdXdFdLMWdINnR1a0c2ZlF1Q1o2dzFvK1NiVjdiaVVzV2Rw?=
 =?utf-8?B?czFsY2xIS1Y0bnZRRllhL3JnNkNXbjBzaXF3MUlpd20rR2pUOE9oQTFxRWsz?=
 =?utf-8?B?YTdwa2lLZ2ZvM3JXTEE5a21OQ2JuR0grTlFKQXA0S2thbU1Za2RaUVdqQmdh?=
 =?utf-8?B?bXFOalNhSXpBZDlBdS9FbjN5MTlEdkpJeHgrN1VCMWsvYzF6K1VDMWxNTUhU?=
 =?utf-8?B?RVplQUFmUEpMdzlBZlJoS0lwTTJhc21xT3RzUEpEa09TUmtTZEcvKzdBZUZt?=
 =?utf-8?B?a09vOTVJSHB4Z094WGVNblRCSkp2UFFaSGp4Y00zZ0huWXV3azY4dy9tMTMy?=
 =?utf-8?B?Qlh3d0FNVDZOVWoyekJWbi9ENzE5S1JBajlIdDJvSEhFZ2ZPdWwrSVFqNFNI?=
 =?utf-8?B?VEY3U21oOTZBa3pVUVg4MXdqbXR3ZkxQS05RTXJLbkNKam1qMDB4NDFlZjhn?=
 =?utf-8?B?aFRwWXVKSEhPRkl4UjBlQUozbEZVNTF1blc2dE1oWDN0TG5hVXl3MGlMZ2J6?=
 =?utf-8?B?djQ1MTRZVTZoKysyYzhCdnZ2UnNISWRwTjdqU0JhdTMyMW90ZmViWDQ3UGEr?=
 =?utf-8?B?ZUVXdTNHV3dUNEdJMG9VdTJkekQzN1dudWpUekZLV0ovK1FtYXlVM0RNMWV0?=
 =?utf-8?B?bnpMRUtKT0wvKzdIMUpFWGxVR3lrc3JLQ0EzclIzN2dObHdWVWNHdzVHVVpK?=
 =?utf-8?B?b2o0NWlGUXhCc25ZSUpXeFdVaTRJa0w5Y0UwSXFYc0JXbG9LSVpKNjJiMlYz?=
 =?utf-8?B?NU9WbC9uQzNORFE5SjNrUFFpMEN5RHJZcmd6NDAzdmVSanBLSVJDejlQNmdU?=
 =?utf-8?B?a2dYc2poVWpsQi9ZUEtCRUw0QkpNNmlnU1B3SjVPbSsxeGUwSmk4UHNpWVpK?=
 =?utf-8?B?RittaUdSN3hLY0NqTk9MMzB4eWg2RVQ1aitFSHVRTVZRTGlzQjFVeFJYN3Az?=
 =?utf-8?B?YU5ERy9kenVEdkdtTDVaOFhKTkVhazNmTjYxT3NsQXlhSVhTekMydmZVRmlU?=
 =?utf-8?B?eTRuV3pZUFd6eHl6S010b21DbHNRYWF4NTVjQURCZmd0L2phQ3RwM0lyKy83?=
 =?utf-8?B?czU5U2JmK3hnbHFqNjBSLy94ZGJrZUlKWTE5V2xabHRrbERGSmZTZm1OcTVB?=
 =?utf-8?B?aFA3U3ltSUZYQm5KYmg0SWhMaUplZjB0L3FUOGVsTVE4OTR0SE0rQkJGU2lm?=
 =?utf-8?B?ZUNzNm5IbVQrblVoZlN4d3FocXQ5VWZkeDlzdmQrZHVJaFN5aHpRZ1REdVdZ?=
 =?utf-8?B?R2t4NWpGemJoYkZiUzhUUUMrWGZpbHNEMERLU21BN0JhVnF3aHYrK2xVMmlI?=
 =?utf-8?B?NkVBb3lvcXN2S24waEZFNXdVc1pZUS9hb3VLWkZ3UGVmTVBUZmJNMWdPMHM0?=
 =?utf-8?B?c21RWmMyK2lwY1F1b2dzZXcyeGFMajI5NnVIaVo0MnViYUNxK1BJSWdIT0ZZ?=
 =?utf-8?B?TXlPZGtUVndGMFl5UW5DdGFxWmtjQ3JhTTBnK3lyNjRkcUJicndmMkl1UGtE?=
 =?utf-8?B?UW95OUFPU01ZZEd3UzNCOTFrZ0E1eGlLaTZRTDExYmVGd05mNVhpSCtqUjdi?=
 =?utf-8?B?OHlvWmlZLzNiMitzU3VkMWFDYkFKUEYyd2NjeS9GMlBxOXBRMldvSzk1Q2xU?=
 =?utf-8?B?R2M3WlZUekhwZXRxWEM5VU5rTURiUll3VFM5ZS9RMTkwSW10emEzWlk2U2d1?=
 =?utf-8?B?ak1nM2hIQ2V0U01wa1FqcFM2TkswOXNnU0tzRWdVQjgxQzdUZmh1akZ4N2R2?=
 =?utf-8?B?MVMzbUxoOTBTMTF5MFZ3TE5Uc3ZHS01tZmlTYk01b3VyOWR5aFZLSklKc1U2?=
 =?utf-8?B?RU9MQUNIU012WGUvMWR6YVRnYlFLakJTMzV6ZTRwREswdjd5TXhFME5FSmVp?=
 =?utf-8?B?YTNBM0tMTXlCZS9vYVlrSlA1eXQ3MmhIeHk4QVY2TEtneUU0RExqR25QdFB4?=
 =?utf-8?B?Q2tzb29JWENSZlR1QmpUSVdSSE94MFNNdU0rODhzRytDN1l6OHkxbHNxMjdl?=
 =?utf-8?B?TlJIWHJWS1pKME4xNHFkR1ZVSkk1MEN3ZUMxNWlNTmJOV0FxU3BCUmVNTWR1?=
 =?utf-8?B?ckxuNUJDSmNtc1NsQjNZYVl4Vm9yUTI0L3pJZVhsRHoyNVNRYXI2eXExc0VG?=
 =?utf-8?B?Z3phVGpkR1V0OW9GN3hJT3g5UWoza3hFZWdWM2hNZXlmeGduaUZjeGZoZVpW?=
 =?utf-8?B?WUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGtlcmp0R001QzRETE81ZHM2YlZpK1JObEt5NHk0ZTdOZXU1VFBoemVpcjdp?=
 =?utf-8?B?ZTU2NS9GUE1LY3dlcEQ1SHRDT1dJWSt6RHFDUGwxZXhzaXlLbnZkeUhhYk5D?=
 =?utf-8?B?cEJrM0V5SHRyaWlHU0lNRVRWYnNJcSttNllobW04UW4xWGM1a1ltM05ET25S?=
 =?utf-8?B?d2hGSXZNWDdYaDlaUytkcnFkeEZZcDI4bGtKMDlFTS9jc3VEQW5wU0hVUzBS?=
 =?utf-8?B?R3RyMEROZExVaG4zeDVQZm9FdkNMeUkvT2FqZDlxMEkyMjVuQW92Q01tQ2FI?=
 =?utf-8?B?aWdQS2d5clYzNmJLZERmWUhrRjUrbldNTDk2OGJubStrQUJnYkZVWVprdzRa?=
 =?utf-8?B?Q2ZzakxmazBEaW1DYXNYTWlKWkV1U2dXU1ZnSWZJOGdkb1NJTzY2R29YT1g4?=
 =?utf-8?B?VHBkMXR6dXZuTWNmT3R2ZUVDQktQVDR3bFBwMzRoQ2dDK1lHZVp3clNnek9r?=
 =?utf-8?B?L2JQM2VFNk82L3c2dmRlTXBud1lwcnRWQlhVRk4vd1l6dUlQbmtPbldxT2d4?=
 =?utf-8?B?RmV6T2wzK1FMWTdnYmtOU2gvVUhHVUtNUStTYkpLZ2tKeW1BWnB6OU9RUmZx?=
 =?utf-8?B?WWh1UFNaZE1rRExsQXhMMENEblV3QlVib0VsbkVoMVQrVXg0eUpFWlVNd2FE?=
 =?utf-8?B?TUMybERnMUc3dmdZNzJyMTEzRVZoNmIyNEtjdWNNbkJwM2ZqZmVOV0pxQjV0?=
 =?utf-8?B?MEgxMzh6M1VJc2dtRzdSY21vKytNdkVFRWMwSW4yQU5hL0JQSHUva0YyQnpv?=
 =?utf-8?B?bTdMeHp2YkJYY0JQZUxOVnc5amd2dGtBT2c5aCtQcnprYnllQU8wck1yR3ZV?=
 =?utf-8?B?Q2xYV0FnUGhNdHJsUjNsdGhZQlNvb2FYUVBkNitvNExYcDZnS2p1dGFSTDJS?=
 =?utf-8?B?Qjk2bVY1WXh5eVJZK0lCVTduUnkxNW82aW5RS1NhMDBHUXYybkh0eXNIbk4x?=
 =?utf-8?B?Qms5b1N0REdtUzA2dmM2YjhqYVE0RUE5dEM1WTkwVnVsSXdUN2VQSjErdHFY?=
 =?utf-8?B?bG1yMFh1ZXFYWTdETWNYYTJhSWVzMFh6WTJEbTRGQ3hUVXpsTGt1aFluMmNG?=
 =?utf-8?B?NUtTWnR5UW5tSnhOa0g3czBJeWtqK2Z1aE84UFJ2TTJXK2N6VXdUMEZ2TXp5?=
 =?utf-8?B?V1VBZHQ4emRxcFpkWUNkMXE2aGdTMGc0QlJGdVdnL2VUL1phdlFDUGxiMjdR?=
 =?utf-8?B?UkFodGpOK25JU0ptVklmQXdXUkxJUDAxUEhpQ2plRGJtNzRValNxcVVXNVIr?=
 =?utf-8?B?WHJCbFRmNnIwTGVDeSthV1hESzB1UmN1RmgxUGt4ZCt6VlkwRVFSM2JVMFZY?=
 =?utf-8?B?VGY3dGc2REJDaUwzMGQ1RktIcGhmZE5wUXg2bEFaOTk5RVd1SnJDcjdZK0dM?=
 =?utf-8?B?bUpLTXNaL1hXYklVOE8xd1dHd2JIOU5DUkFXZ25IZ3F3bHlNMEUrcFBEOFpY?=
 =?utf-8?B?Y1FraWZta3dDbmllcWxHT21ack1vREt2a3c0cG5NSlQvWllqU3NNLy9nbVI2?=
 =?utf-8?B?c0M1RzZGcU54Mkc3aTZYUVh1YzJkSFk4S1lvTzNRYjY0amsrNU45UHR2czEw?=
 =?utf-8?B?SG02dFd3NElUKzEzbGs2a1Axd1dOalB6a25lT1BZRlpyZDluZDVld3lwdi8x?=
 =?utf-8?B?dG1wVGFBMllKYVdCT2N1MkRGYURWOEZWbUZaVDlocitJcjV3cFlXM3d1K1da?=
 =?utf-8?B?Rkpmd2ordTZsMlBLbm5TeU1ZR3M3alpIQ3Vwd3Z4T3g5dGZUaHF4ZmhOeWQz?=
 =?utf-8?B?OERZU0pCTW1sMGxDc3M2RTVBS1hpcW5HWG5rVjB5UXMwOG1MaWVyRGpzYXRT?=
 =?utf-8?B?ZEtzUWtQT1hNb0J0OHJPbUMrT1RJL1h4ZGIrTnJFRlRRK3BmRUY4ek43RkhV?=
 =?utf-8?B?NVRXTGFBU0NRMEgvQTBpZVhvaFpiZU9ZajVyZncyaDA0dE4yMU51SytQeER4?=
 =?utf-8?B?bVBKWTZrU1RRUFhWMUVRdW9TZkN6ZTQzNFpDaHB3cUxaVU0yOEZMREl5K1A1?=
 =?utf-8?B?cExCanh4Q0RFL0YwUEIwZ3pSSE8ydld0Wi9XYUp5SGsxSXMxRFZubnoydHVS?=
 =?utf-8?B?MXgxc2s1a1JWaEhiTVZHNnVCclZ4OVNqUHpTL0hqeXg1eml5K0JKSm43RFZG?=
 =?utf-8?B?NWtZVHNnUW5GYzFPd0YvZW5CQkt4Ulo4MEJVUlVTV3ZFQzl0TXhDRGc3aGRU?=
 =?utf-8?B?ZUdVWldqSVRkYmtmYmVRQkxabXErRUxaZndLWk5RU21BWlJlcWZPS2lMcHNJ?=
 =?utf-8?B?M2JuQlRGRkpoenhqTlduUkhDNHpaZ0kvSFliN2lPWGRRdzBrbXZ3QkQ4aUY3?=
 =?utf-8?Q?5O17gNEiQ849Rs7qeQ?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f1db73-c1ba-487e-251d-08de5f5b4e81
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:24:49.8540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYjeoJudTxKuN9f69S5OwNGy5xk4GDNgV+t7hcMk/uiG5TtMC09dP75O3NKNjkC7+dZuODnLUr5OpzbTkH//Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6923

On Thu Jan 29, 2026 at 2:28 AM GMT, Timur Tabi wrote:
> Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u=
8>
> to userspace. This provides a safe interface for copying DMA buffer
> contents to userspace without requiring callers to work with raw pointers=
.
>
> The method handles bounds checking and offset calculation internally,
> wrapping the unsafe copy_to_user() call.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/uaccess.rs | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index f989539a31b4..f9bb88e47408 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -7,6 +7,7 @@
>  use crate::{
>      alloc::{Allocator, Flags},
>      bindings,
> +    dma::CoherentAllocation,
>      error::Result,
>      ffi::{c_char, c_void},
>      fs::file,
> @@ -481,6 +482,46 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result=
 {
>          Ok(())
>      }
> =20
> +    /// Writes raw data to this user pointer from a DMA coherent allocat=
ion.
> +    ///
> +    /// Returns error if the offset+count exceeds the allocation size.
> +    ///
> +    /// Fails with [`EFAULT`] if the write happens on a bad address, or =
if the write goes out of
> +    /// bounds of this [`UserSliceWriter`]. This call may modify the ass=
ociated userspace slice
> +    /// even if it returns an error.
> +    ///
> +    /// Note: The memory may be concurrently modified by hardware (e.g.,=
 DMA). In such cases,
> +    /// the copied data may be inconsistent, but this does not cause und=
efined behavior.
> +    pub fn write_dma(
> +        &mut self,
> +        alloc: &CoherentAllocation<u8>,
> +        offset: usize,
> +        count: usize,
> +    ) -> Result {
> +        let len =3D alloc.count();
> +        if offset.checked_add(count).ok_or(EOVERFLOW)? > len {
> +            return Err(ERANGE);
> +        }
> +
> +        // SAFETY: `start_ptr()` returns a valid pointer to a memory reg=
ion of `count()` bytes,
> +        // as guaranteed by the `CoherentAllocation` invariants. The che=
ck above ensures
> +        // `offset + count <=3D len`.
> +        let src_ptr =3D unsafe { alloc.start_ptr().add(offset) };
> +
> +        // SAFETY: `src_ptr` is valid for reads of `count` bytes per the=
 above.
> +        let res =3D unsafe {
> +            bindings::copy_to_user(self.ptr.as_mut_ptr(), src_ptr.cast::=
<c_void>(), count)
> +        };

You're not checking `count` against `self.length` in this function, so you
perform an OOB write to userspace memory.

Best,
Gary

> +        if res !=3D 0 {
> +            return Err(EFAULT);
> +        }
> +
> +        self.ptr =3D self.ptr.wrapping_byte_add(count);
> +        self.length -=3D count;
> +
> +        Ok(())
> +    }
> +
>      /// Writes raw data to this user pointer from a kernel buffer partia=
lly.
>      ///
>      /// This is the same as [`Self::write_slice`] but considers the give=
n `offset` into `data` and

