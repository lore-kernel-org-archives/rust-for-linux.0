Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011024.outbound.protection.outlook.com [40.93.194.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28AF291C10;
	Mon, 16 Feb 2026 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229143; cv=fail; b=rHH4HVXQMVWX11OvuEUlZj+WnKSuWnHwVMF7hYbTcQC8+j1vTIEG5ouZDh9SLWznx+7x3NOjc/l3Pd1yJxS05docd0kBiRRSqXgs85WEZzF2lpWVvNDpe8Q7wsZDVRNG02mF3/xXZnlyVe4qAQVsWQzqyUP5fx9QG63KjM6cN/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229143; c=relaxed/simple;
	bh=cEyTgDQ9cKGeztWc5GELvbUozwxNkpOYOjBhAdc8DUY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Z98DfRQrasGMPBsBssJ2IG69gU0xKQkdsYCg+P4NK2KLmVWgipSL7j8XoU8y+d6ttsRpaoBjM2lGBvKEdTDHU6i/0G2XA2cCKivLsDqRxvm8jZoWRSIfT19UNa6Pm/t+v1oMzSt1YZslTr8dYVA9QZZEDk/PubZF6EUCX+8OZeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JHytUbSt; arc=fail smtp.client-ip=40.93.194.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JHytUbSt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihb/5bsXAlfZvOwxOEQ9GlJwccpwUIHo1DzbQeCcv18Kn3WiqC1pI9z4Sq8MsKtDKzUmj5Y11brSZ8cvhs7CGDqogvS+BJnH9Zu4pLmctcq6Dh9be2gdMxhPiGceIgRzdNfesReqwlxsV1lgW1ngTy/auPd274FTmNDooOU0r6+ug3CnfEMifr/tEuZqswxBUzZdn6bYKB6xeSc7Qo+8Xvl5b6M7r+I3Hl8XIlVwnZoHxjOOwwvzt3OEqYm8vBVoRnN63/xDQTQGrnRR+d19cjBOF8oFGeWHgQE70r6lAevVRW3nhE229RjcNTpJaabxaQQAMTMwYX/Y5bpBQ3gBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9KkZBfK3rEd1RCcnNGR61Dg/xiq8tuLJdgoWvCbNg0=;
 b=Mnyr3BZXVCOdiI4E1U0/YRZzkZu2EWb8kc+Ck9qk3dTohggJHfNMSoO3szz8yyDcTJHWlkVZ5xq1/aFCdazZTCilz2a/4SihXv56+eRr+7WrB8c8ECV75upBcQmbXzwzt4mN0Fm/6p8NctafKKt9BMY5NU8BYwXZUvofeiuQ3df4l5dBOA/Fs7sd0gPFHjXH6d3HnT25x6m6JZASbN5DTg/PrO0FTMVY6HBNLT6p1oy5Ujv0NAV3NfJ5D8N/0ELVZrS1ioXP+Z38aYuPQ0pc9I8Utk+6boCq6ocBL1Z9BT7y8I1ORxD/ZgCLcBn2rgwQYoC1agkg1yDvhN7HpSDAdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9KkZBfK3rEd1RCcnNGR61Dg/xiq8tuLJdgoWvCbNg0=;
 b=JHytUbStHdzvuZ/jLFfVao9nuIywU4gOhoHSnAGLRUI0hNAuKyXdwPxyjAqD9sCihUrlhebOoba91/twzSNU9L6raSvHSkuFgYlVtvVgkCA+AgehZUbo0PHza8H2GnXHr1ThuQNac0U9MQEDkwzfoNRGQEaUCraUUtTRpO3Hn7tiUrPffRz1P50oUl2RsmR1frx6Ggo61PzYiMCHol1ipcER4SxlO6pG27/FKCwZfyHACe1ccqmT1FPtssXylNnzQRXbIxYTJ38lDBG3HzAeoA/dLNuhse1uIoe6sp3EP+gxmTPrKoYeqdhWXvrQz7VTGxxWL+L4afabBkrxPUku0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Mon, 16 Feb
 2026 08:05:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 08:05:37 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Feb 2026 17:04:44 +0900
Subject: [PATCH v6 8/9] sample: rust: pci: use `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-register-v6-8-eec9a4de9e9e@nvidia.com>
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
In-Reply-To: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0013.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da74bda-7376-4d18-7a01-08de6d322aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXM2MGh2eXR1RGdITG8ra2E5Ri9mSm1vUzRRV2xKUU5TVitmWXN3eG9oMEMz?=
 =?utf-8?B?NEdUOGhyaSs3N2RiT21sQ1pabGI4c1pWZkoxWk5HTDNJajhoRDkxRElRZXpT?=
 =?utf-8?B?dUNVUDBES1RDYXZ0d0JFeklsK0VYNDZiblV3WEtkMlo0dHRTdWpVNks2REZw?=
 =?utf-8?B?RjhzTmNwZG9yaWVNSy9NbzdZbHlrdExZZGZIMk52Uk50ZFoxUUVwSzhNMFlM?=
 =?utf-8?B?OXVjWWtOVVR6eUIzMDc4dSttZG96T0h3UW5kWHF2K2lSMVlSU0g2RTZFRTNr?=
 =?utf-8?B?am9yUCtYQzhveXV2c0ljSHFmU2VkMVVJcXpoSkN4anczSHlsd1B6TUVLYVlS?=
 =?utf-8?B?L3k0aEp0SzFOc3BGeGFhTmJsVFhkSm9jSmNLQ29TUzY3ZFlKcDRaN05YUEdD?=
 =?utf-8?B?MlI3a2xQV24vVEtCWDZzZDRSNCtDMWowMkRoZ2tleGNycDFBWmVoUDZKV0Fp?=
 =?utf-8?B?OHlBOHBKMHY5TTBQVFpFa1Z3NTV4R205MlR0RU96MEw1NXhQTS9uWXAvanVH?=
 =?utf-8?B?NjFYUkxCc0tzbHZFV3YwT295SG9TNG1qY1dyeUNrZ0llTERzbWp5d3o3OVl4?=
 =?utf-8?B?bzJObGtmOUxVN0x2RlFhT1JXZG5Yek5xRGQyZ212Y3NFVGxxNWdwWS9pNTB5?=
 =?utf-8?B?QVlTazd5a2ZjSlMvVGEwRTV6SnBocXJseXpaZVZWSHk2aFFZTUdIcDZDM0lY?=
 =?utf-8?B?S3ovaUpXcWFmSnFiMnQzcWtsb203dXFleCs3VUpnM0p4K3RMakhTSWZCcmxM?=
 =?utf-8?B?TzQ5SC9NblhMZ3FkajIzbTRKNlorOFNYaFNKNjZ4UmJsdWNYVnRuYnB5bnpY?=
 =?utf-8?B?QWNXWU8xTFVUVTNJc2pOWG5KQ2RjUURNbmZyOTJmUlE5dUtoSm81WFowT1NN?=
 =?utf-8?B?TUxtMXNqOERnRFJPZUszc2k1ekhEb3paOHZlZG53UnVGK0RmZ1ZaTkJIYXIx?=
 =?utf-8?B?eUs2dEdPSUlQU0xqdEtLNGdMSlphNi9lcEV1azBTZ0FBaGcyZHJHc2JVQXkr?=
 =?utf-8?B?R05EcFlZMFFjMTY5Q2lHY1IzYWd2V3NGL0J3WDN4Z3M4Z1kxTXlabDN5NE04?=
 =?utf-8?B?S0sraTVwY1NEOWp6dWNWNDNGNDFEaTR4cXJDUGxBcUxYa0lucUU5RGt2aVBu?=
 =?utf-8?B?WWxvZ05PNGlrSnNtaFJFUk4yZVhpdHFMc2t0cHNoZmxvWUhEdUc3MjNJZnVn?=
 =?utf-8?B?NDNsRVhLWmRtMnVjc2FzOEVRaVZZOXN2R2c5K2hXUGFxcWxqVDNrT1JCR1B4?=
 =?utf-8?B?aEt4cWc1YnFURWFvcjVOVW1GTWtKbnNOQnpjaHhrTm1IVDdidVBKMnVVdFo4?=
 =?utf-8?B?dDFsSDl3NHpyRDgwNHQ1NzU0dEpENXRaS0RrUlpvSStRcjhVT0JtQmlrTTRq?=
 =?utf-8?B?TE5VektFSWdEN21JOHhZUGJBcFVTWTE2LzNlR3VVVndXdXJlRHQ5bVNMU3Vp?=
 =?utf-8?B?MlpYaFZqUWZDM3ZNY3hVRVVuZ1hRa0xOUXRsNThFZ01mQlRYYTd5RkRrNzE3?=
 =?utf-8?B?cm0vcVF5OXU2aVUvSFVMeU9ac25kU2J4dXlBeG9WdFhuYmk1clJWeC92UDBY?=
 =?utf-8?B?N1kreFM3QkR1MWw1ZTNaM1RMMXF3RUNvY1BLM0RNLzdHTDVEcThuaG5VbmZ4?=
 =?utf-8?B?cXljdEdxTlUyaHY3bi82ajl2UThzaXR2M1M2aFJtUWVLVlpoaUNQRUpCaUFG?=
 =?utf-8?B?N1lTa3RIL1l3UVFxLzliZVBVOG5lZHBoOFd3ZDc0cjkwTnZycDlWOUNwUWVj?=
 =?utf-8?B?dmdZNGxGSGZoWnRyZmt3dFY2RkplTGxyalRvdGVXYUNwMy9iQ3J1amhlV1d0?=
 =?utf-8?B?cEtuUTA5L3kvZzhFWGM3ZmNkbERMajIxWHpaM1hJQStqWHFlTDFUQnJ4eTRo?=
 =?utf-8?B?TlBCZ2lRZmhRbENqNlVvU2R4MCtDZW1qajNQWEZvZThrcEM1VDVjT0dpT3Rn?=
 =?utf-8?B?Zk9HR2gwOGZCSlFuWnE1ZGROTlBaSDk0a3BGZWR5YmY3dGpzTkd4VGhjaDd6?=
 =?utf-8?B?UlBvVDcrT1AxaVdGeVRlMkhwYmdPYjRWNkdMMzVQRGFiRzhkNWxZV2RBbTVu?=
 =?utf-8?B?ZmJlcjYyU0daMmV2b2p3c3c1MCtYcVpWSERIYVpsZDB5dTUyb3IydXh3L28r?=
 =?utf-8?B?NFBkMGVzRkhuMzEvTTlnZ3orZGpTOE44UUcyK1QrRUV6VExnM2NmTFNLaUVQ?=
 =?utf-8?B?OGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzNHMjhRNnRvR2JmK21JVWpMd3ZoTEQrWUFySE9uZTNsRUxTZ2VheHpBY0Fk?=
 =?utf-8?B?LzVvaFNNSDNUUWN3LzR6enBlS1lNMmVZTTQyNysxWlBScGlOZXdBL1NJeU03?=
 =?utf-8?B?SGx4eGk5V0t0T0xuSUxBeTlMQlF1ZXAxczh3dnZ3SXM3cG0rZjZ5Y254T043?=
 =?utf-8?B?ZlBlVldFR2Y5RUl6M2Y4Z3RldVFFWlo1cjZBL3FBR0hBSW5lYzJPOFg3Zktm?=
 =?utf-8?B?V2JuZklmS3FxWTNCdkp1K0kza1cydW5QaXRqZTR4QjhROWovUUMwb2NkT0k0?=
 =?utf-8?B?RG5iV0c4TWpHOFNMb0dSdy9Wb2IrdXc3K2NuQzNsZmx0R3ArSU1RUzRNT0M4?=
 =?utf-8?B?bmdObHYwQ0dFRmFKT3RCbnl1aHJnekIvN0pHVWt4WXQ3ZTRvOHk3T2s3UXBV?=
 =?utf-8?B?UDRxSDFXaW4zL2J6WWVvUGVXUllJd3dSRE9DSkRsY2FPcmlZcTBLY0kxQ1Fq?=
 =?utf-8?B?QWYzZENCTWRsMUc5dWJ6dlo3OEZNWEJreXRJZndSTkxjYVhoYVFrMWNvUWtW?=
 =?utf-8?B?WGFtMjg1ZDlrUDVvRVpZQXN2cEh0dkhSbjRyT2lOWTJBcGNDWEJ2SmdTMnJ0?=
 =?utf-8?B?VFN5WnUxYTJTcGFlZ3lrL3MrM2NYcnhWNnNoTDRGaml2NXdNclJGSVRTbEZa?=
 =?utf-8?B?eTF6dUp0MWZyeU9lRDVxZUJzN3lWaXJETEVsR2VmQjljeFlZUW5TTFQxcmQr?=
 =?utf-8?B?UG9KcnNiTWNaYjFDbjBZMEluZ3A2am5SclZjNmVROEdFR2R0SGp5NCtvWklv?=
 =?utf-8?B?bHQwL1BFeVpQQ3RXakNuWm55ckxOdGdNRXkwL25iVzkycU5YL2FKTGtYN0Fm?=
 =?utf-8?B?Vk5lckRMSzJIc3JPaS8zTmxCRnVyNzlxRWxSU2xWOG4zVnVraWcvYmgwcnAy?=
 =?utf-8?B?V1M3ajVuSm9nZHFpTHN0TWVBME10RWV4QUd1aUJsejkxSkFldDZPYmVCeHNk?=
 =?utf-8?B?NEkvZlViRmFPTXVnazRpZUtPMXhyYWdaemx1N0FYeGFjRDRwSG1lNzdqcm80?=
 =?utf-8?B?d2UvRmh6amJhTVd5YXRJZXVRbSt5RFdUSW9IQTJieTFZa0NFTXpjZ05NaGIz?=
 =?utf-8?B?Y084R0hGNjdwbVYzdVVwekJkYTNzZDYrbEVZSjNHQTRZbkdZbU9yM3lDMWxU?=
 =?utf-8?B?SFNtV09PTVhqZEpHS25YWlExY1dOM2d2VEtmUDU0Z3hLUml1em9MVzZnSHZS?=
 =?utf-8?B?dkdPaUljMTI5c0RCMVVHYkFIVWVnOFVnT0E1WDRpVFEweEFXa0lKUDVZVDQw?=
 =?utf-8?B?Y1V0bE5aRkptMzBzUEdWSzBQajhDN1pWTkFXdTRkZWIzV3dmbUVsbDc1dHp3?=
 =?utf-8?B?VmVmaE40blYwOWFIUEZSOHY0eWVac1RWbmNNQlJmZ0o4OFBybUlsK290dEgz?=
 =?utf-8?B?N0hWZ0FsazRMczdyaTJOY2YzT0p3ZVVWelpGWXg0ODlPYzNTU0Q1TkdmVUtB?=
 =?utf-8?B?SmYzS3o1b21QUjVYbzdJUHFmMXNsd3ZwTllTT0ZNMlFrTTFPSy9naEx3eHB3?=
 =?utf-8?B?SXA3YTA5c3VPUmhxdU1na0JFQlNvbVRCQTJqZVRHTGJweE9xTUJXVjNVQ2Jm?=
 =?utf-8?B?WlJsZWphWHpTYnpXVmp4c2xUbG1vUjRjaXBnbXRSRTBEOHcrK2tkdklkb09D?=
 =?utf-8?B?YkNwTVBtZFRwU3pZc0JjMUlKblpGQngzdFViZWhGMW53UVZReHlRRXp6SWw1?=
 =?utf-8?B?V3RLNk1LVGZyOTV6N0RzK3ZyTEV6RUg5eWZTVlJwWDZBY05lWmU2cWQ4b0Uy?=
 =?utf-8?B?c1c1VDdEMlBUVHhYVTd3YVY3dkpoSWVQK1FNemxyckt1YkhESjBTYWkzdGVB?=
 =?utf-8?B?QkdRUHdycE9vNGhLb1owYzlJUjdJZXNtSjJmWVl6ekNtdW1VcEVYTW9ueFBI?=
 =?utf-8?B?ZW9ZSkxPRWNWaDc2SU1md3ltamRqckVKdVlMZ1g1RXBPd21kQi9YSHJCK2pC?=
 =?utf-8?B?bmI1Ujk4elg5K0lJUEdSVnFpelNhUjMza01uYjNPaVFkNWJEdXZ3dWlpVWRX?=
 =?utf-8?B?WkVXVTVjVVZGa2s4VGRXRXJUSVl6ZkVRSktQZnFDeFBLOUlMSHp4aHBEYVhh?=
 =?utf-8?B?WmhvNlhGeEV0M2ZSbjNnSmVjZGNnV3ZsaDR2c2xVZk9Sa2tHSGwyemFJaUww?=
 =?utf-8?B?ZkkxcHlTczlhVXRteXdSeXhrSm1nclJtV21yQlZWRnRWbWZQTUdwbUdReWxr?=
 =?utf-8?B?UjBvNUg3ZS9kWW9wQ1lSSTgwQllaT1pwZVlqanJHSHMrNnpqYUJmRk5EZjln?=
 =?utf-8?B?RjAvS0k5aUhqMUVwMmNFNndMNFdBL256eHZKTUNXR3ZZZlVSd2NQM2tzOHk4?=
 =?utf-8?B?NHZPQ0FKc0NRVzJHR2FCVU5yYmFtdDlvcm5mM0pJZFRTOGhGSjRSQ1BjQVEw?=
 =?utf-8?Q?KoHxClnJWajT0U6dIr/YegNVJg0g6O1BQxc9cwp3WHlQZ?=
X-MS-Exchange-AntiSpam-MessageData-1: MlX6R05zM7ySow==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da74bda-7376-4d18-7a01-08de6d322aff
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:05:37.2052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLzwLK6TvR7vaKHAYi/qe6nxeEsoJkkt0FrGMvrTNEOFwcUE5iBHxq9GpHLVWESAYCuZAssnUCtlaRR2SkXEIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5732

Convert the direct IO accesses to properly defined registers.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 samples/rust/rust_driver_pci.rs | 84 +++++++++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 20 deletions(-)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index d3d4a7931deb..f2e1904507f1 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -8,27 +8,58 @@
     device::Bound,
     device::Core,
     devres::Devres,
-    io::Io,
+    io::{
+        Io,
+        IoRef, //
+    },
+    num::Bounded,
     pci,
     prelude::*,
+    register,
     sync::aref::ARef, //
 };
 
-struct Regs;
+mod regs {
+    use super::*;
 
-impl Regs {
-    const TEST: usize = 0x0;
-    const OFFSET: usize = 0x4;
-    const DATA: usize = 0x8;
-    const COUNT: usize = 0xC;
-    const END: usize = 0x10;
+    register! {
+        pub(super) TEST(u8) @ 0x0 {
+            7:0 index => TestIndex;
+        }
+
+        pub(super) OFFSET(u32) @ 0x4 {
+            31:0 offset;
+        }
+
+        pub(super) DATA(u8) @ 0x8 {
+            7:0 data;
+        }
+
+        pub(super) COUNT(u32) @ 0xC {
+            31:0 count;
+        }
+    }
+
+    pub(super) const END: usize = 0x10;
 }
 
-type Bar0 = pci::Bar<{ Regs::END }>;
+type Bar0 = pci::Bar<{ regs::END }>;
 
 #[derive(Copy, Clone, Debug)]
 struct TestIndex(u8);
 
+impl From<Bounded<u8, 8>> for TestIndex {
+    fn from(value: Bounded<u8, 8>) -> Self {
+        Self(value.into())
+    }
+}
+
+impl From<TestIndex> for Bounded<u8, 8> {
+    fn from(value: TestIndex) -> Self {
+        value.0.into()
+    }
+}
+
 impl TestIndex {
     const NO_EVENTFD: Self = Self(0);
 }
@@ -54,40 +85,53 @@ struct SampleDriver {
 impl SampleDriver {
     fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u32> {
         // Select the test.
-        bar.write8(index.0, Regs::TEST);
+        bar.write(regs::TEST.init(|r| r.with_index(*index)));
 
-        let offset = bar.read32(Regs::OFFSET) as usize;
-        let data = bar.read8(Regs::DATA);
+        let offset = bar.read(regs::OFFSET).into_raw() as usize;
+        let data = bar.read(regs::DATA).into();
 
         // Write `data` to `offset` to increase `count` by one.
         //
         // Note that we need `try_write8`, since `offset` can't be checked at compile-time.
         bar.try_write8(data, offset)?;
 
-        Ok(bar.read32(Regs::COUNT))
+        Ok(bar.read(regs::COUNT).into())
     }
 
     fn config_space(pdev: &pci::Device<Bound>) {
         let config = pdev.config_space();
 
-        // TODO: use the register!() macro for defining PCI configuration space registers once it
-        // has been move out of nova-core.
+        // Some PCI configuration space registers.
+        register! {
+            VENDOR_ID(u16) @ 0x0 {
+                15:0 vendor_id;
+            }
+
+            REVISION_ID(u8) @ 0x8 {
+                7:0 revision_id;
+            }
+
+            BAR(u32)[6] @ 0x10 {
+                31:0 value;
+            }
+        }
+
         dev_info!(
             pdev,
             "pci-testdev config space read8 rev ID: {:x}\n",
-            config.read8(0x8)
+            config.read(REVISION_ID).revision_id()
         );
 
         dev_info!(
             pdev,
             "pci-testdev config space read16 vendor ID: {:x}\n",
-            config.read16(0)
+            config.read(VENDOR_ID).vendor_id()
         );
 
         dev_info!(
             pdev,
             "pci-testdev config space read32 BAR 0: {:x}\n",
-            config.read32(0x10)
+            config.read(BAR::at(0)).value()
         );
     }
 }
@@ -111,7 +155,7 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Er
             pdev.set_master();
 
             Ok(try_pin_init!(Self {
-                bar <- pdev.iomap_region_sized::<{ Regs::END }>(0, c"rust_driver_pci"),
+                bar <- pdev.iomap_region_sized::<{ regs::END }>(0, c"rust_driver_pci"),
                 index: *info,
                 _: {
                     let bar = bar.access(pdev.as_ref())?;
@@ -131,7 +175,7 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> impl PinInit<Self, Er
     fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
         if let Ok(bar) = this.bar.access(pdev.as_ref()) {
             // Reset pci-testdev by writing a new test index.
-            bar.write8(this.index.0, Regs::TEST);
+            bar.write(regs::TEST.init(|r| r.with_index(this.index)));
         }
     }
 }

-- 
2.53.0

