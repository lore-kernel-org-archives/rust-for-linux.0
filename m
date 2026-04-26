Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012029.outbound.protection.outlook.com [52.101.43.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7482773CC
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 04:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777176016; cv=fail; b=h/1P/GJILBNC1AqrxHDuXh/M/Dl2HG7R9HirGWhZTA+pObMswUiwtfS5zcJHhriKlhu+3zkOhtGFP7LLbP+MhcQADVfOBX4zgl8UPRX71jgeBxtDxLDBkKdVPTFEU5EzQqHNR5rPAcvQLdgQqNxv3l9XiU0QYyfUG+Gk5Jt8vY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777176016; c=relaxed/simple;
	bh=uPV7fnO0KSuBLqrmyzkq4z9PQ53y+Dpbch9al0dPqpI=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=LkvFPCp9GYt/HEhQdFElJd2X+x3wgTuLISF5U00bpacl/ksFaZSU4bZDUAy9lrWh8+9vese+yUnO3imZfG2FF3a1ZdYn9AOvAkSMXMS+B2L9UjEY5e6kBDY5yAWAW67pHskdXR6tlUUZtHV4gDAUfyosa5X09IxhmjdyrLZ0gt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N1VSAyR4; arc=fail smtp.client-ip=52.101.43.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N1VSAyR4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrvLWBimBSuYvoxgYNG/tgMzSJB+bx0Z4bVEXNnNI+++DN7DXVazoxqgp43tDAsRDHvmfvVdO3WsdthljCD0jW1YHE2wNwQwNNk7Jx9BdL52DrFXoaJkBU7PwC9RY6Epe4nkB2gj8MVaJySL5iuO39NOc9c4U+HfyggYdPE8uhP/hj8FqvnBPKiQPs8bDjuMjwgVDlPkD0j4pTAX0YjnnQLUg2OqIBBQvRNt7feK2l/2n48U2alC8KBqiv32YBGQ5+9zNCnhltrS/b/gnXwhDdTo0rWN9Lo0Co/GuNUli35Aa0kjRNr1iVbcWrCt/m5jAIqVScQpMjiafAuLpwMCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPV7fnO0KSuBLqrmyzkq4z9PQ53y+Dpbch9al0dPqpI=;
 b=G3h4ufXnZhr2XI3EbyhzENoNmBxnIv18cT7kHIybIRxLCSWAW0DpdPXKkVbO7Fw4QzUG3iE9jBowGh/C783rNNWkETlMoFora32KUYWdXTtBI0gdgpwc2iJDD5C6hbZsnBcR5Md6cVyzze7ZB+uRjb1Qb6rO3LMOOpvArJV3TX9856JCulHI231pxp/UxmxkPe9QgwkouThjnUFOvRYusbqDLgthVuxPR+rZdX8gU9UAdMUF1OeDi5SlwmbNta8/bLKrLRTct443VRWThEL+YgGRWF+IgjaCAX0Rx0hY+6D6QgCeJQocw2Yvoozu9KWYZiQH4ahwm/ithX6o2Qy1rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPV7fnO0KSuBLqrmyzkq4z9PQ53y+Dpbch9al0dPqpI=;
 b=N1VSAyR4Hq0jiE5ATPhggF0uONOma5v32CLAT/iV53Yg98+4X5XoqAEc/kLCcBB13NUmWXbQLfjhJ8srbUYIF9NN+VR9IwNZWFWzmwqn6VGKXbKtB2+mXux2UcibAKzMBlRsEV8ZtHrgD9yKChRa/vmVeZtfEIT/dVyYA1SK1lCV97VMTOcAoB2tb+W5OG6fAkSXomRbqtva/cEXNlO1BcU/UOjsG7lzi0+/tt6julkaNV6o2PuN5G+TXA1gV1NEe4dfYzCNqJukljUvb35wz9+pJDs3f2uCJgWqGElqMkM5k7eNMb9MGaY61KKia2xjT8SrsfsaErvq6rHqOQeinQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8220.namprd12.prod.outlook.com (2603:10b6:8:f5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.12; Sun, 26 Apr
 2026 04:00:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.012; Sun, 26 Apr 2026
 04:00:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Apr 2026 13:00:06 +0900
Message-Id: <DI2SBEQW29D5.2BY9VNZ1XGJJS@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Hsiu Che Yu" <yu.whisper.personal@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 0/2] rust: alloc: fix and test `Vec::extend_with`
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
 <cover.1777111268.git.yu.whisper.personal@gmail.com>
In-Reply-To: <cover.1777111268.git.yu.whisper.personal@gmail.com>
X-ClientProxiedBy: OS7PR01CA0172.jpnprd01.prod.outlook.com
 (2603:1096:604:24c::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: 991062da-611a-4509-5f4d-08dea3485061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PWEkSVogcEcAjOgjE73pIsL3y4DOBx9Y16TrEkUO39XR3fIQw188JhndAof5CU5l7fSXyDsFruhWRMoEnvdr12yralPxM5hGsa0sR7CGPGR/AGqe5mISeJTBBLIUZ8UNccUFrQIp7XB76WfJmjrIBTGgA5ssp1tt1Bta7lRxbfTmSK5R8uu5ntYJuezgll7h7JJ2JgRjwz9bV3wl0EhdF1HNN1ab/EmGgKwsOuYbHrR2AFszF4sUVJ0l+4nqB1Ur/NU1AHcOzmPH+qpo1pTB8zwhUGG4fhy5kR+LkWrd0KDTumJJEHcFMD0lcTzxkWDoX9N9Czwou2jINoaFye0cYCoNRiRWEIeICtddCpcOUFuevmkLVXQnRoq/T0vH0okScQRyC3E8oYYoaJSAx+mSnPzG5swNFXCLkxFeq1QROOmOWDGBQNdU0hS2ZZJFyWxzpeqnR10VtN3D7Ioa4iKWBqccJNt3HZ0gtWDN7cxWoL8WvkumZXDwGay37gFvMe62+MC2KPVRv0Ey6OEEbph/wY5Kc5nOvl6NxED0izv1m6hRudR+fnbROyyizOu8CdaQ0TJ2+r6j/hVxb7xHBs01eOFtm8URJGJTd2PuVpRO4Q4lsklQwcOKD3BHYjE5blvMXHJI13SX/PnWcai7Sj9ilhHTTXQKmyTLhMrh8iMQvrZn3ptEgZZcYhE2P6qJdixziwbyKCua3VJYusyrtUYJVfXknNEQeAwOKRQODJ9i4a8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0h1R2lwNlhRQXdpTWllV1R0SWJnOXo2ei9JQzRIUWFuRTFKNFovMzZYRTJP?=
 =?utf-8?B?UEJHT3NqaWMyUEtISWoreE1ndXZjeEpWTHdaMytFNlROczhvNCtRVjNiaXhl?=
 =?utf-8?B?T3UxQkNRNFlESEpXSDZDVlFFWDV3KzZSUCszMFBCZjVjMGI3K2dVWjdnZ2dF?=
 =?utf-8?B?M09zWllDU0J6RmNOYVVPQWFFT0hSbXhHaytKM05Xa3p5cDIrMkszL1BXaEd2?=
 =?utf-8?B?UGtWN2pCWUhwcm03YjhHd3lYTSt1NUZtVzVRaVdqSWEvTUpGcWdicTRKWjhG?=
 =?utf-8?B?RDJscjgzUUk2TndKc3VIWWd5MEVGMU9wdUY3L1pQOWNLdEFMNGdkNG9hR3dy?=
 =?utf-8?B?Q1dhaHdpYk0xMGJlVEY5R0F6WU1CdjNxZ0hrUWVuSnJ1c2J2WmdrYXZ1ZDZV?=
 =?utf-8?B?RWg1bHRsa05FQUJ1Vm9vRG5mOThqbEluMGxDeUd1WTVJY3VyOVBYbG14UEZ0?=
 =?utf-8?B?Z01TY3ppdnVFbUp0UkdhWit1VGxvalIxMUhTcUsxM2pseVBFK0Vmc29STEd0?=
 =?utf-8?B?Z3NkeHR6R0l5Q2srOTZhSFUwblhUd3JSKzZyM3lXelIrQmxNSmNITUFHeDVK?=
 =?utf-8?B?NUJZaEJNb01SdUZtcHdleWtJMnF1VjBnT1IyRjNxZ1ZBSy9vMGRWN212V1Y5?=
 =?utf-8?B?S1BLMXpZNWwyY1JBUWZqUzl2bXlPbVl6dXpUL0VxY20rNWJxS2dYYzJsZVoz?=
 =?utf-8?B?cFh3ZUE1RENoRy83Y1J5OUM3eFhsRlJHWS91dnl3akRvc2s2MTY1N01UVmxU?=
 =?utf-8?B?bVdaSnV3c2dYODZwOFovSmFFdldkcmVuaTdZQ0ZwWkRYRjVvaW9LdStpQjFY?=
 =?utf-8?B?MW0rYWU5NldnKzE2RU9OeUQ5Vzd1SjIyMkFCTGVERVk3U3lLM0VxaGp3MXVI?=
 =?utf-8?B?YUxMaFQ2eTFsMGtWTktVWDV0NGhQdjZRR3Ywb1haSldpcTVMU2g4ZkVXOG9X?=
 =?utf-8?B?QzNPbmtRcE1VeStXTVdobjlBbFJuSUJXZUpuV2hFQWJDeW96RmJKSEZ6dkVD?=
 =?utf-8?B?Yk9NbGRpZEhWRHcvNEt4dlhvZ0kzcjJybU1aNTR2enRML3N4RlBqa0g3bVBT?=
 =?utf-8?B?UDVGQ3dvQmlZdkpSelIycmJPcnNHRzZWYjM1ZnFYNkdHakI1YmtTeEhVQmJM?=
 =?utf-8?B?TjdaUXIzdTlHTG1MN3Y5V245Mk4vV05OQjlXZ1VGWjZlMUIvWFpEb3hodnRR?=
 =?utf-8?B?NDhSdE9YaEhHZnp6NGZpS2t2TGdaWWRVQjFnQzZGQldBQzl5TVQrZlpTRFBX?=
 =?utf-8?B?UjByR2JjOFlISklWVG05TWtrYTd3bkw1bTZibUxPVmVDZzZkaXdYVkVocHhI?=
 =?utf-8?B?c2VpSVJCRk1KOWxWTVJyQzNjVE5UZnFUYmlkZXh5SHZyQUZGbzhBd2xTTWw4?=
 =?utf-8?B?ZmJOdzFJeVNEbG5aQ3c1UVpCMmF6T2dmU25HVFpRY2l0NWNMMklXYi9wdnRR?=
 =?utf-8?B?V3VBNFZHV3RJV3NpYnZmeGxQemxlQXRWMEtWWHdua1RrVFpteHBiZytVYzlY?=
 =?utf-8?B?L3AvU0VqMVVlQW9uanJ2OEZOdVFtZ1VWTlhzYTNndDRoT1dSaWhoc3BhWGVR?=
 =?utf-8?B?V2didlhaYzRQbDhQWGZtL1NmNlI1K3lRa1QrMlpNMlZNM0dOQWQ0d1lldVJE?=
 =?utf-8?B?NnF0R21HMXBHQ0MwSUlkQnVsV1pyaXZlLzNNOGRYTU1pUE95bmNuUGMrQjVj?=
 =?utf-8?B?WU8wa3pVREtPR1BNN3JBWXp0RGgweUlPbThMVGdBMmhpMmN3ZzVVTGN0QkFS?=
 =?utf-8?B?c1VBNjJ5Y1BzVVVSYTYzVmxsT1pmc2g5aTVpZlZxL25KU1R3NFlWemxlSmFt?=
 =?utf-8?B?bnJ5ZkZBZVREb3RxV0Z5MlJmTERZWmlxeVI1ZXNYalcrcWp1TyszUzZnU3da?=
 =?utf-8?B?RndHSjRNdGdIb3hkemZENExJYVh6Y1lIK1VCQlZpc2NtK3lhV0M4RVdPSGNv?=
 =?utf-8?B?RGFPMGcwR3p4aHpqR290UEVqTERHMEN2VFptVlpWMU9KT3hDdklRWFVsY2kx?=
 =?utf-8?B?Y21lWlB6UHVNNWV6T0N0d1NXc1ZrdklLazBDVjZBRVRRUlY4a2xoMW16VEdG?=
 =?utf-8?B?ak9QMXY5Zkh0MVBOYUlUWmFZallFR1dORmpZVlc1bThleTRQWmpmbkdEOHdV?=
 =?utf-8?B?Z0ZCenpyT0lhR1U4bXpOM0tNMnJ1K1pZMDN6eGlZd1d3S3pNL3JJWEpIUkVU?=
 =?utf-8?B?a2FmSnBYR0dCMTdnamhHL21DV0VtRDMvN2xDclIwL2ltcTl3NTdoOTZnbHBp?=
 =?utf-8?B?TnMxYklDaHZKV0d3NGFsL2hqTW1zayt2SHVQd3RzK1pKOTQvUGZZdHVmWGJR?=
 =?utf-8?B?WE1xR1JpUlhkcXRxSXQ0U0syc2YyTkdEOWNuTjU0RWFCQW5IMHJUZFk1YXJT?=
 =?utf-8?Q?Uhqh17Fh16K9WG/FSs2nwOUOKZ/sFt4k8yH0VaKmzf3Q4?=
X-MS-Exchange-AntiSpam-MessageData-1: B0adbpPvwxlanA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991062da-611a-4509-5f4d-08dea3485061
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2026 04:00:11.6861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MufqFCG38b+ndJqX14Aw81GkmO5Wclpd2adltt2zI02NcF8Jf6lnagdMWkpZgERbpq5cfxrnlHuoDtTBAv2hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8220

On Sat Apr 25, 2026 at 7:16 PM JST, Hsiu Che Yu wrote:
> Fix an incorrect SAFETY comment and add a doc test for `Vec::extend_with`=
.
>
> ---
> Changes in v2:
> - Split into two separate patches per maintainer feedback

Looking good - just one thing, when sending a new revision of a
patchset, please start a new thread instead of replying to the previous
one. Otherwise things can get pretty hard to follow once we arrive at,
say, v10. :)
