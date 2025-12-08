Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010010.outbound.protection.outlook.com [52.101.56.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A04B2566DD;
	Mon,  8 Dec 2025 04:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765167326; cv=fail; b=h5DVMip9HtyYsj1IbM+xnBYr+Ww7wYSPJxIrxMHE7pUcIkziypJ/IKuVvvfej21MfDj9Ojnoj9BTY0uYTGaMdJ05bkn8nPmKb42Rhn4lJlmJxlj3O1m2CdEyYFw72J7/DTCnkjDu4ts2sR98Pop5k29q+HnJ1yqTDTNE7KlxUzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765167326; c=relaxed/simple;
	bh=fChWRV+adSN8CrUS37Uu/V91yDPd7ViUTDrty3XwOaA=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=YoOYvO2eU3iQTM+JgnzlvTjwgH40NeWL9NaQkvaxzfGDJaRNewEn45jhdnhE5zj2FJKBw2IvajskbOZkkuO4Kb14rLlpg/FNZ5U68MbUXyGLESkF9r6ZaETt2Dcz//LVXidKWkpvQm/rlWR7opwws7YVu04JpwZck6UxkvgTrQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wy0Ca5NH; arc=fail smtp.client-ip=52.101.56.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wy0Ca5NH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snTWhUd8XZ3aKNw9Zlg0AnmF7ATPVXX3K+44ENC8mmmK+t+VFULq/lF6bqf5MFX3K7CaNfN2q1AhOxQ0ZXR0PMImob8ht6hdw0flMaPSUsVr+sSeSmfaZAjHxmuRbudfR+g90skSjLYn5BRTvZKwR9JIFO77WwATm/6Xdsm+I4BX3NGIZmXWIt8nNynfZ4RT0FonzN4GjabNcgUYtZehqYsnGaOWlL3f13sXdp512BdCUc2Fgb7Z9C5BWcHeCiZ9zrzRKJxFqxT3SAD+Qz/4Pp+cVBluZaHZnmE/cds/HbigShy5gTONYiqhS6nSsRKDwwrMf7CUXLgopZLekwulgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcSR6s73ulDOOloBJdc/ct7Ym4WK33cVyDifVP3WByA=;
 b=DPYqMw3VAiYlGcKGf+R4MdPLkxo04XMfLWYQAmOIcjsnXRMzVuxPE5+0VY33fZ2OrYmdf3Qx4ihS4cGM1dV4sbsqkMZJ8U6niAubX3fLTnm6PIe0k81pP9GW94eKkbyCoJiVCUq73ccWIMRYB5sWjIvx0ENcS9quxb5g6T2rqZd8XNC9atXeaewnVnEUj/+T22Z6UY2VWxlY746Tavnhpm/MJVabMm/iLlYk2F65s8PsNnq4mRiF7sA3oSHmX8iKzLqPSA/ch/JG+auegWD3y/T2+11X4d6h3lGF/0pFSwSuEd4K8Mz2VbCdGaRNbRPhFD2s9GrW6sWyz92y/X04Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcSR6s73ulDOOloBJdc/ct7Ym4WK33cVyDifVP3WByA=;
 b=Wy0Ca5NHmJl0k9Cp5pTP0Tr7x1Zw32+XhvFsf3oLjjFtF9gK4v8UpTLbKQlF1ug/SF0BILAIxYrNZx/Ht4Iqb0E8p+7OPyFSmUKr/z2d3gCWM0rqXMU0nNFKodRyPRMjOHPPQnnDrW8FFTU1njaeJjd7yY3sKUMPg8AC0xAfnlGr+SZffrA2JSOFdgJQIyMx5nFcXyBvc8otKA93pK0Qcca/TWBqHDVZHd4QlceG0PShPK0qRuG7jsnNEYZ8dAfCiVzsWBIrjMPnvpMtw3UJwMB8ENhELZsSClSdZeQVrHvEqRJiNFKwFidUIs0QIdQF9AH1uKk8PLiVwgioXR7SXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 04:15:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 04:15:22 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Dec 2025 13:15:13 +0900
Subject: [PATCH] rust: transmute: implement FromBytes and AsBytes for ()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-transmute_unit-v1-1-680c7386b5d9@nvidia.com>
X-B4-Tracking: v=1; b=H4sIANBQNmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwML3ZKixLzi3NKS1PjSvMwSXXOLxCRTi6REy1SzVCWgpoKi1LTMCrC
 B0bG1tQCLGni2YAAAAA==
X-Change-ID: 20251208-transmute_unit-78ab58ba9e6e
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4159:EE_
X-MS-Office365-Filtering-Correlation-Id: c390bb93-5ab7-4507-d67f-08de3610677f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDZxY3VDYTJBSy83T3B1bmtHclFkdXdGMG54QndhcU5RR1VINmxVbkxqRHdW?=
 =?utf-8?B?MGs2MmFkMk1VdWhZbU90bk9FK3M5K09hTCt3ekZRaWdUVmRtUTkweDRYREFo?=
 =?utf-8?B?NGZKdGxlR0JveWYrSzd6SkFhSVVPU0VFcVJaM0RORzZHN3FNME5DRmphU1J2?=
 =?utf-8?B?WFNxYlQ2UEpkbkZVQ0kzSlkrSno3dmhUTUFqdVd1cTdPN3k1ZmZCZjZTTlkr?=
 =?utf-8?B?ckhobHZ6TW0rd3d0bXV5RUk0T01Wdm81LzdwbjNwcVBOZWw4ak1WRVZOdlZK?=
 =?utf-8?B?NXlueVBnQmt1dWsyRXFFS0U5eEllMnBJcThab1ZLVkNFVUlOeExkM05tS0xi?=
 =?utf-8?B?R2JpR3Y1SGlhNTZScmEzcTFnVjlEdCtxNjd4ZWc0c09VUzc0elZtYTBvb0sv?=
 =?utf-8?B?L2Rob3pCTDNxVUZzUlZDbERSR1BpVUhtNlJ0TjI5Qm9tNlVZeVJza1lIdzFI?=
 =?utf-8?B?SlpOTE03a0szWldaVkRjenI2OEcxYjNLTEx3QkN1OXpaZ1E1L0xIQXhsZm1l?=
 =?utf-8?B?TFNydEVGbitsbG1VeFMwR1lUUGo3Rm9ha2Z2WlNiOHNnMm5XSDhaY0JYYmtk?=
 =?utf-8?B?aXJJbW5PNXBtNmducWhXVjZNMWFUbm52UUo4K2U0cTIwNGcxcnQ1dEtKOXFY?=
 =?utf-8?B?OW5mSWp0ZUxqMkR4TUpzRTZiNEF4OWxwUE9uV29ZczNYZjdKL3FPUnhORExt?=
 =?utf-8?B?Q1VOVjBGbVFJazllb01BVXhSSmNzOXlTS00xMTE3RS9ncU5ETnlnUUZmVlZM?=
 =?utf-8?B?RDZESi9lY3ZaK3dBNnBnT1JMaDJWZitCUFRWZDZKcTJlYUZWWWkvdWIvbXhS?=
 =?utf-8?B?YjVwQUlkcG53VkNNUGRVSHJSUFpmeXQ0R296bTFHMVV5N0hkOUY3M0FtNlU0?=
 =?utf-8?B?ZnJKUHFHalN2ZlM2ekRHL3A1NkZJK0RCZEJBejN6UjdlL3Jpb2xieGsxRXJF?=
 =?utf-8?B?SjU3UkVIdFJzaFc5aVRMaE52YkhOWlorU3VJV0g3cXRoTHNtTDFxeTlxTWtT?=
 =?utf-8?B?MGRLdzNGdkZXY2NPOVhhb28xeHVhUnozVE1HZDRLZmRHTDhKZ1VwMncvV3lP?=
 =?utf-8?B?OEtlTUxtb1hCc3MvZ25BSFNXd0JGN285VXBaeDhBVWZ4ZTNLZysrb3lJM085?=
 =?utf-8?B?TXRiUERSMkhVdjEwTlVKMXBsWmFMdjdjdi92Y0E3a0E1ai92elZydXhhWENa?=
 =?utf-8?B?NnZEWW8xcUtzdTQvM0ZmWEovSndRU2p5SUpVQkhRTlJvN01tUGJpVXhqNnE3?=
 =?utf-8?B?anVPbncxTEpzQ3ZrbU8zcnFyeUlteUc0TWhucWpYZkE4cm5XaUZYa09QUDFo?=
 =?utf-8?B?bjlwb3FaelNKQXl1UE44bjNpaDZnRWlyYkExd2JES0xUZUp1THRBUEp0RTVs?=
 =?utf-8?B?Zkt5TWk2dmVRS2dMNEpLeWZZUGlNblRaaGNZN3Q3K3FxQ0hWUTlRS1I5bHdR?=
 =?utf-8?B?dkd3VThlWFFrcUdxaU94SGRXTTVvc2lCempodFFEblFFZzR1cHFEb09Cb05n?=
 =?utf-8?B?UnR5dE9pblNCMGpjOXB6aWNCRmRobDFteGxjdm9kbFR6TjZhdWhrVDd6QlZN?=
 =?utf-8?B?a2JRWnNTUHcxNGpkaW82STkrdktKa3NkZkJoakFzampJdUJXazYyNnpCcXR2?=
 =?utf-8?B?TXpYNUJtMTNyVGo3NmFFOThtRTVUVVVmTjcrR2tKZTY1ZWNEdmY2K0VacTc4?=
 =?utf-8?B?V1hlanVPdnpMMTdtWks0VEpjZlpTM3czTm9iZERFZEU5R0w3Z2RkVVZ4T0xE?=
 =?utf-8?B?OTVyWmxneTdKQzA1OW0wbm5YV3BsUG9qcERxMVJaU0ZWK0ZxS1U3cWoxdU9Q?=
 =?utf-8?B?eC9pK3U0dDh4M2NmR2g5TG0zNFdRVnBXNWRKY1hNK1pTM1QwcTVmOXNoQVln?=
 =?utf-8?B?K1R2dkdUYkg3UjRGbkNIYW03TlprWnBoQkJqdEdVQjM4ZHdzNlpvdHJZbTV3?=
 =?utf-8?Q?gvuBz3wiGlfcZmX4DK45RfhSV4jK8PYu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TndQVzN0bHVsK3BzODFDSVdrby9RTEh3UFk0R1JsNUYrU1lYSWYxamVONWZI?=
 =?utf-8?B?QXdTTXo4MFF2TXJIZVQvdzVtUUVhbWNzbUJENFdaNmxQeDcxNjZJN0xqTjdj?=
 =?utf-8?B?NUNwQ3ZqZTRaOUZRV0UwVWNuK0N3UGFyaGgxQW1rZElqQ2RJUkE5N0FuT0Vh?=
 =?utf-8?B?MERhamFsR1o0RGdUOHQ1akFiVnRwa0ZHZm42dXJVMCtZS0U1emFPZTVVeEtH?=
 =?utf-8?B?SVpyenlNcnBIL0dKLzRqTEp0T1crUk9xdXFUTW85UkxSazJJc1RveVFOSjk1?=
 =?utf-8?B?RHlFZGxSOC9jRzIzVXQ3M003MUZqd1BQU08wRFlLWDc0N1djY3lDNDBEVy8z?=
 =?utf-8?B?Z1Y2enZHMlgrYlhpSUJ3QytuNzZxOURuSWlPelR4MGY0U2ZacXQ5ejR3RGtv?=
 =?utf-8?B?R29FcFo1STZCMEcvWENDaHlZMm1PNmlNOHFHeDFOWlE5dHJPcGVIVkViOFpT?=
 =?utf-8?B?d3VlZUlsckRRMmpRNGhMMGJ5OXcxck1xMm1SeEZ4RFkvOVVPak5CM1krWkd1?=
 =?utf-8?B?ejlXOXlBZDVqamFpYjRnbENjWXg1MjAvRCtiZ0hOS2tsb3JnOC95cE02OHho?=
 =?utf-8?B?QmRWSUNoa0pEK0F4YW9mdXl1cHpDNlRFblRoN0UwaENmRWVhc3pBMTNIK05a?=
 =?utf-8?B?bVVuWm13VU9IMHpoZElEdU5tSHVqY2hoMGF0bUptRE0zbDhLRHdIK0g3bnpM?=
 =?utf-8?B?dHBUQ09XRTBEeHJkSG5rWFQ4OStsamNVeGJzZTdWSXJ1SDZoYzVHV0tIUVBB?=
 =?utf-8?B?dWxMQ21TNFFiWHVYUklpcGRCbVZidHdEc3RXREcxemRhZndqTzR1V003VGdR?=
 =?utf-8?B?MFBITVRycjNQeEpNaTBhMHA5RXZ5YlJCc3BlNXpaZVhtblZJMGFpVTFnVHpm?=
 =?utf-8?B?MDMrQ3VQQjF4bkVTM1BOWnJKZkVJMlJoUEJrVlR5eWhjU2x1cGY5K1ZwNXJD?=
 =?utf-8?B?RVZFSDFXSFp1dm93aUpzVExaWElBcnc5NEhXVGY3SlNTcjVJcDMzK3A3T2lJ?=
 =?utf-8?B?dVlpRlRMVENzWHUxMWExYnhBQ0htZklQbzk0SzhyZktkUk90YjlDNTB1bG9N?=
 =?utf-8?B?eEd3RVBFR0Z5TkZaWGlnaDBCelAwdyt0Nlp1bDdxaXltRk11YmU1MkNiVStz?=
 =?utf-8?B?KzVWcytMeGlTcGJkZXJnQytXNzExM0NMMXBORVZmQklpT1phSExsVm4wMVI0?=
 =?utf-8?B?dWhubmU4YkNEUzBSMlBNK3VOdFA0WWliYlRMc3JDOXBMMXVMcmVZa2s0aklO?=
 =?utf-8?B?cEJQNm01RWhKdUJPTzdtOUMyMExoV1RaTU9tY0JKc0l6RGQ3YURvSTJvVklm?=
 =?utf-8?B?bGIzR2Q4L0s5Y1BsUTVtMnoxYklGSFllM3dLMmtzZmRVTElhd3k5TWljM1E1?=
 =?utf-8?B?SlhtOGI0VlBLajZyT2RaWVAwSkJRL1M3S1FCVFQycVNHWitOdzhDakt3Qkxw?=
 =?utf-8?B?M0UxbUZ2bUE0SnJ1M1JEU0pLcm1XNUcyWnE3UzVOSVJBK2ZkZWdGaXpsWHoy?=
 =?utf-8?B?WmlEdTBiMnBlaEVwNDNBU0VVY0RKOW1kL2hJMWphT292TC9LakRub25WNFlz?=
 =?utf-8?B?Tkw5YzFDNGZnaG03UEgyTVF0OFM2OU96endYT2dMcStPSUJRTjJQQ1dxZi9h?=
 =?utf-8?B?M214cFZFT20yd2tFdFI3VEpydFdPMTM4UlB2Zjc3Nm5GcytGbXhqZi96ckRk?=
 =?utf-8?B?N042c0ZpSlovcDFzekpHaytqS3o1RTJaNWJ4WmZsbnhqN3JPS0ZKcHB4SGZG?=
 =?utf-8?B?dEI2TWdEeVhmRHM5OVlPR3YwMXROZ3FmWVRIY3l3d000U0grS2s0bWg3MUlz?=
 =?utf-8?B?bmJvLzJPWlk5T09sb3BaTmU4TmkyZU94L3Jkc2F4RXVFM1k2Vk5GR3Q0bEsv?=
 =?utf-8?B?RXFRbnY1ZDViOVpEUXhCeFg0Ri9DMHQrNFNmdUozSmptc1YwNWhIZ1dEREJ0?=
 =?utf-8?B?T0FnZ2xNdVBjbjVhRGtyeTBCajdVNkJka1JGMkVJZkdudzNuc213YlFXK0lI?=
 =?utf-8?B?d055WWxPZzcvbW1sQkdhcGIzV3VQbTBUK0FqZ2IydXFMVlErb0VxcURucHZa?=
 =?utf-8?B?R1FWaDV5NlJac292bGEvdDZJcGZONjQyL2Z1ZVA1dm16aE0ycUJiaGNQd3Fx?=
 =?utf-8?B?NytFekFmdzZWN2srdnFKWkxoMmlaRTF5ZjVUeVF0bTI1aWFvb2lPMGhRTWt0?=
 =?utf-8?Q?60Q8FHOBuje26FLT/vjHeelxwrh+SP7O2EJs6zb9JGKI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c390bb93-5ab7-4507-d67f-08de3610677f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 04:15:21.9094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18xIjgUOxRQKUwecIyunopz7QCuvmqLJSSANj0/+gjuAUkIluUMIRQGeus5Js+FRwKPNsRqp1K+9wWWPp0G3tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159

This is useful when using types that may or may not be empty in generic
code relying on these traits. It is also safe because technically a
no-op.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
This is going to be useful in Nova's GSP message handling, as some
messages are empty and we need to explicitly use an empty structure for
them.

If accepted, I would like to merge it through `drm-rust-next` so Nova
code can start using this feature quickly.
---
 rust/kernel/transmute.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index be5dbf3829e2..8d78c81e3749 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -170,6 +170,9 @@ macro_rules! impl_frombytes {
 }
 
 impl_frombytes! {
+    // SAFETY: This type is empty and thus does not consume any data.
+    (),
+
     // SAFETY: All bit patterns are acceptable values of the types below.
     u8, u16, u32, u64, usize,
     i8, i16, i32, i64, isize,
@@ -230,6 +233,9 @@ macro_rules! impl_asbytes {
 }
 
 impl_asbytes! {
+    // SAFETY: This type is empty and thus returns an empty slice.
+    (),
+
     // SAFETY: Instances of the following types have no uninitialized portions.
     u8, u16, u32, u64, usize,
     i8, i16, i32, i64, isize,

---
base-commit: ba65a4e7120a616d9c592750d9147f6dcafedffa
change-id: 20251208-transmute_unit-78ab58ba9e6e

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

