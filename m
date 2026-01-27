Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010036.outbound.protection.outlook.com [52.101.85.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439F322A7E4;
	Tue, 27 Jan 2026 21:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769548939; cv=fail; b=BexF7Dn1BKGbuR/9YvFU4gLdtmomU2M7RYAEgLYgmnPr5awLUb3GODNs7RdWkS1IdjeOnkml/n3s/xLjGyE/13/gu7oZBPy1tFJJAzKEVqFbqg7Qv3Kmh5ZV8M3zZtdWThm1P9Nev7aUuf7O6HO73uVPX1hSP5g06N34re4hbEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769548939; c=relaxed/simple;
	bh=2+l4sYf5Y1NoYTY+qGsVA+ncehO7F/LBrVKViHhmq/k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HXNMBudLgo94gYyxBmMceIhT4k+MEaFgqgZM8R8YoHdP27kM332FMxyFher6iBv7pTkiYiqqfWGaFsUa4WHB31iPrej8F9zBt1odbboAuYcNV+kSuGjiq+kPN3yZ3MgUQ3i7bsTNu8RPIH9b5YXqWVVQSomX+ydjpli2/yRpnYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NRA/SMhv; arc=fail smtp.client-ip=52.101.85.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NRA/SMhv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWhLy/db7fg0jRXVAh8pViYF4K46ehxGb/HobDbBMmQuiuK1EUX2myYbHqQEH/RmEKk5ubQnDgJrKPkvOGOtzW2XXlBGTtGaNUJYu07Pkn8kZiPQfEKskmqAKD8ZIFciCSE3/sJGXaFdpvt4Y/h1D5Sg7aT6fRwFqn76v443/XEPUdZf9reSgD05WYZIq7mjCg7d6RQaSpb6Hlf9jzPO/lkak72fF/0Iu2fAmRTyX8HngUUXYwN824G72nlQlFTAIlOhXvzHX+B1grZwNkwBsIbbPD5G3OT2y3BM46PSG2jUyLA+DemS1bSRRcNuuxL75/bv1vAagD6u43wsNnjp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHuX6Aa+GA12vjAds4Msxg1+cmRi+QFG7fvgtGn4jGY=;
 b=GedEnUHQ+6HSbDpaN8YI9KZHZc1QvOKO5DyDEHzDeZ8g/UPtMyfrYbOU0z7GSavX91ivieKkod0caFCcJ0QhDZGj3kUyNMJ6X+oLOUN8vxP+ST6uAJooXXeiR+g977uMJlrEG+6gGz71tMPzbus/620xsM6bJhipCnOqNr4zYDVyFb5kXVSg3AjjcsiU20ortInYR2j/30n8ynAPp2ma7fRLeIWvQO9LiUX9Q4BZscYEqO96GpU5RbWAJzGOqaHy32KZocNshrbqNIRaE+d1mag2c/yixaepPwxi52N0M8YlhVeAHWv2RjQn+J8PqOQDrkv6sajgzoYvSfw3rkv9mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHuX6Aa+GA12vjAds4Msxg1+cmRi+QFG7fvgtGn4jGY=;
 b=NRA/SMhv/lRDQf+X/+IICWVK3MoSxDK+cuk+ec9fOu1p7RSSIZwOMB6myErdTSrB/xl9IpFlb6NJ5EOXWmF+hBnl+O4CbU3n6LT8xS3EWvyB1IXexHbYp9PIHSF4PaJb01isoGBm6dBKLrQi5wN8V7hHOxZ/zwc3tVS/OlF+zuaXudPwM4XVvonpKfvVkKcT1GRnyOkBvwqLwoMM37GziZjo9RKA71bN3itDTsbmqgP6Nara6ksBWGdt1kAALW2FKEuVJXV31d7W7ZUfYBUdGK548csL6DT4Fp1JzEmOrhfI9vbpfjwNHJbZm9iWawyJz62I/mgJCsYAln4MY2VdKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB6559.namprd12.prod.outlook.com (2603:10b6:8:d1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Tue, 27 Jan 2026 21:22:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 21:22:15 +0000
Message-ID: <9b766fed-85cf-4c7c-b4b2-f20e6c1c41d9@nvidia.com>
Date: Tue, 27 Jan 2026 13:22:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
To: Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>,
 Yury Norov <ynorov@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFZOHYP9I47G.14DDKPXUOU4V0@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 8032c1fe-0974-4c96-986c-08de5dea2463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnNlTHQyVExGZVhweGpDQ0QxdUU5eHRrM1ZQc0pTS0I3OWlMMmV0dmd5NkN5?=
 =?utf-8?B?Y3N3MDNSNVRZWjQxb096QzBUUnkvN0hyV21kSjZiMnVYUCt6RDBLQzFtbFpK?=
 =?utf-8?B?QXhwdTRoNWxiRWIrWWZROFR4V3cxbDY2eFpjRGNpbmtyWjlmbUk1MlliVXpt?=
 =?utf-8?B?MU5ZMDV2Z04xdGVVUkZpM2VMc1pIWVJaSGpJTW9CVVlKK2tJYVVaN29DSDhB?=
 =?utf-8?B?VkxGNHJKcHB0VllaTkFVeTVLRXZteVFwMjRtaTUvMUpoNHVnTHFWZFZuTkNZ?=
 =?utf-8?B?V3p5T2lrNVRocm5zQ1VqVE93SVVCOGZseDd2ejhRQmp2cTdLS21Hb0haSVA4?=
 =?utf-8?B?MzIySklyek50Y0MwRnN3cGlHbWpWamM1SWtHZEVkbnllT0piWTFIbkZVRENR?=
 =?utf-8?B?MWVTajM5ZUNqeFNiVHp3T2gvclRUMHpaVW9laDUrWnhrc081Ti9Lai9RUVh3?=
 =?utf-8?B?YlRpY0hMeHJLT0xpSDlHNG1FaVpjS3BOZzZMbExjWFJ6QnpiVGlTQjlXTjM0?=
 =?utf-8?B?cHdSc2g5UVpwM2lsMnRkMGJhRDVHOGZtOVhWSnFtdUxoZmtWSHBINm01NWhH?=
 =?utf-8?B?KzliTVpsdys3Tmc5aHRINWNjT3pzbjlJWUJrUll3clVyd0laUzNZMVlvWTBy?=
 =?utf-8?B?ZElBako3MllsNjFEb3VCai9HSmxvTy9yTmlRbmNieElpemdmSmE3dWdSbG1z?=
 =?utf-8?B?ajlFS1FJYTZlK3hRVTZ4NVNCQ0VJamxscTIzcjIzVmlvYzdESnJJT3ZneElN?=
 =?utf-8?B?dnRxRlR1b2tEN3hKVEdYQzVLL3MyUUxEVmdLWjE5WnRZMGxrSE5rWGZFNG83?=
 =?utf-8?B?by9sS2l1OHIvU1VISGIvOEs1YkNKbGdybWxWZHVBbE9iSGhISEVDYThlUG8x?=
 =?utf-8?B?a0VkdVJxelNRdmFIWkFqdVJ2R2tzMlZjRTUxK1dLUi9zMmtSTVBrQ3p2QW5o?=
 =?utf-8?B?bjBydW5SOUdVWldqK3FodDdCU09lbm9rdU9EeWRMQnhuM1JpUEoyQUZxMWRz?=
 =?utf-8?B?Q215UXJwcGVmV25YLzlJQ2lORk9KUktBUDBHQmRJSjJQV1JVRW0zd1JNanM0?=
 =?utf-8?B?Vk5uWjhEZ0xJcmJqekwzSWlQZU5VVXRhOFh5ald4aWwwV3poME9xWVJrTVdu?=
 =?utf-8?B?R2o2YUNQQjQrMWZPcFQ4REhYcDlqZGREKzEydHhWcnhzUWV3cWNHT1gzSWVQ?=
 =?utf-8?B?bGhpME1QUWNSRVQ5aytxVldFajBUa0hhU0xGenYwMEFSZUJ6b3NKSVk5NExR?=
 =?utf-8?B?V1JEdEJralBHa2pQK2Ezc3lHenpGNGZFcXVoZmViRTI2VFh6L0JwRDdoWnhh?=
 =?utf-8?B?bmYrYm11SmNEaGc0YjNaRjcwV0hkMk96UE5HNGZYMjNVR3I0dlFKMjVnanpD?=
 =?utf-8?B?NmFpTEVVVUZzR3pLVGhCQ0swTWdrelgrSXNpTHhXckJYcmQ1TzJJNzZ4NERB?=
 =?utf-8?B?cjY1ckZqZ3Jlc2lkcmtaREZkeHRMQTdmN29Ob2JGTS9QSXBHeS9zWVFIbSsr?=
 =?utf-8?B?N1BLUkc3MkFHREF5b245TnJuNCtXYnpDNTlueXcvK1pnaTZ2eWJQM2JaNk1H?=
 =?utf-8?B?RVFiQzZ6Y0pwZ0RhSWFtaHY3eklzQkdzcDl0d3AzWGhDamx2YVd3bTIrejJo?=
 =?utf-8?B?M2hrdDhseEI0QlBqcjAxaStkWU9yeFJoTkJ2WmpkWU9Na3gwbVgzSlhqNTAr?=
 =?utf-8?B?S05uQm4wT0lnVGFsenpuWWtWNFl3Z0tRMFliOTJEcFBwbEdjYis1dW1vdnFC?=
 =?utf-8?B?TzhLNnVnem9QNTBJd0dDYjlabW5VTmluL29uTWp1L01Fbkl3bnRYd0drUDB3?=
 =?utf-8?B?dXRsbTh3UjBVQmpkSy9scXhPQmJ6YTdIQTk1cWhpUllJb2lIRlpDZW9sS3lI?=
 =?utf-8?B?cnRjUVFFWjAydnFCaHlCQ2FuRXlZaGt5UTNsTHVyUWpoVTVkanhVdEJOOGwv?=
 =?utf-8?B?TkVlemwxcnBmM1ZwVE96ejhtajNRM1Buc1YwWWZkMzlNM1pQUThNcTZCcUdS?=
 =?utf-8?B?K1lDOU51RDVCVVlqMXZjMEZKTGt4bERmNW5HZG52NElwaXkwdmhsZFNQY3hl?=
 =?utf-8?B?NkJwMGpTOERCMjZvWEtaYWdIdUQya2kyZjRDNDZSWDhVQnRWWW42dUJhd0xt?=
 =?utf-8?Q?gXP8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2liNDdKVHhDNHpJZFNvdzQ5eFNSU00wK2tqc3B1V09MU2cyY0RQeHk1b1VU?=
 =?utf-8?B?QUlITFlBZlBCbk1iQlVIcTFkMlVtelB6b0N0V3hRTGJ6TnFVQmtLSmNWVVNq?=
 =?utf-8?B?cmhSeCtoNnQ0S2RZYkZtMzJ5R1lSK2hNTU9wUUtpaERLeU04alpmVzlpNHRD?=
 =?utf-8?B?MExvcU42Y0t3Zm8rMlU4QzN5ZkllOFZQMy9YV2RMbVN4V2N2bUxMUXZmUkRI?=
 =?utf-8?B?d1V4cVNHOGc1bGxrL3NJWWNxbXNFbjFLT1VOb3BJdENOMkNkQ0NmeHZGZDZV?=
 =?utf-8?B?OWF4K3FtS1BpV3BNNk5EWDBsZGpIT3pod0gvMkVOeEpoL09sN0g5ZlVlRG5J?=
 =?utf-8?B?NjVwcitMVDU4bTRNSmlIQWJqQW5wSlB0emt2QjMrSDNSRWFKWThJSUpZMzRU?=
 =?utf-8?B?U0N1MUJKdk4wVjRlNmJxQkpMRFRySDY0RFU4VnVSMis1dGpNZW1VdjNqMTh1?=
 =?utf-8?B?UUJpbDh0SlBsc1NQdmx6SEpZY2tIWHhML1UvbWliZ1Evcmp0THVCZ3NIbkpj?=
 =?utf-8?B?cG1YYVluSGxmUnJSNzRpUDZaa3JKRlV0b21BcDlYUVRqTjZIZ2hSTU1GVkNk?=
 =?utf-8?B?N2JGczJVazRMRUZmZlVpMjNmRnZMRGs5aVRIVmloV01paHMrR05CVU1RbW05?=
 =?utf-8?B?b0d3TkE1OW9KWEk2aUlXNjVlbDljL1ZoR3RPVWF1U2VQcUNxVVNtYVpIcGhR?=
 =?utf-8?B?WWRVaFhDeFJVQmRFdWh5M1RFRERkamUwU21rb05QQVdhaFJBc1RIanczbGtx?=
 =?utf-8?B?dGdLTUdvQzJFbHQ3K014cldHVEFMWnRYTk5kb0p3ejJJVEdlem0zTW5vMmY5?=
 =?utf-8?B?Q3ptY2NJNE13d3hSSHo4ckxLSzRiQVNTVTVmZWZNTlU4TzNZSTJRNU1pbFhF?=
 =?utf-8?B?c3pONHhIbmlxbUNGNk9VNS9HYjlybnZXb0tkWkxJSjZKYnJlRG81cy9VRFZi?=
 =?utf-8?B?OFJJYWNqdzdFTmpNWGE0Y29Gci80bzZZUFlMRDRrL2Zta0RuZHkrYk5BVVBR?=
 =?utf-8?B?ZDZvamViVnlCMDJXUXNQSkI4SnRTbWhxZFVLQmhnL2pScndJbEh2N0xaelRI?=
 =?utf-8?B?QTBDQ2wrOTdxckEwaGFXMXRES245Z3gwaEE3cGd1ZXRpVDJNalZERTZJUENI?=
 =?utf-8?B?cXRQREw2ZkU5d0lFTFR5UGdvbHhTakFCMWNhV3FOZGFVOGhTSmVVd1gxUnZC?=
 =?utf-8?B?WkxabmZROEF3d2J2NkdBSGFXNlNzZlFqVUJJY2JMdnBMdkpneXIycmlMVDI0?=
 =?utf-8?B?VkQyenFmRFg2c2Q0NmhxNTcxbmpXcjRLMjZ5ZXpXL3ZzRUdZUlhXclJyNDFQ?=
 =?utf-8?B?LzhuV2pXOEpnbnRDQUsrazJTa211Vjhuc2VrWlBTR3JNMWtpV09mM01QTC85?=
 =?utf-8?B?WDhJdmVWQTZpalVwTXp3eExWcExoRjloa2Nrd000SUgzeWR4NXp1VVVLS0Jz?=
 =?utf-8?B?YzNDNGxleTJGTzdsNmZLdHhBZEZLWHdrMkZzKy9wSkJzTktSWVk2YUxxOFRC?=
 =?utf-8?B?WTdEQ0FXRUYzRk9xVzRjNm55Q21TQnJhcVJicTlCam1KU1RFZVJLaWl4RGF1?=
 =?utf-8?B?anRJQWdyV0hOUHV4cktGeUFXbXQ4Vm1GTDdia3cvZ2w2blJiTVNMd0tGY1Bj?=
 =?utf-8?B?b2NsbWtPbEJJMFVucHlOK2Q5dGVQOUxkS3hldkZ5TlF1V0s1dzFvbFlFeTVL?=
 =?utf-8?B?YzBpTTFSdVRSZnBDNGw4b2UvSWl0OUh1ZVowTWhRTHNTSkZiYTRScVp3aDh2?=
 =?utf-8?B?dGVlZ0hYVVA1bStyN2lrenpOcFVXcUd3VWRQb0NCanpJeXFHc1hBMDUzY3NP?=
 =?utf-8?B?ZGg5WWhEUTlBdk84SDVZVFY1VitaRE5JRWEyUzV4d1lSVjFMYUZBK1ZUc3Fw?=
 =?utf-8?B?SWJnUXNFakZzZXZLNWtNWk1ZS1QxeUMzdUJ6U005bitZUHdEUFI4MmY3Yldr?=
 =?utf-8?B?Z0FJK2pYK3puOUF4VlRXcGJhbG1Ma0RzclF0Wkc1SXd3ZnoxaVRFR2ZkaGhT?=
 =?utf-8?B?SmZjdEs0MHF2emhDUE9obU84OHd6MUhtdlN2TTNJaXFQL0tDSHQvaHdnSFRX?=
 =?utf-8?B?aHdMK3lqWXU2SSsvNlFMOW5DemVMM282SVEwTVRUTWNzRUZzVllqMGJoR3JG?=
 =?utf-8?B?VVFkVDZCdy9VY2p2UFZRY2hMZVZCZDZhY1FJc2xuZGhrdklDVzJRVjhIdDVJ?=
 =?utf-8?B?TjRwcUlPTzM5R2NFeWxnVXkxY0hxR201a0lVMW1rbVlHVWNxNDFZR3dVV3gx?=
 =?utf-8?B?NGc3aEtIVkY4VCtCeDBIK0M5amNZcVJxdlBaUkdXOUx5bnNFZUJvZytFVFFP?=
 =?utf-8?B?ZU8rRTBlSVdsRTdZNjRXS29acDhDV2xyWTNWSlh6QjIxMFRlTXQ2QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8032c1fe-0974-4c96-986c-08de5dea2463
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 21:22:14.9572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7i16LdclSriPjki/vXa/KoF0QImnoGHUIfsi5edhiO54S/oRElZ+JJYqNHsfxOvFjSSIPxC6TM6lPSyYhc0tCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6559

On 1/27/26 1:10 PM, Gary Guo wrote:
> On Tue Jan 27, 2026 at 9:03 PM GMT, John Hubbard wrote:
>> On 1/27/26 1:57 AM, Alexandre Courbot wrote:
>>> On Tue Jan 27, 2026 at 11:55 AM JST, Yury Norov wrote:
>>> <snip>
>>>
>>> So while we cannot achieve exactly the short syntax above (which has its
>>> drawbacks as well, such as the inability to operate in const context),
>>> we can introduce a new setter than works with a const argument and
>>> spares us the need to invoke `Bounded::new` ourselves:
>>>
>>>      let color = Rgb::default().
>>>              .with_red::<0x10>()
>>>              .with_green::<0x1f>()
>>>              .with_blue::<0x18>()
>>
>> Are we sure that .with_red is a better name than, say, .set_red()?
>>
>> "with" is not so easy to remember, because it is a bit
>> surprising and different, for setting a value.
>>
>> "with" feels like a function call or closure: "sort with
>> qsort", for example. But here we are setting a color
>> component.
> 
> `set_foo` implies that the value is mutated in place (and takes `&mut self`).
> `with_foo` implies that value is returned with the specific thing changed. For
> example, `pointer::with_addr`, `Path::with_extension`.
> 
> Given the signature in the API I would agree with Yury that `with_` is better.

OK that sounds consistent anyway.

thanks,
-- 
John Hubbard

