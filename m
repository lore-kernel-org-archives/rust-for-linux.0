Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021101.outbound.protection.outlook.com [52.101.95.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2E83148D4;
	Wed, 28 Jan 2026 16:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617017; cv=fail; b=plWbftVBA1TyDkNJY4JrI3eruSCIRBPxTGpUZkO4r45WdoHR1VjWQL/3XvWg/rJJmWC3Koa9CZsTz+wpdoC1Uqynv7f1ctY+ED/rPA/Z5qd83NBUy6j6ULViSfOt3hie/2RC7gyRdXi8+R6MJ5A/Ce/WHcmyEbdSju8UlURWeg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617017; c=relaxed/simple;
	bh=3vft0IjxUM7ZeFtjnBupkhCM4p3Qdkp97CyVdPpvP0I=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=pJ9th6K1CTfVEEH2WRQ2lBRpWXbBQL4LkfXJoH88BrCSp6cnzz4fKF5JGx3LKL9kOKVOLjYhIEIkCnhPdLu9CgLTWoVSDUiTVR9JAcIgWECblw7bpM2F+NtF9bt4Say5I5U+bSDG1/jBoVpXNkCikrG3elNw/gCYoVNhKnhODI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NAUGAxD5; arc=fail smtp.client-ip=52.101.95.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NAUGAxD5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gI5g4byEkATu9cBj+ZRT0UpopWCDMtF/Bga+JuOcWQiqg7+4Kk0uWVttT2/1vQDOcoA9wX0yDJXN0K56cJHWzvnJREwJRJ/gpToVj0FW0JdW+JZuvwb4TKm7KVzOfeuMVxQxuVIsgdxS5gZ4/BOZpKYEtaEWHS2BIcLZmYlGMDp+Itne6sgHWagOSTyAIrajs5RFcbFg+cHd0Fy1YeojaryS0pibF2OnBdGmVMnZWTDElRgMd9cvckp5mk92UWcebX6j/s9l2QDp4DI3PoDmuZiSpsa+tNbbkgSO2uho8YfubinMjJew28w20p5FxhpztbaLXEKdVxfi1Mz2ZZ75Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kb79CAdMHr51AcI2iO/lv6CeHuGkWhxw5N+Ra+n5wT0=;
 b=qP2jbJdcWDhEBw/CmQ1LTtANzYAkSB7nkUYugD/Fv46tMCQNZ4rv13AMF70XN9c6kHAX6SalUESkcsi/CL5NtLiCqhzvjyPPUwgDfs4+pHwE5+9W82iMfnn0N3vvFUCrfZ6arg0mUdM7PwnUfgEJ5sWwXvfuXZ7JqF1o3nh1+EkwHmgk6O3bRY1VoFKAJHp4C2qcuKu6C/bnbFTtYlnVpZCGwEDYnS3r1yBXpYBwexnwl/+OgGy0Vqb+PWDhB4LCffAkmSP+rRm2Px42KUW43LBLLY55h/y/0VI6cKeJhET1+BuAVPYCRpMj1/EWuYwUPK02KrzsE1712eVgssmw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kb79CAdMHr51AcI2iO/lv6CeHuGkWhxw5N+Ra+n5wT0=;
 b=NAUGAxD5+yH9doZtNACdPJFpHI9lSrQo5ZMlvbpt4jtesCO6Zmp68U8WaMhxqHC+cMBmNxSzqShz66xjH26hg5DYivBbp00ks0mJMWY2IT42gRcR3bhHvAL5YifG0ptVjeOhsTHKvdycTjcfwjuQEgub7YJLvE+XyPGOTJXCuxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8707.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:48d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 16:16:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 16:16:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 16:16:50 +0000
Message-Id: <DG0CVJN57L5F.2I6J4RXMJOGQ@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-5-aee3a33d9649@nvidia.com>
In-Reply-To: <20260128-register-v4-5-aee3a33d9649@nvidia.com>
X-ClientProxiedBy: LO3P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bbcf8aa-a852-4463-cfe6-08de5e88a4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUJTOGpiZ0Q3aHBoS3NZS0tJcU9KNTRERTNPR2xvdXBERDhjWWNYUFRkdlg3?=
 =?utf-8?B?LzRMRW5yaVY1Rzd5WlVNd1krS3BxRWdNOTdqWHYxVVNydHNaUnU2Y0lrckI1?=
 =?utf-8?B?WStkdUtPL0dBNGQrdG0rakQwMVUwclpYaU9HeHdqUWJFV0pzN0tTZ2tKbTFp?=
 =?utf-8?B?MzJ0cjdSaWZ3M1FTNzFXZ0xwdjVrakdtdlJ5MkkvdCs4b3lmcWtoUk41Zkto?=
 =?utf-8?B?OXBWY052VE82S0t0VkJxb3Jwd3ZVN0ZUd3M3L25xQ28yRU1FRjBQT0pyOWNV?=
 =?utf-8?B?YjZtZFlmdUcxN2UyM25FNFZ5WWFNQVpFSWFtTlQxZlVtbUtUUnRteGRyVDZq?=
 =?utf-8?B?YWpiMEx2UW93eU83TVhUTXc2OE9tRVowYU5yeU03VFk0azVrdXJ3N295VlRi?=
 =?utf-8?B?TXovQkdIOFVVdTFrakk3WlJQR2Z1K0htbFpFZFk3aFVCb0dVZTd3bkNsZ2Vt?=
 =?utf-8?B?bWVDQXBER1BCWWVTYng0L3NNVDZONFltcFVuU0FMbWk1SXF4WExVWER2K0Jr?=
 =?utf-8?B?RjdwUkZtT2lGd0o3YWZuRXFrR2p1R0h3Ui9FNmpuaVlhTnR4Y3ltYW0ycFBn?=
 =?utf-8?B?bytvdHpTT0FLcmpXZENKUkh6OEZiV24vZlhoRVZEU3ZZT1RrM2JSaEJiekpx?=
 =?utf-8?B?SHV3Uk5LejdYTUdRWVNmaGI3QWQzVUNSMFBuakM2aWxwc3R1ZWdIQW9VTUk1?=
 =?utf-8?B?U3AvUEt5alJaZUlOc2V1SFpGWU85RytYSXZ4YmZOUUg0Zit5clVUYzFoNDRj?=
 =?utf-8?B?UE0xYVlCU0FaU0lpdXF3WkVsaFVWYzJ0UVVMMmdWNVBacnBTbDFxRUJwNjRL?=
 =?utf-8?B?Z0pGNTV6Ym0yL3A0NHZQUzdJTnBRUXB6WEQ3S2FFbW1Heno3Z1BuMlp3Umtl?=
 =?utf-8?B?TDdCU3o4UC8wc0hjeUNSZ2NvaFFOeXJ5S3RuMUtKeG9ENHN1ZFIvRm9PMHg3?=
 =?utf-8?B?YXp2VDNxTThROG5qeEJEek8zd0Z1U1hJb3BtQVdFa0ZERFByVWVIWkxQT2Jz?=
 =?utf-8?B?WWdmalNCRWJXNmJuYzNiSUpXaWpZc3U4NHhERWd6R1JnUUpVb1FyVGtyNW5Z?=
 =?utf-8?B?dVRwd2JlekVKMFZJKzlpTjRPY0VPWG9oOXpPcUtURGxJOGxTYkJoLzdjc0tD?=
 =?utf-8?B?S3hjVURrOCtoS0Q1ekFDYWRRSzZXWE82QTdpaE1SWjN3UlJndFFSRmxXWlJT?=
 =?utf-8?B?Nmk5V1FWWjdBekQrQi9oQUZ2dFBKa2h6dVk4T09zdlZrQzRaeGFNUlEzSXJr?=
 =?utf-8?B?MWNkMm8wSm9XbVlqWk5sVmQyUjBRTWJlQy9LKzFISjdOVVYrdHQwSTRIY0Vl?=
 =?utf-8?B?U0NDSHduYk8rZTk4RUtSTXl4enlrNkNLS0VmVFhZejFrWDlyMCtuUEU4Z3hJ?=
 =?utf-8?B?NHU1ajFYQzdDYmR2YllwVEg0WTFFbjlYZUcyUGJaSlNibE1hWUpQdDdsUTQz?=
 =?utf-8?B?Y0xUUDR5Z3NUWG9BRWxnT1lkRlMvTStxV3pUZURMdG13dzVBR25JS2NPOXMz?=
 =?utf-8?B?NFJVOFlrMkpkVkd0K2V4Q2lMSC9hVVlyOHJqdjFVVnZwa3FwOENDZzA1dmI5?=
 =?utf-8?B?Nzh3MTltaWttbHU2bGZRNWRaY1Vjb2NiZUFlYUUycGVoeUZLS2pLK1lBNGor?=
 =?utf-8?B?ZnZTMGxWNVRsZGJwUzR2bUFiamlQVi8zM3c3a1ZmRWZPTnhsRU9HSElBUHdK?=
 =?utf-8?B?RFczaldmUmJYM21qUkZIRFVqUkk5ZXZ3OG4zUVRmKzVvME5FOEJSZWVJNTBC?=
 =?utf-8?B?TDlHZk5PcFR3REM3a1A3VE9SaFhGbmVEM3dXRmFVTFhIWGx1NnZHWGUvbEhq?=
 =?utf-8?B?M2ozVTRqVExYeUpuNUpwQnNWbklRSm55MGFiNHNldkIzbGpaVWQva2hUcXFG?=
 =?utf-8?B?SnlqbzRpRS9yMWdLZEpzVU5CanZlZVJxUm41WEFNRTREd3dGdWdIVFlUdmgz?=
 =?utf-8?B?MzF3NlhmajZMWjFINlp0SzU5ekkrL2hMbkdOU3BhUi9Rd1ZiOWx1M0NtL002?=
 =?utf-8?B?MTd3TnVtcU4ycXAyNmtFaDY5NWptWkV5cGhYcTd3V1M1VllaaDQyRFZKVzhm?=
 =?utf-8?B?SkFVdUhNT3pQcDRobFlXT0hrUno3TkJjRS9URS9OVDE5RTQ5bUs5eHZQakN1?=
 =?utf-8?B?VUxIYURhVDNIU1ZUQkpJUFI4c3FGdXJCVGNxUEorbWRqcmthQ1YrbExtR0VO?=
 =?utf-8?B?d3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFhNVDdaZ1IxcmJQSWN0b0NucVZCRHlwTUFRWTZhWmliOWZMY3lNaEoxNndt?=
 =?utf-8?B?bFVXT1h3VU5FVXplODJybElvU2xLR1VRaUlxMHIzdHg5MjFDNDBYL09VS3Bm?=
 =?utf-8?B?bzgxVDZEUnVHSzNnR0draW1Rb2VJdTh5Zm1SWVR2cHo4S0VKUFY1K1pVa3Q0?=
 =?utf-8?B?SzFTWWtYc1FqcCsrQ2FCR3FQaFlCWko4TEpGNUFhaDBWUm0ydmxwNHdxUHp5?=
 =?utf-8?B?Nm1jMWkrZkJkU2hiZUZjcTRzTEh3SXFrT3hFc3l4VExzQzhhTkZZcjRoWTRj?=
 =?utf-8?B?RTMxK3NVcEdsYlloNC9PWTk4ZDI0TjlmZkJoOU9BODN5QTltQU5RbFRFWjVK?=
 =?utf-8?B?VTZmR01yMnplWXcwaGhGclB3RjFpWTlTejNzZmVUeTNZNGMrMGJGb3B3MU4z?=
 =?utf-8?B?b3N3amR1RE9kT1JpMzJRQkpZV0kzRWM5ZHVnYmxVZ200UHVjZStTOHQ0TVF4?=
 =?utf-8?B?RGlIamRzZjM1UnBqL0QvM0ZuekEyTHREelZWcWx0TzZScTI1MDdhb2piVmtq?=
 =?utf-8?B?RHJjOW95cVYyWCtlaWNRdExkWVdZc0RKV3JtZjJNTXowWGVRK3J2aXpvNU1a?=
 =?utf-8?B?T2NKWUV3RmNDRENZYWNPRUtXYWpmUmRSV25sZ3FGRW5xUS9rZGJlM0tvZjdF?=
 =?utf-8?B?dlpZaDBtL2RVTnVwdURwcG84cGN2QWhpaEx0RStJa3M1bXkwWFI0Z0txK1VU?=
 =?utf-8?B?dmZraWk5M09JNkU0MWpsN0dpWGxiVzhxK3ZLNDVnNWVSZzd3VTh0ekJrSjRH?=
 =?utf-8?B?NHp1WVVmRXFWUzFpcFVHZjB0TDVIZ2dVdWMzN2RIME93b3JKOVpNR2xma3Nr?=
 =?utf-8?B?c2ZFZXJoNGZGYy9xT1VOTFZzMnorMm82UnVXRVkyVVZiVEl4aVh1cnRRUkxW?=
 =?utf-8?B?SVpSK20zeEVrQ3JTazFiaWZqWGx6Z2twa0VsUkhiN0ttRUUxak83bGdTekR0?=
 =?utf-8?B?MXdubTBaaTZGcEtDWGtGUlRodFVOTmhNbzhBM1hSYk94NmdNc1NTUEl5RlpP?=
 =?utf-8?B?WWNsL2l6WDF5QU91dGZ5ZGY3MWpVRWdXWVdmTjYwelo0a2hvNG9DSXFwaFNH?=
 =?utf-8?B?c2tsQ1dGQUdhZ1JoSHdJUm9FcHFEUklSYXFGWVBaVFd6ZnlMTTh5b1RnRzR0?=
 =?utf-8?B?d0dwcW5Xd3E4ZXErQm96UWkvNXJUeDc4OVg1cE1nVkNxWVdIUmhqZVcybERa?=
 =?utf-8?B?ZDl6WkVIVEVvbThFdC9NbTc2NTNpL1JudkVJVHlsWk91bitUS3Z2OCtYQjZu?=
 =?utf-8?B?ZW5QTFBnQXZRdkJFTXl0REJqSVZSYXdwdmZOVWVuNzI0S3VsTk1ZNVpmQlZv?=
 =?utf-8?B?R1l4b3ZIeVdUZGxQS2p4ZnFwQm5lMEhGUHEvQXRGdG5rY0p6VXlnOFBEMlpH?=
 =?utf-8?B?T3JabzdUMFp6VFpCNDZQMU1XM0pGek9MUTk5YmlleFZVWW45NElXNFRkK0JF?=
 =?utf-8?B?MWFDY0U5T1YvYTdwaWt6STd0a3lPWmdyNUdhWXhrcVo5am5KaTM5Y003RjEx?=
 =?utf-8?B?TlArUDVYTjkrcy93RnNqRnhFT3UzMXB5NldWeWVEdEZiczkvVWh3UDZoVGYr?=
 =?utf-8?B?ZnE1cXJaaUhWVmNBNGIwUkxBckpwbmlqTEtoeWdOaXZlYkMwam5Ua0Zpckh3?=
 =?utf-8?B?NXVZRWZaSEVoV21odXEzR3E3NmRDN1JkKzNPYUJ1VTM1c2FoR2N2UW1Lb1l6?=
 =?utf-8?B?aC94SDJ0RGlWM2F2bDRrUG92YXNvT21mTkJiOFdZU1JPSjdIdWpVRWoyRXJH?=
 =?utf-8?B?NU0zR2tSNFZVUW1qR3o0ZGI4NXBkeTdEM1lmeUo0RHJSWCtJemFzRElHTHVh?=
 =?utf-8?B?UEZiblNwTmxKNDUzWS9CRU0zVjlMZ1V4NmtXMkxLSExQNzBPUkhTbmhIN2Fo?=
 =?utf-8?B?dXNjUGs5ZlJ4U3J2TTJWbGFXUjZsNjgyRWtKTEpBQjRzK29YTkpnd1ZWek1T?=
 =?utf-8?B?V2ppYVhlZ2xZUjFKR25tdytVc0JRVXVUR3J6UjNIUlp2cEZDRWhsNkozckY0?=
 =?utf-8?B?MWJUcGdkWmxtc2wzbDlVZnRwQXNyWjZmcm1IdUlpaFlBMVJzdG9JeHFTZDFB?=
 =?utf-8?B?b1AyZG1vQkwrN1oxekF6VXBka3BqeXNYM2hKbGowaVk5NmVwTEJUbmNVNnhE?=
 =?utf-8?B?UXNkcTY3YzNmejl6UUlnQ2dpNHJudStsRC9jeHVFZFdGUVpaSEFjS04xV1I0?=
 =?utf-8?B?RUU0S2Rxd0hUZGZQS3Zlb0QyaUhWOTR0YlFGZDU5UktwRDlOQXZkM0tZbzBz?=
 =?utf-8?B?eERwczk5STk5MkJTSFVMNWRGQ3JGbnBRNjhKZ1NzVmJqY253V1FHdkxpc2JX?=
 =?utf-8?B?MU9hSjdIUE9Ec1E5cC9sZVoxR1h5OEZXZHQ4cWljbHFwVncrOE9Xdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbcf8aa-a852-4463-cfe6-08de5e88a4e3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:16:50.9802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V23ZudEVSS7bKSzdIE7gSVX3Rr08rYp/7vQ8fV6H2llmjdbmgEux330xZJeLP9t9bygbYxDmh1hDdPFIEOWeOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8707

On Wed Jan 28, 2026 at 2:37 AM GMT, Alexandre Courbot wrote:
> Add a macro for defining hardware register types with I/O accessors.
>
> Each register field is represented as a `Bounded` of the appropriate bit
> width, ensuring field values are never silently truncated.
>
> Fields can optionally be converted to/from custom types, either fallibly
> or infallibly.
>
> The address of registers can be direct, relative, or indexed, supporting
> most of the patterns in which registers are arranged.
>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/io.rs          |    1 +
>  rust/kernel/io/register.rs | 1287 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 1288 insertions(+)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 056a3ec71647..112f43ecbf88 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -11,6 +11,7 @@
> =20
>  pub mod mem;
>  pub mod poll;
> +pub mod register;
>  pub mod resource;
> =20
>  pub use resource::Resource;
> diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
> new file mode 100644
> index 000000000000..fc85dcd1f09a
> --- /dev/null
> +++ b/rust/kernel/io/register.rs
> @@ -0,0 +1,1287 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A macro to define register layout and accessors.
> +//!
> +//! A single register typically includes several fields, which are acces=
sed through a combination
> +//! of bit-shift and mask operations that introduce a class of potential=
 mistakes, notably because
> +//! not all possible field values are necessarily valid.
> +//!
> +//! The [`register!`] macro in this module provides an intuitive and rea=
dable syntax for defining a
> +//! dedicated type for each register. Each such type comes with its own =
field accessors that can
> +//! return an error if a field's value is invalid.
> +//!
> +//! [`register!`]: kernel::register!
> +
> +use core::ops::Deref;
> +
> +use crate::io::{
> +    IoCapable,
> +    IoKnownSize, //
> +};
> +
> +/// Trait providing a base address to be added to the offset of a relati=
ve register to obtain
> +/// its actual offset.
> +///
> +/// The `T` generic argument is used to distinguish which base to use, i=
n case a type provides
> +/// several bases. It is given to the `register!` macro to restrict the =
use of the register to
> +/// implementors of this particular variant.
> +pub trait RegisterBase<T> {
> +    /// Base address to which register offsets are added.
> +    const BASE: usize;
> +}
> +
> +/// Trait providing I/O read/write operations for register storage types=
.
> +///
> +/// This trait is implemented for all integer types on which I/O can be =
performed, allowing the
> +/// `register!` macro to generate appropriate I/O accessor methods based=
 on the register's storage
> +/// type.
> +pub trait RegisterIo: Sized {

Is this trait intended for public usage or just internal detail of `registe=
r!()`
macro?

If it's the former, then we should probably just put the method into `IoCap=
able`
and allow generic-read in Io. If it's the latter, let's `#[doc(hidden)]` th=
is so
it won't get abused.

> +    /// Read a value from the given offset in the I/O region.
> +    fn read<T, I>(io: &T, offset: usize) -> Self
> +    where
> +        T: Deref<Target =3D I>,
> +        I: IoKnownSize + IoCapable<Self>;

I think generally `Deref` bound shouldn't be exposed to user. What smart
pointers are involved here, and can we implement forwarding impls of `Io`?

> +
> +    /// Write a value to the given offset in the I/O region.
> +    fn write<T, I>(self, io: &T, offset: usize)
> +    where
> +        T: Deref<Target =3D I>,
> +        I: IoKnownSize + IoCapable<Self>;
> +}
> +
> +impl RegisterIo for u8 {
> +    #[inline(always)]
> +    fn read<T, I>(io: &T, offset: usize) -> Self
> +    where
> +        T: Deref<Target =3D I>,
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.read8(offset)
> +    }
> +
> +    #[inline(always)]
> +    fn write<T, I>(self, io: &T, offset: usize)
> +    where
> +        T: Deref<Target =3D I>,
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.write8(self, offset)
> +    }
> +}
> +
> +impl RegisterIo for u16 {
> +    #[inline(always)]
> +    fn read<T, I>(io: &T, offset: usize) -> Self
> +    where
> +        T: Deref<Target =3D I>,
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.read16(offset)
> +    }
> +
> +    #[inline(always)]
> +    fn write<T, I>(self, io: &T, offset: usize)
> +    where
> +        T: Deref<Target =3D I>,
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.write16(self, offset)
> +    }
> +}
> +
> +impl RegisterIo for u32 {
> +    #[inline(always)]
> +    fn read<T, I>(io: &T, offset: usize) -> Self
> +    where
> +        T: Deref<Target =3D I>,
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.read32(offset)
> +    }
> +
> +    #[inline(always)]
> +    fn write<T, I>(self, io: &T, offset: usize)
> +    where
> +        T: Deref<Target =3D I>,
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.write32(self, offset)
> +    }
> +}
> +
> +#[cfg(CONFIG_64BIT)]

This cfg should be removed.

> +impl RegisterIo for u64 {
> +    #[inline(always)]
> +    fn read<T, I>(io: &T, offset: usize) -> Self
> +    where
> +        T: Deref<Target =3D I>,
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.read64(offset)
> +    }
> +
> +    #[inline(always)]
> +    fn write<T, I>(self, io: &T, offset: usize)
> +    where
> +        T: Deref<Target =3D I>,
> +        I: IoKnownSize + IoCapable<Self>,
> +    {
> +        io.write64(self, offset)
> +    }
> +}
> +
> +/// Defines a dedicated type for a register, including getter and setter=
 methods for its fields and
> +/// methods to read and write it from an [`Io`] region.
> +///
> +/// Example:
> +///
> +/// ```
> +/// use kernel::register;
> +///
> +/// register! {
> +///     /// Basic information about the chip.
> +///     pub BOOT_0(u32) @ 0x00000100 {
> +///         /// Vendor ID.
> +///         15:8 vendor_id;
> +///         /// Major revision of the chip.
> +///         7:4 major_revision;
> +///         /// Minor revision of the chip.
> +///         3:0 minor_revision;
> +///     }
> +/// }
> +/// ```
> +///
> +/// This defines a `BOOT_0` type which can be read from or written to of=
fset `0x100` of an `Io`
> +/// region. For instance, `minor_revision` consists of the 4 least signi=
ficant bits of the
> +/// register.
> +///
> +/// Fields are instances of [`Bounded`](kernel::num::Bounded) and can be=
 read by calling their
> +/// getter method, which is named after them. They also have setter meth=
ods prefixed with `set_`
> +/// for runtime values and `with_` for constant values. All setters retu=
rn the updated register
> +/// value.
> +///
> +/// ```no_run
> +/// use kernel::register;
> +/// use kernel::num::Bounded;
> +///
> +/// # register! {
> +/// #     pub BOOT_0(u32) @ 0x00000100 {
> +/// #         15:8 vendor_id;
> +/// #         7:4 major_revision;
> +/// #         3:0 minor_revision;
> +/// #     }
> +/// # }
> +/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(b=
ar: &T) {
> +/// # fn obtain_vendor_id() -> u8 { 0xff }
> +/// // Read from the register's defined offset (0x100).
> +/// let boot0 =3D BOOT_0::read(&bar);
> +/// pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot0=
.minor_revision().get());
> +///
> +/// // Update some fields and write the new value back.
> +/// boot0
> +///     // Constant values.
> +///     .with_major_revision::<3>()
> +///     .with_minor_revision::<10>()
> +///     // Run-time value.
> +///     .set_vendor_id(obtain_vendor_id())
> +///     .write(&bar);
> +///
> +/// // Or, just read and update the register in a single step.
> +/// BOOT_0::update(&bar, |r| r
> +///     .with_major_revision::<3>()
> +///     .with_minor_revision::<10>()
> +///     .set_vendor_id(obtain_vendor_id())
> +/// );
> +///
> +/// // Constant values can also be built using the const setters.
> +/// const V: BOOT_0 =3D BOOT_0::zeroed()
> +///     .with_major_revision::<3>()
> +///     .with_minor_revision::<10>();
> +/// # }
> +/// ```
> +///
> +/// Fields can also be transparently converted from/to an arbitrary type=
 by using the bitfield `=3D>`
> +/// and `?=3D>` syntaxes.
> +///
> +/// If present, doccomments above register or fields definitions are add=
ed to the relevant item
> +/// they document (the register type itself, or the field's setter and g=
etter methods).
> +///
> +/// Note that multiple registers can be defined in a single `register!` =
invocation. This can be
> +/// useful to group related registers together.
> +///
> +/// ```
> +/// use kernel::register;
> +///
> +/// register! {
> +///     pub BOOT_0(u8) @ 0x00000100 {
> +///         7:4 major_revision;
> +///         3:0 minor_revision;
> +///     }
> +///
> +///     pub BOOT_1(u8) @ 0x00000101 {
> +///         7:5 num_threads;
> +///         4:0 num_cores;
> +///     }
> +/// };
> +/// ```
> +///
> +/// It is possible to create an alias of an existing register with new f=
ield definitions by using
> +/// the `=3D> ALIAS` syntax. This is useful for cases where a register's=
 interpretation depends on
> +/// the context:
> +///
> +/// ```
> +/// use kernel::register;
> +///
> +/// register! {
> +///     /// Scratch register.
> +///     pub SCRATCH(u32) @ 0x00000200 {
> +///         /// Raw value.
> +///         31:0 value;
> +///     }
> +///
> +///     /// Boot status of the firmware.
> +///     pub SCRATCH_BOOT_STATUS(u32) =3D> SCRATCH {
> +///         /// Whether the firmware has completed booting.
> +///         0:0 completed;
> +///     }
> +/// }
> +/// ```
> +///
> +/// In this example, `SCRATCH_BOOT_STATUS` uses the same I/O address as =
`SCRATCH`, while also
> +/// providing its own `completed` field.
> +///
> +/// ## Relative registers
> +///
> +/// A register can be defined as being accessible from a fixed offset of=
 a provided base. For
> +/// instance, imagine the following I/O space:
> +///
> +/// ```text
> +///           +-----------------------------+
> +///           |             ...             |
> +///           |                             |
> +///  0x100--->+------------CPU0-------------+
> +///           |                             |
> +///  0x110--->+-----------------------------+
> +///           |           CPU_CTL           |
> +///           +-----------------------------+
> +///           |             ...             |
> +///           |                             |
> +///           |                             |
> +///  0x200--->+------------CPU1-------------+
> +///           |                             |
> +///  0x210--->+-----------------------------+
> +///           |           CPU_CTL           |
> +///           +-----------------------------+
> +///           |             ...             |
> +///           +-----------------------------+
> +/// ```
> +///
> +/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at offs=
et `0x10` of their I/O
> +/// space segment. Since both instances of `CPU_CTL` share the same layo=
ut, we don't want to define
> +/// them twice and would prefer a way to select which one to use from a =
single definition
> +///
> +/// This can be done using the `Base + Offset` syntax when specifying th=
e register's address.
> +///
> +/// `Base` is an arbitrary type (typically a ZST) to be used as a generi=
c parameter of the
> +/// [`RegisterBase`] trait to provide the base as a constant, i.e. each =
type providing a base for
> +/// this register needs to implement `RegisterBase<Base>`. Here is the a=
bove example translated
> +/// into code:
> +///
> +/// ```no_run
> +/// use kernel::register;
> +/// use kernel::io::register::RegisterBase;
> +///
> +/// // Type used to identify the base.
> +/// pub struct CpuCtlBase;
> +///
> +/// // ZST describing `CPU0`.
> +/// struct Cpu0;
> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
> +///     const BASE: usize =3D 0x100;
> +/// }
> +/// // Singleton of `CPU0` used to identify it.
> +/// const CPU0: Cpu0 =3D Cpu0;
> +///
> +/// // ZST describing `CPU1`.
> +/// struct Cpu1;
> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
> +///     const BASE: usize =3D 0x200;
> +/// }
> +/// // Singleton of `CPU1` used to identify it.
> +/// const CPU1: Cpu1 =3D Cpu1;
> +///
> +/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(b=
ar: &T) {
> +/// // This makes `CPU_CTL` accessible from all implementors of `Registe=
rBase<CpuCtlBase>`.
> +/// register! {
> +///     /// CPU core control.
> +///     pub CPU_CTL(u32) @ CpuCtlBase + 0x10 {
> +///         /// Start the CPU core.
> +///         0:0 start;
> +///     }
> +/// }
> +///
> +/// // The `read`, `write` and `update` methods of relative registers ta=
ke an extra `base` argument
> +/// // that is used to resolve its final address by adding its `BASE` to=
 the offset of the
> +/// // register.
> +///
> +/// // Start `CPU0`.
> +/// CPU_CTL::update(&bar, &CPU0, |r| r.set_start(true));
> +///
> +/// // Start `CPU1`.
> +/// CPU_CTL::update(&bar, &CPU1, |r| r.set_start(true));
> +///
> +/// // Aliases can also be defined for relative register.
> +/// register! {
> +///     /// Alias to CPU core control.
> +///     pub CPU_CTL_ALIAS(u32) =3D> CpuCtlBase + CPU_CTL {
> +///         /// Start the aliased CPU core.
> +///         1:1 alias_start;
> +///     }
> +/// }
> +///
> +/// // Start the aliased `CPU0`.
> +/// CPU_CTL_ALIAS::update(&bar, &CPU0, |r| r.set_alias_start(true));
> +/// # }
> +/// ```
> +///
> +/// ## Arrays of registers
> +///
> +/// Some I/O areas contain consecutive registers that can be interpreted=
 in the same way. These
> +/// areas can be defined as an array of identical registers, allowing th=
em to be accessed by index
> +/// with compile-time or runtime bound checking. Simply specify their si=
ze inside `[` and `]`
> +/// brackets, and add an `idx` parameter to their `read`, `write` and `u=
pdate` methods:
> +///
> +/// ```no_run
> +/// use kernel::register;
> +///
> +/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(b=
ar: &T)
> +/// #     -> Result<(), Error>{
> +/// # fn get_scratch_idx() -> usize {
> +/// #   0x15
> +/// # }
> +/// // Array of 64 consecutive registers with the same layout starting a=
t offset `0x80`.
> +/// register! {
> +///     /// Scratch registers.
> +///     pub SCRATCH(u32)[64] @ 0x00000080 {
> +///         31:0 value;
> +///     }
> +/// }
> +///
> +/// // Read scratch register 0, i.e. I/O address `0x80`.
> +/// let scratch_0 =3D SCRATCH::read(&bar, 0).value();
> +/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
> +/// let scratch_15 =3D SCRATCH::read(&bar, 15).value();
> +///
> +/// // This is out of bounds and won't build.
> +/// // let scratch_128 =3D SCRATCH::read(&bar, 128).value();
> +///
> +/// // Runtime-obtained array index.
> +/// let scratch_idx =3D get_scratch_idx();
> +/// // Access on a runtime index returns an error if it is out-of-bounds=
.
> +/// let some_scratch =3D SCRATCH::try_read(&bar, scratch_idx)?.value();
> +///
> +/// // Alias to a particular register in an array.
> +/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
> +/// register! {
> +///     /// Firmware exit status code.
> +///     pub FIRMWARE_STATUS(u32) =3D> SCRATCH[8] {
> +///         7:0 status;
> +///     }
> +/// }
> +/// let status =3D FIRMWARE_STATUS::read(&bar).status();
> +///
> +/// // Non-contiguous register arrays can be defined by adding a stride =
parameter.
> +/// // Here, each of the 16 registers of the array are separated by 8 by=
tes, meaning that the
> +/// // registers of the two declarations below are interleaved.
> +/// register! {
> +///     /// Scratch registers bank 0.
> +///     pub SCRATCH_INTERLEAVED_0(u32)[16 ; 8] @ 0x000000c0 {
> +///         31:0 value;
> +///     }
> +///
> +///     /// Scratch registers bank 1.
> +///     pub SCRATCH_INTERLEAVED_1(u32)[16 ; 8] @ 0x000000c4 {
> +///         31:0 value;
> +///     }
> +/// }
> +/// # Ok(())
> +/// # }
> +/// ```
> +///
> +/// ## Relative arrays of registers
> +///
> +/// Combining the two features described in the sections above, arrays o=
f registers accessible from
> +/// a base can also be defined:
> +///
> +/// ```no_run
> +/// use kernel::register;
> +/// use kernel::io::register::RegisterBase;
> +///
> +/// # fn test<T: kernel::io::IoKnownSize + kernel::io::IoCapable<u32>>(b=
ar: &T)
> +/// #     -> Result<(), Error>{
> +/// # fn get_scratch_idx() -> usize {
> +/// #   0x15
> +/// # }
> +/// // Type used as parameter of `RegisterBase` to specify the base.
> +/// pub struct CpuCtlBase;
> +///
> +/// // ZST describing `CPU0`.
> +/// struct Cpu0;
> +/// impl RegisterBase<CpuCtlBase> for Cpu0 {
> +///     const BASE: usize =3D 0x100;
> +/// }
> +/// // Singleton of `CPU0` used to identify it.
> +/// const CPU0: Cpu0 =3D Cpu0;
> +///
> +/// // ZST describing `CPU1`.
> +/// struct Cpu1;
> +/// impl RegisterBase<CpuCtlBase> for Cpu1 {
> +///     const BASE: usize =3D 0x200;
> +/// }
> +/// // Singleton of `CPU1` used to identify it.
> +/// const CPU1: Cpu1 =3D Cpu1;
> +///
> +/// // 64 per-cpu scratch registers, arranged as a contiguous array.
> +/// register! {
> +///     /// Per-CPU scratch registers.
> +///     pub CPU_SCRATCH(u32)[64] @ CpuCtlBase + 0x00000080 {
> +///         31:0 value;
> +///     }
> +/// }
> +///
> +/// let cpu0_scratch_0 =3D CPU_SCRATCH::read(&bar, &Cpu0, 0).value();
> +/// let cpu1_scratch_15 =3D CPU_SCRATCH::read(&bar, &Cpu1, 15).value();
> +///
> +/// // This won't build.
> +/// // let cpu0_scratch_128 =3D CPU_SCRATCH::read(&bar, &Cpu0, 128).valu=
e();
> +///
> +/// // Runtime-obtained array index.
> +/// let scratch_idx =3D get_scratch_idx();
> +/// // Access on a runtime value returns an error if it is out-of-bounds=
.
> +/// let cpu0_some_scratch =3D CPU_SCRATCH::try_read(&bar, &Cpu0, scratch=
_idx)?.value();
> +///
> +/// // `SCRATCH[8]` is used to convey the firmware exit code.
> +/// register! {
> +///     /// Per-CPU firmware exit status code.
> +///     pub CPU_FIRMWARE_STATUS(u32) =3D> CpuCtlBase + CPU_SCRATCH[8] {
> +///         7:0 status;
> +///     }
> +/// }
> +/// let cpu0_status =3D CPU_FIRMWARE_STATUS::read(&bar, &Cpu0).status();
> +///
> +/// // Non-contiguous register arrays can be defined by adding a stride =
parameter.
> +/// // Here, each of the 16 registers of the array are separated by 8 by=
tes, meaning that the
> +/// // registers of the two declarations below are interleaved.
> +/// register! {
> +///     /// Scratch registers bank 0.
> +///     pub CPU_SCRATCH_INTERLEAVED_0(u32)[16 ; 8] @ CpuCtlBase + 0x0000=
0d00 {

I discussed this with Alex off-list and we agree that this'll better be

    pub CPU_SCRATCH_INTERLEAVED_0(u32)[u16, stride =3D 8] @ CpuCtlBase + 0x=
00000d00

spelling the full intention out rather than have a special syntax, as this =
isn't
the common case.

> +///         31:0 value;
> +///     }
> +///
> +///     /// Scratch registers bank 1.
> +///     pub CPU_SCRATCH_INTERLEAVED_1(u32)[16 ; 8] @ CpuCtlBase + 0x0000=
0d04 {
> +///         31:0 value;
> +///     }
> +/// }
> +/// # Ok(())
> +/// # }
> +/// ```
> +/// [`Io`]: kernel::io::Io
> +#[macro_export]
> +macro_rules! register {
> +    // Entry point for the macro, allowing multiple registers to be defi=
ned in one call.
> +    // It matches all possible register declaration patterns to dispatch=
 them to corresponding
> +    // `@reg` rule that defines a single register.
> +    (
> +        $(
> +            $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
> +                $([ $size:expr $(; $stride:expr)? ])? $(@ $offset:litera=
l)?
> +                $(@ $base:ident + $base_offset:literal)?

Does `$(@ $($base:ident +)? $offset:literal)?` not work?

> +                $(=3D> $alias:ident $(+ $alias_offset:ident)? $([$alias_=
idx:expr])? )?
> +            { $($fields:tt)* }
> +        )*
> +    ) =3D> {
> +        $(
> +        ::kernel::register!(

$crate::register!()

> +            @reg $(#[$attr])* $vis $name ($storage) $([$size $(; $stride=
)?])?
> +                $(@ $offset)?
> +                $(@ $base + $base_offset)?
> +                $(=3D> $alias $(+ $alias_offset)? $([$alias_idx])? )?
> +            { $($fields)* }
> +        );
> +        )*
> +    };
> +
> +    // All the rules below are private helpers.
> +
> +    // Creates a register at a fixed offset of the MMIO space.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $off=
set:literal
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        ::kernel::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fiel=
ds)* }
> +        );
> +        ::kernel::register!(@io_fixed $name($storage) @ $offset);
> +    };
> +
> +    // Creates an alias register of fixed offset register `alias` with i=
ts own fields.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D> $=
alias:ident
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        ::kernel::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fiel=
ds)* }
> +        );
> +        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET);
> +    };
> +
> +    // Creates a register at a relative offset from a base address provi=
der.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $bas=
e:ident + $offset:literal
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        ::kernel::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fiel=
ds)* }
> +        );
> +        ::kernel::register!(@io_relative $name($storage) @ $base + $offs=
et );
> +    };
> +
> +    // Creates an alias register of relative offset register `alias` wit=
h its own fields.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D> $=
base:ident + $alias:ident
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        ::kernel::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fiel=
ds)* }
> +        );
> +        ::kernel::register!(@io_relative $name($storage) @ $base + $alia=
s::OFFSET );

Would this generate error messages if $name and $alias are of different bas=
e, or
would such case be a bug but silently compiles?

> +    };
> +
> +    // Creates an array of registers at a fixed offset of the MMIO space=
.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
> +            [ $size:expr ; $stride:expr ] @ $offset:literal { $($fields:=
tt)* }
> +    ) =3D> {
> +        static_assert!(::core::mem::size_of::<$storage>() <=3D $stride);
> +
> +        ::kernel::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fiel=
ds)* }
> +        );
> +        ::kernel::register!(@io_array $name($storage) [ $size ; $stride =
] @ $offset);
> +    };
> +
> +    // Shortcut for contiguous array of registers (stride =3D=3D size of=
 element).
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $siz=
e:expr ] @ $offset:literal
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        ::kernel::register!(
> +            $(#[$attr])* $vis $name($storage) [ $size ; ::core::mem::siz=
e_of::<$storage>() ]
> +                @ $offset { $($fields)* }
> +        );
> +    };
> +
> +    // Creates an alias of register `idx` of array of registers `alias` =
with its own fields.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) =3D> $=
alias:ident [ $idx:expr ]
> +            { $($fields:tt)* }
> +    ) =3D> {
> +        static_assert!($idx < $alias::SIZE);
> +
> +        ::kernel::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fiel=
ds)* }
> +        );
> +        ::kernel::register!(@io_fixed $name($storage) @ $alias::OFFSET +=
 $idx * $alias::STRIDE);
> +    };
> +
> +    // Creates an array of registers at a relative offset from a base ad=
dress provider.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $siz=
e:expr ; $stride:expr ]
> +            @ $base:ident + $offset:literal { $($fields:tt)* }
> +    ) =3D> {
> +        static_assert!(::core::mem::size_of::<$storage>() <=3D $stride);
> +
> +        ::kernel::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fiel=
ds)* }
> +        );
> +        ::kernel::register!(
> +            @io_relative_array $name($storage) [ $size ; $stride ] @ $ba=
se + $offset
> +        );
> +    };
> +
> +    // Shortcut for contiguous array of relative registers (stride =3D=
=3D size of element).
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $siz=
e:expr ]
> +            @ $base:ident + $offset:literal { $($fields:tt)* }
> +    ) =3D> {
> +        ::kernel::register!(
> +            $(#[$attr])* $vis $name($storage) [ $size ; ::core::mem::siz=
e_of::<$storage>() ]
> +                @ $base + $offset { $($fields)* }
> +        );
> +    };
> +
> +    // Creates an alias of register `idx` of relative array of registers=
 `alias` with its own
> +    // fields.
> +    (
> +        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
> +            =3D> $base:ident + $alias:ident [ $idx:expr ] { $($fields:tt=
)* }
> +    ) =3D> {
> +        static_assert!($idx < $alias::SIZE);
> +
> +        ::kernel::register!(
> +            @bitfield $(#[$attr])* $vis struct $name($storage) { $($fiel=
ds)* }
> +        );
> +        ::kernel::register!(
> +            @io_relative $name($storage) @ $base + $alias::OFFSET + $idx=
 * $alias::STRIDE
> +        );
> +    };
> +
> +    // Generates the bitfield for the register.
> +    //
> +    // `#[allow(non_camel_case_types)]` is added since register names ty=
pically use SCREAMING_CASE.
> +    (
> +        @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($storage=
:ty) { $($fields:tt)* }
> +    ) =3D> {
> +        ::kernel::register!(@bitfield_core
> +            #[allow(non_camel_case_types)]
> +            $(#[$attr])* $vis $name $storage
> +        );
> +        ::kernel::register!(@bitfield_fields $vis $name $storage { $($fi=
elds)* });
> +    };
> +
> +    // Generates the IO accessors for a fixed offset register.
> +    (@io_fixed $name:ident ($storage:ty) @ $offset:expr) =3D> {
> +        #[allow(dead_code)]
> +        impl $name {
> +            /// Absolute offset of the register.
> +            pub const OFFSET: usize =3D $offset;
> +
> +            /// Read the register from its address in `io`.
> +            #[inline(always)]
> +            pub fn read<T, I>(io: &T) -> Self where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +            {
> +                Self(<$storage as $crate::io::register::RegisterIo>::rea=
d(io, Self::OFFSET))
> +            }
> +
> +            /// Write the value contained in `self` to the register addr=
ess in `io`.
> +            #[inline(always)]
> +            pub fn write<T, I>(self, io: &T) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +            {
> +                <$storage as $crate::io::register::RegisterIo>::write(se=
lf.0, io, Self::OFFSET)
> +            }
> +
> +            /// Read the register from its address in `io` and run `f` o=
n its value to obtain a new
> +            /// value to write back.
> +            ///
> +            /// Note that this operation is not atomic. In concurrent co=
ntexts, external
> +            /// synchronization may be required to prevent race conditio=
ns.

Given the non-atomicity, how much value does it provide compared to having =
the
user write read and write themselves? I feel that people reading the code m=
ay
assume the atomicity without reading docs if they see `FOO::update`, while =
it's
less likely that they do so if they read
`FOO::read(io).with_bar(baz).write(io)`.

> +            #[inline(always)]
> +            pub fn update<T, I, F>(
> +                io: &T,
> +                f: F,
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                let reg =3D f(Self::read(io));
> +                reg.write(io);
> +            }
> +        }
> +    };
> +
> +    // Generates the IO accessors for a relative offset register.
> +    (@io_relative $name:ident ($storage:ty) @ $base:ident + $offset:expr=
 ) =3D> {
> +        #[allow(dead_code)]
> +        impl $name {
> +            /// Relative offset of the register.
> +            pub const OFFSET: usize =3D $offset;
> +
> +            /// Read the register from `io`, using the base address prov=
ided by `base` and adding
> +            /// the register's offset to it.
> +            #[inline(always)]
> +            pub fn read<T, I, B>(
> +                io: &T,
> +                #[allow(unused_variables)]
> +                base: &B,
> +            ) -> Self where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +            {
> +                let offset =3D <B as $crate::io::register::RegisterBase<=
$base>>::BASE + Self::OFFSET;
> +
> +                Self(<$storage as $crate::io::register::RegisterIo>::rea=
d(io, offset))
> +            }
> +
> +            /// Write the value contained in `self` to `io`, using the b=
ase address provided by
> +            /// `base` and adding the register's offset to it.
> +            #[inline(always)]
> +            pub fn write<T, I, B>(
> +                self,
> +                io: &T,
> +                #[allow(unused_variables)]
> +                base: &B,
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +            {
> +                let offset =3D <B as $crate::io::register::RegisterBase<=
$base>>::BASE + Self::OFFSET;
> +
> +                <$storage as $crate::io::register::RegisterIo>::write(se=
lf.0, io, offset)
> +            }
> +
> +            /// Read the register from `io`, using the base address prov=
ided by `base` and adding
> +            /// the register's offset to it, then run `f` on its value t=
o obtain a new value to
> +            /// write back.
> +            ///
> +            /// Note that this operation is not atomic. In concurrent co=
ntexts, external
> +            /// synchronization may be required to prevent race conditio=
ns.
> +            #[inline(always)]
> +            pub fn update<T, I, B, F>(
> +                io: &T,
> +                base: &B,
> +                f: F,
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                let reg =3D f(Self::read(io, base));
> +                reg.write(io, base);
> +            }
> +        }
> +    };
> +
> +    // Generates the IO accessors for an array of registers.
> +    (@io_array $name:ident ($storage:ty) [ $size:expr ; $stride:expr ] @=
 $offset:literal) =3D> {
> +        #[allow(dead_code)]
> +        impl $name {
> +            /// Absolute offset of the register array.
> +            pub const OFFSET: usize =3D $offset;
> +            /// Number of elements in the array of registers.
> +            pub const SIZE: usize =3D $size;
> +            /// Number of bytes separating each element of the array of =
registers.
> +            pub const STRIDE: usize =3D $stride;
> +
> +            /// Read the array register at index `idx` from its address =
in `io`.
> +            #[inline(always)]
> +            pub fn read<T, I>(
> +                io: &T,
> +                idx: usize,
> +            ) -> Self where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +            {
> +                build_assert!(idx < Self::SIZE);
> +
> +                let offset =3D Self::OFFSET + (idx * Self::STRIDE);
> +
> +                Self(<$storage as $crate::io::register::RegisterIo>::rea=
d(io, offset))
> +            }
> +
> +            /// Write the value contained in `self` to the array registe=
r with index `idx` in `io`.
> +            #[inline(always)]
> +            pub fn write<T, I>(
> +                self,
> +                io: &T,
> +                idx: usize
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +            {
> +                build_assert!(idx < Self::SIZE);
> +
> +                let offset =3D Self::OFFSET + (idx * Self::STRIDE);
> +
> +                <$storage as $crate::io::register::RegisterIo>::write(se=
lf.0, io, offset)
> +            }
> +
> +            /// Read the array register at index `idx` in `io` and run `=
f` on its value to obtain a
> +            /// new value to write back.
> +            ///
> +            /// Note that this operation is not atomic. In concurrent co=
ntexts, external
> +            /// synchronization may be required to prevent race conditio=
ns.
> +            #[inline(always)]
> +            pub fn update<T, I, F>(
> +                io: &T,
> +                idx: usize,
> +                f: F,
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                let reg =3D f(Self::read(io, idx));
> +                reg.write(io, idx);
> +            }
> +
> +            /// Read the array register at index `idx` from its address =
in `io`.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and `EINVA=
L` is returned if the
> +            /// access was out-of-bounds.
> +            #[inline(always)]
> +            pub fn try_read<T, I>(
> +                io: &T,
> +                idx: usize,
> +            ) -> ::kernel::error::Result<Self> where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(Self::read(io, idx))
> +                } else {
> +                    Err(::kernel::error::code::EINVAL)
> +                }
> +            }
> +
> +            /// Write the value contained in `self` to the array registe=
r with index `idx` in `io`.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and `EINVA=
L` is returned if the
> +            /// access was out-of-bounds.
> +            #[inline(always)]
> +            pub fn try_write<T, I>(
> +                self,
> +                io: &T,
> +                idx: usize,
> +            ) -> ::kernel::error::Result where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(self.write(io, idx))
> +                } else {
> +                    Err(::kernel::error::code::EINVAL)
> +                }
> +            }
> +
> +            /// Read the array register at index `idx` in `io` and run `=
f` on its value to obtain a
> +            /// new value to write back.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and `EINVA=
L` is returned if the
> +            /// access was out-of-bounds.
> +            ///
> +            /// Note that this operation is not atomic. In concurrent co=
ntexts, external
> +            /// synchronization may be required to prevent race conditio=
ns.
> +            #[inline(always)]
> +            pub fn try_update<T, I, F>(
> +                io: &T,
> +                idx: usize,
> +                f: F,
> +            ) -> ::kernel::error::Result where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(Self::update(io, idx, f))
> +                } else {
> +                    Err(::kernel::error::code::EINVAL)
> +                }
> +            }
> +        }
> +    };
> +
> +    // Generates the IO accessors for an array of relative registers.
> +    (
> +        @io_relative_array $name:ident ($storage:ty) [ $size:expr ; $str=
ide:expr ]
> +            @ $base:ident + $offset:literal
> +    ) =3D> {
> +        #[allow(dead_code)]
> +        impl $name {
> +            /// Relative offset of the register array.
> +            pub const OFFSET: usize =3D $offset;
> +            /// Number of elements in the array of registers.
> +            pub const SIZE: usize =3D $size;
> +            /// Number of bytes separating each element of the array of =
registers.
> +            pub const STRIDE: usize =3D $stride;
> +
> +            /// Read the array register at index `idx` from `io`, using =
the base address provided
> +            /// by `base` and adding the register's offset to it.
> +            #[inline(always)]
> +            pub fn read<T, I, B>(
> +                io: &T,
> +                #[allow(unused_variables)]
> +                base: &B,
> +                idx: usize,
> +            ) -> Self where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +            {
> +                build_assert!(idx < Self::SIZE);
> +
> +                let offset =3D <B as $crate::io::register::RegisterBase<=
$base>>::BASE +
> +                    Self::OFFSET + (idx * Self::STRIDE);
> +
> +                Self(<$storage as $crate::io::register::RegisterIo>::rea=
d(io, offset))
> +            }
> +
> +            /// Write the value contained in `self` to `io`, using the b=
ase address provided by
> +            /// `base` and adding the offset of array register `idx` to =
it.
> +            #[inline(always)]
> +            pub fn write<T, I, B>(
> +                self,
> +                io: &T,
> +                #[allow(unused_variables)]
> +                base: &B,
> +                idx: usize
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +            {
> +                build_assert!(idx < Self::SIZE);
> +
> +                let offset =3D <B as $crate::io::register::RegisterBase<=
$base>>::BASE +
> +                    Self::OFFSET + (idx * Self::STRIDE);
> +
> +                <$storage as $crate::io::register::RegisterIo>::write(se=
lf.0, io, offset)
> +            }
> +
> +            /// Read the array register at index `idx` from `io`, using =
the base address provided
> +            /// by `base` and adding the register's offset to it, then r=
un `f` on its value to
> +            /// obtain a new value to write back.
> +            ///
> +            /// Note that this operation is not atomic. In concurrent co=
ntexts, external
> +            /// synchronization may be required to prevent race conditio=
ns.
> +            #[inline(always)]
> +            pub fn update<T, I, B, F>(
> +                io: &T,
> +                base: &B,
> +                idx: usize,
> +                f: F,
> +            ) where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                let reg =3D f(Self::read(io, base, idx));
> +                reg.write(io, base, idx);
> +            }
> +
> +            /// Read the array register at index `idx` from `io`, using =
the base address provided
> +            /// by `base` and adding the register's offset to it.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and `EINVA=
L` is returned if the
> +            /// access was out-of-bounds.
> +            #[inline(always)]
> +            pub fn try_read<T, I, B>(
> +                io: &T,
> +                base: &B,
> +                idx: usize,
> +            ) -> ::kernel::error::Result<Self> where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(Self::read(io, base, idx))
> +                } else {
> +                    Err(::kernel::error::code::EINVAL)
> +                }
> +            }
> +
> +            /// Write the value contained in `self` to `io`, using the b=
ase address provided by
> +            /// `base` and adding the offset of array register `idx` to =
it.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and `EINVA=
L` is returned if the
> +            /// access was out-of-bounds.
> +            #[inline(always)]
> +            pub fn try_write<T, I, B>(
> +                self,
> +                io: &T,
> +                base: &B,
> +                idx: usize,
> +            ) -> ::kernel::error::Result where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(self.write(io, base, idx))
> +                } else {
> +                    Err(::kernel::error::code::EINVAL)
> +                }
> +            }
> +
> +            /// Read the array register at index `idx` from `io`, using =
the base address provided
> +            /// by `base` and adding the register's offset to it, then r=
un `f` on its value to
> +            /// obtain a new value to write back.
> +            ///
> +            /// The validity of `idx` is checked at run-time, and `EINVA=
L` is returned if the
> +            /// access was out-of-bounds.
> +            ///
> +            /// Note that this operation is not atomic. In concurrent co=
ntexts, external
> +            /// synchronization may be required to prevent race conditio=
ns.
> +            #[inline(always)]
> +            pub fn try_update<T, I, B, F>(
> +                io: &T,
> +                base: &B,
> +                idx: usize,
> +                f: F,
> +            ) -> ::kernel::error::Result where
> +                T: ::core::ops::Deref<Target =3D I>,
> +                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<$=
storage>,
> +                B: $crate::io::register::RegisterBase<$base>,
> +                F: ::core::ops::FnOnce(Self) -> Self,
> +            {
> +                if idx < Self::SIZE {
> +                    Ok(Self::update(io, base, idx, f))
> +                } else {
> +                    Err(::kernel::error::code::EINVAL)
> +                }
> +            }
> +        }
> +    };
> +
> +    // Defines the wrapper `$name` type and its conversions from/to the =
storage type.
> +    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty) =
=3D> {
> +        $(#[$attr])*
> +        #[repr(transparent)]
> +        #[derive(Clone, Copy, PartialEq, Eq)]

You can derive `Zeroable` and save you an unsafe impl.

> +        $vis struct $name($storage);
> +
> +        #[allow(dead_code)]
> +        impl $name {
> +            /// Creates a bitfield from a raw value.
> +            $vis const fn from_raw(value: $storage) -> Self {
> +                Self(value)
> +            }
> +
> +            /// Creates a zeroed bitfield value.
> +            ///
> +            /// This is a const alternative to the `Zeroable::zeroed()` =
trait method.
> +            $vis const fn zeroed() -> Self {
> +                Self(0)
> +            }

All types that impl `Zeroable` automatically have the `::zeroed()` fn provi=
ded
via the trait.

> +
> +            /// Returns the raw value of this bitfield.
> +            ///
> +            /// This is similar to the [`From`] implementation, but is s=
horter to invoke in
> +            /// most cases.
> +            $vis const fn as_raw(self) -> $storage {
> +                self.0
> +            }
> +        }
> +
> +        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
> +        unsafe impl ::pin_init::Zeroable for $name {}
> +
> +        impl ::core::convert::From<$name> for $storage {
> +            fn from(val: $name) -> $storage {
> +                val.as_raw()
> +            }
> +        }
> +
> +        impl ::core::convert::From<$storage> for $name {
> +            fn from(val: $storage) -> $name {
> +                Self::from_raw(val)
> +            }
> +        }
> +    };
> +
> +    // Definitions requiring knowledge of individual fields: private and=
 public field accessors,
> +    // and `Debug` implementation.
> +    (@bitfield_fields $vis:vis $name:ident $storage:ty {
> +        $($(#[doc =3D $doc:expr])* $hi:literal:$lo:literal $field:ident
> +            $(?=3D> $try_into_type:ty)?
> +            $(=3D> $into_type:ty)?
> +        ;
> +        )*
> +    }
> +    ) =3D> {
> +        #[allow(dead_code)]
> +        impl $name {
> +        $(
> +        ::kernel::register!(@private_field_accessors $vis $name $storage=
 : $hi:$lo $field);
> +        ::kernel::register!(
> +            @public_field_accessors $(#[doc =3D $doc])* $vis $name $stor=
age : $hi:$lo $field
> +            $(?=3D> $try_into_type)?
> +            $(=3D> $into_type)?
> +        );
> +        )*
> +        }
> +
> +        ::kernel::register!(@debug $name { $($field;)* });
> +    };
> +
> +    // Private field accessors working with the correct `Bounded` type f=
or the field.
> +    (
> +        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:=
tt:$lo:tt $field:ident
> +    ) =3D> {
> +        ::kernel::macros::paste!(
> +        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<=
u8> =3D $lo..=3D$hi;

Is this used by anything?

Best,
Gary

> +        $vis const [<$field:upper _MASK>]: $storage =3D
> +            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
> +        $vis const [<$field:upper _SHIFT>]: u32 =3D $lo;
> +        );
> +
> +        ::kernel::macros::paste!(
> +        fn [<__ $field>](self) ->
> +            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
> +            // Left shift to align the field's MSB with the storage MSB.
> +            const ALIGN_TOP: u32 =3D $storage::BITS - ($hi + 1);
> +            // Right shift to move the top-aligned field to bit 0 of the=
 storage.
> +            const ALIGN_BOTTOM: u32 =3D ALIGN_TOP + $lo;
> +
> +            // Extract the field using two shifts. `Bounded::shr` produc=
es the correctly-sized
> +            // output type.
> +            let val =3D ::kernel::num::Bounded::<$storage, { $storage::B=
ITS }>::from(
> +                self.0 << ALIGN_TOP
> +            );
> +            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
> +        }
> +
> +        const fn [<__set_ $field>](
> +            mut self,
> +            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
> +        ) -> Self
> +        {
> +            const MASK: $storage =3D $name::[<$field:upper _MASK>];
> +            const SHIFT: u32 =3D $name::[<$field:upper _SHIFT>];
> +
> +            let value =3D value.into_inner() << SHIFT;
> +            self.0 =3D (self.0 & !MASK) | value;
> +
> +            self
> +        }
> +        );
> +    };
> +
> +    // Public accessors for fields infallibly (`=3D>`) converted to a ty=
pe.
> +    (
> +        @public_field_accessors $(#[doc =3D $doc:expr])* $vis:vis $name:=
ident $storage:ty :
> +            $hi:literal:$lo:literal $field:ident =3D> $into_type:ty
> +    ) =3D> {
> +        ::kernel::macros::paste!(
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Returns the value of this field."]
> +        #[inline(always)]
> +        $vis fn $field(self) -> $into_type
> +        {
> +            self.[<__ $field>]().into()
> +        }
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Sets this field to the given `value`."]
> +        #[inline(always)]
> +        $vis fn [<set_ $field>](self, value: $into_type) -> Self
> +        {
> +            self.[<__set_ $field>](value.into())
> +        }
> +
> +        );
> +    };
> +
> +    // Public accessors for fields fallibly (`?=3D>`) converted to a typ=
e.
> +    (
> +        @public_field_accessors $(#[doc =3D $doc:expr])* $vis:vis $name:=
ident $storage:ty :
> +            $hi:tt:$lo:tt $field:ident ?=3D> $try_into_type:ty
> +    ) =3D> {
> +        ::kernel::macros::paste!(
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Returns the value of this field."]
> +        #[inline(always)]
> +        $vis fn $field(self) ->
> +            Result<
> +                $try_into_type,
> +                <$try_into_type as ::core::convert::TryFrom<
> +                    ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
> +                >>::Error
> +            >
> +        {
> +            self.[<__ $field>]().try_into()
> +        }
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Sets this field to the given `value`."]
> +        #[inline(always)]
> +        $vis fn [<set_ $field>](self, value: $try_into_type) -> Self
> +        {
> +            self.[<__set_ $field>](value.into())
> +        }
> +
> +        );
> +    };
> +
> +    // Public accessors for fields not converted to a type.
> +    (
> +        @public_field_accessors $(#[doc =3D $doc:expr])* $vis:vis $name:=
ident $storage:ty :
> +            $hi:tt:$lo:tt $field:ident
> +    ) =3D> {
> +        ::kernel::macros::paste!(
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Returns the value of this field."]
> +        #[inline(always)]
> +        $vis fn $field(self) ->
> +            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
> +        {
> +            self.[<__ $field>]()
> +        }
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Sets this field to the compile-time constant `VALUE`.=
"]
> +        #[inline(always)]
> +        $vis const fn [<with_ $field>]<const VALUE: $storage>(self) -> S=
elf {
> +            self.[<__set_ $field>](
> +                ::kernel::num::Bounded::<$storage, { $hi + 1 - $lo }>::n=
ew::<VALUE>()
> +            )
> +        }
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Sets this field to the given `value`."]
> +        #[inline(always)]
> +        $vis fn [<set_ $field>]<T>(
> +            self,
> +            value: T,
> +        ) -> Self
> +            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 - $=
lo }>>,
> +        {
> +            self.[<__set_ $field>](value.into())
> +        }
> +
> +        $(#[doc =3D $doc])*
> +        #[doc =3D "Tries to set this field to `value`, returning an erro=
r if it is out of range."]
> +        #[inline(always)]
> +        $vis fn [<try_set_ $field>]<T>(
> +            self,
> +            value: T,
> +        ) -> ::kernel::error::Result<Self>
> +            where T: ::kernel::num::TryIntoBounded<$storage, { $hi + 1 -=
 $lo }>,
> +        {
> +            Ok(
> +                self.[<__set_ $field>](
> +                    value.try_into_bounded().ok_or(::kernel::error::code=
::EOVERFLOW)?
> +                )
> +            )
> +        }
> +
> +        );
> +    };
> +
> +    // `Debug` implementation.
> +    (@debug $name:ident { $($field:ident;)* }) =3D> {
> +        impl ::kernel::fmt::Debug for $name {
> +            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::ker=
nel::fmt::Result {
> +                f.debug_struct(stringify!($name))
> +                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", se=
lf.0))
> +                $(
> +                    .field(stringify!($field), &self.$field())
> +                )*
> +                    .finish()
> +            }
> +        }
> +    };
> +}

