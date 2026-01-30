Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04127313520
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 23:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769816188; cv=fail; b=EfKAzXVisXYfGx1Kusi8n0UQmrJNgRliSQFzMspUoC4no5jveQIGnF/p3crBex0n3Y9+KaK6tYAdRtJVXkRFJJd0yzPTjOYzIfQ5CxZSw4yZ47qRF1F6TMYAPTVrlJsy78Rum8M7nHdEUMxfhP6YGd6VaR1XMZeQoaorIf8iKf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769816188; c=relaxed/simple;
	bh=9FAfQ1FBO9+Yl6UxNyH3TKR0NEVSKsFzlH1hmsgWITo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pEbapihzyLXXBoQdw3ggv7RkXa7D+HEMlFviUdCjAVddjE+BhvXf8MJSKEAZOfN8iOF6ATUJGe3Bej4xuURPjNmWnyp9Lbb7rQk93gxB2l80v1/c2n9KMSPX+EKofFwn1oWz4zx6azHoy8bgd6WjLDEG33UYezVNiCsPjd/gS/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lxvKpghU; arc=fail smtp.client-ip=52.101.62.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lxvKpghU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2ea88BIKRm37i8l567+DsZFo8a9E+MNUseHERhzq8qZ0achfcsIcv37y7PnDMlWj4Qk2YclvyEfAR9sSh3JC4WevPBWcCuDGaEvZ0R0YSPXdK4hpU7MIpexbdZq2o13PZCddUNxNQkkjYV7wwH4H9RjEU07HdkZOGMNSFBkJWnS7bn4guHqiHcF8ohgJEy3pSbEvBX8JAJzgYWJmoMuVdzttrM30gCWRbWIcsS9YRx5SSZxSA0cnlTYNS2TXYRvpgaolB2KGV3Ji8x2cdK9ujT7FOkKMui8cNkS5z9dCekZtyGm8TJjBV6nb9NJ4DpcDBxe1QMJbNyuNEYJ+BuRGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FAfQ1FBO9+Yl6UxNyH3TKR0NEVSKsFzlH1hmsgWITo=;
 b=rXSwf64L/Umcgkyz+yvIj7oUrGEfHgX/ThsQFmH77P/MjRsX4+Wh+JgjXFGym8nVXLvRurP6ZLAqPT6V/iBt78cBvD3PSl1L2c6bIJdG5aO4ntkbWjhbQisYwD2yapMrFM8cX6EpvZdVS6VYublmYNwvWwdqEbzNroaZjiLAEdPN3djprSDy0H0cRPgDZXti3QmypW0ImIABW4ZXifN7ZHIXFAWuXcL0sQl97KlT1KsYnnezPXkOv15qUZjC0OMbGmA2CUSYSdXhmfoy9lTGnJW6o9tVWr2kwUeCGNczc5BcRF1/Em/r3vvE1Z+Kdq5SheQwPThQk1ERR59jfA4BCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FAfQ1FBO9+Yl6UxNyH3TKR0NEVSKsFzlH1hmsgWITo=;
 b=lxvKpghUWn77suz5PU+GKXsiOwavLsw3jsSCVwCU8rZaYi4sNdAEI5+mdGJVvdDBIhi/j33Q7BYPt7ISavTXJ1/Ffa1fRJ4teu24JT/GOMSnRBve39Axk4nC8XL/BKol8GgiFEPvRU0mKX4gHOD6vvLEIbI7F0bMs+F/yvKof/X2Lsj0ecb8zhsa4Mzy/swpMSD24rV6VF/RqjTDWaKpRp3P5eJGDIUngj3Tqd3fo7u4I00RQhO4l9uiDUW2nRJyUf6haBdLBsXuvLZudbbo513XSiEOanTWuCQSUj9nZvAGfTvrH3+hKNLC6U2WOoJZqV/zicqZjrxOvOa2xCBK7w==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by DS7PR12MB5910.namprd12.prod.outlook.com (2603:10b6:8:7b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.8; Fri, 30 Jan 2026 23:36:23 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 23:36:23 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"mmaurer@google.com" <mmaurer@google.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>,
	"dakr@kernel.org" <dakr@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Thread-Topic: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Thread-Index: AQHckMcO0eg+xcWa9EK4OKU7tGQKjrVrYNaA
Date: Fri, 30 Jan 2026 23:36:23 +0000
Message-ID: <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
	 <20260129022837.4133832-8-ttabi@nvidia.com>
In-Reply-To: <20260129022837.4133832-8-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|DS7PR12MB5910:EE_
x-ms-office365-filtering-correlation-id: a9e323f5-9d60-4b60-148d-08de605860cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SzYvdkMzcG1pUElnZ2JrUFpiaExPbHRCYU9XbU93cUZQejlucVRvU3Yvb2Zy?=
 =?utf-8?B?b0JZL1RmNWlaR3NJN2ZsOFJ0VnlhOHhXNkFybmFMaDQyNC9LTnhNUjR0YXl1?=
 =?utf-8?B?a29QQmZEcU94bVcyb1VPbzBBT0Y5WFpIQ0dMZXFPY2twQjRtbEpQcFBYUy9v?=
 =?utf-8?B?d1gveU5IbGNoVFNqaUovOXBuVnk3NnhVenlrRGVraDJDVlN4emtjZXhxK1dy?=
 =?utf-8?B?S0JwMnVDQjRjZTA0TmV1Y1B0RG80TjBYQXZVdFViaVRzRUx0SFpvRFhaNkgr?=
 =?utf-8?B?VU5iV0IvbnhXZi9Tb3BweGQ2cVJoT05Ib1Y0Sk5LVFVsNlIvTSttZDRBRWwx?=
 =?utf-8?B?RnVkTEI1U0NlZ1lLRjBKbllUU2MybGJnYnNDNkt1OGcwYWJNMm5zdThUbk5S?=
 =?utf-8?B?cmZVNzZ1VlY4cXc4VW5saWd4ZXpnOUpBYm1Sak03WVB2bFBUblErSWsxVlZC?=
 =?utf-8?B?NlhDcGlZRnE2VkNQc1lTMWl5QkZlbERjRHNON1BYVGtJRFBLME9zM1RjUXZp?=
 =?utf-8?B?MEpxbzNnTVc2cTk2WW9vZDJNUDYzZTFVMm51eHRIazMreGhlT2Vqd2RJbDBm?=
 =?utf-8?B?OHBrbTlMNGFqcjhGcGwrOW1BSTVDd3hYWEgwVE1FZStQWlg4RDdoWEVKcDBU?=
 =?utf-8?B?by90d3VMTExkaWFyWDdvTjMvU3hvMDJjanRHbkVOZncxeDVsU2VndWZwdE4z?=
 =?utf-8?B?TXBFd2s4bXhRUUdjOTE2TGpOeDJ2ZWRXSnQrUjdTc3c3ZE9Sa1dwVFo3Vmp5?=
 =?utf-8?B?YU1TL1luMk9rcDJrS3Urd2dmeFVldFJ1MFpGc3prS245ZnhJRHA1S2EvMU1Z?=
 =?utf-8?B?V1pkc1JjRHdTd3ZLYTZ3RzZ5N0ErRlA1YU5EbFBvWXBtZ3RKQnlSekF5Tnpq?=
 =?utf-8?B?UXdmSnk1QXEvSzFyZmlNcGxkMjdjNnMycmpmb2VFWFZzUVNZSllSd2EvNW9L?=
 =?utf-8?B?OXY4dGh3VFVIWlh2VDNVbUc0Z0NzWGV0bzVySkdHTk51cVQzVVJmNTVCcThX?=
 =?utf-8?B?Tkg2SGF5S1p6SWMxaGdtbERYTTVOb0FsVTJnblZqYVU1ZXVVaXhVa05DTTlQ?=
 =?utf-8?B?QWFCOGxnMFhtYmZ2eTFhV0lveTdpS3BxVjU1OHJWMkp1U3U4WnZzVm1rbm5J?=
 =?utf-8?B?ZGliOXo4aU5iaHBkMVAvMVEwYjNqbG03TG5BWi9sdWh6Ti9TWEFuUnpld3Fy?=
 =?utf-8?B?cUQwZU1jK0I0WUdSZm9FbGJLZTh6cnFxeGhyOUFDWDN2c2tBeDM0Z0NQR3Zs?=
 =?utf-8?B?RlFrZkFIVmorVmNOVnVWZEZ5SzZwdlFMV1c4OEpCT28ySjdQWTY4eEMybVFB?=
 =?utf-8?B?cUpGcEVBeTBoOUhlN2pCcWZiUnBGY1ZqZmFuaDBjNUdyV1gvSjg0UmVLaGVQ?=
 =?utf-8?B?RUNoenlqWE9WcVh0U0xiM3lIS0ZBV0ZXbnM1NlF6TmoxQ0tONXV4MS9OanAx?=
 =?utf-8?B?ODNhM0lqL0ltZFRla2tjV1BKbCtaSms2WTJGSlVROUdubkJhY080NGxlTGww?=
 =?utf-8?B?WGhhSElHMTBSVk1MSkwza0NCcWF3MzZXV2FUWGtXQklZaTZ2c1BWVzh3MjlR?=
 =?utf-8?B?S3gvM1pndHNFS1p2K2xEd3B1bEFoVUNLazQ1UDFHT29zMkpnaTFiMFR4RWUy?=
 =?utf-8?B?VFZiaVlOdmw5cllGZnRGeWpKaGREOUdhRUphem81WTExVVdBQjJJRVMyQ2tE?=
 =?utf-8?B?T1E5cDlDWVZNdmRXV0l0MU9icHkxeDRQem83VmJXck8rN01TVTZ6SmJyWGZD?=
 =?utf-8?B?aW1XSzlsV3FqRzkrZ0NaVkpWSiswUXhzcTNiZWYwUVJhZFdUaVFTU3pBVkdw?=
 =?utf-8?B?TWtndDdENDFoR3J2d0F2RnYrbFg4YkRLMWVsR2dhcHlSU01DZ1lmTXE0VWtn?=
 =?utf-8?B?alhTUENXdlJ6Y3BERWJ6V09ENUxQTWVWSEhyRUJjYktxVWJwem1VRytKYnhY?=
 =?utf-8?B?STV6RWdoSmpBZU1Ca1lvZjlmS3N3RFlTaDBrMzc2VkNQL3dZa3FKRFV2eW1I?=
 =?utf-8?B?empvU2pHSWd5THFvdGZVNnJ1SVNPL09UOEVjcHJ0eG9kenI2R0YxelNQUlV3?=
 =?utf-8?B?OVVDb3Q2K296cDdObVBLQko5RVRkRDZuWUpMWStlVXBOa0lvWU9EVml2KzJj?=
 =?utf-8?B?L3JLQUdhQ1NuMVZkMVJ1Tmd2bVhmQUYxeGlCSWxML05rQ3VJZForbm1ySGxO?=
 =?utf-8?Q?LL7IZY/J8WvoCvtrtzXtOTg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SEIzcEt4bjR6QUx5S05GYUZ1N2V1QlZBYkFQQ3p4cCtqRFd3VVhqclVFc1ls?=
 =?utf-8?B?V0crbHFJYTBTMzNiRUx1ZE1JdU50bCs2ZVNic25xbzhXRmp5Z1pkRmJ6c25q?=
 =?utf-8?B?eWFoR0ZkUCs5K1lmTUZtNnhqT2w3K2R0RWdEYVlvTU5WL0lyTkk2SlhBNzIx?=
 =?utf-8?B?Q2MrOVlTUllIdjdnekdTRUZtQS9JT01JY1gwb2psSitNZk43RzFESDcrU0VB?=
 =?utf-8?B?YTZiWmRUSHd6VTR3LzVDYUk1ZVo2RFhtVm9PQTlpR1J6UHhWdW5JR3pPbGNa?=
 =?utf-8?B?dWNTdTU3dWU1TG05bHBPbTNXaDltaHU1NjlPUk8rVDBtUnlPVVZlY1B1N2Mr?=
 =?utf-8?B?SmFLLy9jazdWd0dDMk5kdmVxcS8xcjU1NzhGWEtMUDgyaGR0YkMyRnpuYW8r?=
 =?utf-8?B?b1dPWE05Ulk5WENUQ0lJZ1RMU1dnNm9xUWJEVmxPQ21nTjRoMTllbGpMS3lo?=
 =?utf-8?B?NWQ0NlAzS1p6VCtsR2lqc0RrSG5PSzFTYnZ2MVMwaU1FYTJ2UGdZMFloSzNz?=
 =?utf-8?B?Vm05d0tnY0pqN3JiZnk3QWRKai9ieURjOW1KR2FVOCttTXhzUkRrVkU5Um16?=
 =?utf-8?B?aFM4K0s0dHByUStqQWJGWHNZYncxcXgxbTRHTStOWFlZdkl3dnpYRGxYUG1j?=
 =?utf-8?B?SmZ5SGRRVmJBSTJ5MWwwRUtIZGVyN3lsR2dycy90YWdValRkcEk4ZnNOVnA3?=
 =?utf-8?B?eW5wV2hXanJtTmJjeUhvL1ZHYjU3d0NFMFRROVlOWmxJN2FnYlVwRkIvSERN?=
 =?utf-8?B?b1BjOTRneTlkYVdiSmJBdmwzTHB1UXFvQzkrZjlYU1p3VzZqWHoyK2hJSU0v?=
 =?utf-8?B?Q3hBd282RDZjdjBkeWwwSnZueTRPYU1Odlh5T2hQeWVpR1BQTVVkQTlZK1VD?=
 =?utf-8?B?Q2FGKytyaWtkek00K0xweGFVVkE1YjBONCtQdktrRndwSm00Uk1kaEgwdnFM?=
 =?utf-8?B?b3FGa1BiVkFEaWNkOG5hNWRMM3FCUFk3eW82R0pWREV3MGtKbmQ4dzFrMkxQ?=
 =?utf-8?B?cE8rdTkyUnhaNkVUMlJhWXhmY0JXQTBwNUMwLzV0M0ZLSytDdlhnSmp0MXU1?=
 =?utf-8?B?Mzk2M0tEdmErQ3dsS1dkenNOMS9SelBpMW8waS82UGxzSkhuVmpEL3dvYkxX?=
 =?utf-8?B?dFliVXZxeEJaQ0s5VVNMaE5CZjNweTYwM1VVaFJ6Um00Y3FVVlliOXBtVU90?=
 =?utf-8?B?cVIrY2JBNHlCOXBTUDZwWWxZWTdDcHpNYUkzQytlOUxBbGNvMnI4RVc5azNy?=
 =?utf-8?B?U0pwQkd4OUtIb3hJVVVTYUVtK1JFTVdualRScE5XZGdjZVlvWjFpRFdEd3VI?=
 =?utf-8?B?aEhtczhwOUlSNmQ4Z3JWOWx5aW1TTEVXWEJxUFZ4RGNZUFU3b2xZSllOL1Rz?=
 =?utf-8?B?OXdRQTN3UkJBaWZ2TlpwRnNXRWpkM2xiYWd3VG4zRk1UamhNZkRDb3YxRGFx?=
 =?utf-8?B?ZCtPcmhEN3ZRNkh5cmJyOGtVWWRWWHVUdTNYS2NXNWo3b3gyQ2c2WGM2WXJN?=
 =?utf-8?B?R2tWVXUvYm1wTXVoeFRWWUdCY2lwNndNN0RGU1dPM1ZMTElyenJ5NzlzUW9X?=
 =?utf-8?B?bkZSZjhoaFY3N0NuaWJ3MlowYlJrb2Rva3RzalMxMEkwTHJjeGF3T3RKZEdS?=
 =?utf-8?B?YWVTRUZJMlFzRWJ0L3dqQi8wUFM0SnI2c3FPcWpocUtKSS9FL2R3VnZxbTFE?=
 =?utf-8?B?dVc3OW5qS2F0WEpNdzJ1Rk9wVXF2TkQvRzU0bFhDaVlUTkxydnZSQ3M2bkRi?=
 =?utf-8?B?eXExcXZqRTN2VGVORXJhRHY4N3dnRWdBMEg1Yit6SHBvMzA1RUZua1lRUTRF?=
 =?utf-8?B?ajJVTjZQZHJZa0FvY3I4ZlpobmpQY3ZHUTNNblcyYm1QZUFyY3A2TUs5RUVB?=
 =?utf-8?B?ZzJ6cm93WDZoRUdRNlA1Y3ZHSWZGdGdadVpuRjVQMjFxQW1uNmJnZW5US1RI?=
 =?utf-8?B?L2cxTnBKUWU3YVp3ajVuVitsRyt6bWF2RjBqSGUvb0wyNCtiNE5OOWVpWDNk?=
 =?utf-8?B?ckdIa05xWWpSSlk0c3FLUk1UejVVaGExTmFWNTgzTEZLVnBXR3NzdlFWdDdr?=
 =?utf-8?B?L2NTQW5Mb1czbWpBdUhQdEVtaWpSYytLcGpJRnp2UnEvRHBBZkVCUndmYTNa?=
 =?utf-8?B?VzJETnZScngvZWVoMnI1TitBN3cvVnpTK2R4eG9FZnpvMGtXbEprS3ZBL1hR?=
 =?utf-8?B?NlJ6bk5IOFpmRXB6TjVnRDNRN0VPZWpnNlg2b0UzeFRUL0tjSWlMckttSWxN?=
 =?utf-8?B?dkFtYVJ5UW0rdmgyL0ZJVXJkdkkyQWxtdTljVlZNNHFWcjRIS0Z1SGJ3QzJt?=
 =?utf-8?B?am5WbmpUVjRLSWtvakpFbUhWZ216TTRaNjVyYkpaMVNmQUtRdTRLZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64FB7F52F445554A8FD16C7F7795D615@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e323f5-9d60-4b60-148d-08de605860cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 23:36:23.0340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qo6iTGNxw7xCG4qn0uSMKmBR3JtGJCLlACUK7NNmXEdgIdIv86/BLkcDbl9ZwVlMz5ULds4QjPdKlN+bTav+kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5910

T24gV2VkLCAyMDI2LTAxLTI4IGF0IDIwOjI4IC0wNjAwLCBUaW11ciBUYWJpIHdyb3RlOgo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjW2FsbG93KHN0YXRpY19tdXRf
cmVmcyldCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIFNBRkVU
WTogYERFQlVHRlNfUk9PVGAgaXMgY3JlYXRlZCBiZWZvcmUgZHJpdmVyIHJlZ2lzdHJhdGlvbiBh
bmQKPiBjbGVhcmVkCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8v
IGFmdGVyIGRyaXZlciB1bnJlZ2lzdHJhdGlvbiwgc28gbm8gcHJvYmUoKSBjYW4gcmFjZSB3aXRo
IGl0cwo+IG1vZGlmaWNhdGlvbi4KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbGV0IGxvZ19wYXJlbnQgPSB1bnNhZmUgeyBjcmF0ZTo6REVCVUdGU19ST09ULmFzX3Jl
ZigpIH0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAu
ZXhwZWN0KCJERUJVR0ZTX1JPT1Qgbm90IGluaXRpYWxpemVkIik7Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2dfcGFyZW50LnNjb3BlKGxvZ19idWZmZXJz
LCBkZXYubmFtZSgpLCB8bG9ncywgZGlyfCB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZGlyLnJlYWRfYmluYXJ5X2ZpbGUoY19zdHIhKCJsb2dpbml0
IiksICZsb2dzLmxvZ2luaXQuMCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZGlyLnJlYWRfYmluYXJ5X2ZpbGUoY19zdHIhKCJsb2dpbnRyIiksICZs
b2dzLmxvZ2ludHIuMCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGlyLnJlYWRfYmluYXJ5X2ZpbGUoY19zdHIhKCJsb2dybSIpLCAmbG9ncy5sb2dy
bS4wKTsKCkkgdGhpbmsgdGhlcmUgbWlnaHQgYmUgYSBwcm9ibGVtIHdpdGggdGhpcyBjb2RlIHRo
YXQgSSBkb24ndCBrbm93IGhvdyB0byByZXNvbHZlLgoKSWYgQ09ORklHX05PVkFfQ09SRV9ERUJV
R0ZTPW4sIHRoZW4gREVCVUdGU19ST09UIGlzIE5vbmUsIGFuZCBzbyB0aGUgLmFzX3JlZigpIHdp
bGwgYWxzbyBiZQpub25lLCBhbmQgdGhlIC5leHBlY3Qgd2lsbCBjYXVzZSBhIHBhbmljLiAgV2Ug
ZG9uJ3Qgd2FudCB0aGF0LgoKSWYgSSByZW1vdmUgdGhlIC5leHBlY3QoKSwgdGhlbiBsb2dfcGFy
ZW50IGJlY29tZXMgTm9uZSwgYnV0IHRoZW4gdGhlIC5zY29wZSgpIHdvbid0IGNvbXBpbGUuCgpJ
IGNvdWxkIHdyYXAgdGhlIHdob2xlIHRoaW5nIGluICNbY2ZnKENPTkZJR19OT1ZBX0NPUkVfREVC
VUdGUyldLCBidXQgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0CnRoZSBjYWxsIHRvIC5zY29wZSgp
IGlzIG5lY2Vzc2FyeSB0byBlbnN1cmUgdGhhdCBMb2dCdWZmZXJzIGlzIG5vdCBkcm9wcGVkIGF0
IHRoZSBlbmQgb2YgdGhpcwpmdW5jdGlvbi4KCkl0IHNlZW1zIGxpa2UgSSdtIGdvaW5nIHRvIG5l
ZWQgdG8gZG8gc29tZXRoaW5nIGxpa2UgdGhpcyBpbiBzdHJ1Y3QgR3NwOgoKCSNbY2ZnKENPTkZJ
R19OT1ZBX0NPUkVfREVCVUdGUyldCgkjW3Bpbl0KCWxvZ3M6IGRlYnVnZnM6OlNjb3BlPExvZ0J1
ZmZlcnM+LAoKCSNbY2ZnKG5vdChDT05GSUdfTk9WQV9DT1JFX0RFQlVHRlMpKV0KCWxvZ3M6IExv
Z0J1ZmZlcnMsICAvLyBKdXN0IG93biB0aGVtIGRpcmVjdGx5LCBubyBkZWJ1Z2ZzCgpCdXQgdGhl
IGRlc2lnbiBvZiBkZWJ1Z2ZzIGlzIHRvIGhhdmUgaXQgbm90IGNhcmUgaWYgZGVidWdmcyBpcyBk
aXNhYmxlZC4KCkFueSBzdWdnZXN0aW9ucz8K
