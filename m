Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021089.outbound.protection.outlook.com [52.101.100.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FE82264D9;
	Fri, 10 Jul 2026 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685009; cv=fail; b=OCC8IOiN82oQujbWjC9s93SYjDximHHNVwpei+0I02dqCfCjQDjb6veHWzp5eveo+H1AJ6xhUoR8PvExYdknC1oOC0XUtoOBvISdtXd9ijxTPKShTyfg5nsMitsqSMOKCEJryk9crJCDvxE4+wMHIuzIVD08IDiCWXVojwRyMXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685009; c=relaxed/simple;
	bh=bmOkUM0CNNSLMlrxGtvC4mbiKCFEm7AWiBceCccTJSA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=QU6MBPbDGtrG7eQ5DaEvnzTQwjwjDL5MpCmA8pTMZV8sQJ15hjgHXKu1qPY0Sl1caNhtTtBeUSZVbnCXLXJEDzf3qcYpRG3YY9OGiamJ8vjOVnKak22XCZK+TbjfK/lsEgsHo1IAUk1eUMvcND+ZwWCvvBZfdSc8j+OyhzsoALs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qcdmTIl6; arc=fail smtp.client-ip=52.101.100.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qcdmTIl6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8CA2Q9OD6E5kjh1ZgzGCqLQqcIOsZnaGQ22DEXlW5uAFRSR5276MeSnwjhrvFZAvEx7MgCCj/REhaOHSP4PDQSCbdSTBP2wWnbWLU9Ib2OncJaaI+6D5Tjr+RU2MeaRqwSUghvpvgYfEsqzg/Yujpy8FTmt5GhSMhPLOAM/LKugnWUsoRqBsG4AQMRMiHym9CRwVNX2/b0k47ZaGgwxVUs1Gi7yJu5sQEh/PDzWhhn8yJNUSl0x0pxUNHU4lIfPSpnE/yjfz0C+VEuoge96GoQXD+EfzMheOtu3eQ2zUtQFkde3bqR5ZPqLtXpZQb1GLhSH7C81rqA1qDhRiDMDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9kdotr0OqO6UWxOSOYMYqzVP6+0tFwy42FEsIkkWkg=;
 b=cnkuCyW8+x9NpOCPYYvAVOriGA5hH5ZgqiwPLyFOgGNxTng5KLTP5waCNa3QQhBHF7jxFG16nYPjwStH2xb6arjaW4z9YqcMfUuUEmma0Gk41ZsJlXLK/Hoq8sjRCDLof4GkJTM8A42w5AAmSGiWKHcAjuX8vrKGQF0uRYNv0Y3LsrF08CVqklJOj2pLNClRct4BNoZZFjc4nzeCBGuosne8QQR3SbnLast2L2ctzOAAljThlTPmAEJRbaMaXKfQIhVGUTe/mxrR0BbZgp7nILOZM0wI8rMw864G1Pson139t7cCbkxmgSw30va4Y++Wd9qBRF+wDAzefD0PdZ5/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9kdotr0OqO6UWxOSOYMYqzVP6+0tFwy42FEsIkkWkg=;
 b=qcdmTIl6sHP8ByukGT3Pp09h0cHBZH6uUAm1ZZmWEOiU6eApqqlN0qmBJ8bAHJyBuutgsl0c2PRrp1uVaObTQmbG2zMp0oW4FQ9gclrLnT7++6yEx1/cPg77XACDmpISqEximIWwAGF6ya9N1+sTjJof26cx4h1JZpNrwAkqT9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB4990.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:22d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 10 Jul
 2026 12:03:20 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 12:03:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 13:03:19 +0100
Message-Id: <DJUVK8MB1G9M.1RKFUUPIW4NDK@garyguo.net>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <hust-os-kernel-patches@googlegroups.com>
Subject: Re: [PATCH 0/4] docs/zh_CN: update rust documentation translations
From: "Gary Guo" <gary@garyguo.net>
To: "Ben Guo" <ben.guo@openatom.club>, "Alex Shi" <alexs@kernel.org>,
 "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang Mu" <dzm91@hust.edu.cn>,
 "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.21.0
References: <cover.1783480076.git.ben.guo@openatom.club>
In-Reply-To: <cover.1783480076.git.ben.guo@openatom.club>
X-ClientProxiedBy: LO4P265CA0320.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 6369da26-a8e2-423e-56ab-08dede7b3bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|23010399003|366016|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	roDOl/U3kBcvln9pAMKXC0k9Wlok9NB3lSGzQ6nZ6LMNdKSwg4N/jv1DHaT7nB5mKkT7T6IhAQQuM8fZvXaF2wX3/+zhvOFjIaMFHUn1p9KCSQUczQf/NgPCtpSJO6OlDETUpo3K4xquv7qrS0Xbp3wo8nHo4suc5ZhACa0ko/aB8SM9gquYf2L/RpZ4GQPaNqB4L1ByRRrLFADX4ih1Z7xuwk/IKYywnqiPw/xcFLxYnTkwhLN+cc8/QEi28yTYUQ6A82effdAc4Io7PMSzfb5g7sk7SXPny/tS/O/CxfwXRHUmJvlMVy/t9buoLq4ty368vVvXxQYI8W2b3e9+DDrRXTWRbHD6TY1QTaRCBooIq2AxOYVFX8O8a1RHgt17zoh3npBawoXGedfrMXmuA7XoVROu7Ijfk514FZbWlScX5Bwgv/wvQUzLHvgBzefxFIN8a0/vd9zbVNfsgm/Maw1q8qVWtrhKnzXA74SfmwDSMWbBLb/smKWlrDuf+AEAtT0hcyKgouzuNnizyF785Y/wPby2RJhuXNwYyOWRjFFqReURtrJBa/iFi/gU3TLU+OJqc2mwy7UU0drAZPjhBLMMl0wieZS5DH7itukYi+odW1haukcOeMZcysikUSNgrKlMPW5Ms8Jc1EACJnGS/cvPndyHvTJrB69ylMU71kQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(23010399003)(366016)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1lRVGhEbS9kOE02N0M4ODJ3bmRJUzRram9aU1Ntb0M2Zm9uZ1A3YXQ2Skho?=
 =?utf-8?B?S2RxV0k4aVErYlVpZEtrTUQ0enEzTWQxbjd3S2NETWR3bTVpM2hjUFM5T2tI?=
 =?utf-8?B?NUFoYjVCcFJ0Qk13ZFFpd29NSVJFY3B4cTdUb2tZSVV6ZG95bXdEQm9ma1Jl?=
 =?utf-8?B?R0xucFp6bGVnZWs5VmNpdU9OMUZNcWU2WEY5U0VxdE43SzBIeVJsUzc1NzV1?=
 =?utf-8?B?TVk0QVIrTWRpYWk2RmU0eWF4UFN0bHRrTnk3cmdDV1ZtZFg0L0liVmJ2S0tR?=
 =?utf-8?B?RTE3aEtYSStJWEdob2k3c0ZvNU1vWGhMN2JEbmVUSTEyWThnTjlQcWZvYlov?=
 =?utf-8?B?YmNwdURhM0NGeFZCU0E2OHU5dFo0YWtMVHh4eEZPNG9WMCtzVjlYUUJObEl2?=
 =?utf-8?B?SjR2aGE2T01hOTMyUWRoUUg2eVhDaGM2dWhjamI1Z2U4MEZ0eFNnWGVLcE1n?=
 =?utf-8?B?Nm16dVdBYkJ1bG8vYWFoTENQZ0ZtS29rM0ZNTmxJSjZIN1k1QitZQjBkREZT?=
 =?utf-8?B?UzB3N01oTUhEY1g4Q1U2NDlMZW42dWVMVmNDSzVtbWl1VkhGTVNOclR6Wkh3?=
 =?utf-8?B?dHBqTzZvZjFKWW1XZ0J4M1dRbWwxaWJUdlZ5ZUJYRjJkeTRWTkhZZllpdVdP?=
 =?utf-8?B?MEFuNWhwbTJkMGRUeUJURmYzV3hVNGNxbSt6STU3aERmaFI1REI3enlkOWZI?=
 =?utf-8?B?YnVHOHJYcThkL0RCUUd3dVRUTlFzbFZkTklpajlhNnA4cmcyRUkwVTdIYkZ4?=
 =?utf-8?B?RjRieERWWE96dmtqUTBoMHRvdUNGSCtKS2hUNXJyRGZRRUJ6Zk0zYmk0SjJN?=
 =?utf-8?B?dWpRaWVDaVhYY3JNQUJUTnBnMGJZMHdtYnRPOG15cHIzM0lsOTJaWHJuYnEv?=
 =?utf-8?B?Y1R2RERYcmZPaE1VSnpMWHM1YWRyS0RxYzNPYmxBSnhqS2dabldhOGY4QVBX?=
 =?utf-8?B?WHVGZUNtdmxoSTQydTFFTVlJYUdOdldaK0NYNGM5RThzYm5nbWZTRG92ZEU0?=
 =?utf-8?B?RXlFUUZzR1RkRGZpU1V6eVA4K1VzL2NtTllGK3g4UXJDMzJFMmRpRERrZ3JP?=
 =?utf-8?B?M2FGeFQ0M0J0YjB4OGtFaXphemcwR2E0eXo0ak16UjhRVXNFRWE2aU9yQXUw?=
 =?utf-8?B?OURzS2NUUE11RjdGMjU4bmNHTGNkN1BMVXcrd1hyMkpaNGpGMnBXV0FGUXVY?=
 =?utf-8?B?N0RMQldrUGR4SmhhVW5IdXFiZVlIam5GbHpwc2lUMkxIS0xyYTdyeDhEaGk4?=
 =?utf-8?B?SUU3MkJzTzIrZklqaGplWlZBcW1jU2xMV2wvcUUrQldGLysyTExIZGV2aU1n?=
 =?utf-8?B?WkFJZ0kyK0hibUJsYVQ4MW5zenBpNC8wTFNkMUVPTTJIZ0xHZlBremswcXpC?=
 =?utf-8?B?ay9sdzN1V05jbXZXdkRDN1cvYTBSZWNOY1djN3pNUjBxM3pLbUVIV2FIT09h?=
 =?utf-8?B?Y3BTU2VEVGg5MS9xT0cva01XdE05Z3F3T3EwalVmb0J0SXMwWThML2Q0cFJp?=
 =?utf-8?B?a2JiSW4wVlVpa3E1K1E1WlR2c0VKaWRhQkRvNThCTVZVOXluUEZrWEQvYWlC?=
 =?utf-8?B?UUc4TEpQWGtubTdnV0FacmJ5bDljRlZnaytFejR3ZjRnVGZxdktWaFZpNWNC?=
 =?utf-8?B?WEpwZERQMGZGNHkzdGwvcTIxaDh4bmJxZ3ZaUlVEOThJdnNzQ0JyWWptcmVX?=
 =?utf-8?B?K2xmeHlnakhQd1M2OHNGb0ZiOFF0VitwMWhpaGVVT0xxN2N5bmo2N0UzZ0cw?=
 =?utf-8?B?N2ZySm5oSk5WZGpUaUo2b29zTy8vWDJaMDVGcERBSGlKbnV1aWVMc2pTdTRR?=
 =?utf-8?B?Y3ovbkE0dEFldDVjWVZUM1h0UDY3Qm9ub0FDeUk2T2NHNjlsSnMybk5DY1Nw?=
 =?utf-8?B?SFZ3NjlVWFRxSjhUTlhRNjRNd2orTXRVR2llOFprWnptM3FmVnNNVUQ5NFFJ?=
 =?utf-8?B?cEpXckZsVlIrWWlNRTY1UEFhU012WVZ5OFpHc2hMbWZaT3VYME4rZmtRZ1d1?=
 =?utf-8?B?Sm1zUDR1eUp3c1Y2RUczaXViS3dGaDUrL0hnWGJMZnlFV0trR1F2WXhYTHJZ?=
 =?utf-8?B?MnIwS3JqT2x1WU1ybVUyQmF6QjE2RjRYbEdscEJZYmM3RHFGakdMYVJEL3ZY?=
 =?utf-8?B?Zzg5ZysrWER1VG01WUY1cWJBVnFJcGtGOXRVQm9YYlVIN1JORlkyL09KdzY1?=
 =?utf-8?B?Q2RrNHhxQWhRTFZUV3Y3WTZBMER0bjU4M1pzeUFTWWpReEREc0dlWTA1aWpY?=
 =?utf-8?B?Z3dIQXlQanplQTZ2WE4raCsweG5EMFhhNjA4U29MN3ZhRnI5Zk1OWm1jRXBF?=
 =?utf-8?B?V1RZRkJtVjFGOUFNVXRWVWhxOUpIVWduSGF1NUNTM2NEK0lLRFMvUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6369da26-a8e2-423e-56ab-08dede7b3bd3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 12:03:20.0316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ua5pTorzffBGhSOwZmmho3l57ORzKfT+5d6Ls/e0+skjXDK/7hqdYxsvCTPhV3looieWT2KvnOd46/yhsQcn4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB4990

On Wed Jul 8, 2026 at 4:13 AM BST, Ben Guo wrote:
> Update Chinese translations for the Rust subsystem documentation,
> syncing with the latest upstream changes.
>
> - quick-start.rst: update distro-specific install instructions, Ubuntu
>   package versions, openSUSE rust-src package, and remove GDB/Binutils no=
te
> - general-information.rst: add no_std section, rustdoc links, abstraction=
s
>   and bindings diagram, Bindings/Abstractions sections, and Kconfig examp=
le
> - arch-support.rst: add s390 support note
> - testing.rst: add Kconfig guidance for KUnit test suites
>
> Ben Guo (4):
>   docs/zh_CN: Update rust/quick-start.rst translation
>   docs/zh_CN: Update rust/general-information.rst translation
>   docs/zh_CN: Update rust/arch-support.rst translation
>   docs/zh_CN: Update rust/testing.rst translation

Reviewed-by: Gary Guo <gary@garyguo.net>

with the translation of "sound" fixed.

Best,
Gary

>
>  .../translations/zh_CN/rust/arch-support.rst  |  1 +
>  .../zh_CN/rust/general-information.rst        | 82 ++++++++++++++++++-
>  .../translations/zh_CN/rust/quick-start.rst   | 48 +++++------
>  .../translations/zh_CN/rust/testing.rst       |  4 +
>  4 files changed, 103 insertions(+), 32 deletions(-)


