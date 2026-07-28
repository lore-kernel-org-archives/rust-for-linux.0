Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021119.outbound.protection.outlook.com [52.101.100.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E501C84DC;
	Tue, 28 Jul 2026 14:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250349; cv=fail; b=IwIf4WmH0E+uJOTRIwVikxhUFp4CnM/5JwtKZb9beVA5D4rsLdg6RBzSfEuPeepdRFvalIRwwvW/7zG3QFkaTVrd6/si9yyo8J3/j4wH/vrEduyGkj444FpjjHjgtkuZIPmLy39oVaa5iLYNiry4sdCEFc77fpBTuFi3RfSY0KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250349; c=relaxed/simple;
	bh=e66sEbUMcnOcFoei80t1yO+AZSHQtd4jX5eUdmTrlGU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jGodSjl2GmB0wfMFcs4zJHHBk1xE2faq5YzY4JvEYLh5tSlRoYB/ZbXFj3XwZbCkZLQCzzpgfEmPUFme2l91JZAOAntuzX6I1x3wnGk9IZhcVl5Qyaxco/EzxWc7MRJe4bS37bcqXPN70uw5XhGyRa2NBtjRbDEjjFVUpB1rxQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xYgIiH8M; arc=fail smtp.client-ip=52.101.100.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xYgIiH8M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQsnns4Be3nbAKyhGWN2qg1WL7SbXAsAtzC8Z4AmIaNojydCKZHUdBDnV2C74lbSbnXR+G0lVT4l9qKg/Qh+qWRkqXCR3Jmi5NzCSWsRzOM/xMjM49th6T0j07SNr2s8ETrBFHMknHWC0ZvMALV2/z+dhYth9WS1VpnNkmfDwyvtCLePE5vVmU97Ut6rE71zoq8/0StEeIi+XN7gHsKTsMMcWPX+IsPP+p/pi/gWWwdCCL6KlM/NmcOqYk+xuwjs9qdMWPv7culNnc7RuTjY++/2aLy6kSbo6EcuHu71PncfBbrl/nsKUKj13rTYg04X6dP3rrW2HDS/Ib8Z/00m3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKkyrose37EcRn0XHKlIJB3gRlUXsme8To/1klPWuJA=;
 b=Vm9rpxe5aoGjDfZ8GB67fWjT1AgJ3kCIPn9u2MUUMqbPIrDQwiBWcegNdJQF7wvktrClxB/zBx90xXDTl5LWZzl/M0QnAIWIADzi7RIIrM12ya/vfceNMGa+7X7fR4m2tV0yimkXaUNQBvMp6j0Gll1HNCkX1k8TTCFw1QxyM92dYb8JK5g4GQEMf6KmviTG+isv/Y2/R1ah6yKZcfE8Wxlo7RzujsugaX13Zs4d0umSaxT5vGvSpVWOsa3C7weqbq4u3M35+ZbDDPwYCn2cx6AAi0gk5LOM3WCH6hEXHnNbTw4fsIBz+hQ35vDAymGuynzajNQkjXk4ghD3ILfn2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKkyrose37EcRn0XHKlIJB3gRlUXsme8To/1klPWuJA=;
 b=xYgIiH8MSlD0TXaYEwV8/dzoRiMU7jdy6fbsm7BeYoYPG8A7p1+t+cp0qhbN58tE1I5ukOmOI2Xvp6A1+OG9MNY/pOG+Z7YjjbsJ/T+TCZ7mKN0aB/LU83al3Em4HRink6fbakayT5p8bwbEl/Xo9BWSetn+BE0z3riN/J2lldQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB7374.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:31a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 14:52:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 14:52:23 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Jul 2026 15:52:08 +0100
Subject: [PATCH 1/5] rust: print: handle `pr_cont` separately
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-printk-v1-1-855606634d70@garyguo.net>
References: <20260728-printk-v1-0-855606634d70@garyguo.net>
In-Reply-To: <20260728-printk-v1-0-855606634d70@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785250342; l=7751;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=e66sEbUMcnOcFoei80t1yO+AZSHQtd4jX5eUdmTrlGU=;
 b=e4pj1ZxcynEn2XoF5ghs3bjDaDjx+oENZ1ymrPu3eSDIXkDI1owmiqMPjLTd6g7p4SR0xnuEX
 aNLuhYN9ah4AP9Nq2tyZ7o1RnR4+jXZZIa+x1yJWaWOP/ZZtRWstHLG
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO2P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: f2eacead-9515-4aa6-67bc-08deecb7d50a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|376014|7416014|18002099003|10067099003|22082099003|5023799004|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	L9eks5YecA6DZ2yZh0wBw+8A7Nliy/8x17bu0UfEEtQhJIqCJ2pQhkIU7VDTQa+FAN7upzLesa6pWreDdTPXlhW0GBq+Kx8YgQDYGzShj1xB/maOkuIpctgTKbkT5Fy5JNbPbJZX2R41BeoVT/R+1SDdStqxGEao2u13M/qjKyHY+ALiTjp/TRR+BsjowBrs5vE8aK0rhDeCUw4Jc4b8PoXqmC8MNaBGJp9l/VMWLmwjV0IyXnRncNNEqetZxnObTWaiIQ3V+17zeRDKGVNQx1bwPuiVqgbR9PTKVoRWaVAW9zV2weK8T11AaFgbM0TMwUD6DHFIq6G6MqdAWgLH5lbN0k7peXHucUHFh1bsYAGb0ibq1GZzlleR2/o7lgAcAgswh1HL8YBwM7CmDqlgTHC01jjyXxuo6mjvPYkJwGaPYk/0dFKp80OtZBuDP0+cN9Xgr1Rgo7qicnOjIG+hLX7jju9ffygai88ck2VCHhX50bnkxz+CgHy2mbfZ27BreLRqJu+jeiFb4aYseGJVnguDyElYEY6beIiBkNzj2l2e9h2/+OAA6c8VSiexGPyh22FxnbQKnueBObvoWidpZQ6A0kPVZplIaJjeDN/py99rsjGor4sBcAPepYFIX1I54KAWtsol8LqJbaNBIQ1GpbzMEP/8mrqwHiKHZsdWhBbQeOJjJnmiNqOdt/4eHwfnRTMwceHPfLMSI7uwgzvpMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(10067099003)(22082099003)(5023799004)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG12bm5EcTBid3Jac2NWZWJyUXgxZlZBc2dwR2w5aG00L0tzMk9vZFltbDNh?=
 =?utf-8?B?MXpPZmFtMTJZc3VYTGsrNWx2L1AxMlY5dWpDMkhuYnY0dHpnQWxPc3dxWUp1?=
 =?utf-8?B?K2JJdXljaDU5UHlSTWVaenZNQjMvWEh0d3J4cGdTVjd5dFpWUS9WTWRUaFFL?=
 =?utf-8?B?WUs3aSs0TDdDbDNyYXFpaTEvcm9rRU5wR295Si9KTlRtK2xoNWZYY25OMFY1?=
 =?utf-8?B?d3h6MWw1LzBScmR5bjgzeUplb1oxVmJRbS9aUmU4VXNRWmc2dHJ5WGNMdnRq?=
 =?utf-8?B?ZG5aRkprdlVubmJtUkY5RUtrSGszRmY5SmIxR0dhSWROanR4WGZqOWRxKzRX?=
 =?utf-8?B?STJkRndvYkxNMTZIVDdZOUo4cDJWWE5VY2svYU9kdldybTgwK0wxODE0bGxm?=
 =?utf-8?B?c0hNTTBUT0o0bVlTNktnSTNrZ2Z4YVhXdk9NM2tRT2ZLbSszYjBvMXpmOExM?=
 =?utf-8?B?WS9aUW1IZHpKRWJtSUFDenZjWWNGMkdBdUQ4NDladzR0N3huWE1laWhqTW9N?=
 =?utf-8?B?QW1hMHJrcklhamlWb3ljSnJId2oyTmtsZzNKZVJoelJiSlM4Z29kL3RNMTQ2?=
 =?utf-8?B?OWRYakJ0czd6RDgyM1dXN04xU24yc1RVN1dPcTZ4bytzUG9DU3lqQzRacEND?=
 =?utf-8?B?b2k5bUpzcGh6T2c0QUhTRy92NGpuU28zOGVHa3BWa3B5SHdrYUN6VitGUkN0?=
 =?utf-8?B?ZHl0UFhHMXdZYW1qOHlpZnRGQW9wRzl5SG41T0VkeWhhbnVQeTdzbEVNVHFk?=
 =?utf-8?B?WTVNNHJHMXhvRXo5dkZieGVBZ2dhVmdNN1JwRVZkTlJlTHdxd1VoTUxRUlFx?=
 =?utf-8?B?anBpRG1CVUIrRXNWTUNZN2pxRlQ0YkpYbVN3SkFkWWUyN2x4cUlUcGlxbnpa?=
 =?utf-8?B?SEFNbmhNWlRJK1pKRHZaRlhCN1lNenU1aEJiRkx3b3JtckFueHpQenBINkhR?=
 =?utf-8?B?ZGxUQmxZNWUxS2FQbFIvMlpsc2hPU1NQRTN1S0hJTTVuOEZMcnVCUFd1eTh3?=
 =?utf-8?B?VkUwY2xneTNSSWJacW1Vb3lnQktDL2hSSEp4V1BENDlKV01OdUZhTy9SanRx?=
 =?utf-8?B?REZoeHFDUkpLa3ZVSFEzOExPYUQ1WG1TUlhYRm1QOUREV01XclhBWFpDTEJL?=
 =?utf-8?B?SHRQZ3VOQ2tSK3Uya1hFTjcvalNXdXRSTnVmVVFybU9uN1puakNrRFRvNEg3?=
 =?utf-8?B?RTJZOHV1VEN3aklBdmZnZnAwdHhSUWwyQjBNRnhaSlZLTUNoQzZjTE1MazBV?=
 =?utf-8?B?amQ1RDM4SEtQOGNHem9PREJwV0Y3YU5tMUFvcFFnbEtiQWkyYnRtaVBzK2p2?=
 =?utf-8?B?L2RaM1FJSVBIeXlUWDdrZDJFL0E3dnA1d0lrWDN0aWxncnpSUTgzTGxhL2Qr?=
 =?utf-8?B?eVg3cGVock90ekcwbHBEMkpJYTd3UjJETVk4VW1KWEpxbWNUemd0Rno4RThN?=
 =?utf-8?B?SjZNajdZRVJENWJ6MmJ0KzZpZGZ6akVQbXF0VFpLaDBTNGp3V3FlY05vcmlC?=
 =?utf-8?B?WThKKzRhc2NhS3NXUEhJanVXSkZqZ2U2d214M004bUowN1dmOUY3Y05YVS9o?=
 =?utf-8?B?Snk2WWNmempJTEhOVzAxc3c0eGdhcGhoKzl6SWhsUXVlQWdRNm9oK1I2cG5K?=
 =?utf-8?B?d0NYUVlHN2xqa1k2eUdsV2NMWWcrMysvOXZqK2xUalB2WUxzb1U3amh0bUgx?=
 =?utf-8?B?ZjAvWHFkMi9wazhGaGFCUGxHckI5WGF3VG4yMFJyZFMyVk5vOG93TUN4V0g5?=
 =?utf-8?B?QWRxbllFMmlhNGJLS2txZVlRQnlpdGVyYXFLaHorazNPaHpPZlZXajhOb3ND?=
 =?utf-8?B?UHZldDJVOEZFVVRzaWUveThUWDdnOXZCZEpQWmc1azFpYVp1aVg5TkwwSHp4?=
 =?utf-8?B?ZDlFUGVyQ3ZKamYxV1ZJSmhZK05GdUhoaUN1MjAyU3ZZc0hud1dUaFBySTht?=
 =?utf-8?B?dDJyY3lUT0o0RHhJcEJsTHFBN2NnQ0dwNXY1MlF3Q3pMZm4yblFRaVhvK00z?=
 =?utf-8?B?MzNyL0RyeDFxMmV3UTFzY1VHNjNrbFVsamxLbEIvUWw0aURWSnYzUkxNRWRU?=
 =?utf-8?B?UldwbGtSUlNwT2VGcUdzSndtaGZWcVVGdmxTbTdGOGxRYlFxSkd4WEErRmlG?=
 =?utf-8?B?NzUvY3R0ZUk3bmFXOHdibHhVcjZOY0NGNFhLRUt1MncwQ3BpRGRHb1loK0Iz?=
 =?utf-8?B?eFh0K3RQTFlXRE84Q25CbDBoZ0VWNno3Y05ybi9vUFZSaVhCMGU4MjNrTm0x?=
 =?utf-8?B?dHhvd0lyZ3FxMVZ3bmdrdGlwNGluZkk5dDdRUHN6enZHK1VnOWFSemZDc09Y?=
 =?utf-8?B?Q0ZROUd1UVhpL2wyTHNkazN3bUhtc2xoQVhoS25DbnNqelBtUitCUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f2eacead-9515-4aa6-67bc-08deecb7d50a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:52:23.1290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VD+SYQFwLfxcz09Mr56q+uss18HuQ2v8roqTORHB6RAxIHzaP49lLgZ8ZhUe9SFUgQ8AgOmbq2CdLZ3syPFQBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7374

Currently all prints are handled centrally through the `print_macro` macro
with everything except `pr_cont` passing `true` as the second macro
argument. This is all redundant, call `call_printk_cont` directly from
`pr_cont` instead.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/print.rs | 75 ++++++++++++++++++++++++----------------------------
 1 file changed, 35 insertions(+), 40 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 6fd84389a858..066ef7a7d5ce 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -51,21 +51,13 @@ pub mod format_strings {
     /// given `prefix`, which are the kernel's `KERN_*` constants.
     ///
     /// [`_printk`]: srctree/include/linux/printk.h
-    const fn generate(is_cont: bool, prefix: &[u8; 3]) -> [u8; LENGTH] {
+    const fn generate(prefix: &[u8; 3]) -> [u8; LENGTH] {
         // Ensure the `KERN_*` macros are what we expect.
         assert!(prefix[0] == b'\x01');
-        if is_cont {
-            assert!(prefix[1] == b'c');
-        } else {
-            assert!(prefix[1] >= b'0' && prefix[1] <= b'7');
-        }
+        assert!(prefix[1] >= b'0' && prefix[1] <= b'7');
         assert!(prefix[2] == b'\x00');
 
-        let suffix: &[u8; LENGTH - LENGTH_PREFIX] = if is_cont {
-            b"%pA\0\0\0\0\0"
-        } else {
-            b"%s: %pA\0"
-        };
+        let suffix: &[u8; LENGTH - LENGTH_PREFIX] = b"%s: %pA\0";
 
         [
             prefix[0], prefix[1], suffix[0], suffix[1], suffix[2], suffix[3], suffix[4], suffix[5],
@@ -79,15 +71,14 @@ pub mod format_strings {
     //
     // Furthermore, `static` instead of `const` is used to share the strings
     // for all the kernel.
-    pub static EMERG: [u8; LENGTH] = generate(false, bindings::KERN_EMERG);
-    pub static ALERT: [u8; LENGTH] = generate(false, bindings::KERN_ALERT);
-    pub static CRIT: [u8; LENGTH] = generate(false, bindings::KERN_CRIT);
-    pub static ERR: [u8; LENGTH] = generate(false, bindings::KERN_ERR);
-    pub static WARNING: [u8; LENGTH] = generate(false, bindings::KERN_WARNING);
-    pub static NOTICE: [u8; LENGTH] = generate(false, bindings::KERN_NOTICE);
-    pub static INFO: [u8; LENGTH] = generate(false, bindings::KERN_INFO);
-    pub static DEBUG: [u8; LENGTH] = generate(false, bindings::KERN_DEBUG);
-    pub static CONT: [u8; LENGTH] = generate(true, bindings::KERN_CONT);
+    pub static EMERG: [u8; LENGTH] = generate(bindings::KERN_EMERG);
+    pub static ALERT: [u8; LENGTH] = generate(bindings::KERN_ALERT);
+    pub static CRIT: [u8; LENGTH] = generate(bindings::KERN_CRIT);
+    pub static ERR: [u8; LENGTH] = generate(bindings::KERN_ERR);
+    pub static WARNING: [u8; LENGTH] = generate(bindings::KERN_WARNING);
+    pub static NOTICE: [u8; LENGTH] = generate(bindings::KERN_NOTICE);
+    pub static INFO: [u8; LENGTH] = generate(bindings::KERN_INFO);
+    pub static DEBUG: [u8; LENGTH] = generate(bindings::KERN_DEBUG);
 }
 
 /// Prints a message via the kernel's [`_printk`].
@@ -127,13 +118,23 @@ pub unsafe fn call_printk(
 #[doc(hidden)]
 #[cfg_attr(not(CONFIG_PRINTK), allow(unused_variables))]
 pub fn call_printk_cont(args: fmt::Arguments<'_>) {
+    const CONT_FMT: [u8; 6] = {
+        // Ensure the `KERN_*` macros are what we expect (2 byte + 1 byte nul-termination).
+        assert!(bindings::KERN_CONT.len() == 3);
+
+        let mut fmt = *b"\0\0%pA\0";
+        fmt[0] = bindings::KERN_CONT[0];
+        fmt[1] = bindings::KERN_CONT[1];
+        fmt
+    };
+
     // `_printk` does not seem to fail in any path.
     //
     // SAFETY: The format string is fixed.
     #[cfg(CONFIG_PRINTK)]
     unsafe {
         bindings::_printk(
-            format_strings::CONT.as_ptr(),
+            CONT_FMT.as_ptr(),
             core::ptr::from_ref(&args).cast::<c_void>(),
         );
     }
@@ -147,8 +148,7 @@ pub fn call_printk_cont(args: fmt::Arguments<'_>) {
 #[macro_export]
 #[expect(clippy::crate_in_macro_def)]
 macro_rules! print_macro (
-    // The non-continuation cases (most of them, e.g. `INFO`).
-    ($format_string:path, false, $($arg:tt)+) => (
+    ($format_string:path, $($arg:tt)+) => (
         // To remain sound, `arg`s must be expanded outside the `unsafe` block.
         // Typically one would use a `let` binding for that; however, `format_args!`
         // takes borrows on the arguments, but does not extend the scope of temporaries.
@@ -169,20 +169,13 @@ macro_rules! print_macro (
             }
         }
     );
-
-    // The `CONT` case.
-    ($format_string:path, true, $($arg:tt)+) => (
-        $crate::print::call_printk_cont(
-            $crate::prelude::fmt!($($arg)+),
-        );
-    );
 );
 
 /// Stub for doctests
 #[cfg(testlib)]
 #[macro_export]
 macro_rules! print_macro (
-    ($format_string:path, $e:expr, $($arg:tt)+) => (
+    ($format_string:path, $($arg:tt)+) => (
         ()
     );
 );
@@ -217,7 +210,7 @@ macro_rules! print_macro (
 #[macro_export]
 macro_rules! pr_emerg (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::EMERG, false, $($arg)*)
+        $crate::print_macro!($crate::print::format_strings::EMERG, $($arg)*)
     )
 );
 
@@ -242,7 +235,7 @@ macro_rules! pr_emerg (
 #[macro_export]
 macro_rules! pr_alert (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::ALERT, false, $($arg)*)
+        $crate::print_macro!($crate::print::format_strings::ALERT, $($arg)*)
     )
 );
 
@@ -267,7 +260,7 @@ macro_rules! pr_alert (
 #[macro_export]
 macro_rules! pr_crit (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::CRIT, false, $($arg)*)
+        $crate::print_macro!($crate::print::format_strings::CRIT, $($arg)*)
     )
 );
 
@@ -292,7 +285,7 @@ macro_rules! pr_crit (
 #[macro_export]
 macro_rules! pr_err (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::ERR, false, $($arg)*)
+        $crate::print_macro!($crate::print::format_strings::ERR, $($arg)*)
     )
 );
 
@@ -317,7 +310,7 @@ macro_rules! pr_err (
 #[macro_export]
 macro_rules! pr_warn (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::WARNING, false, $($arg)*)
+        $crate::print_macro!($crate::print::format_strings::WARNING, $($arg)*)
     )
 );
 
@@ -342,7 +335,7 @@ macro_rules! pr_warn (
 #[macro_export]
 macro_rules! pr_notice (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::NOTICE, false, $($arg)*)
+        $crate::print_macro!($crate::print::format_strings::NOTICE, $($arg)*)
     )
 );
 
@@ -368,7 +361,7 @@ macro_rules! pr_notice (
 #[doc(alias = "print")]
 macro_rules! pr_info (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::INFO, false, $($arg)*)
+        $crate::print_macro!($crate::print::format_strings::INFO, $($arg)*)
     )
 );
 
@@ -396,7 +389,7 @@ macro_rules! pr_info (
 macro_rules! pr_debug (
     ($($arg:tt)*) => (
         if cfg!(debug_assertions) {
-            $crate::print_macro!($crate::print::format_strings::DEBUG, false, $($arg)*)
+            $crate::print_macro!($crate::print::format_strings::DEBUG, $($arg)*)
         }
     )
 );
@@ -425,7 +418,9 @@ macro_rules! pr_debug (
 #[macro_export]
 macro_rules! pr_cont (
     ($($arg:tt)*) => (
-        $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
+        $crate::print::call_printk_cont(
+            $crate::prelude::fmt!($($arg)+),
+        )
     )
 );
 

-- 
2.54.0

