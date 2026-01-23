Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021098.outbound.protection.outlook.com [52.101.100.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7742919C553
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 18:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191683; cv=fail; b=GMfInO56/IE1wSt27wQF3qrO7LZslYeOz/VstGHy2QpT2Rk3IYsd0HdTOKl+KTjt+1CU+cppdBsFowd1SlXwuLp89Xl2uW7BrN5zts/ECpb2ts7SINGASYVs1M7hrfpOgcqLMIWy+N25bD3ky/rPirOLoArfnPhmGX8fZyV3ZOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191683; c=relaxed/simple;
	bh=ijT3GpECI9hwcoHR+SS/ji6gKqoIdJQsbfgcHdsuC6o=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=FCZFRGwljVXbmlKCJPEcZVBO7BqVG4f1jcQlQKZOA6GRb7IsE/N0B/VY01H92SctpqTPRnXXuY9P9DGI0BeivcethIMLVGgwsT7hpkDG/yDbWzHToaZ9tbTL2GnTaLQuiH056Wk4w2/WEIhVm4GOg8/VphzbKjPCdZCL1RGId/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=kwkzebxF; arc=fail smtp.client-ip=52.101.100.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="kwkzebxF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBnoPNOmtlTO2dK0hUcmDOoVzajtLLGnjbplJNQmgRkfrIDR+OgvMeEKOeUWplrI99uCQbb44ZZ21FrGq1VdWvsEFFYAXSynkXVnlvk90Osxn8rnYZgS2uYgyosbEUkgdJHgZ7uZMuOiv1mEN4SbIZgVnN0JSYP0ZH5EYS7x0AvuIFSwcHlvfOMhd78VN9jQn3QinjOBzuCDOlQBwhU696eJ1MDulTnL1nRffjAPW7vGl/sY8KnFOR/I3XO3X301DKYxscv9bhHzxGMkcjNrAPZG1PcridCQhjI1aXW9aSp5fL6BSB6YmTFeQu/Ftl0l4LKnMR+LTRETgOi1ytqHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCqWv5+5qIy2WtKJwHoAlbYsm8dP6GHO7bjpK4+bMzQ=;
 b=dDWD7fWyBK55Pen6RQb9tEURbKBdVaK0GRGyerfsBsOjia5zDM9NRTln5JzgOGhmQFWdRQZqmBBFSs74ZYXkh+xgH138aTUxZ7iuyG5DFUCAIqAyyp31Ubohq/t+ZkpvH1MwxCJ3rjwcXz9XtcngPYzuHlEyX1U6itEDF3jJ8cIse+f/xpy3u38QhtKKEVPUqt7cyvghoH4T2LGeS+8TVe2iF42XG+QH9xhrBm6U7uO2l2PHc+cRHif/ZEbkVPsO2gnmFuucOSSqfRNx1fsGKtU8GCFA4Uww00sdBf3ZEiGxkFuoJOtE7onJobOPDAWgzqoEzXOBhH6jQgjYV8Jj7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCqWv5+5qIy2WtKJwHoAlbYsm8dP6GHO7bjpK4+bMzQ=;
 b=kwkzebxF4lWxNPb9ZwX8TSaP5QriD9VoRzgzONe96o9DxrBH2Odxe0qo9pwnykpP2nZ3kYHkHYXjHeJbLX6I5WBQ3nQfyagIIOjmkNzLoR+eLkLSEpxOat7XCC+GW4rZBvLk9Y0PrKg+qVLt7mxCGMSVH0d9J4VPbcAYBzbSjuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8753.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:490::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 18:07:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 18:07:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:07:58 +0000
Message-Id: <DFW63WY91QTU.1EL0WDLU4Y5RO@garyguo.net>
Subject: Re: [PATCH v8 02/13] gpu: nova-core: add ImemNonSecure section
 infrastructure
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260122222848.2555890-1-ttabi@nvidia.com>
 <20260122222848.2555890-3-ttabi@nvidia.com>
In-Reply-To: <20260122222848.2555890-3-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P265CA0169.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 560dfbf3-b571-4d53-6cbe-08de5aaa576d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWQ4MlNSQVBvZ3RXUVA5T2QydlJ1UjFQYlcyd3pPZDFRdkUyam1ZdjVEYXpt?=
 =?utf-8?B?TTBZZGxYVTIvbFRQczZYT0ZpL2JwcnBzN1QvblkzUFZIY2ZIT0FiMEhiNWpN?=
 =?utf-8?B?ZmQxaDFDMS9RcHErUzcvY3VHbHJORkttVVlab1k3cVFTYlRWS3g0cTVRYlIv?=
 =?utf-8?B?UnRtWmhUTmRCY05pVXQ3ZzVnWDVSdVBOWkd3WWdVbzdERDZmc3BiV2JTWGlV?=
 =?utf-8?B?OHFPSTg3NEp4YlpZTmpNMWpucGVsY2RaWWRlSXNHMTVVYzB1TzhxTCtPZlZn?=
 =?utf-8?B?dFUzc0UvRUMzeE9paVpPWGRvYmlNTTVia3NsNXdsYlltMzYwZmwwUnZWUzhV?=
 =?utf-8?B?QXlrcy9LT1I4Y25YM25jR0tpZXFvYVJldS9hcm9CU1FiRmhPcFBQQmVuclVu?=
 =?utf-8?B?SzZRd25ON01GdDFWRUNzYTQvUWJ2WkREZkU4d0xnd1pjNGhFK2NxejRmV3cz?=
 =?utf-8?B?S01FZEFGNnBmUndmZG5HMXN0QWJsMnNyZndMRnNxbnNuYi90KzlWQzZvMXFl?=
 =?utf-8?B?VWVtcjhWWElJMWhBVjVpYmZ2cE12VHQ2WGw4U0ozM0NVRmsvdm5hUUtVelNt?=
 =?utf-8?B?bHErQ1VkZHJMNkh5TGt5NVMyWTRhYjB2b1NwYWM3akZBcWpVS1FlTEU1TTh4?=
 =?utf-8?B?U0pLc3U0V1ArMHkxR2ExaU5kd2hpVjlJL0pIQU9samZ5Q2d0dFR5OE1QSXR2?=
 =?utf-8?B?NENhU3R0UzMxWFc0cm4vZWRWL1hDR0YrL0hUeGVPeGFwcFlGRGpSdER3OUg3?=
 =?utf-8?B?VXhCbVcxQnhhd2J5M3ZRbURNS09kaXcrakFkWU5tMGxGcDlQR21CcDZHWUJS?=
 =?utf-8?B?WlljWXArUTh4b1RXNUVmWTNVUmY1eVg4Y2ZLMURhY3JFclp3dVFUVWpuWGEx?=
 =?utf-8?B?ZGt5aXc2WUplN3pPMmw2dTM1MnA1RUwwczFtR0t4U3ZCSTlVMUpseVpXUVlq?=
 =?utf-8?B?NDFkS29tSnZXSkxldllTSit3YkZPVUNSU3AwN1BEd3o5c01QbjNZV3k5NlFq?=
 =?utf-8?B?ZjZDTnNhSHZjQzJTbCtNcHZOMjlMblBkVkM0SFZyZDNHbnljanBQV3ErYTk3?=
 =?utf-8?B?aHUyUzJKZ2F3b0I1SmRvSUVFblI3VlhLY1VzNFZmNlduSi9ybm1TRWxvQm55?=
 =?utf-8?B?YVRjRTcraUlXV2NvYnpVNlBBaWRvSGtxOGdMQ2hOY0ZsUmpDdzRvekJSRkRz?=
 =?utf-8?B?SzRxTFZybUk0aUwxbjV0K0IyZVZEWjVEKzN6UlRKWWdXK29OSXRVMytkaHBm?=
 =?utf-8?B?VTVlQlRQS0Y2b3ZiVkk5YUpQN1VscURNWmtZQWZMWERaWlZNYjBPZkR6UjVO?=
 =?utf-8?B?Y3Z5UlprNC9ObTBkM1RNQ1kzTnA0cjBDaHNwV240QWJscjM5cGYrRjNDT2JE?=
 =?utf-8?B?TExJV3paM1V3QjRqQ0o5d0U3YWdiNzFIM1ZzWnMzeFNrTS9HS0pseUlkZGRu?=
 =?utf-8?B?L3VlbWZDSkdaSHhKY0VIQlBCTmYyWlZzeWp3K0lGcFBuUVFaQ2djNkFDTlBr?=
 =?utf-8?B?V1JtZU9OeTNyWktyQkJuWGVtM1hYd3NYUEk3Y1hoZGdvOGpSV29ZSTNmbXc5?=
 =?utf-8?B?UVJXR1duWnJnTkVyVnVKbXhSMkpiYTFWSjN2b0xnVWN5ZFVxc0tPelExR0dG?=
 =?utf-8?B?M2VXS0llTWtNUlJWVjZicW44S3RKUEhNZkRJaGY0SmdmMzhKdFE5MHB3eFpp?=
 =?utf-8?B?dTM2bDRNaStla3ZjYlp6bFZDVHlJdXBLTUNKYXlBV3JhTzRLMmluUHBDSEw0?=
 =?utf-8?B?eExTL25zcmVZQ1Fjd2xodlBCKzVEdmNZU0YwQmpjcHkyaW9NRFFCY29remc4?=
 =?utf-8?B?aVZEL1JEaW1NcGRraC9RYzhVb2I4bTV1VnpBc3VJSFpsaFFzMHQrQm4zZk9C?=
 =?utf-8?B?b1d1Rk9CeXBCWXRtTHp6aGdkRXowdmRPQVl5V01GYTdsOEFLcWdKR3A3QjlJ?=
 =?utf-8?B?czFZSXBRSkxtbGs3YjhPOWlxdmJLbFloL0xDM0JJYkdsOTVsczBXdFhYVG82?=
 =?utf-8?B?UmppaFNoMllmOE5LOE4xdEVQNnB5ZzNoTnRQVVIyRnpoaEhtUTNFMDlPeHJK?=
 =?utf-8?B?YjNCRkkwS0tPN2l0c0hVL0xmTitJbnJGeGwxVkcveE5jTlhqOUFKbGZ4alpS?=
 =?utf-8?Q?H98o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW9kQ3dyY0lJMTdBRHgzdDVYWnZUczNkeUVOR1RKcjhPZWlOeTZYZ0JXZWNU?=
 =?utf-8?B?SzdDOXk3dkUvVWhhTHMyS2l5OFZuOU5vbUsvUlZzRVhlTzUvcVNNN1pIWGlD?=
 =?utf-8?B?UFRmWXNyeUhOSmgwT2hkd2Z3VHpsTjlWVnVyZnZRck5vTlNYTmZ0OFpOQU1u?=
 =?utf-8?B?YjYxTzRscVNRQlIvT2YzN25vOU42UEVXQjdDMU9DeGp1a0ptR0x0dm1sQnB2?=
 =?utf-8?B?Q0ljSC9rNWNvRzdUUXlXc0tBd1hVNVNIeFBPUThVS2JLYkRiUG11elc4ckwz?=
 =?utf-8?B?Q3dlczVmbmJ3RzMxOWovekxTTld6ektkTTVYamhDeER1ZDZGcHRuZFhNeGhH?=
 =?utf-8?B?Y0VIVFJWOE8xT1RoU0N6WkdRWnBsNkZJajVGQWQ4L2pCbnRnZUJBdWpZaS9Q?=
 =?utf-8?B?RGtVTE92VFJXcjBJSVZLaytTLzcxY0lEdjBRUHYxUldIYUVSN2s0K1B1a29t?=
 =?utf-8?B?Y3dTTHgyaEQ5UTdQZ3AwWFhmQ3h5Tm5kSzBDcDdGZkVacElrZFA2cWExaW5O?=
 =?utf-8?B?Q3MvWTBYdzVsU0wwejZ1QjlaUFlrUkpwSVVBS3FtRkx1N29MVFJ5VXBGRGhY?=
 =?utf-8?B?bG5NUmdPMFM3WEIrWnZObHJoWXlEL1UvQ0ZBUWw4N1JUbzJTeG1mK0ZoVXhx?=
 =?utf-8?B?RDRNZFppSEkzZERZN1Fkay9DM0txNHJRSUZHRlFIVm0rT3o3WkNzaExPdkJT?=
 =?utf-8?B?N1I2RFhMZWhPaTRyTkdoakRjcVlhK040SFAvbWRKWXYzWkJTY1hlOFdUM0Qx?=
 =?utf-8?B?OCs4WUM0bUVtWWkyNFFET3dUbEV4ZWhZK2xUVjVBT1M4emZHSFExR1AxL01W?=
 =?utf-8?B?RTM3MnVPb3JrKzVuRGJBOFVSUUI1WGh6OEtZZC9rZi9pN0ZwSVJyMUdkOWE4?=
 =?utf-8?B?Wkt6Y0E2Z29kL0gwM3dTNDVnOEE2eVVBNGZMKzVzN25WVnFvWnNPdkZzTUlt?=
 =?utf-8?B?cS92ckZpaWZ2NmFOQzRZaUVzLzMrbCsxcDdUZDAxOW9zT1VJUERZQWpqNnd5?=
 =?utf-8?B?bzN3Wk5CVTRUYWxMejEwYW41aE55Nk5Hc0REaGlFTjNGMEFQVGYyOGw3aDdW?=
 =?utf-8?B?NzZjTFZSaHU1NEZHYVQwSSs5ZGkvSW1vVFNvZE8xQVVla3JtM2VSaFFTM2wv?=
 =?utf-8?B?NWVnWFNqdTN3NDJDTEF0OFhJZHVpWGR3T3c4UEtqVnlzVWJPTXhlaWZZVjJE?=
 =?utf-8?B?Y2M3cE0yaW9Ec3liWXZGek1LUU1uckRZOEtrOUZma3ZPMXRtNFpWdlFoNHJH?=
 =?utf-8?B?eFRGNGozQlVjemQ1YnhXZE54c1F3WFZLbG9zQXg0SSt4dnJxQ1dkQjY5SXRC?=
 =?utf-8?B?Z1BFNTl1c0dydnEzZjFaQytxdmhhKzdCT05ON09ZSGtvSEJBem9CYkQvaXR2?=
 =?utf-8?B?emhhTGZnYjdWdG5iQkVrWGlaYXdCWlIrcFR6dTJ5OHlhSGVhb1FNR1lWSVFP?=
 =?utf-8?B?eDFhOFhJY0NVVmwzWVpiYXNnUVhWck14d0NpcS8yM1RtNVV2YWt0UHR6Y01C?=
 =?utf-8?B?WjkycTN6MzFhSkN2N2VpR21GODFHWEg5NXB2THZwYUE3dEVGeXdrejZkSFdE?=
 =?utf-8?B?RmY0SVpzV0NyNUxCU1dvYVB3R3VGWTZ4R3U3MjI2a2xING1qTSsyZTVtWGxN?=
 =?utf-8?B?QlJCdzgzOERTWlFwenRJenpIemk1ay80ajNTWGN2b3hvcWpIeHM2SDErcEtW?=
 =?utf-8?B?M0c5QnZsRHVoVTB1bXhiSi9RRTZRdUhydFlTMUhZZ0xGb1ZmMnZrS283SktX?=
 =?utf-8?B?TlI1VmdkRi9xd0U4cVJDck1RalpLMkRhWlhvS1JvSUNkdHdkVWlCeVp6UW9m?=
 =?utf-8?B?dFJSejg0YjFsYXo3a3I2amtPOERRbkdORDFmb1g4SVprOXlvdm1PcllORE9p?=
 =?utf-8?B?NkNNZyt3dDl3R0RiODhHQ1NFRHpmK1RaVkpLMUtFQXBYdWcyME9QdFc4VEJM?=
 =?utf-8?B?Qjh0d2MyTy9qN2pwSzEzZEtzKzFENTJqK1FHeFRRZHdYbGU2bThUUDlFSEVm?=
 =?utf-8?B?dHJtMms4cDdIeHM2T3l4TmQ5b2E4SFRrYUExdGQwWFdpcTJubm84Sm1iNm0y?=
 =?utf-8?B?MXh3b2pFSFFsakpVTFR1ODRnVVJWeFZFaDdielVqLzYvbS9EUkZVbXZDUTJT?=
 =?utf-8?B?TFUvTWxVeHYwYmhRNlUzZ3VwNnlsa1pyeXJrbnMzWEY0dDJNY1BTRVhEM3dm?=
 =?utf-8?B?Rk44elZQUHFpRXk0a2Q2VEIyRFdUMkorSUJ0L2RRUUNFVVJMZGNmWm96Wm5G?=
 =?utf-8?B?ckRuOXhYVncyT3F5QzRlUElLZHNLOEdsUmRkeGZsRW9sZUszZW5EWDE0YW5V?=
 =?utf-8?B?VDNLM3FBT01XK3Z1dUk4TFk4clVXVzRHVFBBYUIzWW1BMDJKdEJaRmdETTJJ?=
 =?utf-8?Q?sNlfptSNjUHz8/94=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 560dfbf3-b571-4d53-6cbe-08de5aaa576d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:07:59.1481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXrhUeVCSccNYAHBqC4t06B77TqJNiS/xrHJuza1Q4tNFwpnnVrLu+MN7PYwLD3lqzumEvKA9/boXg+n83XT3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8753

On Thu Jan 22, 2026 at 10:28 PM GMT, Timur Tabi wrote:
> The GSP booter firmware in Turing and GA100 includes a third memory
> section called ImemNonSecure, which is non-secure IMEM.  This section
> must be loaded separately from DMEM and secure IMEM, but only if it
> actually exists.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs          | 19 +++++++++++++++++--
>  drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
>  drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
>  3 files changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 310d4e75bad3..0d1a0f86d83c 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -242,6 +242,9 @@ fn from(value: PeregrineCoreSelect) -> Self {
>  pub(crate) enum FalconMem {
>      /// Secure Instruction Memory.
>      ImemSecure,
> +    /// Non-Secure Instruction Memory.
> +    #[expect(unused)]
> +    ImemNonSecure,
>      /// Data Memory.
>      Dmem,
>  }
> @@ -351,6 +354,10 @@ pub(crate) trait FalconLoadParams {
>      /// Returns the load parameters for Secure `IMEM`.
>      fn imem_sec_load_params(&self) -> FalconLoadTarget;
> =20
> +    /// Returns the load parameters for Non-Secure `IMEM`,
> +    /// used only on Turing and GA100.
> +    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
> +
>      /// Returns the load parameters for `DMEM`.
>      fn dmem_load_params(&self) -> FalconLoadTarget;
> =20
> @@ -460,7 +467,9 @@ fn dma_wr<F: FalconFirmware<Target =3D E>>(
>          //
>          // For DMEM we can fold the start offset into the DMA handle.
>          let (src_start, dma_start) =3D match target_mem {
> -            FalconMem::ImemSecure =3D> (load_offsets.src_start, fw.dma_h=
andle()),
> +            FalconMem::ImemSecure | FalconMem::ImemNonSecure =3D> {
> +                (load_offsets.src_start, fw.dma_handle())
> +            }
>              FalconMem::Dmem =3D> (
>                  0,
>                  fw.dma_handle_with_offset(load_offsets.src_start.into_sa=
fe_cast())?,
> @@ -517,7 +526,7 @@ fn dma_wr<F: FalconFirmware<Target =3D E>>(
> =20
>          let cmd =3D regs::NV_PFALCON_FALCON_DMATRFCMD::default()
>              .set_size(DmaTrfCmdSize::Size256B)
> -            .set_imem(target_mem =3D=3D FalconMem::ImemSecure)
> +            .set_imem(target_mem !=3D FalconMem::Dmem)
>              .set_sec(if sec { 1 } else { 0 });
> =20
>          for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
> @@ -546,6 +555,12 @@ fn dma_wr<F: FalconFirmware<Target =3D E>>(
> =20
>      /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare t=
he falcon to run it.
>      pub(crate) fn dma_load<F: FalconFirmware<Target =3D E>>(&self, bar: =
&Bar0, fw: &F) -> Result {
> +        // The Non-Secure section only exists on firmware used by Turing=
 and GA100, and
> +        // those platforms do not use DMA.
> +        if fw.imem_ns_load_params().is_some() {
> +            return Err(EINVAL);
> +        }

As pointed out in last round of review this is unreachable code.

I am not too against in leaving it in as is, but for checks that assist
debugging only, I would probably use `debug_assert` myself.

Best,
Gary

> +
>          self.dma_reset(bar);
>          regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
>              v.set_target(FalconFbifTarget::CoherentSysmem)
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-=
core/firmware/booter.rs
> index 096cd01dbc9d..1b98bb47424c 100644
> --- a/drivers/gpu/nova-core/firmware/booter.rs
> +++ b/drivers/gpu/nova-core/firmware/booter.rs
> @@ -253,6 +253,9 @@ impl<'a> FirmwareSignature<BooterFirmware> for Booter=
Signature<'a> {}
>  pub(crate) struct BooterFirmware {
>      // Load parameters for Secure `IMEM` falcon memory.
>      imem_sec_load_target: FalconLoadTarget,
> +    // Load parameters for Non-Secure `IMEM` falcon memory,
> +    // used only on Turing and GA100
> +    imem_ns_load_target: Option<FalconLoadTarget>,
>      // Load parameters for `DMEM` falcon memory.
>      dmem_load_target: FalconLoadTarget,
>      // BROM falcon parameters.
> @@ -359,6 +362,8 @@ pub(crate) fn new(
>                  dst_start: 0,
>                  len: app0.len,
>              },
> +            // Exists only in the booter image for Turing and GA100
> +            imem_ns_load_target: None,
>              dmem_load_target: FalconLoadTarget {
>                  src_start: load_hdr.os_data_offset,
>                  dst_start: 0,
> @@ -375,6 +380,10 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
>          self.imem_sec_load_target.clone()
>      }
> =20
> +    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
> +        self.imem_ns_load_target.clone()
> +    }
> +
>      fn dmem_load_params(&self) -> FalconLoadTarget {
>          self.dmem_load_target.clone()
>      }
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-c=
ore/firmware/fwsec.rs
> index 6a2f5a0d4b15..e4009faba6c5 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -232,6 +232,11 @@ fn imem_sec_load_params(&self) -> FalconLoadTarget {
>          }
>      }
> =20
> +    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
> +        // Only used on Turing and GA100, so return None for now
> +        None
> +    }
> +
>      fn dmem_load_params(&self) -> FalconLoadTarget {
>          FalconLoadTarget {
>              src_start: self.desc.imem_load_size,

