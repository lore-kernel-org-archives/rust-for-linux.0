Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010023.outbound.protection.outlook.com [52.101.46.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628343B8D5E;
	Sun, 14 Dec 2025 07:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765696776; cv=fail; b=uJC0w2Xj0OW/439ipx4xFPzgliwMvEk7zxtqHlOI4I0AJfQMhy1/h8+mt/MpEWdRXBNaSQ1EB5I7VWgzW59neI9LM2Izw769Kj5xis/gCKSAJhi7GbxLGy5SLhofD9yPP7WvTmZti8Qa5jHB64L7vxzNJL6eUIIpmWafxbVoB40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765696776; c=relaxed/simple;
	bh=M0141DPxPa6lBt7Wmxu+6m4s2WxSMzH/jQ/ZSV1z5YE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kLN3lHmE+DxsDrSosFteAsXhRxx3Vav/jn0ZctfMNZlygkllD81ZwF+qZJbqSBPVEhWIhXKC06YzBSbmBp9fk+QbZUVKq0e3SUVNzgzI6NBm7KQOFTr57Z2wZMFjYuERFBW0bT2jZcDxOa39oXGxsNRRLE8F6spZys5u0lk0O3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UFmOGf9b; arc=fail smtp.client-ip=52.101.46.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UFmOGf9b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQn696eKa/hLHSB0Z4Z4/DdhZQJPfxjDU1EzgraRCrrfXtE53JK+3jZcqOIfsgu75PUgibT5MjCm2IsU8G4xFqQRxk3fLDeSoVMnCry0ncK0UTt/rcyDhoJvLLujbLelgnNSdU/oDv84o15RSvXfZF1Rbxjk4MkXYTE3a5GZfx+0p06GwB2Dc2nEIjrTtJPb1GfPOEi6d7ZsplqiZLgXf4LVHr93ZpvPtGs7y1YL/prHm23ngnRb/eaCn6uGxS1f/dIe4/1hqyhk3ReivgWrqtOdW03OwuQ2Kp8FjgMRG8406jMQhJORMqMUCIxSMFvc5SkSWJQ3AojOl0+/kwJuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0141DPxPa6lBt7Wmxu+6m4s2WxSMzH/jQ/ZSV1z5YE=;
 b=JKI3rNLtDFKxEgqm+UUUbeCS3ZC45D/2YgZEYNXNT8Gmj9/ZzlicXwWmezffo7B92jCgHNQJgBapM1Na21kfX1975FkQ3l2aYJiMcwTdt6uovx9mzylwwlOZXE+l8M0qFIm1ql0UYtjyxOKW2190bAqh71JBtgjIEzzZ53mLi3Ds6imKNEz7ZzkQAo8292tr3eI6lvn7eLLeTB7ovI+rD364gIVQyF6mrplKqQlmbGCIIKABoR5yAuXucnrypghfZri+RZeKQHWf0XcBUqyM1N5ELK27T6Ej8aGpV+2PbL71TRuZQjDgDF3iGhGW276teMqRUUP1zWK4wL0ukv2sXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0141DPxPa6lBt7Wmxu+6m4s2WxSMzH/jQ/ZSV1z5YE=;
 b=UFmOGf9bkjwU1SV8EJRtt1IPTZWuT6eSbRBEYQZOHM9s5+0D6Rkq8eCvcKJ/x7TViX/uqCO/WpHju6c1RdpVvDssXMdKTeXOU2aIKQNOKowrnhH6HuPPbac5OMv3Yi7VE9h8XbKqomo3x1t8J8He8+hCSwJqx8jQtz+WuUEIzHGs8p1HH5N3UCefHGJ1Hw1gBOjPDqAqOenGGQOLYU5+HIlAgq7z+HijeOgI0NVNBGbWlZEVRb6pOrKfPPbFTL7R88l2xGokzSiAcNRUcWdAZub8lpp7GjJ+9Yg3T0x/fCczlO/zW9Ua/U+eYHZmXHGexTUrRIvCZ5mu8HXfp5/MIg==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Sun, 14 Dec
 2025 07:19:32 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.011; Sun, 14 Dec 2025
 07:19:32 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: conclude the Rust experiment
Thread-Topic: [PATCH] rust: conclude the Rust experiment
Thread-Index: AQHca8W4nBUVinCfW0WdpPkdMqVbT7Ue+G4AgAHEA7U=
Date: Sun, 14 Dec 2025 07:19:32 +0000
Message-ID: <A87153E1-AEFD-40A5-80E5-3CB09CEF82D7@nvidia.com>
References: <20251213000042.23072-1-ojeda@kernel.org>
 <CANiq72n5Jx2xNy3Yy8H0-OcUEkg=WLxgPQRgei6EQiU7-ySciw@mail.gmail.com>
In-Reply-To:
 <CANiq72n5Jx2xNy3Yy8H0-OcUEkg=WLxgPQRgei6EQiU7-ySciw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|MN2PR12MB4175:EE_
x-ms-office365-filtering-correlation-id: 07d4ce4e-2c58-4e2e-5210-08de3ae120cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cjEzbGh3QTBRM3piWDRqeURzUGUxb1Irc1BqdThma2lHZG5xOEVBRk5uZmRj?=
 =?utf-8?B?alJPZjVlRUJOR1c5R0J3VlZYL1dDYjcrSTczdkIwWFAvMStTb0o0aXI3YktX?=
 =?utf-8?B?dllydWpUOEZoU2FtaGg5clZrR29jbWwyU1EwTzQwT1pGWTk5TFVKMS92YjlL?=
 =?utf-8?B?SDhsNGZTbVFTZFh0dnlDUUFDVGROanhaVFFmRHNYQU9PTXp0ckVCaDlXNnNE?=
 =?utf-8?B?RlQ2OEErK0hTcmFCZVEyZ0xMRGVYZTFya041cTUzNElEUE1CS2wrTUMxdjV5?=
 =?utf-8?B?QVhkZVFGV3JFME1YZWhkSmM1eDNjSjlUM1hZLzEyeTNGZFNYYzEzK0VaL2Vw?=
 =?utf-8?B?RkRPKzJxN01rQ0M4cS9peDI1OUtldWR2Wkxia1B5bDdyVktKTDhIVUpMNzVa?=
 =?utf-8?B?Ry8zVDdKUWdRUVhsQWRnbTk0UjVvWXQ0YVByY2F3K2tUVUlkNjROS2UrakF1?=
 =?utf-8?B?cktaaGNpd0YzaTFmN3JJSFNmVUJmajFDbThFckFOMVhueGp3a3h2dGJ5Nmd2?=
 =?utf-8?B?V1JsS1Q5VUhvTXphMlpmb05tNEdDTWxmODVsT1ZwaDlzOWFaeHAvay8wamtK?=
 =?utf-8?B?TkhQa3RtQ1MyaXFqa3FvWmNEbEJ2MDg2Z0k2QjlrRjI0QmxVNmo5MkFaWnpE?=
 =?utf-8?B?SktCK096TGFWS0tHTUdheXR3em9mdWNXL2NXZzFUNFd0NlJ0UVRnM2RueVpx?=
 =?utf-8?B?RThPdTRBeFQyT1R0NjhSUUs5T25uUnJvcTlPMzQ0L2w2Q1hmNmVMYVpZcEdV?=
 =?utf-8?B?S0ZaTUNpakJXRkVCaExLbWxaTW5FSnhYVFkxYmk1MUNwaEV1eHRtazhwTVNz?=
 =?utf-8?B?cjVlYVdheEJqZDA2R3VBVXhPaGtINzhIbnY5N0FoQmIzRFJSUGx2T2ZmcHY2?=
 =?utf-8?B?N3RFK00wcjh1TGRVMkNPdTI5VVk1WDU3ZXpVS3V6bUZCSDhON1JjVENYK3Fv?=
 =?utf-8?B?RmRBR2FlSzBUbnVBaW1YYVR3L0JWaW5hVWFtT3Uvc1VGNnJOVk5JVzJuMmVW?=
 =?utf-8?B?dGJ0NkIwM1JBZ3laQjlCYUFXbzhtUElXOGNGS1VMMHo2aUNZcTVGakNUQnNL?=
 =?utf-8?B?SFNLOG5CMXRJS1h1T0lqY0F5VFY4bko2akQxdXJ5RkZybk9Sb0FrQnluRUpS?=
 =?utf-8?B?THlWU29VUi9GYnBSWnVsL3RuY1NEYmpQYzNiamd3N1AvZ095TnNXckFqVmc3?=
 =?utf-8?B?M3ZNT3M1WGNPaHE1TmJQbFBhVTBXcWNKcDlIbU9wTHdiT25VUzE4ZWpCMHVs?=
 =?utf-8?B?aE4yNDNvSFdxQU5uL1ZQSDdyOTlQWkQ4QXI3Vi9iZFA4ejhxbUwwd3hJT2xX?=
 =?utf-8?B?U1lTMW1pU01LRXVpTDFoemtacndWSUVhTlJxZFJUQzNGS0V0TUN0YWN3VjF0?=
 =?utf-8?B?WitPblRDblZMeFpwc0Rvb2pmeG0yQnpaT2xBaUo0bno3RTFOUm5mK1VHeDB2?=
 =?utf-8?B?YWJPNHc2cGpneURZanNFckRRVndxUEw1NzdMMlpEYmJUSUQ5S0tSQVI2U0JG?=
 =?utf-8?B?YzJFeDNjL0NBU0EwenRRWUxqcjM2SlJHVnJna1F1cTJwTkE3MmZEZS9LWEpZ?=
 =?utf-8?B?V2gzbWNHczNyTHJHNE92bmdTbTZaM3lGSm40S0VPMWIzNy9raVlxc0taYVNr?=
 =?utf-8?B?cGtTNWJ1Tmw0T1dTTWlNMWdJM2pBL2pqLzZQMks0ZEFWZjltb0E4Z0padVds?=
 =?utf-8?B?VXA2U0NrZU43TUpWUTZaNGNjTnBDc0NGdUNIY2kwQ2F5SGxoSjUwdGhOWGdm?=
 =?utf-8?B?dmVJQkFpd0k0VERZVjhOdzhJdHVBUXhBbExkQnRROGdYMU82eXlDMlhFaUZE?=
 =?utf-8?B?bXVYeVF2SjZUNzhYcUs3MGYvK291cEV4NW4xY0w3OU9mZzlsU1M0M0d3QTRY?=
 =?utf-8?B?TE9pZEROOUNzZ05YVG1ZY0haWUxWVFhpakNUMXVTK1FMeG5pdXhxU0hGcFUv?=
 =?utf-8?B?aXV0WDJqU282dTlEaytjMnJDMEJScTcwdGdib01aVm9UeHR5NEFPeDkvYmha?=
 =?utf-8?B?bmwyam5ZUE9JNjF1dm1tUklPL0dtdFMzZm9WazFQY0ViNmhmZEx5NFIxZ2Zk?=
 =?utf-8?Q?2SME+9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cG8xNzg5Ym8xYnRBancvWEU2MU1iTTV5NCtzMkc5VW1UQzNGLzRXb21LVGhY?=
 =?utf-8?B?a0ZYRkU1bnltbFk3RkRoRVdRMHhxTmdGR3RLYzI3ZXRkTzJIVTZ2cUtaS3g5?=
 =?utf-8?B?SVhlWTM4ejBIY1FsTGlNVzZEZkViRG1NdVZxSHN4eWxTQTh2V0FURkxVWkY0?=
 =?utf-8?B?Qit5Ym94UGFCTFhkQUoydUNjT0c4NDRMVGdPWk5uaG55RlZNT0pIdzdLZnoy?=
 =?utf-8?B?VStrQWtKRnBwYTJUemt3TThOYlZUbXFFcFVyQ3o1MEUwTlBxUFJmTzVVWVN1?=
 =?utf-8?B?RlpLR1k2VUlUc2oxNTVhMS9CNS9SVEplbjlrUUU2NjQ4QWxuRjJlWGlubGFi?=
 =?utf-8?B?Mmp1b2wzclFxWjQ1YU8rRHArT25kazNwbzhFaXBoRjZQT3ljU2F0dFBEeXhV?=
 =?utf-8?B?Sy9UOXRsOGVWd2Q0U0RkeFlVQTVLZHdVS3BnQmdOM2NCSkZJeFpYN1BwcERX?=
 =?utf-8?B?dHFYQS8vcVRjaUR0ZFk2U1M3TjdnT0hVdzlyM2VkLy83ZTE2YWRNbFJUaDZy?=
 =?utf-8?B?Q2VwajRKQmQvT1g3UlF4Nnk0NE80TnY4b3FkWjBxdW5ucnEzRTlJZmg2VEVB?=
 =?utf-8?B?SEJOL3V4ZE5jdjYybVFJSURmOVE5S0pTd25pekFvclBQYUpWWFcvNVRGMHNK?=
 =?utf-8?B?djhpVlBIbHdWZXQ0V1FrUlRPalE5eGc3ZG8zSmJCL25WK0dPaHU1bCtGb3gv?=
 =?utf-8?B?dXZ0OFNsRGZkSVRCS2RzWFZ3R08zd3JFNDBRNTUrSXdZYUY0cUZNN3FhN0o5?=
 =?utf-8?B?MnVtVmhLMkVCTDhNU3pmUnZmR05lSU00anBXVWRDL0JjS3d0anMzUlREMzdi?=
 =?utf-8?B?eUpFNVB5aStSdlUwQTJza2s1d0g1aVdxVVJXa0R0TEVva1NYaFh0TVlkUnVC?=
 =?utf-8?B?RzBaY2crM2xUYXQ4ZEE5V3JZalkvSC9KZzNrVDRjcVBXL2k0aHlXd1Y4MVFL?=
 =?utf-8?B?RCs5Q2dld2tHZFYwL3hJbExidVJ5UDBoeE5TQ1JBVWdFSEhXY1VxOUdkeEsw?=
 =?utf-8?B?TVdHZnNaellFNFpEQUpDNEpYQWdUMGdYMXJ4V3lRQ2hTaWg4blc1M2RKaTlm?=
 =?utf-8?B?ZGlDOEFZZHo4OEpEMGxnSjRLcVBIUnRialNXVVJrNDM4d2QzN3l4VTU1Qlpr?=
 =?utf-8?B?cXBmOGlya1JsdDhiQ2JqM2xTdnZJY29MTTVRZ3AwWHg1bGZxWHU4YWVjYnhz?=
 =?utf-8?B?QW5OYnZqQnQyQ3QyZ0pnMmZMOFpvVFRZandXZVI5UVdmOEYyamNWSHN1SXc4?=
 =?utf-8?B?MGlJbkN1R3NWR2lQVmwrT1prb2ZUNFJwQzZaTkRKQjhqdko2OW91Uk90VVYy?=
 =?utf-8?B?OXVISXowK0Nobk1zWk1GbStOeWNrVE91VGR5VDJvUktUL3kxb29RY2YySjRm?=
 =?utf-8?B?dTBuSGQyWTN6cUR6U2pTbWZnR2oxVEdTMTBKV3ZGWnlSSFV4dUc4UmZDKzV2?=
 =?utf-8?B?S08yRGd3TFN0cEJVZ2VnVDBYUHM1d3lHeDJZNmlDNmp6TDlyZzZEbHl3ZVVm?=
 =?utf-8?B?Tlloa2puT2VOMWZOS2F5ZXd6T2ZaMnN2SEJLYXVMUThMUkZPUldqbGV4NlVD?=
 =?utf-8?B?SEV2LzZwenltMXRQSVJEeDdIQkZkaTVqOEM1Q2VKcXpFM0ptU1FxUXVQZU9s?=
 =?utf-8?B?ZVc2OGgrdm8raGkrNkF5dnFnaGZxQUM4YVc1RjVrR0xZMWd2dWdzWFFJSnNr?=
 =?utf-8?B?QURGLzFkcllhNWNGTFMrSjZCZnB4Sis4eXRYcEdRT0FudzZ2clQ4NWxoY0E5?=
 =?utf-8?B?YmtleVpWeW1oVVVaeE83bGhBdkMza0dGd2Jlb0pBYVZFYVRqZERBUWs2U0JD?=
 =?utf-8?B?K1l4UkcrYXY5bFZ5K0RMSmE2ZzFIZkV4aVViWmlubncwUW5FVG9majZMRVhy?=
 =?utf-8?B?SjNtK0ZnRVV5d2Fha2FWa0ZPaG0zT0ZkZGR4TVIrUnBZTVpLNktNWm5vdHhG?=
 =?utf-8?B?YlRrcE1XKzRTbzV6aXJWR1NDK2NqazVsVXlVeTZPdUlFU25yWFBBcFhxTlNh?=
 =?utf-8?B?NGlVc3NSSzh2T1RrRVlPYkR4RjVIeXhKdjJYd1JHa2EzYmVSdkh0WWszYVVS?=
 =?utf-8?B?VTZIaFJYVXBabm95SVBZWUNKdXJTdU5xMll1TnlLdGpxYkNTS0Q2NmlXQWly?=
 =?utf-8?Q?Y3nbNjVkCAd5wXOjbHdPB5UOk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d4ce4e-2c58-4e2e-5210-08de3ae120cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2025 07:19:32.5037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5btiO8F9Cp2EYt5OrnUFrDPeI/NolRkAd4R6umsgJ7/1GlOqJVvN9zeNVKbCErlaSLQ0Z/dFNT6t7R1xbc346A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175

DQoNCj4gT24gRGVjIDEzLCAyMDI1LCBhdCAxMjoyMeKAr1BNLCBNaWd1ZWwgT2plZGEgPG1pZ3Vl
bC5vamVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4g77u/T24gU2F0LCBEZWMg
MTMsIDIwMjUgYXQgMTowMeKAr0FNIE1pZ3VlbCBPamVkYSA8b2plZGFAa2VybmVsLm9yZz4gd3Jv
dGU6DQo+PiANCj4+IExpbms6IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy8xMDQ5ODMxLyBbMV0N
Cj4+IExpbms6IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbGludXMvOGFlYmFjODI5MzNmIFsyXQ0K
Pj4gU2lnbmVkLW9mZi1ieTogTWlndWVsIE9qZWRhIDxvamVkYUBrZXJuZWwub3JnPg0KPj4gLS0t
DQo+PiBJIGNvdWxkIHVwZGF0ZSB0aGUgZmlyc3QgbGluayB0byB0aGUgZnVsbCBMV04gYXJ0aWNs
ZSB3aGVuIHB1Ymxpc2hlZC4NCj4gDQo+IEl0IHdhcyBqdXN0IHB1Ymxpc2hlZCwgc28gdGhlIHRh
ZyB3aWxsIGJlOg0KPiANCj4gTGluazogaHR0cHM6Ly9sd24ubmV0L1N1YnNjcmliZXJMaW5rLzEw
NTAxNzQvNmI2ZDU1YzkwY2UxMTAwZi8gWzFdDQo+IA0KPiAoTFdOIGlzIE9LIHdpdGggaXQgYmVp
bmcgYSBzdWJzY3JpYmVyIGxpbmsgLS0gdGhhbmtzISkNCg0KQ29uZ3JhdHMgTWlndWVsIGFuZCBj
by4gIEkgYW0gbGF0ZSB0byB0aGUgcGFydHkgYnV0IHdhcyBtb2RlcmF0ZWx5IGZvbGxvd2luZyB0
aGUgZWZmb3J0cyBhcyB0aGV5IHdlcmUgZ29pbmcgb24gZnJvbSB0aGUgZWFybHkgZGF5cyBhbmQg
aXQgaXMgZ3JlYXQgdG8gc2VlIHRoaXMgbWlsZXN0b25lLiBMb29raW5nIGZvcndhcmQgdG8gcGFy
dGljaXBhdGluZywgZXNwZWNpYWxseSB2aWEgTm92YSBlZmZvcnRzLg0KDQogVGhhbmtzLg==
