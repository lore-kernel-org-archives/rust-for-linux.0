Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0F32AEE4
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Mar 2026 02:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773454834; cv=fail; b=p9KanDO4Ul+wRJT64Sn/4qyizrKdIc9yWo0tuMg02Qo4pGDYENKRjW6fDSRvbuOgY5SYYO/yVr/oywEd4DzJjZpRUzw/h2/O0jiXW0/+gVAE0e44KsCz3X/e71tIcaw0KzKO9G3rPCKGWUKgtjtJUnmZHrwMjzebEh6QKdaw/uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773454834; c=relaxed/simple;
	bh=mqrxM2SBHby8/VRg74XsXEGn+3kJLKN/HkExafaEAKY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q/j1TCcfGeEAT4M8rPfleMsIiYcM8SBvTZHJVtnEQVqa8gqg84dL7n8iZ8oVYSZmtrG3p/abFSl4IN5tPquvitfhi29u6ExvzQCfcrL8BWg8NmDMxqM9CeCtHh14PbMdyf8MVDjAeHckN7txj+w2k2FlFfegAQlpfUoMRSBNkCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fVc/VUSf; arc=fail smtp.client-ip=40.93.194.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fVc/VUSf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYDzhwZaPBDimXVijjOwIYFsZxGheD6XL3klG3FgtOUEjb8nS5vzfj335heMgKNh5mXt2g+MLz0rF5veWHIR52l9pPhNk1kuAheTN1+gRdzPyZPtpkm2LSCCKgg6Bu81tgxJTNvcEOa4hh8dsHqcpSZ+S0Py22OfXlwp7E4q7EsTv9OCoQrfItD5oGR0LqnOTrP5yHOqPOjNx58C7VUWu84ks3jFAJdVowSydLzwT4BJbPzuavg6K93ZWIDNadJhoq75itLK/ue6SG8cx5Fu7osucyY5sVs7TCu+vO7Y4OsF7T75GeALVVwGNrDT9P1jmOu5aqHU7ebYPhDM3pWt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqrxM2SBHby8/VRg74XsXEGn+3kJLKN/HkExafaEAKY=;
 b=iJz0ClKcHoG/cf8GHcJe2XLy8USMlEwfbFlpFi6XRbsEXfbPVW7zQLQZwdrjkH0zm2VtzisEdpE7/3YUnZn1C/hiQrHV+45ZPl1v5m+NOvmd3UZlAz1gyDssSBiKJcKmzDzYbVxMRSUtK/v/hOENFr5EYMgEwltAIx1RKZMD4f7Wmncq5+gGOlgdHDBjkUs6UGupOZYZ1/AD6ru1+Os/5C66v785cbKIc2Gbqs8d8GYgMVYk1UAqPQDKtPxnHfzUJ5TYt/j4mX2PsmdYsJ3WylmQLWxtxySWD3YY3qYlHcL5ZgSAyt1/XFxCpt57WMgYqjNiqJfYVB2cWihZWmTjew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqrxM2SBHby8/VRg74XsXEGn+3kJLKN/HkExafaEAKY=;
 b=fVc/VUSfWN1aF2ImAKEo3LhGVn9w6YlFakdg67NbtuN499HP4u//YfwjK1kyf4Q0lQaGNkBbTNZTpCfs5zupX197bbaTLcq4lXd7+xc7JxqRI+WL8lanu3qXyr9Uz1ev2A7Cf5ICo9mSJG+tZx79SrGGZ6lNO+WxDN10nu9fBqVkeG2kD5nm0LA7JzuaPm5M3hYuSITOD4hiIlUxWxi6L5fsSaE7VrztkyHiKdrPr/bddeYrSLNbWDPVEX08qgR+FR0ItS+plboiR+PD1R/OUjETNZTrYndi/2AcW8JVs/9l7puOZI+XPrlaP5LTb35jNATpC82YwGqOtvr6IGZFxQ==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by PH7PR12MB7985.namprd12.prod.outlook.com (2603:10b6:510:27b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sat, 14 Mar
 2026 02:20:30 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%6]) with mapi id 15.20.9723.008; Sat, 14 Mar 2026
 02:20:30 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"mmaurer@google.com" <mmaurer@google.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "aliceryhl@google.com"
	<aliceryhl@google.com>
Subject: Re: [PATCH v8 5/7] gpu: nova-core: use pin projection in method
 boot()
Thread-Topic: [PATCH v8 5/7] gpu: nova-core: use pin projection in method
 boot()
Thread-Index: AQHcsNldHbPhmm2q0ESs7sH6GU6mfrWrvD+AgAGUToA=
Date: Sat, 14 Mar 2026 02:20:30 +0000
Message-ID: <6ad717cdfe37b84fc83ab38ec9b383cd8d9d2176.camel@nvidia.com>
References: <20260310220000.1897166-1-ttabi@nvidia.com>
	 <20260310220000.1897166-6-ttabi@nvidia.com>
	 <DH1AHR75GRMP.3K4RVG31XF24A@nvidia.com>
In-Reply-To: <DH1AHR75GRMP.3K4RVG31XF24A@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|PH7PR12MB7985:EE_
x-ms-office365-filtering-correlation-id: 905abc67-0435-4cfa-4901-08de8170437d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 iSSQMDQX/OwIRjqCpPYFrG8XkHBC1k6aPum1zBLlgF16LcoNvfM5S4CFzAN1ZWxpi90Q8gtDUeZrRQt95JMNSMaTUkENeXTm2vR5tR/hfzvnFfJtQhmdzFNDHFAqLW5tLLxWEfYU+Uf9t6gSg/f/WHiMNa7aJT9Sd6/x4bS76F9scGBvs3m+S/SwUw04TynCbG6eS/9R5WeXWdV4tzqy33TDY0Cq50uSs/KXXyPgGl+9w1Gz8LEQmaI07LZPOg1kak675q3LPHWfe1vM0ThOked+xU5K0wNLUXNHdsQS7kUzZUtBrl2gMq9hqV1gCt+pp9QaNDUxt2cCI1NzI0KxrR387pQNCyW57r0Kbs/nI3R4+0QiHvLGP0St8lVNtbvdhKj0xq2xmibclQtKoxq20Pxr5+teph32MbW9ay+0/QMuICW6WtDJnPLBPZfttZPz3xtFLl28/aQWkp4PiLRDtBZ6eQkmSLu/2xAmqZKQFM/Ma46LXhF06tuSWHcBucWY35KntVZNhgPG9R2Uwz3ZkL4vq+V/rnLUH3L44+mowEYc5tBCTJt/acl0t/K5TM2Z9vr++RPPDxtqTBBEbq393frv6reugZJFQZkXDKt9pehuA7qOXFKqIwuxWYHwkNcJqZ8iepttwAhRccxt/mopx05yQwWYCy+hcGYRYLw0bXQGNINU89PeRPndDcbYsMvxSJmymYFHTPT1ye94SRova0csgJ2mFGo9SXBZnxWu9lDk0DuT8tgE1t6zjXdlry3shUgQkEhVpqxfcv4VHKwZFPrxEk4dkafncX7bOTWEafU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzNwNmxvcC9UbytDTEhuNFl2MW1zRUZtY3NFRDloOVNqQ0EwK1VyaDhuT0tv?=
 =?utf-8?B?VzhPemxvM3ZXcklpUHZTMi9Ga3phSHMwR1lLYTA3emNlejMxNU1PdG1ua2hK?=
 =?utf-8?B?K3J6TTB4QXdTQ3kxMlFnYXdTOFlpSHA2Q2RkUlR2YVVPdGtkSW0xY3FSaTlO?=
 =?utf-8?B?bGZPejhQdUU3RmFkQW0ydGpzQ2s1alFXQ2FWQStwc1NETTZNcEdYS0pGOUpa?=
 =?utf-8?B?cTFWa3d2WDdJWktSd2ZpWjh2S1RDYzFQRjZuSVl2VnNtdDdVTzN5L1o5VnND?=
 =?utf-8?B?akRaTm8zd0NFUC8ya0EwekI0dlJoMzhta1VPMnhrQVZSTzBBUzR6TzB4Rnlp?=
 =?utf-8?B?Z1VlZ1ZzUzNoM2RwV1ZyYzdPRS8vU0lpNEhVQmVsWGR3a282MWNaN0pLbnBh?=
 =?utf-8?B?emoyRTl4QkRldXVWWEJSMzc3ZnVBRVZ3d3dESkljblJOSFh4WEhGQjY3Y05r?=
 =?utf-8?B?Q204T0UvZ1FFR0lyU2FTZUYzRGQ0cnE1NEJUcjVUVGFvWWs2c2FCQTF5V1pw?=
 =?utf-8?B?T0hzRmZvTmJYWjMrNEVoU2w5akY2bW1aMDFqNEE4TjVFSXA1bUJhVFhUUS9i?=
 =?utf-8?B?QlBrL25lYlZSa0psMG0raWUxaXpWVE9DZmtNQlJBeVdzQzl2OElZVmFwWDlQ?=
 =?utf-8?B?TDloTjk2QmVKWTF6aEJyck15akhReDY5RHZjUnpiYUF3VTZSbTFEZ2laM1cy?=
 =?utf-8?B?elpxTjdVUThyd1QxVUVVZ3Jaa1g2TjcrWGlTUFNSdUg3QTdkNkZ1OHU5MEpl?=
 =?utf-8?B?bTUxRFdsUXdtYXk4RFA3ZTBjNjQ1ZUcyK0FzczVpNVZVUXBqUVM5dUdBSmJ4?=
 =?utf-8?B?RERnNE9DcGNLdFZpV1Y4TzNPWFhsdWV3a3Vtb3ZuQXNuVXVPTGFoMWNpY1BX?=
 =?utf-8?B?ajlsL2V6YUJ4dXVPNTUzRERaSnhCVUtXaVVaSG9ibThTT3MveFppSXo3NEZo?=
 =?utf-8?B?aTRrb0xpTFU3anJaOVZLWnk3ek5WakxSVS9HNEVyWkE0T3JDZ0FXN2hjdTZj?=
 =?utf-8?B?bHhiM0RTbHcyY3lSVEtWeXBuaVVHVXVTNVdndkg3bmNSZG83SUIyY2p6NWhu?=
 =?utf-8?B?aDY4clZ5bytHVU10OFUrdUZvSGhGMnVudCtZRGdVaXdaMStuZkZmdldYSnht?=
 =?utf-8?B?cVFyV2xobVpBalB2ZzhvRUpMRVBneW1DYTJWMGFpVVhSWENTNUx1bXhqVlpi?=
 =?utf-8?B?Vk9RUEg0YnRQSmNOK2psaVJCSDNia0ZTSElBSXJ0c0ord3ZFakNwZGFiQU8w?=
 =?utf-8?B?ZFlKM2N4dnhUL3ZxdUZtVTRqTzJFRi8vM1A0TmFFNXdrS1J5dFhqcklMYzBz?=
 =?utf-8?B?K0hYTnFMazlablE3WU5zU1VWME1hN2E2cVdsTUJsNlBxNFhIbU16NXpTUWVv?=
 =?utf-8?B?djJCeEdOREU4dlIwYlNsR3ltcWNOMC91Vi84RE1GbDU4WjRIWDRtcGgxTCth?=
 =?utf-8?B?Vkhla05IeUM3LzJEMnB3MVUvam9wY1lRMi9NdGJBNDYxbFZGZ01IZzF0Z2Fq?=
 =?utf-8?B?TWpDbnJCVHJKcWgvRHdMQjVwN1hWWURTSTJBVWtvV1o2L3piMEk1MHVEN2pH?=
 =?utf-8?B?ZlhyYkxnTENjS0gvY2xpWmZnMmxjV2hFQlFweENCNWZ3V2x6NlA0YzRPZWNV?=
 =?utf-8?B?MTdXdW1xa05la05XMkRNRTh5ZlhHVW40MnJSbU1zWE5nT0dNLzUwNWREUG1Q?=
 =?utf-8?B?M25ka2ZmL28zZkNrTk10RmRucUxLdkdDSzk3RmtJMy8xNTN4NHM4cGtGUE5Y?=
 =?utf-8?B?YTNwWlZja0IreXlpZU9TWmxSZldNQjBxVkhRd0FnSllxSnY2emxDTk12ajh5?=
 =?utf-8?B?RlB0eXpGYkRUVlAzdmNBQ2dpVUsrRUdEN2tFTGpWemZtOXZsZG90bFltcHNl?=
 =?utf-8?B?VWg3K2dpRUdkMFAxTHJyVGozM2p0UjgwTUNwc1RhWENoODJIV3hOb0hVL0pP?=
 =?utf-8?B?QytkdFV6R3VjTzVISnR5SlVUTElxdm5nb3B2bFp2MDJZUXdpTktNejlHVVU2?=
 =?utf-8?B?UEhBQlJhTmF1bXJpRnhMV3lnMTBiM0RxWE9weXZNWXVqWXJxRzlSSUIwQnVY?=
 =?utf-8?B?cENZZmxKeXJuY2JjRlNicUx5YkdYeWtyaTFGY2pkbHZwZ0pjeUEwTjNjdkJP?=
 =?utf-8?B?cTBXMkxmMTNQRmVWNVI5U2txR0h0STE4dkNHVC84MjczektWNU5HR3pyN0lj?=
 =?utf-8?B?WUFuWFI1bnhWWVZ2Z2RGQmNEMmhYb0dhbnRUOHY5TEJMOW9wOWVqdUF5V1Jl?=
 =?utf-8?B?SGZQN0gyeGErcVFSa3NWZzhCUVBBakNQZTdwTlBNMlZwQThqMlgvRS9FWFVo?=
 =?utf-8?B?d283cGpoUlNNa1F0MEZ5RnpkNDk3Z0NYWXk3Vm5keXlhSFBrWkZpUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0ECD0B207A635F4FA6F5C81A5F8C1435@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 905abc67-0435-4cfa-4901-08de8170437d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2026 02:20:30.1568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HthAePcPzSReXmAz4IMwldqlZU8FYJj7zNos2aUMAUU1FjVxkEHcOKahH+Uk8go28AojuV5hv4pQAzSmr/hU9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7985

T24gRnJpLCAyMDI2LTAzLTEzIGF0IDExOjEzICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gVGhpcyBpcyBnb2luZyB0byBjbGFzaCB3aXRoIHRoZSBjb21tYW5kIHF1ZXVlIGxvY2tp
bmcgc2VyaWVzIFsxXSwgd2hpY2gNCj4gd2Ugd2lsbCB3YW50IHRvIG1lcmdlIGZpcnN0LiBDYW4g
eW91IHJlYmFzZSBvbiB0b3Agb2YgaXQ/IEkgc3VzcGVjdCB5b3UNCj4gbWlnaHQgZXZlbiBqdXN0
IG5lZWQgdG8gZHJvcCB0aGlzIHBhdGNoIGFuZCB0aGluZ3Mgd2lsbCB3b3JrLg0KPiANCj4gWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDMxMC1jbWRxLWxvY2tpbmctdjQtMC00
ZTVjNDc1M2M0MDhAbnZpZGlhLmNvbS8NCg0KWWVzLCBFbGlvdCdzIHNldCBkb2VzIGFsbG93IG1l
IHRvIGRyb3AgdGhpcyBwYXRjaC4NCg==
