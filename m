Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010067.outbound.protection.outlook.com [52.101.85.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9702264D9;
	Wed, 28 Jan 2026 01:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769564495; cv=fail; b=ootrjw220TdbfwfNhbqQT/RgoqlQjXfgubQZWEGhXQQS+L+WNLYRSyDAYb4r81W3Kvhpoukh9O5GDvqQ+z94RTefSJX76phRrW4pX23+5C+3rElDxvTMwh407+tFJIamzdTvi1EACLLqN00eWD8dDCQHdPcsU9X7dk1mA2Ts8VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769564495; c=relaxed/simple;
	bh=AZWlxg8PkrwIIvK18iVwdoeT2pGPIu+3PNp8gBQKGFM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NsxNE+RfgJckupMWR7oFaQMWPuui1DlrN9CcxKcYraNAxo0gkmJ6qyy2TWuyBQTxX6p7C7UPGO1BaJJCdSz5XX7FThogI+ADTtSoE5yB5NaeiFvwe19gaHENNCVtCyyvcn1WMYGyhG7n3nXfwhMPI8wRx7FZ7PbUnZR0+589HgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C7YfgjzZ; arc=fail smtp.client-ip=52.101.85.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C7YfgjzZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAq8kx0b36bU+5QGtLanVHkP2JSw+tr2o5z3JEaYcR0+P2YH1NSQ2+Y3D//mFDvseutfOMdPMK7GHS3wXaEgyVGsK9Uba+Zdpa07YALTkfOhVBVvhZDY9Y4qilJtjjC2QB0SwNV+byP+oY3ya4tTjIgeJMQIaLjwwzG0WB7KtHyYL6QU0CiBfRBk8Z7o9f5Db64qrO6Rv3Szp7ODT4WrL71rql9vbM19jVXhTM43mBcvV5Yw7UuPJ1kqmo4QOSrgoWaQdtz0ae8LD1JhIykh7NpJ1gP9oOSlErm5xfX3Wek6jiQsyPLu1+q8ck39XGKaohkLrmugEOMYkiJjXgjnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cq/DFwUnOGd5xpF71PW0nw8nypA3C/+wv3fxk2todds=;
 b=PNSmxYJjDkqwsd/AbCRo2hjr1DbeQQuAMAxqMUsbTE8vs6GIA2Jwinr3ddkjmU/GWqdo6d/ey8n4QlJ6WUrrLh3HGTh7U4Q5Nvkuioubg40YRav1R9SePYBOA0znjcijvycwsNkK1E33f23vI+w3JZpxnaJWTNwNhWC5/cKiWd+T9UTB2bsOGJUsKd+Q4ybD+9j6rzHHabNnKTgbIaDSM/5F3ozZ7intnLgbmZvU3J5/rv34m4xNQO7iJIfNSYgdlYMkk3/W38qHpQV/mUveCzcBa9ycTGbXV1zljJoLuj7TeofLGbIMBJioe9jZfq+CO91DX7V65F9CpgGGxnmGoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cq/DFwUnOGd5xpF71PW0nw8nypA3C/+wv3fxk2todds=;
 b=C7YfgjzZ2v7azGlaFivFb5Nkg1ZgjsEhta7rJuK58BYe9OZMOD1G6a9F5GPijx1eV8Up0YDTQ9oFx+IG+rAdX3hIqpUjJX1BplQYCsPzkBd2YK2gLkqtURi5y945tYhTZyf9rhHs61XDp+ttnw5uhX1w8ajdug88jX6gw0DVylN790LWzSRplnYm9MOTWveuKVR1nqczGcHI003vPzKYbMx7djXHV4kKvZ5aXjCSO6Onij6hHzEOL7kH6itlm91s0xlz2S73ZUU3eY4przkeY8DEBLoNtcAHOatoQBoJ5/V3Z8sMcqf4ugt5avrNb54WZihKndtATzaiXRKcgOe/VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4090.namprd12.prod.outlook.com (2603:10b6:5:217::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Wed, 28 Jan 2026 01:41:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 01:41:31 +0000
Message-ID: <949bf4c8-3fe9-4c43-8b6e-2241cd609416@nvidia.com>
Date: Tue, 27 Jan 2026 17:41:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
To: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>
Cc: Yury Norov <ynorov@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com> <aXCZeVqkDrBWr1uq@yury>
 <DFYK76F1W6QC.CCHFHL1BSD6K@nvidia.com> <aXgpKOHAmvZuMVSt@yury>
 <DFZA6JOT6OVO.FWRPGW2GN9Z0@nvidia.com>
 <2c3ddf4f-3085-4447-ab2b-1976ea0a49a2@nvidia.com>
 <DFZOHYP9I47G.14DDKPXUOU4V0@garyguo.net>
 <DFZTZP38P352.170EYBILZUR92@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFZTZP38P352.170EYBILZUR92@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4090:EE_
X-MS-Office365-Filtering-Correlation-Id: 343ed9e5-719b-40d8-28d3-08de5e0e5cca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0pDMENaUU02UTlUSlViN1Q3TXVqc3BWc1czUXA5bnFQV0toaEp6QlpKN3dU?=
 =?utf-8?B?eWZoZ3hYR094VnlrZ1NVWmNEaGQ3R3JNU3d6SnFHVmpHbUpiaytuVm5IUVI1?=
 =?utf-8?B?TVU1UWJ1U3FIaGhYQnBaNG1IYnRzcVpWWW1SeWV3MzU5QjJ0VVFNWCtVZHpM?=
 =?utf-8?B?M0NJeUY4MHlYVmJoTnFiOVZHcEhRc0tieEg5MzFNY0JTNHVlcUFIUFcxN2dJ?=
 =?utf-8?B?TTBsZy9lQWlJQWRyQldWeXV2Y2VrZVYyaGJGYU55N1k2SDZqUDU4ZVYxR0xL?=
 =?utf-8?B?cWFqWDBlQU5IVHVFRStCakcyRXlFUHdyL3hwZGlKc2VMMWFZc01XK2Z0LzhK?=
 =?utf-8?B?QzVGZFF2RUZtdjBEb210SGFJc1liandONGt2emJmcnVRZ2RlRU1ZRFMyL0dO?=
 =?utf-8?B?cGdvMGdjMnRGaDAxVHhyL1JOcUN5bHFoZW1kR1JsZUNlUjhMMnRpVVQzbSt4?=
 =?utf-8?B?b2d1czlwSVNMeVJZY0xIbE4yell6YXIxeWtxMk9uN0c2U3hnLzJkZ3hSNllv?=
 =?utf-8?B?dUdNNGpWaHNLb2QxRXBCNTJ5TENXSFNuUUNteW16akJ5Vkp6RjhpVWo4WDJv?=
 =?utf-8?B?eUNkQ0tIZUFuWDcvUHB2ZmM3b1RxeFdnSkJZaDFlOGRyOWxpOHlaaU1BSTEy?=
 =?utf-8?B?NkYvYnlrWHE1QkFrOGJIN2JwRG4xU2tNS1FKU0dxWDl5eEFpWFViZHIxUWR0?=
 =?utf-8?B?TGk5Zk91WlN6MW9Lbnlzbmw0RGVESzZpaHBwbXdtMEw4RVZXVEwzdDN2NUlQ?=
 =?utf-8?B?emNPQjhSUjlpK1A4VVZGbDVHTzh3bUJWQlNsYnZ0WHczSG5uYkgzdkhRKzZQ?=
 =?utf-8?B?Q3p3OFZ6UjlSb1lKbW13YmJ3aW1vd3lrUk13ZS9VN09TOFpkOTlGWlZxci9H?=
 =?utf-8?B?OGFuRk5VTlVKK2VGVzFmeEcydnRNcGNZVkFGWlV1eXZoczQ5aW1Bd3VFR1F1?=
 =?utf-8?B?VUxTOUltWTBrMWpvN0RLUERQNVZRNkxFZThrRUFxUVRPejJlaGRGamd0QzU4?=
 =?utf-8?B?bVhrV1FNM3BYSnErTEQxV21CdmNNMDJvMEJ0U2x6RGlWalhYSGhZUmxLTXlQ?=
 =?utf-8?B?dlNFcSt6bXF6SE8waGxFa0RTUHkydWc1R05kV3F2RHRrbEZ6dVVTSWhTRzRE?=
 =?utf-8?B?Rm01TUc5dm9qUjdtOGdzZ2FaVHhFUThDdktZVlM1V1U1L3JoWWgwaDBXVXZH?=
 =?utf-8?B?Kyt1ODZPaEZzZHd6WjdlZWNlS3hLS1dsb0FseU5WZHZGNzVrSHREa3JxM0g5?=
 =?utf-8?B?ZXo5alpJQ1hES211ZzRSSDVvdHhxZURtN3Mvc0FzeU43SzVVTk1YUUFDOW1X?=
 =?utf-8?B?LzhjcTRKMkhDeDQ4QlFYNUo3ZUZYN0p2aEtIaE1jUHVFR1NYeFRXd3Vud2lL?=
 =?utf-8?B?b0hYZmxDdmxJcWFWbTI3blduWW4wS1JiOThUYnhmQlFoUStvcGNIZFZtNDZO?=
 =?utf-8?B?eDBWRksyOS9pNE4zaWhtWTJuaE54TW9haGZCMitBQ2k0YUZmb0dsd2NEVlNq?=
 =?utf-8?B?ZUFxMzFPamEveFRGY0xZdVhQMUIwcy95LzR2MjkxdnBTc0phdFRtaU45VytZ?=
 =?utf-8?B?dForT1BtcWlGRXVRNE91TGpTa1dCU0tZdVJabU1FbitKYTBBRnNxSE1UU2Fq?=
 =?utf-8?B?MWtqQmVwRVlKMm1rWUM2TVdEOUVlTHltcDhXbUhNTGgwT1JxVUx2WWpydWFZ?=
 =?utf-8?B?WWhBdGlHOXhVNnBlaVF2S2M2MVMwbW90eXpCa1lNcktUQXpXcEZZNnVvWTIw?=
 =?utf-8?B?NnJwN2RaajJNNTM0bFJHWFEvZDA1MGZsSHM1Wkw2ZGtveWtITmx5SGxIMDBC?=
 =?utf-8?B?QWZCYWR2RllZY09XMUhxYTlLM1FzZ1gxbG55RklBTW5EaEFlT1FJKzhVRVBE?=
 =?utf-8?B?cTNZcVlqMDQ2RHUrNHd3dHAwWkQyeVRoTmMzVDVidXgwdzlqVHRTYXNXb2V6?=
 =?utf-8?B?VjV0bjB5UkJ3UVpTdm9TeHl3cU00ODEvd3VNRGo4V2l2dGNmZCtQYkFkT1hy?=
 =?utf-8?B?NlVXcHVLTHBEclNuYnNkYXlHSjh6eG91ckVodlZYYVM5NzBXNzkzSmhCc29o?=
 =?utf-8?B?M2JDbUFieUdjNjZFa3NmUjJJSUtSZWNpVGdQRGQwbEplYXh6dkI2cXlOUnhj?=
 =?utf-8?Q?BbMY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVZPNk5RaUlEZ3ZTSkFkakFHdTU1bG4xbXdXVy95UFZXbHdQZERXa0dGR2xv?=
 =?utf-8?B?QXRxNDBiUGdGeWhaL3NvVEIvOXM3djdUT1VhdXl0SXhwRm9LMG8wVU5jYlEw?=
 =?utf-8?B?cFJ4M0owc2Z5N3ZjWlBUMjMrWHI5eHlFVlp1dm5pelFUam1takpDUC9Pc0pZ?=
 =?utf-8?B?YzRKT3U1K2ROR0NrS3dvZnNRaFduVzdsalJFaWQvV2hqSUxMQkNBR2U3QktE?=
 =?utf-8?B?UnlZYUExSFdCV1dGdHNCTmlwT1hacXdiNDR6M0VmL1pRRDlZK2h3REg3RWE0?=
 =?utf-8?B?ODZPYTVkc0UrdERKK2dETDkzcXRhTTVuMXZUdjZMMU0waG1aNXd0VXVhdU5n?=
 =?utf-8?B?TjJVK3FBVFc0L2NKNU50ZXNjTmZGcDV6Q3M3Y2FsbWZ4TWN4eURFZ21DNEV4?=
 =?utf-8?B?bFFnWUpQU0tLV0hKL3JFeHBCNjZpZ3ZjRHBNTDRDRUttZXE0eDZGYktIZ2JY?=
 =?utf-8?B?ZGxXWEV6TjF5cnFqWEJtSGt4TGtHSlZEWStOb1NMRnlUT2FrQUJzbE44QTUv?=
 =?utf-8?B?NFBaVGtTVTI5L1BCU0pmUGRBeFdLZGNGR1NSV3h2NXlIVndpc281K3UwMnBB?=
 =?utf-8?B?V01NLzJFL1BmMWVyVE5IMGh6V3RqQUJUZUlIK0tYb0ZXUG1iQy85SVhOb1lQ?=
 =?utf-8?B?YU9hcjd2ZHR5OUtzQmw4d3piRWxlQkY0ejQ5OHBrT29yU05BbmpuN2JydjB3?=
 =?utf-8?B?dVJrZWRCREtYTElXcS9Kajc4UTFReXI3TlBEdlk5dEJ2Z0VlVlNoYTBYTmtD?=
 =?utf-8?B?NFJpbUxZTjA5SzlObXVKNGZSZlRqUm0zSkZwVy9wSDlBSTUvQ1JFQ1pPTEp0?=
 =?utf-8?B?S0lhWW9JTVZxQUVNMG1oK2hYUm1pR1FhNkdsNHBtWmxERXRVYThVcDJqSFVS?=
 =?utf-8?B?NC9KSjM5UFUrUzlNclpwSVZVWTgwY1BuUlh1Qi80MUY0Njl6aklGbG1ETWZi?=
 =?utf-8?B?T01YM3Rxem1CdW0rNVdOdk9IK0MrM1Fabk16M3dmZXdsM3IzVlNxeTdVNFBB?=
 =?utf-8?B?cXkyQVhGaTlVZHR4L2tjRlpMclM4L3RTKzdCSWdCME1lWm5JVGc1YzlDYW5x?=
 =?utf-8?B?TDdCbDNycHp1RHJqN1FFbVB5ZjNRZHd4cSs5c1JRSzhXZ29XV2hRQnBsR202?=
 =?utf-8?B?dWhUMUo2OEVlTXlWV3hEQWJRWkYwejlnWWFZeklXNGdrVEx6eWxtWnN1S296?=
 =?utf-8?B?R1hpSVpVRi9wYjgveFNXa2M1S2tXZGpGSGl3YzVjaEliUVBxeXZ3QjVJMG5L?=
 =?utf-8?B?OFRlRUVKd3lMcEV2WnVEMjdFcEx1Q29xd0R4bnRqWGd2RXUxTThFOVhBWXAv?=
 =?utf-8?B?TDM4b0FOUHJXYWxmN2JQdkN0S1EyMzBiV0kxc3ZFWGFyY0tJMEl5bW10VlJO?=
 =?utf-8?B?MmtOMXNTWWhrT0xicVl5UjlpVnlWcEpYYnd2MTgrMEFHZ0FSVGNWbHdGS1Fq?=
 =?utf-8?B?eXBYb1I5TmdFamZWMS9LS3QwRDBNb1ZvSEltc1VvN3J5aFVqaTg3WDhpM3ls?=
 =?utf-8?B?Y2Z0aTVxei9WVm5sUEVaeGJJUE9RRVdqb3BvblM1SWtMTWttNzU0QTNna1hY?=
 =?utf-8?B?dG9ZTlNsOWpIVlVFTXA5YTRFVldBZVRYcXNmU0xNb1BrNW5RVFowTHJsbllm?=
 =?utf-8?B?VU4xdTFCWDZIdzVQUWZpaFA3WW9LQWFGVUtxTWlqT0d0blVxbDdUWGpYU21h?=
 =?utf-8?B?RFpoZzZ3UzNzbkg1c1hUVHRjL0h5am1aT09yenVjRTNPK0NPKys1ZzhDYTZX?=
 =?utf-8?B?M2V1eUpHaFc5WFRBUTlnWldOQ0ZFZ3N5MW9YSVgzaFZtZFovM3M3S3doV1pi?=
 =?utf-8?B?Y25BbWlSbExabTZGeGgyWkdIOHROckQyaVU1RFVFdzU4dFJGRGU3djdQSnpJ?=
 =?utf-8?B?SHMwMkpJbGdFVE4zcUJTaXowRTY1RnNsQmt5M2RaRGtXNkNmQldDSlhWajlL?=
 =?utf-8?B?TFJUelRZVW1RQzlsMU5oaUd6MnN5VXRIQ2ZIVlgvTUdiamVTYnRkZHoxdTJ1?=
 =?utf-8?B?cXJsRFQ2TGhnZGNBNzVucWVPUUQ5K0krVkRxWnlKMmdMSW9jeHh4OGhNaDI3?=
 =?utf-8?B?UWFZRUFPVkdwY2N3NncyaVVxRkdla3RnZ0kwK29nNVdCYlYzcHVId2tCbXoy?=
 =?utf-8?B?QTk5dzJPUEdWOG5GcEtHbkFucG5BL1VLNTEzNy9wVnlhNGpRTTB2MWU5NU5n?=
 =?utf-8?B?N1lvcDhWOU9JaEljQWZ4WVRoZWI4b0QvSEpOMWJUSkRVdE0wMVQrcDVXSlJC?=
 =?utf-8?B?Rm1SSDlPMEJRdGh3V2V2aWcvUDBYamh0aHdMVzgwWVBLVmlZcEVnaDM4Z0Jx?=
 =?utf-8?B?VEs4dE01dnlkKzBPSWdYd0xCa2ptWUFZYnEvcTRDWnJJanJ0UEVIZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343ed9e5-719b-40d8-28d3-08de5e0e5cca
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 01:41:31.4386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4Ig7PuiaeacojoU9l+Dfn1x7BnUXH9NxH83yCFlVgNZyLJ3EkAi4L04h39oVdEjRUmnHbNZTcAmwdCK5Rih6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4090

On 1/27/26 5:28 PM, Alexandre Courbot wrote:
> On Wed Jan 28, 2026 at 6:10 AM JST, Gary Guo wrote:
>> On Tue Jan 27, 2026 at 9:03 PM GMT, John Hubbard wrote:
>>> On 1/27/26 1:57 AM, Alexandre Courbot wrote:
>>>> On Tue Jan 27, 2026 at 11:55 AM JST, Yury Norov wrote:
>>>> <snip>
>> Given the signature in the API I would agree with Yury that `with_` is better.
> 
> Indeed, given the signature of the method `with_` is definitely more
> idiomatic. But that is also true for the non-const setter, and they
> unfortunately cannot share the same name.
> 

oh that is unfortunate.

> Alternative names I can think of for the non-const / const setters:
> 
> - `with_foo`/`with_foo_const`, but that's a bit verbose,

Yes, but it is also at least slightly self-explanatory: "the name
is a little ugly, but you can see what it is for".

> - `with_foo`/`const_foo`, but that's not idiomatic either,
> - `with_foo_val`/`with_foo`, but that increases the risk of name
>   clashes.
> 
> ... so unless there are better proposals I guess the
> `set_foo`/`with_foo` is at least practical, if a bit unconventional.

...whereas this choice just looks unhinged, at first glance:
"what? whhhyyy???" haha :)

And eventually the reader figures out why. Maybe.


thanks,
-- 
John Hubbard

