Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012042.outbound.protection.outlook.com [52.101.48.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B8E396567
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 17:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776272466; cv=fail; b=C/sG9DB+mi7++vHd6wWRvty56+rfQzmk6mo1gTm4wIrZFz6bGqUKoUpsqjFVtDY8+85WXLMYuFTKXsJ03EI0fQ0S5yAtnvaQrtfTPXrDZBEecirDxrT/gAg1PF0LjM4CzSaPUdnUyQ0xy5TShiU2UyXPsB4Y98OfjSoCqhqJmJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776272466; c=relaxed/simple;
	bh=wegXJOyxo9yNdqqXDP0+JiSq/+T196FY3jQNN8IgBeY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tdNB8Np5sM4+UqDzw2oeTkI35i/GOiG2+1fagPzsHDE2rr28G2OUoSPws9jL6toGt8PiUvnJjx81nAym0D9ahhOxeJL3vGUl1gQFOqcmSoZfKwYI+wBfzHVYgTsO9Sh3ng8T4Ichuug4UkxkrY1uDiFLqwz7Dklx5lsvpT0O7Mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HJsTAomE; arc=fail smtp.client-ip=52.101.48.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HJsTAomE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwfBx2+sSUsjja/vP4PvZKUNMmmJqWyzDQYNnFGOEVZpmNuJ695kUTFh/h/61DTEJ+bKzxCx2B0JVa68EA1q7855Re9ZexaYYWAXC8S5Zs9GzqHBuECIutAw6Z8XUtt/Xa5dnpLozTyUyat/reEogszYRikP3UDBy5DlhvFbwqbXaCzENkbqVACG+qWZCd6wAtDPCgNAoULSMYf6mXrwXKHh9OtvLkKL/WlsGw4OHpWdkQOImBhsgK5I/IMyl9ITlYEtTgaERw2+OIdU6hS7wTyg2HJfOWkiIY/C8IDJv+R3DSYboLpPISbbs0ERONBzOVfoxrxgdm42SyynjsBe+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wegXJOyxo9yNdqqXDP0+JiSq/+T196FY3jQNN8IgBeY=;
 b=VpgEIh59/fmOeIrI4TLx7JJV3aaUbgUUVr23wt5gex6W51DPpRZXAQ33z2IogQsyb67YXUt+RJn7T6TTccvjNk2q1eyXXpJq1GqJgQXhhFbEH14Rj171gwKST0u+fNFXwCgyqCgyyP5Bg+jPmQ1HUseS1QTPHcMxJBJW9aBBieArT3SHEJ12Y5HZIdzqFQH3LoC+RK21XKnX7ZMjaLdj5dKAbQp5mDxtF78I7bwLPz/Z+ncxRlnNKUmg0i5I19HDHza6/PNSe27rC4oOa4WxdevpN1tyRqiIFU3T9w6ryHfPDORGpiX0LIJ90HvKCEOFaXXrq4399lsqka54oqaBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wegXJOyxo9yNdqqXDP0+JiSq/+T196FY3jQNN8IgBeY=;
 b=HJsTAomEbLXMg+Rlh33Ojivdujox+lO1t+j39V+4GeY4MWYUmT20uys/Gur5quBm5sByRZ3JL0Y4IIevtKIUbm+06jIgwQ8I5jnt5tEnEBPXcKfm2Q0b38Q+VQ/aF8l6rw6sgeQOQDr6FgmicQtNiTbJp4Qr/ZeQ6vcRjZEAKVauBclm9/wS4R/9O7tXMwrmo84gq3YGYW6Dt3xytKWusA6n8bbKz0jT/vmS5c7Rr7cDZuO491yuxNWRbPsXDdvCAGzCxXaWaErnRQW9+OqHLD5B0E9nrfyKtA1lQnpvBECsGh/XvsVoJL765m0rEjOgJ1+LUmJPhYpRku0JnM8dMg==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.49; Wed, 15 Apr
 2026 17:01:02 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 17:01:02 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Joel Fernandes
	<joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] gpu: nova-core: enable GA100
Thread-Topic: [PATCH v2 6/6] gpu: nova-core: enable GA100
Thread-Index: AQHczGmX8OIF/E7TpEObeLD+qZxj6rXgJPmAgAAwI4CAAARUAIAAAJsA
Date: Wed, 15 Apr 2026 17:01:01 +0000
Message-ID: <7c50101614474975f7a18c255f37bd7adddbb521.camel@nvidia.com>
References: <20260414235047.439322-1-ttabi@nvidia.com>
	 <20260414235047.439322-7-ttabi@nvidia.com>
	 <DHTRZVKNN3TP.1NALV3Q9B6GPY@garyguo.net>
	 <ec32b84b55ddaa91e347d8152b10f9fcd53a46b2.camel@nvidia.com>
	 <DHTVZNMKLJ9Y.1WSQK2H2JC6I1@garyguo.net>
In-Reply-To: <DHTVZNMKLJ9Y.1WSQK2H2JC6I1@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|PH7PR12MB6809:EE_
x-ms-office365-filtering-correlation-id: 637c2dc4-95e5-4e69-7a7e-08de9b1092eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 QX/a2H3VQ5soRiCKea4K6RL/aRjuTV7hqA9044NrVsieUc1ixP7nStiX2hKsGN+hqMfrC8vKXk0ykL+AKqaOA6WLyhf6VPeE53rlJQwdpUIHVvNiL9mfYie1YzzwkK8+X/qDfqbrT8HACD6EVaPpP7/Qz6PYfWZvRCC+vMZxgUB7X5eB5Tg7Ua0tOdhlBG85o+WQ1pE2KTZLKpQOVbi0Mvg/Qr68XNr+DByQ/ge2Y1SiGLJZfKHrJIdbU/NntAJnbheRyehmUJ5VsVGfJAkK2Mx6zv9tZYyFPizSgt5qyBK0n26ZZ2uzSIAd6cKhd3nu4OwRQYgmA9oiD2drxwmfUVsrUq72kDpE0qucNDcYOq2qupt1jh67wf7rrhn4W0slQamvbz2RH9fYG5U1QTks5vGVVYdv+EnL8R0zwMBB+OMvFrUOF2ciyYKP919H1sYjk5Fwzz7BG8Ad5pf8vt23/4F6axSfhPb15w2AmjFWQRBA6UtvPewnkpcgXHiMVLzgWZ0+fbPT+kS96XS6BavrKM/fU/013P/XMx3oRFdYqvcshNwPiR6OYKu4uxquZEnlQzKp3q3NdKO9jH0XVQDTaBwNYRWH5KH/0+HXbE8dsj9p2lvBzCbJgJJiCGpl7gJOygsfi7+H//H3qBgtjYWbg5XiDbkNif0rAfxcZzXiE5v++J//JrL95GxVTz6CtJg4oyEU53i+bv4OqC74tRp304S3ygNezd4bLJqNO0y6vdRQcv8eZeCaHSvAldT/qzWYSA7H280gLE8nvlwcqpvUdJLdOWQYxe1TcwmtB8CdoWk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OUlUNEEzTkFWQ1pJT1BPektJZTVQc3RydU5RajRhTElqait4dm1JdjY0aUdt?=
 =?utf-8?B?N3FNNWI2WVdJcEJGSWQ2SDhkaTZtOHczdUk0Z1ZkWFVRMUpOdEVMUUxqREJk?=
 =?utf-8?B?bnRMK2NIZVF3SUJTZ25Bb2pNTlNQbXpVS0hjNkZ5dDB1RmlFL0RUeDB6S3NJ?=
 =?utf-8?B?ZjZneWcvNlkxdnhCWDQ5VGt4Q3ZPTklmZFF5OHMrZk5NSmVzUHRTUkV5ZERt?=
 =?utf-8?B?SzAwckg5Y0QyaGQ0OGE2NlAwNk9Td0V5aVpsK29LMER5T0VyNUR5MjFwTHFW?=
 =?utf-8?B?TUhEemJnblI0aEgxNTB6ZU8vV2lXZ2ZEVzhqVmhVSndOVWpkNTRrSUNCVnZo?=
 =?utf-8?B?Y2RiM1VlbDQwNVEwTkxYMVk4bm44TWV1RlliaFNFSldCMytzeS9qWHF6UTNn?=
 =?utf-8?B?RW1nc3VKWFg4cWpBQ0FnMk1RSE5OZUhZQ01ON0VxS3laSVBXdzJsOGViMUJS?=
 =?utf-8?B?b1M2RWhGWjZaWjlBUVpKQzM3dlFkOU1TVHNTVEFwZUFnOTZwUk5WK1ZkRms3?=
 =?utf-8?B?VmtYNjYxSVpORVo3RVBYcDYwSy9qQWI3YTF0QmFFbzNIUFNCVG1pNFQ5QWtq?=
 =?utf-8?B?bC9XdDduSDFUMHhReERUczB1bkh5cWQ3ZVBvYnNMSTU0NUVxM1BMQUtRZ1h1?=
 =?utf-8?B?S3o0djBHSTdWYS80aGZxTnhLQWlwNGR6dkRRQ0pmcU1MS2xUVkYxTHZPWm15?=
 =?utf-8?B?OVVvVXExV0h1VnR0SE15TGU0QVpScGdYNlEwR1lVU01LSHlTNVVnNDNuNDZa?=
 =?utf-8?B?RjJzY2w0R2ZOYWNJbW9mbFVpd0lTNWx5WFpBNEdIbVMvK0ZCZlJBYkxLNXhW?=
 =?utf-8?B?a2RoNUdvYi9LWElPelFRVTRBbHB1TFk4d01Td3AwZVk4SnNyQjV2SGNWbGl4?=
 =?utf-8?B?NXBMaXVOVGdLMWFVbk1IN2RIT3BPUkpITHh3OG1DdUtrZVFRc1dGdStNUytZ?=
 =?utf-8?B?TXg4Tm5XQkJRTnRGbE1abTY1UkZBRG9Xd3EzVElHVHJuNHJ3ckxKdkpHb2dr?=
 =?utf-8?B?WWhPTENINW1vcVZhZmdwMzVreWtSRU40Y3RmUjMyTEt3MWl2R2dDalFyMFl5?=
 =?utf-8?B?WTZuakQvcFVjMjZNekZDUTBzN1Zrb3RKcjZaR1E3aHNqNFl5TkFHdGR1K0xP?=
 =?utf-8?B?M3FRZEJwemxLNWFubWJhK2FFNjR6QUxqQUcrM0pTS1dhUFFZcVVyV0JKclpU?=
 =?utf-8?B?NXNrMktIYkpMYnpnZlpNMlJCcnRheTFxZEI0cngreS93WTZFMXFTR2Vycjc0?=
 =?utf-8?B?dXNVb00wVmFEdHlrdE9FaGV6eUR5aTVWb1p0Zm05cUgrWnozdVVWL3NRZ2dm?=
 =?utf-8?B?UHhjWm1nY2RoZ0VjUFkwRUVvUUlXb01EZXVOdEtGcnE0aUVOeDdsOURqeWRS?=
 =?utf-8?B?bVpPb0lQWlBRNWVtTHpHRThNd3I4Qnl0aTJzamxhNXd6Q2pHSUJLNTJtR3d3?=
 =?utf-8?B?STgxOGFkUUZsTFNIenRMdlgwN3JkcVR4UnR5YkxuY1FXRFRmbE9YeXJZZVBr?=
 =?utf-8?B?K2dEZnRQRjhTVThhZjlNWWI4OWw0MVUybmN4NERXOCtRbFloT2V2MlZlOVFx?=
 =?utf-8?B?UmxsMmZhRlVJZHZjKzBZVjZwcnVXenN6OXh5czZiVTJuZk5RdXVQRjgzQzg1?=
 =?utf-8?B?VFJidnVXL09GYTJ3UVlNSTB6bUR4MVdTa29obU51V1FvNjZQc2tVMHJBY3Qr?=
 =?utf-8?B?V2NrSkpYeGhuWjA1QUhzNXBHa05ERm13WGh4Wk9zOWduMEY4cUFDcTlGbWJx?=
 =?utf-8?B?UDFjTWJOWDVObXIvajhrVVhUV1RDVldMdmR1bTZib3B2MlZXTk5yZDc1UWI1?=
 =?utf-8?B?cTRxWWFPZ1EzTUx2RXR3OU5mdnVBa1VScmZzcWhOOTc4UU5ReW5iUStWak1M?=
 =?utf-8?B?NEo2Q2s2NmxrbWRqMHJHdjNyL1VxcndoUmVHUkFBTm5mMXFranNjdzNDY0NJ?=
 =?utf-8?B?Q2g2eFV1dXRuSjhWRXhoS3dRQ3Zrcm5Vbmgwb0dhNk42b1B1azBrMnFwMkpE?=
 =?utf-8?B?dE83T2M3eXVBU0NaMTdXbWhYM0w0Wm9wOXRIQnp0QXE2YjB3YjViSHBWd3pV?=
 =?utf-8?B?b1EyMDVaTnpGS3UvelpTQ2Mra0h3blgwME11UDlMazREcDNFUGxIRGdIODgw?=
 =?utf-8?B?RWtRMHJEN2s5dVF6VjJOajFrTkFvOXE2d2RjTVozT1lRUFFMQ3RCanNoZHRB?=
 =?utf-8?B?QmVJbU5Pa2VsM3dIZHMxZW5md0hCdUs0WHRVK1o3R0p3TXI2OFpTUVpNVFJz?=
 =?utf-8?B?eDgwZllMTWpYUUtITDNWM2hTMENFNWNpOTc5ZFM1SGJEazdDMDB0QUlwV1JS?=
 =?utf-8?B?TStxRXErZUVlMFU3Q0gzdjd1UUhwK2R1T05rbzVLQ0ROd002djg0QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA2CFEAD77622C438D4D677C20DD5327@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 637c2dc4-95e5-4e69-7a7e-08de9b1092eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 17:01:01.9754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jEpekc0rNz2Wh2Fke+4phoHK3/5ZvUTeWEoizf3C0YuApZp1ED4/btuRxk57EiyzVYyzn8rVb9R1aU7RhjQsYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809

T24gV2VkLCAyMDI2LTA0LTE1IGF0IDE3OjU4ICswMTAwLCBHYXJ5IEd1byB3cm90ZToNCj4gPiBX
ZSBkb24ndCBkZXNjcmliZSBhbnkgb3RoZXIgR1BVIGluIHRoZSBjb2RlLsKgIFdoZXJlIGV4YWN0
bHkgZG8geW91IHRoaW5rIHRoaXMgY29tbWVudCBzaG91bGQNCj4gPiBnbz8NCj4gDQo+IFNvbWV0
aGluZyBsaWtlDQo+IA0KPiDCoMKgwqAgR0ExMDAgfCAvLyBHQTEwMCBib290cyBsaWtlIFR1cmlu
ZyBzbyB1c2UgVHVyaW5nIEhBTA0KPiDCoMKgwqAgVFUxMDIgfCBUVTEwNCB8IFRVMTA2IHwgVFUx
MTYgfCBUVTExNyA9PiB7DQo+IA0KPiA/IE90aGVyd2lzZSBpdCBqdXN0IGxvb2tzIGxpa2UgYnJv
a2VuIGNvZGUgZm9yIHRob3NlIHVuYXdhcmUgb2YgdGhlIGRldGFpbHMsDQo+IGdpdmVuIGl0IGdv
ZXMgYW5kIHVzZSBUVSBIQUwgZGVzcGl0ZSBiZWluZyBHQS4NCg0KT2ssIHRoYXQncyBmYWlyLg0K
