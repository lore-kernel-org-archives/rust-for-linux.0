Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022073.outbound.protection.outlook.com [52.101.96.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9796320CB6;
	Fri,  9 Jan 2026 12:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767960728; cv=fail; b=Q0qwzVd2KYY9yHeGQCUbI/J91oRoaVF7YyuewLdQ9n/N/cEsnPdntc2R6Q57ciB+K2ooKHghTQ73yFSyC8aqzspUBwaebXT47sgdROluHkI0BU9UjQAol1HTyl29/86tKfsPE4aWv3dKdc4WVAJ94YZSHe8rKT10sDYwgtys1Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767960728; c=relaxed/simple;
	bh=Pm2zbD+op8nWt3kV04Jw0lUZxzk4yoiiDlFmes+ph0M=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=H+kP4OjgQJM9Q6/F4B3M/F40HTp9B1kBIsDOqvc2KPsI5wETcTtiOfzXu8xjk0xbAXOyYRRcwyInGtz9cnTueqksoavXeMsfVhNSagAOG4wdp77lMiN5gLrydaOnvd+34+niipPxB1Rbv6xiYd1mTbbN5cIuIU7jEy84+RJkeK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YQJm12C+; arc=fail smtp.client-ip=52.101.96.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YQJm12C+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8kS6MD4fB9In1TeAWpPIb5+BN7UcLOHP9Qjfy22eDy7plTwd9w+85nyHQifLKADuYfRM/SXtvfFb0aampvbq59KvJRbwobWT9c9FiJ6kOt0wdoHQPJeYnuFWzCOhPaG9adb5knfKqCNPoCpD6ybnCAUXErMMdJDcd+NfP1X5Q6RCpZgmX82d6vnm9QdpTnlchKhNc5ZcvZ6pqd/u1PrBWiTCfcG2UiXGOFBL8EQDBwwoWBKkkd1sTwE7tAGtLdMWBByWA6N19aTQOuIWiyBi0R37JMzIRGqJaek3rSg6yYFDQMZwBdAT6azh7+WyxdCa49Mfjj0qs8KHZG7coojqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRl0bQrZyctyD/kbYLMn4+cRgw15ig+m9tFYxBtN45A=;
 b=MsTYa7KtFwj7M+f8IKPRkxBQceUITKGReGKjF8QKujriQ5O6Tiy5/tIwlV1+IodBVgVe7BEw314yWhZNgjwAogSUQWtHPE8hdqsCKFYkRaa7RMT1zlLcqDcbeklkseH2hZM5xUxuFXluBXv2mOalTibNZABtHPd0i91RMvUi3aFwif86O+OBjouZKVMDoRwPXGU/Uk4AY8n+eamGPNY/fied0bxQvXrmWKsjzVA6z40A/BDNGZzcl5zKtqTkRsS3oB7YdXUdKodhJqKeB6rL1L8bS9DYxD19wtQyfwNcuZQMNoRmUnR1owbKADbRetk+mP0swgUJ7Ek19wSO6bS7aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRl0bQrZyctyD/kbYLMn4+cRgw15ig+m9tFYxBtN45A=;
 b=YQJm12C+yxKWdm7QHCJpqAXk3NTzrcwTbihUUGNC9wRVb3Ro4CzdikaWw/DxkkzYaIw7hJmdiQzI/7jXfNd1H2I88k7DRzfiE4z/VCuC6GhNKDrynR6JneewMtg1M3EQdG59y43hLoi2D7bgoV1gVkagzzLyHZf0i5AMJQqijT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB8360.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:472::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 12:12:02 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 12:12:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 12:12:01 +0000
Message-Id: <DFK1RR7HGFKN.XM2V8C9D0PR1@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/12] rust: pin-init: rewrite the `#[pinned_drop]`
 attribute macro using `syn`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Tamir Duberstein" <tamird@gmail.com>,
 "Alban Kurti" <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-6-lossin@kernel.org>
In-Reply-To: <20260108135127.3153925-6-lossin@kernel.org>
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
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB8360:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ee41a0-6cde-4880-ef91-08de4f784c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|7053199007|921020|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVBCaHJTZTllUkdva2F5NWJYUzdoQ2d1ek80Yi9QdWdXbmU4RitsenJ3cEpZ?=
 =?utf-8?B?b3BQa3FEeVVCZnJjTTBsNi9hakh4cnRGMHRZNkdrSHd6eU4yV3hiSXFLM252?=
 =?utf-8?B?OTJsUExNRVFwcjNRR25oNWJENHdsZTNKcEtyQm5UaXYxUkNJT3NQY3JmTXZl?=
 =?utf-8?B?WTdBa296YVJLMzJ2VnZKTnovUWYwK0N2TDByeksxVUc1R1VWTmFYMitCQmY5?=
 =?utf-8?B?Ymtpc0thOFlHSUtxVC9TSzFYWHQ4N0dQRjhrRFh6T0tLcjVsY2ZuTlBrY0Rk?=
 =?utf-8?B?M0xocGdOUXpUdHR6TFV1L1Q2M1c0OUFxM0pPNXBoL0c2aXpLazlGZXpXbURw?=
 =?utf-8?B?b3FWd0lxbG41RnFURkFyeDNpUXlNK2dKbmVqRjRGLytxUHplRjljdUFXRXJz?=
 =?utf-8?B?RGR2TDdaL0Judy8zTTNqMG9qSEZLQ2REVHdOUGxCVlBNZTFQZUFSVGFTb2Fi?=
 =?utf-8?B?enFxLzkwcEl6K2xKN2tqQlR1eG5oZGxNcGhHSGFhdkVPQUN6VWo0TlYra1R6?=
 =?utf-8?B?NzY0eHg5emd5a1JuZ3hobUdEbGNYVXg1Q1ZBU2dnUFhPc3JmbEo2YVdXSFM1?=
 =?utf-8?B?cnUxVXN2bkw4QytTSUJNMXExOHpnRXBuL1BCS3VyVW1oZDkvTDhEYXZLMGh2?=
 =?utf-8?B?RTBlU05oeDczMHUvY1dPU1c0bmhKcTlLcjNqTEgvVS9oMEt5bCt4d3pja1RS?=
 =?utf-8?B?RUNMR3JCbTliRk1yR0NxZjVIdGN5STlkRkpmbnRHM0c4Y2VkYjVqS1oxM3Br?=
 =?utf-8?B?QWU0dmwvcHlPaVNjbUpTd1RSdWtEVTRQY09sYVNxVmw2STdQM0FIZzNnc3Nq?=
 =?utf-8?B?L2U5ejQzVnFEVmt1WHRwZHJsZDhFVUZhbGtzUzZpWEFaTGR0Z1QvaTJTbzZv?=
 =?utf-8?B?RTR1S0ZmYWVpS3lCZFZhSDBLWG82NGFYNmpLVDJPUko4ODFWaWp4Z0hxdll6?=
 =?utf-8?B?T0lwbEZjYTd5UlhHUFlaazEzcVM3aEtHTmtvRXlYakRqSEFaNU9DVXR0Q3d6?=
 =?utf-8?B?TnI4aXRlVHhzNVZSL1VFRW95cUd0NjdwcUpHRjhBQXhNNFFiTXFSbTJwcURQ?=
 =?utf-8?B?RHZaUHk3TEpyeVBVTGVkSDNydzdxUTVQRlNzYjJQSmM1WWxnMDVEVlJUaFZl?=
 =?utf-8?B?RS9qOTJHTmZ0Y3UwUjZYbmZ5REtaQjBGWEJMSmhNRU11R2N4L29CamdwYWMv?=
 =?utf-8?B?QysvblZQeEM2Ryt2RmI4YU5LMEZPRmxkdUswZU1ralVQZzVjd3B0TENnR2J3?=
 =?utf-8?B?TDhIbVZLM3FjbXZWU1Z1a3BCRlRCZWkzRUprVEZlVTJzZFNEQnVZMC9mdHhG?=
 =?utf-8?B?ODdmdTNkTWNFY2Mwb1RkZVZXcmJtS1NYeGdlb0lxT3hOZjZ0eTNqdmozdFZC?=
 =?utf-8?B?cjcxd3BURHJnekJCUTRJZ1pWS3ZmOUdhd1pGKzZWbldWajdKT3F6MUNVSFpU?=
 =?utf-8?B?WXVmMWRpeXUvZXN0dmFqTXRCdG9zVkVFeE4yNCsyZ2ZQUTROSStYc1hrMmRs?=
 =?utf-8?B?NXduWlZaYS9SbWVwWmllTG9odFlBbWswcVhPZlFFemlQVmk2YWU1K2VKN25L?=
 =?utf-8?B?QnZMLzdkVUFNb1NpWGlmdmJ1eEZOQ2VzNHpnamdGRjdDWDRaTURJSllEeGM5?=
 =?utf-8?B?N1BoQXR0MTJZYlphWVl6Qk5nemp6TzFNYkhld3liZGJ3aklzNjN2ZUdPQSts?=
 =?utf-8?B?UnZVUFZXZU4vY2ZVVm9oR2Zkd2RINnRjTklFdGI4cGs1TkRQajhZN0JudWoy?=
 =?utf-8?B?SGY5RXJ0WklSa3Q5LzJqWk45OSsyYVV4aU8rRW5QUnhhSWZPWjNvRitoVEg3?=
 =?utf-8?B?RXVzS0Z5K1RXak02MTVVdXpaN2d6c3BRcmpjTGtxcW1QZ3V4RzByR1E0WXhr?=
 =?utf-8?B?S1U5RGV1emNlVDVRSnNGYU9VWEU4MjZJRzJJMnRXWXVzRm1DMHo0ajJaUHNp?=
 =?utf-8?B?OXUrcnhTeTZobTJsMmpqY216Tm5kZHpYaHc5Mndqd0M4cUVYR2Z1K3EwY1ln?=
 =?utf-8?Q?Ps3JjeYJ7hrv70znB9V13KnC1MWG1o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(7053199007)(921020)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG5rUFlrSCtpL1NvTm5JM0VFdHhCTUZMakU0K0tncjl0YnpnSkRLeXdRYjEx?=
 =?utf-8?B?RXpTc2VlVUw2L0hhOVE3QXhqVHN3VVYvYnhIN2FaSWZ4MDZabGZqOHQzS0I3?=
 =?utf-8?B?NjRkcndURHBIZTlTb3c1bVhDZXpCaTBjRWsweHE0ci82SHZSaVFrZHBPbFR6?=
 =?utf-8?B?NGJpTWYzRXhNaHE2MHF6b3djRU9iZEtlb2pQcGN6T0FDSkJhd0dxS0lXWHFy?=
 =?utf-8?B?Z1ludXlTQzZhQmxPTlBaTVFURUQ3TFF1Qjg3cTg2NWdxR2Npd2hiQUZNY3Iz?=
 =?utf-8?B?bkE4ZFVxQ2gzWTducHJEbDBHd2VZRjF0MFFYZi9wY0dhc1h1M3RuSWkvTC9t?=
 =?utf-8?B?aWxadXc2R2lpUnBWLzVyZ1R0dldRMGw2NkFMaENUR3VkUHJTWGxleTlEVFpU?=
 =?utf-8?B?cU85bmlQWGRSb3dud1JOYVhJS04waHl5SE53alducEhSZEJBNkVyU1AvVlNT?=
 =?utf-8?B?ZjN4blppYXlSdkdiNnhSNng4WG9iRmxDM0pwaWhxYUFzWGpDcGZVTnZNRlQz?=
 =?utf-8?B?QTBWcHYvSjBXV0FsSGdKa0F0TTZQTmdqWnF6bjlJZlZwVGJheHFJUUlXeWlU?=
 =?utf-8?B?YXZoMTVvRmZDZitzbUlGNDZoTktGVVFxYSs0dGxocHJhQjlCS29FSmF1K0FT?=
 =?utf-8?B?VExKdk9TWXJuMnJndGFlcjVWNUxRTksyT0NhUnVsRFUvK3NLU0czZEt5TTRl?=
 =?utf-8?B?d2FFbmFZSnQvMVkvWVc4a1hjcjA1bnR3V2tkczBaUnRpamhPWEZIb3NaalFa?=
 =?utf-8?B?NVR6cmtjeEZGemo0T0liUWdiSHRiZmo0cjdqdXRlYy9rUDFzSHU2TCt5U3g1?=
 =?utf-8?B?UnlUU2xEbFE1UTdGZ0JSV0Q2Qkd1eGY1VWl5RzVuNG1PNWV2dVdhY3JMSHpR?=
 =?utf-8?B?b2JSOFUzWTdFcFh1ZG1jSERCU043ZzkxOVZ4clhJSnR1dTdmMFZWSTRkS0Ry?=
 =?utf-8?B?QjFZTG1objQyREQzbXQvTlg1Z2FCSFgyM3MvWE9XT2pMdW01Mnd3MkRFTzFv?=
 =?utf-8?B?cFVyVkx2MGE4blRndnlWVDladzZFWXpZSkNFclZZTndBMW5aZWJiYWpTUFdm?=
 =?utf-8?B?ZGY4blp3eDZxaXZBV0tPL1VVTHR0VkFsZDhUT0Z0ZnNaYy9KNjZVNU5rR1Ey?=
 =?utf-8?B?bmMvN2FKQTEra2RuYm5qRUt2Z01IcFNaZCs2UTZpT3RIMXhuazhUNnEvc0lU?=
 =?utf-8?B?OXZVU3lEazIvUllBUEYxZlJGNGxTOVE4eWR0MG42Tm5KYlYyZkZ4d0NKbExH?=
 =?utf-8?B?Y3NLQlJmbkUwSXZsQStTSjZpQjhJOVdmRk5DYlorYVJ5N2RYQndMN2lkMVpG?=
 =?utf-8?B?L0xUeU05WjRYVWg5Q1ZaZkNnUnNyK2hVcmlWOGtqOWxEWDVSdHh4NUJVRHJM?=
 =?utf-8?B?Sm9CcTd5TGk0Z2NrbW42c3c2WTJPVmxSeHhnTFlJNlcxQ0xXZVNTRDMzRkRX?=
 =?utf-8?B?WGNtcW1uN0ZEdEdzc1dCNGgrNW1RK2xENkRUbFlHN0RMYkVleHFGc1BmOUpG?=
 =?utf-8?B?alUvaVozOGtReGw4VmdyWm4rOE4zV01zUHVPcWZ2cHBSRVdLaFE2Tlg4MmJj?=
 =?utf-8?B?a3oybFlWRkNsYXJwaWdGQ0xhN0J0Zlhobzd1Z1RpZEZLN011ODFCRDFJR1p0?=
 =?utf-8?B?REUxd1l1dDFWOFdYb1NSMEk2Z0hrM291aGJ6eVgrNHNYS3BnZTBzMzYxaWZN?=
 =?utf-8?B?Tml2YndleXRLRXRXaldOZ3E3cDdGSHpWd0E2bGpNVTFqak82OTByVVZPRzlp?=
 =?utf-8?B?L2RwbVBOSWRldldpY1dWSml2SlFqazIyeHZCbUlVaktCNVZiUmRvUWppdFh0?=
 =?utf-8?B?NVJoU0Fuek5tcXpDeFpmMmJIbzdLSVkrY09rTnQvSzJRbUI5cDk5Y2pnYW1a?=
 =?utf-8?B?OHcwaC9HODZUdnpZUFdWZmdVL3p3dDRNL1BSVkdIeTlKVXMrWldhOWx5RW5E?=
 =?utf-8?B?UFhhN2F6YzdsZ1NyUmI0V1d2ZTQya0xTOHYySFdmS0Zsd3FhNmRaVFc5bmdp?=
 =?utf-8?B?WHZMRXJadkVVaFhGQlFYSndudWtrU1hhU0t4N1B3QkxpOHNOLzBDZVZsOUNa?=
 =?utf-8?B?SUd4YVI1L2FscjdEYzJ1VXdOUnh3S1hUV1ppQkhDSStFWUV4aVJPSEVab0xo?=
 =?utf-8?B?VlJhdjRIVjZMV09HTFVtdGo3ZW9vVTVROUV2Zmlnc3o2OExRMHZLenpoam1z?=
 =?utf-8?B?dVVWK1J3dFpUMXhjcUF0MlVLbTMySnhMT3I3bG05UkVST2xqREJvb09MU24r?=
 =?utf-8?B?NmJ1WDRyZG9DT0JWWkpuRFBVdm1mVEtDbVpMalBMdXFwbjdSMVhxRTRuTmlN?=
 =?utf-8?B?cy9MOGY5ZFZlNzRodjMzRDEwUG5uUDIwOUhOOGJRUTE5MnJIWncwQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ee41a0-6cde-4880-ef91-08de4f784c26
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:12:02.6190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slFV0MdzU9Qde+6/Bd4ak1vq5fKEbBw+yph0B0Ex2FBmfL1hL1lIhSc2jjEhJ22kxFPO/UmMurdgn8NnN+dZBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB8360

On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
> Rewrite the attribute macro for implementing `PinnedDrop` using `syn`.
> Otherwise no functional changes intended aside from improved error
> messages on syntactic and semantical errors. For example:
>
> When missing the `drop` function in the implementation, the old error
> was:
>
>     error: no rules expected `)`
>      --> tests/ui/compile-fail/pinned_drop/no_fn.rs:6:1
>       |
>     6 | #[pinned_drop]
>       | ^^^^^^^^^^^^^^ no rules expected this token in macro call
>       |
>     note: while trying to match keyword `fn`
>      --> src/macros.rs
>       |
>       |             fn drop($($sig:tt)*) {
>       |             ^^
>       =3D note: this error originates in the attribute macro `pinned_drop=
` (in Nightly builds, run with -Z macro-backtrace for more info)
>
> And the new one is:
>
>     error[E0046]: not all trait items implemented, missing: `drop`
>      --> tests/ui/compile-fail/pinned_drop/no_fn.rs:7:1
>       |
>     7 | impl PinnedDrop for Foo {}
>       | ^^^^^^^^^^^^^^^^^^^^^^^ missing `drop` in implementation
>       |
>       =3D help: implement the missing item: `fn drop(self: Pin<&mut Self>=
, _: OnlyCallFromDrop) { todo!() }`
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/pin-init/internal/src/lib.rs         |  6 +-
>  rust/pin-init/internal/src/pinned_drop.rs | 87 ++++++++++++-----------
>  rust/pin-init/src/macros.rs               | 28 --------
>  3 files changed, 52 insertions(+), 69 deletions(-)
>
> diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/s=
rc/lib.rs
> index ec593362c5ac..d0156b82b5d3 100644
> --- a/rust/pin-init/internal/src/lib.rs
> +++ b/rust/pin-init/internal/src/lib.rs
> @@ -25,7 +25,11 @@ pub fn pin_data(inner: TokenStream, item: TokenStream)=
 -> TokenStream {
> =20
>  #[proc_macro_attribute]
>  pub fn pinned_drop(args: TokenStream, input: TokenStream) -> TokenStream=
 {
> -    pinned_drop::pinned_drop(args.into(), input.into()).into()
> +    pinned_drop::pinned_drop(
> +        parse_macro_input!(args as _),
> +        parse_macro_input!(input as _),
> +    )

`as _` can be removed.

> +    .into()
>  }
> =20
>  #[proc_macro_derive(Zeroable)]
> diff --git a/rust/pin-init/internal/src/pinned_drop.rs b/rust/pin-init/in=
ternal/src/pinned_drop.rs
> index cf8cd1c42984..4df2cb9959fb 100644
> --- a/rust/pin-init/internal/src/pinned_drop.rs
> +++ b/rust/pin-init/internal/src/pinned_drop.rs
> @@ -1,49 +1,56 @@
>  // SPDX-License-Identifier: Apache-2.0 OR MIT
> =20
> -use proc_macro2::{TokenStream, TokenTree};
> -use quote::quote;
> +use proc_macro2::TokenStream;
> +use quote::{quote, quote_spanned};
> +use syn::{parse::Nothing, parse_quote, spanned::Spanned, ImplItem, ItemI=
mpl, Token};
> =20
> -pub(crate) fn pinned_drop(_args: TokenStream, input: TokenStream) -> Tok=
enStream {
> -    let mut toks =3D input.into_iter().collect::<Vec<_>>();
> -    assert!(!toks.is_empty());
> -    // Ensure that we have an `impl` item.
> -    assert!(matches!(&toks[0], TokenTree::Ident(i) if i =3D=3D "impl"));
> -    // Ensure that we are implementing `PinnedDrop`.
> -    let mut nesting: usize =3D 0;
> -    let mut pinned_drop_idx =3D None;
> -    for (i, tt) in toks.iter().enumerate() {
> -        match tt {
> -            TokenTree::Punct(p) if p.as_char() =3D=3D '<' =3D> {
> -                nesting +=3D 1;
> +pub(crate) fn pinned_drop(_args: Nothing, mut input: ItemImpl) -> TokenS=
tream {
> +    let mut errors =3D vec![];

Any reason to not make this `Vec<Error>` and use `syn::Error::combine`?

> +    if let Some(unsafety) =3D input.unsafety {
> +        errors.push(quote_spanned! {unsafety.span=3D>
> +            ::core::compile_error!("implementing `PinnedDrop` is safe");
> +        });
> +    }
> +    input.unsafety =3D Some(Token![unsafe](input.impl_token.span));
> +    match &mut input.trait_ {
> +        Some((not, path, _for)) =3D> {
> +            if let Some(not) =3D not {
> +                errors.push(quote_spanned! {not.span=3D>
> +                    ::core::compile_error!("cannot implement `!PinnedDro=
p`");
> +                });
>              }
> -            TokenTree::Punct(p) if p.as_char() =3D=3D '>' =3D> {
> -                nesting =3D nesting.checked_sub(1).unwrap();
> -                continue;
> +            for (seg, expected) in path
> +                .segments
> +                .iter()
> +                .rev()
> +                .zip(["PinnedDrop", "pin_init", ""])
> +            {
> +                if expected.is_empty() || seg.ident !=3D expected {
> +                    errors.push(quote_spanned! {seg.span()=3D>
> +                        ::core::compile_error!("bad import path for `Pin=
nedDrop`");
> +                    });
> +                }
> +                if !seg.arguments.is_none() {
> +                    errors.push(quote_spanned! {seg.arguments.span()=3D>
> +                        ::core::compile_error!("unexpected arguments for=
 `PinnedDrop` path");
> +                    });
> +                }
>              }
> -            _ =3D> {}
> -        }
> -        if i >=3D 1 && nesting =3D=3D 0 {
> -            // Found the end of the generics, this should be `PinnedDrop=
`.
> -            assert!(
> -                matches!(tt, TokenTree::Ident(i) if i =3D=3D "PinnedDrop=
"),
> -                "expected 'PinnedDrop', found: '{tt:?}'"
> -            );
> -            pinned_drop_idx =3D Some(i);
> -            break;
> +            *path =3D parse_quote!(::pin_init::PinnedDrop);
>          }
> +        None =3D> errors.push(quote_spanned! {input.impl_token.span=3D>

nit: this can be `input.impl_token.span.join(input.self_ty.span())`.

Best,
Gary

> +            ::core::compile_error!("expected `impl ... PinnedDrop for ..=
.`, got inherent impl");
> +        }),
>      }
> -    let idx =3D pinned_drop_idx
> -        .unwrap_or_else(|| panic!("Expected an `impl` block implementing=
 `PinnedDrop`."));
> -    // Fully qualify the `PinnedDrop`, as to avoid any tampering.
> -    toks.splice(idx..idx, quote!(::pin_init::));
> -    // Take the `{}` body and call the declarative macro.
> -    if let Some(TokenTree::Group(last)) =3D toks.pop() {
> -        let last =3D last.stream();
> -        quote!(::pin_init::__pinned_drop! {
> -            @impl_sig(#(#toks)*),
> -            @impl_body(#last),
> -        })
> -    } else {
> -        TokenStream::from_iter(toks)
> +    for item in &mut input.items {
> +        if let ImplItem::Fn(fn_item) =3D item {
> +            if fn_item.sig.ident =3D=3D "drop" {
> +                fn_item
> +                    .sig
> +                    .inputs
> +                    .push(parse_quote!(_: ::pin_init::__internal::OnlyCa=
llFromDrop));
> +            }
> +        }
>      }
> +    quote!(#(#errors)* #input)
>  }

