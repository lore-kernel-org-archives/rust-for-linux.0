Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013013.outbound.protection.outlook.com [40.107.201.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E35823A9B0;
	Thu, 18 Dec 2025 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766064749; cv=fail; b=Cwht5F47zrtoPsvwuTr23L2IuuBD3cDbIjZyGFmYNwL0n3ak6VGQi+tOujpBCz7waqfEI6XaMQoNzeVTd0pAdAUu1Rx3NCD03rTxRAm2gjTqbUmYjJ9pjlV6ATxO/1htMcRKHiUDf5OQUH+c32PJkM5LVVYoAuvfkF1Nj5w9IJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766064749; c=relaxed/simple;
	bh=tbJxrYliu9fwbQiX3MdSbCN6qD53m7A57+fOrTTuvOE=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=DRfOv9607kCi3b+UgQgzpqONDhY37s2N9J6SMOdJff27F4loKuDV7fa7G4scJaKEuKSROBwT8DKpwWfd0M9qnXAehQtEE4aGpnJw+iWa19tDpwqnMzLTVnofug3Md9TMbw+EYjISG28Dvp9S3UkIZ/dIPEAYKbkUiAZxgETN7HA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HCSEHnkd; arc=fail smtp.client-ip=40.107.201.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HCSEHnkd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJjVMT/9662e4hfBQBfraZYoO78/X1bS3XPiKBLlxRwoJ6PqqwrE7c4/EnZOM91Yhe0KRl7CeUs+CSpJeulcleTMuMoLqVJOKopf1KAx7Efq34f/cus4z1g70EbxRrmabdY/TkA8kykibg741FMGYcV8fYcDC7MyanGquDoEasY7pmXiPu+WruPa6lCB6bdW5v8ifUrdbaSkAKUZFjCrpKjWVZsmKwY9L5v1mxYG5dMBfGGGMuxlNYrkw4wZg41o7zwwjtHz9KmOrhEXMru5UX4aIpG2XDlvrQ49a98cMarKYAtCNChBR+YWfb8VFFCZhdDcQgfcnH3uUXQbLkYZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbJxrYliu9fwbQiX3MdSbCN6qD53m7A57+fOrTTuvOE=;
 b=HyhgVXmvxGSY4jShQQPmPKidBgmbkBczgimUKsPekboMCuukYDIoi5NmVaONqctAeiQKh/fm4yIu3vsATBXXx0wiLyUBMy9tq7IwDT79jXSiCOVNXm/Er6weYosYT9le5/8EvEnoLUtMou7uIjAp4YuJvo8dx+Qov7da34Q4rQJh1dXHw7In+CQXK1xi+Uu46XZhAX01uiPoycAWG14vuRNZQKCAQQoMX5ffFkqrtgimusAXEaHnkeDOYNnwnKgLUDUqEtT2pe9tkEEkKrx/EVanHjgtVcAcpi5EYX7z8C1zqzuHs/Q4+vP4QuqQSOw12/pRykB2pFw+K3aPFou44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbJxrYliu9fwbQiX3MdSbCN6qD53m7A57+fOrTTuvOE=;
 b=HCSEHnkd3/LcKEjoJUdFZxScXcxiQc5zMpfpf1cdqPImC9rkAeLlRezL+6EG3iZvxcF7UYD06IyhoKvMKGVeT57O4shywZRM8v4wuy4TyuqTdFPDVXKwquDeXVF0YPAVRBj8pFG1RVkUw5KpvLevvNEEsSTyCeTDineNGu8wjDI/roDzoqYNjn5z8gQE8KoViwVjXITdDSuLiXpsqmGpEuJzbBzUMecGdWRxBmmuqrW/CqIsh8FO69W9ihVn9M1JL6AVqTj00uYRiy/YX3Clv3kcfAZkf3CLvXOaW+10fnd0qqd0flDu7NxzqDBxI2T8IR4qIRrVQ1HwtQ8Mq13tOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5763.namprd12.prod.outlook.com (2603:10b6:208:376::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Thu, 18 Dec
 2025 13:32:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 13:32:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 22:32:19 +0900
Message-Id: <DF1DP93V7IQ2.2BA2EV61WUA6C@nvidia.com>
Subject: Re: [PATCH v4 1/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
 <20251215-transmute_unit-v4-1-477d71ec7c23@nvidia.com>
 <DEYMFYQH2GY0.3HF506HL8OHY6@kernel.org>
In-Reply-To: <DEYMFYQH2GY0.3HF506HL8OHY6@kernel.org>
X-ClientProxiedBy: TYCPR01CA0192.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c84742-2ebb-4279-2189-08de3e39e11e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|10070799003|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFBkbmxGeXcwMExZQ3RJK3pYaHV2UWVsdHhUZTdSd1pzM09pMlNsZGdUN0Fw?=
 =?utf-8?B?Q3hLNEg3SWhvR1Z6SCtUQjNkL2pUenlmbWkyTSsyR3A5Sk5WVHJaQ0lrMEN1?=
 =?utf-8?B?ditxU0Y1eWZKRE1CZzgwU2ptaHFjZmg2c2Y3QldNVGVtR2MxSmtBQUhKSmN6?=
 =?utf-8?B?d3BXbXJ0MzFoNHNPeUFOR1QvbUMvK0FlQTlHUi9renRaTC9RUHFUWlBhajE2?=
 =?utf-8?B?QzVSTC9NZUdLMGhSa0grK1h0RnFwM2RPZGNmRVkzTFN6SGcvMTZUYjZlM2Jk?=
 =?utf-8?B?ZW5lTVNya0FPd01rSWNYQ0o3WEt5clRPRUxTcnVUZ2MxWjRHaFJYc2dzdDZ3?=
 =?utf-8?B?Ny84eEw0bGFnNWd2OFdkQWZrdjVkZ3pFOW1LOG5qZ0tBOVZUN2QzTDBnVm9r?=
 =?utf-8?B?WVpGNnNnQmRyWGVramFRb2kvR21uclBVaFRva1I4ejYvVWxoWjBFeDYwYXlP?=
 =?utf-8?B?cFF3aUNYOHJEMXFFUmVuMU5YR0k3K0ZXQXhSbUVNaUFXYXpOd3JEd0Z0dzJL?=
 =?utf-8?B?YittemNRcjRzQkJrdmNZSmFOL0RQTGFidWV2Vng4eTl6NzJKT0ZaN3Y4SzM3?=
 =?utf-8?B?NlBGd09vOHhESUk1RGE5RGhHVThlYjdvM1k5dldmOGRyNXVWYSswUFFQVU9y?=
 =?utf-8?B?a0VUTHUxZ0R6aTV3cFBoV2lVQnJXUU9ZWTVMTkQzSkxwUVpuZTN2L05lVWhL?=
 =?utf-8?B?UWxmRHlFQ1BHb2w5MDVRUDI0bHNZM3lGdEFXT2RLMTRoUEw5dStWbXB0UHRz?=
 =?utf-8?B?MGJIVm1TR0ZnTzJBU1d5WjIwYytzSmRERnpzQUhsM29vS0hnOXYyWG42Y3lz?=
 =?utf-8?B?TTZuOTBwcU9CR1NvNzM2b1hWQ1hORG5kNEVlRE5zQUtOb3ZxS0M5T29kVXVw?=
 =?utf-8?B?RU9IbFp3R2VvbFFlb01rK0pHaGxscXVOeFEwK2JSWSsyMVJLRWVXMGFoclZP?=
 =?utf-8?B?dy85MzljemsyZG8zZVRhczNLSnV5dTFla0hWdlp1ZnpWeS8rZ09nSEJjTDVB?=
 =?utf-8?B?Y1QyQzdwQUJwSUtlaUNOUkNXUE9CRW9ZTmpFK0Z0YXp0QmsweXdyZVhYMi9N?=
 =?utf-8?B?QmZiZnNvM2V0Mmg4MmIySEF1QkF5OTJwZzRTd1k3Y3B5QkVUZFVyTTY4WkJD?=
 =?utf-8?B?QlY2U0xhVEx1Z1hVTzRuVDJWV3ZaaElHaHZsbjBFekthZ1FYRTcyZDQ5WC9U?=
 =?utf-8?B?YjdUbGYyOHptU1FGUDRZM1ZFempHY1pTeXZWZlZYRXdFRUVtaW03cTVFT2or?=
 =?utf-8?B?dk53NG0xR2NMWlpCRGxORnRmcDZtbE9RRjhaRGJiOWJEckY1dDlIb1oyNDNF?=
 =?utf-8?B?UThaajhPZWxiem1NUHFTb1VvQnlvSExncXN3Qk1IcjZjQ0hTeStEa1dCNSsw?=
 =?utf-8?B?NHFkdjQ2VE5mOFhhOFhDK3hKT1NUZzc4OCtFV0lyMTIxOXpRU1FLV3F2eXdH?=
 =?utf-8?B?OHZFUnJmOXZJdy9kZHNiNWRsRFZUKzhSZThYcDlhaElhNHpkUVgvUWlSSmoy?=
 =?utf-8?B?ZGVwUVB1TU5SaFlVcytnZ1lLeTVTeDhTaGlXa1NRRDU4QWtGNStuSkRwVU9p?=
 =?utf-8?B?OXZ5a0xNZCtmVlBYZWZ5b0twTlBEZ1djOUlLTklobExBWEFJUHloVUoveFA4?=
 =?utf-8?B?T3ZLOWk1QWVXWkdJZEZQNlFweFRvMnJnT2VtUEtOSHlYVWNlc1JJMzBvdnNZ?=
 =?utf-8?B?cEMwd09wM3BGR2pIem10cXN2SDU3SWxIVTFjbXo4WlU1Snd3MTNqUVdxMUsr?=
 =?utf-8?B?dVNaU0U4RzU5aGpYend3Z1Jpa0JKYm1Mc2NHZCtMSlY0MDlQbitsS3U5OUlQ?=
 =?utf-8?B?S3dLaHhOdjhvUUo1bDNsdVlHV0Q0ZVhrMUlGZHZ5TXBoKzlZanlrZFpweEln?=
 =?utf-8?B?OXZYT0xVMjBoMnRCbGhESllzY3gyQkxoQ3FaTlJmR3pZRW50WmdPeVJyN2No?=
 =?utf-8?B?Y25zZTNmMjFPd0pwTER5N2pQSGJ5Z3Q1a0NXbm5iQmhnOGF1ZE43M1N4OGV3?=
 =?utf-8?B?NWNiNVJQQXY5SjNZWmk4d0hCR2dWbTQ4MTBPOHk1NkNlejBJNVo2OGRTU01B?=
 =?utf-8?Q?UlWhCu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(10070799003)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3hPaVg2ZGJVNktySzR6bWtuNCtnQ0QxSXlOeVNHcnhZK3AvZ2Y3ay9lY201?=
 =?utf-8?B?bmd6c2czdlhLNVdZMWZyWGN2NjZHSUMvMlUzTk1QWENqcEhIaWtCZSt0RUdq?=
 =?utf-8?B?U2FRaGNoKzRGczNXYytJRHZ2S3FISDkyc29oakRjU0RXTVVxbzRlWlB6dTBx?=
 =?utf-8?B?VHZ0SlB2c0xFdzdUM0hnS2RPUU5yU3FGMmtzWXJkZ0lKcVp0cElncFhvbWpN?=
 =?utf-8?B?UGNoajBFZ29LMDU5K3lhL0p0aUh3OGxsbjlESzhkaklKODNNN3VlM1VIeFpk?=
 =?utf-8?B?RUVXTkNXQ1BERWNxTGZCc0t6bTFmYXljdWdmcDdoa0UxVGJaSUJSNnFRdnFP?=
 =?utf-8?B?Z3IxbUljOGI1bkVOek5Ba0ZaSDlBZkhOa05tMWlodmk0UG9pejBRaWdhbm0v?=
 =?utf-8?B?ek52aFJnbGlyNy91ZVpncFNvUHFseFlCT2E3dzNxQVFHdTZnRDlhYWdjbEFw?=
 =?utf-8?B?WWdvSTNFS3pQRWplUkEzL3BwN3grQkJ2OU44ZjBQNkNSVGdwcTVYM1FCY0x0?=
 =?utf-8?B?Z0daSlJvMDF1S0xlUHQ5TUJhYm1YWVBCK0JqTnphZG14TUVmYjlzbVF5Q1dU?=
 =?utf-8?B?SDFkd2FJdnV0dml3YlFIYkJENUVKNnBLMGMyVURKSkZ5ZlFkaDc3RzZKdW1Q?=
 =?utf-8?B?T01LMWtXcFE4ejZmTURicmcyNXppSEFSOHAxM2REc3BSZ1hTZjlIVUxJL3dr?=
 =?utf-8?B?eFBuanQ4NXpsTm1jRHlleUxLRUlBZ1BVYzVsRXJMcVpHNlFubGtmWjVrYTdr?=
 =?utf-8?B?RzhLSGsxVVlNb054UERtWERxYytpWm1rVFBWRWRQdTBaRXlHNnAwd3RnZFIw?=
 =?utf-8?B?dVBETGY4eS8wanNGOVJOZld1L3VnVkxtTy9BTGxCeTRqRTJ1Z1BVUjFEYWc4?=
 =?utf-8?B?bGw1Kzc5MkptWkR6TERuUG4zQVg4ZWROUnBsUTN1VFBweThvbnlJVGJud2Ja?=
 =?utf-8?B?T2tsWVVqeW9vVWFGUnM0NGVhTHFQSTJBb1BwZWFFMXM4aG42cXhsK003Tzc2?=
 =?utf-8?B?eU1XenAvYVdsUUtNUEZPL2ZVRVVLdWIyRDRZK2FSSm4ySlhUM2ltWlRQN3BZ?=
 =?utf-8?B?SGV3TEJSKzdCNVVoYStNQ24zbDdaR3g0L0toNUFXMC9FaXBDZ2dTYVZJQ29i?=
 =?utf-8?B?OTZQeWt1bEc4OXVyMGFMaUJaaERFS1ZIRVYzWDM0dnJGa2IxN3NNWjJqTDlV?=
 =?utf-8?B?QXBsbXNPU3R5N0dyTEN6YktKU0hPdDhOZGNtWUhHWjFTa3pvY3l3eUJCckdr?=
 =?utf-8?B?WWI1S2kwU1pnajAxMDF6MU5DM3V4K2YxdStVU0h3UzdSRklkSE84MzMwcnVZ?=
 =?utf-8?B?NC9mcmhDWnZrN1N6MS83Zk91MnpJc0o0VW9CWkdRZ1BsMW1aZFM4eTFPZnBL?=
 =?utf-8?B?aWwrNEc3Y0t3S0x6TWRyTzVBelJrUkdPbVNOVWJKSnh5MGk0cnNFUGFiK0pK?=
 =?utf-8?B?WXRURENWamYwVTZrQVMxejU3VXd2UlNOSWQ1c0QzUlhSSy8zM1R6UjRDV0xx?=
 =?utf-8?B?QTRmZGFTakg0aUpuSG1xeDBrdFQzQXgxTkNndEhPQkVWNDl2VHo5ckV3YmxG?=
 =?utf-8?B?N1NMM2RtcEwvcEx2TTltczNrbk9zb0tocFV0MVFJREU1WGVWU2tucXZaRXNI?=
 =?utf-8?B?Mm0zOVRpcG1yRTVRYWg5VTdXUWovM2daUnJxbm5oN0h1TWdhV1BISENYN09R?=
 =?utf-8?B?WVdiL2dBcDBDM2VqVGU0emFlNE5WUzE3S0s1bkVabXZvbElOWXYwM1hWSGI1?=
 =?utf-8?B?Q2lKRnNYUjlnNjJIeE4waFdXa2FKMUVLK1psa3VPZ0pMY3djTUNKVTY5TWE2?=
 =?utf-8?B?Y1crNlZJSU5uSEtxazdHNWl3N0ZsM3REaG5zbjBRRzBOQVBPWE44WE51KzZM?=
 =?utf-8?B?ZGI4RDFSRlFyRWh5ZFNlUVBBTXgxbHFSd2tYaVNta0xtbXdvWnM1YjJzM0FZ?=
 =?utf-8?B?YThkZUZBcTRYV3o3NkVsYnZvUEtUekFQSkxvL2Y5V3Awb1pCd2p3UTJSSit2?=
 =?utf-8?B?dDBiRXNLaUxRUE10M0JQZlhveEhueTg4eXFFUUpqbnczWkYydWN1WjNCQ3ZL?=
 =?utf-8?B?SVpRVG0yVy9BRjVrWitFTUdTMFBLdC9KcDJXeFpla01UY3p4MXh3ZTVrZFVB?=
 =?utf-8?B?aWVqdjhkNFozMTdUbkZpVUFHZFRzalZmZEdIV2xjbUFWVlNiamJmckYvZGh6?=
 =?utf-8?Q?Ml5R2McuA1tclhJZJO08Vb6BIIiI7JuaPsgnrIOj+zk/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c84742-2ebb-4279-2189-08de3e39e11e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 13:32:24.7463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMFABBnGpvWKAvB+KDPKaz3QbTuu62FZcChFVA7bsBkPdF7oiit0JOGALJoEnnRyn1/rg99WMfwHwhJaArLV/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5763

On Mon Dec 15, 2025 at 4:45 PM JST, Benno Lossin wrote:
> On Mon Dec 15, 2025 at 6:49 AM CET, Alexandre Courbot wrote:
>> This is useful when using types that may or may not be empty in generic
>> code relying on these traits. It is also safe because technically a
>> no-op.
>>
>> Reviewed-by: Alistair Popple <apopple@nvidia.com>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>

Miguel, are you ok if we take this one through the drm-rust tree? Nova
is likely to make use of it this cycle.
