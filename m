Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012024.outbound.protection.outlook.com [40.107.200.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C8513B7A3;
	Tue, 17 Feb 2026 11:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771326284; cv=fail; b=apMTbAa2RXRnbj68dRx+fP/Nt5xTbkkWrZZF00zea38w36ZPDw8k7uYxI+cXoLf1/HaJyOrpLXJeNRdccFz6CJRAKMyRjRK9qLnkKoQ7YkGECS6vW5iOLX7ZNQyHyMs/46IvuT7BMi1w7IpXsJavfG7Dqi8i3V2RlyS6olF3iRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771326284; c=relaxed/simple;
	bh=Gbe0nDvQCvLwF3lWTLolCTEaW6q9go4O1En/TjErAj4=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=fAx7DDuZ0mqxfg/9rFAaQfkGOswHrvZR68Rx6EmNYKBS+1oNvmyciNJwxyrnCtPJKnEh5K8fTdeTznya1NREEvLWddGBrW4UMX4qzJoaUFz6vmxSFXaMaepb1kjdA8XrEgFX4liTU2jT3Qr1U3Yp1zB40sXDjXxg/REbU8ScDp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=udEYTKKH; arc=fail smtp.client-ip=40.107.200.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="udEYTKKH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHV7DpJsQL7Y9TqonDl295qlZ7On0TXMev83tKc0SoSp6bvF2KEXXnfDjRrMz3j85QL3hmHU8ySOY1NnrELnVa9xPDG2x+G+pI2VMcMqMN874SwXyPvUP/S/EXLenLmBz/GNmqGCUYOGdzOcHilL1VEu7PXTOnhl0Vs0qoxytsYynw17FSoIZRED51DJEIAtQ+/oxdkgHYvj7Sx30mRFgK0IiDwgqIVnRfDZlm5uJj/t1shDL9AR0CHXiQ/qJDHPoXy71JQ54CVMbV0Li5ndlfoKe/tkZyfi2JUK5OnNWa1N6ezvljIDIM6UIPdH4qnlZNaxInozncm+f7q7tXEX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECgEIZDqb2bvNSgGdpsEd4P2bqn6/2ntOtJ3GWaPBOo=;
 b=B8P0HtBY5T5ippQEPJGTdZDxoqXwqAFlCguUGiAQ8/dBg9FpAo3dGviyEJzxnjdrlvQl2I4TBJmcPwYrNYVcskM9zjLnE5Am/f9HPA6VklX+AcZoSVk0ZQnKE/5rNsP0w37Jbp+lLys/abQa4q7XB24/N9HAycuEG81FX2kFA66P+hraVRcze+7yhmS1w4OK2MGtzzB78rw/ai/Z8OfkeN1GG15XyJyJv5Hxbe5yaum3zB2EFMZumyTuWsXKG5IlmA2ToXX6cJFr18xs6wwXnfA1I/u55a2j/NKRSm0v/tB4jw/lmiqDbMuWIgNz2AyA3FkVWwxjO4K77jH37kaVTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECgEIZDqb2bvNSgGdpsEd4P2bqn6/2ntOtJ3GWaPBOo=;
 b=udEYTKKHI9IN4axsQt9+Al8a0pMycvf5lupeZxl2er2u8/k6mksYEaTwGfbSU0OqjGSlaKCQDY8lWQZk4b92SWCZoXcJxaw6Zlsvsq8qBwhZR/bnlXm4fjP3JqEc63rGGF4GM623u6iStm154staAj4b/xdqhXT3NbBlxWBai2klYueojz/uSbolYZ1L2AqlWNiNc1XzXPs1Qx0comanIhsmZBurQqoQeFTIp1kVr9k/uunbnN7JvW8bkVu/jx3lzw1AeKrYMVtQa22ERMHgJ3O44UtP3/1bBdD1BoNOuOUGFlqSFOo2/uJJtk8TlY0iFwvNw/tekbOa4a8Y/xOEOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 11:04:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 11:04:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 20:04:34 +0900
Message-Id: <DGH6RCNEHB5A.1WIXUQIOW6EZ5@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Maneet Singh" <mmaneetsingh@nvidia.com>
Subject: Re: [PATCH 2/2] gpu: nova-core: improve GSP RPC debug logging with
 message classification
References: <20260211000451.192109-1-jhubbard@nvidia.com>
 <20260211000451.192109-3-jhubbard@nvidia.com>
In-Reply-To: <20260211000451.192109-3-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P301CA0117.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: e30bea2d-d259-455f-15a9-08de6e1457ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGo1WGlGSE5wZzlhZmNhKzd4REI3eHo4QXAxY1ZvMVVHVllWQUNGbUxZYmNx?=
 =?utf-8?B?bTd2c25mV3k4OHVCUG1TeHBOK2FHcU1vUUIyMXJQdlZQS2JrOXpBNEhUTS9n?=
 =?utf-8?B?SldiN3ByNGQ0V2lacHM2dmdxa1Y4andpVm5pb3FCTS9KdFY2NklzZzZQMkpw?=
 =?utf-8?B?T3pEVGh6bHFtclVuK0RBSEpJT3NlMUtEVENiVDhUOG9wamhIZXJXM3hQNTdj?=
 =?utf-8?B?ODAzbG03UGpQdm5zRFNlWnJIR05ndlNKTnZXcWRWM3RsazFHUHdwbUtjdmxO?=
 =?utf-8?B?NXUraC85QS9JWjFIVWllNWdRaWYzM3NUTG94NHJ2NkVqVnJLQ3VibjRNYTVC?=
 =?utf-8?B?SkNCUmNIbVhpYi9laDc4Y2xEeFBVSE12VkRsMHRiWmR2SmZTYld1OE9DdENU?=
 =?utf-8?B?OU1Pcno5STJUc1VjNVRocG1YQWRmajFGdjNuZE5BSUMzbjVUcjlIUmE2TDJO?=
 =?utf-8?B?OFFVQm1Jdk1VV2t6YWlPUE1zZy9NRkpqMXdyNEdBNGF6NGcxSHdEbUNjeDZR?=
 =?utf-8?B?MGZMUGovQW1JWHoyaExSbkZoSXg1aUgxeGEvYnhuYnFqY0dJQ0dTZ2RzTDlo?=
 =?utf-8?B?a0UxMU5mRE1IVVU5bjUzbVVHUmdOZU9ya2ZjWFpwUW1uL0NzOFhDeWJiU3ZX?=
 =?utf-8?B?SG5IOTNxMjFjMXpMcTdGMnVPeDgvWGJvMFJjU3hsVWdEN0Y1d0U1NTZldVAz?=
 =?utf-8?B?aStGNjJXciszNHBTRHJtd2VnSmlsYWk0WVZma0tWRFhFb0NmUW4zcDBQaTE4?=
 =?utf-8?B?ejJiQUQ4UktHQXpaWFRBSk45bDlBNWJ3Q3NmM2wwQnVXRG1WYUJJODk5aTVo?=
 =?utf-8?B?V0VnWjV3OGlIb2ovUVMrcExsMG85bmJBZlFXTEdMa1pjVnJrbENVbGN4ZjdB?=
 =?utf-8?B?d25xRzFuZTAyR29kajR0RTYycjhTd2JQZ1pkK1lBU3F1TFpXNEQxZDZwTlZJ?=
 =?utf-8?B?ZzUrMjl2aVRKb3FlU2pTMUNNdUN0NXJLK1VRR0ZNQ2grWW11b2FXaS9GVWpP?=
 =?utf-8?B?a0ZxbGRDazlFY3Z3c2xzYmQ1NFJJeUVNQjlpM0VldG52NlZzU0tnTW5kVmYy?=
 =?utf-8?B?NFkyU3hZblBHVlA1WWNBSnQ4OXNkM0RsbmJCUlRsSFo0aEMvVlJvUkNiMXRr?=
 =?utf-8?B?Unh4R1I5VXY1RlNFZExrZGE4MmZsNVkzRGZjdllpU2JLazB0K21PdmdDOXl1?=
 =?utf-8?B?amxqWWhtbGpGc0thQmUwdHNWa3ZabEF5L2tRVzRVOTgvUUtsRHNqU0dEblJk?=
 =?utf-8?B?MW9MSkl5KzNIZUsrYjBxYU9TMEV2aytBVnJRdWxCbVBRVWw3ejAwWEk2aVNw?=
 =?utf-8?B?OXQ1RVV6eS8wSWZBTmtNYjFoRittcnpRYlJWVjBiaE0va1pweWdrcldlZzNU?=
 =?utf-8?B?OVN0dWZlWi9vc0k4UUIzM0FVcUtXc3NJVmFMeVZ1eGZoOHU4MlYxQlVDTXY5?=
 =?utf-8?B?bjh1TFA2eTJPZVlYYkJjUmNaRlpPS1lNSmJLVU95YzIxYnIvbXRtejgzY0Ev?=
 =?utf-8?B?aElrRjVnZjkyQThBVFlZcndiL3lQUG4rWUtqVE16Mmp1T3B5bUFEQVl5MUk5?=
 =?utf-8?B?MlhaUmpxN0lhdXlqMHRkMWhVRGVPYk9La1FDTW5lRTdWM1Yrb2wyTklvUW5P?=
 =?utf-8?B?cGNEZzRtRDZjL3JjQndPR25iL25oTGVvU3JnL21YZTJ3RGp5UEo5a1NTR0x0?=
 =?utf-8?B?eHpHSnpiSDJ4dkl4MEc0eXZVbzc2cEszWlpvdzR5K3RZb2N3NVVPMlpSaUJo?=
 =?utf-8?B?SzV2QkFzVnk5UGdNUFFBNzBJNnJtbFY4YjhJdXY4ZUpWcW9lck1MbFdUVTN5?=
 =?utf-8?B?QjI5ZnBTbmFucjBNYU5KZnpiL1psRTZiNjVLV2kwcHlJUVIxRTZqa0lORTVr?=
 =?utf-8?B?VEdwZHVIT2JxalNoMjcwTUdXWWhUNHF0bEZHaUdUOTcrMUplUWZnSVZqSk00?=
 =?utf-8?B?S3pMb3hWV1FrQlY1bnJoZkxubUxodmhEdU5mT0RabDBDSUhJdG43dW1hcjZD?=
 =?utf-8?B?cmZpNTBZZUlNTGZwSnZOdVoyR1M3SUtiVmx5SDFsYThHVlFhcjBoK2wvbjQv?=
 =?utf-8?B?RnVlbGtQSG41K2ZybmhIZjlmb3haTFM5ZXJLMUlBeFV2MVFMcnQxNHdZTC9E?=
 =?utf-8?Q?y6dQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SU9qaDgzZFI4ZWRmUUhWSzlpRzhMdlFHQUwrc1BkSEtJa1lUL0xjdG16dG1B?=
 =?utf-8?B?WlplMHNNdFE3WmFJSWsrdUVOZVVVQlpyRUEyUStwR0ZPOFFGb3BQYVNEOHlZ?=
 =?utf-8?B?V0c1dFEzUXlacUhkUmdnRzFhVzJ0VWJvRTFCdEZpaUFYTFVCYnFGY045c1lV?=
 =?utf-8?B?WUN2TjhlKzc1eWE0RmtWSUhDWlAyY09PeFF3K2NsWDAveUM5UzJhemxlMjJL?=
 =?utf-8?B?bkVVLzdVd2lDM28rZjhXUlRvc3pGbE5kU3dRcnppaW5ScEpUTXFmekZRNFpy?=
 =?utf-8?B?dElndkVwdjFvWTJXTVBaeXhBZjNIaWlhS1ZKdURDTGtaQzRHcjgvQThVNmRn?=
 =?utf-8?B?VXp2OC9ZZGtpZFRuS1YzdG9kUEZ6SlFheE9JME1pMmVKUG1UZXdmdjV1b1Fw?=
 =?utf-8?B?WUpxZjB5aDNOSXhrS2JtZDJrRk56em0ySzNjU3pDeXhjV01aNUI0NHQxbm5i?=
 =?utf-8?B?dWhVTEpKVFVvRDVRZW14MEJRUzJEYmN6aC9pT1lkSXdPd2J5MUV0aVlKSzcx?=
 =?utf-8?B?My9UY3hMaTF3clBTYTVyMXdiaXd4WXptRERzMkdUeFNUbnErZTVvckRwa0k3?=
 =?utf-8?B?bEtVT3JsYXBPV2xOaHdvMEpTSGJrQ09EMFEyQXpPc3NUeVlvVzVuVEpHMnhk?=
 =?utf-8?B?NHF1am80UjExc2VweDd0T1lpb1lhWlBhTGdrRWVmajJTNTYyRnVKSmtyU2tP?=
 =?utf-8?B?NHpEN1QycExSSUMvV3dxdnpBUjNEQXFETjFlNENpK3lhN1pZY2c3Sm9VZzVZ?=
 =?utf-8?B?aTk0T3ZVdm5Ua3dSU0VPVkJubG4zb3ZRRG1qVlREV1FSckdrOEpOdGpnaXRw?=
 =?utf-8?B?MkVqZWZQQVF3cHZnSnQwb2hINllrbmorcTNvbDh0ZXlrMnFENytjYUZlS1RV?=
 =?utf-8?B?V1c3eEVFRXAvRHUyais0c3dGbzAzL1JMV1ljWUJBTmRQMklpOGl1ckdDQ3VO?=
 =?utf-8?B?YjhBUDhmQnBCNU1UTllHOFVwV2d6OVlCcDNlaTdDdC85NzJpMGhlK3o2NXB3?=
 =?utf-8?B?MHhFWFBNOXhadHFFUVcvK09wMytFRnVhOWVEUHBqRk9wOHZCMnY4SklVTEx1?=
 =?utf-8?B?VnplWFNuYkd3Sk9TQXcrY0UvSzRyM1c4RlJ6NTVoNm1tSFlQQUhaZHoxUFRx?=
 =?utf-8?B?ZnF0QUNuMkZSZGUyUW1CNExwS0Y3VCtwMGRyV2pMaGlYbWJORUZpcGcydVNU?=
 =?utf-8?B?UFdxb0t0aTRDbzFxemtKZGNTUmNWSk4yOEo2TnVpYzJTcncyZFY5bjM1eGh2?=
 =?utf-8?B?QlhDT3lDazYrL01KdEtWZmx5LzFmemZaVGtXZVpLVlRkOTJiOHhhSjN1RkdB?=
 =?utf-8?B?Yk1tYU81UHI2Z3Fld21QYnIvMGVvb215cm9ZdmJJbm55ZnRidFg2V3JDU0dP?=
 =?utf-8?B?WkFlZGJjTXNtWXEvVkdwZERvdDdzRnFYTXI3djNmZ3o2SDJjSWV6Q2xZZWJa?=
 =?utf-8?B?WFVibmNEdzNrZ0RFNENKWUVOcDNJb0dHUS90dnBydnNRSldBek9xbGdMWTZ5?=
 =?utf-8?B?bTh1TVVJYndaU1FLQkVQSTNzNEkxbDhwckluVG5aSzFUbUZrR0dROU1tTHFt?=
 =?utf-8?B?ZmZLamtlOFpOMTRlQzNOT01zN1M4MFBwRHI0U2VCeUJUT3d5VldzVTBia3l3?=
 =?utf-8?B?WGNsOUV1b0JJRU5MRm5UMUdOMnorNVgvWnhrRWtCd1RKcWdhQnBBUXE4SDdu?=
 =?utf-8?B?SEQ0UlRjRjdzUnBaOUhsbWlNQ0pDbnhRdHBHSm5HVHI0WXBCb25VaC9kMTc0?=
 =?utf-8?B?YUI0NDZaelBuSUp1aEpyNU9zeVBHRnU1dmpQUis5MG9uMUp5dS9IK0lycmxN?=
 =?utf-8?B?SXduRkZCSXlEK0RZMDdjMEdtejNFdUlUb0RodHc0T252ZFlaSWdVNzhJa0Fn?=
 =?utf-8?B?a1ExOE1rdmI3MEJOYkdkUEVMVkRWTFFvOFFLakQwcFk4dmEycVhGU2xIc3Nn?=
 =?utf-8?B?WmNsL2ZWTlVvVS9kb1p0cHI5RkZUSG1JRnlQd2xibG1GOWJMK3JlVUtZOUEy?=
 =?utf-8?B?TExaT09QYWxVdFVmZVgvQU1mOTRKSk4yVWpqSmFrbGtQcGpybGxKRFZIbUxC?=
 =?utf-8?B?Nk5MRGZiSmViNGovQkluWERJNWRvem9vTWhRbzVzNkhJSGEwbEdET2Q3bUFY?=
 =?utf-8?B?UnFOWFNMdFN2ZFJLTTlNRXhSNFZrNE1mZkxzTnlydVUwc1JEbEYxTEJCQk1B?=
 =?utf-8?B?T29ZRHFtMFdLUFBENGMzRW1nNWYwWEpRVUo3T1E2N2FhZlI2aFBRenFmcUFx?=
 =?utf-8?B?aHpsQ1Q4cEZxYWtJVm9mTmZHZVJqcDIwOVYrbUVTMjljakpiVG1UTDduV1JO?=
 =?utf-8?B?ZUp3dHBQYU1qY2pZWmhKcWFPYTk1UFZ4bEFuY1ErWkptMlB1UStoUU5kblpj?=
 =?utf-8?Q?5uVnrLFmI8dB0H9dVEQzkFiW2DyydB/GVVI5KOi+x1L3Y?=
X-MS-Exchange-AntiSpam-MessageData-1: 0IK3eSeSh+qCcw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e30bea2d-d259-455f-15a9-08de6e1457ad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 11:04:38.4849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nET62XEy6ulM1lyYrpY8+o7/NT8ETivLWwPVpXmsJxCN6hKZSEWxSZeWsVE6yqlaxB5P+qsimOpQnK1U6BHQZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6089

On Wed Feb 11, 2026 at 9:04 AM JST, John Hubbard wrote:
> The debug logging printed a flat "send: seq#" and "receive: seq#" for
> all GSP RPC messages, with no distinction between async events from GSP
> (like GspLockdownNotice or GspInitDone) and command responses (like
> GetGspStaticInfo).
>
> Add driver-side tx_async_seq and rx_event_seq counters to independently
> track async sends and async events. Move the receive debug log from
> wait_for_msg() into receive_msg() where the message function is known.
> Label all four message directions:
>
>   GSP RPC: async send: seq# 0, function=3DGSP_SET_SYSTEM_INFO, length=3D0=
x3f0
>   GSP RPC: async send: seq# 1, function=3DSET_REGISTRY, length=3D0xc5
>   GSP RPC: async received: seq# 0, function=3DLOCKDOWN_NOTICE, length=3D0=
x51
>   GSP RPC: async received: seq# 17, function=3DINIT_DONE, length=3D0x50
>   GSP RPC: send: seq# 2, function=3DGET_GSP_STATIC_INFO, length=3D0x6c8
>   GSP RPC: response received: seq# 2, function=3DGET_GSP_STATIC_INFO, len=
gth=3D0x6c8
>
> The async received seq# values are driver-counted for now. For command
> responses, GSP echoes back the inner rpc.sequence that the CPU sent, so
> the response seq# matches the send seq#.
>
> Cc: Maneet Singh <mmaneetsingh@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

I took a good look at it, but still don't understand the point of this
patch. On top of the two sequence numbers we already have, this adds two
more that are purely driver-internal and have no relation to the GSP.
Async messages and events have no sequence numbers and we cannot refer
the new counters against anything, so what do they help with?
