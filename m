Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688AE3839BB;
	Wed,  3 Jun 2026 18:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780509749; cv=fail; b=KqRLoxiG6c9QOYKFiayRPC+DVDLGwND1Sz+DzELsuEDplS+yAvU4yyvtrhsLAfXCJM5yVWPvfqsAmZ0IS/X6okXtQP7Uj4+zg4sRKEWj35tBuxpgVJQMfO4xREFAKVKo/GKzAiB1pAdZS77eHXwFLc9ABXJj32yt8itMKam0rP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780509749; c=relaxed/simple;
	bh=h/MbvKHra8r5bgPTCjvt3ySalptEw3uCYRthulAohxk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HjsQ15+EsFGmW4HnefEzEas2OgdpLA3xo9aCKRy9WVtp5yZEbRktn0HClzfybj/jKDdVGmJ3NUjXJjY4sFq0nlAj4wAe47dnBAt+jxoWtKe7/EY0EfFtc2QsReGRtVhhZ/tm8Je30zgAHirjD4ljsmcZSib5hTvfMiz1saRuwYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=O3lpp7ST; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="O3lpp7ST"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUg6oUTnBgNpKX1hBmp5Mg8fGHllZDQy7Z5gFjSLvjzVUPApHF0n7AtJie4ALGkiOswgwtTVGQmBwtJO6jdwK+HcP+BDNcWNlpgCXCJxnXD9xtszrBUDhnI0Wtp9eg4r+hoyVaFEa+aUTveECZhGap7XomIJyxYimdmT/ca3QBa1bwxWJXukCSx0/ysU76mtrHxek2Rlw3/DrUkUnwxDmsvHEni4K67yNWnYxXajBdeA9V0r02irrDuJNu/NDS4zrhfLIq3e2FJcRftNhW8j3cjMR17osQc8aQ3on9O/u7IdZFxDGVI8bvsZL7eHJ72L8OzvnvxMOHlG5Idu+KT6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEsqHbWUhr4A8P5H+HqjSQJQ3FvtqY1c2wyMQa6cVVA=;
 b=PXWLZfWk4QorbsBCWqAgF2BIE0uWUOqae+dBXtihwt9cuL7nM03GRWQtsrrZPRaLDx+koNBneiexmI6uyHrGIWoZ5zjFOanESwqA8LSPWDH9Ed9LEGFZ0esMEaNnK8X6D7DKjdKNVP/nIOrGKeHZGbgfNk4YPqDUOy42lxxk+HGnqmXjWAxTHTSr4sVT7EQth4vEccLSryYSs+4RRgVDKUNQ8mMAlZ4VaH9mJSzEkx4nxH0ysIfkG8kB6B1KUUdo2/muGSY9C0J9GbjvVLS9LryMWImhk3OZjNmDzvPXGLojnJPMNrCPxfXGZqzMcQn7t8WudzR3dmjDCYB3/0IdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEsqHbWUhr4A8P5H+HqjSQJQ3FvtqY1c2wyMQa6cVVA=;
 b=O3lpp7ST0O98rZX6MykJzYfIwd9HtBTg3wtKOfQCEpvgimRmwevBD+lMbViW2ZH7LhjtDeapJckwTxTjfZt+rXClle8e5WMaWXDbeIq8KzcZZ9Y7D4Adu9VAdHbSLfcma3b29jpAHC+9GuCX6S4fcgi+LS7YFQVmuHib/O4x4RLubn41zTXl+IRP7hVnk57yNVnDg87FFef3XjvTaN2jquBvSlovf43aYjpIqiXp528qjo89WxFf6UJUEpUd/CFdkSGSsYpt1fHoOCzcPtfGaKdi8ExW5EvZVbpQwfOLxgYvNE1FjYjM6+KJIHw8CEwR7x6upebM+xThipn9YMQZBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by DB8P189MB1063.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:02:22 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 18:02:21 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Wed, 03 Jun 2026 20:01:43 +0200
Subject: [PATCH 2/4] binder: reject duplicate BC_ENTER_LOOPER commands
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-b4-binder-hardening-v1-2-d0aae3556c9b@est.tech>
References: <20260603-b4-binder-hardening-v1-0-d0aae3556c9b@est.tech>
In-Reply-To: <20260603-b4-binder-hardening-v1-0-d0aae3556c9b@est.tech>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Brian Swetland <swetland@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Yunseong Kim <yunseong.kim@est.tech>, 
 Yunseong Kim <ysk@kzalloc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780509735; l=2505;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=h/MbvKHra8r5bgPTCjvt3ySalptEw3uCYRthulAohxk=;
 b=UC0EDPPpg0rnTT6ecfeyYuhzQu7kv0B9waZoAvlO+AGQC6zUrOhI6nd2DwMJCjzVVxVxr4VcT
 c1J5QgzanolC4fWFiElpZyyInXpwOa9RkUgpczTw8CoOUy5c+S+i2zC
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: DUZPR01CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::8) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|DB8P189MB1063:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f0ac08-24c4-4677-590c-08dec19a4285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|56012099006|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mfKBN7X5tObpYtOu5MdcAo3HifXyQlr0GUyrrCOaK3WGJMACN9bZkXC0KTE7FxrNIuvfgYmxQciPvsl7JkzURwCp+CUGSHLdGwAO1euvoXHAH4dzjBwXvfNf4magfju4aFwqHGy5q8yFIrH+US8rcKzvMSOexUDMkkn4ZGCDO8ZwclIoE+8it+JzzOyA8aedSKxbfVDTf857qzfn6N+hia60j9N/aiYmpbw/6aLRFz5kQgTw3AKyIzStAISBq4VpEbh8fJrL0Jsx19Ufw8NwFsaiDuBu0ntov6Wz/cDOY/BU36sfjNpNBnRcHN6YRFIXPCM+pgZVmuCdz9ZEF5EmbM9S/7n0EyCBOFVBi2HJlXMQ3jOeRTgYO/SbZAcM96TBpbaU7eXMO1GNej4QPnHRcHYSVMJaDXOGUqNRS0CYY7nB3VRWSc4p9n0Ar/+77EmSc18U5JNJPxO7r0FpRR0wor1cFkl2XvNidby1POst9LT2MKxf/SmFGdj99yZgB9sBf+Y+XsVEiKik+FXBAOcyeUy/bKzjqB9v6lV+McdhUJdWwf34OWyv4r6E9rgKa2qoJ/p7UEb/Gck3JW20l4qji5n949WpJLtn0dYW5MYhIDu6jCIQTBFPGVbUF7x77sh7+D4tpHGAPoRyB1ovM9PAQ8JC4H/BSM2LF6ONIRLs80wSWs5SSFIC8XSsg80krzf4YIyHPGxg6nruztLAgbZb+9wYtf2EpQyesHzzU/9o7fXju2oXz/6MXRiUtqUlqdEy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmpJTkdqeHBvMmN1blpnampkdHZVeW4zSFFCVm1XWDBISE5kcGZXQ213UE5U?=
 =?utf-8?B?RDg5UUN2d25XQnRFVEUvcTlPV1gvZ3lZYmtaWGRFaXpZQSs2czdJUnZGdVJ2?=
 =?utf-8?B?R0l1cHpFTHduSUNQcjFMS2ZBeVpONFpJaGx6SklVRE5ZZHQ0UWxJcW9GNXkv?=
 =?utf-8?B?Z3lwNFltZVg2Zlo1dFAzWkY4RjdvNDJCallkY3JYUlJaSEk1cEVIYVVhV1hS?=
 =?utf-8?B?UUNhaXVxRG5Oa1hNbW1XZUJBSWs1bzNvNW1rS3FKd21zQzloWXE2S0d1S0JJ?=
 =?utf-8?B?U1ZBUytRUkpLQ2lxRUgvRWNJK3RZaWRWQU9YT09JM0RBdU4rZjgrK21Kblgz?=
 =?utf-8?B?cS9BVk1LZ0xRWWwzR0FGejBsNGl2Njh4YVJHVjNnS1owUFdYNlZBRUgyNG44?=
 =?utf-8?B?czBwaE1LaDEvblVXU20zRXgzZGFIMmV4QWNsNitwVHVtY0VDM0JaMGZrSFFy?=
 =?utf-8?B?WWNFWkVERnZUdUtpY3hMeEIwSHRiL2dvNjROdk1hMjNkWUFFS1l3cW0yM0tk?=
 =?utf-8?B?MmVWQTRoY1I5TnJpS0dhUkdDazYxZGdtVXRJYXYvamZ0MkxlaUpMOHNmWjZS?=
 =?utf-8?B?Q1Fmd2oycHp4QUJvTHB6TkE1cnVIRTBpdlViV20xei9TVkJ0RGtocU5lQUE0?=
 =?utf-8?B?ZjNHK1NsakU5dFMvaEpBWEp5R3Y5anIrL3dGQWJXQkp0K3RTcmpHNnRxTDJG?=
 =?utf-8?B?S0hRQ21xMk9meit4dGt1anBjYkNWYllWTWx5U01mejV2TVBTdnFNVkVQVzNo?=
 =?utf-8?B?UTE4d2hPRW5BaVhhTjhJOC9RNmNTNUlxQ3N5UVBoVHZGSU5GQnJub3RtRUpL?=
 =?utf-8?B?VlFWV2kyNktzbCs4blNaa3NpN1dWS2tpNldLbTRibUdHd0JnLzZmc1gwTDVi?=
 =?utf-8?B?dVByQzZqYjJQcTNJYXp3WHZ2b0x2YWJIQmRLOFNHOTlub1dKM3dGOHMxd0FC?=
 =?utf-8?B?VGdhd2t5Uk1hS1dNZFpoR0ZZT0dDRFgxMGJhK0hHSytMZ2EvY2FxTUQ3Nnp3?=
 =?utf-8?B?NUtFY0RwN0I4N0EzZHpvYjhOODY1WE1DeEFFNUpZa0RNOUJDY1N2dEFnekhO?=
 =?utf-8?B?cjdpUkNvMFZEUm4vR1RkTjNUUVpLc0VLQjRjKzhFM3A4dElySWVoSmVnbEo4?=
 =?utf-8?B?M1IzZHFHSTVYejFRQlo5MlU5ODJVMWE0UlJtb0VZTE9VNjdVTDdFVCsrVWFx?=
 =?utf-8?B?R1VXV1VWYzJmQjUvSlZDOW5yNmZpcXcxaFc0Q2E3QlhyUmcyaVlNTHNFNjFM?=
 =?utf-8?B?UkdSTmdJZzhwQWtFNlI0czUwYk9Ka25FZlptM3ViTkdqY2hvTHFrMkFPZjVO?=
 =?utf-8?B?N1RJY1BaYTBINWhhV3lZLzg0T2pLV3V6UzZBTkRmN0JWcGF6YXBhRjd5d3dY?=
 =?utf-8?B?NktmbmMxdXlsUkpMd2k2aDBKdVp5Q25tZnArU3RGTDdmOWZnWlJrdXc4blBV?=
 =?utf-8?B?NVc5VGNSUm1zQzFYTFBjTzUxOWM3N2RLNkFwNnFoQStXbjJHMXhueDNMVXIy?=
 =?utf-8?B?NnI1bVlvQ0p5RWJVTlhkRHcxVUh4aU9pbjF3VklmcTVHRnVDYWdoRENEUkdh?=
 =?utf-8?B?bE1LSXliMDduTTRPcmJBZ1BCZWNMa0lxd0RJOHduaXpOMEFBQzd0bmIyWkRI?=
 =?utf-8?B?ME5ydGRDazQzRjZXMnlBdURlMldvRWdiMnBJVEdsYWZvZDRxTlNRZTQrd1Iy?=
 =?utf-8?B?QTFqRk9SZDRBdmRNLzlsZXcwVFFvWWlDeEdxc3JSNEVQOHZXRWdnWm1PTk9T?=
 =?utf-8?B?YVorb2owTmdYWWdHa1BVVmhadFg1dWlzb21nNnlxbHV0ZHBvM3JGTmlJUzg1?=
 =?utf-8?B?WFNrcEYrNFFESjNWbG9hWnExcGZudVdJeVNSRHFQb2FIQmh2a040WlJZUnlK?=
 =?utf-8?B?T25aSFQ0SGh0bTB4NkZHMGE5aFlYNGZqbFh6UHp3eTQ1L1FKYlppMlM4TGFF?=
 =?utf-8?B?Y3l5QVJOYWpFZUdqbFVmSU5JRjNEY0haanRiUlByRzdnSXNQc3htWUozUC96?=
 =?utf-8?B?ejFCWlBVcGh4TUZ3ZjV1UFMzaTU1RFYwMklHUTJjbzA1U1NNbHAxcmxEK1ND?=
 =?utf-8?B?L3lVcnAwY2wyaFBuZG1IbFlUd1BjZTlCSnprb1NyM2N1dDE3WUE0SWZ2WG84?=
 =?utf-8?B?YjJqWUVlTUpnVXZsVXl0V1hYdExKL1BNb3NQUCtQa1M0QzZUV0hoZFJxeHls?=
 =?utf-8?B?eHFWbk14bnpockZaa29jdklxY3lUNCtiYTNKcitCUklCMGtnK295OEY3Vy93?=
 =?utf-8?B?MmVCd0VaRGVTc0MyeFR3bVR5SURzK0Jmb3VidUxXSUZqRVUybGtLTHMzVHV5?=
 =?utf-8?B?clQwMEhWMU8xKzhkZy92ZlZaREpaOUlBL2dDKzh6ejhoSDUzSlI1Zz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f0ac08-24c4-4677-590c-08dec19a4285
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:02:21.9429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BnllPpwALIs5Eh+qptbSSX77nuIwFAcptb/mjbyM6jumiyFHgx6f6aCrPc2ysj0VlWnTy04Joxun++V5Fzx/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1063

BC_ENTER_LOOPER can be sent multiple times by a userspace process
without any error. The handler unconditionally ORs in the
BINDER_LOOPER_STATE_ENTERED flag without checking if already set.

While the existing code checks for the REGISTERED→ENTERED conflict,
it does not check for ENTERED→ENTERED. Sending BC_ENTER_LOOPER twice
corrupts the thread pool accounting because the kernel believes it has
more available looper threads than actually exist.

Add a check: if BINDER_LOOPER_STATE_ENTERED is already set, mark the
thread as INVALID and break without re-entering.

kcov-dataflow tracking (before):
  ENTRY binder_thread_write(cmd=BC_ENTER_LOOPER)
    thread->looper |= LOOPER_ENTERED
  RET   binder_thread_write() = 0           ← first call, OK
  ENTRY binder_thread_write(cmd=BC_ENTER_LOOPER)
    thread->looper |= LOOPER_ENTERED        ← duplicate, no check!
  RET   binder_thread_write() = 0           ← silently accepted

kcov-dataflow tracking (after):
  ENTRY binder_thread_write(cmd=BC_ENTER_LOOPER)
    thread->looper |= LOOPER_ENTERED
  RET   binder_thread_write() = 0           ← first call, OK
  ENTRY binder_thread_write(cmd=BC_ENTER_LOOPER)
    thread->looper |= LOOPER_INVALID        ← marked invalid, break
  RET   binder_thread_write() = 0           ← logged, thread invalidated

Reproduction:
  $ ./To-Ulimit-and-Beyond
  First  BC_ENTER_LOOPER: ret=0
  Second BC_ENTER_LOOPER: ret=0  ← both succeed (should reject 2nd)

Fixes: 457b9a6f09f0 ("Staging: android: add binder driver")
Link: https://lore.kernel.org/all/20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech/
Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 drivers/android/binder.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 0f3fc293cdf0..0430be814175 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -4365,6 +4365,12 @@ static int binder_thread_write(struct binder_proc *proc,
 				binder_user_error("%d:%d ERROR: BC_ENTER_LOOPER called after BC_REGISTER_LOOPER\n",
 					proc->pid, thread->pid);
 			}
+			if (thread->looper & BINDER_LOOPER_STATE_ENTERED) {
+				thread->looper |= BINDER_LOOPER_STATE_INVALID;
+				binder_user_error("%d:%d ERROR: BC_ENTER_LOOPER called twice\n",
+					proc->pid, thread->pid);
+				break;
+			}
 			thread->looper |= BINDER_LOOPER_STATE_ENTERED;
 			break;
 		case BC_EXIT_LOOPER:

-- 
2.43.0

