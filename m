Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010002.outbound.protection.outlook.com [40.93.198.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA422367D1;
	Mon,  9 Mar 2026 21:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090347; cv=fail; b=okHfuGhoaB7nt0DvIrqltOSQRt1o9immYgs2cSmg4RcoNjei4Kg6uknCpV9veIFFrR0BFpcj1HxYiIvQyv6IHueLlMJ9Tdd0IDlrcp0XANsjOdaql+m8KJGjVHumTpEhko4AL8SBbzdmaWMF/zzU3Z2UdCMvcHOha2+TnwZkfEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090347; c=relaxed/simple;
	bh=mYAjC5641eC/hS6mUqYIvQZjXxjwQ8pasJXWUAoIB/Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g1DH/weQI2ep0y+BQxcNDwuThc+Ok+rJu4fQm+4VOa9gLBji315JeKSIhgepc9yhpsEPOJGMcRa+jI1sASzwKJWl0hwnxALJ8QkK3dF6WD/UZqrlmUcO3J7hyeMltlCjbf8y8KC4HCj0hXr9hfHRblvMhzeC/I3DhpsYzAPDwno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Vb1+XRCM; arc=fail smtp.client-ip=40.93.198.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vb1+XRCM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2VrzIkFoUAY5pTHqq+OEORmB1bEOALfQ63LiD793RKQ/2/q0Y9KGAUHRRca6onTUgi4kBhKQv1NdTyjAItet80jFzKX58qrmC5gzqJtEmVDaAudAKvxU6u3ofzQklYSLRbMRhrAmgKltVxm3COkhG7+c7a2FAnhfQ/CVPWqGZs33aoAmmcxSTt1i7tPU2W4D+pJ4wxxNrQCIpK+2tnAvOyKWWG917e9JIVHGXYYdXP/yPx7K0FguHTw7kt76VfPzrVksuMHzFNrWIyrMZbo7Y2abWhPHGtj4dCov+nqVcBm3xXKqzjBSEhcrb//ksQ12K1iTlPTi6rRNjbdYbC9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYAjC5641eC/hS6mUqYIvQZjXxjwQ8pasJXWUAoIB/Q=;
 b=gXbsnsjGj7XKtmHrkIdXkA1tWHf9u35ZR86nHCiMDH0PIkCabLFSaZS+7sU1QvkzUg/j7G6EcxEb+L07YHaWJBuvq8bQZKC40+dMLFsIsy7/+ECTvxwt3L030LkgR9gFJYPA4Jg5AeQ18o7r6kGUYxXaP64cjyEkgU3fkhK/Msm7aGVtVVGa5RW+foNgKCXiikjP0wd6q/yqHgBTE8lUJAoC60o84EK0JncJG5k9sFTNCl+92B1/PMzPEbI6DA999gs/lglRr4x5BhH1VRXTm9qjrNd9yCdthwJeh2RE32Fu0qJN88EkD3tSLzH/+SCHZVah70l/dBO/z6MFvLhjgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYAjC5641eC/hS6mUqYIvQZjXxjwQ8pasJXWUAoIB/Q=;
 b=Vb1+XRCM/yoRBWYivITyq2GQGIxe/7X3FH92dDN1VZY6X71vBhYHEkHHM+3Gy3elolLo18+GJUW1CxCg5pV+uDZrSv0/rRoV3r5eg9gZhz8+h+wPaAZu4zV4+3X8XM/fkxkGwqyH4eF/KaTM8+zY5bm7GFin/ahFsgVvUBL/wq/gcCIevQ1AvsAzbHw1VBZIzk+KbkBsIlwNHn1UIgCRtXenf+N/zZwD+5kX4EmcF3mRbCrfARCCdiEpcDTtks0fG/3vKtZb3IKdqxi1HRE+pAM8w4sBGTOHlPQg4J7MMh/p1TuaaOV9dU1I3lJBHpve5PIcSMYJuyxOmez9CZTKyQ==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by BY5PR12MB4161.namprd12.prod.outlook.com (2603:10b6:a03:209::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 21:05:41 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 21:05:41 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ewan.chorynski@ik.me" <ewan.chorynski@ik.me>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "airlied@gmail.com"
	<airlied@gmail.com>, John Hubbard <jhubbard@nvidia.com>, "simona@ffwll.ch"
	<simona@ffwll.ch>
CC: Alistair Popple <apopple@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
Thread-Topic: [PATCH v11 00/12] gpu: nova-core: add Turing support
Thread-Index:
 AQHcrSUU5EX/S9sMckG758uYAhOBAbWmoSaAgAAEZACAAAPgAIAAAzkAgAAIfgCAAAGMAA==
Date: Mon, 9 Mar 2026 21:05:41 +0000
Message-ID: <5390ee90b722b29e686d948bc855da1eb62a4f6b.camel@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
	 <DGYIFHP99CQ3.2XWVRPO9O1E1D@ik.me>
	 <282984b6-a0e1-4e3a-bb57-db817b7e9249@nvidia.com>
	 <864ab8a502db872468d7b01e0adfff386d2187cc.camel@nvidia.com>
	 <fa3c5390-aea2-45c2-89ef-05a64070a44b@nvidia.com>
	 <DGYJY8VKR9EK.1XPGZ34UPJ0B2@ik.me>
In-Reply-To: <DGYJY8VKR9EK.1XPGZ34UPJ0B2@ik.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|BY5PR12MB4161:EE_
x-ms-office365-filtering-correlation-id: 8c7c5a2c-168c-4a38-9415-08de7e1f9f53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 axBlWedkTWp8Ise21StOgiB1mWaHOsqhLFcfI5PIJidbdDaMQAgxczNscT+4KTW+szVTBP1QBUmuSg+ILMeozGwO0MqcVylnp3P8dcR6KzUfzHMknmL3ZthhOr9FXpPUCKTPmRCMqrznwnZSh1IEfkMAA+ieEacWhTRTfBLEavAjvFnb0F/7QxxnYSGHU0KKrAJdQUWwW7i6u8tclhLHggwWuuCYuHN1Msx2QhVEFqAug0yKD6u0aTqmITe7mbPVlncfbO/A/r3T1NOHF3BDzpF60dtGVUjincWGDBmZuV9+oTCPzMskpcQ3k4VlIo3/wv00QdPviYwVGOiJNkdaLAYog7+8NNQYJzXDO1psBFORrSHBsrquW7+tHM5V2OtqaddstV7hF1sc36eLR8NHqVRk2YMenHO+PVaAE1M/3AMmTCNce6FgJ9Ln0+gsfrbUSTF4CJ9w5jjOk23LFq5MlOSIZVR3pL6FJpm6QEbTJMilN6UPOFBTly3D2/9Voi4OJqksXBidujjrvNQ3lIPEJ1FB8hS1S7VS9jDS5646Y6VAIVRbkktPxK2mZC6m+hnUk17IodbzTQ9TD0wYWo5suyDHiS8V1sAgeG46Noi9HWRFCBM2MTst3sKWWHhh3gwo7guwn8zMw8wk8nDOFtm2cYldrDK53rslue3ZDFGBIU1/4S6B7sA07FuDGCI4SnvMNn5hsHkeaKN2l1QNbIvSvEPJH1C4fLI5aJ1D0qdR4EzuYa2+/eFRu+8ZG6G1AS8J9ORl//x84Rx5ge6bqT4s6ol9SzwE+CKHHuggUsqzH1Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bW1FYTkxTk10V0VDajFlZExxajB5aFpCQU9TK1Y1VmNoV1lTNEJNdUlFOSt4?=
 =?utf-8?B?dWJsdjFpbEZFeUxnemZTSEV1YVBJL1NsY2lOVGJySm1ZdEdJeHRHUjIxaHlU?=
 =?utf-8?B?bkVSNGhwWHYwTEpjZExjdFBLVWQ3WW12YmZmRGFIcHFtWDRsK2pydko4K3NR?=
 =?utf-8?B?OUR5a1M5QjhSdHlOcjM2ZGp1a0gzZDdVeko1UURPYzRGUmRpamJMRXdyYkRS?=
 =?utf-8?B?UHYzamRyb1ZHS0w4a2IxTTVhaWxtM3dmUVBNL2gvWlZTTTViTlNQNjN3elM4?=
 =?utf-8?B?cy9vb2ZrL2ovVTJ5RWRPNXpyTUppZHhsRENnVzJENjF5OWpLUGlMNmdXVXRJ?=
 =?utf-8?B?eW5ZWllqbVdwY0JTek0wbFNoSmRmdEFHSzlPWVNhdzRqbU1teXBqVEh5aEJj?=
 =?utf-8?B?VnFpT2VETVhTakVXa21nZmRHeHVSK0ZSanNZM05hME9MblhYTXVZbHQrblhV?=
 =?utf-8?B?K1k5aHR4aVVnNVJOV1E1aVN3RkpGSXFBSTU4a0paTitzZFNkWnZWbkY4YTBH?=
 =?utf-8?B?Vm0yOXBDREdSeGF2MkxzK1Jsam54OTdhYWVhZEJBcHhXV3NyVmQwVUJ3d1VQ?=
 =?utf-8?B?V1k3Rlc5N1ovUGdVaHM2cTBGM2w3cGdRVEdMdEZZK0NiTnhobWdrQmdMVjUr?=
 =?utf-8?B?empuczI2dndGNFUrL0FhNkswblZsdXY4QnRFTjV6S1ZGY3l5K1lSNGZuNW5N?=
 =?utf-8?B?R0tNWEJqZG53ajIyM0gzSldxakRFVGxJcjI3TFUwRlozZE5vV0RXd1Rjd1RW?=
 =?utf-8?B?UGdPOHhSbDRsNVVSYlBLcFFud0dtUDY5UHluWThqV1M4cmVacXgzbFR3YU1I?=
 =?utf-8?B?aWdYMDI5aFRncnlzQ1JMK3IyaGw2UFdtNy9wZlAzQTRQNU9DY1dqa2JFdUJ0?=
 =?utf-8?B?aCtvclVJdkdTTFpRKy9YMytJY0dneGxuZmtqUitkNnFhN0E0NVRla3pJVWpo?=
 =?utf-8?B?aldMd3cxa25EOS9CUkRiRk5KQUxwV053MnRzc2NEd3dmOFZ4QVNRQTRwOHVo?=
 =?utf-8?B?cXpQMkhodzhpdnN4WktCWmNkZFl1U0NXMnB0TE5zMjRsT21memJwdjUxNEU5?=
 =?utf-8?B?ZGptR0JmY2JpTjg1QnVqNVpFeFVNRkpNLzFNcVNaRzBOOWs4NVVpcmx1eThM?=
 =?utf-8?B?RlJPR1psWS9BeENtUXVYa2dqbHdkMHMxd0pWN1RVTExzNVlHRHFKa09uOVZE?=
 =?utf-8?B?R29GRm5KT2hKQ2o4NXR2MHN5YlRINW15RzBkMUdPRThWYW5UNS9NMkIrSlVy?=
 =?utf-8?B?YVNmOGI2TDJnV0Q5TlVHRWhua0Q0K0k5bnk4WHEzUzN3OXdJR1JOL1lCLzRB?=
 =?utf-8?B?cjJEaEt2YUxMcTd3VXFpRnBIQm53Ulhxc0x5Q1I0dXpkM01uS0ROQUdCWURB?=
 =?utf-8?B?TXZSYWpmTDViaFk3c2x1dEI0Qk1WVnRidmJQS0ozK0hSN1RlQnZDdTl3MDRv?=
 =?utf-8?B?Yktienc1UGhCd2VkbTl4VlYrTXVKakJQMlJiV2crWHZqcFltak1zUHorTTN0?=
 =?utf-8?B?NFFKUFY3MHR0bkNsOUpqek0zZC81K2tUVmxYVzlQN09HTVd3eE44MWRCV1lj?=
 =?utf-8?B?eWJIbVNZR0g0UFJUK0doNXB0T3lDaFE2Q01NUlRaajBnOW5UT0U1L2JReDBu?=
 =?utf-8?B?MkFDYWJKUXNqOEsyQ3N2TnBoU2ZyTjNWc2tIa3oyTWhqVGg3U2YrSFJpYjdC?=
 =?utf-8?B?OGVhNjBaVmtFbVJHVXptcm1FS0hIekFnM3IweklnekhGRmFkdUQ1SjczNnlU?=
 =?utf-8?B?ZUMzTWJqbkV5bkF0YU84bE5iWGhmZzNQeUpRMDBWSS9iMktBWVFCM2x4QlBv?=
 =?utf-8?B?MVlpMDdSM0lFYXZ1YTlDOWJwbkdiU0twRmMyYjVlUjdCL2szazBLR2RGL1FD?=
 =?utf-8?B?czN1QnF5YlBncUY4aVMwbEovczY3WmpRamZMTEpRVzhWWG1hZXdwamdNdVQ0?=
 =?utf-8?B?bEpjTG5QY1B1bmtOVmxTUlVCaWk2YUFNYXZZOE5FMlRXU2pod2dtVXZWdnI2?=
 =?utf-8?B?djJiWitQRjhOYWh4dXZRQUFkUjU3U0d5WTZVVjJJRmRmTEtRcUs0eVNNdVlL?=
 =?utf-8?B?QzN4UXJtSEVWc2dJK3NPWHdFaGNqYk9rNEFRL2llYjZpb3lFUDQwN1htOUlF?=
 =?utf-8?B?cG42SkE5eG1kODdrWEVEYXVVY2hrelcvNnlqYVkrNFViSkQxSE55R2hOOC9R?=
 =?utf-8?B?VUozZjN0ZGxITW1UK0V0Qkt6RDBYK1JOdHhhTjVlNXgzWW10c0svbTlGM09h?=
 =?utf-8?B?V3RmVUlmNzQyYk5YSzRkYlNxRXJrV1ZxNThOUG53c09zYy9uS3Y3TzE4UWRm?=
 =?utf-8?B?bngyMHNpVmthV2E0b2xYdjB1NTNHTG9wZkpSOHh4WVVGRlM1R1ZPZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DB38CC2D57C33419E32ED0C9FDE46EF@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7c5a2c-168c-4a38-9415-08de7e1f9f53
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 21:05:41.4826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLznnEmKM5V8Bw82p+UxKeL2iHHhEJyX4V9towj/fsbmK0YqkoANi+B2xq2qHGolDyArMBoiPP7AObfSOPLHGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4161

T24gTW9uLCAyMDI2LTAzLTA5IGF0IDIyOjAwICswMTAwLCBFd2FuIENob3J5bnNraSB3cm90ZToN
Cj4gT24gTW9uIE1hciA5LCAyMDI2IGF0IDk6MjkgUE0gQ0VULCBKb2huIEh1YmJhcmQgd3JvdGU6
DQo+ID4gT24gMy85LzI2IDE6MTggUE0sIFRpbXVyIFRhYmkgd3JvdGU6DQo+ID4gPiBPbiBNb24s
IDIwMjYtMDMtMDkgYXQgMTM6MDQgLTA3MDAsIEpvaG4gSHViYmFyZCB3cm90ZToNCj4gPiA+ID4g
DQo+ID4gPiA+IEkgaGF2ZSB0aGF0IGV4YWN0IGNhcmQgYXZhaWxhYmxlLCBzbyBJJ2xsIGdpdmUg
dGhpcyBhIHF1aWNrIHRlc3QgYW5kIHNlZQ0KPiA+ID4gPiB3aGF0J3MgbWlzc2luZyBvciB3cm9u
Zywgbm93IHRoYXQgQWxleCBoYXMgcHVzaGVkIHRoZSBlbnRpcmUgVHVyaW5nIHN1cHBvcnQNCj4g
PiA+ID4gc2V0IHVwIHRvIGRybS1ydXN0LW5leHQuDQo+ID4gPiANCj4gPiA+IFRoZSBUVTExNyBp
cyB0ZWNobmljYWxseSBhIG1vYmlsZSBjaGlwLCBhbmQgaXRzIFZCSU9TIGlzIGRpZmZlcmVudC7C
oCBNeSBpbml0aWFsIHZlcnNpb24gb2YgdGhlDQo+ID4gPiBUdXJpbmcgcGF0Y2hlcyB3b3VsZCAi
aWdub3JlIiB0aGUgcHJvYmxlbWF0aWMgVkJJT1Mgc2VjdGlvbnMsIHNvIHBlcmhhcHMgdGhpcyBj
aGFuZ2VkLg0KPiA+ID4gDQo+ID4gDQo+ID4gTm8gcmVwcm8gb24gdGhlIGxhdGVzdCBkcm0tcnVz
dC1uZXh0IGJyYW5jaDoNCj4gDQo+IEkgZ3Vlc3MgSSBtYXkgaGF2ZSBhbiBpc3N1ZSB3aXRoIG15
IGxpbnV4LWZpcm13YXJlLiBJIGhhdmUgbm8gc3RhYmxlDQo+IHJpZ2h0IG5vdyBzbyBJIGNhbid0
IGRvd25sb2FkIHRoZSBsYXRlc3Qgb25lIGJ1dCBJJ2xsIHRyeQ0KPiBzb29uLiBPbiB3aGljaCBj
b21taXQgb24gbGludXgtZmlybXdhcmUgYXJlIHlvdSA/DQoNClRoZXJlJ3Mgb25seSBvbmUgdmVy
c2lvbiBvZiBsaW51eC1maXJtd2FyZSB0aGF0IHdvcmtzIHdpdGggTm92YSwgYW5kIHlvdSBkaWRu
J3QgaGF2ZSBpdCwgaXQgd291bGRuJ3QNCmJvb3QgYXQgYWxsLg0KDQpBbHRob3VnaCwgbm93IHRo
YXQgSSB0aGluayBhYm91dCBpdCwgSSdtIGFzc3VtaW5nIHRoYXQgb24gVHVyaW5nLCBpZiBnZW5f
Ym9vdGxvYWRlciBpcyBhYnNlbnQsDQpOb3ZhQ29yZSB3aWxsIG5vdCBldmVuIHRyeSB0byBib290
LiAgVGhhdCBmaWxlIHdhcyBhZGRlZCByZWNlbnRseSBhbmQgaXMgbWlzc2luZyBpbiBtb3N0IGRp
c3Ryb3MNCnRvZGF5Lg0KDQovbGliL2Zpcm13YXJlL252aWRpYS90dTEwMi9nc3AvZ2VuX2Jvb3Rs
b2FkZXItNTcwLjE0NC5iaW4gIChvciBpdHMgenN0ZCBjb21wcmVzc2VkIHZlcnNpb24pDQoNCklm
IHlvdSBoYXZlIHRoaXMgZmlsZSwgdGhlbiB5b3UgaGF2ZSBldmVyeXRoaW5nIHlvdSBuZWVkIHRv
IGJvb3QgTm92YUNvcmUgb24gVHVyaW5nLg0K
