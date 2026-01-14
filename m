Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020111.outbound.protection.outlook.com [52.101.196.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042393375C3;
	Wed, 14 Jan 2026 18:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768415700; cv=fail; b=fXopHWn/I+WqrwSA3EUYHoh3oPWStVySCvQlvjkNzRGF8cSvVbWHBeJSJzdQLdsIIdXU3DLOKwZ/ZsKtD4lEzjg7tVra87G9SjN1fJKW23+alrzNOjgkshgeENooa6MM/Yq/8tpREhWAImqxFnocnfyX7JRKxH1ZDK8vAWIV218=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768415700; c=relaxed/simple;
	bh=3Zb+05aHREG8wIOxmvyRwo8jXvh1KMRjzwfiXgdOXhk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Bx1kAqs5QlaMa9t4Hr0d3BQUOr4U1QZJ0Bt+7iXPnV8M3nAq6fvv/ZtlQcPGiaea+I9NdXqurEGSEF5cgOhh2GK1c0vlweAOv7OYA+t1klOx3v/1hJ5bmJQzl6ofSL+eMHAflEQdbuBm2giLO/SW6eQy9aGvnZG29DslgFXRbVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NLVYOdOJ; arc=fail smtp.client-ip=52.101.196.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NLVYOdOJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYPqNSxdb5iXhVU0SHZ2/JhChzWMasMORP/BaqF0PdOb536j27t0nMM9n0d1UFNDiAvrbqwee2MeYUAfuUytfQjt3lkVxEY7WrJQxwy595DBCnC9kFWCEjMn5ttUg4kwkUI8QOGVfzFv0XBkqP330XNXJulMeZEKmY5nGcLz/Z0jX+G09iQPKyW9stDENzEg+DB+LAVhk4prBrXcFem4iJx+ElC+GXSqbcI4WzpOg/wdGzxITXO3CDrz0LWohDFcXYBELda+qN4T4hzdF65r+nqv9sPLxKjfF5eNvBpBDTg6T+RKqEV6PimpCVXSyPGMv9VD5JLAekqNZS4u4VnLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvrxCFdLH+1cltaZ1tlAw/GRVBmUcPgG0tdU3Ubkj80=;
 b=O26ksnkeI0/7BPkiAUeAih2W42cyUEh3sYJ0LNwX0sXqvd1ntn9hJK3+glGfsubhQ1QIzjHHJNdj6wzajHuisXSetSCFfCglErt1WFePkRz7ZHcq9ElbS4tNgffGcCmBugSQ8lJ4IruEJf07yBCFaB7cbfQiSl2paj5entYU5yiP5uWKajqTne5hKNS+/8iFRuXZDXSgyrL24VOjobt8js36OVOAXMX7RQW6YMIqsdCv8ip1MMFswKBGCIt2ZddmhwTci69FmuLKn4mP02L4dY9SQRcXxlss/x1Ybe7QSy3lsGZXhXIs3QuZtCpNQNDDIxe7aPIg4D9iPSO1LTg0pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvrxCFdLH+1cltaZ1tlAw/GRVBmUcPgG0tdU3Ubkj80=;
 b=NLVYOdOJOjQFw8Mjd9G7hmHBY41eBXv1YnvPod4xGRh0DvbEi/BQfXSCPUZzGkSvio5Rt4J+L2Os7xZooKuz86tEVNpFCFBZ+HWQfyKl4l89OJpLdJRJjwDQtGb5qE2bRPI+en+FG7ectmyYg49MTrw8mSszWpuy5kXl+suWomY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5708.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Wed, 14 Jan
 2026 18:34:54 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 18:34:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:34:53 +0000
Message-Id: <DFOJ1M33ZPDF.1WHDQ1LMIAOUN@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 06/15] rust: pin-init: rewrite the `#[pinned_drop]`
 attribute macro using `syn`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Tamir Duberstein" <tamird@gmail.com>,
 "Alban Kurti" <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260114181934.1782470-1-lossin@kernel.org>
 <20260114181934.1782470-7-lossin@kernel.org>
In-Reply-To: <20260114181934.1782470-7-lossin@kernel.org>
X-ClientProxiedBy: LO4P123CA0577.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cb936b-52e5-44d2-0198-08de539b9c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|10070799003|376014|921020|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3gyMjNaeDB4QUI4SC9PcE9xeUV0SGtndlU4aGMvTmR2Z2RyVWMwSmpBdEh3?=
 =?utf-8?B?TnpDMi9XTE8xS0hvdFcyZTFFRWk0azhFNjNkQTVZQWtEQ2dUcE1YN3ZZM1c3?=
 =?utf-8?B?Vm5ZZzFGT3hpWVpqeEVIcGpMZU5DSlhpQmlZU0tFYzQxdVh6VVdhUlZST0ZT?=
 =?utf-8?B?TnBpNkFIWlhjU1NhQlU0OEd0RHNIc0NqNmlQMytWdHBxVzk0anluWU0xazNo?=
 =?utf-8?B?RzRxOElxdXJBbENLcnVKRVUyOXpHVlVyai9jVXltY29UQm1FdWlKRk1rVGhr?=
 =?utf-8?B?a2tSOTMrVmFlNVZIZ3V6dGQyMmJuc1VWank2RUM4aFd6SmkzREkvMC82eXZh?=
 =?utf-8?B?YjVWSmJna3JGdGk3djU2ZmRlWm8xdkJaYS9LR3NXZnlqNmdLenRUbjdtNjVp?=
 =?utf-8?B?dWlySi91L2FaY3VzN3l2b0xNMTZjQlFUN1czMldHbis5WGhqdlFlTXMrZFJD?=
 =?utf-8?B?czlxZEl0RTEwbXRlLzNFWHFkVmowNDNWS3RWNzQzMGtIUW5uZDlJSjNnVStP?=
 =?utf-8?B?Q3crdGsvSlhhcjhKQjRES0o4MnV5TkFta0UyR1RiemlpU0hJOWJQT0pBdTlm?=
 =?utf-8?B?dHpna3g5aUViWExjY3Z2U2xQRWcrS3VJVTloL253aDJjTFJjL1FpRmx1NnJ0?=
 =?utf-8?B?cCtMNEFwL0JROTdabG9EMVpGTzdMcFhELzFIQ2lCZFpraGdhd1BBVldqc1Jh?=
 =?utf-8?B?SDRjSEowQ01LTmxhdWxvanVoNzRJZERydUkxK3BDWUZQSTRrRDN4Sy9uTldF?=
 =?utf-8?B?NXQxMGIzMndoVVNHQlN6UTV0d0xmM3hPcytGOXlKUXpSM0ZJNUd2OU9ZaU5J?=
 =?utf-8?B?Wk1nRHVYbWN3M2txWTkybDUyaXJDRzdwajl5bEJRQW9HeDFYYVZOekxaSEVw?=
 =?utf-8?B?VlA0ZktwSzlKNWFwWk44b0ZzUTdZdWJ4K1JkeUZJOVIvNG01RVJzY2szSEYv?=
 =?utf-8?B?ejJ2aTNRVklXam02S2JrbGl5eDAzV2l1WTh4ZS9PV3ZPU1RwUVVETzJxcWZ0?=
 =?utf-8?B?OWNmaElCZWtaeTJJcnQ4TjltYXJJMTkzMm9BRnF0Wmg5MGpIYlRqQ2NqeFg2?=
 =?utf-8?B?N2l0bW8vNHVTNTR4MlQrczFFTzNFTUt6bWNwR0RUcmdLRzM4OE5zV01RSnZp?=
 =?utf-8?B?dGpLelBCZmhCSDJEbEplVEU5UDhCMmQwaGMwdGtpUE1JOHdvRmx1cXFPSWpp?=
 =?utf-8?B?OUN0UGNIZC96bXo4cC9kYW5EbDNFNk1Pa1JFYmdMelV1dXlVTmc4Qk1GcTh2?=
 =?utf-8?B?Y1pGYTBxNk5Zait0Qll2eUJRL1FjVUJ0WjhhRkFmYkVadFNVYms2M0kvOFR0?=
 =?utf-8?B?ODliQUt0UTNyTzNhYS80OGNxM0J4WVJoc3dxNjVJMVRMUWNwS0QzRlY2UVF1?=
 =?utf-8?B?RTFaS2VnSzFDYlBDNXc3bnFGK3d6RTFKQkRHOWc1dnFtV2dGNXJPRW9HbDdH?=
 =?utf-8?B?aFpobG1RTTRaSHFyVWdtbjNJeThGNm1LYkFNY04xTnE5ZFoyVHFBK1FPSmNX?=
 =?utf-8?B?d1JFSGpnYTdkblB5bGtSUUx6eEk0RDhVcjE0eUxXdmlYNklaK3ljNmJzYU5s?=
 =?utf-8?B?cS8xNFRmUGxNVklKVStwd05IK0hrNWNCQnFZSUVWKzBTOHhvWTByVlk0amRK?=
 =?utf-8?B?TXp6MlRuOUtxc2RkZi9GeDNxNU8wUEUwWE5aWmNZKzZQRGRTK1JNbnE0T0JQ?=
 =?utf-8?B?RWpGVVhxREN1Tk9PRDl3RHZGOG84eVUrZndLL0RNK2E0eXZCRnF0T0VSOXNK?=
 =?utf-8?B?OHQvNHdqdjBFZ0tYWG5LRjROemx1R091M3pIM0YweEtiZEVGM0E5QXJrOGRO?=
 =?utf-8?B?TmQ2MU1BVkhMOGh2akxmRmVwK2FPNmFxSlY3aWRjcHBFNXdURmJPNHZXR3Fn?=
 =?utf-8?B?bUM1TG9nWUdNY2cvQjBOSUVLR2tTS2dGTDFpa1hoUlFaZW1DWVNWb3d2RWFm?=
 =?utf-8?B?cjM4ejUxdm91RVA1cVV5YU4xdDF5OEpYYzUrdVpiQWkrZDZWS1AvdVVvTUh1?=
 =?utf-8?B?NkxPQS9tdmMvZWhmY0FRYzd5eUxab0RpRXZGbWphakJwR3lobk1MYk0xNXMx?=
 =?utf-8?B?aVFkaEh5WHlpbTFTY3hnL0RETEVaUFFJTDNEZEVwSW93ZWtQSWwzbVhwNnhw?=
 =?utf-8?B?ekU0Q1VlRFFET01CZzRSYkhLZmhqWGZtSWpGeXI2UU5ZMjZuV1YwZDBHSEIv?=
 =?utf-8?B?WkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(10070799003)(376014)(921020)(7142099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0dmKzN4STQ3MnMwWktDOFBIYXR4YkpydmZ6UGd2cElRN2tLNllES1NYSUNw?=
 =?utf-8?B?UkJaczNwQ2c3VURWZnY4UU1QVDQ5b0wwU3ZDRGZHanp5OXdNeXZwVEhYVXVO?=
 =?utf-8?B?TXlQcHk0ZDNacjM4YmhRS2Q2OVdiL0taUHJOVkhvSFZldGJKbURJcGhGb2U5?=
 =?utf-8?B?UDFSRWlMd3pzS1F0SE15dHY2NXgydFUrMjBiQ1YwU013bmlZVjRmMU5jYWNO?=
 =?utf-8?B?NjVWMjRmeE5pUkFKOVQrc3ZvaDJTOVJUNkhCaGlJOEpCZysxSS9pU2F1QTVE?=
 =?utf-8?B?VUZyUkw2M2NHTTRyQjZkWkpOUFJIMXJkNHZnSzQ1QmQvY0dtR2xMM25NbDNE?=
 =?utf-8?B?T0R1WktXKzd0SXQybFZEVTJUZHVkME02amJFQ0RjbFJYYkhCdUxaWEZFa3dm?=
 =?utf-8?B?K0huRVRyMi8xckptNmxocUovRVFlZ21lVTNvdFN6TDZtVU12aWpaYTdNTXMr?=
 =?utf-8?B?WkJWWngvTkxzRG5zV3RvelZOdzFFdnRQU0JvZEJsUHVxTlFjcmdBVXRydW1S?=
 =?utf-8?B?VTYvT283VHhyQmxSemp0R3BYd1FjcVk5Qi9URGdsVWtyRk92RFk0Nis1N1o0?=
 =?utf-8?B?bTBGdXI0VkVXSU1ZL1k5cWEvOXFkSWVOekwraFhQak91djFFTUNHWFJ0UmNK?=
 =?utf-8?B?WnR6elhla2g0NGhTMDVSMmhXNHg5SGZNaHRObjFlbms1NUFzQ0tFUHN5aTRp?=
 =?utf-8?B?bXlMWDVpeVJLNWRacWJmQ2RzeXpDNno3c0pYdFF5QXgyT0RoN0JXcWNEUXFm?=
 =?utf-8?B?cERkVUM1cEh4OXVIcDZwcVEvUW96Ty9xVGVhcFZIZFJuL3ZMTXpIU3prS2Y3?=
 =?utf-8?B?VHl1WjNnRXBkaVJWdng5MTBBaS96cEhlWU9rU1lBOUZRalJka1IyUUhzeFJU?=
 =?utf-8?B?dTh0WHhxQ2FieTgxVjFzaVl0NmxSaHhxMWsxaFFTTEZ0RERCcElFK1JsNG4w?=
 =?utf-8?B?U1NaL05ic0lMbWdyV3BxQ3JZSnhiMWFNbCtENEQ0OHZnMXU1T3FKSk1zcGdr?=
 =?utf-8?B?T1BiMHVtbWFIYllLVHZPU1RBcUZqNzF6L1B1Z09UZndNdFVuK2ZTM0VoZS9X?=
 =?utf-8?B?bWxDUnpwOWt4bW8yQXB3b0ZKRFpyUFZYQ2ZESG5DK3BrMytmNUo5ZWFwY3Rz?=
 =?utf-8?B?TlA5VldYRVdKdlJYTE1zcWVZbjBrQ3JoVlhCNlVBZ2lpOVdHSktndFdTZjNN?=
 =?utf-8?B?NThaVzVSb3htSUZYVzVkMW5aWkU0ZzU3Y3NvT0FNenRvU3JYTGk3dVF2cjdH?=
 =?utf-8?B?UzBrZUI2QUFTdW1yWkhEdURWR1BWVXI5b3d4NHhrS1BTb0VjUVVEZEllVlhO?=
 =?utf-8?B?MGx1NC9yd2FnR2dEWXpicnN4aTNFYVVSemFoZllkaGRHOUp3UzlLbHpZeXM2?=
 =?utf-8?B?LzZPNHJFQmRlekJDdTFFbnkrWm91T3FkaXBrLzg5cWtaZWowdWorSExuaDRZ?=
 =?utf-8?B?b0tpcUtwbklmSEk2Z2xtalcyODNEdVZPYTM4NEpTMVZsdDVUR3hnRWtOZ2tO?=
 =?utf-8?B?Z2ZXWWt4cGpNU3ROdWZYeWJkTTIrZ2R2dUhXN0p5em9MNzB1VXlmSENUMEdK?=
 =?utf-8?B?UmpJOFRsSzFVaFArSFI3NjZkWmhRL1JMWXBiNzlEOUxMRlRNdmx3NW0zRjBo?=
 =?utf-8?B?dWxUQ0ZUUTBFdHg2R3BIZi9NbExOM1VObHZKU2ZjRHVRYUVoMHdEUkoyb0Vn?=
 =?utf-8?B?SDhFVVZwZUZGY0kxRzRZcksvR3BrY0loOTFXbDd0K29sN0QwRmxQK1NvSVVy?=
 =?utf-8?B?aHJQM0VDbFZqWk1NVHRGSVFNa2h5MEltZCtXS0F3MWl2Umxib0NQcldadUp4?=
 =?utf-8?B?bVFTdnlreXYxNTVsZnBWdXNhVXU0MnA5bDZReE9jRGVtN2pzTlNaN3dMdkhG?=
 =?utf-8?B?K05mQkIwZzF1UkdjY0o3Sk9HWWZ4amExRUhHV3FSeFlRdStBc3c3SXZNcC84?=
 =?utf-8?B?VXc4Z0FvNVZqYjhISmhsSzNiTjRjS3Y3NHRQSTBiRlR3ajRpTzVJVnM4eXZQ?=
 =?utf-8?B?VnUybjM2YW1MVGJrbVBOczhmOVFVVjdHbmRXQkF3Q2hHMlV4d1BlVUgybGlo?=
 =?utf-8?B?cmlmT05aOThLdXJCV05QL252TWRXNlNZcmVSblJXNHZTYlJTNzh5bnE1cFcw?=
 =?utf-8?B?ZnZsMk5lczVxRUI3NnRqVHVyZEIveUFEZmhOR2lTdldFbkZvalg2S0lYbEhs?=
 =?utf-8?B?eUR4OU1sZlBrRjFTcTRIVE91aUFVbThIczNuNzE3d2hNN3N2eU0vcDlWL3ZI?=
 =?utf-8?B?clBZSlNNTkhxdUdMSWtERnVudkNWT3UvMnM4WmhITFNVTUFlbGhNZ1BjM0E2?=
 =?utf-8?B?WWMxcUVkMEx5VWI1QUxGbXI1cnp3Mi9vamRNMU1XOGVQNnYyZThaQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cb936b-52e5-44d2-0198-08de539b9c4e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 18:34:54.1338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+xuV0o7I2neukdzHSHgg63qZSQDkvGna5WWDBT74bMMXv/pRZm0mfxMiIl6u0bRxfPGL6DwyhGRunBNUyRqEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5708

On Wed Jan 14, 2026 at 6:18 PM GMT, Benno Lossin wrote:
> Rewrite the attribute macro for implementing `PinnedDrop` using `syn`.
> Otherwise no functional changes intended aside from improved error
> messages on syntactic and semantical errors. For example:
>=20
> When missing the `drop` function in the implementation, the old error
> was:
>=20
>     error: no rules expected `)`
>      --> tests/ui/compile-fail/pinned_drop/no_fn.rs:6:1
>       |
>     6 | #[pinned_drop]
>       | ^^^^^^^^^^^^^^ no rules expected this token in macro call
>       |
>     note: while trying to match keyword `fn`
>      --> src/macros.rs
>       |
>       |             fn drop($($sig:tt)*) {
>       |             ^^
>       =3D note: this error originates in the attribute macro `pinned_drop=
` (in Nightly builds, run with -Z macro-backtrace for more info)
>=20
> And the new one is:
>=20
>     error[E0046]: not all trait items implemented, missing: `drop`
>      --> tests/ui/compile-fail/pinned_drop/no_fn.rs:7:1
>       |
>     7 | impl PinnedDrop for Foo {}
>       | ^^^^^^^^^^^^^^^^^^^^^^^ missing `drop` in implementation
>       |
>       =3D help: implement the missing item: `fn drop(self: Pin<&mut Self>=
, _: OnlyCallFromDrop) { todo!() }`
>=20
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v3:
> * use DiagCtxt error handling
> Changes in v2:
> * improved error handling
> * improved error span
> ---
>  rust/pin-init/internal/src/lib.rs         |  4 +-
>  rust/pin-init/internal/src/pinned_drop.rs | 86 +++++++++++++----------
>  rust/pin-init/src/macros.rs               | 28 --------
>  3 files changed, 52 insertions(+), 66 deletions(-)

