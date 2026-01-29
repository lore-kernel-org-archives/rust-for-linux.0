Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021116.outbound.protection.outlook.com [52.101.100.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE9E350A12;
	Thu, 29 Jan 2026 20:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769718219; cv=fail; b=hVzFL0gPN+HUCyBq7V9hw3qO3rnPITw4Lgt/6hPEkUcnz+Ta6Syg4LQ3NibxRGWlb179Uvys0UDRqUbQz7QcRwD+61wB+vqIRy5sEot3VCZFzy+42iKFBIltKtZXbm81FsSeYcL4Hn6YTxg4m7hIq7f/uhd3SawobQfFd2nAfcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769718219; c=relaxed/simple;
	bh=Y0KHu4kxNLEV/a33BN/0kC+um1dsJRpea7U1FGmv0hY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=oexwmfL4OJZXzUp/LspxWVB5GWJbTEzCQvTZZBDraEyaYOTj4aOUnAudTw0kPKJEcInk1mOILMyYK/LmL1sY/1YUjEd49rYw+sduuXu2duEYK+2BNHangEPk5E7HHwMY1/L49vpkr4CdoB8cEN8Fn8PaVjLy8zRvs0kP3Qtr9cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jCAZAGRp; arc=fail smtp.client-ip=52.101.100.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jCAZAGRp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K73OlcNQnc+wEqROGCTppvbzgU25LQ1vvlnPvcIxlA7yURsPOx+e2aRERBuYr2Zcg5C31YtWdKJj000COXrEVA/ShT0tU1FUBrELGz9yG30eKYBXh0lv+2DawtmJGL5tuI5Y+IBypl1okvhhkUWMBh8N0DOF3Zr0Ls51lclcTN0lDdE3uhRa537B17JrlfXO5u1aVvVBrJUWOZZhpO81/mk3wIdv02645ZoVsalhE3iCSx5jRSdql/xRC2EUcP1k8SNJLDZyEkQx3uWu35piGSRq8TTUtgx7h69QKjBnRvQGxijijkHM61EuManmPmWgegaXkBu8Lgyl2iVfcEg3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kW2KRYZeG6ilk5Jmjy/4iAoumGNMTHSAPbgdmHBjgkE=;
 b=WoN02TAI0G+f+JGLYPIRrGgEekzH3U4qI+qW8ASL2gNYDaDsW5D11ri99TxWtyLTHOjOQkCvLnd30vGXIrxJni06Dp5qSpyExWYzI0b2i2FL65aSNme8KUdiyzWx+E3ssba7hcoOKdG1S/3sof2tu0F/XGcrzS/jiR8Nux1+X/jPvVgEWD66AmVG7Ote6eN2GTxMO9wZbrBtVp3wiQuRuh+fE56HsC3iUrkp11vUFXqReIchBMZWms+h7dpD1VvJjRhR/QGhA4s3YZdOjq04pPsn3pEB6M6nhHx8H8GYPIFUJY/yVsSe2iTxxfjLErpPWHV1TeO0VcD5ni7HwSr95g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW2KRYZeG6ilk5Jmjy/4iAoumGNMTHSAPbgdmHBjgkE=;
 b=jCAZAGRplI5M14prNu1u632yEuJlJGTvSIbF8ErhS1dJq3cDwEqYZA/xuECAKoxVOLaQMalnVVbBMxDleHb+aZD5/8lzrxixk0j7xOmYYnTOHxEqqyPAVldY/fYrqI8t1wZdVTn0b8cVG/JlYUr8PCBVfm3rWz27LMoUDFl9sPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LNXP265MB2426.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:133::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Thu, 29 Jan
 2026 20:23:33 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 20:23:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 20:23:32 +0000
Message-Id: <DG1CQZ54QY3K.28BHAW8Q3Q4A4@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/7] rust: num: add `into_inner` method to `Bounded`
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-4-aee3a33d9649@nvidia.com>
 <DG0C68O25Y9X.2X8M9OXMW17IS@garyguo.net>
 <DG0X202UKD4K.13ERXKFN9XU7V@nvidia.com>
In-Reply-To: <DG0X202UKD4K.13ERXKFN9XU7V@nvidia.com>
X-ClientProxiedBy: LO4P123CA0429.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LNXP265MB2426:EE_
X-MS-Office365-Filtering-Correlation-Id: 8899574f-6020-4ca2-b040-08de5f7445e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWc1bjIvaVRRQzNEME9teWhiVjU1WSs1ZHJJaGxiZDVKWDk2Umx6Qkxhclo0?=
 =?utf-8?B?UXBVa01FenBGTWhiQ3p2a3l5SlpxQUFNczBDUUFDU1RuY1NEd0xhU055RGkz?=
 =?utf-8?B?Q3hsVllidk1LNHoxMFZ0YnZ3d1dPSzdKdWUrMTR0SVExUXZVY09neU5UT3Z5?=
 =?utf-8?B?aUZVeHJEcjFyRWFlMjNEY05UdVZiTWtxaG9GQkVrdndXZ3V5UjFnSS9LRTRx?=
 =?utf-8?B?QTZtOXd1U3poYmhzeTk2UWR5eFl5ZStjc3VEcFJXTzdXMHRTeW0zQ004OU14?=
 =?utf-8?B?eU9kWjR1L3NGVy9hWFU5djBodVVQM1Nhako5aXd1NjVWbUJzZ1NrSGJiazVm?=
 =?utf-8?B?dHNHL1JYeDVjR1FNeVBuN1o4bCtYTXhKZ1dPU2h5VXh2UUJ2QVdDazRBQVVx?=
 =?utf-8?B?dGQraUx6VE9XMzMvd2VIdzNjb0N1T3RnazJRSnpsT0lMUVlsSTRyVitEMzBX?=
 =?utf-8?B?Wndldkt1WXpaWGNRUGpFNkxRU3NLdjhNUGdmRmczWWl3YUtESmdYa0c5Qkkr?=
 =?utf-8?B?a25TKzgxWkZ3MUJJdFVBeW9BeVhKR3pMNHNnRGZzM3R2M3hVaGxVcTVCWE9o?=
 =?utf-8?B?VHpPb1dpazVVcnpwWjAxT2YrWjU0YjB1L0FQNUVRbGk5R1VSQlp6QWxkZkYv?=
 =?utf-8?B?ODR6SU9xeEljRnNMV2I3dHBOVU1Pa25rVjh2NVJZcVdTUnJ0QlNiSDYrRHRU?=
 =?utf-8?B?cER4ZmdRSlkrUDBZVEMwYmhBZ3d5QUhwYkM4WS91Mkw4bm1BdXE1WjgxZ1dz?=
 =?utf-8?B?RGFCcmVVSTBhalhzMFd0bG9yQ21VaW5vZGNaYVB3SDBFMktEWS9zd21hKzB6?=
 =?utf-8?B?MFFXRkVjQTJMbzdlNXU0UDhoMzRZd3AxbGxDUnFITVY5MUppeEo1R0s2WE84?=
 =?utf-8?B?bEYxbXIzNkdHbUV6ZFExaUhCd0ZGZXEvdkx4RmVaR3RXY1pmUk1BaWRVSWNH?=
 =?utf-8?B?a2xXNzNlc1pBeUl2bXVXc01vek9iOHYyMEtmNXkrSlBrcGRobi9vbnlTM1da?=
 =?utf-8?B?SVlrVVZJRjZxdm4vMGhrYkQ0T3ZUdkpCWlIvNlNzdW10NkRCcHdTcURKVyt5?=
 =?utf-8?B?QUtVZmZRVGttS0YxdWQxU3YyWG5DZ3BrSUcra1l5R2l2dlpzNzllNjYvMytp?=
 =?utf-8?B?S2tqM1lqeDJOWEVlMjNORFZhNXdpc0pkZDdGeVNLeDNkazZIWkF3MzkzalVq?=
 =?utf-8?B?a1pVanQ1RlBhZExoaXYyT2VmRVZpUDZWNEY5SG5kNkZsd3dkUmhhOUk2Tmhr?=
 =?utf-8?B?WU92V0VOUEhvMUQyWkdXeXhPcFBuMmdHSWpTd0Z0dXBibkloWjJxazAybHZO?=
 =?utf-8?B?VWkrRXZOZjg5SU5POTBscHRZUm1WTmExVTRMdlIvMkpTeDdOcDJ5Z25rTFV5?=
 =?utf-8?B?UHhab3hqVFFzbzhzUXBIRTNqSWFtN3lhTmw2NU1SN1JPNG5URzNxVGx0d0xX?=
 =?utf-8?B?Y21SR3BCdWtjRXd1TE96S2FUeHU4UDRFQm5PYjJZdEtKVHFvY2FXZFRFbkhF?=
 =?utf-8?B?TGJwbDFDQjVwWC8vZXgweG1sLytWeXZSTEJTODVweHhOWUFieDlOL0xpbGVV?=
 =?utf-8?B?b2lLcWVQOTdkcXJHRVJ1czVzMytKbWVwZDNsT3FxVHlMNGxJNEdPRUM0TUxI?=
 =?utf-8?B?blEvQlZjenUwdnJ0M0c0d0RTMnpOc2x4cHE2dlZWcmk3ekFKWUVSUVVkV1pi?=
 =?utf-8?B?TVJpbnZ3QUxTcmUrTjFvMDk1UHEveDYvTVBwbzBuN3ZYajdpMzE1UFpqYk5T?=
 =?utf-8?B?S0NhOTlXaXY2ZGxMTEdpUkNybHRrTU04cHVKT3V3VXdpWnUrTW85anJhZjBJ?=
 =?utf-8?B?Sjdmb2RQeXhCaEJlV0JkQzJ4Q2lYc3FDVmNRNTdBN0FqRFZTNzlkaDdzeWdP?=
 =?utf-8?B?UzdHSE9FTUtLSDBjcnBMNS9ZNWQ5UVBNUUhLbWJzcVJOeUFWV3gwaXFUSXdK?=
 =?utf-8?B?NzZmZUZXVjc5cXp4RTh1a2dhckI3ek5JMXJRdHBIY0drb0dSYkhSRVNQclJH?=
 =?utf-8?B?KzV1YTluclo0ZVN4TTFXMmppcjJBNVFjTXZYT085RmRJQU1uNjFERkU2UVkx?=
 =?utf-8?B?ejF2dmcycjM4Q09jbnY1djZrUW5ZRkNKT3VOdkZuTHFUTDZKSmhOYy9MNlJa?=
 =?utf-8?Q?e+Jo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHdWbllpbWErSWRQczA2RGtQWU94YldFQXRrUXRZS1BVcWxvNFdTVVFTNnhP?=
 =?utf-8?B?WVo2WXdSYlRlTURoc2ptREtKdDB0UU84NGdEcGFKV2JVUy9yc0F5OTRhbGpi?=
 =?utf-8?B?NDRZa0ZMK2tHRERCK3pyL1lnNVpUT1dja2VTOUpCVWkwSGJvK0tmTWdkMmtr?=
 =?utf-8?B?dExKMzd4djQ4Q0pZeG5jOEl4RjdBdWF4dmZRWE1paVEvTlVwTWU5R3VpbFhu?=
 =?utf-8?B?anQ2YTFDZ0IwVUNMaTUwTVNPdnZEUjgrUk9jNUc4bDVxS2NieEFQc1AySlJH?=
 =?utf-8?B?QmMyY1FvaHA4S1dGVklvb05RRkExS0JZc0dXZHVyaVZZcUlmNWFJZFl6K0FP?=
 =?utf-8?B?UDUvcW1YUTBNcG04SlNDZUMrNG94OWRDSFdCSmx5M1c4bUUwNGxjOUxmTXJM?=
 =?utf-8?B?T2VFckFna0x2T1doWHJhUWJvVTlKeEtoYWtQdHZCRWxSRElLL2swUUkxblNk?=
 =?utf-8?B?MWpmSjU2MGEvemJnc3pNcVFsMXZiUWovY0NnUDBZY20vY1NHaENPeDArcFlD?=
 =?utf-8?B?cnlrZHQ5TG1FZi9DWU5Pb20wUlM2QW5QV0dYY01YVnN0V1lmWW5XRFhpN1hl?=
 =?utf-8?B?OGJUNE1vdy9wYnJKdWZjWlBkSUpCY2ltazltYmVJRkxDc0Y5d3RoT2JzYi9Q?=
 =?utf-8?B?S0RXS3UvQW04Q0llQnpUZ3ZKNForWUNIaVpBWFNxK044VlFsaWJQUC9uK3dT?=
 =?utf-8?B?OWZtV3NEQXFNSWloMVBicUZLbDA5VFBKOS9wQUJXQXh1dFpCNklOQkdweGF0?=
 =?utf-8?B?cjdzOU1GdDF4Mm9RZ25zM2d3TzV5NmpIQlNjTmRQUzNZWkFEa1drNVg1Q1Ni?=
 =?utf-8?B?YVNrV1FiNm54TXZqMWZhTTVybk54R0ZGL0RROGo3akNlajVvOUJyUjJqNmtI?=
 =?utf-8?B?dGxObjRubEFpdjBNdUlTM01wYmJxNnM4Ym1uQkhWMGl1cFhUQmNhSENQTFBV?=
 =?utf-8?B?UU8wUzVTUlhCbTRFT25tS3dLQTErdWNuSFRDOGFJaURDL1o4T2VEZktvb2Nx?=
 =?utf-8?B?WFNPYXhwVDd4M2hETXFEOHRtby85UzlHV1hqQk1KMkFrdE5yRVlKYWtsaStJ?=
 =?utf-8?B?OVNScVFlNThiRy9SbmFLb3dBVjNXSlNGM2JpOFEwZ2czNit6TWtSRzhDQU1L?=
 =?utf-8?B?aGQ2SkxrOWttN3NJQ1JxVnEvdmV2NUFUWUlkMGN1am83QkhxaDh4YXdTTWZ2?=
 =?utf-8?B?VlJBUXJPUXRMVWFvT3k0RFV1dTQvWmF4SE1IblIwanFJZGhreWx2Y1d3QXNN?=
 =?utf-8?B?SHdVWkcvRFFKdGhPZ2NXbElUMWMxVmRhV1dYMnprUzd5VmtIN0lhV0crSVVN?=
 =?utf-8?B?Z0FFRDQzTDdWTU14U0ZXc1hnOHNKQXlyaXpnRVZZLzNKRStYMTkzK09EK1Nt?=
 =?utf-8?B?ZFBlVXdCNHhLMXIxWG40bFlneEt3ZkZHSnVvSmpnYUp2YU5vUitqcjdtS2d3?=
 =?utf-8?B?NXBaL2tVNzN0WXdoTTFmUXdPRkUvQWVKdGo3VCtGNEdmZ1lkNElac3JadFdY?=
 =?utf-8?B?aE9MTTB1RXpCb3dmdVdRS2VqQm9LMkZxbDFxU0JhaDdhbklGeEt4TWEydm9U?=
 =?utf-8?B?NkRJenhSZTN1dnNwSVR3blIzRllxV2RRaEx6a2R5cEVsYlk0dC92eXc4UndW?=
 =?utf-8?B?dDE5VTU5V1d1OFVLVVZXb2lNaE9YL3Y0TkRwZkw3S1p2VFVyajV6MjBXT1da?=
 =?utf-8?B?cGpFZ0xKYjJkR2Y1NDQraWt1bFExMWF0WnpUMk5qYVErL2U1KzZVMEozWWxs?=
 =?utf-8?B?RXVIR3hvZFhsNzVhcUM4SEVzNFYyZ0JpVmlvT2Z5QzZBUEd0NUUybzB3bXRY?=
 =?utf-8?B?clVuM3ZXUUdpYXBRaVUwK2dyVTV4eHlRQlpDYnNxZHc2OTVLTm1INWxwMFAr?=
 =?utf-8?B?c0JIcHc0QXZGV3Z2SExXRlBldzUyakNDSlVxNncxb3drWXlERDN6dllGY0cw?=
 =?utf-8?B?Mi9lU3hoQW9FTzM5VzBvUVVRQUtyNUlwZ0NTOUsrT0hDcVZmTHJKWjFXZ1Er?=
 =?utf-8?B?aEZzR3gyZnFtaEwzV1hYWERqTDNJeVlLODNuVXNWMU0xakRqRlRDamo4eVB4?=
 =?utf-8?B?bXQ2QlFiZlZmTDJjSFdwdWlRZ1JNNm5SRUFEbWkvY0JaYWRGdWdZTFVuakow?=
 =?utf-8?B?Zk9yc3V2U25hRHUrVjQwM3pDbmxMbVVvclNqN2pFajdidm9EaDBvbktEaFNj?=
 =?utf-8?B?d1BEYlZjWlArd2tsRXF1ZFZhaGJwdHNyc3JGd0lMVlc3YWRoZ3VIOGw5d2or?=
 =?utf-8?B?VzFaeDZwS2Q4UjB5WTdHK0VDQUJ5czkwZkt6TGpTV0wxQU04dlYzdzY1Zzgx?=
 =?utf-8?Q?OMEKiTj9apqifDrrt7?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8899574f-6020-4ca2-b040-08de5f7445e5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 20:23:32.7557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xa4T223QZe0sb2ms2Am1/jofpSKDgh5YcjFfGRRE/LjprLShFbbKbOy/OqU/XFQKB0VfbuVwCNzErY83euq2mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2426

On Thu Jan 29, 2026 at 8:05 AM GMT, Alexandre Courbot wrote:
> On Thu Jan 29, 2026 at 12:43 AM JST, Gary Guo wrote:
>> On Wed Jan 28, 2026 at 2:37 AM GMT, Alexandre Courbot wrote:
>>> This is useful to access the inner value in const contexts.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  rust/kernel/num/bounded.rs | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
>>> index b41ca6df1525..850827033f67 100644
>>> --- a/rust/kernel/num/bounded.rs
>>> +++ b/rust/kernel/num/bounded.rs
>>> @@ -388,6 +388,22 @@ pub fn get(self) -> T {
>>>          *self.deref()
>>>      }
>>> =20
>>> +    /// Returns the wrapped value as the backing type.
>>> +    ///
>>> +    /// This is a const-friendly variant of [`Self::get`] that can be =
used in const contexts.
>>> +    ///
>>> +    /// # Examples
>>> +    ///
>>> +    /// ```
>>> +    /// use kernel::num::Bounded;
>>> +    ///
>>> +    /// const V: u32 =3D Bounded::<u32, 4>::new::<7>().into_inner();
>>> +    /// assert_eq!(V, 7u32);
>>> +    /// ```
>>> +    pub const fn into_inner(self) -> T {
>>> +        self.0
>>> +    }
>>
>> This is... just `get`.
>>
>> You can implement it (with the `fits_with_in` check) in the same manner =
as the
>> const new.
>
> But unfortunately doing so also prevents `get` from being called from
> generic code, which is a must-have. Or am I misunderstanding your
> suggestion?

Can you remove the `fits_with_in` check then and just provide `self.0` in `=
get`
then?

If the assume is really important, then we should at least name this `get_c=
onst`
(or `const_get`) to indicate that this is a limitation caused by const eval=
, not
a completely different method as the name would otherwise suggest.

Best,
Gary
