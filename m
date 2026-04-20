Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012003.outbound.protection.outlook.com [40.93.195.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BB439934A
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Apr 2026 21:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776719715; cv=fail; b=VPZ1bQDFHWXorOnVE02yKeS72p0RIZLpljutPpEp0gLGYj0ia9Md1+4JsC8d5UgSW0HaOJwyQrQc/QA3/tOyYIJdvdF1xJV4sU03mNsnNVJBD3Kw6QLohA09f9EIHNbb/1dHj9thLUjtl58rYHYyyLKcYfvhr0Ox61YWYRkfr84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776719715; c=relaxed/simple;
	bh=MXIKCZJ3/gUMcA5g4YpAnKxu7Yz0+Gf9ZKi2j8CKCTw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Epqaw3nm3yw8z0Ej854Mff2HRy/NwQzk9ZB2v189n+bzU+nGGIVhtx+9nUtV20/cmI4DpMrts8xwaJXJOatxyKDKyNIbn922ul2tfTEfV5dfZdSdpSGmn32rINqBPQxincAR7GkwDyqteHH/qhQ1eFUCCCZLEJ/vL4wI3J5AyoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cgIQadgz; arc=fail smtp.client-ip=40.93.195.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cgIQadgz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oy9je0OAkCqgyM9x17xoDK0GDu/CzFFSGWH6U7GQD4ES2Ko9iD3Ox2O5fYx8cNOUFxzoNcjBjxC8vLIXjaw+jIdMyJNEak1Ks1LgoX6vSKNUN2QU7gBAN/nHwgqcp18IBC7VVAdHfR/jgdrRWg8U646/x41FuJWkRkb5AOk+Vkh/OdBWflTK+wLvs8eQMq+RQu7DW476EPOMhdUEhWIKhb6IST1K0ajesG6sipVIasVag5ZY+BORa9Mc/kWEsKofotttRMFqNK8SfKOXhmsW2Jyasobm/gO/6MhziQxeJOvxf5kuKbZeNcN9rHUz3LmvJI857LluZ285He/QRPo07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXIKCZJ3/gUMcA5g4YpAnKxu7Yz0+Gf9ZKi2j8CKCTw=;
 b=lVcnztR0RBqFA6B5mERnDVWYoPG2x+QcUfo5lg1EaSoQAaIl/KZ6td1sP9y4gdMM7oBw28Zb1TuVy3MBr9D6cVzyty+UHS39Z1lp9eV5wUqoq5YTtlL2RMtxMDxs1PZnLyKtIJRRiH/QbWJInP2qrL8Uyt35HEzeLV8LUE5s0aX4nuayyWedbxs8yEmz69kW6s+m4gonRpDNHoTpFqdpDgS87NpZAy4j6GL+5V3hyZDhjIVIhVggOwWLhc9pwEUYnGj3yO3LOR/hJfg4kdcjLCHejngqqOVXgGsutsdoxAY4gAfdGTTcKMjn0a5i8XpjiPsWsgawTtFzRn5IoRDzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXIKCZJ3/gUMcA5g4YpAnKxu7Yz0+Gf9ZKi2j8CKCTw=;
 b=cgIQadgzg1c85xmFDsiEEpwZHSxN3Eh4UsnnbbFtW3HeDrDekKE4zuswzMWDfhv5Pit2R7WAgjtFrX5hkfoUeZP9idJepNgyRAN0FdpSDc3w+U+D5jVHslNhwnxlLZ6VuqUzmNJ3cS/PebadKiQW7qF7gEJ2cDd7ttWji4eHGcyBD755vqVF7SLQ11s4B3BYfa/R2ueWo2aN9oKcZzujXsNGE3gJKaTE6C+dPjgvgBmcfV55rlYme1Yuy3HmXGlNBxMUJEjygiq2YPzV9v1axXq5meKFNxaZVVoNkHlx4kzULCydn789R/XiBXqSsZWcOJCNx5iaJY+lcEVsYeSuQg==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by SA3PR12MB9090.namprd12.prod.outlook.com (2603:10b6:806:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 21:15:09 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 21:15:09 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>
CC: Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
Thread-Topic: [PATCH v5 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
Thread-Index:
 AQHczp5w/ypavRL09UO9Q6M6pTcTvLXmzVgAgABfagCAAJVcgIAAKVAAgABT3QCAACuvgIAADVAA
Date: Mon, 20 Apr 2026 21:15:09 +0000
Message-ID: <a6bdeca9dd144a50cb59169f20833c1dc70ea700.camel@nvidia.com>
References: <20260417191359.1307434-1-ttabi@nvidia.com>
	 <20260417191359.1307434-5-ttabi@nvidia.com>
	 <DHXE2MBVLV2S.3AUM31VR2XC0D@garyguo.net>
	 <DHXLC2ZLHLWG.1Z3SQHOEYMYH3@nvidia.com>
	 <DHXWPED46OYC.U21Z21V0PM3C@garyguo.net>
	 <DHXZULC2O3CE.2PNA9P12ZPC2B@nvidia.com>
	 <a2bb46f8cb312643ea5997ab4b58042850554a0c.camel@nvidia.com>
	 <DHY9K4KOTNP3.1DU2132JVNLJU@garyguo.net>
In-Reply-To: <DHY9K4KOTNP3.1DU2132JVNLJU@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|SA3PR12MB9090:EE_
x-ms-office365-filtering-correlation-id: 9ed5fb06-c19b-4a83-7158-08de9f21e731
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|18096099003|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 6hPO+EJraSk4EU4KY3KNb7qqnU3xMOOA3g33q9rfgP78E9xcPerSVh+T/ZuiqecMH6DcciBTfAlXq/zSYaNpAIEtf8eUk4pdrjcVBxWRVrD05c7llD6y1K+tIExnaJP6BIPddVe7p5Py+0MxMR55LZsU1qET8HUNDTodC+Ulm20Hd+ZJKVkrvON77Z5cPwPQyinR1Vu5LLiE9SrY/Z8WyjC+dmi4lP4IVDRWey4G3mmHRKxlr7QnlLngwDvJrdbJEv/fZ6IB18BBdIE6sRCftYV/Arpzaxcv8YKbJqLDDkV0cMuntk8ocAS1J6lXJXIBlZxHKhyYtWnqfPDBxK70ciUStyr9Qzzvh6Dg4vhNuqns32mp8fPW440pyhAx2hM9Uab3NtYLPB2fEGSMf+qul9AqF0UC2HNUsVshuCngciHDRUhVy4kE3DxRc1C6BXXKkvx7B6JZn8ppFVOvqvIv4Cpp5x51EkgJ+j2/96nP/5D1txSUjvIE8/eUw4yXkZqyhy3T9soikg5J8gLu4i6RaMjSbR9XTjG1Xbw5KlP5Qeu1pkzsXcJ/71O8NNnsdJ0vgGdGifQeLxmfN+a/b9cJky3soxS+PmssSKBKaYVuRdWvV2MOxh6F4q2rH3ajQ5IU3cpYf8/6Dh/kSSryDWddksoxw0JwwQdWg1njwOrDgxT/SBQcSD2NLYJgx57PDzd2Zr8CSsZ6evwG2F9BfP9cA4aJvzvs+VtcxulEriQkMLR+hcLw5cPkTuoOUlzguzRoCwVCuUAMGApr8oBIFHpyqIsgpOLIGExU35UYKAUKIqY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18096099003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFZoVXJnNmJvVXJDZjdkekNhT3JMeTAxRjlwUk4wN05QZ0VwRVhxS05OeE5O?=
 =?utf-8?B?OEJCL1FoMUUzakNBZ2NvRUR1WldrN0lHT3I2S1A0c0llekJsUGZVNUZIQVgy?=
 =?utf-8?B?QXVUN0lVS2h1ZjQ2Z3JHTDVmTytCU0NldnhnL21VcWhCR3ZpVXFIUXdDSkZP?=
 =?utf-8?B?Y1VqVkxVeWZ1NkFZSUJCS3ZUQ1FmQ1lMWEQwUUdKMXZ3SGwvL28xUzFIdGlF?=
 =?utf-8?B?cVE2MnVlVVZlK3ZhUlN4WWpsWmVjK1prU3Nmck9PQ2t3TjRkWjRHMlh3ZTdI?=
 =?utf-8?B?Q0plcm1Xd21TWlpjZ3RCWFpvTkNBV0U5VTBsMXMrSnJmVW9QTmd1OExnTEVh?=
 =?utf-8?B?YW9ML1luZ3RSYU9uSHh6aTIxT2l2WjNxMkE1RzFkUk05T1NYbWVJV09sVzZk?=
 =?utf-8?B?eDZUUVZadW5qSW1uSkZWVDlQc24wdEVlWUtTNjBZM3R0TGNkODJydXMvSm51?=
 =?utf-8?B?MkoxQ1pXU2p6ejdpdmxVR2oxbzJOM25SQ1pLN2xuTURVbnlBRUkxNzh2NS9C?=
 =?utf-8?B?dktyeVArTjA2bW94aTJoQjJCZlVDeTRIN3ZWNDh6QjBTUnE1UXBRNlNVWnZL?=
 =?utf-8?B?THo3cEdGMTM2NjlFTEpGVDd4eUZwOStjdGlEN1ZnQ0tzMXpXYWNlTUxzTHBJ?=
 =?utf-8?B?Yjdoa1piUlBEaTZ6TjdCZlRiTHhnd0R1VVU5Y1g3WnF4cCttbjdCQjZLUHhl?=
 =?utf-8?B?ZitKRVVMc0VwOEw2eXQ0UFVRSWRWdmNNZ3dhWTlVQ05ISnpKNk9leVBJaWVW?=
 =?utf-8?B?MTBBWC9XNFAvVGJwaDdIYzZpKzkwMmZ4aFRFNUIweEpVMUxoc09MN0I3VFlw?=
 =?utf-8?B?RDlCclRKZmx0RjN2TSthUDJGQnU4bDlSVDVDajEzRnZETi82S00rQlFSc3hw?=
 =?utf-8?B?c0ZGdFdEdy85c3VueUdTU1Fnc1Z3V2NGZEMxREtQUXdpMmlDd0VmSzRMUHlz?=
 =?utf-8?B?SFZMT05kblJoYkZFc2J6bHFocjlXbWpxS0VaNnpSa0hsZVYvRUV5a2gyQ3Q3?=
 =?utf-8?B?RTFBTzNvbmJLTTd3YVEveDZwMkZZYk1Ra1RtUDJheDE0dndMUjhtZkl2SXI5?=
 =?utf-8?B?ZDJYU2JQeHdsMkZKNU01TkQyckZvZjlFbjhIQWp3UnJPNUd4aUxHTlJpWnpn?=
 =?utf-8?B?S090OGJFWDFnMGRlTHlrOTIyV2R4UWpRSkVRSGwyWmtqQXh2MGxEblFEMUpj?=
 =?utf-8?B?QVZhdm1EQzNzQ0lpU09WcHN2Wm9ZeDQrdmt1dVppNEZpMC96am1yTTlOYXFE?=
 =?utf-8?B?RDVnV3lwNlV5bEptOEM3SFd5a3RQM1Rpdkd2UE5MRUYyZjNQSHZMaDJpLzh3?=
 =?utf-8?B?YUFhWE12eW9ONWJaTWFDcUJGR3RYOFpkMEpVT05TVXkvYjluY3hoaXhKa3BF?=
 =?utf-8?B?S1hxYjhPYU5sRkpFR0o5QUxtcEZrMWhsbHFCQ05MMHhzb2RILzBUeTZPd2Fn?=
 =?utf-8?B?Q05zTmZ0NXhzSG5Qb3A1NjA2bkxxUllpZUpSVUFBd3V5K2pPNnR6alFvWWc0?=
 =?utf-8?B?SUpSekZXblVpN0phTGdhYUFZTFA1WHNVR2YvWG9oN3I3dXpLRkFMYlIvTGI0?=
 =?utf-8?B?RG5LV1hxdSt4L2wxN1piVU1ZMzVlK3dxRmhjRjljNUR0U2h5VFZ3ZFoxUnpV?=
 =?utf-8?B?Z3ZhdWVoNURXazlVd3NDYXRZM0FTYUU5Z1FNbmpvL1ZEa2M4TksvdER2aTdY?=
 =?utf-8?B?eTdVZDJERXZ1cnJzRmoxaGhUcUV2d0wwNkJWcTJPaEdtZS9XNkxoN2taV1JQ?=
 =?utf-8?B?elpvb2ZjdVVyRWw1QVc1OHNjVUhKRXY0OTd2c0JMTXlQYVRJWUJ6WkFiblhU?=
 =?utf-8?B?VmRleGRMVVVvMkVtaCsySVRFUVZzZzcxSFNIdGx5VDlTR2g4eDA3T0FBTHpN?=
 =?utf-8?B?QXJDK09vRU5EejdXMFZZMkNBdW5ySjFuOTBnTTdVN0VxeU9maktCL2pzTG43?=
 =?utf-8?B?ZDh6dks1SDFUVXZQRmlkK01ZVmRpZDlScnhlYlZ0S1llUnRucjdFV2pVWmdC?=
 =?utf-8?B?eEpjV2lNcnoyc2ZhTE9lVGtuN1BRWE91S2RYcXBuNlV1MDBFZ2VFeTRKbVhS?=
 =?utf-8?B?R3NWNVhSQlVhejJyYkFqc3lLQnMwTFR4T0dMVFlHMU9YeDRLSGViQnMyYXk0?=
 =?utf-8?B?NWhkYmdjQ1hFRHRBNzJ5R3VVMUFoNHZIeGI0RWZ5NlFxNUw1UFZHTU40UWRY?=
 =?utf-8?B?dHNjam1ISnQwZFNwWmRDVFNVeEpOYjYwWGFqZndhTmltNTBidUs3OVRsWnBX?=
 =?utf-8?B?NkVRaFpxc002TTVucVlFQTV1QmkrSHgrM20vb0VBS0h1R1N3eCtPeEJTSHhv?=
 =?utf-8?B?R21Ycm1RTEg4WCtpdkQ5SWRoUzlRVGhic0lFTDJUdVJGOElPUStGQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C413402F952FDB4087D4415F42114C79@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed5fb06-c19b-4a83-7158-08de9f21e731
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 21:15:09.4614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7K95Zb6vIUrOeKjKSNkldoKLfxb+qFNU8LCUot663fmBXadsmXCJwI0GqHucIQnGq1b5GxZf2uc9rwN/Xbo9ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9090

T24gTW9uLCAyMDI2LTA0LTIwIGF0IDIxOjI3ICswMTAwLCBHYXJ5IEd1byB3cm90ZToNCj4gDQo+
IEFoLCBJIHNlZSwgc28gdGhpcyBpcyB3aGF0IHRoZSAic3VwcG9ydHNfZGlzcGxheSIgcmVmZXJz
IHRvIGluIHRoZSBjb21taXQNCj4gbWVzc2FnZT8NCg0KS2luZGEuICBJdCByZWZlcnMgdG8gdGhp
cyBGYkhhbCBmdW5jdGlvbjoNCg0KICAgIC8vLyBSZXR1cm5zIGB0cnVlYCBpcyBkaXNwbGF5IGlz
IHN1cHBvcnRlZC4NCiAgICBmbiBzdXBwb3J0c19kaXNwbGF5KCZzZWxmLCBiYXI6ICZCYXIwKSAt
PiBib29sOw0KDQpJdCByZWFkcyBhbiBhcmNoLXNwZWNpZmljIHJlZ2lzdGVyIHRvIGRldGVybWlu
ZSB3aGV0aGVyIGRpc3BsYXkgaXMgInN1cHBvcnRlZCIuICBUaGVyZSBpcyBubw0KcmVnaXN0ZXIg
dGhhdCB0ZWxscyB1cyAibmVlZHMgRlJUUyIsIGFuZCBzbyB0aGF0J3Mgd2h5IGZydHNfc2l6ZSgp
IGV4aXN0cy4NCg0KPiA+IFNvIEkgZ3Vlc3Mgd2hhdCBJJ20gcmVhbGx5IHRyeWluZyB0byBzYXkg
aXMgdGhhdCBJJ3ZlIGRvbmUgYSBsb3Qgb2YgcmVzZWFyY2ggaW50byBob3cgdGhpcyBjb2RlDQo+
ID4gd29ya3MsIGFuZCBpdCdzIHdyaXR0ZW4gdGhlIHdheSBJIHdyb3RlIGl0IGZvciBhIHJlYXNv
bi4NCj4gPiANCj4gPiBBcyBmb3IgdXNpbmcgYSBUcmFpdCB0byBkZWZpbmUgYSBkZWZhdWx0IHZh
bHVlIHRoYXQgaXMganVzdCBvdmVycmlkZGVuIGJ5IEdBMTAwLCB0aGF0IHdvdWxkIGJlDQo+ID4g
b2theSwNCj4gPiBidXQgaXQgd291bGRuJ3QgYmUgYW55IGNsZWFyZXIgb3IgbW9yZSBhY2N1cmF0
ZS4NCj4gPiANCj4gPiBJIHBlcnNvbmFsbHkgZG9uJ3QgbGlrZSBgc3VwZXI6OnR1MTAyOjpmcnRz
X3NpemVfdHUxMDIoKWAgYW5kIEkgdGhpbmsgYm90aCB0dTEwMjo6ZnJ0c19zaXplKCkNCj4gPiBh
bmQNCj4gPiBnYTEwMjo6ZnJ0c19zaXplKCkgc2hvdWxkIGp1c3QgcmV0dXJuIHU2NDo6U1pfMU0s
IGJ1dCBJIGRvbid0IGNhcmUgZW5vdWdoIHRvIG1ha2UgYSBzdGluayBhYm91dA0KPiA+IGl0Lg0K
PiANCj4gVGhhbmtzLCB0aGF0J3MgYSB2ZXJ5IGdvb2QgZXhwbGFuYXRpb24gaG93IHRoZSByZWFz
b24gdGhlIGNvZGUgaXMgd3JpdHRlbiBhcyBpcy4NCj4gV2l0aCB0aGUgaW5mb3JtYXRpb24gYWJv
dmUsIEknbSBoYXBweSB3aXRoIGN1cnJlbnQgYXBwcm9hY2guDQo+IA0KPiBBY2tlZC1ieTogR2Fy
eSBHdW8gPGdhcnlAZ2FyeWd1by5uZXQ+DQoNClRoYW5rcy4NCg0KPiBJIHRoaW5rIGl0J3MgaW1w
b3J0YW50IHRvIG5vdGUgdGhhdCBub3QgYWxsIG9mIHVzIGhhdmUga25vd2xlZGdlIChvciBldmVu
DQo+IGFjY2VzcykgdG8gc29tZSBvZiB0aGUgY29udGV4dCB0aGF0IHlvdSBoYXZlLCBzbyBzb21l
dGhpbmcgdGhhdCBtYXkgc2VlbSBvYnZpb3VzDQo+IHRvIHlvdSBjb3VsZCByZXF1aXJlIHNvbWUg
YWRkaXRpb25hbCBiYWNrZ3JvdW5kIG9yIHJlYXNvbnMgdG8gYmUgYWRkZWQgaW4gY29tbWl0DQo+
IG1lc3NhZ2Ugb3IgY29tbWVudC4NCg0KVW5mb3J0dW5hdGVseSwgdGhlIHByb2Nlc3MgdG8gYm9v
dCBHU1AtUk0gaXMgc28gY29udm9sdXRlZCB0aGF0IGl0J3Mgbm90IHJlYWxseSBwb3NzaWJsZSB0
byBkb2N1bWVudA0KZXZlcnl0aGluZyBwdWJsaWNseS4gIEEgbG90IG9mIGl0IGp1c3QgcG9ydGlu
ZyBPcGVuUk0gKGFuZCB0byBzb21lIGRlZ3JlZSBOb3V2ZWF1KSB0byBSdXN0IGFuZA0Kc2F5aW5n
ICJXZWxsLCB0aGlzIGlzIGhvdyBpdCBpcyIuICBJbiBmYWN0LCBpdCdzIG11Y2ggZWFzaWVyIHRv
IG1pbWljIE9wZW5STSB0aGFuIGl0IGlzIHRvIGFjdHVhbGx5DQpyZWFkIHRoZSBpbnRlcm5hbCBk
b2N1bWVudGF0aW9uIHRvIGZpZ3VyZSBvdXQgd2hhdCB0byBkby4NCg0KPiBBbHNvLCBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2UgeW91IG1lbnRpb25lZA0KPiANCj4gPiBJbnRyb2R1Y2UgRmJIYWwgbWV0
aG9kIGZydHNfc2l6ZSgpIHRvIHJldHVybiB0aGUgc2l6ZSBvZiB0aGUgRlJUUw0KPiA+IHdpbmRv
dy7CoCBHQTEwMCBpcyBhIHNwZWNpYWwgY2FzZSBpbiB0aGF0IHRoZXJlIGlzIG5vIEZSVFMsIGFu
ZCBzbw0KPiA+IHRoZSBzaXplIG11c3QgYmUgc2V0IHRvIDAuDQo+IA0KPiBhbmQgdGhpcyBwcm9i
YWJseSBzaG91bGQgYmUgY29ycmVjdGVkLg0KDQpVZ2gsIEkgdGhvdWdodCBJIGNhdWdodCBhbGwg
b2YgdGhlc2UuDQoNCkFsZXgsIGlmIHlvdSB3b3VsZG4ndCBtaW5kLCBjaGFuZ2UgdGhhdCBsYXN0
IHNlbnRlbmNlIHRvOg0KDQoiR0ExMDAgaXMgYSBzcGVjaWFsIGNhc2UgaW4gdGhhdCBhbHRob3Vn
aCB0aGVyZSBpcyBhbiBGUlRTLCBpdHMgc2l6ZSBtdXN0IGFyYml0cmFyaWx5IGJlIHNldCB0byAw
LiINCg0KDQpJZiB5b3UgdXBkYXRlIHRvIHRoZSBsYXRlc3QgZ2l0LCB5b3UgY2FuIHVzZSB0aGUg
bmV3ICJnaXQgaGlzdG9yeSIgY29tbWFuZDoNCmh0dHBzOi8vZ2l0aHViLmJsb2cvb3Blbi1zb3Vy
Y2UvZ2l0L2hpZ2hsaWdodHMtZnJvbS1naXQtMi01NC8NCg==
