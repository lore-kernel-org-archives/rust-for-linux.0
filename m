Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50563085AE
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 20:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750277236; cv=fail; b=esOKRldnhKe90+5Kbcib/zlJYpqYRWfHzH0RS+NLqFrIaAiBSFyBh4Fr0pzoHO/ySbamtgGi49P8LdvlqsIS8WLpjI1qxryF9tNOP2sBv+AJAPIl6+G+7/V4i/GlSfTuzCumBVhyJ9CavWsAGcomIeaqry9fTTPmY247qcb6cHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750277236; c=relaxed/simple;
	bh=n4AhBYUeJmtqv7+OS98Keh+ZGX8gRye7c0klZES9Cu0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=no+Q5UWlmw4WsAC0t8vl9uSb2IQuKUEp2Clj+vA4aQ/1MickW9M8ZeGIckcll1ohqSBqDBaaenIKK636mID+uPF/cDeEXT4nOncygZ1OWrxJJBt91A84ZG/B2iZxeRm1dtkqDY9cZPfwaqb95YaDwOsZ6u6OQyH+2CSfc9ltCYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qnUKHKCY; arc=fail smtp.client-ip=40.107.96.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qnUKHKCY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOFKDPxvYvmucN3aaBkxeyDBc2xZItlf3oERI80O+HiwJ0cEFN0JRq1+V2JkihhTbI3hRLhq2XVUKBCe90scFHsmTtIa3wOXdMDwJPcM3i+jIwulgtArzEnaeojxf1Zre2GTIWxWOABm3B3PdErxyJ9HNlVuWfuK4sDc54hwsz660QHu9zVYBAyetwvtqCCKYaKZ4LnOJ+uNRIzE5l1i6imnli7zykXfCk6CA/r4RJGAR1XhT5Ea9sSn2KTtByNGUfEtlasZ4W/tCbpt5Cl950aGljX+CKVpBNOxlBgWYFUw9OK3xi7qehZ8Y7p1vvhHfG4aERGNPKnIGa4OCT1Vbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4AhBYUeJmtqv7+OS98Keh+ZGX8gRye7c0klZES9Cu0=;
 b=mlPsl8yw+XUXVm2AOsmFFlDkjSV4UPNpJ6DAX/118pn+DKZe3XRX54lJuhilaly57GJtLRA9p/kE4R/Kxu4G1LytLpP1MdbJOejT6w9sC1+RK2pS/W0nXgS+Wo7XfNe9csDmkZ+ujcKO67x+bb0f3bjR8r90dSPnhkkMqrQZqmilLS2gYL8zao9ki6fXb3nEgr17ATLS7f40+eusnmePOd63v51cyxPccBl+pHUtKnC7XUK1umEBn7LrDYapqxxntej+ms96SbhsgaUjY1VMAjaWpaQhcyJ0SWcEP4KFkY3H6NRov6J+IOCcvtZINPqtFIEDgieFpidCzVK2O8+8OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4AhBYUeJmtqv7+OS98Keh+ZGX8gRye7c0klZES9Cu0=;
 b=qnUKHKCYlhe0gzunRfHW8+FsbHv2Ixf5BasJHY+kIQKt8sSfJ6z3Z7DtEvRNrHIK9siSfpMYR87YcYbszvcjo/TPekQYvVyJAZ/rRt0BSKBzEFVO/Q1ynmekPpPvomdYd5s+t0YhLyGIokpEgTiQIM59UDyrehIKjXZKBZFJmmU2dLYx7/HR+69cOuxQUUqXQru6PwgodJdnxk8GsTmbgm9FTjF3BgvWoOkpiqtYv2RcXQksEEVLesGFqVZ5f9Efx+IwYCDsjORQY9HFlgaMexqPRIt/RA1/XugwEm0NMpnLOG2bPmyacpHfqyd02G3PTNcragSOl7JX8LW+iq10kQ==
Received: from DM4PR12MB6542.namprd12.prod.outlook.com (2603:10b6:8:89::8) by
 PH7PR12MB5878.namprd12.prod.outlook.com (2603:10b6:510:1d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 20:07:09 +0000
Received: from DM4PR12MB6542.namprd12.prod.outlook.com
 ([fe80::1b67:141b:3703:a608]) by DM4PR12MB6542.namprd12.prod.outlook.com
 ([fe80::1b67:141b:3703:a608%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 20:07:09 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "lossin@kernel.org" <lossin@kernel.org>, "miguel.ojeda.sandonis@gmail.com"
	<miguel.ojeda.sandonis@gmail.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4] rust: introduce sfile macro for succinct code tracing
Thread-Topic: [PATCH v4] rust: introduce sfile macro for succinct code tracing
Thread-Index: AQHb3vXap/xDjuhkbUS6ehJ2bgZmCrQGRkgAgAMU7wA=
Date: Wed, 18 Jun 2025 20:07:09 +0000
Message-ID: <a3cf49cb7d664ce2c61cdce9a6e0cfe721aa6bb4.camel@nvidia.com>
References: <20250616193433.2643407-1-ttabi@nvidia.com>
	 <CANiq72=cDk5rVEiAoudaQZUhNL_rne1EEjSEfiNuo_gkL3HOZw@mail.gmail.com>
In-Reply-To:
 <CANiq72=cDk5rVEiAoudaQZUhNL_rne1EEjSEfiNuo_gkL3HOZw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6542:EE_|PH7PR12MB5878:EE_
x-ms-office365-filtering-correlation-id: 16c21ae5-0514-4082-32c3-08ddaea3b51b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UW9rU2xqTVFXZGhZa1d3Nkp6bDVCb0NsWk40Tmx2cXdFWVJRSzB3cmFzMUlQ?=
 =?utf-8?B?dUxDNWFDeUx0SE03clZyeHBqVFVwbGNTQUxINEFnckJFVGp0aHc3bU9BUm95?=
 =?utf-8?B?ejd6NEppVi9NZWxucHdLR3BwUk00YVBEOXhIYUNDM2dSb1UzeDVyRHVjQVlD?=
 =?utf-8?B?alQySDF4SElVNjN6V1ZoUzZkMlBmeGE0dDlGV00wRzFnQnN4dmxmdThPVzJF?=
 =?utf-8?B?NFRQTEwwcHNIZDhnUEE2RmNTa2hNclhzazJ2OHlLTmovZFlIN2Q2R21lL3A4?=
 =?utf-8?B?Z09zdnBnTXNML2huRXU0Zkd0L1lQR0VLSmp0QkxoMngwelozWXRPaEswOTlr?=
 =?utf-8?B?RGJvTzFvaVdEZzZkMDlCTittR1Z5WEV3a1B3UW9ySGN5Z09xVUNkUkE0bEJ3?=
 =?utf-8?B?ZjZnYTNaeXVvQjRKa3VMRGVqRGV3dG9wa3ZBOCtWK3FIQm51dnhZR3dZaS8w?=
 =?utf-8?B?azd4Tk5YbU5tbDIvdFNMd1ZQYytZc1BveGFEa2VpM0N6aDNnT3pka2N3ZHh1?=
 =?utf-8?B?Z0FaUGdpM1ozdm4xM0xXRC9EV213am1QK2lOSy9KZjVTK0pCVi9CN3NndjMr?=
 =?utf-8?B?UVpCY3ZKcFEvdGdod2NZZHZsU3M5Nkc2R29aeGdvSWhWT3NTL1ZzMnFsSUpB?=
 =?utf-8?B?NzI2aTJnWmcwd0NtMFc5ZmIyckdLeXEzTHROUmtQRFJBNjRwTkZnNGtiV2Q2?=
 =?utf-8?B?aVJmdUxKTTNnQit4SXVZUGZWVXAvWnJIdm5mYTRBOHNvdU1WOWpLOUdyMlY0?=
 =?utf-8?B?OGFRZTFXMjVFM29JYkdXVG1VZFBBYU5lOVdlMC91bWJqOGd5NEF4MzFvL1VV?=
 =?utf-8?B?WVlra0VBc2wwYlFiTHdhUSt6R2pnUlBrR0lzU3c4S1NPVEJ1bkpWS3A4Tjl4?=
 =?utf-8?B?Q0tBWU5MVlc1RE56ZjNacDBaR0lYR1M2Qy92Snc4Mzl4citvL1p5YVMyZzdw?=
 =?utf-8?B?S1dRWFRvWGpsLy9MSzZzcTZKOCtLVEY2L0JmK1NEOG40cmFJR2ZMaTNHSG0y?=
 =?utf-8?B?UGpsTEVGZERtbnh6a3lhV2owaEUzSjZ4M1dmRXROYXdVRlF1bXo3MEpMNW1n?=
 =?utf-8?B?dlJSMDNUeE9xQmdkU3V5bW5QNjlGcFo0UUlzZHFTaktZUUJFb0w4dU1OSFY0?=
 =?utf-8?B?SXQ2dHFla1cxU0FoNXpWRE9UUzBiSVhLYjhtTHJGY1NCbVlPSEJIYisrUUVz?=
 =?utf-8?B?eDdmMThuTG15Q2hLbGx5ZmtWYU1OOVlsZTVkaHNSTHpFYjZYQWRaSCtuTXdh?=
 =?utf-8?B?MERXcmFPK0tCNjlWRHRDOGJXcnFTSGRNZWdDNmRLOFQ3VlRjWlVTRElKaTk4?=
 =?utf-8?B?ZEo4TGFhQ2lvSFIvem1HSm55dklEeS84YVlrOWlqcFVPdDFLTkVpUzU0OXJm?=
 =?utf-8?B?QU44YWlJdVZaZWNGeGZzSi9vNldFYmVjWXZmNTU1Zm9EellLNEhqbzMvUEE3?=
 =?utf-8?B?Znh5cFB1ZnFtd1cweVF0NXF6d3lGbkdxSldUOEprOXp4RG1nR25FMk9EbDlB?=
 =?utf-8?B?VEVqQTdZZmQ5WHZNWm9TQWRzK09qdWlvSWtOcGcxNWlTV2NWQU5PTWcyVUVs?=
 =?utf-8?B?SWJXb1JENk5RK3REZEVUMjZhZGlQSDJLcUkyQkNKZVAvaE96RlVibTBnVWs4?=
 =?utf-8?B?VklodUpybmFVSWd3bnNIczBKYWNDRnB0WDNPazE2dy9lVFZLOXpyWG1BRzFX?=
 =?utf-8?B?VEpQb2U1SWpzTDhjRWI1d1VMUnNXZ1QzRUYzMWRkdWdSNWZDeW5BNWlsOFhZ?=
 =?utf-8?B?WnNSRS9SUFo1OUtWVDhYUDNORWhaQXAxcFc3aGFIS2RyeDh5Rm1IdTc4OENq?=
 =?utf-8?B?SEhGRCtuZ3FPbzhoT3BKWHNkQWl2K0VTcnJORkRIanhzRm1PM3dmdVliemFn?=
 =?utf-8?B?VkxOcW1zS0RTUnNVQVBoQzF0QXBaM0ZaQU5obmdOZ20yVVR0c2ZGZXpwN1l4?=
 =?utf-8?B?ZFd3bCs3Z3Ixb2J4WldUREJ1TWNKd216NXc3eDZjYkU1VG82RFA5eTR6TU9E?=
 =?utf-8?Q?l2CMfykYxD4PJrhKxfc1PFimXC+HZA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6542.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SktmaWJiWkwyUmpoZ2tRK0U5V05RVVFEZzNSRisyN240a3ovMFRBV2hLaVc1?=
 =?utf-8?B?a2M4enhaU2p2NEtYNE9PVXIzTTFhN0hnOC92dEJSb3l3clZqanRMallPNVZJ?=
 =?utf-8?B?RUdmOHZwTDVOVlBnQXY3N1FRQWpxYU5wMmM3Rk1aN2JWdmNDcGZpYkY2a0hp?=
 =?utf-8?B?Wkg1SWlQbFY0UWc5RHZPYUtYZ0g3aTlJaHVnNkNrOCtTVjdzVnJydndPNlFj?=
 =?utf-8?B?NUZDMGc5RmRTSFZ3T2luUkMyWXVhQUlOcTk1dm1mbEQwSnhlSlgzZldnZW9x?=
 =?utf-8?B?RVNLR2V0SHZVYlNzQjVNWm43OUhkQnV5K2xHOUltL3YvSS8xNlorNWlOVFlm?=
 =?utf-8?B?bmVMY2dvR3lUZGszckd0NG5oNTFySXYyUDF5eElESWVReWE2dFViQmp3OU8z?=
 =?utf-8?B?ZnAyVzBiRFYxdktMWFIwTkNIemFteWhUMDd2cm1JU25wcjllY1h3NkoxWXZu?=
 =?utf-8?B?Q0xXb3BVYzAvdlVDTzBWbGZ1NFI1UVNFcHk1ZWdnK05FYVhxSVJWMTlCTkMy?=
 =?utf-8?B?OTlmMWIzVHlQaSs1NGF4L24ydmdhSnBoSTFNUWNmTjMyVUIxbWt5VDBGYnBo?=
 =?utf-8?B?VzcwOHBiWEZtc1ZtUFZnRjJGWTI0Tk5HUWxod3ROSldWalkrRHNiUVZKMS8r?=
 =?utf-8?B?cXVFWkF2RkhYT0xmTTRWZ2pSaXFLY0dlK0tlSjBMZlQvbGp4YVZtVFBob3d0?=
 =?utf-8?B?ZmZnL1U2RUVLU1BLVE9lWDlCSGs4emExL24rRjEvSGF3Z2dhZ3duOHpWZnFo?=
 =?utf-8?B?MklzaFZUZFNUQzc1OFFnYjdFdW9WN3ZnOUZ2T01LcnNVcGFhSFdmeTV3eDR6?=
 =?utf-8?B?TlBMRlVDVDcycUhDaytjNDZmQXF4bWswRUlFM284dHljbm11Z1JwTGpsd1Mr?=
 =?utf-8?B?NDBhdFpZL0JiZThidlZ5eURua3g3OE83YWxidU16TkkwMFY5Yy9aSm1kT1lo?=
 =?utf-8?B?dlNsUDhzdGN1QkhMRlZublN4dHdIQ1h5U0YzYUV5YzZrK1UwL3Q2WEM5Z2Zp?=
 =?utf-8?B?UU96Vk9vdzArdUtxTEY0TU8wamhQaDFqbGt0eEt1LzdtU3c3ekRQVW00TjVH?=
 =?utf-8?B?YXJZSHRHRGwyaDlhSGZmek1XUWJ6YW5RaDlESzBTZitMaGdJUisrSnRTck1Y?=
 =?utf-8?B?Um81RTdiSjk3SzZMZ0lkaGtLTCs1cWFabGdGVEpUbmI1R3ZJYWlwK3FMeDdG?=
 =?utf-8?B?dmhMVXYyQ2VyWElsUUZZNVp1RFd3dFBJQUZ3eWdYUnJEQXRHSE1uMEl5Q2p2?=
 =?utf-8?B?RTdsNjFBNEs2Y2RsQ3NnbEN3RnBIUnhTSXVUc1hKbHV6WVgxcHlFZktxTzBa?=
 =?utf-8?B?TTI3bjgzaStFUWFycy80eXh0ZnRzZjBhRTVWdEFxZEtBVU9YaisyMSs4N3pt?=
 =?utf-8?B?VHdhKzBGbkxEckRXTmx1ckV4aGloMXQwNmxpWExGSUVSMElRVUxFUDA3aXVi?=
 =?utf-8?B?dS9SWnhOQmVzbjNGbk54bnZJR3RyQUhtQU9SQXNrUnFxcThjNWJET0tQREo1?=
 =?utf-8?B?aThVWW1nc0NLRTFsOVJiOFRIVTcvK3h6Ykg5WXBQMEZwbmI3eG9hN0xCVWpU?=
 =?utf-8?B?czJlWjBOblNvUEtyaUYxUlhMRkZxRzNxNzl4NlpzTE94dHdVeFoxb3NZZExl?=
 =?utf-8?B?SEN3OS9kYU8yb296ZUpOUitDTWFjaUorTjZtMnVtTjAzQ0x6L1RVUTc1eDFI?=
 =?utf-8?B?R25STlVZMDh4R1c2SmgrNDZBTnRRV0tIbUFYalczSThxUlJ2ZFR6cHVTZGYr?=
 =?utf-8?B?U1F0bnV6QUZXb0ZORms0ZWxITmcxUU9mekgxYStxMDN6S1c0UDFNazJYMTEz?=
 =?utf-8?B?OXNid1R6ZDJlUUxCM0puby9ISDJXd2VuSUJRSm5TMkdSS2lWNHY1eW01NHdZ?=
 =?utf-8?B?cStpcmVNclhPUXl0SlZjQlFtUnlTZEVrZ1ppTkdVZWwvWnZtV0M3VmpXOW5r?=
 =?utf-8?B?SXRwWkdYdGwrakxGT05lLzRtWjQwdjZLa3ZKbjM1bU9SSzhkMUtkK0RKLzJF?=
 =?utf-8?B?bWpNdGQ4L1RoajJMbnhldmZUdEhxaWlVL0RNOTNsUXRIYkpyM3lWR3dvZnla?=
 =?utf-8?B?NENmSm05di9seGdoZmVwVm83bmRlVUU2Y3JVM0tVZ3BLd3UzK2lnVVV2MDFV?=
 =?utf-8?Q?QARTpNCf6QUxUj+ucTWF7xFEM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E907A190F173F45B0798A446368681A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c21ae5-0514-4082-32c3-08ddaea3b51b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 20:07:09.7567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibmo4zeccjW8F8v2lCo0Bo2HqDVeBrodu5V0JIXlrJRqaOU6RQybCAyy3/NhkRgA+xUYmoHequ+C6G8dc7MUXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5878

T24gTW9uLCAyMDI1LTA2LTE2IGF0IDIzOjAzICswMjAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6DQo+
IE9uIE1vbiwgSnVuIDE2LCAyMDI1IGF0IDk6MzXigK9QTSBUaW11ciBUYWJpIDx0dGFiaUBudmlk
aWEuY29tPiB3cm90ZToNCj4gPiANCj4gPiArLy8vIHVzZSBrZXJuZWw6OnNmaWxlOw0KPiANCj4g
SSB3b3VsZCBoaWRlIHRoaXMgbGluZSAoYC8vLyAjIHVzZSAuLi5gKSAtLSB3aGVuIGl0IGlzIGp1
c3QgYSBzaW5nbGUNCj4gYHVzZWAgaW1wb3J0aW5nIHRoZSB0aGluZyB0aGF0IHdlIGFyZSBnaXZp
bmcgYW4gZXhhbXBsZSBmb3IsIHRoZW4gaXQNCj4gZG9lcyBub3QgYWRkIG11Y2guDQoNClN1cmUu
DQoNCj4gDQo+ID4gKy8vLyBwcl9lcnIhKCJ7fTp7fVxuIiwgc2ZpbGUhKCksIGxpbmUhKCkpOw0K
PiANCj4gTWF5YmUgYWRkIGEgY29tbWVudCBpbiBhIG5ldywgcHJldmlvdXMgbGluZSBzaG93aW5n
IHdoYXQgb3V0cHV0IHRoaXMNCj4gbGluZSBjb3VsZCBnaXZlLCBlLmcuDQo+IA0KPiDCoMKgwqAg
Ly8vIE91dHB1dDogLi4uDQo+IA0KPiA+ICsvLy8gY29uc3QgU0ZJTEU6ICYnc3RhdGljIHN0ciA9
IHNmaWxlISgpOw0KDQpTdXJlLCBidXQgSSBoYXZlIG5vdCBmb3VuZCBhbnkgb3RoZXIgZXhhbXBs
ZXMgb2YgYSBjb21tZW50IGV4YW1wbGUgc2hvd2luZyB0aGUgb3V0cHV0IG9mIHRoYXQNCmV4YW1w
bGUuDQoNCj4gQW5vdGhlciBjb21tZW50IChhbmQgYW4gZW1wdHkgbGluZSB0byBzZXBhcmF0ZSBi
ZXR3ZWVuIHRoZSBwcmV2aW91cw0KPiBjYXNlKSB0byBtZW50aW9uIHdoYXQgYFNGSUxFYCBjb3Vs
ZCBjb250YWluIHdvdWxkIGJlIG5pY2UgdG9vLg0KPiANCj4gT3IsIHBlcmhhcHMgZXZlbiBiZXR0
ZXIsIHNpbmNlIHRoZXkgYXJlIHJlYWxseSBzZXBhcmF0ZSBleGFtcGxlcyB3aXRoDQo+IGEgY29t
bWVudCBlYWNoLCB5b3UgY291bGQgcHV0IHRoZSBleHBsYW5hdGlvbiBvdXRzaWRlIHRoZSBjb2Rl
Lg0KPiANCj4gQWxzbyBwZXJoYXBzIGNvbnNpZGVyIGlmIHNob3dpbmcgdGhlIGBTRklMRWAgZmly
c3Qgd291bGQgbG9vayBiZXR0ZXIuDQo+IElmIG5vdCwgdGhlbiAiVXNlZnVsIGZvciBzdWNjaW5j
dCBsb2dnaW5nIHB1cnBvc2VzLiIgY291bGQgcGVyaGFwcyBiZQ0KPiBtb3ZlZCBhcyBwYXJ0IG9m
IHRoZSBgcHJfZXJyYCBvbmUgc2luY2UgaXQgd291bGQgYmUgdGhlIGZpcnN0IGFueXdheS4NCj4g
DQo+IEFueXdheSwgaXQgaXMgbm90IGEgYmlnIGRlYWwgZWl0aGVyIHdheS4NCg0KSSB3aWxsIG1h
a2Ugc29tZSBjaGFuZ2VzLCBidXQgYXJlbid0IHdlIGhlYWRpbmcgaW50byBiaWtlc2hlZGRpbmcg
dGVycml0b3J5IG5vdz8NCg0KQW55d2F5LCBJIHRoaW5rIHRoaXMgbG9va3MgZ29vZDoNCg0KLy8v
ICMgRXhhbXBsZXMNCi8vLw0KLy8vICMjIyBFeGFtcGxlIDENCi8vLyBgYGANCi8vLyAjIHVzZSBr
ZXJuZWw6OnNmaWxlOw0KLy8vIHByX2luZm8hKCJ7fTp7fVxuIiwgc2ZpbGUhKCksIGxpbmUhKCkp
Ow0KLy8vIGBgYA0KLy8vIE91dHB1dDoNCi8vLyBgYGANCi8vLyBteWRyaXZlcjogZmlsZW5hbWU6
MjMNCi8vLyBgYGANCi8vLyAjIyMgRXhhbXBsZSAyDQovLy8gYGBgDQovLy8gIyB1c2Uga2VybmVs
OjpzZmlsZTsNCi8vLyBjb25zdCBTRklMRTogJidzdGF0aWMgc3RyID0gc2ZpbGUhKCk7DQovLy8g
cHJfaW5mbyEoIlNGSUxFIGlzIHt9XG4iLCBTRklMRSk7DQovLy8gYGBgDQovLy8gT3V0cHV0Og0K
Ly8vIGBgYA0KLy8vIG15ZHJpdmVyOiBTRklMRSBpcyBmaWxlbmFtZQ0KLy8vIGBgYA0KDQo+ID4g
KyNbbWFjcm9fZXhwb3J0XQ0KPiA+ICttYWNyb19ydWxlcyEgc2ZpbGUgew0KPiA+ICvCoMKgwqAg
KCkgPT4ge3sNCj4gPiArwqDCoMKgwqDCoMKgwqAgY29uc3Qgew0KPiANCj4gQ291bGQgd2UgYXZv
aWQgdGhlIGRvdWJsZSBibG9jaz8NCg0KWWVzLCBmaXhlZC4NCg0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNvbnN0IEZJTEU6ICZzdHIgPSBjb3JlOjpmaWxlISgpOw0KPiANCj4gYDo6Y29y
ZWAsIHNhbWUgYmVsb3cuDQo+IA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIFtgLmFz
X2J5dGVzKClgXSBkb2VzIG5vdCBzdXBwb3J0IG5vbi1BU0NJSSBmaWxlbmFtZXMNCj4gDQo+IEkg
YXBwcmVjaWF0ZSB0aGF0IHlvdSB0cmllZCB0byB1c2UgYW4gaW50cmEtZG9jIGxpbmssIGFuZCBv
bmUNCj4gbG9uZy10ZXJtIHdpc2ggb2YgbWluZSBpcyB0byBoYXZlIHRob3NlIHdvcmsgZXZlbiBp
biBjb21tZW50cyBmb3INCj4gc291cmNlLXZpZXdzIGFuZCBJREVzLCBidXQgY3VycmVudGx5IHdl
IGRvbid0IHVzZSB0aGVtIGluIG5vcm1hbA0KPiBjb21tZW50cyAod2UgZG8gdXNlIHRoZSBjb2Rl
IHNwYW4pLg0KDQpJJ3ZlIHJlbW92ZWQgdGhlIGJyYWNrZXRzLg0KDQo+IEFueXdheSwgaXMgdGhl
IGNvbW1lbnQgcmlnaHQ/IFRoZXJlIGlzIG5vIGBhc19ieXRlcygpYCBjYWxsIGhlcmUgLS0NCj4g
d2hhdCBkb2VzIHN1cHBvcnQgQVNDSUkgb25seSBpcyBvdXIgYHJmaW5kYCwgcmlnaHQ/DQo+IA0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxldCBzdGFydCA9IG1hdGNoIDo6a2VybmVsOjpz
dHI6OnJmaW5kX2NvbnN0KEZJTEUsICcvJykgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgU29tZShzbGFzaCkgPT4gc2xhc2ggKyAxLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgTm9uZSA9PiAwLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGV0IGVuZCA9IG1hdGNoIDo6a2VybmVsOjpz
dHI6OnJmaW5kX2NvbnN0KEZJTEUsICcuJykgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgU29tZShkb3QpID0+IGRvdCwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIE5vbmUgPT4gRklMRS5sZW4oKSwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9
Ow0KPiANCj4gSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGp1c3QgcGFuaWMgaWYgdGhleSBhcmUgbm90
IGZvdW5kLiBNYXliZSBJIGFtIG5vdA0KPiBjcmVhdGl2ZSBlbm91Z2gsIGJ1dCBkbyB5b3UgaGF2
ZSBpbiBtaW5kIGEgdXNlIGNhc2UgZm9yIGVpdGhlcj8NCg0KRm9yIHRoZSBmaXJzdCBvbmUsIHRo
ZXJlIG1pZ2h0IG5vdCBiZSBhIHNsYXNoIGlmIHRoZSBmaWxlIGlzIGluIHRoZSByb290IGRpcmVj
dG9yeS4NCg0KRm9yIHRoZSBzZWNvbmQsIHRoaXMgaXMgZm9yIGZpbGVzIHRoYXQgZG9uJ3QgaGF2
ZSBhIC5ycyAob3IgYW55KSBmaWxlbmFtZSBleHRlbnNpb24uICBUZWNobmljYWxseSwNCnRoYXQg
c2hvdWxkbid0IGhhcHBlbiwgYnV0IHdoeSBwYW5pYyBpZiBpdCBkb2VzPw0KDQo+IFdlIGFscmVh
ZHkgcmVtb3ZlIHNvbWUgY2FzZXMgYW55d2F5IHdpdGggdGhlIGBhc3NlcnQhYCBiZWxvdywgc28g
aXQgaXMNCj4gbm90IHVzYWJsZSBpbiBldmVyeSBjYXNlIGFueXdheS4NCj4gDQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLy8gVGhlIGZvbGxvd2luZyBjb2RlIHRoZSBlcXVpdmFsZW50IG9m
ICZGSUxFW3N0YXJ0Li5zdGFydCtsZW5dLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8v
IGV4Y2VwdCB0aGF0IGl0IGFsbG93cyBmb3IgY29uc3QgY29udGV4dHMuwqAgRm9yIGV4YW1wbGUs
DQo+IA0KPiBUaGlzIHNlZW1zIHN0cmFuZ2VseSB3b3JkZWQ6IG1pc3NpbmcgImlzIiBhbmQgaXQg
cHJvYmFibHkgc2hvdWxkIGJlDQo+ICJleGNlcHQgdGhhdCBpdCBpcyBhbGxvd2VkIGluIGNvbnN0
IGNvbnRleHRzIi4gSSB3b3VsZCByZW1vdmUgdGhlDQo+IGV4YW1wbGUsIHRvby4NCg0KT2suDQoN
Cj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGV0IHB0cjogKmNvbnN0IHU4ID0gdW5z
YWZlIHsgYmFzZV9wdHIuYWRkKHN0YXJ0KSB9Ow0KPiANCj4gQmVubm86IGRvIHlvdSB3YW50IGhl
cmUgKGFuZCBhYm92ZSkgcXVhbGlmaWVkIGNhbGxzIHRvbz8gKEkgd291bGQgbW92ZQ0KPiBldmVy
eXRoaW5nIHRvIGEgYGNvbnN0IGZuYCB0aG91Z2ggLS0gcGxlYXNlIHNlZSBiZWxvdykNCj4gDQo+
IEkgd291bGQganVzdCBjYWxsIGJvdGggcG9pbnRlcnMgYHBgLCBieSB0aGUgd2F5LiBObyBuZWVk
IHRvIGtlZXAgdGhlDQo+IGJhc2Ugb25lIGFyb3VuZC4NCj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLy8gdGhhdCBGSUxFIGlzIEFTQ0lJICh2aWEgaXNfYXNjaWkoKSBhYm92ZSkuDQo+
IA0KPiBgRklMRWAsIGBpc19hc2NpaSgpYA0KPiANCj4gPiArLy8vIFJldHVybnMgdGhlIGluZGV4
IG9mIHRoZSBsYXN0IG9jY3VycmVuY2Ugb2YgYG5lZWRsZWAgaW4gYGhheXN0YWNrYCwgb3IgTm9u
ZS4NCj4gDQo+IFtgTm9uZWBdDQo+IA0KPiA+ICsvLy8gdXNlIGtlcm5lbDo6cHJpbnQ6OnJmaW5k
X2NvbnN0Ow0KPiANCj4gQ29uc2lkZXIgaGlkaW5nIHRoaXMgb25lIHRvby4NCj4gDQo+ID4gKy8v
LyBsZXQgbCA9IHJmaW5kX2NvbnN0KCJ3aGVuIHdpbGwgdGhlbiBiZSBub3c/IiwgJ2wnKTsNCj4g
PiArLy8vIGFzc2VydCEobCA9PSBTb21lKDgpKTsNCj4gDQo+IFBsZWFzZSBhZGQgYW4gZXhhbXBs
ZSBmb3IgdGhlIGBOb25lYCBjYXNlIHRvby4NCg0KV2lsbCBkby4NCg0K
