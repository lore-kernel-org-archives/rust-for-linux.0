Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2058.outbound.protection.outlook.com [40.107.212.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E2226FA5C
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Jun 2025 23:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749078748; cv=fail; b=flis+7WjjtSqeStLtggnCgT8Qvdqaj0sdT57wJBCO1Ys1qx+WSaww1T2KkFFWHdktnVzgV8gyz4w5LEDDRLslYBREMu+6BlAGJX13+72Fj+PNyEb/t+cIBPvauMxJBKSun1Fu47oC/NZQ1LUlpmLQvhmkzJCdk56p3hVJBakEyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749078748; c=relaxed/simple;
	bh=/SY+oOC5VJ6+1wgu2OMVHbBcun6C5rcvcvXdfVVQSdg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TBjVhQoDF23cEon7R+LfIrP9ozU067uBMHLf1s+g+KN7QiPAh1V0sAUPT+E5cEv7ka7ofqNOOs/r1y47NkjAxl2oziuhF92A23QGbto7RMCZ4i62+SW4TcoTVaRNxSXTXELePK7ZlZk45Ax9tXbvC2W15GOonq+cf4U7GBhVUps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WdfJByX9; arc=fail smtp.client-ip=40.107.212.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WdfJByX9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/vtZdHDBwB+TX2NWC78whzvdwlOQcUiF7V75WgnNa+9dimRmM6ygR8KC46fxzfNZ9GSgTrukas5Fq/sJN+7LmbrcuYiKzqTt1yupf4l/x6JIQvtkrdeCz/dOxqqcCYfJgoxlHjzbv1Fa1uk0rx82cdtgpdwAc75AaGp/Iv9J5n+5GjT1qlO2MFKzIuUFSSMhnClO6CC5XLJYlTgSkiWUdHly/J9pNaEVxACROq0EyNMePFlQaT2GQYn12G23VWXmLH8cwt1g3lu09Dfs5tumJHhXgkNPbxXdPIYNU1UyyOT+18Yj2Il4DX6WyaB0HZY6T8kHLeasOtBuWIlPNEG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SY+oOC5VJ6+1wgu2OMVHbBcun6C5rcvcvXdfVVQSdg=;
 b=faqc24KTB3WASWT3gzJvWevm7p01YxSn6ZG2MZPoT7OupfnW4Yrxw3cPfIlBkTJPC74XDPjfhTUl1TMp44qaW32Hs1sCoIo3Ir2fDDiPvzmPggFmVHl14oieaKJkwc/RIKUbmMUZyzPYE1HeAWFvanN7NGdRU/RpljU2Q2HWGEZD41PUCRMw+WgZjDrQple7mU5aqTmB+oHN+o89mQr9SroKlzTYh0gOATBmwRd8DIJ+1OXsVKNhc8B+AMdNUn3i55UUD2NWwRbeLvF5zKljFO4a1ZGgm+2heXqzYvcWTAdRXV5GRmrqScoy2AMZM19SSQt0M7Ww2xmerx2kyrM7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SY+oOC5VJ6+1wgu2OMVHbBcun6C5rcvcvXdfVVQSdg=;
 b=WdfJByX95xGNgeqCm0Ls5dBUILFJriVDi89AtmMdhaoDeP8l+zoUf6qXfIXRvd5DsOrHC5Rql9Qtd4FYsjoocMkZCUvkobZyO9VfK3BPrr4kVw7F8+4y+dZlnhyjYm/7m7l5tJJUoDZXKfdh0XbMrsGgDdpOILsXcw+Rr/c9EPEZi2Kmhp2NW0WVbJf9Vn45AfZq8U9zgaU8j3B8mlDEoeAzmDso3r4vvzz4Cs5hb3fSVgycSRfM3OB6lM/Z5CWy9akeVzLLEelmz4xqvWmQP7UDJEFHi0gxEHBWyXQYfVG6EeXUasYoDDwscsEZKKAHxFLg/m6dkIzK3JkUu1Jk3Q==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH7PR12MB6860.namprd12.prod.outlook.com (2603:10b6:510:1b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 4 Jun
 2025 23:12:22 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 23:12:22 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org"
	<dakr@kernel.org>, "lossin@kernel.org" <lossin@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Topic: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Index:
 AQHb0Mn7MGE1brglZEyKYzrCM8w6zLPqDQoAgAe4WoCAAD5FgIAAAhUAgAACoACAAaJNgA==
Date: Wed, 4 Jun 2025 23:12:22 +0000
Message-ID: <8d78b126676f71a112a538f79b80ce6a6f513ce7.camel@nvidia.com>
References: <20250529184547.1447995-1-ttabi@nvidia.com>
	 <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
	 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
	 <DAD8GTNP7E50.3CEF051DAP051@kernel.org>
	 <5cbe30e8f1219dd67fd4de9a1156adc054db4779.camel@nvidia.com>
	 <CANiq72kEA-hzqkrXxSUk4bp63NFG=TxmQU+9+yiJsoyuQr86Qg@mail.gmail.com>
In-Reply-To:
 <CANiq72kEA-hzqkrXxSUk4bp63NFG=TxmQU+9+yiJsoyuQr86Qg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH7PR12MB6860:EE_
x-ms-office365-filtering-correlation-id: a3a08856-1863-4b1a-2758-08dda3bd4314
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MURWbVhqZVpZUlp5bWl3REFOUWJUMld4WExWMCtXSytJWk9IL0IyMjgzNHdI?=
 =?utf-8?B?WHZHRXYxeFJySTdEaktRZWJQYlhkb05Rc3ZuNUd2cGNpTWlYUU9jbS82K1pJ?=
 =?utf-8?B?Q216NXNwUUsyaHpKV3hELzkrZFdXd3ZSUWkzT0dPeUNNOFV4aWlzN1dHOTJT?=
 =?utf-8?B?SkZ0M2NubnBsNUxRZXkxa3ZBang2TFVDYjl0VlViY2REQUlLQUZaM3lPbDBp?=
 =?utf-8?B?Ly9oUHppQTdBZG9wWXJubzNRT0FOM1ZHTlM4aFRJR0V3b0NyVzdIUVpHWTBr?=
 =?utf-8?B?WjBNTGthcHprSDFRMlpIaTR0amZyYVJNK0hxN3BkaUN4VmxFcktQLzVLTTUv?=
 =?utf-8?B?YVh0VG5NOTQ0Y2ZoTzlBZVorWE1YTEROejJTVVBVRWZJWW9KQ3pLU1o2d3Bn?=
 =?utf-8?B?TU5Kdjd2OEZRalpsR3RJcmhBckhwdUVrUzFvbFhGbFZZRjIxVjRRMFRJQlBQ?=
 =?utf-8?B?NG8zQzlxdm1ZQ0x4TS9kT2pxTExBZmJyWkJZQkFnNlRDUDdqQWtSbno3b2hz?=
 =?utf-8?B?R0FjSjZlWW1WMlpla3RGT2RjUTAzbEIxL1VaT3BVTUpaclZqb2pLRkpaamMr?=
 =?utf-8?B?cjNpK2VRTHdGM0hWUVl1a1Y1Q2dlZmlhRlNqL2d3d0VBUzloNWUvUUpjT3hX?=
 =?utf-8?B?SkVFWksrbzY0TFVNSnc2d00zMzdHYjZCRUFmcTVsOHhTWjgxN2Iway9UUC9Q?=
 =?utf-8?B?MHdiZ0lEdU1vT0JGRSt4Ni9EVS9lVjFCVnB4WUl6WUdpak9qUVBVQURBN05K?=
 =?utf-8?B?VDA0MWtlUzNSd0pHVFVZNDFxb0xjK1g1U29uM0U3bXJBcGROc29PZE9lYlpU?=
 =?utf-8?B?STFTLzhnRFVHTVI4dlZZb08xL1lEVHlJL0JTbk0wN3hITWZPa2lDcjNOdWxi?=
 =?utf-8?B?OWV1WWx3ajZlcm51UFBsVlFjUU1zdlNhU1Jsck5takdMdi9vMTlmS0FCQjNF?=
 =?utf-8?B?aTE0Umh1aVNLdzNnVlZQanpENWNkNDhLY2RZRndCMGFFUUFreXVKRUxvejNQ?=
 =?utf-8?B?blRpblRYS2JFRktqZXZhMkJSbHRzaDVYL3BGRlgyZUM1VmpiMzhyTmlMNnVm?=
 =?utf-8?B?WkFaR3llM0hZdkZqTGhQV0dwWGkvNk4ySG9SbmpZNmpmNHhDbjVNRjFaaHRt?=
 =?utf-8?B?Z2E5cWtZUlU0QmR5Ylp6bmM2YlFOODlabkxBR1lxaW03UUhlVzhqOW9nREY2?=
 =?utf-8?B?cDdxdDhxaGxQdlhhUnBCZlBSa1JRcm1ZVHc5cmRSTVVPNzBubjM2SGhkRTNz?=
 =?utf-8?B?MUhiVlhoVWhRYmZMOFBxOGdNQUJvWkwrV2tIbG1nYkF5R3BtTGY4Y01OYzEv?=
 =?utf-8?B?SzZ5ejA4ZXBCUzVWQytQdXBnT0pPNHpoNHVBYjNVcVNreEJHVWd1ZFNFY1g5?=
 =?utf-8?B?Q3pKNW1CUENrbzFBckNzYXhMMDdLRnZpKzVmclBJMkZQOTVmMGo2aklKam1W?=
 =?utf-8?B?T0lMeVIrcDJ6VlRvNU5qdnIxUnlPRExCOGVQdHlhRHpMc3Q3N2g4cXVQMmQ0?=
 =?utf-8?B?TFMxZFJMMVJSdXVPQWplWmxQN0w2WmdEbWxLME1CbUJMSzUzZFYwRkhhNGhw?=
 =?utf-8?B?MXk4ZWJyN29JTXRkWk9qTzJqVXlUcXdJbHF6WUd6Z0s3Q3RUU3I3SzhMWXpm?=
 =?utf-8?B?aU5XZzVOdk02TEFhM2V4U2dqK0s3N1pXZUY2TnFXaW1WMytjYkwxb1k3Q3lU?=
 =?utf-8?B?ZlowZVdZWm9PSEl1bDZZQW14eVhqeHhPYVM2QXFCOERFUXFScFNBWTE2T3hC?=
 =?utf-8?B?VFdGY3p3bkRCVllqeklxcDhhK0hkV3ZvL1ZCZHoxa3lQOGhDdy85dFpROGdo?=
 =?utf-8?B?bURpMGUrOXZUdTI1RUhpdU8wVTJuQVhlMEIwWFJQTTRsT1YzUXNoTmh0WGlW?=
 =?utf-8?B?UWhRS3RwRkhSWVpjRDV1R3M1RFpJUGlrQzFuMFFnTjNNeVg5V0ljN0tEQmdJ?=
 =?utf-8?B?ek9lZnBZa1dGOTdjM2VrUVFVRW4yOEtTWnlpSVpSUTRwaXFaeDZsdXZoWTdT?=
 =?utf-8?Q?eDBcG8SANXboLFce+Q5CFUv0jtAkRQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UnVoV2hNTzZ1WWYrQWVBaG96VkorRHpiSDhrWmg3MlVRZ2pxVTVWR3c4aHV2?=
 =?utf-8?B?K3ltVVcvMEVDVE9rYVRiaEdFS3BDMDc4T2tMdVk0M2ROMzhVb3Q2SnEvVFMr?=
 =?utf-8?B?dW1KaUhHU0pEUlVORUZKUTlGR2ttcGZWMS8xRGpnMXR5dG9tSGZ5eFJhZG9C?=
 =?utf-8?B?blVJRVZsOUsxVGxzZFFMZS9ja1BuSFhHQmozZmNLNGgwaEkzSVBBblR4OUw1?=
 =?utf-8?B?TkJLd2pMZXRvMUwvMGtoQXh0Y2xmV0JVQnltSC9abU5BSjFlYzFpVnpLYkdt?=
 =?utf-8?B?aW51NnhDMkh2bnZzLy9zMDgrUzNlSWRqTmF6MDFVY1RPcXlpa0RnOE1sOGwz?=
 =?utf-8?B?bU5OTE42MnhtOUpkL0JQbXpKV0R3V1FGa2I1SlJDTFF5cnpvWUtEQ3I0bnRj?=
 =?utf-8?B?aDRUbjJvNFZ6YVhXRTRDdWg4YXl6MlBKQlhaZEhEMEpFUWgxSTdsYTNPaXJ6?=
 =?utf-8?B?NkRqYUNtK1grNkU4OGc5S1FhOC8rdUJHV2ZDZDA5MWFEY0lxTGdXMUU5SXpH?=
 =?utf-8?B?TTNKMFplT2ZIcW5MV29IcEw2cklPRktqcGl1VGdhUFp4UWUxT1REeVpxbVZ0?=
 =?utf-8?B?NVZmenVwTmpaL05wSFo3dktYc1hrMXFCZWF6VjVpUVk3Wk42bnFmdUt4WUxL?=
 =?utf-8?B?Skh0WWNxYks4WUxxS2VxV3B2dVN1MVFZaWhyRS90MlJhNmQ1UU50SGRsMGJU?=
 =?utf-8?B?SkI1ak9mVWVwY01iUjI0VEtYSHV1cHRVUDhBZWNjVW01VTdWTXluOXJDVDVy?=
 =?utf-8?B?NWROVHFLM0FUY1JsTU54bjIxdkc4bEFQejduVFcrK29mRHljenE3VXo0S3Rk?=
 =?utf-8?B?bWJzdnlldndveEtjbmJaMHJxZm5CY0dVMzJXVkFZbUFsY0xhOGJ5TnJOQ1N5?=
 =?utf-8?B?WlNmYmxSQ1dYRHBhSXNBamdxb0xqZHp0YTdsVW9WK2FMeGpjMXRyS0REOHY3?=
 =?utf-8?B?S0UyaU1NWVNPQzhuWGptRm1JanpNekY5RmFBTzQxVXdVUWlPWXY2OHJqazlL?=
 =?utf-8?B?b21ZdDdNNGtMMlVsbk1ZOCtOTk1MRDRaYXliZnAyb2cxd21aTEc3OHFYSjlP?=
 =?utf-8?B?NUg5dnN6dldxMjNxU3Z6YnU5WVJJSy9CVWd1TVUzaURmNFg3VDdlWUcxNkNE?=
 =?utf-8?B?b0hwYm9NVVNlQmIrZ2EvMS9MU0ZTNXRBaTNib3RId0pZT1pXdExHNDMzdVV1?=
 =?utf-8?B?ZW90QStNSlMxWnJFcWFYdGUxcU1Da2d3c3c0blFoYitDTEFkaXg4NWpDSjFy?=
 =?utf-8?B?cjJQMEVCNW9FdGpmV0hOaUl2bzgrd1ZFN1Z4YTU1Z0RGRXRFTnJ5ZmRCSHFy?=
 =?utf-8?B?SmtaNHQxWVJYL1J3eklmdVVIMERFcktuOGk5SXFCdWt3UEl1NHZoTFFNbG1u?=
 =?utf-8?B?WGxvYTlkRzNza0VBaDRlSStBV1M4Vnk2b040cDJ4dk5rYTVUTzY1bnZQeng1?=
 =?utf-8?B?d2ZiVGdIaHU0UU9QaFZaN3hqczhHcWxCdmw0UU5mRTNaZXFOblhZTHNCQ2o5?=
 =?utf-8?B?YmxiUi93MDU5S1FidisydjNCNW5rYTZ3M3ltZHExWlphcFpkL3E4eVBUWGxV?=
 =?utf-8?B?MjdvYTFqa0xCbEg5ZDZnbVRHSFV1V0sydkJKTVBSOHNOa1RZR1FTblY1bnRk?=
 =?utf-8?B?R3lINlI1a0xRamR5VGRUbFpGQTNPbzlZdjdxREdybUcyQjl5NUd4U29nbFda?=
 =?utf-8?B?ME1aQ08rNEVZZkxET1JwSzhleFE1ZGtwVHhmSDZaRWRmemJHWnNTY0dVYklz?=
 =?utf-8?B?c29hcVJCaC9FbnNxU2YvRE1Eb00wOHlFQXVabDVEUGlNc1piL0pLYzVPTzgy?=
 =?utf-8?B?dm9kRG9ZQU5lOEVoL3hIdURsSnNMOG1LbEdjdUdaM28yWVVFaTF4ZE5aYWJs?=
 =?utf-8?B?YXRDaFhFZWJqM1JtZGcxQi9LaGlqSUh5cG1TeWNpM2RBNHYzbVo4SkdnZ1hV?=
 =?utf-8?B?aC96clI4Sis0SXpGS0VYYU9nZFppQ3R3YlVNV1BxN2t3U1d6TnJwVDRvbG9R?=
 =?utf-8?B?Z1U0WUQvNUhSMFoxQmsvVUgyWHl5ZDdlYUtEQVNkaVFLRW5rVlo4MnhlMmdz?=
 =?utf-8?B?dmMwQ0tzL3l3TUQ1b1NaYWtyaFh0Y1B5eTY1SnVHd1NZc05PTU14Yk5tMjRH?=
 =?utf-8?Q?l3xGfXzQ/oopfXfgM5TF3yo8P?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30AE9C983E255E4688D42480BC155E9D@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a08856-1863-4b1a-2758-08dda3bd4314
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 23:12:22.5718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ufWaNM3eK/PGs6y1/5JugdWgXeG6NM4ClR2tHYNAPJbvLwop/L+xIdGzTJUdHX4BCbRjk5htQXK2QkngdrpNZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6860

T24gV2VkLCAyMDI1LTA2LTA0IGF0IDAwOjE1ICswMjAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6DQo+
IE9uIFdlZCwgSnVuIDQsIDIwMjUgYXQgMTI6MDXigK9BTSBUaW11ciBUYWJpIDx0dGFiaUBudmlk
aWEuY29tPiB3cm90ZToNCj4gPiANCj4gPiBCdXQgd29uJ3QgdGhhdCBjYXVzZSB0aGUgZnVuY3Rp
b25zIHRvIGFsd2F5cyBiZSBjb21waWxlZCBhbmQgZXhpc3QgaW4gdGhlIGtlcm5lbCwgZXZlbiBp
Zg0KPiA+IHNmaWxlISgpDQo+ID4gaXMgbmV2ZXIgdXNlZD8NCj4gDQo+IE5vdCBuZWNlc3Nhcmls
eSwgd2h5Pw0KDQpJZiBJIG1vdmUgdGhlIGZ1bmN0aW9uIG91dHNpZGUgb2YgdGhlIG1hY3JvLCBJ
IG5lZWQgdG8gZGVjbGFyZSB0aGUgZnVuY3Rpb24gYXMgInB1YiIuIMKgSWYgSSBkb24ndCBkbw0K
dGhpcywgdGhlbiBvdGhlciBtb2R1bGVzIHRoYXQgdXNlIGtlcm5lbDo6c2ZpbGUgd29uJ3QgY29t
cGlsZS4NCg0KQnV0IGluIGRvaW5nIHNvLCB0aGUgZnVuY3Rpb24gaXMgY29tcGlsZWQgYXMgYSBz
dGFuZC1hbG9uZSBmdW5jdGlvbiwgZXZlbiB0aG91Z2ggdGhlIG1hY3JvIGRvZXNuJ3QNCmFjdHVh
bGx5IHVzZSBpdC4gIFRoZSBjb21waWxlciBhcHBhcmVudGx5IHJlLWlubGluZXMgdGhlIGZ1bmN0
aW9uIGluIHRoZSBtYWNybyBjYWxsLiAgDQoNCkNvbXBhcmUgdGhlIHR3bzoNCg0KV2l0aG91dCBw
dWI6IGh0dHBzOi8vcnVzdC5nb2Rib2x0Lm9yZy96L1Q5WUtzM2Mxcg0KV2l0aCBwdWI6IGh0dHBz
Oi8vcnVzdC5nb2Rib2x0Lm9yZy96L3FFYjN4N3Ziag0KDQpJJ3ZlIG5ldmVyIGFjdHVhbGx5IHNl
ZW4gYSBjb21waWxlciBkbyB0aGlzLCB0byBiZSBob25lc3QsIGJ1dCBpdCBtYWtlcyBhIGxvdCBv
ZiBzZW5zZS4gIElmIHlvdQ0KY29tcGFyZSB0aGUgZXhhbXBsZTo6bWFpbiBmdW5jdGlvbiBvbiBi
b3RoIGxpbmtzLCB0aGV5IGFyZSBpZGVudGljYWwuICBCdXQgdGhlIHZlcnNpb24gd2l0aCAicHVi
Ig0KYWxzbyBoYXMgYSBmdWxsIGltcGxlbWVudGF0aW9uIG9mIHJmaW5kX2NvbnN0KCkgdGhhdCBp
cyBqdXN0IG5vdCB1c2VkLg0KDQo=
