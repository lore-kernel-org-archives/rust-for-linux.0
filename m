Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003303C1966
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 19:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773172385; cv=fail; b=RMTHI6ujdmoBLL4TVE5Pz91gV2btZG66Qmpyym+UoPMdeBsEjSVyiQghFyO3mZvs/BRlJ8p5JieQ6U2PmEsYxguSIeyP2RfXT1l0bZyUR0s8CDD+SPNrW76wgXy3lnsNXdN2n1kySgtnfgzM7I5SX/Np25uqqYdwXfOXDEaa1ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773172385; c=relaxed/simple;
	bh=4A/QY61oAZ+buoQIAx8VngMhp+Nwq5Cn/5VwgXeMA9U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YjpKhGsk0/u0srZ9pyf0mUMFImX0n4kTuPRVFhU4C2INQiv6hHb48a3mGfBkkDyCbrRJMP5iJk2Z5VwdWZkENTMo/aE7JTMIq35la26diGiPVK+dAmoOWnbSPgciN8tWPf7uj3GvQwio2D7eOUThZGQqEeuSq6bdwznszFZ4joM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AVTeqzlb; arc=fail smtp.client-ip=52.101.48.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AVTeqzlb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rru5jALgr5FIqedOF4RQyyCe5M6Gkc5Axu8cq8i9YkCwbfkOj6N/WkedefGsoj6Hk5YGV7xrJNv3MFF3GNqz3lqOHAU9LdV/rzmGDehGzDEpnZMwk/vQobw6f41OcBp6pLbVZcfter17dUVkNo02ZbnfOISzxEcw6wKAuPj1xNZGSuxnINq/rYKDQQ67UUHRPXryQoTv9uEK8+m3rkXsP7ZsxfQryPGr7KsHhEsxP3CeNJXEkdF8YI9Or3kSuiL2K771E2DKP2LSa4P6JnewZCiprg1XsD/bX37OYIX4JPA2gPBnhaFGatGISKzA7VivIBZAbrC6NHKvaJSVMROYKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4A/QY61oAZ+buoQIAx8VngMhp+Nwq5Cn/5VwgXeMA9U=;
 b=TUUfFtnARZOlrt14CeQmAY83QK0mKbcIPY2iel6t7q6xT1IE1VlP1/h1n3Mr2hlThhUjDuZ46+QkPp++3mFqA0kLoP6680jThk6xLo9ECsim5hTxHrN3mNqzgh5+n5pqhAs7hVvJYKghfeIfi0ZN4M5V2qHZvrO3+l07Qv+zJC5fBN8hHdiEU4nAsxZ3YY/q0d1FK+3ydra1AzPoEHxswySmzXx3+UZRnR37GI8Z0qvKG8JhICJbnG12ILog9QP0zbXZfPTWKPv3J7wqhg0YNfsKSqs3T2OLo496+xS+VnfrL6U166eDX6ecH8LYc+MgNcydA7eTz8X/7vG/yXN0bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4A/QY61oAZ+buoQIAx8VngMhp+Nwq5Cn/5VwgXeMA9U=;
 b=AVTeqzlb4JOdSfSIqWCic51wKKufvkyXdkO9JtPzxNsrrNpd97YZoQpDAjdK5mhAICrA52NzLN6dOD4GW96bxqe9FxBMjrSV2W1pyJHWzh7GMOeBkFkHZjTGxWJEt8Ns+P/WeOvIunXxu4S5x3bDKHV90YogfTMoCRg3HV/bzKceLbLbD0wvV0vo5uCN2dZ0dYOztKP/eOk0bS1brAy01rIMOLYxbClw75Ft0rRLTTHdFuNC1K3RroU3Zq6mN7NSI9kGQw15EvjDIZY1zIOTsxLeHlfvhLanJesB3Tb16qG+BNLrWvm/QO27WeSUQnqnY1n193gesUlZdfCP1AwI1w==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by IA0PR12MB8931.namprd12.prod.outlook.com (2603:10b6:208:48a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 19:52:48 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 19:52:48 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"mmaurer@google.com" <mmaurer@google.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, Alexandre Courbot
	<acourbot@nvidia.com>
Subject: Re: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Thread-Topic: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Thread-Index: AQHclV8+E+e1YkC4CUS9TNMdRwsForWm080AgAGQZIA=
Date: Tue, 10 Mar 2026 19:52:47 +0000
Message-ID: <4452ba874cae2d6dfa64b9625e4e5f2ab7f34559.camel@nvidia.com>
References: <20260203224757.871729-1-ttabi@nvidia.com>
	 <20260203224757.871729-3-ttabi@nvidia.com>
	 <DGYIO09FC9VC.5DQNYP82VVFC@kernel.org>
In-Reply-To: <DGYIO09FC9VC.5DQNYP82VVFC@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|IA0PR12MB8931:EE_
x-ms-office365-filtering-correlation-id: eacfcb11-0f02-4ff1-34bd-08de7ede9aef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 qylrP4EaOhl6Anefq8mf8rVOS6wKd5Ca5MiR5JdnAX0+hkU6X1PwNxuKsdwIqF8H/LyLUf8LL065B8q6nY1jFyTPlwxtPEFTO6qais9+ET8FPc7QUyp8SBBZszE5+qd7Cq24NGqQKWNOwY3ezP7QOB0KSU9ixnnenQ9c4/vAkxT5k5SlElAg0qnCp7t9VVYS6RTdioROnlPiWvxfJrQNuMrhtUjAg4w8Ovneds1GDrGNRFLLdAYLVpOW/pJbo/IvdcdF+a3XAwVIC7lcFzwWGm9cOHCTrd6gWt0i2IAqlehVd4lv+BGnpEg/qKOy9656TV+dXzvopIJS/WKvJaN/dz7apP0iTMh6jtAwpKqauqWz7uomEfrbHkuXtj2oLXWW/Ij+lFSy+m+KeRdX+XIea1k4+eqdighUTTNSs25VllSIDQJrigbXrvusUBGmfdDFfN3TUdfSrNMR8c/1T8pcFSfvH2K1vGOb7GdaqBbxTlNxHFHhBBpgShX454hN3eMBTCa/HoCUxxVie2osVlWKxhcRrtdmJneKhb5+SAXwujcpaC0QFxKJ0ZldfB6XLjcTKZKmWuJ170BrT6HWAbJ+5+uvjvRT12AY5C7cAsNjmJwWCXav/OTpUkEhTXwSaCwukLBkTfa9L5U35zTjPercULzSNqGJU2ospCHxUEKVD383iY+lYvoirWqi55GVZq3FZpE0eH2WiMtZ6QQEWZ0pskwDiqkfX62jRaNZmCRxhHV9AxPcewrJTw86llt7ksuqaM4SLlmyTASFj8AE8f9dtcem8SASpk+2n39Y/2wIdA4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXVKLzFHV05WdGhYZ3hqQy9ZcVNwMjJhdC9wMUg0VE1jK2NFTmc4YTNIQnc2?=
 =?utf-8?B?NEpqTjllaXBiN0w4VmFmejI0SmZxY0NtSHdwNU5UV3JoalZFSWlObUwxNzJx?=
 =?utf-8?B?R1RTVDZrQXJCVFNBL2Q0czBrWHhLWmNvZVB4aFN6ZDlMRTFwVkQ1aytieklw?=
 =?utf-8?B?ZkxRbFMxWlZHZFFjWXVPN3A0eXNseGV3QmcyOGNwS3drYnVmc0tuajY4ZU9k?=
 =?utf-8?B?Z0IwUkdIQUJhd0pvcWZXcXBsVk10WWhVNnZFZ1FlMnkwQUNNZkEvRC91VnVs?=
 =?utf-8?B?dmlSR2pud05YZnpvaUFqQnptUWdOS28yalNyeHVvOURYc21KYzNHRUN3RXln?=
 =?utf-8?B?d2tlSEhjNHlXN1lqYUZUUjFRQ0w5aEU0ekFFVzFXWG85MnFDSG1sclBTWHhQ?=
 =?utf-8?B?VFlvbGlWZlNrTUxSd2djREl4Z1lBR2M3SktQRjd0VHpTdGdZMkE2c29uT1Bp?=
 =?utf-8?B?SEdTZUNlT1BYQmtRekZUcDBLVXNMNGtGbnMzRHlRaHE3OFJpTWgwQkFyK0Nj?=
 =?utf-8?B?blpXcDBkUWwvRVUzWWE2azQ2RFhCRXJiT09PL1BMOCtiWVVxT0pnTWpIbE5r?=
 =?utf-8?B?alVYUG1pRXlHeER3R0o3WkRTL1BCVXVEZU9DOEVwd2czWHhQU2sydklybytZ?=
 =?utf-8?B?TGhZUjV4Zk4rMXB5OEV5MU5VWGQ2Tko5a0d4VWQwMG9MSmpUb0k0WWRPS0Vu?=
 =?utf-8?B?Umt3aHBqcjlTRE8rWlI1K25JTjRsdDhlS1NEbG0xbjE2N24zdUFPMU01WkhX?=
 =?utf-8?B?MSt4RXc1WlNGbHdoOHRsMGFTc1lxOHhDTFNPcmRiNlJieElRWVlHZzhnSTJw?=
 =?utf-8?B?K0tYZDVST0NHWlV4a05wYkdkeHVYRWI2U09Ob01XSFJnQ21acm9CS3VXWkxn?=
 =?utf-8?B?WmdzNmh1SHNOaG1LQzdVYTI3eC9WeS9IRjRmWnBEdUFKWG5ZWG15MzZxRVBC?=
 =?utf-8?B?czBFTEg4NlBPcnl1TlBuOG1wb3NLQmptcWk3T0F4MzFySUJiWWVGRVJQM3E1?=
 =?utf-8?B?N3VzOVpFd1U5eXAwZlcxQVFGUGlmQXBBd0pNWktlVER3Q01YbnRWUXlIbXFG?=
 =?utf-8?B?QzZSQWNTelJBRU9XMkZkQmdSaTYwYlZBS3hkL3NnSzc0MG5FRkJ4dEx6OHI4?=
 =?utf-8?B?TVMyYjZhWUFCU0tUWCsvVEhMRnN6ZDZtVE92WDFxdVlxVjNaOVI4bWdGTjFh?=
 =?utf-8?B?TVNidjlZbWh5Zy9McXQzWDNyaU9yRngzVTVSVFlTcGZvNmQ1SDRxb014Zmht?=
 =?utf-8?B?RHUrN2xtNnNyYmdyQlg3VHlRUjl4Zk9iVzEyZWdiem03RWxMZ1hkbEx5YzFM?=
 =?utf-8?B?MTdqYklJdWdQWXBUNW43Qm1vNExUOS9yUHE0bTlBdXhrZ203dm1lL3k1OWYx?=
 =?utf-8?B?dSttK092a0xLTnVzdnIrSjc5TFZ4WUI0TnN6dlQ4cG9Ub1pXOWs3ejF2ZHVh?=
 =?utf-8?B?QjhrTEFhWmlZcnNSYlpKTVZYWGMrK0pCcUp6aCt2WHMzSHRBSlBxankzeTBF?=
 =?utf-8?B?U0Rqc0wybDBvdVhweEVXczFYaHlLTDZKNnZEQ3NnTTY2YUkrbDFTMWVhdXVV?=
 =?utf-8?B?NFZGdnZPbXJydjd3YjVycDRITWxwZ1dPR0xRV0wwNHJURGZqbW5nTzZZQ2F4?=
 =?utf-8?B?V05iRDBmdnZZVjlBd3NGTk1PVHZ3VE5keXB1MWFKQkp6OW05eXZNNlkweVZU?=
 =?utf-8?B?VTExU0JFZU45K05DYXhUSysrWUN4Qld6a3RYM0xXcmhHVXFLZFA1WDNkTGY4?=
 =?utf-8?B?Mkoza0FzWkIrMFNocXBueVNhNDFxaUMrWkJnSXJGZXNyRnNjZWEzdFdBQ2hS?=
 =?utf-8?B?bGpwb25GUU4rOVdwSGRralV4S3Fuam95ayt1T3BMbmxBakN1MnZVbG9ucEQ2?=
 =?utf-8?B?TDN6d0JnUkkyQU5aa2xEMlZVOUNVcFZ6cGllang4T2k0UmV0YWN5LzE2VHdv?=
 =?utf-8?B?SktLQ2lMVExhV0crL1gvUzV3Wis5TTNJWklLcnBncEFCTEZqWUUwc1huM1dS?=
 =?utf-8?B?TGVvSHhqZ1pmK0FRYXFlTlNSVlY4aXJGL2FqaDNxUnlqTFhSZk9RbEQzRTRI?=
 =?utf-8?B?b3QvM3ByV0JCcURSaTVPeUN1Ulc5OE5KV00vcS9SRFRPR2dleWQ1SThYMXMy?=
 =?utf-8?B?SllVRHlrbXY2QzFhc2RTZ0VuSndpL0lMbThjNWh3cVZvbHUxamNMVW5SS202?=
 =?utf-8?B?WGdyVnpUNklyL2x2Z3BzbmlaNk44MDFuWHhNQytGb1ZSa1BuYmorVE13VXQr?=
 =?utf-8?B?UDFjTFFFWklMWHdLT2Q3a1NzTHhxWDBFWElBVENqS3ZuSjRJdjlJeFh3dENO?=
 =?utf-8?B?L3JibC9rcUdlRitoekhGSEZDQzh5QXoxemRCUGwweUROOXJhbklIUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E902FFB31A8A87478FBD3E30259E80D9@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eacfcb11-0f02-4ff1-34bd-08de7ede9aef
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 19:52:47.9900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JmObiDJ/Dna+1JO8rSmM21P/uuyo6Oa9IZj1HAKQxosa80cbfBDIufDEuS/wqAJQXDqVfgzZ1KJ79b7q6//afQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8931

T24gTW9uLCAyMDI2LTAzLTA5IGF0IDIwOjU5ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KDQo+ID4gK8KgwqDCoCAvLy8gTG93LWxldmVsIHdyaXRlIGZyb20gYSByYXcgcG9pbnRlci4g
Q2FsbGVyIG11c3QgZW5zdXJlIHB0ciBpcyB2YWxpZCBmb3IgYGxlbmAgYnl0ZXMuDQo+ID4gK8Kg
wqDCoCBmbiB3cml0ZV9yYXcoJm11dCBzZWxmLCBwdHI6ICpjb25zdCB1OCwgbGVuOiB1c2l6ZSkg
LT4gUmVzdWx0IHsNCj4gDQo+IFRoZSBtZXRob2QgaGFzIHRvIGJlIHVuc2FmZSBhcyB0aGUgY2Fs
bGVyIGhhcyB0byBwcm9taXNlIHRoYXQgcHRyIGlzIGluZGVlZCBhDQo+IHNsaWNlIHdpdGggbGVu
IGVsZW1lbnRzLg0KDQpPay4NCg0KPiBBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBwYXNzIGEg
ZmF0IHBvaW50ZXIsIGkuZS4gKmNvbnN0IFt1OF0uIHdyaXRlX2RtYSgpDQo+IHdvdWxkIHRoZW4g
bmVlZCB0byB1c2UgcHRyOjpzbGljZV9mcm9tX3Jhd19wYXJ0cygpIGFuZCB0aGUgc2FmZXR5IHJl
cXVpcmVtZW50IG9mDQo+IHRoaXMgZnVuY3Rpb24gYmVjb21lcyB0aGF0IHB0ciBzaW1wbHkgaGFz
IHRvIGJlIHZhbGlkLg0KDQpTbyBJIHRyaWVkIHRoaXMgYXBwcm9hY2gsIGJ1dCB0aGUgZW5kIHJl
c3VsdCB3YXMgdGhhdCB3cml0ZV9yYXcoKSBhbmQgd3JpdGVfc2xpY2UoKSB3ZXJlIHByYWN0aWNh
bGx5DQppZGVudGljYWwuICBBdCB0aGlzIHBvaW50LCB3aHkgYm90aGVyIHdpdGggd3JpdGVfcmF3
KCkgLS0ganVzdCBoYXZlIHdyaXRlX2RtYSgpIGNhbGwgd3JpdGVfc2xpY2UoKToNCg0KICAgICAg
ICBsZXQgc3JjX3B0ciA9IHVuc2FmZSB7IGFsbG9jLnN0YXJ0X3B0cigpLmFkZChvZmZzZXQpIH07
DQogICAgICAgIGxldCBzbGljZSA9IHVuc2FmZSB7IGNvcmU6OnNsaWNlOjpmcm9tX3Jhd19wYXJ0
cyhzcmNfcHRyLCBjb3VudCkgfTsNCiAgICAgICAgc2VsZi53cml0ZV9zbGljZShzbGljZSkNCg0K
SSB0aGluayB0aGlzIGlzIGJldHRlciwgYnV0IEkgd2FudGVkIHRvIGdldCB5b3VyIG9waW5pb24g
YmVmb3JlIEkgcG9zdGVkIGEgdjggd2l0aCB0aGlzIGNoYW5nZS4NCg==
