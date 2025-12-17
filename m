Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1946327462;
	Wed, 17 Dec 2025 02:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765938692; cv=fail; b=I1E3PCYp4N4+Ss0Ufr0z2F80elSz8A3fbwNIMG2MPIksatIptZK4li44sD0emHNC3xJTWOEGQZQVQj214WZUDl2m+fpOpJ9QfINLo7fMKdpChICHmQHPviic4DnX0stoO80+KBSMqi+HsfmNCHbIz8C0XTm2Mj7/uAGPQCxJSjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765938692; c=relaxed/simple;
	bh=SadEHTadjsqo1cw/WLvqrE8OFQCS+Wotdx8rpEKjAJ8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=FIAlhhB7CGGSBDROHCgaRb7aamF12JQPMuvhGJ9WVm7X3MEKGyr/tB11BOGq1sMSPZQ15RhO8WlGRz2yHSKeRAvelTjhT0Y0M5cRnv290I3MzaM4xEJNE9c66bvn415RQu2kuAtdx5f03aqqYLaDsDsOq35P9tCg2i5rUXyZRbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sN77mphX; arc=fail smtp.client-ip=52.101.62.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sN77mphX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9Flak5+DTmr4Y4xnOuZlxZ9j1I6PQzKr6GI5NR6HuJsGwtkkPqPM9vvfkOvONxXyJX4WDkHchWmXV0iEbUl6wCSHOkG/YJ4nGaTSW9m3WdO0kIvznd0rlmFEwNrSYGtdEa8EgZSSiEr1oBDVGUJLQ3ivfxjBN3InV8IJ510by8gks329bAy/IvcZIkNN6ya624Kf3T1+SuDIIFK0pBTQShzi7DHJvPc0R7oaSBZulRTjHhr0RvmgRxLUQTR2njFkRXl0CrX16aH38W0OQMLO4lQ27Soz73LeTUhpH60ovka0uXNgXK2x81dtqQPeiAdnp4MnEnUGWEW4aJfZ0IGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/m7PW4OlsLcUPG9sAJTBZ97ZwucE4mTtClFHHEtG2g=;
 b=nw9Km713zqT8s4vXH7tQuY7VFM7ZgkKhyjVNXFz6ne32jcIU0kAFIj1xn+4PpsmKsC72Rype2eAhnDSWdovNTAs4vYuzL8qlGRiAKnjSNYIRpvnkzvkWZSEkKDzK48jQsTQPddMW6jGrT6uqdL/IJg7k9nU40bXBDK1jpFZm5h3fknuDqWiO4W/Ge9nehlVp1RrmZ+CXBky2FfQFwhNUTeVD9FfU4ivjO87SBr4ASrhbufvHFwCZ+QP41MFdLJfcLcjCafIMTZ/0LMtOP45DLs6+L/qDKCiPlA4VAEJn4p43QuBwIXxbtR7J7uOyqj+VngTyOsjzD61ZX5e3wEDHOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/m7PW4OlsLcUPG9sAJTBZ97ZwucE4mTtClFHHEtG2g=;
 b=sN77mphXNThuO4pNJC1L0Dp3KimEwBJDQvkMs/d/Up2Bx3mV6EN0vbub1E1Y7M69ljeMfR5vrABB1TWH4gvucErS5/mfZe8qdWkP09qqtbVEK9lLrNvcWzA0bBsX2vBYoB0ApXZ0nKGYR2neEpcmH6fT/IIZjkyUzEf2bt6bduOGxWqpCEfjbDzkI5Uml4B8Dv7Che0gqfRmUMp2Z4YSy76KWs9yKC1tVYcjW9Em/+DmR9/JN8t2tzdajSsCLGweyE95dLFTjtJoIi2AlcKxhK2MkVzlUJrloqTT6yamPjsUkWXiWCSfqR7HTyzOoqYQd3+vfi5iCZ+NHXaT498Csw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7118.namprd12.prod.outlook.com (2603:10b6:303:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 02:31:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 02:31:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 11:31:21 +0900
Message-Id: <DF050MST4PTF.DFB7FVBD25I7@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: Add soc_device support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
 <20251216-soc-bindings-v3-1-42ecdc8c117e@google.com>
In-Reply-To: <20251216-soc-bindings-v3-1-42ecdc8c117e@google.com>
X-ClientProxiedBy: OS3P301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21f::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c1944d-ecc5-4207-b9ae-08de3d145ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHNTYXlpQkpaakVxdWxnbWlCZ0VvQkh3MHRid2VEY01hOHcrb2RzNTJFUWpp?=
 =?utf-8?B?aVlCMElpUGMvZGNxenVyZ3A2RkkvUXJXaS9WcFlDem9hQlFaTjhESTJBaVYx?=
 =?utf-8?B?RmdUdHMvUHNyV0RlZmRPbmcrb2xNZTdNTzFLNzdDT252ODVHUHR4V0tVeGxX?=
 =?utf-8?B?czBLOTNSc3VZV2FzU29GUFpaVlkvcUxjME04ZHVFZE4va085Q2dZQ1JzVVBh?=
 =?utf-8?B?NFVrUjNGUjdDUkhub2tPSGZkTFNsRk5zaDZVVXdXUlR5YTVlLzNjdi9RZWpr?=
 =?utf-8?B?amJkalkyajltUndSb09DeVR2K04zeVJrVWRNYzdrZm5HaXZhTjRrMC82YXFF?=
 =?utf-8?B?QTVKazUxdmI5OThhenpaTWYvbWtkeit5RmFUelN6SGpKSDZEUXRyQjdTSnh3?=
 =?utf-8?B?WHNUNHUvcEF3UExQRU4wbzNjdFNoeUNQL2dhNFd4MjUyUi9xYkswUTl2VWps?=
 =?utf-8?B?TXo1TEc2MHhMVzk3WVpnVHlBZUJ3bEljcW41dkI5TVhQclhzRzArcUFsZk5C?=
 =?utf-8?B?cUVsVERLWnZkVkFTMUJmTGwwWElLR01aR1QyYjkzV09kMzhCSzgyeHd4bXh4?=
 =?utf-8?B?TVZ0TktyeURNbWlNRjB4MHhCbDk0bk9xSnpBNytCM0NHRkgzbDM1ZXdTdGtO?=
 =?utf-8?B?MkpiZEhLREZIZVlUOExMNi9Bdm9JZFpDaUc3ZFIyYjY2QzhHa3loNGRqemNu?=
 =?utf-8?B?aG1RRW5OTHRjdVpvYk83eVZJQlpNZ3AybGJFQ0llTTNXbFo1TlJpbTVtT21B?=
 =?utf-8?B?QjErQjlNR2g5VUdnQ093RVBMN2VIdC9nYlVsbkNJWkZZeEEraFIvVmVrcU1l?=
 =?utf-8?B?NnZVT0RvVFo2ckRodjlGVUFZa3pGRGNiK3AvTnhmRXQ2SVlwV3ZhTG5JOGNK?=
 =?utf-8?B?TU5QYlk2U2Z2M3JOWXV0aThBek00VmVhaG5jbmlqa1J6QXlaZmI1Rm43NE82?=
 =?utf-8?B?TFlmY2RReUVHai9HZStHSjBFaHNkdFV4K2JXczk0em5qMnBwZmFVL0w1Q25B?=
 =?utf-8?B?NC9QT0o3QU9FanVVby9GRCtnczBGVks5TmhYd2ZXU0Z2ZkkvMjJzV29PRThW?=
 =?utf-8?B?Z2IrWEdodGcrb1NiOFZKeVUyY2N1QmprK2hMN3BqSTNLR0VleSsrd2g1aVky?=
 =?utf-8?B?bitSeHRUMjZQTUFkdXFvdVdMbHlkRU1GSTFzd3dheUJ2UTVmN0E2dzRsczNw?=
 =?utf-8?B?ZEF0WDBFRnMrYnIybW4yVEE4N2UySlY3MFMxM3BvaHUrekpXRTJRekVXekhB?=
 =?utf-8?B?dk5kbGhIVFJUVFhPY2FRVE1TemIraWNCM3VFSnBtZjZkQ05uY0dWc204RVdB?=
 =?utf-8?B?OGduVlJQZlVBc2Q4b3R6dGZLbXlWSklmT1hEWHpkZ2xVbkNBa0ZNUmlraStj?=
 =?utf-8?B?bjhvakZrM1luTFNkc2tSS2hsamNBVWFyQno1K1E1U1hGdldlc2NhT3lYeE5n?=
 =?utf-8?B?L3UvYlVMMTNQRGxmalBDU294OC9nc09YTnQ0ZHp0TW5QVnFOVFA1UEFJRWtM?=
 =?utf-8?B?SWx4TnNCZFZLU3lnM20rbUNqYWtNRGI3WFJUOU5qQnB5cE9oL1dDOWoxKzF4?=
 =?utf-8?B?Q28xOG1VY0ZuZkFYejlicXphcXVHTktxYzVxb0dEWFZEZStvWDZENzE3NFA5?=
 =?utf-8?B?UEVQbjk4dXMxSGVXRGRBT2I4WW9ZMjZwS1doQ3plaGhmbVRRdDEwSnpvWkdX?=
 =?utf-8?B?S2k1Znp2bHo3eWMrRnVOdW1wOGFhNmFXdlh4Z2JTbFNZTU1zYjhMUkRXVkxW?=
 =?utf-8?B?N2V3Z3hoM2dNb05CN0pLMGVwU1JlWVptcjhUaEJKdjZobkpORE16MW02UHI1?=
 =?utf-8?B?UHphTTk1R1ZhUnFVcnZ1MXZ5TVRLb0ZjMzd4T3NoajBUZ1BybFFPUytUUFVq?=
 =?utf-8?B?OEMyTFNRRmRiTDczbFlNZ0tNVU5MQ25MVDRPZGZ3ZWRvcmpDUUQyMzJ0c2Jx?=
 =?utf-8?B?N3FJMTJScm5BMXFLVlU0SHJiVTd0Ni93UE1TeEl0ZFI3V3NjemtNa1pRYWlV?=
 =?utf-8?Q?IeLKQgytqbDgs2FU2GKsYfX/nKm/D8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEhSbHlEM2xpMXE3SXhjZ3UwSG5Ub0J6WDdYd1Fsci9FaE1MT0JYN2JPY1BM?=
 =?utf-8?B?TkhlaUdPV3B2VFFHZ2cwRE9mZVQ4OFhnOTJFN3IwNDFxcmJjUEpKNS8zcmZ1?=
 =?utf-8?B?YmVXY01UYXBUTWl0ck5JRkJ3WUtLUmR3UXVJdnNFK3MybGRLY0lGdlhESmI2?=
 =?utf-8?B?VDd4MUdINnZLejFieXZkQnJjaTRNVXdCQi9RTzdZcW9iV1hIT2tCSmM1SSto?=
 =?utf-8?B?N2swNjJhUE90R3J4UVlKSks4M1F2SWYzL3dtcFBadE93a2pCQXI1dUhscHE2?=
 =?utf-8?B?eWpqVk56STRFd0xqMTBSTmpCUloxQk1kanVGNXQxcGhpdlJHcXNRN1g1czdC?=
 =?utf-8?B?ZTMwemp4WUowREQvdThrVVJnbmtCSHBjeWJTNDBVM05VNVNpRmQ2VXgwaU9k?=
 =?utf-8?B?c2hkNjlxMmNWdmxhVHRlSTVYeWJqdDlnaUh1QmRYNE9QZVFuaWYvTkRxdzNm?=
 =?utf-8?B?T2NvZ2Rlc05Xd2haMHovQ3FkaHpub09aWXY3NDFwbHhaeXZqNlhvZWlEcit2?=
 =?utf-8?B?a3ZQRDRnTUpFdXFFcEoxcnd1S3VLRCt6NmJIbnBKNHc0R2FydmpXTGd6MGg2?=
 =?utf-8?B?YlprWUxYVHh2N1N2SnhBVE5udnNLRjM4c3J4ZU5XR3daL1dKcFptdlJDbjJY?=
 =?utf-8?B?SG9ZeUJYZExyZGxWNXNmei92TGJ1YkZ0VGhOOGx2QnVDOXo3N3duWW15VGw2?=
 =?utf-8?B?Nkt5VElTM2gxeWtCK2ZJMkMwZFJmN1kwbSszamdIVGd0ZGpPVVFGdHRia0tL?=
 =?utf-8?B?STFXWmJRL3N2MVB3a2xtL3Zoc3BPaExuSFdHMG5KVzFvQ2NhbmFEb1A0aVpJ?=
 =?utf-8?B?TG9uVHo3UUxBY05yK0Mza0FZS0tVL1VGRmNUNndxcnhvdGZWeHhrZUlxUnhv?=
 =?utf-8?B?aXJvNGhJR1d6NGo5RFR0RTcwaGVXV0xVV3lnNVVxMFpLQ1czcEROVEY3RENG?=
 =?utf-8?B?bnBQSnEvMTBMV1lSQnIxdURsR1RpTTAwTzN2Sjd3eG9wUEtxSVNJTTEyWUhQ?=
 =?utf-8?B?MUQ2QkZSQ2JrdDZxTVlJUnk3Tm9HV0psNWdlczd6cFpCRG0wL0thaC8yTkNF?=
 =?utf-8?B?RGhBeFc1SWRKb0pGUmtwZWxwSTVySVRPOGw2WGo3NjhDQ3ZQT1N6dzRrblNB?=
 =?utf-8?B?MDhyRXJqYnFQbnNHekdoYjJ0Wm1qZVlRVkFhdTdENjQ1VDVXK21BTlQxUFdZ?=
 =?utf-8?B?NkdWWFJnQnQ0WWNUVDFGV24ydDNOZVhKMCtZbzZXT0FWZWordnRFbytxOE1h?=
 =?utf-8?B?T3I4TnZZOVM3K0RpWWFRVTRrQVhWKytxZXJQd05QWUYxUk9Ud0dhRmdtTUZK?=
 =?utf-8?B?SDUyVFAzWVo3WGxMQ1NzZ1RaQWZUTEgxUk40R25qU0RRQkRVSkpiN1dvVnAr?=
 =?utf-8?B?QzV4WHZXdWk0aGNwVnRCeUZzTVZuMU5KUmhSTEZBbXBKdEcrUzIxSXpjTmxR?=
 =?utf-8?B?UXRUci95Uk9QRVRKU0dRVHJJYjQ1dnVkTXIvSG1tem9qQVN6c2JJeERJUjQ2?=
 =?utf-8?B?Tk5UV0JFcEtnOXZ4b3dSc1pFb0x6aUkzUmxjeWFBMmsraWdLY0wwUTU2dHN0?=
 =?utf-8?B?Yi9GaitQR3Nta0tNSlI0TFUzME4yZXg5WUJXZjROVFh0MUVGeU1sUXFFVDBJ?=
 =?utf-8?B?NHdFU3UwSU15bUVocEQxSXJBb2U0QTJWWGRDOS8vUU1wdTRVakc4eVc2UHhO?=
 =?utf-8?B?N1VZK3lIWW0zV2trMmtMbU5QM3RHL3BOWGRZRC84Y2NzOGl0YkdyQ2FLVjFr?=
 =?utf-8?B?dnRBdjE0cm1tK2xuWnpiTC9pWU8zdzA0ZHNSSituaDMzQnZDZE16V1QwbkZv?=
 =?utf-8?B?QVhrRHJMbzBnMjYyMVNhcFJNcEIxQkVxN3lJYWpGMi9qbVkzUVVFUU1wSmJX?=
 =?utf-8?B?VksxN1Q4NjJZN29iMXVjMzZ2M3ZKcm5LbU9DWStyZWZadlVJdEFOa3V2RVJM?=
 =?utf-8?B?TThPbGkzZUIrT3A0blV4UXI4UmQzd2kvLzVQSFRLaEIvc0xUb0FZUS93cFA5?=
 =?utf-8?B?ZEhqZnhsdk5lK3pEcjZYVFppTWc4cnlSUFlYVmUxVU5IYnU0SDgvbXV0YkVj?=
 =?utf-8?B?ZkhacDRvaW5uK1poeUhGTXQrbzRqbFRudE1reDhHRmpCQmE5bndBQTUybE9s?=
 =?utf-8?B?Z20zenc3dGthT3BoNnA1Q1Z0REFFUjVnQkppRTVjd1dBWDVQN1QveGtrdDdL?=
 =?utf-8?Q?CVtjwUhHujn7CW5t+ZQjoN858xxjERa2MxtGT3b6PmQQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c1944d-ecc5-4207-b9ae-08de3d145ff9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 02:31:25.6297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VW+SQMEfHPgYpfoAzg7a/h+It0eS2mbE++XDczGRv7p4YWAGC3ED6Kmd6mwz8beTFJ85Wg+pNfaZ3GPzC25sYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7118

On Wed Dec 17, 2025 at 4:24 AM JST, Matthew Maurer wrote:
> Allow SoC drivers in Rust to present metadata about their devices to
> userspace through /sys/devices/socX and other drivers to identify their
> properties through `soc_device_match`.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  MAINTAINERS                     |   1 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/lib.rs              |   2 +
>  rust/kernel/soc.rs              | 135 ++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 139 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c5a7cda26c600e49c7ab0d547306d3281333f672..4ff01fb0f1bda27002094113c=
0bf9d074d28fdb6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7700,6 +7700,7 @@ F:	rust/kernel/devres.rs
>  F:	rust/kernel/driver.rs
>  F:	rust/kernel/faux.rs
>  F:	rust/kernel/platform.rs
> +F:	rust/kernel/soc.rs
>  F:	samples/rust/rust_debugfs.rs
>  F:	samples/rust/rust_debugfs_scoped.rs
>  F:	samples/rust/rust_driver_platform.rs
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index a067038b4b422b4256f4a2b75fe644d47e6e82c8..9fdf76ca630e00715503e2a3a=
809bedc895697fd 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -80,6 +80,7 @@
>  #include <linux/sched.h>
>  #include <linux/security.h>
>  #include <linux/slab.h>
> +#include <linux/sys_soc.h>
>  #include <linux/task_work.h>
>  #include <linux/tracepoint.h>
>  #include <linux/usb.h>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf12004286962985a068665443dc22c389a2..6d637e2fed1b605e2dfc2e7b2=
247179439a90ba9 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -138,6 +138,8 @@
>  pub mod seq_file;
>  pub mod sizes;
>  pub mod slice;
> +#[cfg(CONFIG_SOC_BUS)]
> +pub mod soc;
>  mod static_assert;
>  #[doc(hidden)]
>  pub mod std_vendor;
> diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..0d6a36c83cb67ef20dc1e3d39=
95752f36e25ac9f
> --- /dev/null
> +++ b/rust/kernel/soc.rs
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Google LLC.
> +
> +//! SoC Driver Abstraction.
> +//!
> +//! C header: [`include/linux/sys_soc.h`](srctree/include/linux/sys_soc.=
h)
> +
> +use crate::{
> +    bindings,
> +    error,
> +    prelude::*,
> +    str::CString,
> +    types::Opaque, //
> +};
> +use core::ptr::NonNull;
> +
> +/// Attributes for a SoC device.
> +///
> +/// These are both exported to userspace under /sys/devices/socX and pro=
vided to other drivers to
> +/// match against via `soc_device_match` (not yet available in Rust) to =
enable quirks or
> +/// device-specific support where necessary.
> +///
> +/// All fields are freeform - they have no specific formatting, just def=
ined meanings.
> +/// For example, the [`machine`](`Attributes::machine`) field could be "=
DB8500" or
> +/// "Qualcomm Technologies, Inc. SM8560 HDK", but regardless it should i=
dentify a board or product.
> +pub struct Attributes {
> +    /// Should generally be a board ID or product ID. Examples
> +    /// include DB8500 (ST-Ericsson) or "Qualcomm Technologies, inc. SM8=
560 HDK".
> +    ///
> +    /// If this field is not populated, the SoC infrastructure will try =
to populate it from
> +    /// `/model` in the device tree.
> +    pub machine: Option<CString>,
> +    /// The broader class this SoC belongs to. Examples include ux500
> +    /// (for DB8500) or Snapdragon (for SM8650).

Formatting of the comments seems a bit off (also appears in other
places, please reapply formatting globally to be sure).

> +    ///
> +    /// On chips with ARM firmware supporting SMCCC v1.2+, this may be a=
 JEDEC JEP106 manufacturer
> +    /// identification.
> +    pub family: Option<CString>,
> +    /// The manufacturing revision of the part. Frequently this is MAJOR=
.MINOR, but not always.
> +    pub revision: Option<CString>,
> +    /// Serial Number - uniquely identifies a specific SoC. If present, =
should be unique (buying a
> +    /// replacement part should change it if present). This field cannot=
 be matched on and is
> +    /// solely present to export through /sys.
> +    pub serial_number: Option<CString>,
> +    /// SoC ID - identifies a specific SoC kind in question, sometimes m=
ore specifically than
> +    /// `machine` if the same SoC is used in multiple products. Some dev=
ices use this to specify a
> +    /// SoC name, e.g. "I.MX??", and others just print an ID number (e.g=
. Tegra and Qualcomm).
> +    ///
> +    /// On chips with ARM firmware supporting SMCCC v1.2+, this may be a=
 JEDEC JEP106 manufacturer
> +    /// identification (the family value) followed by a colon and then a=
 4-digit ID value.
> +    pub soc_id: Option<CString>,
> +}
> +
> +struct BuiltAttributes {

Even though this struct is private, some short documentation would be
helpful - actually the explanation about the relationship between
`_backing` and `inner` belongs here imho instead of in the member's
documentation.
