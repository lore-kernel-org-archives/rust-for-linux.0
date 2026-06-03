Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7779337CD24;
	Wed,  3 Jun 2026 18:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780509757; cv=fail; b=HPy4DpJvxSaXnVrNTqUvy7yhSV8795X50tHQ5LdDHnoDLVVnPBGk6XMWyvzcAZ80RblKUuE2VGLkBP1qlT6shwioVbEQRvCRiiyYKB6Cs++u6kIz1tRK6SPjADBUW4IjTl4HSCwn+5poTDIRezAqubhKPtxoCEWMwnZmlyyK0u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780509757; c=relaxed/simple;
	bh=XlUDOu0BEw0/rOS6pbVGFLOUw5oTqDya0QxeMbpiUEs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IrPgo/cnhqNE4W7GLCyTr1zwRdo+7eUGpvowbFa6QkIeLByzORA433UuWRv4tXivk+NcuF9ZtLzGXD/gBop6KXxHE8V3tjcTdbH8TuM9qrt8kOKcDEt54cCx8qNqHOlnT1ks/+IWbNHQ+lUXRPap+TlhneXhF2oulFbcRN/qPV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=WAtkr/Md; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="WAtkr/Md"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjDJk+0KAZmNo489xmEfJvKiwriLcZ1z7T4GcvMqns8YsA6fTc8lJPM/Ke4m0LpORCGwU71O3KKri0a26fwXhH9CCWbsm+zlslCaIg+JosOBCMYApVh+4FYK/d9hY9XQhKjwC6zy6M+1W08QVZek6VObHwBUZobE/XI2tVBqiYE6hYRQfpeBXZ59i3QmFpCr0uZtCEXm3rOsSARdbNG3LKbu3DbHaAulu3S2BrSlaTBBQ24tJpTXaxMvSQaGRN1l8lkJpcVc5h2QtWaqeqzHuF4GkNhfGuK57JSn12ZWGIf2w1bJHhtLlX/96DZzdOoKSREWnRQcoVy7ofjcXZJUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcOh4HTixlKLlaYly/TbobnzxKVTwqvNQaPVMBQ1nkE=;
 b=wmaGJGx9JbLgbPkYb5uBv3yFv1jZrDt5dZYVYC3k3YcuZclZg8dtWV688tO8pHwh5w80qFNQjr9F2Tfncggpx3iz3bIrioSHZoqMQV2J8EWw8u1enzKND54Z4Mr+38BiZipCrsS32sFU7kUNcbNXoYBJGhGB0AzX/E5xWl2ypEcPLRvmWzDlokbLVrv1i1IEiXc6XuZbVuQMxMOUgaOOf1jVkf0OQT/1Cl2Zy3NRvXJDQKosuWyPxa6p8Oj26sB3EAGHHVs+qJxIe0LKfcAXLd0vhfLT4WGvCop5g09lryeVoGSDNKEmAEmgrjQ/QvJt06QVezst72xQcHDkysjvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcOh4HTixlKLlaYly/TbobnzxKVTwqvNQaPVMBQ1nkE=;
 b=WAtkr/MdaTMRjKQChYJbz+8/DlJzsXw8CftExP0lgcnZA6oALcrG5hX3RXqhHLnREfMbgUcowWcVAaiJF2kUcIZjklMnnDg0Y8VPdTyaaXTGyx68FF0pGPvFNMqHelWR+qhM5O5Q0svQscr3326l+2BJT8DtwH1l1sYPO6ySwh924hpIiunhxEyRSX2C33cZnzfn1cB1qUR/DyyxyQenI3N7iwAQX/Dj4BqAa9RVCArwsHm2Jhy+4mP9fBiSO3ZUlL/zZNqRkFjTjveGT4IsAgAAer7djlkyKHvB2VbyXgvtj9spu72/+CXSFj1evlrbHI5Tns8GAeymRBPlcB0G3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by DB8P189MB1063.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:148::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:02:25 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 18:02:25 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Wed, 03 Jun 2026 20:01:45 +0200
Subject: [PATCH 4/4] rust_binder: reject duplicate BC_ENTER_LOOPER in
 looper_enter
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-b4-binder-hardening-v1-4-d0aae3556c9b@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780509735; l=2364;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=XlUDOu0BEw0/rOS6pbVGFLOUw5oTqDya0QxeMbpiUEs=;
 b=u1QnwLijen3VysQgrS2UTrODzW/8VYF022DituzOFMSxKNMQRIPI+tWGqzPlOlTxkHNuTYMu5
 seHniMldcJFDebSo1vKy47lvtpoMo9jXYDptqcTcmLNIJOcEIGgo3Fr
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: DUZPR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::12) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|DB8P189MB1063:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3288be-0714-4da2-0e4c-08dec19a44a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MfhgSCYJbPuTftD4cTJEA3i985bRWm5smRZiL/yUg+q/rK4aa4dQvnflHHebIiSPY/s7l1OgbqlMiDToGl/stLQkuYjlE2zxWMkm/Q5PMj0NC9ujZG/8nVr/g3CuDsXX0BPB/Aufln6f5boYaHGriHsBjeqbOAdU39dpmze16CW3KSG5hyN/cY4bKevPHqIjzFvHytBrNhj0xAclW2OMFy7WlSuKsMGuOlo0iUNYDPYivHLQ9vrIAjyVboCYdPBDcEQsaaUT++S0gKrUIrH36RZMxnkqW1Mk3W+rEN32oLBI/D9A857/vrE/ERqD0bsIkyBORpigHeSt+9ijkJZf6TYwwO0LKPkyD9spcoeFAlVmVtvdsWwwrcNg5HxhQSNAts6qj5WnNNqRgongF8PSrjVBOV+PbDAMgpyvSTrxPPUASMcGbZQR+LiHXyiUbcop66ctt6eCRj3/RRRgPECHmKZdzKD2FSE38qxgQwqFrCSGs4ek/L7PwnATfpSG6zLlXSmjH0H25EIm6kuaFqM6S0FtU1LwnX2AXzC2TexZylSzMJu2o+EZE1XRPRX8GY+nTUeil36i6kRwgEbOeNjwwSjEd4JqCHSHjYghbxtx3xVcP1U1tB5dJ1TARpIiJSH7Wu8gf9zaYwQDUmKhoSGv3tyiUSCNPyiqAi/Ac1C88eVNwrPI+9KsEMJzb9cUU6bmAaro6lXLOJIR/kEzxfZrttv5Y0CbEtutf05bXWbWeyO4XhKnI6tzn7X3v9t6DcaZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vy9ETjVPWWRLcGdVQStYS084VDBOY1J1UURTN3RNaHR5QktqdDQ4WVlZaFdk?=
 =?utf-8?B?Zlk2aUJpYWVocFpZZUNUUFNIbDZQSXlFWUxET1ExcVBETXp1TTR2VktMc2dO?=
 =?utf-8?B?RFk3eG5mUkJnMmxYWUlkOGE4OEtURTFFUzNFMS8yMmJWMEVPVmM0SUVYdTVJ?=
 =?utf-8?B?eGtKaWphdEdSL25GU3FTZ2J4dFhyMWdmR0Y0YTRFaGQzZEVTdTgyKzJmNFVQ?=
 =?utf-8?B?cVJkQUZPNmpxMHhUUW02RGl3MGM0WTVZTUV1ODIzVDFzeDhpZjU5NXRLanRV?=
 =?utf-8?B?YkhpNm15WVhwTlNRNE51dGt4eUtvSTBwYTQvYmV6MWp5NUpiamJYL2NESkZ1?=
 =?utf-8?B?dHpqMzcveFFuWkc3MlNCTDF3MllHUXJsbTBGRGs3dGhLUEg2NzljUzJJVVM3?=
 =?utf-8?B?Qk1QalFMcHV0dS9kTnhZUG0reGdaTkxuR09JUXdrRThpNk1UaSt3SGRueXpl?=
 =?utf-8?B?cGppek1NRnp2Q2drVGdaMk1GL1NnS3ZMWEh1dzJLUUZWZWZVYTlibHNkclBu?=
 =?utf-8?B?SnFvNEhtSUI1UUpSSUlacUcvRkJ2Z0xBb2xCbjR1Nm5CY0ZuL0pjV1R5WjVv?=
 =?utf-8?B?T3Y5UHdCVTJabTdxS0VGdEUwcGVxMjhpSmRBYWw2UlhHbFR3c3IvamgwWmlw?=
 =?utf-8?B?WHRxYkpJRWMwOC9rVVJZZ1FDMFJKUXdUM2xFTnZPUnlNRjhqSlRZbGFiUXQ2?=
 =?utf-8?B?dytLamNEelBVYytwYzJGVStLWi90MWR4enM5UnFZZ3FzcXZGMVF6WWsxQ0ZT?=
 =?utf-8?B?Z21wekRLSU9YR2ZhTjdwRmZha3BQVnNEUmFJN2FFWjFNeGJOZFMxQTA2L0lH?=
 =?utf-8?B?NVFTU3FXSGRKWXpXL1p1a1RaMDVPOHcwa3F6eGFxRjVsaURIYVZGbk9oeDBh?=
 =?utf-8?B?aDRBS0hnc3lkcG9Ib0hGcmFlaXBTWjg4RTZUSy90Q2VHTnd0OXoyRS9yRThi?=
 =?utf-8?B?MElocC9WWCtyV3BRTmU5MFZsVWxlV2ZMMlBVaENRSmNoc1EyYk5ReHdGQktv?=
 =?utf-8?B?WHNHdHNDZTNhVTBONWkrOUR2dXVPK3BDWERWeElEN0VONlhKOTZ1a3R4YURU?=
 =?utf-8?B?bnphUi9KQVpXMUIxdHoxcHZ3amc2bW5uODlLK0RKdlIzVTFVOU5IUmp2UXdK?=
 =?utf-8?B?WFJMa2k0TU9JMjJZSnVWbllDSUFwWlBoMXhoRVhvQXRSNk5NR01KeGxnZ0Rz?=
 =?utf-8?B?V2Q0VGIrS1lPZDM2TEFKUE93NjZRajFxL05zRlpwSXg2SWZsWlpzN1laVzdN?=
 =?utf-8?B?VDVYN05nTzRCNWdwdDlwVnVWdVBxZGE3eUtwemVITzZsOTc4c0xZN1NFZHFr?=
 =?utf-8?B?WndYdG9ZbEMycThuUGs2ZlN6eUFxM29zV25LN0VTbkFqTWgrSHBWU2hEeHZy?=
 =?utf-8?B?K2phMTU4MUVsZ1NGN0NVK21EK1RzNWtlYXFwWTkxeVQzdklVNnlQMGlSbzJC?=
 =?utf-8?B?dlo5VlpVOUttaGExQm1JWmlKeElwa0NVRkJYTU5zRW1HLzB5RGRTc0RYNXBG?=
 =?utf-8?B?L3BsMGVJR3dRTFY5MTVGdW5xTmVnTnA0YWZXTnN4QVpkVHo0b0M5dUdpNjN2?=
 =?utf-8?B?UmpTQ0JXUS81MnNFc1lPRFpzVGt3c3dqK2g0TkpjMGZZYXRLVURtZUtZUXpC?=
 =?utf-8?B?LytlT0x6S3UwUWpXLzk5djZ2ZDd1OVp5SXN0OFVhTlVQQTRkUXI5bnpJNWVr?=
 =?utf-8?B?QnhGMXc5WVdwR2ZEcWdMRFBvQ2czdGtwTXlaMmNOVXJsc3NBVmFSYTZzQWJQ?=
 =?utf-8?B?c0JqV2tnb0tSaFVvMCtqTWFqbVdqYXZaSGRDKzhWb2JRQmZ2eDNENFpXVkN3?=
 =?utf-8?B?KzlscC9acEZOSDFTT1N1b0FDWFNtVUFFOU5kMFJJZTFhazhIa2R0emJYRytm?=
 =?utf-8?B?eFFaQldmL1hSMlRBc0tSeUcxSHRQN3o2ZHVyOWppY1YxQ01mQ3JpU0t4emlQ?=
 =?utf-8?B?OVZwMDNNQk81SXhMOUVCUDFOUndXZVZ4MEFVSEtVYXVON1BWQzFOa1dEams3?=
 =?utf-8?B?djNGd01mTkQ1dGU1MlZhNUlaTGhoNzlBNGdBUE5HSlhwc05sUnRYVUVLQkhq?=
 =?utf-8?B?TjBVbWVsc1luVm5iVkw5TFp5d2EwRlByTTMvNmI1KzIzbWNrSWs4ajN0SnZs?=
 =?utf-8?B?QmhTUGV2Wkp1Y3UvcFUzMm9sWUJhN29TVWkvMmlHaTNnSVFZVWsrTHVjSm1T?=
 =?utf-8?B?cHo0cUJzcXpwYWRtcHFvTzFqc3NkZUFlbHVyRmVmcFgrUEFuYVN0VGpJaVlI?=
 =?utf-8?B?VWxFSU9sU2tEWUtNZ29xT05FQ0RGQSs1MGMrSlY1dDcxWENUZFRwQ3NqTUxT?=
 =?utf-8?B?SlA1L0lTNG9PVlduYkRtREQ5bEhMT2N1SEtqejhTc0QxRlpJSEdKUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3288be-0714-4da2-0e4c-08dec19a44a3
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:02:25.5268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3Ocr6vysuYGUKdVctneHOcA+0CqOPOyMvnsPXyjsvqPEI7w5pHt1JzPndnhaZ83acxxq7+OmoCM+BbTU5eOYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB1063

The Rust binder's looper_enter() unconditionally sets LOOPER_ENTERED
without checking whether the flag is already set. A userspace process
can send BC_ENTER_LOOPER multiple times, corrupting the thread pool
state: the kernel believes more looper threads are available than
actually exist, leading to incorrect thread pool management.

Add a guard: if LOOPER_ENTERED is already set, mark the thread as
LOOPER_INVALID and return early without re-entering. This matches the
fix applied to the C binder.

kcov-dataflow tracking (before):
  ENTRY ThreadInner::looper_enter()
    self.looper_flags = 0x00
    self.looper_flags |= LOOPER_ENTERED     ← first call: 0x02
  RET   looper_enter()
  ENTRY ThreadInner::looper_enter()
    self.looper_flags = 0x02
    self.looper_flags |= LOOPER_ENTERED     ← duplicate: still 0x02, no error
  RET   looper_enter()

kcov-dataflow tracking (after):
  ENTRY ThreadInner::looper_enter()
    self.looper_flags = 0x00
    self.looper_flags |= LOOPER_ENTERED     ← first call: 0x02
  RET   looper_enter()
  ENTRY ThreadInner::looper_enter()
    self.looper_flags = 0x02
    LOOPER_ENTERED already set → |= LOOPER_INVALID, return
  RET   looper_enter()                      ← early exit, thread invalidated

Reproduction:
  # CONFIG_ANDROID_BINDER_IPC_RUST=y
  $ ./To-Ulimit-and-Beyond
  First  BC_ENTER_LOOPER: ret=0 (OK)
  Second BC_ENTER_LOOPER: ret=0 (thread now INVALID internally)

Link: https://lore.kernel.org/all/20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech/
Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 drivers/android/binder/thread.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 97d5f31e8fe3..1d114fa2b4e6 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -373,6 +373,10 @@ fn pop_transaction_replied(&mut self, transaction: &DArc<Transaction>) -> bool {
     }
 
     fn looper_enter(&mut self) {
+        if self.looper_flags & LOOPER_ENTERED != 0 {
+            self.looper_flags |= LOOPER_INVALID;
+            return;
+        }
         self.looper_flags |= LOOPER_ENTERED;
         if self.looper_flags & LOOPER_REGISTERED != 0 {
             self.looper_flags |= LOOPER_INVALID;

-- 
2.43.0

