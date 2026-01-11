Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021131.outbound.protection.outlook.com [52.101.100.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287422147F9;
	Sun, 11 Jan 2026 02:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768098260; cv=fail; b=ZaZGuGw5gA/0KgGZlxjN5B2R+QQ8pNcqHC95Pgpw7SE55a3fpQk2FqZ6zZv2PfgX1L2X5t7YxqRcmhEklWtmu6EdcPj6yV35y6YnNVGDsoqFS+0aTYUPV2iaOCsheT92wdUbot6fvcMuqKMPh/CZfGM+O4kw823J6ZUd1JShT/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768098260; c=relaxed/simple;
	bh=JP3XK2xRNRtMAiStGkUJzYUph2m7bkHD0EEX2EmevpQ=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=LzrKlnchSlTu719aySrDILOLPQQgLZY92nhI8bqIQ8t2HhTCj/Tr6EEmxu3qhmUmvu9h/mWLxuXKQRe/UrP9RIbd1Ba6JHn+SkRGtoBuWGz0Cc/ch9QcwU9YqcHNuIfzNw8kQlLuGDc7NSYuGeRNNx2o0X725GWFBdUZ+D4FMI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mYY7KgTP; arc=fail smtp.client-ip=52.101.100.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mYY7KgTP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tY4+p0kNidtFH3RP6UGoUJCA4J1vilNMNmh9QHs5GDA7KpvhYlQw72M07Q1vF74Clc/HCIt8cSGFlXk/TbKSdtXgtDTBDtFoS2iu+kPJ0/5C8rR7zVcBIskDqJbiKlFi9kK+GNZmTZlKfDNGt5boGV67u7eShCgRTmWRXR6BWmCjbJBjyhytcJ/ZQIZ1RfMIj72JN/rsX/Km6eaDfYuAeYJaDvbdhQpAEGbyjdkZ8T7wePtV0zXR2foLtrLbmR+crt5/Fwp8MHdISYQDpPaG1vFY/k8OZb8A73Ybrbg9vLg2jiY89iIZB9VLvSLoFYvutio/7jPxBIT7pCGayavlHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpV6bHbJDcL0njzQ1n0lRcgu4fkXjext1rKtVxsk4dc=;
 b=abGWFgXBtsIflhPdZMr8XFN0DN47BCFhIqPiKz9Igq2IlfMV8rrrXvSh12ernot/Ssy/qEkk4YzRqXryAb15r7fLf3S5Uh6rhjP582Dru1hruXEo6zf8CDGLZbW5Xq/tIMipOwe89ujyWvh+AA14yG/vUs/sDK/mb7svtVAtYwAMtTxOEPIKWQgQPmUZrTk/wNWcwLMs8IQmN9U/Ry2thwIzjndA01aAKvVySoV8wgD9uCV6ZnFatRimkR/shONXPVBwdD2WJtWPfVnIh70EQrqau54X+Pxxq/1rbYwxdd7Y+0Yop6pWmtekx3+cgfF79V+5d8KswHS9YuEjKAMegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpV6bHbJDcL0njzQ1n0lRcgu4fkXjext1rKtVxsk4dc=;
 b=mYY7KgTPcgkJ/43d6P0Jfhg6dKs/69MBcmMcul6mVVXQLtjMWvUMaUog58FcHhbHbX1aN5PhVZgUaCL7GkllUosi4bdBY5WevOne/NS3pdgWsU3pt3PINQpPWqFD4mcpRu9SATY0NlNVtR95wmvX5Wt4r/rvJHvenRw3UuI1Mck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6122.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:27c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 11 Jan
 2026 02:24:15 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 02:24:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Jan 2026 02:24:14 +0000
Message-Id: <DFLEIT0D2PQU.1IGFDE7CYZRPX@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Jesung Yang" <y.j3ms.n@gmail.com>, "Tamir Duberstein"
 <tamird@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] scripts: generate_rust_analyzer: add versioning
 infrastructure
X-Mailer: aerc 0.21.0
References: <20260109-ra-fix-primitive-v2-0-249852a4145a@gmail.com>
 <20260109-ra-fix-primitive-v2-1-249852a4145a@gmail.com>
 <CAJ-ks9kj-RGbWh8uPxayQnpZU4E5WSY_X_SA7f3fKzZKC=ARVg@mail.gmail.com>
 <CA+tqQ4+HA=XsPuuU+-orr+sMOzHWtjPxaXZFF6FPUY+Q+jzQdw@mail.gmail.com>
In-Reply-To: <CA+tqQ4+HA=XsPuuU+-orr+sMOzHWtjPxaXZFF6FPUY+Q+jzQdw@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0215.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::35) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1b929d-8920-4902-0380-08de50b8843e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWxKSXlJUWhiTUV1Q1l5bVVxWVlrTTVVRWRIWnZUNFh6ODByNkpWZlp0bHU2?=
 =?utf-8?B?N01iSmYydUxlbDU3bDVqVUN4aVk1dXY3MDdUa0R5K0VuNENDc21TQjdjTm1t?=
 =?utf-8?B?bFludlFDV3pWQmJDQnN2YWVQNit1MytRc2RYbng3eXZBY0wrWXFqdHUvR2NY?=
 =?utf-8?B?NlU3aXo5L3Z5SVBGQnlPbkFnamxHclpQWC9vOWtaR0VmQXJGU1B5Wi8vTUM3?=
 =?utf-8?B?eUFPSkRmRU4yelZxOHBHZERLNFRJcW80a1VBN2thRURieUtuZnNqbSt3aFNN?=
 =?utf-8?B?aGRrYlM2NkdrRU5YU0YwVm0zajk1WEhjZGpUR0RpbjdXVkJsUUR6RTFOYlZa?=
 =?utf-8?B?ZEVwN1Y3YWtrYkVTSmkwWnNZTmcrRGsreEdjdHZXelNVK1JjTHRkejdtU2pn?=
 =?utf-8?B?QVBKbmNQZlYybUh5VnVuL3JNck5mNVo4cVhiS3djWjE3bGlQbEt1VGZrbzNi?=
 =?utf-8?B?cWdsVDM1VVRLenJkajZlaUp1bHZJR29ZUUIybEprWEd5UXJwaENNcE43K0lz?=
 =?utf-8?B?MGxES2JWbG0zVzJtbEVLTDBVWFhBRkpLWlZtalM0V2RUVnVDdWtOTnd6Vnlt?=
 =?utf-8?B?ZVFndGZVNlNDWE9UK3NZVGVyUmlFS243TjlkL0VNK2l6a2gxMEwvdmd6MDNX?=
 =?utf-8?B?N0dvRzhKNU9YVmorNjV2NnpCYjdiMGxFSEoyK21OU0M4Z0FCbzYyZTBBS05o?=
 =?utf-8?B?SmJ3Sm84UHh6NnkvdVFnZG5pOVJPWHFwajNiYzZZSXRHSWgxVng3MWhubXhK?=
 =?utf-8?B?eXBWTCtoVGtodDF4RTFOcytpdEV4WklXekcySjkyOGdXS2RtRERXbUwzdGt1?=
 =?utf-8?B?TThraEZLKzEybDlsVWlWN3Byb0x1d1VZN0ZSYnB4cDlqcnZ6WjByc2dheTlX?=
 =?utf-8?B?NmhsUFVPR2VBR2NGdHg1VGQ0VDFzaUFtWER2VFM3eS9GcHdycS9jbWtteER1?=
 =?utf-8?B?amRYRFNrcXYrU3dmTEdCUjMvMGtGaFltOTVzQWJLREVqeEgyK3NBUzJmWlBC?=
 =?utf-8?B?UVA4dHpIbkFCdi9MNEZnQ25rbUNnNFlXTEdVQ0k2OC9tbjBWaW94bDhwLzFu?=
 =?utf-8?B?TXNGbzUzS2NncUVNd01tQ1FETXdqNWJVYlpqSEtoK3Y5RkdRY2cyR3U2dzFa?=
 =?utf-8?B?N3ZmY0dYNHU1SERiQ05lQ1hoNGhtV0d6cXFYQ3ZSSWFjWUxzTWJhSjkwODNP?=
 =?utf-8?B?OEptY21jRXFQSEh2VWt2T3p5c2xRKzJoOW5KOG5xcXFjK3NEQXlxNUxJK3Er?=
 =?utf-8?B?cEJzRTdvRnppR0oycFlVT2VYb2Y5YU5ZM1AwZzIyT0k5QW5pbWNTbzNlVFkv?=
 =?utf-8?B?TTc5QTBVbFpLak15bUZxOTk2OTRVQUVJa24vOUpIcXdBNUZNZHVpeUNORVpH?=
 =?utf-8?B?Skp1L0tFcTd0cDc2cFFMbENTR0hycnRHYW02NHZNM2JnNStOWVNTTDZGamlm?=
 =?utf-8?B?ZWY2SWsvbGNyandBbFBucThpYjZTc1VQWkdYSEd5ckdtRUIzRTg1cktOeDJs?=
 =?utf-8?B?M2ZBRXRSc2thZzhuNnFQeGNJNklqL2FyM1RMYzh6L0dKcG9oWnF1R2VrdStH?=
 =?utf-8?B?Y0poMmJud3JyYUJpMklTMW5TQmx2M1hYWG9IbHJyZ0hKWlc2eWh0aUhuRzZu?=
 =?utf-8?B?a0ZGbm0rdC9iR2V5eGxLb1VWZEFPeDBKdWphVU8yZnBJVm1OdjdLSEdWREg1?=
 =?utf-8?B?M2dFeTRZWmxvYkV2Z0JtQTkybzVrbUMzV0dLOHZpSkU3QVEyZzNBQTJ5Tkpa?=
 =?utf-8?B?WEtYaFI4bmhieEZUOW5nOFBOek9WRmJBK2lCOS9LWEJuVVdzVGhmRzB1NWVu?=
 =?utf-8?B?L2cyV3FzejFWN1hidEtMUDN3RG5VYmtPY3FoOThESjR5Z3MyYlJaUVl2cmxU?=
 =?utf-8?B?eDJ3L3lIYzVEcUM2UUNBaVNXYTViR29JRkZHdDREb2lubWlTcG1pTHVCcVNv?=
 =?utf-8?Q?7I0zEeldIignDLhl/UG96LauNHOyPPzT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SS9obi91b2VRVGJsalFuNjcwNEw5YmNMa3U2R0VrWGUyRXljZ0RMT0svY0hj?=
 =?utf-8?B?ejgrTkxEL1luQW1pNFVIUHc4d0YrY1dwS1VuRmV2WlE2SGpJaTVWMFZreEZr?=
 =?utf-8?B?ZkFwNFVEQ0paQW96ditiaVA3NVgvRjgxREVxVGNjRmYrR1prUDNKbGhZdS9X?=
 =?utf-8?B?M1pkQU93SVRnNy9FUjg3VU1kNXcxU1pDelA2OHJHWFNSSytub2xFRXhaaXVB?=
 =?utf-8?B?R3JaSUdCUVFpaU5vN3ViQ1E4M3ZTRzVCZ1hxVitEVU5jWlo0ZHUwckZLbVA5?=
 =?utf-8?B?VWxZVmU3QXFwSlJXSmM5NEdFRVZ6R3htN1VhY24ybEU3cEdURm5tYkRWR3dP?=
 =?utf-8?B?amRrbUpHWk5RT1RobnBFSEs5b0VyOWx6OHYrRVA5RlJuMGkrditjdndjSncy?=
 =?utf-8?B?ZHFjWUxBZjhMblNuME1RYkg3R1NSK2ZrUmlYTWVqbTFRNGlqKytkU3V6MGpl?=
 =?utf-8?B?MzkvbUo0ZzE1L2UvU3B5WERnN3FsbEY2NHcrOWtibTY4RlRlRCsyeDNKSXEw?=
 =?utf-8?B?SFNQanZoSU5QbWVUdEVVWkpXbzhGbzJRTmFvZDkwcjE5dkxxaG54S3p3WkFa?=
 =?utf-8?B?MU05K21KNTBFT3dIQ1lXSlhadU9JODdSRW5rbnpUenl2cU1ZNzFHUUxLQTFz?=
 =?utf-8?B?UTVsWm5xOG5DNXNBQnpuSFA5ekxOMVc4REZwTWh6NXFvM2luUUZCRExna2ZW?=
 =?utf-8?B?Y2NzdXlsVko0TVg1SHBQblBDR0xTM09zcnZWZExhcDd1a0kxK291MEJSeStS?=
 =?utf-8?B?bVQzaUlZa3IxSTJxS3BBVGt6cFJGVThuTjgwMWZlLzBscXNoV0M2dVVYN0FU?=
 =?utf-8?B?VHBva051SVVVZDV6L0h3UERZa2dZTWRpME52WUVOUkltcHF5SXFEUVZaZEd2?=
 =?utf-8?B?dHM1dzNaVkIrUHFBc2c1YXF2eVlRdVBlSWhMYUpHb3BrSzNmeHN1Ty9IQUkw?=
 =?utf-8?B?MFpYTkRjOG1pNDcvOTdzeldmSklZYVREdkZMSmMvcnlCUmZYdUpuVHVjT0pK?=
 =?utf-8?B?WVdXdjFoRDFJc2JOZUEyNmlvbVRDaHZOaDM1N0FWNFRqaDJ6T1lXWFNWcWp0?=
 =?utf-8?B?dW9zalh5L01xSndtanpmVW1MLzhXemlMNG4wQ0QwZDVQRW45Z2xoK3pTWDFj?=
 =?utf-8?B?TkFiZU52UkVmdWo5UEt1dThMSGViK0tsVGlvWlk1aFJCR1lDWGdTaHArS0dJ?=
 =?utf-8?B?UDcvUGhkZDA5NHNnbUZ3V0xqTllTa0lDKzFYL1Q1aE5VZkthSHJPeXcyVG5Z?=
 =?utf-8?B?S2JNMlc4aXhvK0hUWWJ1QmUvNjArek5SVFR6R2k5NkxYeUtscVNoRW41RGtq?=
 =?utf-8?B?QmJodW5odDVNT1BJQU1VV1l4MzRnSkpkSWF2czB1ZUxzUCtkTFNUMHRuMWp4?=
 =?utf-8?B?KzNPSElXSUVzNFJEU0ZDaVBXN2p5em9NOHRNVUFkM1NzUkpHZTA0WVB3T28z?=
 =?utf-8?B?QlhyOEt5MEtzN0ljVmZRNUVNQmxrNGIySXJhdUlkLzg0bGx4dXdsZ0h6SUdD?=
 =?utf-8?B?ZThiQ1drUytON29vSVdWd0ZpanAzcnJITHpNbmwwSmhKc0RFcmUyMEVaSlcv?=
 =?utf-8?B?cThBa2hyZ3hidjk4QjVSRURKMlhVRGh1S2xmTnJLT0JDdTl1OVkxNk9WcEN2?=
 =?utf-8?B?cU5nSVEwaU9SMnpjSEVtbTRnalNjWUlYcHFiL2VGLzF5RGxDZWMxZTFCTW5O?=
 =?utf-8?B?UWp6Wm1FRWtiZE10RERJbkZ4YmVkNG5vTVl2d0VwTlNBRGlQMmhJM2lUVG5M?=
 =?utf-8?B?cmN5NXV6RXJQZm5hUnJUQmJIMElRNmZpd0p6RWwvbVFld3lVQ1ZzVEFaQXox?=
 =?utf-8?B?MHU3aWlKZmpGclhWOVhUcjNtMkk5R1FXbnNuOGZuMi9uMGMzMThUL0lXWHB5?=
 =?utf-8?B?OUVSb3FtT1JyVjdsK3RKbDJCdXZEYnN3b1lrRHdFMk01cXlnOG5UTTI3UG9S?=
 =?utf-8?B?dlF3QmdzK1pmM0luUHV5dnY4VW9WcG0vZ2R4VklsOGJYbU1qOVBseGpYWUtN?=
 =?utf-8?B?eFJWNUlPQzZyVkNHRTlPWTR0NkNya0p0dm10NHVjUExQeWlRUEd4d3dPT1Vh?=
 =?utf-8?B?UGo0d0R1ZzQ4c1plK3F5VnlYdGRIUFJnYnQrS0I1bGY5cDBzMU56VDVUcG04?=
 =?utf-8?B?TTlnOW5iR2tiS0p0cEVkQzk2TmlwNUY3enVMeENQamVZMXdVVGpIUmoxeXFw?=
 =?utf-8?B?Q3B1RlVxbnZGSGNTN0w2ckg2RExZY1RSVmZScUxkaFZCbFdrSFRmNldudFQy?=
 =?utf-8?B?M3BWOXg5dG8yVG9za3JJUW4wRmkwZlRmYmk2dDZaQTJPMzZHSzZlY3FFcWtR?=
 =?utf-8?B?L1pSbXQwNXAveE03dTZGa0dwOWgzVXRSZkZHM0xSTmxMTzlsMWxLdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1b929d-8920-4902-0380-08de50b8843e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 02:24:15.7162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HG5aXhpS3itI0jRb/3ciRFh1ZR2kgn/j3v/PBjdzRp92b0pIzwu/k+Sr2rjPcE+Q0E3CtjGrt9dfod/5+mcrhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6122

On Sun Jan 11, 2026 at 1:21 AM GMT, Jesung Yang wrote:
> On Sat, Jan 10, 2026 at 8:08=E2=80=AFAM Tamir Duberstein <tamird@gmail.co=
m> wrote:
>>
>> I think we can get all the information we need about the compiler
>> without shelling out to RA here. In KConfig we already have options
>> like
>>
>> config RUSTC_HAS_COERCE_POINTEE
>>   def_bool RUSTC_VERSION >=3D 108400
>>
>> and those configs all flow through scripts/generate_rust_analyzer.py.
>> Could we add one to indicate the new version of RA, and then drive the
>> logic from it?
>
> This could be an option, but I'm hesitant to use Kconfig soley for
> tooling enhancements which don't affect the kernel binary. I'd like to
> get a bit more input on whether this approach aligns with how we want
> to use Kconfig.

Yes, we shouldn't have RA knobs in Kconfig just for this script (the script
is just a good-to-have utility but not a requirement to build or even devel=
op
the kernel anyway).

Best,
Gary
