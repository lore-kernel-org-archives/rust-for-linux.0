Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020105.outbound.protection.outlook.com [52.101.195.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A180C45BD48;
	Tue, 28 Apr 2026 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381885; cv=fail; b=P0XV43eeZqrwIvxuMLE6QHEXzKcrYr/irqD5JaDNmJM5mhqQJ6Ng4+MhMRkRzKEPvyJuRLZ4n/d9mMHep33wrg8R7avLk4OxPoB/IV3uD2ZV0FB+othzFQ+R6UUlNFIubt3kQnRiiLVSwwjhyrZYshqBPtNVvoWY245l+0oaERQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381885; c=relaxed/simple;
	bh=dL6G2NdCiZkxu8ZbUHBrGdL/tHklWsrAbYQccZ9ZsmY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IYeJ2RFsgmVe1cubjIsD/zJ5kDcvZZn6QO2sxL8btLmJuAv6w+ud3dXmvR5awH2DEieGlqRtHPseYCDkK4eKB8bSqAbdUFOSTyA8gad6p/YQXOAw1AVkNnhmoSVtIUFxMR/TSCHxrOh1uwyUVUMrHYlAxxUBmFO+epMy+FzT+nM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Dc2cjuR9; arc=fail smtp.client-ip=52.101.195.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Dc2cjuR9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVDuZujp5ezVjt9i75iorhF+xLfrqBWeQbgZ4xUA0fPIs6mSNtjlzuKF/tecWpyUGAfwohdd+TDe9oMzKMpc4h2ogPiZeoFm2qtFgW8JR80a+HFlgPwXQxchx7fpugP+5kYuC51AK6Gdnqw89pxTR1y20cAFG4a7zbTE7n2dxgYWl0kYAKq+SIBH3Gg3eOobgCpTaOtprcCS36VAdaqo2RQeLdGv3zgTQaYmMSe4ltg3P/DGpH6O7jiMwqcsPczycY0IVoo+IjSBQpywkYoGcVGllzWDl0AWAbtVaHNvPnFJKZxqETwAG1iiytCM+8Vwt9bnWMyNfTBxLKNk913GGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKhWTrcxvCcvhTqwhTUamkZdc9BiNKvRiQlpdNCzUxY=;
 b=XdGyOl9pT1JGgvJHbHKuianGQ/ZWseJbvMwsRX1YpFtciV5WdHy3h2AJYVfXO2tTuwUMsvDVvLYngyAlSBSmDDf3x7Fc7MCv7tjmijQiebnV4if3sV9oUV4794GxN+xDRiBlsTH8AmLqxNTkpdLSFO3Y5Qh0gKH72PFEvKFVswPsmgN4dhmuANhtTJKj3410tcnKeDsYt1ct3cJ1AVsVJZH2SNiQfj9KsKBP8N6m/0F7k0NmurhMLInNmt4cQFTuzwrpqnj0tUkeVT4+A1v+GPIaA/wZnDGK8jRI9fyysJYsMZRi8vv6Lsf0oy/VRaYQKeJsKqusRBqlgo2P3zuqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKhWTrcxvCcvhTqwhTUamkZdc9BiNKvRiQlpdNCzUxY=;
 b=Dc2cjuR98gkB3+AG3RsakTgqKB3dd4YmhnXqc66FS1hHwkFe9XxJ5NKdvOHZ9O+Jx5kwjmDDWqi5v/IgAiUk+9ZaUbj1qpM6LNVtk8MoarAoIW/gh+AIjqYRK7AFRYoSiGFqPRj2IfO+7e5DgxePhxYfSLz9TUlT1DKAy4i4JP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5969.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:11:13 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:11:13 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Apr 2026 14:10:57 +0100
Subject: [PATCH 08/10] rust: pin-init: fix badge URL in README
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-pin-init-sync-v1-8-07f9bd3859fb@garyguo.net>
References: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
In-Reply-To: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777381869; l=967;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=dL6G2NdCiZkxu8ZbUHBrGdL/tHklWsrAbYQccZ9ZsmY=;
 b=s03Wn8uQ/xvXvHtJkqvE1usrSEKktKoy7j7Uv0E1m7zNReXw5S8WZn2It/Tg1kdg+xHaiH/qr
 k6xhNG7fEiGD+jvcBoANcqPyuvkHk/8pgXQTFhdeVYU7ikuB1KWR3XV
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d7710b2-aa37-4a7e-209b-08dea5279f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vkSo9uEnhBaDEjm94ySxAnQT8AVFTYZTNNzyA36pLurAn8/yp3WddZOAWF1f4pxwotQMXdS9IgOYdmeO2cowA4P470ZhUy1baDg6vUWYGKJf7v2OUNMQVcUh/826bs4EP0CgMHAqs7OjQCRCe3lqop/4FsHAEmqC/fw+bcAMpjDfk4psOi5bV+5haw+aAfDZR19e+oV+E4V/Do5wJ+WPgFWcNAm+zLSoI0aFGMqK/gwSQ/2ry+ee6wYTG3uUulmP4OHwCoHv8WzOqucCFiwPISsjjSNbenfRu1npBFDDMZshO0LwbCGG9QbaCby+41WIA/GFpUKKp/DQANGGAxdK6VGJT2jJtWWUbJOGCKX7cLgCDBDP7eeh9WXpYSwdFndZ/iUkIkTvzH6xIKUfWudrerXLAabGAH3uQFS197eiamoSG1q4t5iMU0QTVSJRPHpuovOCeZX1fgu03sBhcvgrDKQVqCPSL/KkSLr0yzw7IJoHA9tzRd5xBMMg+GsIFhM58gMxhxCbgLQ1am46GDlshDa47im3pwgPMUJOs0XDubW6oW84Cl+zy0gpllkGqUWK1X/jc6OFWl1wvFGdYzjNvIoz5eANT7yShiZziTg0o8Wwx3P8v6YDPg3gN9eR8SRaIt+BEhw9g+3rM315Ik6e4M+IzNeACykT7wdmQ9CGsnrn+zB4i7UnW4kNfdA7543o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmU0VUVTVGhpVHZpK1d1U1NQY3JaSkdFZGtRRnMrOFNadnhNcWV3dkV4VjB4?=
 =?utf-8?B?QjV6MmJOQTdkejY5S3kveUtrbUxJcEVVeHJrdHREWHRtUk01TDVvbUhVSmlq?=
 =?utf-8?B?ZHNXeGJyN3BTeHhYTldiZ3RhTGRJdjgxV2RPV1RmZDV4SVhEN1ZsajlaZXpn?=
 =?utf-8?B?MXN5VG52T0xRZklrWGF2bWdERUtYUUxlM29vT244c2hmWGg2dDN4QU51b1Fk?=
 =?utf-8?B?OSsvcTVKU3NDUWxtcVZYQi9kRHV2OVlveHFxRG5YR2lFWjZ0dnhOYkNaZ1U5?=
 =?utf-8?B?SkdBVzBpY1RDVmttOWVVNFN2R01MQUlWVjlvT3IreWZ2YnhhVXoxdG10M2RD?=
 =?utf-8?B?QUtHV1YwUEpLNU5UWkRBcmNIWkhORTVXNkVQVVNjSDFiWTkxNlNReDBWNmZx?=
 =?utf-8?B?RjRjZ2xPd0c1cFdFeHJOblozT3BqaU9ZOWNROGhaVzBZWk9ya00zdnBVcHhS?=
 =?utf-8?B?L1RFRzY0M1ZNUExpOXZ1WnpOU1pCSVFicTFaRSswZ016b2JybkdDbnpJcVZI?=
 =?utf-8?B?ZnNRSE8rK2FWeHRGbGQ3YkQ2d1MxdGprWDk2d0s4RGVSWmlFUkdxTmJFcUoz?=
 =?utf-8?B?emk3S3JYMWtNUzd6LzJ4SG41OFhCa2lENHdHQ3gvZ1dEclJUeTVuQjhqWTF0?=
 =?utf-8?B?VlZURHplSERXY29GUEo5V1M2WjkrbE1iajhWdmNtMzUvWmdVZ0pXd1RYanNl?=
 =?utf-8?B?YXJYTkVnUDVodVRZNW9NTWZjN0tuUE8vSHQrcXZ0NGxjQ2p0endkeVR6Z0hu?=
 =?utf-8?B?dVNzMytVVHZ1NE5iaW1qeFBleFBlbGoya2xRZ0gzY3BmMFBPZ2h2UkdPcnA0?=
 =?utf-8?B?WTRDOG9PNG4zZEg2T2hUbXhUamVJeGpqZHpjckNVMENXWnYwd0RCQnFDTVY2?=
 =?utf-8?B?ajBGaU1VMkdKY1BRZWdWbXJaWDhBSjBWeXRLOWg5bGJ2Y3c0UmJEbUV1MzRN?=
 =?utf-8?B?OG1yYkQvYzdYd3JPaUx6cVorTitCbHpjU2hseFYxSnkwNEtmSjdVZ3JsQWtl?=
 =?utf-8?B?VzlBNkdrTmdpVnV3MXAwNms1SFdnT2ZTVEh1eEJsMlBub05Dck5TYU5JT2pQ?=
 =?utf-8?B?QjVRQW1JbzZMUVNRY2VNdUdnTGFxeCszdjI4YU9XaHZURlpZSzNsc0VRUDM0?=
 =?utf-8?B?R3ZYeXhhbEpjU0FsWTIwZnhGNWMxU2RFN3Jjd0JHOFpMdVVyb2dXR2hGVHFZ?=
 =?utf-8?B?bTBnTkpYU1pkVEFBVGswUUpHSGd4SEZ2NHdyc1ZwdEJ2TUZkalp3dlI0ajZx?=
 =?utf-8?B?YldXaGxkZkFjWVNONkVrNUVWNUJwQVRvSFZXMFpPSzNsbngzdzJ1QUNJWFJI?=
 =?utf-8?B?MWIwbTNQa0Nvd2pVZUh3VmFSU1llcHZRdmVlV1h4N3pDOEJrdXhZditQdmZt?=
 =?utf-8?B?TnprTzZTUEFYSVI5RjhUemExN2lvcHQ3Q2lUZkZFTllGR01HQk5FdE1IRWJy?=
 =?utf-8?B?NENQTlBnZlRvZGZFUWZsU1dUclRncS9qaEZhRHd1eG94MmMwMGFSS3dJVHk3?=
 =?utf-8?B?eW9CSC9HZk1hNmlXUTNnUHp4TDAyNm1IN0hYM2hMd2VieWs0bXU4Vkp0SVJi?=
 =?utf-8?B?NGx3MnU5Y1R1c1V3VmdyT1VPeEpRL1FSUzlJR0pYdDNmd1prYnVETDVzZ0s4?=
 =?utf-8?B?V1M0NThGVXZRTTBLZ1lmS2FGNXloUmdrdVNoY2d1TlROcDh2Q09HTHlxYjZi?=
 =?utf-8?B?b3d4RHZhcll5NHlMaTdrVEdOd3UwYk9US2xnSXI5Z3FsUUlIZFhBN1FKc2Ey?=
 =?utf-8?B?bjc4aXFtcnNvSCtZVkxCMmQ1OFJXT1RTTUxZWWhNL0xXTndaVjNPa1crQW82?=
 =?utf-8?B?QjMvNG1zR25oOUtoWlk5eEN5ODlUOWlTWEZBWGN5SzBPYlg1R2RJbnA0bVBZ?=
 =?utf-8?B?M0tzaTlRWEJxWlYwNVJyeTJ3S2tlRVRTeTRGWTQ1d3E2UGVZTGhnTURsWXBa?=
 =?utf-8?B?dTRoWHkwVXQvZVlhZURiaWRFeGNpQXFEQm01MHpBR0V0ZWJyYzh6SlNMUDlS?=
 =?utf-8?B?NTl3MHBpZVpSR2dhMmdHbk84eTdtS1VMcU82N3dOb2xsd0JrckJJS3pXWUk5?=
 =?utf-8?B?SjZHTDdMYWViVVU2blVuNW4zTThab3BESXlYS0htMlZiN2FxZXk0TCthKy8w?=
 =?utf-8?B?Q2drZ2k2a3Y4UXoxK3FPclE5RXptVG9MVzdYV3FaQ0Y5bWUzSXJZNENyTkZD?=
 =?utf-8?B?Nk90TDdpVmpTclV4VlFCMEZkbS92a0cvbDBZei9scXZQY2pqZkV2eUQwNUxT?=
 =?utf-8?B?alJlTUdKaUNyTTZ2bUUwZTkwb0ZhY1dvY2IwYTFIb3pUSEFoR3JISFRCZ2dW?=
 =?utf-8?B?cTdpQW95NFdTZUJGak11YWkrWXVjL2o3SXlvYjlOTTdlV1JMZFNYQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7710b2-aa37-4a7e-209b-08dea5279f2e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:11:12.6636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2MXiDJtvfmzoeF4I8Ht8iTNFd9DCUGA6YDXLvtDNxdUuOZkJ8PbMGk7ywlBzpzIHEncqHxOgOQtqFcSVH6bEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5969

The old CI workflow has been deleted ~1 year ago. Fix the URL to point to
the correct one.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/pin-init/README.md b/rust/pin-init/README.md
index 9095d6661ff6..2312c9e75f8c 100644
--- a/rust/pin-init/README.md
+++ b/rust/pin-init/README.md
@@ -3,7 +3,7 @@
 [![Dependency status](https://deps.rs/repo/github/Rust-for-Linux/pin-init/status.svg)](https://deps.rs/repo/github/Rust-for-Linux/pin-init)
 ![License](https://img.shields.io/crates/l/pin-init)
 [![Toolchain](https://img.shields.io/badge/toolchain-nightly-red)](#nightly-only)
-![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/Rust-for-Linux/pin-init/test.yml)
+![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/Rust-for-Linux/pin-init/ci.yml)
 # `pin-init`
 
 > [!NOTE]

-- 
2.51.2

