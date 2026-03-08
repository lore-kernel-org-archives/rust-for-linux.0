Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013015.outbound.protection.outlook.com [40.93.196.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFAE218AB9;
	Sun,  8 Mar 2026 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772969735; cv=fail; b=YnTl8M+GkTp2qzg7MWb/GHab+MTa2TK1dFgZZwL8aOoXCE8PU9J6rJWhCJktLUQoSiwANOO+kvud0qmj5vENbOYTWHg90dMCtGh+/3RMWVBSjMr3jRq+vN4w0y4Nz2ier+bTUSkpSdgDnD5qnuAPBsZA6YKlS+6ZMLzKMO39EaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772969735; c=relaxed/simple;
	bh=Jm5uUM+RohjuYXl9fnQyr0H0i5wJaq6gHGA45MTvwRs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=f8DxBIjmRDKKYK2Efx3S/JPAMf50XmM5Ud8eKOci8lyXQY9Y38QaEn8dPkcvA0EZpeSO/MKA/i3vnW5Ln1y2hTkYG5+PC5ad+Jv3XPrBQbZl8t3JuqdK4CO3kYoLS7QrfDnR60nzJeRArKgrru681hhKoqURGiPudyoX/yTVe/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GJAuv0ny; arc=fail smtp.client-ip=40.93.196.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GJAuv0ny"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/xFDyplL4fJQoNQkge7yp0zQiRl7Rj2UGwobCYZ4zfveCPGPWxhLD42TsFarou89Mv+ErRqgD9LVIQEayyMxCp+fjFvR8OsBnJK23r6FSS8f6S1F2W/OH1gkSbLNEBYmInkzLRfrhHRCcbEM0UGGYOUkNt22X3Fx59mXw0wfaxnx26BpuA6K57DkChDR5lQRYB/hjMNYS1W6wV+rO35PDgbNa1J4GqtJyNIuornRkG2QbQg+c75BZR4XmBN2uAT8+S5D5SLk9dqW77WzVwNnCj2pMagqvlHSaoOjndzT537Mes0B6kLyTZNyF5EcHEYoh541yeOQt6Tyw9uGKMjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Opzf4wzMx1KPyAP+hMYcPkYi8xtCU5euWBLho20f2Ac=;
 b=nvGcXVY3c+SDZE2tJWWKY1GkzKvXLeiudLWcaFmlRMOi7sJwfXaQMp2DAz19Gv/LUvsZnryuGl3q7JQLHb7je9CTl/a5nSRDPxJRyoikojfLIZ3km+TOlnNSAOrVDYIAz57PxokXrWSywGNQNippDqmM4SIjOC20OOnzLUCA9mo+9gT5nhyPq3wpG6WA9PxustZadbVdZ5AFako1qa7WpnpjKDuNYqG8Pp5gxSOlbBGIhngCWHoKDFWXaurJw1++vRjxxtyDgFWdE7D4Ynn/xWgIcbcxCWhfk9y68WxE3NYCAcS3iCf8mGDRp7xbiRlnN/Fg7p2VPfHVqhomWxh6Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Opzf4wzMx1KPyAP+hMYcPkYi8xtCU5euWBLho20f2Ac=;
 b=GJAuv0nyeicwMp0bHUCzOVWy90HJwLgGAM+eN9cS/rouOIZL7Jr3C0rSnSx67pxBWXqnB8YucDbZP4OSrhB3Kst1lLikF77P74eb2+3IAmh2csJoLbA2B7dsiNUztzLGazW+dinYfbBR9h8pg5y/eY1vqYtjCd/U6Y92FMFmdoCXlGWB2sUSfEQ/yJ7M/z0RYD3iDrddfoG2fOxltYlzmmqde68aSbP8j2xUEBRgMZpy4+NXrAayPhsji6hAIE5rcHVO9HiNgI7eOcfZuZVdJNxHzbIaN8Ka433PIWR5LgaxpoL9NEXoqPSxeM89ErwUKDvH37fdfc83K82A4J34/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Sun, 8 Mar
 2026 11:35:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 11:35:29 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Mar 2026 20:35:25 +0900
Message-Id: <DGXDBBKLLZI8.PRJEPX57CGFQ@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Content-Transfer-Encoding: quoted-printable
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
 <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
 <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
 <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
 <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
 <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
 <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>
 <DGVGGGBSC9PI.1TJV2ZAIML0BI@nvidia.com>
 <DGVMXCZGEWV9.41R0TPTD22S1@garyguo.net>
 <DGVNJ8ANGP3Q.1RAGWU2HJGRIB@nvidia.com>
 <DGVO2O009306.GNU06PZ13VA6@garyguo.net>
 <DGVPNC2HE0JB.1HOBJZX8L8XMQ@nvidia.com>
 <DGVQAUVL2SZZ.2TINCJXUIDTCK@garyguo.net>
 <DGVRU6S7WUIU.1OL2CZU2ZUIUO@nvidia.com>
 <DGVT62XLP0MZ.YVAQQ5APE9S6@garyguo.net>
 <DGW40MO7G2B1.27TW3629TLBOD@nvidia.com>
 <DGWUWSDMLCTQ.1675OOTK845MA@garyguo.net>
In-Reply-To: <DGWUWSDMLCTQ.1675OOTK845MA@garyguo.net>
X-ClientProxiedBy: TYCP301CA0040.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb23b22-b19b-4a24-831f-08de7d06ccaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	MHnBye+IZKfnHZIOwLB2BivbLkFzj2YiTiQLIxnlPjdl9KY+h3M6M9Tp7euBEeSKyUh+3cDRzqb0Jj2akeIcr1EYBf6ZESrdAQIYG4NlwBY5a0GxxQuALTcEzl+NqTALvbdlFAtJpHzxuZeypWubuzWT3lwMAndfuq/5eWr5wPWxse/V038FHuOjFjogQ1On8KGt58UvO6e/9qIIaUacXiLgeZdsnkKnNppAEkkpdKSMdSz4kZ3wJ1X3hlQBE7pJ7sOl31Cd2owFg0fYpGz9ZYUQ+PpEG0aL2odsVUzqOXJQVOcN/K4enVKlCkqNTOmmi8ayKJ61PnVFz3ATvugG33f7XDgTOZllPQKh8L9MXAeRAC8rkGtUgSMQI+hTq4Eze6KHQsL8EA+AsrUJmoSZL+ixxQtbRYLYz20CRSpoO7NtrIMSMShGk0pPmQiyKc2b8zpgAR3ZZLINXt1UOb01FZhE9bQKvCnea8inm1oSAgMswFCbOARVT8ioRr5k0uF7z8o7XoW/Oy5nJwSteZMkpbTQYAEaVAx/jva/37xXFk0LgjuynCvXR1Qom2MkdXYUEqlCCDlTaSYpe+/uhkxcF1+s0DYZALE6dg6x6gA11wiNuEXaBtsIMWDbgITX0BnQqisTPJ/2cJL0h/yeMZGqo5rQ8gzcNHOssYqba5Dc99W+TMwlSxRRQiYJ9je8NVEB7nN/sy1EHHWPeXwno05AGqynMLZJBi9YYDNfJmUIKPQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VC93UnFRUkpTL2FBT0prY1RRdFV6NGhXZGRtQXJiWllMK1hIL2o0ekxNV3lL?=
 =?utf-8?B?ZXpSK2p1aHhoQzh6Slk3aVpkTFYxU0VqcThWK2IzZ2JhdzRnZ0xiOWZTbWJF?=
 =?utf-8?B?MkFZdUpteGVDazlvSkM2K0xyRlYwY3plMm9zNS9HdVRwRFBQeG1wZHorRmU5?=
 =?utf-8?B?Z1ZOdnhqVnpNYVJoODliQlhIblgrUGJBRVFGK043MlpWQmdYQjdIek5IV2RW?=
 =?utf-8?B?QVU3bldLL3JzejlQNVVvbEkzcnRONmR6Z0E4WXhuS2c2RjBuemxiaTBZbG1m?=
 =?utf-8?B?QWg1djVjWE0xc1Zra290NjdhajRyajVkeDJVc0pINlZwU0RELytreDRtZEM0?=
 =?utf-8?B?VDVZdW93bFFLTTc3NUdqWWpPaTJCT2NwcVFOcmpkWS9Vc3ZKR21yUnlaNnpB?=
 =?utf-8?B?OUNKV1pXQUhtd3NxYTRPRmV4WmJ4QkVYOG9UQlZENEZ5NGtLUUN5M2g3RG83?=
 =?utf-8?B?ejlCMkwwRzl6SkNVMGpIVHIzSjI0RVorVkk3Uk5HYXk2SFNIU2hNSU9Fa2Fw?=
 =?utf-8?B?d3JQWnBTRWFFYVZQcDRCRHk1amFtOTVZMTdIenMxdnIyV0FzdXRDbzRrMVpx?=
 =?utf-8?B?VTN4MDg3RnB2Y3RNd3p5RHNoYW5vNDMyTVZKbG9maTBzMkRNOElRTmdJTDFy?=
 =?utf-8?B?Vmg5YkhwZVhaWmVzU2svTTk5WlV3M0xYOG5tVnBSdE5WUXM3c3BBWHlYZTV4?=
 =?utf-8?B?S0taMkpHZ2hGRmE0RmUrSWtTNTVONElwNk9obWhnNnNXeGg4dHZRNExQOUxq?=
 =?utf-8?B?WDI2YnhueTZiaXNwSjRUa1FNU00yd1VqVTc5dzYvTjFSSWMyMy96ckY0VHAv?=
 =?utf-8?B?UVR2dFBkbDBKSEJoY2lhczUzMjl5MWdJeGozSFZYS2F0VWJjak9QNTZXdHpt?=
 =?utf-8?B?RnNiWHVwYlRZb0YrRjlpY0tmNHAzZWkrd3d6RjdGVzVvclVqSUJmc0JrbS9r?=
 =?utf-8?B?Wmd0aFBpYTJlK0hpVnAxa01yRGJ6a3djdEVtTUsxQllScGJmMFJOOWplMy9Q?=
 =?utf-8?B?YWppbklQV1JwRUpSUDlZaVVhd1cza0JOd0t4WjBMZGFiOTZmekltYytGSWFS?=
 =?utf-8?B?OHYybFJMQzQwQUNmOUYxRW5xcVQwZGhxNitKdjZPUmNlbjFZTkQ0NzZsZG9J?=
 =?utf-8?B?dWR0cTlWRGZxSllHUTZEdXNGYTlkN21hUkh4ZDB2QzJya09xQXMybVJOYmsv?=
 =?utf-8?B?MUZtbDhKSGdQb2ZSUGZQNFFsS21BMU1EZ2RROTc1M1dDZnF0bHl5N0wwNlFP?=
 =?utf-8?B?ZFcyNWxBNVBRUlo3YUYzVmdPSFprRVdaUE85cHkveFJJNmMvRCtUdmR3ZElr?=
 =?utf-8?B?SzVpZVJpVGNBY1UyNnZ0aFNjbHYxOVR1MUFaUzJaQW1MK2xpRXRQSjhWSU1m?=
 =?utf-8?B?OTRLS1kzR0FWMzZnYUFvZUhQd1BGVUxyWmdDSUdpSFFacnk0c2JQemFqR0ho?=
 =?utf-8?B?Zm1KYTBXeEFzUEpYN0x4dU1hdDdxa0FxdmdidUJuakdjNUI4QXpKZmhiTlpI?=
 =?utf-8?B?dExCL04zb1F4K01NNHJ2WkRlUmR5NFBNVHF2aTV1dE42L2ppaHpRZzdRamU5?=
 =?utf-8?B?RUx2VHRIZDh5U3NuMUdMTVlPTW83RW9xV3EyNTB2V2YxQW9rcnhrZmplZGM3?=
 =?utf-8?B?R3R3bkVndENrVzBvcmkwZHkxY1VLR3ZKdndJZ3F3SXd0NDdXbEpid085R0gr?=
 =?utf-8?B?M1ZGWUMvMzZSRnh2SndVdFZ1bFZBb1diOUtXV1NFMTdDVFNXY3ZTNzZkdTEv?=
 =?utf-8?B?V3pEc1dwVVFXOGdCZDBGTld5eTVZODgwd3kvYnRtMmJiakYyN1oyZHhMcThp?=
 =?utf-8?B?c3A5MElKa2hQSTlFNmRSYXExaFVxQWNsaFRyVE9GU2JMbXVoYVA4d2ZTTXRt?=
 =?utf-8?B?eFpWSFVuQWVRQmNka2d2Zzl3VWtVRDlyK3craWs0YkFVNDY5UlFkWitXOGsz?=
 =?utf-8?B?cVpDRjJXMGk1dzJCalNhWG1qaThXRlZ1Nko0WU90TGxMM1JhenBaV1JuaDRN?=
 =?utf-8?B?MnlrQlZCcTVROGt5QjJvM2FVWnFTNnUxREZFamxIUzIvR0lUWDRVcjF6Qm9M?=
 =?utf-8?B?U1BqcXBpakpBdHA1aDk3bXN3UlRjU1EwdjJLSm5oTXhTQWFpWWk3NnVMYzZR?=
 =?utf-8?B?UU9jc3hLL3hzU2lLYWRqZXdpOGE2cVcwSWUzRzZLZ3pkS3J5bGd6T09BZ1FE?=
 =?utf-8?B?MGJuWWZJOUg3SDFOVHZaT3RKMzZlejloT3JNL0E1MlQ4N2l1M0d4QVdTZEJh?=
 =?utf-8?B?dmRSZlVQTDRWaU1IdENybEVTeFQyMWpFbXpkd2lZL2h0RGRKSGNqNDVQNTlu?=
 =?utf-8?B?dGJMRW9qblZ2ZWZQTmRmTjBSMUl1V3Rud01yQllZZk5VSWVFeUJQa1J6Sk9T?=
 =?utf-8?Q?3R655Rbp34rtEnDsTzDFtMd5kybWqLqAmu8mcX7R70cBm?=
X-MS-Exchange-AntiSpam-MessageData-1: ohNtXCIMJMIRfw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb23b22-b19b-4a24-831f-08de7d06ccaf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:35:29.2414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3TcX+7iDRXAMLttb6p+2fzbNEgFCbHUGp9QlUMUvnPIOraWUX/+Ou+evwij9mYJB+OaDZo0skoOUtVqhaiwKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091

On Sun Mar 8, 2026 at 6:10 AM JST, Gary Guo wrote:
> On Sat Mar 7, 2026 at 12:05 AM GMT, Alexandre Courbot wrote:
>> On Sat Mar 7, 2026 at 12:35 AM JST, Gary Guo wrote:
>>> On Fri Mar 6, 2026 at 2:32 PM GMT, Alexandre Courbot wrote:
>>>> On Fri Mar 6, 2026 at 10:20 PM JST, Gary Guo wrote:
>>>>> I  mean not sure `at` gives me that impression at all. It would just =
let me know
>>>>> that I am accessing it at a different location. If you omit the `MyRe=
gArray`
>>>>> part then there's no real indication that this is an array to me.
>>>>
>>>> `at` is a function name, we can change it - I picked it because it is
>>>> short and reasonably descriptive. The point being: we have a unique
>>>> function that indicates unambigously that we are using a location for
>>>> an array of registers.
>>>
>>> Okay, maybe `at` is not the biggest issue. I just instinctively feel th=
e usage
>>> example being awkward.
>>>
>>> Perhaps the fact that `Reg` exist itself is awkward to me. It looks lik=
e a type
>>> that exists only for things to typecheck, and not itself represent a me=
aningful
>>> concept.
>>
>> After partially implementing your two-args proposal it really turns out
>> the two alternatives are very similar in essence, with most of the
>> differences being details like naming and scope.
>>
>> The one fundamental difference is that it didn't occur to me that we
>> could resolve a generic argument for a function in first position of
>> write using another argument, hence I went for:
>>
>>     bar.write(location_builder(location_info, value));
>>
>> but it is also possible to do
>>
>>     bar.write(location_builder(location_info), value);
>>
>> And that's really the main difference. All the rest is mostly details
>> about whether `location_builder` is an associated function of a type, a
>> method of a ZST, or just a module-level function. From the point of view
>> of `Io`, none of this matters as long as it gets an `IoLoc` that is
>> compatible with the value. IOW, each Io submodule can provide the
>> location builders that make sense for it.
>>
>> The `Reg` thing in my previous email was just a way to provide a scope
>> for these location builders, but in retrospect a module-level function
>> seems better to me if we want to keep things concise. So if we turn the
>> location builders into module-level methods we could have:
>>
>>     use kernel::io::register as reg;
>>
>>     bar.write(reg::at(10), SOME_ARRAY_SCRATCH::foo());
>>
>> Or does
>>
>>     bar.write(SOME_ARRAY_SCRATCH::foo(), reg::at(10));
>>
>> Flow better now?
>
> I'm still generally inclined to have location at front, as it's also goin=
g to be
> how projection syntax will work for structs:
>
>     io_write!(bar, .scratch[10], foo);
>
> or just assignment in general
>
>     my.scratch[10] =3D foo;

Yes, after working on the implementation I came to a similar conclusion,
mostly because the new construct reads fine in that order.

>
> I should also say that, my desire of having the explicit locaction is als=
o
> partly driven by the desire to eventually unify projections with the regi=
ster
> macro. If we would generate a struct where fields inside are registers at=
 there
> correct offset, then `io_write!(bar, .register_name, foo)` would indeed b=
e a
> canonical way of accessing such registers using I/O projection. There's n=
o way
> to simplify `my_struct.foo =3D Foo {}` without repeating `foo` twice :)
>
> For context, Benno suggested in rust-lang zulip in a discussion about how=
 it
> might be possible to use field projections to replace register macro in t=
he
> future:
> https://rust-lang.zulipchat.com/#narrow/channel/522311-t-lang.2Fcustom-re=
fs/topic/custom.20virtual.20fields/near/573703808
> Don't worry, the language features don't exist yet, there's no change nee=
ded to
> your series :)
>
> Probably I should mention this earlier so you see the aspect I'm coming f=
rom,
> but none of this is directly related to the `register!` work you're havin=
g
> today, so I was avoiding to argue with unrelated features.

That's useful context to have indeed. To be fair I also haven't done my
homework with I/O projections - I took a peek at your pointer projection
series, but not quite enough to do a proper review.

Being able to define the register space as a regular Rust construct does
look very appealing. Actually that what the register macro tries to
mimic, albeit clumsily.

Name repetition might become a concern though, for the same reason it is
one now, but if we start to use macros like `io_write!` then maybe we
can macro our way around this as well. Or, have a way to produce
`IoLoc`s from struct fields and use the current I/O methods. Anyway it's
a concern for later.

>
>>
>>>
>>>>
>>>> You seem to reject this design because the syntax isn't obvious and
>>>> natural to you at first read. We are trying to build something new, so
>>>> of course if will look a bit alien at the first encounter. That's why =
we
>>>> have documentation, and I think it is not very difficult to wrap your
>>>> head around it after seeing a few examples.
>>>>
>>>>>
>>>>> If `at` is only for array, how would you represent the case where the=
 same type
>>>>> is being used in multiple registers?
>>>>
>>>> That's not something that is supported by the register macro currently
>>>> (probably not a big change, but not something I will do in this series=
).
>>>>
>>>> But to try and answer your question, such register types would not hav=
e
>>>> an `IoLoc` implementation of their own and would need to have their
>>>> location constructed explicitly. In accordance, the construction of
>>>> their value would not bear any location information; thus there would =
be
>>>> no redundancy.
>>>>
>>>> We do have a case that is pretty close to this with relative registers=
.
>>>> These are accessed like this (real examples):
>>>>
>>>>     bar.write(Reg::of::<Gsp>(regs::NV_PFALCON_FALCON_DMACTL::zeroed())=
);
>>>>
>>>> and
>>>>
>>>>     bar.write(Reg::of::<Sec2>(regs::NV_PFALCON_FALCON_DMACTL::zeroed()=
));
>>>
>>> Relative registers are something that on my list to eliminate and repla=
ce with
>>> projections, so I don't particular care about how it looks like.
>>
>> That's interesting, I thought register arrays would be easier to replace
>> than relative registers, I really need to take a closer look.
>
> Register array with stride might be tricky, although I have to say I have=
n't put
> much thought into this yet.

Looking at the Zulip discussion, and lacking most of the context, it
seems we can either put intertwined register arrays into a struct and
make an array of that, or convert them to relative registers (or
possibly add some inaccessible padding). Register arrays that are not
contiguous tend to fall into one of these categories. IOW, proper
structure definitions we might very well be able to get rid of that
stride parameter that looks a bit out of place.

>
>>
>>>
>>>>
>>>> But for register types that can be used at several arbitrary locations=
,
>>>> I think this would be even simpler. The different locations would just
>>>> need to implement `IoLoc<T>`, where `T` is the shared register type.
>>>> Then, considering that the two-arguments version is called `write_at`,
>>>> you can simply do:
>>>>
>>>>    bar.write_at(REG_LOCATION, reg_value);
>>>
>>> Having `write_at` as the name of the two-argument version is okay to me=
.
>>
>> I picked that for illustrative purposes, but `write` should be the
>> version that is going to be the most used. And if we remove the value
>> from the location builder, then the most used version is clearly going
>> to be the two arguments one.
>>
>> The one argument variant would then become a shortcut - `put` sounds
>> adequate to me, but `write_val` also works.
>
> `put` sounds good. It was also the name that Gemini suggests to me when I=
 asked
> it to come up with a short and concise name for this :)
>
>>
>>>
>>>>
>>>> ... but this design also makes this possible:
>>>>
>>>>    bar.write((REG_LOCATION, reg_value));
>>>
>>> I considered about this, but IMO this looks awkward.
>>
>> Funny how you spell "elegant". :)
>
> It's indeed quite elegant from a FP and type theorist lens. I'm not perso=
nally
> objecting this, although I feel that this may looks strange to people wit=
h C
> background (not sure if that's actually true, though).

Fair point, but the goal is also to allow people with a C background to
build their Rust knowledge, so I think such accomodations should be done
using thoughtful documentation rather than limiting our API choices.

Not saying this is what is happening here, I haven't seen such use of
tuples be deemed as idiomatic so I was just suggesting a way to preserve
the API purity. But I'd like to keep the `IoLoc` implementation on
tuples as it can be useful for generic code (just like `impl IoLoc<T>
for ()`).
