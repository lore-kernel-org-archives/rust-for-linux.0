Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022104.outbound.protection.outlook.com [52.101.101.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9757543BDB8;
	Wed, 16 Sep 2026 12:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560725; cv=fail; b=dOjK9fAFK1bWhDL0jupF94Sdy4cntmQi6/Gu0TOrnKywCTkPJTPpM1klgT1230Q9wqiqU/le1xOZYeth2OHeuONVj87Zl+Jdwc4WoiyaTGvfHtmw2xuZW3UvvEsNVqDAav/Wn9T4+NgxOVeIxuqwczj/Pf1BKOxpquQFOwtkgPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560725; c=relaxed/simple;
	bh=IBJHmkFq94DjdSVs9snCvALyXnIhVKMyeLHCi6IJo2A=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=IGPus3b3tEjcfG5HgCnARi8vCCXcaYg2QHsKLzs/GsuwzKlLF7gaf79vEqMKwzmB3eEuGYTec8JrsA+v3Nh9jAUxb1vEGxM7yqlMVSM3p7k+flLRUhZzYv9tOxOpIKTXri+Ht2LDUg5AejaQY64QWPI1RZ7YqTwUv6ATCgrwdx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=BGb3sips; arc=fail smtp.client-ip=52.101.101.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="BGb3sips"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZxmWiOedZX3PQ+eIpL4GPn7NyTxeHGsztFNB056h78BBhnIq6vGziE7dhDfUfxacmh524zjwMvkutpLGhwMmC6jt+IyRWl2L8eOoSFzm0+/mscCX1Kspf3vG6rzWfJCFuxGsHPvQr9r/8uJ+gr+k+tJRRAJqOHuOlMKEQKrooHONUZcpStM02hIQqr72VEkDvE99NH5rsGB18mNig39Xi8ychWkiZtfYorfW3mRcAINoQkqzsTMczgu3CbpP9NXgK1cA2snCRkWB9TWeLqY4e0N+sUiQhQZm0iu6MsxpeoqDO0tSHpnMXqT1zpHHKCXNbxzbZPjIgD1xNpx6E+BuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEkAEq+tlP87J00+FkcHIhwDwDEGim3+OVDOCbx7Sxo=;
 b=GYmwG3/0djb6Yx72o5ZtLN4fOhX/R8URBgB2+GiR2vEgU76vrQoK0uCkDq26HlVOFdOY3XinuQBPqDb+e7I9GgqnCjKd+bQj/qlpp/iP2A9rCBoU4TL3YP3fBD8xEojOTg7/+vexWEBrGzFid0Ov2fM52UiZn4XtWJVG+Do24aZ2AlBVlFDHwC5u+famBIxBhb7odPfbaaBFaPrLRNJjPq+5KvBgdAzA60/EBV5rTrnfAjG9EYSdA972NC0Ab5US0Rtky8LM1PcGF1Sv5h3k7OHm/OgDv57DPFSKS4LYexQiknS38+RoUGlebPyZYO/4+gNShN7aus+bPhEn7m17hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEkAEq+tlP87J00+FkcHIhwDwDEGim3+OVDOCbx7Sxo=;
 b=BGb3sips2Ln/AafGDYGSB8nz51/BWS8Zfew/PDbkcdscK0HXemc7so8ldAjrCNkQX97kGvWiaguwqwxhsHzlJ2CUJTMAzCN2zvG8Fc2XiFm8DLqXlsH6Kmpfhnt6vRONqjpJi1hJtOO6E1PCUrdgT3UVZ3zTMvbu6MWRXelmukY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB3421.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 12:11:58 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 12:11:58 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/3] rust: pin-init: provide better span for diagnostics
Date: Wed, 16 Sep 2026 13:11:31 +0100
Message-Id: <20260916-dev-hygiene-v1-0-dfb6ae2588ba@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHOHqmoC/yXMSw5AMBRG4a3IHWviWWErYqD14xqUtAgRe1cMv
 8E5FzlYhqMquMhiZ8ez8YjDgPTYmgGCO29KokRGZSxFh12M58AwEHlWpLrIVK5kSr5YLHo+vlv
 d/HabmqDXd0H3/QC1jlicbwAAAA==
X-Change-ID: 20260916-dev-hygiene-5473c74b5b63
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=gary@garyguo.net;
 h=from:subject:message-id; bh=IBJHmkFq94DjdSVs9snCvALyXnIhVKMyeLHCi6IJo2A=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWavaa44Wha84UdnVLhF6e2PR8Q8/pq78urdhk5MD9
 84d0RKZEbM6SlkYxLgYZMUUWTy6GdM2Mc6WvaxV/hJmDisTyBAGLk4BmMjJLwy/mGxYtWd/ENM8
 29qzzTD7HVeXXNolETff44rie+7Lv3pznpFh+tMjM3e/+PCb8blrua6Wmfv0Na0vF553clNlucW
 skZXCBwAnEEjT
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: MA3P292CA0014.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::15) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB3421:EE_
X-MS-Office365-Filtering-Correlation-Id: d46aaefd-5afd-4934-22b8-08df13ebb4c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|10067099003|6133799003|18002099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	cAF1goXv7IwHJWiwLhGC4UZnrUZm6gZyzvcpRwow2NaX7pUB+akaugZ21U5xR1gXlMIQZ9Q6zHSf3TuKSiPNkPG2XyEz7XwtyHuRc0lamNbs203JcUYULBcw/oNrrbxnLtM26Uc57daxJC6VcRYAPS9dLruwVpb3Flyb0D99lX3dmVEGQEUVtsHQuHASXwRGllnHxqWTFm82uagOZYkZoOV3GSo9F4UnnczeB02YdP8D5uZw08euOZnNNytJ6rtLLBVmau2yWlFK+Nuaj3Xnn+CmHRAZm2ctJphvsA+QBJ3WnHMU3vFMyHogzVQkRcTBi8knhOOLUG5PP13bmBSlmDhnV9rFAuFzlJfA8RiDvbWiXAAs6sAGlBN8epTGBQ3Y61z5o8Kc+rIT00aMxr92wOKuA5Zzj6g+cU7sMjgMw32G/gHf/UxXsDCY0qAkGzNEnvPq0fl7w2iesIAnmtAj3b8WunuHhwLjsn1JwWhCEHOuTbtY4IGhnykACWTJW5M9OymMlrPftV20J0Jv+SJXYvDZJz2KyGQZgEl1Wc5Nc3g2qZoECUaecLN0FOVcjKyJdfVFncY9qJCqzwOniPT+wzCLH3QYiVcJ8lPkAGi6OdHceJuA5uTVpfKXvjesyqgoqKKXXELUXrxDxusdvyxCLjCgRcxMf5V3R+E7KDnRhXrC/22Yf26LpByfKh8qC76QPzLPzuTJEKCW3bm9tSROdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(10067099003)(6133799003)(18002099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0NrSDlBd2NuUGxqOTBzYVk5dnpoMjRkRWZwY3BEemgrSG0wcWYzdDNjemEr?=
 =?utf-8?B?dS9NSTVVb0tuanR1cjlZdktGRDEyNkMrRGpIQkdjNlp4K1VWVFZTdEVwQzlX?=
 =?utf-8?B?aHgxWlRWd3RUVVlFdi8zZytWSFJ5VllqRTR5ZW1FeUVVU01nUzcwcUthelBz?=
 =?utf-8?B?TVExODBaUmpaUldTc2FnblZQNmwvWWNEeFp0VUl1aUFkOVhMTXNjdnZ3Mi9w?=
 =?utf-8?B?ZTcyUW05KzF0cWpjckVPSjUvSERweksrT1p1WlhqQU9XNG16NkdFK1ZMdnJp?=
 =?utf-8?B?MVNQUGVvUE8xVmxYdG5GUGxESnRkZDJRNnMwdDJseVBmZldPeVA2TjRqemRJ?=
 =?utf-8?B?R3lYUkM1RW5iZ2JYbldYR3ZNVFhrRnhLQmpESXRTV09kYmlOcHRxRnhiSjdC?=
 =?utf-8?B?N2lxc1k4TGxjK1JNaXdsN2ZoR0ZoUUNsUEMwaVFsYTZXK0JxbXdXK24reFd0?=
 =?utf-8?B?cFd3OUwzQTZ1YW1xbGc2NDRwY3NKUEVuOXBPT2drZGplL0tjd1lVNngxdmZr?=
 =?utf-8?B?cG8yQzVKYW9nR3F0cUdiNW9mZVRscVJra0V0NWRqbkRmSzEwZGlNNS9pOUNY?=
 =?utf-8?B?cmhsT1pHNnlXRy9mcDB1NlBzdWx0cDFTOUdJVVdGdElVTlRubXE5dEJlbE5J?=
 =?utf-8?B?Ujk5cE5GaTNIMWd0YnRYM0VZdDMxWEI5RzExTFpjK0FsVjVKRTY1RWlycCtl?=
 =?utf-8?B?QzhINE9jTWFROTlWT2FhNkxhRFdQbTJ2L2NadVF2TC9pVTBFL1UvVDBLZDJI?=
 =?utf-8?B?L2lpWW9TSW9qeWxNcXBncUE3VDFMdWlibnZscCtDZkM4YkRFWVRiZVkyUU95?=
 =?utf-8?B?OXpiV0F5Z3ljYlkxOVlsTlNSU2p2L0Y5M25BcXZHSDdFL0JRVHdrV0lwNjVs?=
 =?utf-8?B?U1B4ampRazFHTUd5WGx5V3RKdDVYbGZnMWFONThZQzBxTGhrcUlyRW0vYVFS?=
 =?utf-8?B?ZnpvYWdWaC9MbGxCNVRHSU9ZVExGeHFzUC9MOEtNbUtYd2ZnVEUwSS9RS2tY?=
 =?utf-8?B?dk42QVVvSmtEUncrYXc3ZHE0clhnVmU2R3BmN2lXRUpEUDFReDR0S3hPT2dt?=
 =?utf-8?B?K1FJVVJsWlJPandYV2NQSlNXckNlU1Jrd0VFaGRqTHJVM3RyV0k1U1FrbjFD?=
 =?utf-8?B?Z1cvdHZmRXQrM1BxVmp1d25KdVgybk41bmdvNkU3NTFEYjlUN2NaNXM1TFhG?=
 =?utf-8?B?ZnBvUWlpZ1JhbVE5MGkyZFdBaStrYWpmSEhSbkJYZkRXNnJOQndHZytRK2dj?=
 =?utf-8?B?bzk0WkJ5cWRuSVJmbWlyMTBHRnNFQ0FiWnhGaEpnR0htOGd5M3FOei9MeVRL?=
 =?utf-8?B?L3NlYStncklSQXkzQXpJbC90S0loNk1FTHVyWVk0U1ZYdzNlTHFnT1NSdlNL?=
 =?utf-8?B?NkxmVE5NeEE3Y3I3L2tKSTdlcngyNjJ4SkpTZjhOVzdDYnh5VGlVN3Jnc3Vr?=
 =?utf-8?B?ejE2dWdxNHZmQjVBeThrZ1J1NGx1em5EeWsvUzRGK2g4bEJZWWVmN3VKWHVR?=
 =?utf-8?B?S3NhbjNLZ3EvTitPWjlUUkM4OVpuYzFOTCtZNWdjaFdKUVpHTnhSemhXalk3?=
 =?utf-8?B?M3hMSHdLN1YwWjFvU1NjbytDVlR6YkNtMW82bXhRaHBISVM4M3FpQWN1K1FV?=
 =?utf-8?B?NnFlaU5vVHVRdkZFT3JhZWZZMGxSSjZITGg0eitpQWtncVdOQkNySUJVTG50?=
 =?utf-8?B?WmdYQnFOcmtaT2Z3eHk2Q3ZzVnJyYjd4d1FIc3NkUXdVWGhKN2hMRzBVbzYr?=
 =?utf-8?B?TDBOczJVcWFSNWc0bWs1bWo3QkltUG9FQjRQVysvcXFQM3Vvck5zK3NSSnFu?=
 =?utf-8?B?RnhJMVpCR1JXTEozcDZUemozbXAzbXhsdFlmYWxyWW5kLzMrRk1yRTE5eVBJ?=
 =?utf-8?B?MWpranRWOTZoT2h4L2daTSswWUM3enh0RWN5V3I2QWcvb1hvT1NNaXp5M2F4?=
 =?utf-8?B?YjkvYXVPNzBYRHVDMkMzc3hWRi9SOTB3OU03RGxCUXBxaTdiM0QwRC94LzNa?=
 =?utf-8?B?bXF5bXZCUlJFYmFJU0dLVk9CZEllc3JJbnFvNGFxTmFjVFFqL1Y1T3RLQmx5?=
 =?utf-8?B?U1pTMmxBWnZYTzlYWUNQWGkyLzJJdGd6dlN1WlBZSldEWlgvYm81cm1hUVV5?=
 =?utf-8?B?czIyMHVBWkg2d2NwbFlVdVJzL2hrampHM0hrS0dJUDV0K3U2b0M1TGN3cmFG?=
 =?utf-8?B?OHp3eHdKcXk1NEdyeXBsMnNqdnc3UksweDF5aWtmc0NaR1pPazMwNGlxdFNa?=
 =?utf-8?B?eXNpMlRTdG9ERStPbFlCU1laN3FnajlBdXBzaHJ0SUxRdmQ5NENMRXRNazNH?=
 =?utf-8?B?TXlEeFhSMWxNWEZSUFhhUklpbWkxaGoyZXFKZmFlaGtIVXlJcUJDQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d46aaefd-5afd-4934-22b8-08df13ebb4c6
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:11:58.2514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hHADqSzHvwA6DCM+fqlumG30P1XCMSNUIK5gF+H/I0H8/zS06FTNs/JgpZGWlyQ+DriFosZi4+uVLYtbI1bhBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3421

When initializing a field, pin-init first projects the full slot to a slot
of the field, then initialize it by invoking a method. Currently the span
location is not explicitly set, so the error message points to the full
macro invocation.

Improve it by provide a span, so Rust will point to the specific fields
causing the error when type check fails.

Old error message:

    error[E0308]: mismatched types
     --> tests/ui/compile-fail/init/field_value_wrong_type.rs:8:28
      |
    8 |     let _ = init!(Foo { a: () });
      |             ---------------^^---
      |             |              |
      |             |              expected `usize`, found `()`
      |             arguments to this method are incorrect

New error message:

    error[E0308]: mismatched types
     --> tests/ui/compile-fail/init/field_value_wrong_type.rs:8:28
      |
    8 |     let _ = init!(Foo { a: () });
      |                         ---^^
      |                         |  |
      |                         |  expected `usize`, found `()`
      |                         arguments to this method are incorrect

---
Gary Guo (3):
      rust: pin-init: internal: pin_init: emit `slot` using mixed site hygiene
      rust: pin-init: internal: pin_init: use `slot` identifier directly with mixed site
      rust: pin-init: internal: pin_init: provide span for slot projection

 rust/pin-init/internal/src/init.rs | 48 +++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 27 deletions(-)
---
base-commit: 3b3ff9034a497fb3b8429f6fe8ba5697bc7dcebd
change-id: 20260916-dev-hygiene-5473c74b5b63

Best regards,
--  
Gary Guo <gary@garyguo.net>

