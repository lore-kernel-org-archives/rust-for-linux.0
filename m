Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010017.outbound.protection.outlook.com [52.101.56.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AF4211A28
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 00:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764289739; cv=fail; b=ccG5EHOtbh0CaD5o46WLtWBE/diBm2DwHhnRma3dNhSQhmo3JNHiLRIa16uBlMBGi2kgeftbVSQANAJVqUQooIH9idpDFtP7RMxeMFg0+W6V2Rc4R+7QqUzek32IwpbM07Mh/gyeb+xXIDpUmDdG8nRzSEeY0PPh263GqGZspmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764289739; c=relaxed/simple;
	bh=itsyMjACNCTjBuj8xKA6rcIuSVE5tk+C5PFkFNqRnHI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hVTWMWA3RKdzU3BDylLOaqr5ERCrxhtb0VOSZ9hmbIx7RRIZgz53oCx7c1GCYT+J7OhFpArFrDC7a/RKUMCHUC/UGkwnmWzs7xRgKs6sFkU6yH7Yf/43c72PbGWYMyp48XNynG+uguUUWCYkj5PCymax48jscRg6Bdt+gcjifys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WD20ax7w; arc=fail smtp.client-ip=52.101.56.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WD20ax7w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8Wbs4j7EZMBW2w97tm3n+pNG2vfs5DYSsyM2ZAYNyzZ17kmPzsdbiax7WBam4rsNDVPmIBzAopQLVweRWjpHcqNjfKETr5Epf1o3fBxGwLHn9NyXxqn9VhnDmni/hSLzzuTDgbN0TXevEC+bb5AksAOXgy4KYxTVUieLC32ASGBxO1u2BAd4xbOveEYa3mdnmtcppDyk0M4Pn1ErjILr1oXZpOeKeL2ua8c8J1J8DBiJWjKD6A7O87fDiUUOGvvnk0oaPnzw2dpzWVY5oKGqcdyZ8kIBPUT2l9AwPvYaAURR+RBKM7J6iKAYU/KwvTyMjXbnDZePIAfn3n+LzhRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0JK7xv8XhltcBa8ZfQnme8bkO719SyHXV8ZGspT0R4=;
 b=PRRT8qslP1fkIpj7opcR1dwPsa7oxQM6w/MA7MGnR5ndBWEwzP8tdGH9BHmjXP/jQnPkfaDiw014eYT/70n4wxc0HybJNQuqhn0kE/MgDGGMNabs51ghg2Ib0adC0huW/OGVMXxa769UQK1dDdDHRNSdyi+o/CdDyIwL+QOIg1dNhVt/x21JePfo5JqI9MMdsCVExllTRrAjnLt2Ggq7enN+I/MdI63ZAA8iaTDDsa/HFgDCla6Xqx3dHgWC9vpCF1HRGGHT9zQUwUC2SEDQ9BGdg8qWyJuka2+U+JwWW+Ixzp+FAjeL2aKocd8IN5o1H98BcLyxkQAJImtQEFt3SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0JK7xv8XhltcBa8ZfQnme8bkO719SyHXV8ZGspT0R4=;
 b=WD20ax7wRJnHg3jNth3218T7NQ7VMKIGdKFxzSnAfk8uCKbMtW0JgK1AROT8nFRigEqpLBKMjE5n44RVjPKmUv2ExaCE7HXID6sHXgZuxNM9U+lVeyutbu5AHchN2f7w7zE/fzqNELdtgT9c2f9QjwtGDUJ5uK/GTDVQ8iH67CsW+l21bxw8EL5pY9UEsCD24IrpGDg17zhFfqmn/dn0jfDb9567A5ZI8S/5suCjdUmF7JZTVRJ5Mbfp7Nfyj7QDj939G6bTTNo/Q189iT2bl/6sRB8qn9tBoRBIt7P+HAbDkD9EvgtoOXDn2WrGeZ6TAeIx1LbEcrV9XADhdXRzZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB8048.namprd12.prod.outlook.com (2603:10b6:806:31e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 00:28:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 00:28:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Nov 2025 09:28:46 +0900
Message-Id: <DEJWIFG5Y65B.17EZVKB63RUJ1@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <aliceryhl@google.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: Return Option from page_align and ensure no usize
 overflow
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Brendan Shephard" <bshephar@bne-home.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <aShM9CAyRPe2gYpK@fedora>
 <DEJIRMFOO880.1V1IA1QDH9WQ0@nvidia.com> <aShdutWrmU2q7gUT@fedora>
In-Reply-To: <aShdutWrmU2q7gUT@fedora>
X-ClientProxiedBy: TYCPR01CA0209.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: f043185a-6734-4443-b0cb-08de2e151af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjJ6TWtFQTJYcnhaQUxHYUpBR2JhYVRKdUQraTI2UTFwNFVlM0ZGb3MrS2Z4?=
 =?utf-8?B?ZFZ4RytmdklaSDNaTXVaR1JOMk9seFpzSHdkZGQreHpnS2lXRG9KbC9neDF5?=
 =?utf-8?B?QlgvSnBqalM5aGxTQVh2V2YxWitJTkdVb2NFRW9FdTdpb3lNK0o5L2ZqOUxM?=
 =?utf-8?B?b2ZEZkVRM2ZyVU1DMjNWV3Jzd0ZOQXRYWWV5dkJxZXh2U3hjOVJNUW5jTG5X?=
 =?utf-8?B?UTdBS0hmVTh0MHFkaUZYUlBFdW5EbGljc2FxRDdTU2JGdWwzYnF3eXYxbmhL?=
 =?utf-8?B?M2RRSVV6RlUxU0xyR1JRL0JHU05KQWVuODNlSWRVZUtuejAxSlQ4M2I2QTk3?=
 =?utf-8?B?QkQwRTFBcVp3MlAra2plTFhoczB0K1dKdWFRditTbmpSZGdKWmg3R0kySjdS?=
 =?utf-8?B?WFdJeWIweDU5clR1a1FMam5qVUMrcWxKYWRFSHZKMFlBUWNNelFNRFVuTUpS?=
 =?utf-8?B?U0pRaE9Dc1NBcTJKdHVISVBuTFNUZmJzVEZIaUhPcUVIUEhGbGlyb0dDcU1i?=
 =?utf-8?B?NHJvZENPRDg2OTU5VEtJMk0zWmg4MGh0NkhHbDRmcjNQYUpsSVdpQ3FXckZl?=
 =?utf-8?B?NENMUEsvNW1Kb1VVamIvazVMNUhhRitpTTI0Yk1xblhWSmRJYm81YUI3K2RU?=
 =?utf-8?B?SmlWVlBqaUFqd2Z1R29jN2QzTCtaanZnbDRrWTlYaEk4NXZ5d2E3MG5rVHMz?=
 =?utf-8?B?bDR2MU10aEo1bkxCNktNU3UxV2JNL1V4MnhWZFNEVUVUc2RjVEZzdHVsZGdy?=
 =?utf-8?B?VkdnU3JsQmcxSHNOVFVUYzI2YzBwL2s1dXFpa0RjQ0RYYmVTbTk2bzlieEFV?=
 =?utf-8?B?bFd5TStKYndOV011T1ZuTFZwcmsvOUVZRUd6NXR2Mm94dVErOGNlMERiRXNF?=
 =?utf-8?B?Qkp6d2docmtvSXhsKzlUWmphd1RvSmFhNGU0dkhVMGtHTmZJZmk1MG1mcWZ0?=
 =?utf-8?B?V08vdlRFSjZZYVhza2hqd2xUSkVta2FGSW9FQXdNYXVhcElEaTRPZ2dzaEdj?=
 =?utf-8?B?czF1Nmc2VlJvbUpnV216Ri9nQWJhbHVnaGFwWnpUQjc3R0g1WnpkUFRWNWNm?=
 =?utf-8?B?eThkekduYnN3MnRMRCtGNVJDcTY3Wi9zODVjWU93U2dpeVVUaTdER2xtbFZU?=
 =?utf-8?B?aW1udHVhcFZxT2h5d1F3ZHNCVDN5V0lDdHY5UllGckpRWGEwK3ZDQ1lidzI3?=
 =?utf-8?B?ZC9OUW5ZRzErWjQzUUFWU0ZjTm53YXc0bGh0RERUa2ZpVXBMZVdzRUlxNGQ2?=
 =?utf-8?B?b3RGWit6bzlFUmlqckNxMys2Mmw4WHJTN01FOG44aVNHSmlGRmprT3lBL3kv?=
 =?utf-8?B?WUxXNC9LbGY3WWYxSko4T2lUbDN0c3NyTjdyV3RWZVZNV3NxWVZGOW00ZDI1?=
 =?utf-8?B?SzY4WmlKbCtMN3dpRG1lTldIaUpTbHR0WUVuTjNrZ0JyNi9hcjk3RXVGQVdt?=
 =?utf-8?B?SWVINDV4S3ZjQXFZSjFiUkxvSEppU0xwbmg2amR1NWdNYkJjUlIrODRCZlRw?=
 =?utf-8?B?OC93VGNFVGdIeGlBNE9YQTc3ZU8zL2dDaUhmdjRZdUc4SGZaYW5WM0RPN29k?=
 =?utf-8?B?Um1BbkhFelNJTWZ1dzFWYnlTMkRvb1dXNERiVldoY2hKdEpxUk90TmRwdFFV?=
 =?utf-8?B?ZDNwdURRdGRQTnAwbzRYQlJHa0xaNVFJMVFGWXRXSmZuVjAwaldwZkpWTXBY?=
 =?utf-8?B?akRTN1EwTmVFUTdkZ0srTUR6WTd0Sys5djdDSEZKdUx5a0lTSVA1dm1QU3ZZ?=
 =?utf-8?B?VkE2YzdsYURSam1yNVJKcStZa2xuejZyMjFpeUg0aXlTRFBlRzRaYnhDTk8v?=
 =?utf-8?B?REtMeXd4OXRxWnovSkRHZ1hHVzhYdmdKa0taSENIRnNVOXhwSjlvcXp2cHNW?=
 =?utf-8?B?a1V1b3lWUkQ0eGZhajNQU2dYR1dPWEpkcU8xL1lhS1BWc3dXTExKd2RDZjhF?=
 =?utf-8?Q?sWGZ2cySNQhHGJiA7gZcrt0qctnHXC9P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3dZU2xkaERKLy82T0t0cHBROExIZVVvaXY4Zjg0K1RUTEZSSFlkYm0wV1Vu?=
 =?utf-8?B?ZFAwNE0zNHNMbEpPazlSSXd4UzJiZnMxd3p2ZzYwQ3g1ZHZCeG5MMzZjbHpJ?=
 =?utf-8?B?dm96V003ZitIUkhRSHZjanFROXlka0tIcUhYR0REMFhQaWk4QnE4UklNOFNp?=
 =?utf-8?B?Q25CK1RkeFJXZEFVUWRJVWlCNGxVQkZ0SzFrQXBrbXBwNU01Z0ZwRjRRY3Y1?=
 =?utf-8?B?Z0poVnphSkY0bmJMTy9wS3JqVEMydjYwdXBVeVg0N2hja2FJZkJ1ajhneEhq?=
 =?utf-8?B?NThEZG13cWlaajV0Rk9Bdjk0N2REL0V4ZkRMSENnVlhJQ3pMVm40Sk0zekl2?=
 =?utf-8?B?bnVDb2dRZEZqL0Fwek8vVVlYL1JMeUtFemZUeWtxTVQvdVV1VHhPa3NCRHZ5?=
 =?utf-8?B?U3hJcnVRQ3lNMy9iZjdJUGhaczQwTytJZHA3b25BcWtPRlBraDdYYkcwU0o4?=
 =?utf-8?B?b3dUeXNmZXFRdG5vTXVkWHZMcXVRUFh0VFhrTVJSWUlRVlR4VDFGVFpoYWpL?=
 =?utf-8?B?dXJ0dDcyZ0FwYjRGYkUxU3JOSEI5OFZ1RTUvM05xMXl1djY2REREVkFHQk9B?=
 =?utf-8?B?Ui8wKzJETnJ1YnUyWndjYVprNmdIL1I0aHhnaStFekwvS1Z2aXUraGxzZ2p5?=
 =?utf-8?B?cWhNOVFrODd5bWtCeDdjUHdVNmt0bUR1TWlFbERpNWRHZzFIR2NvNzVMRjMv?=
 =?utf-8?B?OVdSK3cwaWJWamQvZ2YzQXNnQjdkVmpjWldvU3pla1VnZzVmaDRVQ2RITUw1?=
 =?utf-8?B?amtKazVOM0E2N0ZZT1VSdXNDOUVqN2dBR1FGUjIyYkRncXJudlpCTWZha29U?=
 =?utf-8?B?cTNYdmZjNEZaQkt1Tm51UTdDQ29KdU1ucnFVSEl4Zk50RlQ4TGl6MGRNMUZ1?=
 =?utf-8?B?NTFWRFNNOXZ5ZjlyZjhFOXBGRXBDNFNIYXNPSkVPT1ZkRjNuckovRjFUc2t4?=
 =?utf-8?B?ZDdDYSs5K0F6MmEvTk9qM0FPSTJjWjdvUDYzViswYzdaVFN1M0dKWllsKzdJ?=
 =?utf-8?B?ZmhzUWJsc2RHTy9xeE5vM2tocmZHOFRmYko2TEdRWWZhTFQ2U3dXOHNCZEN0?=
 =?utf-8?B?b3Z5VE5kWlB2MUgra2Z5SGh5cmFLY3g2MFg4ZG45eGNLZlNFU0hjWHdUREYw?=
 =?utf-8?B?NW54a0RIQXpBdTZyVURXMWpFTVdXNU5HMHVEN3RGeE92TVNBaTBlT2Z0dk5u?=
 =?utf-8?B?U2EzU0pBUmFEZGQrbkNhQjlXWTFLRmxoaFo4dHJacUdUNys4NUw1SS8zKzhK?=
 =?utf-8?B?eWg0Nk9xeW5obUFjNk5uMnpjVndWMzVqYU9YRklvZHpseG5CMmI0RFA4dFpH?=
 =?utf-8?B?VFJYT3g2WHVyWS9JYlFtWFpra2ZGZ3Q0RTE3TTA2WklicHFUZ09XdFNmQmlZ?=
 =?utf-8?B?bzVNNURLSmFWSUhEY1N3RS9TdHQrc0taWVVRaFh2WjFjTzlkRmc5WFZLalND?=
 =?utf-8?B?ekV6RkFOdDQ0aWpuZkdFbi9FU2pNVXRybDRaQkdEMXoya3FrZmhEeStobnVM?=
 =?utf-8?B?bEJ0d1VwY2hTLzc0ZVI4MXkyY1NBOS9KVnVoUUxDbENHSkV6czI1N29YUGNz?=
 =?utf-8?B?eUo4cnNySG1YTWRCNXAzTmJFZzhFSmxnVTJ3S1VMZUpGOW1SR1hJdkFzUGpq?=
 =?utf-8?B?dVhPb1h4aVA2TS9ZTGFReXgrUVRoS3AxNW5uRUg3aWlDQU1PQW8vUlN2ZStD?=
 =?utf-8?B?WmtIYU8yMkx1S1RhcWJXbkJsM3dpYk11UmRYVFVLR296d2hKeG5CaXNiK210?=
 =?utf-8?B?cGlvK2tWMWJoVjNHSUpSODYzcXp5UGxQbFc0eVlwRlcrM0hZMnRHT09ocWtJ?=
 =?utf-8?B?VU5YeHNVQXdhbWJqVm5WZEhXaGJITUtGTlJMVTM1UGRSTy9oVDJUeDNiMFc3?=
 =?utf-8?B?SnhjTkVoWk10TmsxWmE0NnpFRDhRWm12cVdwWCtJSDlTYW02UWNpYTdKZlVW?=
 =?utf-8?B?R2FvSXpVRVp1Y2picjBpSnJiNkdtUEwyUERCK0FReWZLeVpoT3p6VWdUSElv?=
 =?utf-8?B?YjVHSnhYKzJCVmZKMTA2U0lpVUpZTURWMjlqb2tjNnM4RHp1djFpQ1VJb1N5?=
 =?utf-8?B?aWNPSTJaajJlZTNTTkRpbG9GSjNwbG91UkxhTXRRVmZYWjN1TXRUL05JMExJ?=
 =?utf-8?B?K1h2c0VsdG1zYjFZUkxJa3hnQTFMMzU1NGV6ZklKUWZYYkRqdmNmSStJQXdr?=
 =?utf-8?Q?tkldR4mVa+8mff1JL82nbikBLtnICpJ7RN7iw5KDLW69?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f043185a-6734-4443-b0cb-08de2e151af3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 00:28:51.5731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlYAzUSceYbL2iFtBZbW25WfbKiDjWIyfwvLUGykfXDV+5SZJZ6YWtv5BVftWwhN8Kb6fZqqSZGXgi0GkTLh8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8048

On Thu Nov 27, 2025 at 11:18 PM JST, Brendan Shephard wrote:
> On Thu, Nov 27, 2025 at 10:42:31PM +0900, Alexandre Courbot wrote:
>> On Thu Nov 27, 2025 at 10:07 PM JST, Brendan Shephard wrote:
>> > Changed page_align() to return Option<usize> which allows for validati=
on
>>=20
>> Please use imperative style as per the patch submission guidelines:
>> "Change page_align() ...".
>>=20
>> https://docs.kernel.org/process/submitting-patches.html
>>=20
>
> Eh, my bad. Yeah, I'll fix that in v2.
>
>> > of the provided addr value. This ensures that any value that is provid=
ed
>> > within one PAGE_SIZE of usize::MAX will not panic and instead page_ali=
gn
>> > will return None.
>> >
>> > Callers of page_align() should raise a EINVAL when they receive None
>> > from page_align().
>>=20
>> Callers will return the error that is relevant to them. :) This
>> sentence is not needed.
>>=20
> Ack, I'll remove that part.
>> >
>> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
>> > ---
>> >  rust/kernel/page.rs | 13 ++++++-------
>> >  1 file changed, 6 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
>> > index 432fc0297d4a..b78473b67003 100644
>> > --- a/rust/kernel/page.rs
>> > +++ b/rust/kernel/page.rs
>> > @@ -26,13 +26,12 @@
>> >  pub const PAGE_MASK: usize =3D !(PAGE_SIZE - 1);
>> >
>> >  /// Round up the given number to the next multiple of [`PAGE_SIZE`].
>> > -///
>> > -/// It is incorrect to pass an address where the next multiple of [`P=
AGE_SIZE`] doesn't fit in a
>> > -/// [`usize`].
>> > -pub const fn page_align(addr: usize) -> usize {
>> > -    // Parentheses around `PAGE_SIZE - 1` to avoid triggering overflo=
w sanitizers in the wrong
>> > -    // cases.
>> > -    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
>> > +/// Return None in cases where the next multiple of [`PAGE_SIZE`] wou=
ld overflow a [`usize`]
>>=20
>> You can doclink to [`None`].
>>=20
>> Nit: dot at end of sentence missing.
>>
> Will fix this in v2
>
>> > +pub const fn page_align(addr: usize) -> Option<usize> {
>> > +    if let Some(sum) =3D addr.checked_add(PAGE_SIZE - 1) {
>> > +        return Some(sum & PAGE_MASK);
>> > +    }
>> > +    None
>>=20
>> A more idiomatic way to do this:
>>=20
>>     addr.checked_add(PAGE_SIZE - 1).map(|sum| sum & PAGE_MASK)
>>=20
>>
>
> That would be nice, but alas since this is a const fn, we can't use map h=
ere.
> I assume that was done for optimisation to ensure this could be reference=
d
> at compile time. So I'm not sure we want to remove that optimisation here=
.

Ah, indeed. In that case, can we make the if arms symmetric:

    if let Some(sum) =3D addr.checked_add(PAGE_SIZE - 1) {
        Some(sum & PAGE_MASK);
    } else {
        None
    }

