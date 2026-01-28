Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011027.outbound.protection.outlook.com [52.101.62.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00105257854;
	Wed, 28 Jan 2026 14:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609556; cv=fail; b=s+uQjpjn6HMeFu1SF5kyy+0yovW1k+6OoRwmUsH+y/S62oq87NTEP6cTJNZzFzepNEx4+WLOOTRXb/QfB65dnFBUMexKaGFoSY7sgG9ij5iA1AeoIjm7lOJX+Ey77s6fTIa8SUVh1vhdeHyR6uGX1vnQbo8mkLEhi/h+GFv3yCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609556; c=relaxed/simple;
	bh=hWmINooAO8EAxpZF+WHIYoKf0IFm2pt9gWJjo4AeVns=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Rm0Q28REeUUyhHvTw/sy4MwVoMuMSA+NhWDdXALoSfuhwtq8pvA1twCTj7hX5ZfEWKOnr5KCLrIV9AfEOVHCm411/6RFpl7OzfUazp6JgAgtZwq5CyjwbwHBcHGWBHCcswmIJm2q+84o4rXn2VQJuVTNggT0hJOYo7Z32UBoKcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=j8z1RvYy; arc=fail smtp.client-ip=52.101.62.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="j8z1RvYy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoI8T9RoCi0MLIKRKEhfcMUfmvwzDLFjhbsiFtt5jtQhPibo5ATdHrpAUVnTkye3Ith8BM+aEY7VOVAHBSr7raMGH5jNTjTdoaY8eF167ss2S6r72yUpzJLhv0dUwEyDkOu0n/HwwWShROf/LIxWrtRUbjZNQyd1dRfGpi5FBbKN3eKS4dnGkycMS1HvO7klas1gj+GrbUoxEiLacnKyeItKFp4UyKljyF/jiuyLnCKgTN8cER9IK7IltcfwziDZhKQCMCdeOl2bcbl8n0Qx17Mu3Ttlf8IfrUSJ/hWhbnJ/7RKHVWbmJ8Hxk1HqfnGrCnpT6qgc+oZfcKa0boZ81A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arL7FqEYNYw9szInV0KSRllEr39y3jgGJphnkvixZoQ=;
 b=I/+0zxeiqU73NGoQOffzRvhhC/ayYZ/Dxn9Ze5QvbrvcZHFScVWV+auWCFHHoSNBB5xWobEW2DfmYWoCw8Nep0UIeObXN8kytFh+BS0g0KyKPlGIN0RUS2hA5xlFSexEwW2qVDiY/DynaV7I8/JCNX9v5hAi7+oj+rUOr7zblFFuC3hHHKcXmPQCIPRywc2yBQjdwZXlhJI3vTHgw9pnxerSorvMXk/aAFvJsBNlEiAA7/b2xdVQ/qoCFgWtY3TWgYVNuF97P6siD8GIBuFTYfLIZU9djW7AFtPTxWxWRAhejpEAjeMw0ecmhkOJLrYuqA4oVJffItI5MtqRblIBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arL7FqEYNYw9szInV0KSRllEr39y3jgGJphnkvixZoQ=;
 b=j8z1RvYyt28S9L2s6aGNQ+IOCUw13+O3CfzEuYtkT4BkC2izuak/qR+Ox9vK9B6oU4XF1gUh0ZnoLZ0yySOmmL+ZYvgnydvC7/2VKlxKT/dl89EITBl+5hu4d1J7RlOBHo9LjoHmeQPgjyWsoZ5QE5VDEj3MkpmtmUeYrA1oj6lwTRRXPhH+WYJTMDpTaTWK6CEowg74jhHkyFhBK5VCM/RCZ0iDybCac5U7L8CwK75pdcaZGTovr76yxmqBIEqoubEbR1TFmBC4zY1AvEsoMqZpfKI3h4Hiar2h6ho+XNEamzMHztnoNvrVF5lxlpzd4CRbyWkl5R2OVLRkM+UGEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8540.namprd12.prod.outlook.com (2603:10b6:208:454::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 14:12:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 14:12:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 23:12:27 +0900
Message-Id: <DG0A8B4DUBDB.2NT25Q8SZOHT7@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Yury Norov" <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Yury Norov" <ynorov@nvidia.com>
References: <aXgpKOHAmvZuMVSt@yury>
 <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com> <aXhD4sI6MHdAvgNT@yury>
 <DFZB4ID2H1D6.2ES3VEZQEGEQO@nvidia.com> <aXmeR2ocKm-xPM-w@yury>
In-Reply-To: <aXmeR2ocKm-xPM-w@yury>
X-ClientProxiedBy: OS7P286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:26c::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d1bc49-bfdc-4da9-1d10-08de5e774683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0FCbytYNks5M1N2WUxtYVBHblI5MkdtZGd1amV6Um1VWlZsWThkUDhuRXp6?=
 =?utf-8?B?QldvYlBYYUxscDR5eS8rZjhQcy9wSDVqajFsK0R4SVZjeGwwZU1JVjFyb25u?=
 =?utf-8?B?bEZBd1JpemU5L2gxbUtoOGF3VWRkU2JDa1Zhbk0vRDV4MmIzS09vcnkxMkwr?=
 =?utf-8?B?c3BLWnYyYWJodER1MXBZZTVLT2ZLOWgxNWYvdXIxV2dUNDhvRW1OWE4wYlU3?=
 =?utf-8?B?OWx5SFViV3JMY0llSVoxc2FxcUlEYmJFcEtSTnR2WS92d1cwUDVyTTBuN2hp?=
 =?utf-8?B?d2VUZ1EzTUQ0QnRYRzBuTUxVaDRXRHdUQXhNVHJMSGQ2cnRsLzdlT05LTXB4?=
 =?utf-8?B?UTFyVUtsQTJhWlZzTU5EbFlGeUpuSkRXQ2Z5ZE11bVZmSlNsZndQVzN1K0tp?=
 =?utf-8?B?K0xJRFJTY1hSU3E3dkw1cjkrWkM4TnRTU0Rvbzh1elVPQ3Jub240SlFFZ053?=
 =?utf-8?B?U2t1TUh2TGt1TnJRUm5VcTJpUWNoellLYzhIdkRtTjR0YU9IRTZhZmxaaita?=
 =?utf-8?B?emRnTEN6ckd6bExNSVhtSW1JNW1lOVF5ZCtsOGVkNXN1cXljb1ViZldxWGls?=
 =?utf-8?B?NndPT1BjTlVqM2wyZVpJa2NCdTQ3d0ZOMC9UQjZiZEhSbTVPK3h3ZTlzdDVv?=
 =?utf-8?B?RTF6eElYRE8zbXRPT092Q3lTbmdTY2t6c2pRSXZXWXhoVEp6WTgvMSt6K3BS?=
 =?utf-8?B?MG9HY0sxL0lYSm9vbmhFU1YxeGJpd1RMTGgwcjV3b2Z0UnRlZk41ZlNhUVRQ?=
 =?utf-8?B?TTRPZUlxZGYrYjdQdWlyK3I1R1hJSzB3QU44bHgwWXkwUFI2Y00rSE11bzlh?=
 =?utf-8?B?TzlleUFxWkxwY3E0RWxrVWF6MUtoeWd1WWtoa3dpR251VlJnd2FReEZKNWNy?=
 =?utf-8?B?dktjKzFnamkzaGdGdjdWNWpIMXV5L2MyWmhHU1pUbWsvd0llNDlzY3VzQ0F0?=
 =?utf-8?B?V0J1VEZvcU9zU3ptcHpIRHNzcU56dGRZbnlyalZYRGZnZmxYVDM3Vlhva2lX?=
 =?utf-8?B?WDZ3R3hNM2RXdXV2NzNvNWc0SVFubllkMGlZVEVkYVlZQWpsOElSWXRPQmtq?=
 =?utf-8?B?cTYyUjhzamNndDN3bXpTMEkwVzVyWTh0L3hkQmdjNDZyb0o5bUhlQ0VQbFhu?=
 =?utf-8?B?dGt3cStxeWtwcE4waDUreW5WWHc2azhPLzlqZTBBWkl3Ylp4eDRxbEplTk13?=
 =?utf-8?B?Y2pFc2M5dDV2dUUrcGJTd2M5RTczbVlUWE45cWcyWUVoVFdyNkJWVEM1blIy?=
 =?utf-8?B?T2F4RHJGekVzV01QU2R6TFR6Mm1BRWF4TWI4RFpyNENSK3MycTBSdkZIT0tC?=
 =?utf-8?B?UkVtOUcwMFhpcHBCS0ZOK1lITkZMNEdPMzZSTEN4Uis4TDUwVk42K3NGcnlE?=
 =?utf-8?B?TktWQytabE5KUUtjOFQvWEoxcEgrci90eERteWs5a0oraCs3d1dEQ010WkRM?=
 =?utf-8?B?S042a0JYMVViSHJiZWR3VHR5SThYU1prZ2l4VmZVeTZ2Z3grcTlGUTkyd2lB?=
 =?utf-8?B?TUVicXRZTkpiSEI2cmdXaDVXWVVFc0oyOUlQbk5zNUlDd1BwMUdSdHZycnRp?=
 =?utf-8?B?ajVxSno1T2czZ2YrOVlGTkZMSCtqRUU0UDYzbnBzU2JIekFFSnBVRUJRdStQ?=
 =?utf-8?B?c2I1WmU2YWZCUk95TmJOZVYrU2JvdFlSV3VlNmEzaW1uejd2cjczNUlybjVh?=
 =?utf-8?B?UTJ4a1RDeW9aQ3NoOG8xRzhER0NzOG9FdDhJWUpzT1E4YWlpTU85eGVRSWpj?=
 =?utf-8?B?UnNvNTlvN3JON3lOQjVZNzA1c0srSGNKU3lscTVwTHVpN0Uyd2FYYVlmcXVw?=
 =?utf-8?B?UkJiejlDME9iMjNxN3c0dnB4ZEdPZmFpK3p2NHFsR1JOdFFwVmJpL3BHNE9k?=
 =?utf-8?B?VTBRamNRaXlFU3B0aWI1angzVElYQ2UyalVYdUlVVmpTc3FFZTNTeitiNGdY?=
 =?utf-8?B?SVJFRHlpdWltcjJoK2tneDUrWW9hcHArcFBDYWRLZmJkZnFwTVlDQ3hkWlN0?=
 =?utf-8?B?bDhBcTV1YWdpMlBKMk0zeDdZa1RBcVZnY0RncjRGV09uS0VQUitBZ1VuWEFn?=
 =?utf-8?B?Sm1KcittWmNOcy9vVi9PSndZYlJWSkMyU1huZHhwbFNqQmk2Z1lJalBHbk5M?=
 =?utf-8?Q?8ZBrYTp2/trHZFNtEsfsZtGrO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUJjeHV3ek9nOXJ3WDgxYVczMUxUUkxQQTRsNG9oRGJFc1EvY0VIcGZ3MDli?=
 =?utf-8?B?NEdjTU10Nm1ZeklvZGhGTlVHNlcxdm12UGxSb3B1WTNHSm1GL1prc1F0dVpv?=
 =?utf-8?B?RjRDUG9BcUgrU3c5TnpmQ1J2bEFEdCtxc0xLS2RtWHBSVERzb3QvNVBLekNw?=
 =?utf-8?B?UVRTTnZqWXF4d1pYd1JLK1dsVVVYWHRRTzVoR09uOEVVRVZXUXU4Tkg1UFRa?=
 =?utf-8?B?c3NYNnRxR0dZaVljU1g5VURCYVVvMzlZcFBkVXkya2Y1Q3gwdElnSEt6TzlH?=
 =?utf-8?B?a0xadlVBVFk0ZG5BNFFuSFNwemkwRmVFalN4dVJpbC9PTnJkL1Q2STdISUgz?=
 =?utf-8?B?WFlnS1ZOZWY4QmlvTmhISGJCdVp0ekF3VmNyVTVxTHdyWEN1UXVKaVVOaFgr?=
 =?utf-8?B?Q2MyQVh6T2U2ZFJhLysrSGRQZy80RGkyUG9Tci9FT3cxRENXSXNhcG8vcC9j?=
 =?utf-8?B?cXNDZ2pRTHR0clZCY2UwNkFVQzRockNuY2dJR0RkM3BXTDVqT1J3Q1RwMDVm?=
 =?utf-8?B?N05UN24yWUR2SGgzRm11UWNpUkU2anhtOWhxYlZJYS9vdTl2T2NpZ3lOZnBn?=
 =?utf-8?B?T1ZwVGpnWCtKQlFSM1hJYURGZ1BDQlM4OU15UTUxZzJ6TUxubjAzQ1A2dWlD?=
 =?utf-8?B?cVppSWY2YTNEeGY4MzVxVEp1UDFtNkFmalBvRml6c2pRNXBZRTk5eWdoRTF6?=
 =?utf-8?B?NUJMTlFjdWxvZVNFaGdNZGZMd3paSzRFdnNWcHlrY3J4cXIwZjU3RXNUSll2?=
 =?utf-8?B?UnhIL1lvSkpxZGJlMG1abHh2VHVZTjlvVW96WnNaYnZyWUdGOStnKzRxeXhj?=
 =?utf-8?B?Wk9NcmlSUHFybDBjdTZXQkJ0WUw2NTZFVHdJNFJycmthcGhqbDVSS2Jya241?=
 =?utf-8?B?YWZYdFQzcDBsYnpIMmh1eXNTU2w4WlA5dG1RWktSNnVNMHUyaXJlUTRNbThn?=
 =?utf-8?B?QkxESjhBQ0doVUpxNGRDV2JOajR5ajM2b21VU2VISGl6K0F3VTdYUHhZNks4?=
 =?utf-8?B?OXZEb0lhcjNGbFdWRWhZKzdTQzZmcktsMkxGNjhsUnJkQWFtVXJnVjEzeUdG?=
 =?utf-8?B?TUVmaVVrSnVueHZtbStleW5ZYVphTHl1QVhDWmhVMENKRjV1ZEw3ZzVQSW1h?=
 =?utf-8?B?Qk42Q29sN3R4TFBET0JzM3Z3cU0waTNwRzczeUIwOTUvallyUDM0Y2dQc3RK?=
 =?utf-8?B?UWtrVnBNZ2FWV3hxTmZnaDhxVUg0VmMxK1BoWmJxWmxBQjBIWkF2NUEyRHJI?=
 =?utf-8?B?VW12ZUVUQWRldDlES2l3QnpPYzF3ZFBJWmUrbzJHOUZXUnprMUI2cDZoMWl5?=
 =?utf-8?B?cmZkcnFqK0dTUUZORDNVV3VOdWhZSmh4aDRXekdCM3ZJZEJVZ25nRVJadmY2?=
 =?utf-8?B?a3dIM2tTaHYwZFlLYUV4dlNOMEVXMUtaaFRyc1pwbmgyZTFqMGRyWStwbGJK?=
 =?utf-8?B?MlFjQm1VQ3M1OGJqM2h1dG5zdVl4WDhwK1M5aWx0bWh1S3VFNW4vSEUyTWNi?=
 =?utf-8?B?T1cyTytnWCsyS2d4WnVpd0wyZU9IU0NPTlFqcVFpckpub1Q5L1NRSENJc0p5?=
 =?utf-8?B?NGcxMERTT1Vncm1zUzQxZ25MeHRhWFZ0K0tmRDlHV3BxU2RBQlVIaVNwTWVl?=
 =?utf-8?B?dmVTQlYxR0haQmFZUGNxd3hYa053d1JRRVpZblkzYkxrQ3E4ODBWNFM5S1hV?=
 =?utf-8?B?bWptTlFTWXFNaXpuM25ZaGlmaWVFTFJQcUxFS2d1Rko0YUZ5SFVvVjhMbEIy?=
 =?utf-8?B?U0RpNzFDRVU2aUdnNDNzTTBxK3RSYUo4M0JWUVQrYU02ZEFEMjZDdDFHMlNS?=
 =?utf-8?B?SVdseU8venB6SFM3TjkrT01GVDlBaFk2QTB0dlNxWkRyNkhBTmpyQnZIZWNI?=
 =?utf-8?B?dkt2SEQ3RFFsUFhXSm1LYUExa1hBNGpvSFMwWEh3SGNZUlZGR05xNm9UU1ZU?=
 =?utf-8?B?WllSWGozZGJNbkRxTG5aNzdGSkYzenQ4R2Z3bGo2WnUvbW9abk1DbDdVckhn?=
 =?utf-8?B?SkZMQzlFNTRDeC9zcUZ4Q1ZtZUtoUGlaMng3dXNvZjVJSEk1TCtueEphaFU4?=
 =?utf-8?B?Q0JNN1lIYlpKS0xjcDgrOEFNSndnVzQvMEw0SVlrdWRlUXlqN2k0M0tlVE1o?=
 =?utf-8?B?VFZ2UHdlMEQzRk02cjdxb20wdFU2bXhtcm1zUkdMVkRxbkNuZGlDWWYvYVFH?=
 =?utf-8?B?d2lLY2c1RWFsQVhacWdXa0d5VDJVbHcvZWo2YkxRY1BNSlJPMXFxY2svMU1T?=
 =?utf-8?B?RTBqdVJvTnR1SytrV3Z2K3FxazhvY3RaMXZzcTIxZWlHVWxaSUs3V1ZyTlRV?=
 =?utf-8?B?c3RlYm16Ny8yZVlpdWxkcDdFZUF5VFJXQ0JpbFNCLytKOGlJNGFBWjhrOXgz?=
 =?utf-8?Q?eMw4bWfV7LRaaccH+gLNZeNVIqBqmt+8tb3A7GolTNHCT?=
X-MS-Exchange-AntiSpam-MessageData-1: iZaMfpxXAX6xYA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d1bc49-bfdc-4da9-1d10-08de5e774683
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:12:31.2211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXOp7VBFZOLMp61/oKDc/CTVfucW4T9PBSSWuhN7cfxbP82vvAiM9caok/Y8OJmQaZtO9JBqUkGfddIRNA0pWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8540

On Wed Jan 28, 2026 at 2:27 PM JST, Yury Norov wrote:
<snip>
>> >> The user simply learns not to use reserved words, and the compiler en=
forces
>> >> this clearly. The same applies here.
>> >
>> > Most likely he will learn not to use this API at all. The worst thing =
about
>> > those 'reserved' words is that the set of them is not definite and wil=
l
>> > constantly grow.
>> >
>> > I'm trying to say that this approach is not scalable. If a random clie=
nt
>> > gives name 'invert' to one of his fields, and you'll need to implement=
 a
>> > method inverting bits, what are you going to do?
>>=20
>> Bitfields are limited to a _get, a _set, and an _update methods (and
>> possibly try_ variants for the last two). If an `invert` method needs to
>> be implemented, it can be done on top of _update which takes a closure.
>> So I am pretty confident we won't need to extend the API beyond these
>> (famous last words).
> =20
> Not sure I understand this. You already have into(), shr(), shl() and
> others. By the way, maybe again follow C++ style, like:
>        =20
>         my_bitfield.shr         // field
>         my_bitfield.shr()       // method

The confusion comes from the fact that `shr` and pals are methods of
`Bounded`, not the bitfield structure. I.e. you call them on the field
that you obtained using the getter method - they are not part of the
bitfield interface itself which is only concerned with 3 basic
operations: get a field, set a field, update a field with a closure.

>
>> >> > Again, this all is relevant for a basic generic data structure. If =
we
>> >> > consider it a supporting layer for the registers, everything is tot=
ally
>> >> > fine. In that case, we should just give it a more specific name, an=
d
>> >> > probably place in an different directory, closer to IO APIs.
>> >>=20
>> >> The Bitfield macro is very much required for non-register use cases t=
oo.
>> >
>> > Then let's implement it better. Can you comment why the suggested API
>> > doesn't work for you?
>> >
>> >         color.set(blue, 10);
>> >         color.get(blue);
>> >
>> > I think it should solve the problem with name clashing.
>>=20
>> That syntax cannot be implemented as it is written. What type is `blue` =
here?
>
> 'blue' has no type because it is not a variable but keyword. We do
> such things in C all the time:
>
>         DEFINE_FREE(kfree, void *, if (_T) kfree(_T))
>                     ^^^^^
>                     keyword that becomes a part of cleanup function name
>
> And in another email I seemingly do similar thing for python_init!()
> macro in rust to pick the right constructor.

Yup, and we could do the same in Rust with a macro, but your example
above was not macro code (macros are always ending with a `!`).

>
>> The closest we could get would be a macro, that would look like
>>=20
>>     bitfield_set!(color, blue, 10);
>>=20
>> And beyond the scenes it would call some more intricate (and unsightly)
>> machinery. I'd rather define the constraints clearly for users - they
>> are not so drastic.
> =20
> But that would not be chainable, I guess. I recall, Joel said it's an
> important feature for some reason.

We could make the macros return the modified bitfield, which would make
them chainable. And the bitfield-englobing macro you proposed in your
other email could also reduce the need to do so anyway.

>
>> > Can you share more about the other potential users?
>>=20
>> I know Joel is using bitfield for page table structures, but there are
>> of course many others. Basically any structure with fields defined as a
>> subset of its bits is a candidate. Registers just happen to be bitfields
>> with extra properties for I/O.
>
> OK. Can I take a look at how bitfields are used there?

Check out these patches:

https://lore.kernel.org/all/20260120204303.3229303-10-joelagnelf@nvidia.com=
/
https://lore.kernel.org/all/20260120204303.3229303-12-joelagnelf@nvidia.com=
/
https://lore.kernel.org/all/20260120204303.3229303-13-joelagnelf@nvidia.com=
/

But be aware that they use the `bitfield!` macro of nova-core, this one
doesn't use `Bounded` yet.
