Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013042.outbound.protection.outlook.com [40.107.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E343A0B13;
	Tue, 24 Feb 2026 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942944; cv=fail; b=edxI3g5+L2k16gQI3Q3JcSf8TLBXZF3t/6fHQ0wZq/682ZAnKnazvqyXg75V2ZuILEHkuT71bBwexvq9j3JQA5FTMAknSEGUKwSCGyeNj3AsA6EJg0tUH5KoumlPmiZVZ7SOZcFz+8nX5XTD+EFk2uW4jro33gQOwqyYbCdmtIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942944; c=relaxed/simple;
	bh=g6pxC7YDKxn8dWDn1GgkniFa+rnZSH2UAw9aQPrd5WE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hN4L4MD/zqgUngZmQE5rd2AVxjaWD3YcxqTPvwGn2frCp4VnI9w84v/tYcmt6ps5QOv+UYtCRL4fSyCyCf4mnoSvKPwY2jfLnLSdYtG8sUv1V3rMqw8YVyXV1lQmNsK6A5kxOSsean1vZ8yCljit5/5fKfezF79C9DzNpMKpn2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X1URbqTv; arc=fail smtp.client-ip=40.107.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X1URbqTv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRHIPjIrXEl97JiytwrngIyL+20bCmboPEZpkvSrhsYHifsCeqopMeeRbcypOK2N3QshZxqzjDCSsSI+LhypjgT4Z8Bl2SuL8k94gVZP/Zi8F+FZRR7kwi3a2HOsA65lJkVUITn3PDEKLxYl+68TyCYlTHPJmWt8AJFDQR3A+Xs2QDUsYzleI272TP5/VNUabTg4h8RgmUPBJ6bL3F1wcrDHkOoFTHwfZLvMiGgwuO1rfsdxmjVbf1f7DURUrbC+AwQg0ZY/mL3AycXfe7A9vpvcvnp40utGIPbEUp3O6GVvTZ8SWUh6WkcVTYUZrh2F83kIxtFLnPoQDWFpXRUrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dnFWA9MUzwJOAGqB5UIX9vY/f4AMIt2w8I5b+B/Cx4=;
 b=lVdZsYZfWh4gZGWS8yuw+vTlR/ElR4KT9Y6gBBtMbOMHAKqIase8aH0shIZOJMdzRgV9Bdy5kwZiui0MmbcXA1j0+3dTdswpMUcilKdo2+ma+olRPsW4439OG/2dKEyjeyI865hiv5cC2rEViBqtuPb3fRInksDOBrOGnBugeQtFhLBb5CZq8rK13Q/p5umWnJOYKHzcHFKrBGPecK8XwF9/mCMeazRJIB0Ek01RJGzPFbN8q7J+kOCQ0/ZkY3hGik0+hTZtgODY7m4qewFAjc+3yii2RL425CUZnE/tcaMQ0+5ACVEGGfoTKFjLVO+KaerN4taya+twb6BZclykDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dnFWA9MUzwJOAGqB5UIX9vY/f4AMIt2w8I5b+B/Cx4=;
 b=X1URbqTvq6xRI7qe5dZ05dniMHLFIvMa1St36Bq3Cu1GsLYV8RfXPdwOImnxKStsgtvxTA967SZe2IglPBoEke1/5CxlQcX+6zUuNdh+2Nn6nHhWIW5HObzoeKmZdJ8secBwkT86iwyFHt5wZC1uD3XSQz7DlPBs7AztM+OpNaNqWMWgbgrjS7esNLoB6P5b66XpIFc+usy1txY8Q0W1Yad89JwtcogxUJe7D5t7rbyLBTSvhVEj6uenEoAqZiwvq0WMfrL1SvMyJOjT8Iu6FMwDANV4DeAcrOWVD+hZ4OQGJ2ieZtMoxEdNv+pzAMCpopvwNq8bc13z2hCctejIfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7811.namprd12.prod.outlook.com (2603:10b6:806:34f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:22:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:22:19 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 24 Feb 2026 23:21:41 +0900
Subject: [PATCH v7 03/10] rust: num: add `into_bool` method to `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-register-v7-3-aad44f760f33@nvidia.com>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
In-Reply-To: <20260224-register-v7-0-aad44f760f33@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: a64a5e52-01e4-4ad4-a33e-08de73b01e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTdGT3FTUUI4aFgyVEg2R3Jobmtad0lZSERsNkI3WnFSeHBpRWRNRnJFcE8x?=
 =?utf-8?B?Q2RiaHVCMXlXWDZqUHpWTjFqdXZ1WHRRVjhZcDhrMC83Tmdha0R0VldjZ2lS?=
 =?utf-8?B?RDlmVDFXWmJGVnlUcDcrZ3M1VGw5M1A2UmJoNGRWYTBTais5RHhHOExTZWxm?=
 =?utf-8?B?OCtHajlkMlo3Q3VMQjhCZWNCQng1VUZjd0U2dGwzSmVlYThqMVRsdVM4NUxV?=
 =?utf-8?B?VnRHOTRhV3E5WlNWaEJqUWgyOXd5V0tTZDZ4UlFzRjZGdTNXc0pGcmwxNzZB?=
 =?utf-8?B?K1JQUGhvL25GS2UzQkdTNDNLallFczNJeUZpTVRIb2g4M2w2SUxLcGhOSUN1?=
 =?utf-8?B?bVBhZklmNjIzOU5jZExvUXN2U2dTVXp3T3ZWQi92UnBLNTVGZVFXbzhsY3FL?=
 =?utf-8?B?cWdnRThodmZtZ0t5SE5YKzRiNHZjVGJQblRxVURrNTQrNkFNWlJnOXBsLy9Q?=
 =?utf-8?B?LzJ3SlF6SEt1MjJKR3Jqdnk5M3hSdWxHTzcreDA1THVkVnVVdUxINFNZOTE4?=
 =?utf-8?B?MVRiODlnWTRvRVpET3dLN3pFUlNSMUxHdnVIWmVYN1ZOekJ3bjFxSzVvYTl2?=
 =?utf-8?B?VDh5aUJnOEZPSHJCNDllM0VwRm1QSnV4OVp0NU9MYll4dzJxYTdOOU0zOEVJ?=
 =?utf-8?B?cGhXbVVWTDVVV2lxQXlzRzluU1pTb3FaVlJwUHk3QmJwTXM5WmdUeXk1UVFu?=
 =?utf-8?B?L3hDL3JxNERDV0Y1MzJKUVUxOVN1WGlXTmJtK2FKTUtiL0JCUFZSVnhTaTVT?=
 =?utf-8?B?ZXBOeHFCdm9YcjFESDZUdDA5bGlNQ2J3djd4SW01V2w3dFQ2Tklqd3R4Zk53?=
 =?utf-8?B?VDJoNVNZODVjWWRlMlJUMXJJMzJwVTBLYkp1Q1ZpTzJaaTIybnJmZTl4Ymo0?=
 =?utf-8?B?RzVoWnJVaW5pOEV6SW85SFNjWWxoMkVzVkNrcGE1Z1BqMDRCb2o0bER0dk52?=
 =?utf-8?B?VFpuWW5wM0FlM2xGQ2F3cVhLeWt6Z0dBOXlrVFZwaFRoZisxSlpocDk5Vk9R?=
 =?utf-8?B?UU9IV1h3U1RWc25zTnI1OUlQTGhFOHVOT21RTzRkMnZQRHhqVWhBYzMydmJG?=
 =?utf-8?B?cHlVTkpOQm54aEFYSTZrY1VMVW5PTE5tazIrSFJXY09Days5aXdaZ3pzQXYy?=
 =?utf-8?B?K0RpWTl1VmxmSWxYMmdxbEVtSFd6TWFBanYzY1BlR3BranZSTFZ5MU9JcGZX?=
 =?utf-8?B?dW45ZUNIdklGN05INGk4cE9rVTIrN2czUi90K0MrS0RnTk4vRWU0REF5dmNV?=
 =?utf-8?B?MlpXQjFtc2pDYnNKc1Rac3E2bzgwOFpsMldqOHRGNWZpVm1nRm1ZQ3ZKRmps?=
 =?utf-8?B?bTRuN2M0WTZTbzc0NmEyai9qZkEvQUloUTNiS0ttSVFraWxRaDZYbnVwcmxM?=
 =?utf-8?B?MjZNYUpIb1UwY3ozNzlNWCs4UVhaNEFRd004eG5ZaXdiODlUWVNtMEIwbDlQ?=
 =?utf-8?B?RllGL2E4SlE4M2hLOFFPb0U1SVVGZnRXL21GWjV2d0VlMVdqYXRkTzVZQXBI?=
 =?utf-8?B?MjF2dWlsTGZoa1c5ZVBhV3JHMjltRmVEOXQ4NEpJcm5odTVYdVFrOTdRc0s3?=
 =?utf-8?B?UjNudDBUQ0c4Q3hIYW85WTVOazU0K1kzenFBWHZ6bmVpK3dKUDYwa1BEZ3FT?=
 =?utf-8?B?YWx3R1NLMll2ZUQ5STloajNJS1lrWFMwVDlVYTlJcHVGL1J4TFFkZ3B5QzB6?=
 =?utf-8?B?TktUK0FCUWxuTU83UXlSQjdIQ0pzNGEvSkc2QjZqc0RoODFmM2IvUmY0Ymo5?=
 =?utf-8?B?dWlZZTN0Uno4V0xrYVFQRE1tSmVBY3VwY01FRXVqT21DSWx5T0dCSVNaQXds?=
 =?utf-8?B?YjBZT1YyVWRHT080NmRzSmdjT2RvQmUrNUNPTUM5eitLeEh2bG0vVktvcWhW?=
 =?utf-8?B?ZkM2bWxIMXZqLzA4NzlWWWl1TUN6TnNZWHNpRVdud1U4TGRPbXNvSFpTQlVh?=
 =?utf-8?B?ekFJRWF4UmdKQ1RDQ3JTUFoyVkdtTlo1eURNQkpXazh5Z2ZIZDhhdzBVejR0?=
 =?utf-8?B?M1kxMysxc2VXQ0p2bVR6K25GQ3ErTUpJNUcyOGhXOVp2Zkt1cE84R2xhM1VI?=
 =?utf-8?B?VEE0bW1KWGxHQ29vdnY0WkI2UWEwUFh2cytLZG1NUXN4MnMrRTIwQ0E0bXRO?=
 =?utf-8?B?YWRnMFBsSmxQZjFzTjdkVk9TNldmSWJLa3pubXB1cEN0cDQ3UDBtY0U4TVRD?=
 =?utf-8?B?VXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d05mQW92Y092ZVpPMTROaXFMU3BXMGJUZzBEbkxGMWVXTnFodEQ2VkpWL0hU?=
 =?utf-8?B?RSs5MUN6aFNRVXdvUGdQbEV3dmw1blA2KzREQ1MvV0lXaUdkSjZKeXhRSjV3?=
 =?utf-8?B?YzV3MWdmTGI4Q05hbmlKYXJ6SW1jOVdOUVBhZFB1bzE1aVhzN2xMUHVVcjhW?=
 =?utf-8?B?UHZOYzZwWm1aVUV3TFNPU0JMbVZVOW80eHErRFI2TnJoMHVmODhOL2hkUXA3?=
 =?utf-8?B?a1BxeldXcDl6QjhZNytjNmJhNjFCcDVTVmF0T1Q2WmpmN1hyZlNtc0czWXRH?=
 =?utf-8?B?Q0ZlcFlyUkZuUjFlOFhhNFRMeGdmN2tVZ0M4dGhOaEpvdHp3R3Q1M1dCWFpw?=
 =?utf-8?B?anErcjF1c09LM3FhbnA4OXAyc1IyU0lUZitCQi9LZ2RNVS9mVDJzbEpFQ0Jq?=
 =?utf-8?B?Ym90UWpGZE5oY1VkWXlLZTFtNlk4K2VRSnpzU2ZrZGVEeUcrTjVLU2ZBWm5Q?=
 =?utf-8?B?NG4yNVNOR0IwcEtabUt5SEFTZkdvRWtJWmt3aHNUQkNDdHhmTmpvdmJwV3N3?=
 =?utf-8?B?UjJJb1lkNFJEaHFFcHkrR1pMclZocmRSUFJtOExQYnZmQTMvQ1ZPMUlnemNy?=
 =?utf-8?B?T0JYdURZeEFWTEZ0S2JTZXAxOUpGSVlQOU84RWh5UWpWcjd1MUpWRzN1VlVI?=
 =?utf-8?B?bTJTYmVaVTBBbG9lbkhtdkE3V0RuVFBjUG81TStVS3YzUGZNQXl6Y2U2Nnox?=
 =?utf-8?B?aERVQ0w2MVZ0dlh3UWpGY2w5MUpkQkNiQTZ5ZEdJb0pWenlNMTdUWklqTnFj?=
 =?utf-8?B?a2k5TzZXUy9OaWFMZXdhTlVxaHdEMnowdWhqbTRnMkQzbzI3K291NXVkSjhz?=
 =?utf-8?B?cS8rbXliUFdEbTRwSmhqMUxHTUozOTBKWkgwMWZOQjJpVkUxdDZkaDZMdkUr?=
 =?utf-8?B?YWtYM3RmeERxL3A3NzRWWHg4U01TK0NlTSs4NGZZZ2ZJM1A4RG94NS8yL0sz?=
 =?utf-8?B?RlhONmgxRktzbjFzaHhNOUZDMmdYRVlZV3Y5bDEzNE1jRjgzajZGY0FsSTFi?=
 =?utf-8?B?WnJ2NVlRSnR1SFc0SnhYc1NIbzRjWjZIVXQybFVEeVA1djVOd1YvdmpjSDY5?=
 =?utf-8?B?TlNWVTJWUnlyTTErRW1rcys0TCs2cU54Tmx0UUdYSzNEcGt5TDlHTlQ1N1dr?=
 =?utf-8?B?bnpabmFrMnZXVVppdW9nMHpZUUNhbTBjSUFHQ0tyd3R4ZURNTFhFUjhHNnlN?=
 =?utf-8?B?Y2xXZkNURU9wYXMyT0F1SkcwUG85U292QTdmWDlzZXpPWmpqdS92eU5UWXl3?=
 =?utf-8?B?WktPRmFLL1EvMjhIY2Frd1ZRamJyQ1NVdXVtdFpTaU1OSW9uTC9odlpleDRR?=
 =?utf-8?B?QXF0REpvakVTSGQ5QjEzNDloSnJwNXVRK3lWQS9aM0tMYVkxQlRjL2tSanNR?=
 =?utf-8?B?bFNDaEJlOW9XUGdnYXJkTHJuZG5hY1Y3L1RlY1hSeTRyK1BpajZhT0pQaHFV?=
 =?utf-8?B?Z1NUeGFHQUVLbHZUZ3FTRmNvbzlncVhiMXVGb3dCQ3lqZGtZMVZmRkpPTHNq?=
 =?utf-8?B?RXlEdnBmN1pGRU14Q2lMcnBwZnEwY3l5Kzlmd09ZT2dURWZ2SVZhRHNZRHRh?=
 =?utf-8?B?bHhDTkE3UHEwdXVMWUt4M1BFVFRCcnEyK2ZrU0d4RXhpaHpOcUVuZ0lFejVj?=
 =?utf-8?B?SDNTbkZlTUtkOHdGaG50eVJ0Z3phSWg3d3VFbi9MT25aL1F0TndMa1ZJUEhN?=
 =?utf-8?B?b2NHcENTR0p4OGhWYUFZU1JLYUFrSTNHbHptQnpESTkzOFdvbWh3bHNFUCsv?=
 =?utf-8?B?b3dGQlliOXU0cTB2ZUNDZUEyYlBVQXpWODY4Y29nS3JyTHVmR2xKRGpxTzhS?=
 =?utf-8?B?UkxiTDJGb2FranIvZjNvRUp4Y1JLbXR2MGtRamhndURoUHVHVEc2aTRyeXNB?=
 =?utf-8?B?Yk8vbXAxclNaMXZ5WUxWYkVtdEgwV1lnM3lGcUpmOGprYjZ0WDRKaU5ET2xx?=
 =?utf-8?B?bzV6Tkw1QkhhMXRlR1BKUlBLZ2tNSWpneDUzTUVBRStoZmNFNDU4L0FrYWk4?=
 =?utf-8?B?Y2FuMGV0aldORnRVNXljdHNiQ0RycGxxMTVmNGhWSmtrWkdXQVd0VThzbG8w?=
 =?utf-8?B?YlZxbGdKb2lzWjBra0h2d2FNZTJvOXd6QjRKeG5JSkFoNHlZRFhFT3NuOGRz?=
 =?utf-8?B?SUhVeDBKWkorckNXR2Q3Uk1iTXZqelczOTVDcXAxbXJKTVoxUkFMSlhFaEN1?=
 =?utf-8?B?ZUJjOEllZ2J3S3dMWGVURHF4Rlo1OGdzWFVBTEkyWW1YeHVVeU5PUGlCc0Z4?=
 =?utf-8?B?VXF1N2h0Q0VBcmVQdVR2UFlCK1RYQ0tPYTVTZ0xkRHQxZzhIbi9NOU9ncTJE?=
 =?utf-8?B?SHBiYUw1MHdIOFBQalJFWmRlZ1lHNGdqNFd0WkRtTU5OcVpEYXdHTDhLTHFR?=
 =?utf-8?Q?EVONAwqGTzBl4dKcphSvaYOEXg9CdZ/tf/SzNGBWu0OVL?=
X-MS-Exchange-AntiSpam-MessageData-1: 3pCvTKj+G/JoqA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a64a5e52-01e4-4ad4-a33e-08de73b01e15
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:22:19.1095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svndvme5Hbu9a6Jv81CDkwplpEy3YzW7cytv2mXjNJgcfK1SiCvXTX+/VKaOx+I+gKne3GH1rXVofVFwp9Uxsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7811

Single-bit numbers are typically treated as booleans. There is an
`Into<bool>` implementation for those, but invoking it from contexts
that lack type expectations is not always convenient.

Add an `into_bool` method as a simpler shortcut.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 2f5f13ecd3d6..d28d118abd8e 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -1101,3 +1101,24 @@ fn from(value: bool) -> Self {
         unsafe { Self::__new(T::from(value)) }
     }
 }
+
+impl<T> Bounded<T, 1>
+where
+    T: Integer + Zeroable,
+{
+    /// Converts this [`Bounded`] into a [`bool`].
+    ///
+    /// This is a shorter way of writing `bool::from(self)`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// assert_eq!(Bounded::<u8, 1>::new::<0>().into_bool(), false);
+    /// assert_eq!(Bounded::<u8, 1>::new::<1>().into_bool(), true);
+    /// ```
+    pub fn into_bool(self) -> bool {
+        self.into()
+    }
+}

-- 
2.53.0

