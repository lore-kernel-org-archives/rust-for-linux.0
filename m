Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4670436C584;
	Tue, 20 Jan 2026 06:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890222; cv=fail; b=SirVGAto+fZ2SXVEBHSmS9Z/PfCllpMRkdeKM0MVLd/d5ZkMIux23UdkZtSHwxzaPer3wFwUs+MFXmwCiT65aXG+lXJyYBYsqCWsozQgD3wjZdZcRyiySD8IlC5+3o8RaXqORHaF0iSVS2c1kbxs/1NHuBCZOHU+aYRe6QIsyNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890222; c=relaxed/simple;
	bh=E0gXj94bLuXQxmyi3dHgGcB7NKsXC9+8bYteKQu53qQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EQvjRyx5h+JlB8WAepZ+UX19CpZJhT5gD8qb1b8MbwCCUo8Z3FKEbSSwMv0N8PWLRGzt3MU/AskS12Idy4rbQbZ8utzIovc103/Qk95ACF6B5QQWgpOdpOAJnuwZbGn0bZ6nM71YAS2gXv2Q/B8ktgOvxpcTA2XkkhBdpq5Opf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=InQbJwNC; arc=fail smtp.client-ip=52.101.62.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="InQbJwNC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3BK+d/YXgZ9KeDoJ+8GREn5ffl+JGgtP+Yf1n5eQrtHTtXacToQwP1QfHn7essx6sPH56lNh17QMrMb2dMJ0S/dJCX8ac5VVM2GxvfKgQvaeNrZYRNBp7gHUSQ1iwpX9ywJHZNDvtwY0HrUdRKPYnE/ZJx3SV7y1N5GsR6ZJ+Q10s2/dv+9VtnAlERyyNtal2R4TXLwKOakZCDTQ2BZNnFWpyV3fXZq7njvnjtyoWvAQGG8+Smw+A4U5jxQwJ2r6Vgv0XHcIdMNbaTHPTs3YsY0rES+glpDXt7mbvy1sDdBAwgQqmjZK9m3E1MV1oQp3JqAGXzI+LcBK5IKR/rY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TvvMqiR6DD4lP2Vq//78/07SvOJahgCHyiE8icvYjI=;
 b=S0i2bTNRQzyLl5zaTNCV11GEC0pEn822lPUQvR3zPhb3tDfoLXaqFUTyE8dyn4Ol47JajoysevIYQ9jEE9LDLAMdfo2YiqBXQd1VapL87/WDy9So+CZIhlQuyM9pz+wQ2Wm3BY83249SFgkv8r8zZvUAiCUtUwK9p5UFjysk+8lgnwKpKQ6T2DAdoL8BSqAwT1aKm7uhzcmg7Ua9TA1rKq+xa4A/R/aBEXpceizInPDlLH6Md2/V/s6qLbfyfUUk99fYidaaWiEouTXUZJhQoG1l+VJrxtDOqO7CyM9rnweXy+3JcXtS2t5fMop/VQHO5ObYvx9oTAVO+qSlZcEVPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TvvMqiR6DD4lP2Vq//78/07SvOJahgCHyiE8icvYjI=;
 b=InQbJwNCexdZV8tOySHStSrXgE/7vc2b7e9OckYy+vY+IZWFFvFv8QR5n8ReFxoowNBXErRZvPfMjC5QUUvB/r5gaAydagEhhgQiJFK0GWbob2ANYzf1b56U4kz7oORgfNLwvdXuwmzX+B+Dc6EMH8l/Rg2unWZUHJq6aFnS4dgvFzHqvKycHP9Mp/63arTayy3Az4beoWv1KkjUvBbRJfVvEMR0mHiR8wWTccC1sM621W4gVfA2Mokc5WrUkZZDwKE7MZMci3FpL7OWcfhxGAnMgET3zvQJorK0LU8Nc+aGySpY50OG07ZGXCCa6m81LGgEYFZT6t7lr8vzTi7k3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB5606.namprd12.prod.outlook.com (2603:10b6:510:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 06:23:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 06:23:36 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 20 Jan 2026 15:17:54 +0900
Subject: [PATCH 1/6] rust: num: add `shr` and `shl` methods to `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-register-v1-1-723a1743b557@nvidia.com>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
In-Reply-To: <20260120-register-v1-0-723a1743b557@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0101.jpnprd01.prod.outlook.com
 (2603:1096:405:378::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: 974d9964-09c4-40b6-5a32-08de57ec71be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTRRZlJ0R20xMU5sUzZxQkw3UVZrdGpGamxBZzNKczJTR1ZBQlFqNUJrWVZK?=
 =?utf-8?B?cHVWSHJia3U2cVAxTUltU2NZbkRYbHdHTk02a0U2aXpkNzVPZHdzMUtrY2xS?=
 =?utf-8?B?ZWluT3N0RjRpQjd1Ym5PbnBUdUFQY3Foby9RV3FkbDIzNnFZam15b1Z6MUV4?=
 =?utf-8?B?M1I0dmRQWmhMMzI2THljS0JsZ1Q3VGVkNXhwS1JJdUZ6RFp4NlZ1aDU2V3Bq?=
 =?utf-8?B?Z29CRUxCaHk5YWRvTXUyQ2RiUDZSVEo3K2lQeG83Q242S1g2c01lTWdoR1BG?=
 =?utf-8?B?Z1liN3FFUUE3RVFCUytKMkZNbEtuVUMvbzN5d2xpREJHdmJzNlRpa0NybU9i?=
 =?utf-8?B?U1ZXS2oyWllWS0lxU2Zjd2VodTA5RlB2em5YNUl4cDhWTXJhQUFVUDBabU1K?=
 =?utf-8?B?N1BnK3h6QzFlcUFOOEtBZ3RQNXg2SEJPdHd5SHNkejJmOGZZdVdrdzlhOTlp?=
 =?utf-8?B?V2ZiTG9lWVo1bmpzbXZPakJzTlcyOHM1TExCR0VLTnAyRTI5eW9YWkhuVjRp?=
 =?utf-8?B?ekFzekVFM0g4RGJBbzlDKzkzd3lielRNUm9peUlHYW9DYW11ZWVKdEVjNlJX?=
 =?utf-8?B?MjJ2dWw5bkh5V1owY1JkaTFWL2VxWTloVmRLNGlLTTVRUXc2a3pSUlorRG9J?=
 =?utf-8?B?YVg2b0NKc3UzV0llNVladzRHc21ZdkZlVFcwcGRSNG1YMGd2VDRjSEJrLzRI?=
 =?utf-8?B?NHlUWHJndVd3ZXlKckN4S2lNZkZUS2UvcUJRWjhnRUJmTmxMMUxWaXJMV3Js?=
 =?utf-8?B?SXhSUEtJb2hxSHNWdFcrcEl6VmF2b1IvclJDWW5TODJPSGlZMmJ3cExicmM0?=
 =?utf-8?B?TnpTdDV2eDZyZjhDS3dXejFpK2JXUm5uK0xjditDWUIrMjhldTNIa3FwdWlx?=
 =?utf-8?B?QnExdUt4blI0R2ZZK2NRQ1VvU01iTER6RFlSWUhNUXJOQUY1cGZITFlZNmNE?=
 =?utf-8?B?c2F0aURrTnZxdkdNeTNFMnRSL2tjSmZoa2s1NDZ5R0JWUmV2UjJyZ1dPcUV1?=
 =?utf-8?B?a2MvUjFTcU1ZVGZyMGlacUhRc2djRVZiRGNSUDFIa1JhOXYzcHNiclFjcVFj?=
 =?utf-8?B?SUxFUzVhZEFuWHo1c3RtQ3ovTVZMNzdXbFpzbGJrbTROVmNyUEVObTJrbUxM?=
 =?utf-8?B?OG1semxmQ0pXRDlQMGdWWUViUTN1WHc1ZEZtL3gvdUVBVG10eVVOSGUvWlZB?=
 =?utf-8?B?OGVDemI0elcrczJOTWhJNGY3MTI2c1Q4ZkgyTXJ1QzArTllwdmc0R09wNHl1?=
 =?utf-8?B?UDdSUkxFR0Z6RWorYmw3MkxweVJqVmc5QmxZZCtkaVdjbHBjNTU0OTlKSW43?=
 =?utf-8?B?WmNoQkxyU0ttOHAzbEtSYTdvRjljeDQxU0w1Z1hCNE1qdnhLYStYbm5lemor?=
 =?utf-8?B?Mm5oc212T1NjWmpidFFCaXF5bzAvMmhyZEJCSDNibXNqQkVHZzRDL2EyZ3BY?=
 =?utf-8?B?UEZpcHFLeW1ibnhGZ1ZBaHRsRWQ4c1dFU051TzhqMUFJRlpnY0t1NUNNYTB4?=
 =?utf-8?B?Zjk0YThjT2xtMkFqR0hGRXZMTTV2c3hiUGk5WkJiOGNNWEgxT2ZSR0FMa1dM?=
 =?utf-8?B?KytKK2RQQ3pYRUJsSGhFK2RqbkJsbHA2RjlVZ3dMdFVjT1NLTkdtWlVFcEFZ?=
 =?utf-8?B?enRuY1RXZUdvMjZvRC9UL0VRbEZHUHJzQ25NSCtZZ2R2SlY4NHo2WEVCN3Zz?=
 =?utf-8?B?Q0hnM3QreHlwNkI1MkN0WXgvNlBndmgzakEwWks3amx0V2E0cHdkTDhsYlBs?=
 =?utf-8?B?RkRhbVhIbE95U1E0YkcydE9GT1RqNk1MKzcvQS9WTHo0WVAyMGtRemZBSFJX?=
 =?utf-8?B?V3ZPZVR5OG5xcHFWRnc1QUJIaWpDZ0V0RkJDN3BlSy9ORGdHYUVNM2xKV3pF?=
 =?utf-8?B?cHpQeWF1M3BWWnNYS0pwSHhIK3FJZFBFK1RuWkU2NGM5K0hFSkl1VnVibWkv?=
 =?utf-8?B?b2l5QnR6NFhoejhodGdNeWtCck5SQnNPRnlRejJLSVZqUzh4dEJsRUxyYXhy?=
 =?utf-8?B?Zko0MVA1VXozYzV0ZVZjU3RKUVRicHFZSy9QMitVdjR1ZHViQ1NNdFpRZTRk?=
 =?utf-8?B?TUR2Q0VSMkZpc2JJTUFEdDRJVnJwY0xRMkFGa0JDckF2UkI1dHNMUUVteitu?=
 =?utf-8?B?VFpNU1RiRmR5WWRoSVJUUGtXUFBHQkJvYjNQbVdCeUhvVGl5dENXVUlRNzJv?=
 =?utf-8?B?YkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTZvd1cvQ0N2UW94ZjMxeVl6WXh2eURjYXJZZnNvMjdtZ25VRTVFMG9LS0ZJ?=
 =?utf-8?B?TkJEbklzSC80Y3ZPWS9ySkNZRmZmcUw3NWRQQ0VHUWlxcEdNdWVPRVI5UlZ6?=
 =?utf-8?B?aVo5MGlDQ2pHNVF1c0M0TFJrTmNQbHFnMmNMYlBmekZvdXdaaVRpSWwvZGtz?=
 =?utf-8?B?UFNRL290WXZvL2tlRmRTL0JsQU1DTEZRU2RzQlRPYlhOdGNkOVFQSVFONVRS?=
 =?utf-8?B?Y3RuRWZ1aVdoVjJvMTQ3UXVIcFJKSmpJd1NIVkdUSkN4bUNtcmRQTjR5cXVP?=
 =?utf-8?B?UzI3VUUvczJYeGt5U01UY0IzTDFJQVdENnZUbGJSTHdoSUVRQm5mVUpnZEhY?=
 =?utf-8?B?QjA2alkvT21TS2dHRUI3MG1pZTJ1TlpzbjNncVFWUkFJd3VEU2Q1bitDZ3By?=
 =?utf-8?B?OWE1eDZwbVZwUHNpS0ozdFBRR3RMNlZCbXZMUlBEN0xaK3hkWk9EdmhueDNQ?=
 =?utf-8?B?TmdUZ2Y3aFNCemJlMUtPaTVNSCtUQWhTS1YvSWhCMHdCSjdOcVFldk80ZWM5?=
 =?utf-8?B?NTFCdmNleWFKRU52VFpRRTE0VTl0SEZ4ditWNS9WZDZmdXNWanlJTlJzenBo?=
 =?utf-8?B?VVFsN0lQeXlHN1FVTXJsampKVGtVUUMvVEJtSWhpSkdLZCswZk16OTQ4NGFH?=
 =?utf-8?B?R29JT3EySXA3SzVzZWNDZ2o3K1NHZXd4eE1PaG1UNHdkZmJ0RTdOQnlxcWZ5?=
 =?utf-8?B?RW9ldDhpeDJuNVphM3o4TzJNYjhUbkhzYkc4UGFhM2hQUFBEd1Q5bUpGVUJm?=
 =?utf-8?B?ODNuVDdDQUFha1pCWUIyanNSNGRiWjVnWDRFdkFHaWdKcUhreWJ3YjZTLytZ?=
 =?utf-8?B?RzN1UEo4bmdBb0d6ZENXM3hIbEtWWkNTbTZmSEc0N2FXb09lb0hQME80UXRw?=
 =?utf-8?B?bUVOZTgwMW1sZEJ6VFJ6cm1EamtxTVNnUU9GeHhYMWZJNHE1cXlwblMzUGJs?=
 =?utf-8?B?cTFRSW00TmxadHE1dnZkb1haWUxFWUdDajJOQ21UYWhUVElralh4VmpvR0kr?=
 =?utf-8?B?a1htZkRwQnFPaFFOTCttU0JueTVNbHNuRWphTFVOQm5oWGJCZW0vTW0rMDVu?=
 =?utf-8?B?Wk9FVEkrNGpDZ2hYdGhKOTBTcVlta1pJNWdxaEFSR2cveUVwVnQwQ1RpL2Jn?=
 =?utf-8?B?amZ1ck0wVnIxQUVyZUt0NUtSOUlQcEQ4NGxtOElCWjQyTENCRVRQcTgzRFh0?=
 =?utf-8?B?S2JrRXRZbG0rMklnN2VYVTJVUUFuVG5Va3EwWG52eSthSnFOdFpKa1RZenAx?=
 =?utf-8?B?blN3dkkrRTU1L3FVTzNjN1JISklBdVc3emhtZ1NhcG5jWi9qYU5lYVVlSHFP?=
 =?utf-8?B?NERack1icUhSeUwrTHNGZ3gwbjJyOWx3YW9YY0ZtYlIzU0dick9kNCtJc3Nu?=
 =?utf-8?B?RFExcUt3L1hIWXhPUmF3QnJRYitCQ09oSjExdXdZQTlVZ2s1bFFJRjdUTytz?=
 =?utf-8?B?S0dKdEQrRmZIbmlnc0pjcjd2KzR1cmtnM2FWNnY3WXhtLzBrTnRkVWtzeXlu?=
 =?utf-8?B?MXB3NW5lZU5UdGl5R2FnR25OZUxKWDV3SEVOeXZQQml1WVhVTzlOOFR0blQ1?=
 =?utf-8?B?R1A3UFRYQXdSSE9ZNkdkTnZHMlNFelpuRnUycGRsTFdxZ1FrOTJ0TDBUM2Yv?=
 =?utf-8?B?bzdPRi8rM0gxQlVYWWsrUHhVZFJkY3ZRUWhJTmFJRHVIWjZCdE01b0FoTWJw?=
 =?utf-8?B?ZUFuRE1Pd0dIWm8yaTN1SXRvOUhrRElON29OcTYrRnRLNnVSYVVMdVRGV2Ri?=
 =?utf-8?B?MnFFMk9WNmdyU2ZhNTJ4eHpSTTRlVzRaTnBFazZRTVpjNVdtdkl0Z0xUQWpr?=
 =?utf-8?B?NVVaci9VSzVLMTMySndzZWtzSEdDYmd0NnYyREZ5UzRhRVZhUDB4M2tESjZJ?=
 =?utf-8?B?dno1QUZLTldaQUIwTklHK0dscStJaGdMN2dpQkNYUGYwMTFxRHRUUDhaTkFv?=
 =?utf-8?B?ZWdrQS9GZXN6REtHQUI5aE84MUc5NTg3WGZqc3NlMHBzM0xPVEx4YldEZWNw?=
 =?utf-8?B?V0ZTNThTQytTMFgrd2N1TnRiQ2J4dngrL0UwNkF0ZTFrbks0Ry95TUVZbmVn?=
 =?utf-8?B?RDFxQkd6bjFjR1Y2bGd4ZDJjSGFobVo1S0NBa2Z6Zi9CRkpacDA1amFoWkZx?=
 =?utf-8?B?emF5YWxDWmtqQ1BpQWRsK0pjZXdnVEhHTmtoaDZvbzYrRVhTcVVzM090WTFp?=
 =?utf-8?B?Y1dBblJnZkhXZ1cwd3N5RmlyeHNGdTgvL2Evc3RJM2ovd0ovUHlINVJ2a2x0?=
 =?utf-8?B?dFFQc0hMaVNLSHdWL0F6SG8zTTlBUy9YTkVwNU9BMXM2bnZubTV2VmlUSWVR?=
 =?utf-8?B?NURIWU5nTlJvTWdLempNUjBJRGJ6OENLako4bTVHU2pSYTduZEVCbXU4SXp5?=
 =?utf-8?Q?2eW+XMlmtien8A3IRGGG5jBALrssQNzDpW8p3cVkUEK6I?=
X-MS-Exchange-AntiSpam-MessageData-1: EoFNRWAD+eJeJQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974d9964-09c4-40b6-5a32-08de57ec71be
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 06:23:36.7538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AoMvBSorPiqjhZNGCh64R2Qwt5l191YsJ8FjQJeuokgP+oWckg8y2oouNLN7e9ITPy/pE6FXcDc/ypV1ti7F2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5606

Shifting a `Bounded` left or right changes the number of bits required
to represent the value. Add methods that perform the shift and return a
`Bounded` with the appropriately adjusted bit width.

These methods are particularly useful for bitfield extraction.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 5ef8361cf5d5..6e3f4a7a5262 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -475,6 +475,46 @@ pub fn cast<U>(self) -> Bounded<U, N>
         // `N` bits, and with the same signedness.
         unsafe { Bounded::__new(value) }
     }
+
+    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, { N - SHIFT }>`.
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
+        const { assert!(RES == N - SHIFT) }
+
+        // SAFETY: we shift the value right by `SHIFT`, reducing the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES == N - SHIFT`.
+        unsafe { Bounded::__new(self.0 >> SHIFT) }
+    }
+
+    /// Left-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, { N + SHIFT }>`.
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
+        const { assert!(RES == N + SHIFT) }
+
+        // SAFETY: we shift the value left by `SHIFT`, augmenting the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES == N + SHIFT`.
+        unsafe { Bounded::__new(self.0 << SHIFT) }
+    }
 }
 
 impl<T, const N: u32> Deref for Bounded<T, N>

-- 
2.52.0

