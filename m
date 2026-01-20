Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022100.outbound.protection.outlook.com [52.101.101.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF043921EF;
	Tue, 20 Jan 2026 21:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768943786; cv=fail; b=VVhbikVWr9k9fyp7QpPut2bjQnMqtV6Axp+Ev/aFd3esCVJikdW4kjZCPewQblATVrsrSnthE4oquReAz0lksnje+kVBPIMNZ6uOtP9Ulk78W8OVIlJQZoApxNmF0BQxeQhzBoDlUXkueP1qjnPozWK0RXs2q5yxx12rDo1fkFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768943786; c=relaxed/simple;
	bh=OeGseoAs27e+rVbdzDtxTga0eCPuNtt4m4/hnzSAdG4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BkysZmtTAhV/nInCqRRwSwLluIf6A94Ta3jjNOL0yjOTawG425v7dAyz/eyoCpq7WoNIGsfAHII85ackWFBOzIgYQ1ZNJV7O0VD3KLVYXkxXuFd34FE7pGAiUZuN//73ju+dAm7ACUAMBUTqtp3oFeAd6jenj8sdYOFYevNMeBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=g1B7c7k/; arc=fail smtp.client-ip=52.101.101.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="g1B7c7k/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iccpfdndiACn0IvK6wBFKLDO8HYFWNqzics04UAMDooQRIXl6M9911OUTxeW8qz5L/aCj1FCwtELN7E3cf4w7zAAhqzORZQEyrUC3ITNGlqVWr4UpAaX/sskT+Y6SEuINqwpuFqnK4utcJbD/P0DUrzM10KanxDotohyKVzNImWbh1lDzCwnqVMSKPAp/Hl749CzaiDI6ZP04SddLeEDycp+DN48lpqfTCmkOLcSKxVIAa2Pkh9z1hSfRw61oLJq8sZZzFu06vJyg7fGDVfmhjPOZ6bU+ypqt+d9LcuNTG0bfGU16nJ4knqmkNDBV58G0rPw5Stz6QjsUvDbInuakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjUbckEAq53A7N0QnL9S/8LBOcqyufy31hT0nzRWuTE=;
 b=eOxeGBPJmuf7BeoiF4kGVdVJRovhAr7Ts962oNSxalCSXxLE28krmpnbyUGGX6kgzOws6IDRFac3kKuBwPvKS9nHYQTQ9OSoQrrhqxitScqXVhlWd/vt43Szd0+4xi+LkgC/+/zoUyNWhaP/JbkdPF7cjeknDBx7IKUJSbHSCQDJi+30jS0PCnWVgATATYd7gkc22VipCQcdRhVQhA6IubNgUr6RETCqwxg1AkbHGwyLzpuFQ2lzBiNPuWgl4bP2sOkm3ouYpETzqmSiP7GyCDeqT8lE5xfcYfHMmhGvWQEdu7bHjmY/ZGnil648YAWanzLMw0tkXQ2MGH/5nucH3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjUbckEAq53A7N0QnL9S/8LBOcqyufy31hT0nzRWuTE=;
 b=g1B7c7k/b1bmmMXHXKWu+alJm/Pvi9IsLgOXDmUmNrGFki8Et5CKnJ/RYeThy4XKVRSRjwP0SEL3lTh+hwtUeCmaaUZtVNCN3ba9gENYPa2/x/mSCywG34FX7M5MOjQvbsVRmfsyH4arQZEzikl7ae9lxirAUkq5FCiDk24PZW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6687.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:306::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 21:16:21 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 21:16:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 21:16:20 +0000
Message-Id: <DFTQ8I30EH0A.H7A68JG8VBXZ@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: sync: replace `kernel::c_str!` with C-Strings
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260120-cstr-sync-again-v1-1-2a775a2a36fd@kernel.org>
In-Reply-To: <20260120-cstr-sync-again-v1-1-2a775a2a36fd@kernel.org>
X-ClientProxiedBy: LO4P265CA0043.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6687:EE_
X-MS-Office365-Filtering-Correlation-Id: f765d974-4816-424b-d408-08de58692898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFYwUCtwdldIdG9VU1hpdUIxNGxlbWg2S2JCSG54M2xQMzNPN3pvWlhGazVY?=
 =?utf-8?B?RU5OcC9OSXFlZlI1bFFvelVoVSsvVVFHQ1YzSDdoaENBVmdjYThjaThWMTh5?=
 =?utf-8?B?UnpTTk5kY0JaOThEMkJTVEdyQjF2Q1UxZ28rSmFKTDVOQVh2dGxLbWRlcVhD?=
 =?utf-8?B?TU14Tm9OWVZHWjF3T2NzQzVsbitCT2o0aVQ3YkZubUZETWV4dzZWZFNXdFBO?=
 =?utf-8?B?Yk9nNHMxSWRzVk94WEptbFdVTitZeW1oWHlwV1pMSUk3NEZmdmpvLzhHZCs1?=
 =?utf-8?B?aXRMUmhPcDVPK3dJbHdnOFZjYmlGTml1TFFCTHB4eG5YM2ZFQyt2ZVU4OTkz?=
 =?utf-8?B?WVhhQXZNWWdxbUdzSWtyd2NsMGpuWHFyUFZtVHJkWEw4K0RtdmJrcEZSSUNN?=
 =?utf-8?B?b0t3TC91dTZ2UldmUVFYbFB6dmhaVnpCQ05wR25ncFVhMEdlYXR4T1BjMTZD?=
 =?utf-8?B?ajNSTjBTSUxUUVA5a2xUS0tDSFh2Ynh6YjdWMW1NdWVBSWRSc2xRMGUxNDRa?=
 =?utf-8?B?YkJpYXJkQUFRa1BEZDFIUjJvOGZLMnc0RHROci9KbHpucWtjQ0RiSXFnekRT?=
 =?utf-8?B?V3BvK29ub3JyMkdOTHdYS2ZWUGRodlJiQlE4enRaQ3FMcmhkS2VuUCtyUnpD?=
 =?utf-8?B?cEFMSGc5djloWjVIeW84bSsxMGlBYlVES0hENVBtbmxUSUV0UXg5RmhuSkFY?=
 =?utf-8?B?cFBxaDJwZnNab3ZONEljaG4yZnBsblZXVFRVRUdvd0dncFYvWmlyRkc3Wk1K?=
 =?utf-8?B?NDhZOStlSmNReEc0RXpBelZMY3p3NmV1YU9selFMeEZlQXZQdUwvZEJuanZD?=
 =?utf-8?B?VHpMNHFPZm5LcUhrV0lpeFZxU2pZeTB6UC9iVEhuRjIreHlxMXNGMUk5Qk9I?=
 =?utf-8?B?OTN0T2RLOFFBeGVMTFZZZVp2K3FJYmdRTzJpRGxSVkxOd081cFRCck9JODV5?=
 =?utf-8?B?alR0YWtxSFB2MDVHSTVUc0QxTWc0S0NlcHR1Wm1CMXQxdDZiSTFxZ0NlWHBH?=
 =?utf-8?B?SXJBMUNxQnZQS1BNS09PdzdFT0RLOUx5VzBCR25TeTNFT214K0xQaHJlMnZN?=
 =?utf-8?B?WExiblVOTStoczUySnpzU2thMFlWK3ZSYTlPOTJPczlvRXFGR1ZsY3lUeTVj?=
 =?utf-8?B?T0hXRnI0VXYwWkhCVU5vVlhDOGFaaDc2WXVGSFRLaGZKbmZsL2F2c3V4S3dn?=
 =?utf-8?B?SWV3bVNmM3V3T1o3M2JobUc1WjYrSVlwNDBnTGJDR2hBL3RjdGJvbUVNanFs?=
 =?utf-8?B?UkpVRnlPOGNpVU4wSlpPRHhXWmJBRFZXRjJDSHhBRXk4aW5kcm5JenNmRjA3?=
 =?utf-8?B?SSt6WFZSMWF1RGpSKzNndTFmRlNXM0NQMTk1VUVXa2NkVVZZbzZXcXRFMW16?=
 =?utf-8?B?d1lhSEVFR0Iremw3UkpNeDdDZ0N3c2k5SC9RRk9IaDBsRWo0QklmbDBzVStX?=
 =?utf-8?B?UHlZaFo5eXNhUHlwV1NyT25pblJGNWFKb0J6L3o1YXVsMEtPOEpaK0IrZys5?=
 =?utf-8?B?VWczRnNJcnBxQThBSG1HOXRrVktodSt1bjJtVDVsb0FvYXVCM3VjcE1LY2Iw?=
 =?utf-8?B?QnQ0cTVmZW1sUEUrYnQ1ZUJBN1kxWU5haXBOR2FSdTk5OUZFYk5iUHNCWThH?=
 =?utf-8?B?ZmpQTHA2VnNFNXB0dXJydGdndjQ1ZmJXVVM0dUlZcGhlZTdRUUdGdVhPcVdJ?=
 =?utf-8?B?Yk9BeUg1UjRhbEhpYXBSM24rZlhKbFVUdWJMZTRZYTJxK0dPOWpiRnJhSHFJ?=
 =?utf-8?B?Sk9raWJnNXgrcFc3UTVKa2I4Z3FlTm04ZjFwVlkxOU84LzJoS0tRcVFBdWt2?=
 =?utf-8?B?VGNsTE85MitzWlNiZjNUQUUxYWdpbERWaVJWMFBOK2s5TUJLMUJMdlBHUlRG?=
 =?utf-8?B?Ly8vTi82WW5Ob0k4YkoyU1hyRWo0U0loTkFEc2tRVjJjWGI0MnY1RjNiY0l1?=
 =?utf-8?B?dHBROUZHZTlNN2RaRFRHR2xVNnJyYUZFY1JBV0xKZE9JWnMyeDZ3R2t3RGIr?=
 =?utf-8?B?bktzTDFMaUhldExuZ0o2TjFrSWJEY0w2S1AvY0N1SjFXMS9lTVZJbUNBaUxx?=
 =?utf-8?B?SkFQM1BKNlY1S05QV1dRSTdEOEQwMlBockdzM0xEUjZFTFRZNmZKdU43Ry9U?=
 =?utf-8?B?bkJGcjNyd1g1dWhnd1dpUmpzYmhUa2k5L0JYeThYdDVQc0JzdEg1QStidE5D?=
 =?utf-8?Q?EeLN1TjZ3hgYXxdvO77ZQQk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlM4RmY5SWkwUFZxbGtaNExJRDZ3MGp4Vlp4ZmM2c2p0bTdQNjR1U0UyeXlN?=
 =?utf-8?B?eEQyZ21XWTV1R1prTEExdU1yNi9nOExtTDR6aVpGK0J4Q3Jod3VXcWpDOXNF?=
 =?utf-8?B?VGJqK3BjK3hCVXJYeDVCeE56YllwSHNNdjdGVC9BWUdCUkw1eVMwbXptMlZY?=
 =?utf-8?B?YTRkbFVjVG1DUUxtRzhyYVRHYkZxc2twNlpJWDlrd0ZaM0xHMWFrbERVQ0kr?=
 =?utf-8?B?TUsyUjljT0RFTXIvSXF0c3BMZ2pIZ1dXOXpGZzYyUEFUZk5vc0RLZklSbFNj?=
 =?utf-8?B?VG5PcURZcElJK3dlalAwWjBuSms0ZjBhOVhQY096bExQSkFkN3k1M004L2Fy?=
 =?utf-8?B?dmJoblI2SWwrUkR3a00wQy8wT29NMiszZldoOWt0OTJPa3NqUW1oMGxuRlRx?=
 =?utf-8?B?M1FUR28xQUV1WFgrd3lDVWZJOWUvUzN6Rm5FL3VLNVdPRXVoQmxacjBjcFRC?=
 =?utf-8?B?NCtab2d6ZlZOVURLRnRYd2Z1OEcxMEV3NE9EYUtxaWQxY204RHpYQ1BuOWZS?=
 =?utf-8?B?TUE5SkVEWloxR0YvVXFOaUREQkJjKzV4MXQzaDdiMU1HZkRiRUJZY1FqZ0Ri?=
 =?utf-8?B?eDZPRUpTRzBUVGY1MUc2ZERwOHl2N2dSOHN5L0E3YjA0RlgwdUtpTnNqQm0z?=
 =?utf-8?B?UEhYcEZRNFlIVFQrNFVlK3NYSTllM1hNRzVKckY0MEp1aUdxb0tVMzIyMk9v?=
 =?utf-8?B?M1R6NXE5SThYYjE4eTkrUWhHOCtVenNGZ2VvbCtydUhjOWJmR3psemFKbEpi?=
 =?utf-8?B?TW9Xa2Z5VHpOK1A2TTZ6L0x0cHNqNysvY1A0MXdUSzJWa2I0cFlPbFBSblBP?=
 =?utf-8?B?UjVLOVMzbTgyNEdzMkFOMUlKRTBHdHpBOU9xQ05PYUpZY3hCUFRjVnhEVUtu?=
 =?utf-8?B?MWxRVjFJL1pzdkxtZGhKVkRlS3NKY2dsQzlkaWt1aXRWekF1UHVzL3dOeFBw?=
 =?utf-8?B?UmIrTktuZWxpUHEwK1dLTXFLOFZpT29MQjNOQWtPaGxRYThidHpmK2dwNGwv?=
 =?utf-8?B?aHExZlVIVVc5enVwTDNPNldkL0RrOGdSQk1qYnc2Mk5GaDFXeUtaUnpiRDE5?=
 =?utf-8?B?cVBwU3hhZnFTSkNwZW8vYjNjMEJLdHF5UllkNmYzZDNOL1NlOE9nSnNKdjI0?=
 =?utf-8?B?ajkwU2RDbEJJdU1EQTVidU1xdkMyZk9VZ2JPZ3BPNHdxNGEzSU1Ic3FWR3Zr?=
 =?utf-8?B?ekNSc09FNmNzMzBrNjNDaTZIL01EaThHNzFPbGxRVC96MGxSdXkzK1FYTFEw?=
 =?utf-8?B?dzJMdVdWK1Y0MDZJOG5FK2RnK0dwYURLTVdpSlhVdlBrbXpXYU5mOEZWSmJQ?=
 =?utf-8?B?ck53Z0g0aDVIRllxMlFIRmNOazRIRmo4bTVqSWVBVG9RZFp1TDJiTUNDNWU1?=
 =?utf-8?B?czJvTzVQanhFcjZvYWM3OGl4dS9KQmNsVFdya05oS0FSTUNwWXJuVkVwYTB4?=
 =?utf-8?B?WitoaGQ2dDNJSzRoTlp4S1hUSyt1OE9mWmtnZ3d4VGNRZ3p4M1RGR2NuMmJn?=
 =?utf-8?B?TTd1TmcxdGhwakt1TFlEN1FSY2dUalJ4REtmNWxTVnVnTzRyNVlKUzRIcjBP?=
 =?utf-8?B?bkFFSFVwZkxJd3ZKUnZiSnRlb05XYVowc3FOMW5rNmV2ZUpTRGJCalVTR0tR?=
 =?utf-8?B?L1JlTVhYaU43d2ZZajVkcTR2TC9MYnN0ZmpraHJiZllmclNHcm5JeHdIYk5p?=
 =?utf-8?B?b2ZudGpFd25EcXNwVjBmOGhUdUU1WXFkZXlPbmsraGRRYVdOTnNlYjBSVlJu?=
 =?utf-8?B?YjhTRTZ3VXFKWEZKOGRlYkxGeDdnejJwSlZSUDFQRTVqem9wY3F1K29zdEcw?=
 =?utf-8?B?SXB2RitkbUVmL2NoY3BSKzZnSXJkdEVDRWtpOXFxMGhhd1BudDc1RHVFV2cr?=
 =?utf-8?B?TG5qait2dUV2UEdSRThBOEdqKzZYejBzdUdnVTJGbmZMeDc4M0ZpVEExOVJn?=
 =?utf-8?B?KzdoMm9uVjhOMm1QRHQwelpXRmtpOENJazZVS05nSy8rYUt0dllCU05Cakhy?=
 =?utf-8?B?Ym1jRDFmZjlxMUlNcGVqV0xQTTZDOFZ1L3ZjRHQxVTRWMVZldHozdmN5dUdY?=
 =?utf-8?B?Nyt3bElOQ1BnSnkrWC9JRmhNNW5ybFllZ3ZPcVdxbmtjWUl1ZzBldnprOGw2?=
 =?utf-8?B?WTRJQVJ6R2wvOGFkUDJISnArRjFjUkVrQWVmTGpoTmFORkI3TU8xWGtXOHFx?=
 =?utf-8?B?cklERnVJZXJJUkFjWjlMWlJLd1VmaU5HVmdxRXJzbGZ0NUZKQmdod0l1aDkx?=
 =?utf-8?B?SUVXVkxRVXp6NDFkWWs5KytDNlk4bmpkOFp6bTA4b3RXcG1KbTZTRnFnb1hs?=
 =?utf-8?B?ZjFadkVqbTJaOW9yN2NJRi9SRVBBYUZQalE1WFB0Tno3WnZqdFdZUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f765d974-4816-424b-d408-08de58692898
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 21:16:20.9877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i24yQYpLAzXwXyqty3670n/sI0k/IpkX5KCiElOATizyciOkT4rerVxwaA7jT737Ewna3oShC/ar+EdlNk2iWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6687

On Tue Jan 20, 2026 at 9:13 PM GMT, Tamir Duberstein wrote:
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>=20
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> This is the same as my earlier change[0] but applies to additional
> code[1] which didn't make it to mainline in a timely manner and is now
> queued for v7.0.
>=20
> Link: https://lore.kernel.org/all/20251117-core-cstr-cstrings-v4-1-924886=
ad9f75@gmail.com/ [0]
> Link: https://lore.kernel.org/all/20250811-lock-class-key-cleanup-v3-2-b1=
2967ee1ca2@google.com/ [1]
> ---
>  rust/kernel/sync.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

