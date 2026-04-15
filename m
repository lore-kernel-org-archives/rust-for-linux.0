Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012061.outbound.protection.outlook.com [40.93.195.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8165C20468E
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 21:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776287338; cv=fail; b=e8u2pIUwDAodCJY7s9ydk/B3AZC3dX0w/NjJibMwafs0xFu6Rhq9rfgiQDdLbwo4lLZjP20fwmrTfak8ZjnZaQNSX6qxJ1vGiUpaFq6ZfNjlWhQhdJp1aM6aAJS2f26txfOBAI+ijpfG9rqNifw//HxpmQv8CrZ7X2zlI/BXqPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776287338; c=relaxed/simple;
	bh=oW21wXylTLr14tyk9ek7UgYgvmSxdUt7oAVugMNsUds=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rePfiOMoe4xHeca2ofB1r7Db2Ez3JXV6xGxsyCcQ2KvqkROprnYnuZLh7gAJf1EHFeCTgKR+3BmVUsNOx30nQnZr1K9SmCrVJNByicd3zG7n0q1norb5Zr7y+dd0TmefWdQmvbLPwSLynQejDRs89meQzpaWjJkZ2wNL9XUtrtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t/5biPvj; arc=fail smtp.client-ip=40.93.195.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t/5biPvj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSMthpFOseF+1QSRIrNGFqMmiL9JvH6FMY6lORLauatamliIe/w3pcxgMz9nBBpqQfeODHWjFGWV55rzrBuTt1zSvzs+GSg+1VtaMwDHc/EGlNxn96Y2fQ60vC2pPHEzzEOI1etz8V9xt1JaXxGU9VEHFVRC7u6N8vXwF+hVVY/TzNYF4Q+gvA5902GnKAIQ0Lt+OgCPnXMzh8ufPCS0OT8OAygnBT10MYJ9MLTlqwnzVn2+PemBEY0RqqTrRiFSqlWXnmGSaCpMLog/ecLbMl95x4Q8Q8bzMQroDWnlDfIsA3uEfbouvSjeC3IAV6IMw5UCEijYmLwXIsr+FJakcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oW21wXylTLr14tyk9ek7UgYgvmSxdUt7oAVugMNsUds=;
 b=OTJGJPSS70Ts++2g+T4MC4WAbA6comggQ17QvMOiIn4w6b8fUgOBtCFVF/0u+kcnMci802BT/Kd9CbJAXmXb9mLtaBMPZ02T0zhNFBoqzU0AFliBHnrKBWaexP5QahijTXBk/NoGQBEMKlX0UvF46sHPJ63YxRh1q0FxgdZADn6T+42Mj7pXVZzRMv/RSVa/qzb4g1XFSxVEQkRX2Hp2lPh6FKnLWbT7jDPoSvWEc8qEMjtdh3OlsC/c9rc5jzRlhc2+z43QQ49Tj/BS90B5I3PW8VrMUcUdz7cM+TRnNFOIqID4e4N7IMKGkza6rQOdwQYOqkIa1cjFR5Rqml3SCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oW21wXylTLr14tyk9ek7UgYgvmSxdUt7oAVugMNsUds=;
 b=t/5biPvj0nCRYjSCDpbHz1Hf8fL4NUsauVf63Wv7anFpXHp1hooTamqt9h5TudL8rgp+4riXPb/6hlJsfyU/B4RY3YMGE9FiOc0sLYV98slvVsvaYUmZdPdXICByjyUNNKtE6+0NabIbijFNuqBX0U8LAStL11LTIKcG6/o5cjkUsXJLswlp/sjLSTX9iegwIbAYeVwAS5lbvISjJEZI79zy73LBjysxU2Qt52xalcWKmEc+nzC2W9TV9kTLzffFovGwKDWu2qBuVdmqeeXtMzwKADOg4ypYeeflVAHPojsCDYpSxYOtGWIdVgm9tCPEA+VJy8h6EDCBTTFrHOP0vw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 21:08:52 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 21:08:52 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] gpu: nova-core: skip the IFR header if present
Thread-Topic: [PATCH v2 5/6] gpu: nova-core: skip the IFR header if present
Thread-Index: AQHczGmX/7gBt0Wx5km8JIJK+Y5ALbXflxOAgAEIOQA=
Date: Wed, 15 Apr 2026 21:08:52 +0000
Message-ID: <025756bb7dab3527b3070a94f8b4f70b5ba5622d.camel@nvidia.com>
References: <20260414235047.439322-1-ttabi@nvidia.com>
	 <20260414235047.439322-6-ttabi@nvidia.com>
	 <DHTH70U5666G.1ZGXQJ5TSNN7Y@nvidia.com>
In-Reply-To: <DHTH70U5666G.1ZGXQJ5TSNN7Y@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|MN0PR12MB6101:EE_
x-ms-office365-filtering-correlation-id: 651109e3-5d22-463f-5aa1-08de9b3332a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 ez9R1tqdpiqhf62rLVTCqQipd0+hHCcwG4MYYsH5zLQZEcQBLZ5ozlaVJhiySLtmZpoTOubLVXU09LpCgxwsnR35if+SzH3RT4f+rRs3i0jU2gsAWj1j2EI9CbKYoTKiGJLibOrUfhbSJwqrsAlKD2A9KU62MDw97TkoL1lr/x+FEk4xGB5vpDjhV7UrXiM9Xv4a+kg9srp+32RiUzLZqf8aztszFc1IrMkyegIx1Tmu6KRSw42kkPXcwCl3LG5jX9qQIdRvC3DkDhqaxRucZ6m9TmIIb8EOVDr9kNfPFzkt0XxjDq5IMufvWu6hAv3uDxRvJp+TDDgIzcQmq4y+BJus0yE2foqhHC30jWnXx0LfcD9jzEAhz7mKXHfnyvTEo/VKrwM68iaoZToL+6IbkEBQ9uPB2fQTUVAvfGZShOOVsjTJjVmwnH9YgoN/JFrd+aUPivhkuNiCCkqN1MFdI+SzdkadVNq3RDQE1FnU2jTITUqz+ClQ9Neq98k6VjgePkhqpxvVyYkHUZZvIRY5ims6Fnty8omr7VN2XAnx7Y0NW3TxTL0wNT0D1SrE9lNKedTl3HwITeZbCzY7SEW/gTCQT+zs69FKGbdyVJG/xmuqTS+lgefAV5R/v2MOcBbhZYKngesBuv4HoHRFysu03vhfiwzXk2wSnlr/cNbeBn7WZLxC+baR3wmUtLA06spvfXEvH//rus5rzi1z5Ujo1ReZQ4JkxBxvMzRmxISeZBuE/8EwKHhm8YFmLbjpx4MmZVAeQe9ZNB7Yb4jli05UMjgeE3BwYXSZmRKqVsnkNY8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cVhhWXNGRWs1TlpBTXBPaXNmQ2l0WTkydU1GQnUveWU2WWdwNWV5b21GRHFO?=
 =?utf-8?B?N0JlZVIxVldhbWlMTE1rNWhDNmtlMWQxTHhuaXZiNllvRFJMd0tHMjhWNC9K?=
 =?utf-8?B?a015WnNBdWY4cUtTbjJ2VDU5K2VhMTBtYUpJR2dBRWJmMjdlMWFEN0U3aDNG?=
 =?utf-8?B?WjhkUWNxWFpwcGxzenNIaTQxbXBGbk40MjJJUGJTSDU0Yis3Z0c3dk9PbU9k?=
 =?utf-8?B?K09scW1Qckd4QjZleE5Uc3MrZ3EwWjhvVmFIOUQ0c3BXR01LOGNIcmxnUkZ4?=
 =?utf-8?B?anA5MWxTU1FXNjRYN1ZZWG1jd3ByRGlBRXN1Wnc4VFJYWk5YclhMNkNtNlgx?=
 =?utf-8?B?eTRQTjYydFFZdlJVSFRUSGxRTnBqRHorMjQ1eGptU3BTTEhTaytVMWdjaWk3?=
 =?utf-8?B?MlJjaHlzNm1XNkg3bnM4SHJTQVlvV1NyVnVnRlA1TGo5VWg1WlRtNzdpLzd3?=
 =?utf-8?B?ZTBnc1hDR0ExbDRIZER3UEhWTUVRTDFPajk4UjdOUDZJenhyNlNNUkJURXRt?=
 =?utf-8?B?QXNqVE9Zc0xicXA0Y2VlcHdQajFGdHZvMTQ4WWovV2NmOHo1dHF4aDhKV1NI?=
 =?utf-8?B?MWt0Y0k3NldvQTVQRTdHcUJwVU5BSFJ0MlZFNjM2OG84RFR6ZHdzRGtES21W?=
 =?utf-8?B?V0wzcWtBQzU3Y3I5bWI2SmRPMlp6bHFQSEdTOGZJNjR0aUF6YlM5cWdndGV0?=
 =?utf-8?B?YU1SNjZrRGdHUHdScW1mbkVwck81VnBBUTR2VVhIcjN3dzI1dWExTERrOUZ3?=
 =?utf-8?B?d0Q5U1ZOMVB5Zk1WVVM0OWNVTWVib2E5N09zRGozMzZ3a0ljc3Q4czVDclBX?=
 =?utf-8?B?QXN4R3JHYThTUVROQXNsTUtaK3BDdnJJbUMrTEV5M3o4UHRvUTZBTzBEbnJs?=
 =?utf-8?B?QUFxaTZKK2FLeURLZlcvR0R1U2JUZzJXZDVWb3MzSWZPSmdSTW1teVhGSUhi?=
 =?utf-8?B?dWVkK3MyVWFMK25nNFI3Z25TTngxN0NaWnNpdnNkTkJ6UDlwVlVmUjdhMjJD?=
 =?utf-8?B?cWtCdTRFc0l2SUFhenpLWFFDazFZTWs1TVZ6aG5GNmdVck9MU1M1UTYzUWFt?=
 =?utf-8?B?bWl1a3lyUUpHYnpxa01MNjkzQ2Q4VkxHLzRSNWhrbWpQYy9sWHR4UUlZNGN2?=
 =?utf-8?B?c3kvcUJDdzBKaGJWanNmL0xDbzhPa1lTMDhDNDJySzJ1Q20rUEgxQjJrT2Zy?=
 =?utf-8?B?TWJwVHJlNitXTStBdDZOTmxIbVRtdmx6OFc1YWtkYi80WXZJNUJJOUJZZFJo?=
 =?utf-8?B?SDllQU12aTc3OGU5TXpyRUJHU202WitOdjBJUHh1R2VFOStlVDk1YXEzZUFu?=
 =?utf-8?B?bUlKbmJ1SmkyQnMvVHZxVzQzMmtMNnUxRm45OVpqVEtNak5BcStCNzFFWWJk?=
 =?utf-8?B?bnhXSU5KUWRGMjN3U2FuNWRsV0IxeklScmNvbkIwbC94N0wvTEtzbWxva1BB?=
 =?utf-8?B?ZTBRbit0TWFPLy8rak1RUSs3SjdPbm5iT2Nvdkt5UTFqMnFUaXVaQU54aHdh?=
 =?utf-8?B?MmJoT0s3VEhPU1N0Z05rTVl6RXRtR3VqbThjbmpQeklDZUhUREdPWE0rd0FD?=
 =?utf-8?B?OTI4SDc3S09nbCs4N3FQRGJXeHpaSFhCTWdYdkxIL1RBenJnZzdpWDk4ZmdO?=
 =?utf-8?B?QWx6QmY2enZIOHIxWDVvT1NaQnVITXNHN0JRL1B5YjBtTDV5QXhmcjhVcDFV?=
 =?utf-8?B?a3NjejNreXJKMmp2QXJMTkF4TjUreEVWVEhwWFlyTmVrcFRGTDR2OGpNb21N?=
 =?utf-8?B?eWJERGt6TDVndnUxd1oyVmwxNzZlTzJ3NThaSFBodGVIa2h4dW5GVnhIU2lV?=
 =?utf-8?B?ZFlPVUsvTldFM0xRNStMeGdsTkJ5bzRZRTNQd1FwQTdndGhxZXladENYNE00?=
 =?utf-8?B?VzYwbGlGbHkyR0gyeVhzU2hQNDhPVE1yQjk3L3B2VjRZUDlmT2c0dTM1WERx?=
 =?utf-8?B?LzhaNGhxVjdkb2FIQWpkOHo0U1VWRnI3cHlObUk3NVZMR0k2cnJPeGliYUtF?=
 =?utf-8?B?Q1FxTm5yeW1EOCtwa01pd1FrbWJXRDFmcTVodkYyQ3E4ZUFnZnU3WmNzQTBx?=
 =?utf-8?B?Y1ozYlJQYUUxYmQ0NUZGQ29vOWkveFIzcHU3OHRtNWcwMHlEYWNGd01TakFs?=
 =?utf-8?B?WnoycjBiZUJad1NaZ250UWp0bjBkS3h0WU1lVUN0c1R2NzU0SGVwellaMEw5?=
 =?utf-8?B?VmZ0QzlINGxKM3VCYS82d1RvYy9IbE9OamZZYVJhRnFmczEra2hpWjRXdFhN?=
 =?utf-8?B?QVU2NVdFK3V0KytZZitVcmhrTURQVzNiNEMzZ2gzN2IrRU5pOXcvUGZZSzJ2?=
 =?utf-8?B?MFQxd2Y0MkxPNDR3RUZ3aEVjMkk2VjZwSGlXcjByU2xkcDNURS9HQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1553DCA8E0D83C4C9E1E97CE6162EA6F@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 651109e3-5d22-463f-5aa1-08de9b3332a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 21:08:52.8164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CPCyFGnFtxwHAyrJZZ9dFoQxSmORcHCboRBvLT7Tz3jPiSZ2CkYcQTbRxCR86B4nTri4eVEdgT8wCPjlVPjiEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6101

T24gV2VkLCAyMDI2LTA0LTE1IGF0IDE0OjIzICswOTAwLCBFbGlvdCBDb3VydG5leSB3cm90ZToN
Cj4gwqB2YXI6TlYyMDgwX0NUUkxfQ01EX0lOVEVSTkFMX0RFVklDRV9JTkZPX01BWF9FTlRSSUVT
DQo+ICt2YXI6TlZfUEJVU19JRlJfRk1UX0ZJWEVEMA0KPiArdmFyOk5WX1BCVVNfSUZSX0ZNVF9G
SVhFRDENCj4gK3ZhcjpOVl9QQlVTX0lGUl9GTVRfRklYRUQyDQo+ICt2YXI6TlZfUEJVU19JRlJf
Rk1UX0ZJWEVEMF9TSUdOQVRVUkVfVkFMVUUNCg0KSSBjb252ZXJ0ZWQgdGhlIF9GSVhFRCBtYWNy
b3MgdG8gcmVnaXN0ZXIhIGVudHJpZXMsIGFuZCBub3cgdGhlIG9ubHkgdGhpbmcgSSBuZWVkIG5v
dyBpczoNCg0KLy8vIElGUiBzaWduYXR1cmU6IEFTQ0lJICJOVkdJIiBhcyBhIGxpdHRsZS1lbmRp
YW4gdTMyLg0KY29uc3QgTlZfUEJVU19JRlJfRk1UX0ZJWEVEMF9TSUdOQVRVUkVfVkFMVUU6IHUz
MiA9IDB4NDk0NzU2NEU7DQovLy8gUk9NIGRpcmVjdG9yeSBzaWduYXR1cmU6IEFTQ0lJICJSRlJE
IiBhcyBhIGxpdHRsZS1lbmRpYW4gdTMyLg0KY29uc3QgTlZfUk9NX0RJUkVDVE9SWV9JREVOVElG
SUVSOiB1MzIgPSAweDQ0NTI0NjUyOw0KLy8vIE9mZnNldCBvZiB0aGUgTlZfUE1HUl9ST01fQURE
Ul9PRkZTRVQgcmVnaXN0ZXIgaW4gSUZSIEV4dGVuZGVkIHNlY3Rpb24NCmNvbnN0IElGUl9TV19F
WFRfUk9NX0FERFJfT0ZGU0VUOiB1c2l6ZSA9IDQ7DQovLy8gU2l6ZSBvZiBSZWR1bmRhbnQgRmly
bXdhcmUgRmxhc2ggU3RhdHVzIHNlY3Rpb24NCmNvbnN0IFJGV19GTEFTSF9TVEFUVVNfU0laRTog
dXNpemUgPSA0MDk2Ow0KDQpUaGUgc2Vjb25kIHR3byBJIG1hZGUgdXAsIHNvIHRoZXkgY2FuJ3Qg
YmUgaW1wb3J0ZWQuICBOVl9QQlVTX0lGUl9GTVRfRklYRUQwX1NJR05BVFVSRV9WQUxVRSBjb21l
cw0KZnJvbSBkZXZfYnVzLmggYXMgeW91IHNhaWQsIGJ1dCBOVl9ST01fRElSRUNUT1JZX0lERU5U
SUZJRVIgY29tZXMgZnJvbSBrZXJuZWxfZ3NwX3ZiaW9zX3R1MTAyLmMsIHNvDQpJIGRvbid0IHRo
aW5rIGl0IGNhbiBiZSBpbXBvcnRlZCBlaXRoZXIuDQoNCkFsc28sIHdoYXQgdHJlZSBpcyB5b3Vy
IERJRkYgZm9yPyAgDQo=
