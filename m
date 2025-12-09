Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012034.outbound.protection.outlook.com [40.107.200.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1135935972;
	Tue,  9 Dec 2025 02:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765249096; cv=fail; b=hRBG0dfjN5o7y30g8cBz9NL8m2LkVJzJ3vO0lFsW1nAGuWMtogcYBEQ6e6GgbkgmgrPGp/tcTfWbZeLlsiPWPi8vAqI2gDS2dy8MvLZW4USUvbbKmD7JWdOIK5Sx/G7JAzXdUsJ9nk6QiLYbSiEiAn4wQW3TPYcW6Iqnk67MfF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765249096; c=relaxed/simple;
	bh=YboJKYoZYyq0uuKXtMqKd9gOGs8Si5fpFYTROqe127c=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=XdRdp309yzCF+lpCMq8By1J9/OpmJ4LA05XnFwDzbG0YJbqKM1tpFLTqi/Z0IKZUb89FItQHgoCLEtAd8VkdN0loo69jn4qjGgarTuqv9xW9XrrSh1WYU4rigWwzWZmohmadnEpsc6oRtPPitEyFfvKGO23vIhkuWijFrNwdv9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oV2PgBm0; arc=fail smtp.client-ip=40.107.200.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oV2PgBm0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiX6Bnlz0y3G/xKV/1gwdPk8XO9Tqkmt0NoAkxyby5sPPzwO/Y8JAQFhgcHVDtmBsATFrl4zj9CwAJgZZ2MamfCAbJr5xA8cAUhWtnBTptG5khmx2ieP0EMTYKYeMN289WIC+g7rX3arEMNUoXcU/n8lSPd4qZDSYctNiiqKr+uh1VhvVwJeT826qnlZ3RvdUPZvTJIUG69fEoqSgxJafMg3SwLybdUDUBhMtEA/e/KZ982K1m1UhQcQuXQV/RUmgHd/wrwldqavRGzMD9ISv+36rnkVNTz6X4QW8eqgtHcwEGUVr77ShAcepgvn4Csw13q1ZvWhB9iPtk/O6fDPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G10eDx0Y3SA80mq+XKmi6yc0nSql8EHS6LxgaXwLj7Q=;
 b=KKT/E2ak0ag616a5YQzHIK+OVy40+YpHKkf73KRdyOMCSfHosgH8vCBcEkTHztDY/MzpYxy2t4kCasvZX1InAAw6NR1SEWuPSi5aqHgqe9kJD5ni0f/7DkyBCJF0SBLeMCRDk11kIiPwtTIau9lfAzkMmqWhz8Jc7D3pMXohBHdgNZtyr/T4R3Cf2wR3rqfAz7WYcYg3Z8qpfDwSUaPtncHFEyOgsJ5hKl9bl5+MC9U/8XdUIi6jzZtjRh3ATWAK6/gqNohjgiuGdjxcq+QituBtIhcEr8cOUv7YsN6EtjRl1WXB11IBtyeEBwcWk9oNXVJKDPIiK42jqh7KqgGVKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G10eDx0Y3SA80mq+XKmi6yc0nSql8EHS6LxgaXwLj7Q=;
 b=oV2PgBm0/1yuTK5R/97M6cqRkwjRIGche1bvO7FIBWptw+3ASrjYNMxMsLIpWBsknWjG77IDZtF2xqUCQ3fxRY2YpVODcN8YkVKwCwRJISqd6kg92T5TnDcWmV/r4YP4pLiWGiXQrSXNhr6e/RsMQfl+XAniqUeiNz+AeVy6akzZ0iaXYsXeBqzCaoKRwIR/qHwjfj0rvvQIKAn3C3C21z5y8p+TRWEwIGma2PdLxxnZzVKXCxdhjqDk+kAtt8Sz34Br3ayLMtQXdj5bBS+eDFWgCiPohxeXVZbYNPsFr/7qGHFNHu8SD8Ef2DRBNLOeUc1n9Lhecsmqq92F5tO9Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 02:58:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Tue, 9 Dec 2025
 02:58:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 0/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
Date: Tue, 09 Dec 2025 11:57:58 +0900
Message-Id: <20251209-transmute_unit-v3-0-819fe584ba06@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADaQN2kC/32MQQ6CMBAAv0J6tqYtUoon/2GM2cIie6CYtjQaw
 t8t3DzocSaZWVhATxjYuViYx0SBJpehPBSsHcA9kFOXmSmhKqmE4dGDC+Mc8T47irw2YCtjoUG
 NLEdPjz299uH1lnmgECf/3v9JbvbnKkkuuTairUujbdU1F5eoIzi208i2V1L/e8UFB5A1aHMy0
 Nuvfl3XDxOOw8jtAAAA
X-Change-ID: 20251208-transmute_unit-78ab58ba9e6e
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0177.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab03683-ca67-44bb-ea45-08de36ceca35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bm5XVjVGT0IvNUo2bVVRV25UcTFHVWs3b3IzYkxiY3Z3RkVUOXVqQzVTVFFk?=
 =?utf-8?B?eTBoRGMyZXZsR0NOTjlBaDVhRCs5WXZHWG1kUGF0TUdJcWY1TXc5MFBUKzhI?=
 =?utf-8?B?NVR3RTlOelJrbjkvOVNjeWRtZGZwUTlFSmZiVGluamN2TUE0U0VoMUwzZlc5?=
 =?utf-8?B?S09GOUowRHVnemRVVUtpOFNOY1hFQUtNSHVHUURiNGJMbldCSEtzVkZVQzBi?=
 =?utf-8?B?WjUzMkFERW8zQ0p5U0E1R09sdnQ2QmY3WnNROHNoNEs2bzVpQ3hGVnk5S0ZQ?=
 =?utf-8?B?Q0pPa1lpWlpZbHpJSU4ycDduVmg3UUg2V0RxbzZCUnhQK0F1bnYvckVRNHpj?=
 =?utf-8?B?UkRuby9CQnRTWWVidW5lMm1KTUVYb3FsaWp4aGVYQy9venpUUE5SV3ZCZk1y?=
 =?utf-8?B?UjZLZVF4RHAyR1ZoWjJsVTBHNHc4MGtFMjhZR3Q3Wkp1Uk5uT21PQ28rYjdF?=
 =?utf-8?B?YzRMWFhxOG9zYSsrTGtyRzNNYS9abHc0bXZCQlRhNzkwTGdnSTduRGlLY0cz?=
 =?utf-8?B?ZG41NnpyRGtqSWFDUDlXUXN3aXRVOHJRcVJ6TDE3S3lVNWtCVHI1T0oyM2Nl?=
 =?utf-8?B?K3lvVE5xNGJBbEc5QS9oVHFnZlRjRTNKUDY2R0IvV21wbmo2c3JUVTByZ2Vx?=
 =?utf-8?B?SVRQb2x5UithaU55TE8yKzBHblRocUltd0gyWkpSNGF0SUEzRmZrZ2NDTVgy?=
 =?utf-8?B?Z2syUWN6MllDSVMvNnJRWEw4T0tTcDA2ZDMrREdkU01JRzQ5Y3hzcnM1Vzkx?=
 =?utf-8?B?Q3NuSHRHOStveDNEaUNwL0NpejFyb1IzTzM4VHJqSlFXbHVnemlyQmVRMjZa?=
 =?utf-8?B?ZmZ0ZVp5YnlmRjEyZEdxcGdjMEhBQS9XaldKOFNmbGt1NHhKZ205aXl5aWJQ?=
 =?utf-8?B?N1FtdW9SN2JOemxYSHF6aWgrOUVkQnpvaHk1a3ErYlpHZERNdzQ2UWYyZGtC?=
 =?utf-8?B?Mk41VGhVY0FNYzhSWDlTcEJ1V3FaWWNuL3JRNGR1VHlqUmR6ODFJL0c4aDQ2?=
 =?utf-8?B?MzhPRUVGOENQT0JHN2o1TUg3a2ExSnM3WmJvTHZMcGUveTk1aGNXbHk4WDB3?=
 =?utf-8?B?YVMzVzhJbzJFKzdVWHpYMjArYlpHeGtoRy9nK3duSHQ4Q3NwTFJjNEFGVU10?=
 =?utf-8?B?ZGJOTFg2aXZKQ3o2c3pMMVMwTUxxN1FuTy82MVFqbElhdDk4M2VVZ0JVOWx4?=
 =?utf-8?B?RDRkUEdaaE1TVG1VdUJGM1JSMmdycXpmUmxqaDRuendGNmtxUDFSeGNuRWV2?=
 =?utf-8?B?RzRUaTVaRlpVbzNiaWFiNXF0T2xKQXVqd3hTZEcvODFva040azhFT04vU2My?=
 =?utf-8?B?Nm55UXFiazhzT3huUnVjbkFyZVNmRHBBMWpnbDEraHIvZE5FWWdCQ2RjN3FZ?=
 =?utf-8?B?SllZN0JtSXZYLzZkbFQrbENMZnVRcERPenkxcmp6aDJVc3E4WkIwcFArTGZx?=
 =?utf-8?B?R25Yblo2c0J1L2RvbS9yL3AyVnVFdVM1QVRDaDNFbTJYZDFQUkp0OUl4ZWdi?=
 =?utf-8?B?dUR0Vkt2RXFNRFc2QlZqWEFqdENqdlRzMnlMdStOSXZOZUNXUUh5ZEFMOXRN?=
 =?utf-8?B?SnNNZVQvRmhFK2FHeDB6NUVNUFliZ3U4bDRVY3hrbjhzMHo2cEFpYnA0dUNm?=
 =?utf-8?B?WEYxWCtPVzBzcC8zTUhicFRKdTR0T0lDL0ZlZG5xK25mNnJsVFZhejVSc2Za?=
 =?utf-8?B?U2lYR1Nud1h1UFBveDR4K28vWkJCU0tseHc3ZXFaMUEzb01SZW5ZODJscnRP?=
 =?utf-8?B?c09XYzlxOWRwTzVkQjY1TTVtMzU4dmxIT1ZWUnJaUnI5aWs1MXZvT1ZtYVVG?=
 =?utf-8?B?RnRHVWpHWXZsNkhtblpsQnVqSHJJOHF3SEg5VjdvdU5Gemk4dEFEMm1uUGFi?=
 =?utf-8?B?dG0yTmhzdFZhQUhVeUE1NmhnL29NQzhtQjFnTzUwVjFIQVZqRnNQN0hiTS9m?=
 =?utf-8?Q?uatIDaL0mH1Mjii9HNSQWmXe5EQyt8WR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFRCYVlBWERUN3VzbmJaVnpyMmJDL1FNQXpnOUpXVGY5emFhekxCUGU2Ukp1?=
 =?utf-8?B?NXlmZlhxa3JMMllIRDYwSVRJd1ZDc1NVNkhteXR4S2VST0ZIOU5aOVNKNEtX?=
 =?utf-8?B?QWdvdGlFVDhYMjlOMXVXY01wWHlLTVc0eWJUUkpFQmEzRTZhYkE3RHg3TVZE?=
 =?utf-8?B?amc3LzhEeEg0cEJicXdmVjI3Q2lRUkgydExNTWJ4ZEpSN2ErY1hBajIzb2RS?=
 =?utf-8?B?TC8wcEd6R0VPUHREOWFnZHkwY0c1TXpzWmlLYVZkREJZcGpOMlp0c1A4VXlr?=
 =?utf-8?B?TTlJR2hYN2c0MW8rYVhPUVlkc25Ia1Q2NFNaRDEybzJiRlBsODJpSXd4bmg1?=
 =?utf-8?B?MWM3R24vVVJZWkRseTUyUVB2bW5OQzF2SUluYVMyTHh4UU9YcXRKKzFFVmpK?=
 =?utf-8?B?UnlhSWc5L212K1hhMTVtSkdBOUw4Y1RJUUI1TFdDSGgvNlRodmhRMXVaemg4?=
 =?utf-8?B?L2JLNXZBK2JFa3ppOTRxTGlaVmdQN0ttZy9KY2ZkVUtpRnNRbXM1bXo4VkEz?=
 =?utf-8?B?amtMZmhrOFRUM3FNeHRCMklCcVhJVTVHajNHY2hkUzRnSnNDK3FVNXdSeW0z?=
 =?utf-8?B?QmpVWUt3K1RPcm43dDFNSjdoaUEvV3EvMmhIQU5iYzF0RHBucC9EZzVwMFNE?=
 =?utf-8?B?eHBxZFBCT0w1V21EREZ1eiszcmhJK2JWbCt1dEVtcGRiM2RSZkZXcmJxY0ty?=
 =?utf-8?B?ajBGb25wK1kyMUhCQkxZd1dmOUVITUNqTHQ2K2Y1b2FBZDJjYm5SdkFxRVBx?=
 =?utf-8?B?bWwyYks1U0dsemlhOE15M2FDZGRBMVg4d0RDR3EzcmRnaEd1c3FUM2E0SUdE?=
 =?utf-8?B?UzV0aW9hMDNSSno2NzE3cmFwTVlUbEdBMkFyajNQSVEvUkwvUERMSWtDeUVl?=
 =?utf-8?B?dzZjNW5vR2R3bDVYLzNRdmRhS2w2eTk2OHBOczZmams4Y0JmRkppTmtZQTAy?=
 =?utf-8?B?Qng2MWN2RGRyYmVqNGV6eXk1R2pEcE1ocngwUTNXcjhsOE9oU2FrUHh4bThJ?=
 =?utf-8?B?VmpXWXljVzRCZU5OZTBJakFuMmJiVWJBNEdLaW5VS2ozeUZ2S3IzU3N4alF1?=
 =?utf-8?B?d0pGcjNSc1FiUHM3ejFqZ2hmZGdUaE95UFpnbWdvLzJCNURjZ3VWQjE3dFo5?=
 =?utf-8?B?Y1l2ZGVzTnlwZlhVVVU1ZkQzVE1CdkFFbEZZWFZNWmhvb3RBZm9QYXY3UnlM?=
 =?utf-8?B?a0xFTU4vdkFPODZjM1ZIU0xUYWgrK0NReE10Zmx6ZnlEbW84VzhKcXNrL0Rn?=
 =?utf-8?B?Mkh0cGZqcmVMdllLYUdlRHB6Qy84Q0lVU09ON2JWTWlwTXloWVZOUDF0ekR4?=
 =?utf-8?B?dzMzcVpkRHhYanF6bVk0Q2hBRVhOdUU1MnZPeTdVQWVERmV3RC8yeTdOL0ZQ?=
 =?utf-8?B?WDRHRkdzSllydE1VZmFLK24wanZmdFF6ZlZOWXZvY2dNNnIwLzVMdi9pUVVi?=
 =?utf-8?B?R3Y5c01SNXdmTThUMStJMldEZDJaaUdrSkxsdzNSeXQ3MVQ5L2VOaVhSZVU1?=
 =?utf-8?B?dXcxV1E1Q2hoZ3Z6eEFMdGtVbDc4ZkFRcWg1dG1BelVuNzA0NkhNTHU2dXJE?=
 =?utf-8?B?d3J6cit0UG0ycXh2bFAwSnFHNlRZbVJuUGJZU1RYc1VwYnVxTlBEbjg0K0lL?=
 =?utf-8?B?SXFNR0RqSEEwRkVYRUlvZWc5YkJpUWNLQzFoWk9JWkxTdURxQzZ6NFFPbXl4?=
 =?utf-8?B?R1FsNUxEc1JUTHZhNXkySlpqM3lNeEpKZmVwem9KbVh4bmtXaHVlNm55L0Fq?=
 =?utf-8?B?QWMvQmIrNXFEdWc1c3l3RElTZjh5R2h1TkxoeTFzMXZFckRwUlNCTlVWL1Uw?=
 =?utf-8?B?QVUwaEVDd3Zuek5YTHlGOGFWK1VSYVM1RnFGbmI0THUxcTNiazN1eFhVRVR5?=
 =?utf-8?B?RlRvUWFPb2NSTFVYRUIzMURTS21nT3Q4NTl0THlNZjNtWU82UXdRVTlBZW1K?=
 =?utf-8?B?TlEzRVI3Y29PNnhSRVhyUi9QWEV2TjFSRlBGckp2aXJ4QTFyay83UWRuMkZO?=
 =?utf-8?B?VCtYR1VOTUcwWVhzeDhPb0wyWWlEMk5jY1RSNWROSjRMSzh6MXZwYTlNL2Jp?=
 =?utf-8?B?a1YvRWhHK0VyeUduS3g5MG5pUkw1eXhNQmlMb21ndkNOQTlGNHV4L0plL2xj?=
 =?utf-8?B?ZTBGVVlKMkw5Tis3UzdIbGRDaGJPWkxDNEczT0J6MGdXTnpjckN6dG9RQVhZ?=
 =?utf-8?Q?htgOV5b9JaZeMiUQf3K03i3KtphKXQiLEKKPivbZpS+b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab03683-ca67-44bb-ea45-08de36ceca35
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 02:58:11.8565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrjBrdsuxeYnLGqK01/EFOintmPL3zpZ5ZcGL8pivndRqVvty2Ncm2GplQ4FG88erQ2OQ7PDBZXOHyIgT9WUFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309

This is useful in Nova's GSP message handling, as some messages are
empty and we currently need to explicitly use an empty structure for
them.

If accepted, I would like to merge it through `drm-rust-next` so Nova
code can start using this feature quickly.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v3:
- Use better safety statement. (thanks Gary!)
- Also add `PhantomData`. (thanks Gary!)
- Link to v2: https://patch.msgid.link/20251208-transmute_unit-v2-0-aa17a6848afb@nvidia.com

Changes in v2:
- Make use of new feature in Nova.
- Link to v1: https://patch.msgid.link/20251208-transmute_unit-v1-1-680c7386b5d9@nvidia.com

---
Alexandre Courbot (2):
      rust: transmute: implement FromBytes and AsBytes for inhabited ZSTs
      gpu: nova-core: gsp: use () as message type for GspInitDone message

 drivers/gpu/nova-core/gsp/commands.rs | 6 +++---
 rust/kernel/transmute.rs              | 8 ++++++++
 2 files changed, 11 insertions(+), 3 deletions(-)
---
base-commit: ba65a4e7120a616d9c592750d9147f6dcafedffa
change-id: 20251208-transmute_unit-78ab58ba9e6e

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

