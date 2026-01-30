Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCAF29B216;
	Fri, 30 Jan 2026 00:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769734717; cv=fail; b=DYL0N4c5kUotogO/zkeUHVu66MyPD1LPXcI/DW+O65Cq+j5q0ayjR49Qj4urKN3NZWRHxFetanhA7g4yFdSQEPCcX5pPraNfXSgryAJrfgU0L8/6nJhlfZpuWCzs5hy91Hkj+agjCJzdJu9yA+/POSB4kubXFO6A/E4PBopn50o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769734717; c=relaxed/simple;
	bh=bRKWt+X5g4POhxuTY1OCeTmeBaI1gm9xBvgSuHdGzJk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Yt0u4uBsfKoY/qd9PsJzHZPlPCGw3YIobojeSsS/6aQOHUCE/VJjuYvq3a804pgHN3Kf25jnY/BrzP8x2OG6DmoqIVnqj/Eg/jYcFDFr5QPC1dY6CJL7YFdj/9+Bs++TLyWCWUulLG6COrvQ9ZsxPltFmBsJbuBhqPei62Q+0XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k+7K3hj8; arc=fail smtp.client-ip=52.101.56.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k+7K3hj8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHafmonobjpX6jHkeUlDLYqYnQql5l3h9GK60NSyfi6b4A0HYvxhw3Gs1NN4WYxqLPQLpc++u3nW+PK6fPxv01O/WIJYkW4zbBzJPy58MVqIMfSd9CZ8MCLsAiiSal5HaGfYISjgjQwJgHl7+shg7g+JaxJlft7mxuj2GKtFewHXJidCZfvPxvuvsvFPaJvd564396/Wl2+bees6N//2q4Ihe2IZFssz2rZNJWesAL0C9hLnZSBx6Oa+49G65QJVO4eBKHR4nthE5dICoNLvXkFBnibiVpiACY5Ueee6SwV5lY1VWE6ukqSwRITDgXEDqN0sAriqgmJzpTNyOhS2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuacO3nF9e+fs8iTzmB4uvuLGwSPGxjox1T3NDX0Be8=;
 b=bA1Cv64/GV2Yntgbd7gJeNTL1kjUg/bl2FuCd/wAxpeMMrxorWu7+BRBU+IBFe3+DuETsu46696KduUygay5saYffls+8TNWlM2J0hR8TZlF2uIGl9U+zXOQwuCzuWltlrU8eG6Xh1p+As3i7N8BKnHEOP+a2nqQwJw7c2TZzgMXrBtSef0RtmhctQ2ewcFdpxJ4Eedizp5kU0bkMqZd8hxStVCld5uIb4tmd9QDiG/uPjCURxET9snU6Yvxn6Mnj2t0v1oWnbqmJVy9Axf67ReTlvKT6I5vR6/qjymNP2WOs0aycWG/MA4Rde++6k3mrQBXNexM7P/o/+TTFZnxqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuacO3nF9e+fs8iTzmB4uvuLGwSPGxjox1T3NDX0Be8=;
 b=k+7K3hj8TsgCL53iSGhkwWY9y320LOSPxFwPtkFr3Q32eB1jSsF9OthA+Zkrdn9jhJsVKuTLGZON5ckd0NNHliJwGsCjpvHWbXrdvllVdADfwCKrRd7H1/7gyiMtdQGfSWj8kBCTNGJQtipFRZQ4eiR8OgpDhAUE6nG8h4r4LG6u1hlGxrxfA0KhUb+z/MZoseZOMRPUj3LwGdYuujaKl7SWFWCAPYCUaf/EeiKocf5UbYtt804hejZXRX096qRKG3RsJB1rAsQr6RYVqe1LrH2ZwftfgbxcqedSBgGeGGPqQRPnBp281MoAgKx6nwcwTz+Xlr90Z5J2i4fdTjHlpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6463.namprd12.prod.outlook.com (2603:10b6:8:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 00:58:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 00:58:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 09:58:27 +0900
Message-Id: <DG1ILGWLJFZR.Z130AHWO84HY@nvidia.com>
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
Subject: Re: [PATCH v4 4/7] rust: num: add `into_inner` method to `Bounded`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-4-aee3a33d9649@nvidia.com>
 <DG0C68O25Y9X.2X8M9OXMW17IS@garyguo.net>
 <DG0X202UKD4K.13ERXKFN9XU7V@nvidia.com>
 <DG1CQZ54QY3K.28BHAW8Q3Q4A4@garyguo.net>
In-Reply-To: <DG1CQZ54QY3K.28BHAW8Q3Q4A4@garyguo.net>
X-ClientProxiedBy: TYCPR01CA0206.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: f80838ea-c8bd-4c8c-d823-08de5f9aaf74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzVpRmxJSUVydy9zN0RHRUIvUDhRQStvc3dxYm5qeTBjdUtzQndIa05PTllI?=
 =?utf-8?B?UVlNOVpYZEQzaFcyblREdDZ5VGZmbm1DcExWWElnRThXZ3QzMlZNVmxxSmxi?=
 =?utf-8?B?N3lJZ043NWxYUW11RldwcEZtTHUzQk1yTXgvSkFaMDhraGVWZW9Dc1FiZGFT?=
 =?utf-8?B?R1JkSThDbmdGQTJRL3ErTXUrNitYMUlQaHY1NnNQWTlvbkVka0Y1SlZtdUo3?=
 =?utf-8?B?OGpRanRmcFZQZk5aYk84RUI0WnB6VktJbWc3MmFXdThvbzdtN3BGckRkUnJq?=
 =?utf-8?B?ajlFbFNycENOK0JPZlFYdjl3WGl4OUExNExaMGlXb0dZWUZoQ01hclZKMVhx?=
 =?utf-8?B?STNuTHNxV1dHM0lvVmpsaWhxczhvNmNOSmlXQkYrRURYWWxYdEY5eTdUSEZU?=
 =?utf-8?B?Q2gvd1JBanNtbzd3bzl0RXdtNjBUSFpTaFUzcXRFK1pzbjR0ditHU3JHeUh3?=
 =?utf-8?B?eHU4SGtaaGVadktRYUJJbUxwelNjajYydWxUWUNVeXpZbDhpRnR0WDNBbith?=
 =?utf-8?B?VnBBR3JkVkhZQlJPNm9aRTJzT0hONUFyUjlZWXQ5SmFrQ1g2SjhSamZjcEhq?=
 =?utf-8?B?ajAzc29jbUxLbWZqbHVybVJkSFVJdG1oMFNaa200WXorZ2EvL2lDdXRwdFVY?=
 =?utf-8?B?ckZ4OTVFSjFMeWl3NjExbGtlY28zM1hUQWVmc1V0dEZIL0xLOXI1aUZ5bWlJ?=
 =?utf-8?B?b1NaSUZqTGVVd2drcXc1Y3AybW1EaXpPZGNDcm9ydnJ5emtlVkdDNzFGMnMv?=
 =?utf-8?B?eDYxL3huSlM5YUk2blBRcHgwNUsvdFQrR2tCdVc0R0pXR2NPb1FBTWwvRWMr?=
 =?utf-8?B?Tll4TFlqTnVsSWNSb3lzbzhsY1BXdzNGb01LRitYOHhIV2M3c2pGY2NpMWpm?=
 =?utf-8?B?Wnh4Sk9XamhsSWRYNnhqN3pmMXVrR05TL2I0akd2RG5hUjluOXBuOEh5TEJG?=
 =?utf-8?B?WTFyWlBoWXNYelZZRzFpQ2JmU2R3RUlvL09NREF2Z2ZFOUNESDVKcW9ISmhn?=
 =?utf-8?B?K09JUnFGOTlDcWc4Ly9LTHVtM1UzWlROQXdZbFJsdFlJVUFVRUlOajVwZVg1?=
 =?utf-8?B?SEt4endPUlcvdXRaa25WcVRiYkkxa2l2SlRFUG1tYjFMTFdtd2NWSUN3cnU4?=
 =?utf-8?B?cmtobnZmMUNMT2NZWjV4OW9VdXl6Y3R0SXRRb2xiY1NKcFd3OUtsVzBDdk9Z?=
 =?utf-8?B?S2FndUY4NVBUY05RZVlBZDNiTEhnb21qY1J4eXI2elFBRVE1NUVDVDU1amt6?=
 =?utf-8?B?NGptQXRHb0lnUkI0cDVmbU5QcnhlQUx1NzZSQnNqTVVCZk53MVd3UWdkRlZo?=
 =?utf-8?B?Wlkxb0VZQ3hTZEhsREtXY1JVYm9hWlg1cjlrQU5SZUMxTHI3TjVxR1ZJR0FT?=
 =?utf-8?B?Z0piWUZ6eUNJemlFU0lleGlFYU13MUxySWhaM0FrUWw2VDgwaXl6VUhXbHgz?=
 =?utf-8?B?ZDc0TWdMUXMwT2U1NHMzQi81ajRCTnFwbXBVc2FEd1VlSDkzR1RjaDJOVDFI?=
 =?utf-8?B?ZDNnRnRjNzZPZExKejVHb3ZReGJiaEY2d0wvZEJKSlBlZHoyaDJDbXZKb2dn?=
 =?utf-8?B?YURib1hCd3VoOUc2bWRod1dwUDEyQjY0aGNyMDIwakgzRmVzZlVhTXFVRkJr?=
 =?utf-8?B?WVNaWERraytFRGZ4RnUyT3JLYW5aUkxvVTBWRzBMbjh0UEZLV2pZdm1USTVu?=
 =?utf-8?B?RTBFUTlRWm03d2RhQXY0Tm1GTzJmeGg5WUZHN3ZjT1dxaEIzNFRYelBBVXNt?=
 =?utf-8?B?NjhFOWlqZ2RybGxPSmwxdFZ1cXNrMkJzUXdOMEwzL1dTL25aa3V5YnExbWc5?=
 =?utf-8?B?aXk3aDFGbnM4aHdHOUdOVGlYMTMvT1RTanc0Yk9EV1dENC9vRWVoQ2ZNRTUz?=
 =?utf-8?B?UklNcy9qcnI5ck5mREI2aFJYeVNaOFlLM201Rm1SejNYRjFQQlIrdkFZMXBZ?=
 =?utf-8?B?Qk4zRVkrNXBJVVhyZ2N0dkhyZEdrUWlqRWthQkh2RDEwSUZweWRwYkVLZkpm?=
 =?utf-8?B?ejdRT3pmcitWaEN3U0FheUdjQkdCWkdaTXRiK29LZVZJcHo0R3B2b2xERFdu?=
 =?utf-8?B?M0swV0k2TFlaeFlCUjVyaG1saWdiY2E1RjBiRXVpc0dLcDJRRjA5Z0hIOHZv?=
 =?utf-8?Q?49VE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHB2MjRQSC9Jc1lHWE8zUy9RaDBoR1M2ZWxPSCtockZoZzd4WTRSYU14MTdt?=
 =?utf-8?B?eUZQTWExQSttYVV5Zk5qWDNjcEdzZ3FlMllncGRSS04vNEN3a1AxSUlhRDdM?=
 =?utf-8?B?aGpTeTh6Zi9HSk4rM1NKTkcyeHVLYjd1RG9DcWx1eDk0SmhHSENRcWFVQkRD?=
 =?utf-8?B?eDE4Ym1HRjB5MWFoM2k2RjcySCtIL0p1cEFxeTBTMnhxYkZFQ1pLOXhta3Jy?=
 =?utf-8?B?UmIxYjBtUUNxVTNEcFFkY0VNWmpzc0VBUUhxVWFUVWZDaU9GMjdMZFJ6ZWpB?=
 =?utf-8?B?WUwvaVFkZUpIcmYySzliZmczQlVnY3kyYWxsWDhmSFAvQXRwRVJaa0tOUlY2?=
 =?utf-8?B?TlBHdGQvekx6WW9CVHNENU1pQ3BBRnhHTzlzdzNrZlhvNU9ZWVlhZG5vLzNn?=
 =?utf-8?B?dlU3MWZTMjdMVmtvUnVqWDRPYWR1SWJxQzJzdTdJUEZGK2pBb1IzWGg3amtj?=
 =?utf-8?B?V09HT1RMYmhzRW1jMDRDRmlLN3VSSGRQdFVwaktqdDB4c1hmRXJxNUd4RHdK?=
 =?utf-8?B?UHQ3MDJaRm1KYTZidFFZdGF4b2pRVWplVEk3elFkUThIWWY0Ukd3NXdDT2p6?=
 =?utf-8?B?cnFqT2MvaEZqU09OKzdVQlpNZDRkMy9JZEJURXJ0SDVDODZuZXVtODdqZFZS?=
 =?utf-8?B?dzBlTmhVM0RicVpQckRqQ2YxYk9UN2IyZTAxUWVPekpnVmNKZWhMV0JwbVFv?=
 =?utf-8?B?c0hwS1lpaktzNkxiMlVtN3RaOWRnWjllUEk4M2p0VWN5V3JyY0Zha1ZLQjhK?=
 =?utf-8?B?cWQ4bzRTR1dGSHlqZHFjZTFTTE1yYVdGcDNDTytEYkVyK3NGOVlLc2RwWFJM?=
 =?utf-8?B?aXY3N2dMYURHbE9GNHlBUmo3NHJzSjRsN3RtcC84aE5ET0V6aVBFS3hFQWJv?=
 =?utf-8?B?cmwvN2RROUdSOGJ6SFp2aU0yK2pXODFhdnlYMFJUeWhXclB4alpkNU85V3Rn?=
 =?utf-8?B?SlpDN21BK29qNmtMVnQ2azJRT3IzbVVuakl4RDlKZzFIa1ZxTll5YlZvK0Mw?=
 =?utf-8?B?Mi80OGRTSGFLdWRRSFRrd0RRcnAvR3dNRmtWMWFwY0Y0LzROajh3a3F3VWk0?=
 =?utf-8?B?WXpncXBKOVdGN3V1RzcxRW9xUVFESk5FeVVMNzloeENzTU8rSS9lejJzRVpQ?=
 =?utf-8?B?a1hxWUxnVUFTL2pPeGVrQzYrdUpwOENnWGJHTTR1V3RnQXd2NVYvbkk4TzFQ?=
 =?utf-8?B?d09Sc2JiVkdJcFFSMlJnbGdseGhmQWhkTTJ4Y2hITWFRTHhveW1rSjZ6WVg0?=
 =?utf-8?B?Z0FSaFRyR2M1T2QweDBNL1BZNUI4eUpRQUtHYitSSVlIUmNKNmNrVThhQVFT?=
 =?utf-8?B?cFkyQXRVNGxCbm9aclVZVWhGc21wL2RraktkYms3ZFkxNnAybWFqNGZiMUw4?=
 =?utf-8?B?Y0dSSnJieWRUSkFxYXc3ZEw0MUFZa3R1bFRWTzZEUWl4WmFFcWk5Z0t3Mm5U?=
 =?utf-8?B?aFpnL2JTWlFrMjFFU1ppaTVGZVRxN3l4S2F5VGxyUzNHWWI5VDA1NkJKVGdF?=
 =?utf-8?B?RzVuRzA2eThUZS9oQzlQSnBQR20wS2FHOGZ1b29UZklNR2RVL1BKVStHbUEv?=
 =?utf-8?B?VFZXSnQ2aUtsdWNmRkpQbXFnKy9VWm5GdGFKM1ZKd29tOVVYRDd5alRxRlVB?=
 =?utf-8?B?SmcrRmZRQlVWTUhjUUN4a1JUU3R6bmozd1BIUll5dExyLzlHMGVQQ1dNaldQ?=
 =?utf-8?B?bXBGQVAxMktMUHFNeHZmbVpLYXRNdEJBbDBpTythdmNzNFhpTzU2ZXBaNTdQ?=
 =?utf-8?B?L2FzUitNeWN5VS9IWnZ1T24wRWJJeUI0NXpJaFZVMlJtcDI1Y1hoSkRtMTR1?=
 =?utf-8?B?Wmc2VElBZ0hTYzUweFRwWThhQjh6UTVLLzNVRjVPUzNRdkVkaXVCZWo1RmM2?=
 =?utf-8?B?V1BLQ1JGNkRwZUNWUTlEQ1RFd3lualBMSExIbW5iZU1ER2xTb3VReUJVdTc3?=
 =?utf-8?B?czFPMnp5UTFPMitSNG51Y2poL3pVR25DTll3MWFzek9tK0xZdXdwMm1aMjRi?=
 =?utf-8?B?U1pLeFUrdENXckRyejAyTmdjbmJKYy8ydFpoUnRTRTNYay9iOVNrbG1Kc0tw?=
 =?utf-8?B?TW82WkxuVHlETSt1Z0xsYmxPMnRiRFFkMnptLytJSDB1OUFzZjZFRTBmVlpH?=
 =?utf-8?B?eExLckhVL05sWk1pMjU2cGxWK2J6MnpxTjJPTWJpNnRLRk9MZW1IQWt3SXRr?=
 =?utf-8?B?NkYrZ0ltQ3UzWUZOaGtOdWFnYTNIeENjK2VHRmNLQjc5dHdZaGlYRFRNM0JW?=
 =?utf-8?B?UERVdTNJTFBmK2gyc2Zwc1JNNUdKMEl2WEJsSlVlU1ByV3huUWxQZXYxQmNY?=
 =?utf-8?B?ck9FcGJ4a0hYOHJwcVM4bGNOQ1hsRWlMTitFNGw4RHJJdjFpOURCR3h1cHBp?=
 =?utf-8?Q?WJ4J2fPi9VrEwyvbz7bzzwVLlc/q3CT7hN5PXS/HfoQR0?=
X-MS-Exchange-AntiSpam-MessageData-1: ZSpJPbnqUN172A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80838ea-c8bd-4c8c-d823-08de5f9aaf74
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 00:58:30.9361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etzprJQX4R2ZM1Ra0upXfe1nuR3A7H+EqkEEHcd/gkQ8kFHLB2jTuUeyPM72eTy+2eLPLAjJXz3H6dzZ5UU4og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6463

On Fri Jan 30, 2026 at 5:23 AM JST, Gary Guo wrote:
> On Thu Jan 29, 2026 at 8:05 AM GMT, Alexandre Courbot wrote:
>> On Thu Jan 29, 2026 at 12:43 AM JST, Gary Guo wrote:
>>> On Wed Jan 28, 2026 at 2:37 AM GMT, Alexandre Courbot wrote:
>>>> This is useful to access the inner value in const contexts.
>>>>
>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>> ---
>>>>  rust/kernel/num/bounded.rs | 16 ++++++++++++++++
>>>>  1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
>>>> index b41ca6df1525..850827033f67 100644
>>>> --- a/rust/kernel/num/bounded.rs
>>>> +++ b/rust/kernel/num/bounded.rs
>>>> @@ -388,6 +388,22 @@ pub fn get(self) -> T {
>>>>          *self.deref()
>>>>      }
>>>> =20
>>>> +    /// Returns the wrapped value as the backing type.
>>>> +    ///
>>>> +    /// This is a const-friendly variant of [`Self::get`] that can be=
 used in const contexts.
>>>> +    ///
>>>> +    /// # Examples
>>>> +    ///
>>>> +    /// ```
>>>> +    /// use kernel::num::Bounded;
>>>> +    ///
>>>> +    /// const V: u32 =3D Bounded::<u32, 4>::new::<7>().into_inner();
>>>> +    /// assert_eq!(V, 7u32);
>>>> +    /// ```
>>>> +    pub const fn into_inner(self) -> T {
>>>> +        self.0
>>>> +    }
>>>
>>> This is... just `get`.
>>>
>>> You can implement it (with the `fits_with_in` check) in the same manner=
 as the
>>> const new.
>>
>> But unfortunately doing so also prevents `get` from being called from
>> generic code, which is a must-have. Or am I misunderstanding your
>> suggestion?
>
> Can you remove the `fits_with_in` check then and just provide `self.0` in=
 `get`
> then?
>
> If the assume is really important, then we should at least name this `get=
_const`
> (or `const_get`) to indicate that this is a limitation caused by const ev=
al, not
> a completely different method as the name would otherwise suggest.

You're right, we should just do that. The benefits of the invariant
check are negligible at best, and being able to access the value in
const context is more important. Furthermore, one can always use the
`Deref` implementation if they need the potential optimization brought
by checking the invariant.
