Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011031.outbound.protection.outlook.com [40.107.208.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D044315F
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Mar 2026 02:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773453925; cv=fail; b=jr9ZyAuygQ1wGXPda6c6gA5ol9TLtyPFr1+mEgtLtFDy6b4er/Y/7WVJ3L/VZ1bBsROi8e07PvZxIC8Qcm/o7USzzFgYTw9SPxLGTIkLEYg10W3xogVVeNgNgQDp9KosXdlL/3bz81LmLclr7sOznqgBLegrgTCsUySjN9eREdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773453925; c=relaxed/simple;
	bh=ThOP5XFXvyt2/E9K/ANIieTnGUi8av37RpttqAF/rIQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IS2gKaGllnSxDL09g7+75nKTlDLZ5Gyq9KDj269cv7sQxB9EqXJqzsjJPuDM8aZb2BA3tHg0x9pnQr3HLrrj/l0wpEBUp0QZI2Zy+rknTP5ev3yK9A2RFl+hmrhePtoEBSJp9tBYEqK9+mEPsZsLGpVhvZVbSN+2bRApWgyDfwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pkCb06kN; arc=fail smtp.client-ip=40.107.208.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pkCb06kN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/Dyqqmuz/S8BymqL5WqaQYBc20v10LpGB5JHP+pM156JuaNUky8OcDUbksosI3AVj73/1xzqlZb+zaGI6wJx3QI9KtNQ9ifQFfBMs9szv6vOVH47Vk80LYjW1KjlCN3PLiqe0W6aBY2HmneAPfE/k01MvHyaaO+IiTzPdoCrHU4N9MM8TrpazUuTeqYuXJ/I5BDiB+ZwRZi2BRqMbbFap/dPlNlJePTH12vSfPdxNBKtrkXb1FCZj9UoQ/lNISylYtT37OgiZmUj5LH1o+38z/uUFsPItWhobMdFcrQnQbr4XS6rNCkDKc9yzhnBGfEum1vX9s547px49zkB2hdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThOP5XFXvyt2/E9K/ANIieTnGUi8av37RpttqAF/rIQ=;
 b=I8KdKIbeeNAwbuojY+So7P0eN2ZZTs/LnuJ/MKg6p7ERx1E7frIeFrOqeTLQVGmPHvuqb1B1NTDScuYPFOPwjvl2nHdF6ojUGi7yl5xl/aAz7Vfs8KOTGNVrTbQAa4XT8mLJwRP4igzZepW8RDW4qdyD51Wc3THiizCTZRVbH7kMgUgmSdDRh0HNG6GfOZy6Fkkxabb4pQEIoFHOCaIUS8a3qmxsNe3JOYnTT7CI+xZPPpiLJf4FJIwr4+IGmI/OOCy/Zd9CroUhFCBb8kTAzeR1/wJKQs9RZFARcXO2gDl/g7WoVIGEJge13mLY7vL2fSsLFEjyqBTo97zVKL2jDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThOP5XFXvyt2/E9K/ANIieTnGUi8av37RpttqAF/rIQ=;
 b=pkCb06kNV2AF+xg7Jz4CgiY8m2rFucmXyWvwcAQ5LQo/OMQVtaNo4NQz5AkBO/s6fObxWtDg8/hx4A79u4DlchxG0qmIWBPb7mvBto2GCXO5DwG2qbdQECK724gIzm/iyTyh49PODKvJJ//E49ELcUOQHYq7P4H49xOpVAuws49gEnD/ZituWibd+Bes8BC/Zo645+tYYKnYHUUxseP9fOC06+pP7x1MmfPUEYMkEm5gbtqe6tPwQnkNxz/6QmuXXpxoCXsZcI11JdfSW7c64kPNNOQLoXLnpcQxYS24bPYx3OS2qug9KEsEWEoVAus5Xr+bZuKVTtTodyB5R5WVDQ==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by DS7PR12MB6311.namprd12.prod.outlook.com (2603:10b6:8:94::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Sat, 14 Mar
 2026 02:05:18 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%6]) with mapi id 15.20.9723.008; Sat, 14 Mar 2026
 02:05:18 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"mmaurer@google.com" <mmaurer@google.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "aliceryhl@google.com"
	<aliceryhl@google.com>
Subject: Re: [PATCH v8 3/7] rust: dma: implement BinaryWriter for
 CoherentAllocation<u8>
Thread-Topic: [PATCH v8 3/7] rust: dma: implement BinaryWriter for
 CoherentAllocation<u8>
Thread-Index: AQHcsNla+9snc1lOYka4UlljF5Iht7Wru7WAgAGQmYA=
Date: Sat, 14 Mar 2026 02:05:18 +0000
Message-ID: <ac909647923d01f1e00e40bb0af83a546fdb1f10.camel@nvidia.com>
References: <20260310220000.1897166-1-ttabi@nvidia.com>
	 <20260310220000.1897166-4-ttabi@nvidia.com>
	 <DH1AG9IDZIDO.2610KTTZ29MVS@nvidia.com>
In-Reply-To: <DH1AG9IDZIDO.2610KTTZ29MVS@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|DS7PR12MB6311:EE_
x-ms-office365-filtering-correlation-id: 57a56bb2-ebc5-444e-30ae-08de816e23d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 RVJix/2Bd4Yzrxnb52KVdwIlNky+ausEHDQnQc4vNvpwlPLwLRpb8RfKoFVZkmfNM9KHNU7A/vs/MuUftho7FD6qQZNBsXmEOvlqy+4NFtjI1vZXP57UJFVCcEmfeNVgcw7qiAN3egwcoJR76kR8n3cRkDw5L0MO6AYZA482gYbriiSA7WbfFcfkKVyJrodmHRswGahmZYnOCiATWnzcCWQO122xHVhTRH/b7r4BUEDdgsRBAXmqmhuOwhnJaKa941YhUBu3smNG2+xfJBYiduZfBl52OnGtgxlh8y2PsLDxfnOh/4SoQ5nvh7RlJa8KWD4bChua9jKJd7wjhz39WUIOgaHCyPuubyF29ThhXLpsNzNGqrO0CDs0SYoljmv7kZPX/IcsOH7E7ur4bLPxT0QQNTwfO1iXGSVNSXE9+RS9ALUD+NFR3oKbHwMyU7+R7Psuvxv+F/VgEry174qZR2E18MxBCBzV+BcZklV4V9GeCRVm+r4KT1z2FFWcC0umlKroRlaT2A4F7TRzSnlL8iHQjXnaAX0WRfDYf2avIm5u4BLco3sZYf2TUpEN2Y6b4MveoVBfDGzN0BBAncJTE+mrXrMU6zrw22tApvNQTEBNx6Kck9ddmTd0ymEt3nUnezTst+57fOrLAzsqueH8Vse7c9C64qnwYpS/4KMhLGueiPI6Tsw8xcVbKg85e3oHrPPPUTXftfH5EfWvnx6s3AnYRW5wOupEPrl8xAXGn5oC4J4wduDGczGXtVsBZyzdpJhqwPkhxpITrolapvpo/+1RkEOSqKQT0NL8wPbi2vQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SUU3OU16SXI4a05NTGUrNkNaeVhxTmUyUno4MmQ2aGtJK2FDdXp4bVZoTUNw?=
 =?utf-8?B?RmRuSk9pR3d3U1ZBd25WcFdkcFJsZ3FBamdNdzdsdzQ4S1ZTaE50RUpKaTF6?=
 =?utf-8?B?MzVoYnBFRmpadjlhKytMM3R1UFo5VTZidVQyVkNDQzRNREdCSUtsaEQzWW1Y?=
 =?utf-8?B?enFhYjJ1bVhvV2lDZStjRVdsOWgwSG0vSGtreFpxb0VyR3BoYnE3Zmd2VWhU?=
 =?utf-8?B?WXd1SXdmc2lkNzNsQjliM1F6NmxXVTdBdGs0cmRlUU1BeWROVzJUNjAreDFs?=
 =?utf-8?B?cUZRSW13ZUxRV3ZsRmhOWFVBanQvZTF5UWQ5aFY0ZE5nMTRZRG1VTzB0S09F?=
 =?utf-8?B?M3J0OWdBa0Y5azhZQXFWbU9iZmduVHpEQlMwK1dJL2swOWl2MXI0ZDlGNVE4?=
 =?utf-8?B?V0o1VVErQWgvdWJpaUJ0ZU5QNndoRG9KditMSmp4Y0ZMWGFYYlRQaHFZbjZ0?=
 =?utf-8?B?aTN5TlJBOEpxUVUzRnhjWkNDL252M1V2TGJsYkZ6WHJaZUpNMHFCOVFHeXlq?=
 =?utf-8?B?dEZwR0VUdkt2ZGlvNjU4R1g1em9HL2tYWE9SQWptd2tIWmNmWUFwc2JEL2tz?=
 =?utf-8?B?cE1IemlJcTBlZ1F4MjNIT0xJQTdRajZ3QUlaRnZqNTV0TmxzUTBPekdRaWNQ?=
 =?utf-8?B?Si9qUFlZcjM5bTZmdFFrTW5ObVNGN1NIaUg1YjQ0WndSQlFicktuN3k1MTh1?=
 =?utf-8?B?VFp1bnJuOUFJci9KZmhGNDFiTGpoMU1lL0p3dEhwOUsrVXFxRmM5T3gyUmlY?=
 =?utf-8?B?YmZ2eEsxTkx0UWJTOE1POVZ4M3dLQlB5OTZaNkt2UUFkOFFMTXVnd1BiMWNv?=
 =?utf-8?B?Sm5tb20wbUVvVUtEaXRoR25VbkJUaURGZmpEM1R4R2VwNHl2T3RKNnZzOGlG?=
 =?utf-8?B?TzFvbUxZd0Q5NDduR0pJdW4vb0trd1R5dHl5RzNKcDE5NEFnZnNwLytJNGhO?=
 =?utf-8?B?T1JSSFBnUmJpOGM0U2grUFRBRjJuc25rbFR5MjV6UzQ2SnlVb3FQMmk0K0w3?=
 =?utf-8?B?Y3Nza3JtVWdPOWVKb0wrelJwSFUyTzZSQnAxNDBLNm52QjV4ekhzV29xY0Nk?=
 =?utf-8?B?Zjc0QmdEM3JqbXp4dURQV2I5aGFDVjRkWGJCTmE2eTdwb0xGejFJRDFyOE5m?=
 =?utf-8?B?aUpGMDJsdHZiV0xxdlNGZU5rblJYUkJMc2UyZmwzNlZtLzRvbnlrTWNtS3ht?=
 =?utf-8?B?MkJjcU5QL0ZSTkNWVE82cFhFVWJRMUVSMGppT200NnJLS3FoRlc3OFplSkw1?=
 =?utf-8?B?YVhnUWo4bW5tMUMrcHgrYk0wUVJuYmEzZ1Z0UlN3TjByeFMvbW93UG03ZDFZ?=
 =?utf-8?B?L1poMC9nYk9xRndUaDNIQnpGcWlEVFRMSVpNU0FyK1lhRHVvZlBWbzlxSVd5?=
 =?utf-8?B?MmJkRmZuMW15WGVlMXFHeW1tSG43NGg4ZGlOek12eW5GTVZVMFk5WG5SUk42?=
 =?utf-8?B?ZDFsV1cxSXVuSElWb3dzcWE3MXBvNFdJTzFsNWdRbURXY04yaXRFQ21NL0FS?=
 =?utf-8?B?UzRqOUVDRjVVckp6YkRrZTR4cS9JM0NQeTlWeWNwQmpKcHBKRVBTcE1PaVVH?=
 =?utf-8?B?dC9kME9odDdxUUJ5KzZxa3lqSWRKVVFsa3RiaXFPOHpveVJsWjN2bTl4ejBL?=
 =?utf-8?B?R1ZRK1pCZUJLcWo2YW1ueUxQMnovSTZFR2VFazluZ3pJNUFhVk50eGRDa0Fh?=
 =?utf-8?B?VHRLTk8ySGl1UHhndTh4aEFXMFhHeTZaaVpKbDJJKzBOd1pPa2tlSGJlbXpw?=
 =?utf-8?B?OVd6QmVnd1prLzFVWnMrZlpCd2MwRG1ZcTh2YUdXZWF4dElPelgyRWF5UnJZ?=
 =?utf-8?B?SHBrREpwbjZkSjU0ZHR0enNQcmdPZ0tyUC9pRnp5bm9uNktQRmZxN28yc3Fm?=
 =?utf-8?B?N2tJS3lZamlzVDU5VWtnemxDUVcxaThFNHNRdlZoK2R1Y1ZTUzV0L3dhY0dL?=
 =?utf-8?B?SEx0ZlBkbndsUWhRYk82UzFTdW53Q244YWVGUlc1YnRSSTBJNS9mbGZYVlFP?=
 =?utf-8?B?VC9BdVBadE9iUFpBbTMyd254S2pCaG1Wc3N2bTB1MWhRcSt2ZGU3cjMwSGxz?=
 =?utf-8?B?Uk1BN0pPdDl6UkxhOW5BMWhrY1FQdGpueW5DYVI4b2RCQnM4aVNmaGpDYWpz?=
 =?utf-8?B?c1I1YkZEZ05JWm9WYzNSWTlHM1pMYmJteVVhVE8wcW9mUnVlaVpNT3RMRERC?=
 =?utf-8?B?NmxMM0xKOU5ZWVJtZWVWWUI4Q2tCY3Z4Z2VwL2hzR0puRndDb2tLVkZ3Rldz?=
 =?utf-8?B?OTVWUDk4M0xRWkdKSGJmOTlKbmZGbktTY1oyelpxbFE4V3Yva2dLWmplNGxv?=
 =?utf-8?B?K2VhdjBQRmFlU3NrWEpTUzIxZ0c2anU3Rml1eXo1YTh5UG9qdk5Gdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BC30F17485F3640979BF0F02F47C001@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a56bb2-ebc5-444e-30ae-08de816e23d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2026 02:05:18.1000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JH+tJsrHw+ukpbNs+6YAKBqRELSkV5yd8OLBRUKEqKitONSlI0bmTAwpbdvBDnse/vgx9Uf2vFwy+VDWOG3FTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6311

T24gRnJpLCAyMDI2LTAzLTEzIGF0IDExOjExICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiArwqDCoMKgwqDCoMKgwqAgaWYgb2Zmc2V0LmlzX25lZ2F0aXZlKCkgew0KPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFcnIoRUlOVkFMKTsNCj4gPiArwqDCoMKgwqDC
oMKgwqAgfQ0KPiANCj4gV29uJ3QgdGhlIGB0cnlfaW50b2AgcmlnaHQgYmVsb3cgYWxzbyByZWpl
Y3QgbmVnYXRpdmUgdmFsdWVzPw0KPiANCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgIGxldCBv
ZmZzZXRfdmFsOiB1c2l6ZSA9ICgqb2Zmc2V0KS50cnlfaW50bygpLm1hcF9lcnIofF98IEVJTlZB
TCk/Ow0KDQpXZWxsLCB5ZXMsIGJ1dCB0aGVyZSdzIGFjdHVhbGx5IGEgYmlnZ2VyIHByb2JsZW0s
IG5vdyB0aGF0IHlvdSBwb2ludCB0aGlzIG91dC4gIElmIHVzaXplIGlzIDMyDQpiaXRzLCB0aGUg
dHJ5X2ludG8oKSBjb3VsZCBmYWlsIGlmICpvZmZzZXQgaXMgdG9vIGxhcmdlLiAgSW4gdGhhdCBj
YXNlLCBpdCBzaG91bGQgcmV0dXJuIE9rKDApDQppbnN0ZWFkIG9mIEVJTlZBTC4NCg0KU28gYWN0
dWFsbHksIHdlIG5lZWQgdG8ga2VlcCB0aGUgaXNfbmVnYXRpdmUoKSBjaGVjaywgYnV0IHNob3Vs
ZCBtb2RpZnkgdGhlIHRyeV9pbnRvKCkgdG8gcmV0dXJuDQpPaygwKSBpbnN0ZWFkIG9mIEVJTlZB
TC4NCg0KbGV0IE9rKG9mZnNldF92YWwpID0gdXNpemU6OnRyeV9mcm9tKCpvZmZzZXQpIGVsc2Ug
ew0KICAgIHJldHVybiBPaygwKTsgIC8vIG9mZnNldCB0b28gbGFyZ2UgZm9yIHVzaXplID0gcGFz
dCBFT0YNCn07DQoNCkFyZSB3ZSBnb2luZyB0byBhc3N1bWUgQ09ORklHXzY0QklUIGZvcmV2ZXIs
IGFuZCBqdXN0IGlnbm9yZSBhbnkgcG9zc2libGUgZXJyb3JzIGlmIHVzaXplIGlzIDMyDQpiaXRz
Pw0K
