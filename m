Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF47222CBC6
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 23:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765927032; cv=fail; b=UNMxcKpSC8IpP0YhX4XZYYi62A25QLpIJuegOT+K19fk0a44oNwll0l3KU+c9PJJy4JSn3pzLZP6mbLVTf3tI+DLWXn4Wij370JeYssDZ+JuxoKHNc38eyLBNdFvhpDNOCnlgXzfPATf5QJTrWmY0CNYizT0SUoztD3i4YFechI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765927032; c=relaxed/simple;
	bh=hAiPux29WRJ4rrJVMrxpjzhzALYzVEOjqZX3XnzRQ00=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mdiXDNXJ3HftK5C6F9SxzqP9BzoGNgrewdJKPLYZ0NkmejTn9q4qSbKgmSgHsjEylwQ/BxEiQNtBB3OnC3FBPDoxEfQpYvIRttUwqloSlFqDk5WqD445S3oMY6MZraciurQNDk4rwrIqzLUnijMPXZsLf6wVVeFoYYtAM9GRAMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iq2MKs9+; arc=fail smtp.client-ip=52.101.61.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iq2MKs9+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kn+NDIFuSrgOUVmRckeGTvIfGaj8AUSqy0vvYxvvq0A9Y2zmeKP0nCSna9CPUezUyUjoMaK/rW3Oi7A9RIzNNbU6GMsvrbCLHILQmJ55+ShWnO3Gl7uFNdG2o6mfltX+mMtXeoJwDWs7jQbiTAJNyYfdTbq1m2dq5W5arbdA9AppkM+2pu4VfbsYIw4nZU7nv2vGPf8pQvp/xf8EChCtLyB9Xn8p0mKuz+tbVccndZBZj50yGUwsuCDg5UD2t7KD1iyQllC03anNV9rstnFB8osHX44rmhwKjuaGV8Mz7vH1y6BwWC5XMGaWo3vNI3bNat6VYYw9ocqGsPZXOZx0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPVBxuH9OVJKZ1aITDOHqf/oSroMmbLiygBm4bZbHnw=;
 b=OsNPCjHnuJXmL1hxMH7KA5k6WHhpYoykDV9nP+euUJ92IG+wW5sVQZpAExK5QWjLPE46xXRaQCDQ1LgGnwXJFhOf7mPzZ9BOIY+sO+6p7LdP64bFisort+VNIQrX4euj1VIEB1bHh5geqnQx9R7aIu/vWYtJLXaMXupRSswdiPV/IZ/Q9PVwOc+h22va9fLN37HaP+1BePHISgEBuVZxxdTjAd3q37z5+/fWaJVivJryDxkUzq6p5NPEP/aUQF4ZxOyDpNDRp1QuqvsT2/HGuYk72JAHXaYlcLB464NE27HJCPkZ01yWam78Pdac0QyFlo0TtmiOGVNXxb1F8xAFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPVBxuH9OVJKZ1aITDOHqf/oSroMmbLiygBm4bZbHnw=;
 b=iq2MKs9+lnKQHC+oyI1JLZol01UyNH5tsE6z0Lfds9KMQl4JehLpkLkB+ZRtl9MWzCR6yt379sIuNehOgTrG9q6akbviRqm5/G4utP/oXoijCTwnofmWOnmDIxbyvPSbLxUCg1+BHRdmMxWnsljBDJJ7dl9kKX/CL9VC3e0C04kVYwieliaWGFk0YmXtjjTvl94QYzonCQX/rqSO+QKneI2dxGAeQw1bhuujSaFDprHM/pjDLq2vn8n884LkC2PlzOqljuYpg8D1QgVgk5bvwnk3k2ICc2ia0S4XFJY4dIO87Op+50sqcraxX1etVlaA0wCLLrAXSggt3kW1bfW3dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ5PPF75EAF8F39.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::999) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 23:17:07 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 23:17:07 +0000
Message-ID: <b2d3a56b-0bcf-458c-a17b-ac3aa25f2543@nvidia.com>
Date: Tue, 16 Dec 2025 18:17:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] gpu: nova-core: create debugfs root in PCI init
 closure
To: Timur Tabi <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 John Hubbard <jhubbard@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
 <20251212204952.3690244-4-ttabi@nvidia.com>
 <20251215114036.302303e0.gary@garyguo.net>
 <5b457694fe94757959fe251cc3e3ddf31b6b1fcf.camel@nvidia.com>
 <a7220609-63e3-4288-84e0-4e3257f2c3ad@nvidia.com>
 <bc1ff6c7c86487143de7afaaef78d8361f590c13.camel@nvidia.com>
 <378b8542-86a4-4c8c-b1ec-070d1b2372d6@nvidia.com>
 <1dcf714d18d63e18afc13830e030209214bb2e7c.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <1dcf714d18d63e18afc13830e030209214bb2e7c.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:208:32b::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ5PPF75EAF8F39:EE_
X-MS-Office365-Filtering-Correlation-Id: 588a064b-77bf-401f-99a5-08de3cf93b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFVEbEd4V0d3T3RpZlptL1FFa1pWQ1psM0tHQlNwdXRrNVMzblFUOU42Rk53?=
 =?utf-8?B?ckw4TElYdzE5L2NORlJaOGlZTUIvK3B2eG9YSXgyVThiaU1vaHdkM2JEb1hi?=
 =?utf-8?B?T3ZkaTRuL3FPUjByQTRrRHdQU0hBbjB2cmFkR3YrWE0yV1Y4NTh4dGl1TFVI?=
 =?utf-8?B?N0NxaStFbTVGTG1jb2VMQVN0SFlrL2VabzZVQVhOUk5PU1BzaFBXUFBjMVRo?=
 =?utf-8?B?NFAydUU0WldLTm93VFVGZXJZdFl1aDM5dFMxVjUrT0JONHBRTlRMQ3FEZUlC?=
 =?utf-8?B?Nms2V3lSVnZhMWNLME92MUtsM0VwQXM2Q25XbThERG5wTzdvVW05QklJdWdK?=
 =?utf-8?B?RG5QSHVOeWdXSHhzeGhwNjFLV3RFWE8wa3BwZytieU4wSmpnSnNxTms3L0x0?=
 =?utf-8?B?SmpIRTh1WXUxRjMrc2dhREdXNHI5U3lDbFpGa1doNTRxYjFRNU5KTGpoeU5x?=
 =?utf-8?B?TkN6NUllZEFoZnBNK0JuczNwYklEUnNkb2pmcG0xWHBrYU4yR3JWTnpzbnRj?=
 =?utf-8?B?OG4zTGpzRWtwWkdWb1c1SEJRTmZUZm5HeEs2Zm15ZDBZMnJlVmVvZVdJZTA1?=
 =?utf-8?B?cTJqWFZkTFNUeGNpb0YrT3dvWFBsT1lHYXVQbkswVnQ3Y1NWZUpyUVR3bUJ3?=
 =?utf-8?B?S2NnN0JOQzZXVnd1ZkNheTZDYXN4MHFQbTRpWWgwVlg4WGNJWFNIVGVFWU15?=
 =?utf-8?B?TklSalFTTlNOVU1hOTJHQ1BDdXA3MXh6VDVVVi9BSjBPRnRuOFcyVXV2V0FR?=
 =?utf-8?B?UUN6ZEFWajV2aDVGY1RTd3FhbEFHRVpiZmZBTDR1Z0w1YXFFejVFck9jeWZD?=
 =?utf-8?B?Z2hEMHhtTWE4aTRZaHJlUCtpWWw2b1VPRmdweUN5NmhlYWpDZENMYjRqMThN?=
 =?utf-8?B?bjE5TExBbEUzNXo5cldqSG1pZEhvcXVjZXdqTE5KRHMwRWY1WktxWVZRc2FN?=
 =?utf-8?B?dExXT1U2OWJsYWlmUGNEeTRDNjJuTEZMS2gxZlNhWGcrQUc3a0I3a0V6MHNO?=
 =?utf-8?B?LzBTZDZjeEV1dE1XeFJVOTgxbWI4VjJiL1p1NVUrVG9KUkVTbUpVR0tUMU9I?=
 =?utf-8?B?VnZmeDVyL3RjbHNzbm44a0cxWW9aM2prTWFQa0NuRUh0R3ZiZXVRWlhWT1g4?=
 =?utf-8?B?WmpxdUJsaXJVVHFTWTF6OWVhWEMyc283N1lKNWR1TDZEbDJ0M2RRUCtpb2tX?=
 =?utf-8?B?TDZvOTdiL0RCRmJnSlovbE5rMlJsQnlqTjJUTU5GU0YzRDdvVEV2WXdPeWxE?=
 =?utf-8?B?NDdzSytCaFRiTmtvZUNWTjh6SUkrM3pnQzZDSW5xOHE3bS9OWERiSElYbEFa?=
 =?utf-8?B?OG16NXlhMC9SVVVkZ2QrUGwzVEUyOXJ1V0RDSzJyczZvSlNXV0MzWXJqLy9Z?=
 =?utf-8?B?U0MvVFVzYy9KQmpWQXFOWEZsWWNnNGxQRmNoWmpKanpjam5KdHRGSHJ3NnU1?=
 =?utf-8?B?VXlsTUltL3UrT0dWdDlVNGpleDhrNFdRWlpmVlJJYTJkWGV2UG8xS3VOMVJj?=
 =?utf-8?B?YjE2Wmp6WEYxdnVzSlB0WEsvQ01NRFdud1FxOXNqNE1NOFY3UnRMbFhZa0JB?=
 =?utf-8?B?ci93R3AxREc5OFZZQ0dvMWpOU0lXT081ZHBadGlIaXhCUnM2eEN2ck93SnNL?=
 =?utf-8?B?MExPMG1ka1ZzNnZVSjFZaE9GV1BoNjBrd0dFRExKYnRGSkZyWUwxVW1DbVd5?=
 =?utf-8?B?YkZxM3k0dlExMXVqaGVaTjdJYlord1FCK0hvTFpNRVYwcnBLWXFTRW94MHVq?=
 =?utf-8?B?R0NZZGdxS2lGL3pXT1NSNFJtZjFQcXhBT2oreVRpY05MeHN6ZThVMjZNMjI0?=
 =?utf-8?B?eWI2RHJjNUVwU3M2RFVnRk1Yamd1RGx2ZjZjZ2NqZ3RhSDNPU1BnR1dOVHg5?=
 =?utf-8?B?REVUL3NJQ1ZIT2NwaUJ1RFBZWFlmZUMzeUovL3lTUDdPdE5rV04vN3M2THB0?=
 =?utf-8?Q?QuNLuGVanYlnPKTKvDQ0DqvYoqc0sqnI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTVXV0hNOWd2VjZRdEUvb0xueHFBbVNUL3B4OFFOell1QVFYbFM5Y3RZNU4y?=
 =?utf-8?B?TjFTaTY0S2lFR3AxN1BnNCtGbUVibXBQcmJlQVpmcWszRGtLOVJ5NkNBb2cz?=
 =?utf-8?B?SmpMWmtRSE54TmxQaXhwMTl5SHpzS25wVklweDhaaXd6Nm0rSGFjSkUyaWtY?=
 =?utf-8?B?Wjkremp6WHJyL0REcmlXR3hUMWJTQ2lnK0pGOWVqWmMzSlhnTVlNUkhWVmVB?=
 =?utf-8?B?UGJ1MC9XaktONmR6TXVwMW1JaVFET201dFQ2WG9zMUx5bS9yT0FhVGdZL0hK?=
 =?utf-8?B?ZHFOYy9sZ05yQXlENGgraEZmamVERHJ1czBRei9BRkJxdDRNczR0RWw2UVhV?=
 =?utf-8?B?K0NsMWtQM0tHbVBOa0cxWFdHMDB4KzFwTzYvODlJeTJQZWowQS8zQWs0cFV5?=
 =?utf-8?B?K3R1WmE2NWtFc0ZGaFF1Smw0RVhneXlFaHdYOGIwbkw3ZUwrclhrRUJmUHhF?=
 =?utf-8?B?YzA0dHlCUy9KeFNZLzlPdWFBQUxHNWFSbXFWTGpEc202MlFYTXluS0Q0Mmx2?=
 =?utf-8?B?UFZsWEgwMU1hdUllSjl4NjhzS1M0WXRNZ3lvNHFVSUFrSGxrQjV0N1doalE5?=
 =?utf-8?B?Z3pjMHNvYVZXVk9tby9Nc3dCcGttQmxLMkhmemdIZzN3ejladEdkR2pyZVpx?=
 =?utf-8?B?TGhVUk1IVzNiMzd3emlBRnVSa3JIWTBvMFpKQWc5MGVLeVRlcFdwRy9qalFX?=
 =?utf-8?B?Y0JHNUZiajNtVlFvSXJ0OFREL3IrSHUrNUx5Vno4Z0RZeWRSbFJQVGZvbm1V?=
 =?utf-8?B?WUpvSUZxdzhISHhBK3pya0JvN3dVN2dLVXpPbWIwYUM1S1BnUUJ1MFJDU1ZJ?=
 =?utf-8?B?Z1BRM09HaWc0NWFRUjR6cjVSSEhTQnZsOEFOWmwrMzMvKzZZYWhwL2pJYzNF?=
 =?utf-8?B?K2IvNTZGeG1MYUc4emsrLzI5Q2R0WERjSEpLaU9aQTlFbzhMZXdjbnVqeUxL?=
 =?utf-8?B?aThVNUt0bVprUW1UdkdWRnBOKzV4YjVkWG53c2RTSnVVV0ZNQ2lSVGU5a0dO?=
 =?utf-8?B?MndTL1lVWXhvS1krQnhQRmVPMEpKRVdEN0RCL3EzcExsdWZhRDAwUW5GWGZM?=
 =?utf-8?B?d2w4dEtWTGdrVHNFVFk3WHh0TWI5dUR2eDZXZE0zUEdLdlU4ckJ0YzN3ZUZW?=
 =?utf-8?B?WG5SWDNaVkZxY3BpU0JaT1c3TDBha1doc2JsdGkxR3U4SDhmc0FCQlJteFhO?=
 =?utf-8?B?a1VINkR3ajBHUDNMSUd3S3lSNHp3RTRtbHVaWFRjazU2KzZaQ0VTdnVsdnBD?=
 =?utf-8?B?OHcvckZCVjhLWFp3eTBXV1FjalBiWkJIT2w0b25LeEVXYWkwQy9pd1dZaGo3?=
 =?utf-8?B?aituT1NGMjQwaDhVSGdpeW5mM2RJbVdzbGJHQVRnQzIrbndWcEpPTkN4ditj?=
 =?utf-8?B?VkdSV2JIcGR1YTVqc2ZBU2JJU3RXalUyTWZXSUVIOUtXZE5sYnJZOU54WGZJ?=
 =?utf-8?B?ZGJoZUJLMTN1ZXBWL21mM21JWjZ5MlJ0UTJkR05lQzBJKzA3MnV1Tng1ek9o?=
 =?utf-8?B?RWFLbG41d0U1WkJaMVVUZUp1c0ZOenhBUG9uVGtBdW16QVZLQTdnOEtOUlRV?=
 =?utf-8?B?bmpOUlpMb2dBZVIzVXdxbzRjMFg3dloxcThEdDVnZ05Vdk1RR3djUlVTeVlW?=
 =?utf-8?B?eXl4dFM3bmhJU2ZmOTlFRXg2TjB6TW5OMmZGRnR1a1llMTVsOHFGZ0JwclVv?=
 =?utf-8?B?bi9oQ3hHTVJLQWNrSjhIMjZvWGJZaTlCUGdNdE5OQ2NiM0RZai9jRkxYbk8r?=
 =?utf-8?B?UTFlMmh4OENVTUl3UDEvS1RGMVRxdnJsZksrTzZHSXVLTUczWG9xVUtYUTIv?=
 =?utf-8?B?WGU0Ky9seiszYVdVaTMwRXNBSmkyTStLMlZMaUIzVEVkVmNUQTJuWUZoYk1I?=
 =?utf-8?B?TG13ZFkwMUswUDhKcTh3MUZnU25aV2phY3pubEU1clBQcUJpMVNteC9DNzJj?=
 =?utf-8?B?bi84dVI0dGMwTGhOSVZzcGFueWtXd1g3UXpaMXV6V1lMTjlMQ29hdmNMbEJv?=
 =?utf-8?B?dUxacHgwMUFWMFRSMXdmQWEzUVhOUmdnK0YwUjNQeFBjblZyUHhxWjhPZndF?=
 =?utf-8?B?QVRSRTh5NFRkWmYyd2l0aVlBOVJsS21Da0hBZTN5bkNhVngxS0ZQbUl4dm5F?=
 =?utf-8?Q?0v+VRUfxZRfWAeE2VRKOCQtuD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588a064b-77bf-401f-99a5-08de3cf93b4d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 23:17:07.4095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRDbZ2MuSrwfC6znWOsyYLwiLsgT+agoVun4T9Gyb5TX0vSp8jRehwLxb/tUE7GKPRaRUABaCWSeFVgOIZX+IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75EAF8F39

On 12/16/2025 5:29 PM, Timur Tabi wrote:
> On Tue, 2025-12-16 at 17:01 -0500, Joel Fernandes wrote:
>> Could the debugfs Rust abstraction add a directory lookup function
>> `Dir::lookup(name)` method and allow creating sub directories under a known
>> path?
> 
> Actually, that's an excellent idea.

Thanks.
>>  This would let `probe()` find the module-created root directory without
>> needing global state right? Then store references to this on a per-GPU basis
>> that the GSP code can access. 
> 
> Yes, that would work.  I will try to implement this, but I suspect I will need help.

Cool!

>> Alternatively, the first probe can create the root
>> directory, and subsequent probes reuse it without requiring module-level root.
> 
> How would the second probe know that it's not the first, and where would it look up the root Dir?

Since driver_attach() attaches devices to drivers serially AFAIK, simply look up
the debugfs nova root path in probe(), if it does not exist create it. If it
does exist, then you know you're not the first one.

In C, debugfs_lookup() can lookup a name from the root if parent passed is NULL.

Or we can have a Dir::find_or_create() in the debugfs Rust abstraction which
abstracts this which does both.

Alternatively, create nova_core root directory at module init, and then probe()
can assume it exists. That's also robust against any possible concurrent
multiple device probes I think (basically the case where 2 look ups happen
simultaneously and then 2 creates happen simultaneously - one of them error'ing
out and printing a nastygram in dmesg).

thanks,

 - Joel

