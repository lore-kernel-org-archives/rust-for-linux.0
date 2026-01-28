Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020116.outbound.protection.outlook.com [52.101.196.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1152772612;
	Wed, 28 Jan 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610293; cv=fail; b=hMVSf0RNyrWGJdje7IvlfHkpnMMNw/CJuX6cyCVlBJi1gTQdaIO6dSFLWsGIFgBw+kGda8wDt6WR67TF7DpbcKtbCxCJe9pTxv4z9Htwipj/T3O7qj6VPDIEI2Vg5WV+ctJ2yr2c8V0OCk+1MUe1eghGKfrsh10SWhrCXIUeBcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610293; c=relaxed/simple;
	bh=oi81JqkxvTVdknmzPMSVmqVXiUKPp8b0PVT8hZAci2E=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=gob/I9tiAD9oa5wLlNyoTg4VcJCGDZe0PMpu7imGjZWfgw1nZN2LUnGKPXi8eeWWdLIu+XZRkSydjC2v/Hdi8h38mPCuwrijijyr7dAP1NC2OB/7YuVDc3DbXhBlM5z9gT2imyspGfUWNkDlYDqnQWcISY7QCZ0yZG+YFM+nDwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=BAMjtd6Y; arc=fail smtp.client-ip=52.101.196.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="BAMjtd6Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaYuU13wkwoE75BukfleraTjPswllR7hX85k/OzeHK3zMbgW4dHy/RnDzoqDlzMicBXd1E0RJrlOaR/v8Bo07HBFS73HbcBZ5fK7W45NgHLCVXY6pFzKAbL2hfND2/OsDLthBdVic6De/iEgfyTPet8k7sbv7PAcLHwRv1PnmUfib6JKweNwgcnmVzPvR3Xg1LKGnaRKbzFPt4pYUa/BTmwu2cv4aFqDOQKEShdVyXq9vVDpGduJ4BR2Ong1FAhKR7U2IZy0LchqJY1euB1DcAy+wxwEqO8sNYbkLdfeDLnktjwLyuQah/IcKEu8x5xX3yvyKqWwyfUz5TSbH8vPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OFwjk/vdgA7v7GAPOyed6UOqfBB08xdhpRjDl0cH7Q=;
 b=PI4VkjoJiiJbeLRHRfXJu0L0iM2HGIMwVSn7T6rvw/a3eBQ6Um++FVcINp1QOZi+h7pPoxwWgQ54MrPapaxEq0wPydY8La9T+wxwheYfN0H2/0WtFPEgfilqC22eT15NXUCXCmQBbs/n5tOKFMAaITd31NM3G3ltnCmVZBRg2ltmRirLfC6vfskVvJbCaqi+jo3cBv9OZWAzgyfqoubUpa7VVAJu+Sx0kJXLROwivHwpmSqRlrt6z6jOTF23nZtCj9FI7iU8OMsHiv4YkZFAjH9pS5jozGsx0f3OM69ZrKfpn4JCzw5TqkzwP9OYyBW/ANE2MHR/9uXx5KtG52oh2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OFwjk/vdgA7v7GAPOyed6UOqfBB08xdhpRjDl0cH7Q=;
 b=BAMjtd6Yv+TMP69VmkBlZTCaYSBDh0ar5hKRgsk3IPmHXIV0QV0+Bu6xBGGx/E8aEdNf8VXdMlsDeRvilnj3iBzVUD2RWF7MmJn05E2acd4W2/m8qEk/kXBJsT3UElRK+u+4Fng+kyACkRPnwb2OZGyVCIXot6R0iprvcpoz/dw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB1935.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 14:24:47 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 14:24:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 14:24:46 +0000
Message-Id: <DG0AHQVQUI2F.3559P1PRPJTVV@garyguo.net>
Cc: "Will Deacon" <will@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Mark Rutland"
 <mark.rutland@arm.com>, "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda"
 <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: atomic: add fetch_sub
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <20260128-atomic-sub-v1-1-f8c6abcbb067@kernel.org>
 <Aov3lE9OEN6E4yOy9msTkiuujeOmTna28xag0imZcW9BVI9kX60dekWO_rwhuZpcnyG4BE8F77dh6ZFGuOq0pw==@protonmail.internalid> <aXoX5ixoQYs0cUU5@google.com> <87ms1xstzs.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ms1xstzs.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB1935:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d94516-619a-4109-c71e-08de5e78fd4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T25tQ1lkMkZtMDJlWGtRYzdtbmd1ZXhrMUFOalQxdmdyYVZPeDcvcUU3bDhu?=
 =?utf-8?B?YTQzQWo0aGd1UHh6elA3bjdCd29vQTRYYjhBRkZDbFZMMndhNittNVpoSnFr?=
 =?utf-8?B?NHUvVElaR0pKV3NZaitSeVNXMURncU9ZMGE1KzhNaXdKSDFrTndGbXFQT3c2?=
 =?utf-8?B?WnZZbFA3RnJBOFJkMDRROVlYdG15SXJVQWZQOTBxd3JaWVU3UHdKSTVqVTU1?=
 =?utf-8?B?YnBnMFVtSm1OVUFsd3BsME1pOVh2ZU1TNEtWTWdKL3FQY2d6K0dmRjE1d01z?=
 =?utf-8?B?c3g0OFZsdXhFbUlneWdHbzlYQmNIR0NnY1NudDF1L0lRakdJaXZUUkN0NThn?=
 =?utf-8?B?RllITlRTNFVyWm1scVNnS2pBQkNkZi9DMkdKNGtmR2M5ekZVQTlRaEMyVUFL?=
 =?utf-8?B?d3h6U2ZiY3plZFZlTTJXNlc4THVGeDRNTXN2Si8rUzZmbm56T3dzNTUzcFlY?=
 =?utf-8?B?c3c4SENxL1owWTVEaXduQ2tDYnBYRXR0RGJGNTU3MHdBeDA5QU9JZzh3Y2dU?=
 =?utf-8?B?M3ozUVdycU9mamdlbFQ1bkN6aEVUZlRvOTZKR3hYYXVWaGVuamtUL3Rud2lZ?=
 =?utf-8?B?c2xjYXJoaGhKUE03S0t1SzhFWjQ2VUFFTmpUVm55SG5zZTR3aCtNODhkWXRX?=
 =?utf-8?B?ejU4Y29Jb1A5M3Y2NENMS211N3oyOFdBc2xUdENFZm5tZTZ1T1BINUx5dmU4?=
 =?utf-8?B?b1E2K3RGcFVwa1VGL0VTUTRLcXdCZEJqZzNtWE92a2UrOUZURUQrNStFNi9w?=
 =?utf-8?B?b1E0OWh0T0Q3Wmh5REg0aThXUTMwdXUwSjNFeE16R2lCZmFkQzRFMkRPd2JP?=
 =?utf-8?B?YmFxME1nb1JKNnRVYkErZ0J2aEhUL3pYSndGdXJuNjVWb29zbTZkUnRNQkVu?=
 =?utf-8?B?bmtzK0lhUjVaa09rK3ZCRzVtV201cTR1T1c5ZXRySGd6dTVLaFpFeWRhN3E2?=
 =?utf-8?B?dkMxOGxES2hRVFIvS21ZQVd1WjFoeGRaSjhPWVpxNktKbnp4RGRXeFQ0dVd5?=
 =?utf-8?B?RDM0N1BvUHpEMjNhdWhqV093YVpVdDZTRDQxZmZlcGU2TVVaR0lGTUt4dFlO?=
 =?utf-8?B?ejQ0Qk1pM29iSUUwaGxpTlU1d2RCbUdGUzN4WXdmS1YyQ2VlWG90R1F2ZTBL?=
 =?utf-8?B?WGNzcGZ2bTZzV2lpM3d6cE8vczBmMUhZbC91Q1YxeEZ3bmwwYWQ1b3Y3cU9U?=
 =?utf-8?B?VVlncXpxMmNvbnlzSFJyZlFFSXZTck9kTjV0Q0N1ZHJJRFNDR05KTkxLNXdz?=
 =?utf-8?B?anUxSDA1NGRLZFVndkZ4T25rcHVkOXBJQ2w4OUxobW5RZlVTMmRpZGtyT1pL?=
 =?utf-8?B?NTROaHE5ZGZwallCaU1BczNiWnkvb3Vobm5DQWtnNVhoZUtJczhsM3dpajFw?=
 =?utf-8?B?cVkwNVZWRm1lNVl5Vml3SUNvMVpOZ3NybC85OWhVQ3RjdEZGbnQwdzRhQnYv?=
 =?utf-8?B?OVB2ZTB4c2pqZFFqaCtLYWxRR1ZyRDRlczVGb3o5TzdTMlBYeWVhTThhQjRu?=
 =?utf-8?B?cVE5REVEUFpNMVN3YkhVaXd2MXhSZEZlZDAwbit2cEhReEdWZ0dmL203TXF2?=
 =?utf-8?B?R2JTajZVSUN4N09Ua2MyQWZpNWcwUXVEK01XN1J5RVkwTWJkamtvVGFvUXdS?=
 =?utf-8?B?Tk9Bb2g3b1BDZU1VV0FaVmJkV3o5bUJ6bCtOcVZNL3ovTktPM05HTk9jMGkx?=
 =?utf-8?B?eHd6YU5pR2kwTTcxNnA2NXg1QmNTSkRpNjVhOHErcnk1TTRKZnJxU0pQQXR6?=
 =?utf-8?B?a2dhQzRxRFU1MUNrWThKVVNLLzlndVZQenMwN3JaQmx0dEpmY0RvSlNlNUJE?=
 =?utf-8?B?SG9rY0FvSUZVYll6a2piNzAyOU5ORXRwMmVZM1lFZlJmcmp1aHFVTDI2cGM3?=
 =?utf-8?B?emdYUURsRDBWMW5wYkhIcTUxbzFsbktHdmpWenpEY015TUtqUzlKU2NRU3do?=
 =?utf-8?B?b081T0daVTlkZGowU2t2MjVoZ3VSWGs2NkhsTnI0UzZnTmJaUE9rbGlKUm1M?=
 =?utf-8?B?SS9tR0lkRTVXZnFqaTk0WEc5dTkzWHNBSGdvVE81Tm1wRGNvUk9FQXgvRE44?=
 =?utf-8?B?dDdXeDZVZmRwcXJRTkYzaW40UEt5TUEwek0zYVh3dldBZFVZY1ljcFN6ekN2?=
 =?utf-8?Q?2hIo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHFiaHpmVS9PM1lIcHpvcTNlZlBkaUdHb0FHWXAxYWNCSXNyTHZOUUpPMStu?=
 =?utf-8?B?L3FVMUpuUTZORElGS2tDWkhXMUJSZmJlL1B4VTJvUFVOVWsvTVc4NVRwNlVu?=
 =?utf-8?B?VnNNN3EwVEFUQ1ZHRDRaWlJCa25lbmF2UXBoYUp4MEVFcEIvUnhZa2JlSTZi?=
 =?utf-8?B?MU1Ga0JQeld0VWlKcjlwelZwMVp1N1BidEJJQ2g3VnFBczN2OGhteDZZUVhX?=
 =?utf-8?B?cE5OTVQvcDFYNjQzd3k5b0RVWGcxZkZ6OWwwQkVIZDIzOTVadEhEbkVuWmc1?=
 =?utf-8?B?RkluTmRHajlxUStqTm8wTERJbjNkNnJZdnk5TFhDUE9mTE51RldUOXFhWkpS?=
 =?utf-8?B?bUxYaHhwSFVUblJEa2ZMVmVlSFphKzBpQmV6d1ZQRVExZnJXT3F1OGJIS0li?=
 =?utf-8?B?bFFGekNkSGJUdUxYMW5ld0ppWmc3SU85NVNRWnVMSFR5RmtpcWVLVlNXdGps?=
 =?utf-8?B?VFpUOGQzbW5tdm8zWXF0Z1RSeWNKUVZack41bHorejBjYlE4clgyM0djZVpB?=
 =?utf-8?B?YU5oMWNCYzd6U0VjNy80NWxaRm9wTnJXby9taG16ZFZBdmh4MkVHNnNxU0tN?=
 =?utf-8?B?aFNnNWFKcnI1d3Nibk4rbnN0bE9iSmg2VngvbFV2Y1UrUnA3RHpLMUF4MXB6?=
 =?utf-8?B?cGhhbXUrUzFwaHpjWnRibnJmRTViL09aeWt2TWQ1ZEN6MkRGeXVrSVI1Nnpq?=
 =?utf-8?B?UGU4QTM4czJpbWZVL2d5cXVLTGNFeEowdktGR0FtZU1XalpJdytWMDZoZGJX?=
 =?utf-8?B?MXkzQW1BT3BSdmFRRjBnWWFoYU9FOXArS0dNMm1xOURuS0JJdEhJWWtoUElq?=
 =?utf-8?B?Y0U2RU5Yd0lxMHpId3VMTjRacWFTeXVYZnRrbGl6Sk5rYkhLM1Y2WlU5aThX?=
 =?utf-8?B?SEltaG1mcXBqRlBVcnp1a1pJdGFweFpaVkRoelhoSnZ5cVVnMXZIMDdyNGl3?=
 =?utf-8?B?VDVxQjB4NWhLbHRMcEpmN1MySDBrNHMvYjZwR0dHaFpZbVk4S3J0c1Z4b09w?=
 =?utf-8?B?SW1XaW4wZmtLSDdXTTM4R3plL0hrWk9zMk5VOCtJdWFseUlFeU9IQjBIc3JS?=
 =?utf-8?B?bFV1NkRkS3FaUUZpSVBjZ1hwMm5XN0pHUEVEakFHN2htTU9IMmV5d1BnT2wy?=
 =?utf-8?B?c1VuVDZlaTV6MkVXRUg3a2NPSWhXUWFGL3pCd01HS3F2ZUtXYUFtU3pyZkg5?=
 =?utf-8?B?Y3Z0K1M2Rm12Q1FCOTlMRUF5SHhNZjlhVldRUUpxNWpTY0lyampFUkZ3dUZ5?=
 =?utf-8?B?VDk2b29TdDBNQUFGeXAzQmlpbEZQNVd5R1NKOXpFRGtGWnJxZkRnSm91ejZn?=
 =?utf-8?B?czdhWVpCY21WczFmTGl3NnV1RDR4alA5eGJqbGNsTHZ3Q3FYRkNac1Q4VDZh?=
 =?utf-8?B?WWlrQWR3R0RTRzZManFhcm9VTHFYQjVuVjF0L2lMUGFuYXpEQTJZZU5aQ2F0?=
 =?utf-8?B?RXp6QjB5eFdvcmFMTG1ZNFlnVTAyWjNEbWROTkNvbXkxTjFjUVhDeHJRUjk0?=
 =?utf-8?B?NEkxMUZJMmZFeTJFS1NVSFZYR2RVbjRrTjhoYm1PeEZTNnhxSzBaR2VyRjdJ?=
 =?utf-8?B?eU54T3VKeTZTa0hxTEhoaG4wVzVncWhtdmxLTnU1T0ZweGdONmdJSDM3aHE1?=
 =?utf-8?B?emhYay9mZkR5OGhGaUUvSTFHSjFRQWVNWWcwWFZ2OTNIek45OW5neU1OTlBK?=
 =?utf-8?B?R3V6eEhhNElMRDRPUDl2RFpITGpsT0NuYjlETDJCR2xPbGxxQVJJRXdsRXZS?=
 =?utf-8?B?WUFqSngxenBnVGdBUnlDY3FzeFgvdGVRM0Zsc296T3k4R2lkTzJFOGRlMzFO?=
 =?utf-8?B?L3lJcWl3STZGR1hrUGtXNkhENjJWSy93ZWhoVGNLckNpYVo2TVRWMkpraDl2?=
 =?utf-8?B?TDBGbzd2SEpRVm1BVE9oWnlsQ3NzcVJ4VE1oaktsVWFJVFNCb2ZJZmo4YTRp?=
 =?utf-8?B?MG9LNDZQbVdHN2VHbmNJV3ljT0NsTjNUQUk2eFlnMUdhU1BHdzIweFp6cGQz?=
 =?utf-8?B?cGJjOWFNUnVGZUIvc0xCTGI5UkVlNTlINnVjL3FiT3BlalBtQjhZOTE1eXR4?=
 =?utf-8?B?R05IYTF1cHc1YlJldnRXR3loQU9lbURYTHJ3WTV5bUlYK3pOMVRKSnQ2OVZF?=
 =?utf-8?B?QTc3eUhjVFg3ZjJDWXQrbll3ZkpJU2ZHaHpiK3l6ZVEvUEtvcWJ1M2h5WDBl?=
 =?utf-8?B?T3hTblZOK21ubXBtZk9KUnJiMHZpMk5ydHBtYVFWSExTQkFobTgxMFFROUpQ?=
 =?utf-8?B?TmtEWHlhc0ZRU09VQlp2Z2NWYit3dDV2N3hSZWF1QmtTRGFxMDJ1V2UrTmxu?=
 =?utf-8?B?MEwwcXdNZ042UDRRWGJXRVhOOVMyZm95R2JFaGRJK3hESnJqYUg2QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d94516-619a-4109-c71e-08de5e78fd4a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:24:47.2608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ECE7GrM77HFdE8kV0BXsII34vHE/FbkvikHAYpF+4M3RG+xZ3ID1IdJG2KNHpz18YJbdXlJx5zg75DG+J0M4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB1935

On Wed Jan 28, 2026 at 2:16 PM GMT, Andreas Hindborg wrote:
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
>> On Wed, Jan 28, 2026 at 01:47:11PM +0100, Andreas Hindborg wrote:
>>> Add `Atomic::fetch_sub` with implementation and documentation in line w=
ith
>>> existing `Atomic::fetch_add` implementation.
>>>
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>
>>> +    /// let x =3D Atomic::new(42);
>>> +    ///
>>> +    /// assert_eq!(42, x.load(Relaxed));
>>> +    ///
>>> +    /// assert_eq!(30, { x.fetch_sub(12, Acquire); x.load(Relaxed) });
>>
>> These asserts are a bit confusing to read. After all, the fetch_sub call
>> also returns a value, so how about this?
>>
>> let x =3D Atomic::new(42);
>> assert_eq!(42, x.load(Relaxed));
>> assert_eq!(42, x.fetch_sub(12, Acquire));
>> assert_eq!(30, x.load(Relaxed));
>
> We can do that. I basically copied the docs from add. Should I change
> those as well?

Please do. I also find that the existing example has too many line breaks :=
)
Something compact as what Alice suggested would be nice.

Best,
Gary

>
> Best regards,
> Andreas Hindborg

