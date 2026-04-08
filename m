Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021124.outbound.protection.outlook.com [52.101.100.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C613B9D9A;
	Wed,  8 Apr 2026 11:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775648033; cv=fail; b=kaIpDO5zfKbeV+I5oGAvDdKRsoOAN2QAK23EGtpOyLmNuAGb2tTDM63smYI5DIqgT2IpoVMztXYYSy3lHgMkLmaRNWNEenXGpVUuTWkMvu3M2EYq8fiYmsVLZeScCtTN9YEEAmTVRseECibXVEQjDsHy8I4zwMlRxONCcEh6fFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775648033; c=relaxed/simple;
	bh=k/mAmWX7UumMtpxMFYvPxe3Yxm9EXcHOKBZ626ZFe40=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=QAs/OhzUaL+jj5xn8GcjmHa+epMbRb0PewIrUueNHdz3N/hLE1Glc1E4pyfgnJ2/A+3Z2hxZqYIE/oRKHaWFPaJXtqzwT2bP1KlSL2H1qifOJXq9ejH+Qn+gxx0rqiM3AFOqFxn2BSGiFScHG08Xl62xUl9JUC1k/Obi52ZtMBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=WeKUOndU; arc=fail smtp.client-ip=52.101.100.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="WeKUOndU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFyj4qXKwWlXRTwCJXYvTJFYtXev+1Siw0g4XxT+2cJyL/eDE0NcThX1QyQ8XN1AkBqBOI/tSuzm2pN+nApNxNkQG0rEsbLdLbxJx1JUAmAF7Nf30A3SihZsGqLCZjKCc97eY2LyFLX93nv3lhi7tZQ5SUMLOLM68J6s8B9Oqthtj1sRrYo9drxEbBay7FnWcJj4ZYTG4keW40tFiZ7NP+fgwJ6EhmwETdVroX1xWZt4wTmpEC1Y+elpwhdB6kh5BWi/GhhDJjdM6+3F1nbWn4ueilCsnJ77PrQ6kS6lw0+EV5hgXMkQ+Q7CT5P0weAVqzsx2S7uVgSkhP+ET4Z8iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAKIhiQNhrCBCTMEg1g+8MTvHxJNbBmjj7PCj1vrOm0=;
 b=nANJo2t0OjQ+NDRJdANHNPyit1CjuU3ZT/MRqluyTmj2m0hQckGt88xbFFERk5OhwBFF6vwc8QP3XL9B2UXQs9+sYhMhzfFigIgGHAHUasWBzqC5/WxjYs4q/Yk30+5J76MxukFyE3DMnCMHwrazpRyOx0jtUSvlG7BtgQjAGIBouXyfX/BQBNoOhVdZ+HCJ7RJfvxdwgez9eq7aW9OgHFdmGyMG4m1g1plh+y0rM/6d41+xQ13VwYUUtG96hu04aApYAv0UGazLMy9rBZ9Y05znO/nIHG4Zk7+xVCCqoHHUwqi8jbwCzxruYhFR3hZPkHd0zNjHdl/WxrvYJmKlQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAKIhiQNhrCBCTMEg1g+8MTvHxJNbBmjj7PCj1vrOm0=;
 b=WeKUOndUBJO3lgOjXaOFBDTL+4DKoXq1dwJnPyICnGUgoUUoszad9o5+bFQrDk0Y1cM2/pAYQ/wcdG7yxPAYV6hW4L82KCd5HERwnhkUpmx5DQh+zVs7ot2pV5sUN0ETRXeLZCuYoI7xjmZcwa6ojICSItdqMQng3B0vBycMNVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB9298.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:486::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 11:33:48 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 11:33:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 12:33:40 +0100
Message-Id: <DHNQOVBO1FAA.3LY8890EQ1NK3@garyguo.net>
To: "Ben Guo" <ben.guo@openatom.club>, "Alex Shi" <alexs@kernel.org>,
 "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang Mu" <dzm91@hust.edu.cn>,
 "Jonathan Corbet" <corbet@lwn.net>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 4/4] docs/zh_CN: update rust/index.rst translation
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <cover.1775619061.git.ben.guo@openatom.club>
 <0be03ec18f006837e45cf900eef4c653e2f0151f.1775619061.git.ben.guo@openatom.club>
In-Reply-To: <0be03ec18f006837e45cf900eef4c653e2f0151f.1775619061.git.ben.guo@openatom.club>
X-ClientProxiedBy: LO4P123CA0140.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB9298:EE_
X-MS-Office365-Filtering-Correlation-Id: b6159555-d17b-43c6-b353-08de9562b3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Cg2pVwsIaCmISJoSJpuF7vupnKkhVEydgz+LrLhvrftGwZ/w4X/EKYb/Rr33Qf6XfWkLFs8p8PaQriylx+YLQvSRUQJN1hT6DHp6brwCkhbAMmUC7+gakqdcjo2J/QTI7OX/wcnKwoiAKUQJgVfGfLNm0fpXeHv3HNBHlC5LB9P/l+3cZFi26aiqHcjPeQDamELeengK/XVclE1RYs24CgXnsipLI1TP2Ur8CxTNI79eK+OeFgVJWFelBOXdoqMLWUlemU44EQ2dH89pNdJCspxrcd4q7mUzkn4IYgLwQQokWdp/9Rr7efhMF7y2rKXIPDNkQR+7JOYWPmQORF9Q+2CyJjVY7UXaTGpjweqaBTlpUzTwLklBCyRMc596aks0hVU1/WvgXnbyN2jI18NShjFUTt4HZ2vhJEnK5nyOirE75L2wxJACpUyrzMsem936ELx+Y1KQ3uYCso6g/pMuq4TR3XZ5NC5I93GTGO05XReLwxuG/SNU3jJMRMQqRLM2zb1SWf3QLPS5qBJ45bgng1K64RpNEP1enZrwPUxUaaPsAWr1N1cd3vXabKiEot7TCxbQO2GxK9LQTwLm6ZOgzawA6qRCZdOPkO66EKW3d9pKc1PQ5ZOCqB2LzOk3GGSr8o3IW0yrQcezkVmtDT+qkim+vwe0xGZIIER7jsDDUNKUQSWl6Hi1q3/Qs/OZLj4zB4YXwLP7BWOmoDKmmWJWR8+XUFRfKDcU7lOOaYSRTCw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVVyUi9EcHZkVmkyMmxSSmtteHVldW1DNndxWTZFUlNVSVdsbmR3RjM2REI3?=
 =?utf-8?B?MXpBcjkvTC9Hc2txYmZKNGhBNzVDMkg3L1hudlkxYmVwdHhRNFhmWUNnUExB?=
 =?utf-8?B?RDJWeHFxYUdIRWwySzR1ZGM1K1JVL25ueFhzaGZCejZ3cVN2c1RiV1lMNmgr?=
 =?utf-8?B?MU9EZktIYzh5UWtvamhSS1ZwMU93RC9WMEtxL2EzUFdYNmxvdUdtVmI3Q0Fl?=
 =?utf-8?B?RkVpUEZJaVoyc2cyWHl0dDZncklXWEVHMERCMUFkUkxkTkFHWlNqbi9HT3pO?=
 =?utf-8?B?RTlWNTZLV2xyUTg3SjZkbERCbFc3Z3JycGdXR3pUY0pVbE9LQWt5ZXBiek9R?=
 =?utf-8?B?UEpsZVRhS25LNkRvUzREdXhKYzJ3dkdPVlpQQXIzSFcrRXEyR2s3eDNGRFkx?=
 =?utf-8?B?REdNRnF4NGpTaWpzZmlqbnpibWJ6aUxvWERpMUtEUS9JRmlEc00xdUlLOHd4?=
 =?utf-8?B?T0NOZUs1emtxd3N6U2tnSU1lSUpBVytTeC9hMmFyQ3pVeFdUeTc1ODVSM0Iy?=
 =?utf-8?B?eVVvQ2o5SVBkclZpMmR2QTkyc1k5M25YQkxMY3R3Q2dzQStjUlhXajdCMElq?=
 =?utf-8?B?TmZTT3FUcFg3Q0dvb0ErVTdML1U2eTkwNlE2MHFSZWx5OTdjblBOZCtJU3Yr?=
 =?utf-8?B?L2J4L2VhZlNvV3I4ZHFVNG5BS1hFOCtCVHpOai94MGExb0dodGhmMVQrMUN2?=
 =?utf-8?B?MERVdmh5K1dKd0JXOXg5S2daODExNVFjVUNHRGNuc3REU3VSRHhSOHlhcWE3?=
 =?utf-8?B?YXAvczBEa2I4Z3lLOEhDOFlwUW0yaVF2M2xlcFE4ZzVkWlEzN0RyZXVIMnRQ?=
 =?utf-8?B?cURSa1VrZUFzNms0SXVISWdwZ1lLUzF3SEJnT2V3Q0RqbGJyM0xaRmtZdzVu?=
 =?utf-8?B?c1k1eTNzYlhqWndtTndVbWFhL2Nubm1nSmtyVmRyeVM1WlYwa04yQ2h1bndR?=
 =?utf-8?B?THNLaC94Tjd2MkErbU0zUHNjVWdKRHVtM1lXcWs1ZS8vLytaVTFnTEdxOGJR?=
 =?utf-8?B?V3g1UnUwVlc1YlN3c2Y5MWVJb2VoSlhLUDUwUmJvQ1UvN1FXbTZpTjB4eUNJ?=
 =?utf-8?B?clgxMit0ZUdJNkY5Wjl2bE01WFVPNmRJZzZWN3NmbzJ0Q0RtWFBzVnNCTHpS?=
 =?utf-8?B?WE5HOU96N2U2c1MvNS95MmlaUmFBT0VzeitnNjcxcEdmL3VMZE1xNTNsR1lZ?=
 =?utf-8?B?Rkt5NlpDL0ovQzZNb0lLSnNqODc3WUQ5THhHa05Ncyt5WU9kOGxLVFMzVDZk?=
 =?utf-8?B?MkNMRk93QmNqMnhFOUJTTWkwcThRK2hFcHNzWnZsQVpLcWVITXJuZTB0L3ZP?=
 =?utf-8?B?VUFvQWRrYXhQMlBjdDdwQk9JVWxQUjQrdHZ1bGZPK2VFMElyOVJNdmNJbXls?=
 =?utf-8?B?cHJ2SndPYkpBTDN1Sm9QZjM0NDNpWEdhM2htcjl2YytITWxvSVQzMCtubVM2?=
 =?utf-8?B?N1ZYV2gvWm16dkVaVWdwVGFMWHdPWmZ0SzlPRjNtTUdDSmxiZVhzWlBHWWxW?=
 =?utf-8?B?L1Y5aVFOREhwNDJVVlJjTEJ1OFAyY1lVL1hrTS9tWUlXaDFHUTNDVDZySFcr?=
 =?utf-8?B?WGdlT3FRRHNUZnl0blBjTlNCNEh4TDVJalJFSG5TeG1VeTQ3eXZOemQ3bURL?=
 =?utf-8?B?ZCtJL24reVp0Mmlxd1U1Y0IxangwbDY3UVhaS2tMNG9xMWtFa05FZDVQUW12?=
 =?utf-8?B?VmYwN2RwUkJZNWdmRzZrMlRVQkpnSUx4SjdmdnVybm5wWk9PQ1ZzdFVGaEI1?=
 =?utf-8?B?blB0clpRRk93cWkzQ0l3UlpCbzBrU25waDZUWTVxc3k1VGNEMzE3MHNuS0hn?=
 =?utf-8?B?a1VCUDdkVnBBUjNYV0doSm5LZXN2d2ozOUxZRlNiVEZ1c0E3eUg1NG5QYSts?=
 =?utf-8?B?aXY3ZmMyRThlWStYOFZDQzFIQmNRbmNTZm5QZkc5c1Vmd0paN0N3MDNxOXJS?=
 =?utf-8?B?QzdHMndzSHc2cGtFZnBtU3pMUEMvVzJaT1E2UGZFSXBLNGxNOTFNOTFXUkNT?=
 =?utf-8?B?c3p0OWZaOXNoWWxNQ01FdVRjYlgvcnNzS3ordzc4VFhhWkdqYm8vblRkYjY0?=
 =?utf-8?B?QkNVRnBUN2JiR1lnTkZJZ3V0c2N4Y21SWnpKUkRvaFFTNnZDeDRWTWlkR1VD?=
 =?utf-8?B?QzdjbjBRYXphOTIwM0JqUFI3UTBHT2k0Qy9yZHZZQ0NVdVJhMW9zbm9uNkdR?=
 =?utf-8?B?aGM0TFRJNGlsSkVXd1JZVSsvNmxRQWtlMWJ1dlZKbW9GNmN5Q3Y1NmZGc3Ir?=
 =?utf-8?B?bXpVUW4rcnJZcUd3Q242VFpTN0V5OTFxR012UC9VdVZyNThHNzBCWE9VVzV5?=
 =?utf-8?B?THkvTDN6eSsxT25iR1JwTjA0RDR5aDE3SG11dVJ6Qi8rRGRZR2dYZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b6159555-d17b-43c6-b353-08de9562b3ba
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 11:33:48.8652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELUg2ZgAYiAutgQQs4axBllrCFSk2dlmPINr4xf+bB/SwCzMSe1hTT3VLfLjxtq+kXyijeDWkmd4AczFn2z6WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB9298

On Wed Apr 8, 2026 at 6:05 AM BST, Ben Guo wrote:
> Update the translation of .../rust/index.rst into Chinese.
>=20
> Update the translation through commit a592a36e4937
> ("Documentation: use a source-read extension for the index link boilerpla=
te")
>=20
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Ben Guo <ben.guo@openatom.club>
> ---
>  Documentation/translations/zh_CN/rust/index.rst | 17 -----------------
>  1 file changed, 17 deletions(-)
>=20

Reviewed-by: Gary Guo <gary@garyguo.net>


