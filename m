Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012021.outbound.protection.outlook.com [52.101.48.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D0C311C32
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 16:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776272305; cv=fail; b=N8xkgMCJFKX3k9RyPaAHSs7uh1tRJeGxpEh8LjtNuMDMMiWECUk6YBhHlkQ1yCdkhBnAn3tfcqjvWmgbU1C0LduuijmWoGwxN0JMS3slnfGMTNVU44m5DYBRHkHu5WHy374I8Qfc6ZMaZP4Xo6LRlNajrdze20y5HE13p2wzsH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776272305; c=relaxed/simple;
	bh=KvdOOucNQJQxdokO2KXe7Qnm9DCsQ+ucdvuEca6wTrM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B4XQcmqdIE1DDR8R2Orzmduf6DPOsXAxjvS/omUcs43W4GWHZeOXLe9SliTjH3OYAEO1RIcesgiqVnI0qTleHlZGgeCWXB4MdO+aAGTho+WkG348ND5nLvklVZ0utZSMyig3sz602KWxWVM7oxyDajidxKOWqTjff2ODbX1K+W0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p1xQAUfN; arc=fail smtp.client-ip=52.101.48.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p1xQAUfN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3winVK9qad24J3P5N4kyulAHIYvkz9Q532rzvkuQ9p29QWo0Zn7VhGOYPjK5d5K7iSW27xtPAxpB2aaIf4Vc5Dw003M0iT6GGecSHOVPzK04oG4JfNBPxZsioq+W4gXhVqdBtQXT33oHj0OlhIyAuJ45G8gzmUh2OvzbsD7X1vRF3qCwKMHB8L2u1PTYh9aD4hdKE+50efetwD/UQ7tEXG1vaoPfVdvYWdjMb+kYMbrLD7kW3dVV4t0Sz2bkogxmaS2Guq+5rbiTeCioj9rJd/6L6w+zlTVHSRkVmmdfaZ8NHNDnhRvh0STtFEUkMds6vv93Zluoh8quz8vyVkaww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvdOOucNQJQxdokO2KXe7Qnm9DCsQ+ucdvuEca6wTrM=;
 b=ZdQ0vcFzBf53cavMUsW31NgZDjdolg9MpMqi5Pm398me4QYu2tEquHkANYbYRpqypMDCJKF9yAmCf5C770w63ctts49P78CjJfU5qxGZHJ/vBo8PDNdLNE+fnTM0CqOJ7ReQcz1MyDtK5jsKL8nlVfZXO9Y2PKGwcfy7o7gqcjl+QzT4pWkAXJTOr2c6jWkerst+SnPu2CgJEjXGv6B8MIrhanu80kj5Ec5RMVKhc+tFv0h3N0wsYgmvQ7+wMIODTt5w3YwBqXAh8y9EOS6w9Ahui4+QkNDlucTRb0b8XfkgaK6qWWAh36fY3lCVN5owNsVn2tUaGDb/yj7S+DmkxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvdOOucNQJQxdokO2KXe7Qnm9DCsQ+ucdvuEca6wTrM=;
 b=p1xQAUfNRnf2I7GQ5dQ2JYAr+TCiXHreGQUJb6B+rezs0jfvVs5mL8gXUzf98fdzIDHVQKHyBEOsTBOzgjedqAx99MBF6Tv6TooJP9LIyNwK8qs8vx25DXZC0UIhk3koAymwfohZd+Ru2BVUC7Ka/kHe8C9Rs3JoQJc6/kzFylGVZySRQl2fG0vQeLghdDamSPYUDKknamsGDZToh4HvSEzgvvfJqUKe4cC6qtv0yU/Oxtgp7FzjlCbUidggPiXJwEaQz4lDAot6pI0i3fqOiPoiQNKZrVJq1MOL2xxfAMVvxTBrTdwXVq++hzv5XgFLBWxZvGIccLmYYQiLBvbEZQ==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.49; Wed, 15 Apr
 2026 16:58:21 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 16:58:21 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Joel Fernandes
	<joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] gpu: nova-core: use correct fwsignature for GA100
Thread-Topic: [PATCH v2 1/6] gpu: nova-core: use correct fwsignature for GA100
Thread-Index: AQHczGmU8PjTn6UQBUOkYRoauwHM17XgI3wAgAAyIACAAALYgIAAANYA
Date: Wed, 15 Apr 2026 16:58:21 +0000
Message-ID: <7dc3654ef581d02b678c4a8ca0658bff148d97c3.camel@nvidia.com>
References: <20260414235047.439322-1-ttabi@nvidia.com>
	 <20260414235047.439322-2-ttabi@nvidia.com>
	 <DHTRVSYVZKQ4.O3G9J0M423B4@garyguo.net>
	 <fa185d19ea0e43a55a32af1e76fc1a29534a264a.camel@nvidia.com>
	 <DHTVWYLLMFFM.286A2CN2A13S0@garyguo.net>
In-Reply-To: <DHTVWYLLMFFM.286A2CN2A13S0@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|PH7PR12MB6809:EE_
x-ms-office365-filtering-correlation-id: ef20ffbc-4299-4034-dad0-08de9b10331a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 zSErjTT4O3AVCorv8mrIgy5v1p5M956r1HEzIRhY2Q0AkqfSEslfww/ICSi0nKLevCi9srW/l4ad51iUAYQBbq5k+/uJFkvICl9p1USAdGeATksX0RaaFbxrOOddR+ndzXg6ZPzHI2yLKJ8UDuZNqcbzA+VMWoQBZkMlqNjciuH13QC/je2EmaHStZPQHu8fEYK2h/vWkLkm1Ht0Y+bvUnHJYmRygMKNOt7G5Mac815NLQfNTTm7IH3kTw9UZ1sMar+bt+deNJI1yJTp/1yy3Z+Pm6dF5JTMxB5tPJtXxnZnYKcNK5MecOH1zPHNeBaWLZXAL1O9gUPo2UtjJ0Wv7CZU7rrMoAUzmOhNGZkTRPgkqKM4GKDCL0hUZaQIgttLSOPN3eZJ8QUChU8GLAJ1XzcaeDSqhOiuL8k3vVISo/IWbxZWP/AOY5RlwtdrBdX3RhB1onPzUax0Z2qWvSy+1aAw0iwp+OuT+ql7mOzVQLOBkufCX26hLDyXjcqeSNCuQEJOG3iHSa1TjffalI+QKrEMbxLW7qa8cZdktwVU/aPaOlXNMck2qRyhajmNCXhUiZ1zVoLGBrAGkaLaL5NKcIvCT15vb71ipC07v0/quKK784ejNEq/mS8oAoR5XLGs1LKa0N9I7kVX/3PQVeAQEiOAiG6ORrv1jcwt6ZaZ+usAn9dBbJ3pKc9jmc4reR+tQZRfRkyWn6Q2/cDs6vhMZLX/3FRwtMVpDrrrL9fYjxMQ66FP+q0JUQ8rQBmfaWoe4+gkailUNOwzwFiJW1mPsXEjH7H9msXcw+SZAFoVIbE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0Nzbld4TVZlQ0kwWkdJUkdzU2VMZHd3aG80K3NRUERsS2dWdGlJdXp5UVpa?=
 =?utf-8?B?QjQ5SXJ6YlUxN0JkZmlZMGxXN0FNN2krVXFsUWZkOTJnRmRWbDdFQndYdWdM?=
 =?utf-8?B?K2Y1WkN0REUyamRqRDRrQzF3Rk9OUE5YY0NqWUdIQm9zYTJsVUF5aDRhamxI?=
 =?utf-8?B?NWZrNVVPR0lUbXVjN3UraUw1NVl3Ym95UnJ4L3B1SEt5WlhLczNhTy9pcUQz?=
 =?utf-8?B?aitwRStFSXVFdXlQamxpSlNIWXdDMzVSYkh2T2ExdjZ1eTFRVlRjOGZVa3ZH?=
 =?utf-8?B?UlZYWEtYbHZKTXFQQk9TOWNqSDVkVk1VN1JsZUR3eFVhUFZ0WnBJNTRBZHlv?=
 =?utf-8?B?VmY1S3hEZ0Fld3IvVW9QN1YvWVpXMGdic1ozdDhTSGVUWDNTMU54RWxiK1Qw?=
 =?utf-8?B?ZE5rWmdqYURySE5pSzZyMUc4MnlGVmlOeGx0Uk93ZVpIYUpzbFJ3QjRXeTdD?=
 =?utf-8?B?L1BXQlJhSHNQWXVjbWpNWWJPV0dzSVV5L0xOT3EycTVlZDhCSEpWZmR5UERl?=
 =?utf-8?B?Q3Rab0xHWUV4Wi85QXk3cGp5bk56ZGNqUXJWQ1dGU29ZRTZLVUVlS3p2emxK?=
 =?utf-8?B?Ky9RV1lLVlV0NWloNzBIejRNaVljSThjVEFaVndZbnp4Tkd3aUNLWUZtUmEw?=
 =?utf-8?B?U3dka0UzQkZBQlA4RWdRa1hXRHQ5b3hxa09IVkpZaHcxY214dmFrTFVyZkxa?=
 =?utf-8?B?eWIrWWVKMnFrUUI0L3FOYm5UUitnVE1CclhwbnM4eDFHQnJVOE05eUdqTk8y?=
 =?utf-8?B?UnNUWHBXM3pZQ1B6NnNUNTJVYXdTQ3IwWFYzODA1OUFGcFJkSEtkSTl6TG9r?=
 =?utf-8?B?OWJVcFFmb3dTa2J6a245QWJNU0RDcUtyOE8ybDJFTkpReEVuZEdqVC9TMXhC?=
 =?utf-8?B?QUpFNVRrZ1J1VWxzMWZVblI0Z1A4ZkhZRWJmZUViVzZMcW1mQ1cvUzlPV25q?=
 =?utf-8?B?VUNLKzRubVdqRU9IajEvWHZVM0NUcjFiV3ZPZ2R3RVRZL0JsSkovbDJ6aW4r?=
 =?utf-8?B?Y1c3OVRveE1CcTBqTExSa3NRUVNIbmpDWUxKMHBSVFpkeXVFcXhFTjZMUmRU?=
 =?utf-8?B?SStiWTdkcnlRQUpqaUtLV0wrc3hEaVloYmZSK2doR2pqV0FsNUVnTXB0Qk5p?=
 =?utf-8?B?VXFqczg4bGpHU0ZIdWpWT1FFRmNtaTl6Z0YwczVhNXJZRWpKaDlmaGtva3o5?=
 =?utf-8?B?VVgxYzVZY1o2MnltTlNrcFRRcG5BRjdhb1lEV2JsUmV1bHZwUlhETGNkMzNH?=
 =?utf-8?B?RXQ0dWhCajBHd1VYZUUzZDYxQjRFRDZJMWRGYUdyRk5CTUFuaXVuMHp4YVp0?=
 =?utf-8?B?YnVpQjVYV0FlK0c4TFVzQW5WcHIrVnBMNFREamNlV1pwY1lnSCttNWJaUzFM?=
 =?utf-8?B?Y2htRTdSR2tMZm5ZSkRuMEdXbC9OMTJ5UHZmUEU1bloveVp0ZVI3T3Z5WGM1?=
 =?utf-8?B?SjM0anNRa3lCMkxzcFRCZDFBbDZibWJCcjlScURIb1I1UVZBNzN5dk5aSDVz?=
 =?utf-8?B?VzV4RHEvR1pYZCs0WFNKMG9nbGdEWkhVYm5ZczVTZjB2NjBYUnFRelMwL0I3?=
 =?utf-8?B?TzdyYy9YZXlIVWN2STdrZEVoamVVcTNUYWo3MURUQ2pvWDhsTkNvRk8yQ28v?=
 =?utf-8?B?WlVUcDBISHpuSEVjOTVORmZ3NVZWeGE4dUVTY1BoRml0V0t2WDNKaVh6NHlL?=
 =?utf-8?B?bTBJaGVhUEJ6bmFwaVB2ajhxaHNJM2FhRm9IN3JCa01HMktiWlR6UFdxZzFo?=
 =?utf-8?B?THFJN08vKzlMdWU2clk2SnRNZVIzNU9NTm54VTZzTkpKcmVpQmM2djJlN2t4?=
 =?utf-8?B?M0tPTTF1Wm1FdnZ5dDJWOWhRWUxJclA3SjduWjZkTkFLbW1rYjFiU3VYa3Ju?=
 =?utf-8?B?dkYxaUN1a2Y5Z0RDZ2NKb2tCSzZzS0llS2ZKVXNNcEN0eS91cHA1Y3FaRDJ0?=
 =?utf-8?B?Wmppdzh4VmtCT29aY2xDa0E1SkNiNG4wM0hRMWVaVE90ZURBSCtrNUlkTnp6?=
 =?utf-8?B?eloxVFBHdzZNS1FtREpnL1I1UGNKVkR1dk93dTFCclB2YUFkUGhNUkQra203?=
 =?utf-8?B?K0dQY09XbEhKTkJaMWttVlNSRTBEUUR4K045ZExpalVOWXJ5R3FmcDRNc3k0?=
 =?utf-8?B?R1VkWlV3b3ZRMlJmOThGc21IRGVLNi8xR1o3RFNDNzFnQzVMUHRiZjlxUTQr?=
 =?utf-8?B?WkMyYW5Bd1VNaVRNZ1RZSkRUWi9aVUtIb1VlaEtxeXRUQXl3MDZiL3NXT3Zu?=
 =?utf-8?B?SmlMNjlCVFZLWHhhQjdDR2F2U2U0S2Z5ZGVvWm9LTEw3eEJKL1I0eGlNVHB6?=
 =?utf-8?B?dHdMU1ltbmpJQ1BvVElyeXQyRkdTdEJmNWFFM1NTVEQwdStyVDhzdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8DEDBB63ED16F4AA67EFD30E8FBC6B2@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ef20ffbc-4299-4034-dad0-08de9b10331a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 16:58:21.1889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YDwrbVDXXNaMYXcGfDlSADHY1/cW9yKqJELKtRpxpybYEIGJv471a00ZEDuw9d036i00/q5XEbuFfWeSCYtAig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809

T24gV2VkLCAyMDI2LTA0LTE1IGF0IDE3OjU1ICswMTAwLCBHYXJ5IEd1byB3cm90ZToNCj4gPiBU
aGlzIGlzIHJlbGV2YW50IGJlY2F1c2UgR0ExMDIgZG9lcyBub3QsIGV2ZW4gdGhvdWdoIGJvdGgg
R0ExMDAgYW5kIEdBMTAyIGFyZSBBbXBlcmVzLg0KPiA+IA0KPiA+IEkgY291bGQgd29yZCBpdCBi
ZXR0ZXIsIGJ1dCBpdCdzIGFuIGltcG9ydGFudCBmYWN0b2lkLg0KPiANCj4gSXQncyBhbiBpbXBv
cnRhbnQgZmFjdG9pZCwgYnV0IGl0J3Mgbm90IHJlbGV2YW50IGhlcmUgZm9yIGZ3c2lnbmF0dXJl
LCByaWdodD8NCj4gSXQgZG9lc24ndCB1c2UgYGZ3c2lnbmF0dXJlX3R1Li4uYCBzbyB0aGUgZmFj
dG9pZCBkb2VzIG5vdCBiZWxvbmcgaGVyZS4NCg0KV2VsbCwgbWF5YmUuICBUaGUgcG9pbnQgaXMg
dGhhdCBpZiB5b3Ugd2FudCB0byBmaW5kIG91dCB3aGVyZSB0aGF0IHNpZ25hdHVyZSBhY3R1YWxs
eSBleGlzdHMsDQpldmVuIHRob3VnaCBpdCdzIGFuIEFtcGVyZSwgdGhlIHNpZ25hdHVyZSBleGlz
dHMgaW4gVHVyaW5nJ3MgZmlybXdhcmUgZmlsZS4NCg==
