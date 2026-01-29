Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012054.outbound.protection.outlook.com [40.107.200.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D786A280327;
	Thu, 29 Jan 2026 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769673700; cv=fail; b=Jtf+8oA6mSqUAh+wb31BcXKGNZ/k6OE50gfT+geT4rsKpjMBYACTXNCJL1eRKCJX0UtnrsyIjkdffOqVTxWmE9phabwfyia1bhg2tURNkVZQB1NDzKLIx+239egxTfBxD0MHNCFzqp0/2mNO2MlkjR4K4/m6tT+ryP6AnxS46Kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769673700; c=relaxed/simple;
	bh=O+Y38Gf6rGz/P4qQ1Wzp9wVpa8ukLaPvO3QOsCTpB+0=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=EWwF9Ns3WA2p9E0RjJnA4pheeFo1lFeNEo2nv1iWura0iZa455NyE7mHYJlziIcYiY54V/XZwul4g1Q/u7DO/JHnppZ8APOn8v83026y9YvHX/tfpf+QRSmQPw0KDbCrTFbiWQ4n0oGIlxMs1snvaB26VDJXkhSJGHUmRPydPGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IUPqEsxx; arc=fail smtp.client-ip=40.107.200.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IUPqEsxx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfxnKKmcQPqB13lO6yV7EsT3rGSBfHwpeopME8KXiB02r/nKB0U6mkOnpX9AtURRTuFAdc1xeZQaS9c4n9F2M1O7NXh7YhFYRlz4FkJ3lz+YaeBPr9rcCEyQVyR9qEOarnwO+GB8W0bw1cBcuOlHjJrhJr9hkZZY7+MFigx2jynftbKzRWzS/E0CxUNBnQkB1UQfPVUcuw48sJlNqRGpO+YhTIgoukxU5TiUin5zNR27W0oxBPqv6CDX9qWdnXshVOjcH5xX0J0ZvMM5qWsKPNx3pxx2o40BU0yI/A1GDrlwlHTEvSPjBO8j4jPVgqtXuogflaO3C+GcBlv0O6/o8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+Y38Gf6rGz/P4qQ1Wzp9wVpa8ukLaPvO3QOsCTpB+0=;
 b=exnDjCMJ1+MHmg+F+ynfFW7jyl8e58RtXSb6X7zowXpI9vG+jbT/xSS7aop7Z3h3P/t7/RVZDQBK7OtXPqiRKbTZi6Yj4PQgHqxYI0U7/uoRMgGpK2Ts0PAq0y088j8XR6fUu3dIJnGBZ+5zgpjOSmubR6AKwuWmeFpTi/4dmXAY8cs1C6vCrHTLdz7hVNOnDHp9eMojmg+Gg4M1fV5j3gCYMXDptzlNmyI9xAIZ40AbwAcnxxyh9JHXT7frT1qazMHCKYYY2BIwdMYQY1l0mRzMSa0Tfg7YIXl8K/suQWbY912TJNsMzaymDqGFPdIx0BGhViMJuej/L8kXvcIE+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+Y38Gf6rGz/P4qQ1Wzp9wVpa8ukLaPvO3QOsCTpB+0=;
 b=IUPqEsxxyfwADmVUTRENWi6drXw5SQQAEDrbrkFbe6/aGCosRNxrRfna4jgh1uirY8sCYfmPRBWIjREQN+aE+LPi0pz/3EkKwCbBy/5Zkg3HpL79p//BV8oRmJ4GiLxQa0QFDWghL0T8dvbvVtilEkXboxq1xGoxz+F220h2ulBhKiX35PktxGQWw+5RCFFrNW0NHRfnyumqpRX172GwQvnIP7w4e8KXF14AOyEdYOC7tFMATbfUOKNVj8hbWkcRfJxsFiPfePyab/x4Hp8cAy7PmTqMAcnpDKmWdminx02Iord9uTssvlb7cOWFVsibqmDT8sGnJnozgHlI8DmPsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8918.namprd12.prod.outlook.com (2603:10b6:806:386::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 08:01:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 08:01:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 17:01:31 +0900
Message-Id: <DG0WYUS5IQO5.GVMC3NSCJYWT@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Zhi Wang" <zhiw@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 6/7] sample: rust: pci: use `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-6-aee3a33d9649@nvidia.com>
 <20260128143522.434f75f6.zhiw@nvidia.com>
 <DG099OR58D58.GQL20TH2D7PQ@nvidia.com>
 <DG0C89D4BIM4.2ODXV9R5R2E52@garyguo.net>
In-Reply-To: <DG0C89D4BIM4.2ODXV9R5R2E52@garyguo.net>
X-ClientProxiedBy: TYCP301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8918:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2fbe3c-de19-4aa6-491b-08de5f0c9f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QURYNkxYZHE3OC9NVjQ1WVArWldJcTNsaHhWbkpMdjB2ZTdmV3l3RG8wTGtK?=
 =?utf-8?B?Mk85eEVCQjhmR3hYVmlMWUllQTdndmJsOHNSaXQ4QUx1b21zSmtnWVZaaXky?=
 =?utf-8?B?K3BVSmM4My90b2NWdGVZSUZDQkxGWENUaWNoZ3VTUDVkWTZoaVUrQ25QM1Zs?=
 =?utf-8?B?Q2s2aTZnUmVHZGxVczh0VFFlL2ZNV29idE9vOUpCZ2R3dlVjMENZUEFyZ21j?=
 =?utf-8?B?MG5Tdi8vcExBKzQ5RW5ROUlWS0hOK0U4SGE4eGJJNUJxbExwdmRQaFgzYzds?=
 =?utf-8?B?NFF4d2FrU1VWY1Jma0IrUEJMN1M5RG1pYjZpRjJQSHpXclhWbmZ6NW5nMko5?=
 =?utf-8?B?NjdFeE5GTVRISzdpRkpQREZZYkp4ZDJ3QkdvdDBJT3d0eG1lK3h6aG9CbXpP?=
 =?utf-8?B?OVN6MGJ6b1RabXZVWUpJd0xiSFdWL3p3OE9FczExZWJDMlNjMzRkeEZEUWFx?=
 =?utf-8?B?VnlIRHRadW1NMUhCR1JPTWlxMU5RWGlQTDVkWUlTTjM0eHFpSXBaNmkzMWk4?=
 =?utf-8?B?YkJxV2ZFenBPcjhoMXVpd1BXQlUxSGwrZ0p6SXpSdFp5R0o5aXBwSGJNTlJp?=
 =?utf-8?B?L0dZQUQ4Vzg2ekhEVk04bi9QbTlVYjFhTENMNUZZYUVldGk5QUdISS85ZnBi?=
 =?utf-8?B?WENHNVBUUjBHRjMxWWxjd01nYWtCSFRsTVgyZ0ZZaUlrZVdTditlNTlpNW5u?=
 =?utf-8?B?SGFNdXV4R3l4dEhVQ1diaUl2endkQW5ydjJEWFFqRUw1T1BBZlZwTFN4bVd1?=
 =?utf-8?B?bTN3VVhCYkFpYmk0VmJLOTdidWtHYXREc2NiMDJvVythYkMvV1VDOVBadDFB?=
 =?utf-8?B?ZnBVanVtY2lNMUxjZ2pMcXdYRzVGUHNndXFLSHRRTVV0NmYzRDk2YW53MWIv?=
 =?utf-8?B?d0Q4VTdjYWtVZUM1U21BaTlzVzNHVDhqbm5BbWxFallmZDY2bjlXTlEvbGtl?=
 =?utf-8?B?SnF6cEFTNEVKZVZoeWg2LzFncktkbmlSVVZac1AyUUd6SEVSSU9FZlZIWWZ1?=
 =?utf-8?B?elJyY1JGZXpZa3kvZ3hHaUZ5dVUxLzRrNVpYcFNrMGxheGU0OWUrY0hkUFNR?=
 =?utf-8?B?SGhEcCtPa3pUOWNSR3dTWndWc3l1cE4vbHE1NjB0czdPTmo4UVI3K2tOQUMw?=
 =?utf-8?B?R3pxU0dPdFprczlVZURmSndwdWxBeG5nOFNFbjBXUGZuV2ZsdGdkNWZJS3RJ?=
 =?utf-8?B?UVBobEw2U0lyZWRWVVFPTEw3V01LVXNidENzRFlLL25sOFVOM0RqK2RqWjlo?=
 =?utf-8?B?SnplM3M1cWVqRURWS1RnK3RRZ2toREhyOGpJQVBLSk1OWHJmRFpBOTV3L3VM?=
 =?utf-8?B?V0R2dWlnUk9EMHB0bmYzLzlKQ05rUlk3OXBKTDRIdWFrelhjdnBSRnBScWVW?=
 =?utf-8?B?T3c1Z3BJdk9Zd3YrZlc0WkhKd2o5NWhuVDhwR3VKamJUek44UmRENDRJUmFl?=
 =?utf-8?B?bG1yMmxDY0ZacHUzNWhlMWxsRXhPOFcwYzlqSktYSGYwWlpsc3UydC9BNUpy?=
 =?utf-8?B?T2k2TmlEVHdnc2k1emhHeEFheTJZU0dSVC9Vb2loTjRrNHJ1MjhQWEtCdlRt?=
 =?utf-8?B?NkRRY3VJT09XN1Q2TW1yYUJDYXRqWER4L2tZb2U2U1pOZUNnRytjVHgrMDVp?=
 =?utf-8?B?a05zQlMvWlNpN0NPQVhKSkJvQmZEVDZtc09Oek11RDljV1UzbmZ0Y1Q1bnA4?=
 =?utf-8?B?d0g0MGN3cHpQRlRuTnhLeG5EaUZ4S3AzTndzZDljbkFxTmptVUpxYnkyZVU4?=
 =?utf-8?B?UTlnSW9hUVNWRzhnS3NVYVlSbUpnV0ZEblJhd0hlSkYrelZjbGZYWHVQYStN?=
 =?utf-8?B?UUdQMGVxN3A2ejhpZ3JDa0d0ZlB0eEVZTUxBd0wzTHNEM1VoZ3pKZkFrU0xW?=
 =?utf-8?B?US9BRzRtelpvWjZxMlhqSm5TZ1V3WUhmU3JmcmR1OHVmUUFINUpWOG1IamMz?=
 =?utf-8?B?M1BOeFdTNm9RVDI5WDJLK01pWFdMMVowSnRqQ3hZR2ljUS80U3lNMVRWMlV0?=
 =?utf-8?B?aFE4UHU3SjRRL0IrSXJwZElXRTczVU44ZXVneEZJN0U5SHZXT3pPS2tvakFo?=
 =?utf-8?B?MiszdmI5aUNQNVhxRGVyY3pYMGxibzBncGtoZXFpMXNhVUVGRkt1Q04wb2Ft?=
 =?utf-8?Q?lxfQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDZvdmVFUVR6MCtzVXhmbHFITG5CbUxmY1IzUjJsYXREN2tPTEJMYnRkM1B2?=
 =?utf-8?B?L29kU0lvcHpLSEpuaWEwT2xtSHBPUjBkbVZXU25UNHdSVEdieHhRQjV2dFpI?=
 =?utf-8?B?aEswamhPS3l1Qm1hallmYWpVTFJ0cU1EYk43T3JwcDJVb2pRTHJoMUVQNE44?=
 =?utf-8?B?ZzNWWGYvMDhPaWNVZjZLejhVdXhZMG0zOEtzTXJvS25XZWpxdTV2eVZYZy9I?=
 =?utf-8?B?VHp2OTZHelZRVHU3d25vNmpmL0NLeXBPb1JPQ2JXNHc4ak42dVBtdks3dERK?=
 =?utf-8?B?VDUrSzduc3ZadUZsdk51YzJvdTlUckFTczRwVE9QSHFzMzNYRlJSTWQ5NnVZ?=
 =?utf-8?B?ZjU5TFY4bWFGUFVWTWFobzlreXhuQlNoU2ZCL2FRa2FlOHFBQWwyMktJRTBz?=
 =?utf-8?B?S1BRSzVNYUkyL205MTJPRWJobkgwVDV5MDhwTzZMeHhXSjUyUXlxMWZMZTBU?=
 =?utf-8?B?VDkwRUV0VHRGem1aK0sxSCtxMXAwL0w2YVIvbml0bVVEclFsdlFJNjN6c0Na?=
 =?utf-8?B?NnM2OVBxVCtNdURkL3V4NnREbVVTN09kN3FLSUF4b2JaalZEMGtVMk1oMmRy?=
 =?utf-8?B?UFRsNmFUS1JRbEQ0TmFjd2lzTEdKYit2MUh5akxXdHJGbVpoZ0M3YnRDcm9n?=
 =?utf-8?B?U3hXbzY0ay9sUE94aCtyN3FtOGNQdkloc3JzZ3U0VU5XZ3Ntb1ZHMHZzYXNI?=
 =?utf-8?B?M2EzWTlQa0huQkN4OU5xQ1ZuU29Fc2hiTU1tSFNSY05yWGVPZGpXVGtzWmFE?=
 =?utf-8?B?a2NmZ0VnanpXTHp5QW1VaHlsRW55Sy9DdEtOQjJnOHdtZTNPTm44YTBEbzNL?=
 =?utf-8?B?b0ZmWEZRMkhTbUZYbTNxYUNXSHdDblZrMWV6bk1lcW1TTGd4ZUhwcHJsZldw?=
 =?utf-8?B?bVZaSXhQQjdzbUJmZDJJUER6Q3RiS1BqQTBLamtpdTdYMHhGd0N3dVJHWjhC?=
 =?utf-8?B?UUs3RzdMTHVkL0x6ZTRwTXlzSDdsYk9MWllDNlVTZ29zdi9nc0JxQStTWmVK?=
 =?utf-8?B?clBNd1R0cTlrdkNUL0lwQzhQK1NGdUEvSGFVSUpWTk52NDR1b3ZHVHdZOGM0?=
 =?utf-8?B?UFAxMVMvLzIxaUZzR1RPVzRqN3A3aGRoZ0RNUk5VeGpHNGYrQkc3VUIwR3Zv?=
 =?utf-8?B?MnNvWGNzQUxJREdNd0pOZ2l3cU1na1ROd2d0RWowbDVSYjJBb3QwV1VId05z?=
 =?utf-8?B?SGUxQTRGeVJMcFg3ZU1VRjJod0cyRnUxYk9qV1RrN1FadTVubUVYc1pEdUho?=
 =?utf-8?B?Z296ZFhtOXFKaGJUMzVHaWNteHgvMkNtRi9lTG9OYTIzejROYVdOb3ZoOExM?=
 =?utf-8?B?dmNVSm5DS0ZUTlc0dmJHQTY4VFdTV0x3SC9OL2N1NmswaklMV3htS1poTUJQ?=
 =?utf-8?B?ekQxUGxUZWNOOVF6bnZFeEh5eGI2R3VOQ01sUG94aTFSdEVHZ1dqRW1FQkxQ?=
 =?utf-8?B?S2xHU1JMaUNxVDdYbm5nTzB0Qm9rSTl1c1BIYnorTHhKUm5EaUNiRFhXUURU?=
 =?utf-8?B?dGw3dDV4Um1QNWpobTVHMDNVQ0RDQmVYZ1FxMjRYVytWbm8xY3NBZWtmcjd1?=
 =?utf-8?B?cTVHWTJkdFFCYUxJQkRWdjE0TUp0NVZSbmVSVnZvMCtxQ3BtZjhXSGdYbDVW?=
 =?utf-8?B?aXZ2UG5KbWZFSi8xV0J5U1dSNVNUMHk5R29VY2JwTEgwak8vY01ueG5ZU2dy?=
 =?utf-8?B?SWo5c29qYklaTjVKS0lhazh6b0RoZXlrYUdKcHpsUXpWcGd4THR6ZUVwakdm?=
 =?utf-8?B?WjgzNmRDd2hyUEpDWVdlNUdlY1pSSkpHbUJxaitzQloyM0tJbDFlNDBkUEdC?=
 =?utf-8?B?eXQwK1dQVXFBYVhSZnBEUGNNbUVXM3BDMzViMUFqbm41S2ZzamVFMlRvd3dL?=
 =?utf-8?B?UjNxVllBRWdsMDVBZmpJTEwyN0kyeC9QbUVjcFpJd3RraTk2MjRFUHhZWFNN?=
 =?utf-8?B?dG0vODNlQzF4a0YrN1BZVmRueUc4MUF6UGpZMCtrdzhlZ1B4eU14V1hqd3gz?=
 =?utf-8?B?cEZ3eDY4Y1FaY21qTWpzcW85YUxZVTFPTXl5NnRiRDczUUErSzk1b0xoVUxh?=
 =?utf-8?B?NUdoN2tOaFZXdnpjYkh1RW5ZcnZhQ3Zadkdoa1pWUUhKQm5rQjB2aCt6V1VZ?=
 =?utf-8?B?cTlRRXJRdnFYOVR1NlF1aDR4aWpocVhWbUhRd2YwelhLcHNMVzE2NDRiQlA3?=
 =?utf-8?B?QTRsL1RaYm5CbTB5cnlKQUd1TC9ISVB0T0ZaVCtveDRmS0NEZmFSVERQeWhN?=
 =?utf-8?B?am91NURXUUhsODE0N3Y4RVRtaEVUM0pIZGR3Z3paT1lva2xrOGlLaFdlYXVB?=
 =?utf-8?B?YVhraSs1UUl2K0NiTEhLSWQ2Z25hcXpNbEJONVcrVmYzYXpmZHphcys2dDJo?=
 =?utf-8?Q?YftJqowDAtLJ0lM/gNAueq9JrQjmuTkiOnV8uPTkrw268?=
X-MS-Exchange-AntiSpam-MessageData-1: AGPny2kg/OVMhQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2fbe3c-de19-4aa6-491b-08de5f0c9f49
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:01:35.1384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owyprk3X6fDs7JtBdOw4eRgHZxVmpS/2Cd0bFDFABrpEHBjy9uRHOmw0N3Z9plUzsWVDmt4KS8JaSYg53JhNfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8918

On Thu Jan 29, 2026 at 12:46 AM JST, Gary Guo wrote:
> On Wed Jan 28, 2026 at 1:27 PM GMT, Alexandre Courbot wrote:
>> On Wed Jan 28, 2026 at 9:35 PM JST, Zhi Wang wrote:
>>> On Wed, 28 Jan 2026 11:37:32 +0900
>>> Alexandre Courbot <acourbot@nvidia.com> wrote:
>>>
>>>> Convert the direct IO accesses to properly defined registers.
>>>>=20
>>>
>>> Tested-by: Zhi Wang <zhiw@nvidia.com>
>>>
>>> I can see the correct value of the registers read by the sample driver
>>> from the demesg.=20
>>
>> Thanks!
>>
>>>
>>> Additionally, Clippy was complaining about unnecssary unsafe blocks and
>>> can be fixed by: (I haven't fully gone through the code, just applied t=
his
>>> for getting rid of the warnnings.)
>>
>> This is because `Bounded::__new` has become unsafe in `rust-next` ; this
>> is not reflected in `driver-core-next` yet, but won't appear in -rc1.
>
> Any reason that you send the patch based on driver-core-next, instead of
> linux-next? You won't have the issue if this is based on linux-next.

driver-core-next is where the patch is going to be merged, so I use that
as the base for the patchset.
