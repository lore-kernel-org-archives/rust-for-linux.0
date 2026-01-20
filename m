Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B9C376BD0;
	Tue, 20 Jan 2026 06:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890233; cv=fail; b=CnR0+N1sTXgo+u2Ani6sa8Cx+LkrO7ThATt+RJESOL/uEEzE/Zr3XDlkvD8OU5h/CfuP/27wJWuWvC9rksNYYIiY5RqMUL7QJQRY/DrfnvohfoWFDhnyIosRH3jrWJ2ydFM81M5o8cBIjrNGPpsNxztSAGu9AxpGMNEPccSgQ1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890233; c=relaxed/simple;
	bh=YHkGbjCB5wf9wRTdBNctUErr/AMxFcgt7lnsHtXw0wc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uqLap0fV9gce1xmeDa/GZ+gRR/pSJa0gE9dq391rI6JiTpe81CYnlQSCyeycyz48/KucPxjpDF6DYSlTo1jzhK+gmkxX6VprwkfvlVJa/e20Y93ujScne5Uq3SNfZwEzD9eu4C8IT7bDCsLEt1CUZUEHjbJ+TW/OzpaHkIsLPNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CBgpnYpY; arc=fail smtp.client-ip=40.93.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CBgpnYpY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBjIxbbZEiA71bxh6NWDLHC/JU5C/5l3UkfRafCiuQ+DmHTp/BOJuKQ80d+P2TC4H6zpiZdcda9gHA3WNynyC/twCdWgPRjdhqYOuQPVtsk9CGmtyNr0R7umwjIiIZnNkShZSICdrDQXy0ATGmwIGZPniCqV62EAVTw9IZSaWm8jZkjiu8FzIg//MOCboZXSAqcWzAKXbU6VyEZTizxrlSlJ8EfVhrN2wSMKoNw2R9l3icmqWVIi7gBsJL5tcdF4gJZ6lfNr3q2NMF8NaaPA8cmOqShCgR2w55skDBXudxUodI8pGPnUcEjOH1QL9HhVS0NhfQIODwOXdCcQdabj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzJPskV5pZcqFrrFf9ajOkWnx89K5oCQFm1vjfSOk9o=;
 b=VyE8zVd3rw/kOvPI1aqNWjunVS0IWSe9F564Vye8BQeCKpItEBfH7wHICWBPjqNYvj4j650rj9o6QxKx9jO1FxF9ObstGz3m+f/xPwr5dzR5yJHQPLYS1b6lfrcvv3HmqKtnN/8Z8RFrPEYviVEtIBlav4UdvbL1RUAFsdmyX6WCIcwrvz5mRCmiPXU1JTfsnGLl1Qax/xkATPg7b2fCyrCK+TbyacLs+7ernscxMYQPABRqtl2MSd0Fd74txlY+Jh8WbIyO9UiGHaajBqgQaNDviKuE0qSicL6fHLW9XI6c+BMZJ7CyuoTXfMlfvV3EAjODLhLUAU7zbepHFJTZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzJPskV5pZcqFrrFf9ajOkWnx89K5oCQFm1vjfSOk9o=;
 b=CBgpnYpYygscNwXfBCrsNgsuvSVfKYyxRKI9tgDrFYif13qx9tPR+aZ2abU4yw7BjYHGNsrGfEJQPcjNs4NCpznv2NOMI5XCz6DuDz+eNqiBI5V9IMKHdGW0SGyvcJO+4GGRNCtCQ0jJ+hJe1AJHzz0qeSd/2hzhBtLHPH1uxe5ChSocARH8obMIf/L3pN7feqxnYEMWA0eDSAsKp2EkUca7FLtG5WU7/gD2gvmc7Ql43SsuLAwuo6WGfw6D6WxDnCOVq3y5GkVcUTly4AJnHKz2hX7Q1frs6W6iWAa/9YNsKCRIK/1HaUTMX78pklG6XioDd4qEyjhvovgbzcjfOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB5606.namprd12.prod.outlook.com (2603:10b6:510:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 06:23:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 06:23:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 20 Jan 2026 15:17:57 +0900
Subject: [PATCH 4/6] rust: bitfield: Add KUNIT tests for bitfield
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-register-v1-4-723a1743b557@nvidia.com>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
In-Reply-To: <20260120-register-v1-0-723a1743b557@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0137.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f57b37-42c6-4303-79cb-08de57ec7857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yi9KOExLRjQ3azNjVnBBYTJMczRpYTE3ZWw0MlVMeXNXUldFbGMyUC91cCs3?=
 =?utf-8?B?OVI4RThNY2xMei9GNjFJNFo1UmNYTGlOOUlCcTlrV01tSWFmaGtPNGpNcVpZ?=
 =?utf-8?B?Y09IWUNrdUVlRzZqTloxN3VTNlJUdUxjdEZHZG9mbkxFY2VOcnoxNjRnZ3RE?=
 =?utf-8?B?cU5LVlNCbkZ1MXBIekRhT2hsSDFsN2hxQ3Y5VTFPQ2wyb0F3QnVpMEtiNkhY?=
 =?utf-8?B?QWx6Y3J1eEtqSXU2SjhGbHFxZlR6K1A0QzR1K3R1VGpHWUVpUzVWRlBPYmhz?=
 =?utf-8?B?aU1RSm94T20xYVpSZ3JsaVBBK09TWGtRK3lqSEJuTlRZcmRaVWZhV1krOVdV?=
 =?utf-8?B?SzVuRjQvSDN5dHpLZDlIZGh0VmZEUHVKc21nNzdWWDJOV28zcW9hTDNDY1Zw?=
 =?utf-8?B?SmRmVEg5V3NzNzNuaEhhamk5aXpEc3IzUndLeXNHK0RQQWFTVEd2akJmOTBy?=
 =?utf-8?B?SlVsZndGMHNKTkVBQnVmTm9HSmtOajZOWFV5ODBEUHZqVlFjTlhZS3BBVVBE?=
 =?utf-8?B?ZHBPS1k2bkJBaDZ1cXdvRWFKdTdvNVBXbGppRk9MYVlwcVBlSXhYS0J3UE1q?=
 =?utf-8?B?VVV5eGNwSDl0VlcrV1lxUG1wUHJxSFlidStsNTlnM2llWWl2eEhPR09STFg0?=
 =?utf-8?B?WmZ0Umg3SmRDTStzakZaeXhERFJJNnhRNXBwQnZsWnNjWFJLVFZNaVh6TktO?=
 =?utf-8?B?WDdqWHdrbmxBNjdJa2F5a2dqY3pVZ1ZVQUFjZHB4MFdNeWtjenlQaExEdVpk?=
 =?utf-8?B?MkhqSzRuTWhwQmhYQStGZlV0ODFCUm9XNTRpREJYRGQyL3RXUlVMWUpaWHFt?=
 =?utf-8?B?eEFDcjFuZENBeXZSRk9TWWxCb2RWdXN4Z2dVdDBhbVBvOUlwK09RYmorWkV0?=
 =?utf-8?B?aDRZcEowVVFwY3dIVW4yb1NTRGhLNHV3Mnk4U3ZsVjRJME1kdmNURUVaeUxR?=
 =?utf-8?B?YVNOZGtZV1BObVV4bnhpUW12ZXV4S1Q2TE41TDZ0ZGZ5Z3ZXUE9SWUx2bjdK?=
 =?utf-8?B?QnNEQlJIei9WZzk3SkV3UDlDRTVkUE95YndUYkRsMEsxTENkZ1U5dkZkZ1Jk?=
 =?utf-8?B?eG01MEdlak5jWHlSTTJUajFTKzNsTis2NitlS1RrWlVYcDMva1EwYWVnUkYw?=
 =?utf-8?B?cEhPZ1B5MXdtZ1lqN2lTUDFaNzJ3TTZyWDg2dityTTZnVGRLbmlXZ2pzT094?=
 =?utf-8?B?WDNLcTFxMXlLbnFvV2xRZ3FSd3dDQ2lJazl0RVdzQzBvNXhCOE5BU2NRZlZh?=
 =?utf-8?B?OUllMmQ2QWlvZmJSZ1h5UFo5TFZYV2Q3MW1CaVVOZG1VQW42KysxcEsva0kr?=
 =?utf-8?B?T1JDQzEwWTRTSnRhdHRsb1pLT3Jva1FhdzZlM3JOZkRQc3lvdzYwYVIwbG80?=
 =?utf-8?B?cG1JbkVaMmM1UmRMWXhLQzhOb2lLcDlyeXlhZU9nd3VMdnB1c2tBam5JdlNF?=
 =?utf-8?B?QkhsK1VIVUQwa0RERDhzdUFRUFoxKzNSS0o5OTZVb25JQ2VYY2xaSW1CZDZE?=
 =?utf-8?B?aHZVdGZ5dWpPS3gxZmVpRVRPTGpjQXJic0hDYmhFeElTcktSMVpYUHRkMndm?=
 =?utf-8?B?Yjhhd0NEZEg1OThQbGdBaGlndGc1U2laQnNIUjc1cVdkV3NZZisxZ2NkSDI1?=
 =?utf-8?B?UjBZcmJjVUMra1g4RytGcDIrY0dJR29JblQvWk5iaHJGMW1hKytkSzNUTVlN?=
 =?utf-8?B?Rjg1U0Vhd29wZkdpM1dvZjZxRTEwdHVuUm1rR1BLRXhwZVQ3b3NVMWNncng4?=
 =?utf-8?B?OGlDQnBkZVhXSHFaczc0eW5ZV2tQZHVReHNxRU1ka2FzYkkyMldMZndQQjZi?=
 =?utf-8?B?bGozeWlkenUraVhQVkg1VlE2V1hHajh2cFl6N2EvaXFqWDZWd29sREQzT3d2?=
 =?utf-8?B?NDlJcWtCK01HYVFmMTFESVFmQXRUTFNrSjIwUmFuUHFHZjAzUG1VWEdCbWsx?=
 =?utf-8?B?ZHZrcXZPcWlMM2VRbDdlb0tTajNuMjlVL3BwTThUais3U3YvUWtHbzVCcHhX?=
 =?utf-8?B?UjlUSzg1L3l4SDkwK0Yvb1huMHQwem5VcG5SbWdNQTlEVHJQOG4xTGQ0TERV?=
 =?utf-8?B?VUVQaVdIMDBWOGd5b2ZrMzFodlBidmV4TVk4STM1S1dLZVg1ejlEbzNCMGRp?=
 =?utf-8?B?S0xoOGpXVFRMbENER3V3NXh2djJHdC81aDJGT0hjaEZJSExMeVlndzJ3dEVm?=
 =?utf-8?B?eFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjIyYjdpTHdQWkJrdVR2dndSQVVKUmZTMUtNeXlMMkY3MHZhMGhTYWp6SWd2?=
 =?utf-8?B?WDFYTk5ZblFCeWNDZjczZFZZMm9kemh1MW0zbG93SVBxMEhVSXFrWUNqZm5N?=
 =?utf-8?B?K05Ud1BLa1lseUR4anJpbGVNWDFwRThwaGlIdW1FNG9xYUx5Zzc1VXorUlNs?=
 =?utf-8?B?KzVOUXdNeHMzcE1EeUd2R1lOQ2VyY3c1dExTTlNLcVp6NTN5Y1NtY2Y0dm8r?=
 =?utf-8?B?N3JJQ2VMU0xqYjlLYzBPQXcrTWUrQTh2YXBKRFlQMGZ1bUVRNFllSU82dysr?=
 =?utf-8?B?bFNQMzVObkwxZXdoZEtxc1E4MHFiV3c0V1pDa0ZrVzNXTVRWem1DVnhrenh4?=
 =?utf-8?B?dHZKa1BxRWtZWFNSSmxJK3kzaGtwUFR6NVAzRis2VHlVcW9tbnljbWFWbmt5?=
 =?utf-8?B?TUlzR0dJejZoRGJGMnBJNEllc1E4MW1Ocjc4WXhqTWNjbFF0a2czTXhvVERv?=
 =?utf-8?B?RGlvbnliQncwMEFGeG53NXdVakM3VUh2VkNkclp0WjJXdGhZTVc1ZmU3VXVt?=
 =?utf-8?B?SE5YWm1zeFVGb3JWVEhic2FEUnhScE5SZUNiZzdTL01MSVRTOWk3TEphUU5q?=
 =?utf-8?B?cVNkL2NlMDdyVm10WUQ3N2tMRU1NbVhCRDlkV2NKY2YwS3FFMkgxSUE5UFdQ?=
 =?utf-8?B?WWc0UjVHLzJGZ3F2c252V25xa0djMHFQd2ZDQ3YzU1I4VjlGbGRBdU84dHM3?=
 =?utf-8?B?bDQrSHorWTFwaVAwMWx5NzRuOXFPWXdMWXRpMkYzdGFCT1VqYVdJRFArbjNl?=
 =?utf-8?B?Q2JXakE0UDJEUGNyMjMzV1UzR2Q5VGEyT2loSjlUOXN6UG8vUjJLQ3hLcFpT?=
 =?utf-8?B?c3ZHRUZiVkpuK2d1TjE3eldKTEl2TzM3Sk1XMm1BNWo0d01zQzBSQlFhT3RT?=
 =?utf-8?B?R3R1NEJTRjhYbUptUXJjYTJzWUEyUmNHYjNTVDNNM2Nrdkt2WWFCcU8rNGFH?=
 =?utf-8?B?Z2xibmRKaFB3U1lWWDVFS0RBcDg4RXRLRTNMdG5GVkJyQ21NYXJZN3pHOHBj?=
 =?utf-8?B?cEZRRWtCZytiUXFrTTVubzVJYlZvaFdvU25vOVJrdGx2NmRuMkFEbEdiZ2tS?=
 =?utf-8?B?OXBGSFc3VEp4T2JTQWRsUXQvbW9ONFQ0Z1NvV0hacEFWVEN6dzVQRXMzU1I4?=
 =?utf-8?B?VW5tY2g0a3RIV1pMNjVYbkFYUmVXYXpETDY4Nk5YazlWall0Y0VZZFJUZGtM?=
 =?utf-8?B?M0xiYnU5WEVySjVqK1l6ZnVqcE4yTE5YSmVpZGRSVlU1d3MveEk1ekhqU2FW?=
 =?utf-8?B?cUxLOWg2SWZKVWlDVyt5djRWL0oralowOGZpOU9DZkRjRzAyLzI1T283YWMw?=
 =?utf-8?B?WUhKenVVR1FRS1FuSjhqSk1YRmx2dnR0aWJEWkFzWGxwMndpWm9hVnVhZXRl?=
 =?utf-8?B?aFdrcTh0OU82V0VndWtkbGdDa0VnUDltYVlhOXVYSy9TWjg3bnFGSmJ1dVZ3?=
 =?utf-8?B?cHpjZ3UyRE12aWFvZmUzZ1lScSs2aWVPT2g1OHRUUDZzR2g5Rkw1d1ViN2RM?=
 =?utf-8?B?V25XR29vOXlka3U2c2pHSXd4M005Uk92UHpueHNZNFhZdUo2NWMwSzRGZGZ1?=
 =?utf-8?B?KysvWW8wYlRIdG5UWHRZVVlBMWc0UTVPRjZ2SWI5cWxHcFlRVzZNcVVkTGU4?=
 =?utf-8?B?bkpncEJkaVJycCtKRU5PUUJtMzhRVDZWUWIveHN1K3lVUW1LRkI2blhwdmdJ?=
 =?utf-8?B?UGU4cE8wbzhTTFFkU3hXVXhXQ01wM1FzZGNVV202OHZ5dG9KOGZoRlJIeFc5?=
 =?utf-8?B?ampQTDEzOGdZaDl3THBvdU9RYkNVblhJaExMUERWVDAxS1phSXJvSXJ3bXNJ?=
 =?utf-8?B?eFRBaTlQeW14YVEycFlKalJ0emhydVdjK0grL1cwalhnTXlZQTlTQmFGK25J?=
 =?utf-8?B?SUpZZ0NnYW9kNTlueHNJR1JweDg2S1dxUlRqTnRnREpURXNqN2pRUmNvSXB2?=
 =?utf-8?B?dmZWaVRHTG1hTXV6RnFJV01JcDhuMVlmaUFFSUdQZE1WQThVWkltNVdhMm9E?=
 =?utf-8?B?YjVUOHBPM2JsRUpqb2pQbmRpOXZ5bUp4d3k2eXh0Qzc2MTd3SWhmaDZnRGh3?=
 =?utf-8?B?Um8yN0JMeGQwZWxVZjcxUkxnUHNhd2szZUpxUGtFbkFwcG0wQmtQNlZyK3Ri?=
 =?utf-8?B?MzdYdkNpSUVhRVJaNEhGeG5ySk9HU0FReGpmbGNQSklXMWpqeU9jZzdhRjRL?=
 =?utf-8?B?V1B1R3QydURpU0FleEp3U24rS0dIZ3lvOVNRd2xBc2R5aERZY1VadjVVMEl6?=
 =?utf-8?B?RzE5QlVTYUQ0end4YXZMblh2ZmpXNGxWVllMSHFHNHR1UEE0QzdUQ3BBNjdR?=
 =?utf-8?B?TnVGMUJiSVBvZFJmcEY2cXdOTDFrQW53YjBSKzMxc200U3VLWHJES3hKbDdj?=
 =?utf-8?Q?Ak5xnuSBkyDXhDRW/qMOGLCllexL5zEM44r5dOeyS2cnd?=
X-MS-Exchange-AntiSpam-MessageData-1: LAeDKpKJlGjnSg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f57b37-42c6-4303-79cb-08de57ec7857
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 06:23:47.8458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCw2A7kWKSjp4HCYGNn2ItjksyP4dQyhFZT0ur56V3EwGqWTioSYKE9I2gxvha5oM2+LuzxQnvx+XCdd7oOolg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5606

From: Joel Fernandes <joelagnelf@nvidia.com>

Add KUNIT tests to make sure the macro is working correctly.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
[acourbot: update code to latest bitfield! macro.]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/bitfield.rs | 318 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 318 insertions(+)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index 2926ab802227..a1505816a590 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -501,3 +501,321 @@ fn default() -> Self {
         }
     };
 }
+
+#[::kernel::macros::kunit_tests(kernel_bitfield)]
+mod tests {
+    use core::convert::TryFrom;
+
+    use kernel::num::Bounded;
+
+    // Enum types for testing => and ?=> conversions
+    #[derive(Debug, Default, Clone, Copy, PartialEq)]
+    enum MemoryType {
+        #[default]
+        Unmapped = 0,
+        Normal = 1,
+        Device = 2,
+        Reserved = 3,
+    }
+
+    impl TryFrom<Bounded<u64, 4>> for MemoryType {
+        type Error = u64;
+        fn try_from(value: Bounded<u64, 4>) -> Result<Self, Self::Error> {
+            match value.get() {
+                0 => Ok(MemoryType::Unmapped),
+                1 => Ok(MemoryType::Normal),
+                2 => Ok(MemoryType::Device),
+                3 => Ok(MemoryType::Reserved),
+                _ => Err(value.get()),
+            }
+        }
+    }
+
+    impl From<MemoryType> for Bounded<u64, 4> {
+        fn from(mt: MemoryType) -> Bounded<u64, 4> {
+            Bounded::from_expr(mt as u64)
+        }
+    }
+
+    #[derive(Debug, Default, Clone, Copy, PartialEq)]
+    enum Priority {
+        #[default]
+        Low = 0,
+        Medium = 1,
+        High = 2,
+        Critical = 3,
+    }
+
+    impl From<Bounded<u16, 2>> for Priority {
+        fn from(value: Bounded<u16, 2>) -> Self {
+            match value & 0x3 {
+                0 => Priority::Low,
+                1 => Priority::Medium,
+                2 => Priority::High,
+                _ => Priority::Critical,
+            }
+        }
+    }
+
+    impl From<Priority> for Bounded<u16, 2> {
+        fn from(p: Priority) -> Bounded<u16, 2> {
+            Bounded::from_expr(p as u16)
+        }
+    }
+
+    bitfield! {
+        struct TestPageTableEntry(u64) {
+            0:0       present;
+            1:1       writable;
+            11:9      available;
+            15:12     mem_type ?=> MemoryType;
+            51:16     pfn;
+            61:52     available2;
+        }
+    }
+
+    bitfield! {
+        struct TestControlRegister(u16) {
+            0:0       enable;
+            3:1       mode;
+            5:4       priority => Priority;
+            7:4       priority_nibble;
+            15:8      channel;
+        }
+    }
+
+    bitfield! {
+        struct TestStatusRegister(u8) {
+            0:0       ready;
+            1:1       error;
+            3:2       state;
+            7:4       reserved;
+            7:0       full_byte;  // For entire register
+        }
+    }
+
+    #[test]
+    fn test_single_bits() {
+        let mut pte = TestPageTableEntry::default();
+
+        assert!(!pte.present().as_bool());
+        assert!(!pte.writable().as_bool());
+        assert_eq!(u64::from(pte), 0x0);
+
+        pte = pte.set_present(true);
+        assert!(pte.present().as_bool());
+        assert_eq!(u64::from(pte), 0x1);
+
+        pte = pte.set_writable(true);
+        assert!(pte.writable().as_bool());
+        assert_eq!(u64::from(pte), 0x3);
+
+        pte = pte.set_writable(false);
+        assert!(!pte.writable().as_bool());
+        assert_eq!(u64::from(pte), 0x1);
+
+        assert_eq!(pte.available(), 0);
+        pte = pte.set_available(Bounded::<u64, 3>::new::<0x5>());
+        assert_eq!(pte.available(), 0x5);
+        assert_eq!(u64::from(pte), 0xA01);
+    }
+
+    #[test]
+    fn test_range_fields() {
+        let mut pte = TestPageTableEntry::default();
+        assert_eq!(u64::from(pte), 0x0);
+
+        pte = pte.set_pfn(Bounded::<u64, 36>::new::<0x123456>());
+        assert_eq!(pte.pfn(), 0x123456);
+        assert_eq!(u64::from(pte), 0x1234560000);
+
+        pte = pte.set_available(Bounded::<u64, 3>::new::<0x7>());
+        assert_eq!(pte.available(), 0x7);
+        assert_eq!(u64::from(pte), 0x1234560E00);
+
+        pte = pte.set_available2(Bounded::<u64, 10>::new::<0x3FF>());
+        assert_eq!(pte.available2(), 0x3FF);
+        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_0E00u64);
+
+        // Test TryFrom with ?=> for MemoryType
+        pte = pte.set_mem_type(MemoryType::Device);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Device));
+        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_2E00u64);
+
+        pte = pte.set_mem_type(MemoryType::Normal);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Normal));
+        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_1E00u64);
+
+        // Test all valid values for mem_type
+        pte = pte.set_mem_type(MemoryType::Reserved);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
+        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_3E00u64);
+
+        // Test failure case using mem_type field which has 4 bits (0-15)
+        // MemoryType only handles 0-3, so values 4-15 should return Err
+        let mut raw = pte.into();
+        // Set bits 15:12 to 7 (invalid for MemoryType)
+        raw = (raw & !::kernel::bits::genmask_u64(12..=15)) | (0x7 << 12);
+        let invalid_pte = TestPageTableEntry(raw);
+        // Should return Err with the invalid value
+        assert_eq!(invalid_pte.mem_type(), Err(0x7));
+
+        // Test a valid value after testing invalid to ensure both cases work
+        // Set bits 15:12 to 2 (valid: Device)
+        raw = (raw & !::kernel::bits::genmask_u64(12..=15)) | (0x2 << 12);
+        let valid_pte = TestPageTableEntry(raw);
+        assert_eq!(valid_pte.mem_type(), Ok(MemoryType::Device));
+
+        const MAX_PFN: u64 = ::kernel::bits::genmask_u64(0..=35);
+        pte = pte.set_pfn(Bounded::<u64, 36>::new::<{ MAX_PFN }>());
+        assert_eq!(pte.pfn(), MAX_PFN);
+    }
+
+    #[test]
+    fn test_builder_pattern() {
+        let pte = TestPageTableEntry::default()
+            .set_present(true)
+            .set_writable(true)
+            .set_available(Bounded::<u64, 3>::new::<0x7>())
+            .set_pfn(Bounded::<u64, 36>::new::<0xABCDEF>())
+            .set_mem_type(MemoryType::Reserved)
+            .set_available2(Bounded::<u64, 10>::new::<0x3FF>());
+
+        assert!(pte.present().as_bool());
+        assert!(pte.writable().as_bool());
+        assert_eq!(pte.available(), 0x7);
+        assert_eq!(pte.pfn(), 0xABCDEF);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
+        assert_eq!(pte.available2(), 0x3FF);
+    }
+
+    #[test]
+    fn test_raw_operations() {
+        let raw_value = 0x3FF0000031233E03u64;
+
+        let pte = TestPageTableEntry(raw_value);
+        assert_eq!(u64::from(pte), raw_value);
+
+        assert!(pte.present().as_bool());
+        assert!(pte.writable().as_bool());
+        assert_eq!(pte.available(), 0x7);
+        assert_eq!(pte.pfn(), 0x3123);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
+        assert_eq!(pte.available2(), 0x3FF);
+
+        // Test using direct constructor syntax TestStruct(value)
+        let pte2 = TestPageTableEntry(raw_value);
+        assert_eq!(u64::from(pte2), raw_value);
+    }
+
+    #[test]
+    fn test_u16_bitfield() {
+        let mut ctrl = TestControlRegister::default();
+
+        assert!(!ctrl.enable().as_bool());
+        assert_eq!(ctrl.mode(), 0);
+        assert_eq!(ctrl.priority(), Priority::Low);
+        assert_eq!(ctrl.priority_nibble(), 0);
+        assert_eq!(ctrl.channel(), 0);
+
+        ctrl = ctrl.set_enable(true);
+        assert!(ctrl.enable().as_bool());
+
+        ctrl = ctrl.set_mode(Bounded::<u16, 3>::new::<0x5>());
+        assert_eq!(ctrl.mode(), 0x5);
+
+        // Test From conversion with =>
+        ctrl = ctrl.set_priority(Priority::High);
+        assert_eq!(ctrl.priority(), Priority::High);
+        assert_eq!(ctrl.priority_nibble(), 0x2); // High = 2 in bits 5:4
+
+        ctrl = ctrl.set_channel(0xAB);
+        assert_eq!(ctrl.channel(), 0xAB);
+
+        // Test overlapping fields
+        ctrl = ctrl.set_priority_nibble(Bounded::<u16, 4>::new::<0xF>());
+        assert_eq!(ctrl.priority_nibble(), 0xF);
+        assert_eq!(ctrl.priority(), Priority::Critical); // bits 5:4 = 0x3
+
+        let ctrl2 = TestControlRegister::default()
+            .set_enable(true)
+            .set_mode(Bounded::<u16, 3>::new::<0x3>())
+            .set_priority(Priority::Medium)
+            .set_channel(0x42);
+
+        assert!(ctrl2.enable().as_bool());
+        assert_eq!(ctrl2.mode(), 0x3);
+        assert_eq!(ctrl2.priority(), Priority::Medium);
+        assert_eq!(ctrl2.channel(), 0x42);
+
+        let raw_value: u16 = 0x4217;
+        let ctrl3 = TestControlRegister(raw_value);
+        assert_eq!(u16::from(ctrl3), raw_value);
+        assert!(ctrl3.enable().as_bool());
+        assert_eq!(ctrl3.priority(), Priority::Medium);
+        assert_eq!(ctrl3.priority_nibble(), 0x1);
+        assert_eq!(ctrl3.channel(), 0x42);
+    }
+
+    #[test]
+    fn test_u8_bitfield() {
+        let mut status = TestStatusRegister::default();
+
+        assert!(!status.ready().as_bool());
+        assert!(!status.error().as_bool());
+        assert_eq!(status.state(), 0);
+        assert_eq!(status.reserved(), 0);
+        assert_eq!(status.full_byte(), 0);
+
+        status = status.set_ready(true);
+        assert!(status.ready().as_bool());
+        assert_eq!(status.full_byte(), 0x01);
+
+        status = status.set_error(true);
+        assert!(status.error().as_bool());
+        assert_eq!(status.full_byte(), 0x03);
+
+        status = status.set_state(Bounded::<u8, 2>::new::<0x3>());
+        assert_eq!(status.state(), 0x3);
+        assert_eq!(status.full_byte(), 0x0F);
+
+        status = status.set_reserved(Bounded::<u8, 4>::new::<0xA>());
+        assert_eq!(status.reserved(), 0xA);
+        assert_eq!(status.full_byte(), 0xAF);
+
+        // Test overlapping field
+        status = status.set_full_byte(0x55);
+        assert_eq!(status.full_byte(), 0x55);
+        assert!(status.ready().as_bool());
+        assert!(!status.error().as_bool());
+        assert_eq!(status.state(), 0x1);
+        assert_eq!(status.reserved(), 0x5);
+
+        let status2 = TestStatusRegister::default()
+            .set_ready(true)
+            .set_state(Bounded::<u8, 2>::new::<0x2>())
+            .set_reserved(Bounded::<u8, 4>::new::<0x5>());
+
+        assert!(status2.ready().as_bool());
+        assert!(!status2.error().as_bool());
+        assert_eq!(status2.state(), 0x2);
+        assert_eq!(status2.reserved(), 0x5);
+        assert_eq!(status2.full_byte(), 0x59);
+
+        let raw_value: u8 = 0x59;
+        let status3 = TestStatusRegister(raw_value);
+        assert_eq!(u8::from(status3), raw_value);
+        assert!(status3.ready().as_bool());
+        assert!(!status3.error().as_bool());
+        assert_eq!(status3.state(), 0x2);
+        assert_eq!(status3.reserved(), 0x5);
+        assert_eq!(status3.full_byte(), 0x59);
+
+        let status4 = TestStatusRegister(0xFF);
+        assert!(status4.ready().as_bool());
+        assert!(status4.error().as_bool());
+        assert_eq!(status4.state(), 0x3);
+        assert_eq!(status4.reserved(), 0xF);
+        assert_eq!(status4.full_byte(), 0xFF);
+    }
+}

-- 
2.52.0

