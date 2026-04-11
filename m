Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013054.outbound.protection.outlook.com [40.107.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD3D186284;
	Sat, 11 Apr 2026 03:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775879915; cv=fail; b=Gtg66yOV7h4aCgEP3A2UDUcjkf/Dbid0jT6xW1xWfAgF7VWL9MyN2Zh5ryun0H4nkSVJe0o/yRer0dKNa+h84PrMJZy44SHrWOPTByzdtx0EZaQdfIK0uB3i75QRfTa+FKt1GxsY5jdnHy198lBfUcwD7II+DWtbEUAoe88+ElY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775879915; c=relaxed/simple;
	bh=8qLzE5pP7eWgjUO6Nx6oO46ZEjLxdlPPGnhOHC52kPk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lv7jVjg2LntUC4VYnGu8k89hROYuEg5L+KUmLEvSYaELRP0mnyS/WWq5B2u+mZy+5+DCXkeRXIJEz5ENoOmywQS11dnBDrUERaQtcV33BL95XHzZmfBJY+OGLMVyTAMR0RopM1Yshplax6e1Qt9TAT+l/Ppulx293aZCqeDHtME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H1kp2sR0; arc=fail smtp.client-ip=40.107.201.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H1kp2sR0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXCScP56iDm+DeHBdIuO9I601FTm0mpyvP4s1AOc91Kfq8gMwnTHJALHmnOMNy2BjaiJGAFtGZB2gN/poMRfHb2S6fCEWKz1aGfmZBkhV28IiC7LRSwQ4/IXZie5Vu0VUBzi1ZbVC7VcWJYv3uuTPNrInxSyW5Wpl8yn5yinFHGmj125srT6y2mCg+FVKxIlOJt6yDPKXqAV+amQEp/P+w3Ha/PVHfvB9wsdi+W5NCtVnU73WRvAr9krH5249OvmBWlAuGHfEeB7337MZeJbkPLj6LAbzvfXcY8Of8cYIJatXzlKC8o+860wFaKT7/QKBavtU7+MDE+U/e76XWmesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qLzE5pP7eWgjUO6Nx6oO46ZEjLxdlPPGnhOHC52kPk=;
 b=vIHNI55XF4ekT3OQZWBQUf1QwOpSys/L9AkqAPsH2e6b3bPzz2EwD2ANcXgU+lbq9oI9Jgf4n3rhqwD2csdY+2Q3tgs7KJqVn1U9JPPXTcU+prIv0p1GshyyowoWX7OEtwnlyY8e02RyP1CedDWoHq1chXNZZ2Q4wYRnzAufpVcE1ooAGHY43XuC9vXBNjd/T0h9yFLpSNIosQSsbN+S6sqJqW0LukyNQIQsTiGrU3S0m6bxvA42ZKEliBJ5hfeZQWD4+qcQOQr9Hrt1gAXmmxwkHi/AX9isyGHjRMAw+6lb5UvLw+QMFy6swI9+4ZyX+1+9Ok60l3nDmzfVtQadkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qLzE5pP7eWgjUO6Nx6oO46ZEjLxdlPPGnhOHC52kPk=;
 b=H1kp2sR0OO4wlIH2k3GwzbS2bfk2BEVsO8Aveg3XHxdLz9vArMcXjiuG3HgM6jHGoJt/X2inmECnRNrSnbsuwfoaSLeoeCKdqxGAbThPnSbxZTCqanyiLQzvNJ2qx1nPwIsRFDSUODp2T9S4hIPn+zcFbM4CXQSw0KkrHhDuatOUUqJffStzP5yFQplvYGxkNZLVMsZm44kaf1ZEHLAFXS0byG35RZ7E58jMPoHF4pfnS9e9APkiyPrVymm/yNT18oLqD51vKiiwoV1Mn/FE0ljiCL579xCbZf7362p2rM0ZeXRREKFP8IH2ieiuolKs1n+/H5zhr+pjmSxwHPakhw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by DM6PR12MB4249.namprd12.prod.outlook.com (2603:10b6:5:223::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Sat, 11 Apr
 2026 03:58:29 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9769.041; Sat, 11 Apr 2026
 03:58:29 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "aliceryhl@google.com" <aliceryhl@google.com>, "lossin@kernel.org"
	<lossin@kernel.org>, Shashank Sharma <shashanks@nvidia.com>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, Zhi Wang <zhiw@nvidia.com>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
	<tmgross@umich.edu>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"airlied@gmail.com" <airlied@gmail.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v10 03/28] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
Thread-Topic: [PATCH v10 03/28] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
Thread-Index: AQHcyV3lkcAMQsc+f0iu8dh5AdWM5LXZPCwA
Date: Sat, 11 Apr 2026 03:58:29 +0000
Message-ID: <2a4c06e1616ec84e29166d881ec3240a1fd441d6.camel@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
	 <20260411024953.473149-4-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-4-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|DM6PR12MB4249:EE_
x-ms-office365-filtering-correlation-id: c22a41a5-5d12-475d-d7c9-08de977e9744
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 ccxlbUhfNfWqIJWrHHY18QZeWQz7kwUetMliYKgg58yV6bLgVT4dSP6rxynz6o/siLccqkxUF7+cMKFB30FhUwnzhSlaSOzb4G7e3BpGfyfvs3JyZo+6K14+stBAF3F8lC85WJY0jafu4CSHpROth2kbcINl3dI2H5P371L+P1/4BcZKqTuenWZdP+nbzAT0cwQCcibZevxj191KA0z2QkgIjr57l+6uz5qfLetT9h0sSkikTxwBdykL5/AoAf5V1XMPlQ6lMsGfcOFmmAv9UKRLK2wD7GZr8xkSaoLvUWoTEi2Ak+MoIJrALLD5ef1kAT6/H3lx9YHnT51/sxdE+aXn+Z/077IKqbgUo84X8PSUaCD2IxCjT8plwavpNbu3iDxXXhKRsdNKqoaQlvqJw3fngYUihwyX2PXAwLrgQbDWRBZLqz3Yl30BDMVc0fhuSemgPZ1JzoWWzD/NRL6YS4LEKerS+mU3qwmUlEU8FWUKWDBL8OriVLkL0TVtYkWsClDDwQ00dau/Bs3OA0pFJ2vRG8xZW+b76H/V/9uhqfT09UWFW8C7WfMC0zvPU+Ph7LHImxiZKrH7wpVk87FTnIHAC4MpK3AkTi/TUMSWuRG7DhIpDIPqbgvIOtXdzF+TmRk9lHo1iPiCNZEoxUBb7Gv0Lr0ZgzaZaBtdqDAyeb4ALgEdU4BPM7niOJcpz9eQAmA79gn5icqsPRzdHoZLJ5+1h5jrzWgxXEeKUZ6R8uqQFWqwatc7UbZmQsslI2HR64cQlzQ3qknQqcZ9VF47v/hvEe5/EAwpdx7LpoJ47g0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTNheStNVVNXQnlnNWcvY2xnRGpVdGNxR0RmZDh0Z010aVNjMDBrenpQTit0?=
 =?utf-8?B?aW5XNlZwMmRMUGhYZGF6K284eEdSRGM2aWhycDRwQ3h5ZmNmMjk3b3MzdkRa?=
 =?utf-8?B?cmthd1lLVE5KVGtqdXZBSWczN0VJQW8vaWhRb2wzdlMyaTRrNUFRUllKTEgw?=
 =?utf-8?B?QlZTRUV1L0JSSFRCY0ZhR25GeFVaYXd6MUNVZHltNUwzVGxYZHlsRWN5YUVY?=
 =?utf-8?B?Y0xuZjh1SGpHd0t3WVpXREJkaURMVm9NNXJvNXFRZktPRmRRUGkyUmV5Mmtx?=
 =?utf-8?B?Vk85YjlrT1UyMEh6MzFBdXZzRTFab0JGMHloT2J6dXY5WGt1ak5JL2YzcUtH?=
 =?utf-8?B?WUNsbjBMdFpCOEJ4M3dQc2RxTk0zc2svTEdzMGt0dkdmNldJNE1WdTAzamNO?=
 =?utf-8?B?WHpnelc3M0xZKzllNDF3eThlMFZLWkNvMFJ3ampyL1FubnpXTGwvR3g3NG5o?=
 =?utf-8?B?bGRZT1BGOERWa3ZnU1huWCtjaFhEM283Ym5GQ2VQVXNQb3pHcjl3dy9WT01J?=
 =?utf-8?B?UFE3SVBTZEZ3TEUwODArMThQRkdOWGJ5V2t3Z3NRaFRzZVF4dkhxbEoxYy9I?=
 =?utf-8?B?Z3lxV3kxZ0FrMjBSeFlZY1NBQ2xRZjFJUThrdXBmWGUzNVRIK1FJOXR2OEU2?=
 =?utf-8?B?SzJmeVREUFk5WGk0OEN2SllpS2huWHNmc1NnUDQrYmRpSGFSLzRxUVFEb0xL?=
 =?utf-8?B?MW1WZnZCRkhzSStYbVF4OFhiY0lXK3Y3NitLZjF6UjZiTjVRdGJURXNrVUxS?=
 =?utf-8?B?S0tzajlER0pIdEcwTlpQZVdSRFNLWnY2QTl5Q3NNOFhhWUFwK1VPWkxWenVN?=
 =?utf-8?B?eGhNWlIybjgyM0NMUStlWkhTUFVpK1FxQXVFYzlaV05jQ2VqOG9PTWgreFFF?=
 =?utf-8?B?TTA4SDJTbzQxRldLSHdoeHlYYXY3TEpISUZ3NzVhYVhxRnNtNjVGV29KRzFY?=
 =?utf-8?B?V2NpSHBUVlpwR3FmdW9HOXRrTXY0N0d2VVRvN1dpNWxoMDIzL0NXN1VYWUlr?=
 =?utf-8?B?aWtzOVVKbWszWTFXbkxLOXJrYjRqK2NOUnZDeEFOSmV3L1NTTHordEx2VzRq?=
 =?utf-8?B?eWxtMzN4Zk5RWlVnUko3VVlyVXh5U1pES2hXQTNMNHlZcjR0c2w1V0MwOGJN?=
 =?utf-8?B?VVQ0elZCRldiZzB2djNPcmNYaFI2RnhibWx0dXlHM3pNMGlDbUhSWE1QUmx2?=
 =?utf-8?B?YXc2ZE1lZ0xIR29LM0k5RTRRZkYveTNBa3Z3ay9weEdHdmJsbnUySlFPZFZs?=
 =?utf-8?B?aEhzSm4rYTFjUytNT2trUnpIM25JbDkvL3M4dzgyd0wxSit4cTVJS0RxT1k1?=
 =?utf-8?B?MTBMZTlrMWtTcktIZnIrVVJacU5QNGZxM1NXenM0OUltaUNya1RwUmVJZk1z?=
 =?utf-8?B?TElhd0FxY0xGN2w2eDdYUXRYNG5EVnEzV2dFQTZPV3p5YXRqWTFzRFBuUEZB?=
 =?utf-8?B?SjFsSXVtenF0REtjcmt3amYzT09mNW5mYndPUHpja1ZSYXhzWG9RZlViL01w?=
 =?utf-8?B?c1RkYjFld01abUJ3cERNdk1SeC9VczRsL0M2anJqTmZITzUvY3NuVmxXcWhM?=
 =?utf-8?B?eFRjWno5UjNGMlZmSmRWayt3WXM4Z1ZSelBlNnY2OHdqWWNIenRrYXRCMVp5?=
 =?utf-8?B?NW1lTkxmUHpiMDJaaXpjUzNLRVg3M3Z0aEtVR1I5dHZaMk5HckNVOFM4YThl?=
 =?utf-8?B?S3ozSStyMXZMUjRoSTVRUnk2d25CS3g2cWs2SDlJUmVUNk4xb0Z2TWJ5bXZr?=
 =?utf-8?B?UENOSU95Z21ER2xONVdtdkVrSFdTbStSOFplRDlqa0NRRjZzUS8wT01seTBJ?=
 =?utf-8?B?Vy9xYi92dEYvMmpqZUNpTHgzTkh4enN6RnhZaHplamVqN2JuZ29wZjR6eWZD?=
 =?utf-8?B?bkdoR3JlSkNYS2RUVlVnbEd1WGMzSVQ0ZEsxVUdydUR6WENlamhSV0ZtcUxl?=
 =?utf-8?B?SHZKM3kwVGU5a24zd2F1Zk1ITVNBbG5KdjlDWGc2Q1ZmTnV2Z1VBNEM3bi9N?=
 =?utf-8?B?cXl1QS85QVYxL294TU52SlVuRUpMbjU5S1B1U0I1MmlzeTc2R1BpOW1PYk9P?=
 =?utf-8?B?ZGxmZjIvMmhkYlR0MFlab2hObVduZVcrUk1GNWt0S0U0MWFDdGZ5bEVLNG5a?=
 =?utf-8?B?ZGVUdUVJcEhmRk1UZTFNUFNXWGtZeUtheWxBRkN0YVByRHlMUWpBMEJlQWtZ?=
 =?utf-8?B?SVkwb2ZPUzZGMVo1VHhPODZ0SVAraVFqb0J5K1dRcjZKTng1dXV2dVRtNkJ1?=
 =?utf-8?B?L0lIM1lCcVJ2OHZOeEZsQnhmWnlwSFRidDR0bkx0UzNmdFJGNTVlWnZ2dEFZ?=
 =?utf-8?B?ZWczNnYxZFFmdk9meUlLeEpNNmtNVDM4Yk1jNFNDdk5jdmxJcGxhZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42537D8EC507F14FA5571451721FA1FF@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c22a41a5-5d12-475d-d7c9-08de977e9744
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2026 03:58:29.1606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aUN9surFutEDMeeE6XUdA8+DwCgC9xTnqk6OWfa0k5g31KQEb28cFm2pAZHS/FpKjLYbZUGwMeUFlOipN6siDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4249

T24gRnJpLCAyMDI2LTA0LTEwIGF0IDE5OjQ5IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ICvCoMKgwqDCoMKgwqDCoCB8IEFyY2hpdGVjdHVyZTo6QmxhY2t3ZWxsR0IxMHgNCj4gK8KgwqDC
oMKgwqDCoMKgIHwgQXJjaGl0ZWN0dXJlOjpCbGFja3dlbGxHQjIweCA9PiB7DQoNCkNhbiB5b3Ug
YWRkIHNvbWV0aGluZyB0byB0aGUgcGF0Y2ggZGVzY3JpcHRpb24gdGhhdCBleHBsYWlucyB3aHkg
QmxhY2t3ZWxsLCB1bmxpa2UgYWxsIG9mIHRoZQ0Kb2x0aGVyIGFyY2hpdGVjdHVyZXMsIGlzIHJl
cHJlc2VudGVkIGJ5IHR3byBBcmNoaXRlY3R1cmUgZW51bXM/DQo=
