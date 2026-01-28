Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010008.outbound.protection.outlook.com [52.101.193.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C3A286D72;
	Wed, 28 Jan 2026 02:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567882; cv=fail; b=DKXiGcobyXY6hNlz4QcT5XpSNtVX4TflcVQvXEHoa2MljBNNc5N9D0oSMVJP+dHrNAo69xOe6hGAzxuwUEtNlT4dMRP1ttGMwBxGIh35VbX3f4Ln+8hIb1DD1GTPQ2OeJ8faKUkSdrOUjXKOfuB9Cwn5juIH+uw+0QqvKfq74g4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567882; c=relaxed/simple;
	bh=NcOB0KTjmSMVqkxjEDxbyVk3/qDkhNMKwnwLpeYFN3g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=e39fLQEHuaJkYffYVpYgKkEKCX/vloOlJQAdl2i5R2gvjKcA+QtayG3TF58bshxHowafQGORg1WEKXp0PnyxYq/d68J8LGJuY0LLOzqCbig5dPDMA2q5accNLqPD6JsoYpwsZQyKVYMoPz3PkziI8a2wnM5lj45VqRdLihZiS1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rvGN8RGY; arc=fail smtp.client-ip=52.101.193.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rvGN8RGY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rH8+e/xMqjcX3qhi3qQwsMYsxz6SPQD6TlXsjEZ1CNFATazR5KDO0R1PXYDKncKkOeGlTDgKmFgNGi5t0HEk0BXLgL4BxpMGNpcdpQzvS6sKtVlszCrLy9uUWiUtjUmLH2Qpp5/wmLmzi3V4RRvSzuhBfr1XogjH2b0u/GxPSftbQNDIE1SKtmCXPvoUU0ksXsZXF4dqYV84cUbxwKdN6HDsOoQRgtsHwK1FR9bhhfFQCScfeHQO/Gil5GrH0UNms5kK7KzTUO4EblSAlFlShbXsd0ut+Yqxu2WBNRmntNEgolm0Az4phvbqNJm6BE6rcUT1G5JQQlFHkQ51D9tf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jBdQu6GetQOFtmsL631n5vo03qTOEBIJojMceXek6I=;
 b=A6byl/1zJquN4mBIWpRRexo4CM22L16Tybgt7zC+yeKQzE/bqdwHkkxhYJzlPtP6LLYgRZnAAfxLS+OcfKpZprs7zBue8BOq9p02Sn513nhNIakNwEATjSQWUDKVnFpVPDmBvQcJqcAXVYrsmS5xI89L/57yZYtDkLFq1Oe3zlKMMLdecMOuJ9kzkeblLj0IGbeLdqoawDIf0JtFpYEDzTfvkU/sE+vY9yZff5e/M7yckblDuEjdssI0aU5a4FmkbLB6fqNF+ZiOYkLgxAQ9KVVHp1FuhaDii8TqREBH2HvKflzUfJ5VaUbcG1JznDe64xWXFcnWds76LhUHkwz3nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jBdQu6GetQOFtmsL631n5vo03qTOEBIJojMceXek6I=;
 b=rvGN8RGYOiqn+quOslQkl1TgkCmkU08wT+1GCR/MNc7qqi7uQGY+gIe3FMMwll5F89Br9zC1Xxr4eBunknsLIaNqoTrUQl955srBMjxvBSXBfFA31LrMa68FXgY4FttqRdIIv0/NZKSQSw8xDSOkwp7BqJaK1FJOUHyrkD7++tw8tFszWJUVCktFGHnhoeVMVPp3F3WcWlRvoNDl/tx5UBmlbUZfBpFQQVx3QYzYZ/cQ/vNEc86RSNyqpZy6SeC+3i3gT1vUPvuxYaXDffKvPiCw9CKpI80rWAPw5JqKerg7bzMmlficOKFdvWGLxY6ztkaDHuCjQcPo5VI5TyPoIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5654.namprd12.prod.outlook.com (2603:10b6:510:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 02:37:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 02:37:58 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 28 Jan 2026 11:37:32 +0900
Subject: [PATCH v4 6/7] sample: rust: pci: use `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-register-v4-6-aee3a33d9649@nvidia.com>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
In-Reply-To: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
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
X-ClientProxiedBy: TY4PR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:405:379::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: e25a834f-a2a2-43df-6f6b-08de5e163fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUtmdGdrWTBMdzlOaXhrQytkNHdmemNUazJFWWRscjk2Mm5pTnNTdHozSzlC?=
 =?utf-8?B?bHM4RnY1TVRwd3JReUZoZlJDaXhoSTB3eGpaNy9zN21TU1BsZ1MxZDBMRVhG?=
 =?utf-8?B?MUpPMnJJRVFYOWVYZGFkMHlKRGZHekNjSHgwd2V2UW42RmRZQ1BPN09nMnh2?=
 =?utf-8?B?VVZnYitHWnpWQlNOSjRzRC93L1JKcDE0QnNtdnU1Z2NzYURVL2dqbGJWVDF2?=
 =?utf-8?B?V0tNN3p1UVVsMVErRHhQSUQxT0N6NnNjVmFnenVYTjIxSFMwbUg2TjQ1MEI4?=
 =?utf-8?B?SkI0RlFXMWdidXpRRTEyUFE2ZGY0WHFMTDZ1MDZUd3NZTlZ0blRQNURpV1Q1?=
 =?utf-8?B?cGdWZW94aXRhcFhBT0l1RmxkSDJrMm5MTUNVSk1Rd0kwZEFDMU9CYjQ2ek5n?=
 =?utf-8?B?WGxqUXdHRjBZZmpUaHhJR1FCeEtRQTBOSi9keXhKYjRMYzlLM0w4ekJQZUVj?=
 =?utf-8?B?WU5iVEZRaEg4UGhyc2UvOEgxandvWDQxVWV0RWJwNWVSNm5lTGNHMUdhTng1?=
 =?utf-8?B?T0xWSHhhMEt0WDZYSGFsbUErdVBncFYwMjdOUXVDY2VDb2ovL05RajFxb2hN?=
 =?utf-8?B?QTE4MWhueHo3RnBqRXVtMXRpVmpIcmZCNitCdkVoNndkbmlWSk9mMVdKKzJp?=
 =?utf-8?B?czIrY2lOaVpvQ01tYzZqNG9EMGlPYTROWVRJc0JIbDVHQ1daUlRCRTZKUVBp?=
 =?utf-8?B?WUtCQmdwSU81Rkdsd0VNVGM2SHVFb2JuVEdHUzdGWDc5cjBzd2ZYWHlPRzM0?=
 =?utf-8?B?SmxCOXRaVm16TzJIbGpSTVB1bUd4NlpjSGJJa0w2MElTaVpvQ1AyTjJEdDBM?=
 =?utf-8?B?NkFOMnVwOGZsVTkzYWRYR1pKUGVIWXRRSEwvbWowbW5TY3VSY213R1pEU2hK?=
 =?utf-8?B?RzNlQjErTnRLL1haRWt4UGw2WmU0bU81NGpSbjdvaEE0Z0Jhb0pNUHNjYVlx?=
 =?utf-8?B?Q0RoeVg5S2YzUGRZUUs4UCt6eFdlTTZiZWplZlp2L2krT0JuTmwvaUZIOUJ4?=
 =?utf-8?B?cElPNnNoRHEraEJ0aStQOFQyYi9sMlcrbS9SbWpzOVpaN3FObk9PeTc4blha?=
 =?utf-8?B?MHNLYkNIUm9xNjg4ajIwcWsraitvL2NWcWdLaGxqdU5Cd2hhSCtJS1VhOFFG?=
 =?utf-8?B?REczRUEwODFMS1YrTmZCSG9NNU1rUEp2ZFpaVmJ5QTNBVHk3STI3UFdZQmdn?=
 =?utf-8?B?Uk9mNVNZcUFqeW1pRStNWXpSYUhQTTF6Z2RNTHZtdkE4Unc1aHBjY3NtTjg5?=
 =?utf-8?B?WCtSM1VheVFDaEt6RDQzbldBWlhCaExpR0RYS0hhdXFJTllndmRVTW10VVE3?=
 =?utf-8?B?TWk0YmNhZGcxOVZ2cEIzb2tNa3kvQmRSeEh0eGZUbkppWHRkRjRoempHbjN2?=
 =?utf-8?B?VEFVZ1ovVWQvR3lqaXJNYzlFVHFzdnh5amxnUDQ4WElPdjBNTnMrZ3oyWEJG?=
 =?utf-8?B?bXZKK1plQUt4bzhWNXNHMUlNTGRZd2w0aGJLOHhsYVNPbldidFBhbVBFS1Jj?=
 =?utf-8?B?dCtaQ2VtUWVFNTg1VE5HU0k0M1ZqUEQyeDRzQ3hIU3FNOGtGa0NnT3V2UGlF?=
 =?utf-8?B?UnpDS1JpcXQ1a1B1ZVIvTDg1dmFxZ2tJcm1FTGdQRjJ2ZUVDL3RqSTJsdVlB?=
 =?utf-8?B?ZkdvT3JtTldXbUdsNzVrZU81eWpwdy93SzhUR1Jlbng4aENmUVpEZVE0T0dz?=
 =?utf-8?B?U2hXTVVhZTZpTUZMUXlYTE5rQWo5ZStJVll0T1lIbzlsSi9mRHVBOHJXbEdO?=
 =?utf-8?B?dFFJMTZpUkdaOHpRNUY4WGVUUmMvOE9ESmp1Y3YvdGRnN1FGcllKUllmL0pj?=
 =?utf-8?B?dWVqcmN2K2k3YW1XQTZhUXVpeU9sMS9Ra3htTmNzbFlWYjcvUFZxSDhaOGs2?=
 =?utf-8?B?bWlBNXV6T1lUWm9HS01mYnlERktPc3NsZGNHaW45cDV6M08xRFNkOUgxa3pB?=
 =?utf-8?B?WXB3MDdTNGdyNjNhdFREU0lTcWhRZWxhQjZTK3ZEc0J0Smk0NnZXWWFPaUhX?=
 =?utf-8?B?TVpqcXlrK0d1YWloWmZwSnBTOXpDcTFONG5oMlNLNnlGOHRXR1BiYmFXTmZN?=
 =?utf-8?B?MXVBZDI0YWpYVmMybkdxWUpVZS9NZWs1OEsyU283ZUlFeUkycHpqK21QcWRD?=
 =?utf-8?B?SWlaa3J6Y010U0JveE9NcVZteStiSjFmOCs3Y2xEMTdFbk5LOEFjMi80ZXk1?=
 =?utf-8?B?Mnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1pMN1ZPdHEwY1VRVWFHL2g5dUlEMkVHL1dEWUlKTlBwV3FBdEZKQnluRGNO?=
 =?utf-8?B?L2taaVNWTUwwWWZ2TGR1SGlLQVlGcHBHem5TUDNPMVJneUREeGduaEFpV3lT?=
 =?utf-8?B?eTlnbDNudWR1TnNOc3RTTDRZRjFYSmVULzk2M1BiNjREM25pcVhWN090dVB1?=
 =?utf-8?B?aTdoVktoV0xKSDArTlhsN01obDlCNFNMdGlzTlpKanVkNU9FMXhrOEdjcGVF?=
 =?utf-8?B?aU0wb0tRdWRNOTVBUEpaeTJWaVU5YXczb0dXMGJ0SjRhQnhnTk1lUnBiSW5j?=
 =?utf-8?B?MnF5UHhDSitxdDMybFFOTzJSZFErZk9odjdIYWM5cWlITkxmdUhxZjlWS1FR?=
 =?utf-8?B?NmhRUGRnaUhJOUVudnlmdGd3eWFWTDJyTFp3VkNLLzErKzN5MjR6NzhxbDFE?=
 =?utf-8?B?YUdSY0MxdnhuQ2s2SEJYUHdKcTZjSS9nUThrc2JlWVp4dHNQU3NXS1VmSGRD?=
 =?utf-8?B?RjhGck9NMDVVbnpMKzRjZGV5QVk0d2w1QXk3MUZqQWh0M0p2MWlDckFvYlFS?=
 =?utf-8?B?Z0Y5cUwwTUxoWTJJS0p5MnA5YnNtR1NBUmNHOGpGb054UnViT2JWZG5rZDlj?=
 =?utf-8?B?d3VrSGl0MU1RVXFGcDYrb2Rja3V3dU1iak9nVEFqeGd3UmRQbDAwV29HWVBR?=
 =?utf-8?B?dFVTaS9Lb2ZSY0N3RTU2M0tTN2VuMFpaZkJlbXNVTE5IaGJlN1dPenRMNGU0?=
 =?utf-8?B?ZGgrOWZMSGNNQXJ6c0FMZzZ2T3IyRWJXY3ZEY3lSMU5wcFpPbjZ0L003QldP?=
 =?utf-8?B?c2ZrV1hXYzF3cFpyN0k4ZDJiU2ZqUUs0dW5wSjFHUWNZZHE2THlBVmEyOGZC?=
 =?utf-8?B?VG9zQ0ZJT0RQaXUvK0xHQ3IyV2ppVGlTWUs3LzlaTGsvNEE0WlZpdkNBeml5?=
 =?utf-8?B?NzRHVFoyMGQ5dUE1T1ZLcmtEQU9HdDRKMldseTE4TGNjcTVwcWZFdE9HVjZn?=
 =?utf-8?B?SGwweHlTVVg1SGIvcUYvODZCa2hxN2x3YVhibUxkTDU1QmtnektuQTFjZHRC?=
 =?utf-8?B?VGcvM0l2SlQ3ZStRc0tHNUdObmE1SXUxQlBMdjZrWHBJUkVoNTdyMkpGc296?=
 =?utf-8?B?Z1loN1BuWEFZZWhMTWk1WFBUN1dRN0prZ2lqUXVQUjFuVVVqRXpZMlcwa0RS?=
 =?utf-8?B?ajhpMXJUWjdHblFxNUlEcXZNWTF6R1ljN3R6eXk4S0tDWmRickJGRk1DMyt0?=
 =?utf-8?B?UThPS3hjTFdBTlZBQ2ZOTml1cmJpLy9PcnNTTitiZUVIT1hGTTJ4QlE3a1pN?=
 =?utf-8?B?Z1RSQi8reWxFK0dOK0dQYmdSTnZDNENaN08rVUVOb2NSWU9FUVJOSFE3aFZt?=
 =?utf-8?B?cUJWZkswTWJ0emtJSnVMUGZkbmFuVFgyek9xSGlwSHFWcENvenJENUxma2Yv?=
 =?utf-8?B?T0h0cDZ6SS9IQkUydU5ZYnJFSDVLODRDckwvMFlWWHVxY3lCcG16TEdxV1B5?=
 =?utf-8?B?MFI5RmZmOWppSUFOQnJHSmxQcjAwejZzaWluT0RYVTJjMGRZMzF3aGt2N2tO?=
 =?utf-8?B?N1JDRmxWMTJta3E3ZW0yTHpwVm9DT2I5SGQ3UkJSYm9FWGhNMjVRcnVnbDZG?=
 =?utf-8?B?SFdaUWVBbCtZaHh4RlNxc1JGdXNodW14Ni9TSHovNHFzRWJwbG5teElXWll4?=
 =?utf-8?B?UXE5VUxvV25OVUZXUnM3MjhDU1JMU1RaQWlaQUE4R0dlUm9Bd083dFpmN21E?=
 =?utf-8?B?VWlaUHZOa01vRXMwcFpyamlreEpRZFVYUU5nZGV1MFozKzBOUCtBY1JFRUxE?=
 =?utf-8?B?WlFoMU95bjA3cUtLR1IrYnZSUzFia3B1SE9ETm1xaHplMWd5ekcrMHZIUHZ0?=
 =?utf-8?B?eGRQRkVJTlBNRU9PMk1PNFdtNXJnSUp6YnRUd2dJaTlIblArbWVyYkFVeXlk?=
 =?utf-8?B?OTNUakorWHBIeUFBRnBCMzdvMkJnT2ptMC8rdWJOVWdnZDVNWFhoR0lyNkkv?=
 =?utf-8?B?NytSMUxLVThzeFlpdnVMVUZXWUg5Z0hDWjlOaVoyMG1nMUhPK2FpY1VOWFhh?=
 =?utf-8?B?NjE0TGZDWkVvc0YvUncwaGVxM3o0eTBxZTd6OExRMUZuVGhHUkpoRGd1Zi9W?=
 =?utf-8?B?V0F3NUpJRDVhS3NIcnZBVTBHUllWc1VEYzBVNGwyKzdEanJ4WGxXeVJkNlk1?=
 =?utf-8?B?bVkvVDZIMlcrejJyNUMzNzdKQy9WSElCbmFlaG5rT3UrdDFmT28rNlVQcEpD?=
 =?utf-8?B?TlpqR0ZCdUF0MHpGNzZUME5WdUJ5RjFpS1RDUUROUmI1ZzZQYWwrRHBLdXdN?=
 =?utf-8?B?VHFQOEF6MDVkczdoVnNQTFRhRzN2aTlYM21SRWU2RllzamFZZmk4T2ZtUlBI?=
 =?utf-8?B?ZmtwYWE2QndQWHpmV3pSMXY0bm5xcGJLY2lFQS84OWNQSy85cFFrMlVYUGdh?=
 =?utf-8?Q?99JHaSDjnLt/nYYMuXaB/G6TT1G2gNBeJcm5mb4x82rE7?=
X-MS-Exchange-AntiSpam-MessageData-1: 13PIwkYMRX2B4g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25a834f-a2a2-43df-6f6b-08de5e163fc1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 02:37:58.7021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7HwR9fah/uFBdIWog5NpAVQ6r834q4/xChV8KWxCVyXf0yH5TwJwRX5iVIO8zTY/9gxYH0YxHYpicRFhTFIJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5654

Convert the direct IO accesses to properly defined registers.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 samples/rust/rust_driver_pci.rs | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 4dfb8a6a4707..df2232d6b71f 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -70,24 +70,37 @@ fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u32> {
     fn config_space(pdev: &pci::Device<Bound>) {
         let config = pdev.config_space();
 
-        // TODO: use the register!() macro for defining PCI configuration space registers once it
-        // has been move out of nova-core.
+        // Some PCI configuration space registers.
+        ::kernel::register! {
+            VENDOR_ID(u16) @ 0x0 {
+                15:0 vendor_id;
+            }
+
+            REVISION_ID(u8) @ 0x8 {
+                7:0 revision_id;
+            }
+
+            BAR(u32)[6] @ 0x10 {
+                31:0 value;
+            }
+        }
+
         dev_info!(
             pdev.as_ref(),
             "pci-testdev config space read8 rev ID: {:x}\n",
-            config.read8(0x8)
+            REVISION_ID::read(&&config).revision_id()
         );
 
         dev_info!(
             pdev.as_ref(),
             "pci-testdev config space read16 vendor ID: {:x}\n",
-            config.read16(0)
+            VENDOR_ID::read(&&config).vendor_id()
         );
 
         dev_info!(
             pdev.as_ref(),
             "pci-testdev config space read32 BAR 0: {:x}\n",
-            config.read32(0x10)
+            BAR::read(&&config, 0).value()
         );
     }
 }

-- 
2.52.0

