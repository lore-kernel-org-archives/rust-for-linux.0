Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020101.outbound.protection.outlook.com [52.101.195.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481E54A92F5;
	Fri,  4 Sep 2026 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531162; cv=fail; b=eWkewiTXigIo7GAmuLC49KHkY3WI7eFCMVywBjQ+eAvudNGvN6eBI4c3i+R6oRmd2ty2beAiRJZLgkDZE5afc4L2tk2Jkx59/bWVfbhy4MPXBJWxYdAQyPZld3+Y2y8F61gpVA/UCqFFd2xWphXClb5OGdciwQTbjbe87q97Vv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531162; c=relaxed/simple;
	bh=OmefDKjMQuOwNRQwvRaKLp+T6udOSz3rCbOFc3ugOdw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Kpmaz1+bvxTfVqc20fJw3u6zhQdHFTdtZBED5ks9Y50OnNg/Rvprn4GsKl9a9CWcDqAnCzQHuIx/vTQBIyPHheeMdwZsd086U4icG64zW5e7QdaMSnE2We2pXjR9ZfExvpNc02DahpdiseG3AjQ3SdMYfyhVJrik8bs261mua5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=cT7TRS84; arc=fail smtp.client-ip=52.101.195.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="cT7TRS84"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYsSt8pk6WIBEP4ZBDuFMbGFlV1sEyC9o2gFdgfuCGEffPDlgVJB7wrMeR9gN009r3B0P8NAckK4orOYtG66UXCSDr8Dgdtp8HUlDoO+d5v0Y3w2IU3wUPbyfXvhLZS3VUp8f8NRJwjGfYUP4on75d+np1iG/6Cp16nrKa21zS8E+NfbfNNOa2bYEzQHHgtm8Zlv+MJ4btR7e8bZ2vLK1LVhdoyyblsAKyodeMfHSH4jS+lHMd757QUTd8gabe+ZcCnaf4tfvRgkvH/PioGY3ogLMicQZhel3cqD5EO6vlri0hUIQVaPBV/ni0DPFUQsU12mtGAfdVVf7rDpxOmchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmQS66lb/o1ZTLyORkFo9vKVQCsiJr/2J5oHuXvfy9Y=;
 b=iTivvNYjuKxwSx9qrPy4JpGe7pDxxhmLjfe8ZDHEWWd51qG99Nb/wtE4nABDvmn8Fbf63FYpRjfaiYaSucKcT+NJudSNqhYXwOb/T7tzV8m0D4n+QS9MBot4CYn8uJH2WSsip/uXnnBr4mu3cjw6phc+3xNa6CE3LdtTV65sfCS0GpHr+PkMOrOqNqRBH1S5ywqVu8nAIIZgF62x3G45gTDe/2SqZrGddafJtSJZs8M9w8ARNtRsdKd47Df+DgnARZN+As82cDli8DrEOsdeXkNOKqRL4Dpr1/G3yDF5Q/7LfnG5ZexG+EAEFqmk5o+Bxu6Xbm5jLvYbJcCqf5wApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmQS66lb/o1ZTLyORkFo9vKVQCsiJr/2J5oHuXvfy9Y=;
 b=cT7TRS848V2kbRFEkrpo41M8gg68kdaOKz325EZKEm6gOCzO1RQ6IAbADMmZEx39zI0GmseTweXVUjZJ8PVuS2SwZum642BRdtq++YQYtcdjAnK4FR6YRialIp0VV+7TcAXIaqhRUe0IWs3boRXJzAkTPg17L4t4lMYER2IHE7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6690.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:12:36 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 14:12:36 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/4] rust: pin-init: support tuple structs
Date: Fri, 04 Sep 2026 15:12:28 +0100
Message-Id: <20260904-tuple-struct-v1-0-72c50bd037fd@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMzRmmoC/yWMQQrCMBBFr1Jm7WAsJlKvIl0kcWpHJJbMRAqld
 zfR5fv89zYQykwC126DTB8WfqcKp0MHcfbpQcj3ytCb3pnBnFHL8iIUzSUq2mCDI+cvdhqgKku
 middf7jb+WUp4UtTWaI/ghTBkn+LcJs1Ex4UTcmLFRKvCvn8BAmxd15UAAAA=
X-Change-ID: 20260904-tuple-struct-5b5b6e6a75f9
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, Mohamad Alsadhan <mo@sdhn.cc>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531156; l=1519;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=OmefDKjMQuOwNRQwvRaKLp+T6udOSz3rCbOFc3ugOdw=;
 b=sh3w+XTH09jfNf+w9woqX/OBnryrOZMPQpnqAIojapQe/LzsknF2XtvH3f94fTE6BTv2e4wYx
 3GkEC3EtK6oA/eiSsQ3RHOrd9p6Ztm0q7eRjT6VyT4zh6qmb8jscO1A
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0690.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: fcfad8f2-63d0-49e9-ef04-08df0a8e922a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|376014|10067099003|6133799003|18002099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	I00d2mxt35lEb3Q1TN/C+oF21WsAHRW4i75Uz53xlQ/5jwg89YIMb61CEPIQh5O+cd/9Cc8hLgvTTplewZb0uksbmF19H8SHlAPo9uUgNeR0NXBjarQbh/vNhUezSClnqBXLA9KVPvT3pFF/Y/pqcD0+fUFTnMjNrtNKBSBVMJbSQ/qKKS/byCnxMq8DDY6C3Hsqt1CqKKbeSmLqwRfHBep7CLnZT41XMwbSwsS6bndRNRLtnu/Zcrr78DKk7Nh1r1+9xXJtIxdhAwZCsxVvhIyyZDmXtmVhri3f+0O8pLnTjt+dN0Gr3NA+2NSra4p0wxfx2sl0gFSuXB2zWsOefZM6GBhHp5o4TisKsevC+JscUAG/bjivJikCvPHPDK20GgyU47ov9e+lwUVNNngC8qfGMqORIDqxcjSIDEPyEXSNkxdT7K4lVgw1dDuetByzAdMKlbIJMiq7mlp0r7BLGUqWaPxFIVeVy+9fsmIsczkYyZ8uDu82kS0Jpj7lV/RwiSKuj4S59J9aZhZMwbf/byTLRxw/Bpgw5Rfzd/bhkm/x71r+6gtuI9EfFJ4+9XQn9yPrCZphGs95ZeOK9oOEvoQlEGXV5X9yEw1VxS3LP/Kdpa0uCv/6sEznVBoYX0ArEkWMEmfyh+lnSN4MLJhieV5W/6eqlHaQ0m+Z+yxrCtPYu+iicTJjTompX0deIokB2OkKBtOHgSLaGTZn/lv5gg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(376014)(10067099003)(6133799003)(18002099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3ZzSVlaUHVJY1hFcXowUW5aNjAxN0JKaXg0MDRQRWY1UW02N3JPcHQvcXZG?=
 =?utf-8?B?bWlkSDZ5eUwrTHdyWnJ0L3hHVHRROVVKd2s5SVhyRkV5S2dNbk9nNzVER1pn?=
 =?utf-8?B?cURvcSthbFZ6UE14UTBvVG4vSFBkTnRtazJOazB1N1ZZRFp0NGQvb2Z4b3A4?=
 =?utf-8?B?dFE4UWd3bVJoU3NVN28xTFpZT1NZU1V4OUNQY2wrSENYOTBPTUxpNjhnZlRV?=
 =?utf-8?B?Mk83WmhUZWlmejBwV2JZUkdEOXpNWHZNRUErRFRWU3ZwcWpRMGUrZ1daUVVp?=
 =?utf-8?B?Wk9qVzJkUzRlN0dBYXlrWXpLdDAzbTRtYlZGSjhGeDk1ZkVxSWJEaVBrN0RB?=
 =?utf-8?B?Vm42NU9OT0RYTzBPWXhYc2xmMElqdjh6d2JLRkdFM3V4bkNnQk5HRk9PcFVj?=
 =?utf-8?B?WDFLTC9jM2JtSnFqdE4yU2hoY3VvQzc4Unc2ZzBYV2JlSnRnVnpsZGM0ZnQz?=
 =?utf-8?B?dXBFL2o2SmRXSEpRb2pWenRBS3JvUTIxODVMd0haM1dPNU5NZERLRExCR2Yz?=
 =?utf-8?B?TGRHNUNFNTNsOUk1THEreW5zTmpoVEtjTk14SkFnbjJqL2VXTDF1MlhNclZq?=
 =?utf-8?B?WlBXbyt0WGh2S0NlajNXTWcwOXNJZHVqcXZOL2dpbkJFSUkydzMzRmh0UDU1?=
 =?utf-8?B?cWxEQ0lwSzI1eUdRdWlrTzVwcnd5c0V5dlV6S1hqS1JMTGJwd2VBakFxalYw?=
 =?utf-8?B?bzVWNHdUTlNFQWl6YUc3S0NXRkVMcjUwTVROeVN4RE42dnZPZHQ3SFErU094?=
 =?utf-8?B?Rm9jSFRDclY5WTR3ZzZKbnBjVVF6SFVwU3hwRkYzUTh6SHhzekVtRlMwYmdO?=
 =?utf-8?B?R25RL2taV3A5RUlYTnB2YllaL1dFOTBCL2FhZktjL0FOeVBmWjRENHlENUhO?=
 =?utf-8?B?aTdWcDVkU29rYkgvWDV3RDAveUx2cTlzTmRTS2JZWk1wajlSb09LVTU3SDdp?=
 =?utf-8?B?RGIvNWlWdndjcUpiVnBZbi9lTEs0bWs5Vm5vSXNyT25hRUdxdzJRd0thR2g1?=
 =?utf-8?B?eFJEeGRvMzZSNnIvd1A1LzQyRjRWTTZ0THJZaisrdGZaSFF3RUZacjZ1WWE5?=
 =?utf-8?B?NW1Id2ZybjdjcnVYV1NmT3JFcmZWbEtsT2pSeTJ2WlozOWVHalE1YmdMeUl4?=
 =?utf-8?B?enc1QytoWUJnTktJMWpOT2gwZTJHS1lPRCs5WmNEdERNeHR5TXgrVjZFMU1W?=
 =?utf-8?B?cmdIcWtaZStzRGUzUnFVbTM1S0QwQ2lUSG1ub3FyTk5ZY3VuYXdCVlBPbk5n?=
 =?utf-8?B?M0N6QlFmVXU4M3g3UHhlMnZYeURrbFpKSllLQzRoMjI1dzljZEJGVlovZDlt?=
 =?utf-8?B?cXRFa1Zrd3FqQ2tON21OUEtSUkR0RzNzKzJHMGJRR2NuM2x4VUVNZEJJcm9M?=
 =?utf-8?B?OU1UMU42UkQyRmQycitMamx0WEVMOWdLN0JqNVRiclJnTmI1Q1MybXFtNnZD?=
 =?utf-8?B?M2ZZZUNiR3M1YzZ5SU80dkhIWlVJd2tBOUhVMHJEa2xNdmVDbnRIbzNRTy9p?=
 =?utf-8?B?S016S1VnZHlOeDNwWFMxbWFZdlUybWV1UnhNMTZCOGZSSjcyTnlGZG13Z0Mv?=
 =?utf-8?B?ODRPOVVtYmczMU9hd3pFMk1RTDRjZ2E5ZlhONHVhejdzaWlON0RrVmtJL29a?=
 =?utf-8?B?RDBTb0FmTXllb1I4WGZqczR5R0l0WHl0dldpclUrUEpmdHU5bVVwQm1rRDZS?=
 =?utf-8?B?MnZxTkxzWFdsZ2xoeHZFckQ1bmhuS21NYkc0UHMySFcxeTJkaDlQUllOYkxT?=
 =?utf-8?B?ckJNZ3JwU0MrbEhnOTdLWjhQTFkySUtVdTF1c2pYK0ZVem5zNTdtYkkwWC9a?=
 =?utf-8?B?R3hqZWxBQk5QWW0zZlVxWDRETEszZHpBUjlRMmFlVEdnK29Na0xSd3l0ZGM5?=
 =?utf-8?B?WkdocVhhVGVTdEgzYkVXWCtwd0xFYVYxb0dKYnFQY1Y3ektSVVhGUEpZZlRN?=
 =?utf-8?B?SUNSeGx2VFVyZUtHTjBLdHFiWjlWNUE2Z0F4QnF5MlJBY3NJVWV1dXBNYndZ?=
 =?utf-8?B?U1VKSzhmR2ZNaThsdklDL1ZzOWNvYUhEektFSjZjTTFiOEhyMlNTRGlWaVNy?=
 =?utf-8?B?Q21UWlRBd0VzQk9tc0pUTTNRU0dOUzY3NDJVYWl2NXJoMkx1NmI3RGV6S205?=
 =?utf-8?B?ZFJJRzdjVHJVT3NXRVEzT3I4WTVxMExiVlY4dXJVa0xwWlFSODZaN1Zma3hj?=
 =?utf-8?B?N0doMDRsQ2xQMThER1puZHVjZ0FiZWRCazRkMGJzdDU1MTZsTWlpM3pyZnQz?=
 =?utf-8?B?ZWNNQ0hjN3ZCUTIxemlKT0pVc3NJZHdZSUtoSmYxVnd1cDIyQyt4c241QVlL?=
 =?utf-8?B?ckNvTFl6UXViL1VUZ0dIWVNsUUtadnlNZ2hlVUxPQXhqd3MzellUZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfad8f2-63d0-49e9-ef04-08df0a8e922a
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:12:36.4809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7NbnnEAjrU5EIoWpoz7uKoskUxgntwBsNGhUNquQaPdnLEDQ3aUhDSL4DznTV6BRFnokh18RH1aRni1JEHMVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6690

This is a long requested feature to support tuple structs. There are a few
cases that structs have to be converted to become normal structs so
pin-init can be used.

This series add tuple struct support as you'd expect to work. A caveat is
that pinned initialization syntax (`<-`) only works with struct expression
initializers. So

    #[pin_data]
    struct Foo<T>(#[pin] T, usize)

would need

    pin_init!(Foo {
        0 <- expr,
        1: 0
    })

This is to avoid introducing new syntax.

The upstream pull request for this series is
https://github.com/Rust-for-Linux/pin-init/pull/155

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (1):
      rust: pin-init: internal: extract utility code to new module

Mohamad Alsadhan (3):
      rust: pin-init: internal: pin_data: support tuple struct projections
      rust: pin-init: internal: init: support tuple structs in `[pin_]init!`
      rust: pin-init: internal: init: support tuple struct constructor syntax

 rust/pin-init/internal/src/init.rs     | 494 ++++++++++++++++++++++++++++-----
 rust/pin-init/internal/src/lib.rs      |  12 +-
 rust/pin-init/internal/src/pin_data.rs | 129 ++++++---
 rust/pin-init/internal/src/util.rs     |  54 ++++
 rust/pin-init/src/lib.rs               |  71 ++++-
 5 files changed, 638 insertions(+), 122 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260904-tuple-struct-5b5b6e6a75f9

Best regards,
--  
Gary Guo <gary@garyguo.net>

