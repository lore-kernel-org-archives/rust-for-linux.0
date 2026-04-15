Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013034.outbound.protection.outlook.com [40.107.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BE11A01BE
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776272348; cv=fail; b=hhs1CdEJmTmKfb7Fg2iZxAQXJKymQzc+bCgPZX+Ga/ku1c5zbcwZTKpFZwotKjqXkVP5NMxYexwHiySYYkoeuXdCAHiE7Wgie0tpjkwlWV2bbL2eU5Q85FpTXv9Bslyf9ov/i78lElpjH88OEr3AwSlP1T6p7AsM7BzTDXH5Xb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776272348; c=relaxed/simple;
	bh=uxdt70lZAKYtrgnBpgOHztBx7hPWUqOjEiavYDZE/VQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c1dycz+WzthSDgElu4uRAAwu9RBlFj1P2E5/KGpM7weLWWoBBK10jJXWnB513K/6cKoIo3WeMQEt8EUnfWdjL2geyAKSUiFiazI5zsB2p3Cp8ODIUsqHzPaWGWl1qJHHrctxITJmAanUElU3dlqOafmAjYFfUDoIyzvAxO3H5jY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c88UjIUF; arc=fail smtp.client-ip=40.107.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c88UjIUF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puKXLG4bY4BMkyjvkm7i6Wiqejph3oSmuojhtwdKyeKfTfxwcS+Tt6QG31SjZQR+L6J381pvb+xSk6+AiCyO/vGy6kESTTjBgQgTdEsXojdMTYAmeixdCjkPuAOFrf4KJ/pcqTKitZKxapMhfCMmsImz+w93/MiEeE1SIMga3Jx+3F5sySgnoWuFZ6hl9WD9FtJVU6nrsf5j3+yJ8hiFa7WNMxUwYepxdSulQ2qh9Pdhkvc+DtsTS5nIn+aZJU/biaWvTeVzwWpR7npOI2EgcV456yDgkh+voRG9IF8nH/Y6EiK9JU+gNC7xzoFnkU8jCCIO3XwOgdggfK8RrNNa3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxdt70lZAKYtrgnBpgOHztBx7hPWUqOjEiavYDZE/VQ=;
 b=d1oZg7C1St7kwo3abtSXFtKF2A3Z2dVlT1acyMUVS5UbpXChWkOLwaD3vjbxu1uRi4gM9pFrDxGZTdcmyg2dZP6Gz/H1i3Tl5ooEjv1YEJZ4g8Cy7aKRMVOz2lbyDSe9mIfpjPMF4Fl2EshCohJxzFP4gx6VjgakvMZNZ70Pgy2cct9r7B/dokcjvAV+vFf7VqA4MNcAX7tmAXfP2PeaK0UToPrxeFpMefNDN8I5bQI33Y+AkkoAGOUDUE1RiRmdAgC1yTrMo1xwWXodsP+xdlqM1aeYHy8RhjS/nyZquIUZqv4d6UAl0RRVktJrjymDFAjbhmyK1aedg4WbCifvcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxdt70lZAKYtrgnBpgOHztBx7hPWUqOjEiavYDZE/VQ=;
 b=c88UjIUFHQfyCDI5WjBrv+0C+x1FSWd8+ankdYpmkVjmMLZwy9cWMjozC5kIK20MIUuA3ei73pNKg1Q2i4fCf2VqU81rVF/LD1r62GwfaSCJxTmrPf2Q2ZEiFgNKOZfgl4C2FRWRgi/w6p6wntaF60WTuomCgeN3br8wFsY+EIUSrbVpoBD304QIyUGV0UxsImPT9pdpCwsdyCVMLf6ZrhJ8QxWbsKQrM1II4/BNCllvbZN01LafHbJ/7MramhSrbVI6jRUt8EHVcENyZjNcH1da40UkNvW08Tu4InuMY8V5O0AkYSBuffpU+R/FONvsMoi0wdIbl0q+5e4rQwBQnw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.49; Wed, 15 Apr
 2026 16:59:03 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 16:59:03 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>
CC: Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
Thread-Topic: [PATCH v2 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
Thread-Index: AQHczGmWMPGNs6b7D0CtPqCFivuOYbXgJGCAgAACeoCAADIaAIAAAIoA
Date: Wed, 15 Apr 2026 16:59:03 +0000
Message-ID: <ff8f65ce4e0e99864083c129123b2f3ae03113aa.camel@nvidia.com>
References: <20260414235047.439322-1-ttabi@nvidia.com>
	 <20260414235047.439322-5-ttabi@nvidia.com>
	 <DHTRY8R0QQP7.18II4DQCILU5M@garyguo.net>
	 <DHTS5166DEXA.G18MTZS8U52V@nvidia.com>
	 <DHTVYBQYJNUM.2MJBIYWP3BLYN@garyguo.net>
In-Reply-To: <DHTVYBQYJNUM.2MJBIYWP3BLYN@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|PH7PR12MB6809:EE_
x-ms-office365-filtering-correlation-id: e3f38fc9-dd92-4df8-03bb-08de9b104c4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 W3mBa6hiUfn67p/qxX9YbCjXbhCJJJSGPJRfv0INFnHAJnHnWfG3Ps8gpD9k26huGZLbQpvy27akcXhIBieWSM83e1umYjllpUj6AOB/X54C0Km1Zw696rBqglUjYzazftjrvZbRG5kvhH/XcJa73YCJAD96yoMoA6Em0KCdLvsTc2OXKxWaJzn+1qP7eERN/qAX9V6lTthYXgBKXeZekrha54OQVeyhkBdP0ky3ugxwNI+2wpnN58M/Yhc6JAb2zChT8LQPRmw8Fsxp2a8q65CyvFKYS67zJ4amm39gWPDcrlR/TXbwWMURjGEoh4pmlGnrumrW1/FU2oTDw46asCRsDcycGhcVZ47qE002tGKgivcrp3HA2dXY7deE6E9vN8vZk4n4zyaqHs9AWlsPgZU2LrbS0ijj4GxnkkogbVSgRPQUT5gUTTKwS1vWcYwfVv5/bvAYTnb6twXJdURFfnhtaIhJJBYjakgFf5Klv+Swx1evHPRt07JNjc4nIbZL03qeFHj1I40XkadhKDmW7oRxuGWsAOkKeR9UAqBz45X8E22TPvzFXxwj1vDjKRwx5rqCy26o3NxOcg19mPeyPZD8+wcM3/dDoghxEWZyDyMkiF/Yn69kacK27Z6aVla0zx1nuRDzkpnoDn/M/G6VVcFQOsazUmJg8EswtPkZgJ82FPbycxRWUhJybAi3nGgMZjNRh8mks+FRV+p5IetDr91T74YC+ETD96K753lkL0oetOak7RSgHP5yfuQbTFk9n9H/heAJN5SkowlUzlyD/kL/Cvv3DC3+v7nC0Lrna5Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWs4MWZYWFNkamJWcE90Rk0rSWVpSFQxVWpqbWtFTGxtUkR3R0MyU3ZzOFd2?=
 =?utf-8?B?cXJEelE1bFBNUVplZkhTckVkQXlmZUdLb1YzY3ZKV2ZWQW5FT0NsL0V1a3V5?=
 =?utf-8?B?Tm1PKzMwMjF3OWlUSWdiZGtxWnRhd2ZJZXpOWnV2QlIwL0F2bGxSUVdaYk8r?=
 =?utf-8?B?Y2dXL1phMGhtNXVONzNMbit0OFBReFUwdEJIN0dYSU9XZEp0ZnZDVnJuQ2dn?=
 =?utf-8?B?WE1icVdFRWpKRWJIOVNrcElIbUlpb0VKaVlMN0w2UzRuL1MyYVZENGVobnlF?=
 =?utf-8?B?QU5xQlROQWZhbHJYR2RRKzByVnAvdmlnaW85ZDhFSkwwZitYZXFjL1dGMUht?=
 =?utf-8?B?emJmODhNdW5YYmgzSWhHVmJvUXM5TU9hRFBQdlF5OGFMRlNmTzNpekYvNG1I?=
 =?utf-8?B?SWZ4dTFlU1RZRE1rbzdDZ0R0REpDK1pERTFyd0NFdytnRnBwa0phL3RON0pX?=
 =?utf-8?B?RHlEdlZIT29GakxGWjNFQTdZR1dqQVNrakJMRnZ0bXE3QStFNXVCK3Y5aWZr?=
 =?utf-8?B?QXBOWnFMNXZINHEvZjJvcG9rL1ZlWG1UZE81b0xCUWN3U2N6aGg4ZFVXUE1N?=
 =?utf-8?B?RXdhdEtLazFISFo3WXZQbFpZMXh0ZWRZU3k2RjA5UnBkT1V2dm52d0UvUHl5?=
 =?utf-8?B?ZWFzaWZuaXUzdXh0UzNLV3hqRjFwdHRtN3VDSXZZZm4ySngyMnFJa25PSWZB?=
 =?utf-8?B?aTk4K3hpdkxnZStrRjBBVnRieWRJYzFDalFOT2twSy9vUlFvSXBTeHowU1J2?=
 =?utf-8?B?U3lqdjAzUUNTTmpqQ1lqc0pXRWhGRUdCS0VTM3ZLaGNPSHdndkNCcjJVbkkr?=
 =?utf-8?B?ay9rTG1tYUN0ci95aGNZNGUvMkJqRFhOeTZvRGVxTU95Wmo0SCs1bGUxNjNQ?=
 =?utf-8?B?RjN6MDhrdkEyNWxVQ3BoTWVqbFhIWVZ0aWVtd3RSaE9zVFZCdjhxSkc2L29N?=
 =?utf-8?B?MW5uSTNNcnR1UkYzbHZjUEZ0Q2R4akVCeXZZYysrUHV6c2hZSW4ydDNjNnR6?=
 =?utf-8?B?Q2xXY0J6YXFTRUNHSFB3KzlLM1IzRHFjeHVRd1dZMHJoNkJCcjhJUysvSFd5?=
 =?utf-8?B?c1kwQkd3QXNWekpMZVpUREhHM0xtUW1HME9EcUIrZGM1Nk9xYzUwM1hmSnBn?=
 =?utf-8?B?eVdNWXl6eDhRT0VPbytJdFNsdHMyNFhOQ05BN0I3WUh5N2p5aXJZVUZDcXlk?=
 =?utf-8?B?ckM3emo5M1Rab241M0NacHY3eFZZQ1ZER2R5L0xXRmJSTmkzL2lCQlFPMmxM?=
 =?utf-8?B?czllSytPY25hVUdOVGdKTzVPS3NZTG1JdXlteGZnWC9GaGdtUFlmMGVsbXNU?=
 =?utf-8?B?TkoyeWtPeTA0d0E4aE4vNklFYUdOWEU1dFlVbnM0YzZESEFkNVloeGZTV09Q?=
 =?utf-8?B?YWRiV2FSeGt5OEpDbHFXSDlOQkJVNmQrdWZzUStEd2lhOC9ZZkVjTkE2d05U?=
 =?utf-8?B?UEhsbkl4b05XbUNnd1hCS0M0S1ZRR0dLK0pPckZuODN4cUR3ZjM3QlNmY01p?=
 =?utf-8?B?TzlxLzA2QVpRYmpxanhPMUxTYlRqaXdzanZZQ0wzalkrcGFCTk5rN2RMYk11?=
 =?utf-8?B?eHF3elRDREZ0MHdJR2NYenJYbktEL1ZBaDc3OCtxS2tWWXBhSnMvNGRFUXpl?=
 =?utf-8?B?bWpnRU5jcFFBUzlBcE0rOVBBbXBWdkdIMVhFOHpYWEdxb1R0MXRIWW1CVjlS?=
 =?utf-8?B?NXJXdDl5TEJnVUZRdzlZdjVQeFhpdm1XSE5VZXRXb285M0djbERYTHUxNmFD?=
 =?utf-8?B?N091MDRUZUhxZVVyRUU3dkhFT3BuT2QzaHJDSS9jNDlXcmJoQUM5ZE9IendW?=
 =?utf-8?B?enFzbG4wc2ZaSVN2UXdXUEtsM2M3QmFzM2JPWVNyWTBZbjRuYThyZDMyUFBI?=
 =?utf-8?B?aGJ3OTZKQ05LK2NrVko1bGJpdEsvWUVsUkR4OXZMM2ttK0RlQVltbXJ2bFgr?=
 =?utf-8?B?Qzlsc0E3aTNHTnZqeXZuVVNVTUFvU01PbGFSbjVYV0NxYWlPNDNUeU1PaXlv?=
 =?utf-8?B?TFJNWmlTRXBYRHkyay9OY2xydWxIRGV5S1VQNjZEMWV1aU42SlRZTktoUDA0?=
 =?utf-8?B?anljcU5IZ2lBNVdkVHVXZzZhRXk0V0dIQytlMmdjWkxUMjhRaDBaNjdXdTg0?=
 =?utf-8?B?WHFsNzBYRGFaYW9Od2k3aWhMNGJac1dNZlNHN205Mm1jbWU3OFc0TlNyRity?=
 =?utf-8?B?bzBVMFBleDMyRGZMYXVrK29sNmdGWDlIYzBETjNUNmplbGxxQ2ZiSDFmQUo0?=
 =?utf-8?B?eklVR1lGdmRnMEZFUCtnR1U3K2tEcWhNUWRvZDlCU01sTUs4M0ZCZmZMTkdW?=
 =?utf-8?B?SUlYckdaNGM1ZUJYVFRFdUI1akt5bjZNNFhQbVgrQktaNFp0THp1QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D90DFDEBDD64340A45D993EEC65CCDC@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f38fc9-dd92-4df8-03bb-08de9b104c4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 16:59:03.4930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QUXRCPnbGNGO+tkx/hJofo9T9klo7bzlaHxt0r15RPhOGVqHb133QjcisYuKkPZWDGq/dP6RLYvAuBJxo272lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809

T24gV2VkLCAyMDI2LTA0LTE1IGF0IDE3OjU3ICswMTAwLCBHYXJ5IEd1byB3cm90ZToNCj4gT2th
eSwgc28gdGh5ZSBpbXBvcnRhbnQgcGFydCBpcyBmcnRzX3N0YXJ0IHN0aWxsIG1hdHRlcnMuIFBl
cmhhcHMgdGhpcyBzaG91bGQgYmUNCj4gd3JpdHRlbiBkb3duIHNvbWV3aGVyZSwgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlIG9yIGFzIGNvbW1lbnQgdG8gSEFMLg0KDQpJdCdzIGluIHRoZSBjb21taXQg
bWVzc2FnZShzKSBhbHJlYWR5LCBidXQgSSBjYW4gYWRkIGEgY29tbWVudCBpbiB0aGUgY29kZSBh
cyB3ZWxsLg0K
