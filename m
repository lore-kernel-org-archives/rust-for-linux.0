Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DD929B8DB;
	Wed, 28 Jan 2026 02:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567874; cv=fail; b=BEscx5kdwyk42PN3jOFxnyKUPqOXXC2A0HXEaW9IKvUHgfEGLxVFpUNyTxaTEuhKdc8J30qg+ujiMZqxiKridj+2gPVSPziFD5IbR8q1Y4nuQ0UUPfttYNaVXES8r36OIgYyGb7EqStZDpbhN0R2Rzr4mvRclny0y8C3DjSNl7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567874; c=relaxed/simple;
	bh=5NOnpB+JkmYoNSdg0KQsq9hm7oPd1cdUicHldYc6Cwk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OwmCWIP6aebhJe7r6mau1+Ql1OLdL2x5w2Mb+lL97tfID0bUonk7xocR7KgSlLnurmmhbMI4fYFgpaIcVuI36FMJttvReGM+4YfYW+g9GuEW2RnsKGsxZxR9L1wX+JUQaiinWa6eKnDiSj/sPBw8+beZVD+QfFRhbcxgEZQQGb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KnjgrX3x; arc=fail smtp.client-ip=40.107.209.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KnjgrX3x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZAw5OIp8od7IAUos7CBuYq2rlEzQcl4UDsUW21v4YPxpBJ7KPfkzKnBWg5njN3oFOcZSAVnxJ9+VzSiDLsSqDtOivD9EUd8YFq79ICQd1vMczWvL65FPdvz4mm9S8T4g/3gq/7gaJMoEZh9X8RuTmeXNkyuxoZFLwloz4TYtORrz41rZ+NjBjCwGPY0KjBostdBsfygXwYHgFMfNpmI8nn3h2uBdReue9RLTHdKNOQS/QMyr/UG/rMiaw3mjNIPyq8SgBF7cyzpUtXMXjOwe4396qIPWEN6P6UiOMKOPKeDQ/7tAWtIrMoUaZ/1r4XGavk0s5MdIN/8d/rBgeiuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91pNgxioMuH+sfUTVSRDOfhFd5wIMV0Ph9XbSJHEEOg=;
 b=fvwuSJ6g51otgVCNClbOvTBC2RjR5MRWuxqrY+uBC4dRn+XUXJ2M6lWjJQI3oxyB9LDyRKoJPJ/T/jeCaf+MH6IDEXGNSj2r1whe19bgdNnESCaiLJzd7zYyquuQYHv/hCMwLvHN5LL4auuE6GVzP8Hf505kNJam/B9xDpibY7i0f8RueYxV6URiLNYyU0qT5FfQdj4lBD2eUxJGdWIOCiyQQlRn3af4CV4FTukUwVUFdGclqw7KysErcn7MVnRB5LEcEydhbyn8FxBcPnkkNDVosZo3+alHieuwAzYSLKqBCHbifJqSsBEWC6t0geZI58vwj/WbxDlH82AomAxJgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91pNgxioMuH+sfUTVSRDOfhFd5wIMV0Ph9XbSJHEEOg=;
 b=KnjgrX3xWyk6NnJ8cbasStg26aaDMkAswagbbML9LiG9BLXMUUsl681JSmylEoaKYxuC522qK3e5GK5VxscrYC2h6+TRBrhcZlXTgAzuu02XkEZ+j0TLKPCfWU6Gh0R3nJ0vI/KGZcKwZFP+HdjhkzKC4LKD7YcaCECH5gQlMzp66pQDpWuVdFq1h91iTMf0bjQ5S1HgsJyFKOBOtpHgCzI+x5yg30JuC2Oqy4bf05u/oO4MA9W92SVVhY/dwiIvlve5P3Es9XALj/f1RlAuVCjOEdjZglC4/vCCiytxvOF+00gOe4BYJvQhVlKDhPGb9Bq1vlw/nn1LYiDCWET0Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5654.namprd12.prod.outlook.com (2603:10b6:510:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 02:37:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 02:37:50 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 28 Jan 2026 11:37:30 +0900
Subject: [PATCH v4 4/7] rust: num: add `into_inner` method to `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-register-v4-4-aee3a33d9649@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c5fb4c-4832-416a-aa67-08de5e163b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGtKKy9lUk1idFNEdFp5eTY2ay81K3kweStTdlBieEtXMWs2Wm9PaUFrdjBM?=
 =?utf-8?B?amVKKzN4UHArMUt0OHJoSUxkUUJ0bVZCU1pOODd3dERtZGJLaVN2YkhZRlcv?=
 =?utf-8?B?akJMSXJMcXFVQjQ3bHdtRVRkeHJ0K2VGOWNkUXZ5WWQ4UUtVcWVwUW5qajlL?=
 =?utf-8?B?ZGFKSW1ZbU1SeWhXZlpickNpTEY5Rm5Pa3BmSlhaWGd1SGhaZm5mME5yMjZ1?=
 =?utf-8?B?VWRUVXFkemJvTjVEN3gvRzNSZkhMVE52RGZnMGNoVzhpVjVIZ0Y1MEpJY3JY?=
 =?utf-8?B?VTRZVGtBcHlQN0ExcGRZV2Z5QkNKcFFsQ0c5YVBtWjBvQVcyMkVDaWtjazFE?=
 =?utf-8?B?a0NSSm5SZDI1Q2FPa0RvWjVDSENhVmoyalZGdFpzMU8vR0pVMnZUR0ZXRUxK?=
 =?utf-8?B?TWRyV3NQbzlRcmhNTytyQlp4VU40K0Npc2pVVTRDTWRMamJFekEyOTNTYmM0?=
 =?utf-8?B?T3l2UGdTeXkrRW1nTWhXaGVnWHZFN2piQlN2czlNcGNESnF4VkZ5OHg3MTB4?=
 =?utf-8?B?VWNPYUNkWWhTU0RaUThONDQ2VlNSUmtOV0pNQ1AvampoTU5TRkRPRHpLTzFZ?=
 =?utf-8?B?RkhjN2d3YzBlRS9vL2c4MTc5VWErRVhHcDBaeGcvd0J5dWRQbjAzay9ZV2xD?=
 =?utf-8?B?OEMyaXozcXVkbDNxUGR4L1ZvZTRBZldna2tUdXphWFUvdlgwMDBPUmVXdTFo?=
 =?utf-8?B?QjRyUGxsUDlsUnc2N05qU3JwbzIwQm1xdGRzMkl2akVmVEhwMkJLK1o5bTVL?=
 =?utf-8?B?dzl0cWZZUzNQcHUrcE9RbnQ1TzJxaWxpS1pVTHNnNUdUbU13OWt0STdsSzUr?=
 =?utf-8?B?dzNZL00vRk5wajNTUkFmbmU4aXY4c0lTeitIaHhkNGUwcEdpL1VxTmRhY2Rt?=
 =?utf-8?B?cmtMYndISXBYRjJmMzRtc2Q3U2pZT0pZM1YzUDR2T0JrMG95bzFuWkJCS2lY?=
 =?utf-8?B?UG5uODdLNi94aHlhaWlaeUZ3Mk02U1ZTeHJQWk9XTDZMWUlwTm1Rc0xZbjE2?=
 =?utf-8?B?U3c1OVd6YzdVVUJ1c3Z1QUw0dFpIaXlpL214WGYrZlVKVDIyVFZma2VTL2FK?=
 =?utf-8?B?UmFRWXZBT0N0ZnhIQmhqSm94MEJDd0R1Mm9ycWQ5SXVXUUtnOWdnRFJ6eDdx?=
 =?utf-8?B?QXUxZ2xXcmh4bFFEV1YrMnltMFFFWkc1WkVNNVlqaEk3a09tS0Y3OWJqaXg5?=
 =?utf-8?B?ZE9LQ05najJFUEZVc1M3ZnZOTWgyMnRMK2RDaTI5N0trdks5ckJ6S1hjVDhE?=
 =?utf-8?B?T2lWNTV3WDZCczZBMU9qWGk4VG94N0F4Vm5NMDFRWXVxNEZpbnFKUVYyNXJW?=
 =?utf-8?B?aDFobU1xQnBFdDhmTkxxZFZJVEdVdG10dHFmT0M5NWlkK1RTZjljWUVTM21Q?=
 =?utf-8?B?aVZoZXpscmxlQnFVU1YxWkJnM3dVeHUvSStHQStyV0xEWjlQNktmeDcwMmlN?=
 =?utf-8?B?a2svdHpCbHBTM2ZmdWY1RjEvRnA3bEl3c3JZa2QzUFlkMmtYd2hRd1hXRnhq?=
 =?utf-8?B?ckpVVkFiSmJJaG90RGM0dC91dTF0R0VqZGlYSmpjMEVpdU8wcmtxMUlvRTdQ?=
 =?utf-8?B?ckJJM2crWU5QdlArc01qS3R6TEk5SGtSWTNZY1RnOVNNSzh5ZndwbjJYZjgw?=
 =?utf-8?B?Qy9lRUozTU04RkdKdWk4QXhwajBoS3BpZUNKbzZ1U0Fkak53dE1aVTNRNzNS?=
 =?utf-8?B?UUFkTzdKa3dtSVUwaHRVL3gwZmpwNVp5RytNd3A4SDBtQklCeXBpcHJ5Q2hw?=
 =?utf-8?B?b0lXWEZtZDk1QWV0Z0JpVk5MWVJnUk5MSWFKaWhvM3ZINWFiRm9PZzE2R1ZF?=
 =?utf-8?B?TnNqK0JGb0tSZGxqZWI5QnJ4K1Z5S0V5YVRIMVQxK1JhcDVwZkh3OXV6cDRa?=
 =?utf-8?B?R0Q0R3F5eVlxVGg1SlZuL3JKQlpGK25uR1dtZVZOYWpyRm1FRGx4L0U3Uito?=
 =?utf-8?B?NzArQmdhYk45Yk1YSWF1OTNON0FvWXc0a2szQnhLM09vbnd5dC9ibGlBM2VZ?=
 =?utf-8?B?KzlZNzJnRVQySEpINEdyRUxEa0QyZlhmTnVwbkxUUkRNNHVVSXlCSmI3Nk1m?=
 =?utf-8?B?WWJ6aW8xVVQwTjZZeUxyajE3dG44Q1JGSDhMMnE1U3FWV296MmJ2RHRvVDhj?=
 =?utf-8?B?UkVkOVIxZWJTZ0dJRmNnbUFwTE4zdHgrOHk0UEJoaUF5RG5lck5oQW4yU01u?=
 =?utf-8?B?b3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3hOaXpJU2JNMFhzMkhPOCtkbWwvUFNOcWdoTks1alFWTldETlFzRy9FUGRN?=
 =?utf-8?B?TEZ1bzRsOTVHdFhIa1lPUHgyaGdCeG5nWVoyRGM1c2lsM1Q1K0hPZkg4ZGk4?=
 =?utf-8?B?SHdnSDB2WGhFZFVLZXd2YngyUGxqWS9idUxqakM3RDE4RjNGV2hKbWVscXVh?=
 =?utf-8?B?elNWZnVQc2I3VzVvSm1DUWdqZlVEZEVUb1UzcjZ1Q252aXdtNEpmdUVOb05x?=
 =?utf-8?B?djJyNHp3TlVRWHB6N0JRZ0ZUc3ZubDRjMGRYc2xJWVE2eTU2aHQxMWFDSy90?=
 =?utf-8?B?cUMyb1EzZTFERVZPWitOWDdPMGxtZGdhM1FmdUNCNXpXSDJzVEhtMUVEczE4?=
 =?utf-8?B?RzZ5YlF5ejViVWFKRlEvQUN1WHlQSDZqYjl0UDZIUkVWeC81VysyeWIrNUVq?=
 =?utf-8?B?bTJFOHpTT2ZWaUpOUFZneFhNc2ZLK0dvK0t2WHNYelFJbXJpZk4yRjgwOHpP?=
 =?utf-8?B?NHppY1B4T3E3WEYrNEZMLzZRV256aU44SWM5ZXdsNzlmNThIQ2lLY3A3VEJz?=
 =?utf-8?B?T0o4RFlwMGo5aFZZOVBqRmlnUTByWlNUaUhJS21SRTJ2NlpNMHlycUx5aita?=
 =?utf-8?B?Z0QxZmZMUUVUYktDMGZOeHVxNGQxWHVYbjNQSXg5Sk5PcmpnUExKUFJHUldx?=
 =?utf-8?B?dG03MTBvUU0xVUtGeEFzZWNBN242eDc0ZU5sWWxxN0tCRjZmOE44eHUrbi9k?=
 =?utf-8?B?cCtwem4zTGRQeWp2RHNMM1RrVjBGWjl5YUVKcFBkUzFNNDdTZXpSeVZ2aEpZ?=
 =?utf-8?B?MnpxVkNWenFjekw4dzlVcTZIQ3N0bXBxaC8wa2J4RklaOG00Mzl1T3VxRkZN?=
 =?utf-8?B?cUJYQ0RHUWNnOW5sSnhQdHc0aitjTGMzRXdYcHNFN0dZdmR0Z0dwY1IzL0hP?=
 =?utf-8?B?SWZSeTJrcXpsREZlUms5WHJMTlVUemJyamxjR1dvRThaM0lZcVV2QWthU1Ew?=
 =?utf-8?B?eUpDb0dYQ3RPOGljalNSOVBRVnI0ZVFDa1hpYjZwZFRNYngzQnNVOVg5N3VE?=
 =?utf-8?B?dndjcHl5dGQvZm41RTZWaVRNQUY0UzJSQm82VmRmbWtoV01XbWR5Zk1sOFd2?=
 =?utf-8?B?dzVhVEMvZWxjejNVVmVOaTVFSnczaTBrN2lJenkxczJwajFEVk9jVnFrUlNN?=
 =?utf-8?B?TzB0K0NwN2ttUTJDaVMwaFl6K3k1d1N0c1kxRzFFdkRuR2czZm1wQ3BEVkN0?=
 =?utf-8?B?bTl0MjlmZ1A2UlMwUEtQdWsxL0VPQ1l6dzg5akR2azl3MjYvVDZjU1IvRWsw?=
 =?utf-8?B?aE5hVjc1Yms2N2xMbDQ3bDgwU0Q1Qk5GMHU2VjZDa3pZV2VlcWJRUWJlREpI?=
 =?utf-8?B?MjR6YndSNFlKcVlrbTZKck5nQlFEM0VwQVpMaHdrNk1WdnBXa2xMVXFIcGtt?=
 =?utf-8?B?bTQzUklCUXFEU1ZBRTlKQk5OM0hwekhIRXViNEJnYUpIdE9NdlpXME5sTXRz?=
 =?utf-8?B?N2VpcllIUXMvbTB4emVkN1Y2MXFOdy9GY3RxMHpCaXpGRzM2MlNML0ZHK3Fs?=
 =?utf-8?B?TGVLQ3hHTXp1aGVWQ1IzQitHZ2ljMzJqMmpvT2F0cmlNNGZrUytBSG4xQUJx?=
 =?utf-8?B?SXJuQjdYYURSbnVXRlFUNU8wT3RycjNNY0svV2Fjb1VPbmo4SklySFp0QmdD?=
 =?utf-8?B?U2hsK1Vremsza3ZjS0ZROEhkQmJYeDhldjlDd0Y4V0VrV05DUklMNCs0dnkx?=
 =?utf-8?B?dlprSnNtbm56U29NamxDdHYvbExzR2ZGMDV1S1hicGVMY05WSGFFR2VWZUQ5?=
 =?utf-8?B?R1BneWlnRElEcEdWQU9aU3hvcWVnUDAybG9xL3Btb3pwMGhzUEFRODNpR0ZL?=
 =?utf-8?B?b25WRHBLQTgzNjhLZlVZZjNEbC9MVytRVGtxUlRpNXlSMWpYWS85MlhKZEE0?=
 =?utf-8?B?WGxDd3VBM002c005bWJMWnNxNTRGMWFoVVE1bktBeS9uQlBxcTl0aHRyOUEv?=
 =?utf-8?B?MU1RUm9OeW9TZ1RxNGRmeVJUSFB2Wm1Dd0haNTdCQWJiZkpUaWNwRmF6bkwx?=
 =?utf-8?B?RjdvQnY4L0dpb25DRldBdDFyUlptcDNMaHQ4YXJHaWExbG1UVHlMaTlQalZm?=
 =?utf-8?B?LzNjMEdwR2lVeU5FK28zVSs4QlBFeHFMSldNdjVubDB5SnpjZHNteFpWS3Jy?=
 =?utf-8?B?YVdhbFQzYU53UU56NjRHdU5DMlB3Wld5bEJRakl3V0VsLzNEc1ZmcGVTY2I0?=
 =?utf-8?B?Uk5GdjJRZGoxek1QVzZtMXZNWEJCV004WXdFTXV3VlJiNFQ3RzlLNUpocFR4?=
 =?utf-8?B?T0NyeWdDbk5DN2hxZFdLbHpaYTkxWGRoV0ExYUUvYUIrTTEzY2orWENlSW5a?=
 =?utf-8?B?ODQwMU5LWFFtcFIvVHp4eUNMK0gvTG01T2pURmtqMjQxbmdLSyt5ZzhvNXlm?=
 =?utf-8?Q?jHQjnJCcYdpXyMNl1OSxH0IvMYwYuF7PFOzuJtD6H6Tcs?=
X-MS-Exchange-AntiSpam-MessageData-1: LxC6nJ82lVLvWQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c5fb4c-4832-416a-aa67-08de5e163b06
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 02:37:50.7395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lv3OtAY7B/XSXM0pboE4Ej7Z3DResHCqv7BqLRSQsmNkW1ceZWgVyfO33dQStkx/kDGV2aWiYZqm1MBcOZ39+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5654

This is useful to access the inner value in const contexts.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index b41ca6df1525..850827033f67 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -388,6 +388,22 @@ pub fn get(self) -> T {
         *self.deref()
     }
 
+    /// Returns the wrapped value as the backing type.
+    ///
+    /// This is a const-friendly variant of [`Self::get`] that can be used in const contexts.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// const V: u32 = Bounded::<u32, 4>::new::<7>().into_inner();
+    /// assert_eq!(V, 7u32);
+    /// ```
+    pub const fn into_inner(self) -> T {
+        self.0
+    }
+
     /// Increases the number of bits usable for `self`.
     ///
     /// This operation cannot fail.

-- 
2.52.0

