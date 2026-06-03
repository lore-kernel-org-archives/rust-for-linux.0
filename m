Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF12137D131;
	Wed,  3 Jun 2026 18:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780509755; cv=fail; b=QtuR5QL0lGgPHYGjxB/JB+1YqRRYNv/0TJ/N8lfAmHzwkRMYPOVUOG8tZeC9ua9/NKL26mCETP0J3fAdhlD7p48BrYKTFwF4T9QfD42/Pb4/vUatZhsJH6GYigB+GXVo0C/aDHtUSjgiNuzjPlnX1cUbJ6FS6ZYva0xDHnYjjNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780509755; c=relaxed/simple;
	bh=gFgOK7ZmMMeG3My4iRRKYf9nA0ykQXQ2I9XJxLmS858=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aMF8IamYSIv1QYNT/OktKC0BgmqhQRPE178wSXpbRWc9QJybuL0FNpt49ugutTi+cSmux6bUtVBVxZBiiWHLac4FrT9NjHVGORE4pRMRubr5PxwASLU4tu/m9wDtG4FQv5g1RSU69rIFURkMFO5iOkpI1a6r8mca38FsW/bS92w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=goCATmuX; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="goCATmuX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkxhsbUPopwRozCX+pTgBJlllpAJsMZzMf6uTN540FRo3cghFI684U3q5BOyVoUGzlISgs1ctWOhxcUNjUmjLF+xgsZeT90AN7xqf1Qq0F0+w0bZtziUKrdFrd+//QPYxIVtpi6aOk43tU6jdWApewsXOD4GGLs7QD0CdwRp+Ut5bjEXzshGnH/NF08iIPU4t/EQW9L+7oCPdhHPi9Y7VlbHfYUygYCN69oC2+tlG2yaVzxC3YJNeSziTx+QvPUFyPGHKsE6QbyEFGl7YnntKw2tK1eFICzxRzwfBsZfgZfk9TJ5WJbS3jTMf0oUGjRGT79bvYMorxhhovvq3KboFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ceLLZrWfFjKiu0bfHxnLBvylgfiaV/HsUFzQSI55ds=;
 b=PU9c8mC1QXHrXOMq8iVRx8xuVo9JKCZtNsvZIePvbaxALgsmIvooGkw4Qf/gaaGKWihb65RZE2OBdje2t/kp/pUrVl5TKcQnuXHgqTaBfrEKPI9W9RBLLtOFofBisJkhPmg8wC51MXeTSuSxamS3hRqvf6AK5vQHOsvOcJ0Wcmdm+lNzaKkaJDEXXy5It3WT0wOx3ZvaQP5SFr9rMmy64KkinQr3i/uMjZgC+Rw5mQ+kghNEq+AEpzb5KIxE7NlQlVxGAMI1k1CXIXNbbzx50tzBfzLE2B7gLqCCfFvXkvx7k2LYc0Z9VSUSPIkObfTKDgahi1CaFIyU1uynnA7BUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ceLLZrWfFjKiu0bfHxnLBvylgfiaV/HsUFzQSI55ds=;
 b=goCATmuXa4I96nK7WjZ0y/YzHQVPEfuxmg0nMci0gdZ8OdWCJqiCdTeBMT8WdAyM+Ng11jITK9ZSqpG7Q57TnWf7YI69p8TP/YlZA07yLvTIB6hQBUSsEemvDl8YRPR3O2Nos66Zn78r1qZ12KZ3qA0A9spEVYqLwSilEXTbTWwAolgWRnJBenxbQ0OoOQREUFFDVeQgvI1S1lcLmCO8Mo/NCrvJBh4zz4dxaAwTFgg8XCaIP/oGw6UXWTnrN9IK4PMhoPQcZP8cAhxE78FCpx/qMv4kAvPdZvQMAj8nIAVugTXW5Oxl8cL+IO0g9BTSjNMZiTaOuQ2oAg8Jk7W4Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by DB8P189MB1063.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:02:23 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 18:02:23 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Wed, 03 Jun 2026 20:01:44 +0200
Subject: [PATCH 3/4] rust_binder: cap set_max_threads at RLIMIT_NPROC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-b4-binder-hardening-v1-3-d0aae3556c9b@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780509735; l=3150;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=gFgOK7ZmMMeG3My4iRRKYf9nA0ykQXQ2I9XJxLmS858=;
 b=skcdQxYOTiIwq/JMHk4gK4opzI9e+gasxH4GoMfn/861WWPZGVsY/ibTSHtDZqulvW8lHjLbl
 3QJ5unFKY4MAG1UapnLNVIr8OGV1mjpdHcrxG72KlWrTuyoRbfXNNpU
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: DUZPR01CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::6) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|DB8P189MB1063:EE_
X-MS-Office365-Filtering-Correlation-Id: 1769e959-9cb1-4fc8-51d5-08dec19a4380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|6133799003|56012099006|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Jk3QXRtw7M1qUuH3ZGA1qRfNskv4A8UirGBHe4Q28C/CWUyDB8b6MwkS5ZTJH7r+wiJzx3P2Vut1MLrroz9iO7Eb/sdZ1RyyzAq+Faj4xDSDv3455HQLuavx0tl+HhbUzXj44rSLAqOQZ6vLAoKRgnGJqFX0tKH5WHaRMQAA1iwY6n/RTYcReNjUNcxjhWtnGyKwIZB26S6LBPCMYnBDg6XwWkJvk8n6cXOuh8TVibeJ132p0w5P0j/fHffthrkdQJ9x8n6hsUHoj+zEaJSfXSo+x3w2u5hZzKJCUANFQNNgp86rqv6vpBBv+G9+fZ6K6k3R5OOOgTGd+Rhi+LyzoJksNBdTsy9I1DLkC3k73iDz0ipjnYkQEbSdYOfCd+mY7sAZJt4psDYi2fo1tDVLbYMF981kla81S83fbkQXSv5b3zCUPde52krosjNFyygjDF0oKv3t4x29IQzGVLL6JoA5gK1shskXDMsg6qcikiAG+RYGEpwTmNabTYAI5RfoSm6PmCXmWAO7MVna8+THOmWn5n+sQWNDKTHJct7TeluklUnhL4U2WDpxtKRqEcbhnCSXV9PHlNhrnE3I0W82nFcYNlZmyYfdZl7rsPiVzevdyujdcZjgR0QyDMKNPtRQa1EfdgLabHxCpqPlsM8quUt2Yrl9PTBpp7RVGWxwoylPzUCHRvF+B0d78pKu0uRegWPCLN3EhsmS9acs93ktTm0tqN8zHWls1dM8ZcSTHVSPpwtF+bgFEWNa1hqFiwLZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(6133799003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTBzcnhzNGpBYlFoT2hXcDJacnMxbVAxOVgrWDVXSmZFNzZjd2NBY3ZROU9p?=
 =?utf-8?B?dlZnditPWnN1eUY3M201dksyUURQRFZWdlc1OE5QTzlMUzFuYUsrdDZpb0cv?=
 =?utf-8?B?cUY1SktzNktRb0NOVWJPYllpMmVrQXpIdkk1MWJQU0Z0SDcxQlpCZTZ6QlVs?=
 =?utf-8?B?WmpWdUV3Y2Ywb1NSWk4veUNlWkRNamRSOHREUmZ6b21CZlplYkNnWUo4Yjdh?=
 =?utf-8?B?OXlZbXc2bXhHTGJUU3BybVQzUGlIQ2tTdUQzRVJwSEErUmhDNXlVVU9ONmJJ?=
 =?utf-8?B?UlJ4elVvWUxYSmlhclk2NENsQkx2QUdYL0hqbVQyOC8rR011MFVxRVNwZ1oz?=
 =?utf-8?B?ZlBvU0lYa0YvZWNUMjhodDFuNHh6MzJoa0dTYXExRmgxQ1lFMTlYNEV0akhP?=
 =?utf-8?B?QUh0ek0wOU9FOUtpc2t0Tzd5Vm5IY1RMT3hheUd4b2gyS3NUanRDNEFxUTZZ?=
 =?utf-8?B?aUg5T0Z6K2FBUXlYRW9iRHEvUGpLTStLaXppTk5ma25VQUNXOWVhckYvdEZB?=
 =?utf-8?B?OC94T1dmOENEVHFDNEg4TCtmazR1aFFxblBYOGdBZjB4bHdFWkM2elA5Vjhw?=
 =?utf-8?B?ZEQrbVZ5aDMrVzRQN3c3ZlJWdEpFZ2Q5UnZkRmhZMFBuZXJNcUZIVzBPeDYv?=
 =?utf-8?B?Wi8xSFpNNmszUUliSkFQZjlFeit2V3lwYU9sSkpuUjlBVFdVcjVIc3RkYmhz?=
 =?utf-8?B?QktaNzQrdERSOWYybC80MVRWQ2NwbTg0ZThpaTVUTm0xeXVoQ0U3Yy9GSm9Q?=
 =?utf-8?B?UjRXcDRRQ2phajFML0NxNU9peEtMa09sUVhFUjR5T2tFMi9pc0tmbTRjN2do?=
 =?utf-8?B?SS9vRjVtbHV5bTg1RVgxRDYrbDNDKzFOam5zVUZMZkFNdUt0NmMzN1ZrdEh6?=
 =?utf-8?B?akd3MUdMYVE4UjBrNWpqMklvWGhDMGxTS3YySDZvdEl4OCtuRzdXdkNsZ1d2?=
 =?utf-8?B?K0hhNHRpUkNCR0gxSzkyWHNER1VHSmhFZ2NQMkpWWnVWT2sxN3FoT1BaWkRm?=
 =?utf-8?B?b3poOWx1RlF5bGhYQ0VZY2dmeVpYSWdTZmt6WDNZQmE3QUZpZXBQUHhWREgy?=
 =?utf-8?B?QldjT2k2SVhweWMrRTJYYnJPRngrTTRkTFE0LzJsRlI1aDRjaGZkeDN4WTdI?=
 =?utf-8?B?ZGN2WFVuVGx5UkE0NEd4YlkrNjY4NjJGSFA0akg0NzNwc21PcTRIczRTTzY2?=
 =?utf-8?B?R0JIN0dQM2h3aUpXWFhUYUI1Ni9kMEx5dXNrRE9OUTZ1aG9BOHlaRnJGeFNq?=
 =?utf-8?B?TnRPMitHb3lLSWtWYnhYaGRnYUpuNWd1M2tza1dsZHVhekU0aUFtaFJWd0NS?=
 =?utf-8?B?Q0cvNHM0cHU2S2RpUmNSRWUrOHpmMzVndTlSdC95dG1zckdvZmNoZGQ1cHcy?=
 =?utf-8?B?c3ZlN0lYNnhQQTUyYlVwUjh1U0RLVlZwNlBJdFBRZWdYeExoT3dvUGRSRlZH?=
 =?utf-8?B?V09HbzZTNndjNHY5bko5V0ZEQzFWY3Qrd3BvdTlGZldlbHA5U0tsbDEvSElS?=
 =?utf-8?B?a1JUSHNnYmduT25XSkxVUTZlS1J2VkxwNlFta09EUEM1Nis2TGJPaElQQWkx?=
 =?utf-8?B?VGR0eXdCSEFUSlBmdm9PVkN5RGR6eVlldlh5aER6bDVrTVlqbmp5S2xkV1Zz?=
 =?utf-8?B?cE0yWFluY1JFL3N0VjMyUlBmQXNoNmh6U044cXFzRS8wWnZMLzRXVlVTUUQ0?=
 =?utf-8?B?VmtaT0IyRVZrdmF0S2E1WDAzS0xDMlpnaVdYa1FjbUJTRHVLaDhOek5JaXF1?=
 =?utf-8?B?aVhBMlN0M2RaRkVqdHdPd1NPL3VZYWZHeWVEN2plMlg4dHVla0x3MnRjYnZR?=
 =?utf-8?B?VHBPbElEZVFaTW5FL3J1MEYybWhTT3NyY3BVRmxzOUU3M1FyODFCQzJlM1Nx?=
 =?utf-8?B?b3A5MlpoRkE3NmJ0cktPN2gvNFJzUlAyN1dlaTdTRVRnZTI1YjYrQ1V6eTRM?=
 =?utf-8?B?a3plSTJlZmkvUzhFNjlHd25IZ0QxdGhDV1VlZG44MVN1Y2RFWGgwV2t6SzE4?=
 =?utf-8?B?MEZPRmlpSnRiaXRpZEs3NFdxRUtmUk5yWVBZQnRjemFGanQ3QzZLdG1rcTND?=
 =?utf-8?B?QmJvWTRHZ1BwaUJuOWpOR2kzcDdYc0tDdzFDb2Z2YWZ5bHFJNUE1cGJGUys0?=
 =?utf-8?B?V09EdVBzTHVRQk14b3pyWnM3SnVyaFRGR2o1cG82NWhCcU9uYzJWTkhnbVhS?=
 =?utf-8?B?dnFLYTdqbzJCNGdBWjlsOUQxWFZ3VzAvUEIxblBuZDIzQVNyL2VGM2tvcWUr?=
 =?utf-8?B?eG1va3VwRzFvK1N2YllsMm1RaHQ1QjNrNk9SbjQvUmhOanNFSmlwb3JWdVpW?=
 =?utf-8?B?aTJldEFzUzlYL01QbHZJOURYSlFrOEluNXdUUjhGOE80RzBXSnpNUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1769e959-9cb1-4fc8-51d5-08dec19a4380
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:02:23.5859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgsrbjSkXqoWNCXKzOp1AXQ9GozxHS3Vjq4GnrFj+nN9zYoEB8ekE6BjVzD4QiiAXtFT6J+KrYTQvXRy+X3xDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1063

The Rust binder's set_max_threads() stores the user-provided u32 value
directly into proc.max_threads without any bounds checking. This is the
same bug as in the C binder: an unprivileged process can set max_threads
to 0xFFFFFFFF, enabling unlimited binder thread spawning that bypasses
RLIMIT_NPROC and leads to OOM.

Cap max_threads at the calling task's RLIMIT_NPROC by reading
current->signal->rlim[RLIMIT_NPROC].rlim_cur, following the same
pattern used by io_uring (io-wq.c:1488) to limit its worker threads.

kcov-dataflow tracking (before):
  ENTRY Process::ioctl(cmd=BINDER_SET_MAX_THREADS)
    ENTRY set_max_threads(max=0xffffffff)
      self.inner.lock().max_threads = 0xffffffff  ← stored directly
    RET   set_max_threads()                       ← void, no error

kcov-dataflow tracking (after):
  ENTRY Process::ioctl(cmd=BINDER_SET_MAX_THREADS)
    ENTRY set_max_threads(max=0xffffffff)
      nproc_limit = current->signal->rlim[NPROC] = 50
      0xffffffff > 50                             ← rejected
    RET   set_max_threads() = Err(EINVAL)

Reproduction:
  # CONFIG_ANDROID_BINDER_IPC_RUST=y
  $ ulimit -u 50
  $ ./To-Ulimit-and-Beyond
  BINDER_SET_MAX_THREADS = 0xFFFFFFFF: accepted (before) / rejected (after)

Link: https://lore.kernel.org/all/20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech/
Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 drivers/android/binder/process.rs | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 96b8440ceac6..4752b84505bd 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1139,8 +1139,19 @@ fn remove_thread(&self, thread: Arc<Thread>) {
         thread.release();
     }
 
-    fn set_max_threads(&self, max: u32) {
+    fn set_max_threads(&self, max: u32) -> Result {
+        // Cap at the calling task's RLIMIT_NPROC, following the same pattern
+        // as io_uring (io-wq.c) for limiting kernel-side thread creation.
+        // SAFETY: current is valid, signal and rlim are always initialized.
+        let nproc_limit = unsafe {
+            let task = kernel::current!().as_ptr();
+            (*(*(*task).signal).rlim.as_ptr().add(bindings::RLIMIT_NPROC as usize)).rlim_cur
+        };
+        if (max as u64) > (nproc_limit as u64) {
+            return Err(EINVAL);
+        }
         self.inner.lock().max_threads = max;
+        Ok(())
     }
 
     fn set_oneway_spam_detection_enabled(&self, enabled: u32) {
@@ -1574,7 +1585,7 @@ fn ioctl_write_only(
     ) -> Result {
         let thread = this.get_current_thread()?;
         match cmd {
-            uapi::BINDER_SET_MAX_THREADS => this.set_max_threads(reader.read()?),
+            uapi::BINDER_SET_MAX_THREADS => this.set_max_threads(reader.read()?)?,
             uapi::BINDER_THREAD_EXIT => this.remove_thread(thread),
             uapi::BINDER_SET_CONTEXT_MGR => this.set_as_manager(None, &thread)?,
             uapi::BINDER_SET_CONTEXT_MGR_EXT => {

-- 
2.43.0

