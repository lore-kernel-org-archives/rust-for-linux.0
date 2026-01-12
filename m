Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020131.outbound.protection.outlook.com [52.101.195.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0534A2F49F0;
	Mon, 12 Jan 2026 19:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768245278; cv=fail; b=IjERgBNIRKZppccYxpbqs58KPzZ5INuXZVAqN6L4FORaDdK8+AA82notrJc249uOcfrtSC9MA/kGxhO3Z12zAk9ON13WklGoWt5mDH2s5TTwX2HoxlVPYYFAhkOlrDKTeejByssUA7+nMWt/Fqs2Qi7OOWGerw/sHwZIvFBqacQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768245278; c=relaxed/simple;
	bh=KRMYFxUhYU98EUhRxHwAvhMU/B3OjQXSXMsEr/7rs4c=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=mrdpZXluN9Brj+4jDoNOTs2FgWwn2fxe3Tb4CD+9rKrxbp2jMHRSRMU5+ZBCor4g+Z5A6ApjTibatB6vhIZ6LGWXTG1gYR6mcDy4wki75dcfOvIdqaB4VQQOWssu1E6YqcghS3ZoN3WZwI9+0p8Y1p37iHA1yNrOcrqQwCIKplU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mKL8W5Hn; arc=fail smtp.client-ip=52.101.195.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mKL8W5Hn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkryJDJKlQc56QPtvz7sIjrPZvxfAUcfB82G+4el1Vp/UA8IcjeK3ndTp/vkuViP6OUrx1GoPuhTyzpdbNhIizfRMNUHtHD9nuMhv5jX0hTB801KHbqmIus6QY+O7oU7BD3lovRTmAkHKzlC4bLFqujQN7Ma/5oKlnJaXds5nOKc8KP2seh+4Ivvkjww70Kz+Cvbi9HAd5dQT2UhCpFwoGuqNo3k73+qgpPg4S22VoyYPg7xmUgmXHCHo8PuI+ap6zo3nS06B3PWHLqWzML23f3BXBDaWRY4FdL5Umaw+Vqs/ZnoNGRAwYxcOgckaF2Jn4KVzsTwI1Ne5jzv/F32gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPBFChF1FrE59DPnYqUbKeyOx3/odYa8KcWD3j1Ikps=;
 b=fsYaS2zmHm3dVLpcZBjLIEd7ftZE8lZkqFbj8/gEI+Vf+hr0oAgm+/HkVVqENOmjrUgHlGbra4uCNyWBpMYVn9/T8057loHHLyWR77y3/rfOe/PyWC6ugJ0uY5F0HoltYhjrbcOulZVii3MNSku3VKVCbvhSVED8bG5Oap1nf0SKmuLl9QATUh1IV6q5YcLjN1k2cOqsE4ZyEWCP2RO0IPNUB7wWvJ+3LGEgk2t0OCuvVWTK6y4upZ9h86VRO8FILeeeEhJ/CvllC5jDHVcZuFCg8yNhi7Ua2UroEaNa4lB1IyUEHwgH8GkrWlAjYb42K4D12gDMnobLf5O8qCy19Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPBFChF1FrE59DPnYqUbKeyOx3/odYa8KcWD3j1Ikps=;
 b=mKL8W5Hnk1x+TXNE+m+lR7E2FfQvyV0d/elVrTFSnpjchjEFL1zGThPYAXxkC2Xo7NY+VwHS5af9kDYjiEMRyaUvl5Q/fCgRngKBe7TwkzQrn1VCcQcIhzaKQUtjpzmkY1wnaQXs4bufksKfxS5HcdbyBxS8GytFevYzNzWZg5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB2378.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:106::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 19:14:34 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 19:14:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 19:14:34 +0000
Message-Id: <DFMUMWQ1YMUT.1ZWU2JXTKKNPS@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 11/15] rust: init: use `#[default_error(err)]` for
 the initializer macros
X-Mailer: aerc 0.21.0
References: <20260111122554.2662175-1-lossin@kernel.org>
 <20260111122554.2662175-12-lossin@kernel.org>
In-Reply-To: <20260111122554.2662175-12-lossin@kernel.org>
X-ClientProxiedBy: LNXP265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB2378:EE_
X-MS-Office365-Filtering-Correlation-Id: 834e7945-e77f-4a1a-54c1-08de520ed27a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDNGRGxnZkFVWlNTMXg4OWFHbDZTUEpsclZlZGxuVHdVb3pKK1I0Z3M5MUxI?=
 =?utf-8?B?RU1URDBZajZGQUd5TG9IQ3ErY0lVSElSZ3NSNU1qTmhZc0lDNDl6ejE4ZFZ5?=
 =?utf-8?B?OHIyVFVlcTRjVmdEem0ycFV2WkdtTmI1VExMcjA4eGlhZ1JDWWtoYmNhdnAr?=
 =?utf-8?B?WnZjVUw3blhoM2Vtc0tUY0t2bThMa2F4TWsrS2xUWjBlZFNZdnVXclFFTUJ4?=
 =?utf-8?B?cjhsbFBvTVp3aUhNNXFzSTgxYzBnZHl4REJBbEtVdHlSUFk4M2pTZlc4a0Jl?=
 =?utf-8?B?M2hNY0N2TlJJK3JUNFBoTENkSUVkYitqdWREa0xncUlFM2dTcExQa242VzlR?=
 =?utf-8?B?RmdjSU5YQlJpQ2QrSDhKRVo1Y28yby9uditDZFJKeW5KWG1TNlhSWm51WGVW?=
 =?utf-8?B?ZFAxU0F5TE1ldTNnd0srOTZZM3hqajVkRjVpaVF2dzZydmFsYVZ5dmI5bWtm?=
 =?utf-8?B?SUpjbkZvTGFmeEdUVmlwMGpHL1pQZHhMdFdsYWlMQ2JhM1JpY2d2Qk8yVWlt?=
 =?utf-8?B?bnRTNDlNZGVoT3lveTRUOFhHb2pMaXlSVlBvbFkwZHd6ZnMyQTViSHM1aFhS?=
 =?utf-8?B?dzIvSS9HSEh4aU9MTklqSFNOdzVsNldkRzRlNytlOEg2cWVkWUJGY3I3TUgw?=
 =?utf-8?B?cUVkaUlnTGVZNGRqdmk3V2Q3Vm1HSWtYc0x1NndmYlQrTzFhQzZvR0ZPZWgz?=
 =?utf-8?B?SHJRdE02aXFtRUs1UmovQWFGR0o1cDAxUGF6RmRZeUdreHBvQ2VkbkRkNk4w?=
 =?utf-8?B?S1d6TG9pN3d2U3NEcEl1N2xPZmMrWGxFSlVvbFliNkVkazVSWDlFeFBzU3Qv?=
 =?utf-8?B?eW1STGRMRWJBV05VSjgzQU5BMFZNSEJ5aEZBd3NaUVR6WGpFdnZnbXd4S2Jl?=
 =?utf-8?B?aUFtcVMwMmRYcm9tTmpxMHFsZklrYTB3R1AzS3Y2SklWQXRUQmtjeFVsVTUv?=
 =?utf-8?B?RWl5QUt6azMzZFRqTks3bVowVm0yTytVbm4yQ1VlUHdLQWRVZXN2b28vV3pm?=
 =?utf-8?B?aHBKVW5zbVpVT1JDRTljWlBITXpiSjBpTFFrWDdFQ0xacWRwb3cvL3plYTVz?=
 =?utf-8?B?MFBEWm1nT1paandNTHUwdlQ2OGNEVVM1OWNaZmZSNmYzNjkzbSt0dzkvK3hu?=
 =?utf-8?B?T0lJNlpKUzBTVWpkOEVTY2p0dmlScGV5MktGQ294S3VvenMxd0dERHhEMVlt?=
 =?utf-8?B?V3pzcHFhMnVZbGd2Mml2VEFNcGR6NldrQmY4VUVJRDNZVmJvZnM4emZ2a0VJ?=
 =?utf-8?B?TWRGb28zb3hLWXozZlU5QTVLZXg4UXRuVzFwNHFDWFMzNEFzL2E1Z2hPblNj?=
 =?utf-8?B?MkJEWjREc0xkTUppWWJDVWt5TVFlbEpoTjhQSG40YTFzREwrV0FWRWJNWk1a?=
 =?utf-8?B?U1AzTHpkV3VoU080bVZ2WWRXQnRBSVBaYmsrcmF2QXFiSmZvWHlZVENpdVBZ?=
 =?utf-8?B?SEp2eWxhaTdmRkxyT3R1RWRNV29BcGNVWFc3dHErSVBGbWY5RklVaTlnQTlJ?=
 =?utf-8?B?d1dKNzBZMC9uZ0VnV3RLMkZwSUhZcjJpUStENitQVzU5MnBpRm1QYlVvRHNE?=
 =?utf-8?B?bXpISEFvWFlpUFZjbkZSR0ptN3VtdUxLOUtvalhRbzBsUk4rR0QyYzI5UGw2?=
 =?utf-8?B?YUtUcFlDR1FScXZlRUhPRnJ2Z3A4RDhlcVVpODdwSWJobENDS3YvUm51UEVn?=
 =?utf-8?B?SFV1OEtFWGczU3Q1TnRqZ1k4bThLdFo1TEYxSUZyMVNlTUlRZDd1Zk9JT1I5?=
 =?utf-8?B?VXBUS3NlbjNVSzlRd2RzQXdyN1hmaExDaXErNkhuVk9nZW1TTkh0b3k2SVQ3?=
 =?utf-8?B?OGRnRmYxNCtTQzFRWEVDSXRNRXBDUlYrRWtSZlJJZlJnejlaVkFkNCthSHFi?=
 =?utf-8?B?NFhpT29UT28ralN5MHVBYmlFSnVmMVp5SmpaMzFWQUM4VFIranY4c0pPeHBa?=
 =?utf-8?Q?1ZojpjD76omRnBxGKsqGUabqUrr4xlKi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qnc5WWZoeUtnVVR4am5lY2hDdmdIaGpxK0hwQStkcTdDMXRRVS9oTzF1VkRF?=
 =?utf-8?B?ZmkrbDMyWUVDa1ZwaFhPSHhDeHVVcVk3dHZFOHpXQ3U2cnZpWlF5SXpqSW9C?=
 =?utf-8?B?ejVCRnkvdWdnU2RoZS9pN2ZIbUhSdEFLQUJpTzhuYWFtREVwZUQ1ai9xK2Ji?=
 =?utf-8?B?bGNUWk9ZWFZxNWZPODZoSHBWVXk1bFRveU5FNVA1SFlUMVY5bFdDcTRvMGdz?=
 =?utf-8?B?WWI5OUVjelpGeHNDOHExMmJaKzNlVlQ4aXVjR1gyaGtFVjdpWHUxalJWKzlO?=
 =?utf-8?B?ZkJLS2laanhWTG1CdzcvckM4US84VkJSWUhuYkUwbEtuL3JzQ0tiakZuNkZZ?=
 =?utf-8?B?cm5hRTBWcE1NcWdJMkozYlo2blVHcko2WGRUNWlPSExFZXNGYU5DMkc1anUv?=
 =?utf-8?B?a3E3UzNZT1dTL3JHQzJHc0ovZGkrQXpNYW5RZkFWMG9HNVZlb1c4MlY5NWFJ?=
 =?utf-8?B?NTdzLzcvZE5wamtDVnd0UmlOalFIeFVET2tRVDFtNVpIOXhtaHQyd1VvOGZP?=
 =?utf-8?B?RlA4a2x5ZUZYSWE2SStlNG9kemhZUnFraXJwVi90Yk9KNzBueENhbkZrdFQ4?=
 =?utf-8?B?ZFRIcU1GY2x5VTBmdGRFcEoxNE9SUWVjbm4zZzd5ODMvQ0RnLzVLWHZEOVhZ?=
 =?utf-8?B?MzkxYzB1a1c3dmJ3dTM1T3l4NXBXMVdPaTBCZzliOEEzdHlianRHYTdoL3M5?=
 =?utf-8?B?N2ZrOEJGU21GMEhwaTBSbUFkSEYvalpUK2E3b0Y5NDJ2RzkxOE1ISTFZMzdJ?=
 =?utf-8?B?SUlCWnZJRSs3cFI3SXlzL1dka2ZRZkdjSVF5NTF5SUZETnV4M2dXUzQwQ2ZS?=
 =?utf-8?B?cjQ1Q0ZxMGVhQWtFNlcycFdEZ0dzd3hEb3lNZXVXZmtZMHdPeUFXRW5MUHUw?=
 =?utf-8?B?OVhvTHlLMXVOc21hTDNMOVZPQW8zMUdnQXdkWjFoSHF1WmlYQVVvb3FhendP?=
 =?utf-8?B?YWxHMnRLNVFDaDU4NmpvT2o5M09tVGs4aEVDWHE2ejFuL2hxT2luaW81MnAz?=
 =?utf-8?B?TytXZTVKcFpEcU4xekwwM0dmNXlyUFhQN3NpdEwzaThmTTRSSWhKTzZDMktp?=
 =?utf-8?B?bjU4UEdRVGdhNStQRFMvdFhBbWIzT0xPbStzRExRVm5FRnRiNjhKM0twRUdl?=
 =?utf-8?B?bXRudTM1VHhCWUQ5eldzalJCSFRTdktnY2FEeW9HdFFocHIzWWp1eWwza3V0?=
 =?utf-8?B?RFlhZ3BXUGFTbnQwTUMxSnVIcFZ6VWFDZUNrMnBLemVIa2hEK3hEMzNEK1hp?=
 =?utf-8?B?M2NpTlU4K2w1UnNDWmlrTXozakNubzIwOE5xakw4Wi9ReGZqdHR2SXlVdXJ3?=
 =?utf-8?B?Y0s0RGpnazBCVWdXWTB0VUJqcEw2YVVtblMyMEgvUi95b2FGVk95d1JZQklq?=
 =?utf-8?B?WlVHUUwrbzJVY25sa0djdHVxbzV0cHZaRy9BdWUwa09XTkFjL3BHTGg0MHk4?=
 =?utf-8?B?MG0yY0xObUxObHBraEl2TWY4TkNkWW9iREtBa1BTdHJBeUJ4QVV0S29CNjhP?=
 =?utf-8?B?cGtjQzQ0NHEzc3V3eTNGblNadlJ4dWg0bEtLYUFjSktESExpbU0wbzdwaEZG?=
 =?utf-8?B?dkNuN29INjlMUVc5SFJhN3VTSnMxTGsvUFo0QUltc3VjM01rVEpjcG1NbWU3?=
 =?utf-8?B?ZEVETmJ1ZEpYUFJoTWUwUjlBZWloQlFkdEFTYWJxcWlJcGE1anlQbnpUTS9U?=
 =?utf-8?B?YUZIbUVUNTdxbmlGMjJMVE5CK0dNSW1lZ1FBZDVjTGExbTFDZjB2Njg5ejdk?=
 =?utf-8?B?TjhwNW9WMjh2MWZJbk1wOEtRWStmd2VUYmtXYWJ5cnhnUjJ5ZW1pcmRPQkRH?=
 =?utf-8?B?MWlaL0p3MHphL1Q4ZHJwWnNaZE5mVElaK2NPWm1RQjNTSTJNRkFsanJGZUpo?=
 =?utf-8?B?NmxCbzZORHI2cmxhM3UzUGpON3p0ekpPd2xLRVJoWXFWTnMxZnFjQUxVbFpN?=
 =?utf-8?B?QUN5Q3RQdXNralYwWHJaRjZKV2tJWTdOYkVoYkcwS0FPa1VpM0t2Nk54TGRj?=
 =?utf-8?B?WFhtVkV6NkZ3TWxTS21qaEJud3pKRXkvY2xsTDJKRmxWaEp3TGdGK205RjRm?=
 =?utf-8?B?N3AvRnBNQU1UMXR4TUJFRHNWU1RYODVZdzBCblNDcU5JWGdLaVczaEVQSkta?=
 =?utf-8?B?MzFBU25wNGx4RzhpUzI0UlFRazh2THk4TS9BZE5EeGRYS0JLWHM2QS9uM2FU?=
 =?utf-8?B?eU5YSXg5RTdLb1dhaS9Kck9xV0tiWGl6bitxN295R0pWdkNoWVEvcFBaZHlk?=
 =?utf-8?B?WkxRRTNZU0JHZEIvdnVWZWFmMUV1cEVxSzRHTUs1TGY5VzJHMDYwaTdQSU9m?=
 =?utf-8?B?Vm1Mc3B3OGlIS3dsT1l0RFNqNVlXbkl2S3YxcExtL3B0UjFOZWFzUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 834e7945-e77f-4a1a-54c1-08de520ed27a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 19:14:34.8008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMZ/uu5BGsEQQjuIKTtmjgOxU/cYgCQPhYzghRPgG5zuiQKZzTI3GRdoTIg1pWSBpxU5GhQk5yW00viFuW0aEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2378

On Sun Jan 11, 2026 at 12:25 PM GMT, Benno Lossin wrote:
> Initializer macros should use this attribute instead of manually parsing
> the macro's input. This is because the syntax is now parsed using `syn`,
> which permits more complex constructs to be parsed. In addition, this
> ensures that the kernel's initializer marcos will have the exact same
> syntax as the ones from pin-init.
>=20
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v2: none
> ---
>  rust/kernel/init.rs | 40 ++++++++++++----------------------------
>  1 file changed, 12 insertions(+), 28 deletions(-)

