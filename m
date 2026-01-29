Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010001.outbound.protection.outlook.com [52.101.85.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D993074A1;
	Thu, 29 Jan 2026 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693554; cv=fail; b=t7DPCXjbZtk6kZp5FwSmAL16FruwQjYvUOlELHgzgxC/AEK0yw01UTSj6w1aFoSBQSHaAwwNL6vMD+vRYcCqBWjqWiRalklixUikO48tjfkHeWX/91ZC7k2mMtYv0zSMTNErcTolfRhLIgGJAPdQLAr0rJaa51mquwUL3zRKZ/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693554; c=relaxed/simple;
	bh=dkzuEw31qGUX95GaaYlhqJ3i8VuHE33Lnqv5Skh8PtE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JD3DxOBOm1jsh797WB1IlrZTG5nk0mcMGAEncW5X9xjgQxc4V4lvjpsoRX7d/ezeRfxCYsIyM6VC11ShK0mn9U+fzry/27CgnpZ3a6no2x/iIFmMM3zUl0yD0kmfISL6hPRrerrDaTpYfMJV2pom80zEuzNKg8D7YquUTM9u2kU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uG9hSyCx; arc=fail smtp.client-ip=52.101.85.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uG9hSyCx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkgQKzW/YaL3bz1mHedGbZE6V+9gyhsIT4W7UrCSzz+l5G9O7kncChcYRfqkpBsOtnrj5mdbw/pnwZH2BY4HHrjJlA5faCoWUBhbiy8MBIWWWMJnclVJIvAdiBHTk6hl8PVmsFVXgZhyHjXTdJv/aNDBoYM4PmAWVx4bZEsEqM4P+wLHwf7eoIpG6G1qkuBE8aRE0etZKTjry8ScAFEqsQ0eSfIOwytmz47X8aYKdgcidbjEs2qO6Kkj+8bABU8v0qoaTx5Yw5OyLFmgs8jne/1i+WHOeW9/0szt67XXKvKCJ8h/PdzWD001BnMHUMfrGQqMChzGyldiOCemEpb17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXxG/pJR1S9Wu2Se3FnoEPi63iJcl7H5qAdi7l7Ci3g=;
 b=Pk49ZTtnsXU8BVfdRKDX7CWsEM/5YwOf5cmpMatZxU6aCSrXQl+X6UppM/V9b0SgGIwLZrFegvtY6Nz1TOZLH/2ECKCRqLlzJKqvis+A8Qp2b8OeoeUkfOiMi8DVRxpUL/XJ/2W1DZr+g+MaxvQEDYaln+LDf3yJ8Zw6DSVs6DcGsk2orNnAD6aaaUJLfW6y5c1IzdPbFi9AnT/XueV2bpOLh/k0HJU8HoTnnYHyc+KZzguD1yPATldtVCjr41DtUwwQ1SRHX/izzao2rnqKSke8IbsQXDbdkfxHStfKHnyG7maBEjQB/s7np52t5vBMN6mXtpTSzDCqm3jen3aaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXxG/pJR1S9Wu2Se3FnoEPi63iJcl7H5qAdi7l7Ci3g=;
 b=uG9hSyCxSB+n1gtYhfEJgaqUDp1CiiQX7/lwwNbY9P97glW0M+gY2qB7AgtDqExxDtxYhbgotCXIl/pokTh5ThSzPDvJqXlFkrPcAztb4b/lDJnasDeWjyU27sLKLH+KmSGtAbaFBWwHrbxW1Ejf4uPCVq0AmkCY0vADcw47pLfvYsefaQgZlSXO/kcKt4EbUFwMzgokxLz1cSOnVnxxo3t7U9rP1mX8nd9QZdddfoYhAseL3Uhnf9gZ1IPcXepPeusZ0wJuJS/iJnq4HhR5coauvPjKjGVjOCQ0gCswO7qN0ELiBv4ZoxgXv0byjujWC5AJQ4S51cfQsGDFwrEuVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 13:32:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 13:32:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 29 Jan 2026 22:32:03 +0900
Subject: [PATCH v5 3/7] rust: num: add `as_bool` method to `Bounded<_, 1>`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-register-v5-3-c4587c902514@nvidia.com>
References: <20260129-register-v5-0-c4587c902514@nvidia.com>
In-Reply-To: <20260129-register-v5-0-c4587c902514@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0371.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 8625e3ea-9c4a-4da8-9cf5-08de5f3ad5ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDRHc08rcVIyaUNRd2prNHFzeUM3YlVqdzR0RW0veTQ3T3ExMGZtSXQraWFp?=
 =?utf-8?B?dXZiTnB3SnBkRWx5WllWN1NZbk9mQjdsUTMvUjQyN1hZdlJjQnRJQVRsZ2Y0?=
 =?utf-8?B?OWp4L28xTlR6U1AvbVFtSmRJSXhjbDFXVzZOcnVxNjRxbk5CRkFvRVc1RlBq?=
 =?utf-8?B?UUM0YXkwQitBNjhRVjFtK3BPaFYva0hlcDA5QjQ5YUZOQ1htd096WGRkZmsy?=
 =?utf-8?B?b0wvR0htU3lMOXRKOW45Y05Ock5XSUExVVRMOU5pTGkxQ1NaT1d2WXZCUFFY?=
 =?utf-8?B?QVFCRnM4RzRiZDZxU3ZhREpmRVJVd1hzZnJsU2JNZks0cTU0L0paQU9HMUNo?=
 =?utf-8?B?bjlHNWx5NUN6Tk5YelVVSmROMkk3MUdPTEpPcDFmcVpIVG9ENDFRakYrOHZt?=
 =?utf-8?B?bEplOTAyU2hnZmYxRVd1ZjZKd0hxUGRWaDZiSGx1WWQ1L21odXNpOTlzdm9B?=
 =?utf-8?B?WTNKbWQwajNYV3d2OHNIS1pIZy9HcGVYNEJqYUMyeTNxazNXaHYzOU5vVHM0?=
 =?utf-8?B?K2hobXIza2dpbjdWUU1keFhFa29ZNUlqMFNVbjc0R1Y4SlhYUld3UGdFKzg5?=
 =?utf-8?B?eVdzcWRFbEFWQ2d6VkFiZUxReE9QanQ0ZXhWczh1dUJCUm4ySDRlS2Q5bWNN?=
 =?utf-8?B?ZjNQUFpWMkZYeVRxaUdVbU1ISGlqVmhjaExXSnFUeEp2Uk1OZnlocHVyUkh6?=
 =?utf-8?B?WTJuREE0U1IzR2Mva2U0bURNT1J2V0h1UkpDMGVmUmhMcXE4WHQwMkFKYWdh?=
 =?utf-8?B?MUdVUGx3aXE2RzVNaHM4NENkQ21TaER5WjV3YmpWNnpUdzRBc1ZvSUQ0engv?=
 =?utf-8?B?YjFiVVg5aVRBYmNkKzVwLzJQWFcrRlNIUjN0ZFE0bVhTWDBKUDNSNm90azl1?=
 =?utf-8?B?Z2xNQkRTancrakxCUXB1amVvd1BtQjBTZG1EM09TQTY4ZjJxenZEQ2h1ajVX?=
 =?utf-8?B?OGZUM1BwU1cralI1KzFIZDN6SkFVZWdNdWZDYWpianFtNDRoOUhLYmFraDlW?=
 =?utf-8?B?YWZ6dkxLdXhLckV4ZEcweEFXL0ZpZEsrVHZPMmpCWnlBZVJMVFFsR0hyblZF?=
 =?utf-8?B?VFVUSEYwYnRQdkFpTXE0OGNZbFNTbDBGN01CdmxKVHQzcGVVOVk1Q1A1TFFJ?=
 =?utf-8?B?bS9yblFoQmw3ZWFzQmJRbEp4ZnhicThXMzlmZG9ncnpyOUhtOERqMk1UTUUw?=
 =?utf-8?B?aS96d3FBYlA1alJ4Q2tuMGpmTXlkck5ETGxPNVdLVVdhcTErVEhFb2Vuclhj?=
 =?utf-8?B?bVpQNzk3SkI4RGRTM2VUeGdTOVB0YXBXL3VSNTVwNzI3UHZPNERTWGFQZ015?=
 =?utf-8?B?YitkZHEycHJXU1RjVnBhRy8rVTJUMk5oRDd5emNXTHdsdXZFOGlsOHVpUWlj?=
 =?utf-8?B?OFRrZWhsVE5RUUYwRUpSZk1COFM2MDBrR3drbHJsaXQ4Sld4YVg0S2E2Nit6?=
 =?utf-8?B?K2FtWDA1WVVjQnBxUDZ4dXNoOWQ2eXdmZHVhUGovUXNMRkYvbkJXUWw3R0dY?=
 =?utf-8?B?R3VMUllldE1lUGI3SkRyc3E4aUF4aUFvRXFzeWdDZmZwVDJmMmVZRUxaemxo?=
 =?utf-8?B?a3Z5Y0wybVlobFdIU3R5VmI0dTQrdTY1QmQzVi82K05iTXhMTk5PUnJRR3dw?=
 =?utf-8?B?N2EzVzFzTzE4WWhGaThEU0ZlQTBHczUyTnVRTkMyL3pFTmFnaGdpcnJ5cnUr?=
 =?utf-8?B?K0M1VDdENm5SUGh0cE1KdlZVaUVZRThtK1RoK2pBYlpMKyszcVgyV3poT0Zi?=
 =?utf-8?B?UWpJTUhjeUJiQkNkeHl0bFNEOURSbXlRSjc4Z0YvbkgxaUNvN1ZJYXFzYnY2?=
 =?utf-8?B?TVAxYldsend1b0Y1NVphLzdPSXNEeGFxS0N3YmQ5ZEd3d2tJRjI3WXhoOTFI?=
 =?utf-8?B?Q0U0b1p6bmN1TmxIekFaSUxRNUpyQStYbEdZcTlJZFluMlVsbWhXQ3dqMkJU?=
 =?utf-8?B?Mk14UmpyS0ZOWWdzNjd0TllqMUh0N0RhQmhuS2pxWjhueG9DbWVHYmtZSEtH?=
 =?utf-8?B?RHJ1SzQ0c2lyNDFQbmhTTllKbkpSYXd1dSt6bzRiZUZhUzRwMEw2Nm1pWi9Q?=
 =?utf-8?B?NFBPVyszN3Vvc2pRMGZMS2lIckZIVHBzaGhaaE16VkI2M1F5eTZEV3RIZFdY?=
 =?utf-8?B?SGUvbCtOaTJUZlk3MmIzZ2prZHo1bVBudXdkZTkyVEtkQWtCRzhGdWc1RUlh?=
 =?utf-8?B?NVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VElXTVg5RG5GMTJ0V28ydmNHTjVoUS82cDhQOFBDbTNQVUM5aUl3R0xYTkV4?=
 =?utf-8?B?a3pYUktUdXBhQmVjUXRZdzYzTnNKbFBKMnY3MHArN2x4QWtPRkZHbnE5ck1m?=
 =?utf-8?B?alRBbFZkSlZTT0Jpak4wYlhiMlFSMnBtRk9RU0l1U25pbHhHVGZ1MEFFT0VV?=
 =?utf-8?B?bk5UNlJab1JNMDQxZXlxSzR6TUNEVlc3RExjc1FKM2N6azkrY1hIcnF6VXIy?=
 =?utf-8?B?ZU01T2VBYUtEZTdBMzV2bFE0Z2YySjZZSXZqcWx4aXY3b25NcFFteFNxNU1L?=
 =?utf-8?B?cnFDVmVxMW1RYlZmZThkVHNUaFVhL2IxVXBIaWwrRVZscGp6ZEJrSGlIL2lC?=
 =?utf-8?B?dndwaTlTand0anROZFdBWjhDN0pFOU43S2liR285bjJGK0VGc3Q2eDlTcVlu?=
 =?utf-8?B?c1ZPS251dFkzNGg3cWwzY1ZyZmZRd0w1bmJXWWV4R21nOGxLRUV2UkwvaE5E?=
 =?utf-8?B?MUExTUd6cEwzK2ZDVmNMb1h6aWlMNE1zMGZjREtHRWxTNStlK2psNmk1YWtj?=
 =?utf-8?B?MjNlRVYrL3picVpSSzFKbXFMR0xBeWp3YkZkcGd6YUJmUjdPWlpiSWFVM1Mz?=
 =?utf-8?B?eUM0bVNxdkdLYzY2VTFjMEZiTXRQc1Z3SFVKSGEzL3AxNmRPL3BXR0lWNWp3?=
 =?utf-8?B?K0o2QitRVGIvN0R1a3R6L1o2T3BLKzQyZEJYRDQ4Z1BrSVRtdjFqaUQxT1pt?=
 =?utf-8?B?UkwrOFlNK09PM2JEdjJ2OG0yYzZkTjBMNzY1RndrdFA5MWxSdjBrTnZjK29h?=
 =?utf-8?B?ZTdmZ0wzeWYrSGp5SEsvTG1Iem9aeHdxb1R1cE5CRnZDTGN6Y3ZQYUVucXdQ?=
 =?utf-8?B?bkFmNWlnTm1Ua1hEZ2xrWmVlcnBIRXBNbDZUeDFIRG5ONDdocEtrZ1lwc1ha?=
 =?utf-8?B?R01ZRzFoaHh5cVRJOUl5Z00xYlhFREdBdnpBaEpoMkRoOTkzSGZGTzl5U0lT?=
 =?utf-8?B?LzRXZnB6MzBXN1IrOGZTLzBGRFIwQWtwemZOMGorMExDYkVLeDRQcHRLdTFh?=
 =?utf-8?B?WWV5aTFtUXVuc2xMa0t1NmtZY0NmR1NSTjl5TWIxZ1AwM3g0NURHb1JWVXBH?=
 =?utf-8?B?L2tiYVQzUzZaY2prN1N2NEtnanVnWmM0UHlFZmtRbnlFVGp1V01FRWpoRk9U?=
 =?utf-8?B?VlE2eGRBL2pUVjFGMFE2L04rVndjZ3Era05tb1FSejFHekhtVjR4K1hvV2dU?=
 =?utf-8?B?ZzhDZThpVHdzZ015R3NPdEVBN2xsbTMzazhQNWVDM0MvZjFrTVBLakNuZlph?=
 =?utf-8?B?czNXRkFET2pud09xRzJ4SG5HYi83cVFoaFY0ZlVRd1locmtHeVlnY2wxTDdu?=
 =?utf-8?B?cENnOUZuaVhKWTZ5Ni9OZUlWajFJSDNhQ09pZ3cvNXJ2STlJSzBOMzZCbnR1?=
 =?utf-8?B?UVZqdkxuY3Z5bndnVXR3NDAvN05jeGlIUFlXK0NwUGFtYTNtSEFZdWNMbE42?=
 =?utf-8?B?NDU2dGJtdWFnTDdwOTVvRjZuamQ0MlRzV2grQjkybmFmbkRYT0ttdFJVNlZP?=
 =?utf-8?B?VjJHMGUxcXVoNG1GREdZQzMycjgwK3NqcHdPU2ZQQkc4ZEg0ZUUycHYyOHd3?=
 =?utf-8?B?cTVXSjVJM1JsVnBQbVpxMXM2ejlRUFZVNG1adE8xbm0vQVJWcTd4anRPK3FM?=
 =?utf-8?B?Vkh3VEJYUEVZZTFDOVg1V21vYzZRdy9ERzUzRUFSVWpZaFgxVHk3Zy92ZlZn?=
 =?utf-8?B?QytQclB5V1o3MjhuNm00Nld1YnpuOWNPT3VEYW13WGFtNTdtSXVtWS80OWIr?=
 =?utf-8?B?NVZOeEVzZFBpTFhZSE94ekMvZVg0ck90SHM0SFIxUllNckxxNVBVN3NnQUJa?=
 =?utf-8?B?ZHRaTFJOaXM5Ly9sRXA2VUFEV1NSMWFCcmR4UW5IUkIwblZqR1djV1J4eDFO?=
 =?utf-8?B?Y01PUkgwRndlbEQrTThrdFBLYnB2K2JZSUNMWWFHWXM2dnZySDFJbTdKblNj?=
 =?utf-8?B?RGhjVlRqeGtXSjJpb2V2VlRycW9MMzd3eDg5NUhhN1VyWk9LSDlwWmllUDNu?=
 =?utf-8?B?RlA4bUg5QXZ4UTRIZlA4SVg1RjRldkE0Y2xPTERET05kWTJ6citIbHoxQnQ1?=
 =?utf-8?B?cWI0cUdmL3l4K0NLZXNJVWd0ZWg5RTgwY0FFSFVOVzNkL0ZuR1hwTUdMMDN6?=
 =?utf-8?B?eUd2cS90ZXdud1k0bUNKdXp1U0pacnVZbFRzK2JBeks2UXJSb0s0THVBSmdx?=
 =?utf-8?B?TmdqNEljenp1VmNyQlBwMzNXMmUvRXVURGRjcDhQRFgwcmNCYUNBK1lWM1BQ?=
 =?utf-8?B?a2pnVDRVanFqWkIwejY2Zm1kQ01tcXBqWlgzMHB6Umk2TEpUWldKM0dlNzZY?=
 =?utf-8?B?dzVaRlR0VlZwcFYwb3AvS2c1YlJiMCtXNXg4RXNBS0ViZDdkOFYrUFhpRlRM?=
 =?utf-8?Q?lbkgB56vXLnRPq4gOrR+c3Gh9GRLQ2ZjQ+5X4GVMNFsx2?=
X-MS-Exchange-AntiSpam-MessageData-1: f9ioFMCNWGUsrA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8625e3ea-9c4a-4da8-9cf5-08de5f3ad5ee
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 13:32:23.8054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKRYYXEdhhDbp/tPDqvjIQPGF85G4Uzljujsz4jH1y9jeCFMImdScNdMc7+U7UPH8R3d2PRFItrCUcwHuCbchw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770

Single-bit numbers are typically treated as booleans. There is an
`Into<bool>` implementation for those, but invoking it from contexts
that lack type expectations is not always convenient.

Add an `as_bool` method as a simpler shortcut.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 4b929762d5c2..b41ca6df1525 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -1098,3 +1098,24 @@ fn from(value: bool) -> Self {
         Self::__new(T::from(value))
     }
 }
+
+impl<T> Bounded<T, 1>
+where
+    T: Integer + Zeroable,
+{
+    /// Returns the value of this [`Bounded`] as a [`bool`].
+    ///
+    /// This is a shorter way of writing `bool::from(self)`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// assert_eq!(Bounded::<u8, 1>::new::<0>().as_bool(), false);
+    /// assert_eq!(Bounded::<u8, 1>::new::<1>().as_bool(), true);
+    /// ```
+    pub fn as_bool(self) -> bool {
+        self.into()
+    }
+}

-- 
2.52.0

