Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013062.outbound.protection.outlook.com [40.93.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDA03D2FE5;
	Thu,  2 Apr 2026 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141032; cv=fail; b=OjVgyK0cU/+osPuP3YQlbQ1OKNWYqDbtvhR4hSfCWlgkQ8Rn6TAru4pleDpP/TyIY8SUKDmTNVpfNtzGR3Wo5XHbLxQsgwzyVjTMRSGkEHxhnneuHoCvGai8ecHXbwRLCQCZl0fqZ1RfK64y34iVUbzK4+RuEsDU6d6k1eo9Qig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141032; c=relaxed/simple;
	bh=og/T05VTRRyKNYidvGM8PpO0NlFYAW+rKUkM4b/4uIA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=RDkXqeveNIruYYCjDKgjfuw3K5gI/jDJLnXIv/zRVAknbHeCk+10Pv4762OCUAjGQ0FJzdY2UoWIwnyvKc/A4BUKomskSDB/pr/++7i9du7D/bWXrT3jIFRRQlL26i13s0ovICD5HqPANRL9sKhqV/OWaUIOvpiMmbtdODoKRR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oo+DRNMO; arc=fail smtp.client-ip=40.93.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oo+DRNMO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noPQI1r5JNd04+vwplkN1oxLsjmf24z9L2aW29Hv7nuJhR40CScqLJcyV9y/NvNKuf0aS33yK4VKmwRJBmbt4NRFmvk8ob5VVsOFFGAc81RKSseJpx03XvmA1tn9NpoGDZC44TXbI7f9oJ+Cd0Ok3ePrGpbXR+p+/RehlvszMlsvPohd/8Rp45ul6iG/Imf4zOhabt0uF3E7/Bg278bDpWhKbwok2IbVWpmK2Qnlbf77gRe1uwZbTwHzFOgsOC6XZVWB59j3fxgyR5/bECncxSKpUwK/SphObmQcA+bLNa3Qjh/4IsXae0737dNV2p+KVMLDtxDcVkCPs8H49uwPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=og/T05VTRRyKNYidvGM8PpO0NlFYAW+rKUkM4b/4uIA=;
 b=e1zaA4zIVzS3KWZCAZ7FSFVBmfhULjXcHIv9A/n+LN6p9KI3C0GXWOty6gQrhSOW6DMK9swkjIAojq4euI8Aho1aW30QNCBaF3y/6xVYuLpElgjOw6uOj6OqS8xEZEwjVd2tBG1CEEnew94hhD0htFP7Z9CqWndhHjjbdB6L1cw3lgOVIBi1hZKHphy9dR9tY39M7aySMltsEW/osNBsYZO/LAwaJQGM4eNP0kqEIfS+NMl7niN18rBNR9TOJvdvobflI3qYVI6u2IlpJn3d0yC9VNJf0tE0hkFb1DWvad/3jclnjKrFM1uyhNKqyJrOfOS1YRVN/AjayLoolCDLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=og/T05VTRRyKNYidvGM8PpO0NlFYAW+rKUkM4b/4uIA=;
 b=oo+DRNMOBXbfHQXQGQ3hj7lZbb6GguTPDu5ZGN8tbQslqIH//3WT+kCzHqeKTXyCncw/sIlw198nPnq7ZR55U6qq/KytIuYDJQKKbG7SDkLJjjFJDo13oHfVo5zMVcYX4zXi466i2EQbYEf+xbLnqjm3jMM5KwOUSyX0oc2Rg9O6uwegtIaYTKYkX3N++puiFWbA1GFF8pKiWLEWrpQxhOJ0O8BT3J7IoYO2PR/FTKxSvZAKoiYQ9nutWFk5pzpn5QPcj3xMqYTaY7J1Xb0zq57BElYibv7NeRErDJp2C17bdjNg7qzXZ2LhCyQjWsfrW6KqFF0Ne0PC4fc1AYHKFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by CY5PR12MB6372.namprd12.prod.outlook.com (2603:10b6:930:e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.12; Thu, 2 Apr
 2026 14:43:45 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%3]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 14:43:44 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 23:43:40 +0900
Message-Id: <DHIQZ2SGN5QF.Z9Q57A2L7WHR@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] rust: sizes: add SizeConstants trait for device
 address space constants
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260401222743.148710-1-jhubbard@nvidia.com>
 <20260401222743.148710-2-jhubbard@nvidia.com>
In-Reply-To: <20260401222743.148710-2-jhubbard@nvidia.com>
X-ClientProxiedBy: OSAPR01CA0328.jpnprd01.prod.outlook.com
 (2603:1096:604:2a::28) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|CY5PR12MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: 30bbf1dc-5cf8-4d89-9251-08de90c63da2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	JLAqsxmTkIYolw6My+dH7yHXImepnzrFMcWhSfyxTMRuWYB0ThEQzwpLboGvbSZphgz+UJxhvI1LgsCjqNzfXghA0wHKOOxy0g7tr21FaYXJHwaYFPY6qw4Kdr6z86BmmpseE4EDSh4DGvEcE+jPy3aPjLBGlYSIJdfTj0nmSPFoICr5PLbB3zKxyXwONoZfNz8P/qmnhFfsuts/FJNj3BISMXCtqvqdGlj7l9UiHKynScVtO5SU2+J0Uuls5rT5BGZ8YRhm+/MSeigobMRN/a7HrB3F2jNCImMrZ5YveWhGedNUT3Hvp3hpS1z4Bd0bD/VBFP1Qi178E7gJc4kDIqp41dzw34Tlsmsn/L4a/iuqdkn2M6qxU8l34DsxxdJQmA/gdF9kyccBYOZdnt3FPs5PQTWdd69cBXJ/7LU+7v02j8xDhwFCkAkrv/UGy2dtr+hdVpDE0CkEdbf/z9HyuoQw3cqwBwLibCwqyH/zDawhNGc4NG5Xg+UuJihMsy9eQeBz4yFzmnDuzglaqEFaA4TjCU1Hz6DV6oVp/37BPOllRZI4cBbyXHo3bhiX19h1aX6/LulDOMcrCwNqUjx56ELIGn9WXk0fuD7CJCmmKmImXthQZTcV1EycKTOZTWCc7DZnJb5dqWneYmmIKA2W4+yIxMJ/7kNhVS7+CFLPPNCtVlpzUZo8hWzXt7mZjgPjIIyOmDXJJPpdqbhyvvqh7KtnEg2rrEGcdi/SU0RyXAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVZzZUNPb24vRFlQSVEySzBIV0UzZkFyaVVqeW9iYVJJUU5EMDNtRUFVcmR0?=
 =?utf-8?B?RWhxOGk2MmliYndXU2RhQTBwNytiV0Z5dDdXazdPZVM0R01JQ0lDbW9VbDZN?=
 =?utf-8?B?M0hFZHRsSGRuRjlCQytNWHlNUHRqTVFDRVRxTjZBVHBUOG9MOThJd2Q1UFBq?=
 =?utf-8?B?MGZTcDROZ2lWQjVUQjlQbTdPdUJGcWRZOGRKWmNOMEU0dktDYWRpaUxOSTFG?=
 =?utf-8?B?ZU1KV2pLdE5zTDBpVVczdTdxVVhGaEVqbW50a3NIcnQwQmU1dTJ4QjNReHkv?=
 =?utf-8?B?Qlp2blVEVVZycHhseEZDV0FDL0szZTZLVWpWK0ZYbEt2UmN6RTRXS2VGNU5X?=
 =?utf-8?B?MmlvV3pWQy92WGNBSCsyOVJ4akJTb1ZnY3I2M2lEeGtleWNScEp4Q2dKQWZo?=
 =?utf-8?B?bSt4bHlKeTBTK0lMTkpMVHZ4aEt2cHlLVWdmZU5mUi9hV1Jnei92SXJ3Vk1Z?=
 =?utf-8?B?aUtsQmU5SUJwRjRvUFk4RkpaNEd5VHZXOTRZMjBnQ3pnaG50dXpxN1pEWXB6?=
 =?utf-8?B?blc2SnhScldicGJISGo3TG1SR0s3Z2xHT3ZNMzk3S242WGJRN1B5UWVUUHR3?=
 =?utf-8?B?WEJvUEFLNlV1eTFmZnlQQ2VuTlVKeTh4L1lVQ1U2UjhEdS9lcWZWWjZHelVw?=
 =?utf-8?B?VXlsa2pJUy92Y01Kd3FhN2cybk5NV2orTklHNzA5MGZJYzBZL0ZtUEI2S0FO?=
 =?utf-8?B?TEVxYi92SmhNT1NNSmJsU0xES2Q0cFlEb0JVU0RlQmRxZjZOOHE1NGxSUzRn?=
 =?utf-8?B?Q0s1M2xyTjFWU3RmWTJ1WE01V1NNSXpkTUZaczVvWUxaT3djQ09IK0dIVW9j?=
 =?utf-8?B?bGEzYzdFdFVqdFpqZ0lBcWRWRWt3WEJqS2cxd0FKT3JyMUhUYVpiaGIva1hq?=
 =?utf-8?B?bkpnMWlHVUFpL2FHUng1YzJkTVRaVm1Hc0RvN0RNUEhkZ0VhRWxlZytFUHN4?=
 =?utf-8?B?S0hNM0hIbUpzT3FIajg0TXVYYlNTVU9SK2tUd1IvNEtOdUF0dVRIOVZrTEN3?=
 =?utf-8?B?aEhJOFYvaXFMSHlFb2JTdFRnNVljN1ByTGVLWnE1LzRhQlVXUEdLQ2dnTGh4?=
 =?utf-8?B?cVJEaDFOYWkzVFZ4VUFDRVJmQ1NITFhMV0J3S2NVcjBaT1hwd204Rjg2TVNH?=
 =?utf-8?B?SjJLZktMb0c4bFB1elYxcXNyZ3ZTVkxTcFM0Um9JbUZOcjhqTHNQbTRtcmI4?=
 =?utf-8?B?c0duV0VxRmkxOEJNL2tBYTlqTm5KVzBPcDVYcHVJQmRRQzBtV2djYXhzdVY3?=
 =?utf-8?B?M2FTSUJSeDVSWkRkS3V2RHF1QzhnSndHTThZaURMYytzdTdOeUE2enFLUy9C?=
 =?utf-8?B?T3BQalRxREo3a1M3WWN3eXJkYUdObHJRZVVmdVNqZitpTUVkM0RZMHNmenNh?=
 =?utf-8?B?TWdlaXZDWGtFZ0hjcDR3eGNDd1U2dDhBZ0c2MWg2MmVITG5YRDJ1MkF3RkIz?=
 =?utf-8?B?dzhLWVZXM3VyK1prUzhTY2lFSWRzTHI5SUs2ZThJVzRwMURtdzVHdDVPN2I2?=
 =?utf-8?B?M216UTROdTZ2NnFPOGVSaWE5UE02ZUxTTHhucDhKYlJSbXYzT01qRkJ2MDZt?=
 =?utf-8?B?VTdxbDFmdFhITVZCYVJWT1hkb2R0cG51RGNPc0hJc0pGclRlM0pLLytnalIw?=
 =?utf-8?B?YStaNEgxU2lnMXpNcG1GdlNpVWxseWZXV0ltS2c4aVRXTXUwL1B6OG9uc2tD?=
 =?utf-8?B?K3BGcENtM0t2ejNXSjdLbUdrQ1V1Z2NwYzlSNWZLTlNtVkFJaXo3MU9OdHk0?=
 =?utf-8?B?OHBKVElXcVBsUWxwRjdtaXR2a1BRdFFIcGpiN3N6UXNmSlM5ekNVdXBCa1cw?=
 =?utf-8?B?eW9lNHptS01lMzA2NzFrZyszTEJrTmJkQ1NCdm0vaHFYa0tycmpncTdFU3Rw?=
 =?utf-8?B?MFpwUG9xbmlRZzJ1RVRuZ3ZQS3ZPNWxuRDhCQk8yZGVsaVovSjh1MllSSSta?=
 =?utf-8?B?Z1RrS293SCsyd1pVaHp2V0JxK2dQUGxXcTNBditYeVFnOVJoaWZualNIZVQr?=
 =?utf-8?B?bytXYzA1SENyL0MrSk9rUUszek9CUFp1N3VmdnpnU3hQbC9kWWRMUlNPM3Ay?=
 =?utf-8?B?WFkyVkpEbkV2cEowdFl0SStqMDVsUVFuUk95d08yMGwxVGVFcmRmaFB5ZVlM?=
 =?utf-8?B?aWdRN05Yb1BMdE9LSDBsa2VjQ2NUOUZjSDJBY2s3SC8xeU1PQXBQT0lOS3Fx?=
 =?utf-8?B?Zzg1bGFqUENCTXpsTzZ4UGZGZzhmMGZVM3ptTlROeGNwc0V6cDRDai9qWFRH?=
 =?utf-8?B?MDAwKzljTUJ0N3pFTmUzcTVOTG9xcDRkck92Q2Y0Z1VacUdxOTdTMkxaZzhp?=
 =?utf-8?B?QXFEVllnS2lLMkIrR3k3Zms0Qk53Um5OY1BMeUhKSUI4bGJOdkJacTdXN0tG?=
 =?utf-8?Q?p0NUVPeFfpo++NEnTD5AH6QM/WKOPKTdkH594xDA3b9nv?=
X-MS-Exchange-AntiSpam-MessageData-1: NTlEEgjnKGOcTw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30bbf1dc-5cf8-4d89-9251-08de90c63da2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 14:43:44.6769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMbGCa1mhserGTPb1IIshRvZn8d0l/PBOwCoiXSmetHYEnA4cZY4uE7WtJRUnX6ILYGz6dxMfWef7BA0wz9UnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6372

On Thu Apr 2, 2026 at 7:27 AM JST, John Hubbard wrote:
> The SZ_* constants are usize, matching the CPU pointer width. But
> device address spaces have their own widths (32-bit MMIO windows,
> 64-bit GPU framebuffers, etc.), so drivers end up casting these
> constants with SZ_1M as u64 or helper functions. This adds
> boilerplate with no safety benefit.
>
> Add a SizeConstants trait with associated SZ_* constants, implemented
> for u32, u64, and usize. With the trait in scope, callers write
> u64::SZ_1M or u32::SZ_4K to get the constant in their device's
> native width. All SZ_* values fit in a u32, so every implementation
> is lossless. Each impl has a const assert to catch any future
> constant that would overflow.
>
> A define_sizes! macro generates everything from a single internal
> list of names. The macro takes the target types as arguments, so
> adding a new target type requires changing only the call site.
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Link: https://lore.kernel.org/all/DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org/
> Link: https://lore.kernel.org/all/DGHI8WRKBQS9.38910L6FIIZTE@kernel.org/
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

This looks good and the documentation also renders well; there is still
an ongoing discussion about what the trait should be named, but
regardless of the decision:

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
