Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012005.outbound.protection.outlook.com [40.107.209.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BF51CEAC2;
	Mon,  1 Jun 2026 05:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780291297; cv=fail; b=eYg+Nn/oRA/u0uPOk22JjMxukGmSwNNIWbn+IUstSMbikvi1oMUxcC69mHTlJGVLZZH8H0CEjdBb9pPnLTLrPqfpBdMGtn6UAPMQ2qZJVbCDM1RPKA3QG0kVXuoebuFq1MMiYMcnQxfow1LSlmwW/IRYt81DGizIxKef3f7TMoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780291297; c=relaxed/simple;
	bh=cwAVaz9Wn15x/OaHX5W4L4upfp3MQpyOUVWo71fX/VE=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Crpynkch4Ls3Y/QCSAkzBR3rW1qyPps+zxBkA0Hx9koFyEjQH7s9cr6jqRocUZMNXBmsfByGZbUKIaH50rTKvZcQ216aOt790sYIT+pQheDqtCwkY8lcvVQ0JFdd5kEvUcBGKBabcc+ChVaIUmgpxWxkq0tfd75gL+1vLNGb5fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FpeMU96L; arc=fail smtp.client-ip=40.107.209.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FpeMU96L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejzhxblSrZ2JfvATM9nGqZSdmfdr4BEcUd7Spby4J2GQ+eGnE5//Npfrndv7DTvgmD059H6SEEiLjs3WdN9Y6xLVUAkDhQy9W09ZjVF6+8nViRvGcurqzWkBxtASOXPgsReAIWZ/c3w/mzi/quisgMa1dN+it6vtmFD3RJeSnF77JWl52Qs0NpnRF+Avaw6wcc8XLo3iwriljCcZOfOBsCrIb/EPwCK4Kx3uRC3u9FrRrslSOhPQTBCAGoce1YnrSuPsjltmY9nB1zZC58TIppCfNM3H/0t2V897rrHq6ccY7t71iI3xMqgJkkYbJJpKUKkDHMGn/zBZkMO0C4tcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwAVaz9Wn15x/OaHX5W4L4upfp3MQpyOUVWo71fX/VE=;
 b=jQH6LIioJ6cK3EMcygVrikAfFGDnYGVzw9C+JCo+48N+6YWo3FJm0/uuqAMZYW8n3ZvI+c0h22ASMFyNt8ROvo4FkkApbiPMbYrY8KXn8PjZShsuQP5Ajih/QljFgog+o4LFoWu9IEZnwuLsM/alkLrYSB3fnT52kohVvDDEqGweUPG0AkFcg3OrObdzpmazwflRfRZsiIaTn9rkGhjrhe75Vcc4WIBxySHzop0h+cNX6uQD5H+FflZ5h1FEOy2K5jKg77HN2WRDOgKYQZws4vPIt6vjOH297Qss8xg+cX2JPi167EmqG6uimxrM21PstMjFI9EgUsPW3dtSuXRFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwAVaz9Wn15x/OaHX5W4L4upfp3MQpyOUVWo71fX/VE=;
 b=FpeMU96LkriqGxnkWk09RxDF9JIasslacJ0uY8/OzINN5aot1buPAuKPnW1bGFK9z39h8O1WNEsmpLrgKHtL6wuU/QQrkwp2wIYjEhgwvdLfS/cIQT9q50vJUP/PmHEYG56J3TOW2XbCxeKHl0sWaxXXy6VzkpM+txUHsoXmZuyrBUAg+qTp+mqv+m+U3Sr3kd+XO7NTVJ7ada6fSJ+g8ADL2m0L3edfv1/McOnY208dGeZ3hJu0Zw5wr9fNhP5FjJ+uEA8xIrfIXOofGFiLqibYARwmqTK0Vgc+pLh9J49AuffjZo1zlH3Y+hFrO5vc/Bz7WI76jI1sqmyyMciSUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 05:21:31 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 05:21:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 14:21:27 +0900
Message-Id: <DIXGLB0ZDE8M.3H1HGY811P6EX@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 05/22] gpu: nova-core: Hopper/Blackwell: larger WPR2
 (GSP) heap
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-6-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-6-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0136.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::6) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 720af21a-d97b-48a1-9fad-08debf9da3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	54J5aq+PuYpinJ2lizsLgqXMbr4h6RD0p+Huu/tRoPRYVOKoI4o84CL//eazDg6wdBS2SXPVZa9Z6KrR8xQ8YkKnT+I33/spj0NoRjjft8h1wlhQ4icCC1cK1eTbXx/QY3mCC4BuH3TQCfLVkclwDzsjttWamkGZXZ1375CNkwpW2WXRMfkgYcHLIH4GBjTMyvwb69pN3OSlXqEeMZLDX0ix0qHORbcleVRtr9fy57Tucndhn9EPAU4CspkjBc+8RGd5EDe68AYCo/w0M6XPgTy6FJJnxTBuohTEQXcbkOV33Hb4warK0tIFKh0BZC0NNO0I1rnw913IOMnAJfqrkFi39ATtvurH0CAUSCTpCh6jjqpj/QLjZ7yS0c8cuYqksrG811FKwAbbm/1MAcy4YxKQkOs41kLs4XROuUtkxYCCVzB1h6knYtSRET+9/HrQrT8bQkGT3WY5hAMVjASlqKQUii/0g07LdUCX6CoTF8iic8aEc495ph8KkqiD3W7Xms4UiIhic/KuBNSRov+WAgMb62wE2u6QW6ydMV8Kks4VCedAw3K9H45hdqaHm7OEA7JdRxsb3NttXEEUbsN/MLKLPlPAP2jKHNm1R04/3DByWrS6AVLWoCMtUTr6rqHIBBEZH3qHkOc1eqG2hxu9pYmKhvtQzm6i09DNgBUlLwBRuD56m6W0J6bLokR+L+cV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1g4V1JJTlJSTnA1NWFDbUthaExwQTNPVjByWUFXUndVTjlLT2hXcHRyc1dP?=
 =?utf-8?B?TC94MDA1R1JmTjgwTnhqenREazUzSDlNelF0WWhHOGp0empSUTVZb29sRHF4?=
 =?utf-8?B?VFZiTVNOczFPRSthVWdiTzg1VlYvNWxWT0o5akwzVDExeXN6OTFuWWJBMnIv?=
 =?utf-8?B?UVI1WW9hUlBXbE9YUisybVJKblBWSFRWT2FFSEtoR0ZTQmtqMWJxbDM5TExm?=
 =?utf-8?B?Zlo0OURxU3VST29MWHl1YVUvQ3N5Z3d1aHpPZjZwS0I5T2pheWdmWENlYWUw?=
 =?utf-8?B?Q3ZPeFZIMDZ6UVFGOTk1VmxPa2ZSYXdCTThPVHRHeU5sL3ROL0s2UnpmSGlz?=
 =?utf-8?B?c1duZHRVN3JJZlBGQ3I4ZCtSVXNzSHZLbjZwVmhnOU9aTzJLSXNxaXp0ZXAr?=
 =?utf-8?B?T2JxODUxRFpsdnBDaThoa2FqcytDU0FOdUN3K1BWcXdQSDE2UFRVM05pNTVq?=
 =?utf-8?B?RGNXbnZuYmduWjlqU1VwdElNU2k2QXJmTnZ3U1pUaWxXUTN1UEhOcGdiVDEw?=
 =?utf-8?B?SkJJQk1IWk5kN09tSHV1V1NhNEZPbGh5bDhSSUw5MDV3alVrZHh2Y2tUVFJB?=
 =?utf-8?B?dXg1RllCa1JxK3RQNTFlL3hnRVEwdkpySXRDRS9MamFxUzJCNHpsci95aTZQ?=
 =?utf-8?B?Ujc5WXRZU3R3RzN0N3lFelFEOVVSczllejhIZnh4VVU2N3ltRFp4cHp5UDYw?=
 =?utf-8?B?SjRSVWVsbk55bG1xNTBhaU56Zzh1Q0FWT0hjWUc0QnVCTmNqcEZwdEtITisy?=
 =?utf-8?B?UWp5YVlONU9zRFgrbHgzbWFGWXV6K1JOQzMvaXY2am81dW9yeW56VEk2dk1M?=
 =?utf-8?B?ell4TU9xVWdVMkN0RjBNdzRSRElVdFM3WlBKcE1FSWx4M0FFWDg1VFRjeitm?=
 =?utf-8?B?RktqMTZZWXZrejJ1bXRxaFNlTmVZcThjeU9rNzBkakVmeXYya2lIOW5jYS9R?=
 =?utf-8?B?SEhqbzczcGJyUFR6cVA1aDBiV0x6MUhlNk50Si9Fakg0VDdNR2RPV0hlRGpu?=
 =?utf-8?B?eDdrUGxNVDNQd2ZrMW03MGQ1UjkrQ0tQODR1NDFkSVE5OTlJVHV6a0NCYzc0?=
 =?utf-8?B?ZDlhL29yREN0KzJGQWdia1V4QUtiSXBWSmtsdVZSOHcrMUhhVDVLRVRZQ0N2?=
 =?utf-8?B?em1lVGQxTzVZY2M1QmlUR25WaEg3TzBXdDlKTkJRVGlNYiszTCtvY1VPN2li?=
 =?utf-8?B?Sm1nQlRlNmNnKzlJMGJoOWQvdWRqRlZVVG9LRGduWlRjZjlyZnlYZjRpLzdQ?=
 =?utf-8?B?TktuQmZGbGxWd2FMZkN4TCtULzZmaTRMSkFsYzZjc0FtNSt2bEpIK3dlVXkx?=
 =?utf-8?B?OGt0SW9yeXZRREd2dXptTXFGUWpuS2xBZVBJT0s3RUtpVmdMRkJXSk9PbXdy?=
 =?utf-8?B?eUw4bTgwZ0FWcnlpclRyWEVmUVVNWkk0SlptZ3JFRE0yQjIxQi8yWlZtN2Ew?=
 =?utf-8?B?Z1loT0lUN1RnQkk3enhWUlp6SGpjam55LzE1cS8vL1hDbnJPUStLc2ZaMnRu?=
 =?utf-8?B?UVQ0SllQRGljdmp2ZlFYSW1aRnZWNU0zbDVmNVN2RCswQ0VQV3BDNXpuaGJx?=
 =?utf-8?B?K1VLWXNrU0hWZWRkVHdaS0hQQTVkd093dzFRM3pIbElFbWRSNE5UQ01qNnF1?=
 =?utf-8?B?NVN4V3BadXNkZXgyKzhQQVRJbmViSENlTk9qM1J4Tzd1Y01RZkM0Y2FLUGVi?=
 =?utf-8?B?OEprLzFCU2ZGcU94dW1nTXRRYUdzV2twcHhoMHNOdzNEZVlKVVB5TFBvSnR0?=
 =?utf-8?B?TTRST2VHYmFFdmpSdjEzVjF4SUJjb2hLbVYxaUpSUmNKWE8rb3lYZmNYODVu?=
 =?utf-8?B?empDSUxPRWtvT2V5U1AyWk8xcXFXT1VISnpwR3FsSHBndUpXMVNQczlaWHRr?=
 =?utf-8?B?ZTlWMFpZQjh3M0U5WjRlcTZkSFpKWS85VGtvTDcyUTdiUXFKZzVKVlJQRitL?=
 =?utf-8?B?NFdxWXN2b2VPaUc3NWRmdU11K1ZidUxadXplR3VNd1hyNW0rSkpLMVNKblFM?=
 =?utf-8?B?T3NabE1HM1J3SFVkOEhROE9DS054VTkrWE16a21nZ29UdDZpNnRzcFJhQzFZ?=
 =?utf-8?B?bFE0b2JMMGJxQkc1YVFsMW1Za1VyMW5KWENVV1A3NDYzbm9xOHU0ZThKb3Vq?=
 =?utf-8?B?Y2E5Y3BBN3ZmOWN6OTdrb1ZzZUxSUWJtS1NkY0ZPb2VsdjNMMXZRcHNHWXNU?=
 =?utf-8?B?UEdBMUFka3k0U2NuVTE2cG1qcEpUakZvUmxQazdZczg2OG1RMWZrYWtGQXh2?=
 =?utf-8?B?c1p6b1VlVHM0VW5CMm1FeUpySEtHcm1YSE5YYkJ1am5IZkdhd1V1K3FRS21Q?=
 =?utf-8?B?NXphYnhoQnluV1pid092bkhUZlpzYXNlNWZqbFNnODF4V1JCU2g5cnhDMDhi?=
 =?utf-8?Q?bgQYjyF99CbGMcNAtY8GTharmJ9qG7E2Y6qTu/x3cy3gv?=
X-MS-Exchange-AntiSpam-MessageData-1: vRD7/bLX5YEswQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720af21a-d97b-48a1-9fad-08debf9da3f9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 05:21:31.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72kJUvbfNow3iGp2El7VLYlB8VgaO4/iDUzJfJ1TEZGSZjDVsYg7xv8iLTux9+zf5y6mWLMcXYgtfmKE7LCucw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> The GSP-RM boot working memory portion of the WPR2 heap must be
> larger on Hopper and later GPUs than on Turing, Ampere, and Ada.
> Select the larger value for those generations.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
