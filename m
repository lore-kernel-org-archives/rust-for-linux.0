Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022142.outbound.protection.outlook.com [52.101.101.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCA131DDAB
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823958; cv=fail; b=Ol8g1I5op+g9ZuLMqeRdBwdhYa/uyB8CIqlC7zJQ2ro9hanBXxTCy6ovARqYjvIqElxrxtmsJXcQbEmw+1jkZKZFA7fvAmDrywLa4b8ZzdLjMY7l9K75HELnKZtdHM3R2ysykrqpr6+zuekTu0+uPkEo9Oyft190S8XOQPTCp6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823958; c=relaxed/simple;
	bh=Dx1U2VOijj3Jo07DuX1bQj4IP5hMbThsdZTyLw7t4PY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=raB3Qv1qppa4uDJL5S27IYmKCsy42KmFVOlCxhrNaRyt93YvFoJYLr0BAVmyxEMnfdIVXJHefs1xJs/U8EtcnQlfv7CE2QC1O8oBE81041S4Z5+PzY81oz6H9N/oV0ogl5bQWUsKnzo+JHbNitFiCpYKPJbq5/yQn1ALFxdif+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xuGXQDni; arc=fail smtp.client-ip=52.101.101.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xuGXQDni"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8bud/5DV42ZEqCONh7fyzE5e/74mKj3Yd2flPnGfGsU3Cpdveb5134s7cqyXL6fDDM3LNZsKMMbER6c4ZMt4DbdNf7i6GY4PaYmzVw0HCkMgUMrpAaTbCCHVG9wowZ1dNKbhs810W+aOs5qFRCxYNQHy8KXkMHyYfd+Z1uO0luiQbndbS5WEI8Bbeyklbdz41misxsvK11cCJkuTA4btd6vLNwfDNefsROqsz+EVvHY1JFE0TsnjMRhBNJtvWxaZrcBWzrQL7Jkf4kIIBLiHSBnJWEki/Kat2GAVIRECgAs2RfwYPEe3KayNZ2//eDbWsJ2W65bot7VSURr5SqVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6BH5DXRatGsdksxeESzGvu+vOI5vSfZyiePskuuQxs=;
 b=DC6kJqFQUHfvPIw+3LUgcerEz6Zgt+vII4cVjwF/ezfMJPznYchKiL3HSroPWfe+XDD1cG7hc1YlG/RizBIdvkfJs0ysF7Spety85ZgB7KYUMLlU/WQUMlQPI0lidd6t3B033uIFX15oyL6rRb1h0cHXQXap4tZTtkRCT09S5M9nd5tU+OBxvclDe7AEYeO9pBUlJskRguf9W5n3K7wYLvGeIxAZLkmja+Kz4hrQ1hIHlIrPvXOUA4qddC39y2Jq/2IRTY+CP/T6utjBQVWU5hSxAOauRjcLtha/FbsiIbcYSmsnUSC70p1jZZGa7LHyw81iJ4yEynOBhxUGTzoBlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6BH5DXRatGsdksxeESzGvu+vOI5vSfZyiePskuuQxs=;
 b=xuGXQDnirbsGdG4vel6UFzlr54UlxO+irLAKXPVvdjYsT6gxm2rrfOzJxiooerllgoTmpJcal6i722RBl4IfzxUCfdekJnaYIf41niRq+yggKxN3nwQCZqWpvQY5bS2pS9F4WBEl1Hl5VGE/mcuRjOgkM9if3zvm94w9xmvt+aA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7427.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:217::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 11:59:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 11:59:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 11:59:09 +0000
Message-Id: <DFSJRCM1F247.212V4MUG0JNR9@garyguo.net>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v1 2/7] rust: block: mq: use pin_init::zeroed() for
 queue_limits
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Ke Sun" <sunke@kylinos.cn>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260119065859.1914178-1-sunke@kylinos.cn>
 <Z55sb2ThC6nBqfAaJu3YNGj3bYMrT9XHy63LEXLGqzPUsAFp-dS0O_usawylT8GR8QrXk8BazrYsOGXe1ax6qw==@protonmail.internalid> <20260119065859.1914178-3-sunke@kylinos.cn> <87jyxdq2xu.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87jyxdq2xu.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P123CA0133.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 5155fb0c-4760-40b2-86d3-08de575227e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUhNbnpBZGhVMlJiNWlyMXpTUUU4N0NDY2NuY2hFNW1vd2ZTVnhjQWM4RDV6?=
 =?utf-8?B?c2hNVDRFaGNMY0I1NEYxOFY4YnBLdksxQ1BYcWtya3lFQTJ2VGhWV3J1M0NY?=
 =?utf-8?B?blVnWU1yNUZyai8zTm5BdHBDM25maktMdnVzWWhyOUM1UTZVYnZLNlNJR2xo?=
 =?utf-8?B?ZEEzMlEycVBzSS9YdStINTRJNVJmTmF0NGJiSWVsUm5OQ2NNK2U5RTVNTURz?=
 =?utf-8?B?N20rbUVZdjNXNmNPVGlIdk0yUmVRMmRqbHpwVzNpL05IUStjMjdsL2c5cXpN?=
 =?utf-8?B?YWo4cjF5eWFVbnpOeVpSTDdyOVNwMTI4amZ4a01IZ3YrRDZlL1VVTEp0czRt?=
 =?utf-8?B?VjBsU2laMEJqV3dZZGdmTEFpVHA5U1oyOTZpUXk0WjgveWxGNndrZnlDSHdr?=
 =?utf-8?B?OGtBcE1tY0lnOEhyWFlIbGxjeXE5MzJSS0hVWmR5a1ZkL2syWGdxdnU2b29T?=
 =?utf-8?B?NERxeFpYMXVwSGIzbnh5WVVheG5qVVh4UjRETExSalhORGszOWV2L2xGU1h0?=
 =?utf-8?B?bUt2V0hKaFVlMFJhSnYxaUpOYnFuM0RwQlhtb1I3ZmFLT0pZRVBpdjF4SEcy?=
 =?utf-8?B?RjRCeXVCMXRyMi91LzdyZ0RjU2hobVNrbFYzY1FUYkgvUjIyWTRTNC9xODhz?=
 =?utf-8?B?U29yM1M3ajAyZEd3QU8vTkZpTTBzT3VHVTIvaDN4RVcwYjZKMlZ2VDBwLzZQ?=
 =?utf-8?B?N3hDM2VnMjJYSkhhd0FsSXFEQzMxUVk4QW1yaTZJdFNmTDhzanZoeFF3UGI1?=
 =?utf-8?B?Zk1kS2tZNFN5a1Y1NGlrT1lhY3kyR1EwbjJheWlQWENLWmJjSUYySVNwS0pB?=
 =?utf-8?B?UXRiUE50K09oZXlqL0FFUGwxSzNKUDQ3Z0JpYnVkRGxQazRIejRFTThETlRz?=
 =?utf-8?B?OGJoTGJmOWpkeFJKZUxDZHgwWmNGd0Q4VTUrMGtGUjcvTjdPV2kyZFRva3VY?=
 =?utf-8?B?VDFPQUFBMEdOUmdnekxaSXl3cFk1QWF2VlA0cXpJdTEyNndzN3VZeXNpaG9i?=
 =?utf-8?B?VmRUSlNMNURwS1BqMUVuTzlQQUxzbnBjQ1hpT0Z2SGRZSThScGNEaVcweEV1?=
 =?utf-8?B?N0hFWUlSRGRwZGhLK0tPYnQxK0grYlZyR2U2UEQ0NE5QZnZiUHNuQXdqZmlX?=
 =?utf-8?B?ZWZVVlNHa3ZqUW0rc1ZYeStIRDhaeWlRWG5lTzQ0Y09RTmFZaUVhMEpKb0Jp?=
 =?utf-8?B?K0tPM0RSSURUQ3QrL1lMamlrUmNwOUlFZUtxeHY4OXQ0aURKY1grM0JPYnZR?=
 =?utf-8?B?K2YwYjgvZkM1bStyd0xhb0dPMVE4eThjUllHZmt4eHFhdU5JaDJsT2tnL1hN?=
 =?utf-8?B?RitWT0x1Skc5U3lVQzNlOGNIWjJtS3M4NFQvcUJuVlNPM1pPYjNndkZGaXBG?=
 =?utf-8?B?MjJ1QUI0S09DOEowdmVmRFJ1ck9FTlJMZ0N1QVFRZnJOOXRDOHhXcHVUaTdM?=
 =?utf-8?B?MmFLQ0l5WXd2M05VWlcrVFZFSDRncWdCVlBpekhUTHByUUlSS2N0cUUxVm13?=
 =?utf-8?B?SmRFcHdEVFpxbjd1Mkp0WnFXSE92WGZ6eFBmL0owU1YxbUw1UWJwVmRaYXhz?=
 =?utf-8?B?SEYrL2g0bVVjNktObGEraG1OeEs1YkcweU1uNElUYmFXVFk0dkZIRUhIby85?=
 =?utf-8?B?eHl3SUxIbk1MZHMzYUg5NWsyRjFRRVJCZ3FRVGtSM1lNeXYzZmhNMVhMUWgz?=
 =?utf-8?B?TktSOW1zb2RqMmgrOEMvTjhHZEJMZFh1bUtGUEh3c0JHa244a0ZTUlA4NGpQ?=
 =?utf-8?B?OERHZFBBQ1ozSUFoMTdWaTZCTVZucWNMZGYwbnAwejg1REZ2Z0RDMkRoV2Nh?=
 =?utf-8?B?U3BpK3RldjcycWRuME9vNWVQYWV6MTNmcGZHZUtOeENqZ1pkOG1oZzVRemZG?=
 =?utf-8?B?MUVLZFJMNUR0UHJlTTdjT09FV0RNV2pyUlNFc2hLSkxpcW9OVVA2aHBXazNI?=
 =?utf-8?B?T2R6cDRCUVkyZHNLNTZzY1d3bk50MEJjRjVPc0FXS0dNbnJ4dS9WbHdFdDVs?=
 =?utf-8?B?WUxHRWdjTGxmRWtxT0NMcGJkUjRxQThRNjZoR2t2bCtuQXcrOStnaUh0NDVI?=
 =?utf-8?B?S1BGVmFQcWxWTVFMMmo1c3ozTHVFTXFUS1JBZEVvZW5zbnpjQTRmL3lnaWZN?=
 =?utf-8?Q?NuMo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXErM1pZTnMzNHp5WDZlMjhHa1FudDc1L3ZubFJUSEhEd3JqS0pnZ3RQd1M2?=
 =?utf-8?B?RXgrUGphbGdVTDVuUzRSTlhsVkxSS0ZXUHVrR3dPMUpZT0JoTkpiTEMxZDU1?=
 =?utf-8?B?cFhQeTRKemx2cVhTcDJ6WWV0VmxQR1ErWEZ5WGhKcG0yNkRmc1ZrUWdQV0FS?=
 =?utf-8?B?bU96dGEwWXRHMGpDY2tjTDdZWVhMNUlJQlJOdFAxb1M2aDJEc3VNbWJSUlUv?=
 =?utf-8?B?ZDFkZXJRbzRiMGl1RDlEdlozTzhjbXhHaUVMYSt1NVRIRXRRRXRvVjNDSkhK?=
 =?utf-8?B?QUp2VGp0bUVOQ1pVLzdZR28wYU5QaWp0YXovTkZxNTY3WWlLY1VTV2d4cFlJ?=
 =?utf-8?B?aTlpU01aLzVwYjc3MWdESGU3S1h5ejBRZHIzZmNsWVZYcU16dy9zb2NpVGZl?=
 =?utf-8?B?eXNZNUppejNqK1ZLdGg0ZURCNWpMbHVIejF6KzBYdDJ0R29zajVSb1BSWnFz?=
 =?utf-8?B?UHpJU2xhZXBmZ2pLeS9CWldjVE56UUd3clZ6aFZ0OGxxV0JYYkRoWUNTc1Nt?=
 =?utf-8?B?RkJkWUpKS1JaejJITVJyWG5WQStOYWpYNDdHazYzZUZLZmc3UWs5Y3JUTUVV?=
 =?utf-8?B?YXl0VGthWTgyblpoVEdGMWZXM2hPcEFTaFNlTzdnNFcwbkMzVnpmZnhsVVh3?=
 =?utf-8?B?TkpJQXlrWkRPTXUvKzE5L2t1L014TE5yOXV4VmIveGxJQTVxbzhmSlNNdlVL?=
 =?utf-8?B?QlZmcmJTQVNaanB1K2hyZCtlYmVYNElDaTRYWHEzdEc3M1NvK2gzeDVaRjg5?=
 =?utf-8?B?OWFuRWJoM01NQnNKVVczMFlSMlRDNG9yN1BnUUdhQ1Zva0NBVWZ0MEZqYVEz?=
 =?utf-8?B?OTdJVTdrdDlVZ3ZZYmVIV1RSN1J3T1h2a1d5b1NUOGpPdnEzWWc3YmRVdWZ1?=
 =?utf-8?B?aEtERkYwT3kwTkVKOHlNMC9kenFJNW1Pa3NBWWg2aElCZ0dKZXNlaHI1cWtq?=
 =?utf-8?B?R1dBRzFIQ3l4Vng2VWNtNmFETXEzekJIVzlZc1hRKzc0N2lZS3VRY3YrdFA1?=
 =?utf-8?B?eldPanp0L2xheWhaY0dFNU5IVUt0M1FOUWVNMFFYVmpoREtSeWlVUzRob1lJ?=
 =?utf-8?B?VVo0ZHh4elU3ZXRCRDJyeGluWjZtSFJ1eXFYSDVjTHUzQlZ2YW5WNTVURGIr?=
 =?utf-8?B?UW5ZeWk4SUpLWllOaTdGTVRaQUJmSGxJVUFYYng5WWFwbGordVVUSmNGTy9E?=
 =?utf-8?B?bHRGZFdZcGZMa3dCSEo4d0pJMWFmS1RISFkyYnh5YXdNMDRVQ3JqNzV6eWcr?=
 =?utf-8?B?NVV6bVlLWnJqSjJKdWZma0czS3g4czJSem5iazhzdCtibHgxbjVyKzFFVXRj?=
 =?utf-8?B?TGZnVFFrYjk5bGhhMW5ubndsclJ4eDlUdlNxMkx4RXZlRUdBNGpjakJzYjlK?=
 =?utf-8?B?c2dZakJJZGFwazFhek5scUNOWTVRYnFDNUsxT1lSalZ5REh4aU9xTWJCenZu?=
 =?utf-8?B?S1hVM1pFMFNUT2ZFbUxVWUkrLys5ZzZwZmNZbGdnS0N4S3ZnWFkyVEZSY2Ez?=
 =?utf-8?B?UytNMXVEU3RJQ2NDTGkrNDgwdTZCOXVDQzlMYkpvOTNRa1dCaW9LZmJaM3FQ?=
 =?utf-8?B?RUJqSnJMd1NHcXZ2T05ENnBmbTdnVVNOUU4wN3FDWkRHcmhPNldSSTZGRkUw?=
 =?utf-8?B?RzRsWXM5Q0Y4SHQyeTJUY2ZsekpKdUxERVBWUmRHZ0pFU3RYcDFhei9GWlI5?=
 =?utf-8?B?ajZBTWh4OE11TGVKSEdSZXFMRGI3RzVlSWRXb1JWQnh1NGZJYnVDZlprYWw5?=
 =?utf-8?B?dkxldUhzT0FSWTdNdE5VQXNEYUtNR0ZtT083MDZSUW5JeWN6T2ZpeFRoV1R2?=
 =?utf-8?B?OFhjeWlDeDFHTm1tWnVqTUR3bEpHdlYxY2lhVGZnZG9yMjJNbWlwZ3hjR0xZ?=
 =?utf-8?B?NU9wKzI4MGhqMkJ1K3prS3FXL0ZqcXB1dTk1Mkc2TWRKaW5WZlFaaHZaVXBh?=
 =?utf-8?B?SEZXUTBUVEt2ZEdNVHNYT2tnTmNGVWo4V2d2VGMybW1YT2NjdEdmbTVhQmMz?=
 =?utf-8?B?WTZtRGM3cG1jZ0lNMk9NTm5wZC90K1pwN0VaQ0VTc0JJSVowMlo2QVNsN0FY?=
 =?utf-8?B?MkFDVk5aVnpZYU5XK2RMSlhHVFU0RGQ4SzIxdnIyTzZtZjUrZzFTNjVRbmpJ?=
 =?utf-8?B?QnQvbVJHbXJwSFJ6Uys1QnlEK1hJT29ZOHV5TFFEK3ZBU1hFM1Zid3BIRU9o?=
 =?utf-8?B?TFZ1RHk4bUNLSjVvNmQ3VVZWdklIQzljMU1yUTNpN2ttU0pTVEU5cmhNR25s?=
 =?utf-8?B?R0ZHN1FMNjhRSG11MFhhU05IbVNjSWgwNWd4Z0Y2NHBheXdJV3ljb3NDc2hD?=
 =?utf-8?B?dFhHbVVTTGdCNlNla2h5eTdpU0ZQYmVMdTV2K2ZYaFNvRzAwNjhrZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5155fb0c-4760-40b2-86d3-08de575227e7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 11:59:10.2530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UuguOI4Bu9xUm1z6u29BooNF/zho3rd9Ylez1OGk/S2KhYuNz/PhNylkb/P4Rfg6gEEZggAhidNQytolWf4xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7427

On Mon Jan 19, 2026 at 11:03 AM GMT, Andreas Hindborg wrote:
> "Ke Sun" <sunke@kylinos.cn> writes:
>
>> Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
>> queue_limits initialization.
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>> ---
>>  rust/kernel/block/mq/gen_disk.rs | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen=
_disk.rs
>> index 1ce815c8cdab0..4620a86a88dd8 100644
>> --- a/rust/kernel/block/mq/gen_disk.rs
>> +++ b/rust/kernel/block/mq/gen_disk.rs
>> @@ -107,8 +107,8 @@ pub fn build<T: Operations>(
>>              drop(unsafe { T::QueueData::from_foreign(data) });
>>          });
>>
>> -        // SAFETY: `bindings::queue_limits` contain only fields that ar=
e valid when zeroed.
>> -        let mut lim: bindings::queue_limits =3D unsafe { core::mem::zer=
oed() };
>> +        // `bindings::queue_limits` contain only fields that are valid =
when zeroed.
>> +        let mut lim: bindings::queue_limits =3D pin_init::zeroed();
>
> I think we can just drop the comment now that this operation is safe.

Indeed. I had a look at all the patches and I think for all the comments ab=
out
zeroability can be dropped as this is now checked by the compiler.

Best,
Gary
