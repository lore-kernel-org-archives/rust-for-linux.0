Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.125
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795616990;
	b=jPmDcgRnmmjDRG6CahzcfO62HlpzTc+41ZAwVolL3vcLggJZx15ZckvmSz9OsO74Wxhz
	 OU602OWcyiQvElWQIS8tk0KvHUXir/QWn7FqnVNvq4evo/VK4HNexHbDYvbr6gZnFWX8f
	 RsTqhrBzIi6HOG6jqIeL6+GVLc0TBYe+B/FO+DP0tnCjWZvPPtQt5dicYjjdNfhPt9m5j
	 qEnd9OzLNRb/+Pmo4Qq2Uc0vuRqXz+FWfPAcSJGpwWtjU03ZB9SBAoxqsq93NcXaSu9e6
	 khmXWXm4ARAgEC6GK5lyZK5VOH1noiC8CphL4iACQASCPAcwukEwaJxVxfKJT6RxDmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616990;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IGjT/cwtW+jcioypGmI3iitsYRAgBuWyAs5qjqeCMCY=;
	b=wLEgPJ/8+yEiTHdHVhbY7Yv9dM/fn+pBLr9kCYvL+cYkxx7FkwxEFDvV0sul//6kwWdy
	 /Y8nwcpCGNDYGCC7SsOo9yT3JjjHaNE5hkIrz5V/JbD+JMBK13ypnuVMO8YTSgbg14bph
	 ynzH2JuAhxiTuHaiW7EHxH9BcjQv2NutRzXkMy4uvQuLbfJ3EKmuxQUyH7A1t88yckAG2
	 w3XTxqwa46og5GUGUEv/hr8IpB7kXiYbOxTjgNLyjR1hMIjLYoMgceIS1tyvqMH7nWEmp
	 NeDa4gJSMg+KdGtaWBinYW5UtQ6o5rx4JKeAXe3OWRN5pwqJc0rCTL5EJnu9lDGjyqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=Yhnw3VlQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.125
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022125.outbound.protection.outlook.com [52.101.96.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96FA606A31E;
	Wed, 25 Nov 2026 14:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E96FA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=Yhnw3VlQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMTzhWApwIk53YkmRcAKQhsw2z3jJ5fdu3hx3kF/hilpl+AAmsrUshe7zNv/gpkDKteJGfV791Rgix66NsMEs4wCiKFnuICOgIcHpkVLJEV5i4xEEpiJKg4yFckmxO29yCpVIE9jH8uTlNYXckSmvXNM+24KMmPuqdeEJKIx368Ox/NKW2NWgTgo08C0PXNZXPW9n1tPmAtmOQIemFXQ5jkGM4waTs0oaDIPWMgJRP2Spblm5yGaM3MJbu1Ftnl9UPPdSLQr9pDmPTWbllIMxdEb09fVTNm1/T05f4WUIEChT6y+1ySIbcfn0V3PJjcqe9aelyU0DyYdLt7U65cBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGjT/cwtW+jcioypGmI3iitsYRAgBuWyAs5qjqeCMCY=;
 b=ZkMIfFq3WXgKlAathRVbVhTu2rkbZyhFEWX/fDvHZCVE99ZLbDOI7hlLnj/KD1Rau7thhVIeGnZwQW0J9FakK4Y11Z2AyAyH0i8iT2YooQvyKh26r4OloR8iRBuUiuvLSIsR6G2mt1O9+mS7nuFP8IcTFIK411SZQzq3FTfFoj3sPrDKpZaaZbwvMRSjTto3OiPTs8FmkXWUohnHTqAdZrNE1FHsrz/MYfPL5jYHwJmM1dBUesQbf2gdQMdcupl2nQCv6q/6sJ71gB2Jx1xdV0i05jKZBcN3E6GS1hMIqQVtCQfb1B5z2elAY8PfF4+lalu5z9aE5+AoOYtrL5j03Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGjT/cwtW+jcioypGmI3iitsYRAgBuWyAs5qjqeCMCY=;
 b=Yhnw3VlQAmOQO+piip1NGdH80FcxYTJx//KjqV9h0RCPCmATJouaZ3McdYoZlWuk53JjBZLuxpLGUTBNo7E0Cz8cskfITklLpEVEFluxUbW/S0qsfi4Xz56aeZhxYAVhJ9WYCaa3NKkXNlG/VUQEn2chS95qHjIvhh/wjTY0Ceo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LODP265MB582863.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4e1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 14:29:46 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 14:29:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 14:29:44 +0000
Message-Id: <DN4D3IY7U8N1.1UBX5MIXLMOB1@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Frederic Weisbecker" <frederic@kernel.org>, "Lyude Paul"
 <lyude@redhat.com>, "Thomas Gleixner" <tglx@kernel.org>, "Anna-Maria
 Behnsen" <anna-maria@linutronix.de>, "John Stultz" <jstultz@google.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] rust: hrtimer: add active() method to query timer
 state
X-Mailer: aerc 0.22.0
References: <20261125-hrtimer-active-v4-1-415a37b74d67@kernel.org>
In-Reply-To: <20261125-hrtimer-active-v4-1-415a37b74d67@kernel.org>
X-ClientProxiedBy: PA7P264CA0172.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::8) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LODP265MB582863:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f08d4b-02aa-462f-626e-08df4b008db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|23010399003|1800799024|921020|261021121427099003|10067099003|5023799004|56012099006|261022075727099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Akolfz8fe/Dwy6nd8fagyBJeSdOn8ycA9gHEPFpGlhVjvcW/QJXEShB8oLwwh8y0IUevy4VkuQoUNacHLRrYFcHxAemB80IhZzS6friCplwPL5eOitgOLwRc6zDHSCurZF3fBtdMEsrresAlowyjTb62wFY+z046BU5PfiZjRlCIyzsjihNXnOOeIOOQ8FLLON+IpZ8xiE6jNeeYJTPL+M7VPwFA1Uo5xFWctJkl4TCxCe7VBHcLwmRJc7jRgnoPePgqa7vyrFOvt0UZSdRMk5zKEoiIn7w7EX5GwM/HtA1az6ww+QuPuOssZUdRzbwNlCqnCbz6PPP/fZaRDOX9mB+UZr8Mz0RaqrOp3QCk6FRL87fTVKZkLPlU9BfsuZwhdY0IhjjgSlmXUQt5guDO7rzJA/y1TmmhAmsEYrGih7k1p+e0trjxigMxg/a13K8N2lqGM4IWK1Z4w7yn09ZxJuKyBJgM0aWkUfdNG7gmZY7EJhDsiQ8Cc7jye9irsgdoDXduo3kyiJugE7ezaOVSCOLu8o/WSQkxJLClNggLlRyrZkQ1EfE2gVbdUOLFUBgZZuMLTh72eKAqEh9gVcGmujWoKQa7HORLxeRfFxSCrkfg+HgMOgMMemRqXRM086SIRtJdUeYiIGYjoWzUYyG07fv85qoT/T6V/QRHpaLyvNM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(23010399003)(1800799024)(921020)(261021121427099003)(10067099003)(5023799004)(56012099006)(261022075727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXVnWkVKazRTVEpZMjcrN3hEMytUZ2NxUTZpdTRGYVNVRXJuWWh5ZFY2Z0xU?=
 =?utf-8?B?QnZMMldwMEhIRnVtdWRjV3hCR1dGUDk2SVptQ0xnV000ZTI5SkdCNDU5SFhH?=
 =?utf-8?B?K3JqcnFwUXJPdWVqTUNSNEluSXpteFdObkpjNVpGbWZTOFJuZmwxSC9HbzNs?=
 =?utf-8?B?R3BPa1NRNlErMDdHbjYzaHQ0Q2tyM0ZaM0t4N2NhZGRwRXZkTzUyaFdlc25p?=
 =?utf-8?B?VGVjR1VzVWhCRVBFczFLTlRmMjQrYXMzTEJyaW9CaytYNW5vLzFhN2s5emFL?=
 =?utf-8?B?Y21NMzg2NTRTTVdvakNMVVN0b24xZVRBclhLaHhmYTFjOXE5dVpXY0J3Rlcz?=
 =?utf-8?B?Vlp4VHI4TFg3ZVZTeURnTzRFci9PbngrVmdVbDhVK3dSTXc2SVBvbWMrY0JH?=
 =?utf-8?B?MnFxSkVwVTNBcW8wdjRHaFVSOUdOQUE2NS8raVJQa1NGdEhrSjZ2dzdxajJE?=
 =?utf-8?B?Tm9lNENNUUhnY0VsMFZ4V01OWXN0TTcyMWlOWlhHcjc0RjZGWGtSNHVRQ05x?=
 =?utf-8?B?cFRKWWR4N29DSkpMa0hlOXpjQW41ajRVd2c1eTBuOEVSa25NbU05NjdhSUpY?=
 =?utf-8?B?ZUc3Y0lEMEl6dTQ1TnVld3h5QU43WmkzZjFqSEJZdXUzOThVbzJ3bTh4ZTNX?=
 =?utf-8?B?RWsrejRKWnpKc3k2UU1NS0hFZ0lHWVM0SVJnN2x6Y2FIWHhPcTJmbTI3N2w5?=
 =?utf-8?B?Z01Qa3hVK2hPczFqSGc1NXlhRFB5VmEyZGlLRVZ5Z01iQ0kwSUgxdUYxWWpM?=
 =?utf-8?B?T3lUWWJqc3prRGFwTjd3VzlLbDBhMXpMNW81djBMbWtab2hsM3J5bHZtQlJL?=
 =?utf-8?B?QzM3d1VsRlJJK3RybVN2VXhTM3Y2NERyK3R2NXFRcGpPMk1UZGllQWZMalla?=
 =?utf-8?B?aGZBZTVMTkp3Z3VjNG1NclFQTUNtanFvbytYRW5rd0RRVDlZZVdiUWdvWnVL?=
 =?utf-8?B?Y21ra3p1NldxMVdRaXpqL0Q5RjZ1aDRNckdjWDduK0szUCs5bmdzWGNRK1ZX?=
 =?utf-8?B?VFVZTmJmd3VEd0dXT0ora0ZpMzkzcnl4Z1BveUJxbzhGaktwUTN4L3FRc1hy?=
 =?utf-8?B?a2FaN1VsVG91dTlZeDVvYXZqTGJuMStaVEFyMFFIMkVFWG9Ld1dxMWxkVUIy?=
 =?utf-8?B?bFhETkRMVGpqaEQ0VnJUUW45Z2NWaDRuOHM1M0UvaUNmdWVrbnVxNWlzRzdU?=
 =?utf-8?B?V1gzdFMySFFDQjhVZXZmLzJsUmtPSEc3M1ZWdlhLa04xZmRuTWlSclhiYWt1?=
 =?utf-8?B?UTZHNFAxMElrZnFoZHhEcjVreFRSTzd5c1pubnNNT3V5NTEvNHgxYlJwaDVK?=
 =?utf-8?B?dzk3Wktic1p3ZzU0OFBwVHBIMzNiQnBaWFl5N05OU3ZpNWxUMld0K25PK25W?=
 =?utf-8?B?L1dwZ1p4NnZJOSszdE16MnVXdmJ1Qnh4Y0NpR2taZDlybjNaU3FxNXZtNjlr?=
 =?utf-8?B?WlFleEtjSnc2Mi8xQ0NzcXdRcy9sOE1rTitkbDM2d1NFNG95NHYycWpXNFFu?=
 =?utf-8?B?NjN1NmhwR1Nsd05TM1F1L3lhdGJaSHhteFZVeUVTRk9UN0FCK1Zwekdxa3pQ?=
 =?utf-8?B?bDlyZjRIMnBwT0tYYS80WnB0VzQ0YjhZYW1SaVlCQVhpZ3VVaWh2ZXNyM29v?=
 =?utf-8?B?b2sycXoxQnkyZ0dxc1ZKTHdpWnpFT1I1bCs4TVlGNTdZSlhCZzJZd1JkTFhj?=
 =?utf-8?B?SkROZjlIaU4xbXp3MHJtUHRRVE1DNW1GaXorbkk0anVQdzlPazBtRUdkMjlS?=
 =?utf-8?B?VE00ZnYyT3B0akpTN2wxenVBczExYklhRUtwaENkdDJQandLYlZxWnV0WGE0?=
 =?utf-8?B?OVR0S0Irc2g0Z0hIOUhCamhNM3hxTEIxMUhZYWJhclJlcnVqM1lMTDhiWUtI?=
 =?utf-8?B?VmM2bWkxeWh3LzI0TjF6N1hKeWU3Rll6R0lCaXpCVW04bGlaeldWWDRLNVhN?=
 =?utf-8?B?Q1lmcXhYVk56emFtUjlpc0tSSW9hbGlEUWVaYnYrSDlXeE1jV2VZOWVOVEI4?=
 =?utf-8?B?WkhxZnlLUFRVVG9xUkkxdm5kOHVMZzcyaE05bklHdXFSc2lEd00zWkhYd3dZ?=
 =?utf-8?B?T09CVFQ4OWNVbVFFMWhIUlBoWlhzalVYVW4wVEw1YnV3dFNZYzF0Q1lHeEVO?=
 =?utf-8?B?QldIZ0JseUZLU0FKTXZqSWRNc0dHUkNZblEvOGdJejBDMTlHUERpTXZpekh1?=
 =?utf-8?B?WS82d3h3Rm12Zm9OMWorR244bnRZNDc4OXloYnByRFNPNjc4RW5DdVJsSUwv?=
 =?utf-8?B?UTB1US9HU3p3TE9nQUp1QjNJOTdleTZpZmQ5NVV2enhKL3FsdFBOcjluQy9u?=
 =?utf-8?B?MWR5cDBSRjQyWmtyVHVCbHh0WDlIcUlKbS9RYkRNQU1GMHUwaDRFQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f08d4b-02aa-462f-626e-08df4b008db1
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 14:29:46.1024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXCrpJmJRfvyTkyaUegLw5GL/Q5RdIEaIRxNT5Fnm4biGXwAS366JCbN9G4/ChaixujUQc3j7hGD9qn2+L+c9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LODP265MB582863

On Wed Nov 25, 2026 at 12:34 PM GMT, Andreas Hindborg wrote:
> Add an `active()` method to HrTimer that returns true if the timer is in
> the started or running states. This wraps the kernel's hrtimer_active()
> function.
>=20
> Unlike a direct read of `node.expires`, this does not race with a
> concurrent start operation. hrtimer_active() reads the timer state inside=
 a
> seqcount retry loop and re-reads `timer->base` with READ_ONCE(), and the
> core documents that it must not return a false negative. No exclusive
> access to the timer is therefore required, and the SAFETY comment reflect=
s
> that.
>=20
> The returned value is still only a snapshot: a concurrent event can
> change the state right after the call. Callers that need a stable answer
> have to serialize against such events themselves, exactly as C callers of
> hrtimer_active() do. This is documented on the method.
>=20
> Also add documentation clarifying the definition of an active timer.
>=20
> Introduce the term `active` as a set of timer states composed of `started=
`
> and `running`.
>=20
> Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v4:
> - Reword the snapshot note to not name specific events (Tomonori).
> - Link to v3: https://msgid.link/20261105-hrtimer-active-v3-1-52636808ccd=
a@kernel.org
>=20
> Changes in v3:
> - Rebase on v7.4-rc1.
> - Improve documentation.
> - Move the note about not requiring exclusive access above the example.
> - Name the user of the API below the cut.
> - Link to v2: https://msgid.link/20260605-hrtimer-active-v2-1-77d755c81fd=
7@kernel.org
>=20
> Changes in v2:
> - Mark `active()` `#[inline]` (Gary).
> - Use the `[`true`]` intra-doc link in the rustdoc (Miguel).
> - Document that `active()` does not require exclusive access to the timer=
,
>   and reflect this in the SAFETY comment (Gary).
> - Add a doctest example that initializes a timer and asserts it is not
>   active (Miguel).
> - Link to v1: https://msgid.link/20260215-hrtimer-active-v1-1-a754d10492c=
2@kernel.org
> ---
> The bandwidth throttling timer in the Rust null block driver will call th=
is
> function. It is used to arm the timer on request submission if it is not
> already armed.
> ---
>  rust/kernel/time/hrtimer.rs | 64 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 64 insertions(+)

