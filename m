Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022074.outbound.protection.outlook.com [52.101.101.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAA433C50F;
	Fri,  9 Jan 2026 21:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767993382; cv=fail; b=LKNcSpO5mVPreQC7j8+Q7J5Yw+4AcyNhr/UoHvN4uD8sVPFbHhPEWOMWIHhP1ULEsy0bJf88Ivr/uh9Xif/KtZGmbWtkn8R2RQkZQGRta46NDnI+dnWCivL811qsYgYCv72wOY6pvsDIhfWX4lA3ZrO42mjsFa72q1e3NhrbcsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767993382; c=relaxed/simple;
	bh=aHeuNZfApSOy/+K7IJ6nrpkMoxDOskTG+RFTAznFeeA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=oeymSaiGW5UH4rxiOHU46Sbuoe1/NuIU8W4vsDoRJZsyMl/hRJLH5SiJ31b/XE63uxHjqxtyB/PG5rGhA727fas6JA61g1PqZMRZ+3Iq9KMMTBEPrCH2VlXc68THJXGKJXoblFLPUOWOOM1Z/hC4EsmJomjLRRO3c4tPn5n0QJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZG7NbfEW; arc=fail smtp.client-ip=52.101.101.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZG7NbfEW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c56g8767GrsNM5GulcMRJXzrlmk/MgCVjCxyhyHVpIpZJwpSyEf2roKlOeb4tTyMbMUWRfOL+7ut9e/Qrfa0V2NRdFbjrN8Oe7sarXkGNiE0EgKiFKLDHPV5ttuKIQGX3L9gMuvFYuhAvotkgJsAO0/BV5NmnZGjzMRXjalvjsv5HIUlPXZFqiAyw3aazJZCl4qc+jTPChgfYep0jpHtH5ozFgsR3Wka+xw1RYhy2LibjUk2/8SMsOiHXk3IeF0bWSuzJ4NOlbr2ODqxing94yOsINvmnDyj6l8zFqz+JQMUETroaSUHqjhb8ALniHD8q44Cdzwu/rrt8dCHoZ5WLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brEkEcsM+iMpq7tzT1rHNdfmEc2cE/lrSRvyASNJD78=;
 b=czLc/VP1MQDIi9kgmfqTGlHEQChG0Op1f8oXpbdTz98xy5VB8LGMeUq18F18UAVjh+CK6smBp0gljIXl2ADOdANdfEhZCu/FVMK/HIuapQC0TwqOl7ZqVehrokAfnxEKWmSnNEGH/s3RG9kcZ7QXD1rbk9nr+hQai7zzotnQUSG8TZM/1C0WpbAHlzSIZjTGMoUklJLlvEuWvLgz9gad6BWJpPhuH3fADKelMTtKd47Le8DmT6f1cTv8rtotR216VMCsNCCFoEL9ZXgZaayvrkeAF6BasLHjEYl/wyVVg4osSsb0EZ6v6/nqszKQJIuPeheQsFch6PG5GKZ/j4jluA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brEkEcsM+iMpq7tzT1rHNdfmEc2cE/lrSRvyASNJD78=;
 b=ZG7NbfEWnj4ZtLXUrm0DRQovV3idSFrJ7nMOCJlZLNhsANoG7wShiLoO+JpSr8tcvj8zon+uI6VIS6e4Mh5MWyKHnmSq31dtakpQfXqp3RC6tfySZAzv0psMiawM4UoYJET+L7ZSi5m8rsSm4YC1QYAsJ2HbaQl7OcjP075iwv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6461.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 21:16:17 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Fri, 9 Jan 2026
 21:16:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 21:16:16 +0000
Message-Id: <DFKDCGI4Z6U6.2DSMGUP222WJ9@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/12] rust: pin-init: internal: init: add support for
 attributes on initializer fields
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-12-lossin@kernel.org>
 <DFK3Z9K6SMVA.1XCWR3Y3WK7OI@garyguo.net>
 <DFK98H2AC9OD.3TKEHOTK5CKE1@kernel.org>
In-Reply-To: <DFK98H2AC9OD.3TKEHOTK5CKE1@kernel.org>
X-ClientProxiedBy: LO4P302CA0005.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: ae620447-cad9-4ab9-288c-08de4fc453e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ek5wdkoxZS9kSmE4K3FsaldGa1NIYzNVVmZxUUk5Q3JmanN2eWh4UmpJVU9Z?=
 =?utf-8?B?UHkyb1BPYkZBMEkvU0ppa0pldHVUM2lBRURJOTQrTGJiZGUzK2tyRGJ3WUZx?=
 =?utf-8?B?ejBrM2lGblpTZS95WnRLc2FCekN5ZCtJVHJCaml2YkdFUjVCaUhFR05QSGY5?=
 =?utf-8?B?K1VnaXNnTzNySEJ5bndsU0h2QXRTRWM3RVp6cEpOSEFVU0RDdmNVK1J4c1Qy?=
 =?utf-8?B?elVIeVVsYzZ3b0dvUHpYR0hTd09HQ1lKK2ZZZkNDdGk2dXdnQk1obUxHbVc5?=
 =?utf-8?B?OW9nOFNlN1kyczZzdUUyblJIeGI1eWFrMVJySjZPMklNMGVMMVJNOEY5QVhF?=
 =?utf-8?B?UjRucVBndmwrOXhNa2VqaHk5RjgvNzNvazVLbDFFQnFYcWNqeHBTczZRUVE2?=
 =?utf-8?B?SHdrTHhFRzU5N2U5akc4eVhXL1grdVBHaTdaMTN1bm15MCsvY3dVMUErZWpB?=
 =?utf-8?B?UjBCOXlHU3drMmlaVTlaWXdLWlZjVFhncTVjemticnZYQXBqa2lja3RadVJr?=
 =?utf-8?B?WU5XVGhmZjFpMzdKS05WRnN0Y1VOZng0YXRjQit6T2lKZTNEeUFYT1NhVXRn?=
 =?utf-8?B?MjFSakd3TUVBTnZ3M3ZNKzhKYkhQd0Z2dktwQ1lzUmFtdzdjN3J1amNBZEZD?=
 =?utf-8?B?dGhIZnIvTnNNajh6VzVVWU9vSjROY3J3bmN2VWhRWit3cXRGUXBIZkg4djBw?=
 =?utf-8?B?eUhxNVNTYUhmZk9yV1R2bWVnQVl4emU2R3VncmtXaFZ0YTRsSXVGNzVPK1VK?=
 =?utf-8?B?N1VocTd4TWM5clY0Z2JnUHJUK1NCekdjMXNSMWNFMGl2M0dzS2tlNDVpS3p1?=
 =?utf-8?B?NUduUmIzQmEwRm4yZ3VjRXl6aTZ0THlyN2Z1ZGRKUjlvbXlleTdOeDBLYmJ3?=
 =?utf-8?B?SllwM1d3ZFlFZ1pyZWd0VUhwWS9aOW14YzE3U2Y0TlUxSTUzbzJyeVM2Vzdv?=
 =?utf-8?B?bEh4WmJDb3YzaXdQNlU3ajhOUlhTemdqdnp5dGtQU1h2RnFRcU13MTN0VnV1?=
 =?utf-8?B?aXR0RlAvS2F2R3luTGcvd3FIV0pFUVprZmdlZzdIOTMwdTlYYlRoL0NoQTg1?=
 =?utf-8?B?dWVhSU9rUThpQW93cjZqcjkwZ0NWelhTVVFaN3RYalNNejdzZmJuUnhMNjI0?=
 =?utf-8?B?c0J6UUxtT1VxQTc4ODgwMjJXQXFXeXkyM09ZaWFDc0V3S2dydmNxVmZRM0xT?=
 =?utf-8?B?SU5RYXFpakp5aGMzR2grbmZoQ1lxOUcwcmFCcEJxditXSkUybVo3T0lxZGlL?=
 =?utf-8?B?ZHhBUVNmZE5wQS9NZHdCSEZlaktOeitoZC8vNmI4cDhNUHQvcFNudlRrM0pF?=
 =?utf-8?B?Tkphb2hjeXBiOTcxaFkxV0xrODB5c3B5L1VDcnBYNWJ3WTJveWJGSzN1WmU2?=
 =?utf-8?B?cEdhVWhieXo3clR1djdFUTluZlk4Y04ycGZGMDZLb25NVFVoaGo1ZTF5cVNF?=
 =?utf-8?B?a25nQms3Tm1STmJRTXZZbzV0VzVlVjV0Q2VwZUtGY1JwcnI0a2EyU2tGZHFD?=
 =?utf-8?B?RUU1V0wvdURSOS9RVnZLbVQxVlBML1pma2wrRGxZWmxkaStiOE5keWZxT0xz?=
 =?utf-8?B?bFh0L1VlZm83bmtjclViNHYwT3R6R09sVjVMYlAxZmpvQm9lbDBYNkVuMTI4?=
 =?utf-8?B?ZUM0T2JaNFZLOTdJTEhCYS9rVm5lbzZYMkRtd2I3aDZCa0wzYkZHSnI3Wmts?=
 =?utf-8?B?d3BNVlJYbThFUTlpUU5HclMwWkpIbWp3eE9jRnhDRVFhSTMrQUZRVnVIMm94?=
 =?utf-8?B?c3h3NDNLajN4Nk45NmppcXdoNk9LeWpRYkxnQTVGZE0wT1RaTHBFYnBFV2pF?=
 =?utf-8?B?dm1vS01jWHgybEtLMUp6aDFmeldCYVRRck1aZk1WN05VNGRDcEpuSlIrSWlE?=
 =?utf-8?B?MXB4VU9WMFJCQk9YcmNZVzZVR0x3YlZSUzB4UnZRUjM1S2tNektrc0xaQWJC?=
 =?utf-8?Q?xaJ7TnB1JAvmml0+K5K7NtDBIMMHMmB1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2dMckV4OVJkWjBIdWM1NlVrYnQ5UHJOeE5DUjFscDdnUEMzd253MCtWSGZM?=
 =?utf-8?B?bDRPYWFLUEgrNFVJN0VrRS9lRlhYY2xkOUx4S1NEd1ZXL3R6bG9YQ05vWkcz?=
 =?utf-8?B?WEtnaUdMYmZVWEhkTG1xODFVakdhM25vYWRocHIvak5iRGZmMGY4c3dKZW1G?=
 =?utf-8?B?VmMzNGlMTkMwdlFKcGJtTGRQQjVjbWVTOUFHTGNlV2pHV3dkckgxS29WSWVU?=
 =?utf-8?B?QVliVVlLdXB3SWdmbTNEN1ZnSndUNk5BRUdtT09nM3hmYmErVHlRbEdwTGx1?=
 =?utf-8?B?aXM4RktHM1FMbTNNUU13TDFCNGx1eTZ5NGk0SVpFY1Y4b3c0U1Z4cDRnZzZ2?=
 =?utf-8?B?d3huRDY4eHo1ZFIzbHdoaVVBZFkxVEwrd2tTWXJhUEJvdEtGNWdnM1FsNmEx?=
 =?utf-8?B?dHBjNER1QnJ5VlMxRzIyY1J5WUJzRVlnOXJSTnlhRzZvam5FblhlNTlDSTBp?=
 =?utf-8?B?VEN4aVVHNHFHSTlvOGdjeVgvLzVrMkJPQ0NLdVZVY2VQWFE0QVZXUXp1WE5C?=
 =?utf-8?B?NFIxZEdXQzRDMjB3ZjcwQWNFU3JTbnM1MTA0RytvcDVqMWswRk95Q1NaVGFJ?=
 =?utf-8?B?UkZTUi9uQjhnVnQ2cG9iNkRDNzJXN0Vhd2hXNng1Mk9ITG4rWWJPMEhyaTVy?=
 =?utf-8?B?dDh6UVA2Qmpwb2Z2TEhFaEdvTVd4RVFmWXpCVVVkcThNK1N6UUV6SEVBWXQ3?=
 =?utf-8?B?bERPRnVlT21qNjhCUFZSWXFzVnRpVjRhNTVuVFBIVlVVTGRIV2xyblFYRWVo?=
 =?utf-8?B?ZkVPNGl3NnhBb3JjVjJORThPMVkyQU5kZWw1c2FoVzk0WVNmY2tFbGtXMVJz?=
 =?utf-8?B?amE0a1d1enNYZjJ1bmxuNWdYeXhOMDZnL201d2E1RGlJUjJoTytNemNmM3dX?=
 =?utf-8?B?MGZEU2VrTStVMzBNcGZTS1R2Sjg4dUYwcjBOa215L1M0em9UWFVIa2gxekt4?=
 =?utf-8?B?WDlDYk1Fb2FkaVk0WVUzbHY4WmdLd0tXYWlNUkNWWllkRzlnR3RkblpmZzM4?=
 =?utf-8?B?OXRlNzZTaUxkUVVzc3B3STZtQVoxWEdRd0MzT1NOcFZyMlArT1hGUmZ3Z1Nr?=
 =?utf-8?B?dUJnUXN0ZXd3Z3pvbnZVQ0FDSk0wTW5FYnRCVG9MNWZmd1VXa0xPSXlUUFdp?=
 =?utf-8?B?b3hzdW1lekpmRzRKQ2R0QUYzTml3Z3JqcmhBUlEzRlRjQ3VJR0JlUy9KVXND?=
 =?utf-8?B?OWlkQzNCdGFrcXRPVGxqZjNYYi9jeU5xbm4yTVFMN1JFbEp5YzRNeEZCQ1Jv?=
 =?utf-8?B?ZzQ5TFlUb3NBd2VENGJpYnZSZjMxOWEyaG9IZDFKYmxHc3k2cGNUWjBlejhO?=
 =?utf-8?B?QnlxK0lDSXlMZUNncUlxWXhqbGJ4b21FSzJUdm5QanRucmU3NXRmQlhrcFlo?=
 =?utf-8?B?R09zZnRHVWpjWjlsN2NMOUVybVhaN2xJVzcvUSsrZTJqNDNqcEtBNVdvcjBL?=
 =?utf-8?B?SjhZcWg5cTFwVW1Bd1hEMGdUTHR3RFhweFJiU3RNM0t2N0JGNU05bFVKL29y?=
 =?utf-8?B?RlJJUEFnS1F6UUp0ZUxtREl5TnVwNG1WM1UvZW5ZekErRnVzQjdHMmVGaU42?=
 =?utf-8?B?OHp2aEJlMkovNkNtZ1V5WUNJaHpKSmVpMFpMMWQ5QUFIbHZJejFHN0w5YkJX?=
 =?utf-8?B?VjBMd2MrakVRb3VQcTA1V25OK01wamZrOEk4WXo0bitFVmppMEdVMTZCZXFi?=
 =?utf-8?B?T2E0MmgzZmZtRzdlQVFhU204clJCb3NtY3grc0pPUFQvOUtPUjMxZ3dJczV3?=
 =?utf-8?B?VnlUTTdybmc2cVlCMkR6MjRlUmlZdDA1OXpPSW5TM2hTRzQ5QWFJOWNsTXlJ?=
 =?utf-8?B?Vk1FMnVlWjZJdk42NWkyNHpzWHlmNG9uWnlob0hUS2tEZ2RRWWxwQzlPVzQ4?=
 =?utf-8?B?Z1RlWVFHNktDcTRuZmZzaXYvc01wRjNxbmlzVmZlb0hqL3MzYnNVSFBvOUdx?=
 =?utf-8?B?VHdocEVwUTdWMFVKMlZWMG56bDJaRTBmcXEyTEhGSi80ZC9CazhyWWgzNWI2?=
 =?utf-8?B?ZDgyVjZ4S2FJVnZzZUVLWnZURkpCdjYrYWZFWnpVUC96cldKb0Fzbk90U0tn?=
 =?utf-8?B?SnBpSjNQd0RVTXJEdHRWMWlKaW1DSmlKTlhBMGp0VVdUL1RKVW41RzVaZ0ZO?=
 =?utf-8?B?eWF2NzZjSVJTOWl2WWdickhzd2hOWU1wWFRKOGN6T1lQak5oUGxzV2IwekFS?=
 =?utf-8?B?M0RmaG90Y0RodnQvMkFIbEY5ZlR0aGhsbWQ5T293TDhjRGhlZnoxTGw1aXh1?=
 =?utf-8?B?WG1wN2VBZlNobGwvSDdPNXRRNWw0NGl0cEhpNGdHUStTYVlmM0FzZlRuZUZY?=
 =?utf-8?B?VjRITUJOOC9KUUlVQ3BRbGNLbGRQOVgrV1hEek1ZalZVSXhIVWwzQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ae620447-cad9-4ab9-288c-08de4fc453e4
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 21:16:17.4171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0H3LPRYkhosamA0F8DiXOMHkYJZSv+z2/NbO4WIAc9y0RPDwkHl3tIESCS9pL5WmlevCf5VWRQk/nB7IpXcyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6461

On Fri Jan 9, 2026 at 6:02 PM GMT, Benno Lossin wrote:
> On Fri Jan 9, 2026 at 2:55 PM CET, Gary Guo wrote:
>> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>>> -        if let Some(ident) =3D field.ident() {
>>> +        if let Some(ident) =3D kind.ident() {
>>>              // `mixed_site` ensures that the guard is not accessible t=
o the user-controlled code.
>>>              let guard =3D format_ident!("__{ident}_guard", span =3D Sp=
an::mixed_site());
>>> -            guards.push(guard.clone());
>>>              res.extend(quote! {
>>> +                #(#attrs)*
>>>                  // Create the drop guard:
>>>                  //
>>>                  // We rely on macro hygiene to make it impossible for =
users to access this local
>>> @@ -316,13 +332,18 @@ fn init_fields(
>>>                      )
>>>                  };
>>>              });
>>> +            guards.push(guard);
>>> +            guard_attrs.push(attrs);
>>
>> I think guard_attrs should just get the cfg ones, not including lint lev=
els.
>> Otherwise, `#[expect]` would be broken?
>
> Oh yeah that is probably right. I do not yet have extensive attribute
> tests due to lack of time.
>
> Do you also think that only cfg ones should be included in the
> `#(#attrs)*` in the `quote!` above?

I think the full attribute list should get applied when surrounding the
user-provided expression. Everything else should just get the cfg.

Best,
Gary

