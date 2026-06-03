Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A6B37D13B;
	Wed,  3 Jun 2026 18:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780509745; cv=fail; b=qLckQASrk/dYKf7K/IYMzxrvUYbAu7vpNLGs0IMZlY5iQlT5BtztDxKH6Z9pk9uns7pOKbACnE5enCLSu8pHhY6i87IqaMughIFbfkv3CdzRv7EfKqBAUeVLIgqn+U4Ba3Y2I89uB7HfXLnVWKXbE/Z8MAlMMDg4fzrML4Zr7Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780509745; c=relaxed/simple;
	bh=TuMzlr3gtTzUCkGV378cISA36JZ73P2vG130/tUcbT0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=e+HatqC1Ud1KxLrftetTaUxZ8V8Pw5TlZVupKzPuX3110ASknGzc5tWLXaPzvmDm9IJIX1/wfLtEB7krhEihWRhvrdVSgycle75cVCcAMBxyYEClck8pJgnfYWTBBrPIqrhPRzErK2INUpW9iiYsKwA1jK9e0SRzItVcjFDx2Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=SxBMXsjN; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="SxBMXsjN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5oPz9yo2U1uHwgn90PtF1JV6+rn0traGs7o7a67aajLBLFkpeudkz+zyIdLNiLq3hgjSHcpS0RMlhaQKJ0jmLU8DEdiVuSp8cXBX91l8GmvYl122wxy8YJGHMQnAi7woN6YzzRVpCpdLWW5J/5nkqNqVcyo3KN3GR0Z+utES3/EcNDIiou/9ervDOlgzxaZTB9AIfkmEL521N4lH9x2sP1xQvtasy6A2rrPwNCnjFs7huJaAKf1cXQGxTosnqUpZ+1GqR7nC5ONUyg52zfP3FnOCLe5ZPQDCBg65WfWyD8okVHFMxCFHc4LDdAsa8dVsrzOODW1mw5F8qo6J1PHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JDjsQMpvPzVj54OjPsp7Oe76ITdj8ufPufvH0z4TSo=;
 b=AbI0ppLHbApiGCieqK2fUTuFKkrC4Ml7wBBgC4+WWYaNhmb9UibJkRClKVaG4M/hH3claSz54qeEZl/264AwcCOLrQG1YXfoBceI0wtd8X7dnyyZBbyI3ToZsH9OVzzA0jgFpF107pGhMO5LOlCFjSV2sIw7OLNOO97mG7AcDk1UyyxrKv0KOMcgeF9Jffz2BdIIE0y/b2Sn4B6BGZJ3nKN/e5hxt+CQNDAsRBNCzmcZqG5eUDdhQwicV5NIA/SrwJlM7j6pwCmANCohagqnPADEPYLmdQrLk4AtCQHiuol+9we+jouzRPs/WZnAQQ74Bet3aV+mapMbykE4mXehKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JDjsQMpvPzVj54OjPsp7Oe76ITdj8ufPufvH0z4TSo=;
 b=SxBMXsjNEKlIQFvmHpFnsMXMu9cJmxYhINPOON6rhAkIZGL3v+gciQDbq63/Wja/oK5RqRIPMxT86bPxZwA9VLh/OJlJzXB2aDa7EgDyb9zGRSCADK+PhgkDX43soGooHdeZ7ARDtk4BkBTL2+RR3GsdpCBXj72Ih/QmspZi+HlMUMZwqPdXmGjhgbnZyRt2DNkjbwRUgGdjUE0XVLLJleid7qplBOwShMaezbxWKwzuSyTJLOu2zLWjD8AYGyGwbfl6GZe2SQqLhO7if9huMbaqTdlF1T/wOg77WL2isQ3YcwVdfQIEUdL6KKjVvEZIGThQUohS10P2mhF4ubhW4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by DB8P189MB1063.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:02:20 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 18:02:20 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Wed, 03 Jun 2026 20:01:42 +0200
Subject: [PATCH 1/4] binder: cap BINDER_SET_MAX_THREADS at RLIMIT_NPROC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-b4-binder-hardening-v1-1-d0aae3556c9b@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780509735; l=2014;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=TuMzlr3gtTzUCkGV378cISA36JZ73P2vG130/tUcbT0=;
 b=Jj0PIiU+CHBnWJ6WUT7R3cpVaUlxZcG2wrydt/Ndd/FzMilP96mlAKNgTa8Li4wAUqaxgJ2AC
 Iy0isnuv20PA7KOFHxSCRTz2LRbEXGnw03+/k5EtmM1x3LkCSuQtTo5
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: DU6P191CA0069.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::22) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|DB8P189MB1063:EE_
X-MS-Office365-Filtering-Correlation-Id: e4234757-6d3c-4c64-70ee-08dec19a416c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Omqbc6tiKQlERWgY2gsTqdsZqAm5+vK3DFC1DSPDQOrK0tqdzhea179j8awAPa2HyoigpRSe/JmJBb6775czwIX/Vi+VzshkjXcgSr5hwIXHRB90mAJmG2/2SLEmWjKUFu4PfftlpeDSOEXReQz0VIMX5UTrurhdA1Aumi5RTgk9Y7CORZonR5ONnbnPiOa8gm1YebXyLAtKHq1Rq918VLlyj/pc46KYTg8vhx0wJEST6GMZv+lyUhzZwddojaqcw1NBcN/mAeDTrdnvv2MozXK6aCdeFRGld9ROFp0DqIX0Hs9uATLoxeiX2OpTG9eTOOSn1UQkhlOCme6aVKIztLKgaNMD90d2hPis6Iwzzc0WW9RRkcDq6cnVDH58Xg9OgFk6BKPnoYFN1hb7mMZ3pWvI/alzas1jC4CyW6jpeomLQmM3uUeHpDYV0R9APUDEo5ZwZ4/v8gAOcYAJscf8fXxJ5VtYVjdphL7oqwntvirPdphbNyhXoOMvIxgvoFy5VLOgr9WalAneanVczMSfZ/RC68PQs0MllFaqCGmaSFmqafuRfJ829av1/jrKxOIgEYqmLZcD7vZZIE4s6FrXldYvPoiURn2rzTmZY1fkhcszFNc0RL2UuZOkhVHXB/y/G5vJLE6HRohJkpV4dNgViqK2/aFYgitHNs2oM2BwK9ixLabOYNc/koEOkKGbyNt1EcPZCnUQ0ySdXMEOa4A+zKVVFCfli63L30b3gI/bUDMHIkXp7oHc8xO0TXn+Mrzi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajNieXdSR3VSYThZdFBvUG9IejlMejBWcmN6VmpLaTFjVkVUN0NkRFZSVjl4?=
 =?utf-8?B?c1NmZllYb2JveGxBTjh6NkE5eWxuazFOSGIreVFJam5EQUVsZHIvWEQ2T2tv?=
 =?utf-8?B?cUdVRWVUS095ZitGWU5LQzhCOE1VY1N2N0RsOFZQV05LZ2d6MUpZK2R1Vi84?=
 =?utf-8?B?WklTU1BFY2phVlBZVDM4OVZOa0RnejJPMVkva2kwekZqMld4bDZPdDVnbzRW?=
 =?utf-8?B?NTJwUHQycEU3azFPeVdkSHFMVC9LZmZ6b1B4cjVQeVdIR1VzY21ITk0vUEFN?=
 =?utf-8?B?MHpHVnV2dncrci9HYzM1bWJpU2JVU2l1REdHQWJCSHB2d3MrcnNFUUhJSUp5?=
 =?utf-8?B?MjE4RXdVSFVTOVlyVDFlV0FFci9RdG5zeUhzSlVWeDlzTjJDOEVJcDlYM3ZU?=
 =?utf-8?B?WjdpNVBBTCtmejAyR2Z0NC9qcHlJSWQ3Y1NiSVVwVXpRdk0yazd6bzA4Vzlz?=
 =?utf-8?B?RkM5b1MrcENIZXM5SUxzKzNzVkM1N2hKKzl0NXpkdmFHVnV0TDlEelNscHdQ?=
 =?utf-8?B?ODNzSFEvUlk4NXN1M2pXZlY4M2V1SXhkTFhQTVdzczVMUVo1cG1JemIyNU9i?=
 =?utf-8?B?anl3VmoxVDhuWFBsSkRjK05SNVJyaFZRZldvb3BLNzJIUnhONk9SN1ZUbC9M?=
 =?utf-8?B?MUE2ZGJ5UndVODc5VFFIbzd6WENPakFCQ0VoS3B1d0ROQ1hYRHJ0YkdvdElx?=
 =?utf-8?B?MitEZjV6a28vSzgvb1ZDd2lUVkMvY0N6VE00L3BEOGdHMnRZTXFVMUgvQU1p?=
 =?utf-8?B?N0Vadm9tWEF4dHpPYUgyYVV5TGlCK0FFM1VhbzJIR1BDMHRoSStPQnlKTC9J?=
 =?utf-8?B?S3FVVnNWR0NjYzZTSVlwZVN6V0ZKY3FnaVUxQ0kxZnFJRGhpMEJIRHNYRDg4?=
 =?utf-8?B?L0ZkM2lBOUVxOUZEb2NjMTdGZklCUHVwa1pHU2hOVFpUTXErNVdCYWxoMjQw?=
 =?utf-8?B?eFFUOTRDNXdBN1MwNGVUNGxYMzNVYUdqSURmaVBoSVNlYlNva0NYWGxBK1FF?=
 =?utf-8?B?RzQ3clFoZVBUNkdiZFVLYnA2WVlOa3BXd1NTTzVjT0s3WmFnWEcwb0RNMFJn?=
 =?utf-8?B?WHY1V291bzIya3Ntd2h2NklUS0tqdzRYbCtucm1JVVVObHd4VE5pQjAwOTUv?=
 =?utf-8?B?ZmJPYVJTMUFtbHpDeXJGVDVsa3duUW9rVjgzYjJNTHFFNFplMmxwV2tkNFdE?=
 =?utf-8?B?eVRQckhDSnFYN3d3Si9qY1lKRnp2NnozQ0Y0cW1LT0E5N3VaYWRDYzBXOVU1?=
 =?utf-8?B?NThrdEpVTzhlMkdhTmgyOXRTbTArUURZSnNTa3JUb0tiVXBEdWxiMHY3ZXJ1?=
 =?utf-8?B?STZZRlVOZEhrb093SCs4NnF6NXdhR2FQTi9oVjZ6MWl2YlgramZab004VjBp?=
 =?utf-8?B?cDFaTG1kNWh5K0xuc0hYSlZZVndGV0dMREwzVmVQclBzWi9KbkZwc3g3YW9v?=
 =?utf-8?B?clczUDlaVk1JcTcwRXFjUUdGUWsrc1o1bFcvYWVndFVRSXpDWDhpczBwZHZV?=
 =?utf-8?B?cytkT3Z5S0VKa2k4S3VTRVpBOGFzWWtyK3lZMlJ5R205cXBLNjFXMWFhZGlm?=
 =?utf-8?B?MmUrSWl5M2kyYnNwLzhCQ1N5eWtnd1htK1YzTVYzbkhLcWh1d3ZreVRYQVBF?=
 =?utf-8?B?Um5FVVV0dUgxczBKdkVYQnIydFhuZXFkKzcwUXhTVStKV3NXVE9Gdmxyd1N0?=
 =?utf-8?B?azFJL2lBVlNDRVNvZ1R5UWJGZElUZDRrVllnSlBZQTR5SnZaMld5cVFsaGJk?=
 =?utf-8?B?eG03UkZEZXo0Z25qUXFTUHk0NzRlMzlFVkkvQ1VDaTBhMFBYTC8rd0hEWklw?=
 =?utf-8?B?U2hoaUNIOVVTRGthTFlRU1l2QngzdUk5S1FHY0ZCLzMzM0xPVktncnR4cnZl?=
 =?utf-8?B?ak1RbFJzK3lrNUpQNk1TNWxUK0NYd0k1citZVlR2bnhhelJPaDZJUm5kZUtm?=
 =?utf-8?B?NkcxRXJ5Q2hpWUxaQ2ZVdlhEcWE0M3pjL1lmcDN6dHZJZk00WW40T2VUcnAv?=
 =?utf-8?B?MU1FN24rZU9rUWFoL1gwYmVHMk43NXNWUFA5bzJ6L3hwYWFvSFVjSnVCN1c4?=
 =?utf-8?B?RDM1ek14MEx5WlpTL0R1dDdJc3lzcDhIMDlUUmdmNnF4SUUvQmNtV1lGTHlP?=
 =?utf-8?B?OWtvKzdaaWR1UjlWTzZuaEFQcU5nQ1ZFVHJVVDd6OURkb1JuQlp4RXpaeHpj?=
 =?utf-8?B?amVCZmx5b2UvREhPSFEzQVpBdFh4WE92K3RvMVhDRGx4WU4reVoxUXA5b2Zw?=
 =?utf-8?B?NUVYRnB6Sk81ZG84L1dYL2hpa2NnRVdEeTE2Rys3QkRrWHU1d01XYnJLQkk0?=
 =?utf-8?B?WEprWlVDc3ptTkRMOUlOWjEwMVMxZ2VPVXoxS1lsME5rRmI2bERVUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e4234757-6d3c-4c64-70ee-08dec19a416c
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:02:20.1522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yti8TjfyaGeXfy5F1cT/4RqYVA3mrLtYgrS2gf7i1oKVU47x8YvOMj8b3ABwc/vAR7dy80Btoatdv844WoklsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1063

BINDER_SET_MAX_THREADS accepts any u32 value from userspace without
validation. An unprivileged process can set max_threads to 0xFFFFFFFF,
allowing unlimited binder thread spawning via BR_SPAWN_LOOPER. This
bypasses RLIMIT_NPROC because binder thread pool management happens
in kernel context, and exhausts system memory leading to OOM.

Cap max_threads at the calling task's RLIMIT_NPROC, following the same
pattern used by io_uring (io-wq.c) to limit its worker thread count.
This ensures binder respects the per-user resource limits set by the
system administrator.

kcov-dataflow tracking (before):
  ENTRY binder_ioctl(cmd=BINDER_SET_MAX_THREADS, arg=0x7ffc...)
    ENTRY set_max_threads(max=0xffffffff)
    RET   set_max_threads() = 0             ← accepted, no validation
  RET   binder_ioctl() = 0

kcov-dataflow tracking (after):
  ENTRY binder_ioctl(cmd=BINDER_SET_MAX_THREADS, arg=0x7ffc...)
    ENTRY set_max_threads(max=0xffffffff)
    RET   set_max_threads() = -EINVAL       ← rejected, exceeds RLIMIT_NPROC
  RET   binder_ioctl() = -EINVAL

Reproduction:
  $ ulimit -u 50
  $ ./To-Ulimit-and-Beyond  # uid=65534, creates 300+ threads bypassing limit

Fixes: 457b9a6f09f0 ("Staging: android: add binder driver")
Link: https://lore.kernel.org/all/20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech/
Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 drivers/android/binder.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index ec0ab4f28530..0f3fc293cdf0 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -5801,6 +5801,10 @@ static long binder_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			ret = -EINVAL;
 			goto err;
 		}
+		if (max_threads > rlimit(RLIMIT_NPROC)) {
+			ret = -EINVAL;
+			goto err;
+		}
 		binder_inner_proc_lock(proc);
 		proc->max_threads = max_threads;
 		binder_inner_proc_unlock(proc);

-- 
2.43.0

