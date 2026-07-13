Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022107.outbound.protection.outlook.com [52.101.96.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CC3387566;
	Mon, 13 Jul 2026 11:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783943446; cv=fail; b=A6BPy4lUBfDBbH8OyvtYagtR40lnm4EpEulxZseKvcDyGQZAqkCmnCbby3aP2emiOomvpfI8QwvqC2+TqJ0dfCKes0U9AgsfLropDSE3z80KrO/sktDDfXztjTcc1Zi9DeIOmkKB3kRdl2mksU/zAMGLDioWMXLoEAYPGL8fQHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783943446; c=relaxed/simple;
	bh=LyGX/G2lxrJ7y60cHE6lHKD+VpDVWhZqfUf0YR3X5KU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cHRchv673YfEx9J7HA/2617Zer7fS6eM5Vf1fIlR5vYiMwdNpMPMjMS+K8vLZag6UZ+eZqC+gcRdnEG1Pc9vBe59qSjVlMZFIpGobxIc47O2Czeqq7H73kfnExx3Rwlhx0+nkiADHezQ4BHAG3Ul5KCr+42/IuJAnCRofnmsyHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=o4EkoaXq; arc=fail smtp.client-ip=52.101.96.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="o4EkoaXq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EH3E1E5D6ZHG7S+ENEJi4DmrvH1Par5QeeYiX5hEFKajmTDZV2ns5fuKfkBUpLLSUQAcPidr+bl0WPiRg9d0VRfaE234pQTM/iuddIJFugHRvODYCs1h8NP2zteBdwYXaVIa7UhcLe8iPiYGElXW3LPB5JVMNhQ0JqE8bHYl2TamOFxPWbGxGBECvBtBZB80CcsLkeE8jo/ZNRiVrDqn89XpGNhr4mN99OXrr7d0Ebox0kfB/DS9xHta6FjnqB8MSwRz/1bRQNXoV2cyAMM2HugM8WrAyAY2/v5uaENqqBAga+Jvwsem+V6lv6jMVY8qHIGcopawWhzSf+SVZeh3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/0zNnG3925Dziem/7X0Uj/2ClGAgZX2VLyqEe9jGmE=;
 b=EFy6TrEu5imsAJkiVvRamDnTnbfQz5E55pS+qxGuWoxBV1rKsKw8Ft4n4xc5tOTWLWeXWZi7JbPRjuZHol5v7tcv7ZkBS1LCf6UGUqOUU3tNemdWDuX1vdpBg2JZhtdsmJZNuIUEFJy5he28yBEuhpwil4yMsXXo1M9b9W58jR1qpE/reat3dQryzGcqeErQDLBaF+MSniB4a5y35HUZi3eAkD02AuIPyA4tTMS+Nrlfhy6pAGNu733z56laORsyEGOsd/HAKQeqf7dz+r5ye7nriM+Nxii3FbBuUMZ30CRcALPLKNnK8sx08YRw8yalSle3ls8YUZjonzaYQRJeTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/0zNnG3925Dziem/7X0Uj/2ClGAgZX2VLyqEe9jGmE=;
 b=o4EkoaXqCCKmUJJD41WCB0ylRm/uKWSkGdcoI9PYE/D4vmuumRhc/9AQ/g2aqTRXEHfDhYAWTct4rljjb6xLWNZ8U1l6yAQEuuJIIXKQ/0MgKY2RL0Ui/zJYoMgcA0oZSruah/B6Md5nHf6BmpVXPQzyw1To1a1wFKNBfxZw7nM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO2P265MB3689.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:50:30 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%3]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 11:50:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 12:50:29 +0100
Message-Id: <DJXF61JUYPSW.EWCY9ABHTKS3@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Luiz Georg" <luizgngeorg@gmail.com>,
 "Mohamad Alsadhan" <mo@sdhn.cc>, "Mirko Adzic" <adzicmirko97@gmail.com>
Subject: Re: [PATCH 0/7] rust: pin-init: upstream synchronization for 7.3
 (round 1)
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260710-pin-init-sync-v1-0-8fa16cde87ae@garyguo.net>
In-Reply-To: <20260710-pin-init-sync-v1-0-8fa16cde87ae@garyguo.net>
X-ClientProxiedBy: LO4P265CA0263.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::12) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO2P265MB3689:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b902d8-f941-4198-f45c-08dee0d4f014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|23010399003|22082099003|18002099003|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FrdqGh1TdVqEK3eqqhMGFnCUHUwzLV0Z+XA0KsvqugOOsi7leOeu8y5AL/jXpqvMzLv3dapDNDaukprnB3AY4Qx4V6CftoUJcmB/fVoziR+LDKVGUJztKOC2L5nGyP1rNz5OWzXzfK8TCcWxfYRQQXyzlNyGJjQ/hNz6/2JC6Wi5NNg10GAbW0B4Btg8bvByrcFeQlArlw71PH+paB89pBAKBSxUClUlPbzEFCT+WaVzJNLfzAgtOhXUa3aMF/XtTWlJXca3HeC0277EyVaZS8HzNGnmIfj2O5zFUtbbtugIByoJ3BqZCciNyi4VX9pVIzlHYEECNf/efgPaQKoSW/CZpGE7MhZ1e7MoOB6oibCEzm4CZS8/gOsYrVjMF6x/l6yBUliDylHMRvLTz3W/kERUHttDlRiJXbnv0k+HzWp74lGwyEHYyaBIikLj6NLUZKbSSFOkOeK6uZ8OmFavcKYP+Aaz4Z+Cw/AK6I92z8cpVqGZ/ex0bFFXHHjzXtdHpkHKqe4JDniAdzFnYR5gQxIiYoZm6i41a1CK2jm6SnGN4ogpDygVf4ts0Anku8z2/00dzJDTs+N+iKguubwVgoFe0OeTMk6t0PHyWsbVqEtTyL2BE+ZbZ2PlwVt7yq0haim2Oc0AgvrdDRc+nNDCsF/m+r7k0mFDc6o2sw/tELI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(23010399003)(22082099003)(18002099003)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2JmWlg2UVlyTlAyM3NmMFBvRWdQQVc1YUl4OHpsOTlsM3pQOHdVZ1YyNTlL?=
 =?utf-8?B?OXRwTWVtTFRPTUYzMnVyZmNmT2pGZG1FeE0yZ25jcWRjZ2lVcnFnVjMxWmJo?=
 =?utf-8?B?c0c3Z255UFJaMDcwWEtmdFFucUY3U0VSaUwwUGZLY3dTNEsrLzNlV3FQdXkw?=
 =?utf-8?B?dXQrKzBDYnkzbHNCblRuWkpJZGl6WldYMXZ1eXhNUGovY21CeTQ2MHRlZ2R4?=
 =?utf-8?B?TUF3bUhFOUZ4d0pNNzhrazFpeUJaWWJaSWxMUEt5L3N2cDM0OS9TRDN3c0hz?=
 =?utf-8?B?ZGN3OUJZVnIwdnpScG1lWTRVNkhYcVFGREhFcG13RXVJazF5bjlMNGo0YVR3?=
 =?utf-8?B?UVJjWkJlbXp1eFBUK3RMaGpSNEZBVkIyQjF4TEJrNTRoWEtIano1QnJIUDZK?=
 =?utf-8?B?anBUM3pDbkkxaGd1dmNKcGVyRFloY0ZkdHJlQzROVEFqNmdxVHBtMjBmOGxl?=
 =?utf-8?B?Ri81WlRpZDRhRGdwMS80dVVoTnRoWGdETGtORXRDcnlNaDB3VWdJRW84bzlR?=
 =?utf-8?B?ZFBEKzJRN3FKS0h1ZTNSdDNoWi92SDdOaFZFRVBpUS9hdFpNYkRTYjlHcWFt?=
 =?utf-8?B?WEJlZ1BhbmpwSTFlMGVlNTRuZGg4ZFhYU2tFMHpBQ2s2Ym9YODR6dnlmTzVy?=
 =?utf-8?B?b01ZVEhIWUwrWUZNdEdibnlpblJUV1FWdWNZUW9nME5PL1FFMkNjRHRDbUtv?=
 =?utf-8?B?NEJUcW84M0Nnejh2c3ZMa1BkMjkxWVB5YkxBcDMvRzN4bnBYZm9kMEJpWGdI?=
 =?utf-8?B?cld0YWhOWjIxL3BpaDRWN0IxejNXKzR4L0MrT2V5MDE3OTNZcnJFVmU5MS91?=
 =?utf-8?B?SzNEUWdlb21jN2FxTC9pSW5RNWp6bGJoc2dyYm1Wc29peFdmY3k4dFFVQlhD?=
 =?utf-8?B?RmJzSFQvZ2F1ZUN3Rzg4NGwrSWk0OVlXd2FSd241aktWd2JhbGoxN0RKNDdX?=
 =?utf-8?B?clRLc2NJZFF1U0svUjNhUlNBL2RVbFlpdzlER2VDNjhPVTl0bFQ4bldKTzBV?=
 =?utf-8?B?alZnMUtSSTZNdDhqSWZuMGY1ZHJKbkNsejhzTDlvR1NHZ3hmRTNob3RCdHBy?=
 =?utf-8?B?dmJ5SlF4U2Y2TEE3d3NyYjZYTHhkU2Q4MVoxbWxmR1NhVjJyellGL1J4MDlh?=
 =?utf-8?B?YjZlMDdIblRGV05YejRPQnVjODJsSjdlUVdnSGhEVWRDdkR4MUVCVWQxS1NO?=
 =?utf-8?B?QVNMQmpYNHhZMEtRZkVtaVErWUJhcXFyaGxoYW9VVE5UVUFkS2VFQUhzeVR0?=
 =?utf-8?B?SlRmZVh4YVpsVFowNUdlT2NQK0JPWEVqdkZXY0ZlSTBRankxSFpJNFBHelYr?=
 =?utf-8?B?cldwR01NT2ZQNDl4aGMzV3gzYm5IVzFFY044SE9HVmFYZnNkc09hV1RDN2ZZ?=
 =?utf-8?B?NkZaQTFNemxCODVKdkZQM2RlRGs2RkhvZ3dnRHlDcFpGaTB1MWk3dWo5MEhw?=
 =?utf-8?B?ZjF3RHZJVW5PODFJa2tHTnBkRXd0Z05kcEM5dWxrNXRaWUVJNW1GMTBsTjRN?=
 =?utf-8?B?YjlGOFQ2ZVlLeEtmQ1pKdUxQUEJ0bVFtUGNSZkUvWTRIWXNNQzM0S3NsSjht?=
 =?utf-8?B?Y2tmY2lMOUFGdEFNNTIwL1g4U2NqNEkxcnorWUtuRzhXSjU5RzlpYTlsZEFj?=
 =?utf-8?B?WFl1aDZNRUFWMmVNZzVGclJzcENhNEx5SnRNdjBFdG84Q3VxZnhhQTczQmt6?=
 =?utf-8?B?VGlXL1Fkd090QmJ0OFU0UEVFTFBMeEptZ1ZHNzFIWlEzRFNGQzJqelBSemRI?=
 =?utf-8?B?blQ0aE5jQzBsbEx6ZytLcW5STk0vNDV6T3lKaWtNS0pOOUJIN0R5YzBzdzk3?=
 =?utf-8?B?dVJJckdvK2M4aWdlS2s5T25hcHNnWFgxbEZrTGtRM2llenIvU056RHpyQzNa?=
 =?utf-8?B?Q1d2QVQyT1QrZGNpeE1HL3g5MEhKVVpmc1czaUpDWVhmYWNlY3pQYVBhMDY1?=
 =?utf-8?B?SUFTb09QM3dMak9ub0h6TStGN2UxVVU1K3RFSy9Db2V6SkxrSGp5bGg4ZHVv?=
 =?utf-8?B?eWdqdUdLUCtudUdFVnEvcTBFMERWNFZGMXVhOHdycWg0VHBuRGkxL1krWmVL?=
 =?utf-8?B?akJHZ3pnT2N6NVM2N0oxZy83emsvRHBYbW9zVjV2VklqWHJXbFJoTWYyVG5N?=
 =?utf-8?B?S2dZTitwSzdpa1ZwbGxiNGpmblBwNWZzQUV1Y2lMRFY2QzBMZHRHYThNRG1Y?=
 =?utf-8?B?NW90clRBQ0xNNlV6Z2lDWENPMXRkYjlqd1lDTEo3Z1VSckxEZUtsNmdzaklt?=
 =?utf-8?B?cVAwMDdNcEQvVG9mR1NRdVFwbUFvUE5SWUdMNXlIb0ZXS1NUODlGQnpONjE1?=
 =?utf-8?B?TlhYVEhINnNQcVpyczRreGdtNnprNGFFVFg2d0ZXNHh3eENtRTB6QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b902d8-f941-4198-f45c-08dee0d4f014
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:50:30.0702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDqxMTBq17yeEJWqDl2O7GJRTppgaBFnhR5tAXDD2P16qNRzdDB6nhSOLvCfTl6RIiiyL2a5kZZgdBnF53LVzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3689

On Fri Jul 10, 2026 at 5:20 PM BST, Gary Guo wrote:
> This is a series that synchronize pin-init upstream.
>
> It includes the following merged PR:
> - internal: error on duplicate `#[pin]` attribute
>   https://github.com/Rust-for-Linux/pin-init/pull/120
>
> It includes the following PR that I intend to merge soon:
> - Lint cleanups
>   https://github.com/Rust-for-Linux/pin-init/pull/160
> - unwind safety fixes
>   https://github.com/Rust-for-Linux/pin-init/pull/140
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> Gary Guo (4):
>       rust: pin-init: examples: fix incorrect drop
>       rust: pin-init: remove redundant clippy expects in doc tests
>       rust: pin-init: internal: stop using `expect` in macro expansion
>       rust: pin-init: internal: generate brace in macro for init code blo=
cks
>
> Luiz Georg (1):
>       rust: pin-init: internal: error on duplicate `#[pin]` attribute
>
> Mirko Adzic (2):
>       rust: pin-init: make `[pin_]init_array_from_fn` unwind safe
>       rust: pin-init: make `[pin_]chain` unwind safe

Applied to pin-init-next.

I reworded "rust: pin-init: internal: stop using `expect` in macro expansio=
n"
based on Sashiko suggestion and picked up Benno's review on lint cleanup PR=
 on
GitHub.

Best,
Gary

>
>  rust/pin-init/examples/mutex.rs        |   5 +-
>  rust/pin-init/internal/src/init.rs     |   8 +-
>  rust/pin-init/internal/src/pin_data.rs |  10 +--
>  rust/pin-init/src/lib.rs               | 151 ++++++++++++++++++++-------=
------
>  4 files changed, 101 insertions(+), 73 deletions(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260710-pin-init-sync-a4cee08c619c
>
> Best regards,
> -- =20
> Gary Guo <gary@garyguo.net>


