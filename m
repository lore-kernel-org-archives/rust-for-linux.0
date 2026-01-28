Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB7328B40
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 20:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769631623; cv=fail; b=hcIYrM1AXiIdGZUZisSWm4dIZHzQA1/qn7rQc58ZTpNPM3FniOtI/7MoNgjEU2qthxH0MZFoI/5Hn6QgqFS4zdVGiLdnxZCkNKs4eoguUcc8fsUrdUa0t/KHtzQqxIYEFXKLp6X2TfmIc319jQ6TimxNgmvZWAu8uyE/cWsxf6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769631623; c=relaxed/simple;
	bh=rGe1+qim07UqgDg2CPjbfXSEcRQi7CDamUtm1M/cpdA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rQ8q8ZO6PMgBSR5Y3kNR3T8QgOtmjcdKkF+TwK+5hRvACT8lirlHyCZC+QilMHs2h9ytagLp11rZNEGfNwZVgMlp877hjntyVdMXSp1EkUrBRCsGLEwfivIr0luhXQ5Hh81DNYC1xFTmiEf4ESbUMxKtO2GvySv2IsabarVpGJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rYfcnD5A; arc=fail smtp.client-ip=40.107.208.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rYfcnD5A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVZA+Ty5QX+OG24e8ErFNBPm61zbmevKqQLoYcFFuk5OLCqz4Dj8fbnyFV8V/JWJG4eE7/H+yup4ks6K1AxVnSTuuMgj2kNZAQD0r15tsySEaCcgmeBGIwG1lMRMiZfSRXdaA1WxqbyF4XQ8hkYutZUXnUtS+85ZIAv6DPoejVVOqLiuzH8eGVuNqlbVqNCHvTrodLu0zN88bTJ9QhdnaF4B431Wql3qySB+uGok46dr9uKjS/+J7r3d+mwLsE3/1BO35qTWwR1ZdTGMxi6N87EKvrmxVBZTQUggUILfqYdb+JX1oweUeXFIGqoB8sFfULpb8skgi5b1KsJMcR7g2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGe1+qim07UqgDg2CPjbfXSEcRQi7CDamUtm1M/cpdA=;
 b=t9eSifpr4EsRzlzlg+4HpbC8orPnjqv7MW01JP7ZR1Kdw9FhMbqRWzTsSi0sb7UBd2765P96A+kTjJ1dDQ/wOlD5i6NOeql5AhAGP94EesJEDP7uj/NdoTT5AualJEe2oDEZtvSFp6DljW/LQEClTiu/Di5KDnl6mioER3PXcGENkG3XV3qDU8bMV4zPYO10jDBEICto1DNPwAkwgRQMavfw2ovz/zchbi3UADw6n4kmCBY35lfBgMjrgq5AIo5usQIhuxOOoPzM7N9Dx+AadpZcxG7bIutJdSKCIZNL+1A0rYch6iOK1TNQx/Eaoi6wQp09DC5T4xWPxsZHor40AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGe1+qim07UqgDg2CPjbfXSEcRQi7CDamUtm1M/cpdA=;
 b=rYfcnD5A8fbelaDLfW6w9WTKtfjFMFFY6s0+qFqErptLB/GTq/kGQ4UDXaSL2a5nU2BaImYaxkd2WxkDHQyBJF4mPKQfOfuGT0fekFbTSbErPS8dVjE4YLYzBKuELphHmHU2FvAWuxS535DFBbvLg9++ZZUZ7l4xfGCjeK2JSAFXRrhbhAYNPJhHxUmRgexQukojDIiGNKxKpv2yj6D+MwTav5qDKOhJL9hwhJXI7Yx0wTyvEr85Xn0044w5u3qjgbmHcvQ+9pTZp6nJnPd3uXXbt54j7l5nQ330irQI8+gX+ulVeyzspYV9Elmg9wCMB/n8blikVHdyLp+2yVZfIA==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by DM4PR12MB6184.namprd12.prod.outlook.com (2603:10b6:8:a6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Wed, 28 Jan 2026 20:20:16 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591%5]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 20:20:15 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"mmaurer@google.com" <mmaurer@google.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v5 4/8] gpu: nova-core: implement BinaryWriter for
 LogBuffer
Thread-Topic: [PATCH v5 4/8] gpu: nova-core: implement BinaryWriter for
 LogBuffer
Thread-Index: AQHchzInSaavlYa7+EahffdPArK4UrVZbLwAgA6r5AA=
Date: Wed, 28 Jan 2026 20:20:15 +0000
Message-ID: <02a2d3795b2aae59d9b5fd46d2c6bef7ff630b0b.camel@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
	 <20260116214959.641032-5-ttabi@nvidia.com>
	 <DFSK5AJR2K54.UNS6PT7MV5W7@garyguo.net>
In-Reply-To: <DFSK5AJR2K54.UNS6PT7MV5W7@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|DM4PR12MB6184:EE_
x-ms-office365-filtering-correlation-id: 2a07c8b2-6f8e-41db-4122-08de5eaaa5be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dVdjWW1aakd6bHhVelczTmtRSDdxRUFIZ2pBU3FvdWNUajhWTXVaRk9HVzZS?=
 =?utf-8?B?YU9RaFpScFVsVzVTaWxBSDl6WndBbDljOGwrN1g2bVRPWHl2NEtJdnlwRzZn?=
 =?utf-8?B?SXVJL1ZWUnpzU3hXVTZ5UjJjRTFCRDFjcTZaNVlmS2g3UmlzRzVLMERTYS81?=
 =?utf-8?B?ek8zRmZPMVdZRUJyZFZwTEJnaUdtaXZtOGdzK1JmYXFzSWYxeDhKek9MOVI2?=
 =?utf-8?B?RlJ2VWhoS0lzUHRjZWNPMzBtWDhYaENCRzRkcURoOG5IZjJNWmNRZmxnUER5?=
 =?utf-8?B?eTdhQkJnc2E3ZXljS2lla0U1SjNlVnE2Mng1NE5EMmZxd1R1YlVvOUtzZzho?=
 =?utf-8?B?eFltV1Z6Q25KL25NS3JIamQzdmRUWXp6Ymt3RU5haTlTTnJuNStmd0IwNm10?=
 =?utf-8?B?c0VLbXJBUCtLdTV0Nm16VDh4NjZKQ1dYNm10REQ0WjJNSHlXOGpZYVY2UXdi?=
 =?utf-8?B?OHlPaW1KNDU0cUhCZmQwMXAyZUhuRi9XTm1BYnRDZ09qVWIrSlpvbmsxLzha?=
 =?utf-8?B?ZzI0NXRQRzMzeWZ0NXAvdXBXRXNTQ01BZWU5aVNKcWhWUnloZG1lLy8vSkxH?=
 =?utf-8?B?NGlBZlk0MENvMkpTUG80V0xXQ3Frc2NqaE8wVHNqZEpoL216U2JWNDNmaEpH?=
 =?utf-8?B?cVo3QWxzSnNxVkVaQitJTXBPK0RJRUdwaitkN1IrVVZrUHRRT0xyQTliYzJ6?=
 =?utf-8?B?VFc2Rzd0V3FqZzNBbVRKbTVvN2M5Z2FGUllKL0phanBWdlIrSlE3KzBjOFNo?=
 =?utf-8?B?YkNvanN1NnFrcWVQREplTUJtMytxeVo4QkI4aFhUQWRycU80aEQyd2t6TlQ0?=
 =?utf-8?B?QkY5TElzb1RwaitpR3hyTVVLUXZpdHkrb0dvMit3WndaMklpMFNzWTFLc21D?=
 =?utf-8?B?YVNiVEhTR1Mvc1NqTENDVzFpMHJJb2VIYlc1dWNmQWhydWl4UDA3ZFEyeU15?=
 =?utf-8?B?blJVLzV4WTFZQzgvb3VYbHVYcU9ZOTlLNXBnaVJNYitsaDBQaUc3ZlJ5Vmo3?=
 =?utf-8?B?ZHUwTE9wKzNsdXcxM3lJRzk3Njk3SVM0T2E5b3ZTSnFaT3QrSDVrbk5qQ2Rm?=
 =?utf-8?B?aEZqTzB4VUc5UWU2RVN4QUhBWXJPaktiTG56WXppTG4zenpLZSs2MVNJUTNZ?=
 =?utf-8?B?bzJJSXNHL3drTm5GTFVTUlBCWGpKbTdLS21FaWsvMGcrdWNhckdNWHJQamI2?=
 =?utf-8?B?eUM3RTlrWTlXVmcvSW42QnFWbXlZTW9yM3hkTUxHL1A3MG1ERGlLcUxUWG5m?=
 =?utf-8?B?Zk05Nk9KY2xKZktySmNWTE5kWG02ZnJ4R3dYVCt1NzYzd00xWWV2OHg0K25V?=
 =?utf-8?B?aUhzZytPcmxhN0hCVThKRnlnWXJlcGxxL2lOaGRrVS9VR2p5UHdWQTM1TVN0?=
 =?utf-8?B?d3ZKSGMxbHJaQkxnUTdpLzZQUGJaVCtjYjdNdHFsLzNhdkxvWGVYaEJMNE5I?=
 =?utf-8?B?Z2piYSsvck1WdTB4eFU3NjhtK3JGVmtGS3ZDQVhUeUVSSjBPcTZRVi9wZmZ2?=
 =?utf-8?B?dkQ1bkFwc0hWd1JUMmRORHFMMUV1TXQ3TnlkQ3FMRTM0a3NQMzBtTmljUlJM?=
 =?utf-8?B?eHhWUndhQ2NRMldOQ1F6MTBvM3F6M25NdzJTakx0eDRGVEJhWGF0NGZOWVpS?=
 =?utf-8?B?djNXRHlEZE0rMlhENVExay9Hb3RnbDhkQXYxVThJdklRclUrbGNSciswQlhh?=
 =?utf-8?B?eDZ2ZFpTSnFzaXo3U0FOamRnSzlFcXpQT3BnMTRDT3pFbGRBSGk1cHdCRzNY?=
 =?utf-8?B?aTFQN1ZhYTF1YlVWVm5xMkEySFhUNkREaFBKNmUwMlk3NEErNFhENTQ4aGdH?=
 =?utf-8?B?RlNkWFE4bFh3OERoQkprZlRJMjNoL0VqaU0za1F2YlU5cmt5dUdhWVlkOVFE?=
 =?utf-8?B?UXpya0VLUE53WTBkM1VHYURDS3pLODdZYlVJeUZIcG1DVWU5bGloK2YrY0VY?=
 =?utf-8?B?L29vN0tuSElvWCtVUkJtckFYY0kvUWNSUUpJbkd5eHZIOXdMSVY5TFQ1ei9r?=
 =?utf-8?B?WHpSSHU3aGJrQ01ick1GcmJIcnFoQWtlT2FsUTJqbS85SmhkN1lXOFBIUFJ5?=
 =?utf-8?B?bVZXcHEzMyt3MmFZeWRWQVRXbEwzV2hONUVGdUFlWmtzbjlML1ZPckxia1NY?=
 =?utf-8?B?YVFjN1o2SlIwbzVSVlI0cSswV21YTFJvdkQ3TytQWHVjVGpaVmZZRHNFZWsx?=
 =?utf-8?Q?+WWN+Xw1PGgJ/CvgxJFJWjE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?akYxR05ienZ1UVcwd2NUR3hKN1JPSm83NkVBMlh1MW5rdXduR1AvcXVmQXRD?=
 =?utf-8?B?Zmp2RHMrZ2hsZmxXNmtNeHR5YURvc1VKemkxemc2UzdSR05MejRrYzI5OUxk?=
 =?utf-8?B?WjBJZVorQ2svTXBaN3grMGtzY050WHRkd2dla29NSmRDTUpVdWV3eVBKTDUz?=
 =?utf-8?B?QndCOHpwUmZUTG1tL1FzajRzMkxHY01nMWh5ejMzYXMxYUZUaG1GOHhiVEo4?=
 =?utf-8?B?NDJpSitWV0lOelNsRWZIY3VIR0JZRTlVTGJ5MktmY1dpTzJrL3FIdXArWGhC?=
 =?utf-8?B?TThwaWN5U1kxWlAySnBWalVNcU1wS09kSjZGMUJLeWNXR012L0R3YkNRaVYz?=
 =?utf-8?B?WFZXOC9KdzlwTUMycXBHNW9TQ0phSFRWbU52TzRkd1RtTlJNeUY1Z0ZTVHNp?=
 =?utf-8?B?K2JKM01LVi84SERCMHE0TlU0emJXRmpVcTRUczZKYUtjTW5CVHRuNGhXYWpX?=
 =?utf-8?B?SXZOWjRuTW4xWWo1U0xteE5rd1l6Qi9YbGZZT3JMM2FLRmE1eVA1WjNSL0Mw?=
 =?utf-8?B?eU9CTy9LNVRTV1BadkcvMWcyS01yVXMyV1FPdTV4N2RydDN0eEVUWlM0Rjlv?=
 =?utf-8?B?dXk1OCt3bFhiU1VWUlJ1N1ZnbVZTcVpjNDNLejFXZ0diN3VZMEJPb3VnZUEz?=
 =?utf-8?B?a3ZJM1JoVEVkN2lwUHIvTUQzeXdTUGRNQTZOTVBMSWZqZUE2VkJmTnEwdFov?=
 =?utf-8?B?OHlhK2drWWZzbHpIcTg2U1FHOWgxMjdqVzhpdUhtVkZSdW85SjdOUWRPMnRR?=
 =?utf-8?B?SEZDWHU2UlNaQ3Q4a1lpR1FzaVpOWEtHeUVhTWMzMm9kU3ZZOWUrVldzV3Fo?=
 =?utf-8?B?QkNvK1ZhZ3BwaWxvZ0RkYmxyeW1KOGdKUU1JU3g5NGVqN1ZGUzIwSzN3MU0v?=
 =?utf-8?B?TE94Tm51QVEwOEl3bE5jaHRYVmtkWWtSK2pXZXhIQUFaZUxSOXQ4QzNNWHBO?=
 =?utf-8?B?REVkc0wwRzdKOU5TUmtDU3JRK1ZhZDZkNDQxZWlrbW9jdXg4RUNaV2hrbEdZ?=
 =?utf-8?B?clN4cWxpQlUrZXdqZ0dVbHFaMk80WlhPLzl6ZGZzLzNsYUVhd3BTNU1ndEZQ?=
 =?utf-8?B?eEZ3UnBONjViYUxlQ3NUbEZpenBNQTQ0S0YySUpPY3l5MDArY0ZWZUtFS0JO?=
 =?utf-8?B?SW5ubUZPY1ZPajErUjllQ2g1MUtjenhoY014cEdHejBTUFA4c0R2Uk9TZDlH?=
 =?utf-8?B?QmtmUUxvRmh0cVJ2dnRiYll2UG1xQW0rSWo4NjRzMXpXZjNEZEczbkt4Vkhr?=
 =?utf-8?B?S3VJbUExNlpxay9nbWcyd2xNUjZXUEJtQWZjRG9jSFZSR1loWGk2N3VqWFZV?=
 =?utf-8?B?cS9YSVJ0VW8yVnQ1cU1ubjlEbWdWMlB2T0xjcm4zZno1cnpZWmNZanpBczB3?=
 =?utf-8?B?QXBjYnlxSldabDJVVUs5LzdWenl0WHg1TkFrQ1hWeWpGYllUV25MR1ltamR0?=
 =?utf-8?B?OTVGTE91Qnl1a0pLakdtQzFqU1JkWUIzWEVQdVkzVmlwSEgzMG5WS3NId1ho?=
 =?utf-8?B?OEIyZEFKSGlzVi80TEk1Ly9lWFphcXhIcG1kOTNKUmw5SExvTzVuT0plaXpY?=
 =?utf-8?B?L0Y3R0FTQTJVYitLYW9PVXg5WitkUEw5ZnJwS1hwTXVZTW5vTmdRTEpTK2xC?=
 =?utf-8?B?NWpLQnU1N01vRFVLNk9YdHhkeXNQVGlSMlE5WDZuaG9pR3lhU3Fyc3RHdENB?=
 =?utf-8?B?UjRmcFJnYVpzZjlVdnl3UFAxMWtVU2ErL0ZSUURDaE9vUXgycmtka0Vkcnpu?=
 =?utf-8?B?Tk5YSlRUak5Ram1sbHpmS3plYUlmRSs3K0x2YURwNjZJaXR5ZGw4VWpjNCs3?=
 =?utf-8?B?eXJGUnoxTERqSWFuemVWUmxHVktxb0kzcUkxdEt3RHM5MlhVNG9JVlpRNUlm?=
 =?utf-8?B?MStsL0Qrb3dOQVp1QWp2Q2pjcXNmRTYzYjNXOGQwelUyNldXQTNUNFBKWEMz?=
 =?utf-8?B?V0daZmJZM0x3R285cG9mZlIxN1dUUlFuS1p1azd4Nnp2Uy9jUE41Y3huWXNF?=
 =?utf-8?B?WUw4ZHgyTm9CRnJuRXVkMktPR2NBMFNqczFuM202N0VGcDhrZkdYUG5QQzhT?=
 =?utf-8?B?VTJGVDRrWGRwRmZ5b2FIcW1MMUJyV1hjN05kRFc1UlA4bHFGTjZrZnU4Wkpu?=
 =?utf-8?B?cTVEYTNuYy9kYjc0bzN0SUZuZVg4VDdkdi9CdDBvampDb1c3TkRLNWFwVkhs?=
 =?utf-8?B?dHdrMjNKTGVsNDYrWEZXTzZBeWhWbG1Jd3dSTEJUblU2QWYwSnVBbngwOHdV?=
 =?utf-8?B?a3J5VEtwVnZIa0dLM0Z5V3NDY3oxeGVTVXJycUsrbkg1alQ4TzZaSHNOSFUr?=
 =?utf-8?B?QXFuYjEzdWNwVFFwdGpnVXdXMXpDVHdhTUFoVDgwdllYY1FWRzZFZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57B91293DA83C84DAD2EA253F0896005@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a07c8b2-6f8e-41db-4122-08de5eaaa5be
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 20:20:15.1177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: khhKMZ7ZWmuF93jOLlV1jQoIaQZsv7kuEtWKV/vErH0wOgiMpvGD0JdM5c13Bjoy3zmc7T/++lADBCQiRljoRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6184

T24gTW9uLCAyMDI2LTAxLTE5IGF0IDEyOjE3ICswMDAwLCBHYXJ5IEd1byB3cm90ZToNCj4gPiAr
Ly8gU0FGRVRZOiBgTG9nQnVmZmVyYCBvbmx5IHByb3ZpZGVzIHNoYXJlZCBhY2Nlc3MgdG8gdGhl
IHVuZGVybHlpbmcgYENvaGVyZW50QWxsb2NhdGlvbmAuDQo+ID4gKy8vIEdTUCBtYXkgd3JpdGUg
dG8gdGhlIGJ1ZmZlciBjb25jdXJyZW50bHkgcmVnYXJkbGVzcyBvZiBDUFUgYWNjZXNzLCBzbyBj
b25jdXJyZW50IHJlYWRzDQo+ID4gKy8vIGZyb20gbXVsdGlwbGUgQ1BVIHRocmVhZHMgZG8gbm90
IGludHJvZHVjZSBhbnkgYWRkaXRpb25hbCByYWNlcyBiZXlvbmQgd2hhdCBhbHJlYWR5DQo+ID4g
Ky8vIGV4aXN0cyB3aXRoIHRoZSBkZXZpY2UuIFJlYWRzIG1heSBvYnNlcnZlIHBhcnRpYWxseS13
cml0dGVuIGxvZyBlbnRyaWVzLCB3aGljaCBpcw0KPiA+ICsvLyBhY2NlcHRhYmxlIGZvciBkZWJ1
ZyBsb2dnaW5nIHB1cnBvc2VzLg0KPiA+ICt1bnNhZmUgaW1wbCBTeW5jIGZvciBMb2dCdWZmZXIg
e30NCj4gDQo+IENhbiB3ZSBqdXN0IGltcGxlbWVudCBgU3luY2Agb24gYENvaGVyZW50QWxsb2Nh
dGlvbmA/DQoNCldoZW4gSSBtb3ZlZCB0aGlzIHRvIGRtYS5ycywgSSBoYWQgdG8gYWRkIHRoaXM6
DQoNCi8vIFNBRkVUWTogQWxsIG1ldGhvZHMgdGhhdCBhY2Nlc3MgdGhlIHVuZGVybHlpbmcgRE1B
IGJ1ZmZlciAoYGZpZWxkX3JlYWRgLCBgZmllbGRfd3JpdGVgLA0KLy8gYGFzX3NsaWNlYCwgYGFz
X3NsaWNlX211dGApIGFyZSBgdW5zYWZlYCwgYW5kIGNhbGxlcnMgYXJlIHJlc3BvbnNpYmxlIGZv
ciBlbnN1cmluZyBubyBkYXRhDQovLyByYWNlcyBvY2N1ciBiZXR3ZWVuIGtlcm5lbCB0aHJlYWRz
LiBUaGUgc2FmZSBtZXRob2RzIG9ubHkgcmV0dXJuIG1ldGFkYXRhIChlLmcuIGBjb3VudCgpYCwN
Ci8vIGBkbWFfaGFuZGxlKClgKSBvciByYXcgcG9pbnRlcnMgd2hvc2UgdXNlIHJlcXVpcmVzIGB1
bnNhZmVgLiBJdCBpcyBzYWZlIHRvIHNlbmQgb3Igc2hhcmUNCi8vIGEgYENvaGVyZW50QWxsb2Nh
dGlvbmAgYWNyb3NzIHRocmVhZHMgaWYgYFRgIGNhbiBiZSBzZW50IG9yIHNoYXJlZC4NCnVuc2Fm
ZSBpbXBsPFQ6IEFzQnl0ZXMgKyBGcm9tQnl0ZXMgKyBTZW5kPiBTZW5kIGZvciBDb2hlcmVudEFs
bG9jYXRpb248VD4ge30NCnVuc2FmZSBpbXBsPFQ6IEFzQnl0ZXMgKyBGcm9tQnl0ZXMgKyBTeW5j
PiBTeW5jIGZvciBDb2hlcmVudEFsbG9jYXRpb248VD4ge30NCg0KVGhpcyBhbGxvd2VkIG1lIHRv
IGVsaW1pbmF0ZSB0aGUgIlN5bmMgZm9yIExvZ0J1ZmZlciIuDQoNClBsZWFzZSBsZXQgbWUga25v
dyBpZiB5b3UgdGhpbmsgdGhlIHNhZmV0eSBjb21tZW50IG5lZWRzIHRvIGNoYW5nZS4gIEkgd2ls
bCBwb3N0IGEgdjYgc29vbi4NCg==
