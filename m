Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39D52EE617;
	Mon, 16 Feb 2026 08:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229120; cv=fail; b=I5CEcCdlo1yDotABCR7NRIJV+WfR3AgkiWXlmuqXiFTtDoELUDLgBVfAZK2S4m7rauHY26uFKqp/BPRXLAcgWHvf1cdR9XvLO53SuzHi63WSs3FKq0Jm+Zm2U3c0vNnYe46j91DkbJ9tcZhnEmrP38ZR5/PQLBVIDpBggT1ugjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229120; c=relaxed/simple;
	bh=aopK2/+di1M+EzJJlJKolIXD1RgY+H2U/JzAe/r+Zh0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=E2q/ddqM3Eco5AL4Bof0eGjKs3KAfSsi+RbRV4Y7nkf94qq7rKf383FaTnLWtfTRElslhE5xz3k0qZGYoxwxhsA9Oo3kzfHpt7uQkDGcX7DvSglRfo38ua9VitywGpRl0dPSutCTZvTAwqwcfpFoyoDqnGJEkm5GgWdCm+BcVBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r1yPSGeN; arc=fail smtp.client-ip=52.101.46.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r1yPSGeN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mp34mUlzSA6k4gAfzzqETt78A36QWZJbJyk4ddH23XY10oHSrrceXJlH2CMfzQeZE44W3SZGvLUY5z56Ln+xoyFw/bNHrOEXxS+R0cXC+Ynq0TdNYchmRANOuwhS2gYeP7nCS1fTbFmvL2mNEAn9QeMItdCX+pA9SZ5ilyaJ19Uey97mTzb2xMwCPpCChDX8yFLky2PY7nZPgGvCSf8q7cqhaWgxui3k9Sb1sCMDTz+rADpI/uGkBkVcHYyywHuT3vIcnc7vFxUU4LpWjp9JZlXsKDrSaGBpYehjI2GYO/AEjcSSkcwEaWaAAo55cLRUgupNMxt109WLFL74wnA7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQynea4T8ZzxQKtSBqmBf/KGVqj9AZi9FNl5cCnTU38=;
 b=WZuxRdSgIFCRIMelj4zvFjcXLMRVim5HxgojZyi5ukfs8Y88Y7wO8aBpBw6DlCg/R9w2O8A9NrjikjmLNQdule8jPCC+qn60hZ70Qph+i5EhFzUxDZe1FgQhrKxjwYVQFDVt2Be4uIXq8AINYkfHjiJm0W2H1zCjNIQo9k++wsFzPsPVHXOBpVFxH4cKSN4XlCFVFdQAU69Z2qaPZA+CH0m+80Vd6qZTv/i6X2+fa8K/cHBwm558slN6UOj4TXenQNB0LXfVtJKC8D5UWFTqxaKgOpkAJJnX6Ef+c2uUoqXzzPpVE3T+d5+xqZlpSJzzPu35Cje5TPrMAPrj89LYWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQynea4T8ZzxQKtSBqmBf/KGVqj9AZi9FNl5cCnTU38=;
 b=r1yPSGeNXQJif4LbFw8uO6d6sBdbHZlfPtLd8PP+kalYIH0pNpOhA0ZyThg/O8joRUTY+dU0nB7VoqJYMJhwR/rSdGqixootW078RLzEWvsTG+ST1YrWURwwRCzSRVvlTJIa15sA171dO3bqUlnp+ZcGGwAFPRrQyiG9YD18+sSucK9zTgHDXlZRPqJtrtaGk0+4P5lQYtOzVVqb6TP87KRxgQ3TVDL1xx59+vXMkpoiDKh1xTz/D0MvNqzAuJTI04Ff48pks5DGDpj8WJo3FOoBOSSNvM/W4/ZoyvmMnwwH19g9J13QBNqQbJUU2qJKl5pcpLDrGxk2kXabbVx6jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6832.namprd12.prod.outlook.com (2603:10b6:a03:47e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Mon, 16 Feb
 2026 08:05:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 08:05:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Feb 2026 17:04:38 +0900
Subject: [PATCH v6 2/9] rust: num: add `shr` and `shl` methods to `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-register-v6-2-eec9a4de9e9e@nvidia.com>
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
In-Reply-To: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0301.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 2913dc60-c812-4f0c-1284-08de6d321e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUszU1NRZFRxd1ZtTjBOcmp5VmRVUWxsSUU0a2JPenhjR1JHUlRSUk9wY2Iv?=
 =?utf-8?B?UWFHdzVjSWFzKzdCMXJER0lHV05LSnlkZE4wZnp4bklVSDJNNzlZOEZBNjYz?=
 =?utf-8?B?SkllSzQrVmM3eVZLU3ZLWDFDTmtwbmFaQ3NPSVpuZkxjUWw3b1VQelBXWTNw?=
 =?utf-8?B?RXhkWWg0endBenFkOFNOV242b1dkeFpwWWY1cjBiZVI5d3duQ2FtTUhkT2Ra?=
 =?utf-8?B?RmxXNFJxUGVIa2RFT2dTT2J1NXFnOXNNbGh0RWtXNjBRcENLcmRKd2hJU0JV?=
 =?utf-8?B?QnNOZUh4dHJQK05PRERpdnVJckliOXpuNThLTkw1K1dXb1F0TDlWRW1IUzhJ?=
 =?utf-8?B?dy9rMURFYUpDWCtrcmFySnNqTWxUYTUxb2FYNHNINUNteE9kdzZlVDhHT3Vz?=
 =?utf-8?B?RGdobUJKZlBGR3ZsRVl1bG5HeFRucGdOV0FCRHgrR1NhWTVlV2pPbTV1V081?=
 =?utf-8?B?dlY5MXBBOFp2cmRnNTVlYVVIOTZyY2I0TE1BV0RBSUdNYXpEWWxFdzFPNnVi?=
 =?utf-8?B?b2pNdlorOUJDbENFV2hEVWd4WVZvNkhZdXVGQzdBbXgyVXM0ZmJVK2xhdnNP?=
 =?utf-8?B?OXNDeGRid0NjeWRyZUR6Qms4YkFtMjdIeE9QRzU0R3NURDV5VFVCcVIwaGts?=
 =?utf-8?B?VXJUYUtvMkduWFVTYUExN1lxVGM3YzUyTUp4dnZWMXRxb2s4K2xVbVdNTWxJ?=
 =?utf-8?B?dVlUbmMxeXFQMzQ1eFgreXlURjJ3VHV5VWVCQXJSdE9CUDJLazMxcTd1QTJJ?=
 =?utf-8?B?eEJvWkNaZThFR2ttZ3dGRUIyUUN4TUFIWDE1OVF3VkJkYWU4U255QTdsR0tU?=
 =?utf-8?B?M1ZoNHFJeWdiZHpKTlVpSXQ5VE5MZlZMOFBDNUxVSFBzQ1k5M0wwYzIyRCtN?=
 =?utf-8?B?WDZRaHRTWkI5ZEJxUHhPYWZIZE9TYzF4RTNsTjY3a3gzMWtpVlRjZGY1a3Zw?=
 =?utf-8?B?eFlLNGp4YzNNRERucHk1cUhYd2NNSEh1UWl1aU5sS1JmbVVrVVVIYlJhZzhh?=
 =?utf-8?B?RTc3Ynp1MU44UnlzZjJpRy8ybUR5SUl2SmE3SFh6TzdFTm5Gb21RdE5ycDd4?=
 =?utf-8?B?WmN2VWdhbkdJQTFiVldDWFZxL1RYMmZCMUJiWGgxYzNxTDB3UytrSzN1RWRV?=
 =?utf-8?B?ZURZeUk4RVAzQjhNemNXT0ExMUoybGYwV0NycVd6UmRMWkt2Q3BZWFJyVmhr?=
 =?utf-8?B?eC9scEJ2QXhSR3lFMitxYU9wUWl0Z0laNmZXTXNCblgxZ29ybzJVSmtBeVJv?=
 =?utf-8?B?YnFXS1l3bTFmQnBsUmdVSDQzaVVLZWY1emJManBHTjJ3NGZOblUzTzZpWU5r?=
 =?utf-8?B?MFlwbTJGaUFyeHJMK3ZjdkFjU20xY0NERkdlWWpXd1lVSkd6a1BYcU5lNXYz?=
 =?utf-8?B?cjNKcEhpc0NUUjZZUHpBdGlBKzNSNzNEWUozZFdCNUxkakI2SmwyWVFIU3c5?=
 =?utf-8?B?ZEFSOVQ3TmRzWVhFaGN4QlNEWVJXNWgxSVowNVM5ZmVyRmJTQjM2NzdNWHRO?=
 =?utf-8?B?elljZk1nTTR5bXNudFVmWWgzd3pJRGdhMTRaMnU2azVDR3NiRFVIWXo4UTJv?=
 =?utf-8?B?R2oyUktaaWpac3lFQlU5U21WdTVEWHdSVnEzam84cy81SzlKaGMvTGhhQlVp?=
 =?utf-8?B?NkpkQlMyWmt4UG5mY0RTeTlwRTF1T0hYVVR0RlZpNXZ2L29Cejk5V0dBZ3pY?=
 =?utf-8?B?WGhURy80eUdWdkRaT2E4RFIreHNLSjNRSEhTeDY3cVJRS3Z2N1dKRVBpQ0dt?=
 =?utf-8?B?eHNhRzR4OFJOQUlpZ0xzaGwwWmxSZUdiSlJjTVJlWm5LVnI2dXZJWlg5V25M?=
 =?utf-8?B?SWY3d2grZ1JDTHp0MjRKQlBiT2dNdVRmdEhRa3dESW4reDNHZC93dDhoNzhH?=
 =?utf-8?B?ZUVmYlUxalpCNnZtYjNCVDdCNUVXT0NTbE9aY29nSXdOczZLbGlhTG5tTndp?=
 =?utf-8?B?QS9ZN05PRFhKQUJxeHpmQy9RWG5jcVd5bVk4MWVKRk4zd0RWZk5YSElXWTRr?=
 =?utf-8?B?VzF2bS8rN2RHNnFPaGxGQ1BVSE9pdExYMnNwTjBCNGRqcWdXakcrUnBHcS83?=
 =?utf-8?B?dk5ubzUyZDIxRXZHVEltS1l0VzRNZkFWeDU5R09Xd0ppaDRNRVBnN2FQNUU4?=
 =?utf-8?B?cWdGQ3JJeHREdGpiM0tqQmpWaml6eWk5OEhvcXBJV1M1ZzhWbmJpT0tCL1Bo?=
 =?utf-8?B?ZEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3NnZHhSbzlXZHlQUDhoSzh4MlE3Qm9WeFdrSmp3b2RDYXdNNk9DMTZ4QWtm?=
 =?utf-8?B?YXdKZjF4dnNycmVjYTl1bnNlN0cxTjc0RHEwMmI2UUg4UXFrNGg0NDR3alI0?=
 =?utf-8?B?WTlPbUd6S0xMdTJ1Qy80aDZQSE1WT2ttdVFVbHBCbDZCVFo4NFhBUlF1b1JW?=
 =?utf-8?B?SlgzL1VQMVE2RVVFV0JOTUVaWGNTc2w1T2ZGWjhMNHplMjA5UDR6TjE1elBr?=
 =?utf-8?B?Rm0vM0F3ZTQ2TDFrcXpYOU5zN0hpOVRiMVlnbkFvQUorWDJhMVI3b0JuMW5v?=
 =?utf-8?B?YnFGTFF4eEc3WGc2ODZXWCtqNVpsb0FPcS9MNTVka3kzcjYvN3BxZmpydXZq?=
 =?utf-8?B?aXNlZXlWYXhYUVRJTGdoRnFqcVI4cS94WlQ4dUpGN0tHZ3ZaWkQ2Mmt0V2hG?=
 =?utf-8?B?b3dmdzRaZnpncHlIRGxGZm0wNURYNUJSU1dYelhJYi9Wc3NXckdvaXVCVEc1?=
 =?utf-8?B?b1pnbW5FSzd3Z1NNKyswcG5MZ3UxZ05abSs3STZJZjMrcS8wQzhHOEw1UEQ5?=
 =?utf-8?B?em9QTjBqSEdwN2JETzNwYlc1NjZFQnpKQldoNXFVUU81QjdiZnpkMXpSWVdx?=
 =?utf-8?B?dG43SHVEQUtTazJoZmxaTkZsa3ZYdkQ4Tlp5N3RpT3l1Q0IrQUxnbDh2YUdK?=
 =?utf-8?B?SUY1UUY2NTdCODV3a0ljdWtWUXNLbTF6UU04cHdzTVJQYUV1dldaRVJhT2RO?=
 =?utf-8?B?WUJPMk9jWFdzYklRV2taUXZLbGdncWJDRk82SW9jRDUySFFKSzVKb3QrVk5N?=
 =?utf-8?B?VkJ5K1JDcFhQc2VmM2VxMm1uUW5mT0JJVXZjTzhBcDluNUZXMlVCcXAzeTlU?=
 =?utf-8?B?T1R1TDdhK3NVT3h3bnBqZWhlRUdZdTFIc2U5QzRET0FzSTdtWlhReUpFSytm?=
 =?utf-8?B?a2pSSUl3bHpPcjRWVGQwZG9xUDBKRG9hOFRhOVIrZmhnU29EVmQwWW5sUXR3?=
 =?utf-8?B?VU41S29VV0M5UFBjTERieEhnYStnVEVQdk4vV3ZYYVEvU3RNK0hFOUZqd1ZX?=
 =?utf-8?B?QlRYdWhGWG5NSURLa1RONHkwZ3hqcFVFZzYzc3VQU1R1VzJHWFVZb2NBNVBO?=
 =?utf-8?B?QStZdGk5UWVvZ0RVOGRleXB5N2p1enZFRmVZdmovUXdJZytPVnFCM3kyYlpo?=
 =?utf-8?B?RXJrRjZmODM5YklJVWVLNEdLSVBRZVZqSnRWZWNiOHY0VGllM2tSZUlIQmp5?=
 =?utf-8?B?dWVMUzlENWZ5RmlWYU1GWHl3dm1MRk5lenNuUE1SM2NKUUZjZjh1eDcwUlhr?=
 =?utf-8?B?L3dWYjJoNFNCZnFnVHZDbWx2M25zY2xqR2xiUGpXb2VJSTh0K1ZwU0d0amRM?=
 =?utf-8?B?bDJWUGZZOUlQUVFlZmM4aGRxamRNSXFheTMzRGNqZUVWZHIyUEFGQmFMVkdu?=
 =?utf-8?B?NDl2Y1ZlNk40VGxsSlpXU3pwSFYzKzBHL21wdkw1eVRpTUJ2bGZJZ2I0NWg3?=
 =?utf-8?B?RTNNSnBRRWdtVU81MG1MWnIvYlVnMG41THl3Uk1DaGxaUEQyOEJmU3liejcw?=
 =?utf-8?B?RlJWZkFVc3Vpc3pkRHVYS2JYTWRRSDY5OEhpQ3hnUFljYkN5anBKTHFmRWI3?=
 =?utf-8?B?dkVLTU51Rk5xMHM3aXE1WGhWZEdQNXg0WUlqejNQaEV2K1dqUjlqUjJlYm5a?=
 =?utf-8?B?T0NiL2lPVzBRMlh6OWVrUkQ5eGlQY3N3N0lkeUZpa0dCNVdXWGpkSWhXV3Jp?=
 =?utf-8?B?SmxJVlN3bXZKV0JLcDJLRFF5SVJWQ0lxZXprRytLRDAwRkE2UGlBMjNhS29G?=
 =?utf-8?B?bzQvd3E2WS9pSWsxT3V2bHBKQU1WOW9wTGNTTU0yZFpJdFZnSXRINlIrdkNL?=
 =?utf-8?B?dTRBQWE5UFV2d0dUZk9Cb2VoMzRkQ0lua3BtUS9YSWwyZnNyN1JXNHVwaU5t?=
 =?utf-8?B?QUt4eFVMbjBkVkFlNWpUdjZIUnkzQ2tSL0R3UmNBNERaU0dCWDhMcGs4VHZR?=
 =?utf-8?B?bGkxTUgybnkvUm1lMWVsWGdQRWMwTmtDNlVtd1hJZ1ZpcWNaSUFETEN3V1hp?=
 =?utf-8?B?TUZoalJTLzV3d3NSakxWejNqcjZrWUlTbUd1L0JYTTNxT08vNUh6Q01KZnUv?=
 =?utf-8?B?ak1GdnJpQ1g2RUFTVE5SMVFvbnZlcnNrNkMrckJvejFQK1d2aEhPYUQxTWhV?=
 =?utf-8?B?YllSMzNsUUxEUUsvU1orZkovblhIbE9scTk5dGlTMTY2a3lZbFNDYzVkY25T?=
 =?utf-8?B?RnVuSytucVI4V2l1N2FTTnpBVldhek1GdTJKOWpUY1NaUEJtSVYwOEl4dHZR?=
 =?utf-8?B?dFhUR1VMa0NtVGZwZ3dQYlVOckowTlpOdFBkNHl0ZXFyQUdyaWhDK09yZzFG?=
 =?utf-8?B?R2U2UnRDd3pqUElvaUxHc0tJSkxqSGdUdWw3T3RLWWN4YTVSd015QmJtSGx2?=
 =?utf-8?Q?803Q45Glr5Os+zM0rNqNpBH7J5QHurFOt7wm3w2ZWj1Li?=
X-MS-Exchange-AntiSpam-MessageData-1: wlLgTbZ2Q24jvw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2913dc60-c812-4f0c-1284-08de6d321e19
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:05:15.5077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfcvfFyfOLGlQ+3+1QJDNyuwDimu/Nz2G3WYMTvHwoOlk3YI9maV8nMoBR0fJNbWTkG9SqtKVIID8vnQwbvUaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6832

Shifting a `Bounded` left or right changes the number of bits required
to represent the value. Add methods that perform the shift and return a
`Bounded` with the appropriately adjusted bit width.

These methods are particularly useful for bitfield extraction.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index fa81acbdc8c2..7014b5be66db 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -473,6 +473,48 @@ pub fn cast<U>(self) -> Bounded<U, N>
         // `N` bits, and with the same signedness.
         unsafe { Bounded::__new(value) }
     }
+
+    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N - SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 16>::new::<0xff00>();
+    /// let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff);
+    /// ```
+    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES >= N - SHIFT) }
+
+        // SAFETY: We shift the value right by `SHIFT`, reducing the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES >= N - SHIFT`.
+        unsafe { Bounded::__new(self.0 >> SHIFT) }
+    }
+
+    /// Left-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N + SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 8>::new::<0xff>();
+    /// let v_shifted: Bounded::<u32, 16> = v.shl::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff00);
+    /// ```
+    pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES >= N + SHIFT) }
+
+        // SAFETY: We shift the value left by `SHIFT`, augmenting the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES >= N + SHIFT`.
+        unsafe { Bounded::__new(self.0 << SHIFT) }
+    }
 }
 
 impl<T, const N: u32> Deref for Bounded<T, N>

-- 
2.53.0

