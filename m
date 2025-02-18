Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6208234979
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Feb 2025 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739873458; cv=fail; b=NpvFdLHxKXCGoQ3LkxGdrPxrO6cjNVwEv2UupP1pT5GdUZXu8tSaM4inKopR1vEJq9+jTm0kVjCgH0V7eBtxJB1i8jTaAcB3mjkTCJXcqVMGnwx+9Kan1VYmz9riJFTla/daQnrL+jHkpjm2ThZcsdfE79qMLjaMBbOsP4ttJwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739873458; c=relaxed/simple;
	bh=/wH/1d6helzVOgDX7kbeRbLuM5fJHzBufxJnQKkHHGA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QkIrrIOhXF+B4bLKJlszrG0Fvu2yZ7+8XY2PLwJI4vmOP/5o4ShREhgzX7+Ap1z0wLnVfYhjjCqRJ9nvULT/k5TD7TTmK4aEXtcV7sDo5NYIbH9Pndhdxod8tT394g4cEawSbt+PhDlRruGMhnctPoYor/9RzQXh9Df5Ly0JBbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=qb49/Mk3; arc=fail smtp.client-ip=40.107.21.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="qb49/Mk3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTfJm78e6n7YDwQYOvz+0cK6h45zsB10ZXSgYhGaJXNue/W8VXLZFYKZIAsBz7imUiW/sf0BQkeQxEIqkz8Xb0E+d2DAH3xgrvYLvd9FoegeM2N8zAEDUlCnsR521K1z4FByqxeL9GLhoaflf7VdhSWz4PB3uI4NJNgz9oA9kvPjxUI7GWU2B/kNu7a9baKj/4a3HFqORV3Y0YqkJ7+RKqtiOcfb8hLPpnXvH4DEVVCvYqKRxTvBzLbddX8cqS9CF1byohwv8zV6Gu5dvurtgBuNq0eXBwCjvM4HCPTLUzcLINxkk3PdjBSHXpYWESVRh45bKdJg5Y4w38kGudVqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wH/1d6helzVOgDX7kbeRbLuM5fJHzBufxJnQKkHHGA=;
 b=jU1u9W7qwxb6DMvrSOgB4IXfD3w/UpDnCSAj+q2UObs6fFB6RsjnnOEBZPr2cXPkIiJYZVID5vwCMDdSx5TYmdv4sqOoxN/oaAT9r+/tTl9QoSCG6fXBWetR9adZDa7jfFD3DIP4KWB/ke6MDnj+QX0yhwvRtw1fHgbkdVc+SSLMm/wyTYABoAI96w7Y2yZLST+faLsr+q3n+/PToxhQ/QtEvYaFrRWOhzoMHV3xup9gyQkIptE3PEp37Zt3iLkwNfbUZFul88N0sShmbW1RTWpQvSi7YVN8iUqshl6h4Zg7JhPrr76MQQpVnwxROtrJOn2TgrjaEIMwu9pPHopU5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wH/1d6helzVOgDX7kbeRbLuM5fJHzBufxJnQKkHHGA=;
 b=qb49/Mk3MISEwBIsmwNLn12MWplZph2b6GAailxYIfEVYZgMy4cY6O2ZL6E/kSUOdCZeBI0P+2kGfx3o19NjKFJZajV78keOX0HZvw+1xVydeGz+tGC5vG1o7ifdnCeuPMWlCGR0dVxfLqV4B/Ddhh/JuEzunqe2SJvs+HY5dYkOB2hQVlIIrQoP0oaTTx0+l8ygwhr/nwJpP7Twl2om8TZJkUWr0XB0yftASdO0Ju6oDnFEA7jMWHldCq+PTkUvCW6FOoHZ3wgw+kzhU9E6Hy0CIbUABo4Luq2KU0Ml1Batn9FxLkDAfw2aLnOckZIHq2hzhweRt0D0Ab5o/yCFtQ==
Received: from DU2PR10MB7765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:49a::7)
 by PR3PR10MB4110.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.9; Tue, 18 Feb
 2025 10:10:52 +0000
Received: from DU2PR10MB7765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::afc4:e77c:a7b1:f52d]) by DU2PR10MB7765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::afc4:e77c:a7b1:f52d%5]) with mapi id 15.20.8466.009; Tue, 18 Feb 2025
 10:10:51 +0000
From: "Behme Dirk (XC-CP/ESD1)" <Dirk.Behme@de.bosch.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
CC: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"ojeda@kernel.org" <ojeda@kernel.org>
Subject: AW: [PATCH] rust: types: extend `Opaque` documentation
Thread-Topic: [PATCH] rust: types: extend `Opaque` documentation
Thread-Index: AQHbfR9S4XlNwRuVgEmQEb7zJsJqcrNM3l6AgAAB+FA=
Date: Tue, 18 Feb 2025 10:10:51 +0000
Message-ID:
 <DU2PR10MB77657CD6D03CC98459A82784B2FA2@DU2PR10MB7765.EURPRD10.PROD.OUTLOOK.COM>
References: <20250212072509.1765360-1-dirk.behme@de.bosch.com>
 <5D36266D-A5A6-4A68-8CAC-F0C338383E4A@collabora.com>
In-Reply-To: <5D36266D-A5A6-4A68-8CAC-F0C338383E4A@collabora.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR10MB7765:EE_|PR3PR10MB4110:EE_
x-ms-office365-filtering-correlation-id: fe1fc953-dfce-4698-ff3f-08dd50048645
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aHM2eitqSWFpcWNnTG1mU0FVM3VUeS9rOG9ySHJwZXRVeW94disvakJZWm4y?=
 =?utf-8?B?KzJsWTdRaWtKNHJrcU8xNGRWb0xHUnB0NTVkZ0VxL2FGUlhCR1g0SEduVnBo?=
 =?utf-8?B?TDc1dWFIbzNGNzZWSm1YeU1CVVJYQWZqUnVrNU15U1ZSaWlTS1NUeVpVK3l4?=
 =?utf-8?B?Z0lVNTZzSmtadHI5blEybXIvbHJWS1lWVFdWWXNnZ1JFNFdaMDFpMm1pbC9j?=
 =?utf-8?B?cEpoeXpieGhRRFdMVC96dnVBN0NTb1pRaXpuWTdUVWlTUWhnK3lXSHRjUVRJ?=
 =?utf-8?B?SEl6YnpMaTNzZmcrbU8vd1Zwd21WSTdKT1BkMERyNGNJeVl5bVpYZFE5c0pY?=
 =?utf-8?B?Qy8zUEdyOUpCSkZXZllmcXEreXZjR3FwbzA1bXExeDFoYXBRcitUZkFKZFNP?=
 =?utf-8?B?NGMwQlhid3lua0E5bEV1dmFIeE9uQmxiSkRyRi9FUEdCWDRNOTgrakZTMW5D?=
 =?utf-8?B?RDI4WXk3QUZXK0xFOVZHd0c0dTRSek9TaVpDbFpCd1YxUlRaSHlpUkU0U2xB?=
 =?utf-8?B?eG5Cc1kwd3ZtQlFPUUZCUG40aHZxVm1KbENUWDBoeVJHem8xRGhUYWZsRVlw?=
 =?utf-8?B?aXc1NS9FK1FyZEdHU0pFbnFiVkdMckNMMmFTSFBHRU1jOUJSYS9BdGVPR2hY?=
 =?utf-8?B?ZWJGTU1pV3prNnczNnpuMzZteXRsNEZ4dit3RklLTS9PQU5EVXBucUZOYTBj?=
 =?utf-8?B?RHBlV0Y2TWROYXVQbU9CY1cyRkpjN1JYSHZYZ1BSc0pkKytORzZHaFVkbkxm?=
 =?utf-8?B?TXhaVGJUL2xhdk5ndldxU0ZJajhTUzJzNVFkSTFvM2VGSlJ4anpOeFA0cHpr?=
 =?utf-8?B?T0dHU3oyRDhCU2V0UU5EUTN3UndvbkVUS2VaWE5sbm9lUkZBWnY5Z3Z1RUM5?=
 =?utf-8?B?N3BOR3lJK2ZhN0RtT1RKZFdxYmZORjRQbERtc3lZdlYvZFd4TmJIRmdhM2J2?=
 =?utf-8?B?TUlya0R4L1l1cmpSRGt6ZlY4dWZiRzg2V2RLOTJOTjVaYWxwQnYyVXgwUkwz?=
 =?utf-8?B?a2FhR2RDSWhzYVFiSWdwdzkzQ3BZUzhQTUpoNHJKVXVqazF0WXVQTFdQODA4?=
 =?utf-8?B?VlRVMzhQUy9WRUFTQjlPY1dRWjIxYlRvR3gra1haNWJyYWxwUVdZc1FLVWdJ?=
 =?utf-8?B?QlhLSXZUM21rQlZxTFp2ckU2aXZqbGkvUndaT1c4dlZBVFc4bDBBK1laUERD?=
 =?utf-8?B?SXVnNjVsczYzdmNJbTRSYWZxTDN3QWRhbFlyaXNpNDJrTy9aMlVYNDljaEEv?=
 =?utf-8?B?d1hpNG9LYWUrL2J3alppdkptMHpmd092L2VoY1k1aDNvK3cyQ0FYemNDanFU?=
 =?utf-8?B?azZCMVErcTBLRUU3clFRWHVzZzEyQURUUTNhZG5odE9sQ0JFa0ZibnZwRGxK?=
 =?utf-8?B?bDl2MWJwRmNnWHJIK3FPNWc5dXloR2NTdjl5VE5uWU1seHZ0RDVNUklhc1VY?=
 =?utf-8?B?VDkvZHI5dkg5NFoxMmdXVEEweU1rWUV3V1pmcTh6RTB2dHN2TGZQb0ZZbkNI?=
 =?utf-8?B?TU5sdXA4Q3NUMkszWC80eVkwYjRjZFpOQ2lxNnFtNmNqYStndTN3dFRWWEY5?=
 =?utf-8?B?NUhpaGg0QnJGd2EzUjExQ21DTjZaZVZsVVJHUFQ5eUVTSEw5cnc0UU1wd3p1?=
 =?utf-8?B?Y3RVVWt5cXoxT2Zaa3oxOTVjVWpFN0tkWW9lNDNaYU9vTTVhcUVNUTdianNZ?=
 =?utf-8?B?VkR5SGtuRjUvSEk4TkMzS3pzQVE1L2tnNkZjcmIyU1QzNThLY0dvNUNZbnJz?=
 =?utf-8?B?azRVdG5rVFhzTUNMa0V5aHdVZFJ0QTVnYmNEN1ZiQi8vREU2L0xPOERPS0VQ?=
 =?utf-8?B?RVNUTE1vRVZZTWd4TTh0amZyZVM5THgwbWxGQUpZelpIL29RNGJSTjRJb3VF?=
 =?utf-8?B?Vk5UVjQ5aTFpbkc1TE1QcFl1WjkzMnVxbW8yelU0eWtRLzFyeVFXdnp1TnFF?=
 =?utf-8?Q?KOXU5ROEndKi8g8V0YHsJK7uF8rycTHf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR10MB7765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qlptbjl3VElEc3FmbUJNQUtORXV0TVE0OEJ3WlhMTlVpL0o1Z0RkNjBRVW1n?=
 =?utf-8?B?dEh4UFZNeEFQZEhLaVJybDl1dTRqdjhlWDN4Zm1sL2dMbDRsK2lKY3ZHblU5?=
 =?utf-8?B?UU9DLzQ1ZTJjSkcrZ2NFUFdsSHpXZjFqR1BzektoMHhVY0dUdmsyWE4xdHBG?=
 =?utf-8?B?MzlpNWR4U3VlRWtReHZubmJ2YWE0cVZxbytiWDBBUk8xaUNhT0ZiRko4dGN1?=
 =?utf-8?B?VHNENzU1b1ppVHIvZ0M3NERFRVNaSllPNlI2VG00czBMQ2F1elYzYmRscWJD?=
 =?utf-8?B?VHFONVlJTGFPNXlXYjlHNkNndjMzN0dBYkh2RGVULzZRa2draE9yWGZFcU5y?=
 =?utf-8?B?VUFSRm9rSVNwOHE2a29aamtobkZwUUxIMnVWNHRMM2ZhRGp0NEZEOTJmeWlL?=
 =?utf-8?B?YXRZUzlVRFNkR2w0aGhLWmNHMEFXZzFkdFlEVjFjVDB6QTF2ckRNVGdhOGhY?=
 =?utf-8?B?N3ZGMEtjYjk2bGdtc3pZeVRHK2xJREhsQ1pCUDFlZnc1U1VlRjdxcTJqL0g2?=
 =?utf-8?B?amY2ZDdtSWVCWHFYN3Y0ZllQaVlxekZKNFlLdlpKUHI0dVQzbVppdjk3b1BW?=
 =?utf-8?B?b2d1aktxRSsxYUE4SEdLeE11bHovbEVScUZ5TS9FNjNSdnJBc3RaT2FTZmFS?=
 =?utf-8?B?Y3ZjcTBkUjE3Mm9WMkE4dWVHQVRKSEZaZHRlc2FnanRKVzdJazZseUJncVo2?=
 =?utf-8?B?alVWbzl6QnFJM1lYUEh3cEg3N3Eyc3ZyZzBVT0M1OGhabDBGTVRiV1ArR0dm?=
 =?utf-8?B?bmsvN3VJbUVlZ0xvUUFYUjVtaHNvOGtRU2pxSEtxaG5qS2pTS2hWNFJlYUtN?=
 =?utf-8?B?c2FHM3FPNnpMeEhnWXBFNlc0dVFpSlV4YzBxMHdQOWh3am10U2ZvTmo2bUI3?=
 =?utf-8?B?NjdhUllsd3hGYUpwVGhadmQ2S0VZc3o3YlZPNU1jSU1lTFprQVY0ZVYvYmo2?=
 =?utf-8?B?WWRkMEczR1RZb0Y4MFpYQVM5N3IvZlJmVDFJZHM2V0I1WVN3dTAyNERqbFh6?=
 =?utf-8?B?c3IyVVkvVnpiSU9sVHl2dERnd0IyRlpxYjJBeVpZK2ZjRWhnNHFqcmRZWVo3?=
 =?utf-8?B?WGJrbVlaNUQyd3l1NnhaV3Zmb1dCSklDSXVDZHdyRjFSQ0dkWjVKMHJKZjlQ?=
 =?utf-8?B?dHpZWXMzSkIxcmpDc0Z6WlJlTUlmbUNTQ3VQczk0b0V2bGRhQlBsdkR2cUds?=
 =?utf-8?B?TEU1OFoxblJud3Qrb25XU2luMmRQVjJLd1BLbzFQRVVuVm5XU00xTDNQYWRm?=
 =?utf-8?B?VjhlN2UxOThpdGVOUmp6MUFlazFQeEpOY1pENG0yNUxIZkpDMVR5WGlpVjMy?=
 =?utf-8?B?elAzUGhuQ05pOW81L2swUncvRVdTZjhFM2w5eEU4VXl2YndETDFZVTc0VWdt?=
 =?utf-8?B?dXd0OHF4aU5xL2JIclhHNWhaWWV0Um1CM2FBV0Y5aXNQdUkzNStHRHN5UXFO?=
 =?utf-8?B?YzEwMXAvcy9wQmNHMklXcUlJR2sySjYyNUdXZHlUREFRazhIRnVYZEtCc0Ex?=
 =?utf-8?B?R3NOS2YxUDhDSnptSDBVQmRCbHlWSW1DbkFGL29STzNab28rVDhsNEVJaDA4?=
 =?utf-8?B?cU0xOUNWTmpzRE03UEQ4VXpyMlMzdm5QUHZ2WlFuTHVZTW9yeWlTSk53SG9C?=
 =?utf-8?B?QXh5OWtCSEVZSkl5VDExRi91Qm1PRVV0TDl5bWxuUGxsU1ZKeStSaEdINjRm?=
 =?utf-8?B?dWlpeWVYa2dHa0ZjREJKcXFVZWRhenRBTGw2dmxyU05MVFZwS2lnOTZNd014?=
 =?utf-8?B?ckZ6cWlLWkx3Y0VGZlNTLy9OaWQzcjBkdlFRVFp0T0FPS3BmcmhUaVpZckV6?=
 =?utf-8?B?VTBjSEpSMEx6aHcwNUx1WXVtWi92dmUySFh2NHBROHRSQytTSWQ5MGFTVTFI?=
 =?utf-8?B?OTVsN3VzQmN1TTFiMjdmblV1REtiR0s5U0JGQkk4STUyaHF5QkJ4MWxBSFU3?=
 =?utf-8?B?bm5jczUydW5GcU81QkN3aXBtNStFV0tEQlFDaUVrdnhXelc3VkEyMkUrTEhX?=
 =?utf-8?B?bzZqeHV3Ky9VMVY3R2g3ZXQ4cGxRRzQxcFZsUVNOYkZmOG5kMVhPTWNMWG5N?=
 =?utf-8?B?VnNEYndSRkhLYnFBcHJoQk43bUpjYUNLdk55R2lUZURFMjlMSjlyMU9QUmdz?=
 =?utf-8?Q?Eeq8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR10MB7765.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1fc953-dfce-4698-ff3f-08dd50048645
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 10:10:51.8938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rQDAdGqTJR0kCjjSQywpJmeeCV/evFM+Ps9/wisdRFX4IG3gpZ1UtemtIBHU2cxmmaW8HILF6b1ZWw9nyw839g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4110

DQpQbGVhc2Ugd2FpdCBhIGxpdHRsZSwgSSdsbCBzZW5kIGEgdjIgc29vbiAodG9tb3Jyb3c/KS4N
Cg0KLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQ0KVm9uOiBEYW5pZWwgQWxtZWlk
YSA8ZGFuaWVsLmFsbWVpZGFAY29sbGFib3JhLmNvbT4gDQpHZXNlbmRldDogRGllbnN0YWcsIDE4
LiBGZWJydWFyIDIwMjUgMTE6MDMNCkFuOiBCZWhtZSBEaXJrIChYQy1DUC9FU0QxKSA8RGlyay5C
ZWhtZUBkZS5ib3NjaC5jb20+DQpDYzogcnVzdC1mb3ItbGludXhAdmdlci5rZXJuZWwub3JnOyBv
amVkYUBrZXJuZWwub3JnDQpCZXRyZWZmOiBSZTogW1BBVENIXSBydXN0OiB0eXBlczogZXh0ZW5k
IGBPcGFxdWVgIGRvY3VtZW50YXRpb24NCg0KSGkgRGlyaywNCg0KPiBPbiAxMiBGZWIgMjAyNSwg
YXQgMDQ6MjUsIERpcmsgQmVobWUgPERpcmsuQmVobWVAZGUuYm9zY2guY29tPiB3cm90ZToNCj4g
DQo+IEluIHRoZSBkaXNjdXNzaW9uIFsxXSBzb21lIGBPcGFxdWVgIGRvY3VtZW50YXRpb24gdXBk
YXRlcyBoYXZlIGJlZW4gDQo+IHByb3Bvc2VkLiBBZGQgdGhlbS4NCj4gDQo+IFdoaWxlIGF0IGl0
LCBhZGQgc29tZSBpbnRyYSBkb2MgbGlua2FnZSBgWy4uLl1gLg0KPiANCj4gU3VnZ2VzdGVkLWJ5
OiBEYW5pZWwgQWxtZWlkYSA8ZGFuaWVsLmFsbWVpZGFAY29sbGFib3JhLmNvbT4NCg0KRllJLCBJ
IHdhbnQgdG8gZGlzY3VzcyB0aGlzIHBhdGNoLiBJdCBqdXN0IGhhcHBlbnMgdGhhdCBJ4oCZdmUg
YmVlbiBzd2FtcGVkIHRoZXNlIHBhc3QgdHdvIHdlZWtzLg0KDQpHaXZlIG1lIHNvbWUgZXh0cmEg
dGltZSBhbmQgSSB3aWxsIGdldCB0byB0aGlzLg0KDQrigJQgRGFuaWVsIA0KDQo=
