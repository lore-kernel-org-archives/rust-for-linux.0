Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022115.outbound.protection.outlook.com [52.101.101.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5370118DB37;
	Mon, 20 Apr 2026 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701833; cv=fail; b=q+NEwX9dMS7/bfotsp/uN8lwo7e1CT7XVtgEaOTmxFGjhs1x/sWoTiBUQid4EXyFfcoopl4TGyAOcffVgNycAxtPgXoILAVkO0CwqqCIPCwJwZHvAVD3ki1SACQrznkXc3jtraqvESx4SqV4BfYbbhr+LwpodxW32tJJNN9EM/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701833; c=relaxed/simple;
	bh=jgRkMTH/kd8ZgL3qADblBnrTgydgJo7hpXCPTxd16p4=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=pwb1J7hYKISfdtVuzWmbi68N/c5Gt1xM/Og3iD9c+RB5IKtwPHigyJPT0+f3DRRQQt2m6aq7A+aLiN277s3t/bV07h7NwqKYLMwIKdZG1AusQkxvAbi4HJCMZx/6ZmHWaj7PkY5+/INK8jnZ5XlybngvWjHqOd99X79Grmin4QI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Bnmj+tNT; arc=fail smtp.client-ip=52.101.101.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Bnmj+tNT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKnSS7k0m4UYsTIvhW8eBUO4a8EJWa2YFjfZoCBK95PNpTBkkBSfO/0LV+aHi2zCjmlSWjiYqS1k3QguWtyIKuplgTW/XoGTiM0MBx6ZuLC8Rt6ozSw96DByvbmNefLUjil2eCctcmI0fAysj7IRNGJQOxbQG6MdJ22dDBawt6FZR6UrgVijC/ME6khgqV/6PVbn/QeTJxblkqCsIHxwE4TKlChuM0jbIhOTJucgLQ58UqS167Z15mHOPfx3ywDZr5BvmdEWXm4WATul1cUHUz1R53isGD730ERifz7HwWVJHy0z9hW4mlwyZzcRflupiWhSep7iIlPtRJwcbIT34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LryldefBMp7g8KuCkWX34TIKNSu8Ud6JO+u4wktrd6o=;
 b=ukj/xVn8u4kzCUW8Quhiz3r3QT/FzbVtqB81ia+TgABDHIeTyK+DbXX4Y3BngJ7mKSdepHS9aYnwPGrBndQ4FVwM3ihP+GyZW4RS/bWfstRo7sLwvf0u6L1y1NsLw5htLGjb1Ptfiw9Xw2XsoZc6bCa4VIE658Ia1pY6O5u6DhS0RJc/MObosa4rmuj1CjdJ0pYvHYt1iNn9OwZHxRJOnIDF3COygdFgkQxKAwrx6QvARwZuJBBvnInI+7KnOHKQqTRlCUAfBpJoxSBnp3Wt+Wo6j2afBqo98DitqBpWL3N7VukwpJbh3vuqaTIJrzNOWcDJt5ZCw+5acxCZi1z+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LryldefBMp7g8KuCkWX34TIKNSu8Ud6JO+u4wktrd6o=;
 b=Bnmj+tNTj3jZgsdaeaJn4QZ+dvj/3CiTsZcIG3hZIopXWm9rJ0rqIh1LYo5bNSdrXgKzjzAuFU+QpwQ6VJ+6b+RQ0u1k6n1V+GsOApVVocRKdFo+951yymoDP5DaER+miHMhRKRJ66CqwpGNFnJQuBAl1hVk5gWYJVCfTk9mZwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2486.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:4d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 16:17:09 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 16:17:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 17:17:08 +0100
Message-Id: <DHY48G2AQ2OJ.1L93N5LJV3XMX@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 04/28] gpu: nova-core: add Copy/Clone to Spec and
 Revision
X-Mailer: aerc 0.21.0
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-5-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-5-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P123CA0094.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2486:EE_
X-MS-Office365-Filtering-Correlation-Id: bef941a3-1e70-48aa-ac11-08de9ef84579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Xgruq8Ub8XQx47rRqs7pym2gA4d8NrfKBcg3WzvcWLy3JPOnqWOL/+T/eCV4JKcwBeC9Pq5ckoa145qJzYtTEP7HDJ+4HmcKqFu/zReMwJiDIy6B7KScYEE4+5SlYmLZj9BwIAEb4415UP3MC2D9b/qIntKpQEaO1tSzNrJQr7Sppbws/pj0P5ePHHZ4W6yCqCQoWFsXn2WepO4bWSggSq+UF5jevV73MbH8jhouSMOWG8fbTqOsjsPGTrwkONPyuSuxnrUBzrWPWcTdC+Jt+y2SIvDvnzi4EafjiyQxg1eCc+rFhv69iADgwQ6A4fG0gd8nawoS3q4s9MigCGRZFS6191LTJHsI0E9xJG79pUxOT7alPyf0S6Z+WuPl/m4xQlcOch3OCcJaph6QcoQTT7qtYtjkcIo85tDDcbkOPKtx57q7vOnGb99rgDhfuwBWt6Mz3wHUsJPwKSK2H+ldEBs8nSfL2+u3c5csy6SjfeXpq18jWP3kIYFjBYVguQj7OUTJoNr1eztA+lVZ7dqhfdJWUjhGuXfDDSzuRjNZNVr7FgWtLV9yZcl/6E4OugcB0QGl9gJUim1MQ+4NrttrkiYRrzoTvJfgw+LwoBy/DO2CfZxyoc8Ykr6xTssz/oX0PiHvfHweXpinu+Be5s7rpaVaHr5PKvbFZLH7XaMIejgBIykyzZ4UF9vffURnWF2XMGT1GR6ZQ3m47Uwg/gvyd2jmzcbdA85iFe+ogtnxwBE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MytVNk5FMnpaSHZuRFYwL2Q5ZWVKSEphbVpuM0dYZVlFNktyK2EyeU5MeGF1?=
 =?utf-8?B?M1o3eVY5SGJPQVZ3Tm80UHg4UnFWTDBNdzJaRE1sTEpnemNKR3BVV2p4RVhC?=
 =?utf-8?B?NktDbUVhZHBVK0tHUHFObzVWUjVFNUwwZkRDVWd2WG5lTnFTdW9LMk12ZUlj?=
 =?utf-8?B?Zk9UeGhSeVU0REFwSDY0UGJQNlB2T3g5MkZpMldlZU42MHRqQkxMbWQzbWw5?=
 =?utf-8?B?Ly90U2R3SG9iSXZrakVQVjYxQWpibGdRczRRanEzcjZxbERwZ3MwcXBuWG9s?=
 =?utf-8?B?b0crOWJGNXY0ZEo1R2Z1VlNyVHZkOHBjd0ZnT0FIN3ZqdmpkZTdpWkVIMTZ4?=
 =?utf-8?B?SEdFWllrOEJ3RnplQ3l1d2M5R3EwajlWQjJTcEJMYUZzZW9DTTV2SC83czZ2?=
 =?utf-8?B?R2JZY0xYcnhJSkMyT0JmUTF2OEp5V2FtcG5FQlY5dGswNTJzZnNZRE0rV0pT?=
 =?utf-8?B?YzZ6R2gwWUhqSS9GMXVVcitYVW9FQUJZTHFoOUdmUHJ4VDNiai9Ia2I5RHEr?=
 =?utf-8?B?TXJJYnN5blE4NzVETlBGVnI3dDViLzBqYmZyNE9pbHVGaE5mWUUwUUNzN0d0?=
 =?utf-8?B?Z3dEZ2t5cUpFQ2ZwVzdwbGlTRGpEQ2xyOUJ0d0ZQZUFnVC9VVWZNdUZzc0Er?=
 =?utf-8?B?a1pTWkpmUUpleXJhK1FKUjl5V2N3c29FMkRGV21nZGI2d0RSZ2E4aDlUdkNy?=
 =?utf-8?B?VTZycWJqV3FDd1VQOUNLM2xIb2I1MEJwMGFPRHoxKzNiSEpQVkZIZ2RqL0Q4?=
 =?utf-8?B?amdFV29RcjlKM2NnRk52NDB0TWdaUk1nWlFwL3lZbUc5VUZUS2VuNzBGcTl1?=
 =?utf-8?B?WkpjeTdiTFNoR0ZZV0FDSGpVZWZhOEFtOG4xUy94M0VyTmFmTFVxVHl2cVF4?=
 =?utf-8?B?dTN0R0xYMEJDL1RZMHZaYlhMbjZxY2lBK3pQT05GTUpoWnh2K1JPWnFxdVlB?=
 =?utf-8?B?NEs2ZUV4T1lkaW9veHJvK0RRSnJGRzBVVHhxblhsTHFhc0hCR29jeGZLelNK?=
 =?utf-8?B?V2dyRUZVRGcwSkVLalJ5S1FMQ2JZMExLQkxzd0ZzN2w3R0R6WHN3bHd3SURK?=
 =?utf-8?B?UGdxdTdvaXU5WjA1bUpoKzBtVW5SUGFYUkdjZ2F1MTVzUDdBcThod0VqdGhw?=
 =?utf-8?B?T1JZVzBmZlZseVdncSs5QVY5T2U5N3RzTy82OXpIR0VFZXkyZkVBVWlsYzRu?=
 =?utf-8?B?VUg5a0NXd2FEWWtncGlsYmlUKzlyZHRIUURtVlJLbzlLY1pDejlSQk5BS0pZ?=
 =?utf-8?B?Uml2Wm53MVZ4SW1mTi9hRXdSVmFFOTh6dzBzM3RFcjg2YmRTZGx3d1UwLzZx?=
 =?utf-8?B?MVE3elJBM21SS1RBUXh0eS91WWxWbHFUQ0tPVWdGUXdwM0s2TXJSbVNZSFd2?=
 =?utf-8?B?N3FWejRKbndXaUVtTTI2VE5Rang2b2NyRmtsQ0JZcTJUdTRtakxxSS85TGYw?=
 =?utf-8?B?UEJkbVp0cjQvRnNIdGJYdDg5TkZMak1TSzBibHZlUHJJMGEyWkVFSGhGc0xy?=
 =?utf-8?B?bkNqYzZSV245a080U2trajhiQ1VEUFczQkduVHh1KzNiN1JTaEZVN2Z3dzRX?=
 =?utf-8?B?cVNBSDBmdjhhWGROc1U1aEg3WFpRV2FNdUl0K0NITUNSc2dzM3pKdXZjdzZG?=
 =?utf-8?B?dEVldXQzSW15TVF3TGJYMGtLZ3F4aHJsR2huVHBkWTlBUW9kbEpKdldkcXJS?=
 =?utf-8?B?b3krWlJaTFdsWitTc2c0VFZpaldaYWNYVjg0cm8wUGhtdTRSeXhHcWY1Z2E5?=
 =?utf-8?B?L2QzMjBmdy83RHVqOEpBUDArSW5QSXFYZlhsakRtMkZvY240OEFkbDJXcmIr?=
 =?utf-8?B?dEtKekk2Z2trblp5M1ZNekhoaDltZ1FkU0Y3REd3RzVEVjMxRmlvSXJIcTRj?=
 =?utf-8?B?b2hnRUI3L0lrZllyWmRLUW1mdkVpMTljZ3lKSGhRVTk0OERnNUVSc2MxRHAr?=
 =?utf-8?B?eWszdGNHMXZIT0ZNclAwL1JVOHNybmRRYmJGTFB0MWFWaWo3cFVxMlk1Wncy?=
 =?utf-8?B?VUxpbTkzUzFvYkt1US91MFEwZVNQbmNzMU1UU3M5dHc4c3preS81YTl3N1Fl?=
 =?utf-8?B?N0JRamFucjJRVGxiK2ZyY2YzcEl2a3dFMWZPWWphK3RyNmlRVjJrVlA4NnE0?=
 =?utf-8?B?S0w1NG1MTlAyTEs3WThXVml3UFI0RmJyRjFGYkZHTFlyWFN5czhWTWRuZGlo?=
 =?utf-8?B?eWRhSzI4TDB5RTJqeHhkTHNaYk9xblFjK2VpS1VQQVVza1Bqc09RN1hUM09Q?=
 =?utf-8?B?WkQ4dGZEV1BCTWt2RDNLVFQwbUtaRzNGbXJZNkMwN1R0bjJEOXRTWUdtT3lR?=
 =?utf-8?B?YWs3UThHS0N4V25ISG43NmNaQ1ovd09xQlptNHNDUTBQenF0RTdPUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bef941a3-1e70-48aa-ac11-08de9ef84579
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 16:17:08.9173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7i2Eu3L53R+vN5Ep6VIQm2RYF+izGcYiDCLepPFqrzjmjROPJ0Y5TQrt2lAFi1IJTb4bFUNmFAZSLGP6tY1KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2486

On Sat Apr 11, 2026 at 3:49 AM BST, John Hubbard wrote:
> Derive Clone and Copy for Revision and Spec. Both are small
> value types (4 bytes total) and Copy makes them easier to use
> in later patches that pass them across function boundaries.
>=20
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/gpu.rs | 2 ++
>  1 file changed, 2 insertions(+)

