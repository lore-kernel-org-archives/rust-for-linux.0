Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022129.outbound.protection.outlook.com [52.101.96.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1394307AE9;
	Fri, 16 Jan 2026 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768564431; cv=fail; b=fXKhTQdd2fqiSJl7+tS2Sn/J8C6LDdVhmBYUiyxM/w7VM791I1grZP52S7xDnH9pSC2coRfEz6uYXVWhc2MnCPxorxFnkpc2XHCf0jnqDk5LEEZQXRirb0HyrHyHrKg/5brYDHJ9sZJDGCIC5HktS+PGkw6na0BY07GqtQVLLD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768564431; c=relaxed/simple;
	bh=z7/57D5jXPYV5Y5Ht9Y8Z7y2lFOb9NK8exZDlF3Ew4Q=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fLoX834SsC2kRkNhPZ58ev4Vc3Bvo20/ZIh2mWYaSul9nBtQbLnN7p43PZTmIp/2AJj1o4sRzlZqLi3K0iPVlbhZoQv3UIycsdTOZiHizcQgO0pc6nSyiE4Ann3Tik1O0DNkKXv7J6Px+B0yDQ58R+KDNae2OkOGFxUBS6g3cxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZEj+tGuN; arc=fail smtp.client-ip=52.101.96.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZEj+tGuN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z36fzUftjwof7Zg0x0yV3+XlzrOQor5td/8wP7+Y/MNM9bpAy2OQTqxtBZ8HJSJA6P9OwZZjF7pRsyoNk2GU1I2+XJsDUg3/7ND4c1gt1Ji6oGNs72GIC5swmKW9JQbaWtsNOTRSYv/skZUD81dyr8YaCg+ptoYF/trQCXIGcye8N/qq/tR1XoD6ND6x4GdOkFFOKGsZshfYGIjJM9WcPGoc5N2d2pRx0FYUUiuQoMUQCKaD1FP65S3QdgWcaooD+OdrpLkgIswXbPxl9BrVQOD51Wnu+PNuhNDCwVjlUfPxKTCMYSXJmc+PGPCQjmvlXkisGu/DFTspvrPeexms5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8K95uUgvlw2g709VuQ8o15SGMcvIJiP983qWOV+ifLI=;
 b=DQFgQiLTHgPOQY+VyTWvkyMJywNusLwBxKP+jdbdDDMjYaPdfet66Gyg6q0+B/vaL8Svwvuf0SmVK2UeYydgeLyTMmmQlLP1v8l840XiZxLy8PBSwnXyf+ThQAn4E25YUYJ/0GrM5+teuMXmCr4de2+RqLf1sh2yjlX/8ERF+DvXRPLPCTMIlo4i/Alt7yg/v/GkEPovPNgko06F3yFiGkWIreUZEZgdpl00PGiDIObLTZZ4Zmt/dJbKGe9sYFX4u4lXNLOmcfVLM6pioiqhBzQivqktfnlog2vEpr1AfzZOckUNnwmsRx/CMnV7Eo5QabT+8YnsACFz2VbVi2f4xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8K95uUgvlw2g709VuQ8o15SGMcvIJiP983qWOV+ifLI=;
 b=ZEj+tGuNdx95vTLAPo38mhbha0G91E96C2rfXTCLv6pYlhg2CICWk8Dcc2iwDvdHDqi4epuCjp681BK3laVRQ24MZ7wAQWjpt69O0AjesViRbFNwAg0oODWjqnQ+DMwSlP1uDsSZbhn6kpLGwyI6+a2a54oeXU259keItrt0jbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6385.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 11:53:46 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 11:53:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 11:53:45 +0000
Message-Id: <DFPZRKQC7ZHT.BVYWCE0GGW96@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Tamir
 Duberstein" <tamird@gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: compile sysroot with
 correct edition
From: "Gary Guo" <gary@garyguo.net>
To: "Jesung Yang" <y.j3ms.n@gmail.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260115-rust-analyzer-sysroot-v1-1-4de831df234a@gmail.com>
 <CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com>
 <DFPQG929N5CE.34Y24PGBZN2ED@gmail.com>
In-Reply-To: <DFPQG929N5CE.34Y24PGBZN2ED@gmail.com>
X-ClientProxiedBy: LO4P265CA0261.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d0aea5-aeb1-4299-b071-08de54f5e754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTMzeWJpR1FoUXE4dDI3SndZS3p1QjBvaTB5WHNVdnRlVDRBWithOHBFcU9S?=
 =?utf-8?B?WHo2WGtCWVRacmwxZ1NIWTlQMmtHc3UvNmlCN292MDBiYTFJSmJBQmtiNlQ5?=
 =?utf-8?B?bTFTcnZ1VGRCNGdYV01SaWcvSWFBNCt6c1hRci8za3dGUkI4Z3JQQmNUemNs?=
 =?utf-8?B?aVROMis1c3drbzlFY1NFVXQ3Ujg5cjlxdkdhQUJvMGROeVozbFMyMEJaQ1JK?=
 =?utf-8?B?cG9OajVjMXFIdGZFTkdiVlJXRGMyaWV6amRGMmF4ZGxuN3hGSlB5aDgzQkFK?=
 =?utf-8?B?bUxBcmpobS82dUhDTlRudzZWUCtjRGJ6UVNHK25jNHQ3VEs2K0Z1Z3k1YjF5?=
 =?utf-8?B?RE5oOTVtNUlFNUd1OXJ1QktNMWp1dzRjOFI1Wms5VGlrQ0VPc21SS0tvbjdw?=
 =?utf-8?B?UFBlWGdyUFRTUTBmQzF5ZnI2ODFpam96YTRvOVFtdmZVR3dzSUE1MUZEOGtr?=
 =?utf-8?B?SC9MQWFVQk5aQ0w4L05ZcCsyM3hYaGcwSUtzUjRWOHprR2V4a3R6Zk1LYmVH?=
 =?utf-8?B?V21nTXZROGk0b09KTTg5UlJOYko2dDh3bzdnejFXR0VWa2trL3ZPZlNTMW8w?=
 =?utf-8?B?QlZyZmNsUHlJWW1KN0kva3FodThKWGU2aitBaHJ1dER2MWg4dThQNTZlY1Nn?=
 =?utf-8?B?dmp1NTlJWkxGL1ZMSW9NM0d2bkJMSXF4M3FhYmNvMDg4bndWYnBVYTFxMThY?=
 =?utf-8?B?Qkl3S2h4ajhuWUxDZmVQYzNGMVRlQ0lPUHZXb2ZaWVVKano0aFFZWlNVT290?=
 =?utf-8?B?em5YV01Qc0I5UmxDd3VCRUgwckFVTURGUnlTSVprVkVLTE50d2pRTi9sRXVO?=
 =?utf-8?B?UDdaR1BUcm9CUVRER3RSbU5CUHJFQUxYRisyelRrQmNYN1hxR2svd0EvMTQy?=
 =?utf-8?B?bDZOR2lPWVo5WHpDRUR2Sm1mZmNvQ1FpYWYzTkI5UUcwYWJPN21id0JIb1ZZ?=
 =?utf-8?B?MUFDUUlBYThLbFRHYUZta3NPcTNVbmQvOGcvWjFsMitsa256RXRjcS91RG1E?=
 =?utf-8?B?dDNHSTFSOU5qVk1QWS9TaERwdytKZy9xNTFqdUtGbmFKaFA3Q2Rsblh4dlJX?=
 =?utf-8?B?a0VKUUt6MWNsZlg5R0t4N1ZaKzJHZmF4T1FVZTg3enZVZWpFUlJDTmJPZGVn?=
 =?utf-8?B?YlRwVFZjVEd1WkZNZzF2Mzh4Y1ZMU3A5SUNtMkpZelVwc0hOQnlySEFZeEg3?=
 =?utf-8?B?SmY3bitSelBvSDQrZGRDWlU5UjU0MkpqYVJ1SW43aktsR3liY1pOVjBBUlM3?=
 =?utf-8?B?M3VESWpUUDBBUW4xQUFZa0VRWXlFblZSNGZDODB5QjYvQkZveDdxdlAvMnI2?=
 =?utf-8?B?RzluVkhaRTFrNXFmeEF0N2NOSGM3RDFNUHFpRjhSL2FGVDVVTjVtSGVWdUlX?=
 =?utf-8?B?dU15QS9tbjNXdHc3VTFueVFQaXJ2UGVURFkyM3FmQzQ2TW5pSEZuZlBzc2Jy?=
 =?utf-8?B?TW8vTHJjek56NUxFaUx0cGJmY1pHUWF5VkRvTGZlLytSbS90WVRuMXljRVRa?=
 =?utf-8?B?YnVRSk5LSXVtK3dOWEYxb3orakxaNkxSTlBqdE9oR2pRSTRUTFZWVXVEQTVM?=
 =?utf-8?B?OGZNRlQwZ1U3TlpYYWNHY2tBY1Qvc0lXeG5rVWFEQkVCVjloelJOZERaWjZI?=
 =?utf-8?B?bmQzMFRneTc4Vk1wVVRMeUlvcGJkWk5jS3VEL3I0aDNjY2RwcS8wWnZiN1FJ?=
 =?utf-8?B?SjQyNUpIOTFpS1AxNFYrYzhEKzVMTmtRbnJnUVppcUpON01kOW51SW5yWGE2?=
 =?utf-8?B?eVdIK2RKRUgydDl3U2k5cEFIK25kREY2dTR5MWxTRVRRTDFQVWFhejlzUWdY?=
 =?utf-8?B?K1A2ekgwZHVZWjIrR2RyY0UxQWNNMTA1YWdCTW9BSnByTUs3dWIrRnR3MWd0?=
 =?utf-8?B?OUZPemZPdEcrMHpZUEMxSUNDc1Z5YnZtZkxGa25Zci9NRSsyc1ZQR2I0WjA3?=
 =?utf-8?B?NTV1eXpPTDZ1VW5mRmZ1SFJYZ0FLWmxjY3RGTm93ZXk4QVZhOUhuVzZMenJy?=
 =?utf-8?B?b3orZi9rdE4wZ0dtbmhya0V3Z2FoeFFpTHZZclpWNitrb3U1MnBmWjY5Qno0?=
 =?utf-8?B?M1hLNXdVL2hnMG8rb0hEeUZiaGE4M1NOVDJHN0FVS01RcXNwT1ljQURYM1hC?=
 =?utf-8?Q?uaMI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmZTYW1VK3FwM21uK2hUUEg1VHB4d2Z4NGh4ZHJsMVp3OVhVVnpFWWt5WElv?=
 =?utf-8?B?U29venpteVhWZUhuVlJJUFJEeDFtN1hyQlZKUjVBWEpjVUMyL0haRkVFWk4z?=
 =?utf-8?B?SEs0cEdwTHBWSTlCZ2JHUEkycWFTcjR1bmNjRW5MblNTREVURjR0ZXJLQWpH?=
 =?utf-8?B?enNXcCtzQnpHTHJ0bmxjblp5b09sdTh4M2Q3UnE5UlR4QktRS1k5Uk5WV0RD?=
 =?utf-8?B?Ym9XbEY0clIxYnNjVklXTzk0NFlsMkJvRVpBVEZHUTRHaGpralpFck45YVJX?=
 =?utf-8?B?SXh5aUQ2L2ZZaTRDZ1ZvcERHS1VVQzNqaHRLcFdjS1dGSmNKVHB1R0YxbTlw?=
 =?utf-8?B?QnVVdFI1MmJ5NkVvQnJDc2hTQnF0NzlIaGpQWnJWYWZlMDY5NUk4UTl1Yko0?=
 =?utf-8?B?TTJXVEdPTCtJQkp0ZUsxTnY5RExnL2x6Y2g2UWJCWVFpTnExWnNyZ2VhdURR?=
 =?utf-8?B?dW1TcW5hbXc2eXRRMCtGdFVaUUxueEUxcnNSeFdpbUVIYTVHYXgyY0dCV1pK?=
 =?utf-8?B?cnZCblMzSE05dWRKb2Z2blA3Lys2aXhhL2dTNmNnV1E1NHMzUUVmQitFNnN5?=
 =?utf-8?B?YXAvYmdRUzBWZ3pCcjMxblpodHZqWEdaUlhpdlF2SlBOalFwc0NLcC9PK1l4?=
 =?utf-8?B?U01rbkVQSkdvN0NvUzhhUnZXNUhMTkdHNEhyRFlWdUdMRUI5S1p4ME5NaDVF?=
 =?utf-8?B?TTJ4Y0dVand5dENJQS9sTVkrMWVTL0xOUHozc3dRRGgrQUZCYldIcWJOMlB1?=
 =?utf-8?B?eC8ySTZqYUdWM3J1L0RLN2VHUjhPZituVGp4M3BSNW93bUhKWW5GSVg3aE5i?=
 =?utf-8?B?aFo0RTFsSWg4cmZVRm4zeXZ3QzJGTGZFbnhoUWV6emNLTS9UL3BwZWRVcm4v?=
 =?utf-8?B?Y250Z29RQm9ieWJDZWsraFpTd2xYZDljMHFpVkNvOU5RTUJMbllUNmJJeFEy?=
 =?utf-8?B?MWxmdGpIKy8xdFY2b3cvN2hUc0VzQXljd2E2bjZ5THVqT0xGeXRDeWltZjhj?=
 =?utf-8?B?K0lDZmptd2FlbFZnSEdEMkJJKzhpYlFZa1VDcWxMWkNqcU9oNjJicmFEcnVn?=
 =?utf-8?B?elFqelpla0E3dkNtam9IbDNCK0t1ZzdyVlFjVFptQTR5QU1NbHFVQ0ZDR1Bt?=
 =?utf-8?B?Ykp1bWhuTWpvQWlHbzU4bExRS3VMVDBLQ0RSdXJiQ1NSUWh1L0doczVTYmVq?=
 =?utf-8?B?SHkvbDJLT09vU3JHOHI4RlVqODkwNkRwTGs1K1J2SkQ3cjFhd1I1VFJHa3Rm?=
 =?utf-8?B?Q28wQ1BuVmhOMXdkZFhBTU9EMXdmeitYK0dDOWltaDdsUUY1QU5mQ1EzNTZW?=
 =?utf-8?B?V09RYm9JUEI2aW96YXh6RDlJYSthNVhSbmlJNllVRmJodmdNMGpzbmswZEJ0?=
 =?utf-8?B?T0xEWjJtcjB6TmI5RUEwNjVFcUE0RThWdkg1QVplVjZpTTU2NTNyaE5vbXpL?=
 =?utf-8?B?SXFxM1RDVmR4NGdIQXkxa3V5TkVEY0NGbVpKMDF3TkFFM0YyMlRnNFEzd08r?=
 =?utf-8?B?OHExL1AzeG9mMkc1ZTUvQ1ppSnEvUm5CdldhVEpGTStHT3BZR2tnaVNicEo4?=
 =?utf-8?B?L2VxUkVtdnpPSDVuOUVZbUg4eWxENVBnOXB3c25VRG0rcE5uNXZ6TW50RGRk?=
 =?utf-8?B?aVU0TW9OZVlKb0lmOS8zMk1hMXhicmtjaU1Cdmw0cTA0U1R0dVU0dzBrR2Uv?=
 =?utf-8?B?MVcwalYvQUFjMkx2bFpJUEduOXM4TFNFdTBFYnprR1Uva2ZPSmxsYUpERFRE?=
 =?utf-8?B?Qld5OHBEay90VTdDRk81ZWNMS1ZNS0hEVUtNbkRkWEIvaFhxdGlVdGIwOVcz?=
 =?utf-8?B?THJzVUFPVVEwTHUwM2lnZi9LZXdYMEtkUjlQQjcrS3NMREJwMDhvYVJRbC9I?=
 =?utf-8?B?bXRONDViK1FlWWNzSnJtWnJXTlZ1TCtRdVNHeENLL0crSUIyWlh2VVdHRFRn?=
 =?utf-8?B?TUVxR1QxQ0lNbEFwTEZmemVIWmI1MVRVcUl1NkQvUHc0UmdWZG0xWWlrM1Ev?=
 =?utf-8?B?SDY4ak1EZXFJZHpEYnNwc3JQZzl0VXpwRjZydk9OTFhCcjk5Q2dJL1pSZEpI?=
 =?utf-8?B?RjVreXFSbTRUSmZZVlNDTXB0eE5kVnQvMHBMNXN0YVlERzJNcHI2MjVyTnNo?=
 =?utf-8?B?Q0xlWE5odUZzYXNQeG5qeUhQUnlvaUtERkFUQUZlVTBTV2FoVTFkQTZzUnVn?=
 =?utf-8?B?MjdmbmhwZ2dDTllHRENrMXp6YVNER1Z5REh3a3NjWUpDV00yWlcyN3ZIb2Fh?=
 =?utf-8?B?M1h5R1RIMU1sSjd5N2NqQUMzMCtGaWtqRTFzWDhWc3h5cEZqUnRZWk5rMWdX?=
 =?utf-8?B?U2UxWnJEUDlQckV5a1RBb3VGMU14NUR3ZWJya1A1NkJoWlRkQTRvdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d0aea5-aeb1-4299-b071-08de54f5e754
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:53:45.8905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjFWlpmyOcD2eUW9SI/xo9xmxMGPeSkXNdZlcc1SMdPKPath73dw4Yap4o6jObqXX2wZPz9yynTlRFhgwZLAxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6385

On Fri Jan 16, 2026 at 4:35 AM GMT, Jesung Yang wrote:
> On Fri Jan 16, 2026 at 6:22 AM KST, Miguel Ojeda wrote:
>> On Thu, Jan 15, 2026 at 5:35=E2=80=AFPM Tamir Duberstein <tamird@kernel.=
org> wrote:
>>>
>>> Rename `core-edition` to `sysroot-edition` to align with the naming use=
d
>>> to refer to standard library crates in `generate_rust_analyzer.py` and
>>> apply it to all standard library crates rather than just core.
>>
>> I think, in principle, even the sysroot crates may have different
>> editions, which I think I used that variable name.
>>
>> For instance, in the move to 2024, it seems all happened at once in
>> 1.87.0 in these upstream commits, so that seems OK:
>>
>>     0e071c2c6a58 ("Migrate core to Rust 2024")
>>     f505d4e8e380 ("Migrate alloc to Rust 2024")
>>     0b2489c226c3 ("Migrate proc_macro to Rust 2024")
>>     993359e70112 ("Migrate std to Rust 2024")
>>
>> But in the previous move to 2021, `std` moved in 1.59.0, while the
>> others in 1.60.0:
>>
>>     b656384d8398 ("Update stdlib to the 2021 edition")
>>     06a1c14d52a8 ("Switch all libraries to the 2021 edition")
>>
>> Hmm... I guess the new name is fine, but we may need to go back to
>> separate naming eventually if they get updated at different times next
>> time.
>
> Perhaps we should introduce `std-edition` and `proc_macro-edition` in
> `rust/Makefile`? Passing those down to the script would make things more
> future-proof.
>

We don't build std nor proc-macro ourselves in rust/Makefile, so I don't th=
ink
this should got there.

I wonder if we should encode the fact about Rust version -> crate edition
mapping inside the Rust analyzer script? then we still call the variable
core-edition (which is the crate we need to build).

Best,
Gary
