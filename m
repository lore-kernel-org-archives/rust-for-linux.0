Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAE121A43C
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 03:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749526846; cv=fail; b=lPdAGPqTbkvsOd8V10sRfJz8t1NoTK20mt00N1CxbEfcMTKmoXtS9K5bpDG11pRvI9f8mtmpabm1/38O8SZUj9GZ/xJN3sLUBihtfzBHQ2zTiqbGbEnNyFewzypfHMgWCg0V1gBVvjUd9hOrarNu6QgT4m1IvyRYjmR7CBWbZ2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749526846; c=relaxed/simple;
	bh=j/N0Pf0pnYJ/Q4jZVAglKkp2DQfaRKSgjPsDfpAtAbM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AQabfKWKO69ibiZ1/hkcbl7O0QN7gVrnhPqYfGBU0P6dAFxeZjJaBf7i2Dv/rV+Z6t41kVb4GTy7CGeJs7YNXuhyUkTiblvMPXCI1BIXu7aGC2KDCdkq4JyVGQco4Vg+1m+o+6sJsw8PkRMiUDSGkL4pe3BhcAinXNSV/sAPUas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BuRdbwxg; arc=fail smtp.client-ip=40.107.94.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BuRdbwxg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tc0AWF1Ex+ZIZH+QezNXfUlZn+zcx5enNC/utXJ3iersPh/C4csixywXRHn9Sd2ho7l1XlwkkLFhFTARh3ek/bh0g/uVy2g7j10bxPrPdDXYb3OB+8hMDDN5vXkghb54JDkR3ml+K5uN09vXqm0NhYSLFg6iQpTx5BmYOjVhh/0rS6uB+x8YLEvirUlQtkXCtZzAQDGN+66jnonc1OeoWjqcLcFhk5i9HGYKiuVPMHTYwYuIw9JRqefWOJm81oXXkbNpdtjr9NTRkTsNPvRYuiaJ/2k6lwIL4tNQd8r+wOROUEy5M1hsCITrJk0wTf74yCmvnRo/ZRjeU3nlrdXtEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/N0Pf0pnYJ/Q4jZVAglKkp2DQfaRKSgjPsDfpAtAbM=;
 b=vjSp2Ysbxyz5bNtMXS0BbI+5gEiT3A3TQwffuECk4B/xkXUZg1oRWJyBjXDCk/6am1Y8MYJQ0xoyvrhUkk3VFZGscrDLXefUCTSCAjzFR8rZowOGVh5i8CXHrYpxBBbmWonJoBM7uJWLvcq/p6CW9R9jhHJQODOLiAgSNTbDg5IugL3z1UhDh9mvin4l1IPooM+3cZm/Jebr0Wxqs1Y6UIx3MbI0DOeN/LKcmSdyKpsQxFoMKgX9MyUj/z+7otVqgW3nASNFrlCTcjnHcSRz0DnMF0LP53Di8ZEtyextTGouemTjLJI+XftVFR3M1TnpG753j/2pEsnvms9d+mbNAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/N0Pf0pnYJ/Q4jZVAglKkp2DQfaRKSgjPsDfpAtAbM=;
 b=BuRdbwxgNCntx5fPOZZr5hOgFgM9Z6K0940V/01I4dpLK74I65KWTkHs0k+NwvftF2V9W2+jtaVYAMO5oeukNqFrQ1n5JfnMIgybnJCCmPOO5l3sQSjOcn7b8jWrXKzgfgKZIbv8Av0R+EEN/AGbLYtlD6XVMxY0sdNBYJIywy001b18ZjaS/day4vREICm7tafgOMiAEJaSAE74fT1LD8/h9EfQDB1sMi0VW8fl9RcBkOz4wukS0wIqGi4T80zdau0P4QNCSCijjgztt1gq1b4HFTBDX0QzNktYeg1J6eNv12TNGo+cY4Dq5ngdvoLsK9Pk7ucnEA3cb0+RNjZfew==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DS7PR12MB9550.namprd12.prod.outlook.com (2603:10b6:8:24e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Tue, 10 Jun
 2025 03:40:39 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8792.034; Tue, 10 Jun 2025
 03:40:39 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "lossin@kernel.org" <lossin@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Topic: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Index: AQHb2Y76GidriUYRM02FngySpVCBwLP7rPaAgAASyYA=
Date: Tue, 10 Jun 2025 03:40:39 +0000
Message-ID: <35ca9fa086626f11ea65eb25acaf22fadbbe8710.camel@nvidia.com>
References: <20250609223606.2897030-1-ttabi@nvidia.com>
	 <14dce552-c69a-460a-a54e-924423ab569b@nvidia.com>
In-Reply-To: <14dce552-c69a-460a-a54e-924423ab569b@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DS7PR12MB9550:EE_
x-ms-office365-filtering-correlation-id: b5a60d39-6705-4a28-0c8b-08dda7d091ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y3M2VlliNFFSZWpVR1U2ZUZRRTVtNWFJb2RrcU1ZaS9RVHBQUms2bFBKSFVm?=
 =?utf-8?B?c0wwU1ovUGNYTlJhOWdsVWFIZjU1bnhDWG9TNkttcitSZFR6VldUU1h4cWtO?=
 =?utf-8?B?T3B0M3VnZXhLcGlzaUlzbTdmbHhOc2M5enRmZ1Zvb2lLWUtMSkloc2tRMDlo?=
 =?utf-8?B?MGc4RXJROVdrYnpoN1lDU0V4K1ZBQTdtaEtMeVN0SmZWdEQveVR0d2ZuaXQy?=
 =?utf-8?B?RXJONFBqQlUyZkNvSXhpQ1NHUVkxVG5vbVVHclE5SXNjR1JuV3lrdERlTzZK?=
 =?utf-8?B?V2pwMHZ6TnV4YkY3RFRMQmczZnYremsvc2JGUmpnVlp0ZUNocXU4WThYZUlJ?=
 =?utf-8?B?T1ZZeWwrWkNjZUJWR1RRYjAvemZqeXVFNGk3TTRCRFJyQlJaUlUwNWtna0ZW?=
 =?utf-8?B?TUtvRDMycmEyZ0c5R1pIQ1c0Y0pKU2tvbElFUlhHZVZYbzZPNE9JSVZOK1JW?=
 =?utf-8?B?aVZxYTBkL2U0OU1ITnVMSEY3anl0Nm9TQUY0NjB2d3krZGVqYlpLT1BkUjBK?=
 =?utf-8?B?WEdoRFhFTU9Nakl2RWROY0tIM0dicVQxOG1sMTdzb05vZ1pyWWR5dHc3ZzJm?=
 =?utf-8?B?bkp3bUFJWjdSVmpSUzVNck5aSUZRcjhKanFONkpSQXBvenlmUVZhbDJZUTZ2?=
 =?utf-8?B?b1RUQ2J1NU01VXNqV2ZTSTBwRDRFT1VscU1FSTgrTG1ML0w4OHljWUNDNUEx?=
 =?utf-8?B?a04xUFB4am8vaWFReFlKcHkyQ1JRK3BtSVhsWGR2WHRyOTJKeDhjZjBLU1JF?=
 =?utf-8?B?bUtTcmlPV0JzV1NLNm5rcitiK216dFVFbzE4WnNHZEl2VUJHK0ZtT2dsc3cv?=
 =?utf-8?B?Um9kUGNhcFlOeGRNdHFSWWZLUmZPczN5MngycUFnWERacVlWZEJJU3R6R3Jy?=
 =?utf-8?B?aUkzaHQrWm9zTHRVbGtXRE5rTHFNMnNGdFpDakl4ZVpEbkFkbTIxYi9Zd2Ux?=
 =?utf-8?B?anZVYjZvcjFLL3JWdFBoeWRkMkhJWEd4RjRzNDJFWVRrTWR4dXlPQWo4MDdk?=
 =?utf-8?B?OHhmVExBVnRkRm1KYkxEUlJsazdZWC8waExneHV0NjF2cE5YUndmdDNiY2py?=
 =?utf-8?B?RnJpUVN1R3YyWTRJZ1J3RXVuNzBIUWpGZXJDa1pBVFZwOGY2cjEvV0paVGx5?=
 =?utf-8?B?UFNNTUFaNDlua0ZVMzYzUm0yUG1VN0RCalIrZmJCMHZlMVREUHlzdk5JS0xk?=
 =?utf-8?B?Y0hQRzQ2UGtVa2tZTVZDQU5mUTNSaU9xQ3JaY3M1SnlnSmlhN2hEWmJFR29G?=
 =?utf-8?B?cndHSlYvUlo3MkxGRkEzOFM1SE4rOHQzaUtLWXRtZjIrMlZKdWhSZ3VQRDFU?=
 =?utf-8?B?TU1NdEVzdGttNklkWDY3R0ZMUVlGZnFlampITmhVb0xsNDJpeEo2Rld3d0JV?=
 =?utf-8?B?bkVoVk95bkEvNU94Q3lzcFRIOEN3ZjdUVnpCWEd2MWdVYUZRWHBEVXp0S2N4?=
 =?utf-8?B?L213aytMNjhGNGFXT1VEN09jQUxud0ZScHZzd1RtVnc3Y1hOODhqR0ZwaXJu?=
 =?utf-8?B?dlM2T0JBc0g5VHJhR3V1ZU54Z29rWS9xM3NuUVZJL0dYdnZxZnVhZHBxQjV3?=
 =?utf-8?B?Yzc0MXRrV0FKckFXRmhyNWRjTWNzUkRiOG56TFFYNU05NTduUEFDaFJTeXp5?=
 =?utf-8?B?Z1NPNGNGUkxEd0x6VEpMOExWUFdPeWs2b3I1R2RDVDJZSEtsZk9UNkRKbHBU?=
 =?utf-8?B?M2cxNVgxdnZYdmRMQUNITTZkeUZiK3pZeE1jRUxiWG8wVGlWZmp2SllFbjIv?=
 =?utf-8?B?MzFJZS9Ma084SW41bS85RTFmNzhOb1VhNHpMN3FUbnZWQ0VGaGVNVnhaSnBu?=
 =?utf-8?B?RlU1RkMrZG12cjJ0V1lDMUJUU1JrYlVBQ0NiTmJHWjd6eU5HNUNzS1dVTjI3?=
 =?utf-8?B?dGVHVnBJNjBSSm5RVEQ1QkRvZXRITmZKdGgyWEdSaldOR2ovSnJLOWJLamc1?=
 =?utf-8?B?bUxuVnpsRkc4MmJ5VUVDbmVKN2lEZGlmNDFpMkQ3dk5BYXBhaHF3bTd0M3gw?=
 =?utf-8?Q?PhHibB4lcj4h/RutSdlgP3Cpkoy9Kk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NW81WGUySkpTakxpTWcwVFFlVC9Ed3dFckxmOTBhTUFxdWtPTHlJaVpTSU1r?=
 =?utf-8?B?REhNQ1VTeE83SVNPdkhhWVphTmM1czZDOEozSWEyd1ZSNG1uNjJoYU1EeVMw?=
 =?utf-8?B?dmo4MXhGZFhQRlJtcnZrSDk2TzlSRk1HSXAraVJLVkQxcjRBYzNvR0lsWGV0?=
 =?utf-8?B?ck84dU43M2JiR1NvRG83eDc0VFBTTG5VT1VITjFUOU8rODBjMERPMGxHakM1?=
 =?utf-8?B?V3d2Mk5SMUJWVEJkMW1Zb1JJa3hIRUZSekl6N3dvRmZIM092TS9kWDRlaE9D?=
 =?utf-8?B?WVgxSHVkcnpDbkdsNDhBblIxQWQ3Y25pMEdJclJEdVk0ZjNmSDJrTXlrWVBM?=
 =?utf-8?B?SGZrZGRoYktzeGdscWh1dHR6SWYrcjFONms1dmcxaCs4T3lCcUxEUkN6b2hC?=
 =?utf-8?B?TlZBNFowMitNcGZJak9iNnZwdWFlY2pXMG5ubU5XMEVGYlQ1eStOemdyNVQr?=
 =?utf-8?B?KzNLNEVxblFiMVlsWnVKZDVnUllYR1NlcXUzUHd4TVh4ZVpMV3IwdHoxaTZx?=
 =?utf-8?B?dUNLRGxkLzVYRkxGZ1JDb3l0amJPQWsrN1pLaklEbkxrbHYyQzB6aFBEbzEz?=
 =?utf-8?B?NFJaeUhiNXp2QS9HT1hGbGozVmZrYVZjRk5kV1I0WHBqT0NnUE5SS1psL05E?=
 =?utf-8?B?N09HSXdYUUVzZnN0VkQzRU8rRTRFTnVzelhvWnBJNndraDZ5K2tjRVRrc0xH?=
 =?utf-8?B?UjIxQ2JNcVh4QzJmTzd1NzNYWm54RUxBcFdhM2VmbHZSUllSbDJIbnRPZ3pp?=
 =?utf-8?B?ek0zNlJHd01sTlh5d0FjTUViNnRPUExkblNCbzBqa3I4OXJRZ1RiSjVWTVNU?=
 =?utf-8?B?YWNBRzVYUHNUNmRFMzI1TmJCVW1jck9KdEVhR1VHbGdCMnArcVRvOUUzTHda?=
 =?utf-8?B?YVI1WFRPMmd1Mk9JL0hRblBzL3BaTlJ0WFhHcmh2alI5bUZTUUg0Vk81NFpM?=
 =?utf-8?B?dVZyb2w1NXRxbE9tOEkxUmZUZW9lUXJScitzRTk4cGxaM3p5YmdsYkRmUko4?=
 =?utf-8?B?TTQ2MDVPUGtCTEUyWkNVVUJwckFDR2UyckxGZURyMDNkQjQ0c2w5UkVTRDdP?=
 =?utf-8?B?UFdNZ3hDV3FvZ25LcDgyQjZUeWJvQ3NlNWhsRHc2Q0F4WkhEeE92ekVYanJ5?=
 =?utf-8?B?S3ZVYlN3TzBXTlp6ci9yNDZpaTV2K0J2QkJ6YTFBTHhRcE9DMXFma1hnSkFl?=
 =?utf-8?B?MnlEWWxWOE1VY2JaUE5yNnpITlhxaDJvRFV1VDBySDFWWFNVb2hYRTU0TXdW?=
 =?utf-8?B?NHBXQzMvbW11cCsvNi95NnFaWUVlaVphb2VWQWlObWRFdWdTVUpSVHhEZWpv?=
 =?utf-8?B?VExocVNvcmFxQmQ3THZVcFhwZmdVeXpwSmRnMkxXdU9uWlJYd3lMYzFicTg3?=
 =?utf-8?B?ZEVQS2ZLVDRpSlRndW1SOVp3d1BRNi83T3RTU1g5RkFFbWh2aGw3R0RldTdh?=
 =?utf-8?B?QWlCRnh4K0Zyb0ZFbjFGQ0FCbDZSNUU4MFNMRGx0U3ZTQ245NEhTV1BJVi8y?=
 =?utf-8?B?UjVqVnVRSnRQcVBtVVlua0hNY1dXRzlLTHgrdHdYWVUwM2d4bmRZcWM3NitT?=
 =?utf-8?B?akpHNkx3UWZRdGZyWVViUGZDQVliZ2kxQkE0ZFZCQWF5MjFTMVdlODZRaDQ1?=
 =?utf-8?B?K25MWWNZWFhrYThFc2dvUEJLVFdkckdiVGkvcFZqTHNZa1FOZDRiZUlhSzNV?=
 =?utf-8?B?NXUvanJUK3dxN2I3QWdHUmNudjZxeklTbWVtblNzQTlGZGtLWTlDTzhXR1hv?=
 =?utf-8?B?V2NFaHVNSHZEYXRDRGVMQ2M4cDVwcE5hR3N5VjVGOWgzOFFJNFRXaHNPRjFu?=
 =?utf-8?B?U2ozQWJ3R2QrWjBoQXB3V1pCWmVPdjlEOVhUS1FjejdiMGdrVndXZm4yNXlo?=
 =?utf-8?B?N3hKb3BrYS9tWmVVaGdYWWpOc0R0blkzSTgwQTVWbHloZ2xhSWxSaFNhRnJr?=
 =?utf-8?B?dzUraWJoYWd5YnRFNTE3Tm1HT0wrNXJrMVkxVG52MXhQd1FCdjFoNmptaEx4?=
 =?utf-8?B?VTBwOGRGQVA0UTVLcjVmeU0vVmJwNVBJVlJhUlhja2hzN2ZhT29rNVBQYTlX?=
 =?utf-8?B?UTNIbDJEVEFGVm5lMnQzWS81bDNFdkMwcG83VTA0eWtlMGRhcy9qTEZUbC8y?=
 =?utf-8?Q?Y2P/04NEguhkvYIhpWYudqeax?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A230CE344505E646B673F2A82FF98F60@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a60d39-6705-4a28-0c8b-08dda7d091ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 03:40:39.6258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EdXkAc7AeyHQzaRvqvMj7gWVfOYJfGD6u2cSy/wTd6wSOhtLJHL9dlfnuyH3ENVFBoE5aycOPwFP7/h9AWp1YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9550

T24gTW9uLCAyMDI1LTA2LTA5IGF0IDE5OjMzIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ID4gKy8vLyBSZXR1cm5zIHRoZSBpbmRleCBvZiB0aGUgbGFzdCBvY2N1cnJlbmNlIG9mIGBuZWVk
bGVgIGluIGBoYXlzdGFja2AsIG9yIHplcm8uDQo+ID4gKy8vLw0KPiA+ICsvLy8gSWRlbnRpY2Fs
IHRvIFtgc3RyOjpyZmluZCgpYF0sIGJ1dCB1bmxpa2UgdGhhdCBmdW5jdGlvbiwgdGhpcyBvbmUg
aXMgY29uc3QuDQo+ID4gKy8vLyBUaGF0IGlzLCB0aGUgY29tcGlsZXIgY2FuIGlubGluZSBpdCB3
aGVuIGNhbGxlZCB3aXRoIGEgc3RyaW5nIGxpdGVyYWwuDQo+ID4gKyNbaW5saW5lXQ0KPiA+ICtw
dWIgY29uc3QgZm4gcmZpbmRfY29uc3QoaGF5c3RhY2s6ICZzdHIsIG5lZWRsZTogY2hhcikgLT4g
T3B0aW9uPHVzaXplPiB7DQo+ID4gK8KgwqDCoCBsZXQgYnl0ZXMgPSBoYXlzdGFjay5hc19ieXRl
cygpOw0KPiANCj4gU2lsbHkgbml0OiAiYnl0ZXMiIGlzIGp1c3QgYWRkaW5nIGFuIHVubmVjZXNz
YXJ5IHZhcmlhYmxlIHRoYXQgYWxzbyBoYXMNCj4gYSBub24taW5mb3JtYXRpdmUgbmFtZS4gSnVz
dCBkZWxldGUgaXQuLi4NCj4gDQo+ID4gK8KgwqDCoCBsZXQgbXV0IGkgPSBoYXlzdGFjay5sZW4o
KTsNCj4gPiArwqDCoMKgIHdoaWxlIGkgPiAwIHsNCj4gPiArwqDCoMKgwqDCoMKgwqAgaSAtPSAx
Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoCBpZiBieXRlc1tpXSA9PSBuZWVkbGUgYXMgdTggew0KPiAN
Cj4gLi4uYW5kIHdyaXRlIHRoZSBhYm92ZSBsaW5lIGFjY29yZGluZ2x5Og0KPiANCj4gCWlmIGhh
eXN0YWNrLmFzX2J5dGVzKClbaV0gPT0gbmVlZGxlIGFzIHU4IHsNCj4gDQo+IA0KPiBZZXM/DQoN
CkkgZmluZCBteSB2ZXJzaW9uIHRvIGJlIGVhc2llciB0byByZWFkLiAgSSBsaWtlIHVzaW5nIHRl
bXBvcmFyeSBsb2NhbCB2YXJpYWJsZXMgdG8ga2VlcCBteSBjb2RlDQpjbGVhbmVyLg0KDQpJZiBJ
IHBvc3QgYSB2NCwgSSBjYW4gdHJ5IHRvIGNvbWUgdXAgd2l0aCBhIGJldHRlciBuYW1lLg0K
