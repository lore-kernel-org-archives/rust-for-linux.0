Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011024.outbound.protection.outlook.com [40.93.194.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FAC2F7ADE;
	Mon, 16 Feb 2026 08:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229145; cv=fail; b=qiewr5/eqssfgOOqJBLccyGgNT4tUrHeOUsgQRgIt6DLs2uZofb1aq9Fy3ozqhcCIea1v5/aIEilLBdz9oA/aBrZceHI5OiBTtbNlmqOG2mIViag+ppQoxVrcJij9kyIF/acYsb13Mtn1gSj+qxPqhnKCorSMnJ9agDM62QEOLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229145; c=relaxed/simple;
	bh=Utqkn8HskMsJrEyLPk0TkjF2fSrSAt/2uaHltKz3bf4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=u/r8syRJXmBGZ7FyZTfmfB3H/+R/XA/fHqrwD3NwvvY20oN22zy592+Lx35GbHc0+nJdGIlWG+Zt+wyadvxr7Wkd6xpEosu6NUtK8rOGWKGnTS1Rj3H0AmIojFGHbOBm2k2CGSV0GmxQuhD5bQhgMG5DJyR7l1FGxxyP5oeS+3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GqS6uiNt; arc=fail smtp.client-ip=40.93.194.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GqS6uiNt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHv+7XZ7qUG6XMtHddQXReg8sd2zLI/AcJH4OstXCP+wSrPO0Jx1Q8n1Psnv/Njgn2J5xsVxR0XzlOvXk3SORTF0K3385mcI8DWPLGuGMzHZcstZH2Rj0xggOF/oDDsCC9hHmB0l2XW/j4/+OGCJ4+u2Am0qXwOKEtr0ViAKxbcUvWmEhJ/pKYzQm/h3q/nLVlMffnqQFYf1icQfuKfn6F+UJeJRZLRPamzbi4PaSb8Zzvn5rrPBHU7dcGbjZ9Ln2jfnppUQEcHVWckkZNon6AmawnHG4lBjvySmQkHthNqsqvl/NA9WDt8WHaF0PfUumWR8m1rzMr1ItvzsSIxT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcA3+hByhYSpmXFbIf1Asdo8Shgud85eieBIgiJ3WOQ=;
 b=xd6hejQ/yM3T4VHLVygGTP90JkjHP0pJb18Er2YKknrYwES1IpdFeSt8G99c05LvY2R+ZNfQUrvQ2uMJTuuz7Qw3GVZ4tFUMMuW5apl1WrFqguXXgx9gzMInD5fLhGQuVT8em9fH7aAOo1TYeTV73G2JH3FcVpLgX8IC22OasoefYoyOv5FxDVm2ORFBRaDRFdPCq5z/BCNfs06BVJQSNhjpzoUn5+Y77kzcJou9Xk17dlmYAdJ+24qgf6n5ST488NN6xFPXDReIsTQRiNSe/3enoyO9Jxll+wqNoT3/ucYbmSHaNKDgKHZs+iKZRodQ5GZc/HzaDkpPyTOk7ScQ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcA3+hByhYSpmXFbIf1Asdo8Shgud85eieBIgiJ3WOQ=;
 b=GqS6uiNtv1MhmgWGvn+CpzF8nPjr0qGLuZ5lROiESX7bV/r0lzjIYT22Ey33ySiRZyiBq5yBXI9hpchPMtzSA979PMfbZUyaW8l/AW/UODNCZvgQHup2jRiE2o5pKloUx5RvE0oyZjT9wQ681p7b2o6GER4EORfERS6ssPCmf0BJ17+sdCuXLqAtqLODWmLoKoqXEGBKyC32L6JSMDY8SVlgt8BXca5a0Y7TsWGUaLwjJNYvQR8LVXYyu+jpY6UOMy1srTUuy0F5ulQHMeSa1YK+U+i8sNcDF7m5gscFCvY5BdmxN/RcXSmWovsipoNP9f+xNjLZuVHVRsyrnOSYJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Mon, 16 Feb
 2026 08:05:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 08:05:33 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Feb 2026 17:04:43 +0900
Subject: [PATCH v6 7/9] rust: io: add `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-register-v6-7-eec9a4de9e9e@nvidia.com>
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
In-Reply-To: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0035.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac1aeee-43d1-4abd-b30d-08de6d3228c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QS9FdTRIZ0NEdXY0UUs5ZFlnMlcvRlhWQ3Z5ZUJ2N3VLVmlUaEhndjdmSW1y?=
 =?utf-8?B?Y2RIS0lmSG03RkxQMXp2NERwb3hCMXlMRkVUVmlPbjVFSFJpd1pBbEdnZXJS?=
 =?utf-8?B?K0tBNWdYRWpXZUFXZ2k4cnNXWXRrcjlQNEtkUG1iUnFSMU5WblBLeXZqQlFC?=
 =?utf-8?B?UGhLLzB3ZVcxdXZ3ZjNnQytJQlNzTFlROCtCVXNlMUduNThURmwyNnpEaG9v?=
 =?utf-8?B?dlEwelY3NUQzR01GTENjSE1FdXFLUnNxbzdhakZGaWpWTzdTMitCVU9OVCth?=
 =?utf-8?B?QnltdVZYcjFhOWRwOXU2LzYwQmd4M0JINEFqU3hWMFdiZnVWTTZvYjN0bndj?=
 =?utf-8?B?YkhTamE0UndvRCsxcnVyTWF4czdOQlY2TGl2NHIzQzFyRnVUN1ZmNUlaakVt?=
 =?utf-8?B?cEdOb0paRkRQdDdLNC9La29MM3hkRDhkSjlqWlJuOXJFQU80bktPN28rQUY2?=
 =?utf-8?B?blgycER3eW5iYmxnaUI3SVUxazBZaUtVNUt5OHhOMVI5ZWMvcDJaelFFdVF0?=
 =?utf-8?B?MU8vK2Y3WWZnOFZYMXZ6d29DUmRHNE55NVNSakJqMHBudVhJK0oxTmxlUWxV?=
 =?utf-8?B?aWxlRkllVTR4NU02TEZxM1MyTjdCWkRNNFhBRG9rTzhEcnVqeXhYRitqMGlO?=
 =?utf-8?B?MUMrTGFVMm1YN1lTRWU2RVdFY1ovdzlHT3YzR0NkRU8zNzVULzd6WTlWTmVS?=
 =?utf-8?B?c2ZHdmkva0M2S1FhWlJPMTVvekd1bitudlBjdzRNT0g3eGdobVlwK0ZFOWJo?=
 =?utf-8?B?TWUzTGswK0Roek11cXlIcDBBbmxkS0dRRWZYTlNKMDFiaWZEbEpSalhoK2tX?=
 =?utf-8?B?R2YvcFRIQXkrNjJNOUd3VkxBbFRqQnU2ZjNNTzhYQXp0TGRrVDdkamxRYnJT?=
 =?utf-8?B?b1NwcDFtZTVhY3phQnYwTGVnanQ2SzIzNnZwMjA2R0pXb0Vta2pTZHlod3Y3?=
 =?utf-8?B?ZUxNRHhsUndwMitBN0tmNXM1L2pTb0c5a3Y3MTVDdWU1YXU3ZGM2WG9NTjVI?=
 =?utf-8?B?RnNxSzN5blptOXdoenlyRm9EaW1FQUlpK3poaGx1bGlZT3pkYzdBUjhWTXJr?=
 =?utf-8?B?OUhIRlFJSHMxMklJUHNDajZMWGxDTEZyazF1cUNxY1dhY0pQdkU5dUpxQkxQ?=
 =?utf-8?B?eDdJZDlINFUyNlBWRGVXcERUL1FhbXpSOTJJVktUZUdkdG9sL2s3SjNiNFJ3?=
 =?utf-8?B?VDhmK01qbFd0amhIQUpFREt2aXNtNjZVZlRpWGtvUDhrQkl5MWpDeUx0S1J3?=
 =?utf-8?B?eE9qdkpYNTVrVUppKzhIU1VzczhVWERNNnc5cFBHMm53RXY4WmFKbFdmekZS?=
 =?utf-8?B?N25YUHUzNjlNUHlmUlVzL3YvV1A0aEo4RGdtV2ZyUzd0a2FPNW05UitDNWdv?=
 =?utf-8?B?aVJML290WUI3TW5UVTBSdkJFMTBqYlBrU1VqbkVMS21IeVMrNTBEOGoveEtq?=
 =?utf-8?B?OWliQ0R4S25MTXIxaHhsV1R6VFBDTUE1UkpCdjRlMmNXK1JkcGJtNUx5ZUFv?=
 =?utf-8?B?cVlPNWwwUDlyRzFpNHdzUVcrcG9JSGJNRktxQ0hId212cHVMRnNhT1RTbVJo?=
 =?utf-8?B?d011TVZ3TC93UzYxOUt5bU1rMnk0U3NWeGErejZyVy9Ta1VYbWNWUktaRUQ1?=
 =?utf-8?B?VHBoTzZHTDZqblVvZFJvbzZOQlR6QnQxRDFRcjdLWlBMcjBaQU85RysrNXdJ?=
 =?utf-8?B?Z0VmajJqQ0UrYUZZMGFYSjlCd05GVGI3Y3h6Z1YxVllXT3FFaG11aE8yeDJ3?=
 =?utf-8?B?NVZQR2kxSUh1Q3VVa3FHeHpEM2xoK2hUSUZnN2xjVVIvdm1OQ3dpZDVjTWxD?=
 =?utf-8?B?cDVzT0Z0RTFjZUNvLzg1QzFxMDUzbHBvdW43ejRiZHBrcHhDbk5PaVlRZFpz?=
 =?utf-8?B?V3o2VTArRFBCenJUQUlwMmdiR2Njd25SZnJoNzczM244ZGNZK3RtSUdIcTU2?=
 =?utf-8?B?cjBXTk91NCtmNDM2Q3VWL2ZhU2ZNeDRHNkMvZUI4OFgzQnJwS3E3QmVxQXZL?=
 =?utf-8?B?dmVOdG9JWG1yTzBqOXRSVmRKcWV6ZVNOZGFkZkp6K054UlNrYVF0L0lnZnRt?=
 =?utf-8?B?MnFGczV3alF2Q3JocmZlNFZoamtSY2dOeXlBNGRPZWFOVnhQSzZBR3NZeElv?=
 =?utf-8?B?bG16NHpmOHpGNG1UTi82M0V6R0lpT2tZdmMvajVETm9lWFQxb01zKzhCcUcx?=
 =?utf-8?Q?RcSOvOXOAWzcqyaZn19OHP8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDA2V0J4d084VjVFWDliVEc4eHoweVNrSnJwS0lIc2RkSXc1K093MVFCZ25K?=
 =?utf-8?B?ZTZKNEo4MkVKVVNLUE9mQVBnNElEK0w5TmZOaTFaVFV6b2RWRUF4bzl2VHcv?=
 =?utf-8?B?dUVBc1hJTk5vRUd3RUlaWUlub0FnMU0vdDhXeXhodjJEQWxpaUN6UExVQ05s?=
 =?utf-8?B?eGREQmNLd3VKTEdYcWRvaHZ5V0o3a1NSK0Iwd0w4Y0lJdnV2eVA0NjV3Y0JC?=
 =?utf-8?B?Rmcvc0hlMU1rcFZ0eUVrcGg3NnBDTFJSak9zUkZUMkxxK2I2RU84TUVETndL?=
 =?utf-8?B?cVFXSHNMUEZXTElhc2ZVSmttWUR6N1FKVEE0Z0xFU1ZkbERRQ3RuWmRFQytI?=
 =?utf-8?B?dnowYkh1cXkxeGQycGFRa1dSTnNEWGsvYUpVOEtjQmp4Rnc3emU5NUp5OXpn?=
 =?utf-8?B?b2ZWVjJjKzkyeDBOM0diczFqNTlJU0lneXM1OGxLWmdCRkFlNGlkS05Ja0o0?=
 =?utf-8?B?eEZYVFMrNGJHa05iMWYrNjY0dm1TZDZJaGwwcE5VVDhRQURTNm9PdjdrQnlz?=
 =?utf-8?B?RWNKaDMxM2p4anZmc0xwK2JSS3FCMEZYRUwxSEVzeHdHR0Z6WDI2ei9Ra0Jn?=
 =?utf-8?B?ak5PZ0w5MkRLN3RSeDJNakx4Y2tYNVVWbDYxbVE3TzY4VjNsZlFHWW5aR2tj?=
 =?utf-8?B?a1UzSG5qVGU1WFdRekVLeUUvQ21LY1F1WEw1ekV3bEN4UnBreFN3bzdaUHVj?=
 =?utf-8?B?QTRIZk9BL1F5RzRKdXBUWTlmc1NsaFZlQVZGNHZWRmVyVXRGeVcxUHFJNHNW?=
 =?utf-8?B?bjRoSW9wclZXa1JJQ2ovYVA3K05wRUpTVytrbEFDUm00NUsvdDZyMDN1MGtl?=
 =?utf-8?B?cE5MdEF2amplQjg3VDBPeGtFamltQ3loeURHYkd2WXdCMWdic240VUd5bDFI?=
 =?utf-8?B?YjMrcFlFdENZY1hTdnB3djhKTmltRUVHSmo0RUVzYmNZVEl1Q01QRXN1MlVR?=
 =?utf-8?B?U082c24yWFF2NDlIVDRCSmRNaHhERFg0SHJieWljREZReGNuSnVVaXVVbzV1?=
 =?utf-8?B?Mkw4dXBGZDU5aE8zb3dPT3pqa0RseG12NldHZ3hDS2FveWkwdVFZSDV0V0F2?=
 =?utf-8?B?NEFQeUx5SjNscFZBc0N5QXh0NHRyWjg2TG1yMzBERWlCckF6MDgyYzQrWTh0?=
 =?utf-8?B?ZjU1Z3IrQmZVd1p5cEM5K0FITnhNKzNwVDJYMVNabjBjUjZyN1dMMTZqbGhI?=
 =?utf-8?B?MmUyTHJBL0lNdlFMTGo4WGhFREZhQ3ZOa0FvNkVZQVFzOVU4ak5kZGlEaVdj?=
 =?utf-8?B?Z1hGSmFJSCtaWHpMOFVqS0plbzFDNzBaOU9ieUd0YjBVN0h5TjZXdTMvQU9C?=
 =?utf-8?B?Q0tKYjdoZlU2d01vc2Uva3QvSFJqNGdlQW9ZcXhxSHMwcVFQQkk3N0cyb1dB?=
 =?utf-8?B?endxRDgzR05jZG54cUdPTnpPQ3UxV3ZKM2xieFRxT25wK2Q4elJDL01EY0V2?=
 =?utf-8?B?UXprRkpMdkpjekozRUs0cm5kY3pCSFJUSHJia29JbCsySGR6akVQc2dLNXI1?=
 =?utf-8?B?ZmJXcVJFQ0Q5ZVM0SUtSby9SOXE3ckNpelBTNmNsa1NMRGQ0VCtZSGZIRm4x?=
 =?utf-8?B?VHRvWkk4V2NFSHBBQTUyVWUvRjRtMU5NOXJ6MTBKaG4rLzlHWStxYjU3dmZl?=
 =?utf-8?B?cUZDeVVaK1VIeGJ3N1JkV0xQOE12VmMrWldHYlVjOE9aNnJzY01QT0pQSDlC?=
 =?utf-8?B?MGp5TkdSazNHVm9uWW0vbUhwdndOZ3ZHNXBOeXpCS2Z2dTJianlOY1lFWHo0?=
 =?utf-8?B?QVdVWmFHOTVXb0w2Ym16aHpMQlo1V2pFdVJVK29vS0VQMzBJMUdzUDNQNVZT?=
 =?utf-8?B?dkdVQ1VQY3kvVnRhZ3JrZHAvTk5lRFhHa3hxeGJSSlZKbDVIcFRqTG9GbENV?=
 =?utf-8?B?dUZWUTlwOHRyU1pQYlVwWElhaUc4QTEvaUpWVGJBUFRuTUJVaVc5dzVOdTJM?=
 =?utf-8?B?L0xDeG16ZnE3Z05rZkowcXNyYnpRUERia2FIaUh2Z3M2SG5VL2V6cTBIUUJW?=
 =?utf-8?B?OTFDVFB5eG9aL3ZqaFhnaXA3dUpkOEFMcTF5MDJZZEM5U2EzbTgvNERWc2F6?=
 =?utf-8?B?L0VKTzJSdzZPTVo1QnlyUTBWRFBhWitHM2dxQ2tQRWdiSDhNNlUrK1BCVG5a?=
 =?utf-8?B?VjVFaStqaFhIQ1VpdVZ6MzNXZFVTbVJoS1pqekFMQ2VUenZhQ1NqN2RLVmlW?=
 =?utf-8?B?dzUyakE2bk41aldOYm1wMGZaQXV4b2xTVjdMTmRjdFlmQzlpZ0l5VlArMkZB?=
 =?utf-8?B?VUhoeVdMTU5vNlFraDBqRW9LVmpRTjBzaW0yeURGU1lobzNOa1Y0R2IxT2ha?=
 =?utf-8?B?Q2g5QjV1bHhJVHYvNktXZmRuMjhSVkZLNzB2azZDeVdhdm05QUNnZGdqMGJQ?=
 =?utf-8?Q?Rft9BggIqTiqO8ZIpQjk4fTsJ4TsRlI36MLKusiLJ4+Wq?=
X-MS-Exchange-AntiSpam-MessageData-1: KWTrIQwU2Ca1AQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac1aeee-43d1-4abd-b30d-08de6d3228c1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:05:33.5564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6o62No+Y0a0Bq7uGCZmOy8jwqEr7gmbNvqXCCfgcmejcphccymLkKB02hNLuVKIB4yReuHbJzGdM4ozK1YoDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5732

Add a macro for defining hardware register types with I/O accessors.

Each register field is represented as a `Bounded` of the appropriate bit
width, ensuring field values are never silently truncated.

Fields can optionally be converted to/from custom types, either fallibly
or infallibly.

The address of registers can be direct, relative, or indexed, supporting
most of the patterns in which registers are arranged.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/all/20250306222336.23482-6-dakr@kernel.org/
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs          |    5 +-
 rust/kernel/io/register.rs | 1125 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1129 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 053c6385842a..c2dddf5b9dfd 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -11,6 +11,7 @@
 
 pub mod mem;
 pub mod poll;
+pub mod register;
 pub mod resource;
 
 pub use resource::Resource;
@@ -177,7 +178,7 @@ pub trait IoCapable<T> {
 ///
 /// This trait is the key abstraction allowing [`Io::read`], [`Io::write`], and [`Io::update`]
 /// to work uniformly with both raw `usize` offsets (for primitive types like `u32`) and typed
-/// references.
+/// references (like those generated by the [`register!`] macro).
 ///
 /// An `IoRef<T>` carries three pieces of information:
 ///
@@ -192,6 +193,8 @@ pub trait IoCapable<T> {
 /// An `IoRef` can be passed directly to [`Io::read`] or [`Io::try_read`] to obtain a value, or
 /// turned into an [`IoWrite`] via [`IoRef::set`] to be passed to [`Io::write`] or
 /// [`Io::try_write`].
+///
+/// [`register!`]: kernel::register!
 pub trait IoRef<T>: Copy
 where
     T: From<Self::IoType> + Into<Self::IoType>,
diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
new file mode 100644
index 000000000000..ebafe15d56a2
--- /dev/null
+++ b/rust/kernel/io/register.rs
@@ -0,0 +1,1125 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A macro to define register layout and accessors.
+//!
+//! A single register typically includes several fields, which are accessed through a combination
+//! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
+//! not all possible field values are necessarily valid.
+//!
+//! The [`register!`] macro in this module provides an intuitive and readable syntax for defining a
+//! dedicated type for each register. Each such type comes with its own field accessors that can
+//! return an error if a field's value is invalid.
+//!
+//! [`register!`]: kernel::register!
+
+use core::marker::PhantomData;
+
+use crate::io::IoRef;
+
+/// Trait providing a base address to be added to the offset of a relative register to obtain
+/// its actual offset.
+///
+/// The `T` generic argument is used to distinguish which base to use, in case a type provides
+/// several bases. It is given to the `register!` macro to restrict the use of the register to
+/// implementors of this particular variant.
+pub trait RegisterBase<T> {
+    /// Base address to which register offsets are added.
+    const BASE: usize;
+}
+
+/// Trait implemented by all registers.
+pub trait Register: Copy {
+    /// Backing primitive type of the register.
+    type Storage;
+}
+
+/// Trait implemented by registers with a fixed offset.
+pub trait FixedRegister: Register {
+    /// Offset of the register.
+    const OFFSET: usize;
+}
+
+/// Reference to a fixed register.
+#[derive(Clone, Copy)]
+pub struct FixedRegisterRef<T: FixedRegister>(PhantomData<T>);
+
+impl<T: FixedRegister> FixedRegisterRef<T> {
+    /// Creates a reference to `T`.
+    #[inline(always)]
+    // We do not implement `Default` so we can be const.
+    #[allow(clippy::new_without_default)]
+    pub const fn new() -> Self {
+        Self(PhantomData)
+    }
+}
+
+impl<T> IoRef<T> for FixedRegisterRef<T>
+where
+    T: FixedRegister + From<T::Storage> + Into<T::Storage>,
+{
+    type IoType = T::Storage;
+
+    fn offset(self) -> usize {
+        T::OFFSET
+    }
+}
+
+/// Trait implemented by relative registers.
+pub trait RelativeRegister: Register {
+    /// Family of bases applicable to this register.
+    type BaseFamily;
+
+    /// Offset of the register relative to its base.
+    const OFFSET: usize;
+}
+
+/// Reference to a relative register.
+///
+/// This can either be an immediately accessible regular [`RelativeRegister`], or a
+/// [`RelativeRegisterArray`] that needs one additional resolution through
+/// [`RelativeRegisterRef::at`].
+pub struct RelativeRegisterRef<T, B: ?Sized>(PhantomData<T>, PhantomData<B>);
+
+// `Clone` and `Copy` unfortunately cannot be derived without requiring `B` to also implement them.
+impl<T, B> Clone for RelativeRegisterRef<T, B>
+where
+    B: ?Sized,
+{
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<T, B> Copy for RelativeRegisterRef<T, B> where B: ?Sized {}
+
+impl<T, B> RelativeRegisterRef<T, B>
+where
+    B: ?Sized,
+{
+    /// Creates a new reference to a relative register or register array.
+    #[inline(always)]
+    // We do not implement `Default` so we can be const.
+    #[allow(clippy::new_without_default)]
+    pub const fn new() -> Self {
+        Self(PhantomData, PhantomData)
+    }
+}
+
+impl<T, B> IoRef<T> for RelativeRegisterRef<T, B>
+where
+    T: RelativeRegister + From<T::Storage> + Into<T::Storage>,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    type IoType = T::Storage;
+
+    fn offset(self) -> usize {
+        B::BASE + T::OFFSET
+    }
+}
+
+/// Trait implemented by arrays of registers.
+pub trait RegisterArray: Register {
+    /// Start offset of the registers array.
+    const OFFSET: usize;
+    /// Number of elements in the registers array.
+    const SIZE: usize;
+    /// Number of bytes between the start of elements in the registers array.
+    const STRIDE: usize;
+}
+
+/// Reference to an array register.
+#[derive(Clone, Copy)]
+pub struct RegisterArrayRef<T: RegisterArray>(usize, PhantomData<T>);
+
+impl<T: RegisterArray> RegisterArrayRef<T> {
+    /// Creates a reference to register `T` at index `idx`, with build-time validation.
+    #[inline(always)]
+    pub fn new(idx: usize) -> Self {
+        ::kernel::build_assert!(idx < T::SIZE);
+
+        Self(idx, PhantomData)
+    }
+
+    /// Attempts to create a reference to register `T` at index `idx`, with runtime validation.
+    #[inline(always)]
+    pub fn try_new(idx: usize) -> Option<Self> {
+        if idx < T::SIZE {
+            Some(Self(idx, PhantomData))
+        } else {
+            None
+        }
+    }
+}
+
+impl<T> IoRef<T> for RegisterArrayRef<T>
+where
+    T: RegisterArray + From<T::Storage> + Into<T::Storage>,
+{
+    type IoType = T::Storage;
+
+    fn offset(self) -> usize {
+        T::OFFSET + self.0 * T::STRIDE
+    }
+}
+
+/// Trait implemented by arrays of relative registers.
+pub trait RelativeRegisterArray: Register {
+    /// Family of bases applicable to this register array.
+    type BaseFamily;
+
+    /// Offset of the registers array relative to its base.
+    const OFFSET: usize;
+    /// Number of elements in the registers array.
+    const SIZE: usize;
+    /// Number of bytes between each element in the registers array.
+    const STRIDE: usize;
+}
+
+/// Reference to a relative array register.
+pub struct RelativeRegisterArrayRef<
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+>(usize, PhantomData<T>, PhantomData<B>);
+
+// `Clone` and `Copy` unfortunately cannot be derived without requiring `B` to also implement them.
+impl<T, B> Clone for RelativeRegisterArrayRef<T, B>
+where
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<T, B> Copy for RelativeRegisterArrayRef<T, B>
+where
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+}
+
+impl<T, B> RelativeRegisterArrayRef<T, B>
+where
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    /// Creates a reference to register `T` from the base `B` at index `idx`, with build-time
+    /// validation.
+    #[inline(always)]
+    pub fn new(idx: usize) -> Self {
+        ::kernel::build_assert!(idx < T::SIZE);
+
+        Self(idx, PhantomData, PhantomData)
+    }
+
+    /// Attempts to create a reference to register `T` from the base `B` at index `idx`, with
+    /// runtime validation.
+    #[inline(always)]
+    pub fn try_new(idx: usize) -> Option<Self> {
+        if idx < T::SIZE {
+            Some(Self(idx, PhantomData, PhantomData))
+        } else {
+            None
+        }
+    }
+}
+
+/// Methods exclusive to [`RelativeRegisterRef`]s created with a [`RelativeRegisterArray`].
+impl<T, B> RelativeRegisterRef<T, B>
+where
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    /// Returns a reference to the register at index `idx`, with build-time validation.
+    #[inline(always)]
+    pub fn at(self, idx: usize) -> RelativeRegisterArrayRef<T, B> {
+        RelativeRegisterArrayRef::new(idx)
+    }
+
+    /// Attempts to return a reference to the register at index `idx`, with runtime validation.
+    #[inline(always)]
+    pub fn try_at(self, idx: usize) -> Option<RelativeRegisterArrayRef<T, B>> {
+        RelativeRegisterArrayRef::try_new(idx)
+    }
+}
+
+impl<T, B> IoRef<T> for RelativeRegisterArrayRef<T, B>
+where
+    T: RelativeRegisterArray + From<T::Storage> + Into<T::Storage>,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    type IoType = T::Storage;
+
+    fn offset(self) -> usize {
+        B::BASE + T::OFFSET + self.0 * T::STRIDE
+    }
+}
+
+/// Defines a dedicated type for a register, including getter and setter methods for its fields and
+/// methods to read and write it from an [`Io`](kernel::io::Io) region.
+///
+/// # Example
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     /// Basic information about the chip.
+///     pub BOOT_0(u32) @ 0x00000100 {
+///         /// Vendor ID.
+///         15:8 vendor_id;
+///         /// Major revision of the chip.
+///         7:4 major_revision;
+///         /// Minor revision of the chip.
+///         3:0 minor_revision;
+///     }
+/// }
+/// ```
+///
+/// This defines a 32-bit `BOOT_0` type which can be read from or written to offset `0x100` of an
+/// `Io` region, with the described fields. For instance, `minor_revision` consists of the 4 least
+/// significant bits of the type.
+///
+/// Fields are instances of [`Bounded`](kernel::num::Bounded) and can be read by calling their
+/// getter method, which is named after them. They also have setter methods prefixed with `with_`
+/// for runtime values and `with_const_` for constant values. All setters return the updated
+/// register value.
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::io::IoRef;
+/// use kernel::num::Bounded;
+///
+/// # register! {
+/// #     pub BOOT_0(u32) @ 0x00000100 {
+/// #         15:8 vendor_id;
+/// #         7:4 major_revision;
+/// #         3:0 minor_revision;
+/// #     }
+/// # }
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: T) {
+/// # fn obtain_vendor_id() -> u8 { 0xff }
+/// // Read from the register's defined offset (0x100).
+/// let boot0 = bar.read(BOOT_0);
+/// pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot0.minor_revision().get());
+///
+/// // Update some fields and write the new value back.
+/// bar.write(BOOT_0.set(boot0
+///     // Constant values.
+///     .with_const_major_revision::<3>()
+///     .with_const_minor_revision::<10>()
+///     // Run-time value.
+///     .with_vendor_id(obtain_vendor_id()),
+/// ));
+///
+/// // Or, build a new value from zero and write it:
+/// bar.write(BOOT_0.init(|r| r
+///     .with_const_major_revision::<3>()
+///     .with_const_minor_revision::<10>()
+///     .with_vendor_id(obtain_vendor_id()),
+/// ));
+///
+/// // Or, read and update the register in a single step.
+/// bar.update(BOOT_0, |r| r
+///     .with_const_major_revision::<3>()
+///     .with_const_minor_revision::<10>()
+///     .with_vendor_id(obtain_vendor_id())
+/// );
+///
+/// // Constant values can also be built using the const setters.
+/// const V: BOOT_0 = pin_init::zeroed::<BOOT_0>()
+///     .with_const_major_revision::<3>()
+///     .with_const_minor_revision::<10>();
+/// # }
+/// ```
+///
+/// Fields can also be transparently converted from/to an arbitrary type by using the `=>` and
+/// `?=>` syntaxes.
+///
+/// If present, doc comments above register or fields definitions are added to the relevant item
+/// they document (the register type itself, or the field's setter and getter methods).
+///
+/// Note that multiple registers can be defined in a single `register!` invocation. This can be
+/// useful to group related registers together.
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     pub BOOT_0(u8) @ 0x00000100 {
+///         7:4 major_revision;
+///         3:0 minor_revision;
+///     }
+///
+///     pub BOOT_1(u8) @ 0x00000101 {
+///         7:5 num_threads;
+///         4:0 num_cores;
+///     }
+/// };
+/// ```
+///
+/// It is possible to create an alias of an existing register with new field definitions by using
+/// the `=> ALIAS` syntax. This is useful for cases where a register's interpretation depends on
+/// the context:
+///
+/// ```
+/// use kernel::register;
+///
+/// register! {
+///     /// Scratch register.
+///     pub SCRATCH(u32) @ 0x00000200 {
+///         /// Raw value.
+///         31:0 value;
+///     }
+///
+///     /// Boot status of the firmware.
+///     pub SCRATCH_BOOT_STATUS(u32) => SCRATCH {
+///         /// Whether the firmware has completed booting.
+///         0:0 completed;
+///     }
+/// }
+/// ```
+///
+/// In this example, `SCRATCH_BOOT_STATUS` uses the same I/O address as `SCRATCH`, while also
+/// providing its own `completed` field.
+///
+/// ## Relative registers
+///
+/// A register can be defined as being accessible from a fixed offset of a provided base. For
+/// instance, imagine the following I/O space:
+///
+/// ```text
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///  0x100--->+------------CPU0-------------+
+///           |                             |
+///  0x110--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///           |                             |
+///  0x200--->+------------CPU1-------------+
+///           |                             |
+///  0x210--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           +-----------------------------+
+/// ```
+///
+/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at offset `0x10` of their I/O
+/// space segment. Since both instances of `CPU_CTL` share the same layout, we don't want to define
+/// them twice and would prefer a way to select which one to use from a single definition.
+///
+/// This can be done using the `Base + Offset` syntax when specifying the register's address.
+///
+/// `Base` is an arbitrary type (typically a ZST) to be used as a generic parameter of the
+/// [`RegisterBase`] trait to provide the base as a constant, i.e. each type providing a base for
+/// this register needs to implement `RegisterBase<Base>`. Here is the above example translated
+/// into code:
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::io::register::RegisterBase;
+///
+/// // Type used to identify the base.
+/// pub struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: T) {
+/// // This makes `CPU_CTL` accessible from all implementors of `RegisterBase<CpuCtlBase>`.
+/// register! {
+///     /// CPU core control.
+///     pub CPU_CTL(u32) @ CpuCtlBase + 0x10 {
+///         /// Start the CPU core.
+///         0:0 start;
+///     }
+/// }
+///
+/// // Start `Cpu0`.
+/// bar.update(CPU_CTL::of::<Cpu0>(), |r| r.with_start(true));
+///
+/// // Start `Cpu1`.
+/// bar.update(CPU_CTL::of::<Cpu1>(), |r| r.with_start(true));
+///
+/// // Aliases can also be defined for relative register.
+/// register! {
+///     /// Alias to CPU core control.
+///     pub CPU_CTL_ALIAS(u32) => CpuCtlBase + CPU_CTL {
+///         /// Start the aliased CPU core.
+///         1:1 alias_start;
+///     }
+/// }
+///
+/// // Start the aliased `CPU0`.
+/// bar.update(CPU_CTL_ALIAS::of::<Cpu0>(), |r| r.with_alias_start(true));
+/// # }
+/// ```
+///
+/// ## Arrays of registers
+///
+/// Some I/O areas contain consecutive registers that share the same field layout. These areas can
+/// be defined as an array of identical registers, allowing them to be accessed by index with
+/// compile-time or runtime bound checking. Simply specify their size inside `[` and `]` brackets,
+/// and use the `at` method to obtain the correct reference:
+///
+/// ```no_run
+/// use kernel::register;
+///
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: T)
+/// #     -> Result<(), Error>{
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Array of 64 consecutive registers with the same layout starting at offset `0x80`.
+/// register! {
+///     /// Scratch registers.
+///     pub SCRATCH(u32)[64] @ 0x00000080 {
+///         31:0 value;
+///     }
+/// }
+///
+/// // Read scratch register 0, i.e. I/O address `0x80`.
+/// let scratch_0 = bar.read(SCRATCH::at(0)).value();
+/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
+/// let scratch_15 = bar.read(SCRATCH::at(15)).value();
+///
+/// // This is out of bounds and won't build.
+/// // let scratch_128 = bar.read(SCRATCH::at(128)).value();
+///
+/// // Runtime-obtained array index.
+/// let idx = get_scratch_idx();
+/// // Access on a runtime index returns an error if it is out-of-bounds.
+/// let some_scratch = bar.read(SCRATCH::try_at(idx).ok_or(EINVAL)?).value();
+///
+/// // Alias to a particular register in an array.
+/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
+/// register! {
+///     /// Firmware exit status code.
+///     pub FIRMWARE_STATUS(u32) => SCRATCH[8] {
+///         7:0 status;
+///     }
+/// }
+/// let status = bar.read(FIRMWARE_STATUS).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register! {
+///     /// Scratch registers bank 0.
+///     pub SCRATCH_INTERLEAVED_0(u32)[16, stride = 8] @ 0x000000c0 {
+///         31:0 value;
+///     }
+///
+///     /// Scratch registers bank 1.
+///     pub SCRATCH_INTERLEAVED_1(u32)[16, stride = 8] @ 0x000000c4 {
+///         31:0 value;
+///     }
+/// }
+/// # Ok(())
+/// # }
+/// ```
+///
+/// ## Relative arrays of registers
+///
+/// Combining the two features described in the sections above, arrays of registers accessible from
+/// a base can also be defined:
+///
+/// ```no_run
+/// use kernel::register;
+/// use kernel::io::register::RegisterBase;
+///
+/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(bar: T)
+/// #     -> Result<(), Error>{
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Type used as parameter of `RegisterBase` to specify the base.
+/// pub struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// // 64 per-cpu scratch registers, arranged as a contiguous array.
+/// register! {
+///     /// Per-CPU scratch registers.
+///     pub CPU_SCRATCH(u32)[64] @ CpuCtlBase + 0x00000080 {
+///         31:0 value;
+///     }
+/// }
+///
+/// // Read scratch register 0 of CPU0.
+/// let cpu0_scratch_0 = bar.read(CPU_SCRATCH::of::<Cpu0>().at(0)).value();
+/// // Read scratch register 15 of CPU1.
+/// let cpu1_scratch_15 = bar.read(CPU_SCRATCH::of::<Cpu1>().at(15)).value();
+///
+/// // This won't build.
+/// // let cpu0_scratch_128 = bar.read(CPU_SCRATCH::of::<Cpu0>().at(128)).value();
+///
+/// // Runtime-obtained array index.
+/// let scratch_idx = get_scratch_idx();
+/// // Access on a runtime index returns an error if it is out-of-bounds.
+/// let cpu0_scratch = bar.read(
+///     CPU_SCRATCH::of::<Cpu0>().try_at(scratch_idx).ok_or(EINVAL)?
+/// ).value();
+///
+/// // `SCRATCH[8]` is used to convey the firmware exit code.
+/// register! {
+///     /// Per-CPU firmware exit status code.
+///     pub CPU_FIRMWARE_STATUS(u32) => CpuCtlBase + CPU_SCRATCH[8] {
+///         7:0 status;
+///     }
+/// }
+///
+/// let cpu0_status = bar.read(CPU_FIRMWARE_STATUS::of::<Cpu0>()).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register! {
+///     /// Scratch registers bank 0.
+///     pub CPU_SCRATCH_INTERLEAVED_0(u32)[16, stride = 8] @ CpuCtlBase + 0x00000d00 {
+///         31:0 value;
+///     }
+///
+///     /// Scratch registers bank 1.
+///     pub CPU_SCRATCH_INTERLEAVED_1(u32)[16, stride = 8] @ CpuCtlBase + 0x00000d04 {
+///         31:0 value;
+///     }
+/// }
+/// # Ok(())
+/// # }
+/// ```
+#[macro_export]
+macro_rules! register {
+    // Entry point for the macro, allowing multiple registers to be defined in one call.
+    // It matches all possible register declaration patterns to dispatch them to corresponding
+    // `@reg` rule that defines a single register.
+    (
+        $(
+            $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+                $([ $size:expr $(, stride = $stride:expr)? ])?
+                $(@ $($base:ident +)? $offset:literal)?
+                $(=> $alias:ident $(+ $alias_offset:ident)? $([$alias_idx:expr])? )?
+            { $($fields:tt)* }
+        )*
+    ) => {
+        $(
+        $crate::register!(
+            @reg $(#[$attr])* $vis $name ($storage) $([$size $(, stride = $stride)?])?
+                $(@ $($base +)? $offset)?
+                $(=> $alias $(+ $alias_offset)? $([$alias_idx])? )?
+            { $($fields)* }
+        );
+        )*
+    };
+
+    // All the rules below are private helpers.
+
+    // Creates a register at a fixed offset of the MMIO space.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(@io_fixed $(#[$attr])* $vis $name($storage) @ $offset);
+    };
+
+    // Creates an alias register of fixed offset register `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(
+            @io_fixed $(#[$attr])* $vis $name($storage) @
+            <$alias as $crate::io::register::FixedRegister>::OFFSET
+        );
+    };
+
+    // Creates a register at a relative offset from a base address provider.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $base:ident + $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(@io_relative $vis $name($storage) @ $base + $offset );
+    };
+
+    // Creates an alias register of relative offset register `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $base:ident + $alias:ident
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(
+            @io_relative $vis $name($storage) @
+            $base + <$alias as $crate::io::register::RelativeRegister>::OFFSET
+        );
+    };
+
+    // Creates an array of registers at a fixed offset of the MMIO space.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            [ $size:expr, stride = $stride:expr ] @ $offset:literal { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(@io_array $vis $name($storage) [ $size, stride = $stride ] @ $offset);
+    };
+
+    // Shortcut for contiguous array of registers (stride == size of element).
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $size:expr ] @ $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            $(#[$attr])* $vis $name($storage) [ $size, stride = ::core::mem::size_of::<$storage>() ]
+                @ $offset { $($fields)* }
+        );
+    };
+
+    // Creates an alias of register `idx` of array of registers `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident [ $idx:expr ]
+            { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < <$alias as $crate::io::register::RegisterArray>::SIZE);
+
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(@io_fixed $(#[$attr])* $vis $name($storage)
+            @ <$alias as $crate::io::register::RegisterArray>::OFFSET
+                + $idx * <$alias as $crate::io::register::RegisterArray>::STRIDE
+        );
+    };
+
+    // Creates an array of registers at a relative offset from a base address provider.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            [ $size:expr, stride = $stride:expr ]
+            @ $base:ident + $offset:literal { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(
+            @io_relative_array $vis $name($storage) [ $size, stride = $stride ] @ $base + $offset
+        );
+    };
+
+    // Shortcut for contiguous array of relative registers (stride == size of element).
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $size:expr ]
+            @ $base:ident + $offset:literal { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            $(#[$attr])* $vis $name($storage) [ $size, stride = ::core::mem::size_of::<$storage>() ]
+                @ $base + $offset { $($fields)* }
+        );
+    };
+
+    // Creates an alias of register `idx` of relative array of registers `alias` with its own
+    // fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            => $base:ident + $alias:ident [ $idx:expr ] { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < <$alias as $crate::io::register::RelativeRegisterArray>::SIZE);
+
+        $crate::register!(
+            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* }
+        );
+        $crate::register!(
+            @io_relative $vis $name($storage) @ $base
+                + <$alias as $crate::io::register::RelativeRegisterArray>::OFFSET
+                + $idx * <$alias as $crate::io::register::RelativeRegisterArray>::STRIDE
+        );
+    };
+
+    // Generates the bitfield for the register.
+    //
+    // `#[allow(non_camel_case_types)]` is added since register names typically use
+    // `SCREAMING_CASE`.
+    (
+        @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty) { $($fields:tt)* }
+    ) => {
+        $crate::register!(@bitfield_core
+            #[allow(non_camel_case_types)]
+            $(#[$attr])* $vis $name $storage
+        );
+        $crate::register!(@bitfield_fields $vis $name $storage { $($fields)* });
+
+        impl $crate::io::register::Register for $name {
+            type Storage = $storage;
+        }
+    };
+
+    // Implementations of fixed registers.
+    (@io_fixed $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $offset:expr) => {
+        impl $crate::io::register::FixedRegister for $name {
+            const OFFSET: usize = $offset;
+        }
+
+        $(#[$attr])*
+        $vis const $name: $crate::io::register::FixedRegisterRef<$name> =
+            $crate::io::register::FixedRegisterRef::<$name>::new();
+    };
+
+    // Implementations of relative registers.
+    (@io_relative $vis:vis $name:ident ($storage:ty) @ $base:ident + $offset:expr ) => {
+        impl $crate::io::register::RelativeRegister for $name
+        {
+            type BaseFamily = $base;
+            const OFFSET: usize = $offset;
+        }
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Returns a reference to the register with the base `B`.
+            #[inline(always)]
+            $vis const fn of<B: $crate::io::register::RegisterBase<$base>>()
+                -> $crate::io::register::RelativeRegisterRef<$name, B> {
+                $crate::io::register::RelativeRegisterRef::new()
+            }
+        }
+    };
+
+    // Implementations of array registers.
+    (@io_array $vis:vis $name:ident ($storage:ty) [ $size:expr, stride = $stride:expr ]
+        @ $offset:literal) => {
+        impl $crate::io::register::RegisterArray for $name {
+            const OFFSET: usize = $offset;
+            const SIZE: usize = $size;
+            const STRIDE: usize = $stride;
+        }
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Returns a reference to the register at index `idx`, with build-time validation.
+            #[inline(always)]
+            $vis fn at(idx: usize) -> $crate::io::register::RegisterArrayRef<$name> {
+                $crate::io::register::RegisterArrayRef::new(idx)
+            }
+
+            /// Attempts to return a reference to the register at index `idx`, with runtime
+            /// validation.
+            #[inline(always)]
+            $vis fn try_at(idx: usize) -> Option<$crate::io::register::RegisterArrayRef<$name>> {
+                $crate::io::register::RegisterArrayRef::try_new(idx)
+            }
+        }
+    };
+
+    // Implementations of relative array registers.
+    (
+        @io_relative_array $vis:vis $name:ident ($storage:ty) [ $size:expr, stride = $stride:expr ]
+            @ $base:ident + $offset:literal
+    ) => {
+        impl $crate::io::register::RelativeRegisterArray for $name {
+            type BaseFamily = $base;
+            const OFFSET: usize = $offset;
+            const SIZE: usize = $size;
+            const STRIDE: usize = $stride;
+        }
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Returns a reference to the register array with the base `B`.
+            ///
+            /// An individual register from the array still needs to be addressed using
+            /// [`RelativeRegisterRef::at`] or [`RelativeRegisterRef::try_at`].
+            #[inline(always)]
+            $vis const fn of<B: $crate::io::register::RegisterBase<$base>>()
+                -> $crate::io::register::RelativeRegisterRef<$name, B> {
+                $crate::io::register::RelativeRegisterRef::new()
+            }
+        }
+    };
+
+    // Defines the wrapper `$name` type and its conversions from/to the storage type.
+    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty) => {
+        $(#[$attr])*
+        #[repr(transparent)]
+        #[derive(Clone, Copy, PartialEq, Eq)]
+        $vis struct $name {
+            inner: $storage,
+        }
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Creates a bitfield from a raw value.
+            #[inline(always)]
+            $vis const fn from_raw(value: $storage) -> Self {
+                Self{ inner: value }
+            }
+
+            /// Turns this bitfield into its raw value.
+            ///
+            /// This is similar to the [`From`] implementation, but is shorter to invoke in
+            /// most cases.
+            #[inline(always)]
+            $vis const fn into_raw(self) -> $storage {
+                self.inner
+            }
+        }
+
+        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
+        unsafe impl ::pin_init::Zeroable for $name {}
+
+        impl ::core::convert::From<$name> for $storage {
+            #[inline(always)]
+            fn from(val: $name) -> $storage {
+                val.into_raw()
+            }
+        }
+
+        impl ::core::convert::From<$storage> for $name {
+            #[inline(always)]
+            fn from(val: $storage) -> $name {
+                Self::from_raw(val)
+            }
+        }
+    };
+
+    // Definitions requiring knowledge of individual fields: private and public field accessors,
+    // and `Debug` implementation.
+    (@bitfield_fields $vis:vis $name:ident $storage:ty {
+        $($(#[doc = $doc:expr])* $hi:literal:$lo:literal $field:ident
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+        ;
+        )*
+    }
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+        $(
+        $crate::register!(@private_field_accessors $vis $name $storage : $hi:$lo $field);
+        $crate::register!(
+            @public_field_accessors $(#[doc = $doc])* $vis $name $storage : $hi:$lo $field
+            $(?=> $try_into_type)?
+            $(=> $into_type)?
+        );
+        )*
+        }
+
+        $crate::register!(@debug $name { $($field;)* });
+    };
+
+    // Private field accessors working with the exact `Bounded` type for the field.
+    (
+        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        $vis const [<$field:upper _MASK>]: $storage =
+            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        $vis const [<$field:upper _SHIFT>]: u32 = $lo;
+        );
+
+        ::kernel::macros::paste!(
+        fn [<__ $field>](self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
+            // Left shift to align the field's MSB with the storage MSB.
+            const ALIGN_TOP: u32 = $storage::BITS - ($hi + 1);
+            // Right shift to move the top-aligned field to bit 0 of the storage.
+            const ALIGN_BOTTOM: u32 = ALIGN_TOP + $lo;
+
+            // Extract the field using two shifts. `Bounded::shr` produces the correctly-sized
+            // output type.
+            let val = ::kernel::num::Bounded::<$storage, { $storage::BITS }>::from(
+                self.inner << ALIGN_TOP
+            );
+            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
+        }
+
+        const fn [<__with_ $field>](
+            mut self,
+            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
+        ) -> Self
+        {
+            const MASK: $storage = <$name>::[<$field:upper _MASK>];
+            const SHIFT: u32 = <$name>::[<$field:upper _SHIFT>];
+
+            let value = value.get() << SHIFT;
+            self.inner = (self.inner & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Public accessors for fields infallibly (`=>`) converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:literal:$lo:literal $field:ident => $into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) -> $into_type
+        {
+            self.[<__ $field>]().into()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>](self, value: $into_type) -> Self
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields fallibly (`?=>`) converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident ?=> $try_into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) ->
+            Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<
+                    ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+                >>::Error
+            >
+        {
+            self.[<__ $field>]().try_into()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>](self, value: $try_into_type) -> Self
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields not converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+        {
+            self.[<__ $field>]()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the compile-time constant `VALUE`."]
+        #[inline(always)]
+        $vis const fn [<with_const_ $field>]<const VALUE: $storage>(self) -> Self {
+            self.[<__with_ $field>](
+                ::kernel::num::Bounded::<$storage, { $hi + 1 - $lo }>::new::<VALUE>()
+            )
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>]<T>(
+            self,
+            value: T,
+        ) -> Self
+            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Tries to set this field to `value`, returning an error if it is out of range."]
+        #[inline(always)]
+        $vis fn [<try_with_ $field>]<T>(
+            self,
+            value: T,
+        ) -> ::kernel::error::Result<Self>
+            where T: ::kernel::num::TryIntoBounded<$storage, { $hi + 1 - $lo }>,
+        {
+            Ok(
+                self.[<__with_ $field>](
+                    value.try_into_bounded().ok_or(::kernel::error::code::EOVERFLOW)?
+                )
+            )
+        }
+
+        );
+    };
+
+    // `Debug` implementation.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::kernel::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", self.inner))
+                $(
+                    .field(stringify!($field), &self.$field())
+                )*
+                    .finish()
+            }
+        }
+    };
+}

-- 
2.53.0

