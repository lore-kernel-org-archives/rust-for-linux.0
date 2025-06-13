Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81962EAD15
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Jun 2025 19:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749842099; cv=fail; b=U1fZAZ1I009/q35OAzFLVV1Ye4jA1E8xFEFwvQTW8fMoVDAKkcQNzGbOgqgQ2nPBDpLL64pV3HUJHcHcns6c7ucUoBNbFI6KDIc3Qsirl1qeUFF1TuU7P4D6CK9P5h9Z1Av1sDLt0mYhBKQx/6BnLwqpQQHCOz99dbB15c8wcHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749842099; c=relaxed/simple;
	bh=d9OhWwcFN3Vfbbli9gRaLXK7p6qwZnTMJ01xlj3kBA0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fv4u9kQ7D5HK/LK0S8h+odT8PM+7Hm+IBE7IfyfigSNi14IgWpOtM/YzqTKY631RImk+dkJ9ZbX52nTxe5gtzthe2GBAwi4bG0m9RIEsJWWprDTbImv4gaujSDI4JnZuWTzF+JrBccDAJSYzhfQE84egCOxbiJSp2NaLZz+aABw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gh3f9VJu; arc=fail smtp.client-ip=40.107.237.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gh3f9VJu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGWDQpNHDMUAA8WMbxddO+njzTdagvPDSSI9v+yjtl6uJzSlRfegsJ2bTCsgJc1iXeZqTjYi9p5peKGF6VH9fB9Kbv+dd7ZuI/U1kraQJzs1sgEZ65ojafkHr4o2YtmpIV9+ioQhOWUh28DdZSEzJD6Kh6/kfV+NDioydATOIXPNPtNbJJ6GW0HPWnOGI3z1sdZR4dS3zpFNufwaq8j13bPO2peJzM7Rf6abv5FyNV6lbroPYqXF+6/dlBENBn9fvEREWmqpxEGfP4IcRtKmgyET2GUR2+r/uJ+Uqqh6SPKRLQWzDPkTH1yc0NB2jey1AGAofqQMAN6EnUXYV4w15g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9OhWwcFN3Vfbbli9gRaLXK7p6qwZnTMJ01xlj3kBA0=;
 b=WlTU0ZqP+3KRgjKiNR6bl21MzkWSXT+onSQ6Z3ra3H92sLGuWDe3I6TaAKpBMHCxTgYA1ZMmOCHt0vm+jLy+l6iD/xRmntPPTNS98qjZ25pb39/mj1O8hO7SOPNuyHrj5vPGJuC9ogAlOnkD56rJbEVoiVOEXZYF79Xa9IWW7u2PtDc4XouJRcBN8mdVmyB45ZtnOw4Sv3GYq4o59bV6QtJK0gXqKPnI3mosBDQxaxzPMF77VdiUH2tdfusKK+cKC/bBMIh1ujd516P8FA6TQVFA05kIDSDXMSzuUYcfCfEF3tmPoKJFO9TCctKsk9k9n8gX3fX3x0HKqwDrhUj5MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9OhWwcFN3Vfbbli9gRaLXK7p6qwZnTMJ01xlj3kBA0=;
 b=Gh3f9VJuCEl0oPzGEpcNTZI+NZAOYzOAIXjnqmNO+cOHUYuIs88ZPxuVeTeU84wRXsA96DIcj6a6qft5vYijbAWpnntDcmD/Qf8ssBcIdFAyMsQqCmRHkiolnOnXaxaXOJ1Kk2ro2Xx1/9bmY9RwfigrNXQ1IPSFxfBKdZJhW1KxZk1Z/uq1ISUzra5fPuuxQS0T4hBZ7Zi4WLrIaLBcP4froZyo2SJtXHvGuKAkLUr218Hd4n6qu8mvcNVXYhnh9wj7JCmh2+8DwnkZymGBxxKKgjWM/rYJbB4B1zXb4Q5Deky4F8iiBEaVBn0eYHHRue9PJFvUZsNkx32LQ07Fkw==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CH3PR12MB9454.namprd12.prod.outlook.com (2603:10b6:610:1c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 19:14:53 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 19:14:53 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "lossin@kernel.org" <lossin@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Topic: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Index: AQHb2Y76GidriUYRM02FngySpVCBwLP8FOaAgAVCIICAAA8NgIAAFa8A
Date: Fri, 13 Jun 2025 19:14:53 +0000
Message-ID: <ed233989116edf9c285e1e4b20a1756c98d509cd.camel@nvidia.com>
References: <20250609223606.2897030-1-ttabi@nvidia.com>
	 <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
	 <68b469afff19b8612cd1d8502166a9c868fa8ea8.camel@nvidia.com>
	 <CANiq72m6VxkB1GNL=t_Tq+bXSjXYeZjagP_FK5AfLWynvdd67w@mail.gmail.com>
In-Reply-To:
 <CANiq72m6VxkB1GNL=t_Tq+bXSjXYeZjagP_FK5AfLWynvdd67w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CH3PR12MB9454:EE_
x-ms-office365-filtering-correlation-id: 6d771ad5-c3f9-4370-772c-08ddaaae93d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z1lFNStMVE1XYkIxc3F6d1JXemVJRkZCQXh3emFHWVdpR2NCSTNVVjlMQ2g5?=
 =?utf-8?B?aFNqQjVYNEJPeFhmRnhZVXVlcTRvRDZsRE5TTXVlQUlOdXNzTXhHVVM4Tzdx?=
 =?utf-8?B?SlFoZ3JxWTV2M2JLQm85YmsrRDltbDB6ak12UnFEOXFYeGJERmNBUEdydEI3?=
 =?utf-8?B?dXNoUVNrUmcyNWRabjc5TllxODBOaVVQbWpoU09mWWdsQXM0eXVhNTllM0Jj?=
 =?utf-8?B?OWJJdFJaQW9Rb05zRlpoakdiVnFPSmVSVjNxMHNKVjVvR2hZcG1RYUFjTlJ0?=
 =?utf-8?B?bzRPOFRuOGtHUXVabmRqT1hnb3JXWU04b0szSGtKQ2RHRys2eU1samM5c3Mw?=
 =?utf-8?B?eTZUUDB6cUVGbXZISlA3RFQ1cUxVWG44RTBsZ2ZMcFJuMXhtbEtjYVpMWkht?=
 =?utf-8?B?WUpxWTFScXhiNnB0WGJzaDcyai9xbUo0bXUvbkJjTWtYV3dQRUllemJmSWxm?=
 =?utf-8?B?K01wcDY4OTR6Y2FQYnZ5R3ZqQ3Bud0had3d2dmNDdDhQbHBNR1ppWEo3UEpL?=
 =?utf-8?B?K2pUQW5xd0NSaDNwcWlWQXFKSnlSWXN6c2VubkRXOXpiWWdBaEt5Z015bTJ4?=
 =?utf-8?B?dUZhZzhFc0lsNUE1ZTIwVVdFYkVWTWxESitUd01iWHFVaFpWeFBWSWd4VUtB?=
 =?utf-8?B?WlZIV2ViQWpidEIvMWJHNkZMd25pcUhsRVZ6bmhHa1M3Yit0d2JjcERxdDlm?=
 =?utf-8?B?ODhpUjZZWVROMm5HcHB1clBpMld0dWI0c0xYc0E3K1VTd3o3T3RWOThZMEhU?=
 =?utf-8?B?eVFpczZXak93MWd6cmZVc1VOZ2xkS2IxaE16KzFxaDhIZzd4Y2pNNjgySktH?=
 =?utf-8?B?c0JFVlFJZ0xETFU4R1g0b1FPOUhHancxQ3ZqcjNPL243QWthZFZscHhPallF?=
 =?utf-8?B?ZWFlWkQ5TXlGczYvYnNYak83cXVVc0hHeDFrS2RBaFJ2SDBaejc2OW9WY1li?=
 =?utf-8?B?ejNzeXI4ekoycHA5R0tadTdOQWxzbUlMcmswQjlaTlJGSkZZYzdQU1lpUWlK?=
 =?utf-8?B?c3JlNW5TR0tZR1V6Vk1yNnVhWTlDWEg1SFY2UDBOWWFPZThISzBrdXlrLzVT?=
 =?utf-8?B?VXVBOFRPdkNQQnF5RVA2WENpN0dtTk5yK2JQaVk3bTlFOW9LbGVCdlg5WStw?=
 =?utf-8?B?MHRyQlhKdTFtQkJEeEQzZWpRY3FqajF4ZjBVMXVsN3p2alIvTFB6bTdVT0tK?=
 =?utf-8?B?ZG1OaDYwd2VPQVRBSjNoK0xrNlRabUlUY3dkQjAraWphTk9sRXFvY1RlOUR1?=
 =?utf-8?B?TmJxVnEzWUE4c21sZEs3MHJ6MWtEdVEvV3FpRnI1RGx0T0VIZ0JDY2w2dGJI?=
 =?utf-8?B?bTdoTkF2bWYzejBiZ1l3V0RsTU5URnh4a2NPc2VOdERUVEZjT0VDQ0hLS2JH?=
 =?utf-8?B?YlloV2ExSkpIb2RzMTl3NVNxUWVGMFRaUU9Xb3BNU2NMMm1KZUZWTXRjQ2hm?=
 =?utf-8?B?RlptOXhBT0lGYXVkNkI1eklYeU45WVRiUUF6ZHFLenIxNjZVTFM2bFJzNUtK?=
 =?utf-8?B?MmEwcUdxYURHZUFFSVVvbGVIMEJaUU5LbTQ3YzNoTGJ5eU54R0JiclJJOHZK?=
 =?utf-8?B?WHlYb29IYWtOb3VML0VuWFhwUFp1RHpyZXZiMnNsQkRERU1UMEFaV0xVdVpq?=
 =?utf-8?B?RGJpUVVrQ1RmbXA0L2I2czZkd0R4UWttY3VTcWFIaysvL2twZjd4TFlVTENB?=
 =?utf-8?B?Y2tjSU1NTGs3cDdjZ2xpcU9FK1JjbURrNlUxVCt6NzZPaVFIUVlSSGdsL3VB?=
 =?utf-8?B?NDZqKzByTWxxZnJLMTNEVUo0dmJYL1hKUTNkZEtmSVlvdFFGQWtQNHJ0cnZK?=
 =?utf-8?B?OE9Ec3psUnB3YlFKMVR0cUFqbTEwdGZZTU5nMnRZM0ZsMUpOVW9ZSzdJbUM3?=
 =?utf-8?B?Z29za0syUkJWRTREQjI0azRUY21sRk9pcDRDNmN6SWZZNlBwWXgyenkySmU0?=
 =?utf-8?B?OVRPOHd3NFNISFdtT3NkbmdleVBTMDFJUTg5Y0drdWgzL0d5WmdUazJMYm9I?=
 =?utf-8?B?Rko0SlVmeWR3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXlnbEplUGZmekxDRENyN2xJMVoveHF6SVJKNnorR1I2bzZxQ1RybG1SOSt6?=
 =?utf-8?B?bU1kQ2UrUlN0Nk81OW8zaFpSTTk5Qm1iK3JSbkFqMEZjSm9jZlNxSmwwMXUx?=
 =?utf-8?B?WGkvZUhOSDI0Zm1XZExibmN4djBEYTZuNXk4eEtGTlV0d3BCakI5bzJWcU5K?=
 =?utf-8?B?UmpYS0FMWjhxOTZCdWU1RktjS1I0QVBwc1FCN2FMMWVUUFZnZEs4WVFKN1Ru?=
 =?utf-8?B?WTJIdFN2U3RtWThUZHFpdVBoaEVxTng5V1hwbGVJSUFvYjlTempsM29UYWd1?=
 =?utf-8?B?RGMvdGwzRzBqcy9ZeThubXFXQzk1cEd4VlAzSHRFcWJnLzFkblo2K3phRVh0?=
 =?utf-8?B?RWZhRDdiME9WN0l3d0l2Z1ZJbUx0TGRoWjdZRWJPMkM1cjZ4dGk1ckpDUk1j?=
 =?utf-8?B?QmY3YTMweTNLdFdGMHFCaWk3dVRNMTJQNFAxbEVQZWdxUVpQTy9UbEtEVy9n?=
 =?utf-8?B?K3RiNXFVblZLWVhmOGtyUm9SWHJGeXVReU83WTI5cmRsL3crR004ZkEzV0pK?=
 =?utf-8?B?SURhYUE2d3RiYWx0blVDazdTQ3c4ZmlOeWZCUkJiT05rbTRaSWZQZkdBelBZ?=
 =?utf-8?B?MHc3NFpHalBTRXFTMTRQVy9NYkVRc21ZNlhKRSswYTJUZGthNzE0czNkYjY0?=
 =?utf-8?B?KzlEVSsvL2Y3WGFXUlBiTkhaRnFaa09Zc3pjWkxTNVR5cVdvSFNyVWpqbnl0?=
 =?utf-8?B?cDZLYmQ2Q0t4eFF3OSs2UlZjdXp3ZG9CTDU2elh3K0VVdjRXTkZNV2VuMkdG?=
 =?utf-8?B?dSt1L3NhQ3NXeDNIY3F6RGtXc3NqY3hqcTlTdHlxTnA4WmlEd1ZPM0YxMWNP?=
 =?utf-8?B?K2hha0pYdmVGelp5MUZGSm93VSsvSG1VOVRDVUkyNGJkVTRpVWpkNGsvbzBR?=
 =?utf-8?B?Vm5ZcVJMUy90ZmVqWGtpbWFiWnpYeTAwQTZhbGJHaitua203ZllDY3U4TFB3?=
 =?utf-8?B?MG5GdXJNU3BES1Z3cUlhdEEyUTZiTmU2cEthNTBUS05lM25XcURCT1N0a0ps?=
 =?utf-8?B?YllOZ016Vzc1WEZXMHB5TXk4anV6WWN4K2d3dmNFT2VWTnpWMzZtN3lPYU9J?=
 =?utf-8?B?THJMWHVLWlJBeFpxZjh6QnFJUFFTcUJnc01yWXBtWUNSa2RKL0N6T0dWVmtD?=
 =?utf-8?B?UnFMZjNJbHU4cExHS3lVeWNEYVFuYVRjdjVYSmI1Yi9BUUJmdkc1Q05YdW5w?=
 =?utf-8?B?TmxUbEtRTmJPWVJ6Z3dZeWdOSnNJNU45S3YvUDBGczFRNDZYN2s5Zk13Vzhj?=
 =?utf-8?B?ZE5icnhDUklMZE5IMHVoYjIrVGRhOHp3QXlCY2NOYno3VnhUYXh0bk54YzlH?=
 =?utf-8?B?SE9yUFU3MklWSFBzUk0yRHo5TlNrVEoxaS9vc2NsN0M1cm1LdjJDQkd3anJ5?=
 =?utf-8?B?Y1JzWFltTlN6N2ZTWjl4cWpCMEhhekwrYUFPejQ2V1B0VHJTanpRNnBGQy9a?=
 =?utf-8?B?NTJrQmhLbjNHVzhCbWxVaW4xWUxtMzh0S09zVGhTTGk0b00xbjU0UHNZaWRm?=
 =?utf-8?B?UHlLZ29hcTdBQmJmaDd5OHJiVmZUaWpITmxxOXMrU1BaUit5ZmQ2U1FWRWJv?=
 =?utf-8?B?K3o5Qmo4SGcvc25FeEVuR2dOU2lpVmFxL3NRZlU4SHVNb08zVXluaFNCTTRS?=
 =?utf-8?B?alZMckJEaE9XRHB1aFJQajc4VHhOWFRHNzVyaFMxQ1ZiQmhscVZxRnB6NGUy?=
 =?utf-8?B?OWFPMW55WFM5M28zcVg4WGM4clJyZE1ObTRsS2JLL3doeDJXUDhRM3FTRmdW?=
 =?utf-8?B?VmpTZnArb0dBTEtmNWRsdlVvMWF6N0FMaitQQm9vZ1l4TVI4VHYxUHNRaG5h?=
 =?utf-8?B?ckR1bFhPcnNjK1N6c1Z3UHo5OG5wS3Z3UXNybHBrRXhGSWlHSmpGYmJmWXBC?=
 =?utf-8?B?dHkzcmF6NHZvaTdEalp0bzZzaVF6c0lveG5uSjNFZ1NtOXFKMkk4aWY2M0ll?=
 =?utf-8?B?blBoZE1nWllnMFlvTDA1SktVbjFnS2pMUGRHVThOckVPSURhd2JtcTIrdStr?=
 =?utf-8?B?cEt3UEZ0bENWc1ptYXdEY3ByU0o5YURoVEZaWklSSVl1Z0lVaWUydmdwa2d6?=
 =?utf-8?B?eXM5SWdVTGdMRklkZHExRW9RR2xPNTdSNDRDTDZEVUFvTUJ2SUZ5SUtpS3lv?=
 =?utf-8?Q?HPoauy4hDoVN6jQryCmqrmXJD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5686BCBEC1D4234DB6D2705BD9FB061B@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d771ad5-c3f9-4370-772c-08ddaaae93d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 19:14:53.7465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OA1Plvvxf8dG+XWQuZx7Khahd2ph/DQNMDXBrdWk7MoY1VtvhrEV9Px1qxS3YCX0LBweq6c8B9lXVP1jUkP1HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9454

T24gRnJpLCAyMDI1LTA2LTEzIGF0IDE5OjU3ICswMjAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6DQo+
ID4gTGlrZSB0aGlzPw0KPiA+IA0KPiA+IMKgwqDCoMKgwqDCoCBhc3NlcnQhKDo6Y29yZTo6RklM
RS5pc19hc2NpaSgpKTsNCj4gPiANCj4gPiBUaGlzIGNvbXBpbGVzLCBidXQgaXQgc2VlbXMgd3Jv
bmcuDQo+IA0KPiBUaGF0IHNob3VsZCBub3QgY29tcGlsZSAtLSB3ZXJlIHlvdSBjYWxsaW5nIHRo
ZSBtYWNybz8NCg0KWW91J3JlIHJpZ2h0LCBzb21laG93IG15IGNvZGUgY2FsbGluZyB0aGlzIG1h
Y3JvIGdvdCBkZWxldGVkIGFuZCBkaWRuJ3Qgbm90aWNlLiAgVGhhbmtzLg0KDQo+ID4gWW91IG1l
YW4gbGlrZSB0aGlzOg0KPiA+IA0KPiA+IMKgwqDCoMKgwqDCoMKgIGNvbnN0IEJBU0VOQU1FID0g
dW5zYWZlIHsgY29yZTo6c3RyOjpmcm9tX3V0ZjhfdW5jaGVja2VkKHNsaWNlKSB9Ow0KPiA+IMKg
wqDCoMKgwqDCoMKgIEJBU0VOQU1FDQo+IA0KPiBJIHRoaW5rIEJlbm5vIG1lYW50IGp1c3Qgd3Jh
cHBpbmcgYWxsIHlvdXIgbWFjcm8gZXhwYW5kZWQgY29kZSB3aXRoaW4NCj4gYSBgY29uc3RgIGJs
b2NrIGluc3RlYWQgb2YgYSBub3JtYWwgYmxvY2sgLS0gbm8gbmVlZCB0byBkZWNsYXJlIGFuDQo+
IGludGVybWVkaWF0ZS4NCg0KSSBjYW4ndCBzZWVtIHRvIGdldCB0aGlzIHRvIHdvcmsuIMKgSG93
IGV4YWN0bHkgZG8gSSB3cmFwIHRoaXMgaW4gYSBjb25zdCBibG9jaz8gIEV2ZXJ5dGhpbmcgSSd2
ZQ0KdHJpZWQganVzdCBnZW5lcmF0ZXMgYWxsIHNvcnRzIG9mIGNvbXBpbGF0aW9uIGVycm9ycyBJ
IGRvbid0IHVuZGVyc3RhbmQuDQoNCg==
