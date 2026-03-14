Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DE2272E7C;
	Sat, 14 Mar 2026 01:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450400; cv=fail; b=MwwmSV8Qiwi9WFAemRALxuEuSgTV9/sJD9yxVKWfEPUvNp9+SggkYl0God5FE/v/odU19+NbZBVdIpPpUW/zemnCIenC1mOC4hLxL3S0icn+1zTICy/i1U4I3s8wS46pgHIBTLuRMID8Kvpx+XlpNqU7jFXqY3o31zQF7BxGI68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450400; c=relaxed/simple;
	bh=c0UGBMQRY8EiJxLPsEGtlbzdMgEjaS58LSVgjw60qmw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Gnduq6jVOPHPOc5lSo/eoTjSj3hyYc2Iz2HL/z68Etp6Ua6e/2TXDpyQdbMxEhf4itfhsgyKZd2aG8xRBQvA+zmsE+0bbnXNUt57jrKrjuopWoMwZ9QDn9OiNPwAL+YxuG6OhTSkgMWARcXvzNPFv8TXwnHf+gUvE9zfj7Strac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OvYFQZij; arc=fail smtp.client-ip=52.101.61.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OvYFQZij"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SExZyjfIKxEhw0hAFMzYn4uqzhe9ekXM/kuPtJnWfy0DGcpW1B3bFdLeC6itb1Mzrq1bUxd8hnYmfgLd4FTzEFIJMVT47Jk8nA0di/suP66GAjF6bPG1eawT6yRVHwy2vzqHKXpwFZtPFxQb2CioB0EPl+rJLx6Mh9Lo5B+bj5m3vikud/deMQkYobmKhW9uQNi3zzsdBbmrJQu+58vCQw6ZQXKdf36IGXoGMptU1oV9IbsjvIrMjXnl0DSy/sQT/cjogvO32oF/FSSifX0FjAF/cmLimtIOlmnqIfXg7xuV2rvmmR7mwwaewJWwfBZZdixTKGXVqOSb9Q3UwGBzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSq1S2fZkmpSgFd7rALmgekh8GJ01tsbJVPBPo5ypy8=;
 b=Uy6zcF4OYO7aIiE9xY+EcbpO0pL8nXDB6sM6vQs2AyuMFKdSZDvbdnWVRWo2Ky/zuZ9hutInIhjUJXQYiJDXYEsc5E7Q5yykg90yaaWb2LTffqpt0ld/lykXrenPgxnI+YOZfQDE1p2tR9ZNznNrrrdIL8D5SElWwfi2tNKFX8E+oC6lY6fI20q3CuYBOFTwXUXtKMfKTRpVmct17RJrdksGW4ZKQaxJ3GW/IKyvL/rIW5dmHt57Cci/h5tOyn7xXkYWugSb5Azp5zX/nkoQLprjAaejZL5JZ+QJQo5HLFbN6qjnZ6coHNVp9GslU0sze2+EYKgavYnQNhElTDI0Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSq1S2fZkmpSgFd7rALmgekh8GJ01tsbJVPBPo5ypy8=;
 b=OvYFQZijpf9BK1nx3cIN/7rOxegN7QSNNyvNFj3FiC2GRoJo0KW1wrrnTz6189koRbOh9CN86vgoN8UMhL1x2axDzC8brNpwGy0v0W8n7NoYKPmTKcWWeEmN2ftGin6bANGul7N38mvADa7v99piVTXHlnEQeV/pGSfNZ76fmLTJvg4HoOcnRC8wITj3jBkHCzS+RGrozEy8QNI0jw8VtVO4PU+6ZLZus2e7eNC5Y11mrhbt4i9HhfPeIewAVYLqZJqYnRE5Fox8g7tHGcSJexJaEvseFWNIQ7m++CcU08Uk2H8oiiNJrciAMZm636pZyVabKE7mOEPOkfRe41c1Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sat, 14 Mar
 2026 01:06:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sat, 14 Mar 2026
 01:06:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 14 Mar 2026 10:06:12 +0900
Subject: [PATCH v9 02/10] rust: num: add `shr` and `shl` methods to
 `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-register-v9-2-86805b2f7e9d@nvidia.com>
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
In-Reply-To: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <ynorov@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: cbb06acf-6d44-4d5f-3a29-08de8165f029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SeUmSgmH2XFRsqo2/8kbf4f518Js54+2jzkTkxvqJsI9jIDStYGaW4Ai2UboGPRjpiM8ZyCOqDdGsfSQ5TCUStZEHGcaCrd1Ubph8hz7GbdsWAqPWOAndn6H/cCWKVRXSQC+bUikEwiv0m9GD5uVJVJJmGXlog15iOsOXQUdrFm/TAvMm3WRNfcrpS84U1qTeA9Pem2OWwQKcSO4buxQJTkCShGvU4/mX2acVaw8la8dElNcch3QW3o1T0exeIbuKkyqEybpPptcQtlcqS68/Lq3id16Dp4yD/BHt0wSyYlHgGYPpl4eUZtXoXfn2kKf6wa6nYe/qekJKoSHxuZ8EHHqCf97kyg8mX+OgTfbtayJdspoyjuGsMleMEEbRXT0fK9FZ3jjDt5x0kW1PJPtBrmO5MKJpun+kvE2AOPKR49F39Y7y/SlNAveTEcEQEaJNfZPbf4BCRJLuoKVBTFh3kL+3fjpopeOEdeGqanCdNxJBVq+bW+0kFCytXIf1IeMCF8fjtAAiMW+2Aucml3xyNUV9BY/Oq9FaMnxT/rmkWB6jAeL+GFQPpDxbw+XlGnn9ZBJz8/L/wuHffsmKpiw8cJhxVZABBs9kAkeH606x4dDhDYRChzx1RgwFJBRVeVXthGxIuodUdYHv5NgsYYRjZO+LstT0uclaGXl2wpUnuXDZ6vVptg8v88ymwua6GXbk3M8dISGm74KXSZ2PCguZ7nteIPv5lqzOiofZu2jTKH1y+MhxuUivdCZEBAWKuzYG5L3qH3u/2NCbRD/amauAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEYvMVEycm1CT09obTgxa3M2bUU4dUxNWVlkUHNsbjZWemlMa1k2RjgzL09D?=
 =?utf-8?B?SGpDQXR4dHpnSXU2bDhYUVg4UFc5cDBLa242UTRpYXJqcE9BWXZ3d2hEWllX?=
 =?utf-8?B?c0JnRzE4ckc5ZVlWUitoMjBiU1pXYzJOR3Y1dy91ejk3VjZnVkVMUHhGQTZ4?=
 =?utf-8?B?OE5OUEVtOEVTN0lXckNmc3RVUHJtcm1OV2E0SVZlWFczV0NNTG9tVzlBMGNJ?=
 =?utf-8?B?cFJKblZvYktDaWZvNjBkZ2YvMXQ1R2xxcXVMMjdwazhMamNScXB5bDRaV2lG?=
 =?utf-8?B?VTdpQ0xFc1Bwbzd0SWEzTTlySUNBcXUrRG5paXhGWDAxV3gxTHJ5OGhrZzNj?=
 =?utf-8?B?blBzOEIwT0EvMGgxaWYrbDRyaEhDeTA1QS9FdHFkdXUyUHdERU9SU3JzbFQ3?=
 =?utf-8?B?U2xjd1I2aW5oMGFKczRZUXJMSWJDeWtCWDZ2K211WFdVODlPZUdDUVBWQUFS?=
 =?utf-8?B?dWdJMTdsVWlnS25sVm9GNDdmYndwRE9FZWExQ245MTJXOUlwT2p5a3lSTjRk?=
 =?utf-8?B?bHdISnBDTU04RUErSFRNeGlidXFxV0FhcUFBYUNkaFRUbWdISzZsUEdvbW5B?=
 =?utf-8?B?cyt2bnRHTFA2OW1GYU1zb0lUMlMzWHlLZjFQMEhoMGFUNU5mb0pnZVJBUmxM?=
 =?utf-8?B?OVo4ZEs5UHRvelp6UThGZTFxQ2JEbWRLbDhvV3NaejVqeE8ycmRRQlhPVW9N?=
 =?utf-8?B?RWNMMXZxYm8xZ0N5UDdBUDNKVjBUQm9ZdXNiT1BhV1FPSWNtcG5RcFFtQVQx?=
 =?utf-8?B?ZjB6bDllZm16M3hhY2JNdFljT2Y3MStDUEExOThFL0Q3bU03R1k2QUtzWFNT?=
 =?utf-8?B?ZXhoS1kvZGdIdHZnTGpseEQ3ZkhrblFZMmF1Tk5XcUVFZ2lhbnVDckc4TGRP?=
 =?utf-8?B?QzkxMlZNMGpWS3cvck5CdEQrV1FxUy8yR1NtcTNTV0tuVXlHVFJpcnVqWnNy?=
 =?utf-8?B?MjFXelA4T2ZTS0VhdzRZRUJSekQ3MEVTcHRZZVZLYmZPR2J6dDNYdW5HY0dD?=
 =?utf-8?B?cmtmMUNRbTNtQjg0SURBTk9Cc2RkM3MwNHdNRVJqQjJIdjNmS3ZVSmdxeXVS?=
 =?utf-8?B?QzRsaUdRNE9pampvYXhWNXVONzFWUmpSMVZkZWN6NDl5TldiL2tZOCsxd0Jx?=
 =?utf-8?B?ZG5xZEZvRktsSDFxLytvM3BjelBWTE1ST2pvREw1KzVvRE0zeGViV01ET0gz?=
 =?utf-8?B?NmFZS2FVWkFpdU9aSWJ4WFJjcWZqWjJGRHdab3E2VUg0V3lIQi81L0J0WGR1?=
 =?utf-8?B?d1hPVEpKMFY4b2Nqc3lrQmhWMXVUdm9ZL1VhVDhzcUNrRFpZZll3VHd2Vmtk?=
 =?utf-8?B?SVlqaHJvdDlKR0pyQ1VBckZHbHUxMitEcU5wQXgvZ29mTVZ3aFFscFdLTEEx?=
 =?utf-8?B?UVFDUktOU2wrbFlCb1YvSzVtMnVtU1JkUDc5N3laeVUwYzRTWXpFUWt3dnZy?=
 =?utf-8?B?dVN1SHdubkVrWVQwckt1VUZUV1NkN1dxUFZtK3pKUFdtcndRc2F5N1NyaDNy?=
 =?utf-8?B?c2RqOHI5TnlQcHNDeHAyZVkzNytGcWdQblRLdmJLVFU5NXhKd1Y5VnBFTTNn?=
 =?utf-8?B?dHZFTGZTQW9pWDAzd1dGWkZvKzBPd3lYVGtzZmVFS1BkRFM3ZGJINVJseVY2?=
 =?utf-8?B?Mzg4NkF3dXIzSi9KNDA5YWpTOHFkNTh0M1EwdVRlWjhIOEhrNnl4WS83cUxw?=
 =?utf-8?B?Njh4cVA5enYvaWdKT3lINXZpRVhldncyUkR2aFp0T1RnSHprc3FNTUQxNFoz?=
 =?utf-8?B?ZWZHQ1A0ZHozWlpNeFFkQy8zcnFNSHFmRHRBZzVQYThYbkNRcE0vNFB2R2gv?=
 =?utf-8?B?RDRqZ0J6cWVONW5jb0tWV1pBQXhQTDl1R2cwUmlWbzB2NVlBNkhTTkdSc0hY?=
 =?utf-8?B?aXFOYy9ZcnY4UjZ5T1NocnZ5QmRrV2w0ekd3amRyQmFEV1NrWUZ6Wi9vMzZR?=
 =?utf-8?B?NjB4MlRNdHFhVndhUnVBZ0x4UWdqVXUrb0xnMDdpblFlT2t1QzFDWk9VN0lB?=
 =?utf-8?B?S2RudDR4WkZqUkdyYjV5aDJDakZBK0V2bTlmbHpDSEZiU0VKaU4rNGY0RGZM?=
 =?utf-8?B?Qk1LTWpFbWhaRFE2aGM0M0podXdFdDh2ZnduQVU3eXZUTy9ndGZqNHBRcHQ1?=
 =?utf-8?B?OHNFTFI0YitSK0x2T2F5bkRxRWVKWmcyZnBOL2FHbUhJMURIaGY2a2VaUVZz?=
 =?utf-8?B?WjYxUFdUNEdNUmNpNEtuL1NDQ2hiL2ZTcWxJRmU5TzFjaUdrSWlLdFNsM0Ja?=
 =?utf-8?B?QVZwZUxHUElmSkd4N3poYi9pNDRiUm1uUkFVd3ZaUHNQb0JCdDVPSndnVHVM?=
 =?utf-8?B?cVdmSVdad3B6Y0w4bk1WaVczVE1QelFvcFJJT1ZOdkYyWGhrWEpidjE5eE42?=
 =?utf-8?Q?TY6pCUYQnFHsU8FxhQzuXamykBLZxq7M4mCYGfXFfofMO?=
X-MS-Exchange-AntiSpam-MessageData-1: 3NJwnCc4TW8f8w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb06acf-6d44-4d5f-3a29-08de8165f029
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 01:06:35.6433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5rWJ1IL/6nH8Z8OGG/GX71sxCb9ZmfVQNvVD27Tj2/iFObemNKGgDKiWpojlccvl8fL2fxLiH7EjP/+tUxbBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033

Shifting a `Bounded` left or right changes the number of bits required
to represent the value. Add methods that perform the shift and return a
`Bounded` with the appropriately adjusted bit width.

These methods are particularly useful for bitfield extraction.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Acked-by: Yury Norov <ynorov@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index fa81acbdc8c2..2f5f13ecd3d6 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -473,6 +473,48 @@ pub fn cast<U>(self) -> Bounded<U, N>
         // `N` bits, and with the same signedness.
         unsafe { Bounded::__new(value) }
     }
+
+    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N - SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 16>::new::<0xff00>();
+    /// let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff);
+    /// ```
+    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES + SHIFT >= N) }
+
+        // SAFETY: We shift the value right by `SHIFT`, reducing the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES >= N - SHIFT`.
+        unsafe { Bounded::__new(self.0 >> SHIFT) }
+    }
+
+    /// Left-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
+    /// N + SHIFT`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 8>::new::<0xff>();
+    /// let v_shifted: Bounded::<u32, 16> = v.shl::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff00);
+    /// ```
+    pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES >= N + SHIFT) }
+
+        // SAFETY: We shift the value left by `SHIFT`, augmenting the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES >= N + SHIFT`.
+        unsafe { Bounded::__new(self.0 << SHIFT) }
+    }
 }
 
 impl<T, const N: u32> Deref for Bounded<T, N>

-- 
2.53.0

