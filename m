Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7468D664C6
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Jun 2025 22:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749854786; cv=fail; b=jhRMOsXO4Sep2vuUnjfb8RDfjDkhYwP9snPs54g+IjRwbHZzus3f9I0ZGuIPCqEWKXndqqb5pEFzNiF+vU2TZszDOOj1zqiJPBWWf43jKMj8qqKTj8tKk8+oSF2joslZXpBR/ev/yxbogD9wCE64xfB1T9unUD5klA6FCJzVbg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749854786; c=relaxed/simple;
	bh=nmdupTA2aTKhafzIj0VU04fnmFYfXRnAks3y2c7vmMU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lYt+gl8TB5S+BpO3TPlR49R2FHBWlT1/c83OFoDvxt+pAey/pKlkGDA23SB1z6tmyiaFw+MJ0mX1hIjaVE0/y1UNlkpYVXtgmko4urM59/BUEODRls1q1s31oXawnRWP5VdLDu7hDZDpRol+II6axnKAzzApHAhgKa4gPQf6OVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KXediE1M; arc=fail smtp.client-ip=40.107.244.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KXediE1M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbuVEpAyx4dmL6UolACwY+ja7xybli9lOyVv3kc4gFlbcsNmuxlcfqac8BAZVDy97LHc8Eyh+igLVVFptJW9BzVWxggpmGZs8hisXmPVU2tBIC+Dg0LdQLu3AcJaS7Jdkq+N3oJLmRnt9dHy5eydyJ7YQJlzm8070Qnljq9MQ9172oxznNKBqtfa/eX2HxDg7FZTHihmA1J7+tAVlAAdOEyH10lfm8fe3zIQKqZ4hLQ8wdjxICZevZLVPwqpmkUHV1f/3JwR1vl1bLQ0w8m99fu98qYdgcbzKMJl183otQXqvLV1s6hrh384d3Mxu/itf+N0GBP0P1EX78+0Ndtk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmdupTA2aTKhafzIj0VU04fnmFYfXRnAks3y2c7vmMU=;
 b=PX77kLZYgF6Md5VxBLEv0tMZEthcuEUF9NcqI/98r/u1gJEWMjx5AidY7t89VvkYWAOp4UBwN4ca/SYZOWFTxI+ck+jWgVSjdyjKL0lcjZW8h2A3Mwk5g6QZYJ8o6wDYkijPJaRgBfU3uiGcBuv+BlhtScJfnXOVlXP8RU6PMLmqVrv2EASXlySogD/tGkAzlYTeDiavlyQDPYIvI0E1fen3S1wv+dvPbnMASjQC6iKBhHyEEhTE6ThcRLkPOuF+YIBWzBUlEZeJRR2K9OuhY5oUgX/CjtmCNSl6S0m3j+hUeGj7Dn2bKyQz3r8XD+39Z5TjcJVtvbu5LGZ7PtXtIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmdupTA2aTKhafzIj0VU04fnmFYfXRnAks3y2c7vmMU=;
 b=KXediE1MKCcdZg9K4Xq4Q37jSsa5o83N+m0DAxDUBgM4Yd0WN8oYwx8pcXFaI4qAxW994W7xkXeuBlVRpM5LKWugHgrMX8WSESRylemABLkqv2R8YjXeApAn8RfLAN+yTcj/a2dLz2K+YiEq/7X8FVC1CdMPDGyFhp6tjc88k6U1/EP90asB2zOoGBZ+aQjeBjmLBYfPROHf/GL64U3ki9/ge8TbQhCK95zF0XNn3gQtSbFenBFRKFqSpJCeS6amFpnXONfdCk5/tkRSGSMrP7e24xwqdIDIfaHAodIBBx+w2mZE7cRTBBhYF2MOTl0QZzbnQcKUvYlatRRBQfBQgg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Fri, 13 Jun
 2025 22:46:22 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 22:46:22 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "lossin@kernel.org" <lossin@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Topic: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Index: AQHb2Y76GidriUYRM02FngySpVCBwLP8FOaAgAWh84A=
Date: Fri, 13 Jun 2025 22:46:22 +0000
Message-ID: <96ee11ca8f198892b35fc07c72ebdbb06095544e.camel@nvidia.com>
References: <20250609223606.2897030-1-ttabi@nvidia.com>
	 <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
In-Reply-To: <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|MN2PR12MB4207:EE_
x-ms-office365-filtering-correlation-id: 538c7647-9240-4170-3bf7-08ddaacc1eae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UCs1TlZFTDluZkRjQy8rbm1wSTFqTlRqd3pVeGJNZmRGV1lWK1FlaW16bGc1?=
 =?utf-8?B?N1o5U0FQZHN2WHJzVlNIdnI4VVl0N0dhLzRDQTBwaWNsRURtWDN1V2M4ZXEy?=
 =?utf-8?B?QWZodklxOVY3Q1htQXVLVnloQS9BSEhrZTQzSG5DM3NiaVhZUXVBaFAwNUNP?=
 =?utf-8?B?S2pWWDVEVzA2Um5IOXh5eFpkekJiMTkxSmhYOVZhcDMwRTF5WWxkL0R3U01j?=
 =?utf-8?B?blREcmpCLytIVWJKN3BqYXF4eWlHWDR6SU5IMUtQRzBHbWRyNUl4QkVDNm9H?=
 =?utf-8?B?ZmVuWXZZNlptcjJWWmd2NnpwMFAvaDVaY3B0aHlSNmJDWG4rZmdLczY5Qmo0?=
 =?utf-8?B?VjRGekdIcit3Ym5td3YzenYwNTJJUmZYRzJxM0hmWURKYWNRS09ISzdzRlR3?=
 =?utf-8?B?UmU4VHozVjlNK0UxT1FPck96alAzNFM3eFp2N05HTlhORFNkTU5jaWgvTVlu?=
 =?utf-8?B?VC8vZGtlWThEcVptbU5seWVHb3ZHVnhLdEI0YTBTaHJJWWZuWmkzVUFheEV2?=
 =?utf-8?B?Q1ZxQW5xcklRUE5PK0lnWWdKTU9PUXJlUko0RWViKysrSzBER2o2ZmQxS0pn?=
 =?utf-8?B?SklMLzhPbEtyOFhhSXZpTEVLcWRMS2dvcTEwc3ExQTZrQlF4TVNzVFAybjhE?=
 =?utf-8?B?SWpHS1hxelBaMVdNZ1owWEFSZTU2NzNtTi9WQ3ZyT3hxYURQYysxVjc4R1VG?=
 =?utf-8?B?alFTaGJZOGt6ZTI3OWxKdCsraEIzK1o3Mys0TzJsVUdnOWtYUm1HcUlkRmYw?=
 =?utf-8?B?SEZ4RTNGWXBRQ1JhQ3c1Zi9sVFZBNVFVcFZjVnRaZmdZT0xPWFI1SDB6eFFE?=
 =?utf-8?B?K0RFaWcyVGF6L0ZjZ0dUSVZVdkNyYU5mb2hud0VlYVh3clI2YVJsVWZ2OW9F?=
 =?utf-8?B?TUhqV1BuZHRCN2FJdUtKREVnd293TjJEWG1sdkliWWN1L2Q4M1dablZlV3JV?=
 =?utf-8?B?UnZlcmFOU2w5WWxtanVGSDdBc0kxZGJWMFBWcXMyTDdsem5LYzBlZlp0VVIw?=
 =?utf-8?B?blkvYUFEODd0RDVEaHZQVUtxOFEwaTc2dUF5Y3RJTVQvbGpCVUpjMkt3MlZ6?=
 =?utf-8?B?RDVTblhJL0ZtOHV6VkN0RFVTY0xEK0JlSnd4ZHRtMElGTk9RT29xNm9JMnR1?=
 =?utf-8?B?U3ZFTDQrWTljbHJqK0hVV2Z6ZzFJc05kUTQwLzV6RnVaSDF6dGQ4bVZxbEpv?=
 =?utf-8?B?OU9sS3VyZDBBaEJITmxlNHJwZkU5ak1PKzBZUHJpZ3hhM0hCU1phNlEyOTdB?=
 =?utf-8?B?a0FGN25ZWklOMGdoRGVSRlFKOHhDN0VBSEFoL1RyOWxaS1hoQ3FKaVk1TjFv?=
 =?utf-8?B?MUNUc3VtVjZWU0JDTWlOT2xxLzR1Q1pkY3lrdEdBQWVCUFRxYVl5U2RBME9U?=
 =?utf-8?B?bWxFYUtyZGZGKzdrNDZtYisxTGJkWkVReW83bVdsWkcveHRnYXQyUk8vY0dI?=
 =?utf-8?B?YndJN05acDJ0ckRrcnpZeDFKWmdzNFRyZXlwdEpraytvVmQ0N2pKblJiNDNP?=
 =?utf-8?B?RnVvQjZnd0tuWW5XSGFjUGZuZWRjTERIYVU3RjRhQ29ib29wV3pMWHI2YSti?=
 =?utf-8?B?T0ZwaVZLa2g2NlZldTI0OUdVS2U1aGt2Mys0QmNwT0xkUWw1ODljbFYvUTR5?=
 =?utf-8?B?UW1RNGxWQ0xWdDQxT2YrTmpvVkl4azlHYmZVNHBpcnN1dU1xYVlRRGUrYkRY?=
 =?utf-8?B?K0lqR1VXM1dnUUMweEx2WDlUZzJqcHhNQWt1cEFWOVRzRGlQWDJ4K2IzYVRm?=
 =?utf-8?B?NUdHU0lud21sVW9CVHgwMmNPOCtrS1MxTDZqZ0IxUEVmRm90YXVNTUVtMkdx?=
 =?utf-8?B?OFpBVUhpOWQ1ZVE0c0ZLKy9MUHlnOUhRM3hlU280eHlYOGJvRVVuL2s4NUlC?=
 =?utf-8?B?L3ZKZlBPbWVqZTFSd0NuYTZYNUdnZEdCSElTTlNoZm43ZTBkNFBOUVFrZUxx?=
 =?utf-8?B?QU5IcGZwZDRlNERLazJXdjI0bzZuUGpiS0VMZkRnM0RSU2QwQU1RVU45ZEh2?=
 =?utf-8?Q?b/nemYc2WM90VDj9Fj0j544ogd1XjI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHVXTmZoSWNWUVIwRzFRa0Y3OXo1SEZvYXdEYzhpNzNBSUFaNnZlSzJUaWgx?=
 =?utf-8?B?QVh0ZGh3YXByTVBvQjIrQ0w4QUE0dVdvTWxhMTFWVnBYNTRrMHZWQk1NSTVE?=
 =?utf-8?B?dFQyU1ZtZ0hTV3JMZlNNbkNxY2t5RHVYL29VcDNrdVI2Um9Ic3NhYnRZZ21I?=
 =?utf-8?B?RTN3QzRLZTZ3Q1VFb2JycUEzN2o3MEF6dzFVQTZFb0VmRlF3U0pBYmJPd3d4?=
 =?utf-8?B?UVRCdGxURFJub0xLZmxEVWN6bHJjVHhSRVpySm9id3JiU05kUU9tV1hvS2V6?=
 =?utf-8?B?UERtcXMzZmc2M2pJeTh2SzY4T1Y3MFFsdDBqUHZtU3pGNVFCU21DQTZhekNo?=
 =?utf-8?B?V2dYdGJTYUZXeHMvVkZoTFhCY1E1cDFtdnR4YW5BZi9kUGtIVk44OHNzaGI0?=
 =?utf-8?B?ZUFmZ3JaUkFzU1Z1SWR6a1dMU2NZS2hqWVlpdE45MndibVFPQ2I3SWlLZ1dP?=
 =?utf-8?B?cE02Z3N2eE1zcGkxdFo2VnBNSDZKcEt5STlGRTlQeHFvN2FqVG8vbE1KRThw?=
 =?utf-8?B?MmhrUHVxSDlTdnZEaytMc2NJMkxQYkpWZlZ1K2V5YmhKRzBpeVUrZmdwWmJt?=
 =?utf-8?B?d2t4eXFrN3plWmIyNHVGK0x3WW5OODQ0MEhQa2JHRzJZZUR4NHBpbUxwMGhm?=
 =?utf-8?B?M0V1QlVYMTRhajFQT2h5SkxJQjJ2dVZoYVhqcUF0dDFNY01UTy9WSWdTc0NE?=
 =?utf-8?B?OVpYMjc4L0g3RkRyMm5MTDhGelFOdFhEUDZqNm1ZdnhZUFFzWFMrb21TNktX?=
 =?utf-8?B?a3Z2NXpwSC9jUWpCOVRxdXF4NnFHdUpQMUVXNVRXc2dHeXdpV0pUZVNUZlZv?=
 =?utf-8?B?SXVYU01tVk9BQ0E3RlhzeERrNDhHaGZxSWd4Yk16Vm4zcVN6ZkVqRFFsL2d4?=
 =?utf-8?B?anEvNGdIblFEakV5L0o3ZUxGWWE5Y0tpUWlRNDZYbElhSHRZd3dqQXB2ZVhC?=
 =?utf-8?B?TEZDYjRjRXprWTk1SnRUcGZOOEljRUc3Q0hlMXhBVDVXdi9vR2p2TFBlWlFj?=
 =?utf-8?B?OUp3b09EcDVxcFZYZU1uOWZ0eEp0TjUvTmFMdWIvbHlnN2FxeE44ejhrbmNF?=
 =?utf-8?B?M0VPUUxkN0lzdU1nTC9OZEdqbUJPdzIxR3JUMXNObE5majBEK2puWjE3dmdH?=
 =?utf-8?B?QjRHYm8xcE9NT2VVS09oZDhidG9FUDYvbXFIRng2UkR3SlEzTVora2FiekV6?=
 =?utf-8?B?ZTZ5aUlYSHJqc25jSkNpZTg3U2NLd2loUnErajBpZUZVU21UL2VvTTBtZHQ0?=
 =?utf-8?B?cFhWcW5LaTE2WUlhOW5LOGphejB5OTU3UWptUEIvcnpkcjVJR0VMWmZVL05m?=
 =?utf-8?B?SktNcXo3dnl0NDBiaERIZm44bTNZWVRISzBGSGxRQ2FTNVBwQjh2bUo4Mmw0?=
 =?utf-8?B?V2JsWng3akgxaEtxdy9La1c5NWhkaDdOWnN4ZDFKaDRERzhoeVlQUDZ2azJO?=
 =?utf-8?B?OXhnTXpHeGIxMDJlVU15WEdRaUJpanNvZHZRdXdxaWo1Y3Yybm50VFhVdEFL?=
 =?utf-8?B?ZFcvNTd2K3ZMbUdkWXZWd3NndWpKbUQzUUFEbS8vMXh4ODRTWGRrbDhNWGtq?=
 =?utf-8?B?L0gydjBXR1hkZTIxR1pDWXpyRGhpbnR2eHZtblJSRDFvLzR5UGdUNVJIRTQ1?=
 =?utf-8?B?UWdtOGpic0NuTnRkcTZVOXZMYWk4aDZvYStURzlFdTNTMEJsODQ0TEVBZlho?=
 =?utf-8?B?U3NRcnI5MDBwVjM1RXl6TExiSFZVNG5Edm5kRjZvei9XbCtEQ3RzeUVaVTVB?=
 =?utf-8?B?ZGlGTUttbzJlWFBRYnlIRTRHVTFHcFA2Z2E3ck1UZkxDclNSQmFTOHRZSzBR?=
 =?utf-8?B?UUpLZkRINE44ZjB2M1orcTNUVldsQzN2bXRZSW9NV1kvYzFHQ0ZzYTE4amNp?=
 =?utf-8?B?TUN1enB1NW40RXEzNnpoUm9MRkl6U0J0ZjJEZy9VSmYzTzZBL0hYSG5VYTZk?=
 =?utf-8?B?cGw1VVlYaVVXWSttTnlYTmxxZmVHMUIrY0I1b05OYTUxSzhJZmNGUTBNK2Jk?=
 =?utf-8?B?TmdWakhQOUxEU1dDRDFOYXFvYVJEblA4ckhzcGRHcW04QjhQbFlwaHFhQkk3?=
 =?utf-8?B?b2dTUG40ZjVwNStUd2VpYnlVaituOTdiZ21QOHZVWjdYOGgxbDFyTXFvd054?=
 =?utf-8?Q?AurdwrgZvCT/XWtUaMvwPr+ZR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A02965D2977FC4AAF3901225456A7FC@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 538c7647-9240-4170-3bf7-08ddaacc1eae
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 22:46:22.0857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4kqeQ2pkLTaSAB1onnl2MQGUbXosKwzeeudGMA1JAFoo5GezhrfI5HX4AtSLQMPyslYUA1jAagrIeB9rmTK0fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207

T24gVHVlLCAyMDI1LTA2LTEwIGF0IDEwOjQ1ICswMjAwLCBCZW5ubyBMb3NzaW4gd3JvdGU6DQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU29tZShzbGFzaCkgPT4gc2xhc2ggKyAxLA0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vbmUgPT4gMCwNCj4gPiArwqDCoMKgwqDCoMKgwqAg
fTsNCj4gPiArwqDCoMKgwqDCoMKgwqAgbGV0IGVuZCA9IG1hdGNoIHJmaW5kX2NvbnN0KEZJTEUs
ICcuJykgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNvbWUoZG90KSA9PiBkb3QsDQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTm9uZSA9PiBGSUxFLmxlbigpLA0KPiA+ICvCoMKg
wqDCoMKgwqDCoCB9Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gVGhlIGZvbGxvd2lu
ZyBjb2RlIHRoZSBlcXVpdmFsZW50IG9mICZGSUxFW3N0YXJ0Li5zdGFydCtsZW5dLA0KPiA+ICvC
oMKgwqDCoMKgwqDCoCAvLyBleGNlcHQgdGhhdCBpdCBhbGxvd3MgZm9yIGNvbnN0IGNvbnRleHRz
LsKgIEZvciBleGFtcGxlLA0KPiA+ICvCoMKgwqDCoMKgwqDCoCAvL8KgwqAgY29uc3QgU0ZJTEU6
ICYnc3RhdGljIHN0ciA9IHNmaWxlISgpOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAgbGV0
IGJhc2VfcHRyOiAqY29uc3QgdTggPSBGSUxFLmFzX3B0cigpOw0KPiA+ICsNCj4gPiArwqDCoMKg
wqDCoMKgwqAgLy8gU0FGRVRZOiBXZSBrbm93IHRoYXQgYHN0YXJ0YCBpcyA8PSB0aGUgbGVuZ3Ro
IG9mIEZJTEUsIGJlY2F1c2UgRklMRQ0KPiA+ICvCoMKgwqDCoMKgwqDCoCAvLyBuZXZlciBlbmRz
IGluIGEgc2xhc2guDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoYXQgd2Ugc2hvdWxkIHJlbHkgb24g
dGhhdCBmYWN0IGZvciB1bnNhZmUgY29kZS4NCj4gDQo+IFRoZXJlIGlzIGFub3RoZXIgYXJndW1l
bnQgZm9yIGBzdGFydCA8PSBsZW5ndGhgOiB3aGVuIGByZmluZF9jb25zdGANCj4gcmV0dXJucyBg
U29tZShyZXMpYCwgdGhlbiBgcmVzIDwgbGVuZ3RoYC4NCg0KVGhlIHByb2JsZW0gaXMgdGhlICsx
Og0KDQogICAgbGV0IHN0YXJ0ID0gbWF0Y2ggOjprZXJuZWw6OnN0cjo6cmZpbmRfY29uc3QoRklM
RSwgJy8nKSB7DQogICAgICAgIFNvbWUoc2xhc2gpID0+IHNsYXNoICsgMSwNCiAgICAgICAgTm9u
ZSA9PiAwLA0KICAgIH07DQoNCmBzdGFydGAgaXMgdGhlIGZpcnN0IGNoYXJhY3RlciAqYWZ0ZXIq
IHRoZSBzbGFzaC4gIElmIEZJTEUgZXZlciBkaWQgZW5kIGluIGEgc2xhc2gsIHRoZW4gYHN0YXJ0
YA0Kd291bGQgcG9pbnQgcGFzdCB0aGUgZW5kIG9mIHRoZSBzdHJpbmcuICBUaGF0IGRpZG4ndCBz
ZWVtIHRvIGNhdXNlIGEgcHJvYmxlbSB3aGVuIEkgdGVzdGVkIGl0LCBidXQNCnRlY2huaWNhbGx5
IG15IGNvZGUganVzdCBhc3N1bWVzIGl0J3MgdHJ1ZS4NCg0KSSBjb3VsZCBhZGQgYW5vdGhlciBh
c3NlcnRpb246DQoNCiAgICAgICAgICAgIGFzc2VydCEoc3RhcnQgPCBGSUxFLmxlbigpKTsNCg0K
SWYgSSBzZXQgRklMRSB0byAiSEVMTE9cIiwgdGhpcyBjYXVzZXMgYSBjb21waWxlciBlcnJvcjoN
Cg0KMTc4IHwgICAgICAgICBwcl9pbmZvISgie306e31cbiIsIHNmaWxlISgpLCBsaW5lISgpKTsN
CiAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXiB0aGUgZXZhbHVhdGVk
IHByb2dyYW0gcGFuaWNrZWQgYXQgJ2Fzc2VydGlvbiBmYWlsZWQ6DQpzdGFydCA8IEZJTEUubGVu
KCknLCBkcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3B1LnJzOjE3ODoyOQ0KDQpvciBldmVuOg0KDQog
ICAgICAgICAgICBhc3NlcnQhKHN0YXJ0IDwgZW5kKTsNCg0KVGhpcyBjb2RlIGlzIG9ubHkgZXZl
ciBzdXBwb3NlZCBvbiBiZSB1c2VkIG9uIEFTQ0lJIGZpbGVuYW1lcywgd2hpY2ggY2FuIG5ldmVy
IGVuZCBpbiBhIHNsYXNoLg0KDQpJIGNvdWxkIGRvIHNvbWV0aGluZyBsaWtlIHRoaXM6DQoNCiAg
ICAgICAgICAgIGxldCBzdGFydCA9IG1hdGNoIDo6a2VybmVsOjpzdHI6OnJmaW5kX2NvbnN0KEZJ
TEUsICcvJykgew0KICAgICAgICAgICAgICAgIFNvbWUoc2xhc2gpIGlmIHNsYXNoID09IEZJTEUu
bGVuKCkgPT4gc2xhc2gsDQogICAgICAgICAgICAgICAgU29tZShzbGFzaCkgPT4gc2xhc2ggKyAx
LA0KICAgICAgICAgICAgICAgIE5vbmUgPT4gMCwNCiAgICAgICAgICAgIH07DQoNCkJ1dCBJIGRv
bid0IHRoaW5rIHRoaXMgaXMgdXNlZnVsLiAgDQoNCg0K
