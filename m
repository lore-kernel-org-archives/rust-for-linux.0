Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012038.outbound.protection.outlook.com [40.93.195.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3C943D4FF;
	Wed, 21 Jan 2026 07:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768980262; cv=fail; b=OcJ1bWJ08jAhXRKLwNcROHZ2BQoGdvmUY4XAv9AS+LqeMNHGWpMrRPUlLX3zfL9TUT+GimHdhabba6Uhx6VE1OwhulibGi0nMYIii9DOGH4h6s5PAJTdKsCOxZ1DeoyIJj+cL/U2FB3rZBLAte8C8g6FEjM/fH6WRLm/vkBH1k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768980262; c=relaxed/simple;
	bh=2sYGQcHmJtLfTZhRw/SXDRB5uJwRvYuqPW2+ob1Pt6U=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=KiwD29C42g27UAEO+HwDSThCX997Jc+DDDsW9Z62Jh87LfdGUZs0ZgOX5OFKHb5z8pMyVUTxAhA8aKmVx7vlVFsyHwBJU24phwrKD7VERAGqFeUvn93z7nMsKLqg3XGfftZlUqjEipvpDzDW42g6MbmDCph9pDllVfjQCsXbuMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R7i1PNyF; arc=fail smtp.client-ip=40.93.195.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R7i1PNyF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHRW0Gn7SfFvgOhH8QXzD03l4rEYm89Zx77MlMFhvRR5fyEW0aCmXA8ZUdjF2DMDFjMEROV8FEx2jSZ6iknciXWhKOjt5WJ7GsAHt7viNXR+wd7lNRAKx7YnbSeXw/LI0GrJoIwYApHJpEWcCNP4IPkrxiZ1CYPvKt1+U/d6M1uCunEnQwp6ACikQKI2HZ8HTlzjiDvEO8KndvlL1mAd5tUgUi4yp4P6lnjWxR1U0Nvb4QAj14eObJnFx+KnYaRdN1rDka0xIGmOhXwyW6O70C7u0z9/S08RyZWNCjZ2KAmhpGTJXxaFCTXXOu2A1BVRpYkmLuSOTuEWDvmHZbwjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSDurze8rK4Ht1k1oLu6MukXn74lBzM9mto4f+apC9w=;
 b=toVraYqFwperOjPpMczPpVWctIbdWkql+ZNuDRi6Whvz08ydOETS4JtZ0h2gK46CLzXAWeuo8IbhjTzgoqemmGcXinJcuuIvkOv9FhReqM8coNzbamLmTyMsmYNv1K0AHnG9Khei+Jky9JK2qFp71GpfvcmsaWgInL8UDdWyD/02X7tz/DY1XTtsxSxqElDsg+BYjVpxhCkM0FZ8aA+2jXnW/Z4dcr0DMLnL9PnjCo63bC2v8asv9LU9b+h8dmI8pwdV2C7LvTKtN/6dlE+M6kqPj8j+nXf4vHXcCGs9Gcw3F94KYTY450nbKHXRqVMOY6OtrPFb7f+qcXey5j44sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSDurze8rK4Ht1k1oLu6MukXn74lBzM9mto4f+apC9w=;
 b=R7i1PNyFzo9qc6jOOqO+iUG1L+TakHospKXzGDApoAc3w5xruR41S5L2B0Z9UUwV/3jG+ejCqwTwxuum3EG3oyt3xfxu20e4fjkAjn1MWjsmdjkRCWnuYCKU+DKhQ2ueaaM0quyHUeOaKcnDH3gTOkB3hXqbH7ytNEjKy39FXD2tc+7B2QY4BdvIQbgxp1EKDj0DUpxnSEKrb02bsAL0ZFy52dwL6EfMFLFJmfZ+NTNY9q5GFxV3mY6Z4YOpIGMbUVsfMD99yXAVef2rpubiZBIA6ZFx0IeT4UOMcQc0/Oa83KoABLZpV0XpJbK1u5iOa0TfXV458g7DarzD5KixFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8272.namprd12.prod.outlook.com (2603:10b6:8:fc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 07:24:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 07:24:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/5] rust: add `register!` macro
Date: Wed, 21 Jan 2026 16:23:52 +0900
Message-Id: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0XMQQrCMBCF4auUWRvJJNaAK+8hXaTJ2M7CVCYlK
 CV3NxbB5f94fBtkEqYMl24DocKZl9TCHDoIs08TKY6twWhz1ohOCU2cVxIVgh89RoMOLbT7U+j
 Or526Da3ndlvkvcsFv+sPMfqPFFRaOWM9upMd+95dU+HI/hiWBwy11g+ouhBNoQAAAA==
X-Change-ID: 20260117-register-ccaba1d21713
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0111.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: edfa35a9-9dc9-4f11-bae6-08de58be14ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rzh3SHRvckxCL1lYQnlmOUVCZ25QWDAxdTdwdE5uanR2YUt6L0tyRWFIVnk0?=
 =?utf-8?B?T3l5cTAvWEdaVDFQSEQzZDF2RzRiUWlGNW9wN0VtQUZmTmd1TzNKbWtRRGtH?=
 =?utf-8?B?MTQ4UWZ4a3JNc3U0UHptT2ZjZFR4ZFZDZE9RTnAyTmhNVEgxVk9mTG5zella?=
 =?utf-8?B?MHJXR0plcEM1WEFDQWV5NVZlNzdEZzF3V005WnhGU0xWb0Z0VWZRNnJCbis5?=
 =?utf-8?B?NEJEQk90Q29jdm1na3lGTm8zTG11ZUpDK0VHaUxsTnRCTmxtem1XQlVSUzNn?=
 =?utf-8?B?QjUyamcwNE02UExQY0hWRFdhanhySmNrdzF4ZVFqYnZZeVJjZzRjL3NENFUy?=
 =?utf-8?B?K3lucnhJS2l2MFlqYXV2d2c0WTlIRjRiZk9FK01xbHF4YTU5bDFBUjBsZmRG?=
 =?utf-8?B?V3JPZ0pvODdKcmp0MWhSOURuWkl5R1FUV21icFV2TzdUT1piQ2RzSmZiT2ZQ?=
 =?utf-8?B?VzNpRGJpcTRGZ0VOOUExd2thZnhyUmcvOGIyMFQ1RExlMENVODRkSXM0czVn?=
 =?utf-8?B?YU1Cb00yZmptd2xveExpb3Y2MzRXeFpRVytFL3VlbGt2YlpHcndkTUM4L2hj?=
 =?utf-8?B?QjBoVFRtQytFeUJLajBqNmc1SU1UZHlXNURyRzUrQ24za0tyRm9xYkdOd1ls?=
 =?utf-8?B?VkRWa1k0QURwajNjR1BWYi8xbWJwUkI5QkgvUFNlOEE3NlcrclZIb1pWd3JI?=
 =?utf-8?B?MFFSSHZLVFQ4S1dud29ObGVqYUZVUVdMWTdIRU00WWZ0QzBBTnJ6Y3ZGZ0dE?=
 =?utf-8?B?alhsZ2ZaS1loUTE1dlVTcVlnRm1FV1U3OHQ1ZENSbVdubk5IeGdraERMeEE1?=
 =?utf-8?B?K2VkYlEvRk1tODBVK2tlaDgrUVcwbzVialVGdzJHVTRpSHgvR2J1RXVuQy9S?=
 =?utf-8?B?NEMzUzFpM2g0elpQalgxV2RnYXEvbE5zMXhCV0x1ZHhkL01aTVpUYVVRRkFJ?=
 =?utf-8?B?VWE1WVlDR1ZtZW5MSmxOWE1iUFdoTjBBOTI4bjdEVUZwbUhKZVgzREo4clhn?=
 =?utf-8?B?eFBLWENFeUZmWW4zdi9OZFVxbE82V2c4bmg5Y3JBMkVnMVdxSkFlYmovaUFL?=
 =?utf-8?B?cm83L2JkbEhFWTV2MXB3WFEyTkNRWjF1aVN5cU1vRnlZL2RBUFBoQ3NKMzgw?=
 =?utf-8?B?cjVDQ2l2cFN4R1FId2YrdjJ5bU05Qzg0UHZ1ZWh2VVBQNjdnZThoN0RQNU11?=
 =?utf-8?B?UGtVMjZQMGpwb3RXcGExNGM3SnN3OFdlNmJFRkUrcDBRVUdyeVZaVWpjTzBa?=
 =?utf-8?B?a2x1SWwyRDVtNnYyVUdPRk0vbTRCLzA1RHpaclpqOGxNR3pWK1BzcCtpVld3?=
 =?utf-8?B?alJHWDJqVi9mMkVZdkNhRzFlOEQ3THBNUkxPNnFnQ0lBYXAzTkVuT0V6cnFw?=
 =?utf-8?B?UnRNRXd3RVMyNHRXL3kycmJMU3VKK2FvVGh6QktVYTR6NnpJbGUzT2xZYURI?=
 =?utf-8?B?cVcvc1hLMCtHcDZqeXFYVzl1T1QxZEpiUVhiQkQ2Y3ZZRmlrdXFYejlza01F?=
 =?utf-8?B?SERuOUJEMXdLTDVrV0FDTDF5cm5tNFB5V2pWYm5BVENYb2w1anp1NUw0aDR1?=
 =?utf-8?B?OWY2cHBHOHhKRGxFcVlzZUZmcUluUU1URVJNK255N1c1ZWNHN1hYUU1ISnQ2?=
 =?utf-8?B?OVQ4VzNKQmNyMmErdXlhTXdjNitNVndPWHF4b1gzbjNmQ21DWVhrRHQvazJh?=
 =?utf-8?B?a05SWWNMZDgwcUFBTktPVWg2MjJBbndBL09md0xEbUhGdm9yN3hiRm5PaEM0?=
 =?utf-8?B?cnp4aU5STUk4RndLbHhsT1ZoM1hYYXBEZ3ZCR2lDU2pKWWJPb2VOdnRzdlEx?=
 =?utf-8?B?Z2JnZVlHaU5MV3IxRTlWT3QwU0JmQkkvS2U4T01jdE9JMFVvb1czeEhDajJv?=
 =?utf-8?B?SW5yblZOQlBpQ1dJYVRRcEdQTEt4VnlwTm9zMzMvSC9XUm9DQzRjMDRyNWQ2?=
 =?utf-8?B?SW01dzgrSjNKL0VKRzdrbml2WFdOemJrZDZyZHhvei80bEYvb0lHNGpnQzdx?=
 =?utf-8?B?V3F6UmN4L1dMM0x0Q1FiZE9iUHVLVS9UNWYydEs0cmIzRk1lMVFTcFVDSXRt?=
 =?utf-8?B?K2s2UWZSaDZnb0pOdDMyd3Q1UVkzcHB4a3B0Z2lUdnZKMDgzMGlNVlcwOGNJ?=
 =?utf-8?B?bWNFQlJTUDZGR2JQQTNjc1N1d3krSm5DRDR2WGhEZjZrTGRQMWN4Wk4xMHND?=
 =?utf-8?Q?jcXYSK+trUWFJz4nLj5DTug=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW5lakNTTHVucjB6RXF5N1BrRTF2YWpTWTFyZUVZVi9SdFZzREtBTFRHcXNU?=
 =?utf-8?B?cTVSeUtKMGhiTWRvTnJsK2RTTzAzd0hIUzJSV2x3NStFTW5lM0hreVlJa2RR?=
 =?utf-8?B?dGVaMG5NamVsYk9YZjJhVnJUbVFLc2NzZFNBUHRLYzN5T3ZvUlhZbnNBcWlW?=
 =?utf-8?B?ZXB5YTV2eUNQcS9XRVNzZFhHbVdEZXJaVXEzYWZLK3c0OXU2ZTNrUVdWeW9R?=
 =?utf-8?B?dkpsNjltQytzcGZxcjVyMCs4ZDFRYnNYeVN5cDl5K2czSmYzLzEwUFY2aith?=
 =?utf-8?B?WlhxL1U1aTEvdVpxWFcxN2h0NElOdzFqTG13ZmI4djRhOTduOU8vOGFIOThU?=
 =?utf-8?B?WVRFNVhYUEJmYU9oc1JlUjVqdHU1UFVWVXV2YkZDY20zUWJacThjMG4wMUpr?=
 =?utf-8?B?VEpkdUQ5QlZKWk9NWWZVUUF6MU5yT1NQbGF5N292K0p4Y2J1a2dXMS96VHR5?=
 =?utf-8?B?bXlwL1dGblJOYUpScnpDYmR5NWdUK1F5WUtEYk9vb3JXUkg3Y1hBaTVHUGI3?=
 =?utf-8?B?cytnc25NemdHTFhiR3YyR1RGbm9hdTBnM3ZTb2w4V0Fia3RIZVVCa0prYWxr?=
 =?utf-8?B?UFdTY2EyaVc5WWV1SU1JdG1UZkJPTU1aSU12VkU3RklwbENCN1pDVFdJcVha?=
 =?utf-8?B?WWl4Ulp3amptSitYeXhzVlowNVBqNDFYbzBRbmZ4bEhVdHBxTDJVelczTFpl?=
 =?utf-8?B?R2IwREJTVUUxZXAySVBHZW9HQWRlMjNOaFhpNUl3T0tFU243YVQ4akhxWFRn?=
 =?utf-8?B?d0pEKzFYSHdzVUt1dFZobzB6S01PUUZYc2RzL0VPRlExU292endCemxQQ2NI?=
 =?utf-8?B?OGtFSzVwdmpyWHdSbzR3THFyeEVtR05xRzhTSEVOb0NSU0lwZXlobDZxU3Q3?=
 =?utf-8?B?bUh1QUNtTEh6UjFvd1RDTlFwOS9BZHpYK09OdFd6dm9TUVduakhtRG81Q2ht?=
 =?utf-8?B?aG5Ba2hzcWV0M3YxOERWREw0UVVVa1E3U1dpamtqRWVuTEduR1haRXlWS1dI?=
 =?utf-8?B?S0NxVkN3QyttT3lkVGV5c0N4YnFnN2tYcUx5d2xvZkdOaU9uVUZyN0g0bDl0?=
 =?utf-8?B?VjF2c3JDK2tmNkMwUmdTeDhnTjBvZi93bEE0ejJOR24xK1NZUUVpMTM4R3RB?=
 =?utf-8?B?d3NyRXY5MlpnbGxmbllTQkIzRmMxUlZpUkV2TEVZelhIQTlGMUdtdkRZTVhT?=
 =?utf-8?B?UTZHNGRIRTBpWThDV0t3Y2lsSjVIN3RCK0FaU1E2WG8vSmZ3UE9BYjNZbzNW?=
 =?utf-8?B?UDV1bTRXVU5uY2hlSUpQMEJ1TXNMUnhCRG5ZazZpYXg0alF2YS80NGlraHJW?=
 =?utf-8?B?em1PSUNhQTVWQW83aG0xZklMQVdUdnVIUm1Hd2NFY0tkaW5mb3F1T2VHc1ZG?=
 =?utf-8?B?aVhiTkR6RG0raUNnVmpGeENPbXQ5QU13VC82SFlJZUZudjJiVm05QVZ4enpS?=
 =?utf-8?B?clRna1ZrRG1ER3JuNHltd3djYUJ5c1Y4QlE3elFEY3RtdVBETytPWC92b0o2?=
 =?utf-8?B?NXQ0eUxYRm1ETllaQWV6WEVsaXRhcloxOUZmZ3gwM2dEblRubXZuSUVnR0VS?=
 =?utf-8?B?SXRTamtSQXV4cEUrWkFHbGtBL3Z3WWVQd0J3OFUrU1dBUTZmeTB6T3YzT1VI?=
 =?utf-8?B?dFdNZ1FFTWpPNjhEUzhDQ3djRU5Mc3o1YzgrR29SYU5MWWFIdFlQYVk1NmRE?=
 =?utf-8?B?VHg4aXVreS9MUW5YSHVUUGRkRjl0dUJRUUlVcjQrK3p1WHowU3JCVzFBM2ly?=
 =?utf-8?B?aHJ0WU14Z1RDVHBEU3ljbmMxOENaR1hRTStPYk5zQkxLOWtMNmMzc2w0WEV6?=
 =?utf-8?B?WjZLS0xZR3pBUWlNb2UvQ1ltSnQzd1phS0dFVFYxUG1aOE5mMXVHQ1h1Z3JX?=
 =?utf-8?B?d0RGaW4yTk9lNEcrQmZRNisvRTRGc0xvSWVvWU12WE1hSkJ0N2RCSGNLaDNn?=
 =?utf-8?B?ZXBLbEZqQzJmK2R3enphUmxQSTd0Mjg3L1hRUlpjZ05IYy9rcE1IRk96ZFpR?=
 =?utf-8?B?cUprRmxjRllueVZNTUZMRkhSMTRPNUNpV25aS0V2dktYWjJHamRTc01URWd2?=
 =?utf-8?B?NHB3eE53dzIyZ3lhckRQSFRtaGo4WU5JTTFYVDBONEMvSnU5RUJwZzhLcE5u?=
 =?utf-8?B?MlI1Vm9xTGJ6eDVoVDhKdHBNdDVNSTVFWjBPbXdRWllIR3lhR2hndGZDdlpT?=
 =?utf-8?B?bmhVdFp4MkluTE1qb2VRNzBJMkVVN0F1V2p1aTRKSFh3NHFCd0dmTTV3YXBu?=
 =?utf-8?B?bytqd0cvdGdmVjErZXpKdjVrKzMwMGpGVmtIanJDelhJTUhvMVpjRTBsNmc1?=
 =?utf-8?B?ZXVwT09aNGZheWZoOVlRVjJBdzVzNGpLM2h2QUlBR3NoV2dITmxJUDJOUmMz?=
 =?utf-8?Q?WHUFurH8/M79cg0KcRzUuu4StSS7ncEydoz6ck64aUhs7?=
X-MS-Exchange-AntiSpam-MessageData-1: byxTqbqUHzlyeQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edfa35a9-9dc9-4f11-bae6-08de58be14ba
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 07:24:15.0264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FI+8h6h6mi0Vt4E3K4yTEYsGAx9ciFWuLUI34rlWeYKyWFD+6cchdIK4CmSFXZFwB13f5T+L9HCWtFp+4Tqwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8272

Add an improved version of nova-core's `register!` macro to the `kernel`
crate for all drivers to use.

This is not a direct move from `nova-core`, but rather a new
introduction to facilitate code review and introduce features that are
missing in the nova-core versions. Differences notably include:

- Use of `Bounded` to prevent any data truncation when manipulating
  bitfields,
- Extended documentation,
- Doccomments now build and run,
- Supports visibility and different storage sizes.

The `bitfield!` macro of nova-core has for the moment been wrapped into
`register!`, as a set of private rules, to allow `register!` to be
merged first while `bitfield!` undergoes review during the next cycle.
Thus, some of the code from v1 (including `bitfield!`'s doccomments and
Kunit tests) are kept for later.

The first patch enables the `generic_arg_infer` feature, which is
required for generic type inference and used in subsequent patches. This
feature is stable since rustc 1.89.

The second patch adds `shr` and `shl` methods to `Bounded`. These were
suggested by Alice during LPC as a way to avoid the use of the
controversial `Bounded::from_expr` in both the bitfield macro and the
Nova code. Third patch adds another convenience method to obtain a
`bool` from single-bit `Bounded`s.

Patch 4 adds the `register!` macro. Since it falls under
`rust/kernel/io` it is covered by the corresponding MAINTAINERS entry so
I refrained from adding one just for this file, especially since the
bitfield-related parts will eventually move and what remains is very
tightly related to I/O.

The last patch illustrates how this macro is used by converting
nova-core to use it, and removing the local implementation. This patch
is to be merged one cycle after the other patches.

Previous work to extract the macros was done in the partially-merged
[1]. The current series can be considered a reboot with more features
and the `bitfield!` macro being postponed.

This patchset is based on `driver-core-next`.

Note that it also need `rust-fixes` to avoid an `unused_unsafe` warning.

[1] https://lore.kernel.org/all/20251003154748.1687160-1-joelagnelf@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---
Changes in v2:
- Remove `bitfield!` and put its rules into `register!` to give it more
  time to get reviewed.
- Allow output type larger than strictly required for `shr` and `shl` on
  `Bounded`.
- Enable the `generic_arg_infer` feature, required for rustc < 1.89.
- Link to v1: https://patch.msgid.link/20260120-register-v1-0-723a1743b557@nvidia.com

---
Alexandre Courbot (5):
      rust: enable the `generic_arg_infer` feature
      rust: num: add `shr` and `shl` methods to `Bounded`
      rust: num: add `as_bool` method to `Bounded<_, 1>`
      rust: io: add `register!` macro
      [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro

 drivers/gpu/nova-core/falcon.rs           |  127 ++-
 drivers/gpu/nova-core/falcon/gsp.rs       |   10 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |    5 +-
 drivers/gpu/nova-core/falcon/sec2.rs      |   13 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     |    9 +-
 drivers/gpu/nova-core/gpu.rs              |   24 +-
 drivers/gpu/nova-core/gsp/cmdq.rs         |    2 +-
 drivers/gpu/nova-core/regs.rs             |  265 +++----
 drivers/gpu/nova-core/regs/macros.rs      |  721 -----------------
 rust/kernel/io.rs                         |    1 +
 rust/kernel/io/register.rs                | 1198 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs                        |    3 +
 rust/kernel/num/bounded.rs                |   61 ++
 scripts/Makefile.build                    |    3 +-
 14 files changed, 1485 insertions(+), 957 deletions(-)
---
base-commit: c259cd7ea3c9ad369c473ba2385d82e3432088b1
change-id: 20260117-register-ccaba1d21713

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

