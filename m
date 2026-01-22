Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EA23DC5A5
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 23:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769125492; cv=fail; b=Rv514GbeLTasR7eJu8u7MhHXrhTK/EAD87X1fxWuOQRGH52zVkwNq9Ejiay8+shf4wSFzoR1LHoHUr2E88jSurswiuHX06O/v5/mHZ+RcbCHLPLD9GwOyM20RKgZIKauL7Bue2SzEh9MZKNcl2ZFD/DwLUSyD+Ysv/cua3nXaWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769125492; c=relaxed/simple;
	bh=35ncHc8p0MZjx/Fum/OdRz+AF3KcxExbH5zVe0IQjH8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VG3eMT2dxbKyxCylhVFo479kdNRgg1DOfXQFjqCoHPaeVXFX5gwpdp50kVs86APQ+WA8wtXkc7HPJXnYVaTKYiZy46/0jG9LOKdRMCnPqZfJ7fTT20igFh+WETnUg1YOs6sNQ54KWW33Wo0NOrPm9Ay6qbsgc60lrnC97NtGPA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iYGZn7as; arc=fail smtp.client-ip=52.101.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iYGZn7as"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gjo1lD8zBkV9L2MXBwDs2r2vh4hS/Gf/d2gsifPDDhGZ2KzrCyKxH85QyNJ1ohZfmbdeu/IQvw4dEph2kMcv5DEfNKAGb0qa0/E6wCXrjMB5WcWWnGgAumXO1qkd8eb51xD6bl2nTq6LGUv1jiu9kY/5r03Y5fsF1LrG7WpwvasBT3ucZsrBYZmC89ZBOCEKOFaCjS57jSR48nL7pa8D6gWTZrGbDmBhYtIfoNdvGpczF6+kfoHK3BkIfJsa3wZFsPRnYYNG4QGmISXh2exyL23O1agNqqUCzZTGE5gcKCgQQTTYpIte7Y0lrlndzlRzAIRWY7kKvPuMYZ+Vaz3DcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35ncHc8p0MZjx/Fum/OdRz+AF3KcxExbH5zVe0IQjH8=;
 b=FKlJjcD19ZuD3ew6depLnuHJfIHspIyB0ko7Y4Ppo8O61T36iIJzDypAN/50eDXqhjpg7CEmx5depuRIqREgR6mcLzuqEgrFwzvxovJO4MR6KhUmf8I7MaIoPu3blNPaZ0iaAndyO5hr6MFwn52NWT0DCOtwZ7SbtDXvFxaEy5a2uNS5ycJ3NWEwgiBqzzh5JA3RgnZBt1ZXzttJokwsYPJFbA16+5y3ZSytKstCZmzOCtGf9GwTCSlahhS7yY3JoxC+2sl5eN4ZxqN4LgUd1kHZI9j/8gvOzolnQTUb9bAi6/umRCO6pH7E7iWmRZ9PXYrejegmHXMQ7sNdDahWsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35ncHc8p0MZjx/Fum/OdRz+AF3KcxExbH5zVe0IQjH8=;
 b=iYGZn7asdkNaObG1IqiO4sTCjPxkTXNUxa0Lwq1MM/aF0lDT4s9PSbvGash002SMj4MAuDK3X0GAYaXosLTf6jHzUgkQFn61CHqqEtNvQ+6FtBifS6tnRu/L/AahXkOjjsuim+RJ6/63HdYb+W0cmQGWj9ONmQ/OZTdTW4CqblUVxqDbDd6Eld5WhWaljtSNlG1izsGv4C0LaGr/ofwBj2QtN6jQGH2rBQ8lR3KR3+SZF1v6va6sc7mFf6cU2FQdhvVh2YPzcKQek3qCCQbfYgGFAQbFyn/mXHflrfP3hUxvugVeZwpzcEL3T215yrvGWZpoegRk+kfz/pBqzSC3Bg==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by CY8PR12MB7634.namprd12.prod.outlook.com (2603:10b6:930:9d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 23:44:38 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::e32f:8ff7:79cb:b6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::e32f:8ff7:79cb:b6%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 23:44:38 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] gpu: nova-core: check for overflow to DMATRFBASE1
Thread-Topic: [PATCH v2 1/2] gpu: nova-core: check for overflow to DMATRFBASE1
Thread-Index: AQHcgBMLSITLKkbB30qYWahSgKdSLLVe8fsA
Date: Thu, 22 Jan 2026 23:44:38 +0000
Message-ID: <be1f31d3036fa12af42133dc09fa22c27cd71764.camel@nvidia.com>
References: <20260107201647.2490140-1-ttabi@nvidia.com>
In-Reply-To: <20260107201647.2490140-1-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_|CY8PR12MB7634:EE_
x-ms-office365-filtering-correlation-id: 49a33ec2-cd64-471a-4f4f-08de5a1034b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?S0NwcE15dG11UHA0MDI4TE9abERSUVhCL3VhWlpHT2ViS1lyRUZOaEhqRTJm?=
 =?utf-8?B?cjFLQnpzUzF1ZmJlcm1GTlZjK29TdnZKeDhQRVdHazhzeDZDcW41TDNrcG1T?=
 =?utf-8?B?bDV4T1ZVd3ZNSlJqSFZRY0ZIWU9IdmhlUE8rWElOWFMvUHR6TENHeGNmbHl0?=
 =?utf-8?B?dXorNjh4YmdYUHRlQmxhNXhXcEZUQU5vYWk4U2hHK1NwRFpNYm1DUWE2UVhP?=
 =?utf-8?B?RnFCaXRnYjlOODRwYU1Cb0ZVdlYwNlR4QytKZWFkc0lYaG1idDBiSGVScTJM?=
 =?utf-8?B?YlBCOGx1KzlBRHRXdGFsWTFXblgwNzA4TUFFd0dJK1V6ZmN0YmJzU3dQcmxD?=
 =?utf-8?B?WElsQ0hjTW9pbHhkM2xaY2luWlRjZklTMXpiMFVVYTNzeFR4SDEvVnNPYmlC?=
 =?utf-8?B?TTBKTjByR2JCZGZaNGNGQkFBLzRKazY1eExWc0FzOFZ3S3B3SEZsUStqbTNV?=
 =?utf-8?B?d0VWQ1pyMXZvUXZiaktKVlJudkFnLzMzRStoU2tWZ1pOeitXWUVWQkoyUU1z?=
 =?utf-8?B?eWo0YXc1Tll6dzZtMmFpNHBoeEFNbzU0VnBTS3VIVm1lZTF4VjBZSjNlQmhM?=
 =?utf-8?B?MG5NR1ZJY2ZPaGQ0U3VWSitESkd2cjVSVXo0REZxcVp3b2FXMGVZODRkZk5U?=
 =?utf-8?B?dzIvTGZqRFpxNnp5eXN3b1p0bXlSTCtlR0V6d1VuVWp3UUxSTkU1bHpBODRk?=
 =?utf-8?B?VFZOMFMxZ2tRSWtXS2k1LzlCNnp5YitNU1A1bGptSXBnSmhGUXNReWNrY0o0?=
 =?utf-8?B?SFRkZEorVnZNTU9STkJXWGVSMmtmUDJ6VFVLZ2dZL3c2VUhqUVoyYmdCaGlV?=
 =?utf-8?B?Ykxqa3R2YjZTZzZDV2VOQ2JpcU1hOFc4ekZaQkUvZTIyVVhxK05Fc2dieUVu?=
 =?utf-8?B?MVFIWTNoZHFFa3pmTlhZL0F3UStRQlJlbDVOY3hzc3JVejF0WmVzcTdVay9i?=
 =?utf-8?B?ZTdyd1IrRFhQTWc4d2h1OFhCTzJzZG1zUWlRYjJzcTgzVkwvdEdKRUVsN0Q4?=
 =?utf-8?B?azE0RW9LWHVZWG92TGx4R1dlUk1tMjR5UVdxK3dnRms3bzlkWTRFZ1RUeVFF?=
 =?utf-8?B?NnZsOUhYdHVzWGJJc2NCWWU3OERScno3NXZkQzVZK3JIVDZFcmU2V2Q3TWtl?=
 =?utf-8?B?WjN1aDIrUFYvQlV5QVFWZ2FDODFaV3RoUVBNUnNZVzEyMitUdzd2c0tQVVZR?=
 =?utf-8?B?SUZlZ3dkMzhqWksrYVNFZnRrN3VnMWhMZDFIdGJxdWN6RmZma0ZjZ0ZUdlRM?=
 =?utf-8?B?dURxRnlwOHczUWhNc2lVVEI0Y0t2bnVzblNyeVhHMDRBOTN3bTRrWkF1cXJ5?=
 =?utf-8?B?Ykp4WmZxZDJxb3VNd2I1aGVhMHdoT0dBSDhuY1YzUGJwSzMzQldiMGUxOHJz?=
 =?utf-8?B?enc1bURibXA4b01BdjNhMDlydmFhZ0ZOYUtQMTJ6eVZKYitiZWpnQVo5U0s2?=
 =?utf-8?B?TE52d1lubEJqUnVqMWZVb3NYK0VnNVM0MkxOKzVaRzFHK0R4TnM5aHJNWVlj?=
 =?utf-8?B?Vlp2dExQSU1tTTZXNUJ1Y3ZjZWZBTGdLV01DY0Q1cS9rSWg0WGFpQUE1UCsw?=
 =?utf-8?B?T0xNV2wrcUlINVFRYTJOS1JZMVhISmV3Znh1UE5rQ2lLVXpGNTBpSHNBbGRX?=
 =?utf-8?B?ZjdnOWd2ekEvbzA5MjR4eUhybjBHN3JaV0g3cGZsczlzQVdDZklXUDVQQXlt?=
 =?utf-8?B?TWVPTElza21iVDNEblNXdXRzWnhQaUNNZmNHcnhwOTk1Zk0vNTZWQW9GVFVN?=
 =?utf-8?B?N2VHN0RKMUFORDhUZzhzWHRqcjV0Z0tDUDNEZWVTV2ZMVi9lS2duaE81ZUhM?=
 =?utf-8?B?ZkxpeVZWWXAreXpqeVpsQkJURlA5d1FVeVNJTnBQcWt3QUdCV0pVcytpU0tU?=
 =?utf-8?B?NDNTVHUwV1FIRUFld3gwTG16dXpuc05SZTFHaXNHUWc2QWxSNnlIclhuVnFo?=
 =?utf-8?B?SmV3ZEI2dkloc2pYbXJHOU5mM0FxS0ZuK2twM1lIUkRqbXd2WEpSbnE3bTcv?=
 =?utf-8?B?VDFDT2xKVGgyVkNzRFlrOG05MCsxdDB6NjdwQTJqakxla2gvQUJpMnB4ZGp3?=
 =?utf-8?B?a2NrK2FmYTNZWjVIcklkTDExRFlRdGIvL2w2WWRLWmt5U1RFSVo4ZHRIL1Zn?=
 =?utf-8?B?b1lnU0N3a2VMMzF6TlpFMnVnWmtlazRYZm5OMjJod0ozVXFpdzZDNmJwQkF5?=
 =?utf-8?Q?/H+2eyBOyZaja0BUk8HCCho=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7937.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q295TmhtQVpSWHFreDV5eDlSSFJEUzNYMU9pUDlBUE9GaFdkb295RjdrNmRN?=
 =?utf-8?B?aTc3QmRwWC96QmZpN1RJYjRvUU16dDg5QmZ0ZXZJZS9Mbm9WTW9ZUWlFbTRm?=
 =?utf-8?B?UU9sMGp3WGhxV1REMm9nMVlGM3hJRll4K25OUWs5TU9uTmxxc1pwTmFnU2tP?=
 =?utf-8?B?MEtVMEo5TG83MWREaUl3MENjSmhIR2h1ZUJKdUpYSHVzcnpLYmwxamVkMUJ3?=
 =?utf-8?B?RlZwL0dYMW1mL3VNMUV0eUtJTW56ZWMzeDVXSE5iNlJReC9HQllhSUlxQXpX?=
 =?utf-8?B?VWFUSlhJb012OUFxSWY4TEpHbWdHNHp4Q0RIdStVeTE1cXNad1oyTlkzZVNi?=
 =?utf-8?B?S1luOHYrQ3NLSWg3bHhjMmpWdndPUUhZTmczaVhSZGI4ZUxLbWZna2p1dXZF?=
 =?utf-8?B?S0lLUTBwaTRDbUk1cWkxTHlkZ2xzd1Z4VkpOL2Y0T0ovRkxSSEZ3Wm1RbHpL?=
 =?utf-8?B?blBPQndvczBaOTNySzFhSGxuSFdOVXFIMnNnT0FqZWdNRVVVSEpBRmVTM2ov?=
 =?utf-8?B?SFp5VzA2Si8vbUJlc08wZmhmWHBHTWxqUy9FaXE2QXB3bElLYWN0ZVF3alVJ?=
 =?utf-8?B?ZWh6R21UVnRsQ3hPRjhYOWxiSy9TVkZ3MlZPRGtqNDJ0THRkRDlWamhjUzhU?=
 =?utf-8?B?YjM3ak1WZFc2b1BUOG1ZL2cyL1VwS2R0YjY0K3BiTFo0UFg5eko2VVRxOWo0?=
 =?utf-8?B?UVF6eGhCS0ZxbHlaREU0YjQ2UTdpZVFodjU0SFY0OEdYbWl4OWxOOE8yWlVp?=
 =?utf-8?B?ZFc2UmNVT1JmY2EyR2RVU3lMNEk1aklDV2tYUVRqV2ljUXl0MWhld3RoeFZo?=
 =?utf-8?B?MTNSTWsrbW1iMDhnYjRkTGVPWUJIZkhSUHBqSSs4SEYxMFNIRExVMklnR2t6?=
 =?utf-8?B?U3prL3RqWnFIOUszT1M3ZzhYMGZxMFl1c05GWEI1a2J4WnlodVc2ZmNaT1VU?=
 =?utf-8?B?U3F0S0Z3WUtaQjNMQVc0RTZ6Q3RVR3ExNUJMSFV6dEZkcUhtWjk4RmZvVE50?=
 =?utf-8?B?bUJQdnF2N1pTV29BZDljd0ZUSmJJNmp4akFjQVl5RFZGY1c4Q051WE5KV0w2?=
 =?utf-8?B?Z0VodlM3b29IUVJRY3FHdkFWWDMvc3daZTJ6cFFYYkFsaStqUHFXRExGS2FB?=
 =?utf-8?B?YUV3TjkxaVJYbTRnRzVuaHRiZDBEM2NJMmJnSHR0Z21nL3NGZkJhTEVUbjlJ?=
 =?utf-8?B?Vk5sc1dHNnJNL0JGV1M2MGtvOFBMeTdVdDFDeVlKYUF4WE1JbUtvUmxlRG1t?=
 =?utf-8?B?MTRoQlhFZWdXdjArWWQ5c0ZKZ2RiKzdKU0lvaWZJRkdwSHFCaldGT1lGYkl6?=
 =?utf-8?B?VmEwL2RwZmNMN0U5cG5vWFJUSFlFb3BRUy96OEU0cWxQNWFCbXJMRFdaaENM?=
 =?utf-8?B?VVp4bEJEQUUzUjhpenZoMFVyNXhsMXAveklDVUhnZmtpWk1IMzR6WW4xTFAw?=
 =?utf-8?B?c3JtTmF2blVFTzE0Y042Q1pSd1ZySUxRcWppVjMwdlNWbnJCdmhQalgzRnQy?=
 =?utf-8?B?NVRLZjdPOTV0RkQxVFFydFpDUTdFbTZCaTQrYzBTNWpVS1BoY0NoRis1L2FK?=
 =?utf-8?B?RU1KZVdQQ3ZYYU1ieWNzQWNGTE4zNmp5V2RYdHA0SERoejd1OWw3V2YreUJI?=
 =?utf-8?B?VGdMQXplRFJWNE80akJtTkdWcXNqWHYySUsya1puVEVHS1pnYnd1MGNWTlNZ?=
 =?utf-8?B?YlppbTRzbTBMT1VINjRMOEZROUd0MktsL3l6bFI2Y3BXRHpQUnpvM2lVSFd4?=
 =?utf-8?B?SW1Wdk0rREpHSmtFK0p2Qk51bnB6OE9Uem9od2paME5rWGhGM1NPSDNTY0Ra?=
 =?utf-8?B?c3c0VUpyeitxakg3c2NQMnByRWU5ZmV2TmxpbzF5T2UwNXhUMisxeFdZMito?=
 =?utf-8?B?UlByWThjR0wrdnc4MzZsQVpxZzR6OGlNbVZLeVpVcDNodHBjUmUvUVRLdTlV?=
 =?utf-8?B?SEc5TWw0UmhJb2IrdExSQkljR1FZbTlobzBZNDh1R3FCYlg5bzVGQWIvdy9O?=
 =?utf-8?B?VVhORmdJaEYyazlEZjVxb002SCt6OTZtTThqM24xQ3N5U0FPeDJnOWNHWjVz?=
 =?utf-8?B?NEV2a2xyb1BCaklrZUxxeEUxQnJHSkpma2ZoQVlpRFFlbHU4QzdqVTR4MGZj?=
 =?utf-8?B?TVhlWkJYbzNqbmJNTzB6Qlh4MXBTazhMbFMrZ1JLWTBhdnJYd200a2tJUW5v?=
 =?utf-8?B?YVN5dzNKbFZTY0hXR1U3OU41Q1lQVEJyM1dSQWljN0MzMzB4b0RxZDFmRXI3?=
 =?utf-8?B?NXc4SWdjNXhYWHl4OE9Va0tlUkdoS1QxemUxSWc3SEVqY3V6ZjcvOXltSk1X?=
 =?utf-8?B?RE5WdlZNSGthT2xMUVM3dk8yZUZGSXdXQ3Vvd1NkZG5tSWppODkzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47688E66A10171429293F18E40AC4176@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a33ec2-cd64-471a-4f4f-08de5a1034b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 23:44:38.2610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tf1WRSzPpHa3M3ZGGKkv4f5BlTLBaQy9zWr4hcpHWRt0zBqqhngNSY7hU58Vs7RMrGMFYY8fXxZrC715W0VFUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7634

T24gV2VkLCAyMDI2LTAxLTA3IGF0IDE0OjE2IC0wNjAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBU
aGUgTlZfUEZBTENPTl9GQUxDT05fRE1BVFJGQkFTRS8xIHJlZ2lzdGVyIHBhaXIgc3VwcG9ydHMg
RE1BIGFkZHJlc3Nlcw0KPiB1cCB0byA0OSBiaXRzIG9ubHksIGJ1dCB0aGUgd3JpdGUgdG8gRE1B
VFJGQkFTRTEgY291bGQgZXhjZWVkIHRoYXQuDQo+IFRvIG1pdGlnYXRlLCBjaGVjayBmaXJzdCB0
aGF0IHRoZSBETUEgYWRkcmVzcyB3aWxsIGZpdC4NCj4gDQo+IFJldmlld2VkLWJ5OiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+DQo+IFJldmlld2VkLWJ5OiBKb2VsIEZlcm5hbmRl
cyA8am9lbGFnbmVsZkBudmlkaWEuY29tPg0KPiBGaXhlczogNjlmNWNkNjdjZTQxICgiZ3B1OiBu
b3ZhLWNvcmU6IGFkZCBmYWxjb24gcmVnaXN0ZXIgZGVmaW5pdGlvbnMgYW5kIGJhc2UgY29kZSIp
DQo+IFNpZ25lZC1vZmYtYnk6IFRpbXVyIFRhYmkgPHR0YWJpQG52aWRpYS5jb20+DQoNCkRhbmls
bywgaXMgaXQgdG9vIGxhdGUgdG8gbWFrZSA2LjIwIHdpdGggdGhpcyBwYXRjaD8NCg0K
