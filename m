Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021108.outbound.protection.outlook.com [52.101.95.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5787A1FAC42;
	Wed, 21 Jan 2026 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004739; cv=fail; b=RhhMQZhUa505dtug9WgIeT34dBuOOvGGKzrPcr5upopoI1BaZQDBcpC43Mju/C1zibBxCke1ABitylM0COSdIecvSFLaztMjP/PSlQA46b2zclyLfS9HwQ4YYpm0ZSxttSkqAa71am5yt8UM5A908kAcdCAq2vEF5VB+P1ysgKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004739; c=relaxed/simple;
	bh=wnmSRfu2v8sjJfWwvev9QhVdoW5Kr64IP32VjqgfWxc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hPMgVElIfvWDEWRjSdnfjLEUqQofdLXHCTOJ+/mWv2S4Mag21fFa5aLVJxqTqqqVYMGT6nwnUSUXsTu8iQyPbolVxrkN8xEtTPo3Dn5lwca8MLBXDKlcWKpmq/mj+oitgqi9F7DHaazyxZlyMkPY5ppBJsjJQ/Rkrsb70/2qcek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ixjCuqCc; arc=fail smtp.client-ip=52.101.95.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ixjCuqCc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sufw3BK2Dv40elg5n4mdaNpRqjpGt++QFM577fczVGYaUy6aNLv2YB08CBfGtwbrZWCZ7wq5p7ijdIqbBy7wtSXIT8NlBuIIRcBYorC+TVPy1+S7sp90c57gWDm9+6gtCyjghs7CzbvCuRDdJy8fR9PJTzWFPN6Ks6OFDoOKiLf+1Y0hTr0OdNvI8nt7PrHkSgLm5T+kXOCYBg0ZBShFCrPMdrsDfH5AMY7dVZ4mZuE0TOPKd5xCVOvBMyPlcxhAnMGhTRt7PwGFlHAUk49yzi2JdUCw3J+dAcKh4vciqbjAa427wEwm26dY+i/t4MKY+6+40qb0jKd0MVfzxS1N8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDieleZlUpU2uv3PZTaPVnxlkLezyEnZ0rkN8ZrnUsc=;
 b=ldLyBEAAXGXvuyAIo54wsXIUnvFpHL0f3xnmnl0buJIczcueYvmd1iCUAzR8sHYupte01ERr3lsckst+2hFC2m87YzDxPVaZFTuJZOUR/PunrR0hU1jbx6vVgNrC5qv8du2cFtiFkR5IiDA0VK4WXA7Zc9KyDZP5EAAA2X8zsWxlan/Wds9Bzrt7d9SbYlOZzsW9WK8YNf71k6WlcDoGBX+UwBX0M2HRBGO91tKgdq4/jri7kqrj4Y4rbNKYH1lbRKxvmkmbqXBPK5Eci128JQyI68FhIcVajTuztJOPtRyEMnqOnoO2aHRhKHBqgAGLx8RzNGbcyoeBSM7s/baI2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDieleZlUpU2uv3PZTaPVnxlkLezyEnZ0rkN8ZrnUsc=;
 b=ixjCuqCcm0u2EX1fuOI8MtdkkYKs8PE2BnZvPGV651AVM34zrf9JuV3zrNtIlyZEQxAhuZAWsqpFuMj16rR4Ky8LgSkO/XacFfuk0/JHt+c+UhOJ5+y1e9tUg7zTrM4VCiG/5frBKi6nl1ZhFcKt5iwCC4TGTmUuqFoR9UtoGdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5820.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 14:12:13 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 14:12:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 14:12:12 +0000
Message-Id: <DFUBUAW9WMGC.3KY2ZOUJPERED@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] rust: num: add `shr` and `shl` methods to
 `Bounded`
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-2-79d9b8d5e36a@nvidia.com>
In-Reply-To: <20260121-register-v2-2-79d9b8d5e36a@nvidia.com>
X-ClientProxiedBy: LO4P123CA0328.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5820:EE_
X-MS-Office365-Filtering-Correlation-Id: cad6e709-2441-44df-2eab-08de58f712b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVBHRWxFM2hxWlBYbDBkUWVsM3lDT3ZqSnM3b0sraTUyaktrNGVxQ1RZdk9h?=
 =?utf-8?B?WnVDenNlZG0yUnVnM0hzb0lISVJSeHFFK3JqMWlKeFM1WkdSc05Ed1lqZ2Nn?=
 =?utf-8?B?TmJ1T0d4VjJyQ2VtUitLVkRQZEFFUjlob1VuWDJ6UzJTTXFRUWpQUUFvSE9w?=
 =?utf-8?B?NmZ6SUNiTDd1Sk9xYUN4bGp4eWk2RFRYN2pEZFl2VmdIM0JVQnM1enFsSHhS?=
 =?utf-8?B?STBDZzJIVHhYbk5hWmpOTnZVbURUTjR5NXJnQkh5Uldma2hoZStHT3NFcXla?=
 =?utf-8?B?SFZqcGRFRXdVMGVXRzJHbFlmOVlFNEFJN0FYVlc4N281UVkzeTJYdTVQdG40?=
 =?utf-8?B?QkRwSEY3SU53RkZUVUg2dTlVSlk5Q2s1YXhRQlZIZW8vY0lKUE1hN2xEZzM1?=
 =?utf-8?B?cW9LWlpwbXEySk1YVnlpcmJwWkdBNk8vKys1YUk5aWNPd2RjYlZLOU1zU0N6?=
 =?utf-8?B?dnNJbHdhbHhZaUpybnpRZU5MdENJbjZPZTVqZE5BcnVTajIveDJMRjBsMzdW?=
 =?utf-8?B?MWliblJyYURtOFBwdHBzOFIweXlFYm0yWEZ3a3ZUZ200b2dtd3I0YUlmb01k?=
 =?utf-8?B?bDF4VklIaG96K2k0ZHQ5RWJqODBWNC9RdllDMkZVczI2OG9od2QxNkc3VFhO?=
 =?utf-8?B?L2JRM08rTEptKzM3djI4U3hBZFBkSFVtUDE0Z1ZpeENScXNjOUtBVlFiY2Jw?=
 =?utf-8?B?SFZUSHVwcmw3Mlcva1RRNHF0U0lFNUxGd01ra0xUYXhQMXA2YWNxRVBuemE5?=
 =?utf-8?B?WldJKzhpM0QvY1FpVEVjdE9yaWw5MGVubTZ2RnlCdmQ4TnQ4MUUyb1hiU2hB?=
 =?utf-8?B?TmFDSHNBSlY4d1cveFBmbTNNdExVYnRQVGowZURFeDd5R0xKYkJJTTcvOTIr?=
 =?utf-8?B?TjZJeExmRGc4bXloVDM4L3VUVnptclNRTE5RT0R6K1E3dGVKemZGYU1UVTZF?=
 =?utf-8?B?aDk2S0NOc0UzeEYrcUpwM1JVNDZ6OGE0WTZmQ0RSQ2FZVGE3SmlCV2dCYVdD?=
 =?utf-8?B?eDJvZXFLeFV4MjFydTE4d3dYYU96MWYwakxULzVCaFA1TkNzb2JMVGo5WTdF?=
 =?utf-8?B?bThyd3NTRnpncmtCSytLSFpNMTNCQlg0cmc3Rjl2VzJVVVoyS0pOcE5GTEdR?=
 =?utf-8?B?TWVBYitRL1pXK0FhNlFCUVBTeEJLdTBSTUJudzc5YVFVNkdXbkRiNVNpZ0tE?=
 =?utf-8?B?bGtYYnlSMTF5NlFEVWh6dUw5b3VkNnpacE9QTWpnQklhaExRbE5pME9naERQ?=
 =?utf-8?B?Q1RVdXZmTEprZ1liVmNWT1d1L2ZDVFZPZU1CTFhSMDNrdTVzVDhlVTAyT0Vp?=
 =?utf-8?B?bjV4bG10QklVUGRycGE1Rk9GZU40cjFHdzBFNTRmamVXL1p4eThpdmJFb0NU?=
 =?utf-8?B?WG9FakZwcEZxMWFmMUJGWEJCUWtCVjRCcForbHdQaHEwOUxrbTFuRHgrUmVp?=
 =?utf-8?B?QlFkRXIvWXZSM3VVMkZMVUtNNktiRkJtOGZUcVVtanZvMzQzU0dSNDdUVjRh?=
 =?utf-8?B?UU8rWGpaMmNhZnRDcDJSTTEzRStkR0JIZ3RSSHJuaXNzM2N5d2pnUWh5dkNa?=
 =?utf-8?B?bVBoUWRvYWNJeWp6T0NlSzRaZVpkczkrbFozWG4xWVVudHd0QW50ejU1UGQ0?=
 =?utf-8?B?TWNEcFBhZW5PUWZ2VlBLclJVakd4ZVd6ZmxnWFptK3lOZ1ZBMDg0Umc2d01Q?=
 =?utf-8?B?aUtFaFpGb1ZJVElhRCs2aHlBcVM4OW9JeHFIemFEQzhnbWd0dS8rdmhlUkJG?=
 =?utf-8?B?NVVLTTZ4bksycHFVd2RQZ1ZmUlRUb1RqN1U5dlBRNXVKc0QwZlozNXAwS3Ni?=
 =?utf-8?B?S3NOYWxWZy9qM1BCdFJwczdEV3M3UzhIdUpuUTFwS1hJdnRaSXdoNzJ1ditF?=
 =?utf-8?B?bjdXb2loeFdlWTFMZWRRUDc4REoxQ3RHdlVnWitYMEdQank3eUZQK3ZVdG82?=
 =?utf-8?B?U2JwWFJCRTA2TDBJYlVpZDZIQlUrMDlsalZqcE9HdUZFRElaREtwVmNDV0kr?=
 =?utf-8?B?N2tQN2tpK281TXEzY0VSK3FKSEZlbWg1ZjdHUmM1elhZWlBTRXZnQVM2VzNw?=
 =?utf-8?B?ZDJ6YUMxOTIyY2toSyt2QXU1MERYdjl4ZHVEOFIrZXJBamU4WjlnRVRnN1Y1?=
 =?utf-8?B?NU52dko1L2h6SWdSNmxRNE45VHlveW5uaktQTm8zUHI1blRLQnd1Nmx1Rkh0?=
 =?utf-8?B?Znc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THhsb1dtVkZKeWt6VnlJMUVPblZrc2tyODl0b3NrM2JId2FsR1AwZ3lENmJm?=
 =?utf-8?B?bjdTMWZlcEdsai9mUXc2b3A4Skp5c2VYdG5oYnhUNXpCS2xYc3JvbXdabXo1?=
 =?utf-8?B?QXBLMUpQWm5PSkxUNTBLS3BlaUllTUg4ZWhsUjk4Q2l0Z1MvYlFMSG1Bd0da?=
 =?utf-8?B?Qk5pL0Z5eExFTEdQclZjTW1BdXBVRlpJZGIzTEtwZUl3U2gwS3RNdXUvWlIr?=
 =?utf-8?B?S2x4OG55bXFQZVc1N0tERjBJb3V3Z3dJZkNJQnlKWGhaaGpsbVB6Q0d1SVpq?=
 =?utf-8?B?UmhYWGFJeUpQUDNrUUkrRnlWV0lQNmI3OTZrWUxiLzJVWjJuM05Tb2h4SSt4?=
 =?utf-8?B?NS9hUUFNWHp6L1BxTjFBLytXVXZReEpDU3ZUUktYTExWRkZ3Ny8rcFNMTFhO?=
 =?utf-8?B?aERBRjY3amZrQXd3QTRJUjNYYUc3bDBVUEtyejBtN0dKVTdnZXBEcWFJUzU2?=
 =?utf-8?B?WkZpYmc1VENyN1V4elFMcmkvTUY5dFFKaXBIQy9wOEp4WGlXQjNrMTdleHlM?=
 =?utf-8?B?OFM0ZkhLeUhKeGlkRFFPcmh2blJ2VWtLOWlLZ1h4bUEwTUJKSDh6NU9CM213?=
 =?utf-8?B?Q1BnUTRNTWFWcW9QcERBdk84RGN2QWhnNkNHeGllbm1lNHJwNFFwLyttMWR6?=
 =?utf-8?B?UnhQelB0YWNJeFFIVWgxa29xNWlIWURibXMxK3Q5OHhkR0VZVHZEVTZ1TjJs?=
 =?utf-8?B?UDJ4ZWhKUEZVZzA4MVV2YmQ2S3JTZEwzbTZUR1Zvb1RIY3owTkcveldLSUZw?=
 =?utf-8?B?QXplSWJNVHJpSXNVaGx4YlA0eWlSV2ZkQ0hsT1NKNVRvWU5BTDRGRElsQStN?=
 =?utf-8?B?ZnNyR0RwbzREeVhRWG13ZTBGZGtYWWhrcXNkVmcyZzE4b3UxMDlDcnkwS29U?=
 =?utf-8?B?Wkx4bHNCbDNJaTdmM3U1K3dmMXg4WmNTTzk4ZnZpWGFhZ1h5azc3WDNVLzc3?=
 =?utf-8?B?YklCa1NROFZ0ZnVFcXVpQmNNMDZDa2gyZC9SQ0N2QWszNW80MEdXVGM4cEZO?=
 =?utf-8?B?eGUwWFp6b0RMYldFWUZ5TVpvbFVaSnJjZVpOVDVTQ3Y4MHdYU3VsRy8zMUJk?=
 =?utf-8?B?L2pPOWVlZnVPMmNTYXI1cWpCeFIvUjRYWHgrTHhLVEg2SU1hamF4V3JLZHE0?=
 =?utf-8?B?K0dUYzgvZGxxUFNKTFp0OFp1UDMxdGFxTDFGeml2MTdNNkNDeWRFdjVhVFE5?=
 =?utf-8?B?V1kzekxOR3R6K2xNWUp1VFNpaDdOSTA1eDJ3TERuR0tsdFFPNTRudmlXR25u?=
 =?utf-8?B?RTZrSXZBMzNob2J6L0Y4ZzljZzFTQmxPZjgxMjU4SFZiZWZwWDJZZm9lQzBH?=
 =?utf-8?B?cUY0NTJjeTJBekdJSGtKSHZhYW16NlgxZE5OYzBkeFRhSTJoYWNDbGhhUFZM?=
 =?utf-8?B?RlRhbndWWTVFL0VQNUkxNk5vL2RSMVloRHRpcXI5OWJtVzBDMWxnR2lmZm5m?=
 =?utf-8?B?K0dTcXFLSGl2RFFBc2NWK2VRTWVacy90N25IU3lVOWJ1alk0dG90V3VnYThu?=
 =?utf-8?B?MU5kUEE5N1lLdktDVFJITlIvbkpYdUlEUExkU0JLZHZuVjF3WWpET2YxVWpW?=
 =?utf-8?B?WkJuKzA0NWZKL1BnYTVEa01SbklTVmo5ai9paWYvMGRYYWVxamJYMytkTUNq?=
 =?utf-8?B?NUxlVCt4T2xrc1QrZEFSaG5HV2I3N295cDJYbFI5UU5VeWZDZ2w1SE5ZZGxx?=
 =?utf-8?B?Q0QzczRuOHpZN0lKbCtobzE5ZktVZlVPQVFaVDhtYnpLWEY4bXBqeVBNWCta?=
 =?utf-8?B?ekxqSlY5aUlHOGhkVjJtanp4Qm5GcVVaemdDclcvbjlENVNEQlFVNDlIMFRZ?=
 =?utf-8?B?NkxYcmI0ODRkUDRCdnpDZlZkTUFUWXl4Qmd4cUFIV2VROU55Q3FyVEFIbnN5?=
 =?utf-8?B?bDBoRFZNOGlJVEp2dlIrb0N3b0hEWWcrQW95RlJpMjh4c3hFSkJMVHhCRVFO?=
 =?utf-8?B?UC9IcG9MOVB5cVYrZWUyRUJmVW9PU0VmalBYQkxYR3l3WG9weWJYTnVaRGxT?=
 =?utf-8?B?blNzQnlzclV6UElvOFp4L0pqSytNclZpNkV4V3J6MEdYdEUxdnVWU0xnNjZn?=
 =?utf-8?B?bFZhcmsvbzUrUEhBSWY0QjkyLzMwQkk1UldPVFJ0S0d4ektmNDBzcTlSbnU2?=
 =?utf-8?B?bUwvMCs0b29lSTI2UUpTL0FYeFpMb21QMVZKdnMveGJ6NkVpTnpmNVNuU3JK?=
 =?utf-8?B?TnN1SU9xSTNsaEwxYkowL0QzLzFDd3JHZjNxUmF6NzZsc3hKTHVuZVJsWUt2?=
 =?utf-8?B?ejVRUEVEMDJLWGlEd3hKQUVyYTMyUGlham1MTnczTFRUUHlYcW04QkN3a2Fp?=
 =?utf-8?B?NXJBa1lwU2RLSkY4T1RFQkJwWGc5elZBU21mMlN5d3Zqc2VCZlRudz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cad6e709-2441-44df-2eab-08de58f712b1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:12:12.7546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tti4SUUzJtwif3L9VcvJPIYk6yhTvOblX1CIxtJBOu0f5sewFSV8wCBjUAyO7uf2LaI7sQ1LLa7/MPh20CcUQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5820

On Wed Jan 21, 2026 at 7:23 AM GMT, Alexandre Courbot wrote:
> Shifting a `Bounded` left or right changes the number of bits required
> to represent the value. Add methods that perform the shift and return a
> `Bounded` with the appropriately adjusted bit width.
>
> These methods are particularly useful for bitfield extraction.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/num/bounded.rs | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index f870080af8ac..8782535770f1 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -470,6 +470,46 @@ pub fn cast<U>(self) -> Bounded<U, N>
>          // `N` bits, and with the same signedness.
>          Bounded::__new(value)

This patch doesn't apply cleanly. Looks like you send it from the wrong bas=
e
commit.

The __new call here is still safe while your code has `unsafe {}` in it.

>      }
> +
> +    /// Right-shifts `self` by `SHIFT` and returns the result as a `Boun=
ded<_, { N - SHIFT }>`.

The returned bound can be larger given the assert below?

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// let v =3D Bounded::<u32, 16>::new::<0xff00>();
> +    /// let v_shifted: Bounded::<u32, 8> =3D v.shr::<8, _>();
> +    ///
> +    /// assert_eq!(v_shifted.get(), 0xff);
> +    /// ```
> +    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES=
> {
> +        const { assert!(RES >=3D N - SHIFT) }

Quite surprised that rustfmt didn't ask for the block to be expanded into
multiple lines.

I think we probably want to create a new assert macro for this pattern
(obviously this doesn't block this patch).

> +
> +        // SAFETY: we shift the value right by `SHIFT`, reducing the num=
ber of bits needed to
> +        // represent the shifted value by as much, and just asserted tha=
t `RES =3D=3D N - SHIFT`.
> +        unsafe { Bounded::__new(self.0 >> SHIFT) }
> +    }
> +
> +    /// Left-shifts `self` by `SHIFT` and returns the result as a `Bound=
ed<_, { N + SHIFT }>`.

Same, the bound can be actually larger.

Best,
Gary

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// let v =3D Bounded::<u32, 8>::new::<0xff>();
> +    /// let v_shifted: Bounded::<u32, 16> =3D v.shl::<8, _>();
> +    ///
> +    /// assert_eq!(v_shifted.get(), 0xff00);
> +    /// ```
> +    pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES=
> {
> +        const { assert!(RES >=3D N + SHIFT) }
> +
> +        // SAFETY: we shift the value left by `SHIFT`, augmenting the nu=
mber of bits needed to
> +        // represent the shifted value by as much, and just asserted tha=
t `RES =3D=3D N + SHIFT`.
> +        unsafe { Bounded::__new(self.0 << SHIFT) }
> +    }
>  }
> =20
>  impl<T, const N: u32> Deref for Bounded<T, N>

