Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011033.outbound.protection.outlook.com [52.101.52.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6BE282F06;
	Sat, 21 Mar 2026 13:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774098360; cv=fail; b=kU7tw8hyUOq1G6DkZfF+5d3UTgKLvJyT/phaI5YrjxdXj8zOfld2PcES+SXdCEBFnLIvL+98J2gOGKr9NmOKf+i91DDj6gMyWss/VO3638oLYhq8NfgmBaoRixjOs9VgnJGNAvQuVFRpWMEupj9gEW+IIZVdvtaGShhsRLFPXn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774098360; c=relaxed/simple;
	bh=GKAQ4WaJTNJ+iezRZF2Ry5F0cYriG3OZkBNmltKCug4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=OuE2c0AKII1GAACF72WfOPGp8/ALFZl2Wjc2zc0OxBnpfxEPAJZjPDZleN8IGJNOU/FIDxtMwgGfhDib2RpIpPPMo67pg2OniRZXe2dqJ3F9y3kSuDbIE8PyITYGaTNidxqHQeViKz8R9cSUajBHWvMy4s+09fG7k2d0hQtxCv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Px63OBmN; arc=fail smtp.client-ip=52.101.52.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Px63OBmN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyyOptGrzQ1UBsflfMKjUTTnauY3s4vmvRR3xx+Ot2vMMgcOgrqqmtGP5YtaCg9pkF6ga99oKl2MGqwjqZSoiCZpLgRu/Zgd2VnZywCIoywJHoMhD+79GbJCzDvliQ7MsSKQGjCpg1bWsqaA2Grw+dyKAWpOLti8Yk4IhGSxF5JoEi2A5b5eIWS7cTybGu+xZEOrhS5Ic70dr+JlYLiL5LkwBRblWJgvzB8V1Pg8HG+0irBaJIRSLXSSjaO1+zGgdjbalCVzQILiAW5daco4iYzTenNJ5w5IYmMBse2G7+weUjZ0/1e/LVfwqZk6IClEKelztXGc4o/o482bMrnmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKAQ4WaJTNJ+iezRZF2Ry5F0cYriG3OZkBNmltKCug4=;
 b=Gaicb8/BlsKa4wiw1oWaHjnHyWQYFSiutRSQCQ2gf58DEVXuL+y6Wgl0yyYT4xVBtYOM2Rm1HnTYZ+xuIW3mEHtoEP7OqOjeFyG5zguWc4I7fMqrqHKz4WArrtLrTG2Su9jsD+HfVXQxy4fvZQ+qF1GrxVxSj4XivgeKmdLowTqivtfhY1x/jwVAxwwK7jqyPhfeprfhAxJLr4ZK/380ne2pZaBlYuoTfV4RG7SvNfx28SnycmLzuFTrJH1Y+FhWWpQh2xcWPB3FSDGA2Ynakg82Ya58RcBdyRKJIP+JTjMz/LTCPrCCh5gUrcu1jIvSCKWh9a+PrRZicdAuVUfr0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKAQ4WaJTNJ+iezRZF2Ry5F0cYriG3OZkBNmltKCug4=;
 b=Px63OBmNOx5no0+QHyDuORRzUb6E9n64MlmHM11O4NJhwmYSYDwoZ418+1+V7OonbxVanqjFxf7VlK1U89C4hLq60guXEci1vfOFu4SvrHA0DCAR2C6j6hF3ypYTXtn1Mtl4IgStUpQ6n5ZM/PASHg3mrqiCvTFGu2ygvQGvWLPbZovGkIxusG1uslV8xaRjXA5J6l+cuHq2efEVYlbxA1TWREri1JrcNVJ1F/qJ2gWqnvSYLJ21OF93WFHJYuNM1+HPUQMOSY0l2RvCGXqlsINt1xK63I7pzOOsb5BsTH/33mg0ZEdE82nVizmgjom94ZB3we9qCPJfEzXcAmR8aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sat, 21 Mar
 2026 13:05:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Sat, 21 Mar 2026
 13:05:54 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 22:05:49 +0900
Message-Id: <DH8HDMM3QTC7.3IDA5A449FYHW@nvidia.com>
Subject: Re: [PATCH v3 3/4] rust: rework `build_assert!` documentation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Yury Norov" <ynorov@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260319121653.2975748-1-gary@kernel.org>
 <20260319121653.2975748-4-gary@kernel.org>
In-Reply-To: <20260319121653.2975748-4-gary@kernel.org>
X-ClientProxiedBy: TYWP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f64322d-49e9-4c3b-2b5a-08de874a9528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RnAGX9uJO5uU/O5lvL0UTqiNF8s3OKZsUSpQKmW5Q3nlFfwWd8k1vdRKGBQoE3ifJ5Hx1dauMWEyX8mjpXWOsSj9dg3E/qtRoXbdQS/a2lhipzJEQZ/yo8SAJwg9XZomBK2qwQkt38GEylRXXrfDpA76O9LKt2N19LbaYX2KynkeKBqHgVLLGiMytTIAZzNrH8KrqadzQbRBrqIU/aJtiVOQzpgQRFr4ln5juZrqpZyJfjHtWyKi1szUtXbS1hBchbwhFU8qL4xy9dq0Am1SpkFyBwnb5OMHSjOLI9r3OAh3f60tNc87cnqtwwktmV/XJQk/oebGcg/VGtBQ90uNqgvRxkKhiEnyStqZbn/618AuVTz01jb3i1wa08OooqGSK5fEm5QFNo7uE7dzGs5bOdQYy85t6mZ2aTvR5/Gf8GzJrDTop/ZAJngRjNvXPq8QvQQ/WaEw6jgiLfrZQFioHEgX5+NVGVnCLBkAF/IH87z5FGakAKmYRfwYh3IYlAHdT0zldnM67Bqb+4PYStzT3rA2NTtAHYP7/IHSXRrPgfghY4nS9t3wd20wXcq5x65uNdPtakH2tNaUPtIpVlqgDhtN1DJ3YApxCU8i1eXQsKU8n9Ag9nrikMs7LYJB/WMQ9Z2CgNP/llTsiNkCwFzSu/JTELQK5ZO4U8eiRmOh/s5j2mOe8rXJIBuFYMMp2lwhtOEMLk14qUJHQKs5gcKfX192Sovc8hlVOgyQzwBS3M4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2w2OXVManpqeWp5ZXNiemdTQWhwbW51SXgvdHdZNW9YZHN5OHRwOUdaWWhq?=
 =?utf-8?B?b1dSdWkzbkc0eVRrV0FSVWwvK05wck1yelp0UTZ4bnJHa1dQdlNUZ3hwdjA2?=
 =?utf-8?B?NkpPY2J2Ti9jaDFIbkpxWitpZW9MM3Y0bVZyMVU2UGZDU0ErTlc0TW5DSnVx?=
 =?utf-8?B?UU9uaTNxM2gyNjRFMExxUlR0QTh3cTVXNXNubnBKWllLVDZ5cUcrWElkbldJ?=
 =?utf-8?B?bzhLY0plaXQ0dTZFSkZ6NWMvT3NlcllramlrSVdXb0ZDWXZZTnNSVGpCR2po?=
 =?utf-8?B?UHBVNFRVVEhCVm8vbDB3eEQvQUFiTkUzc0dOdFp6OW1BL0tLanhEZC9zRHl1?=
 =?utf-8?B?Q1ZlNnA3eUZiako2akhxY3ZhKzhwZUUzQk9TclpGQ2FpTG81ZHN4Ui9MVjZu?=
 =?utf-8?B?ZW1OUXpSdTZqbm0xY1hBT1dBK2xWUlNMSk9xMjYyeG5zZmJZR2ZPTTBWM0Qw?=
 =?utf-8?B?ZENkVlNIdW5xeXRueHFUMmQ4ZndZWHNnMU9tTTN1alMwUVZaYmlVOWx2dFVU?=
 =?utf-8?B?S2xYMzBmL3VUTGh5T1Z6eHdjYkFwVVBiaGVDRlV1N00vOHE1aDUydnhPK1dF?=
 =?utf-8?B?OG1xVW56MmU1NStXVU9nZVpIZVI1dDNsQXh6cjZ5WnNyTlg3WmRIK3FxQnBx?=
 =?utf-8?B?SEM3K3dYWVpJMVdZakZFc1BHYzN0TmZQanRaUkhiZkhja2pPeE9oK0hoTmVE?=
 =?utf-8?B?TndWNG1qRmFCZHVGcWRha1pjYVlBcHQ4ek5JWEQrV2RBK3NESzhmZDFmUXBi?=
 =?utf-8?B?UjVHMm5yWjdDOXZha1RiTS92ZFZhd3plYVJENE5KZDVERFhLWUhXaFp3eUIw?=
 =?utf-8?B?S3JBZFNoQkRwRGdLT3dPUnZUZEkvKzcyV0duOThONXMvT1UrUkxIakNNUzJx?=
 =?utf-8?B?WUlza09kU1ljSVhJbDB0SnY5RG9oZExEQzgvUEt3dWJ4WFdPUC9NbHd4c00w?=
 =?utf-8?B?RXpzUTFtbjRhWHp5V0tyUFYzUkdPYmoxQWdmZ1JsSUExWDF3U0NYNDMwTnhN?=
 =?utf-8?B?NVBMMk5DUHFVZjN6K1BXWm0vRVIwVi9EWU5Ra21ONjVMVk5qaUFJN1pMT200?=
 =?utf-8?B?OFVUYUlhUzFvNW1JcHpOa1ZBMFNrMlpmUzZ6eHZEQU5QdVNva002RXd4bjF4?=
 =?utf-8?B?ekxyWjB2NzdXSEhualZHZjN4YTExL0FNUlFKeHhmRm1CTEgyWDM1d2JRZnY3?=
 =?utf-8?B?R0s1VksxMmVYTkJsQnExSElMd2QyNEV5aVl5WW14b1Ivd3V3dlZ4YUU0bUlq?=
 =?utf-8?B?cEJsV1gxcEhJK1Y3dWdKZ3VZL2hRNktGcFZ1UWFYbnRGUXpjQ1JLQkl6TFBJ?=
 =?utf-8?B?aExMREJ6KzVZeHpHWmNTa1N6cUpkZVhrTkhQWS92b2ZiZDdyc0lPUDBiNWhS?=
 =?utf-8?B?VHFnbGlNY2lzRXBsYW40Y3llOXNRVTZXem5HaDVSU1Z4Z1p6VGFSTG5OVVly?=
 =?utf-8?B?aVBIeXU3dDQ2SFFOSm5MSWVzR05jV1ExSWpWVlhmTWhsL1hlZ1FOeUNYOU9k?=
 =?utf-8?B?QXpQRGdXaE9aYU9OMWM5N25TTEpOeXpPZlpWalVVUFU5OElaWHlISWxjTjlx?=
 =?utf-8?B?L2plVU5TcDNnak10WTRtVDVVNTVnUG5EY3pxa0FRcFIrR0Ewb2V0REJ1ejds?=
 =?utf-8?B?NWFBZjEvMUZrYXUwakxJR0lUb1VpNUJtZnNzbndESVdnTis5N2NidjFtclNS?=
 =?utf-8?B?ZWx5K0hZVWh2VVdxRUt4YVczUjFTNElrRW00NStMWmF6K3drMDFsSmZCSk1R?=
 =?utf-8?B?SWI1WTB6dVNmdlRQb2JpU2dRa1pNMFJRNDhNUFNNMS9PbXYvK3kyT1JIM1dP?=
 =?utf-8?B?OVBudXhzSWRQVVk4dWpBUmoyRGIvamhETXZzY1VlS3RpYjFCQ0luK3BycWtl?=
 =?utf-8?B?YkJXK0ozRWZpR2c5UWh6L0lzYkJqbkk0SmMxcGk2UGhQNG4zcENKb1g5TnU0?=
 =?utf-8?B?WEtGOU1qQWFYWkRDTk5wRyttbEJQdy9HbFBjcnYxSVZScUU4eFRzVGdVYnFr?=
 =?utf-8?B?bCs5MjJ1U3A5TVhURGM4UHJ1RFBYa1pyY2d5UHdOV2FzR0dSRHd1bGpXaTV2?=
 =?utf-8?B?Z0tmRGx4N244TzcyeDBkRmpHOXlsOWhDK29Tby9SQnVtQVNuWFl6SDRCcExS?=
 =?utf-8?B?bzdSVDhiNis5dUszUnRtOGxTS1REQ0ZIVVA0Smw0RDdNRlRKcE4ybXpET1R5?=
 =?utf-8?B?a3d0MGZaWm1oZ0V5c1AwTzZJZWtZc3pWOVdNeHVKaWJuWG5NZDRoZTZzT01k?=
 =?utf-8?B?enFZeTJJQWtWTXZLMlA2TWx2dHA4Z2VBZ2ZDSTdTUVBxZmhPWFU0VmYwa1Rz?=
 =?utf-8?B?WkppMDFMNXlrd0ZNNmNzUCtvQWx2SG1XZUV2ZjJBMy9tR1FKWUNENVk3YnRs?=
 =?utf-8?Q?n5RLUUHHf5slC4PS+e4NT9Fxrd4lxZga+haNz1k69mVXu?=
X-MS-Exchange-AntiSpam-MessageData-1: ecb5gw3pvI6WIw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f64322d-49e9-4c3b-2b5a-08de874a9528
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 13:05:54.6098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTWLxWO4ParDqGjptjQwMGEwGhhSzXN9D7jGRF7HIdgCT8cgF9YKZD/waM6w5i7WzGLyVaIEKfy+8g85DRagcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288

On Thu Mar 19, 2026 at 9:16 PM JST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Add a detailed comparison and recommendation of the three types of
> build-time assertion macro as module documentation (and un-hide the modul=
e
> to render them).
>
> The documentation on the macro themselves are simplified to only cover th=
e
> scenarios where they should be used; links to the module documentation is
> added instead.
>
> Reviewed-by: Yury Norov <ynorov@nvidia.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>

That's a great improvement over the documentation, makes the use
scenarios crytal-clear.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
