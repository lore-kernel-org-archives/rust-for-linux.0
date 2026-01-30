Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F55D515;
	Fri, 30 Jan 2026 06:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769756122; cv=fail; b=SputN+jStiMPzWPeLdxXxlaV8e4REbVnXFjPGqgKjVKsLC6hBIOVS7CrjlYvzi1JCpKv83iH+trZ6K/3ht86a29kdupkI+iotzhI7LikNCKi3BXVND4fvwK11lXypeep5jjOuCr8UTQ97oZUI78U11j2myY9haeZ2j6JhdLQIBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769756122; c=relaxed/simple;
	bh=ImMinEU9qLn19uawK4ahZGZhlQNrwByVc1d0NEcVmKo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=RlmyHX/AjexQD0tUnU1HyT7+YREFEBFxc51YuZeGodGQtYSV7nL4e/oANnfMYtHQsz0b5yCwKrNOk3kYKf9tcWe2l87bRoR5VG9AiLcv3dX6rq1y4LjfjHCPTTpLrQLklFscx9qBmMsYVruZn4iq+YzRVr4kIlywC9Le1jpCoLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tk+f1G/0; arc=fail smtp.client-ip=52.101.52.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tk+f1G/0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etzOxRlwkDUgrPho8xDEeFPaH926Hfo5x0eVbitYyEqcRpW7Emb6rm9uCB6cTgnoWaCWvRLwdx5l1LGpUN1XEJJUCJ/p33FIGVw/AJ0eUwUSp+8+zC+nuPNyjHRuiVWh9ciV3+6Qs3IDKA/FUQ7n9uQTl8CWIZrUx6PFAIaE2SZ1LOJ/0EPQUegUicpzaoWC+4gfV4XTI2owI8QGFWvcoV5htJlbqBHb84CRaqOLd1vzLlNhqsLvkmROa0fnHR6sqbIqsCl+S3FXc0V9D3867YhXfj4emg6oOCv5nmU+c9edNWkJg4RrF6t2X8R3tF3ePVbiglojZ6pZd/7+8MLg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eui1z3QBs5X/TSvVrOCVxqKDSuT/uspaie0xF3IoENY=;
 b=r/6p1ooRkMZ2xP15qr5Ih1qDLy3vGc5w7c5lozu6+mL66Joep0Mcf4Sh7gaaXZz/Jlnsl4DRv1RX0vUz/7rMgfnaTjgfmeN10zH72s+J49+O38BpCcTMvqfu1VotZmNy7GzzklfKSjjHpRsjrPHXzKS9gP69GUOzmjEUMl4RM6wWx/3CkxWNQcqwm+6CC/G0JwjugpkDe1hWVGEO7HT0FE0gQQs930YOrkR966ldlzUvlaDOvseFS+S5sWFTi3AhJHjAgIrnLBPa5bO0BqSDOHMk+YklNZRum5YPCnymi6E2es1pMArxNXJievExfydxgFAL+BAUmJ8kLCtt0D6EIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eui1z3QBs5X/TSvVrOCVxqKDSuT/uspaie0xF3IoENY=;
 b=Tk+f1G/08F4dkIdlk9Om6rT+S7R8UogSUbLTe+d3eUM3fXadkHCBDojGo/wx+9Pciy3UI2Fs7u+oTS+cE6XrI5TmazEiyg9FK3h/zK21QnIAJV/9AVsxz0tq+YHJRpLNVuGafMIuJbWZXMgSL96xX/axHNBnFxzxhdhdTeJkexRAkNQXQoPN08XKiRKXtZnF0F6eKzZEPEzHSgDrKFsqajevu8JJxJzrazvBZX1idi8wrbe071buJIPyZvDK0QtnXftyEx20TzHwouSKs6c0vNfC/rZkY0JWaj7LdNe1sjLWDXlRukIBp5wzynE4d8gJbopLUKeXXiCoYcsr7nKGmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by IA0PR12MB7580.namprd12.prod.outlook.com (2603:10b6:208:43b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 06:55:15 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%5]) with mapi id 15.20.9564.008; Fri, 30 Jan 2026
 06:55:09 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 15:55:03 +0900
Message-Id: <DG1Q6I5CTD87.RYS7QBJCHZ7T@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Content-Transfer-Encoding: quoted-printable
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-5-aee3a33d9649@nvidia.com>
 <DG0CVJN57L5F.2I6J4RXMJOGQ@garyguo.net>
 <DG0WY7S2QPQM.37S6PROC464QI@nvidia.com>
 <DG14TFQG2C13.2BFREQR1DV4I@garyguo.net>
In-Reply-To: <DG14TFQG2C13.2BFREQR1DV4I@garyguo.net>
X-ClientProxiedBy: OSTPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:604:21b::20) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|IA0PR12MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b04390-2eef-43c1-5881-08de5fcc80f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFRLM0U0S0RjWUZvSTJqOEhibHJyRngvRitGTVN6cThobzdkNUppcHZnclVR?=
 =?utf-8?B?TlBGZkhtTFN2NkE2UTNiTDZlR043cXI2NzFweTFQZ3E4TTVNbm1iTS9mSW44?=
 =?utf-8?B?RmY1MlQ5ZXBybHduclFsblN2SGRuSlVkNXNzZHZNd0JTWXQ5SEptTUdud3VY?=
 =?utf-8?B?amhKVGNFV2k3R1B0L3JJTlhHTkF0V1dGVzJhY1hLbGlxRWkwV3FyZkR6eXZj?=
 =?utf-8?B?VzNPODAyQmlaU2l2dkZKTjk5bks1alJWSFBiRU9FdTdLRHI2VDhuZVRUOVhh?=
 =?utf-8?B?VjhMNDc1VlpZYUVOVk94cGVGb012cjNiVEZWSFpYSHoyZ1FwYnlJV0lFWDFC?=
 =?utf-8?B?UGxuNnVyN3Q5Tk1UNXBqT0w0U1psQTBLbXBMRTRBd2p1Rk54WWlmamQvYUhC?=
 =?utf-8?B?ODJuMXcvM2FlYzUrSFRNcWFkRG44TXQxV044ZVRieUZndGx0eTVmOXNsY0po?=
 =?utf-8?B?NGFKOTRWVitHLzhjbDNWY2pEcEpYQkJrN0M4RVlnREowbzZXTGVHellCMXV2?=
 =?utf-8?B?bXNFQzFoQWhyTGR3S1F2K2ErQ0Znb0MzOEphKzBVVW85ZktQcndIQXltREp6?=
 =?utf-8?B?S1d0ZlNXcG9NTSt5bzlKVW1xTHdsejdydW00REVmd1ljSUxlbnNqYTh0dDBS?=
 =?utf-8?B?L2lHMWJTL2xDSkpqYlJnT1FvOWtaamRyMTNFZ1BFUm9jMm51UEZHV0U2WVZF?=
 =?utf-8?B?aWFhekhObWFFbE0xR0VyVHRYdnNyMXl4eVczSzJBN1dMRjZqMUs5S1FPTzFx?=
 =?utf-8?B?a1gwUzFKeXBQdDFwaHZ0VXg1cW83SitjWDM2aG5WTStnWUlIdzJtelBWRzVm?=
 =?utf-8?B?NUFlSk5ZeHAyZXU4YWhkTlhIVUg2bGVaTHlYQjRUL1hwSjd4RDk3Um1qZG9z?=
 =?utf-8?B?REZvbnIvVTZIT0kzS3Q4UGlrNlpHZk5VV0pJMC8zQzFUd2lzTmZNeDlJR2gr?=
 =?utf-8?B?NWhEbVlDb2ZjY3hBRjZndDg2aHZycEYzanFKQkw1b1VzbFRmUUxlcHdOTk9X?=
 =?utf-8?B?MFNESU5uZHA2cHRxNlE0TGlSakV1cDJzTGNROTVCU3NiMDZmeHl3SVJCMHR1?=
 =?utf-8?B?REg4Vk9UQzZSQVQ1bXYwdlhNNGx1dDlWTkxqWjNmTE11eHVKM3ZiN2Y0WDY1?=
 =?utf-8?B?L25odUJyNTlyMEE1V2syalBqSXBqK3JpMzRiOEVjeFlubWN2Mjg0aVdxcHM0?=
 =?utf-8?B?ai9aTTBBTmlRTlR5aEU2aGZPYkJaVjR4OStwQXdXMTZNbWZDWGVaRXRpdWpB?=
 =?utf-8?B?eGtFS2UxdnhtMjlpcEZWTVVRdW5zWDloQnl5VUJSL2QyM1VXdVF5SGRadXRD?=
 =?utf-8?B?VVk1MkhWZWtaV1lOZXM5RkQvdE1zUGZzRzZGQkE0WUFPUkRIS1VMMDJTNW9y?=
 =?utf-8?B?dHNMd09UZEQ3dUcvN1BRTlloV0VkQmxHNG8vUmtTeURBKzJyaVdSZVhyZ1Nx?=
 =?utf-8?B?WmloMURwN3pReUQrV3N2RnVubTh2Q2lFRWFNV21mTFM1L0NvVVBiYlBMZEZy?=
 =?utf-8?B?ZmlNSDU5VWk2SHdLNmliemo1Z2hUbDk5THkxc2lnVitjZStCNHVXbFQ5b3ZQ?=
 =?utf-8?B?eEFESFYxcE9iNlFQN0EzSUpyTCtoL2tjc1Z0bEVLVXhYUUZGZllMWTQ1bGRn?=
 =?utf-8?B?eW1wVnp1alBmUnlsQmllVkgvb1JZTnpZZDhwTTlUT1NzMTAzN2F3U3FmSzc2?=
 =?utf-8?B?TjcxdnVVdStKaTBCMzVPTmhhQithUjJYSmdYVVlDZzdNcTgvc3c3bXllTXJp?=
 =?utf-8?B?L1pjUzFtRkQ2eFhEWDVLMzBkSEhHQUNkRDcrY0FhMERMNmQydlBZeHVUSTJ6?=
 =?utf-8?B?dGkvL21tdzhoVmxVS25RYXprRDNiQnpnK2hXM2syaFBtN01YTDhnSDhhSDZa?=
 =?utf-8?B?OENvSWJieEFNMzh1bXQ4TTg1V1hPTDRBcHhmZ1QrOUNwdnRaVFZaTEp3K0Fh?=
 =?utf-8?B?ZmY2dzdJaC9XamkwRzJKM2FKdnNyY0tYZUhIVm10SzR1SkgvOFlPZXVQaUJN?=
 =?utf-8?B?RUlQay9ua0VZSGU2R21IR2w5T2Zqc2p6ZE4xR2cvd2hOV3FTQmlwMDhMWU5H?=
 =?utf-8?B?VzF3S3lsQTJWRFFYRHc4OTE4Rys2TU1DQlB3dGFMVWJRL1ZlZUV6cktjdnhZ?=
 =?utf-8?Q?YcjI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWJnQ2NiWnJmT2J5RkFQSjNSeGhPQW53WHNOUTJZTU96SkVWSzgxb0hVYXgx?=
 =?utf-8?B?ZThKOEdMK1NzRTBxZ2hNbkdjSjVDaHdSYWdTRTZSZVpCRHd1cVIxbmJnaUlT?=
 =?utf-8?B?N05nLzFzOFVIZWVTem90SG9xVXBLdndUbzZ0RWp5K1ZJWTFxSVBRblFUcTNO?=
 =?utf-8?B?WUZtM0JOUmtid0xDdEN6djQvZWlsek1tdW9OZklQVXc0cFJVQ1pEd1Z5RWRB?=
 =?utf-8?B?TUk2dm9ITjVsT2p6VGVKU2JQTE10bmtqWm14TzdIZHJrQk1EMXZxN2g0aTN5?=
 =?utf-8?B?OUNkdWJCT0VNMnE2cEswbTg0SjdaaktXbGZHV0Z5YlNqRVZ1N25CVnJZUzJE?=
 =?utf-8?B?Lzc4cm5LQVAxQ3FoQTBDVWEyVWN1NnM0c3RmeDg1Y2ljSzVCNzg0ZjNWWjYr?=
 =?utf-8?B?M1F6aHl3U1pqelpTb3U5UnpxSGduQW15djJjd040RzBzaytDYUxkekt5Qkg4?=
 =?utf-8?B?YWo5QXZsMENRVGJCamY4Mnh2WmdmcVlIeU9BUkdzR1k2QVlxRVlvYXBsUEpV?=
 =?utf-8?B?UHRjL3dVWEJzRnp1T1ZFWXBqL3M0SmJGamRpdDhuVTVEVCs3aWxuUk9mSjdl?=
 =?utf-8?B?dUdUSlRnSkREVnd4eVg5NEVCY09HZVozaFdXeXFJcXB4K3h3VE9KTzhZKzF5?=
 =?utf-8?B?OW9JK2o0N0piUFhheXAwTlQ5akJrckNwUW9KMkc0ZXZDanlrT1BZSmlKN3Y2?=
 =?utf-8?B?dTdrblM3UVBpQjNVd0JZQUg2YnpMV2FGeDIzSk0vZTdISlV0WVRqT0dnODdn?=
 =?utf-8?B?RzFBSi9BMzJOK3l5NytmNTNWYlFkRFFJZUlic2FDUFdPaGFzVWVjemRNMFJJ?=
 =?utf-8?B?V3QvTkMwa1V4ZDFuT1NCbnhpRk5zNGxsaGZCL21nbUFCUXVMQkQ3Y1hGVTVS?=
 =?utf-8?B?VGNzc1RLOGhKbWd1VkxmKzh1YmwrM2R0ZnJKQnVYWGhESUhhYVIyd3V6c2NY?=
 =?utf-8?B?VC9MYjlKRGxRRjVBQWx1ZTh2SitvN3pQdlpSanQwZktpaGFtb1pEejB2TGFE?=
 =?utf-8?B?NWs1OENUaWRCM1NkcTNVeTRkZXNkbW01czI0NlNtbEpTaEZjODBPV0lKejA3?=
 =?utf-8?B?eXd3MzJNMGNOdEh3N0hXZ0lva3RlTFk2RWlzWnNYblJ5TGwrUkdZdnE0bXFk?=
 =?utf-8?B?ZkhIbXduWm56L1lJeW9DalFIWVBkTjB2OWJtc3lGZVVGYVltekxnZEFzQ1Jj?=
 =?utf-8?B?V2lWcWhkZkdYdlF6SEpYMEh3U2ZlWWNMblBJRzRIQkhtb1l3RVVkTzI2VnlU?=
 =?utf-8?B?Vmlyd05zTmEycUpuUHdyRVpWR3hHRWk4eGRJSDBlWkxnWDg1UE9URk5ERXdh?=
 =?utf-8?B?MjlPOXpOWVZVQnFGVEVWZno5NE9naE84NmRHQzdQcGlIc2xxTmFGdFd1dnRM?=
 =?utf-8?B?eXhkSXJmODh6SVlxSjkvaW0raDJ2MDVhL2tMNVVkdmVtRTl6bFBwVmtXYVM0?=
 =?utf-8?B?dWJiY3ZRdnRlSUMvVUcvVGhkdTBMMEZhdG82VW5pYTRrS2ZaQjk3Rk1uNUh0?=
 =?utf-8?B?MC95Nkw2RzdFNklsVXZvQjRJMFMxbkVUYTJVdURlanZyaDZYdHM0Tk1IblE4?=
 =?utf-8?B?Z2VMS0pKWHd3aDBZRkdad2J2STNLNXZOc1hKOUE4Y3VubUFMbXpWTE05SXhH?=
 =?utf-8?B?Y0dtVFZiWjhkampaalBPbTFpUGxzOEdyL2JwVVBybWNhWUh2MzFLQUlCczFz?=
 =?utf-8?B?YitqcWpRQlMxVlJudGx5QzFncHJsVEdTNjhlUzg3aHdyelRzZHpManNnWGVY?=
 =?utf-8?B?R09tZnMvWjh6NlpXd0hNQjlNbm11Q1BRZ3RrdnBLbzFoMzZDZ0I2U2lNYmdq?=
 =?utf-8?B?R2hlQW9YWVVxUnFzVmxOQ2ovRHY4T2tBMWIxanVUZ2pJVFVQdFBiS1crMDlv?=
 =?utf-8?B?NFNZSEgrN3hDeUFrSDd6b1FMWGZEYXhmMjNyei9IcU16MExwcm1aUjR6RUEw?=
 =?utf-8?B?MG1RTEtHOVJxVlhvdSt4TmxpQkN1eGt3RmJBcmpnR21ST2VnVlpmSlNmaWxi?=
 =?utf-8?B?UlRZR0NzdXA3NUJHVE5YSk5VczdCK3QvTGhrU2dPZ2paNVlNaG1QQXI0YTJp?=
 =?utf-8?B?YU9tMHczanpoZEpWZWkzNy8zeFBQVjYxd1N1Vy90WmlJSzNKRktsSTRkblV2?=
 =?utf-8?B?TmZMdDIzZ0Faa1o1cFlCTi9wK09abnlpdGR4ajVFWWt1MkZ0UzZUT25vNXFY?=
 =?utf-8?B?bUw1VkhiRjNhc0dtLzBET3ZNY2p1S1NNRzlMZnR0KytwRkxJWnJaODUwemd6?=
 =?utf-8?B?WXQvWERqd2NsQ3g3ZDJZZG1sVGsrUWVMTnlOM3Zyd3g0bmZ5dU5uQnM5TWlm?=
 =?utf-8?B?SjQ3aWJjcXdONTVnZm4xV1lVV2F4bXJ5Nktic1dlVGtXd0x1UHJabGM0VU9y?=
 =?utf-8?Q?NO6xOZEcOFsfQPheUbeX1u85q5FIkfDpSih9CSLZl+RAU?=
X-MS-Exchange-AntiSpam-MessageData-1: sA0nL4lLLCHXhQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b04390-2eef-43c1-5881-08de5fcc80f1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 06:55:09.2536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0K3OvO5AlZgmqppJQ3WFYSoNaSfmhsWWW6CHWMtqBYu+TyU8+jJYtAVZrczOW5FGjFGIgbr8woQIpgctdeKlkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7580

On Thu Jan 29, 2026 at 11:10 PM JST, Gary Guo wrote:
> On Thu Jan 29, 2026 at 8:00 AM GMT, Alexandre Courbot wrote:
>> On Thu Jan 29, 2026 at 1:16 AM JST, Gary Guo wrote:
>>> On Wed Jan 28, 2026 at 2:37 AM GMT, Alexandre Courbot wrote:
>>>> Add a macro for defining hardware register types with I/O accessors.
>>>>
>>>> Each register field is represented as a `Bounded` of the appropriate b=
it
>>>> width, ensuring field values are never silently truncated.
>>>>
>>>> Fields can optionally be converted to/from custom types, either fallib=
ly
>>>> or infallibly.
>>>>
>>>> The address of registers can be direct, relative, or indexed, supporti=
ng
>>>> most of the patterns in which registers are arranged.
>>>>
>>>> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>> ---
>>>>  rust/kernel/io.rs          |    1 +
>>>>  rust/kernel/io/register.rs | 1287 +++++++++++++++++++++++++++++++++++=
+++++++++
>>>>  2 files changed, 1288 insertions(+)
>>>>
>>>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>>>> index 056a3ec71647..112f43ecbf88 100644
>>>> --- a/rust/kernel/io.rs
>>>> +++ b/rust/kernel/io.rs
>>>> @@ -11,6 +11,7 @@
>>>> =20
>>>>  pub mod mem;
>>>>  pub mod poll;
>>>> +pub mod register;
>>>>  pub mod resource;
>>>> =20
>>>>  pub use resource::Resource;
>>>> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
>>>> new file mode 100644
>>>> index 000000000000..fc85dcd1f09a
>>>> --- /dev/null
>>>> +++ b/rust/kernel/io/register.rs
>>>> @@ -0,0 +1,1287 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +//! A macro to define register layout and accessors.
>>>> +//!
>>>> +//! A single register typically includes several fields, which are ac=
cessed through a combination
>>>> +//! of bit-shift and mask operations that introduce a class of potent=
ial mistakes, notably because
>>>> +//! not all possible field values are necessarily valid.
>>>> +//!
>>>> +//! The [`register!`] macro in this module provides an intuitive and =
readable syntax for defining a
>>>> +//! dedicated type for each register. Each such type comes with its o=
wn field accessors that can
>>>> +//! return an error if a field's value is invalid.
>>>> +//!
>>>> +//! [`register!`]: kernel::register!
>>>> +
>>>> +use core::ops::Deref;
>>>> +
>>>> +use crate::io::{
>>>> +    IoCapable,
>>>> +    IoKnownSize, //
>>>> +};
>>>> +
>>>> +/// Trait providing a base address to be added to the offset of a rel=
ative register to obtain
>>>> +/// its actual offset.
>>>> +///
>>>> +/// The `T` generic argument is used to distinguish which base to use=
, in case a type provides
>>>> +/// several bases. It is given to the `register!` macro to restrict t=
he use of the register to
>>>> +/// implementors of this particular variant.
>>>> +pub trait RegisterBase<T> {
>>>> +    /// Base address to which register offsets are added.
>>>> +    const BASE: usize;
>>>> +}
>>>> +
>>>> +/// Trait providing I/O read/write operations for register storage ty=
pes.
>>>> +///
>>>> +/// This trait is implemented for all integer types on which I/O can =
be performed, allowing the
>>>> +/// `register!` macro to generate appropriate I/O accessor methods ba=
sed on the register's storage
>>>> +/// type.
>>>> +pub trait RegisterIo: Sized {
>>>
>>> Is this trait intended for public usage or just internal detail of `reg=
ister!()`
>>> macro?
>>>
>>> If it's the former, then we should probably just put the method into `I=
oCapable`
>>> and allow generic-read in Io. If it's the latter, let's `#[doc(hidden)]=
` this so
>>> it won't get abused.
>>
>> It is an internal detail of `register!()` and not supposed to be used by=
 anyone
>> else.
>>
>>>
>>>> +    /// Read a value from the given offset in the I/O region.
>>>> +    fn read<T, I>(io: &T, offset: usize) -> Self
>>>> +    where
>>>> +        T: Deref<Target =3D I>,
>>>> +        I: IoKnownSize + IoCapable<Self>;
>>>
>>> I think generally `Deref` bound shouldn't be exposed to user. What smar=
t
>>> pointers are involved here, and can we implement forwarding impls of `I=
o`?
>>
>> Removing the requirement for `Deref` in the `RegisterIo` trait is simple=
 - we
>> can just call `Deref` in the register IO accessors.
>
> The issue with `Deref` bound here is that now you *require* a level of
> indirection. If something implements `Io` directly, you cannot use it wit=
h the
> method. While `&Bar` is accepted, `&Mmio` is not because `Mmio` is a dire=
ct
> implementor of `Io` and not deref to it.
>
> A `Deref` bound also does not help if, say, a type is `Arc<Bar>` which ne=
eds two
> level of dereffing before it is Io. For consistency I think it's best to =
avoid
> `Deref` call all together

Do you mean that `Bar` should implement `Io`, `IoKnownSize`, and all the
required `IoCapable`s? That's a lot of boilerplate I'm afraid, and that
would need to be repeated for all other I/O proxy types.

No, I'm starting to believe that the fundamental issue is that the
register interface does its I/O backwards, and that design issue is only
exacerbated by the recent I/O redesign. I.e. instead of doing

  regs::NV_PMC_BOOT_0::read(bar);

We should really do

  bar.read_reg::<regs::NV_PMC_BOOT_0>();

Because that way we can use deref coercion.

That's quite a big redesign though, which means I don't believe
`register!` can make it this cycle... I'll give it a try though.

<snip>
>>>> +        $vis struct $name($storage);
>>>> +
>>>> +        #[allow(dead_code)]
>>>> +        impl $name {
>>>> +            /// Creates a bitfield from a raw value.
>>>> +            $vis const fn from_raw(value: $storage) -> Self {
>>>> +                Self(value)
>>>> +            }
>>>> +
>>>> +            /// Creates a zeroed bitfield value.
>>>> +            ///
>>>> +            /// This is a const alternative to the `Zeroable::zeroed(=
)` trait method.
>>>> +            $vis const fn zeroed() -> Self {
>>>> +                Self(0)
>>>> +            }
>>>
>>> All types that impl `Zeroable` automatically have the `::zeroed()` fn p=
rovided
>>> via the trait.
>>
>> Yes, but that method from the trait cannot be used in const context, and
>> `zeroed` is the starting point for building register values from scratch=
 (and
>> thus constant values).
>
> `pin_init:::zeroed()` is a const function.

Ah, I thought about using `Zeroable::zeroed()` at first, but indeed we
can use the function instead.

Strangely though, I expected to be able to do

  const V: BOOT_0 =3D pin_init::zeroed()

and have the compiler infer the generic type, but for some reason I have
to specify it explicitly:

  const V: BOOT_0 =3D pin_init::zeroed::<BOOT_0>()

Not a big deal, but a const method would reduce this to=20

  const V: BOOT_0 =3D BOOT_0::zeroed()

(for variables `let v: BOOT_0 =3D pin_init::zeroed()` works fine.)
