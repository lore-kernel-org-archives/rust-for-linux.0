Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022097.outbound.protection.outlook.com [52.101.96.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0A34071CA;
	Mon,  8 Jun 2026 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916777; cv=fail; b=nC9+b7TYiMOvRzQSFe5nteRC3QCWn/qEBFMoEBLuEliQv2r/coCjnIDoaqR0DeXe4GsE9pgQRd7QXukJT8Q75F+mhwTw1FK0MYUKu22tdKTK0hBLWg9pIcnEAPUh2GBdZdSfRtOuRIOyHXIs9NUH9Zhd7MsJhxMhG4XzLtlyn4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916777; c=relaxed/simple;
	bh=Guy7/rKjmeRPEx451mgy4CAWvZD1c8X+VGGF9/U46Sw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TZNeAZGQh6XMiC9wRzCcUxMKmhwRIu0/0tkVtCDuPvazAA1T1yBQXq5WICXQzSOwXk2C9fE8eQusHA170YyEANVy5qW9NEhfXp1fe0nkTWOq5VehtEccFB4fNNCEkXclb1EeRKzQRfkLW3Gdrwq3aVjr8hkOCFgnG23LjKxjjSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CmEL6ern; arc=fail smtp.client-ip=52.101.96.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CmEL6ern"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vz43SHoyekZbQYWBE+KrEcBeBIKkBMIJZM5Yd84YYCOdujluPuYh/9YIUwAZNNreON+lJUruMzu1jpljGV9HwJVJWr4WJRu6KuNxEfpa5mFkgBPmH0vgnU84ONbLuWpFLBn4YF0jK3LIp2LCB56G64X3rZa4EagqHIM4/rAra6Z6Fa3wWXeC+ZJafy7lwt1Tu7LrJMMkK+3l4Xvz5gdNCJYjVTikXpDoPEj6mwrWHBRIhIwHgbaJHs5SZevvsncAp36TR3n/pAN6HHdZP4EIxyni3g1yHJluvLukZPElUznC4xuMmvXImchV/N8pXAGvBuW+JVpKzGYM0X1v8Y/lmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0ASmDeEC+qJhXUGgAxCjfkMcZAusy0yFIBf4DPNi9I=;
 b=FrAwpvFiGO2Vc9uGg+ZBGiVmYsNjqDtifmQqkzK/4Fmuww1oJhia8eIX3EjEn/YR/M7A00IRiWziAaylHRYysR8HmAbmgzVMO5RDGjBPaBu+oGbiS1qj0kbBy6TarDi1vqPgEKzww0rCi7aaC5ypV4o1srkaSJ6h3bjc1Y6cD5IJtU0hs46OMByqf+jOEAJOKwvWZ+f/d8/TwadF8U6UhayH043K+IA3y1WehvD0jv7xPkgIut0KPSECjej3lgLbmKxL6ZRsAA357K70ViZcNGx2ErxgnEgKH7uXb39bB1FbuXek3M2+pjwkvoOdzinJsxLpQB8fDber2ZuEy60pzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0ASmDeEC+qJhXUGgAxCjfkMcZAusy0yFIBf4DPNi9I=;
 b=CmEL6ernzD6Vp3Jw2Uo2E1wwnK9OOoFDCerY+vNTdElCF6qA6NV5hVRq1POwHngf/J9UQdKXvoBC0ai7N/2WkFcNDNYCjg6683S3hcEAqKbFlzRBgq3uB/o/Q2z4zfp5DpEN5TNNuGcpbDgKcfXY3ZyzNlAt43IUqyJvo+WOX38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB1787.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Mon, 8 Jun 2026
 11:06:11 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:06:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 12:06:10 +0100
Message-Id: <DJ3MB1PEH9VZ.AI5V2DD2EXTP@garyguo.net>
Cc: "Dirk Behme" <dirk.behme@de.bosch.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: add a wrapper for the `num_possible_cpus`
 C function
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>
X-Mailer: aerc 0.21.0
References: <20260605-cpu-helpers-v2-0-0ad227f0d91b@kernel.org>
 <20260605-cpu-helpers-v2-1-0ad227f0d91b@kernel.org>
In-Reply-To: <20260605-cpu-helpers-v2-1-0ad227f0d91b@kernel.org>
X-ClientProxiedBy: LO4P265CA0278.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB1787:EE_
X-MS-Office365-Filtering-Correlation-Id: b11ffdb2-964e-408c-693f-08dec54df2e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|7416014|921020|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6tgoR60V0IIzZIIpBGDZEuxY2zHVehEY51PuPpxFmTdNI+nX0rDCXBlTGrpGGd4BFIw55XrOVHp5EIVj6GRYWr3JF/9fneqf2Pw+DCc6sBEc0h2fK0IJNZB5824OmhBIgu803mYXYwzK9sFCeb2RdKfFspvfvsx2Psxvl6Ecm5pLk9P+RzodJanX532S3fyiE2GBpM1hNPrQMYDFTQykiYxq5rQL7IhyeU3wBWKLRuU5wwyzbwGXvKaJzpu6IMrHbI/hic6CPAbOEiMqIZvY/+/VRytDOTPOl++6QmloU7sppDgNorp5xNpLv+HnStu1rcOurLIW/0huvI6EZ9i+fyRenTegba6dR45vTF0EZ3hSHdI9jFMaT3MjMfDeB7wE1YKwIFrSA2dtGNGXSrJjSa0RZJpBzeIph+DMJTVyNV0jqSr18ajx/oIdD1oNg6P1gkhlnK2MasZckuBW8oi7rLmBeJNG72pfOPAFeOIbssrDbTHXXeCNVOQqqBU2t6hBk0iSfGjcDyO6tEavYtXJqxqMuwt1gk663+e7fJas2h/9N/KQoWdUR0ZKBR6tNC56lvyS5+d8GDWWVyMlk7f1z86vurlQ8rA8/u/bX7fvT0xy/NDYjvgebZ0qNxHxc0bLGxWvseAauCyd1Qtf/TQwvzekjBF27Ho0pJ259n0K6NWiSCKXvKTyuJUU7+yagkG5scmE6kbCc5TKscMZ4Nwd1yTGl+Okgxl059bpWrhBY9Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7416014)(921020)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUp5U2ZtYmRJUktHWlZPM0N1UkE4NlhMZ01Sc2JLTWs1R1dJQW9SNzI2bFhi?=
 =?utf-8?B?Z0Z2VGMxTmpndE9YdmtVa1duVFlvVG5aQTkyam1tL09wS09QQkN2Q3BXdm91?=
 =?utf-8?B?NGppT0M1SEZRYzNYWkltUndoeFNoSGhvZDQ3cEF3bnZERmdQUDZMMjF2QWQz?=
 =?utf-8?B?eG5CMHZPUmtkOUtodDN3c3VWbXlGRzFEUVMwRjF6RU5VWEROZzEzVm5NOXRV?=
 =?utf-8?B?WFJIcG1sV3VXRkI0SEVSdjhHUWt4UzM4NnlYOTJRMkdVTm4yUllxekZUZFRm?=
 =?utf-8?B?THpSL25Bb2ZJOWFKOWxXNUp2TkJiY1BYZDk5UFA2eUVLQ216YUZQMFpqTGRQ?=
 =?utf-8?B?NWJzNnJrdVVXbG5kNXRtRVBqNTFjckJvazExbXBUQ0JoWlZoYXZDS2N2WFZJ?=
 =?utf-8?B?YnBjeVRWRXUwOXZRYXphTldJNFEvVVBXZGVQRXRKMS9NdWRnSEZiMFhOaHZP?=
 =?utf-8?B?NkVkU3ZQWGxUY3BwdVA2T3h1d1hsY2s1T2NEdExFTktBU1lncHdNQVJBN1VF?=
 =?utf-8?B?ZCtUaklnYVkwU3pnbTdaeHIwM1FHOFpES2c4cTRya2RuWVVMVlBRWnVMeTB5?=
 =?utf-8?B?R0twcmZEaFNkSnl1WUFzSmlkNm1TM1cwZzI5dlh1TnBiVldMZS9pV2xSZVVm?=
 =?utf-8?B?UUZncU1helBEZHdhaFllaXk2U3JxY2FNOTZocVR0UzJBdTJxSGRhT04vZytz?=
 =?utf-8?B?WGs1aGpmaHNTb2laQmRlTVNuQVFEOXhlWUNFcHdXYlk5Z1Vka0pJcXRrclJD?=
 =?utf-8?B?MS9FSW1aK1Rtb0R4WDJYc2oxYkJKc3VnM1FlSEsrZ05ZcVRaQ3l1MEwvRmU4?=
 =?utf-8?B?d1dIOGxaUGFxVnRyTmhpeG5qVG1vR0pzTVczbmhtZTF5cldvWXpZWW1yTzZo?=
 =?utf-8?B?RTc1RGNMa3lRakdndGdZUlQ3dExtbkJ5d1dQYnVvbDdhYjZWQytyWFYrUzE1?=
 =?utf-8?B?bHVxSTdrQWs0SDZMTURJQTl5aCtpcUp2bjBka01GK21abHlrUkdJMzkxZk9T?=
 =?utf-8?B?RDZlRmY2VTFvK0I0bktTS3JTMjZXY3BNbnBnaDkwRHI5Zy8vZFFVNXVUNTZP?=
 =?utf-8?B?RTdJVCtMRG5YeWFyaUZOaVZkbHZRem1xdkdKdUdrWTZpZnVDQzZZVjZRL0NB?=
 =?utf-8?B?aGtyaUI2eGx4a25LRGgyaEk0RWprYTV5KytVMjkxNHRjbXZXTmRVL3ZpTkNR?=
 =?utf-8?B?OVNYN2Y2VDVQTUltVEN6OURHOGU0UXB6QS9BRUdsbHVKSHNNWU4vZUtaNEEx?=
 =?utf-8?B?OVdYVkFOdzN1Q3llMWN3ei9Yd29YZEdsNW9aODVMSzcwdTVyY09aK1hrV3ZF?=
 =?utf-8?B?RldZaGxaM1ZsSnZ0K2RQNkI4d2g0YmhyWmt2bllhT1VFM1FUeUk2WCtsM2RC?=
 =?utf-8?B?Qk43Qmd2MlFCV01pbG9NUWJRZUIxWFBxc3RocTdwcFQwVmMxSkwrQnBnNnls?=
 =?utf-8?B?VnhzSkNqN1JDSXRrZzJYSXV3TnIvN25pVDRKcDBQVGFCTm9Yc3VlNHRlWncz?=
 =?utf-8?B?Q1RXYUx0UVR5clFwU0doc1BlNXJTL1pqcFA5U1l5V1AwVFJteHcwZnNhWGVT?=
 =?utf-8?B?ZEV1d1N0cUVHeWdvWGh3Q2RIcytzMkw0bFhMUVlEOWNZTDdxbURoNm9WZVBr?=
 =?utf-8?B?Y0NrSmw0K0ozeVd0MHg0MUNuQURVcjBXRENGT0QyL3lxUmg0eEtlck03ZmMr?=
 =?utf-8?B?UUc2RkZYZ29wM016aWVqeWJmVzRCR0NyaU5Cc3Q4Vm9BaENFK1ppYkdaR0ta?=
 =?utf-8?B?UUVkZksxeU5rWkkwQTVIY3V0aHpEWGtZS3kxVGxoRGh4Wlc0cmowVUN1elEx?=
 =?utf-8?B?cGFIWDh0N0Jod2JiYUV3R09uZjlCb201U05VQUljT0NNa25MQ0lML2cxS1do?=
 =?utf-8?B?L3RXV0ZGekdweGZMaDZ4MFV1YTRwV24rbklTMmU4NnBwWWN0ZVNKOXB2aFhm?=
 =?utf-8?B?TWcvVU9qc1VHZm9XUWx1KzhLdEJVd05kRG1QMHpWdG5NRG5qUGthYm8wb1VI?=
 =?utf-8?B?YzFPRWxvOFBwL3RLZmRDTnRPT0c0eG9ZenJGWUFnWXp3aEdhRDVxVDNIb2pw?=
 =?utf-8?B?SDNDVUdYL2M3NHhYMTVXbFBYZ3h4clNYdEZITENlbStoa2Vad3FzMERKc0Za?=
 =?utf-8?B?S2tEbHhrcHkrbnhndmUrTkI0UVUraUdlMndidHVCV1JjZDluYkFPQmVzWEh0?=
 =?utf-8?B?QTd1N2ZzY1hTOC9zRFlYb1JuS3FjZFBsVzhIWmRwVEY0aG10aEhXUXZTOEg5?=
 =?utf-8?B?TExVK0g0b1FVMVZCZmZoMzZNMEgwTjlaemF0ZXJ4YVU4OFBiWlhsQWExeU5M?=
 =?utf-8?B?cUZWY010b3h2VVZUV0lxaldmYk5tbWJLYjJMSkw4L3pzZzVIaVgyZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b11ffdb2-964e-408c-693f-08dec54df2e3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 11:06:11.2337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhiYqzeLC6/eGLJilC9vCekSPWjf496mbISSdBN6DPgRkii8L2RDff+BE13V02zolcvSst/dDHPa3x78Z3DmqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1787

On Fri Jun 5, 2026 at 1:54 PM BST, Andreas Hindborg wrote:
> This function returns the maximum number of CPUs that can be online.
>=20
> The wrapper is needed by the Rust null block driver.
>=20
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/helpers/helpers.c  | 1 +
>  rust/helpers/num_cpus.c | 8 ++++++++
>  rust/kernel/cpu.rs      | 7 +++++++
>  3 files changed, 16 insertions(+)

