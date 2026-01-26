Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011026.outbound.protection.outlook.com [40.107.208.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC422701B8;
	Mon, 26 Jan 2026 06:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769410656; cv=fail; b=SQx5llA6GPElq3KbbzEAnuUv4ERSlcUdJcKC89C4lLchgs7kvLs9GDTX8gaMVPJ7L9pSvbUXRZSxddUQmuRR6EEtdxqXV8Mx3gm8fWNbNB5qKliza5j3xmYzzqZGLGQKUPg8TeQgOQtBGv8zjX9IHLmFF9vlh1UY2PLX+5w18gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769410656; c=relaxed/simple;
	bh=V1kkbckwskFKF3WzjGs7Sqvu5vqnoMn5zt76xgwJNNE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=mFdLI3ZNCGYndnZGdBxd+RweKBVWVI+RoD+LRM06lsDfMXe9CjygCXysvnjope5Sk0N+nMmDm6wwmcBxlH4r7vkKxq0KLSMAQ/4XG7QvTu+NTYfQ8cWPQinYwAeq3D20JjfqZ8b8+TrONh/z/4VsZ7j4cc4Zikwkj3YhXuQoSuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=guZKqZuQ; arc=fail smtp.client-ip=40.107.208.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="guZKqZuQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQTTJXqWCuBOS9U9pxeg+eYvHQpI/20XKA6b/pG0BbOhhTo1aviSrzpwdpZPEUREVG+WtNk5R2kwJz1+1z+qbAKUY/QYJqaGNLF4Scp2rt4abFm03MktlJHOjgfQL+0GoQbUXFz9RTlE+74m9l7/1IfP/CuKAzL6QtutsUTs48sZvUmfdJ1sxSqb6kULouZ8NBvBDS5fs9GDZn/srg8eT5oFJ5QdJRdctnkJfE1Fp+QEEYg7MehkWtaLJQj0BmklAUARDqOOuyOEDFBOYuQW1OCX5+kV+QwtSgxa31a0yjlDmqbz3OuKOMSx7F0iC+XpqhQM6cjyRIcY7HC5jz35PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1kkbckwskFKF3WzjGs7Sqvu5vqnoMn5zt76xgwJNNE=;
 b=X9nFzygmpRlemzDufNXOzGqSbC9kT1qVoEHZbX7V4vSfQruo4PSQ4R9aYJaLVByCp9E2myRvpv9nerEzJ7DJbXpRxfjPnKZwCbe1FXWmtpgeTB0XfJ4HLdVoJ+IXRFh6cjQgfU+pF2Ba306A6khKoSGgGia3+skcYYtnWzr1T2TFkvEku2ia6mgy0WdhPAIrMkOx05k8G4iyu7gMGXAlYkdOPrtf8gLE3WiHnR+6q5GGNjkZOffqUFcFzhJr4QmgCHmArsoiyWk4Ajdkf966uGaMeOmU0SfDVwI6A5zV2oX4m4w8kgxKdw0Rx25YcU6dTn3CpBhwqNXHQnmwy2CNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1kkbckwskFKF3WzjGs7Sqvu5vqnoMn5zt76xgwJNNE=;
 b=guZKqZuQYdjeu8Z1aNvYvcjeFqkXh8K1nOeOokSnTKCy8Cq8R/l3KP8g3aSgZoDhlbFKjWumUptmmEChKJ8qVh7ED9I+EafQqHasLOi8Cfz0/jE3S5GBMn48U/+w011nr+SuEoOZzFFAgOj/6Rey/UYNd0WctBoAy/1U+AK8XmgccCHzrhm2LLLeibXilJWvTX9uruTMMcI/3GbyVKKZKGEbG5tUIv3HXJ2LCAWbMKTp0jBtl8uUYwlfC7bCe6eCobeRwcD/QEYcQET9oHCVYy7Joz6u+Q+zamOwBtbsG2QJY84iLr7M/+jviW4F1WJP6FT+U/nJqZoHzzSoI7a+4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6137.namprd12.prod.outlook.com (2603:10b6:208:3eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 06:57:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 06:57:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 15:57:24 +0900
Message-Id: <DFYBQ4OIBF9K.3KTZQ2B88TT9L@nvidia.com>
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
Subject: Re: [PATCH v2 4/5] rust: io: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
 <DFUCNHHYB6VV.43MOY4Y1NV06@garyguo.net>
 <DFY76VCL7KO7.29FCRAOOY7FVN@nvidia.com>
In-Reply-To: <DFY76VCL7KO7.29FCRAOOY7FVN@nvidia.com>
X-ClientProxiedBy: TY4P301CA0083.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: 37bf982b-2cde-4560-7c9f-08de5ca82b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWpYeVp6QnFnc3NGYlpWTWlQQVphVFdveCtGNUsySjUrenl3L29SQ3lKRFFD?=
 =?utf-8?B?OFpxMDYxbjVHeXRKSEpOSFNmQ3ZjQVBkQ2hsSnBTa0RwZnlzWjltMFV2ZTFV?=
 =?utf-8?B?NG1VREgzc0Jvb2xRYjRCRlY0YkZ4OSt2ZXhZWFh0Q0VkeThVUUw2QTBjVTJC?=
 =?utf-8?B?T2c4MndMSVZTU2RiMWFweG5yRlJWQ1RWRm1EcUxhYWU2MnltWkpyKzJNekJO?=
 =?utf-8?B?L3JCUndSYzRGWmNvM3B2ZDVLS2s5Y0daRDU4NGZ4cmRHMGRmK2FMN3lUL2x3?=
 =?utf-8?B?MndPZjV2WUFBUzB5YWFkUGZiWjdHNDdlUkhDYWZVVTFOYndBSlhRQmtGVG5x?=
 =?utf-8?B?VEVSTnJIVWdWb1dsa3dlbUM0aFJMMUt6SnZEclhMellDN2hRSDFIMTNTL1c5?=
 =?utf-8?B?VFpoWFlIQkx1SENxYTd5NzZrRDRKRUNsaTBOTnVpSUJjWXlBcEFPS05UQVF6?=
 =?utf-8?B?Z0lTOEpCdWFGeGV0UU5OT0M5MlYrZEZ4VzNQNUhIVVBvK1hQTXI2eDBacCtI?=
 =?utf-8?B?bGkxUHlGOVpqYXdVRit6U0xRTy9ybGRFanFXVjVObEpWRW9tdmdEazVHSU9v?=
 =?utf-8?B?M2hKZVhxbU1HMnNCVXV5WHVEbDR4S1QrbVA5YTMxQmw5WkE0a2cyNDgzd1E3?=
 =?utf-8?B?MENSQ1B4UGptVnptckluaWprdGg4bGNjaWVHTit4OTRyZEkvOGErTHFVZmhy?=
 =?utf-8?B?dWw1T0d2QzNnb0EzVFBEV2hGcWUvZldOS2ZSVDMxZFF6VlkwSzZ2anpMYW0w?=
 =?utf-8?B?MStwT1hsMlAxUG41NndQWnlucmNpL29nTXVZY2FBbS94MzZZVExVb2VGWDNr?=
 =?utf-8?B?Ymh3alo1SGd0QjhMVlp3c09Sb01Nb1JWS3JYZ2l5Znl0Wlh6T3NJWHZqSHdJ?=
 =?utf-8?B?UVZwR1FNYzlUNnQ3WEZ4NUNsZTJHMXk2ZUlhVEkvaFhXTUVYeDgrc09YNjMx?=
 =?utf-8?B?M0Z0UTdiT1NKTnA3V0d1eUdsME1LSVNKYzg1QXpkc3REMkxLck5panozOEV2?=
 =?utf-8?B?MEVjVjhic1RrRWpFT0tBT0EvS091UWRXaVRUVldUWTNpS1VtQktWVkRXQnFS?=
 =?utf-8?B?d2N0TTdKc2lCUGRoNG9tWFdEM1RYYklJTGtsNW5pUHU4K1lwVDYrQytMYmM2?=
 =?utf-8?B?ZUhPU3lYNFpyMFZKK2hSRUViZ1JldkdNY1V0OERrVjBDQTRYVXl3Zis2NVlm?=
 =?utf-8?B?eGpnRHVERmhTdE03akZjTkFFa1Y2elN3WnVQTkxqZUp1NnJFVkpDZ1g1K0Jr?=
 =?utf-8?B?ajZrWTRnRmZUSG9pQVFQVzE2RWNObGg3VDNNNmZSRlJOQ2UzbVllU3IrOW1p?=
 =?utf-8?B?ekg0WXdVVlU5SDlCKzdrZE44U2ZGSTByOVVXMnR6SE9uK2IzZi9NYklrVVBj?=
 =?utf-8?B?SWE0VGtWb1dpL0luRk9QSU0zMEkzb0JleHZtK2VMTUZHVkVSQWZFWDdpMTg0?=
 =?utf-8?B?Tis0anBQTEdlZmN3b0ZaSEhZQjFJVnZlNXo3QjArNGV2QUZBTk5MTDNyeXpY?=
 =?utf-8?B?cmprNDRPaVFWL2hYUHFhbFdGYXM2Zm1aaVVSVmxDYWtaMmJ3TEY5bnh5L3Ry?=
 =?utf-8?B?cEdkY1VsZE8vVk8vR3Y0TkFxTFlmZDFwRGxRN3M1bE5DcWwwcmNRL3BSUkh5?=
 =?utf-8?B?ckN2RitRQjR0Z1RrSTlwVDl5eFJXU1hKb3Z5ZkRYYkRaT2lCWXYxSVNEUDhU?=
 =?utf-8?B?Zm8xQWU3d2g4ZC9VRHNMWlR5L2NyVGN1Q0hqUkFXQ3Z0SGRlbXVmZTF4RUFt?=
 =?utf-8?B?MWRRUkMvWGtLYk1vaWVicGdieEQ0cWozcEFNVWxEUElTck9VdFI1UHkzNy9W?=
 =?utf-8?B?elFSR3FMSTltR3RreVo3aTJ3c2dTUklTTCtHRGtnZmFnTjVGeEVtZ1ZaREVD?=
 =?utf-8?B?aTViNEVzenMxbDczYU1qc2xVZDVQbU9RblZUbzdvV0VoMU8xT1FpZHlONFls?=
 =?utf-8?B?ak9VbEV6U3JtcWJvN25ycktrQk5WUUV4ZjFUM0lPR0ZOcDJVTUxwRFJtTjB5?=
 =?utf-8?B?RjJTQjV4SFpPYlErNDdxelhvMUlDR1cxcEtYeWhMWHR3WHdLY3VZWmNpc2RC?=
 =?utf-8?B?MVNkT3dvWDg4c0xVUHNyaDA5RHl0ckM2Y3RBcERGWE9TTkxpZUhKakRDVWVD?=
 =?utf-8?Q?pz6U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHNYS3IzOW9zQURPOGZRam9nWGlNLzlYTWRNRVFmRnU2YXIzZDJsbGdYMjN6?=
 =?utf-8?B?SWlqc1VaVWN0M1VBeVF2NkVpQzI5SW5aQVp1d3Brc1RtdDBVZXRYTE1XSFRm?=
 =?utf-8?B?b0NmQmJqOHNNZm1ub2xYelExY2diVGNGaGh2VWJEWlZrRmlFYkJWTG1rM1Y3?=
 =?utf-8?B?RXZmUnVEUFE5NWRNTk1Md1V3L1RiVktBbWtRNjY5SExnRWltNk92aGdZVnl1?=
 =?utf-8?B?d05XbXhrVXhWQ1AvL3Y3aUgremtpZ3NKSFZ1U013QTR5S1ZtQS9pQkcvUGdW?=
 =?utf-8?B?dFJDRG5adTR5QkV5OWg1a0xnNVV5MlpWMCtsS0k3MU9RS01KNWxqYnVwbkUz?=
 =?utf-8?B?QjlZNkZkbXczeGUxb25vMFZVSGVtUGkxWnFESzdCYldLSW9jUWdnaEU2R29n?=
 =?utf-8?B?YkVpNUJRdkkwVEk2WkRNRDFpVkwxb3JIQ1JvMk5VSURjYU9jdnJycllnVTlu?=
 =?utf-8?B?V3MwZkVQRGR2YnR6b0tTYkZleWdFRzUrMnZHRi9EV09zYlN2S2FCcFBLcndx?=
 =?utf-8?B?M0xwVWVMSGlhZmVMWXREdjE5SklseUVKWlE4OUw1dkRWeXh5c1BMaWcxMnlV?=
 =?utf-8?B?WHFsY3hPa0Q3RDNCaWcrZ0Zubk5WZGRlazZha1pZTHRmS0xjVEdBaFhGZVc1?=
 =?utf-8?B?b0tmMTNyM3dBbjAzeVhBNFlLV21YQlcxTGxUSHdzODZmVjdBQy82RjlnZUJn?=
 =?utf-8?B?dGhZYkcrRUk2cm1iTjJjdU5BYy9LSXdJaDNiL2U0TUlLL0lvR0l0OFRXNzVF?=
 =?utf-8?B?WVVadFlYMWdvd0VZbi9FNlVtVWpOR0FpSW5qMTlDMXF2YTZ3eXhaeFlidVFt?=
 =?utf-8?B?M3Nzd081ejkrMmlyYXk3YTB6ckowODhOdHhzaHQ0UWs0MFRQSHh0ZEgrN2V2?=
 =?utf-8?B?M2g2bm9RQ3FuVDV2elh5eDg1M1pMYmJIblZicXo0blcwV3ltZkdYb3VWdEVC?=
 =?utf-8?B?bmFGNWZZRzF1eW5vczdiS3V6cWM1Tm9jMGlIaDU2WldUV2lHSHhXMGY3emM0?=
 =?utf-8?B?VTdLbVNsdEtlR0J2bm1OVnlDUFU4Szc5QzlIZFNxY083eTBpejJBVUg2TElL?=
 =?utf-8?B?THBzL0NBWHMvMm1WQmtGOUg2QStNaSt0NUhxYkh0M2hMNis1Z3lQSU9vdDhi?=
 =?utf-8?B?V1Nob1JqdUsrNzJZKzFIcnd1TncwV3hQWWc3dTFXWG5zMlJSVCt5N0NmYmhG?=
 =?utf-8?B?NVM1cmo4Y1BFVkJmRmF0MVRGTldFSHRINTBiaUdaZDd5YmpTYmlWUzNvRGF1?=
 =?utf-8?B?RTFMOXpJZjQrdFBNZ1hRaXRlYlpRb0RwRkxzalNScjFvRDRuWTNSUEVMRUxE?=
 =?utf-8?B?VkY1MW92Wjk3MjAxeHhhVkpLcUpZc1B5RHNlNU5ZMmxMSjJUcEJqK2dHYXVt?=
 =?utf-8?B?NS9KQlk4b2h1T2xQenNhckJJWis0YXRXbnZVT2VQZHByQlIvRlV1Q0dyb0Rr?=
 =?utf-8?B?SjFYeGhveHhtRU84aWJ0SGQ5SExUYUxMcmd6amV2U1FqSUV0WE1WNGtCeDZ5?=
 =?utf-8?B?UEdVNHFSWmEyeW9kVUgwWnJhRUM5M0hhVEwvUHVleUEwQncwLysrcEJqUExH?=
 =?utf-8?B?RG41Z203djZsVi90YWYrVUtuUXhsajRzSVFFd0RhbVVBb0ZvV2c3eHZtU2E5?=
 =?utf-8?B?VjJDcWhEcGl1Nks3NEFDMU5ocHlSc01NWjYrVzdQUE8wbEk4RStmMCtJTlIw?=
 =?utf-8?B?ckJLY2toYlhybEVUODM0UWxkNzc3TDBlZlo3Mzc3TEVkQVVzdG5xa3Q2bGNX?=
 =?utf-8?B?eFpVcWVqVGw1TTlGNTIxd2tqdXY1ZURtU0RXQkdMRHZIdWV1MzAzSDZSeE9D?=
 =?utf-8?B?SSt6RGdtc21SZkZPSmQrUElZMkc4bndSQXJ5NC9kcnV5R0ZjNUJjS0t6MnQ3?=
 =?utf-8?B?QlM2anpaZGZhZ2hOMzBMbE5mNlg0WkowOThGRDVLRUZUSjUzZE0wTmZlMjVp?=
 =?utf-8?B?YVdESFZBVXZsV255dFpKNjFBbVgwMDNkeUg1VDhoVjhVaG9xekpzenlXY3FH?=
 =?utf-8?B?c0ZRb283TnJqWEZqK1F0R1NyYVExZmpySmVYZS9kajk4MURqenBsQk5yOEww?=
 =?utf-8?B?TlJ6QkMxRnd5ZWZYTVVhQTJQR1pKWlpweTFWLy9Gc2ZVVWo3Vk84aWFqTU9X?=
 =?utf-8?B?Z1pmMlRWdlRwYlNTZnZET2EydmFRa3g1cUhqVXpBN0NpTDRRNjYyNUsrRmxo?=
 =?utf-8?B?RlJEbUtESi9Ma3I2S0srdytvZTBiRTFkZS9SL29YUFVvNWV3ZGJIOG1Samw2?=
 =?utf-8?B?eXlhR1hqNHpNM3dDL1p0dXZ0N3RXM0tjOXQrTm5lcnkyN1pLb2thVm5xT1Ix?=
 =?utf-8?B?V3o2RUNpY2lXL3I5R0lxK3pjV29zLzU3ejJRRU9VL0xrNzBQS3pmTFNBR3ow?=
 =?utf-8?Q?3gF5IHyOGmYPIRryQvnzMB0+/v5PLy8s/D+Ri1dpjIXs3?=
X-MS-Exchange-AntiSpam-MessageData-1: XOenZ/XbK1v/xg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bf982b-2cde-4560-7c9f-08de5ca82b61
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 06:57:28.8153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnV4hqlXD6FsDx/wDslS/fi1kDzkj+9ngYLFfiZvsgNvmiDYgLWJh+FxKK4UfqGL+IS3VahZBor8icPPu8yPAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6137

On Mon Jan 26, 2026 at 12:24 PM JST, Alexandre Courbot wrote:
>> Another top-level question I have is whether we should define multiple r=
egisters
>> (perhaps all) in one macro invocation. That's the strategy of `tock-regi=
sters`
>> crate which is widely used in embedded Rust.
>
> I agree that would be nice, especially as it opens the way for better
> syntax for e.g. register blocks with a base.
>
> I am having trouble adding that to the current design though. Some rules
> use the tt muncher pattern and these will greedily consume all tokens,
> including those for the next register. I am a bit at my wit's end here,
> but if you have an idea for how to do it nicely then by all means. :)

Actually I found a way to do it. V3 will support multiple register
definitions per invocation, thanks for the suggestion!
