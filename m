Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013059.outbound.protection.outlook.com [40.107.201.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2E6171BB
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 21:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775684214; cv=fail; b=lMrd9hMuTh2h6jMztLwATEjtR2lVku5FgSBje7yFiWePfOOEZoYnbTTX822oGuYuMqZcBdhbLIQ3PBMWPP1B8YvbKV26UbLgSkhU5jfmVc00XB6QiAdHSChe7pgYKGe48MIDUz4d3lmBL2ezVL3k+JlhuzuyxUQdrPuJFtxoGzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775684214; c=relaxed/simple;
	bh=hIib9fUt+brYT8i0NQ1O70BUT/BCTTskSuzoI0HKrRg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BEtyKQt8WB3G8WvSNlF8ar72b4yfRUySlLeVlf2hwwrDXfJJF6tBqcZOLZxYuOLPLdFlwaEK0C89kFdBLwEZ9MlFQZBsSpjN4r+KODjRHuFInBcle7Q7KcrP2Tpnrl7ipQ/PqjlqBPkSNzbfKckkoSz30TDuEv6gOklSFEPKZAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MYjLuyLM; arc=fail smtp.client-ip=40.107.201.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MYjLuyLM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AucTi1sPux8cBjKts0GW3+il3LzDADSse+gwTTRwD1x2uBGVZ2CFwdz+fZtvbxgQ6go1ah7um8S0lPcfpYEbsm+8GnLWlsjxJDGybJenRRVOHxRRviL6wlAI0/3uOye5X8z8XknMISqS/aX41sAArNe9dr0rWbysRPcWPo8amg5uLXmmwvO0oD9/qSunZqgDlFDtrczMTEvwuxW3kO2Rsi2XQz8dfGRBIqNz8r33Dw6cHve48yjkqtbQe9/LcE2UZgWPbXxtouGguzCVUHUBJksmjs6AZVl/SeMkUE0THKO1oTvIyhlxH6vUrqMgnYqxNa/QNLpe2LkhN3SLiMyZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIib9fUt+brYT8i0NQ1O70BUT/BCTTskSuzoI0HKrRg=;
 b=v+J5L249z37z63Zmt8lmMPLsYvB/6Ai7I0RmJHUEcz8TLLmSaXxYxWz+GI6MrrrJ9LvMUzePuDwDLRbazslgaFUg3a/7x3OBNIxtNhGSWFhR7reWhbm/FPcuTz4h9wz+xpz9M8duM5IQqQsYsCCuuamqGrRmcuqVf1f/81OPBwYWyLMzGMOto0QKj8FbtuiGouYlqetZni24MHANsdsaGi2IyJTxq+WANg2Hhyvtce6jI3VIIwe2GGkZfQ/1ruRh7rKqsXYy0piI61Qvi/mGU9k9cwu6NhcERPi25BVLJBbmzK7+LUXlOxlNh5t/cPkBbup/O9GDPZz0OgwG0Z5rrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIib9fUt+brYT8i0NQ1O70BUT/BCTTskSuzoI0HKrRg=;
 b=MYjLuyLMAScAY8b0gGujqKmAAHrEsZ0fVvaJh/ZB1KiXWZRjzaCJ5Bstu3m3HJheb4lW6PzXlYzpP2719cXEeZba2M9qaaGxcsQIv5rIDTCatsc4BCht2E+sGQwDqziaXDpNcv8oAlqdh9M326Mr3oGKPhiCjRtXVrpDXDhYmtKGefTlP7oxiugmAjKDa320aBsUwbSX2I0bsoJl4Kzx2fZKJQag/Q2Y+edwIDNdMa579qF8eEcX7hVuenJfAIqR4UlJcC0zq9P4+1S1Wgf9RaVsIQn0XcbEjqK+aIe7g/mukczTY6NtSQqRPl7+knz828DtCT01l3KQphNHwrsI+g==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 21:36:50 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 21:36:50 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Alexandre Courbot <acourbot@nvidia.com>,
	"dakr@kernel.org" <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] Documentation: gpu: nova-core: document the IFR header
 layout
Thread-Topic: [PATCH] Documentation: gpu: nova-core: document the IFR header
 layout
Thread-Index: AQHcx2MOkY9NPXJLZkaUS7kWI51ccbXVsNaA
Date: Wed, 8 Apr 2026 21:36:50 +0000
Message-ID: <f86f2dec2c3b6198ec0d175bc69ad3cf8962cf3b.camel@nvidia.com>
References: <20260408142132.3911466-1-ttabi@nvidia.com>
In-Reply-To: <20260408142132.3911466-1-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|CY5PR12MB6108:EE_
x-ms-office365-filtering-correlation-id: 4d460249-b4c9-42ca-d25a-08de95b6f1b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 X+0XShB8sYTOTQKTEOuiif8m/jISJ1FaU0lCMZc+EdHLpqataxRumSiJ6LTDK4bqiLEL5v3K6n6Pg47RJf3WZ60w7hCDqtqnngP/Xyx4oK/CzF63BNIZEbfalMCRxjOJmKlnlaJXs0aoG2WRWS9+MoSbp2AiO1hDLZPufkMEis2/SNcra3LC+BfvW6vJbYw5dHNdym5/TiMlwC+DHGHDW1k3DJ5USDgLGLHD6cXzgcfNs4rD2D6F9eJyPCJAyOODPRcz5+8aagX/K6TLyowSqxd7/Mi7WvmTVL8p51fkvEWcf3ltJjvlBokx9tsQxJacoAOINqo2Er6VJFoTpxaHXPjLb11iX2e5jAygY//TewvedFUM850qd7L1PBIMywYSQxL7vlEnguxaE/403yjXZMtnkaa6q6R16yiu6sN1FYdhiclc52cTE/6xI2Czhtyj0kKb0CZGt3tu2EnOJkVJJcQwCxDku82au2fsNWx4/QpumwNI9MGZQEgnMDm0wh1sZ5ADJx2eE398k7HOCPTd08saueG722dIEfDJUI4na+AWrtxXDpU68O/AhcaCtfR1n3jrzUfqT9djTROWDs9ayD2M4V0sV/07vgYrojs/Dw7P26yFp+Zq9LNw2c4BO6GrIGAMc4hSz7XhdkOU/spckLs3m1ZCNa8QBqgnJo/mGr44om0VZv7aRjEcRmPphkxCDpEllcJXd/YlbIQCkGPpoqg82olFjNkzBqpTgFpJ7EKI464fWNrdEJ/YPID4+oFjBGYNadKF87W94ma732zWodXB0MfCQxpW2g7ab8qCXA0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGw0U1RxNkxiSlA3dFNKa1FqaFcwZDRLSThNeFNJRGwzUDhYWEZuQUw0RHZF?=
 =?utf-8?B?SXBPcGF4ZVE3Q0lWdzRGSlR2RysvdmxWWU1neStWcllzdjRzRmdYNDBQZmlj?=
 =?utf-8?B?M2VXc2poN0JWTzJjam9wQUdKeHV5Mm9qQnh3OW1wMURSZlM5QnRwQmFKOThQ?=
 =?utf-8?B?TUsxZU9DcXF4Y2l6WC96enVnQmsxWGhleFpKSGtqWHJ5T3RpcDkrK0tnd3Nw?=
 =?utf-8?B?ZXZ3ODdtMWIrSCtNbkt3WS9LMVFycnY5VUgvMjFuNTh4d2lZNmMvNzN3TnRy?=
 =?utf-8?B?QWpndm9SV1YyaFBvKzFZOUMxckpCaFJIRi83R1hxdms4NFJaNURsTCtyUWpo?=
 =?utf-8?B?KzZRejFxTGJJdkRBZnpjSVFYdE1rWTA2WWI1bm9pZDFKTUw4UHpTME13NWVO?=
 =?utf-8?B?Q3gzUFVJVzNXaG94VmRiMGFVZVo5elFDR2xSWENXeWEzWTJBelpkZWJwYWJl?=
 =?utf-8?B?UWQ4bGtwNmQ4RmRGMHNsU2xmMU5TYkVKcENLYm1Lc2NrTTlqVUtkWC8wM2lG?=
 =?utf-8?B?RFVYY0YzRlUzcFJEc0xOTkVJMkZJZWJRT3hxZjI5K1JNOFk2K0FwRFkvaFV4?=
 =?utf-8?B?bnpCbnhRaWZ0dGJnbmhNdFFIamxWVEpDNDJ3b1g5bXZSSWNFZE85S0Z6c2pv?=
 =?utf-8?B?NTA4SnN0K0sxalZ3OGZtcnl2SGprV2tka3h5RDZ3RHVlOXhzYnBsMnp4MUpq?=
 =?utf-8?B?bzFqa3U4azFudEREV3BSTzNsNFhjUFp6ZVl2RWNrS1AwMlRyVGpCbU8zN1c1?=
 =?utf-8?B?SkVHdU9GWThYWXJFTm1PdjBLZGhRN3Q4bFJ2UFVXWitUay9ITGlNbGR4elln?=
 =?utf-8?B?SkJTck94Q1Mvd1lHRW5RTGU4dWJwSEoyNmNvWHNSdkdZNDJ4SE5hbHhxaS9k?=
 =?utf-8?B?TVpJRVR0T21HM2pHby9rbWVldkg0amtqRW9NMkFsYmc2eVk0a0lScVRZWE9M?=
 =?utf-8?B?VjBUQkkwUUJnSW04Q0owL3lOZWNPQmtneXRSVUNQQXRhUytQSVNpVHQyVm55?=
 =?utf-8?B?SXF1clNqbW4xVk5lRzc4dmEvOTMvOWxFSk11bTZtNFMrcVJ3WFBtb2tKWmpa?=
 =?utf-8?B?NUYrSGRDTTAzcnkzZXhkcnN6Y1F5QnJuVWVRejhuQitlVWo5WlBCbXpqYWVM?=
 =?utf-8?B?OThIZmtYLzZIcFpOM3JoTlNJbmhVVVNDQlpXVkdzTjJ1YkFxYmtYVFBidDNH?=
 =?utf-8?B?d2lOTEYzSzVMUDRMMVEyejBibk56YlQ5UWZ1NVhmQWwwWU5NSnVPSzJHNWFS?=
 =?utf-8?B?bTIyV3p5WGtkbWNhVFRteGgvcVE1Ui9nc2E2N2FxL3FkTURjckxiTnJNbUx0?=
 =?utf-8?B?UDk0WmE1N3Q3TEtSend1NUF6KzU1WDYrTVN4bnZINlNBS0RWelNBeGQ3c3pJ?=
 =?utf-8?B?MTZDZ0hWRlo5cWVrbmlORVJxa0NWUnJjWG1RUlpqM2ZHYWZoTEFxcTJLWHVx?=
 =?utf-8?B?YkdBRHYwT25yd1V6bU93cytLaWZSbldmNnFQa3p5TmdycGFrUmtDREVzWEhB?=
 =?utf-8?B?Z1Y0NzhNYzYyZDVYOTlHa29SRGppVitnNFU5QzhGTkhUbGdFaFNRbXhsT1M1?=
 =?utf-8?B?UXpnRGdKNnJwbzBORS82c1o0YThOWUcyUHBOMVdpQk91UWM3Y1BRenNaUXpx?=
 =?utf-8?B?MUhhbXkzcDNoeDgraXFPRDBhU01SUGt2L2V6TUJiNTlUREFOT0M0RlFJMS9L?=
 =?utf-8?B?bUJIL0ZNdG5XQ1o2RjNYSG85aGJVNml5QkNIeTlDenU1WWc2bU83TXZwV1lt?=
 =?utf-8?B?SGNwMHBLUjlVbFROWkVoV25wTUhFZGR0WGhId2lQN0R6dkhiSTJRK3UyYUxk?=
 =?utf-8?B?RUlFcW5WdzRhT1pWcGZCNHJBOGJwbXEzQnJRb0prV1pGeUV2UStpTmRFUzhG?=
 =?utf-8?B?ZnhWQ1RCZDB4WHozVHRtLzlMR05Ga1czZFlqTFBMbGQ5RnlSWlYvd2VuOWQ2?=
 =?utf-8?B?VGI3STJpaTFjL2hpWmI2cExoUWo1Mnhlc256cExSYVZlTm10NFFwUWJvTzB5?=
 =?utf-8?B?Q1IxbmdPclVNVTNWV2pQU1J6dXpwR08veWJHeU93bUlCZ2JIRHZzeEZTVlhs?=
 =?utf-8?B?Umx4S1dqY0d1ZjJRK0RaSGh2QW1xMys5Vjh0VE5OUDE2bStIZW4vM2l0OFZt?=
 =?utf-8?B?cnJGM0I4RkJXZk1NZkF0bDlxL3JQSXdaTS8zdG1DRjR2V0ZCeWQ3alp3YUZM?=
 =?utf-8?B?c3IwY3lhcUlvOUs4ZHptM3BuU1Z3aEJla2MzRmJYQzNPN1g0aFZrOVhDT1Ax?=
 =?utf-8?B?bGRqT1V0OVNialJOYVZhKzZhQXZOLzhUQnhXZDJKVWc4ZERBZm9BNHZpbXl5?=
 =?utf-8?B?Zm9RS0tnYk4xK3UrSDBrNFRNZU1kbVFhWUdlQXgzR09sUDQ5ZHdjUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F3776D7EFB5B64BAC101B9CECD7AB28@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d460249-b4c9-42ca-d25a-08de95b6f1b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 21:36:50.4947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vt5kowfIZ73CYki9n8LT4cXxaFgXbk9ZGAsIP1WkrcAz9wUviSrnJ4G463ktrKMsx3tCiTMdB8TDBsOixBSd9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108

T24gV2VkLCAyMDI2LTA0LTA4IGF0IDA5OjIxIC0wNTAwLCBUaW11ciBUYWJpIHdyb3RlOgo+ICvC
oMKgwqAgT2Zmc2V0wqAgTmFtZcKgwqDCoMKgIEZpZWxkcwo+ICvCoMKgwqAgLS0tLS0twqAgLS0t
LS0tLcKgIC0tLS0tLQo+ICvCoMKgwqAgMHgwMMKgwqDCoCBGSVhFRDDCoMKgIGJpdHMgMzE6MMKg
IC0gU2lnbmF0dXJlIChtdXN0IGJlIDB4NDk0NzU2NEUsIEFTQ0lJICJOVkdJIikKPiArwqDCoMKg
IDB4MDTCoMKgwqAgRklYRUQxwqDCoCBiaXTCoCAzMcKgwqDCoCAtIFJlc2VydmVkCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYml0cyAzMDoxNiAtIEZJWEVEX0RB
VEFfU0laRSBGaXhlZCBkYXRhIHNpemUgKG9mZnNldCB0byBleHRlbmRlZCBzZWN0aW9uKQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJpdHMgMTU6OMKgIC0gVkVS
U0lPTlNXIFNvZnR3YXJlIHZlcnNpb24KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBiaXRzIDc6MMKgwqAgLSBSZXNlcnZlZAo+ICvCoMKgwqAgMHgwOMKgwqDCoCBG
SVhFRDLCoMKgIGJpdMKgIDMxwqDCoMKgIC0gUmVzZXJ2ZWQKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaXRzIDMwOjIwIC0gUmVzZXJ2ZWQgKHplcm8pCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYml0cyAxOTowwqAgLSBUb3Rh
bCBkYXRhIHNpemUKPiArCgpJIGp1c3Qgbm90aWNlZCB0aGF0IHRoaXMgc2hvdWxkIHNheSAKCiAg
ICAgICAgICAgICAgICAgICAgYml0cyAxOTowICAtIFRPVEFMX0RBVEFfU0laRSBUb3RhbCBkYXRh
IHNpemUKCnRvIG1hdGNoIHRoZSBkb2N1bWVudGF0aW9uIGJlbG93IGl0Lgo=
