Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010052.outbound.protection.outlook.com [52.101.46.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F080D30DD1E;
	Wed, 14 Jan 2026 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377253; cv=fail; b=pzQvTswe3PWSz0G/VI+KfZpJCns0NfZyESBEV2KTpGJTGCQeOmzM43XA/P4avXi9MzmTB491hriKzuVmaJdTmVX7Q9hUkDg50A5Q2r1FRftXJdf+F9XaU02mS5zj0K3nWn6ZX9fKuElfZqrsLGI5ZyB+i0gf0L3WqJwML+noOx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377253; c=relaxed/simple;
	bh=yPRtwV0AKOoef7LiUEz2xeYXvPO4/ArtpqH4ok/1FOM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=DUVDKt7ezGm+MpJTT3qHv5huQpe1pxg4JtjBUaxK6d6bumF7LOGNS9aLSyCUtUQvPwIB6ffYIuGV8/9u27xHVaR/EQQ2gOn4CbFSuTv9U8xL5ZANazPote8E3tWfsMjM14ZVN8h6D2kgaUgP4Q6WIyXDEZ7iCE4c/RZvqSNGdoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=biIhVEky; arc=fail smtp.client-ip=52.101.46.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="biIhVEky"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjekNtRsnnpTkLJ2sG6BEsOJE63ar9LnYt8H6+qtLUDpezOqxNIC9zrOB3bFwI/WvVepdL6BWE5+t+IKIREcMhuyQye81KYw7iZW300yd3jjT7F/eOyNT81fxE+W2EG75rlxU8Ro64Cng21nkiHV4NmSi4y8tOr71k7OhbTJsXF2D3WAchf9nmL8Zx6C3GUtv4s7KCGmgV+hbrNJlt1BVtMoNHbm5u6lEqgyHy2oNSVZixe9t+xExRgKNDGpreIUS9LWoo68eoOxJvhTrSnRk3FVKly9AyvUDybcsFIeNJEOmRGVKGwD7x78uUu7mUxzlHMJsSNJTjSVHrIWiwYjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPhAJaF9p2Df12i9y9EHBbkXR4FhKFLyEAy/fod1Xyc=;
 b=s5IfMv/0KADhrD0K5CC8ZFmGFGtifX6wg0N1RSZZEIVIKU3W+6/+zR/QJYaNd77o+A5Xg5mYLpHDSVnGFakC7BE8zw+oJ9Cam4VTR5KHd4R6XSonSZiy3czYbn+tpty9g9ISAQPesmCcw+LtrfWMSX6+oquIVEN4AdbrpGPfLP+J3XJejme6iLOXdY1nYtb0zAd37am0kGHPvLwkSO4z8FUgHC46WneB+iKk6xdoEnpS1FHpcODxoKflP67ryvhDRf3ch6V7nBxXWDVrNzL1U3PLRqWqWNBYCeW30JQ3EWeEZY+Iom1uI7VI6E3zsliHi5x4pBsUSjK/xbutm7/m6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPhAJaF9p2Df12i9y9EHBbkXR4FhKFLyEAy/fod1Xyc=;
 b=biIhVEkyGJUZ1Q/zIDHLaM2/4c8G7fFd7LNXxi1xDIiB4JlIW7lOyxRTEFnc30VFUvAdA81vd74DDtP4/JiJh7P0ygm4K4cShx2GUlkIR/jHvSpYcq1G+Km7uuATRdrlAriG6h2eIwIVnB7KABmQRtj2CArNX2At9EGkgquJ5mfRWhSGYJT59jcBKOf0YitmKcQvDLy5atCaGDqGS/FVfZwjLLyGuVzCapxCymg3kHuDEcbp/Jgil0qleNICaWEQIFHCiMr5iCbvCsN/BZtrpMMlGN6y9l1D7a9AzDxf011NJt5GxH2iCQEJMCcy3QBP3L9oNIHC9ZWYyxtAilAirw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8978.namprd12.prod.outlook.com (2603:10b6:a03:545::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 07:54:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 07:54:07 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 16:54:04 +0900
Message-Id: <DFO5EYZN84GY.3EAJUY3UASFCJ@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Matthew Maurer" <mmaurer@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: Add soc_device support
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
 <20251216-soc-bindings-v3-1-42ecdc8c117e@google.com>
 <DF050MST4PTF.DFB7FVBD25I7@nvidia.com>
 <CAGSQo0173bon2kGo5wGFXo-1x+LL1NpH376Z4GcshKaGVNLHXw@mail.gmail.com>
 <CAGSQo01XL73n7rjst-YYoOpGEv4rB9C6dv5k8uSEgL2QY3YC3A@mail.gmail.com>
In-Reply-To: <CAGSQo01XL73n7rjst-YYoOpGEv4rB9C6dv5k8uSEgL2QY3YC3A@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0247.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8978:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e08907-c7c1-4a4d-18d1-08de53421843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDVzaldldFdjcFZmS3dCdGcvTTBnZGtRcUhQSGtiOU9kalM5c21Oa3hpR1dX?=
 =?utf-8?B?Z0hGVFdHTTFMR3kyam54bG5salFzTDArSVVEeXV0MEtocHRvcTB5cmw1NEIw?=
 =?utf-8?B?N2FNUDRrTzAzUUxKcFZIQ0JPSDRYSXNOb3VsWnFqYzB6YkFLMmc2d2pyQ1E2?=
 =?utf-8?B?MjN6V0dybWNJZDhOendGbXFxQi9uK1VTc09GZjZzRlFCbGlOWk5INTRwSkVk?=
 =?utf-8?B?RG9xekpoenpkMEpvYXZlRXhSek50M1Y4TC9JS1ZXTGpYZUJBUkQ0Uy9xNld1?=
 =?utf-8?B?LzdoeWxZQmtHeGNyeXZBSUh0RkxRYVpNZGVsa1pUQ3RPNXY5VU9uME43d3g4?=
 =?utf-8?B?MUNkMkdxSnhDczNTUE5xRFRSc1p3T0VTUHFqUUlpUFFRa29EaTJBdFM1cFor?=
 =?utf-8?B?VElCcitKQU0yUVRUUXgxRk1IOENWd3oyL2MrTktvU2x3ZXpMekhLdW9WRTlZ?=
 =?utf-8?B?MmdwS2kvc2JvUE41M3RMd2FtZGhsYmkraUhUL3dFMGlVV1krVU03NmV2QTJF?=
 =?utf-8?B?R2ZqL0ZpV3o5MFloRCtjcUtFMW4yZWU2eHVoT2dMYmpiazBJV2ZGR01vWnU2?=
 =?utf-8?B?czF4aitCYXJvdU0vYlVhOWtCYUJQK1VHUk00YVZldmM5cy9qQWlUYzVJSzBj?=
 =?utf-8?B?ekM2ZTZNZkIwOXI1VXQ5YW4yK040U1ZjNHJtbkVEZWFvSHVvNzhiNFlOMVE2?=
 =?utf-8?B?VkZOOXh2KzBmblEvTHlTdDF2YnovT2RYcWwwdmRPZExSMFl3MTdqemZGMjN6?=
 =?utf-8?B?OGVwdmdNbUJvYWJxdU5FalFQaVZWK3NRYlJYcE5tRDN3a0J6Q1R4b0ZFQU9S?=
 =?utf-8?B?MlBpTVRDVUwrT3pqU2N4U2ZGS1Y1SEgySjlWZUlGajQwMGlmVGVOTlEzZVhz?=
 =?utf-8?B?NUxxQ0IzclRuWHhNTWp1bm5ENStvTVNWbjhLTVBwSzh4YjlXUHE3REdkdTM1?=
 =?utf-8?B?aElodm40cGR5bTIzTml4dG5qcDRXSVNIYWhiVEVKNHprK3JrKzVvc2gvVXJs?=
 =?utf-8?B?cmw3TEJBRHB3Zm9XK2tEWGlMeHVEUjhZcnR1aHVnVHhLUU9TSHFleFkvQzds?=
 =?utf-8?B?QnFmaWd1L3orREFjKy9YU2pndlFJNEtNQmZKTWxVZHlodmFyL2g4UUdNR3I5?=
 =?utf-8?B?SllxY3pUMXNFdUcxdWova04xc01UMXlCUTZLNEREREREUXhScXh2blJsNC9x?=
 =?utf-8?B?VHYwZ3R3aytaTDVRMEx1SlFjanB1UFIyRU8xd0RWOHNNTlJKbTg5TGtOT0Ur?=
 =?utf-8?B?V1lKYUFhb3g3TFc4a2w5QlpBbklrek5lbTNDcmZUZUhPREtIVGJoU21JdWN6?=
 =?utf-8?B?d0hXRjFzVHZqT3VhRER0NlEwZWxRUEs5UW5Hb1drOFJsS0hPUnJEdDc3SjJG?=
 =?utf-8?B?NDNRb2hrd3IzUFk5RW02NVpxbXNhU0N6dHgwOFFIZ0pqMU9PNUpEWXpTV0Vw?=
 =?utf-8?B?U004OEVqVU84M0cxY3hNYnQxTXo3LzNDV09BT2FQRGwvZENsSFBsUG8wdGlF?=
 =?utf-8?B?VVpvU25RQkUwWVlPYTNaenR0M2orVW5JYnhTdkU1WktSQ3FCK0R2eGlGR0p2?=
 =?utf-8?B?T1JvelBPeXRXWUVhdzBmSTRKNk9XZi8wYkFQRkpDNndIandvZnlkZitqaUxW?=
 =?utf-8?B?cFdjME9lMGpzaE1GbUw2ZjZLYmdIc01acVM4Y24wSG9WSTdhMnB3M1ZsajJT?=
 =?utf-8?B?bHpIdmVZb1FzOWpjSFFRc3NPc0Jxb1djeDg3UkhnWFp0QWR4TXZFYUZKMUlS?=
 =?utf-8?B?QVR0SXZ5czhjdUZTU3VoaWdjUitqRUlFR2JyUVorQ3NRbU1YajJXem5LSUZD?=
 =?utf-8?B?NzVSbDlwWm42b1JpUFVoZitBV1REMjI1T2ZEWVlZcFBIR2RZMitQL004Y0tV?=
 =?utf-8?B?enVHRmhnVDFCbXRvK2VyWlRkTGNvbDV1aDF4Z2VTdVBjYTYxaXRUb2s4UGUv?=
 =?utf-8?Q?H14RvbMrlAzOOgRrnwpn+DbnFi3qpPOe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE5vZEROZzFxY0lPeFh3bHFvVk5nb2ZleHNGc280U0s4TXRDYTBMNFRtRzlj?=
 =?utf-8?B?NDV5UVJSOFdIWjlhR0ZpaUNVVnkremZDM29OREhQemRsblZjaFRUNUdxUHFm?=
 =?utf-8?B?V256MnRuZUdrRHNkWEdOV09FZ3YxSkxzUlFqN3A0K2twUzJuVXhNN3NoL1J3?=
 =?utf-8?B?MzhZcms5WnFUNHRpVFZCeUZkdWp4eHZFZzVNZ1B3M2ZkSElNUEE4ODh3WGZ1?=
 =?utf-8?B?UGlvejVRV1RrNXB5b0pqb002UFprZVZPL0E1RStQR1RlQkZ5eG5yV3pMdy9B?=
 =?utf-8?B?c1FndUhYS3dud1l5N3pLdDVtcTlpNkRGV1p1a05nU2ptQWNzcDFXaldGQlh6?=
 =?utf-8?B?VzMvU3VCTzViUWF2bndNSGg1bGlxTnhnRDdxQ3ljUDdxK2xGa09FRXdSVmV5?=
 =?utf-8?B?RzhZZDBPdzIvQ2RkTWhDN2ZqalNYUVFhckYzZzBiWUdhL2Z4V3BJZXlvLzc4?=
 =?utf-8?B?WWl6NkJmcXJNMDBlT2NFTW5DUDlyclJ0M0podHZTMk5wMUdjcU82cTA5dUdp?=
 =?utf-8?B?aHEvdW1rUjRyRzlZQjJkbnNUOXhuQkpWTk9kMEN3TFd0bUU2alNxWHFQRHBn?=
 =?utf-8?B?RC9aeWxIaFE0d2JLbzQ3RGppdG8rQ0NYenQveWg1RzRRMU5ybEdGK0hkTy9X?=
 =?utf-8?B?N1FHc1dsSFZpNUVZcjZYU2VZMTVOUGlJbnpQQ3NBblFFQ1pRb1phWnFtOUJS?=
 =?utf-8?B?UWlsM0RBajljRmw3VW9BOUtCZXhPYlN0UW4zdjNLNS9IanpjNnZmakVCTklV?=
 =?utf-8?B?VUJ1SWhod0U2dityMC9KTHc3WjZ3QWpQK2NQWEcrait0ZC9zTGhtWmpJWEN5?=
 =?utf-8?B?N2Qxc2ZZTjJYUjBtQWh2TXdJT2NaV1h3NzhCcmhUSmg4eGg3alRHKzZlT2pm?=
 =?utf-8?B?OXdtZ25UQ05GNHNqSys1WHRzUjVvWkhRd2VDc21FNld5RmZaQWdsTGhFWGsz?=
 =?utf-8?B?cEZIajJ5Z1dKbzhDWE15SGVQeUgySUtLcXlqVDAydE5PV2dGMHZXQUxoTXVX?=
 =?utf-8?B?NXRxTlVCWU8rd0NzbzJrejV0NUJGQTI4T2E2NmRHbjF0T25Na0dPYjBuRm8w?=
 =?utf-8?B?WVRTeXliaWtHUEJTTHJWYTBWN2hYY0hYcHhvV3EzbFZVeVVkWk9Ib2JDUlFX?=
 =?utf-8?B?aTJHVDhHYWdEOUxpMDlicHpUSSs0TzVJMW41anN0STFXT2Q4RmpJWlB2T2pI?=
 =?utf-8?B?SmcyQytBS2ptdmRGYmE5UDRrR3ZQUzloZ1QySUNweTNrM1hxMUdmdGZ5S2hZ?=
 =?utf-8?B?QS85bTFXMVFYZ2p5amJBNmtNbjMzR092QThwQ3lzdXhueVJ5ZjllV2Z4U2xz?=
 =?utf-8?B?ck5UZi9UN1pHTGQ2SDduSnZ4VFUyTC9Cb3dNZkxuZUVUZXNrd3FHRmI4bTBp?=
 =?utf-8?B?SmIwMUllNENZY0MycGc4d0Q2dDBQQkdxVi9SNnNOU1E5UGZGRkVtckE2VXJC?=
 =?utf-8?B?eHc4RW1tNVNuVTFBbmllZWdXOEFRMy9idStpbDlSRzBFMDkxREVoWVFlM0sx?=
 =?utf-8?B?eVFtVmt1bVIwc2cya2RrQ0oxMlFyc3BZZFAzUEJGd1NUWFpWUHByVDlHVm95?=
 =?utf-8?B?RGFCdjlXMUhxandXQ05nOXVhV01WMFBYTWE1T2ZlenphWFhIWU9nN0xFM1lm?=
 =?utf-8?B?T3ZVL2FBaXFYYVJpbDZ0c3EycW1RVDgxdEUxaTlyaWpDUlBoNHpqbEprV0wr?=
 =?utf-8?B?d3lUak4wTmRmTmYvcTNDU1FUSEhCbFFpUkFHT2ROQVdOZEthRkYwY01FSUkz?=
 =?utf-8?B?em5qTmJkRldFUVo1c3M4b3MwRldncHpIVDVtc1FTR1ZXS0o0VHd4SEN2NFRC?=
 =?utf-8?B?VG05RkptRURPR3RsdFZpVEZsenltUi8zZ1B0ZjlIQVlqZkF1RUgzaWtLQkNR?=
 =?utf-8?B?MnRBM2tSbzVVV3gyWFA3NzBKN1V5VEhQMjFFMFhGNmVQWFFIbFJLaTVxbWQ0?=
 =?utf-8?B?dWhuRHh4d0llc1RBRno4KzJNR2xCeUJVTGFYY1RmMHZhN0c1MlY3dmptYytL?=
 =?utf-8?B?YTN0UGpRTHVzdmUvWmx6a2NXL2JSS3lkR242RGgwL05OemUxSEhpU1FVTTU5?=
 =?utf-8?B?c0dWa0JwQ21OMzJxOUFqWE93eGk4aStwdDZWR29PQVpldWZwNTlYbi9Cdzds?=
 =?utf-8?B?dHB0YjNzSWFKUm1ycUNPcEJabTZEWUtUemQzenhCZlRZVmtFeXI4SkZXS1Nz?=
 =?utf-8?B?dUtsbzdYVlBIZFJHK3o0S3M1Wnh5STNad0w2TmlIUTFNWk52T29pUHFtTWd6?=
 =?utf-8?B?bGpJYXZYMVZyMm5MWDVrSVQwcTh0ZXFTdmk3UlVySUFzQngwSTZkaXROaGo4?=
 =?utf-8?B?ZnR4ZXNZcUF1TkdHTDljN0VUbWl3ZWl3VStxWVVRbDJsajNhVDZoSkRxazVK?=
 =?utf-8?Q?GWhny4htM6MKSS/WobjSvWLWre97WiX2DqOKrMqUg1Nwa?=
X-MS-Exchange-AntiSpam-MessageData-1: 7Bx2aQmdTBHeDQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e08907-c7c1-4a4d-18d1-08de53421843
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 07:54:07.4163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mv8i/P8phB7tJlhFxFk/ui2vJzrDJFyEupqmPh0M2WpYXuoMo25f7qfdN98eb6hkxQV24cSZK85+YCNuy78nUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8978

On Sat Dec 27, 2025 at 4:38 AM JST, Matthew Maurer wrote:
> On Fri, Dec 26, 2025 at 11:26=E2=80=AFAM Matthew Maurer <mmaurer@google.c=
om> wrote:
>>
>> On Tue, Dec 16, 2025 at 6:31=E2=80=AFPM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>> >
>> > On Wed Dec 17, 2025 at 4:24 AM JST, Matthew Maurer wrote:
>> > > Allow SoC drivers in Rust to present metadata about their devices to
>> > > userspace through /sys/devices/socX and other drivers to identify th=
eir
>> > > properties through `soc_device_match`.
>> > >
>> > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>> > > ---
>> > >  MAINTAINERS                     |   1 +
>> > >  rust/bindings/bindings_helper.h |   1 +
>> > >  rust/kernel/lib.rs              |   2 +
>> > >  rust/kernel/soc.rs              | 135 +++++++++++++++++++++++++++++=
+++++++++++
>> > >  4 files changed, 139 insertions(+)
>> > >
>> > > diff --git a/MAINTAINERS b/MAINTAINERS
>> > > index c5a7cda26c600e49c7ab0d547306d3281333f672..4ff01fb0f1bda2700209=
4113c0bf9d074d28fdb6 100644
>> > > --- a/MAINTAINERS
>> > > +++ b/MAINTAINERS
>> > > @@ -7700,6 +7700,7 @@ F:      rust/kernel/devres.rs
>> > >  F:   rust/kernel/driver.rs
>> > >  F:   rust/kernel/faux.rs
>> > >  F:   rust/kernel/platform.rs
>> > > +F:   rust/kernel/soc.rs
>> > >  F:   samples/rust/rust_debugfs.rs
>> > >  F:   samples/rust/rust_debugfs_scoped.rs
>> > >  F:   samples/rust/rust_driver_platform.rs
>> > > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/binding=
s_helper.h
>> > > index a067038b4b422b4256f4a2b75fe644d47e6e82c8..9fdf76ca630e00715503=
e2a3a809bedc895697fd 100644
>> > > --- a/rust/bindings/bindings_helper.h
>> > > +++ b/rust/bindings/bindings_helper.h
>> > > @@ -80,6 +80,7 @@
>> > >  #include <linux/sched.h>
>> > >  #include <linux/security.h>
>> > >  #include <linux/slab.h>
>> > > +#include <linux/sys_soc.h>
>> > >  #include <linux/task_work.h>
>> > >  #include <linux/tracepoint.h>
>> > >  #include <linux/usb.h>
>> > > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> > > index f812cf12004286962985a068665443dc22c389a2..6d637e2fed1b605e2dfc=
2e7b2247179439a90ba9 100644
>> > > --- a/rust/kernel/lib.rs
>> > > +++ b/rust/kernel/lib.rs
>> > > @@ -138,6 +138,8 @@
>> > >  pub mod seq_file;
>> > >  pub mod sizes;
>> > >  pub mod slice;
>> > > +#[cfg(CONFIG_SOC_BUS)]
>> > > +pub mod soc;
>> > >  mod static_assert;
>> > >  #[doc(hidden)]
>> > >  pub mod std_vendor;
>> > > diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs
>> > > new file mode 100644
>> > > index 0000000000000000000000000000000000000000..0d6a36c83cb67ef20dc1=
e3d3995752f36e25ac9f
>> > > --- /dev/null
>> > > +++ b/rust/kernel/soc.rs
>> > > @@ -0,0 +1,135 @@
>> > > +// SPDX-License-Identifier: GPL-2.0
>> > > +
>> > > +// Copyright (C) 2025 Google LLC.
>> > > +
>> > > +//! SoC Driver Abstraction.
>> > > +//!
>> > > +//! C header: [`include/linux/sys_soc.h`](srctree/include/linux/sys=
_soc.h)
>> > > +
>> > > +use crate::{
>> > > +    bindings,
>> > > +    error,
>> > > +    prelude::*,
>> > > +    str::CString,
>> > > +    types::Opaque, //
>> > > +};
>> > > +use core::ptr::NonNull;
>> > > +
>> > > +/// Attributes for a SoC device.
>> > > +///
>> > > +/// These are both exported to userspace under /sys/devices/socX an=
d provided to other drivers to
>> > > +/// match against via `soc_device_match` (not yet available in Rust=
) to enable quirks or
>> > > +/// device-specific support where necessary.
>> > > +///
>> > > +/// All fields are freeform - they have no specific formatting, jus=
t defined meanings.
>> > > +/// For example, the [`machine`](`Attributes::machine`) field could=
 be "DB8500" or
>> > > +/// "Qualcomm Technologies, Inc. SM8560 HDK", but regardless it sho=
uld identify a board or product.
>> > > +pub struct Attributes {
>> > > +    /// Should generally be a board ID or product ID. Examples
>> > > +    /// include DB8500 (ST-Ericsson) or "Qualcomm Technologies, inc=
. SM8560 HDK".
>> > > +    ///
>> > > +    /// If this field is not populated, the SoC infrastructure will=
 try to populate it from
>> > > +    /// `/model` in the device tree.
>> > > +    pub machine: Option<CString>,
>> > > +    /// The broader class this SoC belongs to. Examples include ux5=
00
>> > > +    /// (for DB8500) or Snapdragon (for SM8650).
>> >
>> > Formatting of the comments seems a bit off (also appears in other
>> > places, please reapply formatting globally to be sure).
>>
>> I have just re-run the `rustfmt` target on this commit, and see no
>> changes. Is there something specific that you think is off?
>>
>> >
>> > > +    ///
>> > > +    /// On chips with ARM firmware supporting SMCCC v1.2+, this may=
 be a JEDEC JEP106 manufacturer
>> > > +    /// identification.
>> > > +    pub family: Option<CString>,
>> > > +    /// The manufacturing revision of the part. Frequently this is =
MAJOR.MINOR, but not always.
>> > > +    pub revision: Option<CString>,
>> > > +    /// Serial Number - uniquely identifies a specific SoC. If pres=
ent, should be unique (buying a
>> > > +    /// replacement part should change it if present). This field c=
annot be matched on and is
>> > > +    /// solely present to export through /sys.
>> > > +    pub serial_number: Option<CString>,
>> > > +    /// SoC ID - identifies a specific SoC kind in question, someti=
mes more specifically than
>> > > +    /// `machine` if the same SoC is used in multiple products. Som=
e devices use this to specify a
>> > > +    /// SoC name, e.g. "I.MX??", and others just print an ID number=
 (e.g. Tegra and Qualcomm).
>> > > +    ///
>> > > +    /// On chips with ARM firmware supporting SMCCC v1.2+, this may=
 be a JEDEC JEP106 manufacturer
>> > > +    /// identification (the family value) followed by a colon and t=
hen a 4-digit ID value.
>> > > +    pub soc_id: Option<CString>,
>> > > +}
>> > > +
>> > > +struct BuiltAttributes {
>> >
>> > Even though this struct is private, some short documentation would be
>> > helpful - actually the explanation about the relationship between
>> > `_backing` and `inner` belongs here imho instead of in the member's
>> > documentation.
>
> I don't think I should do this unless there's some kernel-specific
> style guidance I'm unaware of (I checked and couldn't find anything,
> but maybe I missed something):
> 1. These are comments, not documentation. Documentation is intended
> for a user of an interface, comments are intended for a reader of the
> code. The information in these comments should not be considered by a
> user of `BuiltAttributes`, even an internal one.
> 2. Usually the reason to provide documentation for a private structure
> is that it is available for use at a larger scope than the local
> module, even if it's not accessible outside the crate, for the
> purposes of helping developers engage with the type either through an
> IDE or a local reference. That does not apply here - this is an
> implementation detail of `Registration` and should never be used
> outside this file.
>
> That said, I don't care that deeply about where this text goes, so if
> consensus is that we'd prefer it to be in a doc comment I can put it
> there; it just seems wrong to me.

My thinking for suggesting this is that this code is open; other folks
might work on it later, who are not familiar with it.

Having the data structures properly documented is useful for them,
especially if they are related to other types in ways that are not
immediately obvious.
