Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC56F3822A3;
	Sun,  8 Mar 2026 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772970197; cv=fail; b=W2C+7SRBZusQSal1ZZ77v71iOlA+WoshxpZuzxxmbGTbAcUYds1cP2ihIlba0uOgZvLxC35/8g0sLEPBsLoQetWe4qe3QsJhA/qbCY8FrPADx7YTklkzusuuJ6ihs+uTJRciw//MZnAKkF3K/h0Ab0mOKpQU5eRHkYacnM9/FIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772970197; c=relaxed/simple;
	bh=CJdLJwFh2Q2IhhZWjjGPYLkY99feQ/xlVTet0GqLvsk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YKlrApNOwfsfIkTmYEXEWoJRjNxFY5xDQF/uFOSLRilPEivDXCQqb0Ri/W44vpqw9GRBw37AirdFxoDR6ULf0YkVldDgKYcboF+AC7SXcw4rvnw8mBVZdJja9x5TeX0FCMt96ZW5TjQp983wqg3CpmAfy7MGRBmDfK9gVQ8wf/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aQYk1gZT; arc=fail smtp.client-ip=52.101.43.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aQYk1gZT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1gC5gx8tvWNpwH7EhtaLVhFC8AgfXo6tnohqZgRG4A3PtDK0Aniq8DXpgXVFCG568LXAFeu4AQ4vXCguj4P8gT8ausMjoj802DpL/LjEz7+7K1ftYSfpU9t4+ui+/qjUWFmW7UL/hjGJ1aFwv/hkl33fPFOut8HFctyAjdLNFN9HPW5NtfUve+SQ5gPBHniFoHN4N02ZBZ8zK02bCPubThWErG9nSvm0GMpZ3E8F1TI1o2Fja/shOFC7J2xAaUv/sZ8Bj+DtjW2BMU8eIz0rSkwPxQhtA3pSGgS55YtL4JRDRA7/TcoYZo/3sV2/OIB+sMH4TZuY6MGafZlaODz5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nO78rVlf/cd7Qu27mNwkd+ikn7tGCJaIFHXi74OeIAA=;
 b=H1dt5IhYUCzciNGh28md1rW27gqpDekqiT9l20lnkyJCTY2soaTqNGVyhBAPzw9WyrW2XGteFb+p0+y+gPwUZ1mCFsOxyQLM9bCjZ0QxZxC/Ec7/Is7OWdYrH8WXhWLnmhvEnX0p3T98JIMcTbvw5sMDMD3ysDWGRBR8XU25q9+pTKYKxhX0plFVzE5yj2CWkr8Sm+M9xE4uOB6k6yHNXpodiR6fAWTU77seXdY7rsY244PFUbfd3vtgMUet2YxdcaOOnHel6IURCqEh8HYUDSQrATtvb+5245yXOis0LdKL/D4LNo5KX4dgFhh9b9+ECD3vDA9efwxvF9poZEzl2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nO78rVlf/cd7Qu27mNwkd+ikn7tGCJaIFHXi74OeIAA=;
 b=aQYk1gZTILVd0PyZv/1GVDe4ga86HaII1y8rpJhRVA2EjW5H3oHWF7cErCrOtj5MLNpdxlIKbnUiB29+0n0e8R5XOIimxYyXw7hedBY9VIYjdbXKX4BELRvo2L+2yvx9cUcwr4irgj+6u8uEIqN4s5HOvbfOXftApKJUZrDS2p7eAvCEvj9LRHVb2Ve4HrC1APNuWf/vIG3vIzk+e3esJik1H/sAemfdbB8UOO19LjpIen24hCdzrnNnNTDAukor/YjEY9v8TPchBLZknQ9iC4JMgo3fQ3nrZl9xy/BvPm5QYC6I6ra3AqYo1cN45jWHrMu0OXYTgflTQMUOO3YsHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7837.namprd12.prod.outlook.com (2603:10b6:510:282::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.7; Sun, 8 Mar
 2026 11:43:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 11:43:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Mar 2026 20:43:09 +0900
Message-Id: <DGXDH8UKEXT7.1VRRYB4DE3VS5@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
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
To: "Danilo Krummrich" <dakr@kernel.org>
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
 <DGWVKFEQVHA0.2C27PSBYR62D6@kernel.org>
In-Reply-To: <DGWVKFEQVHA0.2C27PSBYR62D6@kernel.org>
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 508124dd-cc37-47e0-2615-08de7d07e0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	mZLxaPYq90l2dvekyBi4F37xdjZJYRAfh59dWg0Odhm65sD6bCgiXgi9l+Ei/deNWsMe61mwJxA6o4fbyhW5QxAIXo28RoSXKTGN379s65uxIH4fBeor47H6TsJSaQbK8To9b2OkM6dt8h4oUHWyEU1A3GFUrXO4I5XY0iM3i3aOiib/Iw1fTvvroriDTsC0FUWrEzUJpcVRQehER4DqugeMmaMj7N7hw7GMbhaWUH1HLIAlqKvVVu7TgaVwcAOqvSL7DD3c5JOA/NW6hVqlImgaTa7dRGRM2z2ZzpQORsErvk5mM08D2wkNDQmas58K76mhv6nMbiXBYUg/5mwYL4MX4rQsefbBR6+wxJ+DMeLhpiVQ8mQS0jzwOJ/lyTNMHufm5tvoTl7wjhXckXBseC9SMQpMTY7AtCsd4xNzVtcrPEMvlyhA9lDwTMAnh3zJMGrmXX1hxybgCP9NlkDlAWPdSQgNwM85RGOYmBhMO9ANWtUdSsWL6jwXtbALVltsl2TbJpCwZ9BKAudP1p33MKeQfmtd5Jaq1cbbgPjVUvaieD4VLSFu81hcNCPBreM+o6W3f/bphGDf6qtzmBq5EvPbDmaQ+3IMPSpBIeT0PHnn1MQ3y0tnri6WT3dXh23m+SSntATunZRr5DYc9EduSVSeDbEVum7w/XcomX+FI8T96Pha5fd/qsnlHqSSk8j45WRSRDNGianl5YEyAMHcc8KZ0ODEQISJkrzGsXrqS94=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTBNWTY1SzYzMWd2eTZLY1lUc09WOXpwU2ExMFRRQVc0bWxDSi9FVTNDTFVK?=
 =?utf-8?B?MElzeGtxOXFpQm94cytPSXN0cXh3KzNiQmxHUUx1eUsreHhrWXVBVVdFbUZL?=
 =?utf-8?B?UExZSWlxb2xmdWZVazFwNDVUdkVpWXdCelJJUStsdEhxbytaZGFObzBRMVFU?=
 =?utf-8?B?a2lUS0IrYldnZUpyR1orUWFiWnJTMXQwS2hSVWNuZys5TC9Qc2h6NFpkTDJq?=
 =?utf-8?B?MkRnOVZMTmhFcmFUL0FvblNUN3N0UExwWExLMiszQjlDT2h4QWFCWS91NUFQ?=
 =?utf-8?B?RDIrTXB6bkJWYkhrSmZTeUlZTWtQNDh5bFhhbitNZDF6NDZuK0dFazkyN1N6?=
 =?utf-8?B?a1p1bUE5YmJ5TThJZkErM0dVT09vRGJqS3N0czVPNHUzUWY4T0Q1ZjkyVmVm?=
 =?utf-8?B?VGdneURGVXd2OGRQaDkvVGxTNk9vcmJCbnBPa0ZhOFlXNXJaNGZIVGt5RWpX?=
 =?utf-8?B?a1ZHZlJqeEwxSVFQWWZpU3NTcmY1Q1dLNWtzdjZaM2taSVdXQ2RJVUtDenFB?=
 =?utf-8?B?TkhhU0RzWEkwNEtLN2hRWW8zQVozTm1PRktibUV6MnYwRzRhZkhYWTFpTkZo?=
 =?utf-8?B?L2RWT3BuU3FGcTVDcEhyZDR0OC8yaE1qc3BLR3Vaa09UdkxRT1RKNTJiTWF0?=
 =?utf-8?B?aDMwREE0WldVSmJ6T1FqQmZqaW1kaUlrb0hMSDhib1pnWjNoclBacjV6VVFC?=
 =?utf-8?B?T2xHdEtzemV6dVhmQVM5NGpBNDZoOFd3Y2loYXdSR2ZNV0FiYUxzL3dLRmNk?=
 =?utf-8?B?Z0JKNHRIS0RrYUZrMmFDVkJxU0dxWVk3UHNjYkhqN2daQ0UvWmIzVHFQTnFi?=
 =?utf-8?B?RmNDRmdKRlpWcjJMQU9ZamJqQ2pqR2ZWR3pydXNQZkJUaEpNVlJCU0JYQTVv?=
 =?utf-8?B?V0NRcGtJMW00N3doeW53Q1RWeFBlVUF1dlFxOGpuaUsxNVpUcFR6TmUyNTEz?=
 =?utf-8?B?U1FOV3lFOE9hckZUTUdLUExwSmJXT1U0UnI5eG9YZks0K2ZOUHdsTVNCcjFH?=
 =?utf-8?B?clYxMjZqaHA4T0ZZL0lld2xac1dSU1lDTkt0UW9YbGZOS3lJOW90SmlwZFpY?=
 =?utf-8?B?QUt1NEZzY2xZOWI4NFFqcThDYUNvRm5hZEc0RE5SOU1pbVE2SEg3ZXFUTGMv?=
 =?utf-8?B?UmdtaHJDVitXdjdtZ2NWUktvR1JTTzYwcnBSWGFiZm9jdVZuUytNUElSSm45?=
 =?utf-8?B?Zk1UOEp2ZVJ1N3J2Z292RExBWEZUYU9LdWpXNURiS2hGRnhYa1pXN3kwRUVj?=
 =?utf-8?B?TUJudzFMcG05VWlMdjB2YTQzWVJJeHVxRnY0T1N4eUlRL1Urc0pIcURyR1Iw?=
 =?utf-8?B?dGVYREtvRUgxTWdPNWZHNkhnb1J2d0ZvOU9rZDNUZzQxUHJvbThsUElzWlln?=
 =?utf-8?B?V2VqaGNOV2dBQW1Ka0J1RmpseHlJZFA5R2F3OFN4TTdweGhOQ0xaWHBpazN2?=
 =?utf-8?B?U1dhT2lLZ1ZxUVQxNXBlV2dTN2EwbEtwRDRjTHFEN3IwSXYwOWJlMnRDMzA5?=
 =?utf-8?B?NXBFQkxQTU8zeFY4M1hSTmRvT25Ybnk1TnByRDdWeGgxRk82OU12Z2NvM0l3?=
 =?utf-8?B?aWpEcVVtUmJQaDFMK0hSUkJuT2M5Z2JzczZHMkNwM1lHcVdxMnI5UlIvYS9H?=
 =?utf-8?B?Q1R4Tzd5ejV5aTRsdk4wMFJCa3QrNHkyMTBLNGZWZkNYUVZERnpjdW5lVFZX?=
 =?utf-8?B?OUs0Z280WlJ5K2J4MWFSaThnQU5SdnVsdXVLVXl1Z2h3UUk5TUZsN0doanZ3?=
 =?utf-8?B?Q1RvM1VuaGdMNndKTnZmUGJzbXlsbWlJa2JuWWpiU1BWeVZoMFFkQlRPMytp?=
 =?utf-8?B?Y2JJeEpRZHpqcHgyTGJHNE4wUXQyVTM3MkIzQjZDdkNnaEF3azZHdlBNTzM0?=
 =?utf-8?B?YlhHVE9jd1FiUndoRG0xU0ZnZFJXUzI3VmVrK1gwdzh6ZlR0MHljUkF0ZjJ1?=
 =?utf-8?B?cDRPZS9sRnIyUjlCWkFtRTN1d2dwKzZ0U1BQbC9OdU0vaFdhQ3BYdUFrSjVx?=
 =?utf-8?B?bWI1NlpWVndmZGdYbVV2bHEybys0VjNGdWY1am1oV1Y0VFExNGJISCtzVVhj?=
 =?utf-8?B?NE9xU2hlUXM4ZldUSStLUWxlbjNvU3FlNmFjUnd5SHhzeEduTnlNMEVwQU1F?=
 =?utf-8?B?MUF5SXlPYm5JSjR3MFFrWmQva25oRzliRWtiUkhsNzJpWWlwbDU4U0VQMWdu?=
 =?utf-8?B?VmVFZmVHblkydnhDb21URWwybk1vWk43UTFKanQ0RERibDU2MGlBYXpnZVhk?=
 =?utf-8?B?R1FWaHRiZ0pyc1prMUJnVGd2MTRiZFcyMTFNaEYrRVBBaHEyWkFCRVZ5bW5u?=
 =?utf-8?B?Q2dheVBNSUVFam51clJYdFFFRzI1MEdDc0tZNEtDYmFBTTV6dU82ZCtDNWFH?=
 =?utf-8?Q?+U9hz6iZiJkSf27yMsF2VLCRktNHNxqKYvWUnq5E6NYk8?=
X-MS-Exchange-AntiSpam-MessageData-1: hpmQliXvvpUZqA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508124dd-cc37-47e0-2615-08de7d07e0e5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:43:12.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BZGKycbelZSlm+eN0WLsBRfQFKAD/JJ88sxCGo+GxmOCrlrGo0yc6kpZGN0vtmig+z/0S6VS7AByfPJrJCCaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7837

On Sun Mar 8, 2026 at 6:40 AM JST, Danilo Krummrich wrote:
> On Sat Mar 7, 2026 at 10:10 PM CET, Gary Guo wrote:
>>> But if we can agree on
>>>
>>>     bar.put(Reg::foo());
>>>
>>> or even
>>>
>>>     bar.write_val(Reg::foo());
>>
>> I'm okay with either.
>
> write_val() or something similar please; put() is not a good choice for
> something that does not release a reference count in the kernel.

Right, that could end up being confusing.

>
> (As for write_val(), I'm generally fine with the name, but I want to note=
 that
> it also may be slightly confusing as it is the two-argument write() metho=
d which
> distinguishes between location and value, whereas this one combines the t=
wo.)

Would `write_to` be better?

We can also rename the two arguments variant `write_at`, and call the
single argument one `write`, but since the two arguments method will
likely be the most used with the current design it makes sense to me
that it inherits the default name as well.
