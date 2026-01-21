Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022123.outbound.protection.outlook.com [52.101.96.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1C92DE1E0;
	Wed, 21 Jan 2026 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004839; cv=fail; b=mGYGqmg11pXaFG82S85ZrBD8Dpu0vi3Cndk2IgV18TbMYxkhJQIHrgJH5af82Zyw8PjC1llMFWU/T9sHcmF0ZjMRRESbWtLgejJAnWYRCvDYYm37KFe+n6pR5uIkM99bHIIZdFGLxnTO7fUYthYfULq3+2XbezB3jay5WIEuVzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004839; c=relaxed/simple;
	bh=BoXR/4ju9pzxyOSdk8CDwmdW/Cje1HMStGcpEgH+1Gs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=NhPst6/GEXV0GodJzQi4YGl4pApGL3HlOfYmo1Tz23UInT+J+/manzPgVJ0N7DY+qa+7KbW4oc8NZBAaj+oXSr0ULlM5IV910aFJUz8cMSi3o/VQXNDOXGyUmsCycPxDVe+PLgXV4sUsW5SQd509gFHTR/IJCMhIx/s0vInluxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=EQ7gaqfA; arc=fail smtp.client-ip=52.101.96.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="EQ7gaqfA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyIMt8nh1hhYr8rJmaaNA+sawtuScJ3/wQvwYv8Q9q1AETMrpntOI+DxIxSjeonzk7l88JxCAKVEcpI72yYozWcS9rwGtrr3y/V6GWGAwikt/LFlNXFAgBrsi8c5VFF3ZsycCTc6GQZ/w8Q0+48rCwiD3VstHwy4c9Kq7pKcWYSfxdNo507qyCpVm1b86Cvbq1f7ouMs2mv+zhKQSTxCz7fYBS2jC2ao2UpiVx0XEa9n4TjNw15uUqmvEFBt5KgB1N3zXPQlOljBCBudySsGhRyTMMWdm1rQUq5GgOdvlSNbZrDm7IbG8iwb+jNiuFzarl3yZkIIlS2HRji2JZBQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWRLZWK4TIMEMGW9PI8ZfD1Ox/PMI1NMD/fR7oB+UHA=;
 b=qnWM+0VPfioauD5nqgFtB8IZmlf8EkOuXSYDeWUSR7lkQ48VDv17FXB9QQuxA82nXAFMM3KAQGPI9BYgvvq7A1EY/+ckzcT9bhaemXUHG9xGBJCWdWdE3pQ/L00sA9026i7lJY2ikQIi99pITU2b9OqkZGt77vANYvYG3KW20fmP472wyr59iuN033DSnHvr7QOPxGqOF3RDPDvtUw9AeW9owL1h/NFdF2TDJ0JyNtPnER+LoBoWoKn3ozVtfbYUfxNTq91jBGMn65ljgEqv1u1xTU+mDT4GWidSVGaEzCLPkqHzCfEOuLRYsjc5jENzIbA6Hu9Qzsx7NLh4QoyQAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWRLZWK4TIMEMGW9PI8ZfD1Ox/PMI1NMD/fR7oB+UHA=;
 b=EQ7gaqfAA+E/QMS0JifdDpyCR4rYKp6jKExkmCsPYujkg1/FFF+pobUGngV7q35hkvr5c60wQLq+h4T+DQ9fsy7/Latln4UC1CiXWkIjcbm5k6xdwdMXXzuw7A+WYzw4UqzrP5SHxq2IqkZgyc6RhTbvccydu/RkAxcsFq5K6cc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3294.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 14:13:54 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 14:13:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 14:13:53 +0000
Message-Id: <DFUBVLBCV4NX.1ZR7DJ0UDQ8QG@garyguo.net>
Subject: Re: [PATCH v2 3/5] rust: num: add `as_bool` method to `Bounded<_,
 1>`
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-3-79d9b8d5e36a@nvidia.com>
In-Reply-To: <20260121-register-v2-3-79d9b8d5e36a@nvidia.com>
X-ClientProxiedBy: LO2P265CA0299.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3294:EE_
X-MS-Office365-Filtering-Correlation-Id: 99754d70-0a74-4b98-754d-08de58f74efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVJ0eXowL3FZNmFOZVNUblp1RWVSRll2NVNPckRPRU14bG5NajNER1Vjbjhu?=
 =?utf-8?B?VCttczl2VWVlRVRZWmptMm1CQ25nZ2JqU2ZTRHhXbitpZ2M2d21hZTk5akF1?=
 =?utf-8?B?a3NIUGZMNEN1cGEwNmJraVNoWUZheVlkMU1obHl4d3dVNmhoc0ZUVERycEhu?=
 =?utf-8?B?MVlYSnU4QW9jcE0vVnA3TnpSZDhXZTlkTXRQSTN0bDVLZTdOQ1NYcFg3ejZO?=
 =?utf-8?B?Y3RjNVRTalRqQTFhcE5ZbXhYQXlqNFRrZ21KTDdqV0VqY2xnaGJOMitpbzE0?=
 =?utf-8?B?djZyRThmTWF0VzFlY2F0ZTRtOU5QWGhtSURKbUJ6cGZGMFBZejByYmZzUzlo?=
 =?utf-8?B?R2F1a2Y5UEM0TUhDaHFScklYYjRqVmJvd3NwYzZ2MUlmUGtsandJei9oNUhD?=
 =?utf-8?B?cWxBcUZSdGpRZGFCUnZobElkSTFzK1pLR0E2QXJpTjNmTzhDN0MwVGs0elBt?=
 =?utf-8?B?L014aWMwbXBqWnprYXpPTEpGaDJwbTg2cDRzQ1VWTitzOG9yampkUmtuWURw?=
 =?utf-8?B?NUJLUytEQ1pyZGhqUlFzMDNLamIyNS9QV09LeUFKVEU1SGM4c0NCcmxvZUxZ?=
 =?utf-8?B?eWlxa05STElyKzRjejdRNG1IRVZ2bzUyQ0U3RDcxNjFoeC91UlNEMHprMjd4?=
 =?utf-8?B?YmNwRkphWjJPUE1WVEZLaWFkcmNpcjlIaGJWcE9jeW1qdlI5LzQvdkxDTnhq?=
 =?utf-8?B?WlNsNXg4eWRSZmtvcjFob2p6a3NEOEsxemdqYy83Z01QT0VQUGNwaTR6c2pD?=
 =?utf-8?B?cFJwV2pXcHA3MzcyR1R6Z294NXRHL1VtZ3dsT1VpaXFWTGE2ZjZ2OTYzV25T?=
 =?utf-8?B?aVdOOUN4eG1mUGdRNXkxcnJFUU0rSlAzMGY3SHVsejcxdkJ1dWY1ZCtkaGpx?=
 =?utf-8?B?aHRJQzRDeTloL0FKRGVldnJBSnNpempSeE9ReXRUdmVnWHQ4RlVWRGwxYUdY?=
 =?utf-8?B?ZW9MRmY1VDNqRkxWaW1wZGRQUEF1eHJRWXFQMmxzZWd1VUYvWGRJRmN4enN4?=
 =?utf-8?B?bng3ZFlwUllmVkVsYXRpeEpQQjhjVmx4Mlpmam1Ja3RDbTh0bHgzSysycnBB?=
 =?utf-8?B?KzN0YkRwTEhzZFpTVzRrbitEaGdZNEo5VFY3WmJxa2FaVVAxZkFNc3BqK0g5?=
 =?utf-8?B?eUFMa0pKNTRENUFWQnRMbDlCazltenczck14YSs4QUQrWWp2eTNuSnIwZTRx?=
 =?utf-8?B?bWhkQmVLRjBjT051dlJVV01NTGRadnV2aGp6TXVxRUZEOXdEL1lkUGJ2elBJ?=
 =?utf-8?B?ZDcxNzVIMVN4dVhSS2J1OVFhY0YwcUN4eGkxRzViREJtNkl3NHlnUDRmT3VF?=
 =?utf-8?B?MTVUUDFDaGtpNW5MaXR3TW1mRitzOWpYS21QaTIrQ0ZkWlcybmluWlpENDVo?=
 =?utf-8?B?VlcxVVVTZW14UGo0Z3ZtTUlIZGdxSi9Bc1FIeGRVQUdwNzRqNHFRclpsWDBT?=
 =?utf-8?B?bzJDRVF3eFZPellZbndzdGhhMnBGczJwRDVmbGZOa05SQnJqcTM4OVhVelpJ?=
 =?utf-8?B?S2hjdE05UE1SRkNrT0E3dlVteXg5cTg4T20rUnNDeGFIQTgrL1RFaDdsbVFS?=
 =?utf-8?B?QnlPN3IyZ0xNSHozOHI0U0tNNW8xSkViNUZqU1BFVzNIRlZKTnVTMjIwL1dC?=
 =?utf-8?B?dTY4RVBkNDc4UGZib21yMFZGWHRuOUhnQWdxeVo2TW4wSDJwQkJRWm9VMkdp?=
 =?utf-8?B?ZXY1ME5rTE1Bci9xb2ZMWlZkeEk4bkp1dHhVN0RCV1FQMVhWOUFDekxtQUtQ?=
 =?utf-8?B?TDBQRVVwNmEyT0NvK0luaEtvMEtEcHN5VHdBclBHRTl1MTgxZWpJMHVpbU04?=
 =?utf-8?B?V1lMUU5vcEYrUWs2YlBoYVFscGJoUTRFTU05OUV4MmJ4UmJtVk1oRHF6eWJJ?=
 =?utf-8?B?VnR6K3FPWWRDUmlPQ01FUHNRazY4dDZ1TCtsK2JLZkhSU1hhRmtFNEVtelNH?=
 =?utf-8?B?YXdieG82NXRkNW93SEM5OTdYNldRVk01Z2hnaVdqRDhXSjNJRnBaeWx2c3lP?=
 =?utf-8?B?RmpDbnNKVW0wdlNSemhjOWxoR3pBSW5kbVp2ODBnYmx0MU9IbVFaZUNETGpG?=
 =?utf-8?B?b0FLY2RGeFdIU2tjZUJVb2dKL2tSL2pSaXBEdndyT2ovaUpwK0RzRU44OUUv?=
 =?utf-8?B?OWZTL2dhZm5OZzROSVAxd216TEdGdXN3MUorZThSMHZpTEt4SEJVT0JqYXFq?=
 =?utf-8?B?Q2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3p3N0ZXTVpDMFg1anF4RGdRQW5SM2dmcGhuR2hEMFZ5d3dTZ3FlSmFHbnd4?=
 =?utf-8?B?aHF2TGh4NlhNZnNDUzdpblRUdzFEN1B0dWh2RWV5RFdGQ3JCemJESnNMZTlV?=
 =?utf-8?B?d1oxemVLUElOTmVxQ1dCaDM3TkxiMldIVitBZGVhNlplZGxrczM1dEl0ZjVm?=
 =?utf-8?B?Q2V4SVN1NlA4R0ZhbFhocGVqSHFlOGh0R0xtaXU4MEJ1R2l1MVVHaWpIMUJ0?=
 =?utf-8?B?YUttWEFRV1ZxQ3p1SzNkZlp3QUZYVkgreFRuZkRjL3NESS8rT1hLMS9NQjNm?=
 =?utf-8?B?QVZ5VDkwQmdlaEpUZndIYkw0NHljTFhIU2tTUFprWVdvSWJsNngxUDVvQndq?=
 =?utf-8?B?L2VERmFac0ZUV2lySklteEE3M2k0NVJxaVV6WjBmSWZCTVRGQUhBcktlV2Nx?=
 =?utf-8?B?MVNzWVQ5dCt6Q2NOMXk5L1lCMDhqT3IvZVd3YTAvYlZBUjYyZlBvYndXMXRT?=
 =?utf-8?B?VWF3b211M3pyUkc1ZFJhcUJNdnZ4OUF5UlVHemp5WUszNG4zQTJTaVBQY2Fl?=
 =?utf-8?B?a0NGSFo2NVNlTmhSMmFmdmFjNlh3K0E5SG5COTFqdlBUUHlTa0toamRHbXgz?=
 =?utf-8?B?WFdRTDNYM2JPTGN0ams1d1Y4MFAyK1lGMDZBQmluSlBSRnhCb0FZMCtGR0tu?=
 =?utf-8?B?dGtEelNPSW1kRDJ6Y2pBTFl3NnN2SmMxd0RYSHZMandaRnhqTEl3UFpUamxv?=
 =?utf-8?B?bW8xWkhQRnBqaVRBeFJaNVZXUjAyU2tZd3E4QWxwV0c2KzJmLy94b3ByWFpV?=
 =?utf-8?B?b25sN3hKdHBFVENHd0IvWVgwRGRkdE1iMjRYbTFoQWhndXRUQzc0bjZSK2xI?=
 =?utf-8?B?cTdxMGFrUXIvVElOaE5HYUMxQXgzbUdEeTFBbzVWYmxwTm12ZGMyRWNYR1Z0?=
 =?utf-8?B?c1dMSlBzdlo3eUtjSVZsWnduRXZIcnY1OGZYTGpIMWZrVkN4VE9jK0ZYTWhy?=
 =?utf-8?B?ajltL0t0bWlsZEJMUEx6L0tQL0dCMStCQjNSU3c3d29wUlQ4SzAwTUhuY0h6?=
 =?utf-8?B?TmxVcWJvNWFPdm9ZVXhoemtpOWF6K0FyVUJ4MGJBaVFORmNZTXBPQXlOVzVo?=
 =?utf-8?B?YzI2UUY3TmZlYWlkeXZsZ29pUEw3bGZ2MWxWSmVPL0NUUFJ5MURUeWlBWXRW?=
 =?utf-8?B?R2ZUbmlCRjRla0dUeDhqNEhjWjdJRW1nVFdhRVJPamUzRVcxR01xQkM5bjNv?=
 =?utf-8?B?b1NBNkNVTE5mKzB2UnRrYnZsQ2hOY2JYeVZkTEdzNXZpbUc3enpLT29YdlFK?=
 =?utf-8?B?eFRpRlB2ampBVVFMVzhkRkpnbUxBWk15THdUR01NZ2V5N2RjM3piM2VPdkY1?=
 =?utf-8?B?MXdkN2Q0ZGpjeWhnVHMyZmxKT2ZjK2lqRmNiZnM4ZG42akFiUFNWL3N4NUpr?=
 =?utf-8?B?MkZUdzNpaW1EWjZ2anJhN3RocHdxZDNUeDRWQnJjV0pTWnpyLythdGVJVnNz?=
 =?utf-8?B?SStGdW1xR2wvb3VJRWpPSDNIaGFEMlFZUURWMnZGOEVWVm03d0F1aGMvZkE3?=
 =?utf-8?B?eDljQXFoL1NkR1BUTm14MXhidlg3dUhtOVJ0RUc2Z1FjUFZMQ1p5eEtCNkdJ?=
 =?utf-8?B?eEVzU1BiaVlJSDBoemh6anFVVlUyRmFMZWhOZTBVS2ZSUVRXREZqM1ZXMVFu?=
 =?utf-8?B?aHZZMENzN2U2ZnNMb2w2OVFnSjhBbmZtNVpCK1VyZFQ3ZDJITFFDWHFEdVVI?=
 =?utf-8?B?dFNMK2dFK0lnT2UxaUFoUEpkM2VOQVVJZnhvTjVOcGhJa3BSV1cwRGIzdjdn?=
 =?utf-8?B?bnNwOHZFTm5OV0Y1YVNaWjVKT1BBdmlsSmdlN3Q5YzE1SFUzUVRDWDM4ZFow?=
 =?utf-8?B?Rm5LMm8xbjJyRGtVcXpkNmdBQndyVTRYTnVleWN5NzBVNjloeEljMDRSWEcx?=
 =?utf-8?B?aFdES2V5U3lvODMyV3BNYklKeFRwazZ0UmZta2ZBWDBBYkZQY002aE1xN2tX?=
 =?utf-8?B?a3dZZzVUN3dWSGF1OGdnbmMxMyt0bktMTEdpbEltWC9XVWVlaGxkRHNreHZP?=
 =?utf-8?B?YkFRRTZQUzJYWSt3RmJReWs4eFJud291eHlhZDkxaHVRSVNPVi9mbm8xeTl5?=
 =?utf-8?B?VzRDQkR3NXpUOEJKRHFpaFZIaFFTM3orSWo5b2prK0dDRWlkVEk4bVEwTU11?=
 =?utf-8?B?bDlmNC93cXRkNGpUWWIrOG80QVIzMk9Xc1hydzhtdjRUdDFvYXcrK0lpbUMw?=
 =?utf-8?B?UFVmY0tGVXM3d1ZiRTJGMDdKSUJJN2hraDk3VFV4cGYrTmJyTUtqYTVvVEUw?=
 =?utf-8?B?RHJaT29wSVBVTWdlaEQ2VG1WSmZnZFdKa3NpUEQrbmNwbkVVUGlaVFlKMFY5?=
 =?utf-8?B?dWFrMGdEUTdveFNKYU5SWHA2UzIrTWM3UmIrUGFNSlVYSVFCVUc3QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 99754d70-0a74-4b98-754d-08de58f74efd
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:13:53.9189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwDipgmLECwqGZIrUrIRKOFMz7G0oheo1veL4FBYjV+GlPLCJpG9Ql+xPJMj/V7j4EbdVNbzxaavPlibGkoDHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3294

On Wed Jan 21, 2026 at 7:23 AM GMT, Alexandre Courbot wrote:
> Single-bit numbers are typically treated as booleans. There is an
> `Into<bool>` implementation for those, but invoking it from contexts
> that lack type expectations is not always convenient.
>=20
> Add an `as_bool` method as a simpler shortcut.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/num/bounded.rs | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

