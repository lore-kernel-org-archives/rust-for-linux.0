Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012032.outbound.protection.outlook.com [52.101.53.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F853A89BD;
	Tue, 20 Jan 2026 13:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768915256; cv=fail; b=JD77YHWaGUNzQvOEsJzBJqoJvqphaBr6DshUJVoIVWKNg3XvU+/6vljfOhkFhaxNoWYpY6ZKSHppD06PkUmdpIZN5C+vfo+Vln+iDV/F5HfBhHHuN/13/q5FDvljYusjB7mYV/3hcjcCDLDCkqYWEQeXX75sNlSiaSgBp1InTv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768915256; c=relaxed/simple;
	bh=X91VHBTWJpN+aAuV6+Sinxw0L6dNqyq9Ar9lw8bbXGM=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=jo/gy4SA87QmcA0D2VUdB/kv8gV6s7XX22vdVfeKGrdbBukbrbTeC/W/OcrQEG087Ole8odLjBrkqbebcNBAMLydSW4nUWP7GeZ3DozjygUGI0A7CmezcE2xStM+3WAosLJz1e9/aMm1RtdfYbsp34Qv/FaRzRUJr7zt8zwPBEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fRGfQbgh; arc=fail smtp.client-ip=52.101.53.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fRGfQbgh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHh9FqLFZ5HUYRrzepqESYVuCGPrLCC4MaeJ7uSTX5bcVm/IjO1G8Ihdn+Gk/oluGJxRu0f9eIgD+piB3n+SrXJ6HBKFHkXovSdRTqeA8aQq5oXtxkZuHFNFbmD65eTHmdyARjxb/m2U2ExIzrj/bS3Xi255RSch4ZWItBgP+fb5XXaLke82V/uyh6wFFJkXf/9vWk4hMT4b0X14XcIYc4Zfdb+J1P+1obmkFPMgUbWVM251nupoRy4Qt54oqpTgauIrzEV//04Qh1hNSVpspBl7YWWe/C43U0j4mBjxlES1ByNRuez8EnuJbWcSaDUV60Fg6KPBB2HPlBUfTDD7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X91VHBTWJpN+aAuV6+Sinxw0L6dNqyq9Ar9lw8bbXGM=;
 b=tXRl0wnlxfZV7PE7nqQZzsoyXNvFpC5mj9EdGb/734Aq7/LNKQ//7+G1yLk4cAgf9DeC5zeuL2+b36CMEntxsdG6SSjkixoFIY3gYazQxxu6D8uyxQhXGVHEBaYS3d6A23AF5kfouVKkNqDr+DjqVGXLDCl7JyR+E8heLRlPNGDyvNzOs7oKa4vVgGVQ5j+duXA2JQ9vWmDh4tL7V2Fg5/0aqsUro+ktKgjeBxnX7hkJuDqRO7UUqVNixV5NAwE9SuodxraBvON3L49HJlCBMfjqA9UrlEmz7mH+5+zHzgVhr1uSxAKSeT5a31ox96IGVN24Czj2bWXLbJCnJZ8j/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X91VHBTWJpN+aAuV6+Sinxw0L6dNqyq9Ar9lw8bbXGM=;
 b=fRGfQbghyBNcZDljIiVKiWudD3leSvAdPnXFlleM0HPoOHh+CkYjR5SlzMxNQL7JiPDoNz3DA+rItyS099FdBNPNF4DT8vo1sQbIBEQ/ccpnW1XXYNBtbr9W9+A7R12yQ8X8fBrlJI/tcpYUOLMVAiiAjj8UaJrmAG8mk+MjT9dFXfTWfdOZUo60vCbk9QgUSwm1NNaoB7meFDodYbMbKCPAa1hQJqt710Cd0hSnPs84kgGVnnifxumDtrGFzuaN6ZPm1YpRP72jw0jyWQhutca6gIRAMB3oauu3O3H2zTsUI8FhzeZpZzuVphnqB8eRPwhYLYYdq2B3jGmgOnxPJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7605.namprd12.prod.outlook.com (2603:10b6:8:13d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 13:20:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 13:20:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 22:20:45 +0900
Message-Id: <DFTG4D3D2V3C.1IL4WF5W3H2PT@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Dirk Behme" <dirk.behme@de.bosch.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Yury Norov" <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com>
 <f12b84b7-4972-47ee-a79e-61e8d1ad49b2@de.bosch.com>
 <CANiq72kEVrYWbs9zOtP-h83TTmrOBBqkKEETUqSLZJ47=L6sFA@mail.gmail.com>
 <c17c1506-6ac5-49d4-b5ef-34d90dcaa41b@de.bosch.com>
 <CANiq72kNbBgiHHMpGA5FO5v3NvtLzJKHKiKDPf8XTPDwF1TQzg@mail.gmail.com>
In-Reply-To: <CANiq72kNbBgiHHMpGA5FO5v3NvtLzJKHKiKDPf8XTPDwF1TQzg@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0148.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a695b6-7c14-489b-0ce5-08de5826b9b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkJzRmR3dllqSkN5L3VTNkRxdmFGUkl0WnlSamVIaXEyaDEwR2dYQ3MyMHhJ?=
 =?utf-8?B?UnJ0YVloTHdtQU5yaTlxNkowUlJhSnp4ei9hMkF0UlJOTCs5OUtGaXRzRCsy?=
 =?utf-8?B?MjFtUXBlVjJrc05Yb2xiZmNmMnA3ckQrMGcxbjJTdFNRTkNsdlA4aFVudGJu?=
 =?utf-8?B?Y1IvdmkxVmVlR3V2R3FpdkkxNjdsV0ptZG9jbjlCUlJpb2FRN2gxQlMrQzQx?=
 =?utf-8?B?cGNCRVd0ZmFyRC9leCsveTYrbEsrZFQ1OHFZeC80RTRGWW55Njc3RldWc0Js?=
 =?utf-8?B?WEQrZzFWK21HSmU1ZnpFT0g5YnJ5RGg5a29tZTcyOERkdW5tTmdRMVRrV2Fs?=
 =?utf-8?B?SEx3UDVtKzRWc1dEMWlJQVBTR09aZ1MrU01HQ1BKUmE2Tll3N2ozN3VsYVNH?=
 =?utf-8?B?MTFzYWtNRFVqbTVZdFZpZ2pnSW9lR2VJRE81Vkl1QWwvcU9CRWhoOVdsUTMy?=
 =?utf-8?B?ZUF1ckRibFMyZDRFVmNhVzlmTkU2UHQ0RmZMOVhOYWZ4TmhvVm4yWlcrdHVj?=
 =?utf-8?B?MnJHMlM3VkZhTWFoZHhJNUVVVGxtTDFtM1h0aFI2ZnkrOTFzTGJpWmpYdTY0?=
 =?utf-8?B?STl3ZUYycnR4ZkhRUERoeG04bEJieVVQcEh6b1NFSk1KZkRFajJveHBYME0z?=
 =?utf-8?B?SXRiN21hR1h0M2gxa1RiTDIxWmNYTW9uNkFwaSt2dENoR0dHbDhSbjRGUHdm?=
 =?utf-8?B?WVUyQ1haN2tLSTV0RzdXZTRJTSttOXgwamlLT29FOWdJWWo5WUFDM3ZPaWlK?=
 =?utf-8?B?SGZxMDYyNk5ibVg5RlFRL0ZDUDgwUzh2eFNnNU43ZzNDSlN3dEZ5ZEUrMzNS?=
 =?utf-8?B?Vm5XRks5RXhzMUpzcXNhRVNaeWxOVWVPRkxuOUw4U1NKTmhMNWpnQmkvOFR6?=
 =?utf-8?B?SnlINVIyTWxHVVpaZjFaS3dkRjdWRzFTRlVrR3FKL0tmZDk3cHlUMm5UTUdj?=
 =?utf-8?B?UUc0Y1BETFBtOE1Mc29maE5TemhoVDMrNzNTMjdaeTNnaGVJYjVWQm1mY1pv?=
 =?utf-8?B?bUI0Q1VJeFdVei9mTW9tTGJIeit0VDc1QUxiVzNGM2tUQUJOVHQ3T1VNMmxh?=
 =?utf-8?B?d1kyeXUyVm10NWViTjhyTjY5UENEdGc2UzZ4S1VaeVhpaG9MVGtJY1RnS0dv?=
 =?utf-8?B?U3VWYUdYamltQ0QxSkl5VGkzSjQwNWozYkc4akZUbkJrVjlOMVVRR09NNThJ?=
 =?utf-8?B?d1ZnZWVYSVBNWW1KbHhTUmRFRWQrTzJHTkVzYmpNaGw0YUNaYnZGNHZDK3Vx?=
 =?utf-8?B?a1BMaloxRUZMQUV6dTFEekdrTFRIYWw0NWppY0haNjNLbE5EaG0xSVpTZHhC?=
 =?utf-8?B?Vi9Hek9sOVZDUmNCVTJsSlB4N2J0N0ljOWNTclVnNDRUYjIrL3VxM1I0R2E3?=
 =?utf-8?B?dFdRQlBka2x6TFFSdXcveVdncWdiaVJUck1KOTQ0OFFhV2RjZHFic1BybXIy?=
 =?utf-8?B?ZTBQUzIxdFhWY2lHNFNzMUxVSFp6TFg5M0xlOXFXaE9tQm5xY2pzdFNxaWgz?=
 =?utf-8?B?VEljdzFKSVFrenh5MHdob2RzZHlpWjVFOE94NDA1d2w2a3F3NTBKTE4xRy85?=
 =?utf-8?B?cmFiUTlmeUk1RFJPd3JLN1ErcXEvY1dSNHB0dkJCZ0FHTTBMR0lDd0NHaUJN?=
 =?utf-8?B?R21JWERlWHQ5S2xJTCtiSTNSb2phZThlYW15ZlppUUx0Ykl5SEVVVVd3Sno2?=
 =?utf-8?B?UDdEU2pRVExTTHRhSFNud09kcTVUOC9UaTE4QW0rVUZCQzJtYmlRdzllTHZW?=
 =?utf-8?B?S3JEZCt6ZUZkUGFhdHpXV0dmSm4vMnQycHZYaTg0c3VxMitiOTF6S1lNdi9U?=
 =?utf-8?B?NXhsU0o4bkM2MGoxRU5WOFBwWS9Kc3cwOGZnUGIzZTZ2NTVub0kzQnpXdHk2?=
 =?utf-8?B?MkVkZ3RzM3VONDFwNjRacVNiTUFzdVhKYlJFeTJKandPMmxMenBVM29seDNq?=
 =?utf-8?B?Vm9RQ01zUjRqQnNkbzgwUXlGZC96cmR5b0dZYWh0MHU5amtuTWthUG1KNXpB?=
 =?utf-8?B?V0VtQlhWU2pkbUkxY25wTlVVTHNzYW5oYkN1bW45NS94dkFPNkJKSXoxc3Bi?=
 =?utf-8?B?czdzRlVCeUhJVnV3c0FGWkdrTEJxQXdIU3E0NU9YSEk0dVpaVVlueDU2enVu?=
 =?utf-8?Q?ZUJE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHIyTWZId0tOMThFS1FnYmJqWFcyVlJQd0hybkdxWE5qQVFtYjB4MXBYTlp5?=
 =?utf-8?B?OGd2TG0wVEkvSjVkdzRSMm1nTDBCQmFDNkpFM1h0d01XMWZiQ211ZFRqd1Bv?=
 =?utf-8?B?QWRlTnVtRHUwZGtDOHpkaE5aZllPSFRaUnh3U2l6NmpaTS9CTlQzSjJZaC9w?=
 =?utf-8?B?dHpieENzakx5UG1sVVY2eDBxdkF2YUpHV2JzNENrU1czeWJPcGxOMUE1b2F4?=
 =?utf-8?B?cHV5MTMvaFd2YXV4YUtDdWdIQzR3VUg2bUxXUTU4QVNxWDB2TWt4U1RaSmhS?=
 =?utf-8?B?eVRuTFhpT2k0NlhLL2VxM2hhYS95MVFJZjJDSUlhSWFtN0ZEWUFkcTl6OGdJ?=
 =?utf-8?B?M211MEtZMDZpeFNMb0hiTDdjRVBUQUtVRjlDZHczM2hkcWVEVlhQVmQzNmtD?=
 =?utf-8?B?NU5nUENrZVViaWJDSkplSFU0WVJjWlhkcjl2UW90K1RZYnlkV3FIUVkyK0tU?=
 =?utf-8?B?eFQyUmNQUzhneG0ybmtNUzRESmFldW9uMEEvZGY2T3QxMFRrcExIK2R2VkhY?=
 =?utf-8?B?Rkc0V28wNk5SSURDOTRUNTdIQVlmNGhlalJPUUdkVjRJc3FrMXFiY09GZnlZ?=
 =?utf-8?B?cEFvaGdVLzJjMUluYzNpTUYzUUFtLzM4MU11dlV4dzU1NlJUTUIxTllGbko2?=
 =?utf-8?B?bVB3dUtsVzlUWVBLRlk0UWFpSjhidTRlbjFuaVVOOG1tajM2WUpGaUhOS1lG?=
 =?utf-8?B?cGRBaXJJQ2w1TnZQVDJCNXNwWWtJNDBRcVdrUWdXc09KSzVNSW1Od1IzN1My?=
 =?utf-8?B?Sk5tdWZtMjh6MXVheUVRUlVDdlc2RG9ZRVFLcFVuNG1Cdmw0UEhWb2EyanZK?=
 =?utf-8?B?Z2c4SFdQamp6TTZBVE50dnpoSUZjTmNNNWhTeklqTkxtVWxXMGF0Y1l5Uml4?=
 =?utf-8?B?YmpBSGhkS1JjRkFjemk4dlRtcVdsRnRBb3VuSFQ4RGhOMlNnZ0NtdUpKN1Fj?=
 =?utf-8?B?enZZeHIybmc1TnhFMTRzRFlYOStJeVFqTUhnRHkyYjUxSGhRVXpXMUlBRE05?=
 =?utf-8?B?KzgrWWJjbEkzVUgreUJNK0tMMnljL1JsODVpZVI0dktYVGRFOWhDYUJRdEY5?=
 =?utf-8?B?MDJtZmRVSG1NdGl2aVZFYkhETG9YSFl0Z1FLRWNDVkhxZFRBVXZiUGtveDg3?=
 =?utf-8?B?cFVUS3J2U01MQ0t4ME43Y0FvSzIyQUQ1bElXYXAwYWphZmNaOEluSVZHamZG?=
 =?utf-8?B?TVdkUUM4Uk05VHUyanlZRFVYdGxCeHdjQ093TWFhRFgzTFZxVVJ0YkdIeCtO?=
 =?utf-8?B?YVBLVHhEMnBjL2c3V2oybC82R3NQU05TR2JJWGhUU1orblNzVnVvR1pzbjFV?=
 =?utf-8?B?dkRsN1JEM1hNUW9vUyt2dzNLMTYvcFRndTBLUS96M3ErcFIyc2xmbiszUHNq?=
 =?utf-8?B?SWFXb3lxWW5Ic0loNmIwVUYzMzZzRDhRYTZxMWhCNlRaVHBsRUdwMm85TElT?=
 =?utf-8?B?SFg1L2Jaam1UV0xBb01nTGJZT2dod0FrYXhYQ21UR0JwRWVCYmVZMnZFYXlu?=
 =?utf-8?B?YXdUM2w5WWlyQnprcUxBb2FRdC9qcS93QVpDVGhMbE9CUHhFMG82aHp3N2ZJ?=
 =?utf-8?B?bUtOTW1ZeFJ3SDdJb1VKcThHUVNDZEpQTVVhNkE5c1lEZVZ1c1BaKzRIK2U5?=
 =?utf-8?B?dkM2bHdkU1FkbDhnQ1JscVZFRnJZTktCZGRzNktuRWp0WVB2NFgvUkFQdWgy?=
 =?utf-8?B?cXBSbklreVBtVUYvMWpkY24vQkpyK081Z2JGUnBMcGlLODQ5WHdZVDFGZ20r?=
 =?utf-8?B?ZHhsR1ZUd3E1bkZ1b0VFREJIeWlOeW8xYUs1Z0hHTTBSQzZ1ZG1ISEFwZFFV?=
 =?utf-8?B?MytPV3NEay95SUk2YTlaVThvUVZHNStEWThZZzNvRVNBb2dsbFRaR2hXRWwz?=
 =?utf-8?B?WTVQRDVNcW5qOXU5RkhPQ3QwS3JuSms2T2RZVmR2R3R4YnRSR2x2VzRkN0hy?=
 =?utf-8?B?MVJUU3NXaU1KMWpRcWh5UWJXS0FSU0hPdU9YQm8rSWZYaDFiZmxFV0Z1NDVx?=
 =?utf-8?B?bkRZWUpYaFMwRytuQnd4d0gzZHNOVW93N0Z1T0pyRHJmenRIMS9sNGJkWEdR?=
 =?utf-8?B?d2FnNUtPUGR4TWZUdG9pYlE1NDdyK1MxbjYvVENTZzNseWw0OURPOGdrWlRr?=
 =?utf-8?B?cEw4MTgyWE01Y0pBNmV0QjExOTQ5WXBWb04wSWF3ck1RNnNtL1llNkhGNXZ5?=
 =?utf-8?B?TldKUDBHYmhnNXhVTWhkU0IrdDVqNktoWWh2OXBlS3FWZVZGT1BpTnFWWEoz?=
 =?utf-8?B?czJhOElzS3EyUktDTnFuaEtOTVk4SE92dTBKUkVSN2kxM3VBQnhJZzBpbEV1?=
 =?utf-8?B?UU96TkN4VXpONnlyS1ZwMXAyY0NJMkVhSFZyQUI0Q1hmRDdUN1VpRldkeHRz?=
 =?utf-8?Q?IjadD4PouCEzoUsscy40EdtXLF6s0KbzXQ+dkISdRAxHl?=
X-MS-Exchange-AntiSpam-MessageData-1: M5zOHoP/3eVzPQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a695b6-7c14-489b-0ce5-08de5826b9b9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 13:20:48.3252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+XH6S9oYtNXTB07AH9aiKUrIZvZLv+3xqnoe9n7DxtPHTuID8x3F3uTKyCSnzlWOjuplXfTaRTgAUGrCqpCMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7605

On Tue Jan 20, 2026 at 10:08 PM JST, Miguel Ojeda wrote:
> On Tue, Jan 20, 2026 at 1:47=E2=80=AFPM Dirk Behme <dirk.behme@de.bosch.c=
om> wrote:
>>
>> And I think we need the same for the doctests where it fails as well the=
n:
>
> Yeah, since it is a macro meant for other crates, if we want to use
> the feature, then we should have it in the set of Rust allowed
> features for all kernel code.
>
> But I see Alexandre has already replied and IIUC he plans to provide
> it explicitly instead?
>
> I wonder if we could just use it instead. Hmm... I see there was a PR
> 1.86 that significantly reworked the implementation, and Debian has
> 1.85 only, so perhaps it is a good idea to conservatively avoid the
> feature, even if we may not hit any differences in practice.

We can avoid the feature altogether, but it is of course more convenient
if we can infer these generic parameters when possible. But if you
prefer we eschew that, no big deal. One can even argue the code is more
readable that way.

I haven't found how to enable it for doctests anyway - maybe this is not
currently doable?
