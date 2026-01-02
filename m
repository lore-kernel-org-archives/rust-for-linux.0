Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020115.outbound.protection.outlook.com [52.101.196.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6005D15E97;
	Fri,  2 Jan 2026 10:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767350211; cv=fail; b=ft7S88XSA9r5oePNrwp2YHH2jiRZskvmoUI0JW6LG853kpI8lotMPoSavDXWEh9x+YIoxYCOYKweVuxob9aoDsy5W7nQrOrjM9ymApW6OWRj58fg6PmgfVJNIG7z5jVNJdyuykuGoEFdzLi3C04NTFbkWbghuGTG6tO5svc3ezA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767350211; c=relaxed/simple;
	bh=nL5WFo/I+aqx+QjJzPXWtmm6agLnqj8h8ALOqAFejTU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CqwFEift7uB5KXnEvX1Xcm8GQeo2By6j45xci1DGoUho80ATJ+ZMnsGsvb1S6r9guCJi1pOAsxtLjn4M1HYu/VBoC1xZtat7G+4QREFK4JRjT5xk2YrLxT+Gr67PyapWzyHu3JpfTkfRqTpQDO/H5vVqshLBP0WcHRRW2o//tSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=vgocW8Qt; arc=fail smtp.client-ip=52.101.196.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="vgocW8Qt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFl4gBVco8EWJ8Pn66a0egkNKbZkVcz5V27Q8zTsFC341cUNUlukunZKpkzDFPeV4UH7hEXXYeJDi6lINvN6MGPH+JJHVhyUZQs5mQj85aAPDGjDEbZLTvY3EMtPRJLgrrrsIz5B9OAEqXg883p4rMQ5/aDMXwyvXziPeNwFVqSsyTECWOcV/VljyNKPhzsXNzM5QlFPSrCIieDHFCNFa03oHLVWGspMfavQXPrar6UcWTFz3U/nAQpWIVqaKKtgn2zvus9ynn+PUEI/iJenpzVCPNDL3xe1rS24P2AZJKN0zXgNQa7+Bn3e4tAwDN2Ss0zV+Bxcm3yOLiLTTWo+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mww9dkKVhuRsM6o0uJd4vyBIiCCbIkw7ujQBOEUdnxU=;
 b=B8ChLrD+cst5TStSrkhuNGQRbBwPvkcRXIFY45U/cwXn1DrfY79GhTm1PrAUQ6cv3E1ztUl8FTxDeejkukaK9rhtCNVdUQtkt3LwKPkAxhERyTkaKIciqIQVMfgi28aiY+vBZQk/2pYolJDlkCeXozMicatfOfW+ffg1s++5cnijRvd/ZspdWj0o66f5eyA95EZt2PaS9DI+Py0R7WMiWwgES2ALBycl1+EF1XxknMMOY+y3uto/oP/3EbTXqVm+SY912qlcN8NUa0hAD1Q1oFMWDI5siweVf2ejplTRKrIRQ/aqZk8fdghUclxMeYHhyENIegHDO7Zc0DYb6Yytow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mww9dkKVhuRsM6o0uJd4vyBIiCCbIkw7ujQBOEUdnxU=;
 b=vgocW8Qtd1p1qpgIC32Fh+K+qI6y/4wJYiqQCTlE33qjZ0EnK8c7cN0EvTP0NuSatxaNfy+QLmhBE3B86COY8CPeeRWMti/ru6inqcjvWl3pg6npUJMsuid4YB/LM/fp4/dBdAp85PmR1VmgSYbA1uMqyUnej5QBN8vP3SACZgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2165.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:80::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 10:36:45 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 10:36:45 +0000
Date: Fri, 2 Jan 2026 10:36:43 +0000
From: Gary Guo <gary@garyguo.net>
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: generate_rust_analyzer: reduce the output file
 size
Message-ID: <20260102103643.352fd5c7.gary@garyguo.net>
In-Reply-To: <CA+tqQ4JF_ZO63U4GiSb6+Ym=m=81kN81xr8Q2q3qypYfYQinxw@mail.gmail.com>
References: <20260101-rust-project-reduce-size-v1-1-4cd66e9e02d9@gmail.com>
	<20260101220903.0c099099.gary@garyguo.net>
	<CA+tqQ4JF_ZO63U4GiSb6+Ym=m=81kN81xr8Q2q3qypYfYQinxw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0364.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2165:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f813bb8-10a0-46cf-0f32-08de49ead39e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVB4TU00L1Vob1dGcm9nQXYyZVdJYXZGaFE0ZGF3WkEwZlZVZmRLUTNvQ1Rh?=
 =?utf-8?B?VEJWRklRK1F2dStGNFhWcnBoL3k0WFlyUUhuWk1ZQWpIZU0zdmE5ZG1FT3F5?=
 =?utf-8?B?dklqV1ZETy95RUsyTEIxcEZpRGkxbW5NT29qOERaZm1PWFNDSWhhN0tJSWhU?=
 =?utf-8?B?MG04N2ZuTDJWeVJCNGNYY2s3RmpVVndqMHpNZ1R0dE9qOXE2T2FCV24veGp1?=
 =?utf-8?B?TUN2YkQ2emhCdWVMR0lQNGlRUzVRU3pDNEkrUDRoU29RZUh5UmZMbytQUVZw?=
 =?utf-8?B?Ym9xdjYrY2pQQVAwVlc5UkhuRUNnc05VMWJkT3AvdE1MUnNNV2haTDEyeTJ5?=
 =?utf-8?B?WVVlTnMyTG5GVFVGZUVkUG52RXhWQVhWRUhZK3I4M2xKWkFzSzJwOHdjOHdS?=
 =?utf-8?B?a0R3UW9rVFJRSTF0eHRpS1JtMjZLWU92TFg1Y24wb0R3TWY1MmZRMXdiRmgy?=
 =?utf-8?B?UUdkL1U2c01hOElMbjZTQmhZdm9PQm1hVDg4NWp5aWpXRzcyTnY0ai9mRzkx?=
 =?utf-8?B?UUZLejBpeUVQQXpxaXoxa0dGdDUvNXR3NmJXUnpwVS9nc2QyY2cyRlFVaWJM?=
 =?utf-8?B?NzFpN3pLb2VTaE9rZHl0MnVHQzN1VkwwclBhWjNUaDlKS09ZcU9kMU4zSWdD?=
 =?utf-8?B?V3E5RmduT0NXdUMvUGFFMVVMMmlhMGphNDhDdlRHUnJrMWw4dmJ5NkZLRVhp?=
 =?utf-8?B?bFN5LzVpdEozK0pWYXFtQXF6b1dQYUJpczBCa1p2ZHdUMEhpa2NHSTNJd3lk?=
 =?utf-8?B?b2RSK3RqSW56MmRVQzhMM2ZjVlVWOU5kNnN4Z3pGV0VlSTBjd3lOUE9NM0xH?=
 =?utf-8?B?U3c5Z25WNnNzSDFBeHU2NHh3c3BIYlIvZjJIWmFDYm4vVkNKamRHNHZHbDhk?=
 =?utf-8?B?R01hL1Q1NkRIZXJ4MEFIVnQ2SVB5QzhFN0ZkUGNLOHYwWmJjVVE0akQ2cDFI?=
 =?utf-8?B?UTEwZkFiU3A2dkJKc0tqZ3YweDFWU3pFdUtHR0I5T3VOZHk4aFFuNEdPci9s?=
 =?utf-8?B?a3c1THZkSGxKYXBDak1BRWZjWFBRRUhOcmxGL0o1aEZGOCsrUzMycTJ6SFht?=
 =?utf-8?B?ejdKWktqUWRORTE0cjg3K0pyVHJ4Z3YyYkZXUVlVV2ZuaDNkY3FJVjFrdmhn?=
 =?utf-8?B?N1UzcWpLd2h2ZXRvdWpRK2tCRnZhSExXSVVKSDNrMld2U2pqNXNyK0hONHln?=
 =?utf-8?B?MHF0SnhUSnJhaDY2a3plcVRRUWZQNU9XazM4MndaditsMExHV2prUFY5YTk5?=
 =?utf-8?B?QnNHeXFmb0Qwc0NBS3ZLeUg5bk1Wb1grM1JEZlJZNi8zckIzQ1VDTktHRXVs?=
 =?utf-8?B?elhxSGRjeFVUbEc3a2crZVZPRjZRVWNBcjZsaTg0UHVZTEVjekMzQ3NNNm9Q?=
 =?utf-8?B?a2pwem1lWDdMNUVnSUQ5bHUvQmZFMjU2VmlvQi9HbGpJVTJiOERUK2E1Tjh4?=
 =?utf-8?B?ODlIbHVSYXl1WGxHVVJFcVlaL0JQSVdCNlM2a0pKZm9tc3BPWHI4TnVjYkRU?=
 =?utf-8?B?TzFtUXRuRGQ3TmFDbWRnbGtUTUVCOUdHdkZBdlpodXdGaTh2bURIYllDRnhY?=
 =?utf-8?B?TFAzdWlMblF0Ky80ai92alJDeVRybGluWXVoUXliVGlQdTd4N0pPYUd5djhM?=
 =?utf-8?B?dGt3TWNSd3RzOHFTRHdjckVwL3ZqcU1kcDVXMTh4SUxvRm1Jb2VQcmZwVEQr?=
 =?utf-8?B?SDArTVZycWk0OEZodTZrd2RNNWdQOUIrTjVSYnBEOERYeHNTdzcvcHNDVjk3?=
 =?utf-8?B?ZEZIMFc5Zy9oZXE4T3RvQVpTSDAyWmJKa2NqU3lITnZpbi8rQ0d0MXZ6RElu?=
 =?utf-8?B?S2RNU243Vjg2RkZBUVFKYlpwOHZLNkF3aGJiK3hCSDVFNWxQdVROUEs0RnpG?=
 =?utf-8?B?cjAvdCtnTXdFTFlGWEMvSG5wRm0wT0FaOUh3SzVsSVJ6Znc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEhXbkpiS2JEandNUFM1M1JCSzR6a3NSeFB5MWpXZ2Z4OHQ3Wk9IQnlBdEhS?=
 =?utf-8?B?aG4xTWkyQXVITlcrTVc3WVZnbzlkdkN4SHB3d1c1RUpLWXcyWVRMbVlpRXdj?=
 =?utf-8?B?Tm9tVjlPWDh4cTlPZWlpNEVTaHNGTFBYRzR6NlNVSUMwRzN4aHVPdXNpdnd0?=
 =?utf-8?B?cXg2a0hzMVlDTFUzNmMwUXluc0VsQWVIN3VYT1ZKckpzM1ZGSTl4Qkk2UWtK?=
 =?utf-8?B?RGk1MTZpQlBpOGNWeDNmQm5uWUl6TEE3V2xmMTQvekgxdStlN28yTW40cVoz?=
 =?utf-8?B?eVVaS1pXZjZqOW9kTi9BMzhnbkV6akFKSldvcmcybm9YU3FJVUFIZmo4NzI5?=
 =?utf-8?B?dDhjMDN1enpvbm9UekJSMk9veUdnMDZPWmtoaFhvbUZwd3pmNll4T0JsU1dx?=
 =?utf-8?B?NTMrTFZhdDJOdjlJR3lTN2haNnN1Tjg5aHFKNnA4dEdGdzJ6Y2cwWUE3QmRJ?=
 =?utf-8?B?N2lHcmVvWnJpY0RFNk9TUzFiTFV2OGRaSU1xL1BQdXp2OWNyL1ZiS0M4OVV2?=
 =?utf-8?B?Q24wZjFFZUF1enA0YU8xWWdLTUhUVXJmWHZVcGVGbHJrVjl2T1ptWWEzQXZu?=
 =?utf-8?B?UFdSSGl5aGJNQnFCWUdENExpejFoNWxqK1NVbUNNNGtXYktTcWZIbzhuVTF2?=
 =?utf-8?B?N2phMWZaODVhbU5BTTRtMzBqZS9xcS9UeGR5emtvQVlrb0tkdGZ2b0VzMlJR?=
 =?utf-8?B?SmRoc0tUSmUzZ0RhMEFuZ2todEV6NUtHUnhmclkzRGpDeEZhQTQ2d0w2alZR?=
 =?utf-8?B?a3JNbmdjdWQrQ013NEUwTlFaLzA1UWNLd3IzbDdmWHo1NEhjV0taVGJiS2hZ?=
 =?utf-8?B?S2Q2ZzNia3ErTEh6RHVFdjROVFFaRjMwaGhSLy9pc0FQVkNvMnh6ejdqSGR5?=
 =?utf-8?B?S0FQQ0FqVHRpcEQwZHBzcFViWkRwZmJOczNrVEw0U1lyUjQ4cGR6cThoMnZW?=
 =?utf-8?B?U1NoTldEeXJDTFRQcWI5T1NaQmh3OWpSbHFhU1Q2d3plWDloVkwrOHlGS29Y?=
 =?utf-8?B?WTFzVEYzUWVmSWRLZi9lVDF4R0tGUTFFZ1k3b3FtbFJ4cmw4SU8wQnBTUXFD?=
 =?utf-8?B?eXFUMmhaUlc5V2FRYm1DLzhIbUlGcVdKa2xEOVYzZzZ0L1Q1OGlOU2dtY0Rv?=
 =?utf-8?B?Qk1TOGpLSGdDYVNCRnQxZVpERmx3MVBsWDdVdVpGQzdzVzlZRndmclM0a1dw?=
 =?utf-8?B?OS96NHBmZURqVmt3TDE4MjViVWc4VVlodnRSc2QzZzFwMHJONVo4aEVIVENr?=
 =?utf-8?B?Mm9PakZLMWsrRjV3YlBEdDZMTTFiOEswZWN0QmN6dzNSM2QvUFl5Q0VUS0N4?=
 =?utf-8?B?aXhZaFdpcGhmQVh0ZmljUVBCZ3lHc1BFTUhPWEt0N09WMlg4UFExN0VSbHVv?=
 =?utf-8?B?SGF1disxdTREUTdaemMrWHhHYU5SK3ZIT0toTDEvRDlhNGRNUmROVG5SWkZ1?=
 =?utf-8?B?clVhZTlYTmY1QXZ5WXZBMGNXeDN3a1FYNnprSm9BWG1FZ3A5N0Q3aXk1U2sr?=
 =?utf-8?B?cTlCaTkwbko5eXVNSDJMck9obDJHWVFNQ3lhMjNpR0tYbnNhNEFPWW1uWmx5?=
 =?utf-8?B?cmZQb1c1SXlFeFRhbnlYcGJUdklIaFNaVXZrM1JsU1ltaGx1WHVLVmx2VXR4?=
 =?utf-8?B?NGd2NVAzNVZhL2hLSlU3VHNwd3FiY2lxOXVKb004Rmc5Z2c1SUgyd1lPVi92?=
 =?utf-8?B?eEpCUXhFVklkUDErQ0p0cmZuV25JS3RLM3RiUS8rbXNBNlEzOU4wZ3lqeExR?=
 =?utf-8?B?TXFPTlVrL1g1S0lSdmpDQ1pVZzA3blo4WUlsNmRTRTFDMFluQ1lSZXZrWVp5?=
 =?utf-8?B?S01XVlEzRXNpZVp5MlVPRTZtZ0NRL2VhK0hseGwxVk5pc1hxODFSV3BwOWp2?=
 =?utf-8?B?aFVnZVRCdWlRdU5raTVVRUxUdjlGb0R2YjJtQytJNlluRE5WREZpM2ZQT1cy?=
 =?utf-8?B?b0ZaK1c3QVBYcE1FMjBJRDErOExWbUJyN1lPYkczeVRyR3luMUw4VThScy93?=
 =?utf-8?B?cnJYamxtVDBRck1na1o0YkhiaTlOUllLMWt1di9vUXF4ZkMyOFA3cGRaOUt4?=
 =?utf-8?B?U3c2djZPVnFUWWNrMXF3dEtSUDhwcnV3dkhjYkJ0TFJQV1UweHhjeU9LL21m?=
 =?utf-8?B?V1hSbHNnVTRFWW9hYlJTUHpTNGhZZVkweGVvT3NHeW9WOWlIUVdBcm5FdGM4?=
 =?utf-8?B?WFRHbXllMk1ibEtiWlc2QitybDNVOUFubmkraDVYSUJVL3V3TTcya0EyVkJN?=
 =?utf-8?B?YW9yQmIrZ1ZYTmoxYmc5dkFWa1BuTUcrbUc5MGdKMEFjSnhPKzIxUmd0WnJn?=
 =?utf-8?B?Q3lMRFBobjlFWWJsczR4V0xCbjNHUnE1S1N1K3NaNjZYNXUybVJzZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f813bb8-10a0-46cf-0f32-08de49ead39e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 10:36:45.5885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYOsBzgFFtAdIF9Yck1s8KzRfAyrQhdIICHNdqZszGKzOLU18k4P/O/JrDGbpgtRQ5yeDhx/DQs0tOuqAS+6qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2165

On Fri, 2 Jan 2026 10:04:08 +0900
Jesung Yang <y.j3ms.n@gmail.com> wrote:

> On Fri, Jan 2, 2026 at 7:09=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
> >
> > On Thu, 01 Jan 2026 08:21:24 +0000
> > Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org> wrote:
> > =20
> > > From: Jesung Yang <y.j3ms.n@gmail.com>
> > >
> > > Use the `cfg_groups` field to aggregate common configurations into a
> > > single project-level definition. This avoids repeating identical `cfg=
`s
> > > across crates.
> > >
> > > As a result, the size of the generated `rust-project.json` is reduced
> > > from 11MiB to 406KiB (about 96% reduction). =20
> >
> > This feature is not available with Rust Analyzer 1.78. =20
>=20
> I suspect you are referring to the rust-analyzer component shipped via
> rustup when the 1.78 toolchain is active.
>=20
> Do we apply our MSRV policy to rust-analyzer as well? The latest
> rust-analyzer release supports older Rust versions, including 1.78.

This statement is not generally true. Rust analyzer needs the ability to
talk directly with proc macro dylibs and AFAIK it only retains limited
backward compatibility with old rustc versions.

https://rust-analyzer.github.io/book/installation.html also mentions that
the only officially supported version is the latest stable and users are
recommended to use older Rust analyzer versions with older compilers.

> practice, I believe many people who rely on a language server use the
> version provided by their editor extension or IDE, which is usually the
> most recent release. AFAIK, it is actually more difficult to use an old
> release of rust-analyzer, as it often requires extra setup to manually
> downgrade or pin the version.

Many editors just use rust analyzer binaries in the PATH, which can quite
often be the one provided by rustup. I guess the "IDE" you're talking
about here is VSCode, and I just configure it to use the one in path too,
instead of the binary shipped with the extension.

This the Rust analyzer version string of the one that I am using:

	rust-analyzer 1.78.0 (9b00956 2024-04-29)

So I'd say while your change is desired, we need to wait until we bump
MSRV to a high enough version as I suspect there're a lot more developers
that use Rust analyzer in the same way I do.

Best,
Gary
