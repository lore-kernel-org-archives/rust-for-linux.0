Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021098.outbound.protection.outlook.com [52.101.95.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292433EBF1B
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769193370; cv=fail; b=uoRkef/E79iGEtx8DqeINHpMp42RCChsyWOBPXpkFgdvl67r40XNilGDMfshOjToud/VtM4br1sqWqbAUNewzhuXhDtIJ6el85hoCKsag/K+RHpR2Lh1U89tP+1dloziIXaz3ns6BP9mORbRdYkCstJ3poYrf8AOkNxOiUb1ST0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769193370; c=relaxed/simple;
	bh=27KUpttOykU+3RNPD3QKfOw90fTrFu2Y0Kgbfk1+bGg=;
	h=Content-Type:Date:Message-Id:From:To:Subject:References:
	 In-Reply-To:MIME-Version; b=iO7LM4PxJ265KdVRBHugelwziO/3deKzt+oieLr2SeGZAB2LjPfVQA6hJ312fdMAtjSTOahvSNywVk9e0d/gSBuzc7I0huH8afPCxXU8+1F9Kh/C1wk/gR8DHXGsWzFjppBgU0iShxKZy2/Odrj4wHB7J3pxWFwDeXHlASaVGfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=e8tG4EHL; arc=fail smtp.client-ip=52.101.95.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="e8tG4EHL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oekPrbNb0JPN1fYD9gZg4HHzh9aNIR9P95F9ZqgDefl1yQbOrlWmU9AOjD2I090GWKhfeiP8zwLXQjPHWKCMc9WrrnRW95OzgEpDlWngy8y4ZgjGi44iZYwk/H9YYYNwGegaDdXdBa5O+qpv4KfYVswoUW3gbnjqua5a4DPJAhmPotKmxip564648AeY71hBHU+/8Z656oeFadtzOhwxHnIgLuBkw5AL1PP0DJvfHpzhIRh5qnGuccTz/i4EK9xmrTxbn5BdAwdUsxqJS0G7eKCz9A80msKpOXyH/3baaAPdWeEROMBmD8Jh/Y8aV1kq7P7XZbpeC+ilEt03YE/bDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vn07ulL0vaWywfq5rM5FUP1i/dDx6tusxHSC6SAqjQ4=;
 b=tTBjuUi36uupcHys5+ZKVO/S+T/2d+20vjn7L/3PvKSWhAjd+t2B05paviLouaue/RHgWk1YQWcwpPeTWQOiQkGjRXlyy/OTRBgeXTCv+aiMR8557qiK4vmP4YJxu1k+uCzH5r3fGcKTuGe04CQjrnL7oAFl1fxFvLWl728JUahugMEeUzd3vbJRZ3/30uPM5kyNg6ruu0yREamdnMBaw1L995W8y6AgFJ/kFQj5IWTzIS2YUOPGa4NQRvYa4foo0MsyCO/VfHRk1OQja0suDVHTS7AGZEjmEHdYu2QBx0usCcTy1rbhsPa8RnZdP2HM2d8E8DrUrVU7S9V52dKYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vn07ulL0vaWywfq5rM5FUP1i/dDx6tusxHSC6SAqjQ4=;
 b=e8tG4EHL+1+3wA2fkQS89MEhbwViFOVaVSzPVhmu+Qg/KuwvBpnpjScb8XAtpEhoLRi3NY7DHnKxaiIdO1rkgbadZhhQKpPXYU7zVbqqzlJYE5v0GtQGTAYwqXBR6aC3udD4mSKZO5HHvinIzdqVoUHqRw62AJN/bfqGafRynlI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7886.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:411::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 18:36:03 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 18:36:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:36:02 +0000
Message-Id: <DFW6PEK1UDTS.3GHOOT5I32WSR@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v8 00/13] gpu: nova-core: add Turing support
X-Mailer: aerc 0.21.0
References: <20260122222848.2555890-1-ttabi@nvidia.com>
In-Reply-To: <20260122222848.2555890-1-ttabi@nvidia.com>
X-ClientProxiedBy: LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::31) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: fd489698-3e8e-4d35-e0a9-08de5aae4341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmpvRkpwL0twWTFTWEkrTHhldFIwVmZoSWp6bkhhNDd4S0hqT1d3d0tsMW1Q?=
 =?utf-8?B?V2lrU2g2cG14OUF1aGdyNkp3MjhGOXdrdXgvcWZrRFJOTE5IRWl3NDliWXB3?=
 =?utf-8?B?enNjZ0QxWUczUEpqWkJxaU9KMi83NjUreUhnV0swSk9XUjViR09UY3FDRGZm?=
 =?utf-8?B?enNCWW51WlBjM1UvQ09UdjcxblVkUXZXQ3AzTEZFWnhQdGJ1b0g3UjJmdEd2?=
 =?utf-8?B?Z0kzaWhKNzVnN0JLaGFLODBZbU05RE9HVXZ0d1grNmZSSnRMeThMcjl0OTBp?=
 =?utf-8?B?bUtyWFYxYWRsQkM1bjFiT1lmRU5xcUp0dS9RZnlxYlV1T1VVWGpUYzc5TjBM?=
 =?utf-8?B?VVFUYktxV2ROb2ZvUzUrME1QOWRZVHo3OGtCS1dERkdrbWhnOXJSaGdnTVJu?=
 =?utf-8?B?ZmNwZTV5MWhQZm5YNENWOCtQRTRHLzMwdzJ2M2swWndLOFV3NHRZM0dHdkZt?=
 =?utf-8?B?RCtGNFNYa0NtV3N2cnZMcFJCZFNoaGc5Q0ZpVXNoQnFTRlBTUEkzbVZLMTR2?=
 =?utf-8?B?ck5YT0tjZU5BZkFmbzlaN1JnNTlLU0RNQmk3Nyt1NzF4bk44SHhRUG9IT1I5?=
 =?utf-8?B?RmJRNEt3dmhuUks0RzJwRk5UVGtkY1o1blpsd2hlSTA0WFNnN0tTZ0lLckRx?=
 =?utf-8?B?bnJ2TWd2U3BkZ2U0WEsxUEN1Q3Q2N1JMdzk5TElHMW51MWI3QklJdUI1RFJm?=
 =?utf-8?B?REdXRGZobVJ1ZlZNMnBON2s4bWJrZmRLVE9JbFNSSUhKejhsVnRKLzh0SXps?=
 =?utf-8?B?YUtDYmpJK2xpR0JDNlJtT0VqM2dtRytuaTVzelpZeVB2VWNsY1JsNDhEenlI?=
 =?utf-8?B?YnhJMi9ITUJCck1RNFFTRERqY1RpeUNzNE9rMll4bm9ZYzgyN21GVGRPZXRD?=
 =?utf-8?B?QW9yOFlyQ3JlNXhtdEpYUFRNK0wrZUw5QXhXdlZFZ21OYVlCSWVzMSswc3Ur?=
 =?utf-8?B?dkhGbEJJd3l3MkR4NWlENUxjNjE0NS9hWVREY0gxNDN0T1BlTGxPWTRIdzh0?=
 =?utf-8?B?Y1hobTdNMXc0M2lHbUtTOC8vVzFuSXR4ejB1NUZlTTJFMXBTR2FveHFhWVN4?=
 =?utf-8?B?blRSUDBMTTY3T2RKVk5IQmVqY0xvQmpXSU9FU2tSZ2J2ZDl4OFAxNEFGZ1dw?=
 =?utf-8?B?VzRKb1VsY3ZlbSs3ZDhlN2Y5WlFpZHpNb00xWFl6ZFl3YnBYUUl4dWVpTFhu?=
 =?utf-8?B?RkY3UndncCtJQmJuNVIrdURId2ZtdHRxd3hhdzVEVnI5WlJESlh5WGV2Q1ZL?=
 =?utf-8?B?ZTl0MS9WTWlyMzhtQ042cG40cWJDcE1yNEtGc1NNZkFSMlZEcTJqT2N3QzN3?=
 =?utf-8?B?YzhVMTNoZDQvd0xhRll0Qm5wT0MrdC9MRmhXMTdvWXhPaTFHa1Z3TG1oYkoy?=
 =?utf-8?B?SHplL1lHUEtHTWwxa2xxdytSVnhoZnpFRWd0OVlDYkFXVFdKQkV6aEF6YkFB?=
 =?utf-8?B?TE5INlhOS29oUXZIbXdGSDBkY01rUGxvMmpCeGc3QUpVTVhRS3p1ZTBNYzBP?=
 =?utf-8?B?R1Q4WXMwMFdVbm9EMGFQUXl1N0hQcnovMTlKdXBDUzNRL2laQ2NsLzBKc2xz?=
 =?utf-8?B?SzErM2d0bVZjVXNCNWZIRVcvd1g2cUdXTjROZDdTd3NseG1jRi9mSWdqV1Zh?=
 =?utf-8?B?aGpRQnQxNS8xa29seWZ6dGMvcXJxTmtNTnFZQnRPZ0JKVjhXU0lFTEJrVW5l?=
 =?utf-8?B?UXNxaExlVXdlSGFrUmpuaSs5VTFzOHNFNHhKMHh3bGZzQVk2T2E5bWZpUHVq?=
 =?utf-8?B?c2VHVEI2cnJCYmVuYkNXZVRpZU40NEkyTWwyM2o4UVQ1cnVBUWtVanBoOGRn?=
 =?utf-8?B?TGNPdSszVEpiU24rZDU5b2tLL1hwWU93SUFCaVVvZ05vVS80Zm11c0RIYlpG?=
 =?utf-8?B?b0xxU0c1dUZpWmo0andqVllsd0FneEdyY2ZaRTNyZ0lXQnJNUEVBYkJqQnJj?=
 =?utf-8?B?TGNyZlJlK2VDbXBjN2ZFbm9uUFdwQ2FhRGpkeUxGSlI0RnBTdVgvZ0swMmwz?=
 =?utf-8?B?b0o4MFJMTjhid1FUWjlMSmg1Q1dCN2pGU0dlL25XRCtkRUJqbzFYVkg0ejhU?=
 =?utf-8?B?UmhNSUhGQ0dKbVJETjZJV0JWY3RldmNTYU03WTFtamtxdmMvbUg0UFl2S2tP?=
 =?utf-8?Q?3fHs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0U0YWpBQWxJNkZuVDRiNndOWStXZ3JmRE8ydEQvb3NocmRVUWkrN3AxTmNu?=
 =?utf-8?B?em9QOGVuTnFIZmFuemJFMWtPdEhSSkkrRlpkWFpvckNURDFDbXN0TTZNa0dU?=
 =?utf-8?B?UHJjYmQrWGdJL0dqVDRoNXY5Wk93MjN6aC9EUFRJS2FKZk95SDdlaWFJYWpC?=
 =?utf-8?B?TE9xdlVKUnhuU2RMcDdyUnRaWnkzaUNuVm1hNHpaTk10SXdaL1gzSkVISTJG?=
 =?utf-8?B?UVdiTE1jY0o0T3d6b0NGSlJxQ09oOHQ5Y2dJcTRsNnhHb0ZSUExZSFBEQVdr?=
 =?utf-8?B?cE5sNEtPMXZrYjFZN3FINjYzSDYzYytNQWtqK1FaMUtNWTFkaFdmVEpMeC81?=
 =?utf-8?B?TkJGRHlTMHZieWdTV1JEaC90N253KzEyQkFadzdpNnErUEQvc0xpWmQ3RFBQ?=
 =?utf-8?B?dGlBRjJXa2wyMFB6L1Uyc1djb3RBSnVyemlHSlRWaHBnL2c1R2hsNU5SdW5D?=
 =?utf-8?B?MXJXR3hiejBoQlVqbzYwanp1c0pvQmJ5UXlLZXN6amozZHdDVGlOTStMa0NG?=
 =?utf-8?B?ell6UEhtSmNYc1lTamZCVkpkcUpwNGlBa29wekwreTJkV1M3QUxhMmpFeGkr?=
 =?utf-8?B?d1lqYTljQmxORFYxbU56WS9xOC82Snd3L2lmU0JPdDZTbFVUOVppSElabU5u?=
 =?utf-8?B?YXpBbjk1cFlOQSt6SlpYVkhYbU45bTFVcHJjWmd6M3N1V1QwcUVzRkh4Rktt?=
 =?utf-8?B?bzJSc1d0b0F2YnY5czhZcWpFNUNtSDZKWmJLMGY3ekhsVW5GV1JSMUgzOWV6?=
 =?utf-8?B?aTJZbFZrUUM3WjQ3U0tSZjhiMXVTVlRldUpnaGNwV1RvZ2MvekFncVMzZVVk?=
 =?utf-8?B?Z3dvemp1cTU4Wi9wRW1Ya29vdUhzOWQ2MWJWRGtaWTZEcGd0TDExZWU5dTd5?=
 =?utf-8?B?UDllekZYaWlRZ2hxVnA5TWdmSnd4UlJPbmlSWThWMXNTTVl2ZE1rYXVrU0JR?=
 =?utf-8?B?TDExZzVDS00wcml0bWYrRnIzK1RvaFNnQWhwWSsxdDZOMnRIZmdQVXpBaWZu?=
 =?utf-8?B?UFJqRjRhcEsvbzBOSzRaUjVHRjczRWtYRDFyN2xVSHpUZWwrRi9GNVZaQldM?=
 =?utf-8?B?ZGNEK0ZRV2d6eElsWWhwWTNzNXNHUzVYUlZnMkJUdTduNEpCN2hDZWh0UHJ3?=
 =?utf-8?B?eVQwYlgxbldHdGZ6NW4rdGJxUTdWZUtyRE9lYXh1a1V3eGx5TURVYTBhWjNq?=
 =?utf-8?B?WVZQVUhES2w4UUNEN1NreGFsbDF3NHE4anE2eGxGcXFvTFNEOUVnMTViOW5V?=
 =?utf-8?B?Ly90N25CL0dJZ0tibzBNS1RiYk0yQ0d1NUUrVGE3RWpUUGM2SDJ0Z1QzZjFp?=
 =?utf-8?B?b2g1bGpqS3ljai80aGlMK3N6V0N5dE5TRERXeE1NSXRjYkJKbHIrQ08zWkUv?=
 =?utf-8?B?L2hXUVVJQmtBakt0aXNMWEVwS2xSOGdLVHBSSFJPWFhSa3FLS2xmVEJDT1dW?=
 =?utf-8?B?eVdHdE44aWFFU0FRdzRPTWtPQXYwZFc5TGxaQjVuc1VLNDFtNlRIVFJKbVJX?=
 =?utf-8?B?dkpjK3UzRzhNdDlucUpmVGRzNjFXOXJsd2xPdC9FeHdrNTFFcldQdWRGNmg5?=
 =?utf-8?B?ZW5CdE5icitKbW80anBHRk9QZmlacDRFWndVNFNRZjBqUkQ4cTlZVHo0dDVF?=
 =?utf-8?B?WHQ2UVpJaEpvTGd0elhzMmcvbjRKYThTMk1hY3g4L2NPdnpOYWtBbGJmeTVy?=
 =?utf-8?B?ZGVhVkx4SFFYRWhKeWVtT1hrS1VBdTcrdEtOemNLWGVReFl4SnN1aGFHMHVv?=
 =?utf-8?B?WWJEQkVQTXh4a3Izb2NHdkZCNFkxallqcDc4UmNMMldPbHAwRGUzNEhnVTVw?=
 =?utf-8?B?RnFURVA0ckFFZUVoYmRLWThGRnhpb0R2Y0plNkp6eG9CWWdlZzRuZSsrcXUv?=
 =?utf-8?B?aTRvZFc3cVZjenBTc0ZmNlY2UXl6clpRdHhyTkR5WDhMMWxvRmw1ckRSWW1J?=
 =?utf-8?B?eWV4Qll0c09veVF2ZlN5aXJGY3hvMzEvR0JTMzgramhISHlQbVl2WGFuUmtY?=
 =?utf-8?B?WFg0MzYrZWp4bUtKcVhMbnZrb2poUFhiMERKc0xId1lJMVhRdExpNk5IWk9W?=
 =?utf-8?B?RzNSUHp4RDk1dGtqYUJxdzJMWTBCQmxBbFJGNWRuK21TNEI3Vm1INitkWHZP?=
 =?utf-8?B?ckRFUHJXZ2ZQQWJXd0ZPV0Npb3VKY0FXRUVoRXgrNHN6V1RaYm9hSzlqYmVQ?=
 =?utf-8?B?ZDZtWmExZ0h2UHVoRHZZSk9PU2RQb0RuWWpudjVyV3VmMjlRcEk0WmVHcmJh?=
 =?utf-8?B?QW1kTmtLaitGSzR5cEZYcEVpTUtFL1lYM0dCUk1sUnVwdVlSb1pGaXhzRUZo?=
 =?utf-8?B?R1ZhaENBOWx4TWlyY3ZJRC9ZRk1TbHJQU21hMUN4c0FsSkJXUE5kdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fd489698-3e8e-4d35-e0a9-08de5aae4341
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:36:03.2962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cG8wtnSbZOp7COLB8PXQgI0I99Ge64I14s6CMuUY1u/ThHH6bC6pnKBnSU0t5y5mk0MemPfJVIhsgLjR/9v0RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7886

On Thu Jan 22, 2026 at 10:28 PM GMT, Timur Tabi wrote:
> Note: This patchset requires "[PATCH v3 2/7] rust: io: always inline
> functions using build_assert with arguments" in order to compile
> with CLIPPY.
>
> This patch set adds basic support for pre-booting GSP-RM
> on Turing.
>
> There is also partial support for GA100, but it's currently not
> fully implemented.  GA100 is considered experimental in Nouveau,
> and so it hasn't been tested with NovaCore either.
>
> The latest linux-firmware.git is required because it contains the
> Generic Bootloader image that has not yet been propogated to
> distros.
>
> Summary of changes:
>
> 1. Introduce non-secure IMEM support.  For GA102 and later, only secure I=
MEM
> is used.
> 2. Because of non-secure IMEM, Turing booter firmware images need some of
> the headers parsed differently for stuff like the load target address.
> 3. Add support the tu10x firmware signature section in the ELF image.
> 4. Add several new registers used only on Turing.
> 5. Some functions that were considered generic Falcon operations are
> actually different on Turing vs GA102+, so they are moved to the HAL.
> 6. The FRTS FWSEC firmware in VBIOS uses a different version of the
> descriptor header.
> 7. On Turing/GA100 LIBOS args struct needs to have its 'size' field
> aligned to 4KB.  So pad the struct to make it 4K.
> 8. Turing Falcons do not support DMA, so PIO is used to copy images
> into IMEM/DMEM.
> 9. Load the Generic Bootloader from disk and use it to boot FWSEC on
> Turing and GA100.
>
> Changes from v7:
> 1. Fix unused warnings in some commits that introduce an identifier
> but don't actually use it until a later commit.
> 2. Split out the Generic Bootloader code from the PIO code into a
> separate patch.
> 3. Removed accidentally included vbios.rs.orig

I've checked the Rust language aspect of the series and on the internal API
design and it looks good. I haven't checked that the actually hardware
operations are functioning as intended, though.

Danilo/Alex, feel free to convert this to an Reviewed-by or Acked-by, which=
ever
you see fit.

Best,
Gary

>
> Alexandre Courbot (1):
>   gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
>
> Timur Tabi (12):
>   gpu: nova-core: rename Imem to ImemSecure
>   gpu: nova-core: add ImemNonSecure section infrastructure
>   gpu: nova-core: support header parsing on Turing/GA100
>   gpu: nova-core: add support for Turing/GA100 fwsignature
>   gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
>   gpu: nova-core: move some functions into the HAL
>   gpu: nova-core: Add basic Turing HAL
>   gpu: nova-core: add NV_PFALCON_FALCON_ENGINE::reset_engine()
>   gpu: nova-core: add Falcon HAL method load_method()
>   gpu: nova-core: add FalconUCodeDescV2 support
>   gpu: nova-core: add PIO support for loading firmware images
>   gpu: nova-core: use the Generic Bootloader to boot FWSEC
>
>  drivers/gpu/nova-core/falcon.rs           | 252 +++++++++++++++++-----
>  drivers/gpu/nova-core/falcon/hal.rs       |  26 +++
>  drivers/gpu/nova-core/falcon/hal/ga102.rs |  39 ++++
>  drivers/gpu/nova-core/falcon/hal/tu102.rs |  77 +++++++
>  drivers/gpu/nova-core/firmware.rs         | 203 ++++++++++++++++-
>  drivers/gpu/nova-core/firmware/booter.rs  |  43 +++-
>  drivers/gpu/nova-core/firmware/fwsec.rs   | 180 +++++++++++++---
>  drivers/gpu/nova-core/firmware/gsp.rs     |   9 +-
>  drivers/gpu/nova-core/gsp.rs              |   8 +-
>  drivers/gpu/nova-core/gsp/boot.rs         |   6 +-
>  drivers/gpu/nova-core/gsp/fw.rs           |  14 +-
>  drivers/gpu/nova-core/regs.rs             |  72 ++++++-
>  drivers/gpu/nova-core/vbios.rs            |  64 +++---
>  13 files changed, 863 insertions(+), 130 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs
>
>
> base-commit: 6ea52b6d8f33ae627f4dcf43b12b6e713a8b9331

