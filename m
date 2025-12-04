Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011025.outbound.protection.outlook.com [40.93.194.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8482652B6;
	Thu,  4 Dec 2025 14:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764857614; cv=fail; b=Ardr4d0o4mB38hZwzt8gqXBXS0v16OsuANWSl3cWqDPrTyeXEEbK0X/1+2zs0kmxvU3IOBk2KeSW8oaPjetXFrG2PUEZL9oVd+2Q2zWDYiCiNownPHkjommrT2bkmYcwh5bfUoEoTcaTNwSaRHZ/2BsWGz+g4/XUFeDb4LYFx5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764857614; c=relaxed/simple;
	bh=inc6BBcghWMvbl4Y7wBHYh+Wf7mk38fsfE6wVO1ern0=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=F1tJhM4LlsYNiREV4RtpkSgfJBczzUrqzxQZxUz0fIgsXo3lLGA9oMpjCgIQOA/X2uFY2lBR7+9kIDP8Vc6ZomRKzBdMSJamPSCi5dKeTRBBcVE0bz/jHXve0cdo4TtLiOas+xxCWOHiSSpCxaPLsG7iVuzduCBFcfgsZOP/3t4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Soe2IfWn; arc=fail smtp.client-ip=40.93.194.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Soe2IfWn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzzBHyt5CUCs4Gwd2GisPx0wBBZiLcQAUE2m/R2Apf4CCUAS+Pr3NBPVVRIC1y6XQf2zfSftWFu9Xow72KoWzRUm6M4sF87CLfGR5EVUzv46wcn3WLkIfi6ogulHGJp9cWHkXDws7f4nORF3/PUhL4ZIzxphAD5SoTHzNE/XWLsYdj129XjY8ry4kvP2y6cATyU0xkGJuYUdDueC1ZwtMfftdvymHff/i5lvk/VQSBYhMY1GnDMSQ1SCczRefw8R2ALxphRQfCz6+F5ZW9G8fVXLDvtFl4OFgxvmLg4im+un2Q3GDaJxN8F/vFei4cmiyQ08V2ddG2eW0Nl9/a6c9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inc6BBcghWMvbl4Y7wBHYh+Wf7mk38fsfE6wVO1ern0=;
 b=JqIg9n4S8N7OY91ADNA/im/Cg2HnnQlOSlue7o/Qvk7p8eVcuSOUDe32z4EW4wSJXkLr2nhqmTQi9jcfg9mQRMdBxN79h1KgRgxH6004LSCU5iZGGYsU58GmfZD+HJUmX0GISlt7ijXvoN9WS8kvMRY7bASlmUjiSJCpmGdBL6Naudvh3NKDUUXUdGjXMHN51vJUn4ZXEPzG1O/cJnGHSVdiGQQakY5pz6a2i39qrunMt4cKZJ5NOZ7M/a1GDz2ujjRWOzUEIHQcSfRqhzJqCIbrws7gVjScWWHyjFhpY3TnWGu72l/ZHGnivZwuwGKM5diFIRdEzni8YXkWVtu5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inc6BBcghWMvbl4Y7wBHYh+Wf7mk38fsfE6wVO1ern0=;
 b=Soe2IfWn/RZPYvHIzp1wRUPLWMVAAW1M608uysf8I53l9Lgp36tuwcFTWf7ofdLrgMTXu2PrF7Xz+eDuruge/XTUSu483iWaJRet936KT3huvHfeDyKutyMoLPXhLCkQCkC7RldCMQcjPxMLNF6ELquF/X27sRLicyaJCik784NbBSvxocpBeOKcOsWOrvkQSUV5B6tK5VcqorigyYaFAQksHMblm4akRC9wQzyulpqG1s7MS6C8FkCxFauAr5472doT56msXT1wNgxIhwNQugXV8d/6D2aTUXC+yfjG2DUsPu/wRLuglWtzsV3ufCFyQPWbJUwSWqqurL4mWQ2YmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA5PPFB1A5CE29A.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8dc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 14:13:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 14:13:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 23:13:18 +0900
Message-Id: <DEPHSZUPUJBB.2YEABTJ7OR86T@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Hsiu Che Yu" <yu.whisper.personal@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Yury Norov" <yury.norov@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] rust: num: bounded: mark __new as unsafe
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251204033849.23480-1-yu.whisper.personal@gmail.com>
In-Reply-To: <20251204033849.23480-1-yu.whisper.personal@gmail.com>
X-ClientProxiedBy: TYCP286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA5PPFB1A5CE29A:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ff5a1a-f4b0-4bc5-0fe2-08de333f47b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1dPTGdTU0VTTkN0VXBFbVRoUFFYcXUyZlFHTWwrTkN1VmdEcEg1cHQyZ2xa?=
 =?utf-8?B?eTNXajRWYTg1ZVlRL0ozb3d2QUl3K3l6OGRXejR3WjB3N2tFVTY0dU1JR2dx?=
 =?utf-8?B?NFh3MDZhMDVoT2RBekJWTVNBUnhNYTFRRGRSZFZBYis0Q3JlNHNPYXpBbGMy?=
 =?utf-8?B?aXZxWmhaRlkyQjlmYXN1bjJnakhNN1p3WTl4TW90ZUNuSi9DSXdSVE9raXg1?=
 =?utf-8?B?YWkvS1dKbU11K1lVNHNUZFo4SkdDYWdwR2ZyK3pKTWV6QnprWjhhQUFpSUcz?=
 =?utf-8?B?UnI3ejEzWUNHR1NmdHplZkRUSit1bW9LajVOSUlSa2EyQ293RnhVcDR2Ryt5?=
 =?utf-8?B?UCtyYTZuQkYvd25IaUhydE9BaHlIZ3VuSW4wc2Qza2xiR25UdmRVZngwN2Rl?=
 =?utf-8?B?TkNiOHVveloveWJLYUh5bXFxSDJicHllTlN2aDFMbUJ3eG9xN0lvZkxVeVpY?=
 =?utf-8?B?bnNQQWlveEY1QVVYMnlVVHgzQVg2VnBEdVFpdkc2TE5aM2lvZTEyZExWVW1N?=
 =?utf-8?B?cnV1dXlZSnJFZnNVRjFYblZocTcyVzAyc3ZxMUFuVFk1dU9iS2J2ZXY5dG1Y?=
 =?utf-8?B?Y2pTSFV4ZHZtcWltOFMxT3cxR3pBMEFhZnNLVUFSUUxHSzFkbXNOWk10UU14?=
 =?utf-8?B?TUw2WW9ZUVZnc2huMndSQjRwNWt3NDJneEszalM3LzhGdkxPVk9vZ1hBdFlN?=
 =?utf-8?B?d2pEaVFOaFZmR2lnYUJ2eUFWV2pCSS9YcElSeGRuLzRSRTV5RHJ6R3U3Tzk5?=
 =?utf-8?B?SEM2S3hwTkEydTh2QlhkWmlMazNLbTlDczdDNXRRSjJHTXBVSzBHU0VOVGRQ?=
 =?utf-8?B?b05BUGcxNkE2M2VNZnhTaHk3Y2o2WWI1UmNzWWVzOU5yU0wvTmJyN2M4R3J0?=
 =?utf-8?B?TVdGOU5mZDRSaGM3UEl1WlJLUUs2VXkrYmlscFhQWWFwaGxCcFdWczFJZmpp?=
 =?utf-8?B?cUtZem9lNHFRLzBuaW1XdWVWWlRXNU5iR3NiME54NHlaZFpRcE5NUEVtM3h2?=
 =?utf-8?B?ZVQvaGE5WmJRR25MaUdaTlRmd1ZiNUQwVEtpenFJbHFGU2NFNCtheDJUa2ky?=
 =?utf-8?B?YlU3UXI3YjgveDFobVdqUGQ3WEQ0YjZOb2xIL25ZZ09CN0JHeVJWMG1wZERY?=
 =?utf-8?B?TDBWTUxDRFhzWm1lUkV4ZEV1ZkhLQ3B3RzZKRkJONlpkSVhXeFBmMGFSZi9m?=
 =?utf-8?B?UmlGbktvN3d0NFZwd3RsaEFTT2hFdHBOZjcvY1ZMc0NEckFnS2VMZHR5SEo4?=
 =?utf-8?B?cFJ5Y1VmRjhpMWdXQVFsR04ya0NkQkhKZDQySjVUQTJTWlZPZ2Zpc0MyZ29R?=
 =?utf-8?B?RjBLWEtzczlPMndDU3E0aGVvaGMxNyttQnZFeGxBaEsva3daaHBmZ1F2UUdY?=
 =?utf-8?B?WDAzcUwyU3N4eXBxQk5KTWZiZUJxMmlCVHoyRjBRQU1yTFRBVEh4RXVJT3ph?=
 =?utf-8?B?czVuOUtqeDllTEN6REFMeGl6OWdTcmwyNDRCdmJEazVlWlA0czBmaHorM1BQ?=
 =?utf-8?B?RCtWekd6a1dmTXJGeWFkNEJ4cXZ2ekNnakE5SXVlTm5tdU9HK2RLU1hWT2lH?=
 =?utf-8?B?LzFpazRhb0dWVnVuNXdILzFBWFlpQlcyVFEwWGxLQkVBU2laVTdIbFM0UkRo?=
 =?utf-8?B?YXk0TlNGOXcrNjQ0NG9LS3B6Q2R0c0xqa05IZHR1VDVlLzhpSnY4S012alNl?=
 =?utf-8?B?RWdjWTl5cmFJK3NVQTlodzhyT3ZTQTFQSkhwalpXNnhHNkJWbm9VZG9UZUEy?=
 =?utf-8?B?b3NBa0twUGQwMWNYa3pvUG90Um5ha3VidHVxbWE0ZnIwWnZwSy8xNkFobmRJ?=
 =?utf-8?B?cnBMS0JQWTVLd2ZlTkZjcXBwTm1CQjlMMTBlRHAyaFhNdWRTb1VnYVp5clZK?=
 =?utf-8?B?T0NyNHZaQTgxMVgyLzNYZmJRSW5Oc2pTcWY3YkpyLzVLWEZMZzV4eG5GaXR3?=
 =?utf-8?B?aFphdTIwZzRUN04rM2Q0VFNNT2tHT3RWOGlaZ21taGRiL1lqamt2eWpkYWdB?=
 =?utf-8?B?UWlGQTc3WkxBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXQwajRzcFhKclR2aEg3N2ZpQXhDaGw2aFR1SWc5cnpNYWh5eGdJcHp4UlFB?=
 =?utf-8?B?ZjFvVzNpN3FMOGdwQzJZRkJxZGRRWUl5UzlrQWMwUXZqVjAvU1M1VGJNanJN?=
 =?utf-8?B?clp5UVplQzZlN2Y5ZDJiUjFZODllYWxtaDYzQ01UdWF6MWw2RTc0S0N2UFJT?=
 =?utf-8?B?dWVEcWxuVzRkMGFzbkJ4cEVURVUwQ1RUMmdFSnF6UVRDSTN4SDI4RENQL2th?=
 =?utf-8?B?ZzBTdGsra05DQWV2OHQ4bFh2YUorL3F1UFAxZ0NnMU1UVi9QeDd5bVpUN0JY?=
 =?utf-8?B?aCs3bHBrSUZVTjdQbHhPYlErTGpSYUZ5NlVXWG1GbjNrVDlHUjh3MkhqOVZN?=
 =?utf-8?B?Unc4b1BMb2RWeVZtYjBVOVAzMHZvU1RrRTR4Ykxjb2k2QlF1c05VTmNaRkE1?=
 =?utf-8?B?NGJtSFd6SzFvYTl0UFJOWWlpTFJmdjlRYWpDRmh5cnZ3ZnhmczBrTklqYVhZ?=
 =?utf-8?B?UFVWOUxKa0hYUGt1K2VleHZhcjE3bnIvNWZNUjBXZmMyWXA1TVR1RCtGaUZx?=
 =?utf-8?B?Z3RqNndxd3QzL1ZQR3Zpd3Rpc09ZMHM0RU41elZHWTBIak9qRWw4MTNQTGh6?=
 =?utf-8?B?OHk1Z0hqdXBiZXR6WFdnbnV1NlQ5VG5FNTdyWGNDNmlVajdjbUhNSEN0b2Y0?=
 =?utf-8?B?UGZHL29ZNlRwbm9PYUpnRWVzZkROQW9SaFRNUU04RUcvRnBOQkxoRHMxWWFX?=
 =?utf-8?B?VUMzRlhqWXpDQUNNbVVNQ3dtQnczejlUdlIvLytnTGpaUjlKdHNaQjRqTHMr?=
 =?utf-8?B?QnhYQUZkbG9WcU5CaUhPRnpxQXl5ZVhvbTRBRjhJNTlWeE1Dd2dqM3JsS3Va?=
 =?utf-8?B?Ny9zYkNQOTFDeEVkWW9jVlFNVlFRY1RISStQMS9uTm9QZ0FEWkVwMzFKWU8w?=
 =?utf-8?B?bnBuYzdzY0U0T0YxbFc0bXB3bFlCRDNCKzBIcnFDdnZSVGZxNDN3QUVtbHhY?=
 =?utf-8?B?c2JnY2t6UmF5K1BhNWY2ckVzaFUvTEVxNzBvYWI4eFM1aUV1ZTEyTEU4YmFy?=
 =?utf-8?B?S2E0dmh1VG9RNjBCUGdvdzhKd0E0ajlxd3JvRVN3NHR0QzZBdE9Ub0t3dDhp?=
 =?utf-8?B?eWh1Y2FKMVFDNG1jR1BsRFlWVEs3Y3Q2VnpXMXRvRWtqaEo2VkZHdmtpc2xI?=
 =?utf-8?B?aUJkdVJiTnRCamdMWm5xbkYzdG5WVU1zRjF3d1NuZ1Q3ZWtodFV1aUlldGpq?=
 =?utf-8?B?L0ExSXhGOXh6dlF2OFdPOHl0Q1Q1NzNmMWZGbWtRNVZhMWxCZTZ4SDE0Qmxr?=
 =?utf-8?B?TEtOMjlHbFBSQTNYa1I1Sjd4RjZzUk8raWRCYnYzenAyTkg5d2JuanNLZTJi?=
 =?utf-8?B?dW9YVXNOZC9rNy8wL2tySjdUTzJjY3pNZXpZSkxmZXRRQUhYekExQldVd3c3?=
 =?utf-8?B?K0s2aks1WS9zOFVtVU84eG8xQ0xrcUJFMUJjS3M4NVFkOVpjRS9KMzlaMlFu?=
 =?utf-8?B?Tm0rOW8ydFBDRldEYTNvWUtWRzk0dmtpNmVjRnhqaXFUemJHd3RYYU5SQjVj?=
 =?utf-8?B?YytSeE14T1RyL3FnVitwMnZ0bW5HOFZ1cy8rcHUxUWFEMkhyQzhZZHp6Mll3?=
 =?utf-8?B?VXpTNi9scTdaWmd6Y250c3NMUG9Namh6OXBLc2RsclR0ZGRqbWpQV1dnY1B2?=
 =?utf-8?B?dWh3NzFFcVVHQ3V6Z2dkYU56MGNXR2twdmdVZDBrckRNemZXelBUQ0FHbU80?=
 =?utf-8?B?NjZMTE0xK3dVcWl6Szh2VjhZb28xUVJRWmpLSXhqN3RrQlRCRXIxZ0xnd1Nk?=
 =?utf-8?B?dzdKT3RjcXJqcEJ0em0vS1dTTHE2bUdvUGdCeU1YdjkrMUg4d001R1A0ejN5?=
 =?utf-8?B?TWltdjE2VWVRM0l5aitqY2lGTzZyOEZ0MVFZSzRLenV1NWFweTBMd2RRbW5t?=
 =?utf-8?B?YTkrM0lXZmNaSzJ0RjZHZmZ5c25zV3NpVDI3ZEtlUUtjQTE4Z2gwUzY5S2Jz?=
 =?utf-8?B?blZkMmEyRFpEVktqb05xcUY0K3BIb1lmdTAzUHdCeHlIWWdHekk2Y2RGOHRX?=
 =?utf-8?B?UUxua1FCaVczYXJzYnFMSUNPeWhkbWVCSDdOaHh6YldxM3g2dkFuYzg5T0Qv?=
 =?utf-8?B?NXhiaXpOQkI2QjJOR1pqSVlsdk1Rd0NNandFNThYZmhlb1dYelFEMUFzUHpq?=
 =?utf-8?B?bDM0L2tBdEdKY3pvSXMxNlNYc3d3NDg1RFQweFRqemhFODY3bFVSeTRKaW1u?=
 =?utf-8?Q?uztOGKv/vkPCQy0ihmWijtj1Q8GzdhM9rac/aUTUuVGm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ff5a1a-f4b0-4bc5-0fe2-08de333f47b5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:13:21.3859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3ggf2Cdu8ILTqjSdZ6Gj7zNwb9gBgHSmY3yuakdoevUXWLCFZWIn3igRHqdd3Oa27eyAuxJwZd4QXNeWsQzxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB1A5CE29A

On Thu Dec 4, 2025 at 12:38 PM JST, Hsiu Che Yu wrote:
> The `Bounded::__new()` constructor relies on the caller to ensure the
> value can be represented within N bits. Failing to uphold this
> requirement breaks the type invariant. Mark it as unsafe and document
> this requirement in a Safety section to make the contract explicit.
>
> Update all call sites to use unsafe blocks and change their comments
> from `INVARIANT:` to `SAFETY:`, as they are now justifying unsafe
> operations rather than establishing type invariants.
>
> Fixes: 01e345e82ec3a ("rust: num: add Bounded integer wrapping type")
> Link: https://lore.kernel.org/all/aS1qC_ol2XEpZ44b@google.com/
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1211
> Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>

I believe I gave my acked-by on v2, but just to make sure it isn't
missed:

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Miguel, do you prefer to take this directly, or should I gather all the
`num/*` patches and send you a PR in one go sometime later?
