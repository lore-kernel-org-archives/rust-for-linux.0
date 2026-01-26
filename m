Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A81333970C;
	Mon, 26 Jan 2026 13:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434145; cv=fail; b=n9v6RxVjP02JT2XzcZyx68ZO03Q6iOqMY73KYOdmXLij3QbV9mMFF68bU+J58e1HMAKruid10ty/v7oYcsPqCTCcFIWgrayFzJF3C1ZghL3wHwbaKT3+Bg4FoY8zg2HJp0lMnFHqwNI9UDes+qibOnDZ30coSdPTvIsKUWex+6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434145; c=relaxed/simple;
	bh=3K6nvH074Kvv6TOL3YT7lDASKr/Cw1XfaZ8pwnEV6iM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IM8F4sbGoElf4tuGWI9IVwCmN56ZEVSPrv+5IUdvrvOgia9aii1ETg1J/JOjnsm4unWU9WTphuAkfzxrW6NX0lLm0Y/Q68pb0pqFaTQEVqRTMZt+ryVVW3zOtSlbaSCx3qEKJsjh0fNNR/M6KT+X0HcrYeoe7+7BXxgmSd+Ti1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uMAkhBNA; arc=fail smtp.client-ip=52.101.48.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uMAkhBNA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uz4TCrDwd/R1rr4B/Jel+f2rOIFOyMJjKk+DF7kkLTdPgwuyK8y2qKaFXelHsIxil5CygYh9N4M6CuHpkZkUdUrN8PFtan1Ly7TlmLlR9WwU/zBAmoBPZQGyAk2FPNlUfISQh1aAPku0f/p24gPFy+LRr05aUIeeZhfOXXJS77v88G94+/BLXdzQDLPaPc7y5kzu17+vuFFAWftbG0yhyVYEKYUTWBHZoDOIZT/SG2yEqG6FgN8/AqXHu0IyQ+7iIV50P9hKWh0iiTl0UbxQAgxqH5bqgMJmzaShZlhecr3q5gTQD/fXY8kjdK4cYcHov4X7xEYCOjECfCdI9z9NLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDeQpmkBsRJSKmuaBQCG2Kg68X0sFstTnl5x21LvRNQ=;
 b=RAPlt0BcaCUy0YAQPLjOZXGgebtKClXvV/ITnBE38zD81t5X7Jn86CvOXcmC76bQDejb+UfStruxURVRRrPahQJAGZpmiqzf6nnvYDC5DhXS98hFC8dg695GPf3NtmMe7hrzqaZokFf0RVlAtAZB/XL0mYMCCTnPtyW1H7I0rIzRvr23o9H7qTm7hexpWd0Ho5BdtGlcLpr5k+JNyrjW2s+yHjk6YnS2T0b0LthXb2HWPCC2lYvhvGMS23nMyV+C6Qtno0WBTkriGzC5H9LXnI5sE8ixFX+0i/AhRQIarnLawqGYWD4RNwn4ZwHfRLCPax7yVHVsRG04o0yXVvE6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDeQpmkBsRJSKmuaBQCG2Kg68X0sFstTnl5x21LvRNQ=;
 b=uMAkhBNAGYh9gNyl6BYdDu7nFWw4qmsTLHzIAqx1HmfX5KH0Q7y4+IO6uCFDu5cVQkeNbRaEDsR4tskYICknX0AjsG3VvV2o2zZMFd1AeE8TNt4u8NIxb+PMAIgvXP60kzxi3T6fpngzVqkbhHvFHGYIDjCMZIKthmelJ7VTFzPLiPHxlSPI/utZ6saaaByI9yDRKkfucbUMXulDjIHFRculX5NXRi5fYOXu1pttzLTh2NJ8GKkX3Pa3z2vZrRuVQBjn02DPunlNUZTXDFX1SanXGJJLNtiKTudJEr1Zq1Qw6Evtq3ugL+44HFAX0at4n2H4WvpJg6qLJPoIU6ayng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5942.namprd12.prod.outlook.com (2603:10b6:408:171::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:28:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:28:58 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 26 Jan 2026 22:28:40 +0900
Subject: [PATCH v3 1/6] rust: enable the `generic_arg_infer` feature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-register-v3-1-2328a59d7312@nvidia.com>
References: <20260126-register-v3-0-2328a59d7312@nvidia.com>
In-Reply-To: <20260126-register-v3-0-2328a59d7312@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0164.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5c58a0-7138-4b34-630f-08de5cdedc91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmtPTWxGdkR6dzJ3elkzOFUrU2JpZHhHNyt5Um1ySStKd0JvN1p4WWs2TUdq?=
 =?utf-8?B?M1JRNEVtTDQxenZpeDAzU2VMN1lKYWYzTjZHeHNtNFo5cURaSTVrblNzMWdw?=
 =?utf-8?B?L1BoSlk4SzZrbVdyQ04vWStwWHYyU29USzNrYjZCTlBxU0lwbVpwR09xczJJ?=
 =?utf-8?B?YThIc3lsaTVodTlLYk5NOFJtSTFWbXRVRitJaWtwQkNhbWNKbm5XeEs1eVhh?=
 =?utf-8?B?c1JTeHM0bEtnQWovRHdWalVjcXFPUG5kejJtZFN3bXJLTno5MVNUY3VaM2JC?=
 =?utf-8?B?MVBtS3kwUEVwUHVKNlBwZWNWODNzbVQxVG1mNzRPWjhUSkF4azc0ZnQzT1Ft?=
 =?utf-8?B?bkZXQ1kzWVF4NXA3dFd2cS9kbzRVSFdTYUR5MHNGRUVrL2EvaVlPSG5vU1gz?=
 =?utf-8?B?TVR1bDRpSWJZLzl0YkpIeUxWUGJnUHpWbWRCK1pqby9rdU15SGx2bXRNT2d1?=
 =?utf-8?B?dk1GbUozelZ5ODJKN05TQ0kzckVydUpkV0RBSElHbkY0VklIT3FJaVp2OVVR?=
 =?utf-8?B?eFovczN5UktMZmRHUC9pc2F6S05RejRhTGhJVGRXVi9BbXEyU2c0WllrUmkz?=
 =?utf-8?B?amh5K3FhakR6MFQ0RnNSWkVxMUdGcG1la3B5VmZhMGw4TzRnNlA5UXdsQnFt?=
 =?utf-8?B?Nmg0dWV5N1JFSmRkY3E2dTcvd24wYjEyQUdkVjUyN1RpZ0lTNUZybUU4TDkr?=
 =?utf-8?B?bkxkbnQyNzlHWkp6ZVVlUEd6bDVlZUpGb2I4NytPZE5FRER2U2ptZTBZNTZQ?=
 =?utf-8?B?Y0NpQU1XWmNUWVJlM01yM29MbW0xQjR5OFA2MnR3cnpjNmNHaDRSNXZsUUhO?=
 =?utf-8?B?K2c5VlRyNTJlTEM0N0M2VzlMWWFnbUNzYTVVVWVsak5CcUdjYXZyOG92QllK?=
 =?utf-8?B?M0l0MXVwTGN5bU5STit2RHM3NldGMXdBLzBDMEQ2WDRUY1I4RFRIcjI1MnNH?=
 =?utf-8?B?QjdnY3dSRDhuT1NZT2Q3OWhFNmY1aGpKWDBxa3lDcVVRYnM1ZkdhTzljQWVR?=
 =?utf-8?B?dTZKZ21weXRlKy80ai91Z1BEWXl3L1VTT0YvR1hNektDOFdLazY1SU5OQjZL?=
 =?utf-8?B?QXpSRTlJZU8xdXIyanI2V3JoN3NPbFpVU0ZaSXJtYVVKRUxkR0ZEenM5TTNX?=
 =?utf-8?B?SlZsY0MzNHpCNlRZcVBPaHIyaVRDWTQxeTRYK0ZsN0JaL0pEZUwxWkRLYXlZ?=
 =?utf-8?B?RTVmM2RteEN2N3VJczM4VkJaNFpKallGb2FyaEQrYW1TY3M4SnlLSkJzczgr?=
 =?utf-8?B?aEtvMjVOWVZiNkFZNFBCY2NWNGVQVlUyNXpZc3dha2ZwZmdTc1JkZGY3MjJv?=
 =?utf-8?B?bEdiOFVOWjF0NnZZWnk2K2VJenJvSzdacDRBVGR0UXZqZWZRNmgyS3RZUm9I?=
 =?utf-8?B?ekJEaXN4YXVWanAwaXVsVFZmbUJZRHpkOE9FVEpDdFdBdlFsVFRKZ0FUQmda?=
 =?utf-8?B?Q2pjcFdRUFFCcUVmZ3AwYkdHeUdwVjNTcHhGNjROM01GYWZOcE01WDlZWlIw?=
 =?utf-8?B?bWdXc3V2R3pScjJHb05rcHptQmQ1YXZQWTV1c2FweUt4aEZSZXQrWFltWWhE?=
 =?utf-8?B?dHY1NHI5Ti9HNlRPQlVsTFhaWDE2c0hvMlV0K1lVbllhRjZTUEVwdjhZZzcx?=
 =?utf-8?B?QVN6NVBScGVzVHVTRWFUemxFaURjV0ZEcnVlN2VzeWRxTzU2RmNUYUhuc01y?=
 =?utf-8?B?U08xY01MMTF6TnNyelhia0swM05lT05OeWx1Vmw4NWluNDdZaGFKSnFTaDJE?=
 =?utf-8?B?ZXZJU016VHdBR0dUQitKZXhrTW5zT3Npa1FyMjBpenNvSFAxMlBZczF1dUxW?=
 =?utf-8?B?UERBQmsweTBLdzQ1ZUQrNHNwM0tvQzZLbHBsUSsrcm1vOVRibUE5dzFod1ls?=
 =?utf-8?B?TVB1TnNPMFEvVXo4dzJKeXNCYjAyK1UvWit5M0JKSVBXbUtPN0pvdVBPZTFJ?=
 =?utf-8?B?UC9CNzNIR1hLbm5xQy92UXhTZ1RVSmZWcUNJaldmTHROYWNLUi81YWQ4UjVP?=
 =?utf-8?B?Um5wRWJtbTB6ZUdLdW94eFB5NHdKcDgxOVVJSnBYVXFVOFI3RCt1Yy9iNUlo?=
 =?utf-8?B?VkxEdnNWbGFlSUdQRElnQ1VvSnZmSkNNREhvMXFONXJNblphUFlYZ2RqVWgw?=
 =?utf-8?B?Tjd3L1U0cTZ3UW1QQ0VWR0FjOTFXbHA5OWFXV1pjd3NoZUd5TXo2R3MweC93?=
 =?utf-8?B?UVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1FvRjByWHplWnlZY25PQlU5bzlhbWFhODBmK3BQZ2d1QW8yT1BKSXlnSTQ0?=
 =?utf-8?B?WnA0RnUwaW80YWJiMnd6dFJoUUtEc3Q0anp0VjRrZTZCTzhSQVlkOW9HbVdD?=
 =?utf-8?B?YVlFTXlqNnNBMkRxZFphNlEvbnVCTkVkL0xNZ2R3T3NGUDN1N0FXMHU1Y1JJ?=
 =?utf-8?B?OU13VkI5YWxIVWR5WHZRaG1nWjVlV3dnRjMreGhkWFgzTVppK1kxU3hwZlRs?=
 =?utf-8?B?emY3b0xrbkk2L1kwQ21USUZ0TEEyR2VjV2M0UWNNSXJYVXJ5ZXV1clhYQWhY?=
 =?utf-8?B?K3VXM2MyZ3pqazhWemZvUmwxNitlaXQ1eXE5MjFtbFhWTjJ2YU5udmw2SHdC?=
 =?utf-8?B?Njc2TERFVjVsS3BiNWt1NUlkVVF5Sjk3akpXL0gxamEyaHpXeGVraFRDeVB2?=
 =?utf-8?B?dnYvQkl4M1VHR3JMQ0FFbVltcHpES1kzeURUYkJGRC9YQ0o0NERGVjJKNHRo?=
 =?utf-8?B?bUpTNFdSamtxYTdDb1V5Qmc1VXFlU0RlQkY2aUNSZDdiTTlCZmpoYXQ0aENL?=
 =?utf-8?B?QWRRUkdiSFIyVmxtV2dGWXdCVGZDM1lsdit3T1NIY1NRMmhnandlWUg5Z3Vi?=
 =?utf-8?B?ME5Hd1RKMVJJbkxGcTBRZm1QNkM3d2tRait4TzI0S1BxaVNNSE1HcW92Tyts?=
 =?utf-8?B?MEVjU1FVZ1Q4bURMZnpZcG9IR3ZSWmZ0Tm5SMUcrYzh5ZXU2QVc3KzlnSEdY?=
 =?utf-8?B?K3dNYzhMV2tQYWZKOEY5a0RCaExaSHVyY1hFUmV2bzcrazRSck15RXhxMzZX?=
 =?utf-8?B?enRtUEdZLzhQTGdaaW9OZzJ5WE9Ta1ZlZFQxQUdleHhzeEZSVTJBZjdzc3dW?=
 =?utf-8?B?bU9FYm91M1FrTE4zMUZmcTkzVDJxa254Vmd3WHRNUHY3YzFKU0FGakNKay9F?=
 =?utf-8?B?VnpPTVNCbE9obC9rYi9ZcW5adTZyaGtMYzBORVBRYlU0cm1mTW1qbXIrOExK?=
 =?utf-8?B?anYyNEpEY29PK2Z6SjZaOGlodEhlSHZuekQvRm9vMFNPTHNsZVJSam04TUhl?=
 =?utf-8?B?eGJkNVN3RGZkeTRFT3VXeTNTZnJTQnFzRVl2Yjg2bTlOOU9Wbit0TGVKRWZx?=
 =?utf-8?B?UklzM1RybS90VTZEdXZKNjNvT2hVSjBvQjI5ZGFGbkdMZ0ZLdnF3Y1VmQXJ5?=
 =?utf-8?B?MmtPYURzQlo1bVQ1cFF2cytta1JpcmtjLytsYTdpbzVmOTUzaWhGcGZ2MnNi?=
 =?utf-8?B?U1JqTHM2czVSdHIyMVppSzI5N1k4Mmk3THJ6eXE2VGFBbSt3NzRHVDR1MTFC?=
 =?utf-8?B?OTByZVB5bGVudFZZRDRYR3pvYVRtNFhTZUY0Zko0b2w1elV0YVhTYis3UDVo?=
 =?utf-8?B?VEJEdjlSMzQvZ3dYb1pxUDFJSUF1NThibHk0Sy9xdjF3eS9VZHMwbld5NFJN?=
 =?utf-8?B?NzZaNmw2ZzhzbEdna250LzJMMUx2ckVrQzlYTjk0YzVGK1pqZk95N1ZkSG1n?=
 =?utf-8?B?aEVJckxreHNUczh0OVduTUZkQkEwM0UwUW1LR3dzZWxCdU1tRTNlcnRqbURW?=
 =?utf-8?B?UFpQSUNvV3FWTVBnOXcvRDJDNE8zSGlwN0kzODlSSlkrUFBqeTBjQ3h3cXpL?=
 =?utf-8?B?c1h0YmFHL281MytveUw0QWpxeVBWNXhjTkxncVdTMTV4emNsSUx3dlA1bjlV?=
 =?utf-8?B?dEs5aWRqc29OaUNNZXFCRTh4cFN6VnduTG9SYW5vejJ0M0dMcEIwS3pZOXdC?=
 =?utf-8?B?U09oM3VVU2VleENjWWljb0cxc3M1U2Y1NUIrRkhQQmFwck52a1cvU1UrTFBp?=
 =?utf-8?B?UDJnRTc5b2VCWjlZaXRpaGJEanZWdlpDb3VnRkIvSlgybVJkTkhZRjNwYzJr?=
 =?utf-8?B?WEVQV2pGbHhSOXVkVmhXWEtaQnVsc2kxaENkWU1XQUx0c0EwOFQ5OHRROFJa?=
 =?utf-8?B?QTluem1xUnVsa2lEdkVCQkZyeFN4VHR1R3NWMGtmTlNwSmhDSjZTQkk2L052?=
 =?utf-8?B?OUxETlV0dGNiL2RxRU9NMVRkV3Y3V0NKUlc1a1JRNkNISUMvSWwrOUI5WUJm?=
 =?utf-8?B?cnBUSVNaTWxXaFhQeXQ2RFZHZWsxQjl0UHd0TERSdTV1aXNGV1M3NnpmNWdX?=
 =?utf-8?B?Ly8rUFFnVmRheUlwTS9Pd2JrRFRZNzRDeFBuNmpqZlBzTHFIdUoybXpjVjJT?=
 =?utf-8?B?SVBILzlWK3ZkNmRUcGllS2RhWVVOdWpwNnJQVlo4ckhubnhzdWxUV29Ub3RZ?=
 =?utf-8?B?ZHVZZ1VyNklXNU9WdER4Mk8wNm1GdU56V1BTeXQwdlpaaW84UjA5VnlXNVNO?=
 =?utf-8?B?Y1NjQy9xUVFXdGk1VWRDdjdVckxCTUYvKzMrd0ErZjhhSHpZY3BDNWo3aVM3?=
 =?utf-8?B?VHJLdkdVT1pRcVF1RVpZNEYzODl1YWU4YXE5ZXBUVmxQRTJ5dk9GaUpobWM3?=
 =?utf-8?Q?AjEmCumDOIWUN1bEpVWXEaDExKtiUBNWH0cK7TNIbfD3u?=
X-MS-Exchange-AntiSpam-MessageData-1: n5SCvdYN6w7Kcw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5c58a0-7138-4b34-630f-08de5cdedc91
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:28:58.8314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNii5TvKizJsfxgAh5SpmsWFELlMk99sPr6GeH05vgwgUU0YlsHIEI9LIq1oFNUAoBbVhwNhWrOCWERe2g3ukg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5942

This feature is stable since 1.89, and used in subsequent patches.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs     | 3 +++
 scripts/Makefile.build | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6d637e2fed1b..122ad64880cd 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -37,6 +37,9 @@
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
 //
+// Stable since Rust 1.89.0.
+#![feature(generic_arg_infer)]
+//
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 //
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 5037f4715d74..4637aa11e870 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -312,12 +312,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
 #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
+#   - Stable since Rust 1.89.0: `feature(generic_arg_infer)`.
 #   - Expected to become stable: `feature(arbitrary_self_types)`.
 #   - To be determined: `feature(used_with_arg)`.
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,generic_arg_infer,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

-- 
2.52.0

