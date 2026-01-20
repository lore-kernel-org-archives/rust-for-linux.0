Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3432636BCE9;
	Tue, 20 Jan 2026 06:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890221; cv=fail; b=gTu8C4EEIz36we72KimmTktMt3acXPxd4OmG9w6XJpCHA2y3SSwCP/kzEauXdz0FvqgLJJvQHSTGclVVOx5CcrjkatUi/bK3coazHIgjjZJbuDKNdkq7NYkJmhbIe/7CmZxdvP8tnvi9jLoEXOMRPFpTm6r67wddNVcbkZoO+aY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890221; c=relaxed/simple;
	bh=FNm2hh5OHfEz0NeVmoyHtfpVTCiBtlwRR1T0NZUI3UY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=R2Gg1OiiUUAF9fiYMEUTi4KL//dhyiPdSvqVfkiI4PSn+I8fmkH+eI33Uja0NNVkwB2jDE19of6XnKiJf0pafD8U25J8AGIWSB8oeghtVGwBmJ47vQp0jIOEEJLCOXlDd2LcfmBH3jhiW2sON84nxb+CdO99+RYCpkXI1BesQvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PQ2VkqW5; arc=fail smtp.client-ip=52.101.62.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PQ2VkqW5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSGhMvLDsP4JpSxfQHkDrvnuwVm4zK0rBAPWzlqyOEVIe+7IIBQY7rIYKX2jCOy8X1l54oU1D9asS27X1lUgc7c5SeS/7dzIOBPIXZz3EaPjp7oFtpBXkjswPWDE2A0+aJYLXYa/Vl8gr123OMx4BLoqILRvrH0EchfX7en9d15gPirqCxoatP/IrCooUYb5p8t6P+Rr7WsBIf7GFHRbfiF0u+BOUmH+u8pCjUoVRLd03KttAXCqSMTYzOO3egjaX35HDSbHhDEweGbiCtcn+5iXWP2zUzhkIt4zpSWNLO4qkyVizC4TerATbY0aCWz5UB50a6cOO/V6utfVhoBPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptTOX9UExYG/yEANhRDjL5RpOoyyUfw5hbOrDXaLgEc=;
 b=WKCo2/1N6XDDfNIGLPv0d7AzKVhmvB3vz1h/ADX+SwtDjKfZQ4YLOOdEdXcr5u4c57S59VCv5DXVZQC6/sP6uz1EP/PHu7v8WFhAw8QS0KeM04R3vZyVi4f2fCrQJYk1uLhmAhkRhD1cj8ufvcOKaDPsplhd0JtPCw9eqTc1usTGYilQL0g6KBskGrgixaWwaITvLEzQJ/cGaDKnelLb1OXrYc1lwRBwiVLmNsYfdDXBWyXaY29ouhBkFjuF7rAu99/AesAz+oFfvM5xUUNMLRF/1DT80XqRdkoaeLIVGLjZwNuFRho81flZDRZ8ZtKKKQa0Z5eBJoJwTdMKnbxHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptTOX9UExYG/yEANhRDjL5RpOoyyUfw5hbOrDXaLgEc=;
 b=PQ2VkqW5t9rRJd8SusuExh8rKMek9M7MM4ROqaLtXAZi9m774PznQpYAWa6s0jANIPYEtQgCdc0KcUjSPw/R/F4tWHTiNCSlpl5BibWbUjr+MOYaeF9ZjbAIQHU/0ILJNsFNoVi84c+NpoYa2utjmg/Z3ucTN8NrVXLEtR8j/RlK5XJw41MTBOMWSzkS3g0wWV6HWSZzOnwIasj20mFtpoBexm3+QMrofBiXVQqkq4+I8LQX2iS7euU2CaXO/yS/v0epy7ThIXvgCJrIcD1geEaxKq2wYHJKIzYSNz4sjygJPN0vs64jrJVS4JJpgw2hR9FxPRRw7c7A0dbue0r+bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB5606.namprd12.prod.outlook.com (2603:10b6:510:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 06:23:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 06:23:33 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/6] rust: add `bitfield!` and `register!` macros
Date: Tue, 20 Jan 2026 15:17:53 +0900
Message-Id: <20260120-register-v1-0-723a1743b557@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nz3aLU9MziktQi3eTkxKREwxQjQ3NDYyWg8oKi1LTMCrBR0bG1tQB
 aLhbhWgAAAA==
X-Change-ID: 20260117-register-ccaba1d21713
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: 277cc1ce-8126-4853-5011-08de57ec6f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXR6bnhabEpwc2NZak9qMEw2TWFWWGZkTlNkYytVeVVrL0N6Qjd5Z2RCV1Fx?=
 =?utf-8?B?b0poVko5Vy92RXc0ck1rNGFNTmk2ZW9BMFZ0eVF1anR5QjNSYTd2NVZIbTRK?=
 =?utf-8?B?dU1LcEExVHZrR3FqZlcwZnhuZ3lld0xwQUoxdUxqTzRFbmkvMUo2V015US9B?=
 =?utf-8?B?dkthV01mclFhbStUeDhRT0V6YXBBQUlieU0ydnBvKytmZkZtMTdDNUhtcSsy?=
 =?utf-8?B?bTBSMU80d2YxcEZiYmphcHRHOGlJQSt3KzQvRlJxR3dkYWtMSzlsbFREM2Ja?=
 =?utf-8?B?WUQ5TDBIcko1UEdJdTBvV1RUbERkM0VZV0JPc2FlalBLZ0J0bi9mbmcvbHNM?=
 =?utf-8?B?YUtlTFMxTTh6UVd4Y3FrODRrREVSQjlvdGJJM2w0TjVSL21nQmhONWVwSmZX?=
 =?utf-8?B?aldwMkkvb3dvY1M1OTJjK3FWek5wSlVPaXRFUlNuK3ZWWmZPY01HTGhlREls?=
 =?utf-8?B?bkZEWGp3bG1TY2xMYTdRcHV2aTE1Rzh5NjhIREZqbS9XWG83YjRnb0VCVU8r?=
 =?utf-8?B?SlRZQVVFbzk4MHlKUUtXOVNKclhnYVBrVjF4SjRuSVFZejhkRnVMVUhQQXgr?=
 =?utf-8?B?dlUzSTd4bm55cG5rQVdXUXdrOC9iR3ZOSzdHM09JN0pYTlZ3a3EydWhyYjd6?=
 =?utf-8?B?V3dSZTFTUEx5U2JwaGNaTVUvOWd4bTkwaG5ONk5YR0pIU2d3K2s0VnpOL3FC?=
 =?utf-8?B?eS9QTDgxSW5xbEZSYVVWMTFmTGM3bndWSVVCVTRHV1hCTGlOWFJVam81YlNi?=
 =?utf-8?B?eHF4Y28vS0ZkWVpBQXlyaHF3emd6V2J2MG5Tekx0Y3p1M1p1cW1MYnF5YTlp?=
 =?utf-8?B?ZTgzWWlHek1PeEVwSFpSSkNzMDl5aEVhdkhGS2NXSGxZOVZVMXY2ZW1FUVRP?=
 =?utf-8?B?UlY4REF2MmI1V09ock12MEhOeFE3QWpQWkNiT1JDM0xTR0xucnJUdUtjcVJx?=
 =?utf-8?B?ejROanlBYWpJUDhlMkpPQXVNL2g0ZDd0dWYwL1drRTBSWmJzWWxVWTRBd0k2?=
 =?utf-8?B?cjRCbVcyUzJTR0RsVWxRMkZFMGlqeVRiVVZIMXN3dGIrTDNBMDN1QjNwYVdp?=
 =?utf-8?B?bzNEaXQrSmx0c0ZPa1VJZjFPa05rTWRMdVJFUFJEa0pWdG1lWXhWbW5FeGVZ?=
 =?utf-8?B?K0VUMnZUdXFBZUROSlU0c2svNHVGL2tWek42MVpMWUd5NEkyb1R5Q2NIRVZp?=
 =?utf-8?B?akNYWGxaNTZCOTAxRkRPdkdYZHp3M0IxZFRBRGx1MnZCcFUwNTdqbEpTUDNI?=
 =?utf-8?B?R3MrSzZqeG50ditnMkQ0MjJxYWJ3WWJqMGZEWitQTGJER1VlME1SNUN0QnBD?=
 =?utf-8?B?b25hdUs4c29GeGdCbHQwNldRcjh0L2QxV3VsNS9OcHQ0VzNCaVkyejFWUi8r?=
 =?utf-8?B?WUdaeE56TXE1WWVOTk1pb1R0U2RzRWg2a2ZxRXlWZkhjSlJVK3Zjc2NUV1NU?=
 =?utf-8?B?L3lzcnozOG0vSFp1anJlUEFSMDU0RVFiemxZSFVQNS9BUjlIMFlZRnBpWHJ3?=
 =?utf-8?B?aU5ycGxIRU1tMnFKcE5qZEpmUFBSUGMyNFl5bmdlenJYSG9YYjBzUE9jekxZ?=
 =?utf-8?B?UUFJd0ZJcjRjL01XSWNrZWg3TjB6K2NJRjAxMnRxbkJheEN1TzlwMmlRY2tk?=
 =?utf-8?B?VUllRjhZdWEyM2M1cGkvN29NYktZY3p5Qml5RDY3K2pxbjF5Q3R0YWhwRnJr?=
 =?utf-8?B?QzBZSjZlU1pTZi9CWmJUZlVjRkF2bG9jYkhrR3l5QmVLZzE2QmNISnVYbVRB?=
 =?utf-8?B?ZTFNNk9zcEYvYStOQUo0MndobzFLK1NmazRmcm1xNmJaUkJHaEdPM2RzR1Ux?=
 =?utf-8?B?ZGZFVFJWU3pUYXlxczd6Q2dPbTNBaGVTWFVqOHdWOFRRdGJEdEI2SkFRUFNo?=
 =?utf-8?B?OHYwTkU1NDdRUU5VeGFGWEZVVjJiNGJGY05XTVdUSGFqb3o4MC9PNFc2djFj?=
 =?utf-8?B?SE51cGs0YlgySWlMVDJwd0lGejVZUGNwbWRNREdPVzJKNW1yZGdMV0hKajNl?=
 =?utf-8?B?YXZFRWtmQ2FKK0JtcEdaYmQwK1M3Qm4wQ0FVcjRRV2Nkb3g0NlFra21xeW5n?=
 =?utf-8?B?ZW9lV2k5eHFvYTVpMU50R0VYazZRR2dVdU5yYnNXRWQ0bXg5RU1qWGhMV1oz?=
 =?utf-8?B?REdUSkJmNllETjh1aTZQeUV1aUk4bGE1bWY1emlzY095Q3ZXRzFWWWFtSTl1?=
 =?utf-8?Q?tgGZ/4XJg3aup59iWp138u4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1NBQmhETzlLTWI2V1krM3UzOTVwTmhSdFJRRVVTL1R1ZG9vOFE1Sys2dE5J?=
 =?utf-8?B?WExHQWRnTnpwMlVVbFpiNVFNRGNDMXFydndWUHpGaWlyV1Y3L3lHNXN3ZURU?=
 =?utf-8?B?SzA1MEVXemtjb3M4eEJUbWtaMDNtTmhmZmJENVpvUEJZTlRud1IvYlVoKzZ2?=
 =?utf-8?B?aHR2eS8xaUdNREtKc1IyVVFqMDk3SHZtdWhVR1hFTTBXKzF5bE41NGc2aUpR?=
 =?utf-8?B?SzdteWJhYjI3TEVLZ0dVeThrWFpXdDhGekVLMzdacjRuWUlrWlVxcEh5dUgx?=
 =?utf-8?B?akkxRnZFakJ1YUdNZnp4K2F1WmtvUVZEZGw0OVlTWmVVVUNKcGtUdnJ0cjh0?=
 =?utf-8?B?VFlwNHhKRUkrUkFoVzZ6Y3ZtQ2pTUERydVZxalRzdUJXdHU4b2lXT3BTR0Rj?=
 =?utf-8?B?SGNEZ1dGS2trMCsxVHJ6aEFRbVNFV2ZvSlNaSkR4TDBvZHc1TlpoVmVnM3VG?=
 =?utf-8?B?QWMweHJwNFJOcG01VjFFcVY5Y0lZRlZBdXk2TWlnYndjTEZDTjJUU09YN1Yw?=
 =?utf-8?B?SUEzdzJZQUFzRDZCWlFmdjl0U2tsWVhMQzRyanVNSnFKUmIvSHVINVVxbWIw?=
 =?utf-8?B?QUEycUpwU3hHaUI1UndOTlpOK2VpaXZhTlFYaHZaam1ZWDM3ZmFWUmJzdStN?=
 =?utf-8?B?dWxrS280ZWRNaHZPU0F4RzFQK2dheTUwT2xUQkh3OElxTVdpS29zZDBTbEJ3?=
 =?utf-8?B?WTl1MkR5VTVrdEs4cXBzS21aQU0vdlhuUExMSXRVOEIxa1Z1R2J3THEveEJQ?=
 =?utf-8?B?eVN6azVvaFBHU0xtbjVjSXdXSG9DaVNBUHEwa2dpd2Jwb0syUVhuVGFuTE9B?=
 =?utf-8?B?VE5yL1ZKc1dIYXFRb2E1SU1lSWR6NncxUSt5VjBCaXZQckZPdzVHVE5iaXhF?=
 =?utf-8?B?cnpwb0NCNzdRdzhUbUhDUGtGbmVRL3hXTEI4UXZLbXM5bzJpemkzWkhwUmkx?=
 =?utf-8?B?eGlzZkE2YnQ3bXdDaEJwcEs1NHRlVnNjdU41M3VVeHZqbUNyaTQ1Zzc3VWNI?=
 =?utf-8?B?bXBUK3Jxc1AzYnE2dFF5TEYrY2IzYXc2SHJtTFJXb0Q5M1A5aktYSW16YlY4?=
 =?utf-8?B?R3cva0RBTEoxeURLVWpvaWJuTHBoTCtDZE1leE5EZjk3VEtqQklteFE0aVhV?=
 =?utf-8?B?QW4yejRCY0FiaGxza1RFS2YwelRuYVlpVEplWW9ka3NzaUVVYWZqbEVSTG9s?=
 =?utf-8?B?VCtPQnZodzNrZGl2bTFUdWFXRmVZZUs1a3o0eWsxR1lBL1did1pGdUpGZlJJ?=
 =?utf-8?B?aVZ4QUFXbXQ5ZS9kdmMxcXc3a201VlhYNEFLSit6cUdBank5bW5LaFBCUW4v?=
 =?utf-8?B?UFloS3JvaWtLV21IZWxIcml2NnhWdThCck5MS0QvNDdiNVVMVkIrZjVtdFlE?=
 =?utf-8?B?NWRSaUw0VTA5VE51RC93dGQxTWcwclpZYVhjSzY5ZHZvYUVIYm5KamNvQWVk?=
 =?utf-8?B?dHk5ZkU2bDIwV2llUDFLeU9sTWdJcG54Q1hNNC9YVmp5bXhBVXhGNld5ZUJz?=
 =?utf-8?B?YU43cG5SS0VTQ1kxSUJWMjExak1QblAxeDNmTTJOVGtrV2o0UVBON21UK3VU?=
 =?utf-8?B?S21GNzd2QnFFb0I2NzZoYUFKY2V6SXpLVmpxUDdWVTJOdmJPd3Vzb1IzWWxw?=
 =?utf-8?B?SEd6UENyYmlXN1RuVXYwTXlQejRHUmhjaS83bmU2N0N5YXhydFVXeXFLTGNR?=
 =?utf-8?B?Y0kyUU5nbjFHMURLUjB2ajF5V3ZLbUNsejlNdGp0QmQwQXVscVFzNDFDU0JT?=
 =?utf-8?B?bTBOZzRFUThKazlnN3liRi8xMmtEdG5RdGRDcGhGb2xYQ1BwZ2JrYlM4MW9n?=
 =?utf-8?B?VUtlOEJPa0xwN0YvWEhkdmswYlpVV3A2UDNHbFQ3RHV6TTRGV05UQmx0Mm5o?=
 =?utf-8?B?ZmhMek5rbFFrS1JPWXd2Z3JKU0VGQnV3cUdTcTU3UEthYnBITUltcDFJQ0Zo?=
 =?utf-8?B?RGR0dXRSRXpXa3pSMlJ3cVorbHNqbTdCKzU4SWIzdFBOTjZJeWxxa1E0TDQ0?=
 =?utf-8?B?MWZQM29HQTNmOE84OHpSc3REa0xvMVB0N3IvVEUyd21KNnhjY3NEMVA2eW5l?=
 =?utf-8?B?UW1KR3pnbnVlS21JaUtac1RGRkFmT1lFcTR5VForWnIrcVgyQXloNW5ONjlH?=
 =?utf-8?B?REtraWpSVXhsZVRsUm5oekdub2lrdnpsNll1REZQM2dpMC9hQ2s3ZEtUSTAw?=
 =?utf-8?B?TWVPOElHSE05bHN4TDduL3pBOU93QVFnSEt2WGZlQm1LNlZMT0pGWmRlZTBQ?=
 =?utf-8?B?Y2QrOXd6MnpYc1UxSWRPSFhtN0FrU3RFODQ1WTZYRW1kdjFJUUVmNEthWUVZ?=
 =?utf-8?B?V1ZTeDRnWCtyTWFKcDBJL2pjZGR2SU13aGttWk9zQ0hrQ2xpR1RwRENDaTZk?=
 =?utf-8?Q?37dokNNy3Pg2GLXV4PxNpL2oL5e4w45d8JuqNRod2AYVC?=
X-MS-Exchange-AntiSpam-MessageData-1: TMOvkltCLieSMg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 277cc1ce-8126-4853-5011-08de57ec6f95
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 06:23:33.1394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AhBfzKx+w1NHmFC3b0s1Sz2EQljUSYatjUkej+xQP4WDN6P7frbbB79Hpq5eGPiUR/9AYAJl8ygUsnRWkonGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5606

Add an improved version of nova-core's `bitfield!` and `register!`
macros to the `kernel` crate for all drivers to use.

This is not a direct move from `nova-core`, but rather a new
introduction to facilitate code review and introduce features that are
missing in the nova-core versions. Differences notably include:

- Use of `Bounded` to prevent any data truncation when manipulating
  bitfields,
- Extended documentation,
- Doccomments now build and run,
- `register!` supports visibility and different storage sizes.

These updates basically turn a register into a bitfield extended with
some controlled I/O. This is reflected in the syntax of the macros,
which are mostly identical save for the additional `@` parameter of
`register!` and the fact that the `struct` keyword is omitted in the
latter, i.e:

  bitfield! {
      pub struct Foo(u32) {
        ...
      }
    }

vs

  register! {
      pub FOO(u32) @ 0x00000100 {
        ...
      }
    }

The use of `struct` in `register!` looks superfluous to me, but we can
of course add it if consistency between the two macros is deemed more
important.

The first commit adds `shr` and `shl` methods to `Bounded`. These were
suggested by Alice during LPC as a way to avoid the use of the
controversial `Bounded::from_expr` in both the bitfield macro and the
Nova code. Second commit adds another convenience method to obtain a
`bool` from single-bit `Bounded`s.

Patches 3-5 add the `bitfield!` and `register!` macros.

The last patch illustrates how these macros are used by converting
nova-core to them, and removing the local implementation. This patch is
to be merged one cycle after the other patches.

Previous work to extract the macros was done in the partially-merged
[1]. The current series can be considered a reboot, with the inclusion
of the KUNIT tests from the previous effort.

This patchset is based on `rust-fixes`, but should apply equally well on
`rust-next`.

[1] https://lore.kernel.org/all/20251003154748.1687160-1-joelagnelf@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---
Alexandre Courbot (5):
      rust: num: add `shr` and `shl` methods to `Bounded`
      rust: num: add `as_bool` method to `Bounded<_, 1>`
      rust: add `bitfield!` macro
      rust: io: add `register!` macro
      [FOR REFERENCE] gpu: nova-core: use the kernel `register!` and `bitfield!` macros

Joel Fernandes (1):
      rust: bitfield: Add KUNIT tests for bitfield

 drivers/gpu/nova-core/bitfield.rs                  | 330 ---------
 drivers/gpu/nova-core/falcon.rs                    | 127 ++--
 drivers/gpu/nova-core/falcon/gsp.rs                |  10 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs          |   5 +-
 drivers/gpu/nova-core/falcon/sec2.rs               |  13 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs              |   9 +-
 drivers/gpu/nova-core/gpu.rs                       |  24 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                  |   2 +-
 drivers/gpu/nova-core/gsp/fw.rs                    |   5 +-
 drivers/gpu/nova-core/nova_core.rs                 |   3 -
 drivers/gpu/nova-core/regs.rs                      | 265 +++----
 rust/kernel/bitfield.rs                            | 821 +++++++++++++++++++++
 rust/kernel/io.rs                                  |   1 +
 .../regs/macros.rs => rust/kernel/io/register.rs   | 561 +++++++++-----
 rust/kernel/lib.rs                                 |   1 +
 rust/kernel/num/bounded.rs                         |  61 ++
 16 files changed, 1490 insertions(+), 748 deletions(-)
---
base-commit: 2af6ad09fc7dfe9b3610100983cccf16998bf34d
change-id: 20260117-register-ccaba1d21713

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

