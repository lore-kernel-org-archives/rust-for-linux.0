Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B7644DB90;
	Wed, 21 Jan 2026 07:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768980286; cv=fail; b=jUzcqafqGQXayMIt/+QnTWDExxvyDOAcv5NQFioRQyE+VLLy3E5cKyscRVy9RspLBSYmlIDUYL3Dvi2KLxOR/d05Qiot+hiR6RdG9xkLsZOJ+HTXIObmfeXjfzxbuHaMi12TJppsf0P+cgHLR5jvjzp4oOEl6Q2ToLt0b3/FQbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768980286; c=relaxed/simple;
	bh=OZSnsue5KumOrYn7Pc0Dhn4Tsp9VEniSIyfvaFUVmws=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KH3NX8gBXhDpiqVfWM7dcU/3l8e+HnPE+wm48psHe1/3oUfHqowJz46sZuQsWzHXeYQC2CO3O9r5GQUTq18d7SR9Ix91MnDJhzV5w03OhKIAF4eF0QllaTw5FpmNkTPg2FWjniK9B/FUcjWJtGxzIb3+t6cwQk6Z/7X+f57+zvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KFr1qbuJ; arc=fail smtp.client-ip=52.101.56.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KFr1qbuJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agEuxRiyAT3X0YxBwtr/MZ6usV52/nd0sJAu7BOCh5bcvJgEqYV1FSW/y0tN9sVAUJ6eDGbdqUxZLKaXRQ/GT15QQ05Nzhk/TYmJPpuRB6IDGakqo2cMe+GTb/igfMusYx3Jwy+SSufu8qOYbkjOa4exAyRZKRl36ZzyM8lvhY1Nzjoz5s3N5E0y2R4boKLP9TexDYj0feMcnEwPRLqK33xVjaPHc3XH6BDvs4ipIzEvysiH/jb3BwNrVgqxcesAKfSWajVHIt87moCYqSKDYaJVm/5h42n7NjPZX6RYssf4OFVTQP7Qc1o+UME7GXjQfIm9d6djzxylOHsu/4gnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnB3HZNg0ZspWQ1GRTdMW8Go0AZBwJJpS4CdH11xN4g=;
 b=ZZqyCgjvUEaBQPidAJs3wuJcYgwRHClE5XK+/LiaqdVkCfWo39qn/UoBClNdClEuPttBsOYB3/zwPKfomcGWP0N5uBjQXEkyI8NYFUg+zmzSdhE7Jn7TVoyZ/yb4CUTtmodPBH1gpPU/YCfMpA1ptnCw9ZpuYUKVxEfI9yKuFksYbTazaNORc31UfhjtSMd8piktt+Lhl0FVcUiM1iP04OI2wE10EhPpWwOE1F4eoSVAA6eFuyoiwZ0PKrtrzW1t7XgTxmko3ySMRlXDrZfRxkxrAmUwsvtOe3mqz6COSHBZG6H02XM1GlYHYCJgzY82rwhj7EuTbRbxi46CjDddCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnB3HZNg0ZspWQ1GRTdMW8Go0AZBwJJpS4CdH11xN4g=;
 b=KFr1qbuJkknPQVCwkcbBr9Lw4e9Sl7KBufyhfsfOuzecks1nU4j0y7POoKfdh8mUiYX879ox5pji2hsdnuVAtNlpuuqql9CGUr8Gcmqyjdadf3tYec9B8nz5+oO+s6BRnloKUNmkxWVNih3zgwRqgxxBYHwfhT0QUaE9/BDe04BTmMMVsKBjfC9bGkP0nSHUgfY5uOhZ/OCI1rL0jvF4dkVRFpvRAth2LcEzy12Hwp8LdrAoZj4b9PiJf/fo+H/TZvq8JQIXSHo01LB7BFEavzGygoYcweVgDCKlttDDkmRDNsUJiSP/4U1Kqo/6w8ffmX9xwMSdtlpl3ySDvq09Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8272.namprd12.prod.outlook.com (2603:10b6:8:fc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 07:24:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 07:24:32 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 Jan 2026 16:23:57 +0900
Subject: [PATCH FOR REFERENCE v2 5/5] gpu: nova-core: use the kernel
 `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-register-v2-5-79d9b8d5e36a@nvidia.com>
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
In-Reply-To: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
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
X-ClientProxiedBy: TYCP301CA0060.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 664b5bbc-66db-46dc-d319-08de58be1f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnlUY0FhS1pDcEJ6NWdYV0JRdDFvaXhGRXRKVlk2NEhud1ArT09DelorTStP?=
 =?utf-8?B?eC9KcFh5TU5Na3lMbUs0MWFHTTZtbkVnQ0Q3UmdMLzlrenNpdURRbW13bFor?=
 =?utf-8?B?cTIxQlRNZjM5dGU5akpvSmRtZnpNWUVlQytRbVhGbkZTbkhyTUJUa3JnYTZH?=
 =?utf-8?B?a1huQ3VNQkZza1p4ZXF1bHRmcXY3VlBJSjhZSUxTUVNpVXBralFWclV4dWkx?=
 =?utf-8?B?RGRacm5MbTZMVkxOS0ZDbExPeWY0N0VhaFJVYkt0VUl2RTJTLzlER3RRNDQ2?=
 =?utf-8?B?NXFIcWN2NGNIVlZXTnBEQitzVVV0RnY4clBmbHQ0aDJ4MllNY1kyazdjTng2?=
 =?utf-8?B?R3lYZVVMVHpIcDZZS2xvUkh4L3BXa0tzV1F0dFB3dXhWVmtNR252UHVBazlw?=
 =?utf-8?B?cExDc2lHdDdSdTZYVFBQUDI4OWxxdE1Pa1BFc1ltRkkvaDI3ZWRES2VGSTZl?=
 =?utf-8?B?SmV2WU5jR2NNa2wvYXROL2RjNXpUWW9jSTZwWjU1NldCV1Uxd3FlZnVwb2ZO?=
 =?utf-8?B?ZVo2UE9PdXNUTUdROTRicE9jc3ErOVRsYXl3ZlF2QVhiSFVsSmFKK2J1Yi9X?=
 =?utf-8?B?VnlSVWtPVmdUMUpNZ0dRTTc3ZEE0Z2t5MFl2amcyL3BSaFU1eG1wLzV3VDJP?=
 =?utf-8?B?Tko4VmxySFZ3N09jeklKdko3a2tMazRrZUpMWHNDczVDNitrLzVzSHNsajNY?=
 =?utf-8?B?ejRhL1BiVnNIbmpYeHRtVWloQU01Q3RjUmpFUnNqRVRocS9MbDF5Q2d4QkZP?=
 =?utf-8?B?MUVWT2o4SG1kanY4dCtkK3g2T0Z1RXpOYWs3Y1djTnVrdGhsRmZKNUgxK1JS?=
 =?utf-8?B?eWl6R0d0UU1ORFNLQysrYUxiQytKZU91ZTNKZ2Y3NWtiQ3doZUtIc2ViUm1R?=
 =?utf-8?B?UWN5dTFWa2JuVXhGV0JoL1ZXNjhQOGpBRXo5VzJDV3FnQURaT0l2eVA5U1NW?=
 =?utf-8?B?M1BmQ3JnTTIvSFZQZkxPSWhwTHJZcmhTYXdWdXlnbWR1Y083RWk0cmE2VUxh?=
 =?utf-8?B?a1VENng2aXRiQnBDRmRJUHkxQ0tnbVVhTHVtc0xDK3g3d2dyU3IvZE9NVDBs?=
 =?utf-8?B?QkQ4dnYrVzBPQVRoZnlmcGFpRitFdThZdlRaTnY2NC9yQkI3cmszamlPSzZl?=
 =?utf-8?B?bnpmRFltak1oTlpSaDFKdHFFZWdseUZBSzBoczREK3JpWnBZK2x0cTcvWkxF?=
 =?utf-8?B?VnJuQ0tkb1c3ZmY3ZkNVMlh2MDdyVWFPVU1aSDNrbmx3MDJRblF2Q0lBS2pY?=
 =?utf-8?B?cm92ZFFrS0xoODRwNzh4QWZVUVJaSlhvVzBRYTltS2NmU0NOR1dYcEZhVkdO?=
 =?utf-8?B?SzJnWXNJU1pNczFqVUVUNlAxUGhUZDZBVi9CY3p1N1dnZEwwQ2QwZmdOMk0w?=
 =?utf-8?B?YlFCUVcvMUViTHpkaS9HNkpzbUR4RWFIWUUyK1BpMEVlTndRVGNmbVp5Z0pN?=
 =?utf-8?B?aFIxR0wxRWVZdlI0WHgvdytXTFlZdVRwN0RrZVozK3hlc1diS0g4aWErdm4v?=
 =?utf-8?B?eW9FUHVXTzFwdHRaZHI0S2RRWndQSk1LOTNIM2EzRlBRQXJYV0FYSFNhN2VW?=
 =?utf-8?B?RmtzRTRhT2JVVm9vdkhUMTFQL0xtekZycnBGa2V4YXQ0OHdjNytRQUowbmdu?=
 =?utf-8?B?RmNaaVg1R1NEVU85MGZPTUpsNXRyYzRybklEQThCNUxHODN4Y0Y4am9KQnJU?=
 =?utf-8?B?Wm0zVEFNcmg3RHVFOTZFWE1PYzIyS1lhSCttcUxaVnp3eE1lQ090V09DTU9p?=
 =?utf-8?B?N3NPMG9RK0p1MTVVKzJhTlM0dEZqalNZYWZmTVhJUFI4K3ptazJ0bFdIbG9p?=
 =?utf-8?B?QmxUaUx6ZDVoTTJxaHpRRkxqNVpQcElRalRHYVVOWWo1V3N1Y3RqdExuQmZS?=
 =?utf-8?B?Uko1ZkE5Tk5qYTFheG5rK2hnbG9DTzRvc2hBRkJCRnRjZ2dWVHVaNHkyR0kv?=
 =?utf-8?B?Smt2NUgvYTB6QzhabHN5OThtM0h4R3pGcEtYalF5ZFhDcWZmTE5vTXdDOGla?=
 =?utf-8?B?L2FRR2hpMG1jZ0NQdFZEMmpVMDU2NE5OalJsLzFpTFFJeXNQL1l1aHlRTGxv?=
 =?utf-8?B?MHRDMTBCci9Qb0UrK0p3ZzRVeXROSndtZWlGVTJZUUxua2x6WmtoNTNESG1p?=
 =?utf-8?B?OXAyYXM5UG5UQkJNOHJqV3BzU2ZEWkllYmo3NS9LRVNQclNyc200c1dCMDgz?=
 =?utf-8?Q?mGEzWiLIahs8osYtH/uZT7M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU5yaHFDZTVVdEVRakQwUDBzMmJDekVyOGZxSmhlVjVkYnZkVE1NZlVoOU5a?=
 =?utf-8?B?dDhKOG14bWVxLzVhTEVzdnJOWTVORjdPR3FkZHpnWE5lVmVZWXRsU1JVbTJt?=
 =?utf-8?B?QWxIREI3TTJWYW9qNyt6R2JPNEg2WFFsL0pxWlV6bmVyQk5sQUlLc0RtN0dp?=
 =?utf-8?B?UDY3V1dueFpOVmhCeUg5d2tBZ1hENnVwN0kzdDQ5MEVIRHdCSzFPU1hKRk1B?=
 =?utf-8?B?R0QwQTg0RUtQS3M4M0V3RHA3UDlhUXVIR1Erb0N1U0FFamkrczNWU0pvNk1Z?=
 =?utf-8?B?Y0NoQjR2bkNqUllLSW5FTVhtcytKN1pYS3c5Qnd0TzQzcVB1NEF6OHJOb2Vk?=
 =?utf-8?B?cWZxb0NFS3YrSTE5MVEza2hnOWxWRjVTMlg1aXRoVXYzUExlU2dPelNJSHQw?=
 =?utf-8?B?d2pndlFLZ0pOZUY3UkRyNTBHWkxtdU0yNTdUa0xnWTM4U1IvMWJ5NGVYUUpO?=
 =?utf-8?B?UW5pNXRJRTNLMVpHWExKbnBGcU92QzkyQkhJbVp1eThrUUFKSDFlM1R5VUQr?=
 =?utf-8?B?YkdRMCtpVDdBbUFtaW84cmZTTTVEQjRHWWYvZHdBcmhlK3pUWkVDOTRnTml6?=
 =?utf-8?B?ZHdCeFhGU05jajFPRWxVa3UwRlhaRVk2c2orZmdPVDBOK083eVVoQmVYR0VG?=
 =?utf-8?B?UTFXUDMvY20zVTFqNDI2WVRWL0I2U1hnRkt1Ymx1b3NWWE44ckFkbW9pemJn?=
 =?utf-8?B?bGgvT1pOQkdlVmxHYzI5Mncrd3p2UWdHU25qZUluVVFMdW9DQ0lTalYvMDFz?=
 =?utf-8?B?QVR3WXpIQU1hTlM5UHRnd256ditUS3l4cG1wV1JFa1djVkU0SmE4b2M2OEVB?=
 =?utf-8?B?YVRzcm5ER3VQTUMxWkxLVUxVWHAySGgyeWh6ZHdiVDdtZWtLY3JmanhEeUhy?=
 =?utf-8?B?YWNMZ2tZTE9aK2ZRK2wzNGhlRmVIL1FiVmpLNS8rQU01dTBZaHk0OG1oUzY5?=
 =?utf-8?B?RHZHakVzZ2tTVzA5elp4YzBISlMrQ1ZQVUt2Z0gxUTZXOG1aOWdnbkg2TWwy?=
 =?utf-8?B?dWt0d3FSWkFZeGloRFQ3a2FoM055MXFqSTJ5NFk5M2pYOG8yakRCSFprZXFL?=
 =?utf-8?B?MzJJZEJ3NzluamZHdkZzOVowVFhvdmNkUjUvU2VKYWJ5VUlZbDlmb2paSGdx?=
 =?utf-8?B?UEtmS3pNekNJV0R6VTZkdUxOQWx4U09YOHB2RmtFQlRXWVdsNm9YOHQ4ZjdJ?=
 =?utf-8?B?THJZdW5JL3M3N2RSRXRtMUdIUnJYZjlvMkEzYnVST0Vtb2xEN1YyakczVVJm?=
 =?utf-8?B?U1BMRXNoNzB5TEdJbGoyeTBzTmtXUlpybGNBaEsxUzEvNTdhRDkyaHBRZjRx?=
 =?utf-8?B?VU92MUM2ODRCbXRLeWM0Y1VjWHdlRWlrMmpjQjBaMWlYQ1kxLzZFWjFDTG1E?=
 =?utf-8?B?aVNOS0g3KzhFblBYeTVsRWNiNzNROXJZc05UUUNZUlVrTTFMWUt4WW5qT1Ns?=
 =?utf-8?B?dVMwQnN5aFhwNW9wSWI1c2JVMDZaNFpIWi9XZGFTZVRGdXoxMXFFc0JzVHNz?=
 =?utf-8?B?V2IzRVpJM2J4b0xQbHFmQ2lyZVlJWWZzVHgzV01OK2ViZzlFUWVyeFU1Ui9U?=
 =?utf-8?B?UHRzOGw3am9qMUpEQzZXN0I4b0VnNXJ4dXhRcXQ2RkNvZll3NlpWV0VoeU5G?=
 =?utf-8?B?KzhpU1NkQ3hIZTBIUlRTUkFuendpYUZaL2kyeFBVUDRTd0ZQb0k1elhsL1N5?=
 =?utf-8?B?blVoUjBQajZGT1l1dGxhYnFWdlY2cWkxaFEzL01TU0ltSnpFb2lWQ2trdWQx?=
 =?utf-8?B?YjdkTDdjeXNUeFR3SlZRTUJqWnNacU5OVHVVdG04K1hoQmtiWnZKbDdHNlF2?=
 =?utf-8?B?NXlmWHpNUFp2MEsyblc0RXRqSGYwNDJXSGY2MGRRaGdRS1dDV0tJVnZtMkZH?=
 =?utf-8?B?L0xEeFdtaW1ETWJsUWNDNWk3NWQ5UWhZL1RXRnhBUTFac2pyZXFGaWpnSzUz?=
 =?utf-8?B?K29YYWxGY05tZnROd0VRV2ptdzByUG1xbFZONUZoeEtjZ2gxTTd0cXFvR0tx?=
 =?utf-8?B?TE1xQU1LRW5KK3Y2bmNGOWVqa0krcW9RT0FEYjVLQkNqdm0vK2hrTExyWFNz?=
 =?utf-8?B?Z2xhTEF2OXFkdGgrR3ZHMzlKdzlucm5uNWNibDFra1ZYeVZVWUNuOTFXOGE5?=
 =?utf-8?B?YTl2L0RLaWpuTUNWOFcxaHpzTE9XekRiMkh6WDcrQlB4VHhSWU10R1cxdXJM?=
 =?utf-8?B?blhXRGxySTBtK2plbnpLMENnUUtqWHBQUUlDSWV4M0crYUxEZy9RR2paVlZ6?=
 =?utf-8?B?OWJOaFJvZWlBcGl3V2tFdDVrZVREQ2hyTkZjdDZGd3NwMzFPODVhZ3U0Y283?=
 =?utf-8?B?S2E5NUh6TU15bkJ6eFlJSzRIMEE0Y0VTZ3orKzVCQk9lQUtuNmVpWVRQcXZB?=
 =?utf-8?Q?e2fhWdPLqlyZ6k/0tauCAtasR9efF3T/vPoMKEsh65r15?=
X-MS-Exchange-AntiSpam-MessageData-1: eY4IZHtLvuEbCQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664b5bbc-66db-46dc-d319-08de58be1f3b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 07:24:32.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWrIq48WgHFc8A09ehX285jiWxsN5AAZownjaACJhPcUFIcwoQJCE6uMBcW0Ejlc9T29vDDS6GIblkNB8LTH2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8272

Replace the nova-core internal `register!` macro by the one defined in
the `kernel` crate and remove our own private implementations.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 127 +++---
 drivers/gpu/nova-core/falcon/gsp.rs       |  10 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   5 +-
 drivers/gpu/nova-core/falcon/sec2.rs      |  13 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   9 +-
 drivers/gpu/nova-core/gpu.rs              |  24 +-
 drivers/gpu/nova-core/gsp/cmdq.rs         |   2 +-
 drivers/gpu/nova-core/regs.rs             | 265 +++++------
 drivers/gpu/nova-core/regs/macros.rs      | 721 ------------------------------
 9 files changed, 220 insertions(+), 956 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..2d0c4cbd9e67 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -9,12 +9,16 @@
 use kernel::{
     device,
     dma::DmaAddress,
-    io::poll::read_poll_timeout,
+    io::{
+        poll::read_poll_timeout,
+        register::RegisterBase, //
+    },
+    num::Bounded,
     prelude::*,
     sync::aref::ARef,
     time::{
-        delay::fsleep,
-        Delta, //
+        delay::fsleep, //
+        Delta,
     },
 };
 
@@ -27,7 +31,6 @@
         IntoSafeCast, //
     },
     regs,
-    regs::macros::RegisterBase, //
 };
 
 pub(crate) mod gsp;
@@ -35,11 +38,12 @@
 pub(crate) mod sec2;
 
 // TODO[FPRI]: Replace with `ToPrimitive`.
-macro_rules! impl_from_enum_to_u8 {
-    ($enum_type:ty) => {
-        impl From<$enum_type> for u8 {
+// TODO: macro that defines the struct and impls, like for Chipset.
+macro_rules! impl_from_enum_to_bounded {
+    ($enum_type:ty, $length:literal) => {
+        impl From<$enum_type> for Bounded<u32, $length> {
             fn from(value: $enum_type) -> Self {
-                value as u8
+                Bounded::from_expr(value as u32)
             }
         }
     };
@@ -47,7 +51,6 @@ fn from(value: $enum_type) -> Self {
 
 /// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
 /// register.
-#[repr(u8)]
 #[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
 pub(crate) enum FalconCoreRev {
     #[default]
@@ -59,16 +62,16 @@ pub(crate) enum FalconCoreRev {
     Rev6 = 6,
     Rev7 = 7,
 }
-impl_from_enum_to_u8!(FalconCoreRev);
+impl_from_enum_to_bounded!(FalconCoreRev, 4);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconCoreRev {
+impl TryFrom<Bounded<u32, 4>> for FalconCoreRev {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
+    fn try_from(value: Bounded<u32, 4>) -> Result<Self> {
         use FalconCoreRev::*;
 
-        let rev = match value {
+        let rev = match value.get() {
             1 => Rev1,
             2 => Rev2,
             3 => Rev3,
@@ -85,7 +88,6 @@ fn try_from(value: u8) -> Result<Self> {
 
 /// Revision subversion number of a falcon core, used in the
 /// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
-#[repr(u8)]
 #[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
 pub(crate) enum FalconCoreRevSubversion {
     #[default]
@@ -94,30 +96,27 @@ pub(crate) enum FalconCoreRevSubversion {
     Subversion2 = 2,
     Subversion3 = 3,
 }
-impl_from_enum_to_u8!(FalconCoreRevSubversion);
+impl_from_enum_to_bounded!(FalconCoreRevSubversion, 2);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconCoreRevSubversion {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
+impl From<Bounded<u32, 2>> for FalconCoreRevSubversion {
+    fn from(value: Bounded<u32, 2>) -> Self {
         use FalconCoreRevSubversion::*;
 
-        let sub_version = match value & 0b11 {
+        match value.get() {
             0 => Subversion0,
             1 => Subversion1,
             2 => Subversion2,
             3 => Subversion3,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(sub_version)
+            // SAFETY: `value` comes from a 2-bit `Bounded`, and we just checked all possible
+            // values.
+            _ => unsafe { core::hint::unreachable_unchecked() },
+        }
     }
 }
 
 /// Security model of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
 /// register.
-#[repr(u8)]
 #[derive(Debug, Default, Copy, Clone)]
 /// Security mode of the Falcon microprocessor.
 ///
@@ -138,16 +137,16 @@ pub(crate) enum FalconSecurityModel {
     /// Also known as High-Secure, Privilege Level 3 or PL3.
     Heavy = 3,
 }
-impl_from_enum_to_u8!(FalconSecurityModel);
+impl_from_enum_to_bounded!(FalconSecurityModel, 2);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconSecurityModel {
+impl TryFrom<Bounded<u32, 2>> for FalconSecurityModel {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
+    fn try_from(value: Bounded<u32, 2>) -> Result<Self> {
         use FalconSecurityModel::*;
 
-        let sec_model = match value {
+        let sec_model = match value.get() {
             0 => None,
             2 => Light,
             3 => Heavy,
@@ -160,24 +159,23 @@ fn try_from(value: u8) -> Result<Self> {
 
 /// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
 /// register. It is passed to the Falcon Boot ROM (BROM) as a parameter.
-#[repr(u8)]
 #[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
 pub(crate) enum FalconModSelAlgo {
     /// AES.
-    #[expect(dead_code)]
     Aes = 0,
     /// RSA3K.
     #[default]
     Rsa3k = 1,
 }
-impl_from_enum_to_u8!(FalconModSelAlgo);
+impl_from_enum_to_bounded!(FalconModSelAlgo, 8);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconModSelAlgo {
+impl TryFrom<Bounded<u32, 8>> for FalconModSelAlgo {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
+    fn try_from(value: Bounded<u32, 8>) -> Result<Self> {
+        match value.get() {
+            0 => Ok(FalconModSelAlgo::Aes),
             1 => Ok(FalconModSelAlgo::Rsa3k),
             _ => Err(EINVAL),
         }
@@ -185,21 +183,20 @@ fn try_from(value: u8) -> Result<Self> {
 }
 
 /// Valid values for the `size` field of the [`crate::regs::NV_PFALCON_FALCON_DMATRFCMD`] register.
-#[repr(u8)]
 #[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
 pub(crate) enum DmaTrfCmdSize {
     /// 256 bytes transfer.
     #[default]
     Size256B = 0x6,
 }
-impl_from_enum_to_u8!(DmaTrfCmdSize);
+impl_from_enum_to_bounded!(DmaTrfCmdSize, 3);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for DmaTrfCmdSize {
+impl TryFrom<Bounded<u32, 3>> for DmaTrfCmdSize {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
+    fn try_from(value: Bounded<u32, 3>) -> Result<Self> {
+        match value.get() {
             0x6 => Ok(Self::Size256B),
             _ => Err(EINVAL),
         }
@@ -215,25 +212,17 @@ pub(crate) enum PeregrineCoreSelect {
     /// RISC-V core is active.
     Riscv = 1,
 }
+impl_from_enum_to_bounded!(PeregrineCoreSelect, 1);
 
-impl From<bool> for PeregrineCoreSelect {
-    fn from(value: bool) -> Self {
-        match value {
+impl From<Bounded<u32, 1>> for PeregrineCoreSelect {
+    fn from(value: Bounded<u32, 1>) -> Self {
+        match bool::from(value) {
             false => PeregrineCoreSelect::Falcon,
             true => PeregrineCoreSelect::Riscv,
         }
     }
 }
 
-impl From<PeregrineCoreSelect> for bool {
-    fn from(value: PeregrineCoreSelect) -> Self {
-        match value {
-            PeregrineCoreSelect::Falcon => false,
-            PeregrineCoreSelect::Riscv => true,
-        }
-    }
-}
-
 /// Different types of memory present in a falcon core.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum FalconMem {
@@ -257,14 +246,14 @@ pub(crate) enum FalconFbifTarget {
     /// Non-coherent system memory (System DRAM).
     NoncoherentSysmem = 2,
 }
-impl_from_enum_to_u8!(FalconFbifTarget);
+impl_from_enum_to_bounded!(FalconFbifTarget, 2);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconFbifTarget {
+impl TryFrom<Bounded<u32, 2>> for FalconFbifTarget {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        let res = match value {
+    fn try_from(value: Bounded<u32, 2>) -> Result<Self> {
+        let res = match value.get() {
             0 => Self::LocalFb,
             1 => Self::CoherentSysmem,
             2 => Self::NoncoherentSysmem,
@@ -284,26 +273,18 @@ pub(crate) enum FalconFbifMemType {
     /// Physical memory addresses.
     Physical = 1,
 }
+impl_from_enum_to_bounded!(FalconFbifMemType, 1);
 
 /// Conversion from a single-bit register field.
-impl From<bool> for FalconFbifMemType {
-    fn from(value: bool) -> Self {
-        match value {
+impl From<Bounded<u32, 1>> for FalconFbifMemType {
+    fn from(value: Bounded<u32, 1>) -> Self {
+        match bool::from(value) {
             false => Self::Virtual,
             true => Self::Physical,
         }
     }
 }
 
-impl From<FalconFbifMemType> for bool {
-    fn from(value: FalconFbifMemType) -> Self {
-        match value {
-            FalconFbifMemType::Virtual => false,
-            FalconFbifMemType::Physical => true,
-        }
-    }
-}
-
 /// Type used to represent the `PFALCON` registers address base for a given falcon engine.
 pub(crate) struct PFalconBase(());
 
@@ -432,7 +413,7 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
         self.reset_wait_mem_scrubbing(bar)?;
 
         regs::NV_PFALCON_FALCON_RM::default()
-            .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
+            .set_value(regs::NV_PMC_BOOT_0::read(bar).as_raw())
             .write(bar, &E::ID);
 
         Ok(())
@@ -501,20 +482,18 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             .set_base((dma_start >> 8) as u32)
             .write(bar, &E::ID);
         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
-            // CAST: `as u16` is used on purpose since the remaining bits are guaranteed to fit
-            // within a `u16`.
-            .set_base((dma_start >> 40) as u16)
+            .try_set_base(dma_start >> 40)?
             .write(bar, &E::ID);
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
             .set_imem(target_mem == FalconMem::Imem)
-            .set_sec(if sec { 1 } else { 0 });
+            .set_sec(sec);
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
             regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
-                .set_offs(load_offsets.dst_start + pos)
+                .try_set_offs(load_offsets.dst_start + pos)?
                 .write(bar, &E::ID);
             regs::NV_PFALCON_FALCON_DMATRFFBOFFS::default()
                 .set_offs(src_start + pos)
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index 67edef3636c1..dcdf3962ab0d 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -1,7 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use kernel::{
-    io::poll::read_poll_timeout,
+    io::{
+        poll::read_poll_timeout,
+        register::RegisterBase, //
+    },
     prelude::*,
     time::Delta, //
 };
@@ -14,10 +17,7 @@
         PFalcon2Base,
         PFalconBase, //
     },
-    regs::{
-        self,
-        macros::RegisterBase, //
-    },
+    regs,
 };
 
 /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 69a7a95cac16..72afbd9101cf 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -59,7 +59,7 @@ fn signature_reg_fuse_version_ga102(
 
     // `ucode_idx` is guaranteed to be in the range [0..15], making the `read` calls provable valid
     // at build-time.
-    let reg_fuse_version = if engine_id_mask & 0x0001 != 0 {
+    let reg_fuse_version: u16 = if engine_id_mask & 0x0001 != 0 {
         regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::read(bar, ucode_idx).data()
     } else if engine_id_mask & 0x0004 != 0 {
         regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::read(bar, ucode_idx).data()
@@ -68,7 +68,8 @@ fn signature_reg_fuse_version_ga102(
     } else {
         dev_err!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask);
         return Err(EINVAL);
-    };
+    }
+    .into();
 
     // TODO[NUMM]: replace with `last_set_bit` once it lands.
     Ok(u16::BITS - reg_fuse_version.leading_zeros())
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
index b57d362e576a..5d836e2d17dd 100644
--- a/drivers/gpu/nova-core/falcon/sec2.rs
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -1,12 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::{
-    falcon::{
-        FalconEngine,
-        PFalcon2Base,
-        PFalconBase, //
-    },
-    regs::macros::RegisterBase,
+use kernel::io::register::RegisterBase;
+
+use crate::falcon::{
+    FalconEngine,
+    PFalcon2Base,
+    PFalconBase, //
 };
 
 /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index e0acc41aa7cd..acf46ad0dba1 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
+use kernel::{
+    num::Bounded,
+    prelude::*, //
+};
 
 use crate::{
     driver::Bar0,
@@ -20,9 +23,7 @@ pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
 
 pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
     regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
-        // CAST: `as u32` is used on purpose since the remaining bits are guaranteed to fit within
-        // a `u32`.
-        .set_adr_63_40((addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI) as u32)
+        .set_adr_63_40(Bounded::from_expr(addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI).cast())
         .write(bar);
     regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
         // CAST: `as u32` is used on purpose since we want to strip the upper bits that have been
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..556b2454b5a6 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,6 +4,7 @@
     device,
     devres::Devres,
     fmt,
+    num::Bounded,
     pci,
     prelude::*,
     sync::Arc, //
@@ -135,11 +136,11 @@ pub(crate) enum Architecture {
     Ada = 0x19,
 }
 
-impl TryFrom<u8> for Architecture {
+impl TryFrom<Bounded<u32, 6>> for Architecture {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
+    fn try_from(value: Bounded<u32, 6>) -> Result<Self> {
+        match u8::from(value) {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
             0x19 => Ok(Self::Ada),
@@ -148,23 +149,26 @@ fn try_from(value: u8) -> Result<Self> {
     }
 }
 
-impl From<Architecture> for u8 {
+impl From<Architecture> for Bounded<u32, 6> {
     fn from(value: Architecture) -> Self {
-        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
-        value as u8
+        match value {
+            Architecture::Turing => Bounded::<u8, 6>::new::<0x16>().cast(),
+            Architecture::Ampere => Bounded::<u8, 6>::new::<0x17>().cast(),
+            Architecture::Ada => Bounded::<u8, 6>::new::<0x19>().cast(),
+        }
     }
 }
 
 pub(crate) struct Revision {
-    major: u8,
-    minor: u8,
+    major: Bounded<u8, 4>,
+    minor: Bounded<u8, 4>,
 }
 
 impl From<regs::NV_PMC_BOOT_42> for Revision {
     fn from(boot0: regs::NV_PMC_BOOT_42) -> Self {
         Self {
-            major: boot0.major_revision(),
-            minor: boot0.minor_revision(),
+            major: boot0.major_revision().cast(),
+            minor: boot0.minor_revision().cast(),
         }
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 3991ccc0c10f..60a1b0fecf62 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -476,7 +476,7 @@ fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
     /// Notifies the GSP that we have updated the command queue pointers.
     fn notify_gsp(bar: &Bar0) {
         regs::NV_PGSP_QUEUE_HEAD::default()
-            .set_address(0)
+            .set_address(0u32)
             .write(bar);
     }
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 82cc6c0790e5..794401122f06 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -1,12 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 
-// Required to retain the original register names used by OpenRM, which are all capital snake case
-// but are mapped to types.
-#![allow(non_camel_case_types)]
-
-#[macro_use]
-pub(crate) mod macros;
-
 use kernel::prelude::*;
 
 use crate::{
@@ -29,20 +22,28 @@
     num::FromSafeCast,
 };
 
+// All nova-core registers are 32-bit and `pub(crate)`. Wrap the `register!` macro to avoid
+// repeating this information for every register.
+macro_rules! nv_reg {
+    ($(#[$attr:meta])* $name:ident $($tail:tt)*) => {
+        ::kernel::register!($(#[$attr])* pub(crate) $name(u32) $($tail)*);
+    };
+}
+
 // PMC
 
-register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
-    3:0     minor_revision as u8, "Minor revision of the chip";
-    7:4     major_revision as u8, "Major revision of the chip";
-    8:8     architecture_1 as u8, "MSB of the architecture";
-    23:20   implementation as u8, "Implementation version of the architecture";
-    28:24   architecture_0 as u8, "Lower bits of the architecture";
+nv_reg!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
+    3:0     minor_revision, "Minor revision of the chip";
+    7:4     major_revision, "Major revision of the chip";
+    8:8     architecture_1, "MSB of the architecture";
+    23:20   implementation, "Implementation version of the architecture";
+    28:24   architecture_0, "Lower bits of the architecture";
 });
 
 impl NV_PMC_BOOT_0 {
     pub(crate) fn is_older_than_fermi(self) -> bool {
         // From https://github.com/NVIDIA/open-gpu-doc/tree/master/manuals :
-        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u8 = 0xc;
+        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u32 = 0xc;
 
         // Older chips left arch1 zeroed out. That, combined with an arch0 value that is less than
         // GF100, means "older than Fermi".
@@ -50,11 +51,11 @@ pub(crate) fn is_older_than_fermi(self) -> bool {
     }
 }
 
-register!(NV_PMC_BOOT_42 @ 0x00000a00, "Extended architecture information" {
-    15:12   minor_revision as u8, "Minor revision of the chip";
-    19:16   major_revision as u8, "Major revision of the chip";
-    23:20   implementation as u8, "Implementation version of the architecture";
-    29:24   architecture as u8 ?=> Architecture, "Architecture value";
+nv_reg!(NV_PMC_BOOT_42 @ 0x00000a00, "Extended architecture information" {
+    15:12   minor_revision, "Minor revision of the chip";
+    19:16   major_revision, "Major revision of the chip";
+    23:20   implementation, "Implementation version of the architecture";
+    29:24   architecture ?=> Architecture, "Architecture value";
 });
 
 impl NV_PMC_BOOT_42 {
@@ -89,11 +90,11 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
 
 // PBUS
 
-register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
+nv_reg!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
 
-register!(NV_PBUS_SW_SCRATCH_0E_FRTS_ERR => NV_PBUS_SW_SCRATCH[0xe],
+nv_reg!(NV_PBUS_SW_SCRATCH_0E_FRTS_ERR => NV_PBUS_SW_SCRATCH[0xe],
     "scratch register 0xe used as FRTS firmware error code" {
-    31:16   frts_err_code as u16;
+    31:16   frts_err_code;
 });
 
 // PFB
@@ -101,22 +102,22 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
 // The following two registers together hold the physical system memory address that is used by the
 // GPU to perform sysmembar operations (see `fb::SysmemFlush`).
 
-register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
-    31:0    adr_39_08 as u32;
+nv_reg!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
+    31:0    adr_39_08;
 });
 
-register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI @ 0x00100c40 {
-    23:0    adr_63_40 as u32;
+nv_reg!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI @ 0x00100c40 {
+    23:0    adr_63_40;
 });
 
-register!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
-    3:0     lower_scale as u8;
-    9:4     lower_mag as u8;
-    30:30   ecc_mode_enabled as bool;
+nv_reg!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
+    3:0     lower_scale;
+    9:4     lower_mag;
+    30:30   ecc_mode_enabled => bool;
 });
 
-register!(NV_PGSP_QUEUE_HEAD @ 0x00110c00 {
-    31:0    address as u32;
+nv_reg!(NV_PGSP_QUEUE_HEAD @ 0x00110c00 {
+    31:0    address;
 });
 
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
@@ -134,8 +135,8 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 }
 
-register!(NV_PFB_PRI_MMU_WPR2_ADDR_LO@0x001fa824  {
-    31:4    lo_val as u32, "Bits 12..40 of the lower (inclusive) bound of the WPR2 region";
+nv_reg!(NV_PFB_PRI_MMU_WPR2_ADDR_LO@0x001fa824  {
+    31:4    lo_val, "Bits 12..40 of the lower (inclusive) bound of the WPR2 region";
 });
 
 impl NV_PFB_PRI_MMU_WPR2_ADDR_LO {
@@ -145,8 +146,8 @@ pub(crate) fn lower_bound(self) -> u64 {
     }
 }
 
-register!(NV_PFB_PRI_MMU_WPR2_ADDR_HI@0x001fa828  {
-    31:4    hi_val as u32, "Bits 12..40 of the higher (exclusive) bound of the WPR2 region";
+nv_reg!(NV_PFB_PRI_MMU_WPR2_ADDR_HI@0x001fa828  {
+    31:4    hi_val, "Bits 12..40 of the higher (exclusive) bound of the WPR2 region";
 });
 
 impl NV_PFB_PRI_MMU_WPR2_ADDR_HI {
@@ -169,25 +170,25 @@ pub(crate) fn higher_bound(self) -> u64 {
 
 // Boot Sequence Interface (BSI) register used to determine
 // if GSP reload/resume has completed during the boot process.
-register!(NV_PGC6_BSI_SECURE_SCRATCH_14 @ 0x001180f8 {
-    26:26   boot_stage_3_handoff as bool;
+nv_reg!(NV_PGC6_BSI_SECURE_SCRATCH_14 @ 0x001180f8 {
+    26:26   boot_stage_3_handoff => bool;
 });
 
 // Privilege level mask register. It dictates whether the host CPU has privilege to access the
 // `PGC6_AON_SECURE_SCRATCH_GROUP_05` register (which it needs to read GFW_BOOT).
-register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128,
+nv_reg!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128,
           "Privilege level mask register" {
-    0:0     read_protection_level0 as bool, "Set after FWSEC lowers its protection level";
+    0:0     read_protection_level0 => bool, "Set after FWSEC lowers its protection level";
 });
 
 // OpenRM defines this as a register array, but doesn't specify its size and only uses its first
 // element. Be conservative until we know the actual size or need to use more registers.
-register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234[1] {});
+nv_reg!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234[1] {});
 
-register!(
+nv_reg!(
     NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT => NV_PGC6_AON_SECURE_SCRATCH_GROUP_05[0],
     "Scratch group 05 register 0 used as GFW boot progress indicator" {
-        7:0    progress as u8, "Progress of GFW boot (0xff means completed)";
+        7:0    progress, "Progress of GFW boot (0xff means completed)";
     }
 );
 
@@ -198,14 +199,14 @@ pub(crate) fn completed(self) -> bool {
     }
 }
 
-register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 @ 0x001183a4 {
-    31:0    value as u32;
+nv_reg!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 @ 0x001183a4 {
+    31:0    value;
 });
 
-register!(
+nv_reg!(
     NV_USABLE_FB_SIZE_IN_MB => NV_PGC6_AON_SECURE_SCRATCH_GROUP_42,
     "Scratch group 42 register used as framebuffer size" {
-        31:0    value as u32, "Usable framebuffer size, in megabytes";
+        31:0    value, "Usable framebuffer size, in megabytes";
     }
 );
 
@@ -218,9 +219,9 @@ pub(crate) fn usable_fb_size(self) -> u64 {
 
 // PDISP
 
-register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
-    3:3     status_valid as bool, "Set if the `addr` field is valid";
-    31:8    addr as u32, "VGA workspace base address divided by 0x10000";
+nv_reg!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
+    3:3     status_valid => bool, "Set if the `addr` field is valid";
+    31:8    addr, "VGA workspace base address divided by 0x10000";
 });
 
 impl NV_PDISP_VGA_WORKSPACE_BASE {
@@ -238,47 +239,47 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 
 pub(crate) const NV_FUSE_OPT_FPF_SIZE: usize = 16;
 
-register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
+nv_reg!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100[NV_FUSE_OPT_FPF_SIZE] {
+    15:0    data;
 });
 
-register!(NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION @ 0x00824140[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
+nv_reg!(NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION @ 0x00824140[NV_FUSE_OPT_FPF_SIZE] {
+    15:0    data;
 });
 
-register!(NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION @ 0x008241c0[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
+nv_reg!(NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION @ 0x008241c0[NV_FUSE_OPT_FPF_SIZE] {
+    15:0    data;
 });
 
 // PFALCON
 
-register!(NV_PFALCON_FALCON_IRQSCLR @ PFalconBase[0x00000004] {
-    4:4     halt as bool;
-    6:6     swgen0 as bool;
+nv_reg!(NV_PFALCON_FALCON_IRQSCLR @ PFalconBase[0x00000004] {
+    4:4     halt => bool;
+    6:6     swgen0 => bool;
 });
 
-register!(NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase[0x00000040] {
-    31:0    value as u32;
+nv_reg!(NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase[0x00000040] {
+    31:0    value => u32;
 });
 
-register!(NV_PFALCON_FALCON_MAILBOX1 @ PFalconBase[0x00000044] {
-    31:0    value as u32;
+nv_reg!(NV_PFALCON_FALCON_MAILBOX1 @ PFalconBase[0x00000044] {
+    31:0    value => u32;
 });
 
 // Used to store version information about the firmware running
 // on the Falcon processor.
-register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
-    31:0    value as u32;
+nv_reg!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
+    31:0    value => u32;
 });
 
-register!(NV_PFALCON_FALCON_RM @ PFalconBase[0x00000084] {
-    31:0    value as u32;
+nv_reg!(NV_PFALCON_FALCON_RM @ PFalconBase[0x00000084] {
+    31:0    value => u32;
 });
 
-register!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
-    10:10   riscv as bool;
-    12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is completed";
-    31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
+nv_reg!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
+    10:10   riscv => bool;
+    12:12   mem_scrubbing => bool, "Set to 0 after memory scrubbing is completed";
+    31:31   reset_ready => bool, "Signal indicating that reset is completed (GA102+)";
 });
 
 impl NV_PFALCON_FALCON_HWCFG2 {
@@ -288,107 +289,107 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     }
 }
 
-register!(NV_PFALCON_FALCON_CPUCTL @ PFalconBase[0x00000100] {
-    1:1     startcpu as bool;
-    4:4     halted as bool;
-    6:6     alias_en as bool;
+nv_reg!(NV_PFALCON_FALCON_CPUCTL @ PFalconBase[0x00000100] {
+    1:1     startcpu => bool;
+    4:4     halted => bool;
+    6:6     alias_en => bool;
 });
 
-register!(NV_PFALCON_FALCON_BOOTVEC @ PFalconBase[0x00000104] {
-    31:0    value as u32;
+nv_reg!(NV_PFALCON_FALCON_BOOTVEC @ PFalconBase[0x00000104] {
+    31:0    value => u32;
 });
 
-register!(NV_PFALCON_FALCON_DMACTL @ PFalconBase[0x0000010c] {
-    0:0     require_ctx as bool;
-    1:1     dmem_scrubbing as bool;
-    2:2     imem_scrubbing as bool;
-    6:3     dmaq_num as u8;
-    7:7     secure_stat as bool;
+nv_reg!(NV_PFALCON_FALCON_DMACTL @ PFalconBase[0x0000010c] {
+    0:0     require_ctx => bool;
+    1:1     dmem_scrubbing => bool;
+    2:2     imem_scrubbing => bool;
+    6:3     dmaq_num;
+    7:7     secure_stat => bool;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
-    31:0    base as u32;
+nv_reg!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
+    31:0    base => u32;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFMOFFS @ PFalconBase[0x00000114] {
-    23:0    offs as u32;
+nv_reg!(NV_PFALCON_FALCON_DMATRFMOFFS @ PFalconBase[0x00000114] {
+    23:0    offs;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFCMD @ PFalconBase[0x00000118] {
-    0:0     full as bool;
-    1:1     idle as bool;
-    3:2     sec as u8;
-    4:4     imem as bool;
-    5:5     is_write as bool;
-    10:8    size as u8 ?=> DmaTrfCmdSize;
-    14:12   ctxdma as u8;
-    16:16   set_dmtag as u8;
+nv_reg!(NV_PFALCON_FALCON_DMATRFCMD @ PFalconBase[0x00000118] {
+    0:0     full => bool;
+    1:1     idle => bool;
+    3:2     sec;
+    4:4     imem => bool;
+    5:5     is_write => bool;
+    10:8    size ?=> DmaTrfCmdSize;
+    14:12   ctxdma;
+    16:16   set_dmtag;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
-    31:0    offs as u32;
+nv_reg!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
+    31:0    offs => u32;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFBASE1 @ PFalconBase[0x00000128] {
-    8:0     base as u16;
+nv_reg!(NV_PFALCON_FALCON_DMATRFBASE1 @ PFalconBase[0x00000128] {
+    8:0     base;
 });
 
-register!(NV_PFALCON_FALCON_HWCFG1 @ PFalconBase[0x0000012c] {
-    3:0     core_rev as u8 ?=> FalconCoreRev, "Core revision";
-    5:4     security_model as u8 ?=> FalconSecurityModel, "Security model";
-    7:6     core_rev_subversion as u8 ?=> FalconCoreRevSubversion, "Core revision subversion";
+nv_reg!(NV_PFALCON_FALCON_HWCFG1 @ PFalconBase[0x0000012c] {
+    3:0     core_rev ?=> FalconCoreRev, "Core revision";
+    5:4     security_model ?=> FalconSecurityModel, "Security model";
+    7:6     core_rev_subversion => FalconCoreRevSubversion, "Core revision subversion";
 });
 
-register!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ PFalconBase[0x00000130] {
-    1:1     startcpu as bool;
+nv_reg!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ PFalconBase[0x00000130] {
+    1:1     startcpu => bool;
 });
 
 // Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
 // instance.
-register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
-    0:0     reset as bool;
+nv_reg!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
+    0:0     reset => bool;
 });
 
-register!(NV_PFALCON_FBIF_TRANSCFG @ PFalconBase[0x00000600[8]] {
-    1:0     target as u8 ?=> FalconFbifTarget;
-    2:2     mem_type as bool => FalconFbifMemType;
+nv_reg!(NV_PFALCON_FBIF_TRANSCFG @ PFalconBase[0x00000600[8]] {
+    1:0     target ?=> FalconFbifTarget;
+    2:2     mem_type => FalconFbifMemType;
 });
 
-register!(NV_PFALCON_FBIF_CTL @ PFalconBase[0x00000624] {
-    7:7     allow_phys_no_ctx as bool;
+nv_reg!(NV_PFALCON_FBIF_CTL @ PFalconBase[0x00000624] {
+    7:7     allow_phys_no_ctx => bool;
 });
 
 /* PFALCON2 */
 
-register!(NV_PFALCON2_FALCON_MOD_SEL @ PFalcon2Base[0x00000180] {
-    7:0     algo as u8 ?=> FalconModSelAlgo;
+nv_reg!(NV_PFALCON2_FALCON_MOD_SEL @ PFalcon2Base[0x00000180] {
+    7:0     algo ?=> FalconModSelAlgo;
 });
 
-register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ PFalcon2Base[0x00000198] {
-    7:0    ucode_id as u8;
+nv_reg!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ PFalcon2Base[0x00000198] {
+    7:0    ucode_id => u8;
 });
 
-register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ PFalcon2Base[0x0000019c] {
-    31:0    value as u32;
+nv_reg!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ PFalcon2Base[0x0000019c] {
+    31:0    value => u32;
 });
 
 // OpenRM defines this as a register array, but doesn't specify its size and only uses its first
 // element. Be conservative until we know the actual size or need to use more registers.
-register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalcon2Base[0x00000210[1]] {
-    31:0    value as u32;
+nv_reg!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalcon2Base[0x00000210[1]] {
+    31:0    value => u32;
 });
 
 // PRISCV
 
-register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
-    0:0     halted as bool;
-    7:7     active_stat as bool;
+nv_reg!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
+    0:0     halted => bool;
+    7:7     active_stat => bool;
 });
 
-register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalcon2Base[0x00000668] {
-    0:0     valid as bool;
-    4:4     core_select as bool => PeregrineCoreSelect;
-    8:8     br_fetch as bool;
+nv_reg!(NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase[0x00001668] {
+    0:0     valid => bool;
+    4:4     core_select => PeregrineCoreSelect;
+    8:8     br_fetch => bool;
 });
 
 // The modules below provide registers that are not identical on all supported chips. They should
@@ -397,15 +398,15 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 pub(crate) mod gm107 {
     // FUSE
 
-    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
-        0:0     display_disabled as bool;
+    nv_reg!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
+        0:0     display_disabled => bool;
     });
 }
 
 pub(crate) mod ga100 {
     // FUSE
 
-    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
-        0:0     display_disabled as bool;
+    nv_reg!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
+        0:0     display_disabled => bool;
     });
 }
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
deleted file mode 100644
index fd1a815fa57d..000000000000
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ /dev/null
@@ -1,721 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-//! `register!` macro to define register layout and accessors.
-//!
-//! A single register typically includes several fields, which are accessed through a combination
-//! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
-//! not all possible field values are necessarily valid.
-//!
-//! The `register!` macro in this module provides an intuitive and readable syntax for defining a
-//! dedicated type for each register. Each such type comes with its own field accessors that can
-//! return an error if a field's value is invalid. Please look at the [`bitfield`] macro for the
-//! complete syntax of fields definitions.
-
-/// Trait providing a base address to be added to the offset of a relative register to obtain
-/// its actual offset.
-///
-/// The `T` generic argument is used to distinguish which base to use, in case a type provides
-/// several bases. It is given to the `register!` macro to restrict the use of the register to
-/// implementors of this particular variant.
-pub(crate) trait RegisterBase<T> {
-    const BASE: usize;
-}
-
-/// Defines a dedicated type for a register with an absolute offset, including getter and setter
-/// methods for its fields and methods to read and write it from an `Io` region.
-///
-/// Example:
-///
-/// ```no_run
-/// register!(BOOT_0 @ 0x00000100, "Basic revision information about the GPU" {
-///    3:0     minor_revision as u8, "Minor revision of the chip";
-///    7:4     major_revision as u8, "Major revision of the chip";
-///    28:20   chipset as u32 ?=> Chipset, "Chipset model";
-/// });
-/// ```
-///
-/// This defines a `BOOT_0` type which can be read or written from offset `0x100` of an `Io`
-/// region. It is composed of 3 fields, for instance `minor_revision` is made of the 4 least
-/// significant bits of the register. Each field can be accessed and modified using accessor
-/// methods:
-///
-/// ```no_run
-/// // Read from the register's defined offset (0x100).
-/// let boot0 = BOOT_0::read(&bar);
-/// pr_info!("chip revision: {}.{}", boot0.major_revision(), boot0.minor_revision());
-///
-/// // `Chipset::try_from` is called with the value of the `chipset` field and returns an
-/// // error if it is invalid.
-/// let chipset = boot0.chipset()?;
-///
-/// // Update some fields and write the value back.
-/// boot0.set_major_revision(3).set_minor_revision(10).write(&bar);
-///
-/// // Or, just read and update the register in a single step:
-/// BOOT_0::update(&bar, |r| r.set_major_revision(3).set_minor_revision(10));
-/// ```
-///
-/// The documentation strings are optional. If present, they will be added to the type's
-/// definition, or the field getter and setter methods they are attached to.
-///
-/// It is also possible to create a alias register by using the `=> ALIAS` syntax. This is useful
-/// for cases where a register's interpretation depends on the context:
-///
-/// ```no_run
-/// register!(SCRATCH @ 0x00000200, "Scratch register" {
-///    31:0     value as u32, "Raw value";
-/// });
-///
-/// register!(SCRATCH_BOOT_STATUS => SCRATCH, "Boot status of the firmware" {
-///     0:0     completed as bool, "Whether the firmware has completed booting";
-/// });
-/// ```
-///
-/// In this example, `SCRATCH_0_BOOT_STATUS` uses the same I/O address as `SCRATCH`, while also
-/// providing its own `completed` field.
-///
-/// ## Relative registers
-///
-/// A register can be defined as being accessible from a fixed offset of a provided base. For
-/// instance, imagine the following I/O space:
-///
-/// ```text
-///           +-----------------------------+
-///           |             ...             |
-///           |                             |
-///  0x100--->+------------CPU0-------------+
-///           |                             |
-///  0x110--->+-----------------------------+
-///           |           CPU_CTL           |
-///           +-----------------------------+
-///           |             ...             |
-///           |                             |
-///           |                             |
-///  0x200--->+------------CPU1-------------+
-///           |                             |
-///  0x210--->+-----------------------------+
-///           |           CPU_CTL           |
-///           +-----------------------------+
-///           |             ...             |
-///           +-----------------------------+
-/// ```
-///
-/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at offset `0x10` of their I/O
-/// space segment. Since both instances of `CPU_CTL` share the same layout, we don't want to define
-/// them twice and would prefer a way to select which one to use from a single definition
-///
-/// This can be done using the `Base[Offset]` syntax when specifying the register's address.
-///
-/// `Base` is an arbitrary type (typically a ZST) to be used as a generic parameter of the
-/// [`RegisterBase`] trait to provide the base as a constant, i.e. each type providing a base for
-/// this register needs to implement `RegisterBase<Base>`. Here is the above example translated
-/// into code:
-///
-/// ```no_run
-/// // Type used to identify the base.
-/// pub(crate) struct CpuCtlBase;
-///
-/// // ZST describing `CPU0`.
-/// struct Cpu0;
-/// impl RegisterBase<CpuCtlBase> for Cpu0 {
-///     const BASE: usize = 0x100;
-/// }
-/// // Singleton of `CPU0` used to identify it.
-/// const CPU0: Cpu0 = Cpu0;
-///
-/// // ZST describing `CPU1`.
-/// struct Cpu1;
-/// impl RegisterBase<CpuCtlBase> for Cpu1 {
-///     const BASE: usize = 0x200;
-/// }
-/// // Singleton of `CPU1` used to identify it.
-/// const CPU1: Cpu1 = Cpu1;
-///
-/// // This makes `CPU_CTL` accessible from all implementors of `RegisterBase<CpuCtlBase>`.
-/// register!(CPU_CTL @ CpuCtlBase[0x10], "CPU core control" {
-///     0:0     start as bool, "Start the CPU core";
-/// });
-///
-/// // The `read`, `write` and `update` methods of relative registers take an extra `base` argument
-/// // that is used to resolve its final address by adding its `BASE` to the offset of the
-/// // register.
-///
-/// // Start `CPU0`.
-/// CPU_CTL::update(bar, &CPU0, |r| r.set_start(true));
-///
-/// // Start `CPU1`.
-/// CPU_CTL::update(bar, &CPU1, |r| r.set_start(true));
-///
-/// // Aliases can also be defined for relative register.
-/// register!(CPU_CTL_ALIAS => CpuCtlBase[CPU_CTL], "Alias to CPU core control" {
-///     1:1     alias_start as bool, "Start the aliased CPU core";
-/// });
-///
-/// // Start the aliased `CPU0`.
-/// CPU_CTL_ALIAS::update(bar, &CPU0, |r| r.set_alias_start(true));
-/// ```
-///
-/// ## Arrays of registers
-///
-/// Some I/O areas contain consecutive values that can be interpreted in the same way. These areas
-/// can be defined as an array of identical registers, allowing them to be accessed by index with
-/// compile-time or runtime bound checking. Simply define their address as `Address[Size]`, and add
-/// an `idx` parameter to their `read`, `write` and `update` methods:
-///
-/// ```no_run
-/// # fn no_run() -> Result<(), Error> {
-/// # fn get_scratch_idx() -> usize {
-/// #   0x15
-/// # }
-/// // Array of 64 consecutive registers with the same layout starting at offset `0x80`.
-/// register!(SCRATCH @ 0x00000080[64], "Scratch registers" {
-///     31:0    value as u32;
-/// });
-///
-/// // Read scratch register 0, i.e. I/O address `0x80`.
-/// let scratch_0 = SCRATCH::read(bar, 0).value();
-/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
-/// let scratch_15 = SCRATCH::read(bar, 15).value();
-///
-/// // This is out of bounds and won't build.
-/// // let scratch_128 = SCRATCH::read(bar, 128).value();
-///
-/// // Runtime-obtained array index.
-/// let scratch_idx = get_scratch_idx();
-/// // Access on a runtime index returns an error if it is out-of-bounds.
-/// let some_scratch = SCRATCH::try_read(bar, scratch_idx)?.value();
-///
-/// // Alias to a particular register in an array.
-/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
-/// register!(FIRMWARE_STATUS => SCRATCH[8], "Firmware exit status code" {
-///     7:0     status as u8;
-/// });
-///
-/// let status = FIRMWARE_STATUS::read(bar).status();
-///
-/// // Non-contiguous register arrays can be defined by adding a stride parameter.
-/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
-/// // registers of the two declarations below are interleaved.
-/// register!(SCRATCH_INTERLEAVED_0 @ 0x000000c0[16 ; 8], "Scratch registers bank 0" {
-///     31:0    value as u32;
-/// });
-/// register!(SCRATCH_INTERLEAVED_1 @ 0x000000c4[16 ; 8], "Scratch registers bank 1" {
-///     31:0    value as u32;
-/// });
-/// # Ok(())
-/// # }
-/// ```
-///
-/// ## Relative arrays of registers
-///
-/// Combining the two features described in the sections above, arrays of registers accessible from
-/// a base can also be defined:
-///
-/// ```no_run
-/// # fn no_run() -> Result<(), Error> {
-/// # fn get_scratch_idx() -> usize {
-/// #   0x15
-/// # }
-/// // Type used as parameter of `RegisterBase` to specify the base.
-/// pub(crate) struct CpuCtlBase;
-///
-/// // ZST describing `CPU0`.
-/// struct Cpu0;
-/// impl RegisterBase<CpuCtlBase> for Cpu0 {
-///     const BASE: usize = 0x100;
-/// }
-/// // Singleton of `CPU0` used to identify it.
-/// const CPU0: Cpu0 = Cpu0;
-///
-/// // ZST describing `CPU1`.
-/// struct Cpu1;
-/// impl RegisterBase<CpuCtlBase> for Cpu1 {
-///     const BASE: usize = 0x200;
-/// }
-/// // Singleton of `CPU1` used to identify it.
-/// const CPU1: Cpu1 = Cpu1;
-///
-/// // 64 per-cpu scratch registers, arranged as an contiguous array.
-/// register!(CPU_SCRATCH @ CpuCtlBase[0x00000080[64]], "Per-CPU scratch registers" {
-///     31:0    value as u32;
-/// });
-///
-/// let cpu0_scratch_0 = CPU_SCRATCH::read(bar, &Cpu0, 0).value();
-/// let cpu1_scratch_15 = CPU_SCRATCH::read(bar, &Cpu1, 15).value();
-///
-/// // This won't build.
-/// // let cpu0_scratch_128 = CPU_SCRATCH::read(bar, &Cpu0, 128).value();
-///
-/// // Runtime-obtained array index.
-/// let scratch_idx = get_scratch_idx();
-/// // Access on a runtime value returns an error if it is out-of-bounds.
-/// let cpu0_some_scratch = CPU_SCRATCH::try_read(bar, &Cpu0, scratch_idx)?.value();
-///
-/// // `SCRATCH[8]` is used to convey the firmware exit code.
-/// register!(CPU_FIRMWARE_STATUS => CpuCtlBase[CPU_SCRATCH[8]],
-///     "Per-CPU firmware exit status code" {
-///     7:0     status as u8;
-/// });
-///
-/// let cpu0_status = CPU_FIRMWARE_STATUS::read(bar, &Cpu0).status();
-///
-/// // Non-contiguous register arrays can be defined by adding a stride parameter.
-/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
-/// // registers of the two declarations below are interleaved.
-/// register!(CPU_SCRATCH_INTERLEAVED_0 @ CpuCtlBase[0x00000d00[16 ; 8]],
-///           "Scratch registers bank 0" {
-///     31:0    value as u32;
-/// });
-/// register!(CPU_SCRATCH_INTERLEAVED_1 @ CpuCtlBase[0x00000d04[16 ; 8]],
-///           "Scratch registers bank 1" {
-///     31:0    value as u32;
-/// });
-/// # Ok(())
-/// # }
-/// ```
-macro_rules! register {
-    // Creates a register at a fixed offset of the MMIO space.
-    ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_fixed $name @ $offset);
-    };
-
-    // Creates an alias register of fixed offset register `alias` with its own fields.
-    ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_fixed $name @ $alias::OFFSET);
-    };
-
-    // Creates a register at a relative offset from a base address provider.
-    ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_relative $name @ $base [ $offset ]);
-    };
-
-    // Creates an alias register of relative offset register `alias` with its own fields.
-    ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_relative $name @ $base [ $alias::OFFSET ]);
-    };
-
-    // Creates an array of registers at a fixed offset of the MMIO space.
-    (
-        $name:ident @ $offset:literal [ $size:expr ; $stride:expr ] $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
-        static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_array $name @ $offset [ $size ; $stride ]);
-    };
-
-    // Shortcut for contiguous array of registers (stride == size of element).
-    (
-        $name:ident @ $offset:literal [ $size:expr ] $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
-        register!($name @ $offset [ $size ; ::core::mem::size_of::<u32>() ] $(, $comment)? {
-            $($fields)*
-        } );
-    };
-
-    // Creates an array of registers at a relative offset from a base address provider.
-    (
-        $name:ident @ $base:ty [ $offset:literal [ $size:expr ; $stride:expr ] ]
-            $(, $comment:literal)? { $($fields:tt)* }
-    ) => {
-        static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
-    };
-
-    // Shortcut for contiguous array of relative registers (stride == size of element).
-    (
-        $name:ident @ $base:ty [ $offset:literal [ $size:expr ] ] $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
-        register!($name @ $base [ $offset [ $size ; ::core::mem::size_of::<u32>() ] ]
-            $(, $comment)? { $($fields)* } );
-    };
-
-    // Creates an alias of register `idx` of relative array of registers `alias` with its own
-    // fields.
-    (
-        $name:ident => $base:ty [ $alias:ident [ $idx:expr ] ] $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
-        static_assert!($idx < $alias::SIZE);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
-    };
-
-    // Creates an alias of register `idx` of array of registers `alias` with its own fields.
-    // This rule belongs to the (non-relative) register arrays set, but needs to be put last
-    // to avoid it being interpreted in place of the relative register array alias rule.
-    ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        static_assert!($idx < $alias::SIZE);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
-    };
-
-    // Generates the IO accessors for a fixed offset register.
-    (@io_fixed $name:ident @ $offset:expr) => {
-        #[allow(dead_code)]
-        impl $name {
-            pub(crate) const OFFSET: usize = $offset;
-
-            /// Read the register from its address in `io`.
-            #[inline(always)]
-            pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-            {
-                Self(io.read32($offset))
-            }
-
-            /// Write the value contained in `self` to the register address in `io`.
-            #[inline(always)]
-            pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-            {
-                io.write32(self.0, $offset)
-            }
-
-            /// Read the register from its address in `io` and run `f` on its value to obtain a new
-            /// value to write back.
-            #[inline(always)]
-            pub(crate) fn update<const SIZE: usize, T, F>(
-                io: &T,
-                f: F,
-            ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::read(io));
-                reg.write(io);
-            }
-        }
-    };
-
-    // Generates the IO accessors for a relative offset register.
-    (@io_relative $name:ident @ $base:ty [ $offset:expr ]) => {
-        #[allow(dead_code)]
-        impl $name {
-            pub(crate) const OFFSET: usize = $offset;
-
-            /// Read the register from `io`, using the base address provided by `base` and adding
-            /// the register's offset to it.
-            #[inline(always)]
-            pub(crate) fn read<const SIZE: usize, T, B>(
-                io: &T,
-                #[allow(unused_variables)]
-                base: &B,
-            ) -> Self where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                const OFFSET: usize = $name::OFFSET;
-
-                let value = io.read32(
-                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
-                );
-
-                Self(value)
-            }
-
-            /// Write the value contained in `self` to `io`, using the base address provided by
-            /// `base` and adding the register's offset to it.
-            #[inline(always)]
-            pub(crate) fn write<const SIZE: usize, T, B>(
-                self,
-                io: &T,
-                #[allow(unused_variables)]
-                base: &B,
-            ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                const OFFSET: usize = $name::OFFSET;
-
-                io.write32(
-                    self.0,
-                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
-                );
-            }
-
-            /// Read the register from `io`, using the base address provided by `base` and adding
-            /// the register's offset to it, then run `f` on its value to obtain a new value to
-            /// write back.
-            #[inline(always)]
-            pub(crate) fn update<const SIZE: usize, T, B, F>(
-                io: &T,
-                base: &B,
-                f: F,
-            ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::read(io, base));
-                reg.write(io, base);
-            }
-        }
-    };
-
-    // Generates the IO accessors for an array of registers.
-    (@io_array $name:ident @ $offset:literal [ $size:expr ; $stride:expr ]) => {
-        #[allow(dead_code)]
-        impl $name {
-            pub(crate) const OFFSET: usize = $offset;
-            pub(crate) const SIZE: usize = $size;
-            pub(crate) const STRIDE: usize = $stride;
-
-            /// Read the array register at index `idx` from its address in `io`.
-            #[inline(always)]
-            pub(crate) fn read<const SIZE: usize, T>(
-                io: &T,
-                idx: usize,
-            ) -> Self where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-            {
-                build_assert!(idx < Self::SIZE);
-
-                let offset = Self::OFFSET + (idx * Self::STRIDE);
-                let value = io.read32(offset);
-
-                Self(value)
-            }
-
-            /// Write the value contained in `self` to the array register with index `idx` in `io`.
-            #[inline(always)]
-            pub(crate) fn write<const SIZE: usize, T>(
-                self,
-                io: &T,
-                idx: usize
-            ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-            {
-                build_assert!(idx < Self::SIZE);
-
-                let offset = Self::OFFSET + (idx * Self::STRIDE);
-
-                io.write32(self.0, offset);
-            }
-
-            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
-            /// new value to write back.
-            #[inline(always)]
-            pub(crate) fn update<const SIZE: usize, T, F>(
-                io: &T,
-                idx: usize,
-                f: F,
-            ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::read(io, idx));
-                reg.write(io, idx);
-            }
-
-            /// Read the array register at index `idx` from its address in `io`.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_read<const SIZE: usize, T>(
-                io: &T,
-                idx: usize,
-            ) -> ::kernel::error::Result<Self> where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-            {
-                if idx < Self::SIZE {
-                    Ok(Self::read(io, idx))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-
-            /// Write the value contained in `self` to the array register with index `idx` in `io`.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_write<const SIZE: usize, T>(
-                self,
-                io: &T,
-                idx: usize,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-            {
-                if idx < Self::SIZE {
-                    Ok(self.write(io, idx))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-
-            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
-            /// new value to write back.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_update<const SIZE: usize, T, F>(
-                io: &T,
-                idx: usize,
-                f: F,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                if idx < Self::SIZE {
-                    Ok(Self::update(io, idx, f))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-        }
-    };
-
-    // Generates the IO accessors for an array of relative registers.
-    (
-        @io_relative_array $name:ident @ $base:ty
-            [ $offset:literal [ $size:expr ; $stride:expr ] ]
-    ) => {
-        #[allow(dead_code)]
-        impl $name {
-            pub(crate) const OFFSET: usize = $offset;
-            pub(crate) const SIZE: usize = $size;
-            pub(crate) const STRIDE: usize = $stride;
-
-            /// Read the array register at index `idx` from `io`, using the base address provided
-            /// by `base` and adding the register's offset to it.
-            #[inline(always)]
-            pub(crate) fn read<const SIZE: usize, T, B>(
-                io: &T,
-                #[allow(unused_variables)]
-                base: &B,
-                idx: usize,
-            ) -> Self where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                build_assert!(idx < Self::SIZE);
-
-                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
-                    Self::OFFSET + (idx * Self::STRIDE);
-                let value = io.read32(offset);
-
-                Self(value)
-            }
-
-            /// Write the value contained in `self` to `io`, using the base address provided by
-            /// `base` and adding the offset of array register `idx` to it.
-            #[inline(always)]
-            pub(crate) fn write<const SIZE: usize, T, B>(
-                self,
-                io: &T,
-                #[allow(unused_variables)]
-                base: &B,
-                idx: usize
-            ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                build_assert!(idx < Self::SIZE);
-
-                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
-                    Self::OFFSET + (idx * Self::STRIDE);
-
-                io.write32(self.0, offset);
-            }
-
-            /// Read the array register at index `idx` from `io`, using the base address provided
-            /// by `base` and adding the register's offset to it, then run `f` on its value to
-            /// obtain a new value to write back.
-            #[inline(always)]
-            pub(crate) fn update<const SIZE: usize, T, B, F>(
-                io: &T,
-                base: &B,
-                idx: usize,
-                f: F,
-            ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::read(io, base, idx));
-                reg.write(io, base, idx);
-            }
-
-            /// Read the array register at index `idx` from `io`, using the base address provided
-            /// by `base` and adding the register's offset to it.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_read<const SIZE: usize, T, B>(
-                io: &T,
-                base: &B,
-                idx: usize,
-            ) -> ::kernel::error::Result<Self> where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                if idx < Self::SIZE {
-                    Ok(Self::read(io, base, idx))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-
-            /// Write the value contained in `self` to `io`, using the base address provided by
-            /// `base` and adding the offset of array register `idx` to it.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_write<const SIZE: usize, T, B>(
-                self,
-                io: &T,
-                base: &B,
-                idx: usize,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                if idx < Self::SIZE {
-                    Ok(self.write(io, base, idx))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-
-            /// Read the array register at index `idx` from `io`, using the base address provided
-            /// by `base` and adding the register's offset to it, then run `f` on its value to
-            /// obtain a new value to write back.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_update<const SIZE: usize, T, B, F>(
-                io: &T,
-                base: &B,
-                idx: usize,
-                f: F,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                if idx < Self::SIZE {
-                    Ok(Self::update(io, base, idx, f))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-        }
-    };
-}

-- 
2.52.0

