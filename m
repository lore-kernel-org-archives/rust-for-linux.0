Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011010.outbound.protection.outlook.com [52.101.62.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411192FF156;
	Tue,  9 Dec 2025 02:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765249099; cv=fail; b=rMJXxu1TsAJQSdb5JSpd65NRUtGrIPWRE4xTeBdJ2UIQTn6/8G6gDoAMMF8xsTi5w5CTUEu9ekdg7tXGBxMtdV1oPwqj1TqVfuQ3RaSw5b8WVqIPbgEiExzVLIffkCAtV8hCGgBo/eWuM78TXTKrvI0RT4m/JZxWoDKnqDqYxIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765249099; c=relaxed/simple;
	bh=KAyYFSvmJ0ynvbh6wB09OUAf+anaCPBYCA9Lgzkd6ig=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hYFChYHODTCp2sKuG28tDWFOce3rxqRVTrcv1w/WgHH6whKqnmCJREnOxm36rvUx9MfsRm6QQ/IKDdJMU1shagIhIBtWzSm0RMIXDnHPOp4P5zCgz5AFIcRFhs1tlYgrOztA67kIp91CzX/wfPgcc3DvmNBSMq9I/0B0hM1FzFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J7GZT1Tt; arc=fail smtp.client-ip=52.101.62.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J7GZT1Tt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h416npupukVG9o0hzjSdh0B31SVs02LulASTeno0+wxLEyRCYbc9v/4Z9GcEsqn8zxEOAJaQAiGXairpBG8Ra1ob1IaA1gDskeP1B1t3feeA4G7YYe3A8z91iQy3tSe+xeKkVskI8D2tGOHeGWqzsoiPA3DU1rqBXe0DLgy0rApFLiGgfCMe9m3exxQYJZFDtDlvIpK2nWwmrVITtfia6QNW5SOWZX7fcLt9Qgq/Ny/65rw7F0OUxPr34u2qLOSUULL+JH9mRjJGyQ8Olv6XdbGTlrYjUMSXY/xJOI4adM56Mr4pU97xt93K5dKKH+mLE5lBlXO8HBL5LrRMh/PVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNZt7tEZhh7pfPoO87yfyO5tyRbjG/DbdKJWz1VwkNo=;
 b=rBhb+SZDqrLZTSEKJekJXNWFjJ0oOmTp/HT+viCG21gngl5LORq9HmOcJ/C+mTJ8IBcKhAtY9BfzvlC0MavkZn7SjuTH6aZzHKimpKM+ryOGju7lQ5ZaSj0L2SgzoENDm5jy9VJMhTwXiZfUC+pdSj+/7AVnODaf/FKQUAYL3XEnApHE9G3onqrQqsdxdXWLu/wZYcUR00C+8FOp6hXzJ8bHUMIBUOdRBIvGzK0AJmsyRZmXgi48u4660EHQdmWeLY391mtCh5amQRUg8De6BTd3gh70geNgCT6XUMjwonNJZpq+4UsIV0C4vLDAQatBtgh3jwV91d83zElbI7dkew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNZt7tEZhh7pfPoO87yfyO5tyRbjG/DbdKJWz1VwkNo=;
 b=J7GZT1TtBh2inBVu6jY/QaG/s6YkL0Lb+3I8EDgU7G1M4VN+xmHNLUMrFoju2hi9nrPq2PlI193tVeqOlyclzSLFzy6ZXiTNjwaanPf8PJft0gM7ZZQgt0WYs9u519/c9DMFR5E8cREeSIDx8PQpPHjhoRzvNMz21WxfTu5usi4i8REyyU+RGXzbY5biu0Qm/gG6JKJpuQ6hX/HgbjgV4va0gXyvT0/kIzIuzSH7M42UJy5rQhPss3rMgY/+5o6hLsFvVvwHvN8Ilm8IlbQ4fB/D9hGK+kmbg56rBy5oCX4xAyyi7PzW5jQ2VZj3unQ6e2SLQpymfh5aPno6PD/z2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 02:58:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Tue, 9 Dec 2025
 02:58:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 09 Dec 2025 11:57:59 +0900
Subject: [PATCH v3 1/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-transmute_unit-v3-1-819fe584ba06@nvidia.com>
References: <20251209-transmute_unit-v3-0-819fe584ba06@nvidia.com>
In-Reply-To: <20251209-transmute_unit-v3-0-819fe584ba06@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b42dd3d-2573-4a0d-0a7b-08de36cecc5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEpYOWxhcjJ1L3J6NTk3djJlV3crc1FUYitoTVIwNVpuQjRCR3JFbnRTbVFX?=
 =?utf-8?B?UW9UQTA3RlFxczQxMHF3UG5CR2t6UVVIalliekRJSGFEL1cxeGpOQnVkTFFC?=
 =?utf-8?B?eDAwbEV4cHBXeWRKNkxCN0oydGNvdTB3dmFWYlJsbmRvb2ZMYXZuWHQzaEJw?=
 =?utf-8?B?dHovYWVpeGpNdEE5WGViUXVCYzhvaTdSam1raENvVzZRMmttWDkvN0s3cHBL?=
 =?utf-8?B?N2VPWUhZQVd0QkM5K3p1RUZsS1lLZStsc3RXZ3ZmWmdENHJlQkZLRnRKZ2d0?=
 =?utf-8?B?YkxReFlLYnRlajQ5QUZKNjJoeEVXb0FVR28rZnlvRU14eTNBWDFVWnlaanNU?=
 =?utf-8?B?emJETjV5dW53Si9pQVZrRDdkNjFqVEt1YStOMTljalo1Y2pUbnd0T1RCb1Yr?=
 =?utf-8?B?SnFRVzNWY1d2aHcxNjRxdkZva1dMc0lyeXBrYkx0MVkxbUVUZlBqL0I1OVZM?=
 =?utf-8?B?bE9NKy9hcEZLVXJZZ2N4YTNXdjNQMzRTRXJxdDgrb2NiRmVzNnc5Q2ZvRGNa?=
 =?utf-8?B?ZjErUzJVbmVuWTd2eXdHQTlLd3M0S2tpb1RSUUVLMW9pcGpHaUduc21GcFFl?=
 =?utf-8?B?a0tIU1pyMXNuVHJITW8wWExGNW1KM2tYa1Z4SW1WbnVSWmhHMU93ZUMyTjNR?=
 =?utf-8?B?MzcxT1A3V3BWUmd2aW9mYUFudmgwb0lQd1I5MzRzTERmWXV4ejN1RFpIZUIx?=
 =?utf-8?B?VUQrZVUrZjF6cjNVOUNTaWxEV1lpQk9FUW1JRXBxMjcwdG5OWmdya21Ob3dk?=
 =?utf-8?B?aVdkcGxLUzExTjBQOUJ3NEpTZTVick5JYVlJLzFFb3lBRHh4L245M0JlRGRO?=
 =?utf-8?B?cTNiT3kvUjZ1NThMVEpvR1dtRGVpZTBZYUVGSFdENjlEUitmOFQwbmpFbml4?=
 =?utf-8?B?Sk83Z0NhQmpFYzVpaFlRMW1rZ3I5Q1JsNTM0YWdrZEU0QjRmL3Q0MkpPcHEy?=
 =?utf-8?B?NHhwcEVRcXVGOXY1NjJHdDJMRkJSZzNWWVB4SHZFdWp1SldTVHErWUxHQkZ2?=
 =?utf-8?B?T2tHN3M2U3VkQ2JiRS9ZYy95UFkyUTdDYllnbi95Q0xKbzJScVdUclNzVVBK?=
 =?utf-8?B?cGV0c3FaMTBObkZhc2pZeVp4N05MSDZtTzNCdmxPamZMTFJBT1JzNGJSZk85?=
 =?utf-8?B?Q1F3c0ZXcHl3MTAzdlZhRXROWjZ1QVkrb2JyZVk1T1JnWFFuQk5RWXNjdFhm?=
 =?utf-8?B?bFNHNDlNeU1qMnpMa2Y1TWpvRWZXZERla0o0Z2Jvb29Za0hJUlFtOG5xZVl6?=
 =?utf-8?B?dktHK0Q3RlJENWM1Zldad3krajhUa3hneDFGNnBoR1dwWGFJM3VGTUFVZVBJ?=
 =?utf-8?B?eHNkOERnREFuck1rR2QwY1VQVlN6WUtDMmt1YXR4VFRzZlcxNlpTVzRxcXVs?=
 =?utf-8?B?M2NmQ2syYW9rcVVjbGR1OCtGOGJIQ1grMktDekpoN0dKSHpxZFlLNzZGUzJZ?=
 =?utf-8?B?ZFBsZSs0b1VwSjBJcVZ0dHAxNU43Q3lSN1ZIRmVqbjhjUGhQNjF4b0krbUs5?=
 =?utf-8?B?TFJGOTMyZEoxdVN2T09hQm1LeG5kL3psYjJrM1BpZzlQc3lIK3pqbDBjaStM?=
 =?utf-8?B?alhSbitjeW9kYmo3Q2J3MXZYWTZ2SmNUMmcyc3NNbkNhV1Q1Vzc0TG1wQVl5?=
 =?utf-8?B?YUJHRmVtQ1I3cnFDRFhDWlAwQ0MybUpFblg5YklreU1lTHhQZlVqT3dvNjZw?=
 =?utf-8?B?ZklGaUdvcmFoMmF3RTlYS0tvZCt0RWpFZWpNTCtLNUwra1VIRi9WZFVRbzdE?=
 =?utf-8?B?T0o2THNrNHdRbUlab0lFMUZkUVhza0xkd2ZoNzZDV3VxSTQzNWxla1J1MFlR?=
 =?utf-8?B?QXE3T3dYTkFlazE2NGNuNVFjL1Z5T01BQmo1aHBYVE1xVmFkTEhYMngxcW9h?=
 =?utf-8?B?ZmdGdWhOODVrQW5qZkJTYlp6WGQrdS92YU91Sy9GNEkycVJtcE5JZDRSRHRH?=
 =?utf-8?Q?IAZBArtuhOsiF/GTC5PkldqWQvt/w7HE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXV1TzliTWlaOTBYN0tvM1h0ZXBUa1NCT282eGFFL0ZiTEFUMzVxZHd5RjRE?=
 =?utf-8?B?WnNwakMwblB0eDUyZ2tRSk9ONlA4UVI3SzF6eUtBYUI4UjM0bStOaFpmdGhq?=
 =?utf-8?B?ODNQTWR1d0U4cVFsVG1udWZuQm9RSFZFcXloMGlsYlNMN1N3MUV4QTJ1UHhY?=
 =?utf-8?B?SWZJUU1aWjhlQjdsQ2JxMTRxcU04aThvSXJFVXNoY2poSlVIaTYwRWpKWU5t?=
 =?utf-8?B?aCs0UjF2NENmWk05Vlg0QUkyVTdrbFM4RTNuYzhZZ3Jad0VkKzNLdUVpRy9s?=
 =?utf-8?B?aWZWZTlGbW1kVCtEaG8zUjdxKzNySVFZeEU2K1NQdTJ6VU1Rb0pFb0Vvek1N?=
 =?utf-8?B?SlZCYWtXeFh3am5DanlpcmdlZkVsZEl0amlqL3R3UFRLRzRtV0kwbC9wQjRF?=
 =?utf-8?B?d0luYlRRRmtlUUZ1VzUvd1dNcUNsVXVlRnp0ZHBNOXhHODUxcXY4Y3JqQzBP?=
 =?utf-8?B?alpxdVdqS0hzMk94dHFKaEdkemhCZEJsRDkwQ2lOVEFjQk5FYzFEQzNIeCtH?=
 =?utf-8?B?dTdlSVhnajIvZGFkbXd6R3hGZ0dISWVHU1J4WFkxc3AyQmF6OHYrbm9BSXpW?=
 =?utf-8?B?UEo0emFlcE56MXJ1cEQrWGtOcFplQmNRS0FLMWlsdG5kNTNZdFYzempHRUlQ?=
 =?utf-8?B?UEsvUFVXRXFobHU2TmFHZStrQnZBQmRLbXFkMDIyaGlYMHM4d0pPS0JQNC9E?=
 =?utf-8?B?czFYRk51T2lqQ3pUSTNnQ3p6UWZPMVRmVUdiSkdNTndxV2hqam1vaWxUNjRh?=
 =?utf-8?B?c3NDcEcyV3M0NThXbndaNFdleFNRaE1lZ285dTBKNXBkYlJDNnVzZVNrVlcw?=
 =?utf-8?B?Nm5QN01md1BPT1UrcG9SYS9oMzJIbVFNaDZQcXorNDBFOTQxem91REJCbklB?=
 =?utf-8?B?Qnc1eXBZcE5FYUFYMGJDV3M0elNZOCtNMWRGbnBIejNXd2J4dTRhemtiUEVS?=
 =?utf-8?B?QlN2aTEyYmZUZlVvNlI0aWdqdncyQzF4QWo2WDZobUlaRmN6T0Q0ZXIvamVT?=
 =?utf-8?B?TmhHZ0hjZ2tjZGEvcnpLSWFmTFR2RU5Halpnak1DRlB0V2NLK1hFNDRLWlZo?=
 =?utf-8?B?Z0Z3NE5IQkVza1d0cms3b2dReFZFRWU1L3p3TGREelRHMFI3amxmQithYStV?=
 =?utf-8?B?a2FtUkZSbEV1cnEzTUpnUGtOTi9acjVaMzl6YzJUZHRnL1pnSkNQSkZ2ci92?=
 =?utf-8?B?T0YvekZkOGdiclE1cHNSUlJQVmlrbGU3L28xbTM1MXdvdllxaGVtSisyTGkr?=
 =?utf-8?B?SDVzWjRIRTVjWDNwSDM5OW5oVXo3bFBHNmFtdUd4VjhiN2cyd3k0cTFKU1do?=
 =?utf-8?B?RW44bkQremZhMHhwTlpQcVRaa1o0QzlXVFpkVU8xNnBhUkQxMU5ZdFE3eHZv?=
 =?utf-8?B?ZHF5dEJjWkcxdzVBMlZFK3lzQ1dhQitHc0lYUXp4WVJJZytRTHlYemNRSERm?=
 =?utf-8?B?L21DUXRELytRWXVFdG1MajRRMVQrRW1iNFNRVDRmV3ZQZVlCS3VZaE5lU1lR?=
 =?utf-8?B?ZlVIdis0K29yeHpkZzd4Vkd3RnBrbDBWSVArQStzN1VmcjJ5a0NMSU5aUy95?=
 =?utf-8?B?VkJ2TmlNTEFqcmZKSTJRb0Rhck1Ndi9aRXBOUnVTbFpqRmhtNmthQjhaV05N?=
 =?utf-8?B?NFBtd1lheW1vOVpYWC93aW5zZjdhajIxUVA4UW1YT2Q1MmgrYjJhZ0tUKy90?=
 =?utf-8?B?Y3htaWk3dlVudFgrSlVnZ1cvWTY0ZU9sRmI1NVZGZ21qd2xranRwSlhMTXhO?=
 =?utf-8?B?WTNjUW1uZXp5cGN5ZkRvVXRvOUlMekwwWS9SL2QrQ1pWenh5cW9wb0VnbUhH?=
 =?utf-8?B?bkYxY2Q3OFlxOUFPL2lnN1VmM0I2bjd5SUE0Mnp3TkF3ZHFSa2dFZm14b1dh?=
 =?utf-8?B?K1JSdDZkSEdhVlRXb0lHbzRaWVhzRklTbXluY21VMTNWVlRoQis3ZEZpaVps?=
 =?utf-8?B?U1lIaGh0bVNieGNLWE9rL3pmcXlYZzcycGtoN0VaTjlnQ1JmekNDYnhDUTJM?=
 =?utf-8?B?VUloYXIwS1NuTzNCYWJSUWZaRlZaWjNXOXZxWi9yVjFaTllubUZjQ3ZYcUI0?=
 =?utf-8?B?ZUcza3JjaWQ4NkdZdmgxbVdKMTBrRWhVamtxSS9zSkdBNUhoSGZMQ0F0bFZa?=
 =?utf-8?B?T1QxY0d6UG9LVnBCWkxzZlU5bFBKODVwbk1vSDhNVUp4YmNFQStveGJSbEh2?=
 =?utf-8?Q?D4vEmvQ+woCF3gLo0I/6cnO2Jcf9IKPAhOjS2AK9vYVX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b42dd3d-2573-4a0d-0a7b-08de36cecc5c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 02:58:15.4542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qbf6KLwuC81pCGdSndxddwsxka2ohUvO5PfAyu2GbVb/GXywLAZwFk40psYn+0wFobtw/ayCgbJ4T1ofiJlywg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309

This is useful when using types that may or may not be empty in generic
code relying on these traits. It is also safe because technically a
no-op.

Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/transmute.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index be5dbf3829e2..a888a312e7ff 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -170,6 +170,10 @@ macro_rules! impl_frombytes {
 }
 
 impl_frombytes! {
+    // SAFETY: Inhabited ZSTs only have one possible bit pattern.
+    (),
+    {<T>} core::marker::PhantomData<T>,
+
     // SAFETY: All bit patterns are acceptable values of the types below.
     u8, u16, u32, u64, usize,
     i8, i16, i32, i64, isize,
@@ -230,6 +234,10 @@ macro_rules! impl_asbytes {
 }
 
 impl_asbytes! {
+    // SAFETY: Inhabited ZSTs only have one possible bit pattern.
+    (),
+    {<T>} core::marker::PhantomData<T>,
+
     // SAFETY: Instances of the following types have no uninitialized portions.
     u8, u16, u32, u64, usize,
     i8, i16, i32, i64, isize,

-- 
2.52.0

