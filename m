Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013038.outbound.protection.outlook.com [40.107.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EEE17993;
	Fri,  6 Feb 2026 18:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770400947; cv=fail; b=t2+wnoEQM7U63WvxqA4Pm5RqBV11yY3X5GrAPhLIzHRWlPCMUOOrpU0181K3JuZ5C1DlR2mIviCZWuWoJ0OoEgD6XKuCbQ6TNvLaBv3YrRDR4pP8mGIvqLmpppwO8tx+stfDLtXYT4kpz8cijeFsStFa5aFv5wazqwumXNgPUFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770400947; c=relaxed/simple;
	bh=wqSPrKLN+dVkHI3dYXE8I09jvrbLYLZ23MdrCEyHBVU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V/qPcW2ultNtY9+cIi8+S0Dw/Qr6LRPJZrdmCF2+e77Mgyhi/cIuEGiv3rMG+ooPoGpTBPNYq4xvAdlQZVej0+dyYNtUtXM0z5PMBO7cFlUnOzKj8NJ8dVy0/vb3bIDwUtLLkVADg4K3smMwaJkOe/l24YgnLixYWj3OxqLRK9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L0eGEegK; arc=fail smtp.client-ip=40.107.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L0eGEegK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnu/0x7XD/ANU5oOHauoJdF0LbsvrUb6zQLgXpanNUQpQO6hEiN+RzE0/b8ehL7bWUsCV9Dk9Y9wpPEwzhYJ2StJMLpwqg4ACQH1L53R6QeDOYh3igoQ/f3KVZ2d8RZtaJsnfquwO1aMKVdywTLYgcAWBHPfBBaGqWgoCbKMTiDG3b0UkDLQ3kCg3NCK9LAqgUhaG+Ku88Ywzt6P85dyBKjftv2oAD+71FBozkKu21nXn34sG9IdNRWNfTzetYiRWiWnsyeM75d/ITs1TrC4nVRCed8mJ2pkCngGB2Ui2tEtyEKpz10cuxeO2iRQj8alwz7ygnUIE1kTgkKL5sq3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqSPrKLN+dVkHI3dYXE8I09jvrbLYLZ23MdrCEyHBVU=;
 b=VcGMu3kTjVerJXPhOdyFBx8TVgBP2xNJl9mBRGu/5iNHsXKuG/VveExF2KjqGJD7zD1UpsRyF8rbeynmooR9jx77gLKq5FxlORUt8FxsVw3ZyCI3XfgXAusDtIn6ohgJXAT64czyEY1gLIsCwp9RjE8CW7BYr48stTpsTRRe7fMweBZ9/qSnrNmRw9OgTzcNiZ1kWhq8fAjss0UYrLb8qau6H5ymS80ypn/v+3O6OZqBAO8VTpULxx2tUeiVXi4D+qpMV+NGW6t000RVUracPWsa1Vz2psBK8Mxzp9PvVq+6XTm6ywL2merWQubHsHRBrEzoZ+FUFSuDQDyb/JvYxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqSPrKLN+dVkHI3dYXE8I09jvrbLYLZ23MdrCEyHBVU=;
 b=L0eGEegK4FAG7umsJuKgntvINomNjAkg/8iCaqs22LEV41tWE0Qk8ZSGDF0GsDcBwRvLsKYZGznrywKDw8Y8/tlz6qLYpXzOmwbqKUX8rUhWz8aV/WMDoHYbbHb0WSoOn1sAB4F3GLjIdO2idgwjG6KbN+K/4ABQBfl38K2vKpL3Sn++wYgOz7Z1xS+brRaESWf+sbA6jUXvQT/E7lQ8oLXzPWFrFb+Z13T+gUZaACBZ3kGO4sL/IAedKwun6oIp5lYWErD8+mJ1JQVpVcXGfMpJy4t4b7SVCaMYfAAjL/S93K00ou+xmQwUK2KpSWCJaSlOWjwBzuflGjowEz4y8Q==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 18:02:17 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 18:02:17 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "aliceryhl@google.com" <aliceryhl@google.com>, "lossin@kernel.org"
	<lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"tmgross@umich.edu" <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"airlied@gmail.com" <airlied@gmail.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 05/30] gpu: nova-core: use GPU Architecture to simplify
 HAL selections
Thread-Topic: [PATCH v3 05/30] gpu: nova-core: use GPU Architecture to
 simplify HAL selections
Thread-Index: AQHclyAUp3r5CKuzhUiGKGcVTIOcJbV19zQA
Date: Fri, 6 Feb 2026 18:02:17 +0000
Message-ID: <358d309f7c600bbbfed1fd702a89a114ea011ea4.camel@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
	 <20260206042123.303281-6-jhubbard@nvidia.com>
In-Reply-To: <20260206042123.303281-6-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|DS7PR12MB5840:EE_
x-ms-office365-filtering-correlation-id: f370e31b-0322-4426-4dee-08de65a9dda1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?b0pWYTEra0RZelB4S2FxVzliVG5kYUNDVFVaL2IxWFdrZXdEeWZoTldJaWZR?=
 =?utf-8?B?MEh5cmhiYkx0TUttdTBsTGN1RzdxZ1ZlRXF2YmswU2JvZnFIay9nTGZUU2dE?=
 =?utf-8?B?OTB5dXczeklON0xvSnhQeW5ERkZnNVhIcHh5K3IxK2lEblNUVFdzdkNFeGJV?=
 =?utf-8?B?QnN2ZVByVWZINWRVR1drZ1NXSlppcXFVeTJwdVp0M2VRdzR0bVE1aDE4a3VK?=
 =?utf-8?B?US9zNmF3NWxucEgxTWxwTDl2cjUyK3NSa01tSW9SblhWY1dNSmpTN05WcEZt?=
 =?utf-8?B?V3RkVmxYUGpYaWcvMjQxZW8xZU1DNHNtSlg1SncwV2NlVVl2aldoWXI5NDJD?=
 =?utf-8?B?UDYzNnlXZlhhckpPQW9PVTgrMEFka0pNa0YzTlozRDl6anE1ZFlUVUtGcjI4?=
 =?utf-8?B?TXpYb3VoTTFwMVJwZkxvbGd0dFA1M2ppZUZDNWc5T1Y4ZWR4bnNhQVdrMEpY?=
 =?utf-8?B?amNCZllZelQ1R3hqWW5pYmFxanRnemVzZ3V1bzI2bFRPVlJTcTI0czRkVTNj?=
 =?utf-8?B?cmlJVnJRTkppOWRGb1gzTVhJOWRURFpNeS9yZ2p6Mm9pUTM3aEdnb1E0VGVt?=
 =?utf-8?B?dzN0Q0VseHA5M01WNUpjVXBkREs0SHBhaGRrTUk3UXVsQ2ZGaWREQkplRFpR?=
 =?utf-8?B?eS9tbWdjSFlBZEh4eXhJZTM3WUJvTERTemRaR2lYZHpuemh6M3ZIWXJlV3h3?=
 =?utf-8?B?WW5XYTAvays1V0haTFlZQnQvdzl5ZUk3TlJSUVVjOCtCYlRXRnZEbXBlWFBh?=
 =?utf-8?B?RFJOa1ZKK0lrR2FJTmgrd3Vackt5R2REdW5RS2RhVjJtR1k3NFU3TjllWWpl?=
 =?utf-8?B?MDViVVdEcG9PVTN2UFZLdkJhTzFOZkcvb3B5SnpWWjEvVlJtU2tLWnVHTlkr?=
 =?utf-8?B?ZHhiellwZSs4Z0k0dHhMQU5zcGFnS2NoNnVHUGF6dUUyQkJKWmVTUHI2ZTFD?=
 =?utf-8?B?UVdQM0IvK21RaVZGcDUvTmJLUU12WTZ6bkovSWx3VjI4WmFtQ0xCZjhQblhm?=
 =?utf-8?B?dGpHZ20zTy9DZnNkMVIyVjBPdWJMZE1WbzYvU0hianNqT1BTUzFhejEyWTgz?=
 =?utf-8?B?a3NhRTVLVnBVOFlIY05ZQW5aWHhucXBUbUpXRzRhUWhObDBzdEVjY2ljbzdR?=
 =?utf-8?B?bGJrcGVUbkFHbDdMaFZubThwWWFmU1dZUG5aOEhzR2VTL0Y0WFRCZUF0K1do?=
 =?utf-8?B?VnZNRHhJRkdKWDcwR2VvQjZSWWtWdEExZmgwZThUbm14K2dMRmp1Y0hZR2Uy?=
 =?utf-8?B?SVdjOHdPYS9YbTF0RWdCNURXWHhic2wraTFqL0hOUVkvSDhRQlFJd3o3aTJl?=
 =?utf-8?B?elgwSW45RzhPNjFPRFJ6VythSmx3c3pMZHFMVnNCeEROSE5Canl2Y3RZZENP?=
 =?utf-8?B?OHozaStJSEpzeWdZZno4V1hSL3F1Wisvem1uUGVnbjV0NUFpTlp2bzI1SFRF?=
 =?utf-8?B?Tmg2bnpnTXo5KzRoODZyeTNta0NqQk8vd1c5STNHamRCdXlHNmwybkNNSS8y?=
 =?utf-8?B?emVmM2pYb1JUNUhnZ0lLZ3ExVEZQMTF4L1dMc2dIVlRDWDlRUk5paE43L09Z?=
 =?utf-8?B?R2x6SnRtNkMzSzdBVzY3cjdzTW9FZ2xDazNwWlhTbGdZemlFd3hqdlVzcEda?=
 =?utf-8?B?a3lMNXdlVjNTSTdmd3JySzAyc1JlbndycHBEdkljYUY2c2I2YXNOSU9TOGRu?=
 =?utf-8?B?Y0czcFdDWFZKMTVZdFB0V0xtU1VGVVVXb3ltTEs2RExVcklDaE1IdjRyNklO?=
 =?utf-8?B?WElFUkNCUGdNUDRmWjhNRDFBZEprdDRTc2VEL0g0ZVpvRlZsSGI2VER3cDND?=
 =?utf-8?B?YjVhVWhoZEpGZS9tTUE3OXhLanpoZVVOVDJYeVcreWtwWXlJSmNOejcxcUtZ?=
 =?utf-8?B?SXJxeWFvY1JmSmptT215QU10MXJyYkY2SFpDS1VXbGJRY0puazk1dHE2QXYw?=
 =?utf-8?B?eUN6bTdpYmtIYXZsQmhHTDlpQXV5Y0NWMEVJMzJvY01ST1FCOUJlRmJjWEFM?=
 =?utf-8?B?QWlVSEk3Q3hJcWxncXlpQ1ozN0xmNXd5L2lwb2I0b29TZWVZTW54dDUxYzF0?=
 =?utf-8?B?TjJHUVAycmJVaWoweTd1MG5zZVp6L3piWDdFWFI0ZFN3QkV4TWkzNDU2N2Ur?=
 =?utf-8?B?R3dqUzJvTVJML0tObGJHYzV5Mld5d3Vmdmd4aVR0ZGV6b0pOTUlvbEwvNjI2?=
 =?utf-8?Q?Blti1TfvbOdef2S45OG4HNI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVJoSFdLbWtFOXZkQU1sNlJLbWRLREQvYzdJcHFKQUpPZ2x4WHZRR0lMbGd0?=
 =?utf-8?B?YXdaZktwa1QzY0swWXR5a3RpeHJOODU1RUVCVVczQWpnSnQzS1VSWDVuVFJs?=
 =?utf-8?B?R01pZEN4bWgweHRQRW0vY1poSkEySG9IOVlMcEErcGlGcllUQWNsWmM5TVhT?=
 =?utf-8?B?Y0RtR3RvNjZ2N3RPTXlqZDJONEpSdE5uS2ZqclVacEk0ZENOdVZGQ1hNOEJL?=
 =?utf-8?B?eTZTTXcrcldxMDVrbWJiRUp0ekZRNEVCR1ZGbEN4Qm8rWWNKMkxEZDFiZnJX?=
 =?utf-8?B?TUdXcHdpVWo4WU9seU5WQlcxS3pVeENJYUhHT2NpaFZpSC9scmIyR0cyWWVi?=
 =?utf-8?B?WHZ4TktocEphcTJWY24rcEw2VC9tMjlHRzlpVFNMMS9mY01wS05MOXlBYzJk?=
 =?utf-8?B?alFqd21PS0VyM3BCdlRidHRzV3RNZktwTTFPQ2lJY2RQTVkxQ0ZBelBkUnJn?=
 =?utf-8?B?ZmpEOGpRUTZJM1hGUmZaditPRVF0cE8vY3RPc2lCMWp3SDBKRFNTTWE1Z3NZ?=
 =?utf-8?B?Uk9QbzdXUm5hRXRtdlkzT0U5dElUSTFzRmoxT3U3eGFNaXBSNUZUSEdsaG1I?=
 =?utf-8?B?TmFaS2NteVBQL2ZUQU9KV3lkN1k2Y2p2UExHTjNJZEM2U2tjc1E3OWhPU2I3?=
 =?utf-8?B?M01DU3k0dStuVkdhZHk2NGdhWkppUGYrM1I4Tm5lL1hTYU5ScGdsVHEreWJQ?=
 =?utf-8?B?cHk3Uy9zdEI2MFpNbHQrM0pnaDZOcHQyRDViUkthSGZJNThSTCtaREJndzhV?=
 =?utf-8?B?akV3UktORmxYWWYxb0RrVkpEWW1MdVlKMkJKcCtaWm5vM1cvSTFzSHFIYldr?=
 =?utf-8?B?RGtkeWRzaS9tWk1MSjRVMmg4alhweEhWcm9DOFp6dFFITzhYbXd3M2lub0c4?=
 =?utf-8?B?UGlhVGxINVYxelhuV2ErbkJtZmVTcGZJdUJ1MzlkZUJNMExwZEYzdFRXZmwz?=
 =?utf-8?B?Z2dycmplL2ZiaHdLVFFua21vQXlKQTcrT0lmTnVJdDBzNW0rOS9LUVBScnpv?=
 =?utf-8?B?dlBTc1JBYzZHOFl4NWJNVDM4RlZPMk0yeFZxSzRpZ3pLRzQ1U2VLY2NVck1u?=
 =?utf-8?B?U213ckNNbmZRZlZKa3hIUmd6TW02YlZ0bGhtdTVaS09qeDlYbENPZ0g0YWl0?=
 =?utf-8?B?eTNmNElQM2VnRXNrc3NSU0RJUDhqYzFlaTNoSkVWNjByUUhxaTJEdWtIYm9q?=
 =?utf-8?B?TWQ0WnVDVUpZcHl2dE1oSno2RXVDSDdnV3J4ZzJMTzVXanlFdlhWRlZrL2Ur?=
 =?utf-8?B?SVVnaTg5cW5BTFZONWpuU1RoVDdYSy9QcGUraXdhaGtHUVQvMTlvRTFlSFda?=
 =?utf-8?B?QTJ6emMreWR4VTc0L1dPS3lORlV0WkMwdEYxTi9WVnYyV3pCOGlIa2NXNEdj?=
 =?utf-8?B?WTRWRWZ0OVkvYzBxNmdGY2IvVU0rRXpDRGV6UEw4Z2NMTzRwY1AvSVZHYTNX?=
 =?utf-8?B?T1FuL0ZWbUpTS1pYVGtROG5oK2k4RGxTQjRHLzlseFhKdUxEWExhYzQ2eWdY?=
 =?utf-8?B?K0x1RDJIMmlyVkd1bng4TzJPaXVJTU9pcjhKMjU3aEJKWExpV2lYRFJxaCs3?=
 =?utf-8?B?Uk5TeFZsV0l5NGdsWmtUUGYxdkRkM21admxDbGhMUlBxbG1iSXEzQjhSMFAr?=
 =?utf-8?B?K2d2Z3J1TldRSFA5WVdDaTIwZ29YTVQ0OHo0QUpybHlmRXVabGNUUmZwMXNo?=
 =?utf-8?B?N3JpLzU3eDlwakNLanFGTXRTWjNudnZZUGVCNHZ5ejYvTUVtajRCQndpblBU?=
 =?utf-8?B?ZnJ6d1dkN3F3aG1sYmpndTlqWktwbHdCdUR5Sks3UnQxTlVRcXpzQkw5MGl2?=
 =?utf-8?B?c0RTemV2cS8xUkVWUU0zT1dqY2s5TXRQQnRlWHRzZGZyeTFNVnI5Y0tDZWZS?=
 =?utf-8?B?SFprVXU3dnI1MklDVU1Mc01ibnRYcGphQlFsREo4VkpZMXlSSWo3R3VOR1RV?=
 =?utf-8?B?NkUyeEJ0SVVrZnI0WnN6WnhRY0k3Z2gzNk9EWVRZUGFzbXJndzdZTGVaUkdm?=
 =?utf-8?B?aHhPRk9jb0dKK25uelBBcnFPdEFyUTVHbHV1VXJ1eGFvTUN5YkRhWDRVbzYw?=
 =?utf-8?B?dGtLUTRDQSs3bER0RFl6SThTNlNhWVlQMXJGWUo1WlI1aW5iRWxLTzViSUxj?=
 =?utf-8?B?OG5JN0k5dm5LUE9jUEdIbWRmQklXOVMvTjA5WWpQZHJPaWI1aEpDRVZqTDJT?=
 =?utf-8?B?K1NvT0dybHNYWk5YcHc1OXRXbStHNDNnVjlRam5aYjkvTERxYWpQeUJESHNZ?=
 =?utf-8?B?c2xFTkJyYkN2dTVEb0Z2NzFXRnFtYXV0a2hrV0loZUl3OEllVVp1ZlN6NmVX?=
 =?utf-8?B?TVR3UE8xL3J5WWJsRURCR0JjQ1dQdTBqRnZEZTlWSzBoVGJwY3NGZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C42A4B995F776948975B70C57BDF9B2A@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f370e31b-0322-4426-4dee-08de65a9dda1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 18:02:17.4468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5zz7LfhPNR3qXUYFUkLPHWsTVL9/ZyFHVf9/LU7TT9VHzCYvKV5QvlUOIkTNkVegw6YSNA6L2UFWunxz6CZLMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840

T24gVGh1LCAyMDI2LTAyLTA1IGF0IDIwOjIwIC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ICvCoMKgwqDCoMKgwqDCoCAvLyBUT0RPOiBzdXBwb3J0IEdBMTAwLiBJdHMgYm9vdCBzZXF1ZW5j
ZSBpcyBhIGxvdCBsaWtlIFR1cmluZywgZXhjZXB0IHRoYXQgaXQgaGFuZGxlcw0KPiB0aGUNCj4g
K8KgwqDCoMKgwqDCoMKgIC8vIEZSVFMgc3RlcHMgZGlmZmVyZW50bHkgKHNwZWNpZmljYWxseSwg
aXQgc2tpcHMgRldTRUMtRlJUUykuDQoNCldoZXJlIGRpZCB5b3UgZ2V0IHRoaXMgZnJvbT8gIEkg
aGF2ZW4ndCBzdGFydGVkIGxvb2tpbmcgYXQgR0ExMDAgeWV0LCBidXQgdGhpcyBpcyBuZXdzIHRv
IG1lLg0KDQo=
