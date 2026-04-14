Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010015.outbound.protection.outlook.com [52.101.201.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6EB30FF31
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776136406; cv=fail; b=Wm1neq2OJWIqPFpTUd40XAT1AKUie3DOUdFHBEtknvGBbITkwHQB5+QgxX2BUUSIfX3vd286XCy3h6ErOmN4CSQdv8SWOtID2FcIyGGi4SVHNhuqXfiEfUd7setaVroLxOu3lr5lV4lTND4yN8Y5hUhgIL+YOm3AlGD+HDT6sCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776136406; c=relaxed/simple;
	bh=c72jZ2zXYJqVXNKNXxWkqMqE76nqBlJ7L96nNnm9idg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gyz4+2jISBTyon9h7VBn4JI8aKsaY4KTkgnSlUEqIfkGjX6J28U7GlE5bh3Tup8WbMZ29wnmKReH5yrZvg3zjstQTVV2Ww7oGQrwvXuJgaj1ob0VSc286bf+ZIAFj91MlVrGBikpJ+f/MlGohNhZfnZeMjKdBTYL72BWRIB+V+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AZeCjeRb; arc=fail smtp.client-ip=52.101.201.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AZeCjeRb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFnDDAWTTbYrlxKudvNjxaS1Mldu7yyJE0rDyE/z5lxRNt2FiD3NFKTL1OispUCiLbELqqfdBDxYlwEqIBzdUaCExVm2nsjAjep72x4Yq0TxzPDNnGbry+DWq7XSeXWueyUzk2dZ6VWGDose6Vq87TygDevj+Nf37yIkS6fLdokbIukSG9lIYZmVgjGHr2NYB6WUYb34b/rY2ibOH5yu2pNtWIAVhxJag9UGBOW8GCIyvGCjR90AlX/hKNhQxk/SQzGRNwRqk9f/BNA1LFVqlx1VnmPOUaLdosYIVicaUJwEQ4SjZmLDk2VSHlSq/bSG8d9FOFPHbbFlw+BE8VakAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c72jZ2zXYJqVXNKNXxWkqMqE76nqBlJ7L96nNnm9idg=;
 b=R9BZDoEEJJSZExdRpvpV4LLqY1snjqPEEVXO16TgP//7cQo7MZivaWbkPCz3dLIW5vehfLDIgNl1lOizF8BfAnSWv+rUAwpweyXDE8NAUtbEBU6RtWaqXe2EaGoyrRFimMpRysRXgj9tcuSJOSFL4D7431EDDHr1PdTD7nqNi6MjoHD8AyE81zKv8KfodhpZt5ZXHtXHwQRbqPIx7ErsyyGO9xf9pzhpz8IA1rBE6PcCUGD7MK0sl+/6oqtTQ3pLZmxwluqX3F6DPTSnRhoLJM04OZ4fNv8X+LMPhbSGSjkX83gvf0w3hHCWMIqkbOlize6rjAon7As4v7pf9PaVPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c72jZ2zXYJqVXNKNXxWkqMqE76nqBlJ7L96nNnm9idg=;
 b=AZeCjeRbINBzMRGGdchHKr6Pk8rqOul+zwJBqxtkCxDfSGhEeNIeGtZigBWp0ND3NYCd9rrtxTDtC0ykwiv2hnVXzWan/9MFXeLnt1Yv7aue9DTZpk63/3eNwAmlysRpJZwKae1Whsfx65qqXQVf027WK0FaH47TaZLBNvt97b+1q+t+Lhf/ZSxRD7xHo0E1VYCFjjL0/h7KLf6Bx1bQj6V07xl+hvRCv5pwPyUQphuL1+WxusVr9nvvwhhfRR7aK/Z+I4EmdKC5J1k1m1lqL9K6c7Mhf+89sOnsbrUvE2S31HbPlOG0SvAGflqfpo3ABvbZHvqzyD2wj2EOPtjcQg==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by DM4PR12MB6088.namprd12.prod.outlook.com (2603:10b6:8:af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 03:13:21 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 03:13:21 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
Thread-Topic: [PATCH 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
Thread-Index: AQHcySnpZNGrA+Tmyk2lv41sef4ywLXdwwUAgAAj8QA=
Date: Tue, 14 Apr 2026 03:13:21 +0000
Message-ID: <30ac632602debeaf649e67ecd2e0698786c19517.camel@nvidia.com>
References: <20260410203722.1586938-1-ttabi@nvidia.com>
	 <20260410203722.1586938-5-ttabi@nvidia.com>
	 <DHSH2KPBYD22.3AWUHG3TCVAVY@nvidia.com>
In-Reply-To: <DHSH2KPBYD22.3AWUHG3TCVAVY@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|DM4PR12MB6088:EE_
x-ms-office365-filtering-correlation-id: ecf1ce05-c6f3-4255-5317-08de99d3c884
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 0E3W7QeUx0hNUHHamPYkf70KJEy2HLRoEmL4qsiGiT9doZgrm2mNk1S6YXkcxGuaR22IvkUGTBEJU/8rdH6iFGmXwE6KcAaBNjSgX8YOXyDy4gj/GRYipR4dPsK2MCFUzPxGcK1KOHYqyeLl4DNDcR7fcsTF7Q/6JkGBeiDX/K0HJ1W2f437zaeRujjwxJ0FLjptK1OotYSZ9T2IRzS34u4ajqiIowkMiPLnxBAfEq/fnJKLePbEM3ROs7HiVpF2JsV3FxqMcrfRDndY6YXZi2GIhodMxIFLN5dYHcKLdTIe/buaYmkj8+pP034x1YnVQC/QOvBkoLj4P67b3QivnAufnCmxXL4ctImsk5puFllA2C2gfs05bq8r4W/pt2NRsLJOEpS+oMoGIZmSTI6RITDRil1NR/mUqf6Ba8lTBdhQipGBs50AdYrceh5sD0t0ab960ZRrTiq7A0+HCIgPBN+IPvkk2AeYvaclbTDastwFfOIDq4EGWbgRyalz+vf30ucvONDkDakiHyM9ln+U9zbgm6t7OxLdfSdRkxkX0+5xoEzJBjWIWoDzIU0CxROijLYCrJHU0yTN3kByG4lQJEclFR99++V8mzmccnDc4L51toDSxFKjXdxG/jMkyvzj2WygxRhUTmnW4mu7FAULkgAdQnTh42YtU1+Q1qIhW+HL4nLabH3mJQXIKdqZM2eRKgLMQkeT2asp6/TOe7TS5CtJgnobwj+Gsym+3xSGbqgwtPe5vWPlGpyQbpgA5mddkA9OIay8OcaJvbSXdji1NOflZ/2QwVc3EeJwHou+nUQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bWcrTDJTUmxDdzZISkZXMEFrdm0vcUhhNm1keEl6TWdrVytzcDgvVWJQNHow?=
 =?utf-8?B?SlVlT2E3RmFiQTRMMW5tNjRnWDdSbzNvR1dKa0FHOEZQNGExTHdxamM0Uldz?=
 =?utf-8?B?SFdqY3FoRThDRmwrd2ZUL3poWVBFN0lVV1FTcG9hNkw5cVp2QXVsT0JDRlpS?=
 =?utf-8?B?YklTbitrWGREZXZiQUdhdGNadFdvaDBvMVJQZ25YR3R5VFhtN3I2ZHF5eGNG?=
 =?utf-8?B?VlQzWWhaREJOdjBQdlpvb0VCMW4vYldKcUI1M0Z0MWZ2amR2YTFON0hGczZo?=
 =?utf-8?B?R2lqYVZ3R3FITk1tUURTb1h5Slp4QU1IT3R4MjN2SVE5WG9tWGsvdWFvMUx4?=
 =?utf-8?B?TFdYOEJid29rY1N1ZjF6cm5lUG1lQlVVdkRIYk5xR0pDeWhIaFIvcEwrTkNZ?=
 =?utf-8?B?dTdmbDVsSU9IVXJsaWVpbGFucFFnUlhqeTZMa0dXaUJyMG9URzJvTEE2LzY1?=
 =?utf-8?B?K0phSTYwWXBRa3pxUUlDU2p2citSMGJudUcweXZvbVVmcUc5WDdRQ2ZWQnFt?=
 =?utf-8?B?N0pvTEF4VGlSMThCQ1d4SjBSdUhCTkhzcWc0MjNGVU9sdndydngrajFKQUtQ?=
 =?utf-8?B?S0Vva0FXeWRvby9zditCWlR2OWJZbWlza2pCcm5EWUZQUGcvSVpPR3VCZDY1?=
 =?utf-8?B?VXFFMkZ2N2VqOUM5NFpWMDExV2gvVjBaQ1duL09wc2dDR3l5NUJTcU1wa1RP?=
 =?utf-8?B?ZDB2eDJ2Tk9mK01VTG9uc3JPRHJ0dGtTeFEzcmJCSVJmWW5CVHBUVWtnT3BJ?=
 =?utf-8?B?MTFvYVJTNzk2OE55OFZ4d3ZEY05zdjhMNTBiRThqcjZHOUt3Slgxd1pGYWVV?=
 =?utf-8?B?aUVPajh0QkJ2TGo3TW1ZOFNLaEhkUXZBaWdROGM0NkowZjdKT1Z3Q3M1Zy8x?=
 =?utf-8?B?TmZCR1Vpd3A0MmM5endlUWNCaU82b1Q5TWpra3JGYUpYZVdSMmU4S3ZTaldI?=
 =?utf-8?B?SXN3dWRnVnZwSjVIT2dlM1c5WVBpbVNRZWZ6UkpZMHVQZFVXVWdqZ2ZCWHNw?=
 =?utf-8?B?ejVYa0xGY0diTEsyNFJtMlJ1NThjclFmTnpqay9LR0tYNnQwSkh2Nnc2dElJ?=
 =?utf-8?B?SE1jaWI1eUFPZWtCTFN0STZkS0hiNnJldWJGOWwveFpQMVZlY0xZWGNUb1NW?=
 =?utf-8?B?TDZxN2IyUk82WEVVcXpoczhxYzFFMC83NU9XRWRVN0NXT1lUZjZERW9mckFL?=
 =?utf-8?B?Uk1EMXhzS01oN010a3FSOS9RSm9EOWlVcVR5L2IvVjFLUUFQSUdDV1FmaVFL?=
 =?utf-8?B?aitXTUhObFNYOEUwUk1uRmV0ejBndmVDSlpXdlZRMUJZSzNiMCtPOG5vMkxO?=
 =?utf-8?B?enZzbkdRcGxBeDN4NHlWbWxVQytSdTZVdVlRRW15Zm5tZ0NNSWludEpPTGdH?=
 =?utf-8?B?WE0ydVpzT2RydUttb2o4K250RzIvUVZ2Z3F2bTBnUHlCM3lTSVY2TUtnSGRI?=
 =?utf-8?B?RW1XeTh6enZOY0ZiejF0QjZnYnlRbC9pbTdWb1lNTmNMMnR3dnJyd09tZWlq?=
 =?utf-8?B?YVNrUTBMTkZ2WlNZQ1I5R2VzaTdPTm41VWFEWEYrb3E5NGM5QlhpbkJXcjl1?=
 =?utf-8?B?VnBsWDJYNGJyWjlKWm5Qd2txNzhaSFc3ZEQyNUtNL2ZDQzM0bkliSEcrZ2Jp?=
 =?utf-8?B?Nlc0Skc4em00MHZ5M252ZEU1em15QjdHU1FXZFFVR2Z3S3J2ck1uR3JlY0pS?=
 =?utf-8?B?VzRaaG1uQXJPM283UldRcERmTE1FWWdCU3d5UHA5ekp1S0ZVY1VzRllRRDR5?=
 =?utf-8?B?eWNBLzk2b1FjZUxGdmFuL1dhVWR0T0M2SzVSQnI0WlFRbklFMlp5RW40bk8x?=
 =?utf-8?B?NVRxaGNVYmllRElWUFBWYU8rWXVFTkdIOVJUcmpxSHVtLzZuSlRpUWl6TG5j?=
 =?utf-8?B?MmxCT280S01KMGNUSW90L1hJazRJRnlsL2JFYzZRV0JQL1d1emVCQmZ1ZVBF?=
 =?utf-8?B?R0M4ZkdZd09IMlRXL2k5VzFrV3grdm9zdStiOTEvRDBCbGlEU0JYWThva2px?=
 =?utf-8?B?d0R0K0ZiKzkrN05YRktKWUpaUGdUdnRkbTNQU1BDZXlsMVlEOVgreTNFTnAr?=
 =?utf-8?B?ZndVL3dyZ0RkcDk5dnltL1FPMFcxTVM4VVg0SzdJWkhBMUFyYXU5c3FVTU1X?=
 =?utf-8?B?SEVzUkw1VGN2TXhPTzVLUDZrZDhhT3NCeng1MWs3V01QVWxJNkpBMmE0MDhn?=
 =?utf-8?B?ZDQwZkRqVVpneFVrUzJBdGUwdkhid3JZenNWZEd1aWU5QkY1L1ROOGNLamk2?=
 =?utf-8?B?UHlMd1BhU0NRelhqWTNkcE1HMjVCNlUrd0VGYWZjRVhPanNQbWFYT1NzQk9F?=
 =?utf-8?B?b2lLSDVsekhXcUNoTjhpcDRYY1VmVmtXSWZuU1FrclN4bmtBUkUxQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C73EA3582808547AD21D172BA969E1D@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf1ce05-c6f3-4255-5317-08de99d3c884
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 03:13:21.4240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gW68CHcmyh1ZRXA1/WhVZ28QVQIGXkOEg3WXixjhREfFlGvCXUeoZBVzyKj3ITAB/zBbAPeEEIPAQMsRoCgURQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6088

T24gVHVlLCAyMDI2LTA0LTE0IGF0IDEwOjA0ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiBOb3RlIHRoYXQgd2UgY2Fubm90IHVzZSBzdXBwb3J0c19kaXNwbGF5KCkgdG8gZGV0
ZXJtaW5lIHRoZSBGUlRTDQo+ID4gc2l6ZSBiZWNhdXNlIHRoZXJlIGFyZSBvdGhlciBHUFVzIChl
LmcuIEdBMTAyR0wpIHRoYXQgaGF2ZSBkaXNwbGF5DQo+ID4gZGlzYWJsZWQgKGFuZCBzbyBzdXBw
b3J0c19kaXNwbGF5KCkgcmV0dXJucyBGYWxzZSksIGJ1dCB0aGUgRlJUUw0KPiA+IHdpbmRvdyBz
aXplIHN0aWxsIG5lZWRzIHRvIGJlIDFNQi4NCj4gDQo+IE9yZGVyLXdpc2UgdGhpcyBzaG91bGQg
cHJvYmFibHkgY29tZSBiZWZvcmUgcGF0Y2ggMyAtIEkgd2FzIGEgYml0DQo+IGNvbmZ1c2VkIGFi
b3V0IHRoZSBmYWN0IHRoYXQgd2UgYXJlIGNoZWNraW5nIHRoZSBzaXplIG9mIHRoZSBmcnRzIHJl
Z2lvbg0KPiBzaW5jZSBpdCBpcyBkZWZpbmVkIGFzIGEgY29uc3RhbnQgdW50aWwgdGhpcyBwYXRj
aC4NCg0KSSBwdXQgaXQgaW4gdGhpcyBvcmRlciBiZWNhdXNlIHdlIGRvbid0IHdhbnQgdG8gY2Fs
bCBydW5fZndzZWNfZnJ0cygpIGlmIGZydHMgaXMgZW1wdHkuIA0KT3RoZXJ3aXNlLCBmcnRzIGNv
dWxkIGJlIGVtcHR5IGJlY2F1c2Ugb2YgdGhpcyBwYXRjaCwgYW5kIHdlIHdvdWxkIGNhbGwgcnVu
X2Z3c2VjX2ZydHMoKSBhbnl3YXkuDQoNCj4gPiArDQo+ID4gKyAgICBmbiBmcnRzX3NpemUoJnNl
bGYpIC0+IHU2NCB7DQo+ID4gKyAgICAgICAgdXNpemVfYXNfdTY0KFNaXzFNKQ0KPiA+ICsgICAg
fQ0KPiANCj4gVGhpcyBpbXBsZW1lbnRhdGlvbiBpcyBpZGVudGljYWwgdG8gdGhlIG9uZSBpbiBg
dHUxMDIucnNgLiBBcyBhIHBhdHRlcm4sDQo+IHdoZW4gZGlmZmVyZW50IEhBTHMgdXNlIGRpZmZl
cmVudCBpbXBsZW1lbnRhdGlvbnMsIHdlIGRlZmluZSBpdCBpbnRvIGENCj4gZnVuY3Rpb24gdGhh
dCBib3RoIEhBTHMgY2FuIGNhbGwgaW5zdGVhZCBvZiByZXBlYXRpbmcgdGhlIGNvZGUgKHNlZSBm
b3INCj4gaW5zdGFuY2UgaG93IGByZWFkX3N5c21lbV9mbHVzaF9wYWdlYCBpcyBoYW5kbGVkIGJl
dHdlZW4gZ2ExMDAgYW5kDQo+IGdhMTAyKS4NCj4gDQoNCkkgZmlndXJlZCBzaW5jZSBhbGwgaXQg
ZGlkIGlzIHJldHVybiBhIGNvbnN0YW50LCB0aGF0IGl0IHdvdWxkIGJlIHNpbXBsZXIgdG8ganVz
dCBkbyB0aGF0LCBidXQgSQ0Kd2lsbCBjaGFuZ2UgaXQuDQo=
