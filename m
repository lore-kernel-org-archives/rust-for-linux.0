Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2A71494C2
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766504893; cv=fail; b=U0eeQBqW4sZ3ZisdMSXnRy5gGu4qSr+0/szihf0dpjFMtIdfGHkhtsSk6m7BqjftThNEgbjf2Dvjg0l5Y9/6ObFSoPHX69UxOcZHmnzt4KW8rFvoy1rq1svbLJ+0Z81lnBDKsGuq7xLg3nJhSDkDELToLFlFFAVdtAaUZQH0Bk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766504893; c=relaxed/simple;
	bh=BmLxZSwswGDXqX5/lEsk/FMIVA6THNX16HjSJjVnyhM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BV/mND0YGXIBCgLPP7YApEYWI5H5Dz/k+mswDt7jSOD9mqm7PlN6y4OTJyaez8C5S+ngDWnHag4PWPpM0Oceg6PQRIbHMcNyQ73rxmp4UTek/CLRMumUTtyIP1lOQMs+xQTdCSlHBhnELF7hQNnOEEQGM4lJR9S2tADBC4OH39c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eWNvq8ym; arc=fail smtp.client-ip=52.101.48.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eWNvq8ym"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7z48rOmLso5o/LHB2m+hlcByCPBuycmH9bOZdmAJ8JpYK7MBO01EHySCUHewc66yp0FNpWXeWIxg2oImVKuzPKqit2eng+uZDuIR6AsEBt+Yca+7i5fBiM2YdmF1XC0wuLQFvvRmPQhluOJexrXbUdYCH262IV1phvFm73Mo9HWAlTzUa0F6fLGPoB9obcLiW7UYskoRQgLq4il9mW9w2tkV8FxOrz41SbZjvGHtYB2bmME+07WNDwYcvmZsbh2sr42aRCwYxqKMRZKrP+lsSzb/Dg+haEslab/4SEXHCAWzc55fcuWqt+JswR5esc3NHEPdxbJ2/pN/ISBt6XdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmLxZSwswGDXqX5/lEsk/FMIVA6THNX16HjSJjVnyhM=;
 b=ZVe8RzvA2HtPdNj5Rs6YpB67SZFJYlpM+D0s8bhb4zNeB+jueujfA0itEzG8qpFz/bTm6T3E/VpSIztb6l8BbZ9Q/SpWYZTjgA/gcsNWkeZ3GdSPWnmCPj3K1trw+lcSstkvpnxlxuLj8ElnWYVNnd3UgCpGzXUaM7HjUx0mb/IjLXwD3dyBwphQQKoYi34Du1FfR1d6ljSUfzvBC/nAb5pHAneimeECp9UBjc8G5Y5NcDRMhMIcmm1i6LqdiQiHR95cHvJwyH/qJDFKjcNDz/5A43Xfl+i/JjKGfN5g8LQL+RXTCsPBkW+NqoMtoBmuf7Mtwr1ZRNWPAVLzYYDcFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmLxZSwswGDXqX5/lEsk/FMIVA6THNX16HjSJjVnyhM=;
 b=eWNvq8ymQ1uPOjRcZ1Dg9D6sejUuq3yhSIkOhtlJRJwL0HSro5F4R0rI+t4N9YyEfw3xQ3GMu2gY+ImesPT+Wn2F9NhXAs84Lqfzs741eS1qL6tuCI0DyWVvNM1pDO0hK5yHCJIeobiC+OGFCAV8Pf5fgJSBgEYqd5v64tKam50OUMCsogS+8X/+RfuBv3y5QnMIws8uiQcGFB4Ue9Pl8yC+e7ZrpEP4x/OnryVjm2kchfdV4X0pfaRNLePXOLbyN0JsfUUpVzC/RYL7lweqRvzEEiwJFXIR8cP6B4cHq/oRH/BJNPcZheem7dq2TtRksEdwqvvTjoXHMig1w5rk7A==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by MN0PR12MB5836.namprd12.prod.outlook.com (2603:10b6:208:37b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 15:48:08 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 15:48:08 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, "tmgross@umich.edu"
	<tmgross@umich.edu>, "lossin@kernel.org" <lossin@kernel.org>,
	"miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>,
	"sunke@kylinos.cn" <sunke@kylinos.cn>
CC: "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com"
	<boqun.feng@gmail.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"tamird@gmail.com" <tamird@gmail.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>
Subject: Re: [PATCH] rust: fmt: reject {:p} format specifier for raw pointers
Thread-Topic: [PATCH] rust: fmt: reject {:p} format specifier for raw pointers
Thread-Index: AQHcc9c//PJHE29iQE+qhpYa4bYqfLUu3XAAgACB8YA=
Date: Tue, 23 Dec 2025 15:48:08 +0000
Message-ID: <b03386f3f1547eaa12579617a34d66763a3f1600.camel@nvidia.com>
References: <20251223033018.2814732-1-sunke@kylinos.cn>
	 <CANiq72nZp-ULXMV9yG_PP=gkr0HUPTcE6ZRQhtgRp5Zk5SR6sA@mail.gmail.com>
	 <DF5FTUW7WN59.1YJXZUL5F5LD5@kernel.org>
In-Reply-To: <DF5FTUW7WN59.1YJXZUL5F5LD5@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|MN0PR12MB5836:EE_
x-ms-office365-filtering-correlation-id: d5b6006e-3b6b-46fc-e247-08de423aab2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7142099002|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VVlJR0ExQmFJbWFXQkNHM1FoN25Ja2l3YTZrbnUrNE9OajRVUlNpOGxETXlW?=
 =?utf-8?B?ekhQMFdnTGpBcUJXdzZ5ZUEzODRoOXJRVTJwMS9CTVNhSSs4MS9xWW9aYmU2?=
 =?utf-8?B?Y3Q0ZE9IVGNpcFhEUVo5U25yTC93T1pVcjNqTlJQb2Nsb1FEa0pPYVQvaXhv?=
 =?utf-8?B?K3UxVGxxSGtpamx2N21jSVVERnVwT2l0dk8yM0tBWEg4YjBqeTJxVG5SRTNX?=
 =?utf-8?B?c3hpSjE3WVFNVHVTWkVVejZqeXcrWWNpRjUzbGVhSExPMlRZWm1YM0k5MGg4?=
 =?utf-8?B?bURyTFdNeHBQSmU3a0U2UTJBaC9iSEVkL0V3cWdWZ2lyOFY1bEM5RmZGY21v?=
 =?utf-8?B?T1p0emxvVzM2aXczdlo4UmpSa1VIak0yZmppOVpQUHd1c0crRFZLUSs4bE1P?=
 =?utf-8?B?dHVWQnd3WU44Zm1IQTREVzZKeE04aTA3Y2NLMDJUWEZ6bmZNcHB1bmNnMmlQ?=
 =?utf-8?B?Zlhua1FXZWw3Wm05cUN6S29HRU9BZVlqNXNXVVMxU3h5UUprMUYzNC9xQzFZ?=
 =?utf-8?B?bjFheXZKVVh6WUNLK2RxLzNjVmhpL0xtQUZHNjJ2eHFkQy9IODRuSkZtNy9U?=
 =?utf-8?B?Uk5YTVJZR3pTWkpUUFlmZDZ4NkhXS0Z3OWh2emFRcEhjdi9wenJsVWFXQ0Va?=
 =?utf-8?B?dHV1eU5xVGhnMSszTEEwV2p0Y2xHL0hhbWppbXdlbHhxYUd5aXpPcUpabUx5?=
 =?utf-8?B?RjQvUnJiYngyOWl2TjNWeVAxcGMraExjY0hhUituSjRrR052bzZqOXJhcENL?=
 =?utf-8?B?SmVhQ0dzZjFzaWFKcFVSc2o1dWtzWjg0WjVmWHVFcGZ4eTJrT0RYYWhzQThl?=
 =?utf-8?B?L01POTJkMUxWM0xTUk5TaFFjMjF3ejVoMHBheWlXTkRpcUl4UUhmOWphTW5o?=
 =?utf-8?B?WER3Q1BkYVFjcGc2MEN4VHAxbHNzQ200L3BFM2xGL3oyTlRwNE05NDV2RURn?=
 =?utf-8?B?ZUU5WGZPZnJQS1BCQ0pOTzNwZ1JVM3Z1UFdDbTdvWnNtR2ZNd1kvb0pZSnFV?=
 =?utf-8?B?VXBucnA2ajdiS2Z3SDZKUkhDRG9IQjE4YmhialQyV3p2NDBWMjM2ZTBVdzdU?=
 =?utf-8?B?VHdZdXZ4RndXQ0p3UTBndTFEV1l3b1h6Zm1QaWdkMVZyWGtGeWRLSyt1RGFR?=
 =?utf-8?B?THFOeGIyTzE1dXVlaFBneXlhRTVOVko1WG91ZVMyMURDcGpDNlpLWG1peE5Y?=
 =?utf-8?B?SUE5bXhTTThiTU5SbjF6UC80dUpHT005Vmc4Ni9VaEY1NGRyYzkwUVNFR2dV?=
 =?utf-8?B?ZVNhRjc3TXhVS3IvRENUZ1ovRG83NXFXNFdJVTQ3TFErU3cxaXk0R2FMYStv?=
 =?utf-8?B?Q0pxclFML3A1QXE0RDh1YWRjdEd0OVZqcjNLZkZ3cU9tM2cyMGM3RDFxQTNK?=
 =?utf-8?B?U1JCeGJvaDAwcU1YOEM2MVUxeDZBWDlFb2h0RmFjQXcvbGlVdjlXcHA5ak9t?=
 =?utf-8?B?dDNOOHAwRklnVGtFQkkzbkFTMGRRakh5a0dzSzRwRllKbzFsYkc5TFZrMXhD?=
 =?utf-8?B?N2h2OEJzYUcvTWo0ZTk1Nm43NjAyK1YrcU1Hc2k3aGtwU0JUQmFJQ1pSbXpB?=
 =?utf-8?B?SFhoQUJUUktKWk1SdXFQZ2QyOGo3N2NGa0hzV2dXeXlXR1JjMjA4cjRQdHhZ?=
 =?utf-8?B?R2hmbVhaRlBQMTYzcXVqWktQTEY0OEQvczFYWHNUNU9sYkVYcVNaSTdWcmhV?=
 =?utf-8?B?am1iaVVQNk15OE5reWhLT0VvSzJ3Q2lOM3ZkYlc5L1I0cU5YOC9rRHp4b0VD?=
 =?utf-8?B?amVsVVlrOEo4SDJrcEttSnFZcWRGRWYxWng1d1hxQkQwRlVmTU9XM0s3SVVV?=
 =?utf-8?B?U3lrNFh3TkdKdmErYS9idUxzZUs5UG9xZjhiV3A4cVdodVUvcjF3NkI2MFVr?=
 =?utf-8?B?aW5NbGhuRklDd1RUWWYxUTRoNlB4UmdoUlhGRmJ0d29RK2ttd0NMTEpDZ1Av?=
 =?utf-8?B?b0pKaERpQkZSQlJrRVgrQWNBTFV1OWFNVFVOcUxlVXpqTlJrNnJuaWFoTTEy?=
 =?utf-8?B?RGc5TnAyYXhJOVB6N1llUGNCR3FzNWx5Nk5zTFE2SmhSM0NvTGlBTlduMy9R?=
 =?utf-8?Q?9JvH14?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7142099002)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnozWXlmc3Q3K0tTYlRMdXdwTVhNTU5JTUZaWkI5cmZtakMwTmhaQy9qbG9n?=
 =?utf-8?B?RVhTODhhK1dRbHkyQzBrMlowbjhsdTlpTWhuSURzTER0QXhXWDBTSk4rbW5E?=
 =?utf-8?B?ZFpsUmZkQ2xuMDZUU25haVRqMCtuanU0ZzV1c0w2ZG9neWF6cTlmamVQVEVP?=
 =?utf-8?B?WWp2RjdxVmpuakdWOHhSZU1TaXlEQTBzK1lmNFNyOG11M3BOMW5QaFdySHpF?=
 =?utf-8?B?ME5pUkNXVFZMTHpwMUVtN0ZJWE9IamVLWWdxSTl3amkyY3A3QUtnV1UrSGZK?=
 =?utf-8?B?cmd6VnBpL2ZzMldSWDBNUXVrc0d0SnZZT1gvNUxiVkJBaUVXckxmQ05FK0tW?=
 =?utf-8?B?MCtmQ0tUL3pzQTFWK3JTNmNPaHVybGQ4eVpLNkhRbnVOZVRDd3lYUmpLWnRB?=
 =?utf-8?B?eGZsd1hsak5PVHRBMzhXaWNrRTdBUWFVUXROaml4U1BGbTE1bFBnVXZ5OXpp?=
 =?utf-8?B?aW5jTW1KSGQ5VnoydGpycE93cmswZ2RUeWtrNTJMdXVqNy9ya2txMUUzZHlY?=
 =?utf-8?B?QVFtU0NJY0M3TWpFKytuUTRFWWlpQzN6UWZoTmUwOC9vZEtyVU4zL0xNZ1ZW?=
 =?utf-8?B?TjdNNktQM3NUb2NoKzQ4NzIxU2owSTIzY2NiaW9xQnFsZS81dG1XY21FbERY?=
 =?utf-8?B?ZENXeEJtUEQ4MXg0MW5yYkhKc2ptb2tBUmdCbTZZMVo4bFNUNDVIclVHU3Vx?=
 =?utf-8?B?VGJNbHM3dXB3SzNDTlJoUWNWbVJtZ2p0c2kwM1hWS2Z2cTJuT0F3NTIwZk1J?=
 =?utf-8?B?R3BBS0RIZEFQa2c2NWxJTGhHMlVPUm04OEJ4cDJhbFB4dmVzUUVRUGtyelBK?=
 =?utf-8?B?c1oxTW51aHZGREU1ZjVRRWJKTGFSSmtpRW52OG5iMEtqOUlzVkdmQjd6L1dm?=
 =?utf-8?B?VmovOHVRbUZic3NxSGcrclorNzY2eHJ2dXQ0Z2JMNi95TmhnSG1tQ1ZxTm9U?=
 =?utf-8?B?S0lBUmo2dWtPMnA0WXdkRDRTcWIvR0hMdExMMi90VzVJWk1JL2xjZkFxVlNr?=
 =?utf-8?B?SFZFUm4zdWlob0N2emE4MUFXalNXMmI2ZytHQk9wK3NQUk9Zbk90OXdhK24r?=
 =?utf-8?B?b1BTR25iT1NRTGxDU0NjVXpVdkpYNG1uRVZBTFVxKzZodkhhUE1UU2pkRnNr?=
 =?utf-8?B?ODlzNVphSStqOEpWUVZsbU9Hc3NMWWd5bld2c0pYTjdtd1MzeG5NZElUTzRv?=
 =?utf-8?B?MHBWZ2c2TllEK3Nic1UzSkczRXpRSlJZRjBsQmV0RzhjR2s3Si9BYlhSVG1s?=
 =?utf-8?B?dkMwblgwdlRYbDRlZU9FNkVCS29La3k0cG5lVDZacUhwN0Jnbng2ZlllOC9K?=
 =?utf-8?B?SzBYcmlUTUF1SkxRSCtvU0J0aitNa0wvWEovNlEyZVZvbU13bUU1aCthSVZK?=
 =?utf-8?B?QVFZZFVjcmtDUnJjeE5IVXNJVlBSTWp3czVXUXQ5a1hpVEFXNFkyWUVpY21a?=
 =?utf-8?B?YXNaS1Q0czRqWm45emhXUlUwTkJ5Z0lsdWNINFJPbWpDUWpQcWN3Vk5vT3Jp?=
 =?utf-8?B?aFRUWXEzT3AzR2g3Qld0Ym9oTVJndmd6dDJaTG9QMzdKOXVTZ2phUlBOZ3dy?=
 =?utf-8?B?N3pQeWJQTVZyZm4wcnE4bTFiNHp5V0ZMbFpmcnJ4VXZJK2tWWHFBQU9hSEtO?=
 =?utf-8?B?RzgxM1hqQmdGclk0RHFGZ0RzVGxVSE1ydHp0QkhEbE5JK1pjMy91bERGYldT?=
 =?utf-8?B?NFRsbEpBZUUybk0xbWdiQytLSW1CbmdURlUrTXJ1dUltSzlKMm5sMkRjL1NF?=
 =?utf-8?B?b1M0UHRYOXBiQ0htTVRyZUlxbjJqY3pRT3pDQjg1T01YWmxLMDFXbVhwa1VZ?=
 =?utf-8?B?Q2F5K2Z2UnBubHJTeG5HKzB5OWg2MFhvd1FUUnQxcEpiZkdPT2Y5Z041YVJ1?=
 =?utf-8?B?VTBMd2ZHV1RQZUdwSFJJNTRwekI0akw3enJVWjNmYk92OUhlMEczTmRjY2Fz?=
 =?utf-8?B?MldMVmE0bHlXS28wb1d1cWo0TGUrTUg5UHVaUm9CU2dYcVMvcWxQUGZKazBR?=
 =?utf-8?B?YXZ2WVFxakJ5SWVweEUvanl0UzNNUnFWQi8rR0l4Y0FhRTUyWWk3L3NIN3p6?=
 =?utf-8?B?b1RKUWVQaktZdzRuWTRzY3FWajhac0JKSHROdnRIbms1dENCY3Y0OGVleVRI?=
 =?utf-8?B?UkdXaWpLeXNGU3ZxckdReUk4WlQ2OEFoUGFxR01CdjI1UHBlUVd1bjVxRy9z?=
 =?utf-8?B?MGpVaW1HMGJ4UGtnS1RBSHgwaEdlVFJIWDY0R0EyeUo1RDF3Q2E1VWRzSk02?=
 =?utf-8?B?V2lZTE5vaE8rVHo0cjBhSGRCaUR2UTA2VmFORHpJQVZQMmFyY3c2cTFlQ0s2?=
 =?utf-8?B?ZDdIUHNJZWx1QmJySUxhSFJaN3YxdHBEb2dEUXdHdHZyVnJjNTFmQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7283AD72AE07F540A16A83561B2E64C3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b6006e-3b6b-46fc-e247-08de423aab2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2025 15:48:08.0519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bB0cSV9OvD3VfQR6UIbNNlQ54A/Y0wFZ8E4GMAuQBbMi+YoENyt4dk6aOydYiCS5oPkoQ76m0LnMZSp+u1xD/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5836

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDA5OjAzICswMTAwLCBCZW5ubyBMb3NzaW4gd3JvdGU6DQo+
ID4gUmVnYXJkaW5nIHRoZSBwYXRjaCBpdHNlbGYsIGlkZWFsbHkgd2hhdCB3ZSBwcm9iYWJseSB3
YW50IGlzIHRvIGRvDQo+ID4gc29tZXRoaW5nIHNpbWlsYXIgdG8gdGhlIEMgc2lkZSwgaS5lLiBi
eSBkZWZhdWx0IGhhc2ggdGhlIHBvaW50ZXJzDQo+ID4gbGlrZSBDIGRvZXMsIGFuZCB0aGVuIGhh
dmUgYW4gZXhwbGljaXQgd2F5IHRvIHJlcXVlc3QgdGhlIHJlYWwgYWRkcmVzcw0KPiA+IHdoZW4g
cmVhbGx5IG5lZWRlZC4NCj4gDQo+IENvdWxkIHRoYXQganVzdCBiZSBzb21lIGtjb25maWcgb3B0
aW9uIG9yIGRvIHBlb3BsZSB3YW50IHRvIGRvIHRoYXQNCj4gd2l0aG91dCByZWNvbXBpbGluZz8g
QnV0IHllYWgsIGFzIGFsd2F5cyB3aXRoIHRoZXNlIHRoaW5ncywgd2Ugc2hvdWxkDQo+IHVzZSB0
aGUgcHJpbmNpcGxlIG9mICJhZGQgdGhvc2UgY2FwYWJpbGl0aWVzLCB3aGljaCBhbHJlYWR5IGFy
ZQ0KPiBhdmFpbGFibGUgb24gdGhlIEMgc2lkZSB0byBSdXN0Ii4NCg0KVGhlcmUgYWxyZWFkeSBp
cyBhIGNvbW1hbmQtbGluZSBwYXJhbWV0ZXIsIGhhc2hfcG9pbnRlcnMsIHRoYXQgZG9lcyB0aGlz
Lg0K
