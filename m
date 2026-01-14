Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021122.outbound.protection.outlook.com [52.101.95.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE12B339B5A;
	Wed, 14 Jan 2026 18:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768416454; cv=fail; b=ryHW4j7mdQ/V4NoTjPCPUxMyFLn8aOq1UmgEDu8fcUS+CCha6nosRApjSSMcemxIn/PMkDRXAkJ0MgGegjWAPMIpuk0WgUbjnRDxCxJHD7SWmlOkjerJVwUacrdWfueQzxGMu4NVkQ+4WgUCz+GMjsFRAebd4Rk6ARU8qArG//k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768416454; c=relaxed/simple;
	bh=aGx/WTDgwbiqbt0jUldYT4fK+uqNbhXzv0p1Bz9YmeE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=iPnFFMjuK8nvyLMx9Fz6vxU95QMDKCa3przkkaPZDIR5ZW8z7g62QDfRKK5tOxeEGPDFCCEk6P2XVMtzQfcB5KPnN+/vEKwbCY7qpqtcnGmjmEii5JmclhbeBMW9Yw6YyERyBP2AWkxmFHE6sBqNHXSF0zcb72l4y57ETMDFh/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=n4CkM+oN; arc=fail smtp.client-ip=52.101.95.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="n4CkM+oN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fo/2I6pzG5rIam1GEKbWKqFbEbYgcpfx7HzAs55W7FffPAkivXbwfDjfqgEYy/Oc1+CHxcUqqGTXCx/MMBkM1PD/qTcE84aq5b7YnEgfjBIw5noDBbZzu9CPH2fWhSjktHt04ivIV3L9jjcapJF5pTH6Lh7RBsnVVi4UQ79VcXFofrev524WTD9EM2QUvroYgX6b1fCKsstgalKNiueV3BIHPqFGyevktzCbAOY3hnu0DXY2ZXu4eoROq72eIPsfferQsTO3mSjWlJZ2gjFvG1baeEDWS85kn9a02XBCY04kMhGnEPpNY9dm+GdU8CKI8X64bOaJ+3iqvg2jYKQpfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQWQlec1NukF6ZGrllB/mkYfOzdEdw4/rcjDMc1fmt8=;
 b=gwexDcPIbkRTDMTnXQRMK05U/kCju9IN+H0WvaeZfcjEJ9dJlX2UMRJqHRIYrJ0BWcRsaSTcyHS3dvxV8dYCirhTUAEL1N3VAxeYCOrNA0hev5cyoIasZ7r+VzXh8ElfwMLBURJWWTPriy4ny8So4tig1GHwJkS3zuf2HqaJwHNinRZrcC7Z9/vV5mOdncc2ri4VqzoglSqkBzCIOtGy0UFEDOhXdAP5Pc+ZRp/Fpjq/yxCi9L2lwb5fy+KVE52IOYp7L/ZlIcXfonsYgWHmVhUoPRioNLeWBWRHlmgf38g3w2v4YVdePavu1NoAdVkhdfMEhDX1drTWa8De8825KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQWQlec1NukF6ZGrllB/mkYfOzdEdw4/rcjDMc1fmt8=;
 b=n4CkM+oNk6Ny14iy+VmN+XwvIyp0Tq6ytqPsVg9o0Zx7HJJuKy5ZCE/D65uVSghsxcJy6G7FK1vaZ/jfX77Rv8sBuHDp2Ydll6Ua8W9eudVHWYfNCs+oYljOBBBk2XHK4FX7wKpPuquoa30zBteHUuiozmk+XCWd9Q581Ztx7+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOCP265MB8612.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Wed, 14 Jan
 2026 18:47:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 18:47:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:47:28 +0000
Message-Id: <DFOJB99C7PKV.C3LDKTX3MT6O@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 08/15] rust: pin-init: add `?Sized` bounds to traits
 in `#[pin_data]` macro
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@Kloenk.dev>, "Tamir Duberstein" <tamird@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260114181934.1782470-1-lossin@kernel.org>
 <20260114181934.1782470-9-lossin@kernel.org>
In-Reply-To: <20260114181934.1782470-9-lossin@kernel.org>
X-ClientProxiedBy: LO2P265CA0325.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::25) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOCP265MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: a025d1d0-d59a-4b69-e862-08de539d5e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3E4aEJFbEdhQ3Q5MmQ3U0EzdS9mYVIzYmtCMEVWQkx5SW40Zi9vRHlyUFY4?=
 =?utf-8?B?a1RJRW5HeE5RWmRPa1Bhc0lPaUxqYjRpVkVITDMyV21KbG41RlJTWlR6QTdv?=
 =?utf-8?B?dXZQa2RmTFpDRkhBbndtQ3FmN0RMYzZvVG1wVkd3N1kwYzhpZFNjOXpiTHE4?=
 =?utf-8?B?S2xzc0RxYW9mQlNBRi9ITnRhOW9peFlGcWdCUXBhNHlLRDQrQUlHRmhUdmg4?=
 =?utf-8?B?MjBCSGNBdTkrczZsZitsSmEyTWZDdkRvdklyTUxPaWlCUVVnM2E2WkpDR2hn?=
 =?utf-8?B?YTk4OHl1K1dCZFNxdE1nV2liblBnTzhUR3lrNkZhZlhEMTdXV29BTENWYkFD?=
 =?utf-8?B?cXdkeUVSeEZ6LzlCWEV0V3kySks0dzFIcmYwY3FxRlR6cjBjNjYxcWxtRmor?=
 =?utf-8?B?eWl3TmJIOFpvaDg2VVcwL004RHVhZXBFR1JoeXI3TlJVanRhRExOTEVqWEJq?=
 =?utf-8?B?UEpkU3hEZWVBeHVpYUwweEcrM2xaWXcyWUlVYlh2OHlQR2Z5TGp4QXR5Q0dE?=
 =?utf-8?B?SnVOd2RrT2daemttbzRMV3crZHdNMXNaTnN5NDZrTHMzclEwejloY1A2cEJJ?=
 =?utf-8?B?YTVuYWdZQWpsa1pKTzZHdlZrUEVnTEpqMTB0d2ZUVGdVWUNCOUg3QkRwVFYy?=
 =?utf-8?B?Yk0zeiszSW1ZaTVtUUgweldzVGJCODNUOFVTRThzSmp6SmFLYnpiRFk0cG1k?=
 =?utf-8?B?aWZRTmhiWWprZFY2YXI2djBOODRsb2tOUjRtMStUYWt6NVhDdk83ZFFIeG5Q?=
 =?utf-8?B?WW8wWXozb0JGUGEzb0NrSjdKU3o3N2g0V1JCL2lDazZRZmhjNDIySkdNT0VD?=
 =?utf-8?B?c0RIaCsrVEovcHpMV0FNK0M5dkNWRWJySW53UHcvcy9UVGZCV1BQSmpkcUVR?=
 =?utf-8?B?M29BL2JpZEpGR2EraFl4UlNYdVlpTlVWb2RXU0U4WTZaclFxYlRBako4eTlF?=
 =?utf-8?B?WFJldzhjSjlSU3JQclJteDJheGhpZVRkOHdLblpTQlRaeThleDFtMm5TUXRX?=
 =?utf-8?B?SGpZM1g1MmhWL2h0UVgwL0UyRGM1YjN6anBsejdFVjRyenZNWVQ2dkU2RTRy?=
 =?utf-8?B?dGdnZndhSmlWWUhxaFhmT0xTTm1MVDZMZGpYWVBmQmJ6a20xL2dIUHFHb3Zt?=
 =?utf-8?B?UWNmbFlTUnJYQTdUOU0zOWJRRnorQWlQVVU4R3hUYjhjeDVSL0pGU2FCdlFw?=
 =?utf-8?B?V1FuVERVN3NMdG1GclZtYkV2ZnVXUU1EQmZteW03Uzlrcm9EdnJ1Z3A5SEND?=
 =?utf-8?B?Uit5L282dWIzaTlIWG94OVZRVTJpbS9HQmVIelN1dDhpRnMrY1pCdEk4SDlU?=
 =?utf-8?B?RnJ5NjdoT095V3pLUlh0b00wSTVyd3AzZU5NdjZoZytodGZia2wxbTVwYVBl?=
 =?utf-8?B?VWJsaVdYVm1JZkZyNE9ZQWtnZDRSbGZiem5yMmU1QWMvZm9SMXpHVm9LbWha?=
 =?utf-8?B?SkRKdU9PR0NST2R4MDhVSUtCdkF1blhTTGZTMXpZYmR5NnVyTml3aGMvT0xD?=
 =?utf-8?B?V2Rhd3E3aXJWZW9kbXlsTVVHOEVjdGVyQm9xdkpiekFmZ05KQnEzVDdWdVZ2?=
 =?utf-8?B?SWlqbkF2Z290bFB3cGxWa2gyT3NXSDhxVUNwQ2hTR1FQRVlPRzJhWHpXSkMr?=
 =?utf-8?B?MUNYTGZSWS93clpHTUFkaXhReTFHMXVjUUV2ZjZqQks2WkQ1MFY1V3JraGNt?=
 =?utf-8?B?M2lLTEI3Nyt6QXBtaHE0ZzlwajZTVWI4UlFRU0NQQTlCOWxnaTdPSFl1Ty9Q?=
 =?utf-8?B?ZEE2VU1zcUJ0YzRINHRheEpjK3hSUWkxY2FmdFNSUE5VWE50TWRHYmk0Y25B?=
 =?utf-8?B?U2IreWtiaTZYZkIrUmVrbWFJTVFBdmhlQUtrMks4RWxnTXRtMVl4WXFIaDVI?=
 =?utf-8?B?aVBEV0dGWUp3RXFUT1Z4K1l5VHFyb2tOOW1CVWNFOWNObTljR3QyRW1IQWFr?=
 =?utf-8?B?ZjBqZ2NtbmNnSGkySmhBQlZGTk9pNm9nbzdkRkZiZ25SR0ptblpjK0dOK05N?=
 =?utf-8?B?eldEaVlaMmcyWmF0c1ArcHliWWtZOU4xaHAxZUJFZ1dzYVZJY2tyNW1CejVx?=
 =?utf-8?B?RWYyTWwycC9RU0UyakVFRW1lbCtNazhwdkZ4ZjRKY0Rmd3k5d0pxWE8zZTd3?=
 =?utf-8?B?eURjcm5IcFBsVGNyY3dOOUJNbDJ5ZW50RnRlb2ltazFyMEZlN0tYbFhiK3g5?=
 =?utf-8?B?ZkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTdpZ2lHQlQ3dVp5cnVQY0o1N3hFY3JJcCt4NDFQei9hUmVmNVJ4REE3MFBR?=
 =?utf-8?B?UlNqQ3pYUTJxV3ZETEcyNUdYdTdnNitia1ZlLy9UKzVUbFFQeFBQRmtNRTRW?=
 =?utf-8?B?QkdGNEIwMzVCRUUxdDRsZTc1ckN5dVhNcHJkVmd1VnNUV2JRVDk0YVY2UUNE?=
 =?utf-8?B?aEFTOTYwWEsyN3ZZdHVteUpEbFM1ZGhVbnUrUFBYRFg0UkIyNEVMd2FSeDlZ?=
 =?utf-8?B?ZURMYVNNVkN3M2VJcEp3b25hTEF5Z2RCM1ZCc2JJdU81djlVL1A4WEpIVmMv?=
 =?utf-8?B?d3paSGVXTzFsSWEyV0kweEtBc1d1WWZkNHFPMnJsajZqN3dKWjB4d2Y0SG9i?=
 =?utf-8?B?RGRuY1FHemg4Vzd5bzFQRDJWTllyMXFkdUdMQXo5bXVpTDRQUjhjSmhwT2kr?=
 =?utf-8?B?RnhQNVYyVU0yNXZkRzZzY1l6T2VFak00WWp4UjZCcEF4L1FKWkxHTG02c3F1?=
 =?utf-8?B?U1ZtWTdYMDBDNDh4OVJjLzh4SDdmMzhQV2FVRThYL294Z1FCc0Z6ZWcydWZG?=
 =?utf-8?B?b1JhZG9iaFpSNG9Kb0NxQ2Vkb2RLR2xQSWduYTdmbXRic25mVFhtdFZ4N29B?=
 =?utf-8?B?N3VkVVc0VDRlOFZFRWNKNzZZWThGd3YyVG8rMDRhRDFxeW1uYk1na0Y0MzB2?=
 =?utf-8?B?M3BtenlObm5nZys3UFJCaGh1S2VmUEVRLzhLcTlTQXdTMllJWVhuWG5pYWN5?=
 =?utf-8?B?U0xVVHAvWW0yZG5pa2hXVTRmYWJaQS9sTUE1SHRFRjhla0g2TENldXRzYi82?=
 =?utf-8?B?UHB2SEE5dmgvWldRajArMUNHbnN5YVQrRlNPV1orZ0piaFFzN1AxOG8ySWJl?=
 =?utf-8?B?SlgrSExSQlBQZUo2SE9LNngxRnVpMVAxQm5kQ3FNd08yc1VGdER5WER1a3Rq?=
 =?utf-8?B?WjN2ZWZldnNPcnUzcDF5aisvZG5lSTExUk1UclNkamFpRjZUYWwxWVVXcEdu?=
 =?utf-8?B?d04yQS83S1Zzdkk5TGY5ZmpRUWMzZi9YUVpOQXRsSjFwYk9CRDNsTnFwTlhz?=
 =?utf-8?B?a2RxZm5sajFKT1dwejVlVkUyYW5vV0dDRVEwNFdqRjVkZWVvZXRPZXVtcUZs?=
 =?utf-8?B?dFRSY1JqK2VMSThzKzZWWWx5dVU0VEtJMkQ0d0RaWGJMa0VjUmlsTkJMa3lV?=
 =?utf-8?B?a3dPQ0YwUXB1OVZQY1JaNmtoazhlMENPelhOMWdydkNGOWViS0RRV3RUSW8r?=
 =?utf-8?B?Q1J4OXR3bHNyMjRXRkIvUkhUVUV1WWFQRlVpdDhzMVpYK0d0a2JYelF6b2Ex?=
 =?utf-8?B?WFhQQzlZczBDbytRM1I0MzJKZEVaMmNWSWNQYVpjVlhVVjhQV05uUDlTMGNk?=
 =?utf-8?B?OXlVbnlyWWFBRFh2WnUzVFhDbUtGcU1tQTVIZ0F5NFk0TXFMa3MvR3k3NXM2?=
 =?utf-8?B?azM1K1krTjNIN29KbExwcWh2M1lEYWRZR3QwQ3RtVktlV2RBNGp1ajZGdnNn?=
 =?utf-8?B?dXVWWEt5SWxsRUc5NDYzQk5VNzdVZ09oNTNpWlZpY3dBQld4YWYvc3hJRlNT?=
 =?utf-8?B?Wmd5bkdkTHoyVU9LN1FYc2Vzb1dremdIYStvVVRZV1RxR0pRLzNyRzUxeVVM?=
 =?utf-8?B?REdmbVErOEpHd2JFcElVSjJoNWlkUzY0WFEvcUs3ZzU1cmMvT0YvOGxNYXRh?=
 =?utf-8?B?SExNa0U4WUhIaGhvSjUrc1RuOUl3TFVZdEptU0ZjTGdabWdwMXZGdUFiMnVh?=
 =?utf-8?B?YTNrOGZCQk5rY1F2K1dvTTQzNGFqUEs2NkNNNEhESk9UYm53QVZWRTRNWHBU?=
 =?utf-8?B?VVRWeGk4b0pLemNjWDFrN3ZOQk1OL3ovMkZLNDZyWjNqZVJwNDRsc0s1bkRP?=
 =?utf-8?B?b2s3eW12QW5qeS8zakExc0xuMmRpWWRMVGg2NTUxYTh6aTA2Yy9pUFFDRlZy?=
 =?utf-8?B?YXVHa3MveHE0QXNOYzVNaXJnZzJXOXFOY1VQVlpCczZJSkUxNUUzMHZtQXM3?=
 =?utf-8?B?ZVZnSjV4VmNtakJSZTlFY1FNcGcvNlk0Mm1NRTd6cm44cXczaWJGWTl6ZHRJ?=
 =?utf-8?B?VzNhQkNVa2FpM1VJU2oybTdmYVB2dS9kTVh2bmxHd0VWVXZ5YmoxM2pMVFk3?=
 =?utf-8?B?M3o4V3owcEh3bFVnSzM0OHhIN3VjZkFuelBmaml3VEhhS3BMcmlCVGIrQXN5?=
 =?utf-8?B?dnVzTGo0QUNpc1d4QWIyNGFPUWlmTURZUXg3VXZ0ME5tcnlyWjB1Q2tLRkh0?=
 =?utf-8?B?ZkdEZEc5blYxaiswMVIrSnVibzJVWVovR1hncm9CNmZQTVdsNTZIVEt1Y1B6?=
 =?utf-8?B?dmhpbTNvOFZDR0luNllrOHpGM3B6Z1k1Wmg1RExqenZjdmFsMnN5R214UjRH?=
 =?utf-8?B?UUhKdllZcHQ3VVJWc3lxOHFMQTdtTE1tU0FRamJ0ejMwVXEwbDBlQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a025d1d0-d59a-4b69-e862-08de539d5e86
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 18:47:29.4761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cn4A/0ECClLIi+caiTC9ktkq19yLG8bCXIBkgG6l/swBsR30/SZ5EZ78B6IO4MdxxAufkKe9LA2Iz2KpPwd7cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOCP265MB8612

On Wed Jan 14, 2026 at 6:18 PM GMT, Benno Lossin wrote:
> The `#[pin_data]` macro uses some auxiliary traits to ensure that a user
> does not implement `Drop` for the annotated struct, as that is unsound
> and can lead to UB. However, if the struct that is annotated is
> `!Sized`, the current bounds do not work, because `Sized` is an implicit
> bound for generics.
>=20
> This is *not* a soundness hole of pin-init, as it currently is
> impossible to construct an unsized struct using pin-init.
>=20
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v3: none
> Changes in v2: none
> ---
>  rust/pin-init/internal/src/pin_data.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

