Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5B442DFE5;
	Tue, 20 Jan 2026 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913646; cv=fail; b=p76mfKRtUdW1lV+22UaXPZhdmxvMqtFSdvHCuN+d9BkdyLB8oFFQNU0Z7ccW6tSKVAkywpa2hYWvm6ocJS+GBa1ZqONYVBKZ78g7UcEvePsB8aIcgUOzCDA85wge9z4d+4w9ZrVDHPsx5NN4O9EXsLPrpCRNHMIV8sQkVWVHPPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913646; c=relaxed/simple;
	bh=wjJnoas/p7F4sM8yEueRigZi8OoKF5KvSkj8DEgJhtU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dXMeAwNIz0Aa/tjAZwdHUEWuri8dnIh1og3972QPHMHWF7cdyiXtnptAP4zxF6jq6J9p3Ev11xy1Iz2O0OA5SU9pwkFM96eHISICmGOwn+2IxLwh0+7IScFPpzv6y6QDM/PvJVTPuJf3Dyv096GZt2j8yT5USTXUvNJ2wQCH/ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WIXJYlmW; arc=fail smtp.client-ip=52.101.43.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WIXJYlmW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5O77SV5Xq0JjqkhdopwO/zd/s5w76ufkmgzGnrg8PSNLyyBp3/c7TX/YX+dbKPkJ6w/Eh/qpKk+Lsq5xooITYlTQzxnE0xI0seG6ayswFr1FlNssjHD0S6j92m9IRrLkZ5K25AuaI+Qk0d3a9OY54QSiCnhlL4y5SguhdtzRlFQFsL1Nx1s48HebrkCgAPkyYcgFVbb+SBQsk+hukQxsNsQlO4W8YobQAUejfDnJn4BFadN+j3NWEW2fTghJn602TsBTpP5m/Elk0qOKbajPYTg0iP6NYePqrBB8qO2LzsB7fhZICnsnqdbM43mUWYEz+KA+frheGHXGkqKSu9Vvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQJZLQyBmwltJG4bT7mtEdRaOKCM4klwwc6fwqsG8MA=;
 b=Hyj8a2tD1cgv5yduJf7DkVjVziC5iOueITNaxsj09UnyGe7229WI5TCkzSH/bwCfxRVUMIF7VEO0lG/EiWPABrDPuKI8HseBxM/KVxq6NHi+kd8mVPKkwpXQHXNJgjZMKIyoBIOpA5hlOm8keN0y8GH+Ge/ZyBtQMWaVzEZC7ttlGLXryTFkO7yxW7kH1ELc7mdlW5drX6AOz3IbkB3gpb8O8hscqGu+0en46zr2Is9zi/4Zd6DtnOce8H/ZWUM4FWZ9d3+o1RyYKrX+NkHzzOgyFaQFuIs4II+IfnZYB3aKr1hLcz/7apH5kGimxOfw6zn8T0bceW4R0BjoWMONZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQJZLQyBmwltJG4bT7mtEdRaOKCM4klwwc6fwqsG8MA=;
 b=WIXJYlmWIrP84JXKhCaqEV8VdEpDW317hPnnUwtIoCo2C54mIy0PS3YPRbbrXpy7/gTceHPIYHJ6Z4O17TX8Aoe6tLqY0voCu51sYn7DKD4Od89qAaU00ftse6GzWjPpgcQjNgqdAV91VfXjq+rESV6bPgf5FzxM0I5CFp+3XTvdQi8z/UxyyehC9gThamLfrV+VBw2h3Paiqg4oE42bRzIfzA34DT2kv+dM0ucC9p4+Wdq/XCJARrv+WMmR8HNVHi1KWHQhGlc96Nz1Omn04PIJJmCYwdBGT6dY3r7H38IoJmXScGZjX9yWRZlqyn5AKHitERqh8aiSkQp2Cm7QJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7341.namprd12.prod.outlook.com (2603:10b6:806:2ba::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 12:54:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 12:54:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 21:53:58 +0900
Message-Id: <DFTFJV461GAP.1AUIWIYQGFWSV@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Yury Norov" <yury.norov@gmail.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] rust: num: add `shr` and `shl` methods to `Bounded`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-1-723a1743b557@nvidia.com>
 <aW9AibF0fWNYwRep@google.com>
In-Reply-To: <aW9AibF0fWNYwRep@google.com>
X-ClientProxiedBy: TYCP286CA0207.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: b4591b55-27df-4ae6-a175-08de5822fc53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wkw1Z2tKUkliSkxEN1Rad3ZpMTQ4cW5iWHJRc3hGZW1yRmx1NmFWZkdwbWNP?=
 =?utf-8?B?UW5qMGwrZWh0NDU2OTdiZEVNOGVEdzIzc3ZFdytoR0N2UnBnZmJaSHpHODA4?=
 =?utf-8?B?bkJPN08zelBmMHl5Y2tDWWJuY1h5QjJxRFJoQ0FRZ1oxRlhJckpRd2NSbHZm?=
 =?utf-8?B?TGMrZHZlUTJTMzVkRWM4aUI1TTNIZFI2WS9hMWR5UTFCb0VYK1NzUHdXN3dW?=
 =?utf-8?B?cmlVVG4wekVzdjRDL1F6aDYyZ3Z3VHpsUG1wTHdudWg1UTJOeWUxbnNJTVR6?=
 =?utf-8?B?a2dUNy82UzNJamYvMnY5ajdXU21ESitualhFVXFHOWZ3TXJIOUlOWDBvcjlu?=
 =?utf-8?B?Vlp3djRrL2U3ZFZHTmlKV0J1dlJmbHBKOVExTzEzOU1sRXZSWjkybG5ybnRt?=
 =?utf-8?B?clB1RXNIWUtzU1VLQ1pUdkZNQU1mSHh4M3FGN2d5QzdoVXNMOFMzUmsxU3hy?=
 =?utf-8?B?aXBOUS9uMXdSalhVL2RaL0Y5N2hNWW9QcllON29DRmpNOWRvM2dUVGcyVVYy?=
 =?utf-8?B?V0tqTlhoQnVYNHd5dG9TSmE3KzdtUi85dnZUcnVVN2lCYloxajhWMFRnMXRV?=
 =?utf-8?B?NXhtQXpNOFBmc0tyeU9ZaGwzUzJINnhuTVlVejdhdFNhd0laVUpNM1dNd3VL?=
 =?utf-8?B?UjR0cUJGQlNER0dDRHVLN0NXckFyK0dEQmdYdWRjeTVndU1yMW5WR3pFektH?=
 =?utf-8?B?U2ZUWmdVR1ZaVWZkN2lBZXhxeTV0TGpPOG5xN09tSTI1VVFKNWlyak1jT3Fj?=
 =?utf-8?B?WCtibCsvNGU4WjdVZmZZUXRwbXY5VmU4UnRHUHZ1R2Z4aVJRVGxscWRtM1V5?=
 =?utf-8?B?TnFic0JOdDM5eEF5OXVjZThRMFlVa3lQcGRHMFAyOWxDSUxvcGdkN3EzUW5p?=
 =?utf-8?B?d3A5Y2xDdWpieXRBMlU0MjhHVlVIWWdMM1RVaDBoREhYQmRIaTVwYXJQZ3pM?=
 =?utf-8?B?YXgrNm4wd0EzWmtrVEg1L2dEK1V6UFpJMlV3REtsZXJHd0VEZ2YxS0J5OWlB?=
 =?utf-8?B?TnV4dHQwdkpoRDVYaFJLUWVkT2YxczliWUVEa2VlUHRLeDhOa0lQVUI5QjdO?=
 =?utf-8?B?MFZsMnh5T1VmN1VCemRUejZqNEtXV3NRbTNQU1FqdEFOOFBqRjR4UEw1bXZS?=
 =?utf-8?B?TlA2MnZlN2picVlwQjA3SkVmdXkrdGV0cTF1RVBOemFBT2dJZzRuVm0zTHBN?=
 =?utf-8?B?R2FlRGtMV0NwWDZISzljU2NzQTF5dFNwQ2tRUEJ2Ym91VllJd2hEejlobk9P?=
 =?utf-8?B?UUUwZVdkVGY0MG1GQUg3elBwNUFEaGVuYTFqbnUzZGEzZzg4MWNsd3U4dk00?=
 =?utf-8?B?dmdZMnFKYnEyUEJlaUlBcWx1VnZQQnBUcUp5dFRtOGhERXNnT2s2Q1NuTzdY?=
 =?utf-8?B?NDI2YlhYaFdzNk4zVDBLMjhScVppZkFNZWxOY1JQZDk3SVFmd1orQ0VVY0py?=
 =?utf-8?B?cXpNL1VQdUMxeXlSd2RlRXlwYXZWRnZESFNGUkhLLy9VMWhMM2pNeGxqRTlE?=
 =?utf-8?B?cUp4Zm11WndLc211WnIwakwrRkt3aWczT3lFTzVJVG02cnRya0JHUG9XVE15?=
 =?utf-8?B?Y2FzcFo3SHJZdGFwOTczbExORVE2TUtoSHZUL2N5cUZCUTZQYVZPTEszR01T?=
 =?utf-8?B?R1IvQUk1emxxUnZ4ZGE1c3Z0U2Jzdi9zTE8wN2NyY2Z2TkZQQUNaWDk3cHpT?=
 =?utf-8?B?cTdNOStTWXArOEpaRDhKcWtYa01yZmpGQU51aC83OWx3UVAzYTZrcjV4NlEx?=
 =?utf-8?B?TkgyRWZHcDRvU3EzVVpOYTJiRis0M2pZRVozalRPRW9hRnZYSnFYeHROSXZJ?=
 =?utf-8?B?endWa0Y0YytEenBwTExKTTR0eTRleTZYNXBYbFljSjFYdUlGMVBvV1RURVJU?=
 =?utf-8?B?QkFxZm5PaEgzdDUzaVZIRFhvWFFTT2JHdkZpd1FMRDNOc1FrVkRvNG9SSG94?=
 =?utf-8?B?aGdnaStTOFhYRitsNkM4TzJVWVFlQkJXbytTbVlMeHZNTWxqVW9BUHpheHRh?=
 =?utf-8?B?MXo1RElTc3J6dnRxbWRIVlJXUHhLalU0YTVJZDlWZml1RnpGTzhSTzVqbkZF?=
 =?utf-8?B?Nk9VbVBXdHhRMjZZK3VQck50eEZaWExvazlBYmRXVVV1OGpianVNbXpUOWFK?=
 =?utf-8?Q?sKKQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODdYdllUOG16MEJ6K3Z2dWJvSHA3STk4ZXp0VEpXZnE2c0lKQVpxUmtoMThM?=
 =?utf-8?B?dFlqU3VnRGh3MFJFZUx6cDduOEFsaTg4L2xabmpWVnV3blZoRjREb0NyNy8r?=
 =?utf-8?B?Q1JSL2RQVGptYW1oRzlJZjdwR3k3Q25PS0VISExQTE5uUHFoZTJJby9RNUoy?=
 =?utf-8?B?N2dzT09vQlFBOTZmNWoyWFRLQitWRjZvSXRtSFEzM0krTW1QU3VpYnNiUHdI?=
 =?utf-8?B?QTlUYW5WcXYvNVZKdHNXTmt2UEVnUVhXcGRhamFMSEdnbTkzcU1uUFpkOWdT?=
 =?utf-8?B?dk1pZDlZOS9hemZOUVVmM3pQK0ZVQnNJVlFYVFBBcUxMeXpQcFk3MCs1ZUlh?=
 =?utf-8?B?aGI2ajFJdjBDcnBEbWNtY0VsbE5kOWtzWVZia1U1VWNPb0V1S3ZRR3VxdXBr?=
 =?utf-8?B?OWpUalhGUFNwS2lVcmNXV3dHaURGcnRabDhHa2YzZlBianExUE1LM1JSQmlB?=
 =?utf-8?B?ajhoSng4T2g0VGlEdHFpcHNxenM0enVFaTJjSHE5S2tldlV4WHlMVGh6bEJq?=
 =?utf-8?B?b2ZEREc2RXp5L1QzZE9wdDVPOVY4SGR5ZDdDNU55cGRhYllSdG9TL09DaVBn?=
 =?utf-8?B?dDBOSnRtRkloVXBGMEpKelVRRGxJbTV2bzNzWkFnS1QyaDBQUFRFVWxzY2Vu?=
 =?utf-8?B?R1BuYXR3ZlVFR1ltSHgvcWl1MXFRYU8rTTM0WEwzWUNyOS82Tktidk96dWpt?=
 =?utf-8?B?MlkyY1JTY0JJdGtHdUtqV3lsZEhMMU9oOTFZbWxYWGJlZHdHQTBZckk0SG1a?=
 =?utf-8?B?YWpMRmhHMU5Zd0RyMXB5QXhpeStNeFg4MVNVcUFHNU1WdjFoWUdpVk9INTE1?=
 =?utf-8?B?TkJuSkdmZ2UzeHFsU0NZRVpYUUJzR24wbUttR0ZkS0hIb0tvN0JhTU9YVjdl?=
 =?utf-8?B?dVFSdUt3YXhoampTcjRHbDhsTld0WGl2T1ZnZzJaMWNTRXZZMjdRZ1dMNHRq?=
 =?utf-8?B?dmFPY0R6RDZ6ajluTit3MUp4dUVBRnFOcTBPNkxtSHRBS3RLR3dFWjJrcGZJ?=
 =?utf-8?B?cXE0bkFubm9idkJJWHY2RndQclhDMjUxaVNkczRvdkV0TDdsVjhYNEJHbkdi?=
 =?utf-8?B?TkZEcUlaOTVFQ2tmeEV6eVNHOEhNdkIvbm5KQWZIaWRvWm9VYmNLV1YrYmdD?=
 =?utf-8?B?STRvU2JtdlZVaDlTVEhBekJQZVdSMHBWZmM5YzNnYmN3OEZlUWROeWxROHd3?=
 =?utf-8?B?NXBBQjFvN3dCSzg2OEZSYmFnbU84MTBFVzdzQXF2K2pIMFRETjZrRnZKQ1hE?=
 =?utf-8?B?SGdMbmpuWEh6czJIbDkwVmJJc04zd0dobXNvRnNqQWFSR3I1U2h3U2tEa0FH?=
 =?utf-8?B?NEVpS0I0bnliK3FqQ3BDYm5VVnhzY3ZvNFNvOWgzSjhteUpMSmhYQ0xPMHNu?=
 =?utf-8?B?MktHbi8vdGZkYjVkVDZRMVlkQWd2Z0w5RHg2WUZyamxvY3BGZHJleDdHVG5m?=
 =?utf-8?B?VWgvWnVRa1ZkVDlZUWc3L3Y5TTNOaWY1Z0NOc04rYWFrd1JBNDNxandodUVp?=
 =?utf-8?B?REh6dnhKTEl3ekNIaStZSmRleHFmaWtGaGxYYVVTTHFGU1VoWGhPOEFsS0U2?=
 =?utf-8?B?cTg0K3ExV2JrNG5wMEZXZW5ZYjBsemYyTStHV1FUdGIvOGZYUCs2SDlGS0k4?=
 =?utf-8?B?K0cxMm91WWphZWRLTTRPOFhmRDBBU1ZFUTJJQ1hEclhYbWl4YzhPS0FPU1pj?=
 =?utf-8?B?V0R1WXV4dElGWEprZDR4c3NVeHg3S3g1RGd5SndlaUt4NWJRK00zTitWM3Bv?=
 =?utf-8?B?WEFtejQySzQxM1dBbnNseituSXFac1l2Y1FodGdQREJyZDVUQ2JHS2xobzg0?=
 =?utf-8?B?bDJ6cStGUENFNkN3UEJHbnNGUnM5MW9DMGZGa2hGTVlwYXJMWUU0Y2xNSnEv?=
 =?utf-8?B?RDN1eVVJMFMrOTRsSi9IZmVPNFZlVU91RGlLTi9jZDZmalNaK0d5a0FhKzlH?=
 =?utf-8?B?djViV0p2MFUrOHVjdmZDWXBGbmtsNE5pZ0xxMW9EdUs1OXJ0bkdHQzJrdjZz?=
 =?utf-8?B?eWx1VDBHTTBqL2hXTFdQVWZZc1dyb081M3Z2cHJDVDYxUm9xSnBOTlA0NWNS?=
 =?utf-8?B?NWNzR3dGVEtBWWFlcUtYRjVHL2h5TmREcHBoWVZ2TFNJWmtNUUpiN3B4VEJW?=
 =?utf-8?B?b2ljZVpoOUQ2MDd4ZkdWb2drR0NUR01jR1ErMzF6b1F3cEpham5OZWpML3Bn?=
 =?utf-8?B?K2pZK1NSODhxbDBLWjZ5WnpEdldMSHNsUm9Fd1A0TTR1NFRKc25OM2lTN0RE?=
 =?utf-8?B?bGxqUkQwZFNRMjhiajVaM0NWdllpOG9MblE3OHhZNUZlMVk3QVN0cnRGalNO?=
 =?utf-8?B?MFFaaEJ3b2ZoeE5Cd0JNa1pOV0U4YzJ3bXorQjJFVWIxZ0FHT0g1Y0VrQkIx?=
 =?utf-8?Q?AooFmeSXtFGkabu1214cvOhryRIaRFNKprQXVYIVECBRL?=
X-MS-Exchange-AntiSpam-MessageData-1: /oAWRR/gvZz2BA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4591b55-27df-4ae6-a175-08de5822fc53
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 12:54:02.1258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBa6LDQ118BgTn7ew2I9vYAgnUySykI0atVofs3BNRyFYsIekp5lySge7NQeLZ5K+l/SrL3UzzABR4L1Umknig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7341

On Tue Jan 20, 2026 at 5:44 PM JST, Alice Ryhl wrote:
> On Tue, Jan 20, 2026 at 03:17:54PM +0900, Alexandre Courbot wrote:
>> Shifting a `Bounded` left or right changes the number of bits required
>> to represent the value. Add methods that perform the shift and return a
>> `Bounded` with the appropriately adjusted bit width.
>>=20
>> These methods are particularly useful for bitfield extraction.
>>=20
>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
>> +    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bou=
nded<_, { N - SHIFT }>`.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::Bounded;
>> +    ///
>> +    /// let v =3D Bounded::<u32, 16>::new::<0xff00>();
>> +    /// let v_shifted: Bounded::<u32, 8> =3D v.shr::<8, _>();
>> +    ///
>> +    /// assert_eq!(v_shifted.get(), 0xff);
>> +    /// ```
>> +    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RE=
S> {
>> +        const { assert!(RES =3D=3D N - SHIFT) }
>
> In principle this could be
>
> const { assert!(RES >=3D N - SHIFT) }

Oh, that's right and that's also more flexible - thanks, will do that for v=
2.
