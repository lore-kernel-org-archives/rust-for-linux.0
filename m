Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013062.outbound.protection.outlook.com [40.93.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834592FE575
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Apr 2026 23:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776124117; cv=fail; b=Hhr7+3cERebM0QIwPbxNIPxyvS1UgTsOB0L5H0ln0BBZAh34jRADFnZOOUMDQfXPRYLEArbnKibHZDUTH/a5MnwZnRjtsnGaVPd4QcFk0uK82kYn9vXyPUB4X7g9IL2M7uJ/yjbPkpGMfJNhSpH7cZoZTv24EjJMkMnJWP7nmiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776124117; c=relaxed/simple;
	bh=DjhGJ52wPyscT28nFCA9o3DUBco7aRHtE8Wc7F08ALQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GXBLsP4JnwbR9s7s/sRbXPe55cN88sBOHa1AB1eReTHZSf8DxbFeIYBHcLlNp19qf5ITTQ0E6YLKRxj/N4urmRpFtn7qEPBBnDUrTdrILnhbTc7vPaxeJB/UOAUv22J8978JvPjgTKIwpU/KpKPfParfvpbqsGe+LY2vaT3oSjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NL6HggZ0; arc=fail smtp.client-ip=40.93.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NL6HggZ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5zEKdjWhlNtxTwZqwlficHqYXSBUyuyN3nJEAEV4jw55m1FD7jEurrdS08/BvBZE6229a1sneaWgh7FDXxeyvHOGF54DU0d+1e4YMtc764TwoXS0eADo0re5OIVxYwetG/SbWAR9CCaggR3mlUKb05354YB/vS8Dvl6Bm92ahwjlte6rmKpZydwW0Z62H5T9tBkWD3Zcsld3UaxnKQBJUb41kGKY1vwRA3TdTCkHdh3CEC01ooGtI436R7g9JiStiyrrinWNgSA0BJBcjrCvDgosFjVXUixSvjL4CHphXaEu+XUdLrTAGgg5BSe9U83beI9o6B25JBTXZV+yWb0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjhGJ52wPyscT28nFCA9o3DUBco7aRHtE8Wc7F08ALQ=;
 b=VwDRSC0BuIapy0uQK6yYVjhdRc+C/0DgoK+kR/b40SrlP9qzUq+lj7Y1S2gQxMzKVNTu/4p6W1BgFfKFTbR9Nxub7ZNPbogs0f0x65vd1K31WHN9UH0Y/zo0aaVjoZj+EDg1ERK8rC/b9354mTZiWYte4HqryDeB5/OWhe1EVDIuzXiTWpWSa802j/2hf/7z9u02QMj48t+SB84B13r+8CfOo10uSujTlaKu8MxYIZoNgGtIwDx11qhIjLlO09yCbmTbcT+cyJMDbJ4zho4FovHRrkD+w9j5w9CWSfliO/o13aiM6fp0e6g7YkYtqhjESwNILJVu9mRX8vE05IDprA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjhGJ52wPyscT28nFCA9o3DUBco7aRHtE8Wc7F08ALQ=;
 b=NL6HggZ0oJd52b45C68eAyF1L+RTYKp5U0CdUyYRpAN5Kb7OABulvmwjydc5YbA9FKFJiFAY9KdRkmPNl7BByOpD9uJJVxX0SeHuq06U8AUujeZBLUEx8Ao4ChBeuxhpl2l6ksDws4hjTk43ubYAo5TNrS9VD/A76Onz5Ym4Ds4KIJXRqN7QllQa0OqW0duqwhdXVLE4MXNhZPJPQkpORtHyboLZQI9b5TAJMcrwZADCqe6jjd4orRLv9YMHaJaLJ0ZEFWPuBm3A1CXgoknj1TkfV97o6FERyQxef/Ny9R8ox1P59Wviy3JEhBpoggSx/AdWXkmZi2YSI7GDOf/35Q==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by DS0PR12MB9057.namprd12.prod.outlook.com (2603:10b6:8:c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 23:48:32 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 23:48:32 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/6] gpu: nova-core: only boot FRTS if it actually exists
Thread-Topic: [PATCH 3/6] gpu: nova-core: only boot FRTS if it actually exists
Thread-Index: AQHcySnnvwyzZYVrtUS7y+nCSnycsrXcZxAAgAED+4CAAEKxgA==
Date: Mon, 13 Apr 2026 23:48:32 +0000
Message-ID: <15e06581b295691731145b55ecc337ea2ed8dcba.camel@nvidia.com>
References: <20260410203722.1586938-1-ttabi@nvidia.com>
	 <20260410203722.1586938-4-ttabi@nvidia.com>
	 <DHRQL0KVSETV.2YWE5W5JFGHJE@nvidia.com>
	 <befb74f0523b01622fef9f18691b97481c5875f4.camel@nvidia.com>
In-Reply-To: <befb74f0523b01622fef9f18691b97481c5875f4.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|DS0PR12MB9057:EE_
x-ms-office365-filtering-correlation-id: fe425b5b-6fd3-479d-240f-08de99b72bdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 794Ym0SulRjaY0kDJW96hIyKvGwbOiqlnj9OebkTXpG2bYIOtLIJYWp7uUzZN5jMwK1XtBUrndng+8FjJEWMyygMXMTJ2+YVlUsfsLm5lCc9gG5fHpE1HkOAKqk189PEbWgwuhssCs2xORqJLvV040xB6ls6ImNLHbvGn08WPXfNiXICXZunPwgclWQlCFzFzg+NJLcVUX5Bq7S6tTTm2fJVHajrwNsVzWlJLHCPlVjDrovO2ZbluHCA87RJxQrEHK+JOdwZhoTg4YhS7f8wGC2gCqU/GVZXq2ORXlpQ13MWtPunzfYLx6Z2sxqfsb3f2Q8OjqndIlEClWeWviNGoJPDpsiEChbIkLs5JD+zrrsyWxLqARWudbEaOtUl8FFjb52C4kKoFGcWx8O44q4YYfEfit9sV7lpjE3r2wJ14zTDh+LqjUmgqIwmbiq+Hb6eZ/7S41Q1aZenhfHiOlZ+/uq9EnlJdFDCJJ8nLRSw86tZ48pg5sezb0jQuqPPzISsNAJ4M+e95mSYV7PP271sEcygUIyCo0B3bVRt0viBcwDM/kMw+emiuck9WNQFiE0cqJEWpkCzwjFmFB+xTO/LVSewUGZ7SWumXjuGmdcxI//78s9mLwajzUhS8YtqS5jvtuSOHklsZMWBklgPZbY4Z3hSXaWRkE9NtcaPhT9qImwv3+MRzsDFnmfWTtGQiaUzKCtyzW01/P+39mDaY7P5lc42iSg1qvMH1rF+rxFsTWfOcyCnEgvyvTTFGdHId2QQBlrYhF40zKD0KMzcHvMkOBVEOB+//NT/xHPbPo/seiE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUpSNnNYSVdFSjI4RFNOZEQzMGZNN2ZMdXpiTklyenFaREFwaWtRdVBGWEwz?=
 =?utf-8?B?OFFkQzlwQlNMVGNXZVhzQU96YS9LamttTlVrNzh1cjhQcjFJcUdIQ2NkY0xZ?=
 =?utf-8?B?T2VDN3Y4Qk41VkJZcUlQK1V4TEkzOW4rUGdSS0EzaEdhZWVqVEtGcUdXd2N6?=
 =?utf-8?B?YldpNVAyZmF2cFpRMlBNRWkvSlhFbDNqeGtScG5QMGpWZ0podDZyVCsyMFNr?=
 =?utf-8?B?ZmMzUGJBSzkySkhEaCtrV1FwOHNqMnpuVmhFVXV6RFJpWTBjL2VuN254cUlT?=
 =?utf-8?B?UDdpdDMrT2lVdkRmMmV5Vk0yTUdHTGIxeEFRM1F2VW1ZeHVpdGdXY1BMZk1W?=
 =?utf-8?B?VkJ2TFVJTTRNUWZpQzVaa01oM1R3d1NLNXpaQXVrVllySkx4dEl0OWNjOTdu?=
 =?utf-8?B?K251VkxpUEpOek5YMUdQL1Z5S3RTTXZKcmVSVlFST1l6akN0MXYwMHdzUFh6?=
 =?utf-8?B?RldaWi9Wc2VjWjdIdytiZHB0Y2lWL1UxRDl4QXJuWHZiZk5TUmo1US9UNkhT?=
 =?utf-8?B?aFp4MGp2eHZscU10dzVPeUFzaWxGWE4xUHZEd0d0SXl4UVgxRjJBQXpDN2lZ?=
 =?utf-8?B?dkJHR1EvaWk4dy9oMzQ5MHJGaXJsMVJFdS80NUphM0IyZkxsK0FGR1ZreURZ?=
 =?utf-8?B?ay9mNmw5c0NHMS83ekhMcE1kSm44TDlkZ3hZOTIxWU9ZdXZrTDdLcWlzeHZG?=
 =?utf-8?B?aTR2OGxncVlJd3RBSTB0NnJKc1hlMDRuY3BoNXVNNHNUaUgwRzlzK0pZN1BS?=
 =?utf-8?B?K1ZFRUFsU29ZR3RSMGptT3MxdG5OdkhnbjRwMDRpenJZUEw3bXMxNG9ZVmh6?=
 =?utf-8?B?UmQ3OVQ2ejhiQlNaa05FdWNXVXQvN2NXeGk1KytTc1BnRmJGTDhmR1k0OHNX?=
 =?utf-8?B?VGx0aGhrWHVteGpHUU83L3liT2tJTkQ5dmJTOGxjUGxhT2YvMXZ5ejZkTEd6?=
 =?utf-8?B?SGdoSlJJS3NnOXluNTY1b2pkTktwbGp4OXg2dWdGYXRmbU1IMFBoU1pScmVi?=
 =?utf-8?B?dTJCKzRLRisxVzhnb2U4TFN1WlhNNlM2WTV0dU9LSEpVajIxYmM1SitsVUF2?=
 =?utf-8?B?NnN0MTZ5Q1hCa3BGNm5qRUdrZkZyTzNxK294MFZLQU5mckMxbkcwYkxCRjVE?=
 =?utf-8?B?R2Q5ZThpczhHL0QrSnpEZDdzY0FYUFk5WUJOLzNTUHdVWGJieTZpUTB6b1Zu?=
 =?utf-8?B?SjNRa2UwQjdTalo3N2YwTitKakcrZ2crL2lBNzRMM2pEbGxSRUdmbTd4Q3Nz?=
 =?utf-8?B?bEJ0OURtakY2QTk3Slp4SnRZcTVxZnNJazcxMGhTMXpDZXd3M2wrWU1XQ1ZW?=
 =?utf-8?B?eFVZamhhYTk2Y3ZXRnhQS1dQZytLZXMwQTMzaWVGTUNkUnU2SEM4ekwwcUdN?=
 =?utf-8?B?UXl6MUxXV3I5T25aK3lMaTJUU2ZDMlJvZTkzckpRVUM2OW5IWUdJUlhTeVBs?=
 =?utf-8?B?WlV6eEpDeHVEcURJenVwVTRXaTNNUGV1WGt1TGlVUmRVNXplYTFPSWtkbXBZ?=
 =?utf-8?B?V2UwSlIwSTlpODhBWkUxNDllKzVmNmlrRno2Rm5GZldFa1pnWlNjeXpOQWpl?=
 =?utf-8?B?QVBnWC9kMWI3RTB2dGtjeDRxWjdOK0ZJMUNkamxlMTB2MWoweloxeEM0ZzAw?=
 =?utf-8?B?WVhuaGlLT0xKeGdHbi9jSHlabm9kWHhzUkFpd2wxbXczUmt0Z01uQ1RrOWFQ?=
 =?utf-8?B?dDJPeG1HRFpmZUVGdkVLTDZ4Wmh5a21aMGxPbnUwaHlWdS9lYnlvSlQ0ODBp?=
 =?utf-8?B?VFdpUU1kSVpXTjA2UVV3WTY1MjcxVVdla2dNdVdxSG9qVjYzNkVrZkZyUGJs?=
 =?utf-8?B?NmUrUGo1OWd4UlErenZsSDVKVXpGWU5aYzBpekgvSkI4WFc3U3JUczZsR0Rl?=
 =?utf-8?B?M2xVQVVCTGIwR3NHdUZFTGdFOGtEN09POVdObThPS3psQ0wya1FOaklQN05s?=
 =?utf-8?B?eFlRVlpmeU0xaUVlV0VyVTBVbHVNUSt6WW9pYjhnWk5WQ2xPVDE2ditoZFNi?=
 =?utf-8?B?RzA2VGR0OENJZ1EvaWg2THRacG1vN2RzT1dmVDAveTJGb0llNHpCbURPZTRa?=
 =?utf-8?B?MmhsZHI0UW1PTlRJWStNN3AxK2hlT2tZSGFEZG51U2VjWDVONzZrblhOSGVF?=
 =?utf-8?B?U0VwWFd4SmhVenhKdGhNOEtId2N3dEhtZ1NNSGhKcUd1b015cGd3cG8zWWNU?=
 =?utf-8?B?VEk2VjZLY2xpRnh5dXhJMlpSRS8wNC9lMnQ2dXVNWUdLVHMxK3JHcStrWmxj?=
 =?utf-8?B?Tk1DSlJyS3I3eUZ0R052MXVLaXhvQmZnZkc2Zk9peHo5aGQ4ZkdTbVM1clQ0?=
 =?utf-8?B?bnk0Z3RNQWJ5cTRNVnpnNDlaTkc4a2JaSU9KRDlrWEZCSnZTZ282dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6127486C0491534798BCE998B9D41810@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fe425b5b-6fd3-479d-240f-08de99b72bdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 23:48:32.7060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZHIabNTVBUQJk5lhJLGbV4J5ew+I9/SHrbZepd2NIDf/OP2GON+tyF4a4U0Dzl3dBOQ7YPfqhZWOthSWb7OTGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9057

T24gTW9uLCAyMDI2LTA0LTEzIGF0IDE5OjQ5ICswMDAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiA+
IElmIEZSVFMgaXMgb3B0aW9uYWwsIFdEWVQgYWJvdXQgbWFraW5nIGZiX2xheW91dC5mcnRzIGFu
IE9wdGlvbjxGYlJhbmdlPg0KPiA+IGFuZCBoYXZpbmcgdGhlIGZydHNfc2l6ZSBoYWwgbWV0aG9k
IHJldHVybiBPcHRpb248Tm9uWmVyb1VzaXplPiBmb3INCj4gPiBleGFtcGxlPyBJIHRoaW5rIGl0
IHdpbGwgbWFrZSBpdCBjbGVhcmVyIGluIG90aGVyIGxvY2F0aW9ucyB0aGF0IHVzZQ0KPiA+IEZS
VFMgdGhhdCBpdCBwb3NzaWJseSBtaWdodCBub3QgZXhpc3QuDQo+IA0KPiBZZWFoLCBJIGxpa2Ug
dGhhdC4NCg0KQWN0dWFsbHksIHVzaW5nIE9wdGlvbjxGYlJhbmdlPiB3b24ndCB3b3JrLiAgVGhl
IHByb2JsZW0gaXMgdGhhdCBldmVuIGlmIGZydHNTaXplIGlzIDAsIGZydHNTdGFydA0KKGFrYSBm
cnRzT2Zmc2V0KSBtdXN0IHN0aWxsIGJlIGEgbm9uLXplcm8gbnVtYmVyLCB3aGljaCBtZWFucyB3
ZSBzdGlsbCBuZWVkIHRvIGtlZXAgdGhlIEZiUmFuZ2UsIGJ1dA0KaXQgd291bGQgbmVlZCB0byBi
ZSBGYlJhbmdlPGZydHNTdGFydC4uZnJ0c1N0YXJ0Pi4NCg0KU28gSSBjYW4gdXBkYXRlIHRoZSBI
QUwsIGJ1dCBub3QgdGhlIEZiUmFuZ2UgY29kZS4NCg0K
