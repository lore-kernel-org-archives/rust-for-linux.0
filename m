Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012047.outbound.protection.outlook.com [40.107.200.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3BA2594BD
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 22:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766098272; cv=fail; b=AgrBhqAYHERVOYiT6luukWNSmYNwiLePALQOYaZTGih8iKKa/amZ1/gIlfq6Km62OGuHme9qNlwErn312GGYiTdtAO7SitNxTGcvpY5ZXevBI+QN6w4D2X1NUs21FQProJ+eYYNtUmZzdI7Jme1q/K8+7Mgd0+YwRX6Fv8iPHaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766098272; c=relaxed/simple;
	bh=eJlerD1gWzcmK9lI6PvPS6SSLXqry5rYtSTBiezH3K4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r1bB3JCNhRQBRQDgZzOrDNPz5rZRCka/9MnQ54MjW7SsYFlwVWh4PeBdgaWs3J4kgdWeQYSqNmckm9MFuK74e+TFA6KSZBd0aQrCFTGdZeQ80g5aTz5Per/VIB6sJpkyOcdX7JjWk/TDbPFKpZJWS7u4UCEbMvt7anzfwH3n3uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HQDiAN9S; arc=fail smtp.client-ip=40.107.200.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HQDiAN9S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B05KKAKFAtWl6nB3gAmdEHFY6Fu4QBdbALUsxw8jz1GndV5YejazMNqqY0PTIpwn1nIcEVADH5XTR1rGEbhnTmzBRmEWn39nZt2H9lW11oqa05fZgGyY8NidfHOaDd3Tfy2ra7Nd6cOq1FAZeFTKnJ4UkALNv8C23lykeDjs9rW9h4IOR1zo4nv2KxLcn4M5+jSu1wXSgSav/vO6WdT3EXC+bAPRPy9S2LfkuC6nxWfCAY9jXujUJIVEC+pSOaV1TDB3/PlIRwonXC15BMlrZ51YoxSjsjuCsQyNs3IbMIDY+hKF2UW8ZHIRvTyjhCqFr/cwfzRXephvB6bJRVmCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJlerD1gWzcmK9lI6PvPS6SSLXqry5rYtSTBiezH3K4=;
 b=HBNTBe3cIQkXlX/2Bj7j1stqwB58stNp7XIgps9whE8gtIESCZ0dKL+pmEWKS8llI2lragGLWJ791i/5liXvyV+Qgqxczs8thFOMW0Rsd7iAsAF8appOMfJAh59iHU2JVmcGRXAl0RDvEireGhzh37uqgA4O4Tynx4lkcOj9hQP+F0fhKNN8c04uX6ZeV/3amwNB1B/+HMToXx5dQdgcg6n3gACnjiWhjR8xvdtVjtR8nXQjDZHAi5GX6lpQuXkLsLPb551QG5XbSUTil/JM9oCCYPRqszyDbrw1nY/fYsX/N1nsAvv3N/aNhZ7EhMN8zFJlDl2beg8k9jayTQqzog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJlerD1gWzcmK9lI6PvPS6SSLXqry5rYtSTBiezH3K4=;
 b=HQDiAN9S+WJpYm142BjyNQY9YxDwWd0lbjSgb12w8ztWkZBjoIYxot3s+VugB/VRZzLV21aQFpNGU9XXwA8YswdF+RNLK5dC7+qKaRsyLLwunflueZ0ZA6imGo5WoUQCGusRFxAX4ipSa7PAtF/G6hIc+3mScv1qoRTrLYz3xv2gZDHgnrrpFWhyb1LGqHICEHklMK0tpdb3lW2NRAynX6mSepOl4XnSq8XLxJo/yNOxomkHApjsG89G1Bb6bg8v6BE59ihYtX0EfnepnQmi80zUiekj6Ys0iaEa3BjFx8LX1OWPHiM3j8gM0MvcqKGx5iyzcCP9pp0OgveizAas5g==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by CY8PR12MB7415.namprd12.prod.outlook.com (2603:10b6:930:5d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 22:51:03 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 22:51:03 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 10/11] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
Thread-Topic: [PATCH v4 10/11] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
Thread-Index: AQHcb86rTdGJ/o51gkOMHpHVYgG0ArUnSmyAgAC3iAA=
Date: Thu, 18 Dec 2025 22:51:03 +0000
Message-ID: <e7b6a0bcbeeb7312b52f0e9c755e6af045d99d29.camel@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
	 <20251218032955.979623-11-ttabi@nvidia.com>
	 <DF1BM2Z71OY4.246P9YGJC6J4N@nvidia.com>
In-Reply-To: <DF1BM2Z71OY4.246P9YGJC6J4N@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|CY8PR12MB7415:EE_
x-ms-office365-filtering-correlation-id: d108fe66-ff7d-442b-f0ad-08de3e87ec27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ci82S2VHNGJCUWtkcXhhWDYxaThWMGhXaGNxTWRHc3dJa2N6T1RwSzdybXZY?=
 =?utf-8?B?UDVEN1UweFpBNDhNS29MODlLS2VQUWx3cWhKdGJLZy9ZNjAzb3hmNDNNL2xl?=
 =?utf-8?B?RXBpV25aMkVkZnE5RTNJZit6MFJ6d1ZXbFBISFh6NS9Hak4zVVJvZ0lLVjVl?=
 =?utf-8?B?WkJWNUpYUldFSkhRUUNLMVNnYWNpcWV6UldaRXFKZncyZk42R2duNC9SWEVr?=
 =?utf-8?B?aHkyQ3JMcnpoSG51NmZub204WG80bFlmY0dVVFZWNTJIcWJWbS94c2pJSE5w?=
 =?utf-8?B?d0tZN0xybFhMQXFha08vcldlaUYyamxhVmVBcEpmUEpSMjUzK2JLc1ZhTEp4?=
 =?utf-8?B?RGJNRVBVcGZmdndRNDdxUm43bDBQMWljUEtXTmNucmh3dGcrSjM3Uytlc1lw?=
 =?utf-8?B?RGgrVzkxSGpZT3FzQndTZmFjMGIrUzRvZzNScUNyVDFINWczNi8zSDRZZURs?=
 =?utf-8?B?QmdmQ3hBOGhPSFZGc1Y1c1NVRHVWY0pMeXMrNUd5aEI2WFIxUjd5d3VZdCtV?=
 =?utf-8?B?ajV5YTIvVnhaeGVQNTlCREdaSnhMV2syMmpJdUhZN0RucU15S3Q4ZUxpMVFE?=
 =?utf-8?B?Njg1OTlYMTUrL2tNMCtzeHpmZzBxQnJjeGZKU1gzR2MyWkxoMXQ4VDZRbFFm?=
 =?utf-8?B?VzVXVDRINUJSY1pyRmRZaUVYdDQ5aWltUHUya3kzM29EbUs2NUFQRTNBRDhT?=
 =?utf-8?B?RGZYa1ljTFZYRmRDY21XUitwdmdtTG1Ba1pwcDdPSEFGTU85d1AzSnNGcVY5?=
 =?utf-8?B?U0FhQkJPaG16aVhZeEh5MEltL2M5ajRkeDVVV1VNYWFicWF1QThBL0VyYlVn?=
 =?utf-8?B?S1BpMWd4NHpDa1g3U0VncmpkbldPalRuK09qUCtMYmV5aldJS0RIdGZzd0x2?=
 =?utf-8?B?Q0VualNzbHR6andTRWZqdE5YcnZsZ1F1ZEV0M01rcXc1K29NQ1hjNXN6bkRJ?=
 =?utf-8?B?Vm83MDdsb1BkZWtWZEZPM2wydldVTFFZdENYcVJibVhQbk43aS9hei9pU21v?=
 =?utf-8?B?Vm1KODBaeDBwWm5TRlQyUVh3SU9nVEoxeXZEc3RJVDBSWkRadG9UTUU1Umtk?=
 =?utf-8?B?SUhrNUwwL0tnNnd3ZTB1NnRuNldHQzFzYWV4Mk1SZjQ5NlFrb3FvRzBaZFk3?=
 =?utf-8?B?NnJqZW5BL0JXSkc4K3VUbzFzeExJa0I1Y0FrSFVHR2dQL2tsOEdWWVE2cU1o?=
 =?utf-8?B?Rk1kbWpQYU12RHlaZHJCTnNIdTFOUklXamxFWGNhTmdhNGViQWNpNk81dGs3?=
 =?utf-8?B?WkRtSStNeEhGUGtScnRnNUcxNXJncFNtZWhkTzNuMTVJM1JZTy9ER2kzL050?=
 =?utf-8?B?ZnNLK25xT3NPQzFJMFh3azV6UGR4YVg2LzgwcGNLcGdnQlNLNzJCSFZxWHY5?=
 =?utf-8?B?ZzdTc1lKMWlDNGJubElwSmgwUWcxT2toRmhmdHRZUFRVLzIzWkc3TGJaaXhP?=
 =?utf-8?B?MzQrbEJjMGNPSFIvWmNzQUZiT2ZiY0o5YXRyQVpEZzNkdHBLZkpaQ1BBSWJh?=
 =?utf-8?B?dklnWkFZdzNaM3d2aVNVdmpUY0ZVWkZQV2d5TGdqR0h6NHV4bzlnN0JGL2NG?=
 =?utf-8?B?d0dqR2xjMHVGYUdGQzljSnZsVnIxV244aHZCZ2dJTVBuajBmZExHY2VNdlIy?=
 =?utf-8?B?QzJpRmZkaWR4K2UxUFJLUUFTZ0F5WjI0RnFVMXcrNFlEM1NjWjlveUpzMVA2?=
 =?utf-8?B?MisvK0hKcEhqT1lZdVltc05tQnBMTHdJbzJENzZPZjM4R203cEMza3Qzb2ps?=
 =?utf-8?B?ampBV0JvUUkxQk4yYmp3NVJjekRON0lRU0FXMk1DYlJWcHNQVWZVRU9OQWtV?=
 =?utf-8?B?cUVDa0xBUENWMTNRamxjengxeCt2RkRQaEZTeU9CbEZmZFFiT2NIVnYvbldJ?=
 =?utf-8?B?TXdDUzhQbk16cXp5TWpTWFhFUW5paTdqWTJSeWVPR1dvdFVZbEk3TjlObEpa?=
 =?utf-8?B?S0c1Vk9VYmlaRmpGZzQxNzFNcCszWndPOWc3NzFZd2YyRjFtNjh3MTJMd25x?=
 =?utf-8?B?RkExWDcvR1BETFVuREtiK2Z4eGl5SXc0ZlUwWEFicEQ5Vk1PQTFmYUV3b09j?=
 =?utf-8?Q?HqbgCj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1BISXJPYlpBZklqcm83WmNUdVRsWWlDU0xQZGplWkxKVCtWN2NkUVJMZGFS?=
 =?utf-8?B?ZG9aa08xc29TVFUwTno4Zmd5cmhEd0tUUEpwUFo3OXFLbmhqd2FqRWtMKzJq?=
 =?utf-8?B?Y2UxR3VtZEFxem15amRMM1A0RW1ldUhDdnhETGRMS0JiQjJxb1lZcWszU2JN?=
 =?utf-8?B?bmdLOVlsWkRPR1lkdTYyVkkzNUFMUGNXWjR1NGlZMXJvRHdmaElJL0hyRFpx?=
 =?utf-8?B?U0wvcExQdFNlWnlrSlpqalB5M0lmZ254eEJ4ZjMwbVJSbGhUQ3UrOXVaWU9O?=
 =?utf-8?B?aGNuQ25YbHlJVTdDL2t6OHVDRkRsNlhSR2pKdWcvS2QwYlRObURaUFRpU3Y0?=
 =?utf-8?B?dHZFdjNZVm1FTDVra3dLVXBuN1dEV2l1NkNLaEdRc1hBUktxMkQxMFlTNkdW?=
 =?utf-8?B?dXZFZVJuVm5pUzF5K1EyaDVQTCtSZlBkR1o5ZDB0YmxsTXpBTk5sVm5wR3dC?=
 =?utf-8?B?OEtwdUlMazlkcW9lMDVQdlZlV3l0cUp4blBjSTJaQ0t6Y21ZTGZiNEovRDJq?=
 =?utf-8?B?NnllcDJ2bzNqN2dEYkZxRGVxNnpHQjkrV1ZMbmFKdU9TKzI4eGRlVlBoblhG?=
 =?utf-8?B?SDZsR2tJSEZzaXdQTGxLU1dMODJ2SjJEd01XeWdxUUEwVGtiYU1seHhrd1VZ?=
 =?utf-8?B?Zm5DMEh3Tjh6UjZlRzFLNEhkVWlTOEYrNXQzU3Bra3Q4NE5mS0Z6Tm9LNDgv?=
 =?utf-8?B?bnFwZkF3djFmdTR1M3hWc292YmgzNHM2ZStsekFua1RUWTMzaHo0NnhjNVNj?=
 =?utf-8?B?MFcydXhsTEcySm9XcGcwc1RxUGdOMEp6Rnhjems2UzBOY090anFiRjFPSzVW?=
 =?utf-8?B?UDNFcEo2dG5ubWRXSGZhZFBVZGFBOU91akpTdnFnMWhNSTQvMTRHNUU0Vmp3?=
 =?utf-8?B?MW1YejU0bExiTlRjZjU2bHh3K0MwaHVwejJZMGltbkhjVThGdjVIL3F1M1Zl?=
 =?utf-8?B?TitnZE8xYjVhbmJzS3lGVVp3SEFkTmRZWklUREFrOW80cDF0dWdPNzB3NDdm?=
 =?utf-8?B?SGdmWVJUeDcxQ0VVTHI2QlhFTmxudWsyOWl4QTNYZWF5a09YOHdHZTQ5NmZi?=
 =?utf-8?B?eEZlcHMrVHo0Umk3ci9NTkRZVkFEWFVHaFFnNDl6WGVTQURMV3YxSnkvdG9C?=
 =?utf-8?B?ZnVyQ2M2aU9FY3Z6U3cvTlVvM1lYdzZVRWxFa0lCUFYrQ0dScFBMOGt0amdx?=
 =?utf-8?B?eDN5YnZTdVZ1NTJJS2gwNS8zd2hiNlNVRmUzdlBLcENlcDM5ZXVaSUpUdmNY?=
 =?utf-8?B?VVlUU1h5SWRGb0pBamxNcmF1QXBheUZnYmZyMDFrb2pEeTFSNUN2OXdVK3Bw?=
 =?utf-8?B?SUpESnFpaVBvVGx2MlJBaFd2UmttMkFrWTRmT3QrYXpLa1h5YTlEeXE0azZU?=
 =?utf-8?B?TjZwNHN3UXB3TVJyYUZEazdQR000R2JZak9WQk5INllUcllMa1hFZVRocmgw?=
 =?utf-8?B?NzkvYmRub3NtR1I1MzlWWDBQUkt0VzJZSTdxUnoyU1pwSktubjBkQ1I3SFp2?=
 =?utf-8?B?Ynp3bi9vYmRqbjdrSnRaWlpxNURMKzBJcks0WGoyWER3elFmSWdpcGZZYzY4?=
 =?utf-8?B?bmpCR3p3bGt3OUpFTGFtd0dPVGE5blF1ZGFoYW1EeVBtUUFNejZZUkRZV092?=
 =?utf-8?B?SUpKZUxvWGFTTFJMQzExMWY2RDJIUDM1TlR1My9YZXNxS0oxQ2R0SnM5WTA3?=
 =?utf-8?B?am9uU1k3bHRzZkNxYzhpdzdCTUxJVHNpazJNNE9rdlFIRzRzSC96aDg5OVZ4?=
 =?utf-8?B?Z1JpK1dJUXQzVjVBZXBDejlBbGZoczZWMk5pdVRYc2hJUTNTaFNiOUIweUlv?=
 =?utf-8?B?bm1ZUnc2VmMzbTgyamdLN2hhb2hHQXlYNWswd05KY05DQldXVTZzdnFiUUpJ?=
 =?utf-8?B?ZEkyeVVEdDY1byswMFVZbTNoYkJQanJPL3ROZkxVMzZVTm8xN0xKYjFMWTVv?=
 =?utf-8?B?Mk9QZ05mc0lyNU9mZnUwZnE1MUE1bUpSd2dVRU5pQVExYytHTVZ5djU4b1Iw?=
 =?utf-8?B?Tk05ejl0SG9WclBTYmhvTm1TN2Rub3VLc2JJT0t6Vk5qd1FGUlg4V3oxZVM3?=
 =?utf-8?B?VytDWDA5QzNLK2N3WFJteGVMYVEwSysyVFMzWTVNQzZ5c0MrelZScFhzS2Rp?=
 =?utf-8?Q?5DRXtTMvvuatxCGjpqfocs/x8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7AB071D6558994EA679CD62B1E84167@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d108fe66-ff7d-442b-f0ad-08de3e87ec27
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 22:51:03.6281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0cv/GsQYxcjALFzOLyIt9j9wSEmJ69ard1Izb2LJdr9vKs6S5nN95T+eLLdb2lfmvR/KdiTQC/wVrBFAxXZggA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7415

T24gVGh1LCAyMDI1LTEyLTE4IGF0IDIwOjU0ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gKy8vLyBPbiBUdXJpbmcgYW5kIEdBMTAwLCB0aGUgZW50cmllcyBpbiB0aGUgYExpYm9z
TWVtb3J5UmVnaW9uSW5pdEFyZ3VtZW50YA0KPiArLy8vIG11c3QgYWxsIGJlIGEgbXVsdGlwbGUg
b2YgR1NQX1BBR0VfU0laRSBpbiBzaXplLCBzbyBhZGQgcGFkZGluZyB0byBmb3JjZSBpdA0KPiAr
Ly8vIHRvIHRoYXQgc2l6ZS4NCj4gKyNbcmVwcihDKV0NCj4gK3B1YihjcmF0ZSkgc3RydWN0IEdz
cEFyZ3VtZW50c0FsaWduZWQgew0KPiArwqDCoMKgIHB1YihjcmF0ZSkgaW5uZXI6IEdzcEFyZ3Vt
ZW50c0NhY2hlZCwNCj4gK8KgwqDCoCBfcGFkZGluZzogW3U4OyBHU1BfUEFHRV9TSVpFIC0gY29y
ZTo6bWVtOjpzaXplX29mOjo8YmluZGluZ3M6OkdTUF9BUkdVTUVOVFNfQ0FDSEVEPigpXSwNCj4g
K30NCg0KU2hvdWxkbid0IEkgYWxzbyByZW1vdmUgdGhlIF9wYWRkaW5nIGZyb20gR3NwQXJndW1l
bnRzQ2FjaGVkOg0KDQpwdWIoY3JhdGUpIHN0cnVjdCBHc3BBcmd1bWVudHNDYWNoZWQoDQogICAg
YmluZGluZ3M6OkdTUF9BUkdVTUVOVFNfQ0FDSEVELA0KICAgIFt1ODsgR1NQX1BBR0VfU0laRSAt
IGNvcmU6Om1lbTo6c2l6ZV9vZjo6PGJpbmRpbmdzOjpHU1BfQVJHVU1FTlRTX0NBQ0hFRD4oKV0s
DQopOw0KDQphbmQgd2l0aCB0aGUgcGFkZGluZyByZW1vdmVkLCBkb2Vzbid0IHRoaXMNCg0KICAg
ICAgICBkbWFfd3JpdGUhKHJtYXJnc1swXS5pbm5lciA9IGZ3OjpHc3BBcmd1bWVudHNDYWNoZWQ6
Om5ldygmY21kcSkpPzsNCg0Kbm93IG9ubHkgY29weSB0aGUgYXJncyBhbmQgbGVhdmUgdGhlIHBh
ZGRpbmcgY29tcGxldGVseSB1bmluaXRpYWxpemVkPyAgVGhhdCdzIG9rYXksIEkgdGhpbmssIEkg
anVzdA0Kd2FudCB0byBtYWtlIHN1cmUgSSdtIG5vdCBtaXNzaW5nIGFueXRoaW5nLg0KDQo=
